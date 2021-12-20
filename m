Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C926C47B61F
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 00:18:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250050.430622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzRvG-0007cA-8Q; Mon, 20 Dec 2021 23:18:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250050.430622; Mon, 20 Dec 2021 23:18:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzRvG-0007aJ-5B; Mon, 20 Dec 2021 23:18:26 +0000
Received: by outflank-mailman (input) for mailman id 250050;
 Mon, 20 Dec 2021 23:18:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8lA0=RF=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1mzRvE-0007Xv-9h
 for xen-devel@lists.xenproject.org; Mon, 20 Dec 2021 23:18:24 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [185.233.100.1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d1b6645-61eb-11ec-8d39-b1a4ed000e3e;
 Tue, 21 Dec 2021 00:18:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 596134EE;
 Tue, 21 Dec 2021 00:18:17 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZYOuiuRNWbd9; Tue, 21 Dec 2021 00:18:16 +0100 (CET)
Received: from begin.home (2a01cb0088600700de41a9fffe47ec49.ipv6.abo.wanadoo.fr
 [IPv6:2a01:cb00:8860:700:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 9306E199;
 Tue, 21 Dec 2021 00:18:16 +0100 (CET)
Received: from samy by begin.home with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1mzRv6-00065u-5N;
 Tue, 21 Dec 2021 00:18:16 +0100
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
X-Inumbo-ID: 1d1b6645-61eb-11ec-8d39-b1a4ed000e3e
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Tue, 21 Dec 2021 00:18:16 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v2 03/10] mini-os: don't assume contiguous RAM when
 initializing in PVH mode
Message-ID: <20211220231816.pnimrlsfbs2lorik@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20211220160716.4159-1-jgross@suse.com>
 <20211220160716.4159-4-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211220160716.4159-4-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 596134EE
X-Spamd-Result: default: False [0.40 / 15.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 HAS_ORG_HEADER(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_LAST(0.00)[];
	 MID_RHS_NOT_FQDN(0.50)[]

Juergen Gross, le lun. 20 déc. 2021 17:07:09 +0100, a ecrit:
> Sizing the available memory should respect memory holes, so look at
> the memory map when setting the boundary for the memory allocator.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
> V2:
> - rename "max" to "start" (Samuel Thibault)
> ---
>  arch/x86/mm.c  |  6 +-----
>  e820.c         | 14 ++++++++------
>  include/e820.h |  2 +-
>  3 files changed, 10 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/x86/mm.c b/arch/x86/mm.c
> index 8df93da..3bf6170 100644
> --- a/arch/x86/mm.c
> +++ b/arch/x86/mm.c
> @@ -107,7 +107,6 @@ void arch_mm_preinit(void *p)
>  {
>      long ret;
>      domid_t domid = DOMID_SELF;
> -    unsigned long max;
>  
>      pt_base = page_table_base;
>      first_free_pfn = PFN_UP(to_phys(&_end));
> @@ -117,11 +116,8 @@ void arch_mm_preinit(void *p)
>          xprintk("could not get memory size\n");
>          do_exit();
>      }
> -    last_free_pfn = ret;
>  
> -    max = e820_get_maxpfn();
> -    if ( max < last_free_pfn )
> -        last_free_pfn = max;
> +    last_free_pfn = e820_get_maxpfn(ret);
>  }
>  #endif
>  
> diff --git a/e820.c b/e820.c
> index 1770158..6d15cdf 100644
> --- a/e820.c
> +++ b/e820.c
> @@ -285,10 +285,10 @@ void arch_print_memmap(void)
>  }
>  #endif
>  
> -unsigned long e820_get_maxpfn(void)
> +unsigned long e820_get_maxpfn(unsigned long pages)
>  {
>      int i;
> -    unsigned long pfn, max = 0;
> +    unsigned long pfns, start = 0;
>  
>      e820_get_memmap();
>  
> @@ -296,10 +296,12 @@ unsigned long e820_get_maxpfn(void)
>      {
>          if ( e820_map[i].type != E820_RAM )
>              continue;
> -        pfn = (e820_map[i].addr + e820_map[i].size) >> PAGE_SHIFT;
> -        if ( pfn > max )
> -            max = pfn;
> +        pfns = e820_map[i].size >> PAGE_SHIFT;
> +        start = e820_map[i].addr >> PAGE_SHIFT;
> +        if ( pages <= pfns )
> +            return start + pages;
> +        pages -= pfns;
>      }
>  
> -    return max;
> +    return start + pfns;
>  }
> diff --git a/include/e820.h b/include/e820.h
> index af2129f..6a57f05 100644
> --- a/include/e820.h
> +++ b/include/e820.h
> @@ -49,6 +49,6 @@ struct __packed e820entry {
>  extern struct e820entry e820_map[];
>  extern unsigned e820_entries;
>  
> -unsigned long e820_get_maxpfn(void);
> +unsigned long e820_get_maxpfn(unsigned long pages);
>  
>  #endif /*__E820_HEADER*/
> -- 
> 2.26.2
> 

-- 
Samuel
Now I know someone out there is going to claim, "Well then, UNIX is intuitive,
because you only need to learn 5000 commands, and then everything else follows
from that! Har har har!"
(Andy Bates in comp.os.linux.misc, on "intuitive interfaces", slightly
defending Macs.)

