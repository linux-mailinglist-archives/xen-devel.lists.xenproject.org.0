Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 338AF6A820F
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 13:20:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504908.777352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXhuu-0000DU-Fx; Thu, 02 Mar 2023 12:20:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504908.777352; Thu, 02 Mar 2023 12:20:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXhuu-0000BO-DI; Thu, 02 Mar 2023 12:20:12 +0000
Received: by outflank-mailman (input) for mailman id 504908;
 Thu, 02 Mar 2023 12:20:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=riJh=62=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1pXhuj-0007lN-3K
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 12:20:11 +0000
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c818755-b8f4-11ed-a550-8520e6686977;
 Thu, 02 Mar 2023 13:19:59 +0100 (CET)
Received: from zn.tnic (p5de8e9fe.dip0.t-ipconnect.de [93.232.233.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E292B1EC04F0;
 Thu,  2 Mar 2023 13:19:57 +0100 (CET)
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
X-Inumbo-ID: 8c818755-b8f4-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1677759598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=EXqRPO+1UJ/Jugo4uZb8s1y5eA/PT9L+UzCFhY6JB88=;
	b=BDkuvwlB34QQjIUo59EDVmj7oKCVncxfi5b5gZ5JgkhU3aIBDgDeTmJNn7jbJHW3znTvCf
	YFoHuKLNQrQyliq8pTOmjR9MRkIeF/W/wjuynsx9rHark059JR7Yp19Rw8Aocd30uUMCn6
	EDHphDviZmnnExDRi0VvwD18ImB95dQ=
Date: Thu, 2 Mar 2023 13:19:52 +0100
From: Borislav Petkov <bp@alien8.de>
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	linux-arch@vger.kernel.org, linux-api@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>,
	Balbir Singh <bsingharora@gmail.com>,
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
	rppt@kernel.org, jamorris@linux.microsoft.com,
	dethoma@microsoft.com, akpm@linux-foundation.org,
	Andrew.Cooper3@citrix.com, christina.schimpe@intel.com,
	david@redhat.com, debug@rivosinc.com, linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>,
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v7 13/41] mm: Make pte_mkwrite() take a VMA
Message-ID: <ZACUaN0NRNXMwkT2@zn.tnic>
References: <20230227222957.24501-1-rick.p.edgecombe@intel.com>
 <20230227222957.24501-14-rick.p.edgecombe@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230227222957.24501-14-rick.p.edgecombe@intel.com>

On Mon, Feb 27, 2023 at 02:29:29PM -0800, Rick Edgecombe wrote:
> [0] https://lore.kernel.org/lkml/0e29a2d0-08d8-bcd6-ff26-4bea0e4037b0@redhat.com/#t

I guess that sub-thread about how you arrived at this "pass a VMA"
decision should be in the Link tag. But that's for the committer, I'd
say.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

