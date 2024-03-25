Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F088788AA5B
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 17:56:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697829.1088996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1roncH-0007JQ-8T; Mon, 25 Mar 2024 16:56:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697829.1088996; Mon, 25 Mar 2024 16:56:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1roncH-0007HJ-5n; Mon, 25 Mar 2024 16:56:09 +0000
Received: by outflank-mailman (input) for mailman id 697829;
 Mon, 25 Mar 2024 16:56:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O34W=K7=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1roncF-0007GT-1e
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 16:56:07 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90ad90b5-eac8-11ee-a1ef-f123f15fe8a2;
 Mon, 25 Mar 2024 17:56:03 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a46cd9e7fcaso542863666b.1
 for <xen-devel@lists.xenproject.org>; Mon, 25 Mar 2024 09:56:03 -0700 (PDT)
Received: from [10.80.5.21] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 pv25-20020a170907209900b00a4c9b39b726sm540564ejb.75.2024.03.25.09.56.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Mar 2024 09:56:02 -0700 (PDT)
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
X-Inumbo-ID: 90ad90b5-eac8-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1711385763; x=1711990563; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kwxPnU4HzF7M9AD7HGhaRm5AkIZQQ7rGSy5JODKNiCE=;
        b=e39cgXT+xBcw8pHM2KVKB6aqZC94UQh7Fk/r7FKtf9fsfur/L0FdyLOmKEeDiyCP0I
         1VizR8nYwxjQs5nKDgyRqdQ8cRcFNp87cXZeVQqPcVfsfgqB3yopAhp81df3QxnM4QVC
         hxaFkWSv0X4fJWNjSk91jtNtiMJoxAOj1Wnus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711385763; x=1711990563;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kwxPnU4HzF7M9AD7HGhaRm5AkIZQQ7rGSy5JODKNiCE=;
        b=FI5PuBx3nX9zw/zQYjfKBJfiP6Qosq9Or/sW/IrkRsgNEMvUx80focpo9EGsuhQ4Xc
         kcJxDNMcMrROZgylQoBYAfbRbjWV9TZcLZkVoS9JAru3YNF//zmCnB0VLfWPr4qMtKge
         6KPGIuGsR/1x+vA0B9zGy34E01wHywzcJJDSAd/Wt44lSQy/I7ToglO+uE0RzE8DFrfS
         bkdE9igDw/fagN9zDcTr4MAoWjgrWd0Chz1xtaYLD+VWL0DBiwJtmYqxe7Otv1hlSi5F
         LH5T4lFVzlB6aUTr74Rt02Zwv8k1DdIfuoCt6R7ofpNBR74P5V50QgM9SV6UkLdDzqH+
         cFlA==
X-Gm-Message-State: AOJu0YwvP1VGJKpwtxtuUSOLnocufirpNh1t2pRGJvCqWvTMMSdmbOVA
	ulCBZgXKIGuPWHWwpxBghnZzEalf4SgSs2GM69O+KLTpoEzcP0hLUgU6GD1OfTQ=
X-Google-Smtp-Source: AGHT+IFuKLuHQt+vTbh6/uffj+vEe1zArYGCGNptmyiME88KD++zZYFnq3KETyGXEuzQhl9DAl7Flw==
X-Received: by 2002:a17:906:5288:b0:a46:13d5:46fe with SMTP id c8-20020a170906528800b00a4613d546femr5305304ejm.11.1711385763106;
        Mon, 25 Mar 2024 09:56:03 -0700 (PDT)
Message-ID: <2cd55a39-9f02-411b-ac85-59ab5ccb5df3@cloud.com>
Date: Mon, 25 Mar 2024 16:56:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] xen/x86: Add initial x2APIC ID to the per-vLAPIC save
 area
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>
References: <20240109153834.4192-1-alejandro.vallejo@cloud.com>
 <20240109153834.4192-2-alejandro.vallejo@cloud.com>
 <Zfm7U7XMzbR6D1qN@macbook> <Zfqtd96XoXXDkXdW@macbook>
Content-Language: en-GB
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
In-Reply-To: <Zfqtd96XoXXDkXdW@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/03/2024 09:33, Roger Pau Monné wrote:
>>
>> Why not just return the x2apic_id field from the cpu_policy object?
>> (topo.subleaf[X].x2apic_id)
> 
> Scratch that, the cpu policy is per-domain, not per-vcpu, and hence
> cannot hold the x{,2}apic IDs.
Yes, that :)

Originally I tried to make the policy per-vCPU, tbf, but that's a very,
very deep and complicated hole that was very hard to deal with and I'm
not tempted to try that again.

>>> diff --git a/xen/include/public/arch-x86/hvm/save.h b/xen/include/public/arch-x86/hvm/save.h
>>> index 7ecacadde1..1c2ec669ff 100644
>>> --- a/xen/include/public/arch-x86/hvm/save.h
>>> +++ b/xen/include/public/arch-x86/hvm/save.h
>>> @@ -394,6 +394,8 @@ struct hvm_hw_lapic {
>>>      uint32_t             disabled; /* VLAPIC_xx_DISABLED */
>>>      uint32_t             timer_divisor;
>>>      uint64_t             tdt_msr;
>>> +    uint32_t             x2apic_id;
>>> +    uint32_t             rsvd_zero;
>>
>> Do we really to add a new field, couldn't we get the lapic IDs from
>> the cpu_policy?
> 
> Since getting from the cpu_policy is not possible, what about getting
> it from the registers itself?  It's already present in hvm_hw_lapic_regs.
> 
> Regards, Roger.

If every APIC is in x2APIC mode, yes. But if any of them is in xAPIC
mode there's problems. The xAPIC ID is overridable by the guest simply
by writing into it, so it's tricky to know whether it's sane or not.
This new field is effectively an immutable "initial APIC ID", which we
can recreate to the old convention when not present in the stream.

If you can think of an alternative that doesn't involve adding a field
or fixing in stone the mapping strategy I'm happy to do that instead,
but I think this is the lesser evil.

Cheers,
Alejandro

