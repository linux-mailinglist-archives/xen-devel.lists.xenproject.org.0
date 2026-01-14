Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 330DAD1DA13
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 10:41:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1202775.1518213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfxNN-0004kU-IW; Wed, 14 Jan 2026 09:41:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1202775.1518213; Wed, 14 Jan 2026 09:41:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfxNN-0004hm-F9; Wed, 14 Jan 2026 09:41:17 +0000
Received: by outflank-mailman (input) for mailman id 1202775;
 Wed, 14 Jan 2026 09:41:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=16zh=7T=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vfxNL-0004UK-AF
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 09:41:15 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a42770d-f12d-11f0-9ccf-f158ae23cfc8;
 Wed, 14 Jan 2026 10:41:13 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-64b9b0b4d5dso17937136a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jan 2026 01:41:13 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8715952fc3sm885283566b.50.2026.01.14.01.41.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 01:41:12 -0800 (PST)
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
X-Inumbo-ID: 2a42770d-f12d-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768383673; x=1768988473; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d+KKqqMW8nxBukXV88HW+z2l/Nszr88m9Uq2V6byg8M=;
        b=huOcXBSjwrp+kaN/bMi9A/qlfMj05LuRIbUCK7PG/kKyGZILXK7tLGFrvyy3APS2GZ
         08URedH4rkbwqiGQ5KOMmAjRqxUzXiO6t3A7cPuvvSCZ4a5HQjzKb6lffNbVAnjQVNLA
         SZEgIrqY+4GLW3//NeNNtKuHlgIAhijWm1jb0qMgbugRfOzPVoaqnoYaf4hZsY6xYjBC
         GWecUn/4T91+kIBES9OUv8Opd743JWESlAS0UKGPvcEBUfwFLDOydYQ6/cMCXpytmhJg
         SuAhEF7je7DesmXrhGBlrd+26jBlGVT+dM2zFBsQ96pkMKJKxD5m5fiYj3LtpOwYI/uL
         yf4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768383673; x=1768988473;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d+KKqqMW8nxBukXV88HW+z2l/Nszr88m9Uq2V6byg8M=;
        b=sdDY85Y3Rs9sGnEXwFz9LuERtn/n6xOU+w3Qs+3BT9vQRRQBiZFvFAl/zDC1zrcWvH
         Vj9CnJ5oUOhVRZXZDbm5bTWdDdvndDSJ1lJ0jD98hr7dqtsyLyK3vsGtJeo3PNjxO77R
         2R5+kKvtIg+hXDbriYAWVPuw/J3MJ0hdHEAmhrTIlEftfsBTVWs7AfqDwqO3XGJCy7WR
         E1EokPrxJy4GLGcuCGiFoTVYjd3QAWwOGTQtXP664WrOVLrYdkE3SbHfeMT4DdpO9BAd
         kPQDawVmTVTyH7/u4Bb9OeJlcBNt14rQ4JgKZANdpETF7ajr9YoFw+VHafCwR+PW4vCK
         ivww==
X-Forwarded-Encrypted: i=1; AJvYcCVs6bCtVkmBZybxy1fTLsdUFUQbT29b9IRIHjeDCCgWz/j+B2GiBnhDEI5emj7orKHfnpShLPHENbM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwTe8a2rHRT5e0Fb2p2u9CPJLvIn2gw7B3clFxsCPbDGBWZYXV7
	vkv/kGTYMAaR4UFPLDxliQwInd8j5THFwx9e9jTEic/R6Ybtt5FT0SFn
