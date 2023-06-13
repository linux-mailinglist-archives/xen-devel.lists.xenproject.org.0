Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9327572DB65
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 09:45:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547875.855519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8yiI-00073e-Di; Tue, 13 Jun 2023 07:45:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547875.855519; Tue, 13 Jun 2023 07:45:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8yiI-00071B-Ab; Tue, 13 Jun 2023 07:45:14 +0000
Received: by outflank-mailman (input) for mailman id 547875;
 Tue, 13 Jun 2023 07:45:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8VtB=CB=kernel.org=rppt@srs-se1.protection.inumbo.net>)
 id 1q8yiG-00070v-9S
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 07:45:12 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37c8b8bd-09be-11ee-8611-37d641c3527e;
 Tue, 13 Jun 2023 09:45:09 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5850B61A47;
 Tue, 13 Jun 2023 07:45:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 089C9C433D2;
 Tue, 13 Jun 2023 07:44:56 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 37c8b8bd-09be-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686642307;
	bh=f4w4+2Npq1dkMitUJV0S3ITs/vGEti03A0AefRWYLBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DAQB2NbikRdiWHwMApaPAIzaTY/w5HN4Xf7lKIGhQ1CWk0NWLGkjAYZnVQ2Z/26E5
	 Gj6fP0pEbtlpdHh+jAjgE6Pt3fChamJqEF8aVQsamsvQWLvQ+me4hgKoCdbO2U9n0H
	 sLhdxmmB9s+aWXDyuT2lGzl1ZVFe+wKqtDoS4hK67cKlfHnfx6dLaBFlaN8NreyThe
	 AbwFvqwokH5jRmekfEWGpgdCqyPUEmoq/Gm4fiWKIVNatWddBhbTkdXtpDdl7j7Ve/
	 HOLkc/hxxqb1vXEgvy7sHCTE8mCUAdXBvfqxYV+N5P2bD908YKbA9glKAU7xQzQvwR
	 geNzoGQaAeXIA==
Date: Tue, 13 Jun 2023 10:44:28 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	linux-arch@vger.kernel.org, linux-api@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>,
	Balbir Singh <bsingharora@gmail.com>,
	Borislav Petkov <bp@alien8.de>,
	Cyrill Gorcunov <gorcunov@gmail.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Eugene Syromiatnikov <esyr@redhat.com>,
	Florian Weimer <fweimer@redhat.com>,
	"H . J . Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
	Jonathan Corbet <corbet@lwn.net>, Kees Cook <keescook@chromium.org>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Nadav Amit <nadav.amit@gmail.com>, Oleg Nesterov <oleg@redhat.com>,
	Pavel Machek <pavel@ucw.cz>, Peter Zijlstra <peterz@infradead.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Weijiang Yang <weijiang.yang@intel.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	John Allen <john.allen@amd.com>, kcc@google.com, eranian@google.com,
	jamorris@linux.microsoft.com, dethoma@microsoft.com,
	akpm@linux-foundation.org, Andrew.Cooper3@citrix.com,
	christina.schimpe@intel.com, david@redhat.com, debug@rivosinc.com,
	szabolcs.nagy@arm.com, torvalds@linux-foundation.org,
	broonie@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-s390@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 02/42] mm: Move pte/pmd_mkwrite() callers with no VMA
 to _novma()
Message-ID: <20230613074428.GS52412@kernel.org>
References: <20230613001108.3040476-1-rick.p.edgecombe@intel.com>
 <20230613001108.3040476-3-rick.p.edgecombe@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230613001108.3040476-3-rick.p.edgecombe@intel.com>

On Mon, Jun 12, 2023 at 05:10:28PM -0700, Rick Edgecombe wrote:
> The x86 Shadow stack feature includes a new type of memory called shadow
> stack. This shadow stack memory has some unusual properties, which requires
> some core mm changes to function properly.
> 
> One of these unusual properties is that shadow stack memory is writable,
> but only in limited ways. These limits are applied via a specific PTE
> bit combination. Nevertheless, the memory is writable, and core mm code
> will need to apply the writable permissions in the typical paths that
> call pte_mkwrite(). Future patches will make pte_mkwrite() take a VMA, so
> that the x86 implementation of it can know whether to create regular
> writable memory or shadow stack memory.

Nit:                            ^ mappings?
 
> But there are a couple of challenges to this. Modifying the signatures of
> each arch pte_mkwrite() implementation would be error prone because some
> are generated with macros and would need to be re-implemented. Also, some
> pte_mkwrite() callers operate on kernel memory without a VMA.
> 
> So this can be done in a three step process. First pte_mkwrite() can be
> renamed to pte_mkwrite_novma() in each arch, with a generic pte_mkwrite()
> added that just calls pte_mkwrite_novma(). Next callers without a VMA can
> be moved to pte_mkwrite_novma(). And lastly, pte_mkwrite() and all callers
> can be changed to take/pass a VMA.
> 
> Previous patches have done the first step, so next move the callers that
> don't have a VMA to pte_mkwrite_novma(). Also do the same for

I hear x86 maintainers asking to drop "previous patches" ;-)

Maybe
This is the second step of the conversion that moves the callers ...

> pmd_mkwrite(). This will be ok for the shadow stack feature, as these
> callers are on kernel memory which will not need to be made shadow stack,
> and the other architectures only currently support one type of memory
> in pte_mkwrite()
> 
> Cc: linux-doc@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-s390@vger.kernel.org
> Cc: xen-devel@lists.xenproject.org
> Cc: linux-arch@vger.kernel.org
> Cc: linux-mm@kvack.org
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>

Reviewed-by: Mike Rapoport (IBM) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.

