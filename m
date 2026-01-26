Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHBfOQEvd2lVdAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 10:08:17 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D72B85CF7
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 10:08:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213421.1523896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkIZp-0006n2-1s; Mon, 26 Jan 2026 09:08:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213421.1523896; Mon, 26 Jan 2026 09:08:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkIZo-0006kW-VN; Mon, 26 Jan 2026 09:08:04 +0000
Received: by outflank-mailman (input) for mailman id 1213421;
 Mon, 26 Jan 2026 09:08:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fT7M=77=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vkIZm-0006kO-SF
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 09:08:02 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83f4db08-fa96-11f0-b15f-2bf370ae4941;
 Mon, 26 Jan 2026 10:08:01 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-42fb6ce71c7so3998075f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jan 2026 01:08:01 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1f7b41asm30484509f8f.39.2026.01.26.01.08.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jan 2026 01:08:00 -0800 (PST)
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
X-Inumbo-ID: 83f4db08-fa96-11f0-b15f-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769418481; x=1770023281; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=01X7aAj9lj3w/C21J0hY3i7tTWbXR2kW8qPUqn1C/OY=;
        b=VNPEMSPHwJFyKkfSef2rtzzuarksglkqJT34G6rdS/X55lyE5fhw/LB5l1whU9Ac9q
         phCTZK5bK/f5nK29Z6dOp/lypn81zmR6guffB3VnSR+Hk/GkaOt+o9i2N9YLO/nfnP3t
         GN36tNz/Gv/4sIylIWPWSkFHH1+VY66H4kvxDr/JVAyCS+q8D/Ae3l9wD8ht1ByaJAFs
         0neX8dZhJ4rW6taHf+vEpKg76akId/9gkUcvjEpAhFfSBJLXyNx3cTpGOlQtnY48AKOw
         3l1+XWs0bVfPk9jC2X3zgSFs0jlHTRoAk4zPpf5jUQpyevyoR+PtJOFC8kRhkYPHaTrg
         uqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769418481; x=1770023281;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=01X7aAj9lj3w/C21J0hY3i7tTWbXR2kW8qPUqn1C/OY=;
        b=PVpQmpc1FB5czwGLE29+TwAYrX6RZdjICALuTlVJRLxJlHcrzcIIc/ZrpXaed7vTkm
         5gfAuSpyS5Jjo7n6juwnDPkOBZy5YpFGKCJorkpw04Z6AHYx9cshHLouP7XEbtn4/KDW
         LtGNcZoiFKeCE0wC4byRvGK2IdmF+UmZRh6Y0NxTfTzd8yT+N5Me2mebl8soMrbTsYoM
         8p3G09LhgXe4corrkRWaP79ZCNikwU+vqhFwg0tcIH7oxDG+OEENlo55ZV7iZonMaKKo
         0BUmZlmBe3AqrQf6ALpmJPF411VNr3KYDdIrtyWDXufH+vIwSL+CpSPcDJ+DQfPrnnyO
         zjvw==
X-Forwarded-Encrypted: i=1; AJvYcCXTxpFpjktRIzg42DnvwRN9/s2DfpIfAwQNqhpJnEG9vmQi2ARpTHDoMmuXPNonCg5UwBn92npYuDk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyn2EDj4qHZ7qabQkUUpAD8Ze8VghBiZl6AeASZbN9HwEvjPrEV
	bWFq2HPNwad1fpDh/Py8UvxIFDfwCCkP7NoqFzC1lwOPeLiwBUSRzcPft6e2F2flsw==
X-Gm-Gg: AZuq6aKsC1lSv79aGdWOLuAwJWiMQ5Lk4AM2qOqaLO2cEYATA0FIxpP4oKQ/0vZf97s
	uv3SCs/vMisixE/xABIh2hHAFe9P0znbJO+vrNrCGxqlixlAKCS2AIU/Tcym1tL6/wG512ZH3Mp
	KcS63olNfhE+lsP4J5jfwVE/hgcaspEmav3Af+hu1HuKbpgljduqrWV51zDZzoh5ge9NjeA0YgH
	KcR8U7HsETqD96W8lP95N2jp7NF5ZukMw44c6mPUU3dvwG7N77+znArDIBSszFS8x9u2L4g/0NI
	x3t4+t4X9evmxXaDXN45/2aCsAUaO7TL/LZbxpC36zoCrXAGAVlW07xSrvSs/1RjQVN6ManRNtX
	rTagvV3IMn/s6kno6WusR6cHKilLrAov7Rw5EYzYoS4dLi30RLM6MK3anYX0QTDHHw8M2DYFYrr
	iVA7o/94kJ8LgBYp3QeqFP5cYBLI5x35Dyn6wSSSyfsI+c+9gxSTHteCXG9lM7NTNQlzxiK9eOs
	vQ=
X-Received: by 2002:a05:6000:2285:b0:432:5bac:3915 with SMTP id ffacd0b85a97d-435ca193e3cmr6268131f8f.39.1769418480954;
        Mon, 26 Jan 2026 01:08:00 -0800 (PST)
Message-ID: <8bad1a32-d59c-4dba-8c35-b28fcb16f39c@suse.com>
Date: Mon, 26 Jan 2026 10:08:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] cpufreq/hwp: move driver data into policy
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ac56e199-7c03-4e97-8238-91d23b0391e2@suse.com>
 <8441ada5-e2ed-4d79-822c-ecf1ce3c9484@suse.com>
 <26ef0e68-efca-4b9a-a210-76b5426da130@amd.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <26ef0e68-efca-4b9a-a210-76b5426da130@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jason.andryuk@amd.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 4D72B85CF7
X-Rspamd-Action: no action

On 23.01.2026 23:35, Jason Andryuk wrote:
> On 2026-01-22 04:42, Jan Beulich wrote:
>> Share space with the ACPI and powernow drivers, avoiding a separate
>> allocation for each CPU. Except for get_hwp_para() all use sites already
>> have the policy available, and this one function can simply be brought
>> closer to its sibling set_hwp_para().
> 
> Minor, but maybe 's/function/function's signature/'.  The original 
> phrasing made me think it was code movement.

I don't see an issue there, but I've adjusted as you asked for.

>> This then also eliminates the concern over hwp_cpufreq_cpu_init() being
>> called for all CPUs
> 
> We expect hwp_cpufreq_cpu_init() to be called for each CPU, so I am 
> confused by this statement.  The data...

Well, "expect" is the problem. Recall my pointing out of the problem when
having noticed the same pattern in the amd-cppc driver patches. My
recollection from the discussion is that there's no formal statement of
...

>  >, or a CPU going offline that's recorded in> policy->cpu (which would 
> result in accesses of per-CPU data of offline
>> CPUs).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> hwp_cpufreq_target() still requires policy->cpu to be online, though.
>>
>> --- a/xen/arch/x86/acpi/cpufreq/hwp.c
>> +++ b/xen/arch/x86/acpi/cpufreq/hwp.c
> 
>> -static DEFINE_PER_CPU_READ_MOSTLY(struct hwp_drv_data *, hwp_drv_data);
> 
> ... here is tracked and filled per-CPU.
> 
> Do we need cpufreq_add_cpu() to force hw_all = 1 for HWP (and maybe 
> AMD-CPPC) to ensure that policy is allocated per-CPU?

... this being a correct thing to do, hence our code imo would better be
resilient to it being different somewhere.

> Are we implicitly relying on shared_type == CPUFREQ_SHARED_TYPE_HW to do 
> that for us?

Right now we do, I believe, without - as said above - this being actually
mandated by the spec.

Jan

