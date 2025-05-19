Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B578ABBE9C
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 15:08:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989771.1373724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH0D9-0007t8-Fi; Mon, 19 May 2025 13:07:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989771.1373724; Mon, 19 May 2025 13:07:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH0D9-0007qz-CX; Mon, 19 May 2025 13:07:19 +0000
Received: by outflank-mailman (input) for mailman id 989771;
 Mon, 19 May 2025 13:07:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cAbn=YD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uH0D7-0007qt-Jp
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 13:07:17 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ffbe78e-34b2-11f0-a2fa-13f23c93f187;
 Mon, 19 May 2025 15:07:16 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-6011407431cso4581971a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 19 May 2025 06:07:16 -0700 (PDT)
Received: from [10.1.250.198] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6005ae39549sm5719093a12.71.2025.05.19.06.07.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 May 2025 06:07:15 -0700 (PDT)
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
X-Inumbo-ID: 2ffbe78e-34b2-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747660036; x=1748264836; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=caSmSC0vq01GdhGqSOu2/BTM+otwOs2jmU+X7gsR1t8=;
        b=aagjm8IMAggi6HKTRi/Z+JvSE6JE56MxxeO9PgczIBeTER7Dw46fKMDUUT9l/PZwZ5
         E/zrbnZNg+xFFdAqWj7TC1iMQiPoH+4ys/jbVRI3p8becclUPdyVHtD+m4cO5S473Tv8
         OTYS2CVPalAYQbViwuDj2bUg6GQfRfC7NS6gdbIaQ79AwqtjrVdfbdPX5RkJQzlvN5v1
         KSb9YMwY0bLTdxAHL1CVP1FAVO0yPo5OAmHz2ebZIR1nDnHdCYE5Aa64yEvZVIuKZ6/0
         oVxyCU02xAmFBdzWtQh70Jy/mtckG2vFkY0/JGUnIxZyIeqvbtj9CNJMsKPbsf7wM+YY
         XK8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747660036; x=1748264836;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=caSmSC0vq01GdhGqSOu2/BTM+otwOs2jmU+X7gsR1t8=;
        b=durCuAAG5HJzupRjG5DI9waVs5nry0G8CDN++7QqGaKjgC4LiNLOlb3chex7czXGSY
         wDievlStkjIThFjYxgsYIS/9lqjMTM4eWWhBZOnKA6xQU4G3txAiaVnYf5mKXrh5NVMx
         8WKOVw05IlEZqbRslOLcfLftiP1t7wSXk6upf0mkEXOltkQXLGDblDJYbAyblP1aofye
         HmfrfCsL9vIcworXArITFbguavNc08Vhd1e5dhMKjxT9v65dACwAT/nF3A/5h4gjdnU9
         CxU5zC4pkb69aeCsipH5LVAMG7Lxcp6rMwt73iSDSgpRLaTLZKPhp4cyOjorQAlDmk1z
         ua4A==
X-Forwarded-Encrypted: i=1; AJvYcCU0PfVpIifX23jAXok8Ren5IcDGx7OT9Z/JT/15BE6/0rdUMgayzXN2dGDcVxsPsQu+/aNz4eiD7Eg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyI4NOnb7/FgNNqx32R7rwffHwTXzsFCK7yKr2QhDS0eeNTMAX+
	1FKwW7XI59LVd0nHJXNSvSSGMo0XWu9nREQkPNBRlAMYfRi/BG/my4MJYo/eDkAV6Q==
X-Gm-Gg: ASbGncsAphY0IPJEhxJvfjiCV/98ye1+p+lqLYY0xHnMeJDgPgKrsVnECy6IHXrqmhx
	3gm4U2pQ5vvcXz5Zap+eId4osdG8rmwtxG31u6DuxDQUu+/k08HDVdTRtVvEdLoZuy8/7g4QOBp
	iYt7CGywRK7RESAMJ10aQW78785Wp0zlzFbUj1wGD8Ecf/k7WKZA+QLewx1/M019ylRJpiJxwx5
	sL4ULKIKrTcSmtpR7fgDSsHwjICEwWD4Y+egqp/XSQJOMt/KfjoSFwweq49HVJ7BmT2+3Ewe4MZ
	PEph+sAX4hcWjBLzShl/FV2OEdBWkMji2aSdJhlzZBcoofIKYy3j8LFN9y5GYSNO34GYX3y9
X-Google-Smtp-Source: AGHT+IE9veAHiVEh9xD0E3zlqfCkraRawDf44MdYyhdmNw8MLVboMomansjQFhEegqSAlg1gPCU3UA==
X-Received: by 2002:a05:6402:27d1:b0:5fc:a51a:9c03 with SMTP id 4fb4d7f45d1cf-6010aa8c85bmr10793649a12.0.1747660035643;
        Mon, 19 May 2025 06:07:15 -0700 (PDT)
Message-ID: <19014158-499b-4ce1-ac2e-fa4eda69151a@suse.com>
Date: Mon, 19 May 2025 15:07:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/10] vpci: Refactor REGISTER_VPCI_INIT
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Huang, Ray" <Ray.Huang@amd.com>
References: <20250509090542.2199676-1-Jiqian.Chen@amd.com>
 <20250509090542.2199676-5-Jiqian.Chen@amd.com>
 <0a6f40a9-a0ea-4652-8692-acfcf873463a@suse.com>
 <BL1PR12MB5849F798B49855278B1AB2B9E79CA@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <BL1PR12MB5849F798B49855278B1AB2B9E79CA@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.05.2025 08:56, Chen, Jiqian wrote:
> On 2025/5/18 22:34, Jan Beulich wrote:
>> On 09.05.2025 11:05, Jiqian Chen wrote:
>>> --- a/xen/drivers/vpci/msi.c
>>> +++ b/xen/drivers/vpci/msi.c
>>> @@ -270,7 +270,7 @@ static int cf_check init_msi(struct pci_dev *pdev)
>>>  
>>>      return 0;
>>>  }
>>> -REGISTER_VPCI_INIT(init_msi, VPCI_PRIORITY_LOW);
>>> +REGISTER_VPCI_LEGACY_CAP(PCI_CAP_ID_MSI, init_msi, NULL);
>>
>> To keep identifier length bounded, how about REGISTER_VPCI_CAP() here
>> and ...
>>
>>> --- a/xen/drivers/vpci/rebar.c
>>> +++ b/xen/drivers/vpci/rebar.c
>>> @@ -118,7 +118,7 @@ static int cf_check init_rebar(struct pci_dev *pdev)
>>>  
>>>      return 0;
>>>  }
>>> -REGISTER_VPCI_INIT(init_rebar, VPCI_PRIORITY_LOW);
>>> +REGISTER_VPCI_EXTENDED_CAP(PCI_EXT_CAP_ID_REBAR, init_rebar, NULL);
>>
>> ... and REGISTER_VPCI_EXTCAP() here?
> 
> If so, I need to change the name of REGISTER_VPCI_CAP to be _REGISTER_VPCI_CAP ?
> 
> #define REGISTER_VPCI_CAP(cap, finit, fclean, ext) \
>   static vpci_capability_t finit##_t = { \
>         .id = (cap), \
>         .init = (finit), \
>         .cleanup = (fclean), \
>         .is_ext = (ext), \
>   }; \
>   static vpci_capability_t *const finit##_entry  \
>                __used_section(".data.vpci") = &finit##_t

That's a reserved name then. Since it's used only twice (to produce the
other two macros), REGISTER_PCI_CAPABILITY() maybe? Or one of
REGISTER_PCI__CAP() / REGISTER_PCI_CAP_()?

Jan

