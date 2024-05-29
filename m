Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBFF8D3799
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 15:29:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731913.1137679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCJMH-0001Hn-5g; Wed, 29 May 2024 13:28:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731913.1137679; Wed, 29 May 2024 13:28:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCJMH-0001GH-31; Wed, 29 May 2024 13:28:49 +0000
Received: by outflank-mailman (input) for mailman id 731913;
 Wed, 29 May 2024 13:28:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U3iI=NA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sCJMF-0001GB-4i
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 13:28:47 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 601acb56-1dbf-11ef-90a1-e314d9c70b13;
 Wed, 29 May 2024 15:28:46 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-52aea6067c8so802262e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 06:28:46 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-579d7276d95sm3726512a12.78.2024.05.29.06.28.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 May 2024 06:28:45 -0700 (PDT)
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
X-Inumbo-ID: 601acb56-1dbf-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716989325; x=1717594125; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gXmr6j/tvonQwkWDxBgodd8VSD2h8lNR4zZeNwuG1Go=;
        b=UTvwRpNuNy/KP6pChpMwQDUORi6+BxJGlj9NpCZ2VW2NxqoCyP3MeZQc4eflWa8a3V
         BXAi1k5q2REgFBLphOCl20x/aee9cqf31iclWDzygS1Rb11Ofpz13C+QlcyMRS6QY3iY
         8cyVXfD89CuJuBDFzkFmqjjDVv9i/4K4PQEKLVcSPMoS6ykOSyBHe0yqizocghwSDCWT
         tMiebrGZ1EuDNnYLdSWF98ePpUnjJQlS2B7c+hZ7bT+hrgMUwWrB5hC1NJRkwNHHuwAm
         kL36ZpCy7sv1/fpzRlT+XfUYabsAsWZuDHWKK5Nmx/S6D25HBxJPUbtWReFJyObM4oxA
         iyuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716989325; x=1717594125;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gXmr6j/tvonQwkWDxBgodd8VSD2h8lNR4zZeNwuG1Go=;
        b=l2UHBm04caYXqRCx7QhxaBaOtLaXJhfg4plS82yKIGlim5e2ZkDFNlVUjCPgGNJzOR
         WoxZh1MfNPYkIP80VvcOFNoxl3RLR9UzFFSThszDLzfXPL3+YrHGuc6TWp/g91YfPFFe
         Uiov1YQQH3cfBPS4kHpgs4FmAifrx2dDod/gNE0eh1D175y/rMtR1jjVFwnBiLXHCl8m
         Yl5g+eIj0OzLUx+S5xlWlI9/9vtkYyVE62j6spCSt47lucdLDdY0tFmmcC12CgfuuP7t
         hskqlq+sQLZ/Va4XpN3RvXd3+GG6rloS8i5kVWfNJan+Vlr9fPZzYcLGjd/wqXDQ9BI5
         x0Dw==
X-Forwarded-Encrypted: i=1; AJvYcCUb8drI2Mf31CdiJ+RfARXOEZaYEahEWp27H0+x2Xfol/yv+A9+QJpcmxApn1fNmPxlzqIkD7XGkRVpogHRs6nWqlFZpW/jk5p4gVOCOPc=
X-Gm-Message-State: AOJu0YyW49By3Wjoz+dl67Q9SRAnAqQWdb8la/OIvLaDColPzYAtdkLt
	YWo41tiUKLL6QNoxNB0I17KvpUekNMQxMnR166syQFDFPH/0ypQQPUvwRjyILz4=
X-Google-Smtp-Source: AGHT+IEq5J35jp5oyjSaT4U2EpNtDbrlLRiwcYvKIzo9K+RuuN07fUdxYFnLzwmPTjwExZKBrEuQig==
X-Received: by 2002:a05:6512:1042:b0:529:a389:f6a6 with SMTP id 2adb3069b0e04-529a389f747mr9715451e87.67.1716989325376;
        Wed, 29 May 2024 06:28:45 -0700 (PDT)
Message-ID: <2095a4a2-7db5-4de6-9609-d8e6a5adf27f@suse.com>
Date: Wed, 29 May 2024 15:28:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/xenbus: handle pointer to NULL in alloc/free_pdev
To: yskelg@gmail.com, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: skhan@linuxfoundation.org, sj@kernel.org,
 Austin Kim <austindh.kim@gmail.com>, shjy180909@gmail.com,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20240529131926.29590-1-yskelg@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240529131926.29590-1-yskelg@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29.05.24 15:19, yskelg@gmail.com wrote:
> From: Yunseong Kim <yskelg@gmail.com>
> 
> Modify 'alloc_pdev()' to set 'pdev->xdev' to NULL
> if 'xen_pcibk_init_devices()' fails. This ensures that 'pdev->xdev' does
> not point to 'xdev' when 'pdev' is freed.
> And modify 'free_pdev()' to set 'pdev' to NULL.
> 
> Signed-off-by: Yunseong Kim <yskelg@gmail.com>
> ---
>   drivers/xen/xen-pciback/xenbus.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/xen/xen-pciback/xenbus.c b/drivers/xen/xen-pciback/xenbus.c
> index b11e401f1b1e..f1709b8e284a 100644
> --- a/drivers/xen/xen-pciback/xenbus.c
> +++ b/drivers/xen/xen-pciback/xenbus.c
> @@ -54,6 +54,7 @@ static struct xen_pcibk_device *alloc_pdev(struct xenbus_device *xdev)
>   	INIT_WORK(&pdev->op_work, xen_pcibk_do_op);
>   
>   	if (xen_pcibk_init_devices(pdev)) {
> +		pdev->xdev = NULL;
>   		kfree(pdev);
>   		pdev = NULL;
>   	}
> @@ -102,6 +103,7 @@ static void free_pdev(struct xen_pcibk_device *pdev)
>   	pdev->xdev = NULL;
>   
>   	kfree(pdev);
> +	pdev = NULL;
>   }
>   
>   static int xen_pcibk_do_attach(struct xen_pcibk_device *pdev, int gnt_ref,

NAK!

Please stop that nonsense. NULL-ing pointers which have no chance to be used any
more is just adding code for no purpose at all.

Please don't send other iterations of this patch. You are wasting review
bandwidth.


Juergen

