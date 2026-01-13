Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FD8D16EA9
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 07:56:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201122.1516817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfYJa-0002gX-IF; Tue, 13 Jan 2026 06:55:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201122.1516817; Tue, 13 Jan 2026 06:55:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfYJa-0002dz-FP; Tue, 13 Jan 2026 06:55:42 +0000
Received: by outflank-mailman (input) for mailman id 1201122;
 Tue, 13 Jan 2026 06:55:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9S4V=7S=kernel.org=wei.liu@srs-se1.protection.inumbo.net>)
 id 1vfYJY-0002dt-UH
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 06:55:41 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd3d163c-f04c-11f0-9ccf-f158ae23cfc8;
 Tue, 13 Jan 2026 07:55:37 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E7C6360017;
 Tue, 13 Jan 2026 06:55:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 536E5C116C6;
 Tue, 13 Jan 2026 06:55:35 +0000 (UTC)
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
X-Inumbo-ID: dd3d163c-f04c-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768287335;
	bh=n2q+fJWEyo0mV6AKyU2NgixjB8rQdCeFy7wPDNt7Ixw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mwX9VvXcjdrskeQKOvbcv2HC+NL/RDz4FppQ9fnPtBQA1h/lZM5QudZv4iKoKJl1C
	 VQCaQU+hiUKx7q8EgGpIzV1Hn20fsOFwG6zqcIn/vl3U4GG2DoZuoBCdSCc9MIrVi6
	 2MHpiBSZFVQlABThX/kX+VNSm9NEDG583BF3gZqeCl8YnVq3DfJ/UB2vR++2E2jQ+/
	 fLslrBi9sfsC0XXL368jTALZsIRyCVk19M0zkW8jJecDCMGw6Svd8eEi3+2ow4H/MN
	 ppPLXp3SH5miS5Kp+TM4ntM0fIhbOm6ktZD6rGbuzWn5lDVqcsC7+tqrUBLCvxlmzQ
	 QPuSOGbMm9j6Q==
Date: Tue, 13 Jan 2026 06:55:34 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	linux-hyperv@vger.kernel.org, Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Waiman Long <longman@redhat.com>, Jiri Kosina <jikos@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 01/21] x86/paravirt: Remove not needed includes of
 paravirt.h
Message-ID: <20260113065534.GB3099059@liuwe-devbox-debian-v2.local>
References: <20260105110520.21356-1-jgross@suse.com>
 <20260105110520.21356-2-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105110520.21356-2-jgross@suse.com>

On Mon, Jan 05, 2026 at 12:05:00PM +0100, Juergen Gross wrote:
> In some places asm/paravirt.h is included without really being needed.
> 
> Remove the related #include statements.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
> V3:
> - reinstate the include in mmu_context.h (kernel test robot)
> V4:
> - reinstate the include in arch/x86/kernel/x86_init.c (Boris Petkov)
> ---
>  arch/x86/entry/entry_64.S             | 1 -
>  arch/x86/entry/vsyscall/vsyscall_64.c | 1 -
>  arch/x86/hyperv/hv_spinlock.c         | 1 -

Acked-by: Wei Liu (Microsoft) <wei.liu@kernel.org>

