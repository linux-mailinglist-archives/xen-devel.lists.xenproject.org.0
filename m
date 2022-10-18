Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B94602A8D
	for <lists+xen-devel@lfdr.de>; Tue, 18 Oct 2022 13:51:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424943.672661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okl7g-0000mu-T2; Tue, 18 Oct 2022 11:51:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424943.672661; Tue, 18 Oct 2022 11:51:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okl7g-0000kv-PN; Tue, 18 Oct 2022 11:51:04 +0000
Received: by outflank-mailman (input) for mailman id 424943;
 Tue, 18 Oct 2022 11:51:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j5CF=2T=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1okl7f-0000jl-Dw
 for xen-devel@lists.xenproject.org; Tue, 18 Oct 2022 11:51:03 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23e051bc-4edb-11ed-91b4-6bf2151ebd3b;
 Tue, 18 Oct 2022 13:51:02 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id w18so31510319ejq.11
 for <xen-devel@lists.xenproject.org>; Tue, 18 Oct 2022 04:51:02 -0700 (PDT)
Received: from [192.168.1.93] (adsl-214.109.242.138.tellas.gr.
 [109.242.138.214]) by smtp.gmail.com with ESMTPSA id
 e2-20020a170906314200b00730df07629fsm7590326eje.174.2022.10.18.04.51.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Oct 2022 04:51:01 -0700 (PDT)
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
X-Inumbo-ID: 23e051bc-4edb-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mZqYEXNeeyCRWnmLXFa73tj9RFkXn2K6wtJKVYhXjuw=;
        b=XDObaZs8RqivC0M2f4zsL2Y/MJKwgDZM0wmACDD5d4CHcSzul7QEJCbfMlnPAFRUJb
         OwEIqfLEWhk+Q36taCWdilweCqKU/kNW6t8YT6EbpWRCVfSrCWcE4ipBV0GBOekV0HrO
         C4n3LNe58T9OEi/UUUwpASVKjMuJzUkZMF2QmR3Z7EfQ+o3pQLurHIfxgryHGAL+nmhA
         MEORY6Besa/i3o5RwXIkENyAuUay4+M4NW8uti18m3FF4e8vq7usJKOpbnb/UPjC9vY0
         r5vyVU25EiATNJPscUxiDrbeL8t8xglblupoc/LwLoSN1UaRq1E5zis27TI+cc0NFo9U
         esrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mZqYEXNeeyCRWnmLXFa73tj9RFkXn2K6wtJKVYhXjuw=;
        b=n9AD6eubwdIo71/CdAMCVY7KrBdjjTENB5/g6c+c6OgHmNrni0LLu6lZkyNL/9Yocn
         UwpomDwUsTeOLZtVwSpN7OXaYixXR5kJUZq37e1ihxbY5UKI/76ToSF3+1VvLFqqqhrw
         OH9clWn1U+5lSC0IJ4fSF4rGaQVwbrFU6TEzmhkk3tl3g+KwZbqgAtnssnAO4gMLwS6t
         BGtO8ruUwbjHK7v4LBVdMDrytPTTrxf1ApMiABlp1VF2F756/4EE23/EhxUqY77JjgCO
         SZvFdbn5Me1eSs0HHgJZVew8Guq/djco23yuo1lmjvQvKwB52g4nF5MNKk4b20VaFWjN
         cVPw==
X-Gm-Message-State: ACrzQf38l4cDcfAuWzO20rqzUN550und1dFu50sIXn3kUIKZNit8q/ob
	VuQcsaixEFblNBDM7RgiJ2w=
X-Google-Smtp-Source: AMsMyM4A41SEvGlHEQv3ljC0LoiDOH/miep9IJe79rbMqB4a1n9C/c+cG1Z8SoUpVB7oTdlmUa54AA==
X-Received: by 2002:a17:906:9bc3:b0:78d:816f:3743 with SMTP id de3-20020a1709069bc300b0078d816f3743mr2106835ejc.380.1666093862269;
        Tue, 18 Oct 2022 04:51:02 -0700 (PDT)
