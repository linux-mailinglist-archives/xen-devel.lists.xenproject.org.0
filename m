Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKsfECLs2GlGjwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 14:25:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A11D73D6EB4
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 14:25:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1278963.1563650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBAuo-0003Ms-Kw; Fri, 10 Apr 2026 12:24:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278963.1563650; Fri, 10 Apr 2026 12:24:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBAuo-0003LO-Gm; Fri, 10 Apr 2026 12:24:50 +0000
Received: by outflank-mailman (input) for mailman id 1278963;
 Fri, 10 Apr 2026 12:24:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wBAum-0003LE-Rs
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 12:24:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wBAum-00EUP9-7Z
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 14:24:48 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d8ec06-bab6-0a2a0a5309dd-0a2a4507aa7a-46
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 14:24:48 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d8ec0f-ba2d-0a2a45070019-d1558033d8b6-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 14:24:47 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4887fd35e60so13675885e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 05:24:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d5df260bsm20547655e9.13.2026.04.10.05.24.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Apr 2026 05:24:46 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775823887; x=1776428687; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GZnNbpjwnkwqkv2CoFGa7gUAd4Azk+SDTP3+qEeveGs=;
        b=ba9jnJ4HUH5RR3bIR8A205hzrAeaA0MW6uHnszyhGSOLzH01DMH/p0rcVfHHttHYNX
         XmXrYfevsvK4zXKm6jGDDPGqaqvnZXJwg+8la/RvdnNNNoQbdbJX/T+DnunZP9b7PJ2b
         POKfGEDn0yiAgDt5HdDTcx6Y4J61ItqV8l1kLcC0S7e9NDUPrtR3OhQxsJTlnl7oL3Tk
         QoaFI0qe4Rwlzf0UdtVUOQamSZpHAVmBMcO5fPVj+y59BeHUy1d7ToNtsOPTn+RmXfAY
         31SjBoAE8Sd4DyDhDbEULdafE4UGyJ0msw1GLd2VKGtNfeC+jrXYEzvgjZV+dTWYlvoJ
         iq7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775823887; x=1776428687;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZnNbpjwnkwqkv2CoFGa7gUAd4Azk+SDTP3+qEeveGs=;
        b=OMg2xkLP2/0OR5mOay92wbf7sMSL0+kh9oj5dR2/2RjT5mMIVVPi4NamOs/1+CBt2o
         jUD9wg9gy48POc4CSOaWtqqtt6mUxnKSfual8hYuV/m7LI02r6mPE/8kE7jImxtscW0+
         VUuFX3MLdGUVfFNP6tDh66BWBR5J2tfWDZsJivgXYbjAR7ZAV87e+Kfc3eTPBFmpHJMe
         VKxP+BOcXdc8Keen5uixNvMFQMkXggdoJhdd7emQZNtHKPC6d7RlXkdefE6ppTZS+Kl6
         OdSeLueYa2Yf85G6fa+GT0t4pWxsV3qpJ4yqagyQQaxzbAeeBEdF+gvLa2Uq/GpWqE9a
         80hA==
X-Forwarded-Encrypted: i=1; AJvYcCXRnqtt3dYhtiiKdeb8h3BK2DBmRg8rwZVBhuFo/66H9t80zf8ir3VfmvxWRXB+glen1pRQHQnvkDY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwMQrbIcZg3gXSmDSRjkkZJOsVVJIq8BlCEDH26TkxxPWXZJZEt
	DNEIIvc22iy/Z5ZEBMxhkdDQokUxzTprXZZYXRIFx6/IAcpj/SQc1S5J7zd/tYyb3A==
