Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDED21D16A
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2020 10:11:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jutXu-00036k-Lo; Mon, 13 Jul 2020 08:10:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bAa1=AY=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jutXt-00036c-95
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2020 08:10:41 +0000
X-Inumbo-ID: 571fbc36-c4e0-11ea-b7bb-bc764e2007e4
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 571fbc36-c4e0-11ea-b7bb-bc764e2007e4;
 Mon, 13 Jul 2020 08:10:40 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id f18so12240555wml.3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2020 01:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=nT2xE2I/1laRy3/n8/6HWxHbLx8UbAkaa/McJbaY/Go=;
 b=L61FhwCCvRDKQLIKdnXaGxMEL0Cgg8QW8GHZ/v5d4/c4Ig9855dnDAK7hZ3Wq81MI4
 qGwEokCjqapm8wRSgtkuMyucU0k+p2FetZQCLUDsTltZ8fg/4F8NpNvovCKRb/bXP7HX
 Ue3VEO//CgeIoEbLfWpRHvErKA0kri+aNdUQpz2B8nobBdvqjM1WD3qY428QfYJLtQ5G
 pAp6MyLRE3O84pp8zBWGe0tmiF0pXOzRvP0P/NL1gPzbUd48IENUBf4oZDwTXuy+4osv
 a+z0Rj6AUbKa9a63yMQNqYKWMMD1iBcAdVyr7vILDMeuHZuN6+EL57okjFctAnUNbBsK
 1Saw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=nT2xE2I/1laRy3/n8/6HWxHbLx8UbAkaa/McJbaY/Go=;
 b=loblu7048Gk8fFCnC7rIqMuHm/IuiDE5hT/rCk7rmhsHHWfyGCRcmR1+zeyVNk4ekI
 DyLuTjpbOB49wHYUn43r+TOQyIb5/+oZ1gpHrxUl0lLVL0u+dQgdbPB95mpWxVymM3yY
 ifuutqwADLHmDwkvTTaoGQdf0tITRmhDZHNpIAi0RCYjT1R5PUFEmlqB2JM0NeMtItKT
 kvODJ9FU7cBRDnA/XxbmIBBN8DACusC2uKPKT/93lSeoFXUdu8jCrbi0sSRzXeMNKyAr
 W5xAmzakFGarUY/XaxK4ZRnifDp2omGp6716mJMrAdA2pwXqseSQJUWeMKE81NVO4W4r
 62ng==
X-Gm-Message-State: AOAM530hu0aUu8o7cTZPzRTtkb1mReuiAqEcsbxmj9RvajmBz0KrrtsX
 3lM16rrwNAjUOKo66x3wm9w=
X-Google-Smtp-Source: ABdhPJygTefIsKyZlBfTQwg8Ok+6EIMpEHdvDLG1LGMonu/CaPUYSMBvfx4mgduaPCPtD/3iCo0qvQ==
X-Received: by 2002:a7b:cd09:: with SMTP id f9mr18552307wmj.160.1594627839822; 
 Mon, 13 Jul 2020 01:10:39 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-236.amazon.com. [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id n17sm21674581wrs.2.2020.07.13.01.10.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 Jul 2020 01:10:39 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Souptick Joarder'" <jrdr.linux@gmail.com>, <boris.ostrovsky@oracle.com>,
 <jgross@suse.com>, <sstabellini@kernel.org>
References: <1594525195-28345-1-git-send-email-jrdr.linux@gmail.com>
 <1594525195-28345-4-git-send-email-jrdr.linux@gmail.com>
In-Reply-To: <1594525195-28345-4-git-send-email-jrdr.linux@gmail.com>
Subject: RE: [PATCH v3 3/3] xen/privcmd: Convert get_user_pages*() to
 pin_user_pages*()
Date: Mon, 13 Jul 2020 09:10:38 +0100
Message-ID: <003a01d658ed$1858e220$490aa660$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQGQUUjbM0hB7euxJ1kpRMo6FNfk+gGYi24xqYRzHNA=
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
> Subject: [PATCH v3 3/3] xen/privcmd: Convert get_user_pages*() to pin_user_pages*()
> 
> In 2019, we introduced pin_user_pages*() and now we are converting
> get_user_pages*() to the new API as appropriate. [1] & [2] could
> be referred for more information. This is case 5 as per document [1].
> 
> [1] Documentation/core-api/pin_user_pages.rst
> 
> [2] "Explicit pinning of user-space pages":
>         https://lwn.net/Articles/807108/
> 
> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> Reviewed-by: Juergen Gross <jgross@suse.com>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Cc: Paul Durrant <xadimgnik@gmail.com>

Reviewed-by: Paul Durrant <paul@xen.org>

> ---
>  drivers/xen/privcmd.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
> index 079d35b..63abe6c 100644
> --- a/drivers/xen/privcmd.c
> +++ b/drivers/xen/privcmd.c
> @@ -593,7 +593,7 @@ static int lock_pages(
>  		if (requested > nr_pages)
>  			return -ENOSPC;
> 
> -		page_count = get_user_pages_fast(
> +		page_count = pin_user_pages_fast(
>  			(unsigned long) kbufs[i].uptr,
>  			requested, FOLL_WRITE, pages);
>  		if (page_count < 0)
> @@ -609,13 +609,7 @@ static int lock_pages(
> 
>  static void unlock_pages(struct page *pages[], unsigned int nr_pages)
>  {
> -	unsigned int i;
> -
> -	for (i = 0; i < nr_pages; i++) {
> -		if (!PageDirty(pages[i]))
> -			set_page_dirty_lock(pages[i]);
> -		put_page(pages[i]);
> -	}
> +	unpin_user_pages_dirty_lock(pages, nr_pages, true);
>  }
> 
>  static long privcmd_ioctl_dm_op(struct file *file, void __user *udata)
> --
> 1.9.1



