Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2370051020D
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 17:38:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314027.531892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njNGI-0003Et-VQ; Tue, 26 Apr 2022 15:37:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314027.531892; Tue, 26 Apr 2022 15:37:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njNGI-0003CF-SU; Tue, 26 Apr 2022 15:37:58 +0000
Received: by outflank-mailman (input) for mailman id 314027;
 Tue, 26 Apr 2022 15:37:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ckxI=VE=gmail.com=p4ranlee@srs-se1.protection.inumbo.net>)
 id 1njNGH-0003C7-91
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 15:37:57 +0000
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [2607:f8b0:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d722a0ef-c576-11ec-a405-831a346695d4;
 Tue, 26 Apr 2022 17:37:56 +0200 (CEST)
Received: by mail-pl1-x633.google.com with SMTP id u7so15227021plg.13
 for <xen-devel@lists.xenproject.org>; Tue, 26 Apr 2022 08:37:56 -0700 (PDT)
Received: from [192.168.0.18] ([118.33.58.98])
 by smtp.gmail.com with ESMTPSA id
 a187-20020a6366c4000000b003ab9d95794esm1746674pgc.16.2022.04.26.08.37.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 08:37:53 -0700 (PDT)
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
X-Inumbo-ID: d722a0ef-c576-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:references:from
         :cc:in-reply-to:content-transfer-encoding;
        bh=IebQ5LigAN+2AhkZSSlulrmlCDIY0obAkVvfez4z1qI=;
        b=MV4go5IgBXg3ZAZr56JI9xUZkkKa+g5qPYEhj4/Oadap/rPtW7RSpGG6ZQlMogBpW/
         Jxa1CtOgljbF89WJRxbZJQ0s2JK4tO+kVryUu5ryyNe08nwkR/LDFuZwoaXYr7UIWyzH
         CANzRAfIDtmtZI0lWEG2a5uzyMsXFCyzGn6c+nbd2qZMzN8Svb6feNJvXHhb9JCNJo32
         xiaE9n86c296FEyHCF8CboZzQzS3wxCCRIrYgNDiG+a1tbs/gt+NNXE+2cML3lKMHm/z
         CqzpNWHfjgxa5x5TjssbRMvsnu7LHuL5DzrvhWJqLGBzp3nqNP8qb9cNpdaxRTMJcGUL
         Sclw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:references:from:cc:in-reply-to:content-transfer-encoding;
        bh=IebQ5LigAN+2AhkZSSlulrmlCDIY0obAkVvfez4z1qI=;
        b=yLpblui4IRJ6XPcYMpqokqjg6tROPn68MFjstLXgZIRVbIuNalIGOXiBeKAlNpIFRP
         +zIRV/8NOBtrz5o4nT+KjASFNbbQiUSOc6oNcbc/9R3IkqWqaAX/Z1xyULPDnngpbIdc
         +nBiy5Z2LVGXzaAO6M8+pHv9j8vWTGnSkSdS2GVmZxtI313U5I2ot1nN5vcbQi37DRvq
         wopwgUbwhZpD+qg+VOCpB67hE+XOz1ZvKFBA5ZFYRx2bxtdhDMzggMKC8rKNuhZnz8WT
         8a29cK5IHvHT1ke7CF+xDEQNvJ9MkUWXHCwmBrzl5Ou4ezTEaCFsJX6FhdJbDAOIy9T+
         WERg==
X-Gm-Message-State: AOAM533+GnOZKYDJ91QdX0unSbVuqYhfRpqBGGPz2xMrp/2km8U6noc0
	CV+2S9XyTqkOAOaPHn1Wgus=
X-Google-Smtp-Source: ABdhPJw4FKqwhsBZUQggWtx7osrAP35i5qIddJJpY4OP9TdJBplRv+ivJ4mhvzDYfG7mfyJ+h5H96A==
X-Received: by 2002:a17:902:b606:b0:158:f7d1:c085 with SMTP id b6-20020a170902b60600b00158f7d1c085mr23769167pls.12.1650987474107;
        Tue, 26 Apr 2022 08:37:54 -0700 (PDT)
Message-ID: <086069c4-406b-ac33-7c44-8433980026fc@gmail.com>
Date: Wed, 27 Apr 2022 00:37:50 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] xen/arm: p2m_set_entry duplicate calculation.
To: Julien Grall <julien@xen.org>
References: <20220421151755.GA4718@DESKTOP-NK4TH6S.localdomain>
 <a160a77a-1cb2-c7cb-7d93-7334772620fe@xen.org>
From: Paran Lee <p4ranlee@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Austin Kim <austindh.kim@gmail.com>, xen-devel@lists.xenproject.org
In-Reply-To: <a160a77a-1cb2-c7cb-7d93-7334772620fe@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello, Julien Grall.

Thanks you, I agreed! It made me think once more about what my patch
could improve.
patches I sent have been reviewed in various ways. It was a good
opportunity to analyze my patch from various perspectives. :)

