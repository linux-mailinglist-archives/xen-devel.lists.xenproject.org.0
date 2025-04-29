Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AA2AA0AE7
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 13:56:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972192.1360634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9jZd-00045X-Tq; Tue, 29 Apr 2025 11:56:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972192.1360634; Tue, 29 Apr 2025 11:56:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9jZd-00042u-Pw; Tue, 29 Apr 2025 11:56:29 +0000
Received: by outflank-mailman (input) for mailman id 972192;
 Tue, 29 Apr 2025 11:56:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qXnC=XP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u9jZb-00042o-W9
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 11:56:28 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa53e4aa-24f0-11f0-9ffb-bf95429c2676;
 Tue, 29 Apr 2025 13:56:26 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5e8be1c6ff8so9940489a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Apr 2025 04:56:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acec4a84247sm138404366b.55.2025.04.29.04.56.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 04:56:25 -0700 (PDT)
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
X-Inumbo-ID: fa53e4aa-24f0-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745927785; x=1746532585; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Al7jbHKfCWHbWetquYQqKZ92sBbetNU/z8lJJK9x6yc=;
        b=HqAK3cjk8tMov16lRKmtxVrRaul1hTHrc2yh5YFjJQFIYwVh94B/TrUdLEcdOVUPKw
         46p76cqyqLMX14azexa2eg0uZll3M9vV46Z67WetMwTXG+xyIfwLoi0qmIdSJ/C+OyC8
         Fmf9IgUOHjx35wk/YPDNMssLzEp6r4TlH+LZ0JIfw5d4zrNBJsncxF13fbrKm1nZ4Lq4
         jRF8oaN1C2chNd0IAI5XOGlCKE4aj3hySZRsa3VEsVC1gyHh6DzNSnE5b2vffNGl6+2K
         oGYPDiQ1SJq9fGzAG8cmN6E9DjmHLNkUwSvOGxgJc/b2YO6/+4JT4fcFaTwu9IphvAsH
         swng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745927785; x=1746532585;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Al7jbHKfCWHbWetquYQqKZ92sBbetNU/z8lJJK9x6yc=;
        b=Pfs5sMgbHfwhFOH9HvVR5xT18ULt4iLJHGAEH/fxZU4Et86eV2fwdsJCrQWtFR2kJd
         VDyB1XXaHmA8nQxczZhkQwMoc1ArUe1GCwwUPQ/bJvR5R2RpbQRc6FsAFybZYxlOvYcZ
         SLKvhikY1puiopIlvO65ysw6fc6H+tVMpavZxpWu2LEuIGZpUPB555+25mC3lzQjKphj
         Bm8iDgRd5zFOnvcJlbPwDiscpXmdI2jxFhGKjUW/CZO6mEICsA8V/sE6A/7wULF84WsX
         8CsojNiCg6i3zsu6WBOKcvm61FbledRJY5hlsZrIrBOHYaY8QB6ZOsFtY8AS0tlWe4pe
         akcg==
X-Forwarded-Encrypted: i=1; AJvYcCVag7rn95+ePS0PGRz+aWAkH9Ht+O8p6AghD8VXJjHnDNWSFElql2gwJaVTHfcLJjLz4kGS9eSP3ME=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwXUFl/3RdZGryYyh/2qOyP5qeyrOdtlbr+fqJzr3Ruwn3UUYyA
	AROv9+rE5a0j9LKZYNMwSzqA6Yn8Keuy0AmoFHICorYvVKX3ww5n21NalGAZMQ==
X-Gm-Gg: ASbGncsOtuxDD0vY9hN8w0cPKrRhpEXJmhtFu3p4rVBec9S7fae7Nhbv77nWledztge
	J5At+pQg1lfcaXZkNhf+39IGFMeZjyvpxJd7SP6Bmgqrea6tKJSHs2dXWv25D8v/3baHwjFrbbt
	x96/xNRZyewGEe1TkXTd4h+vOgqZeAy5CqPpmqgTqKOIVO7Fll9cvmNqqVgHCiAPWNHp4pwyhLE
	OGXe4xAliXlelnWUhpAVKAXM+C2ZW69aPojPSMCc7F75Ay39LHtVqQLUsN05KVD+dr0prEBEqFU
	thb7DARu1HS0B5exrA6IHAzuQjCCeObrWG6VLg4NKbGc8/r88hIRDeXZJH3S00mbzKs42oI5+hM
	kHOfa7a6N66u8SQK4V5Peq5jL3tLMa8uLqXy9
X-Google-Smtp-Source: AGHT+IGDE09spnIoGG3w926hJkRZ1a2/uHHB9nOp8v3DeXBhVrH6EKc0960kA6vpcsMPsXIkBZNmEw==
X-Received: by 2002:a17:907:970c:b0:ace:3952:c375 with SMTP id a640c23a62f3a-acec4f35d10mr313281366b.42.1745927785451;
        Tue, 29 Apr 2025 04:56:25 -0700 (PDT)
Message-ID: <df18f775-79ff-4509-a10a-cb742762d8b3@suse.com>
Date: Tue, 29 Apr 2025 13:56:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/hyperv: use dynamically allocated page for
 hypercalls
To: Alejandro Vallejo <agarciav@amd.com>,
 Ariadne Conill <ariadne@ariadne.space>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Alexander M . Merritt" <alexander@edera.dev>, xen-devel@lists.xenproject.org
References: <20250428195736.2516-1-ariadne@ariadne.space>
 <77c9529e-8353-479f-994f-d6d668788374@suse.com>
 <D9J2AOMDX4QZ.2ZN0F028I3QIT@amd.com>
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
In-Reply-To: <D9J2AOMDX4QZ.2ZN0F028I3QIT@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.04.2025 12:48, Alejandro Vallejo wrote:
> On Tue Apr 29, 2025 at 9:28 AM BST, Jan Beulich wrote:
>> On 28.04.2025 21:57, Ariadne Conill wrote:
>>> Previously Xen placed the hypercall page at the highest possible MFN,
>>> but this caused problems on systems where there is more than 36 bits
>>> of physical address space.
>>
>> Hmm, I should have asked already on the earlier version: What kinds of
>> problems are these, beyond ...
>>
>>> In general, it also seems unreliable to assume that the highest possible
>>> MFN is not already reserved for some other purpose.
>>
>> ... this particular aspect? I find it puzzling that such problems would
>> depend on the number of physical address bits.
> 
> Pagefault on access (due to reserved bits being set) on access to the
> hypercall page. The available guest-physical address space doesn't seem
> to be as wide as advertised, though I didn't carry enough tests to
> single this as the only explanation. Seeing how we don't really know
> what's already on the last mfn this seems like a strict improvement
> irrespective of the actual cause of the fault.

No question there, yet the first paragraph is a little too vague for my
taste. It'll also not help people later finding this commit and wondering
what the issue was.

Jan

