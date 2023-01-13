Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A27669923
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 14:53:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477350.740028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGKUt-000760-Eg; Fri, 13 Jan 2023 13:53:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477350.740028; Fri, 13 Jan 2023 13:53:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGKUt-00073B-BZ; Fri, 13 Jan 2023 13:53:31 +0000
Received: by outflank-mailman (input) for mailman id 477350;
 Fri, 13 Jan 2023 13:53:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3K7w=5K=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pGKUr-000733-K5
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 13:53:29 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7b09a0f-9349-11ed-b8d0-410ff93cb8f0;
 Fri, 13 Jan 2023 14:53:27 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id hw16so40635353ejc.10
 for <xen-devel@lists.xenproject.org>; Fri, 13 Jan 2023 05:53:27 -0800 (PST)
Received: from [192.168.1.93] (adsl-67.109.242.138.tellas.gr. [109.242.138.67])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a17090611d300b008373f9ea148sm8577505eja.71.2023.01.13.05.53.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 05:53:26 -0800 (PST)
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
X-Inumbo-ID: a7b09a0f-9349-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XfbsPCf4QDNMjAwRmYwhV2JtZkhuVz5jXrfCBZH3w68=;
        b=RQVH34rgzWxspqNqRJeD4SdAhyOEKZZFN8fB0pbbvyJOm1P4dO3UaxdEnPIsIopgA4
         aS5ungxtyjFk1azFT1OvjKabThgmszDa6r5/S0X6zZ56iwILiUWaNz8Bv4PegcEthujw
         z6HlOcffLLP3/++K9LZ/E/0rYaY+5txn4X9U2+Mfn7ELE+Kf2G1Ea+ydj8Gb7atUlHy9
         Nin16KYEDj1/QAej7EPhOB7TS9xFiYjrWbVfvxkDz0fFjBkJAHR+jZb8UvMmfwKbTD9j
         OaKdqGFuBq2NpVVgIwQBS7ppuExe/v0SgEndVWUFLDHn/e1V8SsG3tag8dS0t+74SAU2
         T3kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XfbsPCf4QDNMjAwRmYwhV2JtZkhuVz5jXrfCBZH3w68=;
        b=04/nUVNgxWI7zz5pdkR7fHG/xZzFJuzEuoJDeiD1LPQyTr9D2pr7cqfNAvzInhU4CP
         /HBlvdaVs+PPuTdx0Fs4miG9ZioIjlnyt+EBOD+rs856Ocpo4z5MMH1+3O34yFCvWIZf
         y7GoAKYR7fi0IN21YBp/I50QUhGrsnsjV3yINICOhiQITQ5xYU30Zxykym2CtPZCtVJT
         n77pNDmdZSDqAbc1NDcAaMZGtQrUwhTp0p12y5agnHMswgaQS05WL+rVUFq5HtqnkJuh
         opBnrZ6A7xaRZZmqFbFYIdCrfPyNGCR74kJMpDDTKahCVSTuHCyXfRtJdAOlLCdOm2O2
         JHSg==
X-Gm-Message-State: AFqh2kontRscJ6sw++piTQ7dSmyz/mzei8dqFgGpJf401qLEwOZ3Gg9r
	ymw5UZymQZYPkfC4yKSZ9y0=
X-Google-Smtp-Source: AMrXdXslRJEn+JGQ+7bFQ5c9Az3+fHgP9Vz+oeV94pFtnqdwHpFNDepZikc8Mc0n5MvJaiDdkVyFtw==
X-Received: by 2002:a17:907:8a16:b0:7c1:458b:a947 with SMTP id sc22-20020a1709078a1600b007c1458ba947mr106475440ejc.26.1673618006857;
        Fri, 13 Jan 2023 05:53:26 -0800 (PST)
