Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16510ABB566
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 08:56:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989552.1373574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGuPu-0006u1-F3; Mon, 19 May 2025 06:56:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989552.1373574; Mon, 19 May 2025 06:56:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGuPu-0006rD-Bq; Mon, 19 May 2025 06:56:06 +0000
Received: by outflank-mailman (input) for mailman id 989552;
 Mon, 19 May 2025 06:56:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cAbn=YD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uGuPt-0006r7-9Z
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 06:56:05 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5448ba20-347e-11f0-9ffb-bf95429c2676;
 Mon, 19 May 2025 08:56:03 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43ede096d73so27664965e9.2
 for <xen-devel@lists.xenproject.org>; Sun, 18 May 2025 23:56:03 -0700 (PDT)
Received: from [192.168.61.201] (server.hotelpassage.eu. [88.146.207.194])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442fa3e2ce5sm147368205e9.13.2025.05.18.23.56.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 May 2025 23:56:02 -0700 (PDT)
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
X-Inumbo-ID: 5448ba20-347e-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747637763; x=1748242563; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X0/GKlPUvMupEP+ImHEQUJ1iTl4muMylQqwc7FvNiE0=;
        b=SawvEYuTanQARkZHTpBWdj8rn1gkvtYTIy8vOBK0lGuyyjmqeCAgpfupAHRO/ahqeR
         Q5sYDiW2CW361MqGXwSywjKefbWkKl/6GycwPkhVWvngGhPUIP8oLkw+Mkai0PiiQGjW
         MAfM1iQn1p1PcZMy/C1e+DhCZjIzmT7qEfUGvABjFajJb7wPfJQBuPW0ZYo5csVB6G2o
         1i8e0zqbfnFoKc5n8YhBTn+75yoI9Z4cyTuAchHPC61KuByXWBmbkq4i1HaFBivX1qzm
         5rOfgHjB0FubNDECYT0iQhAIZ47bYN5nz1ZFW5PjQ0PZxrzl/o1G6EbWNXRUW+4dAW/6
         omQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747637763; x=1748242563;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X0/GKlPUvMupEP+ImHEQUJ1iTl4muMylQqwc7FvNiE0=;
        b=vg0Sb89Qq89RbMbI84qFdBOcr0XSrolfqn8YhXr/fycu8QtXruBAfpEE1kvGpAi/O3
         1uGcxdBi5+802UmBdlGlKZ7BUVMbc6heNHYH7yIMLa1My+mzJYQekPVwvvhVwvSg5tml
         5i+hmiOGXiJX2RlAU50o/wqiwhhVA2j46NmOiTbn51q4D9kEUm6lQ2YKql6DOCnvv1gM
         i8jS4UO8+2VN0iuOL2UZQ0ImiSHti11wDk3b28mvAZUmduJQ/ByaHdNL10jUvKgfcUDz
         O1niHIrln3+2bQlwuz7vvMrYziPLuC+nOUn1CYjb5+Ie5p+AGxcgz+N/gKOBo6/ifnDo
         SaTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPCN/HnuXz+KizVmMO7w7XM+vSmYXaHnl780V34SEBuaz0CLa8yY16PWMtwFtiSehmFG4Y89/nIkQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyww6mnGq+SMAul1f5pk7MOjLf9li2tfUA9b5xMPP/HHRxmAxui
	PeoPvSgd2XOEhHAL1SRq47VYaUguwqHVQMFvAZo8wXYzQ/ZHVfywoPF69VgeeFsIIg==
