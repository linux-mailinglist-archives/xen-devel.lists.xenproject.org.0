Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADFA83BAF2
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 08:49:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671344.1044633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSuUC-0007bY-9F; Thu, 25 Jan 2024 07:49:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671344.1044633; Thu, 25 Jan 2024 07:49:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSuUC-0007ZJ-6i; Thu, 25 Jan 2024 07:49:20 +0000
Received: by outflank-mailman (input) for mailman id 671344;
 Thu, 25 Jan 2024 07:49:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vt1H=JD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSuUA-0007ZD-I4
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 07:49:18 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3de736b5-bb56-11ee-98f5-6d05b1d4d9a1;
 Thu, 25 Jan 2024 08:49:17 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2cf1288097aso29030631fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 23:49:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 he1-20020a0566386d0100b0046f2873f6c9sm72013jab.79.2024.01.24.23.49.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jan 2024 23:49:16 -0800 (PST)
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
X-Inumbo-ID: 3de736b5-bb56-11ee-98f5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706168957; x=1706773757; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eiEwNBI+YcpU2tqYvaVI5Vi3emYhfk5Pf1daxAbIN2E=;
        b=NZXtAmUlU8ZlFbXmp1E+etppom/yk6w/lz+YUgdSTVgkXx16suRahiC/o61f06WJVE
         PqWFBrN7gELu9k5Rygq6DInn8CzAbCjDUd9Rk6h/t8E7+C6mzv9KsFayK1bPsX+6YX/+
         k8Jhpk1yuhbrsZydgE+0UIF7ujlw89VGskW9eGxosN32MKrKV1tFfqVodr/R3DY9h125
         eq2Wrs6JN+mSzju4ZI/dZAkKA7RN4gHxTBMBT5qdNfaSSC8aCUPHdTADARTdWLs+51TQ
         M8Qv52HNdqO+YmVnw1r4QTbdc4F3xdrlKo1pae2JL2Y67Nz11BDkJzRuV1tXOeyHn/tA
         UGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706168957; x=1706773757;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eiEwNBI+YcpU2tqYvaVI5Vi3emYhfk5Pf1daxAbIN2E=;
        b=ISXdvoHbj4B1so9EeB8lAhesavPt4m13q5unQNobK/RdMU1JsiVzPlMtZ/wLGrUKoi
         oYnQ/13jlTC5NRbP4uDIoxG7GSEkWV5eEMI0gaYe1jS3Ii7s1ggivALLY7ReLZQNs5AK
         x5CPCYAwdNG8vU/VIjTqWAEZYihJrpR3LPtkmYT43uT8R7HLTrsqwPnH4VAKbttfj8v+
         zS0ANQ/foRf3Ly8LJCArxJPqj/DWAL/ZGmkrUeeVsw0ZVw9uP+jnPQYB/NOA7Au5NNuU
         Jr7Fgpwlp5TDRnYeURPLzrf/MnWXV0aHAoScC2NH2qZGGOcmdSpF0RcWJWkZcl6zhRQG
         0u0w==
X-Gm-Message-State: AOJu0YyLxgpDNBcVlF3seZw/5Mo7bYhfIrXnXi55UL82bPAYlNbJHflh
	UoKvZXS/okdQZksjSPruDKDjPNmP/alT12fZ7wMy4zb9JhxfVExX+y0bsowj2w==
X-Google-Smtp-Source: AGHT+IF1IdCvR9dfDFMFZFjO+rW5IIRTpawFafXhLxbAfPWyQxXqn/UjXtDALrRgvsb0PcGTuj/hWg==
X-Received: by 2002:a2e:9b94:0:b0:2cd:4d27:2086 with SMTP id z20-20020a2e9b94000000b002cd4d272086mr313826lji.100.1706168957098;
        Wed, 24 Jan 2024 23:49:17 -0800 (PST)
Message-ID: <0be02b31-a50b-4ed3-9bb8-90cc61f0f20d@suse.com>
Date: Thu, 25 Jan 2024 08:49:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/ucode: Fix stability of the Raw CPU Policy rescan
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20240123205948.1782556-1-andrew.cooper3@citrix.com>
 <090f64ae-ecf3-4edc-a6c6-8be3a09ea1ba@suse.com>
 <95a1f94e-7c82-4996-8f24-87c6628bc81a@citrix.com>
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
In-Reply-To: <95a1f94e-7c82-4996-8f24-87c6628bc81a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.01.2024 18:23, Andrew Cooper wrote:
> On 24/01/2024 3:37 pm, Jan Beulich wrote:
>> On 23.01.2024 21:59, Andrew Cooper wrote:
>>> Always run microcode_update_helper() on the BSP, so the the updated Raw CPU
>>> policy doesn't get non-BSP topology details included.
>> Wouldn't it be better (and consistent with ...
>>
>>> Have calculate_raw_cpu_policy() clear the instantanious XSTATE sizes.  The
>>> value XCR0 | MSR_XSS had when we scanned the policy isn't terribly interesting
>>> to report.
>> ... this) to purge these details from the raw policy as well then?
> 
> I did spend some time considering this.
> 
> Rerunning on the same CPU is more resilient to new topology leaves, so
> we'd want to be doing that irrespective.

I'm afraid I don't understand this: If a ucode update surfaced new leaves,
they surely would appear on all CPUs? IOW my question still stands: Wouldn't
we better zap topology data from the raw policy (thus also not propagating
it into other policies)? At which point retrieval becomes independent of
what CPU it is run on (if there were any other CPU-specific pieces of data,
similar zapping should happen for them).

Surely using CPU0 here isn't much of a problem, as this is a pretty
infrequent event. But generally I'd like to avoid "preferring" CPU0 as much
as possible. Hence I'd prefer if even in cases like this one we could avoid
it.

> The XCR0/XSS state really is transient, and the useful information is
> everywhere else in leaf 0xd.

Sure, but this is still independent on what CPU the retrieval is run on.

Jan

