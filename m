Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0348FE039
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2024 09:54:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736009.1142137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sF7xC-0005e5-Rh; Thu, 06 Jun 2024 07:54:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736009.1142137; Thu, 06 Jun 2024 07:54:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sF7xC-0005cD-Oq; Thu, 06 Jun 2024 07:54:34 +0000
Received: by outflank-mailman (input) for mailman id 736009;
 Thu, 06 Jun 2024 07:54:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tbpc=NI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sF7xB-0005c7-5b
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2024 07:54:33 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 018c18f0-23da-11ef-b4bb-af5377834399;
 Thu, 06 Jun 2024 09:54:30 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-421572bb0f0so8238635e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 06 Jun 2024 00:54:30 -0700 (PDT)
Received: from [172.20.145.98] ([62.28.225.65])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42158102af1sm46518985e9.16.2024.06.06.00.54.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jun 2024 00:54:30 -0700 (PDT)
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
X-Inumbo-ID: 018c18f0-23da-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717660470; x=1718265270; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eipaC/9NVWX7FB1JguRZeH6kHfbXdyOVG6aQyY4pq5o=;
        b=XzddSY7iUzO/SA97cZKLb8zotruO9zwrHW0qrHYwUkcAYLyi6mxcrRoKVYyzkFp/YT
         ownv+7Vn62qk8BQD5xXyhiMzoRdQJX50Rq6UUTbOae1UjkECJQ9e/Wfr9vU/4HmF/ZI0
         SixnKbhqDoPxcqws2VrJ3291TvuVo0SJA4OIwlriifwN1V2e74hY8V3SKXU9ef4GcFI6
         qluqLbILdLMVMgLNG8DK7JtVqCN5UeKPXEucd8v6HSRqKf1EtiN1yZNCuSsw7lGuXsBc
         Wln7b/VRnZ35yO5on4RoCDczxF4fSIimOmeOERFiWyvMvX9GbQq527RS4LjHnRGexR2v
         /M9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717660470; x=1718265270;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eipaC/9NVWX7FB1JguRZeH6kHfbXdyOVG6aQyY4pq5o=;
        b=jkkbnm6Foib/YvD+0ezYgqlC6PRwjWQF562D9qJEm93q0Bc6zn4uhoEoZkPlC3006/
         HDISlmo1TzH4W0kIS/BbkR06iWiJr+FyE9LGxGgE+alVEeivbKScfzbuo1/Q6xkKDAdx
         jTasnLbHcHQHFqk8FrJtBjtLUbyhjvFzXTtGi7w7V8wfc/Ldr5QbG/nFB7x7AVq3t/Vu
         pLCos/F2FrR5KOZwRlEbeVLwpNbr9+32Xs51Q17rSbP8ocB+H0d+SMHbIROyoIqDVeZo
         gwcr/S7ON9AVyHMSu6hOQYPgYFdJu88J6txGycf7ISRlH0U2r3wiaW4TolG9lMEDsGzb
         3tyw==
X-Forwarded-Encrypted: i=1; AJvYcCXYc3r8KMtO0RJP/gqYm5yODnV8dxV5oGaJjktTxuy+KGUpdp2Ai5WXvTCGiVry7ZJGh3hcqrwE842wY7fEi+o1ZBXGTmpnPPQZ/Ojn9iQ=
X-Gm-Message-State: AOJu0Yyyx7o4tuyBvOSQvtqaKv68IifQihJOJx7xxj9xJQBK3Ls75zQ7
	mKl5zU86hi0zqNPLG5s87NpGWgnXlStuU+NPTCLln+itzeVHGqYek/w6UAGcfA==
X-Google-Smtp-Source: AGHT+IERrNaCXf1nm3lAwF6/xMkmyEt6Ap8vg+0uiBhXpsF9mjXbMXs52Ulk9St77o86Ja+NrLXQJw==
X-Received: by 2002:a05:600c:3108:b0:41f:e87b:45c2 with SMTP id 5b1f17b1804b1-4215624b7fbmr41410505e9.0.1717660470334;
        Thu, 06 Jun 2024 00:54:30 -0700 (PDT)
Message-ID: <ab57f7f3-ac54-4b41-950a-1f7bee4293ab@suse.com>
Date: Thu, 6 Jun 2024 09:54:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1] x86/cpufreq: separate powernow/hwp cpufreq code
To: Sergiy Kibrik <sergiy_kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20240604093406.2448552-1-Sergiy_Kibrik@epam.com>
 <5cb13d1a-1452-4542-b50d-23e6a9d9d3ef@suse.com>
 <c66966da-bbe3-432e-8a2f-809bf434db39@epam.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c66966da-bbe3-432e-8a2f-809bf434db39@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.06.2024 09:30, Sergiy Kibrik wrote:
> 06.06.24 10:08, Jan Beulich:
>> On 04.06.2024 11:34, Sergiy Kibrik wrote:
>>> --- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
>>> +++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
>>> @@ -657,7 +657,7 @@ static int __init cf_check cpufreq_driver_init(void)
>>>   
>>>           case X86_VENDOR_AMD:
>>>           case X86_VENDOR_HYGON:
>>> -            ret = powernow_register_driver();
>>> +            ret = IS_ENABLED(CONFIG_AMD) ? powernow_register_driver() : -ENODEV;
>>>               break;
>>>           }
>>
>> What about the Intel-specific code immediately up from here?
>> Dealing with that as well may likely permit to reduce ...
> 
> you mean to guard a call to hwp_register_driver() the same way as for 
> powernow_register_driver(), and save one stub? ?

Yes, and perhaps more. Maybe more stubs can be avoided? And
acpi_cpufreq_driver doesn't need registering either, and hence
would presumably be left unreferenced when !INTEL?

Jan

