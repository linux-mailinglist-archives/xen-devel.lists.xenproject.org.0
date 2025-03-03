Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FE3A4C388
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 15:39:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900417.1308338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp6wT-0004u9-6C; Mon, 03 Mar 2025 14:38:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900417.1308338; Mon, 03 Mar 2025 14:38:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp6wT-0004ri-30; Mon, 03 Mar 2025 14:38:49 +0000
Received: by outflank-mailman (input) for mailman id 900417;
 Mon, 03 Mar 2025 14:38:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RjBI=VW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tp6b9-0004ZK-6S
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 14:16:47 +0000
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [2607:f8b0:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 235cf18b-f83a-11ef-9ab2-95dc52dad729;
 Mon, 03 Mar 2025 15:16:46 +0100 (CET)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-223a7065ff8so31165425ad.0
 for <xen-devel@lists.xenproject.org>; Mon, 03 Mar 2025 06:16:46 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-7364ef011c1sm2591656b3a.111.2025.03.03.06.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 06:16:44 -0800 (PST)
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
X-Inumbo-ID: 235cf18b-f83a-11ef-9ab2-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741011405; x=1741616205; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mHyQ1S6OcoiWu2NIhoviRiSzrc0wSkcr90Nm+vU00/w=;
        b=E2u2Kt6g7iaWK0Muhiq/Z5edKa2DFrUBIJkBsoCY1S/kgpL+m8eJAgfUG32fdDyhS6
         xRMIOtU1e/QTYPeZZOGyrWTU9pLZSJ7U96RjX7aqVVGjK5UxHUnF/SANlJZ4oBjfiFjm
         ju3oALIDrmzzNG1N7L3CKND7jRWBOaAyFn3KY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741011405; x=1741616205;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mHyQ1S6OcoiWu2NIhoviRiSzrc0wSkcr90Nm+vU00/w=;
        b=lqr91KFAaR6Rxhwfwgz+++BeTuBxZtaOqJ5jJ9uMk/R+FAnWjXTF28gBa2449uVLyW
         dDyjjE2D4uBt9Aq6A3qZ9uI5vYCSFcuaTP7Nn2MQ4ESJjqCqXZPIPXJmKQ0lTBDla949
         luwD2k09c4942pg4UaoN9Og4Sw1IFiO2qp6xm4MBinDyaOexP6TfNOcpRLXLZYC3IH7L
         d/vVpdmx2zreCg7/OuiabokcybdFqXL7IOV02XRiWwfwH1SS0kRj74ivjsHF5z2+GoNE
         BfPNwSqMcOF+rSOhehGT6A9scwz6OTgI8W9KdFo56oDDbfdO359uHrIF/jwQFt1ScifB
         diGg==
X-Forwarded-Encrypted: i=1; AJvYcCXAn19xzyC7jy8g0TsW494Zoiey+BynC/7vM1JRGz8qJLrK63XG3NCZogkVWkpeb7zLDNB45DsIBmw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxHnJvk74nD2OD2mzfvsIb4Vl1Je8++eC2n4D8ztnKTMT1hXPIp
	wQGnXtsphc54t+HlqXF21i/YhIiEGnBAjvu+UGUM2SAMIT6fX8lIrth3Y117RDU=
X-Gm-Gg: ASbGncudrh0Is5ZDz20wInX1w0bFpxs5Hy5UhHTuDfVILu2bGg8wHm8xWGzjcm8HfVX
	DN0MisJ6AdaX4/Yj9nb21pws0M56/fOGINvEtiR6skmxEWl1xigYiM5oOPJVuFCYC3nMDWPhsFm
	zkdlpyOOOTc3sPhc3AK7kaP1kAJlZIn544dNWwzHHzhBPBUOIlfBW9+r06aCicfcT0bT0uIvwF8
	6wBEnBIqfLeMMA7NDsg7uIL7wNoyuze3cvNfYNDD29DNt+lzaD6l0hGsx0LhLll7q08ygKDeLdh
	uPaSu0acS/YGDf7nIkk0Z/nm6wWA1F086gUfo9jPfoUNL9j61g==
X-Google-Smtp-Source: AGHT+IGoLI4X4aCiq6Qh2tqDp2VFm/jy5ZG2qcvCISc/6H3iGzMjb0RkAikmZjUbfxoQpMD0LN0TIw==
X-Received: by 2002:a05:6a00:ccc:b0:736:48d1:57f7 with SMTP id d2e1a72fcca58-73648d159c8mr7714064b3a.7.1741011405046;
        Mon, 03 Mar 2025 06:16:45 -0800 (PST)
Date: Mon, 3 Mar 2025 15:16:39 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Nirmal Patel <nirmal.patel@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-pci@vger.kernel.org,
	Jonathan Derrick <jonathan.derrick@linux.dev>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v3 2/3] PCI: vmd: Disable MSI remapping bypass under Xen
