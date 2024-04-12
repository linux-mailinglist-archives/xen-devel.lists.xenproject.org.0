Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E30788A2B63
	for <lists+xen-devel@lfdr.de>; Fri, 12 Apr 2024 11:41:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704472.1100895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvDNt-0001j2-U2; Fri, 12 Apr 2024 09:39:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704472.1100895; Fri, 12 Apr 2024 09:39:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvDNt-0001gf-RB; Fri, 12 Apr 2024 09:39:49 +0000
Received: by outflank-mailman (input) for mailman id 704472;
 Fri, 12 Apr 2024 09:39:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yOJy=LR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rvDNt-0001gA-8T
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2024 09:39:49 +0000
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [2607:f8b0:4864:20::f34])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9966d2bd-f8b0-11ee-94a3-07e782e9044d;
 Fri, 12 Apr 2024 11:39:47 +0200 (CEST)
Received: by mail-qv1-xf34.google.com with SMTP id
 6a1803df08f44-69b10ead8f5so3401846d6.0
 for <xen-devel@lists.xenproject.org>; Fri, 12 Apr 2024 02:39:47 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 p9-20020a0ccb89000000b0069924cce40esm2089003qvk.29.2024.04.12.02.39.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Apr 2024 02:39:45 -0700 (PDT)
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
X-Inumbo-ID: 9966d2bd-f8b0-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712914786; x=1713519586; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=a01fB47i5xoD64l27Kgm4NfFkTcyzlGYPI0UsFuaBYY=;
        b=VCTW1mNNzxIdmG3MfTCd0Z1PvyQP2mE5liilbXyavnuPVkjfAoRZO0UwhpRCpM42ul
         V0EUi1QbnhCKS4DCnLP3a3so6urlM+tpeAK3ucVnOuARLSUteBikyak4Wxx+/qYzU0ZL
         WwGAoNN6lGNckyPHoIKLe8kDFYggR7/VsW6BI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712914786; x=1713519586;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a01fB47i5xoD64l27Kgm4NfFkTcyzlGYPI0UsFuaBYY=;
        b=Cr9WhH8+PJXoba3Vo/4St3Crp39de1uHy01jwtgah4/fkGvSCyjrPMRF3yZO258FQK
         n2aQlP9rXkmYVGCwn/XVIkekb0i/NunxQnNCrHgjVQFmN6geD8IhAPU5CNi9KoKoK09O
         PV2QaRlXEXiEPYev/B6sh2aXqYUgPXwZYdfpx/010PcSi3tiv3wbtXZTDFfMnjC0EtpS
         cXl5GQaJC/dv2td4B+762WvMTnMNw1MUliHSoA29Uq4shV2QacF59DkRUGXignQxQLbV
         i2Di4YJLBR0AnmSm2qttI2p/xFIxyfiPzPoiTPsW98wr+3HTeXsWcET6/+cOBgCZxG8/
         g3BA==
X-Forwarded-Encrypted: i=1; AJvYcCUk//ieOgVBfBuqf6xFgbOEkl/2WW0cis5weOCUEKRLqocMc3ce99OD7LpWHpiz/7L00KCob7UhzIx2mj14WMxKrYg8HyYcvuVfOSFbwMc=
X-Gm-Message-State: AOJu0YzVDHmQIJTf+fNzhIkRi821H8T1azH9HwoTMMGD+vVW0qzli5MF
	hLR4Yz0VGG7Bi7mlXY6UO3Js0MLMX07BF7RL/Qfhb8N0OWy8iayMLfYrR/Y8L6g=
X-Google-Smtp-Source: AGHT+IGw20vQZzbVYn+xfgy6VOe7HZBqTxMEFMToKhB02srpWbas1zQBa3MubZg5lYOf7ChrrGOnKw==
X-Received: by 2002:ad4:4591:0:b0:69b:5552:6cd0 with SMTP id x17-20020ad44591000000b0069b55526cd0mr2232553qvu.60.1712914785978;
        Fri, 12 Apr 2024 02:39:45 -0700 (PDT)
Message-ID: <21e60cc9-e65c-46c1-b01f-b9839c70627d@citrix.com>
Date: Fri, 12 Apr 2024 10:39:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 0/3] x86/iommu: Drop IOMMU support when cx16 isn't
 supported
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1712580356.git.teddy.astie@vates.tech>
 <4bf2e6ea-a7fc-4cc6-aefe-4a9ed9ae97e1@citrix.com>
 <c7fd7e96-714e-486a-9c67-e5e881218303@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <c7fd7e96-714e-486a-9c67-e5e881218303@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/04/2024 9:31 am, Teddy Astie wrote:
> Le 11/04/2024 à 22:05, Andrew Cooper a écrit :
>> On 08/04/2024 2:02 pm, Teddy Astie wrote:
>>> All hardware that supports VT-d/AMD-Vi that exists also supports cx16 (aside
>>> specifically crafted virtual machines).
>>>
>>> Some IOMMU code paths in Xen consider cases where VT-d/AMD-Vi is supported
>>> while cx16 isn't, those paths may be bugged and are barely tested, dead code
>>> in practice.
>>>
>>> Disable IOMMU in case we have IOMMU hardware but no cx16, then cleanup
>>> no-cx16 handling logic from VT-d and AMD-Vi drivers.
>>>
>>> Teddy
>>>
>>> Changed in v2:
>>>
>>>   * Added cleanup no-cx16 code for x2APIC
>>>   * Fixed commit and code formatting
>>>   * Added missing Suggested-by note
>>>
>>> Teddy Astie (3):
>>>    VT-d: Disable IOMMU if cx16 isn't supported
>>>    AMD-Vi: Disable IOMMU if cx16 isn't supported
>>>    VT-d: Cleanup MAP_SINGLE_DEVICE and related code
>>>
>>>   xen/arch/x86/apic.c                         |  6 ++
>>>   xen/drivers/passthrough/amd/iommu_map.c     | 42 ++++------
>>>   xen/drivers/passthrough/amd/pci_amd_iommu.c |  6 ++
>>>   xen/drivers/passthrough/vtd/intremap.c      | 65 ++++-----------
>>>   xen/drivers/passthrough/vtd/iommu.c         | 92 +++++++--------------
>>>   xen/drivers/passthrough/vtd/vtd.h           |  5 +-
>>>   6 files changed, 71 insertions(+), 145 deletions(-)
>>>
>> Sorry, but you've sent out two copies of each patch in this series, and
>> it's not clear if they're identical or not.
>>
>> Please could you send out another version, making sure there's only one
>> of each patch.
>>
>> Also, you need to swap ENOSYS with ENODEV, as per Jan's review on v1.
>>
>> Thanks,
>>
>> ~Andrew
> Hello,
>
> Not entirely sure why it got sent twice, as marek said he only received 
> it once. Will double-check next time to avoid this issue in case I 
> wrongfully sent it twice.

Huh, lore agrees.  I seem to have both a direct and list copy which
weren't correctly deduplicated.

Sorry for the noise.

> Will also swap ENOSYS with ENODEV in the next version.

Thanks.

~Andrew

