Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A42EA0B102
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2025 09:26:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.870468.1281651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXFl6-0007iQ-Gw; Mon, 13 Jan 2025 08:25:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 870468.1281651; Mon, 13 Jan 2025 08:25:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXFl6-0007gp-DQ; Mon, 13 Jan 2025 08:25:16 +0000
Received: by outflank-mailman (input) for mailman id 870468;
 Mon, 13 Jan 2025 08:25:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6oLm=UF=linaro.org=dmitry.baryshkov@srs-se1.protection.inumbo.net>)
 id 1tXFl4-0007gh-R6
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2025 08:25:15 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8fc0850-d187-11ef-a0e1-8be0dac302b0;
 Mon, 13 Jan 2025 09:25:13 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5401bd6cdb4so3753548e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jan 2025 00:25:13 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428bec0659sm1286326e87.185.2025.01.13.00.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 00:25:11 -0800 (PST)
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
X-Inumbo-ID: e8fc0850-d187-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736756713; x=1737361513; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HsOOejTFjVwFwvDCfWyTG69OVT7YoO10LJVJy5N++GA=;
        b=iagtDUSXNw1Q7e1mnXCIJzDIMunFrPSvMkEP4W6KHvqDDCQJs2KcU7D6TcJFsLR6jR
         NeucQIKHJfg+GnJQ4PjbVhEqtmatP7Pk1NAszmc/L0eLRl/sqpckUkohOr8Amo4uvzNw
         NxswZYBVtu433/tMJILhVh0Qe55+p83wK6jZTt8A0OS1Kxu0xIXkumHL53We2nGDSqYQ
         jMLUpjwnoUKkzlVNYIN2bf6gRAY8beD0XQ8lhBBBxz9m+bybCbI/5SSWrv2cH7g7YAkg
         JgoOi+5iT8UacMcA+yPGdNNNsyudFnmmoFmpavFh46X+NFswY7eRFny2I+ezQm6v1Vz+
         Kg/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736756713; x=1737361513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HsOOejTFjVwFwvDCfWyTG69OVT7YoO10LJVJy5N++GA=;
        b=WX7FLrLu0006ZeU8oF6GdrDWq0K5kk1IgoPoGoxcVA4tSk2O2Jmpcms//XhAm891jC
         1a3Yw93htgBImsSSFOdkxgVaSwA/SluTwxIUxJpHdNc1NDSu3kQO1zuzQhaUNMvnPHJX
         dy3aubsyqTlQpzcyXW+0fFfur1bO0vxERcBGLbvFD/PfULXpZ4RkZLpXkZzxH0YOrS87
         lPDv//ZRm7r597BTUvoasTpfQwXAOx9ewB7kxzUxuEDnsmX/4spSyJuPlo1NYvuTxS9t
         vYbIPmbbbfC3iGb343A1Md2F9u3PqqOz591IXJD6Wtb49uVm1txJqsUdj1ILPpEliYo2
         FtmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQt0ZXw8tcxKj0trCKW3qvBa+Qc1GHX7PhNfiSziD5ziil3noSYXXZDId1KmfXiajx0mjbanRkob8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YykY/dotjauv662MmNcbnxRmlEwZv4a5yAWSPb6XBIw3dm1ANW+
	ryfKjL+EQpUllPsKJWKtzYVRL7zklKc2A+rLoIEdtLZHkAOHqPUtLVtGCEBTX58=
X-Gm-Gg: ASbGncs9Z/bB3/8p7GGW9E3EkNUSyjIrYTE3ihVlsqaH5ybwUR5LU8bZHNw1WFY+J/C
	gFGHbtTFLb9r7uXhsSYGYVoOdvD/eRDLbhehCr7uWIL4cBwXnglz2c9EaqFe/KSR9OpXfpPlwUG
	UppUptludBj5BuQ+K/2Bf7NA/Q1W3Izgnxzjpwl753H3ywyaIlTCzWjiAr6j1UDhyVaIIQ8GLtV
	ECSHxLs2kJAP2r/2lOLMLtkfpcG8mcTPQM85JpQU4ogJE4Sv3tK8nKocCrgxFy/ps65Qk6cFccg
	0OHPCg9nam5fx2KekvvPsngeszAZGdQ1xVx5
X-Google-Smtp-Source: AGHT+IERZWZtkZrsbkHThnFiBHKfz//tsYW/urMLTgJODZNi9Tp473Grr1NqQ4M0NySCRCOoV5n3Rw==
X-Received: by 2002:a05:6512:138c:b0:540:2188:763c with SMTP id 2adb3069b0e04-542845b0b55mr6338144e87.37.1736756712614;
        Mon, 13 Jan 2025 00:25:12 -0800 (PST)
Date: Mon, 13 Jan 2025 10:25:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org, 
	virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, 
	intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH v2 13/25] drm/msm: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
Message-ID: <bbw2n4ccn5jlq7q7lsw3xdnbieazgexkwkycrqvk5aoiq5q3wx@nz6gd3unwkg4>
References: <20250109150310.219442-1-tzimmermann@suse.de>
 <20250109150310.219442-14-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109150310.219442-14-tzimmermann@suse.de>

On Thu, Jan 09, 2025 at 03:57:07PM +0100, Thomas Zimmermann wrote:
> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
> buffer size. The hardware requires the scnaline pitch to be a multiple
> of 32 pixels. Therefore compute the byte size of 32 pixels in the given
> color mode and align the pitch accordingly.

- scanline, not scnaline
- the statement about 32-pixel alignment needs an explanation that it is
  being currently handled by align_pitch().

With that in mind:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/msm_gem.c | 27 +++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
> 

-- 
With best wishes
Dmitry

