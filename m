Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF1A8B8B75
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2024 15:48:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715315.1116852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2AJS-0002dz-Bn; Wed, 01 May 2024 13:47:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715315.1116852; Wed, 01 May 2024 13:47:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2AJS-0002cT-8X; Wed, 01 May 2024 13:47:58 +0000
Received: by outflank-mailman (input) for mailman id 715315;
 Wed, 01 May 2024 13:47:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RAI4=ME=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1s2AJQ-0002cM-RT
 for xen-devel@lists.xenproject.org; Wed, 01 May 2024 13:47:56 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6965ef4b-07c1-11ef-909b-e314d9c70b13;
 Wed, 01 May 2024 15:47:55 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-34da35cd01cso1247709f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 01 May 2024 06:47:55 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 d15-20020adffbcf000000b0034b1bd76d30sm24688229wrs.28.2024.05.01.06.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 May 2024 06:47:54 -0700 (PDT)
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
X-Inumbo-ID: 6965ef4b-07c1-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1714571274; x=1715176074; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NRtw5x79fRbqV4pf16UTLA4er6R06VdHd7ndfBFJApw=;
        b=B/clO00Lm3s/pGVNYYruFyLviDyzVyn5a7zVwQjbWe3zU2Qnz3miT96Eq1agEe0h3+
         ksr4nmm96rqvPh1Lp9YHByc0oxtAcmCnYm+WYxGKOJP50/0eJP19uzdP+BxYafvV/qhA
         2K+IfAwTD0g7ylPpZheXxOjroA1dPCQDUui+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714571274; x=1715176074;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NRtw5x79fRbqV4pf16UTLA4er6R06VdHd7ndfBFJApw=;
        b=oCbCUvdT6guAyP2hVZRGWoSO1DU6J9/R/Fkl0S7Oy5lTiC+4Ux4AWmscxElcU7tFMh
         CNPHGxQ8NdxcJKZomcXhS5gjX48iY/7HwwAZjZrBIAt0Bfn6xwbeWAWWzVSgREtTvjEw
         pN0ZcozhDDvevGxFWUFvG+0984gdHa8STW97sMBeoK7Y6zyUEzSnmbfig2kAUQbbjQMl
         QISgutjHqWja+nwsn39HByY1N3s4grZPaM1HA+MpUY1CY9cjicsKR/k60xYjppbar5T8
         /SffvWxT2SH5KX2eduKdXz2CSN2nud339mYihJPUbq5wKYDPpK7fnPr2xs6GTWu8PJXf
         IEtw==
X-Gm-Message-State: AOJu0Ywuzcb5dDliGvVloQSHFLyG5ghflLPywctonhLWT8oBRLjeXeuI
	sfmFBT80SWb6zQYsr5HwWSqChgk0/kM35jPbLaVIAxhxOS76YMhOWl2XUdRGq7w=
X-Google-Smtp-Source: AGHT+IEwSGHCd8GGkObAIKSeA8QCTrYgxO2jhQyGfc5hLY1cak7d/bebRnkG3Hs202gTq4sqeWgxZA==
X-Received: by 2002:a5d:4d42:0:b0:34d:b43d:6e24 with SMTP id a2-20020a5d4d42000000b0034db43d6e24mr2353184wru.32.1714571274562;
        Wed, 01 May 2024 06:47:54 -0700 (PDT)
Date: Wed, 1 May 2024 14:47:53 +0100
From: Anthony PERARD <anthony.perard@cloud.com>
To: Henry Wang <xin.wang2@amd.com>
Cc: xen-devel@lists.xenproject.org, Vikram Garhwal <fnu.vikram@xilinx.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 04/15] tools/libs/light: Always enable IOMMU
Message-ID: <7336a5a0-9df0-4e90-846f-9c1647ba5319@perard>
References: <20240424033449.168398-1-xin.wang2@amd.com>
 <20240424033449.168398-5-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240424033449.168398-5-xin.wang2@amd.com>

On Wed, Apr 24, 2024 at 11:34:38AM +0800, Henry Wang wrote:
> For overlay with iommu functionality to work with running VMs, we need
> to enable IOMMU when iomem presents for the domains.
> 
> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
> Signed-off-by: Henry Wang <xin.wang2@amd.com>
> ---
>  tools/libs/light/libxl_arm.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index 1cb89fa584..dd5c9f4917 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -222,6 +222,12 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>          config->arch.sve_vl = d_config->b_info.arch_arm.sve_vl / 128U;
>      }
>  
> +#ifdef LIBXL_HAVE_DT_OVERLAY

libxl_arm.c is only build on Arm, so this should be defined, so no need
to check.

> +    if (d_config->b_info.num_iomem) {
> +        config->flags |= XEN_DOMCTL_CDF_iommu;

Is this doing the same thing as the previous patch?

Thanks,

-- 
Anthony PERARD

