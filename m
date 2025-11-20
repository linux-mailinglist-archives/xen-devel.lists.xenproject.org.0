Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDC9C7468E
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 15:02:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1167424.1493738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM5ER-0001kj-I2; Thu, 20 Nov 2025 14:01:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1167424.1493738; Thu, 20 Nov 2025 14:01:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM5ER-0001iT-FH; Thu, 20 Nov 2025 14:01:55 +0000
Received: by outflank-mailman (input) for mailman id 1167424;
 Thu, 20 Nov 2025 14:01:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nz19=54=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vM5EQ-0001iN-6Q
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 14:01:54 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76c81eb9-c619-11f0-980a-7dc792cee155;
 Thu, 20 Nov 2025 15:01:51 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-6408f9cb1dcso1331350a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Nov 2025 06:01:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6453642d32csm2154777a12.21.2025.11.20.06.01.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Nov 2025 06:01:50 -0800 (PST)
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
X-Inumbo-ID: 76c81eb9-c619-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763647311; x=1764252111; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6SIE3casSsd8G+MCJP1r/drOKy4UR4iNlw4KDS2OyH0=;
        b=G5hScSUWexLpsKPVcuqu7Czi/+b3gzxbnMBFDkDvIozVte23oHp0fFKurlyrZPIdlu
         nZhgxR3Y3zk2/r3dI4bNhERsAfacE4m2NVsyj9iK3EQH/0UT0CkhrhbhA7Z18JIhGadc
         07F/pFMfEWFOtBnxWoS9vdF4zumQkq7fb6XhcY+2Pe1HvHcfF5kloJSTqcdZS45UDcAh
         XIcqGae+DTjnkuZxzQAPWHHEZJiECJrC+rLdC+0WZTBDACgc3TBGlvezbXK+bwGJBYWO
         vtnDTwpr1WYRax3wUM9MmhP3QAfB97h4WW61tcE0cBxCuzoYiXzXrgN7cjGXm6odz/TM
         iB9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763647311; x=1764252111;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6SIE3casSsd8G+MCJP1r/drOKy4UR4iNlw4KDS2OyH0=;
        b=n5Ry4B1pZZviRJs/V+RXlMx41s7Sp4igFftDm+/OBh7L62Yns+ciIchpmaOCo7/gPT
         B8m8ctaxR6pUOer9Ux6ASejq4GQLGi6NA9vTenLx+vdD7t3PqFhPRohrCIluszpXehOh
         UoBRFv2ELxReSHwjp+JiuRcX7svSTqfolxDs3UcVY2eeuf+Z6tCnUjf2FEr/5hHd7pe3
         A61s4xkFCWqlDuwfXetMLLtAlYVVU2Nko+ci98mzu090k0Zjrf9vkeCPyVoszk64805j
         gAjVWTrRmQMFOcQdgKKRfIHCmG7puQYwvWjv2P3VqHEL6whcjOjqtrIQnHodA+/AYnGU
         0ywQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgaplEZCCAP3bTTOiv1+Ls7XRTFK4/wAiGZryrQoNSuB3x2J+Gh02zGXkYMV94NqR9oir2O0qxv7g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwwSSrmCq9ncSZ3jrrrlv1sn//hmEvACLKjc8OMak22th0BDDX6
	TtA/RXKnz54zx/W1Om+3McyYK0Gnmt5tPqfP/A7wn0ucCbvqFqNU6n4V6e9FATE7Aw==