X-Gm-Gg: AeBDieujghGGn3nCd+esd0PUTKDotugsETHxQK+CH5Z/5B0D0G63KMeEveuKNhcKega
	7whYkBElMVnuE37ZJJ4Ou8zsmedAOTJ61pyZJMTsJVBwV3Lmld/9mgk7jMQvrUP7w+1soTli1EG
	oWxsJgtz+80gvsuszob/Djqv0mmhU1wissAptuwy2Xw4M6K6rJbVZbFmiqTua1vjOvH7WXCrLZm
	UwnCe+4KBUrIqwmGGLXmoxagPtksMIrImbGnyQIA6W9LmqtCANvM4sJE4URBUgxM/TuDDDaulup
	VmBwVkehIIcubj7IgnlJrSadSK0P/SLdK4pHVpeMTti1GlAyKaQPJrcugdu+5aFVMb5JwXuj5H+
	/Sydosu1L75qlT7+HEdV7zx0By2Vg3aIA24KkaPxiPPibSs4dsFMXrHlxnDS4DYfqaFvvdC0Djy
	ANbqkZ60ihTDxAYzaZW3dZ+iaGeaRYdK72SvTPKSTJHFtODlyfOqMdgSohxrL42XytORbONWc6v
	Z6wfKG6QWnnDWY=
X-Received: by 2002:a05:600c:890e:b0:485:3dfc:569 with SMTP id 5b1f17b1804b1-488d683665dmr25464345e9.16.1775823887259;
        Fri, 10 Apr 2026 05:24:47 -0700 (PDT)
Message-ID: <b93e33cf-6e1d-4117-b517-7f92516e2a6d@suse.com>
Date: Fri, 10 Apr 2026 14:24:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00.9/16] x86/CPUID: enable AVX10 leaf
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <1e2ff012-b07a-43be-9ba6-290b38d3c97c@suse.com>
 <bdf60f69-6d1f-4332-9575-671d475c542e@suse.com>
 <029ab247-b8a1-4961-80ab-5b13e5c7aa77@vates.tech>
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
In-Reply-To: <029ab247-b8a1-4961-80ab-5b13e5c7aa77@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1775823887-83D4741E-FDE9E919/0/0
X-purgate-type: clean
X-purgate-size: 5108
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid,gen-cpuid.py:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A11D73D6EB4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10.04.2026 11:26, Teddy Astie wrote:
> Le 09/04/2026 à 17:18, Jan Beulich a écrit :
>> This requires bumping the number of basic leaves we support. Apart from
>> this the logic is modeled as closely as possible after that of leaf 7
>> handling.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> The gen-cpuid.py adjustment is merely the minimum needed. It's not
>> really clear to me whether someone turning off e.g. AVX512BW might then
>> also validly expect AVX10 to be turned off.
> 
> AFAIUI, AVX512BW is a dependency of AVX10, as AVX10 implies that the 
> former is available.

I'm not convinced it is a "dependency". My understanding is that while
Intel may say that all their AVX10 hardware is expected to set all the
respective AVX512* bits as well, the spec says e.g. "Intel® AVX-512
instruction families included in Intel® AVX10.1 are shown in Table 3.2."
Where "instruction families" doesn't say anything about CPUID bits. So
from an abstract spec pov someone wanting to use e.g. VMOVDQU8 will
want to check for AVX10 || AVX512BW.

>> Do we want to synthesize AVX10 in the (max?) policies when all necessary
>> AVX512* features are available, thus allowing migration from an AVX10
>> host to a suitable non-AVX10 one?
> 
> I guess we want, there is not really a reason to not allow it.
> 
> Some software may check for AVX10 only, and not check for individual 
> AVX512 bits.

As per above, such software may be slightly flawed. Synthesizing the
AVX10 feature bit also means synthesizing the AVX10 leaf then, for
example. This may be somewhat of an issue for migration; I didn't
thoroughly think this through yet.

