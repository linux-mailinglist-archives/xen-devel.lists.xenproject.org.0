Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D3FB05271
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 09:12:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043539.1413499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubZpQ-0002x9-LW; Tue, 15 Jul 2025 07:11:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043539.1413499; Tue, 15 Jul 2025 07:11:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubZpQ-0002vT-Io; Tue, 15 Jul 2025 07:11:52 +0000
Received: by outflank-mailman (input) for mailman id 1043539;
 Tue, 15 Jul 2025 07:11:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZCKb=Z4=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1ubZpP-0002vN-O1
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 07:11:51 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9a81021-614a-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 09:11:49 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3ab112dea41so2750173f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 00:11:49 -0700 (PDT)
Received: from [192.168.69.239] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8bd1647sm14215422f8f.1.2025.07.15.00.11.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jul 2025 00:11:48 -0700 (PDT)
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
X-Inumbo-ID: f9a81021-614a-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752563509; x=1753168309; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=soLuh7uzjqz1LeLKlFTtKgHcxIuT3Hs89rPzmWxa8UE=;
        b=sehvdovbqPTrDU4EUX73YQ3npCMoS7pc79VuW+yOhliUd1y5SaqtPll+LuLLL2wfoX
         Nigu18qeO8CM5L2AAICoDhfSGr67eK491dSlSh5aAIxMFxommdyPwqpEWTKVlrAvEFUt
         BZEdxbclRIUZmU4h7Ih3+Mse+ZW7+lR+WcXBJZJNzYu2gRn54olNiY0dYxS5I+7QhiHW
         e3k2NANSQ8wsSN3+r8qw65kuAf4l3RTEIVTWcpNcHc/ipTlk4TTO5moxO3yS5O/rWrEk
         nBpNGB9kYHq6q0s2Hcnbbm+jLSrJp2bqF5wuDCy4sH4V77O/RTtJnhSwjpy2A5F5yXpQ
         6Nvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752563509; x=1753168309;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=soLuh7uzjqz1LeLKlFTtKgHcxIuT3Hs89rPzmWxa8UE=;
        b=gb8tQ+bQOT9FSF89l19CVuu98m8jjSGBHLA9n1IhBJ2+K74mmJcKTwnP5+62HuAkDx
         2zp7eJdHtbxVeU4+Pq0yZmyS5EBU+5b79IR5jYICclMTDcBiDt28WUSz1HEYLGmrsy6F
         epl/ixr3zEP8cT3clIM4zMCkStLU038hJ2zgniJ2a0iq17+PynbuBkkjRLbFoCuAbMVC
         x6j72ysMomexfTxwb17IF0u+6F2mwL3qFsHHxypaVr0yNAfdbyyJMR2puelWznraZ0IU
         5T9K219tQG0p9ngjspiA2RlXpuQSN/qrqhmoWXIN4al+flz8Cjj//NFpd+9DQmjpEcoo
         g+Aw==
X-Forwarded-Encrypted: i=1; AJvYcCUJEK8eREb5f7/fHAuWdpSmYj7WLCq3jFEJfHx1Bfn3xj8WDkf3KB5QrmRlcsLzLCew18QahS4MvPk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyF5ajs/oJx3aE45c7Yfj3W/CC6gj/u+F/ONrdQOnbacsvVUdJ2
	Ki+jwaf2iOHjVzeFgTJ9LyttT/Hs9oSXOLKmJ/AZesVnKGHqjD5+jpZh1zuWTHNK21E=
X-Gm-Gg: ASbGnct3gw2JItf3R3d9W/C6PJKLvRv+Cl1a38KTZ23wwfKtG7Oz1QjjGuAlUXStwAV
	hBggUKDvV3OtR4RrIh6FYIw8CVNJTNOyV58j7pfbYfJ129mHVV9RjBVnHsxeoUTkfVgLTAgi8A7
	zsT7K72EWziutuRAxwddssQWvGp7wSQK8+tESc8nPvK7aZ+Ix6bLZmo2bPLLlM0E7GC9XRYgFFW
	UJnw9uB3t2kOy6EPX72uPwHGR27mFhhL0WU9jdeFuRfL6IBIvdDShSef/87Q01o2FC+n+/6BPaM
	elQkfYC1LPPYZX0HxerEmlIO8dv2SC4SMD/eo9GkNhtI/z1gKYJUdvra092f1YO3huHbtvObUY4
	5rBGA4VKpUgHRn8YyvR3oSv6YNKGt66mky1Az4If2wU1AH4KZ5VCOcWX6lUFv/SSxg4jYWKM=
X-Google-Smtp-Source: AGHT+IHFyCzYH+0DxLsUP/xPrOFlK5HgT3QiKPgOueBoXHrHvXU68nzU5nEMixuadqWMODzTwaQyAA==
X-Received: by 2002:a05:6000:290b:b0:3b3:9c75:acc6 with SMTP id ffacd0b85a97d-3b5f359d08dmr11783752f8f.59.1752563508693;
        Tue, 15 Jul 2025 00:11:48 -0700 (PDT)
Message-ID: <7a40eccd-d77b-4071-b498-bb998149a069@linaro.org>
Date: Tue, 15 Jul 2025 09:11:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/xen/arch_hvm: Unify x86 and ARM variants
To: Xiaoyao Li <xiaoyao.li@intel.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Anthony PERARD <anthony@xenproject.org>,
 David Woodhouse <dwmw@amazon.co.uk>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20250513171737.74386-1-philmd@linaro.org>
 <ae482293-80a0-4b94-9c34-4a8d5ce18b49@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <ae482293-80a0-4b94-9c34-4a8d5ce18b49@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 14/5/25 07:11, Xiaoyao Li wrote:
> On 5/14/2025 1:17 AM, Philippe Mathieu-Daudé wrote:
>> As each target declares the same prototypes, we can
>> use a single header, removing the TARGET_XXX uses.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ...
>> diff --git a/hw/arm/xen-pvh.c b/hw/arm/xen-pvh.c
>> index 4b26bcff7a5..1a9eeb01c8e 100644
>> --- a/hw/arm/xen-pvh.c
>> +++ b/hw/arm/xen-pvh.c
>> @@ -10,7 +10,6 @@
>>   #include "hw/boards.h"
>>   #include "system/system.h"
>>   #include "hw/xen/xen-pvh-common.h"
>> -#include "hw/xen/arch_hvm.h"
>>   #define TYPE_XEN_ARM  MACHINE_TYPE_NAME("xenpvh")
> 
> This chunk seems unrelated.

I'll split in 2 patches, thanks.

