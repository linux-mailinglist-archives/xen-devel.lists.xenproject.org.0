Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF6A90CC53
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 14:47:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743050.1149929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJYEN-0002y4-DL; Tue, 18 Jun 2024 12:46:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743050.1149929; Tue, 18 Jun 2024 12:46:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJYEN-0002vn-A6; Tue, 18 Jun 2024 12:46:35 +0000
Received: by outflank-mailman (input) for mailman id 743050;
 Tue, 18 Jun 2024 12:46:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=An5i=NU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sJYEM-0002vh-DP
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2024 12:46:34 +0000
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [2607:f8b0:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c99451bf-2d70-11ef-b4bb-af5377834399;
 Tue, 18 Jun 2024 14:46:32 +0200 (CEST)
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-6f98178ceb3so2951878a34.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jun 2024 05:46:32 -0700 (PDT)
Received: from [10.125.226.166] ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b2a5eb4dc1sm65847196d6.100.2024.06.18.05.46.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 05:46:30 -0700 (PDT)
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
X-Inumbo-ID: c99451bf-2d70-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718714791; x=1719319591; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Q3inkv2VK9BTIRLUHw7TDus7E6YrNOM+cOrHUXeW0n0=;
        b=MfNCAygjlqcRtFqTlaAzRWbatrBilLsG3dEZxeeDA9ZC4/KYZ0VA10D1BbnGHWgQ4m
         aWT5VBmg1oNTBiujzvocooT7y7j1UGD1xVE6JjbXR4YPZvh9zFWYu6k86kkiLZBPdnIP
         sgPOy3UQacAwUNAGpbLxoiNtAoqSVlmNa5M38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718714791; x=1719319591;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q3inkv2VK9BTIRLUHw7TDus7E6YrNOM+cOrHUXeW0n0=;
        b=SXNcVAoOVIMDHQu/tyD86O3xSVF4l0yxub1u04bmtU/UaBpbPWt82/mXTHwiSwg4TA
         n8cW1N+3bO2vhFVMtwGPrZ6sVjkQNopMMepMH4Q9/iWNsZvS0OvrXJOkYII/KBk+5c+0
         bE3cnI3pwIENwITbJh22tYYe8iJzZVtYhoBpN8rQiVk5v8HAL7St3Ywr5Pn7wOnmfmf7
         P5zooHxTWWs2w/HRLhclXBPpeMSgefClDPEkvrcnIkdS0dDGC3PQ2PWBEngKdG8H1q9N
         IyJcXUY3Rl3ilJTfvKOMUpIVF/Ps5DOS+TPEx/kkkxLmftSiDLlYfn6f59Yoi61czlSt
         pNsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXHieeD6lYJrliikwlHK3P8qwdXR6NXDNMQZM63TgI+eQH+jtwpXScSOQLFpXBmWO2ldVGgwHR6zJ09u3EPApvK3dbzRUrI4xuWe4Yggg=
X-Gm-Message-State: AOJu0Yze8AaDN2Vz5iaxPQE4xmpbNm0HR/sr2ng6Z4UYg9NHo4A25PEl
	ORO5YmMUmv0L/hebxxnoawq/36gE65gA/BstRsafx7AumYwdqTtdQnEqpJpyTLU=
X-Google-Smtp-Source: AGHT+IEkKpl7JK/kqiyPl56NU53+vw7BNCCoorwn1aek/kN8SdxFdptHiz8mzmGwr2qQNcrYO795SA==
X-Received: by 2002:a05:6830:3495:b0:6fc:3491:877 with SMTP id 46e09a7af769-6fc34910b59mr10570275a34.26.1718714790668;
        Tue, 18 Jun 2024 05:46:30 -0700 (PDT)
Message-ID: <9d43b148-2cb6-45c8-a84c-0e51219669fa@citrix.com>
Date: Tue, 18 Jun 2024 13:46:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.19?] x86/Intel: unlock CPUID earlier for the BSP
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <82277592-ea96-47c8-a991-7afd97d7a7bc@suse.com>
 <f51b2240-03da-4aee-8972-a72b53916ce1@citrix.com>
 <e493035c-2954-418e-96fb-add1577df59f@suse.com>
 <8fb21b45-c803-4d37-8df8-3a1afa677ef7@citrix.com>
 <d3f9ae64-fb85-47b2-bb69-153c7734a0a3@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <d3f9ae64-fb85-47b2-bb69-153c7734a0a3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/06/2024 12:12 pm, Jan Beulich wrote:
> On 14.06.2024 12:14, Andrew Cooper wrote:
>> On 14/06/2024 7:27 am, Jan Beulich wrote:
>>> On 13.06.2024 18:17, Andrew Cooper wrote:
>>>> On 13/06/2024 9:19 am, Jan Beulich wrote:
>>>>> Intel CPUs have a MSR bit to limit CPUID enumeration to leaf two. If
>>>>> this bit is set by the BIOS then CPUID evaluation does not work when
>>>>> data from any leaf greater than two is needed; early_cpu_init() in
>>>>> particular wants to collect leaf 7 data.
>>>>>
>>>>> Cure this by unlocking CPUID right before evaluating anything which
>>>>> depends on the maximum CPUID leaf being greater than two.
>>>>>
>>>>> Inspired by (and description cloned from) Linux commit 0c2f6d04619e
>>>>> ("x86/topology/intel: Unlock CPUID before evaluating anything").
>>>>>
>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>> ---
>>>>> While I couldn't spot anything, it kind of feels as if I'm overlooking
>>>>> further places where we might be inspecting in particular leaf 7 yet
>>>>> earlier.
>>>>>
>>>>> No Fixes: tag(s), as imo it would be too many that would want
>>>>> enumerating.
>>>> I also saw that go by, but concluded that Xen doesn't need it, hence why
>>>> I left it alone.
>>>>
>>>> The truth is that only the BSP needs it.  APs sort it out in the
>>>> trampoline via trampoline_misc_enable_off, because they need to clear
>>>> XD_DISABLE in prior to enabling paging, so we should be taking it out of
>>>> early_init_intel().
>>> Except for the (odd) case also mentioned to Roger, where the BSP might have
>>> the bit clear but some (or all) AP(s) have it set.
>> Fine I suppose.  It's a single MSR adjustment once per CPU.
>>
>>>> But, we don't have an early BSP-only early hook, and I'm not overwhelmed
>>>> at the idea of exporting it from intel.c
>>>>
>>>> I was intending to leave it alone until I can burn this whole
>>>> infrastructure to the ground and make it work nicely with policies, but
>>>> that's not a job for this point in the release...
>>> This last part reads like the rest of your reply isn't an objection to me
>>> putting this in with Roger's R-b, but it would be nice if you could
>>> confirm this understanding of mine. Without this last part it, especially
>>> the 2nd from last paragraph, certainly reads a little like an objection.
>> I'm -1 to this generally.  It's churn without fixing anything AFAICT,
> How that? We clearly do the adjustment too late right now for the BSP.
> All the leaf-7 stuff added to early_cpu_init() (iirc in part in the course
> of speculation work) is useless on a system where firmware set that flag.

After discussing this at the x86 maintainers meeting, I agree that it is
fixing a potential bug.

So, while I really dislike the patch, it's the right approach in the
short term, and should go in.

~Andrew

