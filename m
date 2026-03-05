Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHRtBOhKqWn+3wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 10:20:40 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7061F20E3D9
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 10:20:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1246329.1545540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy4sK-0007X6-6d; Thu, 05 Mar 2026 09:20:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1246329.1545540; Thu, 05 Mar 2026 09:20:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy4sK-0007VA-3Z; Thu, 05 Mar 2026 09:20:08 +0000
Received: by outflank-mailman (input) for mailman id 1246329;
 Thu, 05 Mar 2026 09:20:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vy4sI-00071S-Es
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 09:20:06 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f3796cb-1874-11f1-b164-2bf370ae4941;
 Thu, 05 Mar 2026 10:20:05 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-48375f10628so52144415e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Mar 2026 01:20:05 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851a82c876sm31883335e9.0.2026.03.05.01.20.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2026 01:20:04 -0800 (PST)
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
X-Inumbo-ID: 7f3796cb-1874-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772702405; x=1773307205; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bRZdLSl3plZmUkZHFDVey1I7mkbthVlt1fgWI8LrAxU=;
        b=TAumixN/9mLN0GXyVcIx+8yPcjFvM0/6okb91YGR6LjPkOb5HrFTswxlS7rzDf7HzD
         kuT/raRN+3+L162qDTPMuJtKDkALKGly8y/k6J+y3Q5Edk5dNV3EkPOSo5iQS3IBXsbm
         FodcAY8wtkJzCFNsjH5eHFlt1xkMo5mdnNDT8YtioH3IMkjhpITVT8TJw8qy8DCfOUIz
         5BuiXCpKhe8QWYTjhPNK1+xqP/teFONrBUBzU+1Xd9tr2j/zdos5YTvEqB361Jo4hQvx
         bZU0+sVlW0zbv3HGlmbWO0TrH2HRHD9bHPsZYlWTf3WDUl8NtXf3ngY7h6ByYYXcxfFi
         D3Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772702405; x=1773307205;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bRZdLSl3plZmUkZHFDVey1I7mkbthVlt1fgWI8LrAxU=;
        b=ZOf3Elw6unU+USMdpxpZEzNvrpMxtgMNakXlduTNfrU3nr1ENBehP8v0hGN0bLSOet
         58E7MwBlEqwQFWaeMCDHr7VzKH/LXL/FdXDuwW2q8orzd4NpFoF80i1NMhUOKhINqtCb
         EbxV0oPsLLbzlf/YvhDzivi4w0R6JKLMqym1BHN8XnpXZF1/Pv8Vb7Bi1AHMd5waDQUW
         anvYk2UJuXRxIDqx2RVCRdio2nj+MfWeLEBpLknjs6qW5k1zDAWwaYNv6kQHY6NgFtuk
         FvYfQCxgQxKn1sm8Bucf0RcbPtxXqvgKswVyteN7tHClLtLPQ6P/BDB+xhFm8kdRQfGg
         ahOQ==
X-Gm-Message-State: AOJu0YxlCf6if/EDdaH5L8z20FTGvXtkgGNGvU3OT7Kwd4GNWnjWA/RL
	0hOiosa+MHNXUwXxQIoK59C2zje7lR0+eKe164X/EI85ck1k8M3WtIffFx7ke4bTag==
X-Gm-Gg: ATEYQzxs8+j7e95AFY5ziVaLycB7wcA6gbB7IekBCzPfaht97TVNE+JyD1CeBdQk+o2
	LOxalzs18oRE3wW8GgGB4qFg6YvUaBkjk/vpVYVZzwng2vsMyAjXKLM5phvzxpGgvv1gaEUt8j/
	tuEUuZIkoyQGbMInUSZ50aayl+NUgkkME1UkZB0RbnX/3zd1WaFmbbR4/KB5gxx7mhabX9rstGb
	VE2M+yBTXqAREjC+6j6VVYDEyHhjImYW5kKBXDzaFAYMOUqRoF0uRdLIDUu3YF2pjOntNGesal9
	X64Qhe97lHkFP3J1oKX67ioom0inV79ec36v426gmcuIe/J1lQWbbgVyNTBarp4cB66dTRBW7H3
	xU8JrfYyxqwedzUGfwJQHIYWSHelLHs9JRPDGcRTF61/lg201M/fcKn58YSt9GFN2a1pv8ZVhPL
	0p8UHZvMmDKV8quaeTYpdCoC4k8moCCIuXDLddtjIcH6bd4GhoFAXW7sf+kL1F6bn3T3Zwoz631
	Yzh0Bg/4RVlsYk=
X-Received: by 2002:a05:600c:470d:b0:483:c490:8ed with SMTP id 5b1f17b1804b1-485198a37c8mr82083575e9.32.1772702404884;
        Thu, 05 Mar 2026 01:20:04 -0800 (PST)
