Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF681B09AF8
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 07:39:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047948.1418264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucdnu-0005YR-UQ; Fri, 18 Jul 2025 05:38:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047948.1418264; Fri, 18 Jul 2025 05:38:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucdnu-0005WE-Rm; Fri, 18 Jul 2025 05:38:42 +0000
Received: by outflank-mailman (input) for mailman id 1047948;
 Fri, 18 Jul 2025 05:38:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RNMk=Z7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ucdnt-0005W8-7G
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 05:38:41 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74b9123e-6399-11f0-b894-0df219b8e170;
 Fri, 18 Jul 2025 07:38:39 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a548a73ff2so1578040f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 22:38:39 -0700 (PDT)
Received: from ?IPV6:2003:ca:b711:f268:e016:4ee6:ecac:2480?
 (p200300cab711f268e0164ee6ecac2480.dip0.t-ipconnect.de.
 [2003:ca:b711:f268:e016:4ee6:ecac:2480])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e8ab891sm69006005e9.35.2025.07.17.22.38.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 22:38:37 -0700 (PDT)
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
X-Inumbo-ID: 74b9123e-6399-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752817118; x=1753421918; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=n/joI6KNkX72QtN8q6VrlobHhT0akj6P185oKTJ9lik=;
        b=USFouO5pfEmQV2QQLh1EkGM/oTnlciSXa7vmB8cuKuM2IcQKIEg2i7LUDzEpcv9f1d
         6jAb0S1dlWdnTR3XZJgyCW65OZFRqSyzAEZWF7RW7/VLCieJAIsvLncRdISE6lDjVWt/
         dDdIl2zQi7CtRj9/+kjvuTuDcoZYizMCRnnZ98uv9/M5RaNZoTmXxZCULNzglIcNMG9d
         JpUtRkXa9qtRdw3Bccz+4Pgl7hHnfCBKk2cBUcibNAxNtTeiOKKkNtlG2VQI8CooE3PB
         pMGd1XWG/B6jIi4SyD+gYzfEVbXgkRtyMPfUNViaJq+zPdorCHB3wupBWjugvKE8foWf
         xBFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752817118; x=1753421918;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n/joI6KNkX72QtN8q6VrlobHhT0akj6P185oKTJ9lik=;
        b=rI/ZCvlsFmdBp4GDyh7Wc0bekrzyDCrxU/jWcrcjrOUCh2buDZGbFpWogTe/ty5YFn
         pmVRQgG496WTNJSxN1+hS8IiV/2aSZLwO6q1S2kjcnUxpEG7Hhfy4jyWRWf5xy2L9C4E
         kPCfIbMDpwhWrUA1/z8SuL3t9QeXBRzw8YWrNkoRZlsmddMuk/IKzAyF+B4TH1jFBKig
         ddxkUPxburSZ2KrNMuduPKqKpQ5LrkuYwpvqIWmhzTa8agssK35rkxIIWhi8bF0Re8Ne
         MNWOl9cqQVDHkDW843Dq1jRrlHD1ybyy2GOdz/T5fH9u2yth3m7FZApQpuHabe7Nn2es
         hXkg==
X-Forwarded-Encrypted: i=1; AJvYcCWr5Sybxjwq/AQyg6yC9Jk7dSPAaQgz3xOHTNuSBLAyK/H7Rh8pPlLjpNMHTaDXYyslFoJE2bTjlCY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyQooujgJL7i+mTtqCqbx8JoyNPREk34lr/yC39eZVBcfT6nSft
	btGeM/e/9/R6Os3gCzmGZfeKs2QKi5bT3phUsozC/I+kLWyh9/N0w6O/HN/xMUwLUA==
