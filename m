Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6065765BC
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jul 2022 19:24:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368405.599665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCP3L-0000ik-CD; Fri, 15 Jul 2022 17:24:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368405.599665; Fri, 15 Jul 2022 17:24:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCP3L-0000gU-8n; Fri, 15 Jul 2022 17:24:35 +0000
Received: by outflank-mailman (input) for mailman id 368405;
 Fri, 15 Jul 2022 17:24:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lLTF=XU=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oCP3J-0000gO-Cx
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 17:24:33 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd4dba56-0462-11ed-924f-1f966e50362f;
 Fri, 15 Jul 2022 19:24:32 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id u13so8907117lfn.5
 for <xen-devel@lists.xenproject.org>; Fri, 15 Jul 2022 10:24:32 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 g18-20020ac24d92000000b0048650aee2b2sm998680lfe.144.2022.07.15.10.24.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jul 2022 10:24:31 -0700 (PDT)
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
X-Inumbo-ID: fd4dba56-0462-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=JEdvamrpt2hB1WAOJO1ivuRpQdwFZrXR4pbATBn9fnE=;
        b=JH97wN2Yok2ZTjYnJIDWN1yDkPbwz8bQ/KYvnwgORo8jWpKfXFv8YXumtGOoCXz6AR
         greiZ7W/ETN+uv7X7UP6A8tTMo51qAcCb0A7nVMpBX/N5c0Nl0ssNDVysVztTjQ5HTWJ
         ThokglJ4GZSDoYSUCUemsGsl1Wqf0FpGiQQ/MoId3Pb23hTqI1sp3x2ihY9MP1SCehDo
         SffSOF583vlsli++q9rlodBHhhIMApQDERbc6VJPTfRPsbaHeKnbPfIfeZsk3ZENTbd0
         rgoiwn2r1n8CaX0gMtcl9CrX5uPAmEKW2U0AV2+9nBniyM0sluAoWldqYuFYuX/dxsID
         Lwuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=JEdvamrpt2hB1WAOJO1ivuRpQdwFZrXR4pbATBn9fnE=;
        b=u2Hj9xZF7IKufvBWZwrc5og1TFf7VF42QPcFkGySEhQQB4hFbQzPXcdB6HZAm187LO
         h7h1ACHROR+zAv5bbUu9/I5ToHgTwKaT7GuB1Pbt3hebw1Oi0NILE+A66C2MS6w3hmgg
         Hpa3EFAlG6LZWeqFZeMHiVRV2h+aUrxz6AUOgBgKxBeoQSom25y7KVWCd3Ia1dCNBKCG
         seBM0yMM2Xwz/y2aBawSoZXgkz7yE2Y0gBQfnPDSAfU30UewlUgdTmZk52+WjfiFKidD
         19QVzhybu+XTahaagEHDIo7rt8hUBqcaZqSXCsvrSbQBYpDuOaUB9HaXbPHpxGBk2IUa
         PiIQ==
X-Gm-Message-State: AJIora/XcadVXrGbry1mCPQIE47OHx6CCJLdrUHimSCRZbSAnp/cemeY
	uxKp3Cgf1pk1qbOfyigu/tk=
X-Google-Smtp-Source: AGRyM1uelt0c3CLX/j5YrgBuNrQk9BWSDGWhfh8ZnoqMnjPIiYUxF38lsh43aLJz0evIhP2WrUaCUw==
X-Received: by 2002:a05:6512:2397:b0:487:8ae9:7486 with SMTP id c23-20020a056512239700b004878ae97486mr8096105lfv.102.1657905871680;
        Fri, 15 Jul 2022 10:24:31 -0700 (PDT)
Message-ID: <313ce039-31c2-1081-b044-d39c940e7565@gmail.com>
Date: Fri, 15 Jul 2022 20:24:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH V6 2/2] xen/arm: Harden the P2M code in
 p2m_remove_mapping()
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <1652294845-13980-1-git-send-email-olekstysh@gmail.com>
 <1652294845-13980-2-git-send-email-olekstysh@gmail.com>
 <42b0d343-a491-877c-3b5c-d9c95872774c@xen.org>
 <94afe35c-627c-8aba-37ce-1d017a2e4e3c@gmail.com>
 <f2e5a755-0f1e-ef18-21db-cbe6ef346886@xen.org>
