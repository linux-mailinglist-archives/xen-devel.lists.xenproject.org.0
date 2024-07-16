Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F75C932EDB
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2024 19:07:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759750.1169422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTldB-0008UQ-VS; Tue, 16 Jul 2024 17:06:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759750.1169422; Tue, 16 Jul 2024 17:06:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTldB-0008St-SU; Tue, 16 Jul 2024 17:06:25 +0000
Received: by outflank-mailman (input) for mailman id 759750;
 Tue, 16 Jul 2024 17:06:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QAbl=OQ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sTldA-0008Sl-L0
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2024 17:06:24 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9e39078-4395-11ef-8776-851b0ebba9a2;
 Tue, 16 Jul 2024 19:06:22 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a77ec5d3b0dso706712866b.0
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jul 2024 10:06:22 -0700 (PDT)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a79bc820d21sm332258366b.198.2024.07.16.10.06.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jul 2024 10:06:21 -0700 (PDT)
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
X-Inumbo-ID: b9e39078-4395-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1721149581; x=1721754381; darn=lists.xenproject.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XEJQDdo1M2AqTHAWo1JbbM8esmJyNYJoLt/m8CbDuHQ=;
        b=f16cpN0nWFiwxhMStpP9HHaMzMO3tnoLHaEYy3IhyK3dZSyrtA4ojY76e49Qx5Ylf4
         +lwWiWbxR1FsSo8saQhlr00DYg1gjWF9yi24poTitNONn/KyALgW423a1TUh/oon+mqo
         xwOWj6Yhi6mJazXVrknxQSiC4sgUxsgVPflRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721149581; x=1721754381;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XEJQDdo1M2AqTHAWo1JbbM8esmJyNYJoLt/m8CbDuHQ=;
        b=R3gCitV3i6ihHhtSQ1scstJ/D3/+IT1IleSA5UpELywcQZawDK9dmfHZrYu6TaYsry
         6XppTou+XjNtvgxVQ5hFuQHgRbhQGGcfImT3KKsSXt9Uzv7JysUx5281vvTQc/Q3iwd6
         uQk79O1WAGM/0pKHOJ4CNu0OwN+G2eTtYIImzISto1oMUdO8zDFXEpYb47vSc8FdJRG/
         tmWvziXJkyAvIWMr8+xbWkCFEN/ps+e1BWPnyP5BmgLV7MUzYxxODNKNDTUHuMhXdatW
         krrg9scYu6wvZtlaqx3hzhc1P5LoFcO7abFbTeyuSDN9fNgwgT8yVnEv5M2eagNFMpR1
         T4Sg==
X-Forwarded-Encrypted: i=1; AJvYcCU+4PcpeTG7g3lA+B5d97PMc1+t/VBlcf8bm88/981DN00RSDe/Cde6PwaSCouw1C7snmWjJphqipRrdFdrbONN+73s6E/9R/bk9YtglhQ=
X-Gm-Message-State: AOJu0Yy4FO2GUDkOlwU1InknUCyYaBptg7dnpISIeJcyy8MxL0hFj8SA
	HXatpat/LHOuM8UJqkGyn0necbUZ2D0XWHM2B2NiERsmWIUVC6UQo5GnQOzEPqI=
X-Google-Smtp-Source: AGHT+IFADlBGBu+1L40iTqzAH4RopYDOtsJvm7fxMvlA3moMZlLBUCQZwx5FhdFk/DbLI74zu2iQkg==
X-Received: by 2002:a17:906:ecac:b0:a77:a415:f815 with SMTP id a640c23a62f3a-a79ea43accbmr202978066b.20.1721149581441;
        Tue, 16 Jul 2024 10:06:21 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jul 2024 18:06:18 +0100
Message-Id: <D2R4LSZFGQYM.YRUCHYZPEB67@cloud.com>
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Elias El Yandouzi" <eliasely@amazon.com>,
 <xen-devel@lists.xenproject.org>
Cc: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, "Wei Liu"
 <wei.liu2@citrix.com>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Wei Wang" <wawei@amazon.de>, "Hongyan Xia"
 <hongyxia@amazon.com>, "Julien Grall" <jgrall@amazon.com>
Subject: Re: [PATCH V3 (resend) 04/19] x86: Lift mapcache variable to the
 arch level
X-Mailer: aerc 0.17.0
References: <20240513134046.82605-1-eliasely@amazon.com>
 <20240513134046.82605-5-eliasely@amazon.com>
In-Reply-To: <20240513134046.82605-5-eliasely@amazon.com>

On Mon May 13, 2024 at 2:40 PM BST, Elias El Yandouzi wrote:
> From: Wei Liu <wei.liu2@citrix.com>
>
> It is going to be needed by HVM and idle domain as well, because without
> the direct map, both need a mapcache to map pages.
>
> This commit lifts the mapcache variable up and initialise it a bit earlie=
r
> for PV and HVM domains.
>
> Signed-off-by: Wei Liu <wei.liu2@citrix.com>
> Signed-off-by: Wei Wang <wawei@amazon.de>
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
>
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index 20e83cf38b..507d704f16 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -851,6 +851,8 @@ int arch_domain_create(struct domain *d,
> =20
>      psr_domain_init(d);
> =20
> +    mapcache_domain_init(d);
> +

I think this is missing free_perdomain_mappings() in the error case. (error
handling is already committed).

Can't the callee jump to a "fail" label and do free_perdomain_mappings()
internally?

Cheers,
Alejandro

