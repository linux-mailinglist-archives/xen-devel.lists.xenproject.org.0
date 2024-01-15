Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D3082DC76
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 16:39:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667477.1038772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPP35-0005yO-7P; Mon, 15 Jan 2024 15:38:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667477.1038772; Mon, 15 Jan 2024 15:38:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPP35-0005wj-4n; Mon, 15 Jan 2024 15:38:51 +0000
Received: by outflank-mailman (input) for mailman id 667477;
 Mon, 15 Jan 2024 15:38:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tunR=IZ=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rPP33-0005wc-QN
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 15:38:49 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c83ea62-b3bc-11ee-9b0f-b553b5be7939;
 Mon, 15 Jan 2024 16:38:47 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a28f66dc7ffso1797396466b.0
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2024 07:38:47 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 bt22-20020a170906b15600b00a2c32c5f484sm5356256ejb.209.2024.01.15.07.38.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 07:38:47 -0800 (PST)
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
X-Inumbo-ID: 2c83ea62-b3bc-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1705333127; x=1705937927; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M2HFNFbTvTgM7yHAJxm7DJmU2DepMFt5F9qPq7FLa0s=;
        b=CzmVyQPYtHUsMO0UA2fB7nnsDWA6GFziuTzcElyCGjPN7nN/PG2uz7KMgLISnFMlZE
         obC6sA+T9uYdjALR31eptA29cDuHqbn+EYBAfptdmwX9Mq3NMySdiA2uuaOLwETzbROU
         yqWWjTdfRbgn0xWxR6/xMZTEH7hO1QpdiwZog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705333127; x=1705937927;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2HFNFbTvTgM7yHAJxm7DJmU2DepMFt5F9qPq7FLa0s=;
        b=kAKarc4bo/3RzA9czIC3UfX4wc3yugfS/aomv/vWYWSpkDnwX1+8m1y/nOueXPddIO
         +QN6+rz0Q00Gy/homYfKbLLJtfNd3idbc9xA8mb4drFSsSY8sVdpKKcxmPJKW2FemsIN
         jNjWlEntRMllxeo2Uyirc7hKBLZUFTY0ReueJUVussQ++QhC1yHg8uzKEDbbG0u/0S3F
         aKE/vvymlsfM5HieGH1559rPACAVjc2/yeUin3EPFyN7gCWK4vejBOXN/OC+QU3+tYLD
         i+ygSMo1yHMbsLuJ7xxZ6Ck2f0Cz5+EKG/uJDQCzYNgg2Fs1zv7DGvrzY0PQBqhzUBym
         AWcw==
X-Gm-Message-State: AOJu0YwR6xlm0iThM06hq9P43mCVq1tRVTXsaAIO9hV/yTbyj8AaQI0S
	v+eGuuaN8awkYrZ2j59T5wWeNE0GdfqKU2Qa4ZYCJ7zJVro=
X-Google-Smtp-Source: AGHT+IF7u5L1piLdoDoPgYO5UwOHphMpeOcM9ULY8oN1bKqBSfzY4RaeN78APTliW5GlQ6ttuqqFYg==
X-Received: by 2002:a17:907:c719:b0:a2c:2cef:2542 with SMTP id ty25-20020a170907c71900b00a2c2cef2542mr6554403ejc.16.1705333127385;
        Mon, 15 Jan 2024 07:38:47 -0800 (PST)
Date: Mon, 15 Jan 2024 15:38:46 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu <wl@xen.org>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH v3 16/33] tools/libs/light: add backend type for 9pfs PV
 devices
Message-ID: <cfecc01a-b4c7-4b21-833f-d9ebcea8a89e@perard>
References: <20240104090055.27323-1-jgross@suse.com>
 <20240104090055.27323-17-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240104090055.27323-17-jgross@suse.com>

On Thu, Jan 04, 2024 at 10:00:38AM +0100, Juergen Gross wrote:
> +static void libxl__device_p9_add(libxl__egc *egc, uint32_t domid,
> +                                 libxl_device_p9 *p9,
> +                                 libxl__ao_device *aodev)
> +{
> +    int rc;

Can you make a copy of `p9` here, or maybe in xen9pfsd_spawn? There's no
guaranty that `p9` will still be around by the time
xen9pfsd_spawn_outcome() is executed.

(with libxl_device_p9_copy())

> +    rc = xen9pfsd_spawn(egc, domid, p9, aodev);
> +    if (rc == 1)
> +        return;
> +
> +    if (rc == 0)
> +        libxl__device_add_async(egc, domid, &libxl__p9_devtype, p9, aodev);
> +
> +    aodev->rc = rc;
> +    if (rc)
> +        aodev->callback(egc, aodev);
> +}
> +

Cheers,

-- 
Anthony PERARD

