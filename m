Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yL2oMAmjeGmGrgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 12:35:37 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 326FE93A96
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 12:35:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1214283.1524654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkhLq-0001fL-E2; Tue, 27 Jan 2026 11:35:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1214283.1524654; Tue, 27 Jan 2026 11:35:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkhLq-0001dO-BE; Tue, 27 Jan 2026 11:35:18 +0000
Received: by outflank-mailman (input) for mailman id 1214283;
 Tue, 27 Jan 2026 11:35:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y9JO=AA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vkhLo-0001dI-Sl
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 11:35:16 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f18905d-fb74-11f0-9ccf-f158ae23cfc8;
 Tue, 27 Jan 2026 12:35:14 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-42fb2314f52so3264054f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jan 2026 03:35:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1b6e2besm37486363f8f.0.2026.01.27.03.35.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jan 2026 03:35:13 -0800 (PST)
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
X-Inumbo-ID: 3f18905d-fb74-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769513714; x=1770118514; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pWigye4U0/0vGD3dyHfCQyYFhV542tvoBDe1W7IDg5o=;
        b=VjQSq7dqvauchK4UWVq0yEwGR9aVNKLv1xilmq8gtNCHQZquKmVSpYkSwIxyv7E6IR
         iookmgFwEwtWUwSHbDl5NtlbtX+n9QjGSFy3BeAxWZtEtW+ZnKv5FQEqhyesvw/UUJ0J
         u1RhB9OiHHtCe/1ooh4nH9o1caYZNrfok0pb0aj/3vB5kJdado3N4cR6oez/Hnl7+JUt
         fBlgonoFVgBGT/q+hEhoW0iJWHHCe/BM/v26GOwWv0UARAc6EDmu38V/A+ek/tgjWIZ2
         Y57a/s797FcAyfM93tBTyH/iuoPi6au12zdPT8+lGVhrgJd5ypo707xekreffRbN+AYI
         ALlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769513714; x=1770118514;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWigye4U0/0vGD3dyHfCQyYFhV542tvoBDe1W7IDg5o=;
        b=vKWUATWkzdVvUlF7z66eYCM2pzukDiLynOlbaFNN1/Eos+gjBrzssUO6oioSu13BdH
         4c2hZwT3jeBMWr5rIobCnz4vqIEAZk9AbKoEVd4me3nTMr7ONyGvharts1y78l8F15G0
         6AKJ/cyG58sUPfOG0pJdaAgqTKZ1mSQ6/qJjQA+7IgJWhx1v3HKb2TAlB+h/uqZmAlOM
         L1e3LaDEThgTZGBxbJIbii9Q4Il0oBqgTAqMS5jIg+a87ZX+Vr81s9nyV6T/bPcriyLK
         FwkD1b33VdNqyGjczmrKJrumTyMc5/Up/cIDkss9oCNiYlO3WV1BzRZM97BahWdf532l
         PQyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxBRAqSappVk/QN+18Ck8ETPzLX+YZgytD3YXt+aQEp8kgl4GaK7B/N6zwOnhGNKfIpNM1OZt5Dd0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz8+ZO1yKVgwNQpGVjuyGgHxlXIQxQhDHrPwTghQtsaZW7VvuOr
	ieO3Wh0NPnHJr6vx13xUy9TOy4rSZvaeYF8FWk3mxnttkqSP+wE2St0golH42dc2ZA==
X-Gm-Gg: AZuq6aIAC6/reh5jWxZ/4Z1BzbILB1YZpATxNsRkbCiZCixYSwbVAJc3yCb/RwMaSmq
	H7CQxoOBkG5QuYcAaqV43vc4WeXch6eBe9x0b8AV9MIFf+MDLOVKqdAYhjAo2MGUDIpBnUGq34h
	hC1+iFpjfhhWF6+3WJgBjm5Drg/3w+bWjbtCCiABL/M4VUWI6qC2BLa6TBDXuFHd/ZFz+bwJR0/
	Go22Xs2aEmaKp7gsMUx5jskRv6vLoC3fZ88bvMn9JyRL/qALEkeNB94aOtDDhk7yX3jkAsegvUN
	EsyJ8tcrQRKFEP2wsOQM2GR/3MorRtBUKSmLgH+lhZNxLGLS+YZn+swB5teunILwY7nz4YRPXju
	9NKIFmIMqpTiQfBmurao4lAF6IJao51aWGyvcu0q9f5BPxUvtQ7ItYKe/eLdkGlz8+oZZMfVsq4
	2bDBQrL+rOjUXb3aTBPBBuH8TEbSxppsisvNhOs32A7/D27+0/PVMdumvn+mmk8qGTgV0wfHkch
	qY=
