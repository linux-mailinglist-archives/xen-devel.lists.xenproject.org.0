Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AB18BAE57
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2024 16:01:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716486.1118636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2tTf-0007mu-Ht; Fri, 03 May 2024 14:01:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716486.1118636; Fri, 03 May 2024 14:01:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2tTf-0007kz-DS; Fri, 03 May 2024 14:01:31 +0000
Received: by outflank-mailman (input) for mailman id 716486;
 Fri, 03 May 2024 14:01:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZLhg=MG=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s2tTd-0007kg-VP
 for xen-devel@lists.xenproject.org; Fri, 03 May 2024 14:01:29 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a38481c2-0955-11ef-909c-e314d9c70b13;
 Fri, 03 May 2024 16:01:29 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-34d8d11a523so2207482f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2024 07:01:29 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 cx14-20020a056000092e00b0034a2d0b9a4fsm3864981wrb.17.2024.05.03.07.01.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 07:01:28 -0700 (PDT)
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
X-Inumbo-ID: a38481c2-0955-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714744889; x=1715349689; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A9cDuwhBHs1gnvDfwUBcGu+H7/TOZIK+IHm/APTdY5U=;
        b=ObuA4q4S0hgxw8NQ/S/mo/Wz5eOHmEGmAbNb2raodQO3kiT83efn+TOobDdZ9QEgzp
         5a86Z+CqhTEjc3tnfLhi6exXd1KmESwAMuKMFpURzq9sDZN24PCWAhdq7x8SMk+CwQ2m
         nQmGWTC4EhWz+Q/qNz+8bbrJv63FXzp9e3mxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714744889; x=1715349689;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A9cDuwhBHs1gnvDfwUBcGu+H7/TOZIK+IHm/APTdY5U=;
        b=aLTkid7XeVv1wA43dp7/3CHrld0ovA65c5qjG/vX5Kt8TZu58XDhtE/brKlwjfJhmn
         UJBbFjsvwH7PAYhkKrLNizfqa1NeBEPgvHgYgTO3D9JTvNMrQ0Sh/mcnceBYMWRvtg36
         MkfwrH2/5zsKB9hWGqT4C8NPZqf+03yqmVbWSIN7/4Ava79NbUJTMMFbuLanAsQDSbGC
         70+DxcbfKehmbWx/Uw6xFeAwbGdJIdQy07+iQ4K+rQDb49HnzcpPpLNNDywkUbKdrW00
         QGQLKjFuSvl6yjrHJcFFKtQh6NZh5zJvawtvsqc1vYmRo/hq3vUJDWSSvrFx8QiTy3LV
         NZsQ==
X-Gm-Message-State: AOJu0YwYe5TutgzzsqRBAU9TPyHhF76RXWQLQ3++2dHaQvvWIq3HxG8X
	5ESNr9bHwdNaUP+81fL1LtXM8CD8oohx3gGKxdav8WKK0EyGD9gWUoCyGNqj190=
X-Google-Smtp-Source: AGHT+IF/ileQ8zUAa2ZSVXa2HqDO9W+DmPGx0vnvkkUXGIOlD6ppabL47IYCGrvgHyno0BxDv/3VMg==
X-Received: by 2002:a5d:4690:0:b0:34d:91d:8f93 with SMTP id u16-20020a5d4690000000b0034d091d8f93mr2051359wrq.47.1714744888738;
        Fri, 03 May 2024 07:01:28 -0700 (PDT)
Date: Fri, 3 May 2024 16:01:27 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2 01/12] VT-d: correct ATS checking for root complex
 integrated devices
Message-ID: <ZjTuN8Ydh0pVCoNZ@macbook>
References: <64b028be-2197-4951-ae5b-32f9eabfa84a@suse.com>
 <3686dae7-e005-47b5-9235-14208a68eec5@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3686dae7-e005-47b5-9235-14208a68eec5@suse.com>

On Thu, Feb 15, 2024 at 11:13:24AM +0100, Jan Beulich wrote:
> Spec version 4.1 says
> 
> "The ATSR structures identifies PCI Express Root-Ports supporting
>  Address Translation Services (ATS) transactions. Software must enable
>  ATS on endpoint devices behind a Root Port only if the Root Port is
>  reported as supporting ATS transactions."
> 
> Clearly root complex integrated devices aren't "behind root ports",
> matching my observation on a SapphireRapids system having an ATS-
> capable root complex integrated device. Hence for such devices we
> shouldn't try to locate a corresponding ATSR.
> 
> Since both pci_find_ext_capability() and pci_find_cap_offset() return
> "unsigned int", change "pos" to that type at the same time.
> 
> Fixes: 903b93211f56 ("[VTD] laying the ground work for ATS")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> v2: New.
> 
> --- a/xen/drivers/passthrough/vtd/x86/ats.c
> +++ b/xen/drivers/passthrough/vtd/x86/ats.c
> @@ -44,7 +44,7 @@ struct acpi_drhd_unit *find_ats_dev_drhd
>  int ats_device(const struct pci_dev *pdev, const struct acpi_drhd_unit *drhd)
>  {
>      struct acpi_drhd_unit *ats_drhd;
> -    int pos;
> +    unsigned int pos, expfl = 0;
>  
>      if ( !ats_enabled || !iommu_qinval )
>          return 0;
> @@ -53,7 +53,12 @@ int ats_device(const struct pci_dev *pde
>           !ecap_dev_iotlb(drhd->iommu->ecap) )
>          return 0;
>  
> -    if ( !acpi_find_matched_atsr_unit(pdev) )
> +    pos = pci_find_cap_offset(pdev->sbdf, PCI_CAP_ID_EXP);
> +    if ( pos )
> +        expfl = pci_conf_read16(pdev->sbdf, pos + PCI_EXP_FLAGS);
> +
> +    if ( MASK_EXTR(expfl, PCI_EXP_FLAGS_TYPE) != PCI_EXP_TYPE_RC_END &&
> +         !acpi_find_matched_atsr_unit(pdev) )

Given the spec quote above, it might also be helpful to check that the
type is PCI_EXP_TYPE_ENDPOINT before attempting the ATSR check?

I would assume a well formed ATSR won't list non-endpoint devices.

Thanks, Roger.

