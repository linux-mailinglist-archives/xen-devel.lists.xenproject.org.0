Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BC041AA33
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 09:57:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197742.350964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV7zL-0002Uh-7p; Tue, 28 Sep 2021 07:57:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197742.350964; Tue, 28 Sep 2021 07:57:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV7zL-0002SB-3s; Tue, 28 Sep 2021 07:57:19 +0000
Received: by outflank-mailman (input) for mailman id 197742;
 Tue, 28 Sep 2021 07:57:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sHmr=OS=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1mV7zK-0002S5-7E
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 07:57:18 +0000
Received: from mail-wr1-x431.google.com (unknown [2a00:1450:4864:20::431])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c2d0c496-660e-467c-934e-00dfa5f9d2a6;
 Tue, 28 Sep 2021 07:57:17 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id x20so11715783wrg.10
 for <xen-devel@lists.xenproject.org>; Tue, 28 Sep 2021 00:57:17 -0700 (PDT)
Received: from ?IPV6:2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec?
 ([2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec])
 by smtp.gmail.com with ESMTPSA id k10sm1812018wmr.32.2021.09.28.00.57.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 00:57:16 -0700 (PDT)
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
X-Inumbo-ID: c2d0c496-660e-467c-934e-00dfa5f9d2a6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6mo9efTGE4VOD+ie7b+QeqiAiR1rSgGGWGb2BC/STh8=;
        b=j3jeZ7JWsx5zGyYnEqvLWyk1dLZXvzkePCKRICmFRXB9wciS94XPoo2jYrAXLvU1gP
         662FyDWe6jVG8Ksw/Vz9Z/T+PfnszcJmqtorGWdqN96nAQS1hG/Gv4Fo6lkztEIGpa3Z
         rwZ/ZJnhGvVRXnQKz7WZ6UJLR0j4ASzKSRV1yt0iEriyYef0foEoBXQFFOVdp8XWQ03q
         A/z2UzK+Yr27oJLK+t1DRrCJvreVSodizrK5ia2V928tqhKHv5Y/tiRonAvmJ3YCCnpu
         ObbBl1uIKrA+kXNWFoFuJ73iLitqU1UFpYfebeXLYAI+LeEc81safV7Y/or5viZ71HHy
         sI5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6mo9efTGE4VOD+ie7b+QeqiAiR1rSgGGWGb2BC/STh8=;
        b=T5R5ItHHuG7GROQQ+Z0VTEUjQYYT1tkIH3PwAxemfbK6V27XaNBRat4vM3sXu5O/gU
         4NcDTK9V1sb8PoDpMRhUTZ6U2QddltfpQMF/DdPDMyNubLtXeCYQbvC+F4hBdThK0Sjz
         xkYZwN8nNvSyfdVBBW9MY5QgMpz9H3qrNAwf61Wux6vJelNm7BJQOD3jmXmKFeA1PetO
         Uhks8drSnQS1vWP0tpncjxe3r/iOmIaXoS+g66eebuSzJFerotTP0eaIvpd04RgxZaDH
         X3clcb3l7ag5qxV9v6KqzaJUdiX4r3VCZfO3D78Ei83hfcz1sQ33Decd0bzHWHgsukq5
         LCwQ==
X-Gm-Message-State: AOAM5305i6phTJG+8Hj1fBLm84vSLZf72pw0jChITRgefgl92HT8Gzto
	ep00O0nzdTgHicc4zqYqPD4=
X-Google-Smtp-Source: ABdhPJzd4IjKkZhDEvBhuSU1QmAss3Na9EW0rb6ObLgLj4Pgmg1CxdIvFsY7qCizQr7kw3SXvmzKoQ==
X-Received: by 2002:adf:ee4d:: with SMTP id w13mr4494917wro.223.1632815836405;
        Tue, 28 Sep 2021 00:57:16 -0700 (PDT)
