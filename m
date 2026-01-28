Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMNdBYjLeWlwzgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 09:40:40 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 572EB9E4BC
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 09:40:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215250.1525464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl163-0003wn-0s; Wed, 28 Jan 2026 08:40:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215250.1525464; Wed, 28 Jan 2026 08:40:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl162-0003ua-TN; Wed, 28 Jan 2026 08:40:18 +0000
Received: by outflank-mailman (input) for mailman id 1215250;
 Wed, 28 Jan 2026 08:40:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3VuQ=AB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vl161-0003uU-2u
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 08:40:17 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f73a1f46-fc24-11f0-9ccf-f158ae23cfc8;
 Wed, 28 Jan 2026 09:40:14 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-432d2c96215so5717979f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Jan 2026 00:40:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e10ee04csm5425804f8f.12.2026.01.28.00.40.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jan 2026 00:40:13 -0800 (PST)
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
X-Inumbo-ID: f73a1f46-fc24-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769589614; x=1770194414; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mRD7W3YhsCrjwP4IUk3SDTMiVghSLWVZeUBIQVLccnc=;
        b=AE8tE7Zw6OGDtf/VgJMxG0gCp+768ZODvzrujWg0dNhb0jghH0057pIsa/9y8MH0jo
         Xae72qKEUfgSSXv4v1L13er5lv7RYV3n8VSOoFLD5d5xepTG1rhpuVyDZ2EDSGvwsmuM
         ACoN4pF1kHOuSdXONhJFQ1Va7f2PKj3r0CtjlSPWHo9V6sXYHjJJM5i4p794A2HAaLYs
         je/Z7LM/YyqnNJ52aW2/zXS3Ficzhjdn/R/VP90aOhSkpZzQ7NidMnQxkZJZ7LJkvkPg
         4VdI9i+5WVHnjGVuQChzHtTazrEmM9U5hCGnj+mMbXQ8BNArtqjfWWGLZkoedJbK1Pio
         iygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769589614; x=1770194414;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mRD7W3YhsCrjwP4IUk3SDTMiVghSLWVZeUBIQVLccnc=;
        b=bZgVPQHYeAl9WWk2zubWqEq3gT2ej8Bt4hyU3RM96ZmRfk5/EGX3xHwJ8KKVghmFtt
         jQVB0zVwHWUqt/VpeSOH1NTKsFirZ5u0NoSSpLOCGsCZViFfG29EkvpMsvKSKHKUKbT9
         TUPZvCKZBfbgvh3HdTF5leCUJ/QShDxGOsF6c2VKFLoH4+3j5JS+dmegVNcmZwETSJ4I
         6+D6fR0hovGaKHyKTLB3sy4sYOyxfzqcQTYJZn1VNcaMXdMVkDc57K6Qq0eEK9qI90AH
         TXBRxL0wa53pMtkfAVRQ+xGqkLXsS7zNmGm0QKZbqNq19OpOX2y/jKJ7QKvTO/3Qx7gj
         w+0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUJipvHNgVC9fA7Sxnv2Qumcvnbi6YH4ATxsneCb/n2eB8gOx4yolbphOICPNXst0/xOR5TG4MQQE8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyfsKdtjNrnubFw9GlL12b+OgUMkymZqBorIXsUl/CWsGgwwUjX
	DQEs7K7f82whYg5FdzNZAwVaZDk9oaPeBj/1NZG+GePkSZBL9Y8BInq/3oRaom+obg==
X-Gm-Gg: AZuq6aLl1Ww9MsD87hYVerlY0rjo1IBO39zLUpwGbjMXEqHFJ/q29TNVYlnZZvH1xWF
	1CUqL5J1h0tMnEdzRKltbU/r5x1D3enpg4Pn/jlT6cNiOZ8EZSKyFbYYoaHu2mMkZTswMKilpK6
	7CsYh3uu4w06kjtsC/5KrkO2XjKq0vBhaZKPHmXHdXplCBQ4Z5eOhpO6F4JbqLZXDobUQmo2VpY
	p4s9fJHyb4RXDB9kL94Wmr4mYSZWAMOTWwlMJxTlMgOYrcTRHH+JUtHG63Eh/fswbEPI3UFgO8o
	ywoaQkF602HvgW9c/PVYdv2jOOruyZffL4ZMQyVpnKWdR/pp0FP+EnnAEejgQ/m/50KEZuB61t3
	kuihQRphe67jhCz4Yf5VHaxldSsT7bOxlaP3LpxBMUjsSvlBN9PvNYgL7B3PdWZOypNzAehB/5X
	nd+YT6Y3PzIY5gafYzm1Q+072xGRJ6XaHV9TvqHRKvB2onSsWvENL2nvNUL2XHXPGAZpsNRbmZA
	YI=
X-Received: by 2002:a05:6000:428a:b0:435:91b6:f53 with SMTP id ffacd0b85a97d-435dd02450fmr5859204f8f.8.1769589614025;
        Wed, 28 Jan 2026 00:40:14 -0800 (PST)
Message-ID: <bf68c261-0897-40c1-a97b-356ae360d4fb@suse.com>
Date: Wed, 28 Jan 2026 09:40:11 +0100
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
 <52fe1a23-70bf-4282-a41a-7b153fd1f7c9@suse.com>
 <1fd00308-f072-44f1-936b-8668f4e9ad05@citrix.com>
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
In-Reply-To: <1fd00308-f072-44f1-936b-8668f4e9ad05@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:julian.vetter@vates.tech,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	TO_DN_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 572EB9E4BC
X-Rspamd-Action: no action

