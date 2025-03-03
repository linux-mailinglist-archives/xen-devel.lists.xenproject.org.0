Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0773DA4C2E8
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 15:10:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900308.1308218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp6Up-00033U-4f; Mon, 03 Mar 2025 14:10:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900308.1308218; Mon, 03 Mar 2025 14:10:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp6Up-00030K-1U; Mon, 03 Mar 2025 14:10:15 +0000
Received: by outflank-mailman (input) for mailman id 900308;
 Mon, 03 Mar 2025 14:10:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RjBI=VW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tp6Un-00030B-UL
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 14:10:13 +0000
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [2607:f8b0:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3324aa02-f839-11ef-9898-31a8f345e629;
 Mon, 03 Mar 2025 15:10:03 +0100 (CET)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-22382657540so33697295ad.2
 for <xen-devel@lists.xenproject.org>; Mon, 03 Mar 2025 06:10:03 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-223504c59ecsm78050255ad.123.2025.03.03.06.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 06:10:01 -0800 (PST)
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
X-Inumbo-ID: 3324aa02-f839-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741011002; x=1741615802; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V7YKNbEtCKvClNkv4j7sl0onkgyhRRhalJ9m3Tg6rXY=;
        b=WzKZD9wj3hXL+M3eLAvl5yX0HyIggiuqatxTJtiuLwW0K8MjgJ4CE6CDyqAKWP8Dps
         zwfmRx/InSX/CnAKjqurTFVjjlKjTeoCP9bIbgp9xpV2kXYKy0RT/OauFS041H0Bmq69
         xbQYsfgZ6UFhCaVmSivwzt7DnIITZlQdRxhdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741011002; x=1741615802;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V7YKNbEtCKvClNkv4j7sl0onkgyhRRhalJ9m3Tg6rXY=;
        b=utB5sApI6mbaJ4DKiBFRWhlz+JRcygdaX011yE/l9Vv67GEyfGJ2B8t9/I7u6gBsjK
         5Y3nt/KSF8FQ+wKSLNuQ6pPu4DjH9kHlIwd2fAvExHQJgPBoWVk3iSEJKYSYCC4dVJ/r
         KAWnsNlWuP8LnbnTNGRS6f/fVogGlvUh3rhIBS7nWHfknHUIB0QHN+OSLcZSJP7pvqMD
         vkImXsI2qk6UTcFGkdTwsB1p8Ub4iXrUTffiX1J2kgqqGd5b18f6NGnB0ra0uMNiuuWW
         V2Tlbk2MoqYI/jBdCeEf8CpAQrV27lI9dCBX0FIw+c01ux11THUrIjqLx3nsW67BmqW8
         fThA==
X-Gm-Message-State: AOJu0YxbFZqiQLp06XoXjhuc6SVm+MQWDP88Gq8/eOCZ/Z54Ek4DIV7X
	VX99luHsZnUn/c+lgd667WnSUfOJUbppN8i1sLU1ii7ae170kxpovWaWv+pVtpc=
X-Gm-Gg: ASbGnctl2VnkTUMFf9FIRD138I/sc5SUoAGeWqYqGfRYEN1sm4w/emnoCqeCHMN32fP
	9fDJvQ5Ysahv5Lzr7mjByStxO8ljuci+LvCFckO+Aa9spnOtUAO2SS+5qNed0fHuKiSlGYYxilj
	/dwbVOWzSebeO2+kYjPvINrkWDbNk7NlsFnegaNRHUo27f19FomBjcUXt+N+X+ft6tzAu1wkSut
	wuSpQDIxv3y+msg6DQBd2VYfCr/e6GhtBzeiBybWOlVef+MZW+9JTQJESqEaiphah40Xb4Tmqnf
	9HqlIzxih75ArWEbnkmI4QmBcjmi8T6UE//jKobQWjNiPpkVAg==
X-Google-Smtp-Source: AGHT+IHdi3g63gaWHlIVQu9lRtjgXka95xcFxI8zloNtmzxwHce3eGClSLZMzP4IMq3gadZTdblRGw==
X-Received: by 2002:a17:903:1b2c:b0:223:225a:7e4d with SMTP id d9443c01a7336-22368fba9efmr253404025ad.26.1741011002000;
        Mon, 03 Mar 2025 06:10:02 -0800 (PST)
Date: Mon, 3 Mar 2025 15:09:56 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: Re: [PATCH v9] vpci: Add resizable bar support
Message-ID: <Z8W4NFdcK1kuAH5q@macbook.local>
References: <20250224032433.1879630-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250224032433.1879630-1-Jiqian.Chen@amd.com>

On Mon, Feb 24, 2025 at 11:24:33AM +0800, Jiqian Chen wrote:
> Some devices, like AMDGPU, support resizable bar capability,
> but vpci of Xen doesn't support this feature, so they fail
> to resize bars and then cause probing failure.
> 
> According to PCIe spec, each bar that supports resizing has
> two registers, PCI_REBAR_CAP and PCI_REBAR_CTRL. So, add
> handlers to support resizing the size of BARs.
> 
> Note that Xen will only trap PCI_REBAR_CTRL, as PCI_REBAR_CAP
> is read-only register and the hardware domain already gets
> access to it without needing any setup.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>

Reviewed-by: Roger Pau Monné <roger.pau@cirtrix.com>

Just one question below about a cosmetic adjustment.

> diff --git a/xen/include/xen/pci_regs.h b/xen/include/xen/pci_regs.h
> index 250ba106dbd3..2f1d0d63e962 100644
> --- a/xen/include/xen/pci_regs.h
> +++ b/xen/include/xen/pci_regs.h
> @@ -459,6 +459,7 @@
>  #define PCI_EXT_CAP_ID_ARI	14
>  #define PCI_EXT_CAP_ID_ATS	15
>  #define PCI_EXT_CAP_ID_SRIOV	16
> +#define PCI_EXT_CAP_ID_REBAR	21	/* Resizable BAR */
>  
>  /* Advanced Error Reporting */
>  #define PCI_ERR_UNCOR_STATUS	4	/* Uncorrectable Error Status */
> @@ -541,6 +542,20 @@
>  #define  PCI_VNDR_HEADER_REV(x)	(((x) >> 16) & 0xf)
>  #define  PCI_VNDR_HEADER_LEN(x)	(((x) >> 20) & 0xfff)
>  
> +/* Resizable BARs */
> +#define PCI_REBAR_CAP(n)	(4 + 8 * (n))	/* capability register */
> +#define  PCI_REBAR_CAP_SIZES_MASK	0xFFFFFFF0U	/* supported BAR sizes in CAP */
> +#define PCI_REBAR_CTRL(n)	(8 + 8 * (n))	/* control register */
> +#define  PCI_REBAR_CTRL_BAR_IDX		0x00000007	/* BAR index */
> +#define  PCI_REBAR_CTRL_NBAR_MASK	0x000000E0	/* # of resizable BARs */
> +#define  PCI_REBAR_CTRL_BAR_SIZE	0x00003F00	/* BAR size */
> +#define  PCI_REBAR_CTRL_SIZES_MASK	0xFFFF0000U	/* supported BAR sizes in CTRL */
> +
> +#define PCI_REBAR_CTRL_SIZE_BIAS	20
> +#define PCI_REBAR_CTRL_SIZE(v) \
> +    (1ULL << (MASK_EXTR(v, PCI_REBAR_CTRL_BAR_SIZE) \
> +                      + PCI_REBAR_CTRL_SIZE_BIAS))

I think this could fit on a single line if the indent was just 4
spaces.  Would you mind me adjusting it at commit if it fits?

Thanks, Roger.

