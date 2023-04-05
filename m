Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA8D6D817F
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 17:18:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518575.805277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk4tp-00050e-IW; Wed, 05 Apr 2023 15:18:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518575.805277; Wed, 05 Apr 2023 15:18:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk4tp-0004xR-FZ; Wed, 05 Apr 2023 15:18:13 +0000
Received: by outflank-mailman (input) for mailman id 518575;
 Wed, 05 Apr 2023 15:18:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gFET=74=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1pk4to-0004wx-1S
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 15:18:12 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12e2c4e1-d3c5-11ed-b464-930f4c7d94ae;
 Wed, 05 Apr 2023 17:18:09 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 v14-20020a05600c470e00b003f06520825fso1304728wmo.0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Apr 2023 08:18:09 -0700 (PDT)
Received: from [192.168.69.115] (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr.
 [176.184.52.81]) by smtp.gmail.com with ESMTPSA id
 i42-20020a05600c4b2a00b003f0321c22basm2461375wmp.12.2023.04.05.08.18.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Apr 2023 08:18:09 -0700 (PDT)
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
X-Inumbo-ID: 12e2c4e1-d3c5-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680707889;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=idFXVwnEQw2AeckpahKfXswn5+/Jk4JVx854v+ndXlM=;
        b=P5FRw1Bg8gByNSRzaVrWUJucc+Ia4IMT8SBajxnMMvSH0nmkPoBKvzzOp8cPpm0043
         W55c3pCluAC9R0flUGbEbU7/UOi25PsdH6FiniT+JvE7ldpWa3l6uPy/ngUjkHb2R1nI
         lDct8ip3jjWb9ZROycFg+zRRunyCOZEJtqUtxAV7aEzkeuiimDkDVTD8s1N/T9AVVfcu
         ZKoBR5zXSIvJZ2JIo/R2+DR5oTvV0/L9XzKUlEb5jX9SCauc267Ovw8quhwNhbHCnBZ1
         8EWK7u4/h6p/P9crBvmOAbjQYbSrYrxaz/Jn0hJ/1Wx9uKiQKBukAv/SHkV2N833Rknz
         lSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680707889;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=idFXVwnEQw2AeckpahKfXswn5+/Jk4JVx854v+ndXlM=;
        b=dp2/D3O2Z9XxHmDHopLfCTW1NXEJOP3QVxP33zNnk95UAhe9LA6UX9Tj5Vn+/yr2xu
         /wYG08idl9acv6J7vwH+52a2lt8gFF1PcxrnGncqZ3M6l4S3VgwpiE+MWukMQa8nQGXV
         tAioX7lpcKr9IPDds7qZOxaoRvFK0ZRxCRGuJ4ysunfugtscXE7/ZxvBCftXDoVR7Say
         w3IJVtTyrXb45p/ONXyPNzYonf5690mtUiV3nULcaZinknzCfQPYdQHfTk+2oNB3R4a1
         m18m6mFXAHEroRSvbB9sA77ZjvYaZsMhqMwky6905lSiOxu8IOy9fjVqK77ZUrMiJCLg
         Uodw==
X-Gm-Message-State: AAQBX9fJkVekEjq+oAPUgp9albvS0cYku54CDxob6jmI2H+Dwa6aUZlt
	v6jF6OHKIuDPQcRQ9JNa5C4RwQ==
X-Google-Smtp-Source: AKy350Z6S5WSad5iHIzjt49TqgYs41yzdYlN/8d2eI12bwZ9Xb+YKGePa0vAg6iMH5JR4Z/F8GyAAQ==
X-Received: by 2002:a7b:c38b:0:b0:3ed:8bef:6a04 with SMTP id s11-20020a7bc38b000000b003ed8bef6a04mr5244487wmj.27.1680707889387;
        Wed, 05 Apr 2023 08:18:09 -0700 (PDT)
Message-ID: <b84ecc42-4201-d714-364a-6a55682cbce7@linaro.org>
Date: Wed, 5 Apr 2023 17:18:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH 09/14] accel: Allocate NVMM vCPU using g_try_FOO()
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 Reinoud Zandijk <reinoud@netbsd.org>
References: <20230405101811.76663-1-philmd@linaro.org>
 <20230405101811.76663-10-philmd@linaro.org> <874jpul9d1.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <874jpul9d1.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/4/23 15:55, Alex Bennée wrote:
> 
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> g_malloc0() can not fail. Use g_try_malloc0() instead.
>>
>> https://developer-old.gnome.org/glib/stable/glib-Memory-Allocation.html#glib-Memory-Allocation.description
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   target/i386/nvmm/nvmm-all.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
>> index 3c7bdd560f..45fd318d23 100644
>> --- a/target/i386/nvmm/nvmm-all.c
>> +++ b/target/i386/nvmm/nvmm-all.c
>> @@ -942,7 +942,7 @@ nvmm_init_vcpu(CPUState *cpu)
>>           }
>>       }
>>   
>> -    qcpu = g_malloc0(sizeof(*qcpu));
>> +    qcpu = g_try_malloc0(sizeof(*qcpu));
>>       if (qcpu == NULL) {
>>           error_report("NVMM: Failed to allocate VCPU context.");
>>           return -ENOMEM;
> 
> Why - if we fail to allocate the vCPU context its game over anyway any
> established QEMU practice is its ok to assert fail on a malloc when
> there isn't enough memory. IOW keep the g_malloc0 and remove the error
> handling case.

This was my first approach but then I realized the author took care
to warn / return ENOMEM, so I went for _try_; but you are right,
since this is "game over" let's simply remove the check.