On 27.01.2026 18:53, Andrew Cooper wrote:
> On 27/01/2026 11:35 am, Jan Beulich wrote:
>> On 27.01.2026 12:08, Andrew Cooper wrote:
>>> On 27/01/2026 10:37 am, Jan Beulich wrote:
>>>> On 26.01.2026 18:53, Andrew Cooper wrote:
>>>>> --- a/xen/arch/x86/cpu/common.c
>>>>> +++ b/xen/arch/x86/cpu/common.c
>>>>> @@ -319,8 +319,6 @@ void __init early_cpu_init(bool verbose)
>>>>>  	uint64_t val;
>>>>>  	u32 eax, ebx, ecx, edx;
>>>>>  
>>>>> -	c->x86_cache_alignment = 32;
>>>>> -
>>>>>  	/* Get vendor name */
>>>>>  	cpuid(0x00000000, &c->cpuid_level, &ebx, &ecx, &edx);
>>>>>  	*(u32 *)&c->x86_vendor_id[0] = ebx;
>>>>> @@ -352,6 +350,7 @@ void __init early_cpu_init(bool verbose)
>>>>>  	if (edx & cpufeat_mask(X86_FEATURE_CLFLUSH)) {
>>>>>  		unsigned int size = ((ebx >> 8) & 0xff) * 8;
>>>>>  
>>>>> +		c->x86_clflush_size = size;
>>>>>  		c->x86_cache_alignment = size;
>>>> With this change, can't the writing of the field in generic_identify()
>>>> go away? CPU_DATA_INIT() in particular doesn't invalidate it.
>>> No, it can't.  The value needs setting up on every AP, right now at least.
>> Are you sure? APs inherit part of the BSP's data (initialize_cpu_data()),
>> and reset_cpuinfo() doesn't clear ->x86_clflush_size afaics.
> 
> Every time I look at that, it gets more insane.
> 
> For every CPU, initialize_cpu_data() clobbers boot_cpu_data, *then*
> copies the result into cpu_data[] array.
> 
> This cannot possibly be correct.  Why on earth did I ack it?

I wonder what you're looking at. My initialize_cpu_data() has

    struct cpuinfo_x86 c = boot_cpu_data;

which means a copy is being made, the address of which is then handed
to reset_cpuinfo().

>>>> Tangentially, "cpuid=no-clflush" didn't have any effect on any of this so
>>>> far, and also isn't going to have with the changes you make.
>>> The line immediately out of context above will applies the clear cap
>>> mask, so will cause cpuid=no-clflush to take effect.
>> This concerns me. With your change, "cpuid=no-clflush" will lead to an
>> unconditional panic() then.
> 
> So will no-cmpxchg8b.

Which doesn't make the situation any better. (I think you mean no-cmpxchg16b
though?)

>> Whereas previously, with cleared_caps[] being
>> applied by identify_cpu() only after generic_identify() has already
>> evaluated the CLFLUSH bit, there was no effect at all.
> 
> That wasn't no effect.  The effect (upon request of an impossible thing)
> would be that part of Xen would have ignored the request and functioned,
> but another part of Xen would have propagated that to guests, which will
> probably have equally rude things to say.

Well, I thought it was clear from context that I meant "no effect for Xen
itself". As to guests - as long as they're properly checking CPUID bits
and refrain from using insns which CPUID says aren't available, I don't
see why they should get upset.

When knowing one may run virtualized, the concept of "I know one feature
(e.g. LM) implies another (e.g. CLFLUSH)" is flawed. Any combination of
features can be surfaced, so long as true dependencies between them are
respected. IOW I disagree with "cpuid=no-clflush" requesting an impossible
thing. "cpuid=no-lm", otoh, does for a 64-bit target environment.

>> I don't think this panic()ing is desirable, but as an absolute minimum this
>> (drastic) change in behavior would want calling out in the description.
>>
>> Further, if the panic() was to stay, there's no point having cpu_has_clflush
>> evaluate to anything other than constant true anymore.
> 
> I'm not overly interested in users complaining about a panic() if they
> ask for an impossible thing.  Better that than the prior behaviour we had.
> 
> Talking of other impossible things, cpuid=no-$foo does nothing for
> FPU/DE/PSE/PGE or MMX which are the features hard wired to 1 already,
> and with 0 users in the tree.

Indeed, and while there is that "Currently accepted:" section in the doc,
I can't help thinking that even for the speculation control aspect that
it explicitly names it has already gone stale. Yes, in the past we said
we'd mean to not support use of arbitrary forms of this option, yet

"Unless otherwise noted, options only have any effect in their negative form,
 to hide the named feature(s).  Ignoring a feature using this mechanism will
 cause Xen not to use the feature, nor offer them as usable to guests."

to me really says otherwise. Even if intended to be thus restricted, it
would then feel rather odd that we implement support for an option with
hundreds of sub-options, out of which only a handful are supposed to be
possibly used.

On concrete example where a presently not explicitly permitted form
could be useful to people is "no-rdseed" on AMD hardware affected by
one of the two known issues (patches sadly still only pending). This
viable mitigation would be unsupported by your implied interpretation.

Jan