Message-ID: <8e1ecdf9-c5b2-2977-b4fc-a64cf04c765b@gmail.com>
Date: Fri, 13 Jan 2023 15:53:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/2] x86/shadow: sanitize iommu_snoop usage
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>
References: <01756703-efc8-e342-295c-a40a286ad5f1@suse.com>
 <cf0ed06f-4d49-0f73-cfd9-eb49e951048c@suse.com>
 <6596d648-6400-7907-bc21-8074dc244247@gmail.com>
 <88e3ec77-587a-ae68-a634-fed1fa917cd7@suse.com>
 <b76a7834-9868-c5c2-e058-89911a552c80@gmail.com>
 <512d8768-28f6-d9d6-c1cc-18c5fbf2a636@suse.com>
 <4f1d289a-7c3b-c4a1-34bc-1e8bd62a416a@gmail.com>
 <da973e5a-3a1b-3e99-ebf9-e462915eb338@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <da973e5a-3a1b-3e99-ebf9-e462915eb338@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/13/23 15:24, Jan Beulich wrote:
> On 13.01.2023 14:07, Xenia Ragiadakou wrote:
>>
>> On 1/13/23 14:12, Jan Beulich wrote:
>>> On 13.01.2023 12:55, Xenia Ragiadakou wrote:
>>>> On 1/13/23 11:53, Jan Beulich wrote:
>>>>> On 13.01.2023 10:34, Xenia Ragiadakou wrote:
>>>>>> On 1/13/23 10:47, Jan Beulich wrote:
>>>>>>> --- a/xen/drivers/passthrough/x86/iommu.c
>>>>>>> +++ b/xen/drivers/passthrough/x86/iommu.c
>>>>>>> @@ -56,6 +56,13 @@ void __init acpi_iommu_init(void)
>>>>>>>          if ( !acpi_disabled )
>>>>>>>          {
>>>>>>>              ret = acpi_dmar_init();
>>>>>>> +
>>>>>>> +#ifndef iommu_snoop
>>>>>>> +        /* A command line override for snoop control affects VT-d only. */
>>>>>>> +        if ( ret )
>>>>>>> +            iommu_snoop = true;
>>>>>>> +#endif
>>>>>>> +
>>>>>>
>>>>>> Why here iommu_snoop is forced when iommu is not enabled?
>>>>>> This change is confusing because later on, in iommu_setup, iommu_snoop
>>>>>> will be set to false in the case of !iommu_enabled.
>>>>>
>>>>> Counter question: Why is it being set to false there? I see no reason at
>>>>> all. On the same basis as here, I'd actually expect it to be set back to
>>>>> true in such a case.Which, however, would be a benign change now that
>>>>> all uses of the variable are properly qualified. Which in turn is why I
>>>>> thought I'd leave that other place alone.
>>>>
>>>> I think I got confused... AFAIU with disabled iommu snooping cannot be
>>>> enforced i.e iommu_snoop=true translates to snooping is enforced by the
>>>> iommu (that's why we need to check that the iommu is enabled for the
>>>> guest). So if the iommu is disabled how can iommu_snoop be true?
>>>
>>> For a non-existent (or disabled) IOMMU the value of this boolean simply
>>> is irrelevant. Or to put it in other words, when there's no active
>>> IOMMU, it doesn't matter whether it would actually snoop.
>>
>> The variable iommu_snoop is initialized to true.
>> Also, the above change does not prevent it from being overwritten
>> through the cmdline iommu param in iommu_setup().
> 
> Command line parsing happens earlier (and in parse_iommu_param(), not in
> iommu_setup()). iommu_setup() can further overwrite it on its error path,
> but as said that's benign then.

You are right. I misunderstood.

> 
>> I m afraid I still cannot understand why the change above is needed.
> 
> When using an AMD IOMMU, with how things work right now the variable ought
> to always be true (hence why I've suggested that when !INTEL_IOMMU, this
> simply become a #define to true). See also Andrew's comments here and/or
> on your patch.

Ok I see, so this change is specific to AMD iommu and when iommu_snoop 
becomes a #define, this change won't be needed anymore, right?

-- 
Xenia

