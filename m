Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFA46160FB
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 11:37:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435781.689547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqB7A-00013l-Gm; Wed, 02 Nov 2022 10:36:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435781.689547; Wed, 02 Nov 2022 10:36:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqB7A-00010s-Dr; Wed, 02 Nov 2022 10:36:56 +0000
Received: by outflank-mailman (input) for mailman id 435781;
 Wed, 02 Nov 2022 10:36:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O0pi=3C=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oqB79-00010m-6b
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 10:36:55 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 441d1f76-5a9a-11ed-8fd0-01056ac49cbb;
 Wed, 02 Nov 2022 11:36:53 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id t1so6691370wmi.4
 for <xen-devel@lists.xenproject.org>; Wed, 02 Nov 2022 03:36:54 -0700 (PDT)
Received: from [192.168.1.93] (adsl-187.176.58.195.tellas.gr. [176.58.195.187])
 by smtp.gmail.com with ESMTPSA id
 j27-20020a05600c1c1b00b003c6bd91caa5sm1790106wms.17.2022.11.02.03.36.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 03:36:53 -0700 (PDT)
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
X-Inumbo-ID: 441d1f76-5a9a-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q6Dde4fbYO/gMhCkyc5MUWLqgS/KiOiRy+op50FhtwQ=;
        b=hfNkE7PaCMbxMsRlmJv4j59ZUW75/mgcKevqds+FfUH3c1bEmrhkT2Ia+kKjPv5wFw
         T0DBgyO+xxL0JTC6Bc+tJvPMuhK5Ug0oDoP4ZyYKAOge+6og7jN6/SdorkLvmBiDaB4g
         l5inwrI8vqozVKu5P1nEgQmsHD6WkW3brYb6Ee6whDLEe3dKP5EK/xlrte4pDFlyYTX1
         3YNlN0XLKF9/GlzAXf3OWof96hAV4V41Werb9oEapwGDnG2m0EnFFjeKDUHueP3ebSHp
         NNcDY8mvXhLjzM6s4d/xvyKtOoQSqP1DZXbr39Ub9dDvIvwhmDjoTeXpV34HdmqngCSV
         UqTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q6Dde4fbYO/gMhCkyc5MUWLqgS/KiOiRy+op50FhtwQ=;
        b=M5ZeE1czdEtb+qvk3QTZdKXwwRmlj3VQECNi4jNPuUi9h5QyE2LNAYuBykzneQsAcn
         NxKZ8pIC2M8pcp2wzKiCeDg36O3JjpEOTd00bNejN9b2IA73Cvy8RR756uuybxzqhI81
         InKotGJj6DonwgYxiOMsTjCv/jfUh60JMx/p83KHyGxya5Do8oou8/uxihAyUnd1KiXV
         URLhGXWhR3FfmleX5EkKFcmnVGldmUqflMZ5/C3oHe/rMJNCGOMhr5wYIbx/DbkhztoU
         KqxO5HIOLzMhdKfp1EFQbAkHjRmNhxGesuom3f9rR2BIXVJXYKUz19lrb+pISQIaxmxn
         xK0Q==
X-Gm-Message-State: ACrzQf1pdrDLmuXWxOch02QOVnN7J2IIXg588xx5+9lNk/tIZxIgZBOG
	DBTcwYWKoElur5Y5TcAmDEg=
X-Google-Smtp-Source: AMsMyM7KhZdipAGlJiA7bNdRe5fEGuVULMeld9yi40BvJmUqr53T1/bfNQ7NYN83iXUYv/89HT7ijg==
X-Received: by 2002:a1c:4641:0:b0:3cf:4ff3:8d2f with SMTP id t62-20020a1c4641000000b003cf4ff38d2fmr15351651wma.107.1667385413671;
        Wed, 02 Nov 2022 03:36:53 -0700 (PDT)