Message-ID: <Z8W5x73El3aUOs5i@macbook.local>
References: <20250219092059.90850-1-roger.pau@citrix.com>
 <20250219092059.90850-3-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250219092059.90850-3-roger.pau@citrix.com>

Hello Nirmal,

Can I please get an Ack or a request for changes on the patch below
for the VMD controller code?

Thanks, Roger.

On Wed, Feb 19, 2025 at 10:20:56AM +0100, Roger Pau Monne wrote:
> MSI remapping bypass (directly configuring MSI entries for devices on the
> VMD bus) won't work under Xen, as Xen is not aware of devices in such bus,
> and hence cannot configure the entries using the pIRQ interface in the PV
> case, and in the PVH case traps won't be setup for MSI entries for such
> devices.
> 
> Until Xen is aware of devices in the VMD bus prevent the
> VMD_FEAT_CAN_BYPASS_MSI_REMAP capability from being used when running as
> any kind of Xen guest.
> 
> The MSI remapping bypass is an optional feature of VMD bridges, and hence
> when running under Xen it will be masked and devices will be forced to
> redirect its interrupts from the VMD bridge.  That mode of operation must
> always be supported by VMD bridges and works when Xen is not aware of
> devices behind the VMD bridge.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since v2:
>  - Adjust patch subject.
>  - Adjust code comment.
> 
> Changes since v1:
>  - Add xen header.
>  - Expand comment.
> ---
>  drivers/pci/controller/vmd.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/pci/controller/vmd.c b/drivers/pci/controller/vmd.c
> index 9d9596947350..e619accca49d 100644
> --- a/drivers/pci/controller/vmd.c
> +++ b/drivers/pci/controller/vmd.c
> @@ -17,6 +17,8 @@
>  #include <linux/rculist.h>
>  #include <linux/rcupdate.h>
>  
> +#include <xen/xen.h>
> +
>  #include <asm/irqdomain.h>
>  
>  #define VMD_CFGBAR	0
> @@ -970,6 +972,24 @@ static int vmd_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  	struct vmd_dev *vmd;
>  	int err;
>  
> +	if (xen_domain()) {
> +		/*
> +		 * Xen doesn't have knowledge about devices in the VMD bus
> +		 * because the config space of devices behind the VMD bridge is
> +		 * not known to Xen, and hence Xen cannot discover or configure
> +		 * them in any way.
> +		 *
> +		 * Bypass of MSI remapping won't work in that case as direct
> +		 * write by Linux to the MSI entries won't result in functional
> +		 * interrupts, as Xen is the entity that manages the host
> +		 * interrupt controller and must configure interrupts.  However
> +		 * multiplexing of interrupts by the VMD bridge will work under
> +		 * Xen, so force the usage of that mode which must always be
> +		 * supported by VMD bridges.
> +		 */
> +		features &= ~VMD_FEAT_CAN_BYPASS_MSI_REMAP;
> +	}
> +
>  	if (resource_size(&dev->resource[VMD_CFGBAR]) < (1 << 20))
>  		return -ENOMEM;
>  
> -- 
> 2.46.0
> 

