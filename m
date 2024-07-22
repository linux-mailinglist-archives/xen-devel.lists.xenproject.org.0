Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 152D2939579
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 23:27:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762350.1172513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sW0Yd-0007HX-FE; Mon, 22 Jul 2024 21:26:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762350.1172513; Mon, 22 Jul 2024 21:26:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sW0Yd-0007F6-Bh; Mon, 22 Jul 2024 21:26:59 +0000
Received: by outflank-mailman (input) for mailman id 762350;
 Mon, 22 Jul 2024 21:26:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TuwE=OW=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1sW0Yc-0007Ee-Iv
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 21:26:58 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1eb51e13-4871-11ef-bbfe-fd08da9f4363;
 Mon, 22 Jul 2024 23:26:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 4EE18A02D3;
 Mon, 22 Jul 2024 23:26:55 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JAjeluPNITRN; Mon, 22 Jul 2024 23:26:55 +0200 (CEST)
Received: from begin (aamiens-653-1-111-57.w83-192.abo.wanadoo.fr
 [83.192.234.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 13D23A02CA;
 Mon, 22 Jul 2024 23:26:55 +0200 (CEST)
Received: from samy by begin with local (Exim 4.98-RC3)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1sW0YY-0000000APvC-2k7f; Mon, 22 Jul 2024 23:26:54 +0200
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
X-Inumbo-ID: 1eb51e13-4871-11ef-bbfe-fd08da9f4363
Date: Mon, 22 Jul 2024 23:26:54 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH] mini-os: mm: don't have two large arrays of the same kind
Message-ID: <20240722212654.exihzgrvnqxu36kt@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20240722150843.3947-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240722150843.3947-1-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le lun. 22 juil. 2024 17:08:43 +0200, a ecrit:
> In the CONFIG_PARAVIRT case there are two identical static arrays of
> more than 8kB size with function scope. As the two functions never
> nest, a single array of file scope can replace the two existing
> instances.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  arch/x86/mm.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/mm.c b/arch/x86/mm.c
> index be1cf0cf..7ddf16e4 100644
> --- a/arch/x86/mm.c
> +++ b/arch/x86/mm.c
> @@ -198,6 +198,10 @@ static void new_pt_frame(unsigned long *pt_pfn, unsigned long prev_l_mfn,
>      *pt_pfn += 1;
>  }
>  
> +#ifdef CONFIG_PARAVIRT
> +static mmu_update_t mmu_updates[L1_PAGETABLE_ENTRIES + 1];
> +#endif
> +
>  /*
>   * Build the initial pagetable.
>   */
> @@ -209,7 +213,6 @@ static void build_pagetable(unsigned long *start_pfn, unsigned long *max_pfn)
>      unsigned long pt_mfn = pfn_to_mfn(virt_to_pfn(pt_base));
>      unsigned long offset;
>  #ifdef CONFIG_PARAVIRT
> -    static mmu_update_t mmu_updates[L1_PAGETABLE_ENTRIES + 1];
>      int count = 0;
>      int rc;
>  #endif
> @@ -323,7 +326,6 @@ static void set_readonly(void *text, void *etext)
>      unsigned long offset;
>      unsigned long page_size = PAGE_SIZE;
>  #ifdef CONFIG_PARAVIRT
> -    static mmu_update_t mmu_updates[L1_PAGETABLE_ENTRIES + 1];
>      int count = 0;
>      int rc;
>  #endif
> -- 
> 2.43.0
> 

-- 
Samuel
/*
 * [...] Note that 120 sec is defined in the protocol as the maximum
 * possible RTT.  I guess we'll have to use something other than TCP
 * to talk to the University of Mars.
 * PAWS allows us longer timeouts and large windows, so once implemented
 * ftp to mars will work nicely.
 */
(from /usr/src/linux/net/inet/tcp.c, concerning RTT [retransmission timeout])

