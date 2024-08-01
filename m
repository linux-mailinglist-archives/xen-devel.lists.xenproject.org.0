Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE80944824
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2024 11:25:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769488.1180386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZS40-00026h-Bw; Thu, 01 Aug 2024 09:25:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769488.1180386; Thu, 01 Aug 2024 09:25:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZS40-00025r-8J; Thu, 01 Aug 2024 09:25:36 +0000
Received: by outflank-mailman (input) for mailman id 769488;
 Thu, 01 Aug 2024 09:25:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xSmm=PA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sZS3y-00025g-P6
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2024 09:25:34 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00324649-4fe8-11ef-8776-851b0ebba9a2;
 Thu, 01 Aug 2024 11:25:32 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5b3fff87e6bso3918820a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2024 02:25:32 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ac631b038asm9838902a12.14.2024.08.01.02.25.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Aug 2024 02:25:31 -0700 (PDT)
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
X-Inumbo-ID: 00324649-4fe8-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722504332; x=1723109132; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EcrReH1FzMPVP1OEyOxTBff3mux3+NXaWR11lyworsw=;
        b=SgKFhJZDEyH97t0FlMOCxoDPJmYZOlDiryYDpSoPOLeHxN8r/gjiCvinwMgthgD4MA
         Rp2x4Yv3O/MqPGoScmTDP5//A/QNwIsLVG21IQpnkPtAUIAOogUSwD3iXnHYvlvsRKet
         uMAn5kMQDLHYTLa65zbjUEybpCLOseQOLUrmG4hsVi/pPE1tPzC/FjbRnn8hGrBAXhMo
         6fTdk5D13DupBEebr+Bu7u5GoqBzqA/t45frBB2NjRSLJoDT2jz05gfmwX0xtzhrh4Tn
         gj+jHy6CvW5y/2xPPTemJSt5g7Jggt3eY28fRGkQdtFZXi7/8kz2ndOPsRVFhVX+43w1
         T8PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722504332; x=1723109132;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EcrReH1FzMPVP1OEyOxTBff3mux3+NXaWR11lyworsw=;
        b=Mui3dm0+Cw2oP0evJfEurw6f6lKKWT07cWFXPwZbwbgPKtj6IdM2Ru2E56NsWc7UiZ
         uJtan2sP4m95XCIiL73dtS3hZqsNM3pLQsGHSw7e1qJsXF/dqpXLimTupR/hVFuCbZXy
         74Ro4Q4LkvSbbJHUTwjB8RTVplv2hiQJ9io7mgDiZBWafp7rivMGJXs84fYrN80aRExh
         TZZz9e25FY2AsgZlmxA7cxr+FTXcLIC/dC/+WC8/Q9ZJOsW8Url3uEgVn89Omvrc/a98
         Fl91/AHK8eRvFTjWafzbcRGHJABLN65+TlUUhFW/RMsZRl00fKjEH9Rvj2c+8PuVFhb0
         ZX1w==
X-Forwarded-Encrypted: i=1; AJvYcCWX7sMec9wHmG9nKa7DICZthqw++zgUWlMU/vrQeVNLpUt49ZwHQ7UAT0jP3vNvjI4FP4ufoML1r2RW9xtHJCdhuQCoqg/pqSJnVKJRV+o=
X-Gm-Message-State: AOJu0YzDH7yGOx9uCE7b7DlIWmnZErDqpC887+XTQ0pNQUsm8yQjfdXM
	2fC5X6ZWoUdqaqUwQ0sYYEOuL0BRtMpie5uzhgnH3GPx2/m+sRMdesoenGRCDPOU+3ZhylZWnIK
	R
X-Google-Smtp-Source: AGHT+IG+YYfS2UmGdG+qZR+I4YRxLkbvj1Mkbz0EqVdD9uO5cbpfLBXerCcmbxy1mbvUJS4WuONJ4g==
X-Received: by 2002:aa7:d44f:0:b0:5a1:61a7:56ce with SMTP id 4fb4d7f45d1cf-5b7008ac013mr949766a12.35.1722504332045;
        Thu, 01 Aug 2024 02:25:32 -0700 (PDT)
Message-ID: <894c9552-ef2b-4255-b429-ad3df4f5c0cc@suse.com>
Date: Thu, 1 Aug 2024 11:25:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] mini-os: mm: switch need_pgt() to use walk_pt()
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, wl@xen.org
References: <20240731130026.8467-1-jgross@suse.com>
 <20240731130026.8467-3-jgross@suse.com>
 <20240731212752.zd5njpd7kgoc433d@begin>
 <8fef9511-c5d0-49a9-a800-6087f03b3199@suse.com>
 <20240801073923.32s6i4enoq6qafa5@begin>
 <7fa3bca4-1ef4-4c95-bf92-de87c7c8fc96@suse.com>
 <20240801091535.rpspqy2k73tjy6ms@begin>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240801091535.rpspqy2k73tjy6ms@begin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01.08.24 11:15, Samuel Thibault wrote:
> Jürgen Groß, le jeu. 01 août 2024 10:13:07 +0200, a ecrit:
>> On 01.08.24 09:39, Samuel Thibault wrote:
>>> Jürgen Groß, le jeu. 01 août 2024 07:56:36 +0200, a ecrit:
>>>> On 31.07.24 23:27, Samuel Thibault wrote:
>>>>> Hello,
>>>>>
>>>>> Juergen Gross, le mer. 31 juil. 2024 15:00:25 +0200, a ecrit:
>>>>>> -pgentry_t *need_pgt(unsigned long va)
>>>>>> +static int need_pgt_func(unsigned long va, unsigned int lvl, bool is_leaf,
>>>>>> +                         pgentry_t *pte, void *par)
>>>>>>     {
>>>>> [...]
>>>>>> +    if ( lvl == L1_FRAME || (*pte & _PAGE_PRESENT) )
>>>>>
>>>>> Did you mean (*pte & _PAGE_PSE)?
>>>>
>>>> No.
>>>
>>> I don't understand: it doesn't map what I know of need_pgt and what the
>>> existing code is doing.
>>>
>>> AIKI, the point of need_pgt is to make sure there is a L1 page table
>>> entry for a VA, and return it, so the caller can put in it at pte for a
>>> mfn or such. In the case a PSE is met, we don't go further, and it's up
>>> to the caller to decide what it wants to do (most often it's actually
>>> unexpected and asserted out). In both cases, the PRESENT bit of the
>>> pte whose address is returned does not matter, most often it's the
>>> caller which will set it.
>>>
>>> The existing code for need_pgt thus always adds page table entries down
>>> to level1 (except if _PAGE_PSE is met, i.e. a large page was already set
>>> up): the termination was:
>>>
>>> [... walk down to level 2]
>>
>> You have omitted:
>>
>>         ASSERT(tab[offset] & _PAGE_PRESENT);
> 
> Right, that confirms that we never set PSE without PRESENT. We probably
> want to keep that assertion in the PSE case.

Hmm, I'm not sure.

The hardware allows to have any bit set in the PTE when PRESENT isn't set.
It will never look at any other bit in this case. Why should the software
require something different here?

> But we still want to continue walking down to level1 (or pse) even when
> L4/L3/L2 have PRESENT.

We do that. In this case the is_leaf flag won't be set and need_pgt_func()
will return early with the return value 0, meaning that the walk will be
continued.


Juergen