Message-ID: <2cf591c5-df8c-d231-8862-e5c00b9a3698@gmail.com>
Date: Wed, 2 Nov 2022 12:36:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [XEN v2 02/12] xen/Arm: GICv3: Move the macros to compute the
 affnity level to arm64/arm32
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder <ayankuma@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com
References: <20221031151326.22634-1-ayankuma@amd.com>
 <20221031151326.22634-3-ayankuma@amd.com>
 <d791158a-4f1b-9d6a-6bd4-8792da2217b2@xen.org>
 <8e36fec2-6df5-835c-f75a-f530c1a678e3@gmail.com>
 <9c4ca761-6ef4-d0e9-f496-27e0acaba95c@xen.org>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <9c4ca761-6ef4-d0e9-f496-27e0acaba95c@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Julien,

On 11/2/22 12:10, Julien Grall wrote:
> Hi Xenia,
> 
> On 02/11/2022 09:57, Xenia Ragiadakou wrote:
>>
>> On 11/2/22 10:46, Julien Grall wrote:
>>> Hi,
>>>
>>> Title: The macros you are moving are not GICv3 specific.
>>>
>>> On 31/10/2022 15:13, Ayan Kumar Halder wrote:
>>>> Refer https://elixir.bootlin.com/linux/v6.1-rc1/source/arch/arm64/ \
>>>> include/asm/cputype.h#L14 , for the macros specific for arm64.
>>>>
>>>> Refer 
>>>> https://elixir.bootlin.com/linux/v6.1-rc1/source/arch/arm/include/ \
>>>> asm/cputype.h#L54  , for the macros specific for arm32.
>>>>
>>>> MPIDR_LEVEL_SHIFT() differs between 64 and 32 bit. > For 64 bit :-
>>>>
>>>>   aff_lev3          aff_lev2 aff_lev1 aff_lev0
>>>> |________|________|________|________|________|
>>>> 40       32       24       16       8        0
>>>>
>>>> For 32 bit :-
>>>>
>>>>   aff_lev3 aff_lev2 aff_lev1 aff_lev0
>>>> |________|________|________|________|
>>>> 32       24       16       8        0
>>>
>>> As discussed with Michal, AFF3 doesn't exist for 32-bit. So it is not 
>>> clear to me what we are gaining by moving the macros.
>>>
>>
>> I cannot understand what do you mean by "what we are gaining by moving 
>> the macros".
>  >
>> IIUC, when identifying the cpu topology, a mask is applied to the 
>> value of MPIDR_EL1
>> #ifdef CONFIG_ARM_64
>> #define MPIDR_HWID_MASK     _AC(0xff00ffffff,UL)
>> #else
>> #define MPIDR_HWID_MASK     _AC(0xffffff,U)
>> #endif
>> So, for arm32, the affinity at level 3 is considered to be 0.
>>
>> Do you mean, what we are gaining by defining the MPIDR_LEVEL_SHIFT in 
>> a different way for arm32 and for arm64?
> 
> Yes. There are nothing justifying the move so far.
> 
>>
>> IMO, we need to do so, because the shift, used to retrieve the 
>> affinity at each level, cannot be calculated using the same logic i.e
>> (((1 << (level)) >> 1) << MPIDR_LEVEL_BITS_SHIFT)
>>
>> For arm32 the affinity at each level is calculated as follows
>> ((level) << MPIDR_LEVEL_BITS_SHIFT)
> 
> I understand they are written differently. But if you look at the 
> layout, AFF0, AFF1, AFF2 are in the same position. AFF3 doesn't exist 
> for arm32 and, AFAICT, the shift will not matter because the bits 40:32 
> will be zeroed in any case.
> 
> So I don't see the problem of using the arm64 version.

Now I see :) ... IIUC you are proposing to just cast the mpidr in 
MPIDR_AFFINITY_LEVEL(mpidr, level) to uint64_t?

In this case, I think, UL, below, needs to also to become ULL

#define AFFINITY_MASK(level)    ~((_AC(0x1,UL) << 
MPIDR_LEVEL_SHIFT(level)) - 1)

> 
> Cheers,
> 

-- 
Xenia

