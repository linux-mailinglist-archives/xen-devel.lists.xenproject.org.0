Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B36552709
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jun 2022 00:44:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352915.579789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3Q7p-0000u2-Bz; Mon, 20 Jun 2022 22:44:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352915.579789; Mon, 20 Jun 2022 22:44:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3Q7p-0000pi-8G; Mon, 20 Jun 2022 22:44:05 +0000
Received: by outflank-mailman (input) for mailman id 352915;
 Mon, 20 Jun 2022 22:44:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B8m2=W3=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1o3Q7n-0000pC-UL
 for xen-devel@lists.xenproject.org; Mon, 20 Jun 2022 22:44:03 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79df0d36-f0ea-11ec-bd2d-47488cf2e6aa;
 Tue, 21 Jun 2022 00:44:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id CED232014F;
 Tue, 21 Jun 2022 00:43:58 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rWJLcV2fRi5A; Tue, 21 Jun 2022 00:43:58 +0200 (CEST)
Received: from begin.home (anantes-655-1-33-15.w83-195.abo.wanadoo.fr
 [83.195.225.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id B95C720148;
 Tue, 21 Jun 2022 00:43:58 +0200 (CEST)
Received: from samy by begin.home with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1o3Q7j-00B6Jd-Bt;
 Tue, 21 Jun 2022 00:43:59 +0200
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
X-Inumbo-ID: 79df0d36-f0ea-11ec-bd2d-47488cf2e6aa
Date: Tue, 21 Jun 2022 00:43:59 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v2 3/4] mini-os: fix number of pages for PVH
Message-ID: <20220620224359.qbpojkdwbxbsfcv3@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20220619065253.19503-1-jgross@suse.com>
 <20220619065253.19503-4-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220619065253.19503-4-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le dim. 19 juin 2022 08:52:52 +0200, a ecrit:
> When getting the current allocation from Xen, this value includes the
> pages allocated in the MMIO area. Fix the highest available RAM page
> by subtracting the size of that area.
> 
> This requires to read the E820 map before needing this value. Add two
> functions returning the current and the maximum number of RAM pages
> taking this correction into account.
> 
> At the same time add the LAPIC page to the memory map in order to
> avoid reusing that PFN for internal purposes.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - make e820_initial_reserved_pfns static (Samuel Thibault)
> - add e820_get_current_pages() and e820_get_max_pages()
> ---

> diff --git a/include/e820.h b/include/e820.h
> index 5438a7c8..6f15fcd2 100644
> --- a/include/e820.h
> +++ b/include/e820.h
> @@ -52,6 +52,8 @@ struct __packed e820entry {
>  extern struct e820entry e820_map[];
>  extern unsigned e820_entries;
>  
> +unsigned int e820_get_current_pages(void);
> +unsigned int e820_get_max_pages(void);

Why an int rather than a long int? Yes 4TiB memory is large for mini-os,
but better keep numbers of pages a long?

Apart from that,

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Samuel

