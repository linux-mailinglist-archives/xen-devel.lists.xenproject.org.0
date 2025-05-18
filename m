Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A22ABAED9
	for <lists+xen-devel@lfdr.de>; Sun, 18 May 2025 10:58:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.988892.1373303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGZqC-0004ML-HS; Sun, 18 May 2025 08:57:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 988892.1373303; Sun, 18 May 2025 08:57:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGZqC-0004JD-ER; Sun, 18 May 2025 08:57:52 +0000
Received: by outflank-mailman (input) for mailman id 988892;
 Sun, 18 May 2025 08:57:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GB/u=YC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uGZqB-0004J7-Mw
 for xen-devel@lists.xenproject.org; Sun, 18 May 2025 08:57:51 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2be8bbd4-33c6-11f0-9ffb-bf95429c2676;
 Sun, 18 May 2025 10:57:48 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-ad560321ed9so52046066b.1
 for <xen-devel@lists.xenproject.org>; Sun, 18 May 2025 01:57:48 -0700 (PDT)
Received: from [172.18.118.114] (ip-185-104-138-24.ptr.icomera.net.
 [185.104.138.24]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d498747sm416150366b.137.2025.05.18.01.57.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 May 2025 01:57:47 -0700 (PDT)
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
X-Inumbo-ID: 2be8bbd4-33c6-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747558668; x=1748163468; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kz7f1C2I6AGys/C5VOBEZ9aH2iob1WrVwTpTuQEnu1g=;
        b=HIp5ceYxpIC2YqyAplrxTYgElEmyepZIFO0+JmTJKF5JySMq87uf/r2Inyk9L+GYFK
         BJ/Me/biYf4q8Agm8QGZscddrWsjmWdTy2uwpKyL80VtgxNKoQ32kPaOWFBIwGGODghh
         r41ftTi994MGW9/e8zloQxSTq3cQCVehKsNstao3SPF6oGgKyfQAVfadaWlhRlqDU1o2
         rzaQm11vsadte5vvUfaSj33jiLRLvOqNG5Twd2icx0gXeWGNnwgrjbZ1x6dvj5PEwutS
         0IaZk+43ICeOE6ExOpF8wu7yj6/Ac57DEouZzek5M5VL3sHe+dFJcxbxgdwghKTD8Po2
         sqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747558668; x=1748163468;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kz7f1C2I6AGys/C5VOBEZ9aH2iob1WrVwTpTuQEnu1g=;
        b=FQlHK06XT/7JCnw+C9SlHnsxkjnD3MBntUyYY3CkMOnESeNLmhfH9JRuCnr+dR7inK
         PsIPwdWSVI3aotjIDupoE34eIeLGFKo72AJKpnfdPUREEGWso4bhfC5qcLT0Pxzu19me
         3a8aIz7778ZH3UrcV0Y5mcBewRUWWoTg0OOdezSIf4xqlg/ouotfme+j0WaRX9w69TZt
         Tr8e8e4LMhTIWhnVAeOhhd+AHXh/AHZj9CVnHws8hCoYMPEvzoEiXuIrGruzAVcxgjQG
         pgxRbSxifmrdTlH53hvO7V6M8QuZg5NHGrOlwkpIoDzHe8vPQNdksX3M0iWTkCjeP4BC
         d6Sg==
X-Forwarded-Encrypted: i=1; AJvYcCWfmwyjdItiGNRtTcG3f0PlDegbLclC33dKBuxBZBBj72/KQImY+UJZcBE3m4FOF0gnEM5mcgwc4P4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx7zRcFaW2pVD2ZbR7dingYUgqTDEr/9Xm29QsxzBvPrZ/cqDld
	oexap4DPhjwe8c4uC05tM++ea3G3g4YBVmX8B+VnCKzj2RcJdMpWkJjUV8q8HykvgQ==
X-Gm-Gg: ASbGncvCU+QW14197jp1J1LWGbBOv7gxfrs5PE7NpWePOqUcNMDwpSdAWCgJjd2wEIc
	CkPtV3wgUpSITTe9mndsy4hBNqwfTvubT3ewj/06cmy8jermJKHCtbyuDWuvhTqYC7hUVVThbdE
	8AOXci204ntpWnq2X4MI4bQYJq+6LGS2v+HOsTPyY9RoEyFaJNYEH7s4wqGYhpuTnakkhTKnIe6
	qaGDgKgJvyhrV1u0WdH3IhiznWbtb7vq9zSjej6MvDxI0lVpz+FVvAnXc5AhWJZ+A231AijgzVb
	6sGkIaMWln3xNxOqfy6IY4K2mCVrXWd1Ge3InLaLM6O4XVjxswcIypq7CUIsWMV1X4kTzZuecHb
	3lCKKDQ5vI844r1H3Onf2Sqc8
X-Google-Smtp-Source: AGHT+IGis5/2Fy94dOE0bzoO//MlEp19t3QCpX/GEXA4BCqLUSkXOxToXkttCKwPpnwaQFPvqfx+IQ==
X-Received: by 2002:a17:906:c113:b0:ad5:6174:f944 with SMTP id a640c23a62f3a-ad56174fb0amr185603466b.50.1747558667720;
        Sun, 18 May 2025 01:57:47 -0700 (PDT)
Message-ID: <bbbf5488-e501-4e1d-8eff-c703e55f4456@suse.com>
Date: Sun, 18 May 2025 10:57:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] xen/domain: adjust domain ID allocation for Arm
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250516020434.1145337-1-dmukhin@ford.com>
 <20250516020434.1145337-3-dmukhin@ford.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20250516020434.1145337-3-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.05.2025 04:04, dmkhn@proton.me wrote:
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -85,7 +85,7 @@ void __init domid_init(void)
>   *
>   * If hint is outside of valid [0..DOMID_FIRST_RESERVED - 1] range of IDs,
>   * perform an exhaustive search starting from the end of the used domain ID
> - * range.
> + * range, excluding get_initial_domain_id() ID.
>   */
>  domid_t domid_alloc(domid_t domid)
>  {
> @@ -103,6 +103,9 @@ domid_t domid_alloc(domid_t domid)
>              if ( domid == DOMID_FIRST_RESERVED )
>                  domid = 0;
>  
> +            if ( domid == get_initial_domain_id() )
> +                continue;
> +
>              if ( !rangeset_contains_singleton(domid_rangeset, domid) )
>                  break;
>          }

Isn't there a (perhaps even pre-existing) issue here with a DomU potentially
getting ID 0 assigned when get_initial_domain_id() returns non-zero?

Jan

