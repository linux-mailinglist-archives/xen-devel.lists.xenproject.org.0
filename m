Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C0955270C
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jun 2022 00:45:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352924.579804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3Q94-0001Xb-NV; Mon, 20 Jun 2022 22:45:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352924.579804; Mon, 20 Jun 2022 22:45:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3Q94-0001V7-K9; Mon, 20 Jun 2022 22:45:22 +0000
Received: by outflank-mailman (input) for mailman id 352924;
 Mon, 20 Jun 2022 22:45:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B8m2=W3=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1o3Q92-0001T5-Rc
 for xen-devel@lists.xenproject.org; Mon, 20 Jun 2022 22:45:20 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8e4bc60-f0ea-11ec-bd2d-47488cf2e6aa;
 Tue, 21 Jun 2022 00:45:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id A705C2014F;
 Tue, 21 Jun 2022 00:45:18 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x8bigerdlSdi; Tue, 21 Jun 2022 00:45:18 +0200 (CEST)
Received: from begin.home (anantes-655-1-33-15.w83-195.abo.wanadoo.fr
 [83.195.225.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 8E1D820148;
 Tue, 21 Jun 2022 00:45:18 +0200 (CEST)
Received: from samy by begin.home with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1o3Q90-00B6Ki-5w;
 Tue, 21 Jun 2022 00:45:18 +0200
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
X-Inumbo-ID: a8e4bc60-f0ea-11ec-bd2d-47488cf2e6aa
Date: Tue, 21 Jun 2022 00:45:18 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v2 4/4] mini-os: fix bug in ballooning on PVH
Message-ID: <20220620224518.xfm426w5gcu322sh@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20220619065253.19503-1-jgross@suse.com>
 <20220619065253.19503-5-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220619065253.19503-5-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le dim. 19 juin 2022 08:52:53 +0200, a ecrit:
> There is a subtle bug in ballooning code for PVH: in case ballooning
> extends above a non-RAM area of the memory map, wrong pages will be
> used.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
> V2:
> - new patch
> ---
>  balloon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/balloon.c b/balloon.c
> index 6ad07644..55be8141 100644
> --- a/balloon.c
> +++ b/balloon.c
> @@ -124,7 +124,7 @@ int balloon_up(unsigned long n_pages)
>      for ( pfn = 0; pfn < rc; pfn++ )
>      {
>          arch_pfn_add(start_pfn + pfn, balloon_frames[pfn]);
> -        free_page(pfn_to_virt(nr_mem_pages + pfn));
> +        free_page(pfn_to_virt(start_pfn + pfn));
>      }
>  
>      nr_mem_pages += rc;
> -- 
> 2.35.3
> 