I checked objdump in -O2 optimization(default) of Xen Makefile to make
sure CSE (Common subexpression elimination) works well on the latest
arm64 cross compiler on x86_64 from  Arm GNU Toolchain.

$
~/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/bin/aarch64-none-linux-gnu-gcc
-v
...
A-profile Architecture 10.3-2021.07 (arm-10.29)'
Thread model: posix
Supported LTO compression algorithms: zlib
gcc version 10.3.1 20210621 (GNU Toolchain for the A-profile
Architecture 10.3-2021.07 (arm-10.29)

I compared the before and after my patches. This time, without adding a
"pages" variable, I proceeded to use the local variable mask with order
operation.

I was able to confirm that it does one less operation.

(1) before clean up

0000000000001bb4 <p2m_set_entry>:
    while ( nr )
    1bb4:       b40005e2        cbz     x2, 1c70 <p2m_set_entry+0xbc>
{
    ...
        if ( rc )
    1c1c:       350002e0        cbnz    w0, 1c78 <p2m_set_entry+0xc4>
        sgfn = gfn_add(sgfn, (1 << order));
    1c20:       1ad32373        lsl     w19, w27, w19   // <<< CES works
    1c24:       93407e73        sxtw    x19, w19        // <<< well!
    return _gfn(gfn_x(gfn) + i);
    1c28:       8b1302d6        add     x22, x22, x19
    return _mfn(mfn_x(mfn) + i);
    1c2c:       8b130281        add     x1, x20, x19
    1c30:       b100069f        cmn     x20, #0x1
    1c34:       9a941034        csel    x20, x1, x20, ne  // ne = any
    while ( nr )
    1c38:       eb1302b5        subs    x21, x21, x19
    1c3c:       540001e0        b.eq    1c78 <p2m_set_entry+0xc4>  // b.none

(2) Using again mask variable. mask = 1UL << order
code show me   sxtw    x19, w19    operation disappeared.

0000000000001bb4 <p2m_set_entry>:
    while ( nr )
    1bb4:       b40005c2        cbz     x2, 1c6c <p2m_set_entry+0xb8>
{
    ...
        if ( rc )
    1c1c:       350002c0        cbnz    w0, 1c74 <p2m_set_entry+0xc0>
        mask = 1UL << order;
    1c20:       9ad32373        lsl     x19, x27, x19   // <<< only lsl
    return _gfn(gfn_x(gfn) + i);
    1c24:       8b1302d6        add     x22, x22, x19
    return _mfn(mfn_x(mfn) + i);
    1c28:       8b130281        add     x1, x20, x19
    1c2c:       b100069f        cmn     x20, #0x1
    1c30:       9a941034        csel    x20, x1, x20, ne  // ne = any
    while ( nr )
    1c34:       eb1302b5        subs    x21, x21, x19
    1c38:       540001e0        b.eq    1c74 <p2m_set_entry+0xc0>  // b.none

I'll send you a follow-up patch I've been working on.

BR
Paran Lee

2022-04-25 오전 1:17에 Julien Grall 이(가) 쓴 글:
> Hi,
> 
> On 21/04/2022 16:17, Paran Lee wrote:
>> It doesn't seem necessary to do that calculation of order shift again.
> 
> I think we need to weight that against increasing the number of local
> variables that do pretty much the same.
> 
> This is pretty much done to a matter of taste here. IMHO, the original
> version is better but I see Stefano reviewed it so I will not argue
> against it.
> 
> That said, given you already sent a few patches, can you explain why you
> are doing this? Is this optimization purpose? Is it clean-up?
> 
>>
>> Signed-off-by: Paran Lee <p4ranlee@gmail.com>
>> ---
>>   xen/arch/arm/p2m.c | 9 +++++----
>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
>> index 1d1059f7d2..533afc830a 100644
>> --- a/xen/arch/arm/p2m.c
>> +++ b/xen/arch/arm/p2m.c
>> @@ -1092,7 +1092,7 @@ int p2m_set_entry(struct p2m_domain *p2m,
>>       while ( nr )
>>       {
>>           unsigned long mask;
>> -        unsigned long order;
>> +        unsigned long order, pages;
>>             /*
>>            * Don't take into account the MFN when removing mapping (i.e
>> @@ -1118,11 +1118,12 @@ int p2m_set_entry(struct p2m_domain *p2m,
>>           if ( rc )
>>               break;
>>   -        sgfn = gfn_add(sgfn, (1 << order));
>> +        pages = 1 << order;
> 
> Please take the opportunity to switch to 1UL.
> 
>> +        sgfn = gfn_add(sgfn, pages);
>>           if ( !mfn_eq(smfn, INVALID_MFN) )
>> -           smfn = mfn_add(smfn, (1 << order));
>> +           smfn = mfn_add(smfn, pages);
>>   -        nr -= (1 << order);
>> +        nr -= pages;
>>       }
>>         return rc;
> 
> Cheers,
> 

