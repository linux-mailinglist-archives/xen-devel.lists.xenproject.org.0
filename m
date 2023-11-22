Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 094EB7F44B2
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 12:07:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638689.995549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5l4u-0006vq-H2; Wed, 22 Nov 2023 11:07:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638689.995549; Wed, 22 Nov 2023 11:07:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5l4u-0006tC-E1; Wed, 22 Nov 2023 11:07:32 +0000
Received: by outflank-mailman (input) for mailman id 638689;
 Wed, 22 Nov 2023 11:07:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CF+8=HD=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r5l4s-0006t6-P4
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 11:07:30 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53e0f46c-8927-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 12:07:30 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-507bd19eac8so8703406e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 22 Nov 2023 03:07:29 -0800 (PST)
Received: from [192.168.69.100] (pas38-h02-176-184-5-64.dsl.sta.abo.bbox.fr.
 [176.184.5.64]) by smtp.gmail.com with ESMTPSA id
 v11-20020adfe28b000000b0032d09f7a713sm16962331wri.18.2023.11.22.03.07.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Nov 2023 03:07:29 -0800 (PST)
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
X-Inumbo-ID: 53e0f46c-8927-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700651249; x=1701256049; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hNxDhhCIH8NlpH8XHPURRCmGBLxe0AMGsttC4hlkS4g=;
        b=Wo4LxOWf5s/ovtYHF3hoscdzqoagmmUNwQfOOA/ia6vsVRbJPW5NGVs0uVqMXCN/wE
         +nshJWiYZKyMICEXT8Dw/arkZgu+g5AuFdDM7jvndK12Gfmv/wwVVDQHqZoidtYRTTCa
         Pa3/YvXEZLsCVhDLLf54q1xf5y7dfkQY8A/4WXzfzK25ZZNmqZGywwHRLxxkJ642dROb
         TWpckY2LV9FDGk+NgG//7kISXtEF8z6OAPk33E8QLH7dBO9+lCo4TLDCNDMeb9PXoOZq
         +9FGlBMR99GwnuLMbB1JDxoh1bUB6tnK4T9qQWjDSrDutX13juMDsFybPDvKCl/lCQV1
         8lwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700651249; x=1701256049;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hNxDhhCIH8NlpH8XHPURRCmGBLxe0AMGsttC4hlkS4g=;
        b=KI/m77arThcN7jMJJfFkxSFu5Hiwr+u6RgSfzHb7ZQwaNu9E54XsJmI0ssKLTEWiOw
         Q5cDtvvwJlRvB0RaNaOG7hZU6WCVZKi40UL3IQf8sNfgHsI0sromSatP4myF83c2Ix69
         9DD6BZRjbX2L1+iM824a/qk33K62EKHdG92i58Kit0pAQ95MHPb802Nzc7rPO+nSgOa7
         7bWvcLnVv0KalE9Wvfmft06zV5qlbu/vzTjrtA6YnrNBCZ1L4X8SviU7jptVciX+DNnA
         XtqAjVEcEros9qKxfyaK5QJys88dCBYkGqYac2j3r8yauwqv2SS6Zc88amGUeUnK2r0V
         btpw==
X-Gm-Message-State: AOJu0Yyl6DE8prPll4bQbYdGuwDZvdW7sNz1/Yz2HkbxoDSw6mLER7yx
	66vYyWbZGAXVj6L6t/JOep3qBQ==
X-Google-Smtp-Source: AGHT+IGYNLvrEeIf4l5dhNfo9PLr/A5Ox6GzMWAevPIallmwrkFlAOq4+ezPJDEfyMf13hLwgxpTjQ==
X-Received: by 2002:a05:6512:1591:b0:50a:bb04:2321 with SMTP id bp17-20020a056512159100b0050abb042321mr1582427lfb.1.1700651249433;
        Wed, 22 Nov 2023 03:07:29 -0800 (PST)
Message-ID: <19f6fcaf-ac2b-4cc3-b226-27ec659d7478@linaro.org>
Date: Wed, 22 Nov 2023 12:07:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] xen: backends: touch some XenStore nodes only if
 device...
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Paul Durrant <xadimgnik@gmail.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>
References: <20231121221023.419901-1-volodymyr_babchuk@epam.com>
 <20231121221023.419901-3-volodymyr_babchuk@epam.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231121221023.419901-3-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Volodymyr,

On 21/11/23 23:10, Volodymyr Babchuk wrote:
> was created by QEMU

Please do not split lines between subject and content. Rewrite the
full line. Preferably restrict the subject to 72 chars. Otherwise
your patch isn't displayed correctly in git tools.

Thanks,

Phil.

> Xen PV devices in QEMU can be created in two ways: either by QEMU
> itself, if they were passed via command line, or by Xen toolstack. In
> the latter case, QEMU scans XenStore entries and configures devices
> accordingly.
> 
> In the second case we don't want QEMU to write/delete front-end
> entries for two reasons: it might have no access to those entries if
> it is running in un-privileged domain and it is just incorrect to
> overwrite entries already provided by Xen toolstack, because toolstack
> manages those nodes. For example, it might read backend- or frontend-
> state to be sure that they are both disconnected and it is safe to
> destroy a domain.
> 
> This patch checks presence of xendev->backend to check if Xen PV
> device is acting as a backend (i.e. it was configured by Xen
> toolstack) to decide if it should touch frontend entries in XenStore.
> Also, when we need to remove XenStore entries during device teardown
> only if they weren't created by Xen toolstack. If they were created by
> toolstack, then it is toolstack's job to do proper clean-up.
> 
> Suggested-by: Paul Durrant <xadimgnik@gmail.com>
> Suggested-by: David Woodhouse <dwmw@amazon.co.uk>
> Co-Authored-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> ---
>   hw/block/xen-block.c  | 16 +++++++++-------
>   hw/char/xen_console.c |  2 +-
>   hw/net/xen_nic.c      | 18 ++++++++++--------
>   hw/xen/xen-bus.c      | 14 +++++++++-----
>   4 files changed, 29 insertions(+), 21 deletions(-)