From: Oleksandr <olekstysh@gmail.com>
In-Reply-To: <f2e5a755-0f1e-ef18-21db-cbe6ef346886@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 15.07.22 20:15, Julien Grall wrote:
>
>
> On 24/06/2022 16:31, Oleksandr wrote:
>>
>> On 23.06.22 21:08, Julien Grall wrote:
>>> Hi Oleksandr,
>>
>>
>> Hello Julien
>
> Hi Oleksandr,


Hello Julien



>
>
>>
>>>
>>> On 11/05/2022 19:47, Oleksandr Tyshchenko wrote:
>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>
>>>> Borrow the x86's check from p2m_remove_page() which was added
>>>> by the following commit: c65ea16dbcafbe4fe21693b18f8c2a3c5d14600e
>>>> "x86/p2m: don't assert that the passed in MFN matches for a remove"
>>>> and adjust it to the Arm code base.
>>>>
>>>> Basically, this check is strictly needed for the xenheap pages only
>>>> since there are several non-protected read accesses to our simplified
>>>> xenheap based M2P approach on Arm (most calls to 
>>>> page_get_xenheap_gfn()
>>>> are not protected by the P2M lock).
>>>
>>> To me, this read as you introduced a bug in patch #1 and now you are 
>>> fixing it. So this patch should have been first.
>>
>>
>> Sounds like yes, I agree. But, in that case I propose to rewrite this 
>> text like the following:
>>
>>
>> Basically, this check will be strictly needed for the xenheap pages 
>> only *and* only after applying subsequent
>
> NIT: s/only and only/, this is pretty clear that this patch is 
> necessary for a follow-up patch.

ok


>
>
> Also please add "a" in from of subsequent because the two patches may 
> not be committed together.

ok


>
>> commit which will introduce xenheap based M2P approach on Arm. But, 
>> it will be a good opportunity
>> to harden the P2M code for *every* RAM pages since it is possible to 
>> remove any GFN - MFN mapping
>> currently on Arm (even with the wrong helpers).
>
> [...]
>
>>>>
>>>> Suggested-by: Julien Grall <jgrall@amazon.com>
>>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>> ---
>>>> You can find the corresponding discussion at:
>>>> https://lore.kernel.org/xen-devel/82d8bfe0-cb46-d303-6a60-2324dd76a1f7@xen.org/ 
>>>>
>>>>
>>>> Changes V5 -> V6:
>>>>   - new patch
>>>> ---
>>>>   xen/arch/arm/p2m.c | 21 +++++++++++++++++++++
>>>>   1 file changed, 21 insertions(+)
>>>>
>>>> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
>>>> index f87b48e..635e474 100644
>>>> --- a/xen/arch/arm/p2m.c
>>>> +++ b/xen/arch/arm/p2m.c
>>>> @@ -1311,11 +1311,32 @@ static inline int p2m_remove_mapping(struct 
>>>> domain *d,
>>>>                                        mfn_t mfn)
>>>>   {
>>>>       struct p2m_domain *p2m = p2m_get_hostp2m(d);
>>>> +    unsigned long i;
>>>>       int rc;
>>>>         p2m_write_lock(p2m);
>>>> +    for ( i = 0; i < nr; )
>>> One bit I really hate in the x86 code is the lack of in-code 
>>> documentation. It makes really difficult to understand the logic.
>>>
>>> I know this code was taken from x86, but I would like to avoid 
>>> making same mistake (this code is definitely not trivial). So can we 
>>> document the logic?
>>
>>
>> ok, I propose the following text right after acquiring the p2m lock:
>>
>>
>>   /*
>>    * Before removing the GFN - MFN mapping for any RAM pages make sure
>>    * that there is no difference between what is already mapped and what
>>    * is requested to be unmapped. If passed mapping doesn't match
>>    * the existing one bail out early.
>
> NIT: I would simply write "If they don't match bail out early".

ok, I guess this is related to the last sentence only.


>
> Also, it would be good to explanation how this could happen. Something 
> like:
>
> "For instance, this could happen if two CPUs are requesting to unmap 
> the same P2M concurrently."

agree



>
>
>>    */
>>
>>
>> Could you please clarify, do you agree with both?
>
> I have proposed some changes in both cases. I originally thought I 
> would do the update in the commit. However, this is more than simple 
> tweak, so would you mind to send a new version?


yes, will do


>
>
> Cheers,
>
-- 
Regards,

Oleksandr Tyshchenko


