Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC3F245217
	for <lists+xen-devel@lfdr.de>; Sat, 15 Aug 2020 23:41:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k73uM-0001GB-E8; Sat, 15 Aug 2020 21:40:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VULP=BZ=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1k73uK-0001G6-D4
 for xen-devel@lists.xenproject.org; Sat, 15 Aug 2020 21:40:08 +0000
X-Inumbo-ID: a60975e0-0d4f-4aa1-af7b-a198fd4450b2
Received: from hera.aquilenet.fr (unknown [185.233.100.1])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a60975e0-0d4f-4aa1-af7b-a198fd4450b2;
 Sat, 15 Aug 2020 21:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 6278B116FA;
 Sat, 15 Aug 2020 23:40:04 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X_2rCA7E-Re5; Sat, 15 Aug 2020 23:40:03 +0200 (CEST)
Received: from function.home
 (2a01cb008800c5009eb6d0fffe88c3c7.ipv6.abo.wanadoo.fr
 [IPv6:2a01:cb00:8800:c500:9eb6:d0ff:fe88:c3c7])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 5EB592E70;
 Sat, 15 Aug 2020 23:40:03 +0200 (CEST)
Received: from samy by function.home with local (Exim 4.94)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1k73uE-001iIz-9u; Sat, 15 Aug 2020 23:40:02 +0200
Date: Sat, 15 Aug 2020 23:40:02 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
 wl@xen.org
Subject: Re: [PATCH] mini-os: correct memory access rights for pvh mode
Message-ID: <20200815214002.vow2zqlqhtxw6jmb@function>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org, wl@xen.org
References: <20200815111557.29564-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200815111557.29564-1-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Juergen Gross, le sam. 15 août 2020 13:15:57 +0200, a ecrit:
> When running as a PVH guest the memory access rights are not set
> correctly: _PAGE_USER should not be set and CR0.WP should be set.
> Especially CR0.WP is important in order to let the allocate on
> demand feature work, as it requires a page fault when writing to a
> read-only page.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  arch/x86/x86_hvm.S    |  2 +-
>  include/x86/arch_mm.h | 18 ++++++++++++------
>  include/x86/os.h      |  1 +
>  3 files changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/x86/x86_hvm.S b/arch/x86/x86_hvm.S
> index 6e8ad98..42a5f02 100644
> --- a/arch/x86/x86_hvm.S
> +++ b/arch/x86/x86_hvm.S
> @@ -20,7 +20,7 @@ _start:
>  #endif /* __x86_64__ */
>  
>          mov %cr0, %eax
> -        or $X86_CR0_PG, %eax
> +        or $(X86_CR0_PG | X86_CR0_WP), %eax
>          mov %eax, %cr0
>  
>          lgdt gdt_ptr
> diff --git a/include/x86/arch_mm.h b/include/x86/arch_mm.h
> index cbbeb21..ffbec5a 100644
> --- a/include/x86/arch_mm.h
> +++ b/include/x86/arch_mm.h
> @@ -171,17 +171,23 @@ typedef unsigned long pgentry_t;
>  #define _PAGE_PSE      CONST(0x080)
>  #define _PAGE_GLOBAL   CONST(0x100)
>  
> +#ifdef CONFIG_PARAVIRT
> +#define PAGE_USER _PAGE_USER
> +#else
> +#define PAGE_USER CONST(0)
> +#endif
> +
>  #if defined(__i386__)
>  #define L1_PROT (_PAGE_PRESENT|_PAGE_RW|_PAGE_ACCESSED)
>  #define L1_PROT_RO (_PAGE_PRESENT|_PAGE_ACCESSED)
> -#define L2_PROT (_PAGE_PRESENT|_PAGE_RW|_PAGE_ACCESSED|_PAGE_DIRTY |_PAGE_USER)
> +#define L2_PROT (_PAGE_PRESENT|_PAGE_RW|_PAGE_ACCESSED|_PAGE_DIRTY |PAGE_USER)
>  #define L3_PROT (_PAGE_PRESENT)
>  #elif defined(__x86_64__)
> -#define L1_PROT (_PAGE_PRESENT|_PAGE_RW|_PAGE_ACCESSED|_PAGE_USER)
> -#define L1_PROT_RO (_PAGE_PRESENT|_PAGE_ACCESSED|_PAGE_USER)
> -#define L2_PROT (_PAGE_PRESENT|_PAGE_RW|_PAGE_ACCESSED|_PAGE_DIRTY|_PAGE_USER)
> -#define L3_PROT (_PAGE_PRESENT|_PAGE_RW|_PAGE_ACCESSED|_PAGE_DIRTY|_PAGE_USER)
> -#define L4_PROT (_PAGE_PRESENT|_PAGE_RW|_PAGE_ACCESSED|_PAGE_DIRTY|_PAGE_USER)
> +#define L1_PROT (_PAGE_PRESENT|_PAGE_RW|_PAGE_ACCESSED|PAGE_USER)
> +#define L1_PROT_RO (_PAGE_PRESENT|_PAGE_ACCESSED|PAGE_USER)
> +#define L2_PROT (_PAGE_PRESENT|_PAGE_RW|_PAGE_ACCESSED|_PAGE_DIRTY|PAGE_USER)
> +#define L3_PROT (_PAGE_PRESENT|_PAGE_RW|_PAGE_ACCESSED|_PAGE_DIRTY|PAGE_USER)
> +#define L4_PROT (_PAGE_PRESENT|_PAGE_RW|_PAGE_ACCESSED|_PAGE_DIRTY|PAGE_USER)
>  #endif /* __i386__ || __x86_64__ */
>  
>  /* flags for ioremap */
> diff --git a/include/x86/os.h b/include/x86/os.h
> index a73b63e..46a824d 100644
> --- a/include/x86/os.h
> +++ b/include/x86/os.h
> @@ -27,6 +27,7 @@
>  #define MSR_EFER          0xc0000080
>  #define _EFER_LME         8             /* Long mode enable */
>  
> +#define X86_CR0_WP        0x00010000    /* Write protect */
>  #define X86_CR0_PG        0x80000000    /* Paging */
>  #define X86_CR4_PAE       0x00000020    /* enable physical address extensions */
>  #define X86_CR4_OSFXSR    0x00000200    /* enable fast FPU save and restore */
> -- 
> 2.26.2
> 

-- 
Samuel
<y> la vraie vie, c'est quand le prompt passe de $ à #

