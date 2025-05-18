Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7800ABAED0
	for <lists+xen-devel@lfdr.de>; Sun, 18 May 2025 10:45:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.988878.1373282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGZdn-00020I-7P; Sun, 18 May 2025 08:45:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 988878.1373282; Sun, 18 May 2025 08:45:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGZdn-0001xD-4i; Sun, 18 May 2025 08:45:03 +0000
Received: by outflank-mailman (input) for mailman id 988878;
 Sun, 18 May 2025 08:45:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GB/u=YC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uGZdl-0001x7-54
 for xen-devel@lists.xenproject.org; Sun, 18 May 2025 08:45:01 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61449d28-33c4-11f0-9ffb-bf95429c2676;
 Sun, 18 May 2025 10:44:58 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-441d437cfaaso19487225e9.1
 for <xen-devel@lists.xenproject.org>; Sun, 18 May 2025 01:44:58 -0700 (PDT)
Received: from [172.18.118.114] (ip-185-104-138-24.ptr.icomera.net.
 [185.104.138.24]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442fd583ff7sm95535765e9.26.2025.05.18.01.44.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 May 2025 01:44:57 -0700 (PDT)
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
X-Inumbo-ID: 61449d28-33c4-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747557898; x=1748162698; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ysdWcVqdU/MwsXp+Sn6q1xiJ8GFq4JRmzFA0ZEf3A64=;
        b=Uh347AyNhZnWbscCAXokYoOPipWifJlctRHH2y1WWTdj07sRIEsx/4gKkFcTJA/2d/
         PMMzjeQIpZVqnh8bRqgOMW5J2nGfOqHQPH9+ebbqRzZJfn+DbSzmYJlTe/G+MU9DcMuw
         SvOWo4bJLMTjXKC/rLNmlh/D1FzR3Kqu7yiEFp0dhnuzw8Az715De+hYapoGXPv0KMf1
         n1f00EBsMD3KyjVO5c+zjAIixiFsRPoBCN5n/D6EfX0ufUUz4jOVTDwaXeZOb0G/uWcf
         C54ouYkvAx4TpIXazmOpaT8K2eKMowb4TAekVpbNoun+nY9Lb9rkjuV34VHOJJWlwiOq
         BBSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747557898; x=1748162698;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ysdWcVqdU/MwsXp+Sn6q1xiJ8GFq4JRmzFA0ZEf3A64=;
        b=MsOA4sXASNnXrTKuE1G42aXFy8WaVWX7+Zyk6+Z+Foi2B5FZM8QKg1UGJgC3BKq1Xa
         8NSBs35iaeFFYWNH+sK+rBUiPya36LN8e4O4R/bhVmKF47e6AcTpEfc3A7V3cNu7z0JQ
         ZyHjuW+3XEXpstWXVZzeMp/A2tFLG31fm871U50aGsbCOIUDYR5XffUITrQPAwV/6lHR
         8KAsRfjglHzpEis3MJnYQJY8xXMUzydP0/mo5YmjzQl4pWyReu7qg3B8HwCc5P0Euzh+
         wUhkL/dHoHIWS4Dlzq55vO26R8ZDK8396pxshBHP10e910vYmiJbQMInYf4rpcr1NYCj
         uKCw==
X-Gm-Message-State: AOJu0YwlgSMo1yQiewbJyp5S6ShJeDNcI70CAMQmFjQLyQeUpJ9s5MFp
	UI6vi+MGGAozEmBHS9LhDIKpAiZAxIiDKsgd0qgvyxq3ShPIaCkpmRmXVqJ/E/fpr+C85/F5esV
	gkbI=
X-Gm-Gg: ASbGncsQolfKApD+Llh2wtmyW37ItRpljOvIzAX4w+XWk8orjxDrNNWR6JU95PckHCd
	fM2MnV6bbMq7dakYegcEOMR1jKHiOOnOIYP4yHPl40FO4MnUdFXqEAfyxYP1e2a7d2HR2HSZ2B8
	I8mh1N5rcicpdaHm2/ggLYSCyAquzKTMoWvZDFT+zE9qMV5Aukt49HF4LhanFdUwRS5cWxZK7Fu
	dxnyV2HB6j4Ecl77CmeNbFGaljzKUapCOrp0xB4Zi0sgyWWaa7tsIgo2X3V55kUkO+BQEtJdxM8
	8RIqUsZW67w/n+AQPskmYhXIll5/kbs0i09KlIseHwB0RmGw8JaM4Gz/W0sw1i4qQOLKvk3RX/L
	IECCHZuG5sqBa7NV9qHZ7zZz+txSOoJklufM=
X-Google-Smtp-Source: AGHT+IEWtKg8qhT/8CzkQFugoTol3c1h29T2a1cdBUs6BzxFlmMJrTW3d5mYzuRvcm4HZkojzhNV+w==
X-Received: by 2002:a05:600c:3e84:b0:442:e9eb:1b48 with SMTP id 5b1f17b1804b1-442ff029b73mr76754875e9.24.1747557898196;
        Sun, 18 May 2025 01:44:58 -0700 (PDT)
Message-ID: <76c6eb2f-4e00-4bff-866d-fa7172e274b4@suse.com>
Date: Sun, 18 May 2025 10:44:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen: Introduce extra IRQ count domain creation
 parameter
To: Teddy Astie <teddy.astie@vates.tech>
References: <9a746a8b2e9ee68a398795ecb5dcb53697aeece4.1747403245.git.teddy.astie@vates.tech>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9a746a8b2e9ee68a398795ecb5dcb53697aeece4.1747403245.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.05.2025 15:50, Teddy Astie wrote:
> When doing PCI Passthrough with high-IRQ devices (e.g NVMe drives),
> the default limit may be unefficient as not all domains requires
> more IRQs.
> 
> Introduce a new parameter to allow the toolstack to tune the IRQ
> count if more is required.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

Sure, why not (suitably fleshed out, as e.g. you say ...

> ---
> 0 extra_irqs is meaningful, though I am not sure how to expose this
> special case.
> 
> This of course wants libxl support next.

... here).

> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -912,10 +912,12 @@ struct domain *domain_create(domid_t domid,
>  
>  #ifdef CONFIG_HAS_PIRQ
>      if ( !is_hardware_domain(d) )
> -        d->nr_pirqs = nr_static_irqs + extra_domU_irqs;
> +        d->nr_pirqs = nr_static_irqs + config->extra_irqs ?: extra_domU_irqs;

I think you're missing parentheses here around the ?: expression.

Jan

