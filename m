Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E8CA25FBF
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 17:20:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880771.1290851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tezAi-0002wZ-4Z; Mon, 03 Feb 2025 16:19:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880771.1290851; Mon, 03 Feb 2025 16:19:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tezAi-0002uk-1f; Mon, 03 Feb 2025 16:19:40 +0000
Received: by outflank-mailman (input) for mailman id 880771;
 Mon, 03 Feb 2025 16:19:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9wUg=U2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tezAh-0002ue-06
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 16:19:39 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8d53f75-e24a-11ef-99a4-01e77a169b0f;
 Mon, 03 Feb 2025 17:19:36 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-436345cc17bso34346745e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2025 08:19:36 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e244f0d2sm163594615e9.30.2025.02.03.08.19.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 08:19:34 -0800 (PST)
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
X-Inumbo-ID: a8d53f75-e24a-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738599575; x=1739204375; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=j86pzJ76HFRWl2nwFePeueGp/sJAlUbY7IkCGoAs+P8=;
        b=qwgKiTq/+4dYDf+bBI7uKXyur/Z8SvI19MiFwJPIhh78bIMuFHtHzbiof96Lwv99I+
         K2wneGY33cjvjytrAQaQYs0yezuIPUi/ucvr/TWg+6Ybw6DGzH+7hpy+eXBE/AoeM/Ep
         h3RvYGnx3SwzQi98T+ryPZFT3kkJ+XhD6qm6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738599575; x=1739204375;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j86pzJ76HFRWl2nwFePeueGp/sJAlUbY7IkCGoAs+P8=;
        b=n0Ws0zne1kT7qnsiByncgmWHHjmQQ7wveXqL2j2rQkhIwMO5HQzqxm+LDu4v4HzV3d
         q4GWxN4KMPyeW8cYkVGwoWJHWF34AOUWf5OMNaSwIZTu3IVCGhiqeXAu7qJnA1tN1OVS
         KCTBdshUhI6vV2bs3XxptIEIZZS7hHGKq3mRfvM+NvZ2gbickZLPSUTZ5YzpS6PRK9wf
         LNJgJCvW8Hoj+c527SCC0YK4VjM8v1Tg28wnIvFOGXIJRP1EK2vDl1lVRVHJiT77i8Oe
         qoIOjrs+M5HKY+EUH0ABJIKWaTfQ9oqfLWP46AyRdV2D7z190B2MgyO0qCOk29eaegZ5
         iEBg==
X-Forwarded-Encrypted: i=1; AJvYcCWMXTyvn1evvB/oc1UCJ3XEFuS4bpIfHZtRFQJL0rjTi2z3S5uHNMnkzt71dGXSlWl1ysBmR4X3yaQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzHq6rx+mM+A+clpsZJCx4X5v4Y9Jn5tGwgncRIUO6QOpHrBVLm
	2hCvuKBLpnsmkymJcF9coIVeHw34xZeJz1u4Z9OC4/AR3hiyPQGrEu2N86AyBEE=
X-Gm-Gg: ASbGnctRTyZO41Mq4CzakaO4//cDBz0guMdJxPUQpKizUbNU/psFhLuU4/0A37kSlED
	gK4Tjk1ucTzjesVgQZLDaid7aYb/LHl/gH4Khof/8P7RrB4fkndaLDh6+a6wFcKEVKw3je4jlW2
	AEQQVi5tqLOsadaU94Ec+uqMmZCblB06NCRXyLnozsL3dmUVRp0iU6yrKBoCLBIQ/FG0bUrNtZr
	RxRGj+fNJYnNPPiu/biHplJSfRFN4latfv4CfBathEVjgV7MpsSsANc4mpO11/bQvjP6e65tvza
	R4TXY/o2IjnZc8jr1Vjk6DEk/BqIV5KY4lTT5cpaF/+YkqjiVrzCHCM=
X-Google-Smtp-Source: AGHT+IHtWb10bXCb6hptKLIWCf4p8633vfyH4Gi/ocejK+daM8a4V2vtsSqPhDpMxiEk2Gn13ex7Pw==
X-Received: by 2002:a05:600c:154a:b0:431:55c1:f440 with SMTP id 5b1f17b1804b1-438dc42bd08mr212897335e9.30.1738599575476;
        Mon, 03 Feb 2025 08:19:35 -0800 (PST)
