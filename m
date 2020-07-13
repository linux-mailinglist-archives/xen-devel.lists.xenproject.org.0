Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0155321D15D
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2020 10:08:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jutVR-0002Ey-VA; Mon, 13 Jul 2020 08:08:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bAa1=AY=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jutVQ-0002Es-TB
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2020 08:08:08 +0000
X-Inumbo-ID: fc46ce08-c4df-11ea-8496-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fc46ce08-c4df-11ea-8496-bc764e2007e4;
 Mon, 13 Jul 2020 08:08:08 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j4so14795633wrp.10
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2020 01:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=n0kxcs6gNGs9FJbIs3Lc7T0KsS0d3xL066fOjGqZegk=;
 b=pcjaFOmOWH7bFsme46lfUzgiDMH76YUAcKrxY/kWWwAMFaTOK1EmHZlPDKfvD4LqAH
 4blcM1nrhzcvamHkZjtv2KCa8he/ylRAPTPVNfVLgziX8YdA5pQEVv+w0J+RydwcGzm6
 tw5AdBLeQ5Uz7FGfe2vzx7v9sDfeGtYZw3CoEau0WOf8iCRpchJ23m65JR+oRaH4Y1mw
 0QHtR3c2QqUHhCTy/ClyvX16VoddM0RzMmyhglPZl+vYVY82+IhZoTzQIXpBZ6At7W5S
 y2zcFt6XbooWaVXBLQBVPdlskr+GaxmNnedVbh6QcQVOBMIsmyTwfR9/uMQ96jY3BZOQ
 lB1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=n0kxcs6gNGs9FJbIs3Lc7T0KsS0d3xL066fOjGqZegk=;
 b=RfCLuOlcl/+VSjtxM5R13+ddcPLaU/zM9NbT0Z5a0y3ZTJDMVeLSyFllbVC5U5QTvx
 kNRb2NC2cXlk8L1vgDsQRKp5fXmd4WqM1TL1Fci05cqtMMBiSIcJwA7C5/RbEcYTD71c
 0vrF7laRkX7Vel5FXesIn8VuwMKIrYTZTUbszyeAEUyAyBNIrimfSbTkLKTbELbOh9I2
 EO0amFlayDn2Y0xuWHzIYFC/GAPAXFCHPrXQgrkq5Kiu93fxE/nrSSkbf02f8eRb3ESS
 o5AoF3gcLyLB9GKJbnkTGWqt714Wjeh2txbJzgw2OqTlNdfIo1UM1d8fkUKRqkwfpll4
 AFXw==
X-Gm-Message-State: AOAM530sAJIKfw+qGhODw446OiZ2wFFg7v/35ntRszIszJJ3ORb0VLaP
 Omb7Fwvjh40GktJ4IODY6PM=
