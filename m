Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B7B73CC11
	for <lists+xen-devel@lfdr.de>; Sat, 24 Jun 2023 19:36:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554633.865920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qD7BG-0006oe-En; Sat, 24 Jun 2023 17:36:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554633.865920; Sat, 24 Jun 2023 17:36:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qD7BG-0006lt-BO; Sat, 24 Jun 2023 17:36:14 +0000
Received: by outflank-mailman (input) for mailman id 554633;
 Sat, 24 Jun 2023 17:36:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BIr0=CM=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1qD7BE-0006ln-Cm
 for xen-devel@lists.xenproject.org; Sat, 24 Jun 2023 17:36:12 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9bcb38a5-12b5-11ee-b237-6b7b168915f2;
 Sat, 24 Jun 2023 19:36:11 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f9c2913133so22742005e9.1
 for <xen-devel@lists.xenproject.org>; Sat, 24 Jun 2023 10:36:10 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.217.150])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a5d6dc9000000b0030ae53550f5sm2590762wrz.51.2023.06.24.10.36.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Jun 2023 10:36:09 -0700 (PDT)
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
X-Inumbo-ID: 9bcb38a5-12b5-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687628170; x=1690220170;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GhpHbFudMkeMeL5ABLFV8K3ZpIKOcpmqDKumUJnakQo=;
        b=iHZDudCm+6Lkz6SMlioiaWU3ZPrAVeeGWydDo5XpuHV/O83QDieJ2MW8sBwc0RnJ6n
         LCyc81zygqlx89kqYh6y73/3CFk7tQWmRPaEg0IWMGey5OqegmHYQ884T0up8Qih6qtw
         X91F/O84ZOuvkgqRnEXbb0eSlQvy+5Gun1bFmcC96S2uKTlpsxgRhLma5RxvpNjRGq+2
         eDO6513hnE4ZqdmdJjRuKKPa5ge9tgFASVn2oo+300iSfP5maJ62wBUynRf7i9NYTjc6
         xdYlov0lRWMIvUULtV6NAO9JsfOyDTaiIaPiJgFXnYEpiaqfkMjDaWpUqrHvp89eWXy7
         ObVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687628170; x=1690220170;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GhpHbFudMkeMeL5ABLFV8K3ZpIKOcpmqDKumUJnakQo=;
        b=HKYtWlnvMfnVXvwza2UZhYAGSEPTNQviuGOWyfMD9IyoTGOMPqhKUeaCeHwJeu8Zg5
         XAGdzur1DT13hlBuSeQnXlqWas7BgnPD7xICendog7kE1UGC5HB5hKQdDtllIsMfdva2
         q62h58w6yJnHq6tR5bNL5ONi0e6wVUZYBZkKaPFNK3M1STQzDjOFTdSmMK9QYqBHo2nJ
         pb+63hjlgcU+vCFFMH4IhpsT+2wt6dlq+iTEEWOnkGEHsAjvEv4p+GWvkIyFkahsXDNJ
         c8iXJx7iuuoR3WA/B8We//4f0b0FxzV/mZ9OJ9j+q3sNToSaXZ7N4jVpR7SxZoHWr4bb
         efZA==
X-Gm-Message-State: AC+VfDwCxy7SxBeVPTFfKS3NDfCHPlY28ShJ2bBngsL2YW+qlDycrifY
	U111myckVmBeEfARxtA8I9t2aA==
X-Google-Smtp-Source: ACHHUZ45/pSKUwN9ZWRuO9SdxWU1+R6/cc+TpuFjaseh8imD+9izPUxpPl+Hji/hbynVqoq/U2/WFA==
X-Received: by 2002:a1c:e90d:0:b0:3f8:fc2a:c7eb with SMTP id q13-20020a1ce90d000000b003f8fc2ac7ebmr17083071wmc.5.1687628170299;
        Sat, 24 Jun 2023 10:36:10 -0700 (PDT)
Message-ID: <c52475f6-253f-05cf-186f-5b9e17da1dac@linaro.org>
Date: Sat, 24 Jun 2023 19:36:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 07/16] accel: Rename HAX 'struct hax_vcpu_state' ->
 AccelCPUState
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Reinoud Zandijk <reinoud@netbsd.org>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Maydell
 <peter.maydell@linaro.org>, Roman Bolshakov <rbolshakov@ddn.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Alexander Graf <agraf@csgraf.de>,
 xen-devel@lists.xenproject.org, Eduardo Habkost <eduardo@habkost.net>,
 Cameron Esfahani <dirty@apple.com>
References: <20230622160823.71851-1-philmd@linaro.org>
 <20230622160823.71851-8-philmd@linaro.org>
 <2c0a97af-be7e-6d83-5176-ef9980c2faf0@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <2c0a97af-be7e-6d83-5176-ef9980c2faf0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 22/6/23 19:46, Richard Henderson wrote:
> On 6/22/23 18:08, Philippe Mathieu-Daudé wrote:
>> |+ struct AccelvCPUState *accel;|
> ...
>> +typedef struct AccelCPUState {
>>      hax_fd fd;
>>      int vcpu_id;
>>      struct hax_tunnel *tunnel;
>>      unsigned char *iobuf;
>> -};
>> +} hax_vcpu_state;
> 
> 
> Discussed face to face, but for the record:
> 
> Put the typedef in qemu/typedefs.h, so that we can use it immediately in 
> core/cpu.h and not need to re-declare it in each accelerator.
> 
> Drop hax_vcpu_state typedef and just use AccelCPUState (since you have 
> to change all of those lines anyway.  Which will eventually allow
> 
>> +++ b/target/i386/whpx/whpx-all.c
>> @@ -2258,7 +2258,7 @@ int whpx_init_vcpu(CPUState *cpu)
>>
>>      vcpu->interruptable = true;
>>      cpu->vcpu_dirty = true;
>> -    cpu->accel = (struct hax_vcpu_state *)vcpu;
>> +    cpu->accel = (struct AccelCPUState *)vcpu;
> 
> this cast to go away.

Indeed, thanks :)