X-Gm-Gg: ASbGncsmQVIe3u+f3+jebLfO74gVafCotUg4xMeckuuNvUDFOcFXTJMBJQSGm7HlnW4
	MCoSPRhiNZ0U3hp2goIm0wyY1Eh5K13nsYCcGZK5A/x5H0nl31IQ6mO++CKwTShcc/3bqO3g6wI
	atxLNZb/Tk9XzkfF6mx2O3q0wjuCPPM6itTFkq/C+ZWFk7g0rjWVIybqVHyS4Mx/PGyzzK8j2E/
	xSS+O7PQTlaWMM+gIwvsZMPLg3lFZGcVphTFGH7yi+/oxoHow/xzAMZShhJL83yV9CojkFnMapB
	aOtsNKeM+cbo6uUt2JiE+P1Tl1Hpsxr0yjijRfxWj9U0i+jZbb4A3sYpprRR2ksqPIe0WWOpkxq
	UZt3ATbAlNZv6dLWO8x3bRR2k/J8ihP8deXjwtmyB2ADzHDGKWMBHIsipz4xDLofkYiYW6YmdLD
	1Odb1dzrvSbGGEkoHIbfFfYJx3c0xRnL7mp9O2dTXffsFJ32LoJWj9u62o
X-Google-Smtp-Source: AGHT+IEbd8MZ99aPGyMCNLpdl3RaJb/S36MbjQjqNt27iTTRxwFlUPB9jS6gsLRH8DpIP3Yr8BDgAg==
X-Received: by 2002:a05:6000:43d8:b0:3b3:9c56:49bf with SMTP id ffacd0b85a97d-3b60dd888b7mr5368226f8f.56.1752817118321;
        Thu, 17 Jul 2025 22:38:38 -0700 (PDT)
Message-ID: <15c8e4cf-54cc-48ae-bef3-a22f9eb3c9f3@suse.com>
Date: Fri, 18 Jul 2025 07:38:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] x86/match-cpu: Introduce X86_MATCH_VFM() and convert
 intel_idle_ids[]
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250716173132.2213891-1-andrew.cooper3@citrix.com>
 <20250716173132.2213891-4-andrew.cooper3@citrix.com>
 <f6243e9e-78ae-47c3-8697-e4761f0b394b@suse.com>
 <76026005-efc3-4dab-9195-4fd2da5be1c8@citrix.com>
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
In-Reply-To: <76026005-efc3-4dab-9195-4fd2da5be1c8@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.07.2025 19:39, Andrew Cooper wrote:
> On 17/07/2025 8:35 am, Jan Beulich wrote:
>> On 16.07.2025 19:31, Andrew Cooper wrote:
>>> mwait-idle's ICPU() is the most convenient place to get started.  Introduce
>>> X86_MATCH_CPU() and X86_MATCH_VFM() following their Linux counterparts.
>>>
>>> This involves match-cpu.h including more headers, which in turn allows us to
>>> drop a few.
>> intel-cpu.h doesn't really need to move, does it? Conceivably there can be users
>> of match-cpu.h which don't need the Intel constants. Hence no point in forcing
>> them to see those.
> 
> There's no point not to.  All users of x86_cpu_id want the Intel names. 
> I've already restricted it to only 5 TUs.
> 
> Even if we do get some AMD names (and I'm not entirely sure how that
> would end up looking), it's just a few defines.

It's just a (slowly growing set of a) few, yes. Still goes against our
desire the limit #include dependencies.

>>> No functional change.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Jan Beulich <JBeulich@suse.com>
>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>>
>>> We now have X86_FEATURE_ANY and X86_FEATURE_ALWAYS as aliases of LM.  Given
>>> the contexts they're used in, I've left the naming as-is.
>> What's wrong with sticking to ALWAYS, which we already have?
> 
> For alternatives, something like:
> 
>     alternative("", "foo", X86_FEATURE_ALWAYS);
> 
> is correct in context.  However:
> 
>     X86_MATCH_?(..., X86_FEATURE_ALWAYS, ...);
> 
> is borderline grammatically wrong, and ANY is a better name to use.

Well, I don't necessarily agree, but then the extra name also isn't
a severe problem. It was actually you who called out the redundancy.
In any event:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

