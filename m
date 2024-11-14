Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D0B9C8F7C
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 17:16:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836622.1252534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBcVU-0007DB-N4; Thu, 14 Nov 2024 16:15:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836622.1252534; Thu, 14 Nov 2024 16:15:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBcVU-0007B2-KT; Thu, 14 Nov 2024 16:15:44 +0000
Received: by outflank-mailman (input) for mailman id 836622;
 Thu, 14 Nov 2024 16:15:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81on=SJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tBcVT-0007Aw-0Y
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 16:15:43 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afc81213-a2a3-11ef-99a3-01e77a169b0f;
 Thu, 14 Nov 2024 17:15:38 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-431ac30d379so7336815e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2024 08:15:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432dab807d4sm25107555e9.21.2024.11.14.08.15.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2024 08:15:20 -0800 (PST)
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
X-Inumbo-ID: afc81213-a2a3-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzUiLCJoZWxvIjoibWFpbC13bTEteDMzNS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImFmYzgxMjEzLWEyYTMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjAwOTM4LjY1MDA4NCwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731600938; x=1732205738; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wmyF5U87SHwLdOOyi3+53FThNvK1KH77EV+z6r5it2A=;
        b=Pb5AC5UMSYiTw8iK3owrifP2azA50yfDMkzWGHQfMlYQQjlt/CVY8Q2v3Hy0jMILmp
         iC2YYBX0Ab0hO3kU/Xs2YVaLwgyiiRdkN9UfG9YbVtbXhdNu0AqzeKWzwOJ8xiNwL1oO
         mfUmgC+6hMTetOMRYQQQBmMmK9KIsS4FPRAWMX6xegxaq9S1fYMRJJFyEak2JRAHCK7q
         MjX65veHpMd7JBJq2dwS+6Gg/98TRpAKZ4XB4UcfA9bCn6pla10G8iaIQmBYfKGZvLB6
         vFnl6Q6aEfbnNUyYRQdwrGcEVM9kKIHlfhoNWTVZtryXnjj9KjfVY3FgVU47sBBYylM+
         TtgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731600938; x=1732205738;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wmyF5U87SHwLdOOyi3+53FThNvK1KH77EV+z6r5it2A=;
        b=jbcd8jFCxKN1p2Acsp01005Uqo4orK1AnR7rQl6WV94fUWa5AgdAp2LNbj+GMLB0df
         Tnb4i2K3NSHuh8hgJ3+hXAYPnWHkzDVnDqCCf+qLsmXZTpEPEWwtrTYlsBEYkegt3Kmv
         TYk4uHQGQgjnpyosTOThtisPK/wrn9OzFUeVIY2CrOqbP3M0jOIh4D9WowMTH5AxmU4X
         haIEeKPH/l/jCIGIqegKZlZzt0eBrijW1fOC7qaoTlEMDJGxjL6uIgyAIaytxf5JNkBk
         mFIZYVNplwpvzGG4u26KmSBfe46R4j2wn0GO1HvxCCa1187pePqxutWCdx1F+Uw7woYN
         gRWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJ9gRFj/cP0wnGRKnVAYnubpgGtfySfhN/IRu5laNnSgNM9uMO1LeSzQvLh037vt9wJjA4nRm1lfM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzodImuGScB1+4P+C9atRLMymqSD4mowDj9s4jejEvdBJUKlRxs
	e/YgDDlDIEfn9C4qjynA5tQLdGcrLrYHdzlp3G9ZkvhqX2743XC2UVOinxAz3A==
X-Google-Smtp-Source: AGHT+IE18pzf0cvC8Qnh3NvD8/SSwEVF8MZsC7sNcgSh/Kd8VkgW2U3wPYwdFpusPXtbwpVzo0xQSg==
X-Received: by 2002:a05:600c:a4c:b0:431:5df7:b310 with SMTP id 5b1f17b1804b1-432b74ff9b1mr218663445e9.8.1731600920711;
        Thu, 14 Nov 2024 08:15:20 -0800 (PST)
Message-ID: <1faff790-3909-4de4-9283-af001238c7d5@suse.com>
Date: Thu, 14 Nov 2024 17:15:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] x86/ucode: Remove the collect_cpu_info() call from
 parse_blob()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241112211915.1473121-1-andrew.cooper3@citrix.com>
 <20241112211915.1473121-2-andrew.cooper3@citrix.com>
 <f0072d5d-8626-4708-91a8-503a33e99ec5@suse.com>
 <c9a24b52-6498-41e9-aa20-a3cc5c2b1027@citrix.com>
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
In-Reply-To: <c9a24b52-6498-41e9-aa20-a3cc5c2b1027@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.11.2024 16:59, Andrew Cooper wrote:
> On 14/11/2024 11:11 am, Jan Beulich wrote:
>> On 12.11.2024 22:19, Andrew Cooper wrote:
>>> With the tangle of logic starting to come under control, it is now plain to
>>> see that parse_blob()'s side effect of re-gathering the signature/revision is
>>> pointless.
>>>
>>> The cpu_request_microcode() hooks need the signature only.  The BSP gathers
>>> this in early_microcode_init(), the APs and S3 in microcode_update_cpu().
>> That's microcode_update_one() after 502478bc1d9d if I'm not mistaken.
> 
> I wouldn't necessarily say "after".

My point was merely that there's no microcode_update_cpu() anymore, as of
that commit.

> microcode_update_cpu() has been the way the APs and S3 get this
> information for ages, whether its in the function directly, or in an
> immediate callee.
> 
>>  In the
>> course of determining that I'm afraid I also found the first sentence of this
>> paragraph rather misleading than helpful:
> 
> Do you mean "The cpu_request_microcode() hooks need the signature only" ?

Yes.

>> While it is true what is being said,
>> in both cases it is collect_cpu_info() that is being invoked, retrieving both
>> signature and revision. IOW logic needing the signature only doesn't really
>> matter here (and the sentence made me hunt for cases where we would read just
>> the signature, aiming at verifying that leaving the revision field unset
>> would indeed not be a problem).
> 
> It probably doesn't come as a surprise that I'm intending to rework
> collect_cpu_info() entirely.  It's a mess.
> 
> The signature and platform flags are invariants for a CPU.  (In fact,
> Platform Flags had better be the same for an entire system).  The
> revision does change with type, but apply_microcode() keeps it up to date.
> 
> Yet we had logic which was throwing the details away and re-gathering
> (which is quite expensive) for basically every microcode operation.
> 
> 
> What I'm trying to express is "this information is collected once at the
> start of day, and kept up to date, so collect_cpu_info() should not be
> called under any other circumstance".
> 
> Perhaps I should just say that directly?

That may be a good thing, yes. The main point still being though that the
way that 1st sentence in the paragraph was written, it ended up confusing.

Jan