X-Google-Smtp-Source: ABdhPJytfL/cIdT+33/hj/QLy5PvtlQ6lTN3tAN0bJF3PHbH20eU5KnmkWKiks/uAreR0c/RFyjo9Q==
X-Received: by 2002:a5d:4845:: with SMTP id n5mr76883891wrs.353.1594627687426; 
 Mon, 13 Jul 2020 01:08:07 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-236.amazon.com. [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id v3sm22686177wrq.57.2020.07.13.01.08.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 Jul 2020 01:08:06 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Souptick Joarder'" <jrdr.linux@gmail.com>, <boris.ostrovsky@oracle.com>,
 <jgross@suse.com>, <sstabellini@kernel.org>
References: <1594525195-28345-1-git-send-email-jrdr.linux@gmail.com>
 <1594525195-28345-2-git-send-email-jrdr.linux@gmail.com>
In-Reply-To: <1594525195-28345-2-git-send-email-jrdr.linux@gmail.com>
Subject: RE: [PATCH v3 1/3] xen/privcmd: Corrected error handling path
Date: Mon, 13 Jul 2020 09:08:04 +0100
Message-ID: <003801d658ec$bd526c70$37f74550$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQGQUUjbM0hB7euxJ1kpRMo6FNfk+gI2hbljqX+CmZA=
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
Reply-To: paul@xen.org
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 'Paul Durrant' <xadimgnik@gmail.com>, 'John Hubbard' <jhubbard@nvidia.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Souptick Joarder <jrdr.linux@gmail.com>
> Sent: 12 July 2020 04:40
> To: boris.ostrovsky@oracle.com; jgross@suse.com; sstabellini@kernel.org
> Cc: xen-devel@lists.xenproject.org; linux-kernel@vger.kernel.org; Souptick Joarder
> <jrdr.linux@gmail.com>; John Hubbard <jhubbard@nvidia.com>; Paul Durrant <xadimgnik@gmail.com>
> Subject: [PATCH v3 1/3] xen/privcmd: Corrected error handling path
> 
> Previously, if lock_pages() end up partially mapping pages, it used
> to return -ERRNO due to which unlock_pages() have to go through
> each pages[i] till *nr_pages* to validate them. This can be avoided
> by passing correct number of partially mapped pages & -ERRNO separately,
> while returning from lock_pages() due to error.
> 
> With this fix unlock_pages() doesn't need to validate pages[i] till
> *nr_pages* for error scenario and few condition checks can be ignored.
> 
> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> Reviewed-by: Juergen Gross <jgross@suse.com>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Cc: Paul Durrant <xadimgnik@gmail.com>

Reviewed-by: Paul Durrant <paul@xen.org>

> ---
>  drivers/xen/privcmd.c | 31 +++++++++++++++----------------
>  1 file changed, 15 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
> index 5dfc59f..b001673 100644
> --- a/drivers/xen/privcmd.c
> +++ b/drivers/xen/privcmd.c
> @@ -579,13 +579,13 @@ static long privcmd_ioctl_mmap_batch(
> 
>  static int lock_pages(
>  	struct privcmd_dm_op_buf kbufs[], unsigned int num,
> -	struct page *pages[], unsigned int nr_pages)
> +	struct page *pages[], unsigned int nr_pages, unsigned int *pinned)
>  {
>  	unsigned int i;
> 
>  	for (i = 0; i < num; i++) {
>  		unsigned int requested;
> -		int pinned;
> +		int page_count;
> 
>  		requested = DIV_ROUND_UP(
>  			offset_in_page(kbufs[i].uptr) + kbufs[i].size,
> @@ -593,14 +593,15 @@ static int lock_pages(
>  		if (requested > nr_pages)
>  			return -ENOSPC;
> 
> -		pinned = get_user_pages_fast(
> +		page_count = get_user_pages_fast(
>  			(unsigned long) kbufs[i].uptr,
>  			requested, FOLL_WRITE, pages);
> -		if (pinned < 0)
> -			return pinned;
> +		if (page_count < 0)
> +			return page_count;
> 
> -		nr_pages -= pinned;
> -		pages += pinned;
> +		*pinned += page_count;
> +		nr_pages -= page_count;
> +		pages += page_count;
>  	}
> 
>  	return 0;
> @@ -610,13 +611,8 @@ static void unlock_pages(struct page *pages[], unsigned int nr_pages)
>  {
>  	unsigned int i;
> 
> -	if (!pages)
> -		return;
> -
> -	for (i = 0; i < nr_pages; i++) {
> -		if (pages[i])
> -			put_page(pages[i]);
> -	}
> +	for (i = 0; i < nr_pages; i++)
> +		put_page(pages[i]);
>  }
> 
>  static long privcmd_ioctl_dm_op(struct file *file, void __user *udata)
> @@ -629,6 +625,7 @@ static long privcmd_ioctl_dm_op(struct file *file, void __user *udata)
>  	struct xen_dm_op_buf *xbufs = NULL;
>  	unsigned int i;
>  	long rc;
> +	unsigned int pinned = 0;
> 
>  	if (copy_from_user(&kdata, udata, sizeof(kdata)))
>  		return -EFAULT;
> @@ -682,9 +679,11 @@ static long privcmd_ioctl_dm_op(struct file *file, void __user *udata)
>  		goto out;
>  	}
> 
> -	rc = lock_pages(kbufs, kdata.num, pages, nr_pages);
> -	if (rc)
> +	rc = lock_pages(kbufs, kdata.num, pages, nr_pages, &pinned);
> +	if (rc < 0) {
> +		nr_pages = pinned;
>  		goto out;
> +	}
> 
>  	for (i = 0; i < kdata.num; i++) {
>  		set_xen_guest_handle(xbufs[i].h, kbufs[i].uptr);
> --
> 1.9.1



