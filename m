Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCF755FB1E
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 10:56:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357672.586390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6TUB-0000bN-Fr; Wed, 29 Jun 2022 08:55:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357672.586390; Wed, 29 Jun 2022 08:55:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6TUB-0000Ym-Ce; Wed, 29 Jun 2022 08:55:47 +0000
Received: by outflank-mailman (input) for mailman id 357672;
 Wed, 29 Jun 2022 08:55:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M2+n=XE=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o6TU9-0000Yg-Kx
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 08:55:45 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4250955f-f789-11ec-b725-ed86ccbb4733;
 Wed, 29 Jun 2022 10:55:43 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id z7so21178707edm.13
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jun 2022 01:55:43 -0700 (PDT)
Received: from [192.168.1.10] (adsl-146.37.6.170.tellas.gr. [37.6.170.146])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a50ef02000000b00435a997303bsm10856710eds.71.2022.06.29.01.55.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jun 2022 01:55:42 -0700 (PDT)
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
X-Inumbo-ID: 4250955f-f789-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=a9tIi6HYyRb2sSQBzHY+oz4F33gAZEPkOS4Qjxp2mFQ=;
        b=KGkpKckxBVvgdjqVpwXKKPeHV8DzC8rrgfszKsJG6Q+Nh3utKjVNWa01m89fKDfUGb
         VsIvU8QDUaR4zMdCxQmobWzaLUODIU2ZNtbRsCyxRpffK3E9wGmIBFX3ztUPAeotnRiF
         hw8VtlUbMUcwJJphqAdOQicZdK+Zbdja3BKUxJEA4JOwccTq7xbA/ulZQWHXxWFd5RtF
         e2FzodqLizy/TQqzOZY/siNKQ4DhmsBxKqNvjFPcWRCu1e7k4tcN++2QqcUwoKggl6kk
         X8BEQiiJqvr41n/rUGVmoualAJk4nIc32k2f0qB8vu6Kzf9JjYdrdopM6mA4XUv7wHrQ
         oCBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=a9tIi6HYyRb2sSQBzHY+oz4F33gAZEPkOS4Qjxp2mFQ=;
        b=ohyFWQUA334VdjYI23WMlHKNvl5G3OahmXkzNP/UFtVzwgCtdzpxZvaiYIdWiSNEkA
         OaLtK2Ei0qjySS6aW6RZFNMoDWJyPF3nTh2VsuvlltWDO0or3TzpUYXDLwfvrZdeiLWN
         4b4LxuuHUMBxaVJLOrmLGF4gY2GTsb5lldj0FeRXs/+aAxhVThgloh5UxBgsZUUbtqG9
         OA/cO4NJkmOmxKqLzjwx5eYK5rlbGCK+O8sIFeoyiGkb1DVTVuFQODwzDggl6BfVRZLU
         LFjeNyDHhtR6DB3MOfBZ7AWvt5KxzvcF4KPOU116KnS3WqG0cSkYxXDuI9OHyYBcBO8C
         1zsg==
X-Gm-Message-State: AJIora+WVW4Dfz/5mGeEH8D17dt3aoYyRvzjKOc9mYfg50kCLCKx/BYq
	dHfzZXjfRKptKLnpfkf7IRg=
X-Google-Smtp-Source: AGRyM1sQQ8xSC1e90xCoGar4UlhfsKnSI6v82HegzykaRJG1YtMSpRmtoOSZOEvL+udqyju3cGIDNQ==
X-Received: by 2002:aa7:dad6:0:b0:435:7a44:7480 with SMTP id x22-20020aa7dad6000000b004357a447480mr2834027eds.138.1656492943326;
        Wed, 29 Jun 2022 01:55:43 -0700 (PDT)
Message-ID: <1b28f8b2-2153-61f6-515f-b2ed880f84b6@gmail.com>
Date: Wed, 29 Jun 2022 11:55:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] xen/arm: smmu-v3: Fix MISRA C 2012 Rule 1.3 violations
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Rahul Singh <Rahul.Singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220628150851.8627-1-burzalodowa@gmail.com>
 <BF0AB23A-DB4B-4DA3-9E4C-C15FAD360247@arm.com>
From: xenia <burzalodowa@gmail.com>
In-Reply-To: <BF0AB23A-DB4B-4DA3-9E4C-C15FAD360247@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 6/29/22 10:24, Bertrand Marquis wrote:
> Hi Xenia,
>
>> On 28 Jun 2022, at 16:08, Xenia Ragiadakou <burzalodowa@gmail.com> wrote:
>>
>> The expression 1 << 31 produces undefined behaviour because the type of integer
>> constant 1 is (signed) int and the result of shifting 1 by 31 bits is not
>> representable in the (signed) int type.
>> Change the type of 1 to unsigned int by adding the U suffix.
>>
>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
>> ---
>> Q_OVERFLOW_FLAG has already been fixed in upstream kernel code.
>> For GBPA_UPDATE I will submit a patch.
>>
>> xen/drivers/passthrough/arm/smmu-v3.c | 4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
>> index 1e857f915a..f2562acc38 100644
>> --- a/xen/drivers/passthrough/arm/smmu-v3.c
>> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
>> @@ -338,7 +338,7 @@ static int platform_get_irq_byname_optional(struct device *dev,
>> #define CR2_E2H				(1 << 0)
>>
>> #define ARM_SMMU_GBPA			0x44
>> -#define GBPA_UPDATE			(1 << 31)
>> +#define GBPA_UPDATE			(1U << 31)
>> #define GBPA_ABORT			(1 << 20)
>>
>> #define ARM_SMMU_IRQ_CTRL		0x50
>> @@ -410,7 +410,7 @@ static int platform_get_irq_byname_optional(struct device *dev,
>>
>> #define Q_IDX(llq, p)			((p) & ((1 << (llq)->max_n_shift) - 1))
>> #define Q_WRP(llq, p)			((p) & (1 << (llq)->max_n_shift))
> Could also make sense to fix those 2 to be coherent.
According to the spec, the maximum value that max_n_shift can take is 19.
Hence, 1 << (llq)->max_n_shift cannot produce undefined behavior.

Personally, I have no problem to submit another patch that adds U/UL 
suffixes to all shifted integer constants in the file :) but ...
It seems that this driver has been ported from linux and this file still 
uses linux coding style, probably because deviations will reduce its 
maintainability.
Adding a U suffix to those two might be considered an unjustified 
deviation.
>> -#define Q_OVERFLOW_FLAG			(1 << 31)
>> +#define Q_OVERFLOW_FLAG			(1U << 31)
>> #define Q_OVF(p)			((p) & Q_OVERFLOW_FLAG)
>> #define Q_ENT(q, p)			((q)->base +			\
>> 					 Q_IDX(&((q)->llq), p) *	\
> Cheers
> Bertrand
>