Message-ID: <95183fbb-f578-4c87-a875-a1cf0437e7c0@gmail.com>
Date: Tue, 18 Oct 2022 14:51:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] xen/arm: p2m: fix pa_range_info for 52-bit pa range
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221017173209.236781-1-burzalodowa@gmail.com>
 <ddef5ab7-c217-546d-0e5d-294465a49586@amd.com>
 <65b46c0e-3499-ce6c-dcd6-76c506115c6e@gmail.com>
 <fbc42d87-e96f-3343-cc63-a14564549c02@xen.org>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <fbc42d87-e96f-3343-cc63-a14564549c02@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/18/22 13:56, Julien Grall wrote:

Hi Julien,

> Hi Xenia,
> 
> On 18/10/2022 11:27, Xenia Ragiadakou wrote:
>> On 10/18/22 12:02, Michal Orzel wrote:
>>
>> Hi Michal,
>>
>>> Hi Xenia,
>>>
>>> On 17/10/2022 19:32, Xenia Ragiadakou wrote:
>>>>
>>>>
>>>> Currently the pa_range_info for the 52-bit pa range advertizes that the
>>>> p2m root table consists of 8 concatenated tables at level 3, which does
>>>> not make much sense.
>>> I think the current code advertises 8 concatenated tables at level -1 
>>> (sl0=3 -> root_level=-1)
>>> which is obviously incorrect, but the commit msg should be updated.
>>
>> I did the same mistake in my email but I did not want to hijack the 
>> thread that 's why I did not come back to correct my error.
>> According to the manual, to support 52-bit pa range with 4KB granule 
>> with the root table at level -1, you need to set SL2=1 and SL0=0.
>> SL0=3 configures the root table at level 3.
> 
> Which section are you reading? Looking at the definition of VTCR_EL2.SL0 
> (D17-6375, ARM DDI 0487I.a), the field has different meaning depending 
> on whether the feature TTST (Small translation table) is present.
> 
> SL0 would be reserved when TTST is not present. That said, it looks like 
> LPA requires TTST.

I 'm referring to the table Table D8-12 "4KB granule, determining stage 
2 initial lookup level" (D8-5103, ARM DDI 0487I.a).
With 4KB granule, for having the root table at level 3, TTST is 
required, yes.

> 
>>
>>> Funnily enough p2m_root_level is unsigned so it would lead to overflow
> 
> Did you mean underflow rather than overflow?
> 
>>> (p2m_root_level would end up with (1 << 32) - 1 instead of -1).
>>
>> Actually, currently, there is no support at all in XEN neither for LPA 
>> (LPA support for 4KB is not checked, VCTR DS and SL2 are not set etc) 
>> nor level -1 (the root table level is determined only based on sl0, 
>> the number of possible levels is hardcoded to 4 in many places etc). I 
>> don't think that there is even support for accessing other than the 
>> first table of concatenated root tables but I need to verify that (I 
>> assume this based on the way LPAE_TABLE_INDEX_GS is implemented).
> 
> I am not sure I understand this. Are you saying that concatenation can 
> be used for non-root table?

No, the contrary. I cannot see how it can work out of the box given the 
current implementation. Because the mask applied to get the table index 
is limited to the size of a single table.

> 
>>
>> This entry is populated in the pa_range_info table just to prevent XEN 
>> from falling into this
>> if ( pa_range >= ARRAY_SIZE(pa_range_info) || 
>> !pa_range_info[pa_range].pabits )
>>          panic("Unknown encoding of ID_AA64MMFR0_EL1.PARange %x\n", 
>> pa_range);
> 
> I think it would be worth to point out in the commit message that the 
> value is not used so far. So this is only update for correctness.

Sure.
Do I need a Fixes tag even though the previous code, effectively, was 
not breaking anything?

> 
> Cheers,
> 

-- 
Xenia

