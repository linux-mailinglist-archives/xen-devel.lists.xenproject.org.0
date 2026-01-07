Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7BECFC525
	for <lists+xen-devel@lfdr.de>; Wed, 07 Jan 2026 08:23:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196516.1514313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdNsT-0000RZ-KI; Wed, 07 Jan 2026 07:22:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196516.1514313; Wed, 07 Jan 2026 07:22:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdNsT-0000P0-He; Wed, 07 Jan 2026 07:22:45 +0000
Received: by outflank-mailman (input) for mailman id 1196516;
 Wed, 07 Jan 2026 07:22:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AUe7=7M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vdNsS-0000Ou-IG
 for xen-devel@lists.xenproject.org; Wed, 07 Jan 2026 07:22:44 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6e393c9-eb99-11f0-9ccf-f158ae23cfc8;
 Wed, 07 Jan 2026 08:22:41 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-47775fb6c56so14829935e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jan 2026 23:22:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f668e03sm84261615e9.14.2026.01.06.23.22.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 23:22:40 -0800 (PST)
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
X-Inumbo-ID: a6e393c9-eb99-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767770561; x=1768375361; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=w08qEzxsXeIfY5MglmTbkHuO1YUY66tXMm2UAY5+WNo=;
        b=K1Yx9HnqDyIvCapQh15UF280shxXQraVzgxm/8NhokmxP9Zcudm5gZL6ySzAwl84E2
         4IzW1ZyYmJjOtWEvOynZkfyBCVeYytEVTVDfmr4A/zCZXEMyPcEZaqErkqMCoHdt2S5/
         1tkWJHZw3xux3pKmZSQ9EvfcGfeMMmWL9q7T/5UUckS9kzB+pXUC2T+sjokjOcHff1Oz
         bvz/G++C6vZ1U1/cHKPJEAKTVUpkT/AKWRmJcGVhXeE6IxB2PC9F54zFIjS6tpmMHQuo
         IPHg6wBmXyqGBB+G86sSkyreP9TSw8jGurSMvQvoTJSyYjdA8wV4QHae8Ccv1jpdvhEU
         qdhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767770561; x=1768375361;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w08qEzxsXeIfY5MglmTbkHuO1YUY66tXMm2UAY5+WNo=;
        b=a0sKcdK0W+eTBHK/tsUKfbbGDuEgBkILkz1DBH31RBc/vBUA86Kb9WVdzrqBOvG4cU
         ZmAL5oe8j47OUac+aUoK0xWpv6fnyFDcL0mzFJGsklH4zNWP5kdr/86B0VdHDlY8yPhS
         fRZ4ADhL05WeJYRay7zhi5YH8G2yoq9nth2Y30wA87Eeg4Uky4ieZMtSzYaJVTmdQYUO
         tzPnAt197G4LpX6JUNqKCugyE29by+bQ8V0I6KWJERYQYVZ6+P7lgT7map+axclFk4ou
         TssaLn6Jzqrr1NgbO5BItcdM5tE/QmEYgiXOiGq891gFCy88ZzXZZjx6nDFTYFNyA/3O
         yDtw==
X-Forwarded-Encrypted: i=1; AJvYcCULHRFRIfGo+tDEE8m4j1V7N+18sLstAW92+61lA0QzI8iofGAOCIAveAboW+DToQ+YRD8n8mCxFI0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YziQgkmEeoOxLT3TYlfJ5di+el0YfQl35YZL9TtG7xsJBYRJ2l1
	oV/9/FqCFQvtcT0JaSWzxdFaPf4MWOXnAHQMfgytpAgnexKOuQBvKTxCnVOHMJv40w==
X-Gm-Gg: AY/fxX6XAZZP8VPLng383hD9mOJZjrsaiK0yeVMSytCbuMY4RIXbNrq0JBOgnKLpUqY
	RnCqxh/LUqKjvud8LFpRjH+Cq08f8zuqgn2/UylUSAYzsKUDexJgWMr4N5tcFhINlgGq/64KUhh
	8jh35am5JcRjuyyQDpAefmAiXUZin/egbpz7zTXXGftnqPLZkLzUixlAOIq1gKyg+r/ZdtH/elG
	gulgE+qjdF8nABeXWmFPhHqqkSEJIV6AOMjrP2tgn6qkbhUILNXbJHIQTTQq7wMZjO/l39s7y1y
	QzipLE7+W0775mjm01SagD1eGazM2LqUDWXekAxbKQ9NqgSZwK0cti3KIbALv+mX8Ja6FBgsomW
	vOQ8dH78b1OZS2CmilIFNgmF5lJ3qtPWZwFQ9uHqb2ASxHW5v0ONH2WrvqxPQDDyTswlexLl5wF
	XQDtyFg6wjorZTTWATHGdhpVsymRbwA52NHwkK4gkzS/d+x00TJDiMu5uMMYQfMobEWqqJtDaEI
	hk=
X-Google-Smtp-Source: AGHT+IH7gEioYd9qII0cUkDG7O8KvpP9xIJ8Cc7v2Nnrn8FDhntJUIb6c1XICzM2+VOf7NRFSjwzVw==
X-Received: by 2002:a05:600c:4ed4:b0:477:9986:5e6b with SMTP id 5b1f17b1804b1-47d84b41b53mr13884935e9.28.1767770560672;
        Tue, 06 Jan 2026 23:22:40 -0800 (PST)
Message-ID: <0ebbc19a-724c-4e2f-89ce-58325342c4b5@suse.com>
Date: Wed, 7 Jan 2026 08:22:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21 v2] x86/AMD: avoid REP MOVSB for Zen3/4
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Andrew Cooper <andrew.cooper@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <8ecbf8b7-91fe-4f9e-9542-7ec22b6a47bb@suse.com>
 <693449f18cc4480ea2cb2161a9361354@DM4PR03MB7015.namprd03.prod.outlook.com>
 <98855b1c-2cda-467e-8b88-ff24e7862b61@citrix.com>
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
In-Reply-To: <98855b1c-2cda-467e-8b88-ff24e7862b61@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.01.2026 22:07, Andrew Cooper wrote:
> On 13/10/2025 2:06 pm, Jan Beulich wrote:
>> Along with Zen2 (which doesn't expose ERMS), both families reportedly
>> suffer from sub-optimal aliasing detection when deciding whether REP MOVSB
>> can actually be carried out the accelerated way. Therefore we want to
>> avoid its use in the common case of memcpy(); copy_page_hot() is fine, as
>> its two pointers are always going to be having the same low 5 bits.
> 
> I think this could be a bit clearer.  How about this:
> 
> ---8<---
> Zen2 (which doesn't expose ERMS) through Zen4 have sub-optimal aliasing
> detection for REP MOVS, and fall back to a unit-at-a-time loop when the
> two pointers have differing bottom 5 bits.  While both forms are
> affected, this makes REP MOVSB 8 times slower than REP MOVSQ.
> 
> memcpy() has a high likelihood of encountering this slowpath, so avoid
> using REP MOVSB.  This undoes the ERMS optimisation added in commit
> d6397bd0e11c which turns out to be an anti-optimisation on these
> microarchitectures.
> 
> However, retain the use of ERMS-based REP MOVSB in other cases such as
> copy_page_hot() where there parameter alignment is known to avoid the
> slowpath.
> ---8<---
> 
> ?

Fine with me; changed. Do I take this as an okay-to-commit?

Jan