>> --- a/xen/arch/x86/cpu-policy.c
>> +++ b/xen/arch/x86/cpu-policy.c
>> @@ -211,7 +211,7 @@ static void recalculate_xstate(struct cp
>>       if ( p->feat.mpx )
>>           xstates |= X86_XCR0_BNDREGS | X86_XCR0_BNDCSR;
>>   
>> -    if ( p->feat.avx512f )
>> +    if ( p->feat.avx512f || p->feat.avx10 )
> 
> In principle, the avx10 check is redundant as avx512f must be set if 
> avx10 is set.

I don't think so; see above discussion of AVX512BW.

>> --- a/xen/arch/x86/lib/cpu-policy/cpuid.c
>> +++ b/xen/arch/x86/lib/cpu-policy/cpuid.c
>> @@ -125,6 +125,7 @@ void x86_cpu_policy_fill_native(struct c
>>           switch ( i )
>>           {
>>           case 0x4: case 0x7: case 0xb: case 0xd:
>> +        case 0x24:
>>               /* Multi-invocation leaves.  Deferred. */
>>               continue;
>>           }
>> @@ -218,6 +219,15 @@ void x86_cpu_policy_fill_native(struct c
>>           }
>>       }
>>   
>> +    if ( p->basic.max_leaf >= 0x24 )
>> +    {
>> +        cpuid_count_leaf(0x24, 0, &p->avx10.raw[0]);
>> +
>> +        for ( i = 1; i <= MIN(p->avx10.max_subleaf,
>> +                              ARRAY_SIZE(p->avx10.raw) - 1); ++i )
>> +            cpuid_count_leaf(0x24, i, &p->avx10.raw[i]);
> 
> Do we need to split the 0 iteration out ? I guess we can just start from 
> i = 0 instead.

Well, strictly formally p->avx10.max_subleaf is uninitialized on the
first loop iteration. Hence comparing against it isn't a good idea. (In
practice the field taking whatever value will let i == 0 pass, but still.)

What's more important though: I want to keep this in sync with what we to
elsewhere in the function.

>> --- a/xen/include/xen/lib/x86/cpu-policy.h
>> +++ b/xen/include/xen/lib/x86/cpu-policy.h
>> @@ -59,11 +59,12 @@ unsigned int x86_cpuid_lookup_vendor(uin
>>    */
>>   const char *x86_cpuid_vendor_to_str(unsigned int vendor);
>>   
>> -#define CPUID_GUEST_NR_BASIC      (0xdu + 1)
>> +#define CPUID_GUEST_NR_BASIC      (0x24u + 1)
>>   #define CPUID_GUEST_NR_CACHE      (5u + 1)
>>   #define CPUID_GUEST_NR_FEAT       (2u + 1)
>>   #define CPUID_GUEST_NR_TOPO       (1u + 1)
>>   #define CPUID_GUEST_NR_XSTATE     (62u + 1)
>> +#define CPUID_GUEST_NR_AVX10      (0u + 1)
> 
> Intel specification now defines AVX10.2 which has a additional leaf 
> (even though the whole leaf is currently marked as "reserved").

See "x86/CPUID: enable AVX10.2 sub-leaf" later in the series. The first
part aims at supporting just AVX10.1.

>> --- a/xen/tools/gen-cpuid.py
>> +++ b/xen/tools/gen-cpuid.py
>> @@ -294,7 +294,7 @@ def crunch_numbers(state):
>>           # enabled.  Certain later extensions, acting on 256-bit vectors of
>>           # integers, better depend on AVX2 than AVX.
>>           AVX2: [AVX512F, VAES, VPCLMULQDQ, AVX_VNNI, AVX_IFMA, AVX_VNNI_INT8,
>> -               AVX_VNNI_INT16, SHA512, SM4],
>> +               AVX_VNNI_INT16, SHA512, SM4, AVX10],
>>   
> 
> I think we can instead make AVX10 a dependency on AVX512. Especially since
> 
>  > Any processor that enumerates support for Intel AVX10 will also 
> enumerate support for Intel AVX, Intel AVX2, and Intel AVX-512 (see 
> Table 16-2).
> 
> with AVX-512 depending on AVX2.

That's the very statement I refer to at the top. Intel may say this for
themselves, but the spec - according to my reading - doesn't mandate this.

Jan

