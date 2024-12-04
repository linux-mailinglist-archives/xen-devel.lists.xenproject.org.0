Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8389E487F
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2024 00:15:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.848791.1263591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIya4-0006uA-3u; Wed, 04 Dec 2024 23:14:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 848791.1263591; Wed, 04 Dec 2024 23:14:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIya4-0006rQ-0Z; Wed, 04 Dec 2024 23:14:52 +0000
Received: by outflank-mailman (input) for mailman id 848791;
 Wed, 04 Dec 2024 23:14:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G15x=S5=linaro.org=dmitry.baryshkov@srs-se1.protection.inumbo.net>)
 id 1tIya1-0006rK-Iu
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2024 23:14:49 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e0dd46c-b295-11ef-a0d4-8be0dac302b0;
 Thu, 05 Dec 2024 00:14:47 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2ffd6882dcbso2025071fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Dec 2024 15:14:47 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30020e2085fsm158771fa.83.2024.12.04.15.14.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2024 15:14:45 -0800 (PST)
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
X-Inumbo-ID: 8e0dd46c-b295-11ef-a0d4-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733354087; x=1733958887; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ByDBggfihaA7bzylhtE2nPcYIo+DwLJnDtkfjIDytqw=;
        b=WgAlmLcZnDveqCDLxawek4l/+8MC3prjweUZtHNX89XB1lyWyWEgmm3e9vfWJ5bZLb
         sLfDn7tr6CFm0jvNd9Ms/i4H31pQHPdDcqbLITgxDEqRxe1RYIIxyDrwKdLCiFV2ZUu/
         FDP3df5JPVX0MLbUFxvS1lbMwQDR0Fp+FnFjGuBf2tBoYWriyVl4BVHx7QiqD8QHU/9T
         UiuIQq7SOEY0jMn1OI6F+t3df4buz1xERiwzM0whyuSTNfttkCRHZ7NfDzdfkb2p46I+
         HfkMUdEfl9fB0smeSxeq6OVD+UGwhzDGCyuB9FFEJ4MEJ20H437W+SC4vPXdwxJbXgZa
         cZLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733354087; x=1733958887;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ByDBggfihaA7bzylhtE2nPcYIo+DwLJnDtkfjIDytqw=;
        b=p+l52y3r9qC8VR83H5k1+jDDKgYzPyja69sX3WiHkZX0kgxcgqLPH7jFvxeoDa692L
         WD6vOQ+d1cVyudveRo1n721q1GhkKzu4pBrtfDxXvk4WHKnVO0F1Gf8p4HsCLNcNBr+/
         yII0xmo+1jV3SPh1TpSWRU5Obq1YtbCfVkmadr08ZGwUzvDW0icjRPQJTp3IK+M1LAUi
         FMt+lidz9VHFpPb+A4M4QOeVY+ejK0Bk2aOP1/QR55bc2o60whAbdBlx2jm35fGArpYt
         vG9ezjnd61B3FOMicp4d9QjGzrpRZ4xXWmL+Bb/O2/F6fz4ApmfTwtj6W9zMmhkXh2uu
         HyRg==
X-Forwarded-Encrypted: i=1; AJvYcCUmhJjxxJ9NdQOZ+UXv9KwlOivtcNEgl4a3frvSfeB0oLXsK/DIxBC/mjHwwl54Flb1tJCNRj7RvUg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyDQao1anzxLAdpEoIROPQ0bM1cpM6S/RyWAa0Ixz8XzwCMWtpO
	vpDwyvAU+nyi9JRm8P6zVZRJujuktxo+sO7YpaUOSSJQiBoQwmRB1k76ohMZgvE=
X-Gm-Gg: ASbGncv8hl5iFXY9+2aPXJGgrO7bj4Gk3lEDphDbxADzTLWAa+vetLuZrXxQqt6jSzN
	sF2Z0Mbb6lrJ232i+phhgBZpfrsWBJJKItxTzA6E723xV2sm/WJQMTLt7OfIGrXKxzoSISG5CsU
	n9Tc/7/9jRk2wA3K4v8I7OLeOz6vqK0Y6mNMJJWfY8XgyXuynT6pT79/BVyF9uhWIOUZIwqQD4J
	YWEZ4PS4/I/Q0P8Fqrvj25I2a9HNIPZK8mJJni2i22lWCjJb9rSfDrdLoBjlTMNy/ien6NQA9iF
	nYAdmWcrZkHl8cSa43AzIgDl1JVNWQ==
X-Google-Smtp-Source: AGHT+IFuUS7Not1i5YzDB3gHy3ub9/hXvCvAwbQxzNqfeGQDqOoYZ6k6qPs0qszHy91ZjySfOh3ENQ==
X-Received: by 2002:a05:651c:210c:b0:2ff:7a4f:e770 with SMTP id 38308e7fff4ca-30014eaa13cmr17797471fa.31.1733354087009;
        Wed, 04 Dec 2024 15:14:47 -0800 (PST)
Date: Thu, 5 Dec 2024 01:14:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>, 
	Alex Deucher <alexander.deucher@amd.com>, Simon Ser <contact@emersion.fr>, 
	Jeffrey Hugo <quic_jhugo@quicinc.com>, David Airlie <airlied@gmail.com>, 
	Hamza Mahfooz <hamza.mahfooz@amd.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
	Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, amd-gfx@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 3/3] drm: remove driver date from struct drm_driver
 and all drivers
Message-ID: <couqmlshll3v6vgziqnt6sq7caf4nart42ljo5fbim3rg7ec5o@3ym66tyaytd2>
References: <cover.1733322525.git.jani.nikula@intel.com>
 <1f2bf2543aed270a06f6c707fd6ed1b78bf16712.1733322525.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f2bf2543aed270a06f6c707fd6ed1b78bf16712.1733322525.git.jani.nikula@intel.com>

On Wed, Dec 04, 2024 at 04:31:12PM +0200, Jani Nikula wrote:
> We stopped using the driver initialized date in commit 7fb8af6798e8
> ("drm: deprecate driver date") and (eventually) started returning "0"
> for drm_version ioctl instead.
> 
> Finish the job, and remove the unused date member from struct
> drm_driver, its initialization from drivers, along with the common
> DRIVER_DATE macros.
> 
> v2: Also update drivers/accel (kernel test robot)
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Acked-by: Alex Deucher <alexander.deucher@amd.com>
> Acked-by: Simon Ser <contact@emersion.fr>
> Acked-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # msm

> 
> ---

-- 
With best wishes
Dmitry

