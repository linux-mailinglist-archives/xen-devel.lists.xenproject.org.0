Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0539B3C67
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 21:57:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826984.1241453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5WmU-0004Vr-Kl; Mon, 28 Oct 2024 20:56:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826984.1241453; Mon, 28 Oct 2024 20:56:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5WmU-0004Sl-Hp; Mon, 28 Oct 2024 20:56:06 +0000
Received: by outflank-mailman (input) for mailman id 826984;
 Mon, 28 Oct 2024 20:56:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SUXZ=RY=gmail.com=alexdeucher@srs-se1.protection.inumbo.net>)
 id 1t5WmT-0004Sf-BZ
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 20:56:05 +0000
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [2607:f8b0:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 091d20fc-956f-11ef-99a3-01e77a169b0f;
 Mon, 28 Oct 2024 21:56:00 +0100 (CET)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-71e4c2e36d5so162610b3a.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 13:56:00 -0700 (PDT)
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
X-Inumbo-ID: 091d20fc-956f-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730148959; x=1730753759; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D1Co9AOGY8fdKgoryciwma41R5B9YqOzlnHWDbIZnus=;
        b=GGbmpmL2PwmmHrjfUbPLs4NG3ATwYD5JYz4PT9OKVkT2ofioEX1GxJnnr9Tb+sDHF3
         FtSnvmIs7fQgaa2iaIwczVlyk2ecH1Aw6SgbSbK0eUWR46X+J5FeUgHAST5UM21VxBs3
         u26EBwWmJ21ktlUS3U+0lf3acPcDThsgCpbLyS3zWPjbgDTQ1eMVpNFSqXqwTYxZpult
         G9X89TYU8LPNe6iXVpjYxL/JgZkHtpmf0JsbjMhp+JFVMgFMHRAKyiN5trdIpt9JCu88
         q+ecOzkO0QDMvl4OkZm2tTgaEtD+scAZmtojbEjVHcTUcFTMPHMPQH8yOs8hpaRTvg0L
         7nKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730148959; x=1730753759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D1Co9AOGY8fdKgoryciwma41R5B9YqOzlnHWDbIZnus=;
        b=g9pHu4qgUgVPnZHlCAQ1mMSvBYxpexLDTmhuQQ4vCEILSqtwLzirTE4ODT4kLWWQUR
         ZONJ3ezVGQ9U6YKqtuzfHnTnccOtFbTG6H90fbT5vAZpgj9yCby3opE8GeVICNLtFswM
         ylbDzgTU5CjccOpLB+utYj/b9LAAyJbzCMnMHKBdYn4hNxN2NBTI/B00fzr7euLzGFN0
         U/RiyzxMN5YM1PVnTfA92HXBiDT1cDecPNoCpQGx8VHH4zKIyYiuXWEjIiOZrg5LhVcB
         lu/7hojFhfPpHbElEfkADFi140enGDeqDc2gMmKYQnQAFwmndJ4AB4tUqTxObELLuMce
         sw1w==
X-Forwarded-Encrypted: i=1; AJvYcCXErXv/ED14NWTiQZDt9npRoHQzQzUca3f56WL2AqWeMS9kydGuJXu4jHa9NxF8MXmKmEdGxGd2D9U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyuNeVPSMoErzb1j1y/twepx7Dyp/Uz5zI8V0kmsFexwVr6i7zD
	EXjpsvEiEEca8fJc8cIQu1Ecq0dp+1yb9FdNGNJN4wlbJuR7BDOaozgyFmkD8j28VX2GcMlVqPA
	+at/uvHFMfXT6s/6vdeoEx4Zg+p4=
X-Google-Smtp-Source: AGHT+IFlSc2ciu0Xc58PIbp/OChRFrcPGgyTFkp7k6KlRk4Dh7Ar54n7Twps83jufbkvBW1uqmboDam/hWDyvH/TVKQ=
X-Received: by 2002:a05:6a00:4f91:b0:71e:5e9a:2db with SMTP id
 d2e1a72fcca58-72063060a1emr5883473b3a.6.1730148959173; Mon, 28 Oct 2024
 13:55:59 -0700 (PDT)
MIME-Version: 1.0
References: <20241028185141.3756176-1-jani.nikula@intel.com>
In-Reply-To: <20241028185141.3756176-1-jani.nikula@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 28 Oct 2024 16:55:47 -0400
Message-ID: <CADnq5_Mfp+EfSToGVr8A+xXA4X_g6qz+1fgE6uTxMG2rEK=ngg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/xen: remove redundant initialization info print
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2024 at 3:04=E2=80=AFPM Jani Nikula <jani.nikula@intel.com>=
 wrote:
>
> drm_dev_register() already prints the same information on successful
> init. Remove the redundant prints.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

>
> ---
>
> Note: I prefer to merge this together with the next patch via
> drm-misc-next.
>
> Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: xen-devel@lists.xenproject.org
> ---
>  drivers/gpu/drm/xen/xen_drm_front.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xe=
n_drm_front.c
> index aab79c5e34c2..931d855bfbe8 100644
> --- a/drivers/gpu/drm/xen/xen_drm_front.c
> +++ b/drivers/gpu/drm/xen/xen_drm_front.c
> @@ -525,11 +525,6 @@ static int xen_drm_drv_init(struct xen_drm_front_inf=
o *front_info)
>         if (ret)
>                 goto fail_register;
>
> -       DRM_INFO("Initialized %s %d.%d.%d %s on minor %d\n",
> -                xen_drm_driver.name, xen_drm_driver.major,
> -                xen_drm_driver.minor, xen_drm_driver.patchlevel,
> -                xen_drm_driver.date, drm_dev->primary->index);
> -
>         return 0;
>
>  fail_register:
> --
> 2.39.5
>

