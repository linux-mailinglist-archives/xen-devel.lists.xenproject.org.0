Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D348A894AE
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 09:16:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.952136.1347676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4aWF-0001VL-Jm; Tue, 15 Apr 2025 07:15:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 952136.1347676; Tue, 15 Apr 2025 07:15:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4aWF-0001Sm-GM; Tue, 15 Apr 2025 07:15:43 +0000
Received: by outflank-mailman (input) for mailman id 952136;
 Tue, 15 Apr 2025 07:15:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0g1d=XB=gmail.com=sultanovandriy@srs-se1.protection.inumbo.net>)
 id 1u4aWE-0001Sg-Pe
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 07:15:42 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ec0e22d-19c9-11f0-9ffb-bf95429c2676;
 Tue, 15 Apr 2025 09:15:38 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3912d2c89ecso4847640f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 00:15:38 -0700 (PDT)
Received: from [192.168.0.18]
 (cpc92320-cmbg19-2-0-cust1786.5-4.cable.virginm.net. [82.13.70.251])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f205ecb20sm201342685e9.3.2025.04.15.00.15.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 00:15:37 -0700 (PDT)
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
X-Inumbo-ID: 6ec0e22d-19c9-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744701338; x=1745306138; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oxMl+RWxGC5UTsVMe/Vr9iHGIjVeuA3hV/bTpsB/Vok=;
        b=GhHDzHsVV7mZkfsmv61Unk1bDMsFZqi+rzjdn2RmXJIiMaRF/ejWx3TwtrSSvCTNuB
         aD3prv1z6H4cWE8fAW9HYthh4cVGN0qIZEZqXrFNM3ffu0/IDMZxaEOuxnu/EVbFLHok
         51TOM1Gbim8R+whjHnMVsqc0C+QGKsfVNGbCrzgHykFtzxhpyohSfmRSypGr1qB5E8OM
         qKYN1kwooGquPyH0fKdUwuEnib4lfPHfSTV+uKcMx+uxzm2xaBsxNqJytgZAiJwqRmXj
         igVSFVr2dZ4mc72kTmR3JPtk4eNzNO29BbJQEodiB/zGGDWFKSl1AIjNszFQhpnbcw0I
         BvEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744701338; x=1745306138;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oxMl+RWxGC5UTsVMe/Vr9iHGIjVeuA3hV/bTpsB/Vok=;
        b=bHedbCsLCVIFEa0yPunvw6RElTZy1Q3RE/Pb7J/qmnOX6eO5ltvl/hUsZT66CzKKKL
         ulOdnPRlJ8PQA0jE+gRxBdc95fxVWNn4v9NmIh84qBHAfHK7X/Qx5eXn9IKiiJZ84tKO
         UZNzrH5Hvsva2/yj/V5WSmMdJUwXx5T0LmIYpMpoYtro4tJKYA5mBgiGEs2UCStWeDQt
         pOuiPdidQWp51Fr468/0WOKrM+WVGY4YMov1T73pgZPe0M1AzmpZqiroqTx8hFDztnJQ
         VhQpfvXoZ9Vyb/pEIf6RShIvnuNW1r+kNkmugf29VVLUunlaNnmIH1etZilMID5u/hXO
         P21g==
X-Gm-Message-State: AOJu0Yy+Db6pLQWzF4E+vt4XqDTG36r8C3cpgh1Q2kfveOeCVle0psV6
	THk1BoLQ3n6Mqp90/DbcMvIso2/tqDV6WQo20BzEV5qES6MeUt0m
X-Gm-Gg: ASbGncuADy37YbvoYh7C4Tem4SNmhHDtTNUCg+TapMRgJU3qvDoDAJC8fIamuegmd7R
	MQ/m+nX6ndXTmRgRa6nUGLDWavY0S1uWaVFLMPNomG5E1QFmdQLlw1A51j1ZSjWKop5Cpd1r2aA
	r1NpZ4ssXX6D7Q5bIdHMQJ8KcHM7EzNcrPpBi0xCKgVrdk86rZ9FRUGtyKpXcFWofq9gaQx+XHN
	b/uD2kladW8aC8JT8H0+ONmNJSapOjptnRcbdES3aqu9YKmeJJBS8TFvGIZLX/hpRahZ3D0Ku/Z
	c92/BNc+Z4DSz/KdHNih9oauLrAOlvPkGelW3QDRfk1vrrRFjj9ITjTg9feteJXYOBIry1a43cx
	BCJ1ulwjzoOZp5DzLiya/fOEpGiWQ2Rw=
