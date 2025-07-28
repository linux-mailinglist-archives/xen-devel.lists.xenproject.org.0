Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0FCB13837
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 11:52:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061175.1426680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugKWM-00008D-EG; Mon, 28 Jul 2025 09:51:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061175.1426680; Mon, 28 Jul 2025 09:51:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugKWM-00005X-Al; Mon, 28 Jul 2025 09:51:50 +0000
Received: by outflank-mailman (input) for mailman id 1061175;
 Mon, 28 Jul 2025 09:51:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=44Jj=2J=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ugKWK-00005P-VJ
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 09:51:48 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 798c1c20-6b98-11f0-b895-0df219b8e170;
 Mon, 28 Jul 2025 11:51:46 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3b7746135acso1876492f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 02:51:46 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b77b82c708sm7368290f8f.80.2025.07.28.02.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 02:51:45 -0700 (PDT)
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
X-Inumbo-ID: 798c1c20-6b98-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753696306; x=1754301106; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tX3mBAh1YSPPbJX7hL013tA42RMuAp00AHMcjtXgIyQ=;
        b=sLP/4MfpVQViv7uzVGCqFHVp3+8tWmbXXa20yFk55p+WFJ9C7uDKASmiv8Snsx6RWy
         ndqJsEIEnrpd2MTtqHgOm09O0+cpTbl69nlUpPIVrjRI7g9Hpv07urNKAXricKOynRUr
         HtzLxxINIr3+tHbTlmnBP/7vtvKQftEpgg+UE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753696306; x=1754301106;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tX3mBAh1YSPPbJX7hL013tA42RMuAp00AHMcjtXgIyQ=;
        b=PG4a4MwCDODdDuPJaNNKm31sWONe3ncWAJl287YEUbmKP4kADam1eYLdPtFb6h7579
         J+bWZ37+kmNVgzpzml+Bgd543MRW+eIp9h8hsik0NUahFpJtGycu+cMwXNA0N/rIqdZm
         scWzxWHGcIf57I8m+jkcnGZ3qdMktoV+IclrEKvY3/mN4r9F6j7XoPLmcjehyDj4SnJ1
         hjx/1w+AQ2dOGtQIt4HHrfyFSpmiyq+VZ91ll762rtLp0eShyuJq/uM/FCSZBuCHK1vi
         QKKrHzZhI0WPxqbQqJkVrHGFxbQ/0zYldRVJdbIulkuUiE6RbcFxya1ll6Gvc4y5y1Mt
         7wuw==
X-Gm-Message-State: AOJu0YwbrIAW/eMaZe177WCVhRLrERLjeav853kAQkuful9Il18g53pk
	Pa3AoBiQevKNvfZLdV4oSNODuiwzucsK30OaBHojrqhmSPUeKeKoG0t0uVPMrLp5Hyk=
X-Gm-Gg: ASbGncsZzcvkaqSn22A96lrqaErfL2J61dmVsw5qo44zYndCJg30aWpeMHoUtAFjOK8
	Go2U8j5WzpndkdJ8K06jKDLDub0cvxpGbWAQ5/8r86xyA0QXoMqn5m7O6evNLeEnJycqF0cWUmm
	vEAl/Z0fODfIzgXUwarrPIvMBQY1E0fKeR5MRG676wt+IkmpiHifwYQih6cP4ThgXOOFepTgFAb
	8EEdaeRQ9fMIH5txdQEFEUV4roA6xI/CnxNvspMuqO+mZIz06yNI/gcQT6nZ9HQTgaVPHlym12z
	Whxt2vV3mmkGT9/li2IJYWhjKi8Li+eOulORmHHOdsM1ZAZoI2iGtxAhbnjFcrKeK1QJq5Cl24N
	uabPfWXiRSdJGJK50PH2lwXwDDPcupcJgmr6jclu7H9az2IW+3Wiv5moUHuvNPImg52e9c81oSD
	fO
X-Google-Smtp-Source: AGHT+IGVhIs+IvqvugUpBXqisv0hVfz+pw9ySdR1XVQuhTk4KrsN0aLGAdL+KJBp8X/iDFPRVY/izw==
X-Received: by 2002:a05:6000:290c:b0:3b7:8880:1817 with SMTP id ffacd0b85a97d-3b78880192bmr2181098f8f.13.1753696306104;
        Mon, 28 Jul 2025 02:51:46 -0700 (PDT)
Date: Mon, 28 Jul 2025 11:51:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1 3/6] vpci: rename and export vpci_bar_add_rangeset
Message-ID: <aIdIMBLXfGwlibj0@macbook.local>
References: <cover.1753450965.git.mykyta_poturai@epam.com>
 <2c7999d1186738a9f57364f127b9fbbbd440ca78.1753450965.git.mykyta_poturai@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2c7999d1186738a9f57364f127b9fbbbd440ca78.1753450965.git.mykyta_poturai@epam.com>

On Fri, Jul 25, 2025 at 02:24:32PM +0000, Mykyta Poturai wrote:
> Export functions required for SR-IOV support.
> 
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
>  xen/drivers/vpci/header.c | 8 ++++----
>  xen/include/xen/vpci.h    | 2 ++
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index f33fb27bde..f947f652cd 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -733,8 +733,8 @@ static void cf_check rom_write(
>      }
>  }
>  
> -static int bar_add_rangeset(const struct pci_dev *pdev, struct vpci_bar *bar,
> -                            unsigned int i)
> +int vpci_bar_add_rangeset(const struct pci_dev *pdev, struct vpci_bar *bar,
> +                          unsigned int i)

Inline from my reply on the BAR register write series, it might be
less wasteful to allocate the ranges per-vCPU rather than per-device.
The only purpose of those rangesets is for BAR mapping, and such
mapping is performed exclusively for each device on a single vCPU.

With that there's probably no need to export this function, as it will
no longer exist.

Thanks, Roger.

