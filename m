Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB92569CF22
	for <lists+xen-devel@lfdr.de>; Mon, 20 Feb 2023 15:16:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498154.768983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU6xI-0002UA-8s; Mon, 20 Feb 2023 14:15:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498154.768983; Mon, 20 Feb 2023 14:15:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU6xI-0002RR-5t; Mon, 20 Feb 2023 14:15:48 +0000
Received: by outflank-mailman (input) for mailman id 498154;
 Mon, 20 Feb 2023 14:15:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mE7+=6Q=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1pU6xG-0002Pg-P1
 for xen-devel@lists.xenproject.org; Mon, 20 Feb 2023 14:15:46 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0bf96a80-b129-11ed-933d-83870f6b2ba8;
 Mon, 20 Feb 2023 15:15:40 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id bo30so809435wrb.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Feb 2023 06:15:40 -0800 (PST)
Received: from [10.85.37.29] (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id
 q6-20020a05600c46c600b003dc47d458cdsm1217989wmo.15.2023.02.20.06.15.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 06:15:36 -0800 (PST)
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
X-Inumbo-ID: 0bf96a80-b129-11ed-933d-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xQCb1ix8pNS+owqIqISbUEGAgwSj/rWUCCNBqA9XyJ4=;
        b=S0QZmUyXNbfOuK49Loj+B7q4weWvEakMqyD6NU35NK7SDL8v1+IgWhu0mzrlIxknbE
         vRl/pCSG+Ftn0giOlnQX3g16OfYU0UpUkGuS4V+1RWMV7x4TjggvvQLoHNWGeqrAnkQ6
         zvTedmDD15vnVbMr5hSPnldhsNd8sOoL+On/IcoDszwJCCSYj4KpDs9TbvVaNBAPrGKh
         5mUSJd0No8Julb80I2sgNplotIkv7fcwhNTlrV+BA1cO6kbrVBKvzfjyKBws/hX+doAB
         h2Na/izk0TN9a8HaW981hFwPjpXXJ2Zb1TriDn4+d8jpcyH+XKWlW5r4S0m2XAh0Tk5G
         GZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xQCb1ix8pNS+owqIqISbUEGAgwSj/rWUCCNBqA9XyJ4=;
        b=sngQILQ7ZYGSvcUHi0UoG3Z0ycvKCBaGgKKZHdjOPmHUJS1KDCMsrgLk9cEYaqVker
         t8YkrtZZk+L2aeSxVMVBb3vBhMaJR8pKkFRFX6o3jHrrBx5s9hd57nIsq3MnH/YxphUt
         2YaL3d9hPj7fxbOODPALNZXYlSJpDwU1G0sCvrpQl0Iypk9jDWp76uYTayEPQrocvh4q
         5oe2GBIiHAQeWL/xYEJ8PbmOjaEZDtnkwOf+sZnKhTPsZ5NwFIsjBWCjofgRr6oePrI9
         FSi9Fhzho6yiIiG+7uiBW3CJ6srAd0QMtm+87/U7dGw5tWm1ZcZt0uHjROcCFQzNAvOn
         8DWg==
X-Gm-Message-State: AO0yUKV5F8z+mKPGrHoQtL9fip9igJm+K3jkW6uCsEh/5BeUtJZVR76V
	9RwToN5WFAOlWOtxkRCcthw=
X-Google-Smtp-Source: AK7set/hYzJ62KuefT/lcq2s6/oWByZknFIl8q3J19ZABmaCyMvGNi2AMj4i5yhufpbIcca9PrSPSg==
X-Received: by 2002:a05:6000:45:b0:2c6:2ac4:66ee with SMTP id k5-20020a056000004500b002c62ac466eemr2249981wrx.39.1676902536787;
        Mon, 20 Feb 2023 06:15:36 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <1cdab4ab-a73e-0971-dece-729994f2b8c7@xen.org>
Date: Mon, 20 Feb 2023 14:15:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: paul@xen.org
Subject: Re: [PATCH] hw/i386/xen: Remove unused 'hw/ide.h' include from header
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230220092707.22584-1-philmd@linaro.org>
Organization: Xen Project
In-Reply-To: <20230220092707.22584-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 20/02/2023 09:27, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/i386/xen/xen_platform.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
> index 66e6de31a6..3795a203d4 100644
> --- a/hw/i386/xen/xen_platform.c
> +++ b/hw/i386/xen/xen_platform.c
> @@ -25,7 +25,6 @@
>   
>   #include "qemu/osdep.h"
>   #include "qapi/error.h"
> -#include "hw/ide.h"
>   #include "hw/ide/pci.h"
>   #include "hw/pci/pci.h"
>   #include "hw/xen/xen_common.h"

Acked-by: Paul Durrant <paul@xen.org>


