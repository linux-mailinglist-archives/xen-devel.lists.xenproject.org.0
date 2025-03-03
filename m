Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EC9A4C232
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 14:40:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900264.1308187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp61J-00016g-B5; Mon, 03 Mar 2025 13:39:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900264.1308187; Mon, 03 Mar 2025 13:39:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp61J-00014r-7i; Mon, 03 Mar 2025 13:39:45 +0000
Received: by outflank-mailman (input) for mailman id 900264;
 Mon, 03 Mar 2025 13:39:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WnrA=VW=gaisler.com=andreas@srs-se1.protection.inumbo.net>)
 id 1tp61H-0000mF-Gl
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 13:39:43 +0000
Received: from smtp-out3.simply.com (smtp-out3.simply.com [94.231.106.210])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f679572a-f834-11ef-9ab2-95dc52dad729;
 Mon, 03 Mar 2025 14:39:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by smtp.simply.com (Simply.com) with ESMTP id 4Z60Kp3w73z1FbbW;
 Mon,  3 Mar 2025 14:39:42 +0100 (CET)
Received: from [10.10.15.10] (h-98-128-223-123.NA.cust.bahnhof.se
 [98.128.223.123])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by smtp.simply.com (Simply.com) with ESMTPSA id 4Z60Kn4PqSz1Fb3J;
 Mon,  3 Mar 2025 14:39:41 +0100 (CET)
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
X-Inumbo-ID: f679572a-f834-11ef-9ab2-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gaisler.com;
	s=unoeuro; t=1741009182;
	bh=U9UNcI/nx3v8USmf6+dAWPsF1rNLmjoWXEBhsh+2uHs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=p0KolgJx4p9btvk6fYlk/66A1PpkCAcDXoLwwd13tXWlLgCyaTRqeAZoowkRKGUcz
	 a93BO8cm7m7V9NR5W2AabYKC+pmXp6QfOyzdLHkjLMMme9YAVr/Jk545VauJVRJBRF
	 f0+BgLYnD++BR/MTcLl9Jh8F872XyJXNOzOZA4ck=
Message-ID: <f99125f1-e4e4-4ee8-909d-8e8d0618d54b@gaisler.com>
Date: Mon, 3 Mar 2025 14:39:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] sparc/mm: Avoid calling
 arch_enter/leave_lazy_mmu() in set_ptes
To: Ryan Roberts <ryan.roberts@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-mm@kvack.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20250302145555.3236789-1-ryan.roberts@arm.com>
 <20250302145555.3236789-4-ryan.roberts@arm.com>
Content-Language: en-US
From: Andreas Larsson <andreas@gaisler.com>
In-Reply-To: <20250302145555.3236789-4-ryan.roberts@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2025-03-02 15:55, Ryan Roberts wrote:
> With commit 1a10a44dfc1d ("sparc64: implement the new page table range
> API") set_ptes was added to the sparc architecture. The implementation
> included calling arch_enter/leave_lazy_mmu() calls.
> 
> The patch removes the usage of arch_enter/leave_lazy_mmu() since this
> implies nesting of lazy mmu regions which is not supported. Without this
> fix, lazy mmu mode is effectively disabled because we exit the mode
> after the first set_ptes:
> 
> remap_pte_range()
>   -> arch_enter_lazy_mmu()
>   -> set_ptes()
>       -> arch_enter_lazy_mmu()
>       -> arch_leave_lazy_mmu()
>   -> arch_leave_lazy_mmu()
> 
> Powerpc suffered the same problem and fixed it in a corresponding way
> with commit 47b8def9358c ("powerpc/mm: Avoid calling
> arch_enter/leave_lazy_mmu() in set_ptes").
> 
> Fixes: 1a10a44dfc1d ("sparc64: implement the new page table range API")
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  arch/sparc/include/asm/pgtable_64.h | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm/pgtable_64.h
> index 2b7f358762c1..dc28f2c4eee3 100644
> --- a/arch/sparc/include/asm/pgtable_64.h
> +++ b/arch/sparc/include/asm/pgtable_64.h
> @@ -936,7 +936,6 @@ static inline void __set_pte_at(struct mm_struct *mm, unsigned long addr,
>  static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
>  		pte_t *ptep, pte_t pte, unsigned int nr)
>  {
> -	arch_enter_lazy_mmu_mode();
>  	for (;;) {
>  		__set_pte_at(mm, addr, ptep, pte, 0);
>  		if (--nr == 0)
> @@ -945,7 +944,6 @@ static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
>  		pte_val(pte) += PAGE_SIZE;
>  		addr += PAGE_SIZE;
>  	}
> -	arch_leave_lazy_mmu_mode();
>  }
>  #define set_ptes set_ptes

Acked-by: Andreas Larsson <andreas@gaisler.com>

Thanks,
Andreas

