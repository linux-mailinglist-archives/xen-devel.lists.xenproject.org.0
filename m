Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B832F85E3CC
	for <lists+xen-devel@lfdr.de>; Wed, 21 Feb 2024 17:56:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684117.1063820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcpsp-0003JK-Ij; Wed, 21 Feb 2024 16:55:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684117.1063820; Wed, 21 Feb 2024 16:55:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcpsp-0003Hn-G0; Wed, 21 Feb 2024 16:55:47 +0000
Received: by outflank-mailman (input) for mailman id 684117;
 Wed, 21 Feb 2024 16:55:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c6My=J6=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rcpso-0003Hh-Nz
 for xen-devel@lists.xenproject.org; Wed, 21 Feb 2024 16:55:46 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0cfff80a-d0da-11ee-98f5-efadbce2ee36;
 Wed, 21 Feb 2024 17:55:43 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4127190ad83so12119805e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 21 Feb 2024 08:55:43 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 l15-20020a1c790f000000b0040fe308ff25sm3022782wme.24.2024.02.21.08.55.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Feb 2024 08:55:42 -0800 (PST)
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
X-Inumbo-ID: 0cfff80a-d0da-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1708534543; x=1709139343; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KwUFUpoW5hHVQuEktH7p0pFcmfkKAd6VvCgn5VWIBq8=;
        b=ELe4qwHwT5qp0VIQCWnfRQh5WUXM2A2bXX3YQ3MUVMsqdaQkmUX290EXj5EluAoLfI
         taqeXj1duddWdDM9eLrvqboUI7jy4lKl4edAz41+FI++yB6rcrdNAwBmIDTXTUb6+U4K
         Nij98QWLO2DZebtCtTen1Bmjm/IWFVzaHL3L4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708534543; x=1709139343;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KwUFUpoW5hHVQuEktH7p0pFcmfkKAd6VvCgn5VWIBq8=;
        b=H0oZcYQSuYdl50ZiXM+UzJ8UgEid6djdmUq2MFVe0vXCdks+50F69+8wpzCdA9YOFz
         lFt3/8dc1j0qThCap/US8QJYtZSyfpzI9+8DTpPLpqNZV6evK5MXPn/F268LS2Zm+0bF
         3njiKyn5z3mpm/X9zNcgJw+wWLCwrUccnzw7fqHHzBE3g41IkiqxLjscYqUbmr/GxmT2
         Xwc8yy6MieVEVCmC0r/YNXUWWdHSzjbNaLQHYTaLILE6iUjsYbFo0Lw9yARHb682XddJ
         4PqEZ/QWo4sHbxj3udv8mD82MuRb6T1VGVFqNOcko8Xted8IwCb1KbvR+cqYDioX0YDb
         fxKQ==
X-Gm-Message-State: AOJu0YxZTTHhzwH3BvWuIN29nVS6izDDIdttIl/g++5SBmOdCKdHmT7p
	WbAPAj/7l9BK5k/Lhduc6VInX7QSCaFtga8VW7iC+Kqyy9AEhWDRpCuDYCHOtlI=
X-Google-Smtp-Source: AGHT+IGnkfV7PLqsPGHrgrCeBxbJAklnA9H4oNODwrkUkGyxHGxiLDvgJLOBi56XP4A1vXSm/fEgDw==
X-Received: by 2002:a05:600c:4747:b0:412:71af:8af5 with SMTP id w7-20020a05600c474700b0041271af8af5mr3207487wmo.16.1708534543122;
        Wed, 21 Feb 2024 08:55:43 -0800 (PST)
Date: Wed, 21 Feb 2024 16:55:42 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] libxl: Use vkb=[] for HVMs
Message-ID: <6e22cbfa-84db-4556-b8cf-2563810ab558@perard>
References: <20240109171631.40071-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240109171631.40071-1-jandryuk@gmail.com>

On Tue, Jan 09, 2024 at 12:16:31PM -0500, Jason Andryuk wrote:
> xl/libxl only applies vkb=[] to PV & PVH guests.  HVM gets only a single
> vkb by default, but that can be disabled by the vkb_device boolean.
> Notably the HVM vkb cannot be configured, so feature-abs-pointer or the
> backend-type cannot be specified.
> 
> Re-arrange the logic so that vkb=[] is handled regardless of domain
> type.  If vkb is empty or unspecified, follow the vkb_device boolean for
> HVMs.  Nothing changes for PVH & PV.  HVMs can now get a configured vkb
> instead of just the default one.
> 
> The chance for regression is an HVM config with
> vkb=["$something"]
> vkb_device=false
> 
> Which would now get a vkb.
> 
> This is useful for vGlass which provides a VKB to HVMs.  vGlass wants to
> specify feature-abs-pointer, but that is racily written by vGlass
> instead of coming through the xl.cfg.  Unhelpfully, Linux xen-kbdfront
> reads the backend nodes without checking that the backend is in
> InitWait.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

I guess we would want an entry in the CHANGELOG about "vkb=[]" been
available on HVM guests.


> diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
> index ce1d431103..39c50b3711 100644
> --- a/tools/libs/light/libxl_create.c
> +++ b/tools/libs/light/libxl_create.c
> @@ -1771,24 +1771,31 @@ static void domcreate_launch_dm(libxl__egc *egc, libxl__multidev *multidev,
>          libxl__device_add(gc, domid, &libxl__virtio_devtype,
>                            &d_config->virtios[i]);
>  
> +    if (d_config->num_vkbs) {
> +        for (i = 0; i < d_config->num_vkbs; i++) {
> +            libxl__device_add(gc, domid, &libxl__vkb_devtype,
> +                              &d_config->vkbs[i]);

While there, could you check the return value of that function? That
would be having:
    ret = libxl__device_add();
    if (ret) goto error_out;

With that: Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

