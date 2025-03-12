Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F37A5D6B4
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 07:57:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909990.1316804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsG1f-0000rg-Mt; Wed, 12 Mar 2025 06:57:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909990.1316804; Wed, 12 Mar 2025 06:57:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsG1f-0000oY-JY; Wed, 12 Mar 2025 06:57:11 +0000
Received: by outflank-mailman (input) for mailman id 909990;
 Wed, 12 Mar 2025 06:57:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hgYX=V7=redhat.com=mst@srs-se1.protection.inumbo.net>)
 id 1tsG1e-0000oQ-Ga
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 06:57:10 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 370f013a-ff0f-11ef-9ab9-95dc52dad729;
 Wed, 12 Mar 2025 07:57:09 +0100 (CET)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-495-XUHUGlINOZOzxB6g1rc87w-1; Wed, 12 Mar 2025 02:57:06 -0400
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43ce245c5acso31975185e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 23:57:06 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a731031sm11806955e9.7.2025.03.11.23.57.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 23:57:03 -0700 (PDT)
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
X-Inumbo-ID: 370f013a-ff0f-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741762628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ngFN5P8pa+SiEt1Ew8FmKgFK9481luIZ3P3zqtJw6G4=;
	b=cKupKixu0pgM283QzKnMquaa5FimMxsNLQ0DlUX9AqzxUd1Z+BhHVgqvK/sofj9531xrkC
	odUR3qPy75F2jveM/MbWPSFK9hIfAoHvKdnqw7LJknX6T6bG2CUJFrtMf1Xlo7zWTn1st/
	024yWaJuEejvHTD6nKyezq7NMmxUYCI=
X-MC-Unique: XUHUGlINOZOzxB6g1rc87w-1
X-Mimecast-MFC-AGG-ID: XUHUGlINOZOzxB6g1rc87w_1741762625
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741762625; x=1742367425;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngFN5P8pa+SiEt1Ew8FmKgFK9481luIZ3P3zqtJw6G4=;
        b=H3i/5ATJIIAqfoBGt42x9VMIwowXCTxDqRqRlrcgwXfTaSLX56XxHVuy86MTRwhK8X
         uszuNG3xMGN19CLX0PsxxlbrOZQOtbRUtrC20fqBMKDGqZ0hgFGGl4uO0S80cViV+yts
         rjMBdMHYvaesVsV0qgu5fUac0PUpgaFBHfLCCEHeZWtfZXFHUMV2UIfrrQigu4DLOQ2l
         pAhpR6JqhLlKmhH4ZGrD42jCsETAdF837oXxmCkk3GOFsz7eSXcnIiNeueWw4djGOeqB
         SQn0/IqQtId8liz2KRq3iYcrRae/qA2DirDsRO4+40Vy+niChPOuojP4UHt6a8zgQ+vp
         Wivg==
X-Forwarded-Encrypted: i=1; AJvYcCXvpqz4PddXLGI1noGoSeXoEu0/nFt1hhpJRxVKvIrpBV93RO4JVAbITLE9Vnv481TPl0v3KfPehoc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwSnB8Wfa/e7PVXYym4Pws1+jvYrmqqYzYf7QLqek85DG8x1mgk
	Hlvkr/lx4t5UWN/IZNlMFHeHp7UuwPOXNVu7MNuWhYiqHGLBShGTd+w2RZnwgguwLytHj0/tjjD
	M3zlWsxtDjOGtYdeyriA0oGD5nvkTsFNXgZeka8+OkDglHJfp7dc/dk6K5ztRwh9m
X-Gm-Gg: ASbGncsVZG3K/VycoUXYFw5IPSnJsTU4/l+w8XmQRfMnbPlCAZYy2pC9bzIvkQpX2l2
	MEwBpz2tVeYdTVWvW3MpCo56F0B94oYGJiWQOf4C5Kbj6SiIRhwELfPQHyHzTg0fopDpOHtDddZ
	B+T3rz0MZ1gIJQTMWn8DGs2FYfUQ19Qs4HkVc7LtQ7zzPER86cNjsC8SptI0NTOE7gfKNj+uETS
	LdHehNggThKIwWDPySVI03WjEYo2hO/sR7wC+vj2blpD5w7/kUd71oZfZ82hZaZVHYIMkKHC+zx
	OU9diAgbBQ==