X-Gm-Gg: ASbGnctu5O2gWFxPGyjnNUiZq5O8xf1tSCCqIs/YKHD8o71cJs00SE8EgNpIlINkmPa
	z/d5o0+jt0GKRE770Eoijk+aIdoHslj6YA4TCcjMx3z4Cl+D5CkfJrgQizoi9re7Sq/zohSnsRA
	hxZx9wqFyxsP7nzy84lPdknB1ll4fy/6k6vVHewJ14Y6tAxBFRgYPV8x8VQahUn+e0eEZPferbo
	nNyBF72JPU9dzy7eiUB5l1u+98BadNolGgOwrFrhkBsnK2l2ay1sB6TpI7L8DdNTgwcGcbgeDS4
	KDrRAsOPsNQU33mHQHOqL3fgmkgXtnP3CCky6cRMa144auEjco6vbPk9+Xp6/OHwvYOOWQguoMs
	eSYUgrQOxWIUHMpVbwK3u
X-Google-Smtp-Source: AGHT+IH7v/Sxv1+T2Zg7DXIuADO4w8Glt3dyNf6FH7kbDHDkSg+Znm5kKu7jYQhu+KD9XFq2gjhpSw==
X-Received: by 2002:a05:600c:a378:b0:43c:f70a:2af0 with SMTP id 5b1f17b1804b1-442fd64dfb3mr138504055e9.16.1747637762880;
        Sun, 18 May 2025 23:56:02 -0700 (PDT)
Message-ID: <bcdc0848-0c12-4ee0-b923-c7d5243bf097@suse.com>
Date: Mon, 19 May 2025 08:56:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/10] vpci/header: Emulate extended capability list
 for dom0
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Huang, Ray" <Ray.Huang@amd.com>
References: <20250509090542.2199676-1-Jiqian.Chen@amd.com>
 <20250509090542.2199676-4-Jiqian.Chen@amd.com>
 <b569f90b-673d-44c0-b350-8a6f5f3c8d78@suse.com>
 <BL1PR12MB5849E0E13D669CE6B2755399E79CA@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <BL1PR12MB5849E0E13D669CE6B2755399E79CA@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.05.2025 08:43, Chen, Jiqian wrote:
> On 2025/5/18 22:20, Jan Beulich wrote:
>> On 09.05.2025 11:05, Jiqian Chen wrote:
>>> @@ -827,6 +827,34 @@ static int vpci_init_capability_list(struct pci_dev *pdev)
>>>                                                   PCI_STATUS_RSVDZ_MASK);
>>>  }
>>>  
>>> +static int vpci_init_ext_capability_list(struct pci_dev *pdev)
>>> +{
>>> +    unsigned int pos = PCI_CFG_SPACE_SIZE, ttl = 480;
>>
>> The ttl value exists (in the function you took it from) to make sure
>> the loop below eventually ends. That is, to be able to kind of
>> gracefully deal with loops in the linked list. Such loops, however,
>> would ...
>>
>>> +    if ( !is_hardware_domain(pdev->domain) )
>>> +        /* Extended capabilities read as zero, write ignore for guest */
>>> +        return vpci_add_register(pdev->vpci, vpci_read_val, NULL,
>>> +                                 pos, 4, (void *)0);
>>> +
>>> +    while ( pos >= PCI_CFG_SPACE_SIZE && ttl-- )
>>> +    {
>>> +        uint32_t header = pci_conf_read32(pdev->sbdf, pos);
>>> +        int rc;
>>> +
>>> +        if ( !header )
>>> +            return 0;
>>> +
>>> +        rc = vpci_add_register(pdev->vpci, vpci_read_val, vpci_hw_write32,
>>> +                               pos, 4, (void *)(uintptr_t)header);
>>
>> ... mean we may invoke this twice for the same capability. Such
>> a secondary invocation would fail with -EEXIST, causing device init
>> to fail altogether. Which is kind of against our aim of exposing
>> (in a controlled manner) as much of the PCI hardware as possible.
> May I know what situation that can make this twice for one capability when initialization?
> Does hardware capability list have a cycle?

Any of this is to work around flawed hardware, I suppose.

>> Imo we ought to be using a bitmap to detect the situation earlier
>> and hence to be able to avoid redundant register addition. Thoughts?
> Can we just let it go forward and continue to add register for next capability when rc == -EXIST, instead of returning error ?

Possible, but feels wrong.

Jan