X-Gm-Gg: ASbGnctNW6nTLKgrJAgjwxZd3utpzquvXUOznPwKk0WiUYM5eQz8eps9xxdv2XFCsMJ
	vwOGg40c4RbPpcltHcS4Z7L2eaD54q09s/0E8DSDFi5IBc5NRNIM5OYaFJz0EccxS5JX4CZI8RF
	wUNiS8/ZtU6D1233YTbxKsdjtKGVoBIJPtxuJYqlmv7x73aDRp3VTxpu3s6yH1LYg+Px0Sa1bET
	+PNIoExE0pyKI7wvEukCucUFREGUj+OEAL45B90o8md69f7rJGFqQlkYKVhLv2tA6MCyFMNw+xW
	+mCtPTqpATgvntRRiSq10uWHGOtjiNh4qrUk2gYa2j5sy9R2JJFeheP2Gc5z7B4JXkU7qVmmdZe
	pq119V3AgYaslx+xE3rFN5/z4RfXgV5w8BM5DNbsITpSZHtqdWdj3912KCV4xtaPJX3OHj1P6Ti
	Ndtm3Tt/D5TpS9EGNKLnkJkS+xOZEt0O1rPSZ8a9b1YPiPm7d2175VYclZzM/SXR3kFd1GlfiZv
	uY=
X-Google-Smtp-Source: AGHT+IHcURqUqyBMyGD93c4RQuzbKIE0rX3VV4EmiXbH5qgSsH/NgQ8e/g2H6ONuqXPb+QMZyE8SVA==
X-Received: by 2002:a05:6402:3812:b0:641:1f22:fc68 with SMTP id 4fb4d7f45d1cf-6453647b923mr2520217a12.24.1763647311110;
        Thu, 20 Nov 2025 06:01:51 -0800 (PST)
Message-ID: <3dd37b00-2179-43a2-a551-ad95d52780e3@suse.com>
Date: Thu, 20 Nov 2025 15:01:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] x86/vPMU: don't statically reserve the interrupt
 vector
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <fbc9a2f8-170a-4645-8836-c90c42ad726f@suse.com>
 <06f2081b-64e0-47f5-b66a-26363979cfdb@suse.com>
 <f491eb9c-7822-4637-95a3-bcd994b20dea@citrix.com>
 <bde84a94-77af-4fec-9075-a709323abdc4@suse.com>
Content-Language: en-US
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <bde84a94-77af-4fec-9075-a709323abdc4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.11.2025 13:31, Jan Beulich wrote:
> On 20.11.2025 13:24, Andrew Cooper wrote:
>> On 19/11/2025 10:51 am, Jan Beulich wrote:
>>> --- a/xen/arch/x86/apic.c
>>> +++ b/xen/arch/x86/apic.c
>>> @@ -1313,16 +1313,6 @@ static void cf_check error_interrupt(voi
>>>             entries[3], entries[2], entries[1], entries[0]);
>>>  }
>>>  
>>> -/*
>>> - * This interrupt handles performance counters interrupt
>>> - */
>>> -
>>> -static void cf_check pmu_interrupt(void)
>>> -{
>>> -    ack_APIC_irq();
>>> -    vpmu_do_interrupt();
>>> -}
>>> -
>>
>> I know you're only moving this, but it's likely-buggy before and after. 
>> ack_APIC_irq() needs to be last, and Xen's habit for acking early is why
>> we have reentrancy problems.
> 
> I was wondering, but was vaguely (but apparently wrongly) remembering that
> the PMU interrupt is self-disabling (i.e. requires re-enabling before it
> can fire again). Should have checked vpmu_do_interrupt() a little more
> closely, where from the various plain "return" it's pretty clear that isn't
> the case.
> 
>> I think there wants to be a patch ahead of this one swapping the order
>> so the ack is at the end, so that this patch can retain that property
>> when merging the functions.
>>
>> Or, if you're absolutely certain it doesn't need backporting as a
>> bugfix, then merging into this patch is probably ok as long as it's
>> called out clearly in the commit message.
> 
> No, I'll make this a separate, prereq patch.

It won't really need backporting, though: Direct-APIC-vector handlers are
called with IRQs off, and hence when to ack is benign as long as IRQs aren't
transiently turned on while handling. Nevertheless it probably makes sense
to switch things around, so I'll add that extra patch anyway.

Jan

