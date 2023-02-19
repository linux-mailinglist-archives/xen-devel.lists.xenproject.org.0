Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B85C869C26C
	for <lists+xen-devel@lfdr.de>; Sun, 19 Feb 2023 21:41:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.497878.768666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pTqUP-0001ao-Cs; Sun, 19 Feb 2023 20:40:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 497878.768666; Sun, 19 Feb 2023 20:40:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pTqUP-0001Xh-9s; Sun, 19 Feb 2023 20:40:53 +0000
Received: by outflank-mailman (input) for mailman id 497878;
 Sun, 19 Feb 2023 20:40:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nX2M=6P=chromium.org=keescook@srs-se1.protection.inumbo.net>)
 id 1pTqUO-0001Rh-8L
 for xen-devel@lists.xenproject.org; Sun, 19 Feb 2023 20:40:52 +0000
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [2607:f8b0:4864:20::102a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1c0b390-b095-11ed-93b5-47a8fe42b414;
 Sun, 19 Feb 2023 21:40:50 +0100 (CET)
Received: by mail-pj1-x102a.google.com with SMTP id x23so1239195pje.2
 for <xen-devel@lists.xenproject.org>; Sun, 19 Feb 2023 12:40:50 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 17-20020a170902c21100b00199190b00efsm6372235pll.97.2023.02.19.12.40.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Feb 2023 12:40:48 -0800 (PST)
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
X-Inumbo-ID: b1c0b390-b095-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lqAwlutC29lMR1tf1e4XOcfdxhypv9zb0T2DcQuJ+3c=;
        b=XSbexFaS+Tm+Fh9bIb5+7TsH8cXc/OyRJvw9NZqY53ctg5O6XlonIQ+mSxQEFs9syE
         lUVQj3khdSe3Fc3LpOxcyIdBOEkgeUJK3z40Fm415uv701QNzTtbevYXP5ioH+guMWrP
         r7f7SjRms7JvKdWdxLsJL7avrtKIOQCRDQ1xE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lqAwlutC29lMR1tf1e4XOcfdxhypv9zb0T2DcQuJ+3c=;
        b=MX5K0PgC7y0TGYHfc/+X19AjIv2VoJ2Z3ePEHXgSeY5tKXyqd9sSS759qEjUm5L4/N
         mE21phOSZ6/vUXk3mhq65EEFP1Q2CYrmje+5nfVx0ru2qu1xurZsYCDU7J6yGObdhEBZ
         Hu4FjLR/9XNTrrvMTBbhNz4ufhR6TvNKIwLAmzJJGYWtuWzYju5P4UPeUr/e4akUsUcW
         OO+w+D5+7zddGJ9aGjOyW5078P+hBwscYdqHwXdR+UHDYc6hiOTjATmU9KZzBvKqZ84U
         aNuOo129lj1b/7cP9eKyGIQbOeDauUVpilut9gqzsC/voeK792RS9pBxr/VTskFnLnw9
         KjeA==
X-Gm-Message-State: AO0yUKU49mDxPJEztcc9fPSefSzrXJodYbTv4YfnQH/LkT0sEB65a46M
	ic/Lh6t/vdsJM4OPc9UzhvJPGQ==
X-Google-Smtp-Source: AK7set8cjnk+CNzhzKm/hjA5DP1TH7rqpGSr8BvS/qmpfvVklVJ20vp+KwvbQWrpg9WzBslEVX8M9Q==
X-Received: by 2002:a17:902:d4c8:b0:199:30a6:376c with SMTP id o8-20020a170902d4c800b0019930a6376cmr2895713plg.68.1676839248964;
        Sun, 19 Feb 2023 12:40:48 -0800 (PST)
Message-ID: <63f28950.170a0220.3759b.b525@mx.google.com>
X-Google-Original-Message-ID: <202302191240.@keescook>
Date: Sun, 19 Feb 2023 12:40:47 -0800
From: Kees Cook <keescook@chromium.org>
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
	Jonathan Corbet <corbet@lwn.net>,
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
	linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 13/41] mm: Make pte_mkwrite() take a VMA
References: <20230218211433.26859-1-rick.p.edgecombe@intel.com>
 <20230218211433.26859-14-rick.p.edgecombe@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230218211433.26859-14-rick.p.edgecombe@intel.com>

On Sat, Feb 18, 2023 at 01:14:05PM -0800, Rick Edgecombe wrote:
> The x86 Control-flow Enforcement Technology (CET) feature includes a new
> type of memory called shadow stack. This shadow stack memory has some
> unusual properties, which requires some core mm changes to function
> properly.
> 
> One of these unusual properties is that shadow stack memory is writable,
> but only in limited ways. These limits are applied via a specific PTE
> bit combination. Nevertheless, the memory is writable, and core mm code
> will need to apply the writable permissions in the typical paths that
> call pte_mkwrite().
> 
> In addition to VM_WRITE, the shadow stack VMA's will have a flag denoting
> that they are special shadow stack flavor of writable memory. So make
> pte_mkwrite() take a VMA, so that the x86 implementation of it can know to
> create regular writable memory or shadow stack memory.
> 
> Apply the same changes for pmd_mkwrite() and huge_pte_mkwrite().
> 
> No functional change.
> 
> Cc: linux-doc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-alpha@vger.kernel.org
> Cc: linux-snps-arc@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-csky@vger.kernel.org
> Cc: linux-hexagon@vger.kernel.org
> Cc: linux-ia64@vger.kernel.org
> Cc: loongarch@lists.linux.dev
> Cc: linux-m68k@lists.linux-m68k.org
> Cc: Michal Simek <monstr@monstr.eu>
> Cc: Dinh Nguyen <dinguyen@kernel.org>
> Cc: linux-mips@vger.kernel.org
> Cc: openrisc@lists.librecores.org
> Cc: linux-parisc@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-s390@vger.kernel.org
> Cc: linux-sh@vger.kernel.org
> Cc: sparclinux@vger.kernel.org
> Cc: linux-um@lists.infradead.org
> Cc: xen-devel@lists.xenproject.org
> Cc: linux-arch@vger.kernel.org
> Cc: linux-mm@kvack.org
> Tested-by: Pengfei Xu <pengfei.xu@intel.com>
> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>

I'm not an arch maintainer, but it looks like a correct tree-wide
refactor.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

