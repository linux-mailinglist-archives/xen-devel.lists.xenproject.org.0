Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3991F47B62C
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 00:30:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250061.430652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzS6c-0002RF-ND; Mon, 20 Dec 2021 23:30:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250061.430652; Mon, 20 Dec 2021 23:30:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzS6c-0002Om-Jt; Mon, 20 Dec 2021 23:30:10 +0000
Received: by outflank-mailman (input) for mailman id 250061;
 Mon, 20 Dec 2021 23:30:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8lA0=RF=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1mzS6a-0002IS-MS
 for xen-devel@lists.xenproject.org; Mon, 20 Dec 2021 23:30:08 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [185.233.100.1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3b4ef65-61ec-11ec-9e60-abaf8a552007;
 Tue, 21 Dec 2021 00:30:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 1715E25E;
 Tue, 21 Dec 2021 00:30:06 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oa-M3gAE_cT6; Tue, 21 Dec 2021 00:30:05 +0100 (CET)
Received: from begin.home (2a01cb0088600700de41a9fffe47ec49.ipv6.abo.wanadoo.fr
 [IPv6:2a01:cb00:8860:700:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 006CB199;
 Tue, 21 Dec 2021 00:30:04 +0100 (CET)
Received: from samy by begin.home with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1mzS6W-0006Bz-Cp;
 Tue, 21 Dec 2021 00:30:04 +0100
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
X-Inumbo-ID: c3b4ef65-61ec-11ec-9e60-abaf8a552007
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Tue, 21 Dec 2021 00:30:04 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v2 06/10] mini-os: add memory map service functions
Message-ID: <20211220233004.kyvlnh5nlk2nfs5q@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20211220160716.4159-1-jgross@suse.com>
 <20211220160716.4159-7-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211220160716.4159-7-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 1715E25E
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

Juergen Gross, le lun. 20 déc. 2021 17:07:12 +0100, a ecrit:
> Add two functions for adding reserved areas to the memory map and
> for removing them again.
> 
> Those will be needed for proper grant table/mapping support in PVH
> mode.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
> V2:
> - fix e820_put_reserved_pfns() (Samuel Thibault)
> ---
>  e820.c         | 50 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  include/e820.h |  4 ++++
>  2 files changed, 54 insertions(+)
> 
> diff --git a/e820.c b/e820.c
> index 659f71c..25e2f9d 100644
> --- a/e820.c
> +++ b/e820.c
> @@ -283,6 +283,56 @@ void arch_print_memmap(void)
>          printk("%012lx-%012lx: %s\n", from, to, type);
>      }
>  }
> +
> +unsigned long e820_get_reserved_pfns(int pages)
> +{
> +    int i;
> +    unsigned long last = 0, needed = (long)pages << PAGE_SHIFT;
> +
> +    for ( i = 0; i < e820_entries && e820_map[i].addr < last + needed; i++ )
> +        last = e820_map[i].addr + e820_map[i].size;
> +
> +    if ( i == 0 || e820_map[i - 1].type != E820_RESERVED )
> +        e820_insert_entry_at(i, last, needed, E820_RESERVED);
> +    else
> +        e820_map[i - 1].size += needed;
> +
> +    return last >> PAGE_SHIFT;
> +}
> +
> +void e820_put_reserved_pfns(unsigned long start_pfn, int pages)
> +{
> +    int i;
> +    unsigned long addr = start_pfn << PAGE_SHIFT;
> +    unsigned long size = (long)pages << PAGE_SHIFT;
> +
> +    for ( i = 0;
> +          i < e820_entries && addr >= e820_map[i].addr + e820_map[i].size;
> +          i++ );
> +
> +    BUG_ON(i == e820_entries || e820_map[i].type != E820_RESERVED ||
> +           addr + size > e820_map[i].addr + e820_map[i].size);
> +
> +    if ( addr == e820_map[i].addr )
> +    {
> +        e820_map[i].addr += size;
> +        e820_map[i].size -= size;
> +        if ( e820_map[i].size == 0 )
> +            e820_remove_entry(i);
> +        return;
> +    }
> +
> +    if ( addr + size == e820_map[i].addr + e820_map[i].size )
> +    {
> +        e820_map[i].size -= size;
> +        return;
> +    }
> +
> +    e820_insert_entry_at(i + 1, addr + size,
> +                         e820_map[i].addr + e820_map[i].size - addr - size,
> +                         E820_RESERVED);
> +    e820_map[i].size = addr - e820_map[i].addr;
> +}
>  #endif
>  
>  unsigned long e820_get_maxpfn(unsigned long pages)
> diff --git a/include/e820.h b/include/e820.h
> index 8d4d371..aaf2f2c 100644
> --- a/include/e820.h
> +++ b/include/e820.h
> @@ -51,5 +51,9 @@ extern unsigned e820_entries;
>  
>  unsigned long e820_get_maxpfn(unsigned long pages);
>  unsigned long e820_get_max_contig_pages(unsigned long pfn, unsigned long pages);
> +#ifndef CONFIG_E820_TRIVIAL
> +unsigned long e820_get_reserved_pfns(int pages);
> +void e820_put_reserved_pfns(unsigned long start_pfn, int pages);
> +#endif
>  
>  #endif /*__E820_HEADER*/
> -- 
> 2.26.2
> 

-- 
Samuel
<A> sauf que le firewall bloque tout sauf internet
 -+- ben ouais, il bloque ipx/spx ! -+-

