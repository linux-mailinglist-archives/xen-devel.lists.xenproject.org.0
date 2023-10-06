Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C18267BBAB6
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 16:47:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613697.954414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qom6u-0007Im-LN; Fri, 06 Oct 2023 14:47:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613697.954414; Fri, 06 Oct 2023 14:47:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qom6u-0007GB-Hv; Fri, 06 Oct 2023 14:47:24 +0000
Received: by outflank-mailman (input) for mailman id 613697;
 Fri, 06 Oct 2023 14:47:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vVKM=FU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qom6t-0007Fj-70
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 14:47:23 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 40e8ef0c-6457-11ee-9b0d-b553b5be7939;
 Fri, 06 Oct 2023 16:47:21 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-32483535e51so2143140f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 06 Oct 2023 07:47:21 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 p4-20020a5d68c4000000b003232f167df5sm1804792wrw.108.2023.10.06.07.47.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Oct 2023 07:47:20 -0700 (PDT)
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
X-Inumbo-ID: 40e8ef0c-6457-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1696603640; x=1697208440; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZRhZ8QIDYu+uiryCIrqpTBp6AefhqnKPf4DAl6e8Fos=;
        b=EBaYW4cRWRaJQO2FHj7Uv6/deuP26zTOQEyN4Z5JzqB+0E4bFoY0kAFvRXh5KmjwdM
         X3ebLjJB9mE7AMHI2IXampcZwMSdqGw97J55N+Ntxh8lYn6PD9kA/sDDK3IZSpCEtDCh
         9iWanWsYpz7ufke+VkdyNzCbMPMvQSPNH6WbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696603640; x=1697208440;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZRhZ8QIDYu+uiryCIrqpTBp6AefhqnKPf4DAl6e8Fos=;
        b=i3B5qaxh1gnHw4LxBe7OKU78dxKoB/wv1XmPJcklzvqduznyQL2XoO2942CfXvQh73
         F+4Wo6WWHX0i9ryrE7TwdhEgMIDdRInJNTEWON/f1E0J3jPIZLThi6b/wWIS+uRNAj9q
         ZF6aCmnmdgL/m+JN2/HmUWoFJodWWHzIWS7v/3mi80iPD0ZPCyMl27tgs1+qOuQvanAK
         dk3ylJKgjREub7nEDHEOZHdvB+xO4QMOf986TwZXG+cSP05lgPabQt6rclrTZk0+jOso
         wUPRGVBE7hXcqBMnY4/wZBlDL2niqzOuoqIEn//Q5bLr8emRsmHVcifDAB6Eqzbs2ENE
         LWsg==
X-Gm-Message-State: AOJu0Yydx8DF7o6wYvSaafb2dwrm6EwFiqHxLPYO1Fafg8J5k2uJtJ8Y
	DXSh54v/xHVBWq/pb3Krz2x1SQ==
X-Google-Smtp-Source: AGHT+IE4K7289JiD8t9Hs1l5W4xp607JhyFtI+oBadTNEQd2Z/R1yBaVkTpZHAt6eabIdEMSRCLWqg==
X-Received: by 2002:a5d:6642:0:b0:31f:f2d4:a71a with SMTP id f2-20020a5d6642000000b0031ff2d4a71amr7360883wrw.8.1696603640396;
        Fri, 06 Oct 2023 07:47:20 -0700 (PDT)
Message-ID: <70a6e559-f43f-4b2f-a3f6-79b3065b6b65@citrix.com>
Date: Fri, 6 Oct 2023 15:47:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 2/2] domain: expose newly introduced hypercalls as
 XENFEAT
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Henry Wang <Henry.Wang@arm.com>,
 Community Manager <community.manager@xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20231006130059.97700-1-roger.pau@citrix.com>
 <20231006130059.97700-3-roger.pau@citrix.com>
 <e45d0273-834b-4d7f-b158-29341845d3be@citrix.com>
 <ZSAJewLiAgcDrzc8@MacBookPdeRoger>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZSAJewLiAgcDrzc8@MacBookPdeRoger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/10/2023 2:19 pm, Roger Pau Monné wrote:
> On Fri, Oct 06, 2023 at 02:05:18PM +0100, Andrew Cooper wrote:
>> On 06/10/2023 2:00 pm, Roger Pau Monne wrote:
>>> diff --git a/xen/include/public/features.h b/xen/include/public/features.h
>>> index d2a9175aae67..22713a51b520 100644
>>> --- a/xen/include/public/features.h
>>> +++ b/xen/include/public/features.h
>>> @@ -111,6 +111,15 @@
>>>  #define XENFEAT_not_direct_mapped         16
>>>  #define XENFEAT_direct_mapped             17
>>>  
>>> +/*
>>> + * Signal whether the domain is permitted to use the following hypercalls:
>>> + *
>>> + * VCPUOP_register_runstate_phys_area
>>> + * VCPUOP_register_vcpu_time_phys_area
>>> + */
>>> +#define XENFEAT_runstate_phys_area	  18
>>> +#define XENFEAT_vcpu_time_phys_area	  19
>>> +
>>>  #define XENFEAT_NR_SUBMAPS 1
>>>  
>>>  #endif /* __XEN_PUBLIC_FEATURES_H__ */
>>> diff --git a/xen/include/public/vcpu.h b/xen/include/public/vcpu.h
>>> index 8fb0bd1b6c03..03b031a3e557 100644
>>> --- a/xen/include/public/vcpu.h
>>> +++ b/xen/include/public/vcpu.h
>>> @@ -236,6 +236,9 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_register_time_memory_area_t);
>>>   * Note that the area registered via VCPUOP_register_runstate_memory_area will
>>>   * be updated in the same manner as the one registered via virtual address PLUS
>>>   * VMASST_TYPE_runstate_update_flag engaged by the domain.
>>> + *
>>> + * XENFEAT_{runstate,vcpu_time}_phys_area feature bits signal if the domain is
>>> + * permitted the usage of the hypercalls.
>>>   */
>>>  #define VCPUOP_register_runstate_phys_area      14
>>>  #define VCPUOP_register_vcpu_time_phys_area     15
>> For both of these, I'd suggest s/permitted/able/.  For older versions of
>> Xen which don't advertise the XENFEAT, it's a matter of capability, not
>> permission.
>>
>> Otherwise, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com> and
>> I'm happy to adjust on commit to save sending out a v3.
> TBH I've used permitted because that's the wording you used in your
> reply to v1, I'm perfectly fine with switching to able.
>
> https://lore.kernel.org/xen-devel/ac4842a9-7f62-4c64-9a3a-2ec2b1e97699@citrix.com/

Yeah, sorry.  I didn't think fully before making the suggestion.

I was mainly looking to avoid saying "what the hypervisor is capable of" :)

~Andrew