X-Google-Smtp-Source: AGHT+IGqlNCUmoxPVFelFlZ6YPysFg2Y5wBQIq333q+6w6pm/RobNZxzvncpmdquf24FnAKPohSMuQ==
X-Received: by 2002:a05:6000:400f:b0:39c:dfa:d33e with SMTP id ffacd0b85a97d-39ea52154a0mr12395415f8f.23.1744701337762;
        Tue, 15 Apr 2025 00:15:37 -0700 (PDT)
Message-ID: <d2ced4d6-b5d0-4cc4-94c7-74c7f6045575@gmail.com>
Date: Tue, 15 Apr 2025 08:15:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] drivers: Make ioapic_sbdf and hpet_sbdf contain
 pci_sbdf_t
To: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1744657012.git.andriy.sultanov@vates.tech>
 <af7536c3234bc7a9d048b4cb1d45f084b4343bdb.1744657012.git.andriy.sultanov@vates.tech>
 <Z/4FH68RJtMp34qU@starscream>
Content-Language: en-US
From: Andriy Sultanov <sultanovandriy@gmail.com>
In-Reply-To: <Z/4FH68RJtMp34qU@starscream>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/15/25 8:05 AM, dmkhn@proton.me wrote:

>> --- a/xen/drivers/passthrough/amd/iommu_acpi.c
>> +++ b/xen/drivers/passthrough/amd/iommu_acpi.c
>> @@ -707,8 +707,7 @@ static int __init cf_check parse_ivrs_ioapic(const char *str)
>>           }
>>       }
>>
>> -    ioapic_sbdf[idx].bdf = PCI_BDF(bus, dev, func);
>> -    ioapic_sbdf[idx].seg = seg;
>> +    ioapic_sbdf[idx].sbdf = PCI_SBDF( seg, PCI_BDF(bus, dev, func) );
> PCI_SBDF() is a variadic macro, so, IMO, the line above can be simplified as:
>
>         ioapic_sbdf[idx].sbdf = PCI_SBDF( seg, bus, dev, func );
>
> Ex: pdev_type() in xen/drivers/passthrough/pci.c
>
> Can you please double check in the modified code?
>
>>       ioapic_sbdf[idx].id = id;
>>       ioapic_sbdf[idx].cmdline = true;
>>
>> @@ -734,8 +733,7 @@ static int __init cf_check parse_ivrs_hpet(const char *str)
>>           return -EINVAL;
>>
>>       hpet_sbdf.id = id;
>> -    hpet_sbdf.bdf = PCI_BDF(bus, dev, func);
>> -    hpet_sbdf.seg = seg;
>> +    hpet_sbdf.sbdf = PCI_SBDF( seg, PCI_BDF(bus, dev, func) );
>                          ^^
>                          e.g. here it can be simplified too.
You are right, PCI_SBDF(sef, bus, dev, func) works here and above. Will 
resend.
>> @@ -1139,9 +1135,9 @@ static int __init cf_check parse_ivrs_table(struct acpi_table_header *table)
>>                   return -ENXIO;
>>           }
>>
>> -        if ( !ioapic_sbdf[idx].seg &&
>> +        if ( !ioapic_sbdf[idx].sbdf.seg &&
>>                /* SB IO-APIC is always on this device in AMD systems. */
>> -             ioapic_sbdf[idx].bdf == PCI_BDF(0, 0x14, 0) )
>> +             ioapic_sbdf[idx].sbdf.bdf == PCI_BDF(0, 0x14, 0) )
> Looks like something like the following should work:
>
>            if ( ioapic_sbdf[idx].sbdf.sbdf == PCI_SBDF(0, 0, 0x14, 0).sbdf )
>
> What do you think?

Will replace this one as well.

Thank you!



