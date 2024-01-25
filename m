Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C6983C387
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 14:22:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671513.1044884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSzgT-0003Gi-PJ; Thu, 25 Jan 2024 13:22:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671513.1044884; Thu, 25 Jan 2024 13:22:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSzgT-0003Dl-M8; Thu, 25 Jan 2024 13:22:21 +0000
Received: by outflank-mailman (input) for mailman id 671513;
 Thu, 25 Jan 2024 13:22:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+DBC=JD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rSzgS-0003Df-9v
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 13:22:20 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2b04dc6-bb84-11ee-8206-e5715332e9e2;
 Thu, 25 Jan 2024 14:22:18 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-337d99f9cdfso5590410f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jan 2024 05:22:17 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 z17-20020a5d4d11000000b003392af92996sm12943120wrt.101.2024.01.25.05.22.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jan 2024 05:22:16 -0800 (PST)
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
X-Inumbo-ID: c2b04dc6-bb84-11ee-8206-e5715332e9e2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706188937; x=1706793737; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SIT3lBeUvkzdhaNcX+YQ64AC+juXLjreQ0WuYbZJgwQ=;
        b=LuZK0mHCbpmk5PcVZgv+mlbCr10x9tCd+BZfcB1e+b8izDb6uCYtcB8qgODEVC0Mpr
         MT3oO2IznnBNi8wSHLv2gtpRWYFvYijd9Uakr+6hc2upL2ze1Ymy443kFNfX6eyxIqsD
         tN1WKeWvWuc4kvJACUvA4rpVDUCOwmXVDrMTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706188937; x=1706793737;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SIT3lBeUvkzdhaNcX+YQ64AC+juXLjreQ0WuYbZJgwQ=;
        b=pTbAkenE4mDItf/1eO2g/eHtnCjEIjbbPiL/uCAwsT5A6Mk6sSs8BqqdRiipQC/cBX
         7Q2jon7N9DMsj/NdI7TrXLVc3drQl0pt+IwLZ45qNdSwUl0bqIvv0JoAMtonesNBO3Cn
         UI2GcoyZOBijQomum2K0a2TyUAFJHLbD+32vdlW6p+vq8Zpmjvy6NKH5H46Sv3nFhgBG
         dzoVxpltrTnDramX3z9Av7Jh9Ruz6wqDeelr5DJZv6/bUB47AK6d3KWEpK0ADlZB4QE+
         oQ2XOj8vZH/NpOp+gH5PB8YdmYZsaVn4FSfgVpJUvfubM68P3eabfLgNdORe8YcWzDsl
         cFwg==
X-Gm-Message-State: AOJu0Yztlox9j0Bj03QejJLLM6/b9sjj2zCmXJWBA5ZU8geyLcImnMb9
	2Wgqvrl30nhIjx6nhbSlsRkLyHxBJWIx4bBePZxe3kzbNGzH2JPyi25lFkBXmTvZM2PtgQcvQo5
	Xi8c=
X-Google-Smtp-Source: AGHT+IEgsjR1lnBkxv5ZPRM4680sF8rLDKHXp6aLVjg4/4I43pDj9SwyqMugZBCWSPVXmZb4LhE4tA==
X-Received: by 2002:a5d:5390:0:b0:337:aa5e:ba4d with SMTP id d16-20020a5d5390000000b00337aa5eba4dmr514430wrv.22.1706188936621;
        Thu, 25 Jan 2024 05:22:16 -0800 (PST)
Message-ID: <d39c739b-fe27-4471-94a9-b56734985a30@citrix.com>
Date: Thu, 25 Jan 2024 13:22:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] x86/iommu: remove regions not to be mapped
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Cc: Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240124172953.29814-1-roger.pau@citrix.com>
 <20240124172953.29814-2-roger.pau@citrix.com>
 <ad178469-15c3-4ae5-8538-e927f1116a42@suse.com> <ZbIgE8exXDVicN8D@macbook>
 <ed221b62-0151-45ce-a88d-d7e2a9946136@suse.com> <ZbJWE2HhCo_IHBpF@macbook>
 <be2ccc2e-f311-4368-86b3-bdf5edd0c2b6@citrix.com>
 <4b8f5b3e-456d-4bc5-94a4-d7a0c77563a2@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <4b8f5b3e-456d-4bc5-94a4-d7a0c77563a2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/01/2024 1:13 pm, Jan Beulich wrote:
> On 25.01.2024 13:55, Andrew Cooper wrote:
>> On 25/01/2024 12:37 pm, Roger Pau Monné wrote:
>>> On Thu, Jan 25, 2024 at 12:13:01PM +0100, Jan Beulich wrote:
>>>> On 25.01.2024 09:47, Roger Pau Monné wrote:
>>>>> On Thu, Jan 25, 2024 at 09:34:40AM +0100, Jan Beulich wrote:
>>>>>> On 24.01.2024 18:29, Roger Pau Monne wrote:
>>>>>>> --- a/xen/arch/x86/hvm/io.c
>>>>>>> +++ b/xen/arch/x86/hvm/io.c
>>>>>>> @@ -369,6 +369,22 @@ bool vpci_is_mmcfg_address(const struct domain *d, paddr_t addr)
>>>>>>>      return vpci_mmcfg_find(d, addr);
>>>>>>>  }
>>>>>>>  
>>>>>>> +int __hwdom_init vpci_subtract_mmcfg(const struct domain *d, struct rangeset *r)
>>>>>>> +{
>>>>>>> +    const struct hvm_mmcfg *mmcfg;
>>>>>>> +
>>>>>>> +    list_for_each_entry ( mmcfg, &d->arch.hvm.mmcfg_regions, next )
>>>>>>> +    {
>>>>>>> +        int rc = rangeset_remove_range(r, PFN_DOWN(mmcfg->addr),
>>>>>>> +                                       PFN_DOWN(mmcfg->addr + mmcfg->size - 1));
>>>>>> Along the lines of this, ...
>>>>>>
>>>>>>> --- a/xen/arch/x86/setup.c
>>>>>>> +++ b/xen/arch/x86/setup.c
>>>>>>> @@ -2138,6 +2138,54 @@ int __hwdom_init xen_in_range(unsigned long mfn)
>>>>>>>      return 0;
>>>>>>>  }
>>>>>>>  
>>>>>>> +int __hwdom_init remove_xen_ranges(struct rangeset *r)
>>>>>>> +{
>>>>>>> +    paddr_t start, end;
>>>>>>> +    int rc;
>>>>>>> +
>>>>>>> +    /* S3 resume code (and other real mode trampoline code) */
>>>>>>> +    rc = rangeset_remove_range(r, PFN_DOWN(bootsym_phys(trampoline_start)),
>>>>>>> +                               PFN_DOWN(bootsym_phys(trampoline_end)) - 1);
>>>>>> ... did you perhaps mean
>>>>>>
>>>>>>                                PFN_DOWN(bootsym_phys(trampoline_end) - 1));
>>>>>>
>>>>>> here (and then similarly below, except there the difference is benign I
>>>>>> think, for the labels being page-aligned)?
>>>>> They are all page aligned, so I didn't care much,  but now that you
>>>>> point it might be safer to do the subtraction from the address instead
>>>>> of the frame number, just in case.
>>>> Hmm, no, for me neither trampoline_end nor trampoline_start are page
>>>> aligned. While bootsym_phys(trampoline_start) is, I don't think
>>>> bootsym_phys(trampoline_end) normally would be (it might only be by
>>>> coincidence).
>>> Oh, so it had been a coincidence of the build I was using I guess then.
>> trampoline_start has to be page aligned because of constraints from SIPI
>> and S3 (cant remember which one is the 4k constraint, but it's in the
>> comments).
> What you're talking about is the copy of the trampoline code/data in
> low memory. trampoline_{start,end} themselves point into the Xen image.

True, but we're operating on bootsym_phys(trampoline_start) which had
better be aligned.

We hard-code (by virtue of only filling in 1 single 4k PTE in the
pagetables) that the AP trampoline is 4k.

The range here should be 4k only too, or we're (falsely) marking lowmem
adjacent to the AP trampoline as a Xen range when it's not.

~Andrew