Message-ID: <b0044a88-002e-40c9-bc5a-4bb1774f1a02@citrix.com>
Date: Mon, 3 Feb 2025 16:19:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20? 1/3] AMD/IOMMU: drop stray MSI enabling
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2bb9d3c4-0761-4d63-8193-29293e35eb04@suse.com>
 <ea0fea03-6002-4fc6-86ac-19598c9d9ef6@suse.com>
 <cf5ae390-fb9d-4839-9423-d1ead9bd34bf@citrix.com>
 <14d1f7fb-4e4e-4f06-b3e6-8ab25de7f939@suse.com>
 <ad10a9d3-672e-443f-a7cd-c50df16b67b4@citrix.com>
 <ceff513c-5074-4828-8718-5d1c2ae27793@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ceff513c-5074-4828-8718-5d1c2ae27793@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/02/2025 3:53 pm, Jan Beulich wrote:
> On 03.02.2025 15:19, Andrew Cooper wrote:
>> On 03/02/2025 8:41 am, Jan Beulich wrote:
>>> On 02.02.2025 14:50, Andrew Cooper wrote:
>>>> On 30/01/2025 11:11 am, Jan Beulich wrote:
>>>>> While the 2nd of the commits referenced below should have moved the call
>>>>> to amd_iommu_msi_enable() instead of adding another one, the situation
>>>>> wasn't quite right even before: It can't have done any good to enable
>>>>> MSI when no IRQ was allocated for it, yet.
>>>>>
>>>>> Fixes: 5f569f1ac50e ("AMD/IOMMU: allow enabling with IRQ not yet set up")
>>>>> Fixes: d9e49d1afe2e ("AMD/IOMMU: adjust setup of internal interrupt for x2APIC mode")
>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>
>>>>> --- a/xen/drivers/passthrough/amd/iommu_init.c
>>>>> +++ b/xen/drivers/passthrough/amd/iommu_init.c
>>>>> @@ -902,8 +902,6 @@ static void enable_iommu(struct amd_iomm
>>>> There's a call to amd_iommu_msi_enable() just out of context here which
>>>> was added by the 2nd referenced commit.
>>>>
>>>> Given that it's asymmetric in an if() condition regarding xt_en, and the
>>>> calls are only set_affinity() calls, why is this retained?
>>>>
>>>> (I think I know, and if it is the reason I suspect, then you're missing
>>>> a very critical detail from the commit message.)
>>> Hmm, you did read the commit message, didn't you? That commit should have
>>> moved that call, rather than adding another one.
>>>
>>> However, you have a point. It looks like 7a89f62dddee ("AMD IOMMU: make
>>> interrupt work again") should already have removed that call. Prior to
>>> that change request_irq()'s call (via setup_irq()) to iommu_msi_startup()
>>> was in fact premature, as MSI address and data weren't set up yet (IOW
>>> while still apparently redundant, the extra call served kind of a doc
>>> purpose). Things apparently worked because the IOMMU itself wasn't
>>> enabled yet, and hence shouldn't have raised any interrupts prior to MSI
>>> being fully configured.
>>>
>>> However, for S3 resume I think the call needs to stay there, as the
>>> startup hook wouldn't be called in that case (which may be the detail
>>> you're alluding to). Imo that wants solving differently though. Not sure
>>> it's a good idea to do this right here, or perhaps better in a separate
>>> change.
>>>
>>> I've added
>>>
>>> "The other call to amd_iommu_msi_enable(), just out of patch context,
>>>  needs to stay there until S3 resume is re-worked. For the boot path that
>>>  call should be unnecessary, as iommu{,_maskable}_msi_startup() will have
>>>  done it already (by way of invoking iommu_msi_unmask())."
>>>
>>> as a 2nd paragraph to the description, in the hope that's what you're
>>> after.
>> Ok, not the reason I was thinking.  I was thinking it was an x vs x2
>> APIC issue, and split setup path.
>>
>> It is specifically weird to have:
>>
>>     if ( msi )
>>     {
>>         if ( cap_xt_en )
>>             ...
>>         else
>>         {
>>             ...
>>             amd_iommu_msi_enable();
>>         }
>>         // should enable here ?
>>     }
>>
>> If this call really is only necessary for the S3 path, that explains
>> half the problem, but what activates MSIs for the xt_en case after S3?
> The write of the control register where the enable bit is. There's no
> actual "MSI" anymore in that case.

Oh, right.

I definitely knew that at one point, and I've clearly forgotten.

I wonder if we want a /* Note, no MSI in this case */ inside the if(),
but that might be a stretch...

~Andrew

