Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A78D851142
	for <lists+xen-devel@lfdr.de>; Mon, 12 Feb 2024 11:42:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679524.1056977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZTlF-0005F5-PN; Mon, 12 Feb 2024 10:42:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679524.1056977; Mon, 12 Feb 2024 10:42:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZTlF-0005CH-M3; Mon, 12 Feb 2024 10:42:05 +0000
Received: by outflank-mailman (input) for mailman id 679524;
 Mon, 12 Feb 2024 10:42:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9jSY=JV=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rZTlE-0005C3-5f
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2024 10:42:04 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b25dd41-c993-11ee-98f5-efadbce2ee36;
 Mon, 12 Feb 2024 11:42:02 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5114fa38434so3261928e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Feb 2024 02:42:02 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 c6-20020a05600c0a4600b004117e45f12esm296569wmq.22.2024.02.12.02.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Feb 2024 02:42:01 -0800 (PST)
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
X-Inumbo-ID: 5b25dd41-c993-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707734522; x=1708339322; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u5pnzoiiByE6csyB3DAuVZmfY6ARX/aQY8Wab7e9s5M=;
        b=gUfeKNIqgJdgQwmGl4GnG0VKTud+2xx3Q6McYOhn/jPEboH+YBF3+X3F6CU7Zif0pN
         dz1jb1MlLOgoRa9SnZBnVD9yCsMd/ecytSBVveXPLHDGZTZEFwOqHmlhEWY1UbuXdTjS
         yoUI4uB9/pU4crbL075yj2D1TuK1u7StbC6dI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707734522; x=1708339322;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u5pnzoiiByE6csyB3DAuVZmfY6ARX/aQY8Wab7e9s5M=;
        b=wfNOPHih2p9P971Eeqz8V1x861OiQhf+JXixeMxGm7Ma379noJUSI+e+nC/Hxd03Uv
         J4qMcQzDyqMtZ5Pt4gxbz4P3HrhhDhL1KaJtYZj9XgCNxn7Jn0XUN8P3ItuqgVrJmHmg
         cKh5xhoWn3KayvdTx1Y7Kkzm/nZa/MU60/7EV/n6XTIUWhaBijEjq9mfNJNrlFoA6uRu
         v+fWzs45xGVggv5/yberkGlthNRThdse4bnXcP/62f5FsUoKXKyFKxWZhtazMM9QkzLC
         3s+GLLWu69Z+GQ//HKgrmc4jTCrdR6hH3koMNqocTOJ3rSjhRvMp8hxdXHyfYQhvvmll
         Nohw==
X-Gm-Message-State: AOJu0Yw1UnJHIjMymhul1GJNnR0uy4WzsYR644miKvhebCHj+Sjk79G+
	eU3bEsBIB9PwZKdKDMhXrYlvu7CMrLCF6fMlp/MeqN64jS8wUduOHAf07TwDa/Y=
X-Google-Smtp-Source: AGHT+IGqMYP9ZEyfpamnXStOhse1sBmr908Q1Wv8RksxnxNGxCIsdFLZGinfEbtbrGQWBhoihK0Pmw==
X-Received: by 2002:ac2:4bd1:0:b0:511:87eb:8dc4 with SMTP id o17-20020ac24bd1000000b0051187eb8dc4mr3856284lfq.32.1707734521813;
        Mon, 12 Feb 2024 02:42:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWg5BzQbNQr+x2B7UtXHLnWkRCk+kkuQQHOtj7Qh0LbMTNYYXny02UdCP3eRE8NUhQR6DgRim7mqNWFuSgJSMNk4iaDdrcmYTQQDcc=
Date: Mon, 12 Feb 2024 10:42:01 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 4/4] libxl: Support blktap with HVM device model
Message-ID: <8f5ec1c2-4730-479f-b878-1409b3bc21f1@perard>
References: <20240201183024.145424-1-jandryuk@gmail.com>
 <20240201183024.145424-5-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240201183024.145424-5-jandryuk@gmail.com>

On Thu, Feb 01, 2024 at 01:30:24PM -0500, Jason Andryuk wrote:
> diff --git a/tools/libs/light/libxl_disk.c b/tools/libs/light/libxl_disk.c
> @@ -1337,10 +1338,18 @@ char *libxl__device_disk_find_local_path(libxl__gc *gc,
>          LOGD(DEBUG, guest_domid, "Attempting to read node %s", pdpath);
>          path = libxl__xs_read(gc, XBT_NULL, pdpath);
>  
> -        if (path)
> +        if (path) {
>              LOGD(DEBUG, guest_domid, "Accessing cooked block device %s", path);
> -        else
> -            LOGD(DEBUG, guest_domid, "No physical-device-path, can't access locally.");
> +
> +            /* tapdisk exposes disks locally over UNIX socket NBD. */
> +            if (disk->backend == LIBXL_DISK_BACKEND_TAP) {
> +                path = libxl__sprintf(gc, "nbd+unix:///?socket=%s", path);
> +                LOGD(DEBUG, guest_domid,
> +                     "Directly accessing local TAP target %s", path);
> +            }
> +        } else
> +            LOGD(DEBUG, guest_domid,
> +                "No physical-device-path, can't access locally.");

Here, the coding style call to have both side of the if..else to have { }
or none of them. Could you add {}-block for the else side?


Beside that, patch looks fine to me:
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