X-Received: by 2002:a05:600c:5618:b0:43b:ce3c:19d0 with SMTP id 5b1f17b1804b1-43cdfb7db88mr143183335e9.29.1741762625058;
        Tue, 11 Mar 2025 23:57:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXQUbnjKhdX7cSTwHc/sH5KUBC9yqYpY1/TKqBEmz2tDiKoCFs3roMwKysiE2/kbKi5UsENQ==
X-Received: by 2002:a05:600c:5618:b0:43b:ce3c:19d0 with SMTP id 5b1f17b1804b1-43cdfb7db88mr143183025e9.29.1741762624636;
        Tue, 11 Mar 2025 23:57:04 -0700 (PDT)
Date: Wed, 12 Mar 2025 02:56:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Nico Pache <npache@redhat.com>
Cc: linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux.dev, xen-devel@lists.xenproject.org,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	cgroups@vger.kernel.org, kys@microsoft.com, haiyangz@microsoft.com,
	wei.liu@kernel.org, decui@microsoft.com,
	jerrin.shaji-george@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com, arnd@arndb.de,
	gregkh@linuxfoundation.org, david@redhat.com, jasowang@redhat.com,
	xuanzhuo@linux.alibaba.com, eperezma@redhat.com, jgross@suse.com,
	sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
	akpm@linux-foundation.org, hannes@cmpxchg.org, mhocko@kernel.org,
	roman.gushchin@linux.dev, shakeel.butt@linux.dev,
	muchun.song@linux.dev, nphamcs@gmail.com, yosry.ahmed@linux.dev,
	kanchana.p.sridhar@intel.com, alexander.atanasov@virtuozzo.com
Subject: Re: [RFC 4/5] vmx_balloon: update the NR_BALLOON_PAGES state
Message-ID: <20250312025607-mutt-send-email-mst@kernel.org>
References: <20250312000700.184573-1-npache@redhat.com>
 <20250312000700.184573-5-npache@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20250312000700.184573-5-npache@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: USS4Eqa9z6hA44ljLgXxnE0J3knPJZUSkLq-BMKySTY_1741762625
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 11, 2025 at 06:06:59PM -0600, Nico Pache wrote:
> Update the NR_BALLOON_PAGES counter when pages are added to or
> removed from the VMware balloon.
> 
> Signed-off-by: Nico Pache <npache@redhat.com>
> ---
>  drivers/misc/vmw_balloon.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/vmw_balloon.c b/drivers/misc/vmw_balloon.c
> index c817d8c21641..2c70b08c6fb3 100644
> --- a/drivers/misc/vmw_balloon.c
> +++ b/drivers/misc/vmw_balloon.c
> @@ -673,6 +673,8 @@ static int vmballoon_alloc_page_list(struct vmballoon *b,
>  
>  			vmballoon_stats_page_inc(b, VMW_BALLOON_PAGE_STAT_ALLOC,
>  						 ctl->page_size);
> +			mod_node_page_state(page_pgdat(page), NR_BALLOON_PAGES,
> +				vmballoon_page_in_frames(ctl->page_size));


same issue as virtio I think - this counts frames not pages.

>  		}
>  
>  		if (page) {
> @@ -915,6 +917,8 @@ static void vmballoon_release_page_list(struct list_head *page_list,
>  	list_for_each_entry_safe(page, tmp, page_list, lru) {
>  		list_del(&page->lru);
>  		__free_pages(page, vmballoon_page_order(page_size));
> +		mod_node_page_state(page_pgdat(page), NR_BALLOON_PAGES,
> +			-vmballoon_page_in_frames(page_size));
>  	}
>  
>  	if (n_pages)
> @@ -1129,7 +1133,6 @@ static void vmballoon_inflate(struct vmballoon *b)
>  
>  		/* Update the balloon size */
>  		atomic64_add(ctl.n_pages * page_in_frames, &b->size);
> -


unrelated change

>  		vmballoon_enqueue_page_list(b, &ctl.pages, &ctl.n_pages,
>  					    ctl.page_size);
>  
> -- 
> 2.48.1