Message-ID: <73dd0000-4044-486a-915d-6381d0820cf6@suse.com>
Date: Thu, 5 Mar 2026 10:20:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/ACPI: _PDC bits vs HWP/CPPC
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Penny Zheng <Penny.Zheng@amd.com>
References: <ca1812c2-dadf-422a-a195-9c285ce08077@suse.com>
 <aahfgDDNVwJPa-jF@macbook.local>
 <3449aaf7-b221-4c45-9d22-54e340167b3f@suse.com>
 <aalD5VRBBuM16pxN@macbook.local>
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
In-Reply-To: <aalD5VRBBuM16pxN@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7061F20E3D9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:jason.andryuk@amd.com,m:Penny.Zheng@amd.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 05.03.2026 09:50, Roger Pau Monné wrote:
> On Thu, Mar 05, 2026 at 09:17:23AM +0100, Jan Beulich wrote:
>> On 04.03.2026 17:36, Roger Pau Monné wrote:
>>> On Wed, Mar 04, 2026 at 03:37:25PM +0100, Jan Beulich wrote:
>>>> --- a/xen/drivers/cpufreq/cpufreq.c
>>>> +++ b/xen/drivers/cpufreq/cpufreq.c
>>>> @@ -694,14 +694,23 @@ int acpi_set_pdc_bits(unsigned int acpi_
>>>>      {
>>>>          uint32_t mask = 0;
>>>>  
>>>> +        /*
>>>> +         * Accumulate all the bits under Xen's control, to mask them off, for
>>>> +         * arch_acpi_set_pdc_bits() to then set those we want set.
>>>> +         */
>>>>          if ( xen_processor_pmbits & XEN_PROCESSOR_PM_CX )
>>>>              mask |= ACPI_PDC_C_MASK | ACPI_PDC_SMP_C1PT;
>>>> -        if ( xen_processor_pmbits & XEN_PROCESSOR_PM_PX )
>>>> +
>>>> +        if ( xen_processor_pmbits &
>>>> +             (XEN_PROCESSOR_PM_PX | XEN_PROCESSOR_PM_CPPC) )
>>>
>>> Currently the CPPC driver is AMD only, and hence when using it we
>>> don't care about filtering the _PDC bits, because the ones Xen knows
>>> about are Intel-only?
>>>
>>> As you say, we likely need some clarification about whether there's
>>> _PDC bits AMD care about?
>>>
>>> Linux seems to unconditionally set bits in _PDC, so some of those
>>> might actually be parsed by AMD.
>>
>> Or it setting whatever it wants is meaningless on AMD systems. Where I
>> have extracted ACPI tables readily to hand, there's no _PDC there.
> 
> Oh, interesting, so there's no method to start with.  Is there an _OSC
> method however for processor objects?  _PDC is deprecated, and maybe
> AMD systems only expose the equivalent non-deprecated _OSC?

There is, yes.

>>> I think we might want to split the setting of XEN_PROCESSOR_PM_CPPC
>>> here from the addition of ACPI_PDC_CPPC_NATIVE_INTR into
>>> ACPI_PDC_P_MASK.  The latter we can possibly untie from the questions
>>> we have about AMD usage of _PDC.
>>
>> Hmm, yes, I can certainly split the patch. I'm looking at it a little
>> differently, though: Us leaving any P-state related bits in place when
>> cpufreq handling is done in Xen has been a mistake anyway.
> 
> Yes, TBH I even wondered whether we might just wipe whatever the OS
> sets in the _PDC bits and completely fill it from Xen (unless for the
> weird/broken case where dom0 is driving cpufreq?).
> 
> This is kind of what Xen already does now.

Indeed (except for the T-state ones, as support for that was never added
to Xen).

>  However see below.
> 
>> What's
>> unclear is solely whether because of us driving things some bits need
>> setting (likely none if AMD systems indeed don't surface _PDC in the
>> first place).
> 
> Since we have the parsing of the ACPI related data done from dom0 it's
> not only Xen that needs to support the feature, but dom0 also needs to
> know how to parse it.  Or we just assume the driver in dom0 must
> strictly know how to parse data from the features enabled by Xen.
> 
> Maybe Xen supported bits should be & with the dom0 ones?  So dom0
> would set what it can parse, and Xen would AND that with what the
> cpufreq drivers support?  However that would be an ABI change.

What cpufreq drivers are you talking about here? When Xen handles P-
state transitions, the drivers in Dom0 would preferably not even be
loaded. That's what the forward-port did. Upstream they may be loaded,
but they then can't actually do anything (and they may exit early).
Coordination is necessary only with the ACPI driver(s), and that's what
this function is about.

Jan