X-Received: by 2002:a05:6000:61e:b0:435:9ee1:f90d with SMTP id ffacd0b85a97d-435dd02e229mr2168600f8f.10.1769513713674;
        Tue, 27 Jan 2026 03:35:13 -0800 (PST)
Message-ID: <52fe1a23-70bf-4282-a41a-7b153fd1f7c9@suse.com>
Date: Tue, 27 Jan 2026 12:35:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/16] x86/cpu: Fix boot time cache flushing
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julian Vetter <julian.vetter@vates.tech>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260126175345.2078371-1-andrew.cooper3@citrix.com>
 <20260126175345.2078371-2-andrew.cooper3@citrix.com>
 <15978c88-5ea9-4159-951b-27c9fc004756@suse.com>
 <3ded84f3-505e-40f1-b7d5-f136663af7cd@citrix.com>
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
In-Reply-To: <3ded84f3-505e-40f1-b7d5-f136663af7cd@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:julian.vetter@vates.tech,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 326FE93A96
X-Rspamd-Action: no action

On 27.01.2026 12:08, Andrew Cooper wrote:
> On 27/01/2026 10:37 am, Jan Beulich wrote:
>> On 26.01.2026 18:53, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/cpu/common.c
>>> +++ b/xen/arch/x86/cpu/common.c
>>> @@ -319,8 +319,6 @@ void __init early_cpu_init(bool verbose)
>>>  	uint64_t val;
>>>  	u32 eax, ebx, ecx, edx;
>>>  
>>> -	c->x86_cache_alignment = 32;
>>> -
>>>  	/* Get vendor name */
>>>  	cpuid(0x00000000, &c->cpuid_level, &ebx, &ecx, &edx);
>>>  	*(u32 *)&c->x86_vendor_id[0] = ebx;
>>> @@ -352,6 +350,7 @@ void __init early_cpu_init(bool verbose)
>>>  	if (edx & cpufeat_mask(X86_FEATURE_CLFLUSH)) {
>>>  		unsigned int size = ((ebx >> 8) & 0xff) * 8;
>>>  
>>> +		c->x86_clflush_size = size;
>>>  		c->x86_cache_alignment = size;
>> With this change, can't the writing of the field in generic_identify()
>> go away? CPU_DATA_INIT() in particular doesn't invalidate it.
> 
> No, it can't.  The value needs setting up on every AP, right now at least.

Are you sure? APs inherit part of the BSP's data (initialize_cpu_data()),
and reset_cpuinfo() doesn't clear ->x86_clflush_size afaics.

>> Tangentially, "cpuid=no-clflush" didn't have any effect on any of this so
>> far, and also isn't going to have with the changes you make.
> 
> The line immediately out of context above will applies the clear cap
> mask, so will cause cpuid=no-clflush to take effect.

This concerns me. With your change, "cpuid=no-clflush" will lead to an
unconditional panic() then. Whereas previously, with cleared_caps[] being
applied by identify_cpu() only after generic_identify() has already
evaluated the CLFLUSH bit, there was no effect at all.

I don't think this panic()ing is desirable, but as an absolute minimum this
(drastic) change in behavior would want calling out in the description.

Further, if the panic() was to stay, there's no point having cpu_has_clflush
evaluate to anything other than constant true anymore.

Again tangentially (and partly the reason why I overlooked that aspect
originally): While early_cpu_init() respects cleared_caps[] for leaf 1, it
doesn't for any of leaf 7's subleaves, nor for ARCH_CAPS.

Jan

