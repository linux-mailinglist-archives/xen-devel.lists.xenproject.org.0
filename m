Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EABA260A0
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 17:55:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880924.1291021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tezj5-0002AI-CA; Mon, 03 Feb 2025 16:55:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880924.1291021; Mon, 03 Feb 2025 16:55:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tezj5-000284-8u; Mon, 03 Feb 2025 16:55:11 +0000
Received: by outflank-mailman (input) for mailman id 880924;
 Mon, 03 Feb 2025 16:55:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q/pT=U2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tezj3-00027y-VE
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 16:55:10 +0000
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [2607:f8b0:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ef79bf0-e24f-11ef-99a4-01e77a169b0f;
 Mon, 03 Feb 2025 17:55:07 +0100 (CET)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2161eb95317so79741125ad.1
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2025 08:55:07 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ad25ee99ba0sm3254637a12.69.2025.02.03.08.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 08:55:05 -0800 (PST)
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
X-Inumbo-ID: 9ef79bf0-e24f-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738601706; x=1739206506; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v2KpaseI45Nf+YKqY6RIuBUK4alheFk9WpjRka6TF4Q=;
        b=AK+4OlbuJ7YqjUf68RxUabuoOfPJC5SIvQlZH5KnFOWx53UmPQrv+1mqIsHVQGaIAa
         sBlKE9dkvI1JkexHAcGFmSu3zeeS5OfJ7HxEDziH1xMPNDNbzUcykaQAd9Qn6nNoGEVU
         2bgaCC3ltQi15rPKeyHI/gJUdFcgzk9QarH7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738601706; x=1739206506;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v2KpaseI45Nf+YKqY6RIuBUK4alheFk9WpjRka6TF4Q=;
        b=tVGJ2rGvcK0+oCohr6Jy8JpeVQWLiDQCFa5qyrob8Uuoyv4MieVc7inMd+IU4HadaD
         Mp6HU3xNd7TunWvS5mtpGx8LUgbq5KmxN/4X5ldBYxRzbYAxi0X1Z1tuwR0NmDiTe9k8
         5QauUWyPWi1g4X7N2s0+iqweRFGIlFPAgYadYHWdIpCuFtHqYKOLX1mq1zdxoCKFSx3e
         MAkcP/N3vWc0UsmeGG1z0zyYdB6LOwAhKDnRuE/WY202gd90t8jw8ZcktKh8BKvzb5ON
         S/Km1zOGBk5YDJC9U4XdQH9j4BUPjhrwegI4iwksqS8IkLT4wNc9jepd/4RfYq10IrU+
         mA1w==
X-Gm-Message-State: AOJu0YzkfAbZY77C8dMUvmvVq7E7gn5giz7PCESsPMp9WWSOyLkblJBf
	bZRvE/EYG3u2JI9j6F5yaREvHlXRy/J3X7l0/vPvATg31PwcomfOtaUsewSgJ3Q=
X-Gm-Gg: ASbGnctqkiLDccbRIoRtdTXjqYl9ddFN3IVDKakQEpO03hqDdhkymA0UankK7qjJZqn
	xJcz7BOz0UESqz70Jh2gsiMLd0TQODQ6LBamrTVpcV6MkpjNxv/01j94wow76qnwWVUzsx+Omom
	y34YQcofQVsO79sR3J/IFlY/uZXRmwPR3pfdPsY9vCVHEKKh1kSrRyJDJMeVJs9E3Pb0jIaNvbe
	U80KoO1svOfNe8pPnI/VF3zi1SA3+fgg3Q9G1DsHZ/aPIvMkm4oI1edj00xaYYAc4tFcH6f5+g1
	2+XdfDsFDitg/1Kr7AFH
X-Google-Smtp-Source: AGHT+IH5mEMttI3SAXm96FWOxoxVzNeiMW62EIWPxq8BKjgshf71eRVaYzC4lv05pvlOMVxj/1DkDg==
X-Received: by 2002:a17:902:d587:b0:216:18f9:528b with SMTP id d9443c01a7336-21dd7da40b9mr341821335ad.26.1738601706273;
        Mon, 03 Feb 2025 08:55:06 -0800 (PST)
Date: Mon, 3 Feb 2025 17:54:59 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v2 for-4.20? 1/6] AMD/IOMMU: drop stray MSI enabling
Message-ID: <Z6D04wwl3SRIRuEJ@macbook.local>
References: <30f29dde-15e1-4af9-b86f-0040658c381a@suse.com>
 <a5fc316b-bcd6-4570-a997-0cd15273da9f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a5fc316b-bcd6-4570-a997-0cd15273da9f@suse.com>

On Mon, Feb 03, 2025 at 05:24:10PM +0100, Jan Beulich wrote:
> While the 2nd of the commits referenced below should have moved the call
> to amd_iommu_msi_enable() instead of adding another one, the situation
> wasn't quite right even before: It can't have done any good to enable
> MSI when no IRQ was allocated for it, yet.
> 
> The other call to amd_iommu_msi_enable(), just out of patch context,
> needs to stay there until S3 resume is re-worked. For the boot path that
> call should be unnecessary, as iommu{,_maskable}_msi_startup() will have
> done it already (by way of invoking iommu_msi_unmask()).
> 
> Fixes: 5f569f1ac50e ("AMD/IOMMU: allow enabling with IRQ not yet set up")
> Fixes: d9e49d1afe2e ("AMD/IOMMU: adjust setup of internal interrupt for x2APIC mode")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> Tested-by: Jason Andryuk <jason.andryuk@amd.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