Message-ID: <70d9fb6c-9578-15d6-423f-366b741b2f08@gmail.com>
Date: Tue, 28 Sep 2021 08:57:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Reply-To: paul@xen.org
Subject: Re: [PATCH v8 4/6] AMD/IOMMU: respect AtsDisabled device flag
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, paul@xen.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d249a759-188a-d689-316a-4743922827e5@suse.com>
 <14d1c1e1-d2d0-d041-e206-608e876d43a0@suse.com>
 <d300aaf7-dbe9-1bf8-6abc-1693bb13ec56@gmail.com>
 <a46e77e8-7686-875e-dad1-e0713b9fd46c@suse.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <a46e77e8-7686-875e-dad1-e0713b9fd46c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/09/2021 08:47, Jan Beulich wrote:
> On 28.09.2021 09:34, Durrant, Paul wrote:
>> On 22/09/2021 15:37, Jan Beulich wrote:
>>> IVHD entries may specify that ATS is to be blocked for a device or range
>>> of devices. Honor firmware telling us so.
>>>
>>> While adding respective checks I noticed that the 2nd conditional in
>>> amd_iommu_setup_domain_device() failed to check the IOMMU's capability.
>>> Add the missing part of the condition there, as no good can come from
>>> enabling ATS on a device when the IOMMU is not capable of dealing with
>>> ATS requests.
>>>
>>> For actually using ACPI_IVHD_ATS_DISABLED, make its expansion no longer
>>> exhibit UB.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> TBD: As an alternative to adding the missing IOMMU capability check, we
>>>        may want to consider simply using dte->i in the 2nd conditional in
>>>        amd_iommu_setup_domain_device().
>>> Note that while ATS enabling/disabling gets invoked without any locks
>>> held, the two functions should not be possible to race with one another
>>> for any individual device (or else we'd be in trouble already, as ATS
>>> might then get re-enabled immediately after it was disabled, with the
>>> DTE out of sync with this setting).
>>> ---
>>> v7: New.
>>>
>>> --- a/xen/drivers/passthrough/amd/iommu.h
>>> +++ b/xen/drivers/passthrough/amd/iommu.h
>>> @@ -120,6 +120,7 @@ struct ivrs_mappings {
>>>        uint16_t dte_requestor_id;
>>>        bool valid:1;
>>>        bool dte_allow_exclusion:1;
>>> +    bool block_ats:1;
>>>    
>>>        /* ivhd device data settings */
>>>        uint8_t device_flags;
>>> --- a/xen/drivers/passthrough/amd/iommu_acpi.c
>>> +++ b/xen/drivers/passthrough/amd/iommu_acpi.c
>>> @@ -55,8 +55,8 @@ union acpi_ivhd_device {
>>>    };
>>>    
>>>    static void __init add_ivrs_mapping_entry(
>>> -    uint16_t bdf, uint16_t alias_id, uint8_t flags, bool alloc_irt,
>>> -    struct amd_iommu *iommu)
>>> +    uint16_t bdf, uint16_t alias_id, uint8_t flags, unsigned int ext_flags,
>>> +    bool alloc_irt, struct amd_iommu *iommu)
>>>    {
>>>        struct ivrs_mappings *ivrs_mappings = get_ivrs_mappings(iommu->seg);
>>>    
>>> @@ -66,6 +66,7 @@ static void __init add_ivrs_mapping_entr
>>>        ivrs_mappings[bdf].dte_requestor_id = alias_id;
>>>    
>>>        /* override flags for range of devices */
>>> +    ivrs_mappings[bdf].block_ats = ext_flags & ACPI_IVHD_ATS_DISABLED;
>>>        ivrs_mappings[bdf].device_flags = flags;
>>
>> I'm assuming the above indentation problem (which appears to be repeated
>> in a few places below) is more to do with patch email generation rather
>> than the actual code modifications so...
> 
> Hmm, I first suspected a Thunderbird regression, but checking the list
> archives I don't see any corruption. I'm therefore now suspecting the
> problem may be at your end ...

It certainly could be; I was forced to upgrade my copy of Thunderbird 
recently. It's odd that the issue is not consistent though. As long as 
the actual code looks ok though... no problem.

   Paul