X-Gm-Gg: AY/fxX5sEG4+kBPuREiXtKZpQP4vqcXFM4h1+y5sLodngK+OAEv/Yf7NsgNxT1oEALu
	xewmO9yGv+Gvc7oME6sugw+e1AhYhaYLWj5G5iFY5hvanzhW3HDhXMYJqRvDAnPx9VuvGboW5Dz
	lbEtGK04JXxDF6TN5PITf5dez3vTyah6Ed4HjnM2QhKy7YHRaY5cgJT6be4Qt12usgt+GTIoXVm
	k4niDfJbJNFsiYFwo/iHKXAJMmPKsQXpzdfP7Ben3rkG1xBbjrftDhG+JuWBrrhhlPdN9J7Bdvw
	RASH6m7O9dth+tULER8KWpeV8L59OJht34MqqbGUwWn8SGMBE1XlysGjlvADVjfEaHEs/9Weik8
	4nn76cGyfNnqnEXxN8OIioa4eZo3h2ej2jj9Jo7NwXo0fhdbeKeBpjqNV24wdGBT+a3+/tderlX
	GuNMyuEWk9fPwfvaDr1JthWVlFl88FKjhmGbj4HMOFh3qWXS/OKokAbspOiR+soO0=
X-Received: by 2002:a17:907:72cb:b0:b87:d44:83a with SMTP id a640c23a62f3a-b8761135cdbmr175505766b.30.1768383672635;
        Wed, 14 Jan 2026 01:41:12 -0800 (PST)
Message-ID: <a7757fd0-7b23-451d-93f7-043cfbb6e684@gmail.com>
Date: Wed, 14 Jan 2026 10:41:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 13/15] xen/riscv: implement reprogram_timer() using SBI
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
 <43249171def325c49541ebdac141fe99d159b60f.1766595589.git.oleksii.kurochko@gmail.com>
 <f14c8b3d-66ce-4ea7-bf50-591a4a48345a@suse.com>
 <90e7fc60-09cc-4b61-ab0a-80037f8ecaf8@gmail.com>
 <f2241dec-a115-41b9-a249-6c5a69114809@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f2241dec-a115-41b9-a249-6c5a69114809@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/14/26 10:13 AM, Jan Beulich wrote:
> On 13.01.2026 17:50, Oleksii Kurochko wrote:
>> On 1/12/26 4:24 PM, Jan Beulich wrote:
>>> On 24.12.2025 18:03, Oleksii Kurochko wrote:
>>>> @@ -39,6 +43,33 @@ static void __init preinit_dt_xen_time(void)
>>>>        cpu_khz = rate / 1000;
>>>>    }
>>>>    
>>>> +int reprogram_timer(s_time_t timeout)
>>>> +{
>>>> +    uint64_t deadline, now;
>>>> +    int rc;
>>>> +
>>>> +    if ( timeout == 0 )
>>>> +    {
>>>> +        /* Disable timers */
>>>> +        csr_clear(CSR_SIE, BIT(IRQ_S_TIMER, UL));
>>>> +
>>>> +        return 1;
>>>> +    }
>>>> +
>>>> +    deadline = ns_to_ticks(timeout) + boot_clock_cycles;
>>>> +    now = get_cycles();
>>>> +    if ( deadline <= now )
>>>> +        return 0;
>>>> +
>>>> +    /* Enable timer */
>>>> +    csr_set(CSR_SIE, BIT(IRQ_S_TIMER, UL));
>>> Still learning RISC-V, so question for my understanding: Even if the timeout
>>> is short enough to expire before the one SIE bit will be set, the interrupt
>>> will still occur (effectively immediately)? (Else the bit may need setting
>>> first.)
>> The interrupt will become pending first (when mtime >= mtimecmp or
>> mtime >= CSR_STIMECMP in case of SSTC) and then fire immediately once
>> |SIE.STIE |(and global|SIE|) are enabled.
>>
>>>> +    if ( (rc = sbi_set_timer(deadline)) )
>>>> +        panic("%s: timer wasn't set because: %d\n", __func__, rc);
>>> Hmm, if this function ends up being used from any guest accessible path (e.g.
>>> a hypercall), such panic()-ing better shouldn't be there.
>> I don't have such use cases now and I don't expect that guest should use
>> this function.
> How do you envision supporting e.g. VCPUOP_set_singleshot_timer without
> involving this function?

Looking at what is in common code for VCPUOP_set_singleshot_timer, it doesn't
use reprogram_timer(), it is just activate/deactivate timer.

~ Oleksii


