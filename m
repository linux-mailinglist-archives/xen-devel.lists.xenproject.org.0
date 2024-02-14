Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CDC854399
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 08:46:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680213.1058151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ra9xX-0008NB-3l; Wed, 14 Feb 2024 07:45:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680213.1058151; Wed, 14 Feb 2024 07:45:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ra9xX-0008Kh-0e; Wed, 14 Feb 2024 07:45:35 +0000
Received: by outflank-mailman (input) for mailman id 680213;
 Wed, 14 Feb 2024 07:45:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l+oD=JX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ra9xV-0008Kb-P8
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 07:45:33 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06a85fa0-cb0d-11ee-98f5-efadbce2ee36;
 Wed, 14 Feb 2024 08:45:30 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-41166710058so18732375e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Feb 2024 23:45:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 j12-20020a05600c190c00b00410bca333b7sm1081377wmq.27.2024.02.13.23.45.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Feb 2024 23:45:29 -0800 (PST)
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
X-Inumbo-ID: 06a85fa0-cb0d-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707896730; x=1708501530; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=agwqrUROehPCJu5b9QY6Us3Xd1MVOfemUwJf+50z7ek=;
        b=FLI+p2WZaLbDBrXMsjMxyDh1qRpeaTFWZEJsrEtb+FukTEoV7zWDcFuMChnrHoXD2x
         uKe3uwVVByKOUX02/2hUBlcRic4oWvjIUJO5hGCrF+XQX5cP8EN8QUtD2GahNBY6Sixh
         l4GZuKzsYKV8AH09/y/7e2SAJuHujSBuG3luCKZh9CUhX0pJyYT6no+xJthyLDHl3Esf
         NJzGhAjPF8VbBCS/wMbRDRGltFerhWpPwGnyqK/Kx4IJdvUvlIuCiQBy8XVPKpdaGAum
         xc1ztAttEzgYTWWf2PKHKlrl4jgJX94tOeLZA4VTTBmYlkm+HyizrWiqv4W9oZ7XkZV+
         aprA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707896730; x=1708501530;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=agwqrUROehPCJu5b9QY6Us3Xd1MVOfemUwJf+50z7ek=;
        b=LN5nSoX1s5o8kZRram3WAEE4d3ZDUWP0mjozLZB5vBao9jKdnjHVlfUrNlL2oDR4FQ
         xwBKb+iP2hWq+gMWxS+5x2LqwX+37F8Nq87mMgDgCIpVpAyX73rwAMXKlJUV7rdmYPWQ
         9WXCCWGH3QG8cGRywwvxJ8zDCgRFhxnuVJHIFB+eQi0NFUKxttmjVh2WIHAiaPAufieG
         f5RAz16kV1EyXDSQJHVLq+QC3JLoLA1x8pW/qUhvoKsPYUmQ1QucQQ55fjojsSXDVb7m
         xD/NbiDLD02vciJcANpCtG3l9MMk++s3IA03Zxl9J2N0KR++ZeolJSnxACjDVCNzU5PL
         fRhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOIttP17awcVgUXYMaw0/0D1iyxtwKF8DOndA2NI8Eumx38DVHF309AHRhongQcwSqAc18IU5rzB8AjYulTzQcAz8JsjOPMfc9ZGP7pqg=
X-Gm-Message-State: AOJu0YxDuO/EJPlEbKbIF+VLQcd93apVnLqoJpr3rqcYfSWKeTf5n/eR
	WPBcTkFXQxkbIZfPgbQO9+6bH4wKH9PfqniPEztss9qpQw4tPNLBgFvHdfq1ZQ==
X-Google-Smtp-Source: AGHT+IHTGISP9QRCS0Z0n4QXu2RNyVuKZ36/5rMpqnEfNE9NY6ayD47MB5PkFBSvWNhZmZjH9CLVfg==
X-Received: by 2002:a05:600c:511f:b0:40f:d2ff:85b1 with SMTP id o31-20020a05600c511f00b0040fd2ff85b1mr1452328wms.25.1707896729780;
        Tue, 13 Feb 2024 23:45:29 -0800 (PST)
Message-ID: <37ed1abe-afcc-4a76-8a86-623282ca37a3@suse.com>
Date: Wed, 14 Feb 2024 08:45:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [regression] Re: [PATCH v2 2/2] iommu/vt-d: switch to common RMRR
 checker
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
References: <20240207153417.89975-1-roger.pau@citrix.com>
 <20240207153417.89975-3-roger.pau@citrix.com>
 <c27c76ec-36cd-43cb-b76f-e8f95fb27ed8@suse.com>
 <c4f27180-86bf-45fd-8641-bd160c6de229@citrix.com>
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
In-Reply-To: <c4f27180-86bf-45fd-8641-bd160c6de229@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.02.2024 23:37, Andrew Cooper wrote:
> On 12/02/2024 2:38 pm, Jan Beulich wrote:
>> On 07.02.2024 16:34, Roger Pau Monne wrote:
>>> Use the newly introduced generic unity map checker.
>>>
>>> Also drop the message recommending the usage of iommu_inclusive_mapping: the
>>> ranges would end up being mapped anyway even if some of the checks above
>>> failed, regardless of whether iommu_inclusive_mapping is set.  Plus such option
>>> is not supported for PVH, and it's deprecated.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> XenRT says no.
> 
> It's not clear exactly what's going on here, but the latest resync with
> staging (covering only today's pushed changes) suffered 4 failures to
> boot, on a mix of Intel hardware (SNB, SKL, SKX and CLX).
> 
> All 4 triple-fault-like things where following a log message about an RMRR:
> 
> (XEN) RMRR: [0x0e8 ,0x0e8] is not (entirely) in reserved memory
> 
> not being in reserved memory.
> 
> 
> First of all - fix this printk() to print full addresses, not frame
> numbers.  It's obnoxious to cross reference with the E820.

Perhaps better indeed. The stray blank before the comma also wants dropping.
And while looking over the patch again, "mfn_t addr;" also isn't very
helpful - the variable would better be named mfn.

> In the example above, 0xe8000 is regular RAM in:
> 
> (XEN)  [0000000000000000, 000000000009d3ff] (usable)

Well, no, E8000 is outside of that range, and I'm inclined to guess it's
the SNB where you saw that. Iirc my SNB has such an RMRR range, too. (Or
was it the Westmere?)

> In another example,
> 
> (XEN) RMRR: [0x4d800 ,0x4ffff] is not (entirely) in reserved memory
> 
> is a hole between:
> 
> (XEN)  [000000004d3ff000, 000000004d3fffff] (usable)
> (XEN)  [00000000e0000000, 00000000efffffff] (reserved)
> 
> We should also explicitly render holes when printing the E820, because
> that's also unnecessarily hard to spot.

I disagree here - both "ends" of a hole are easily visible from the
neighboring ranges.

> It's very likely something in this series, but the link to Intel might
> just be chance of which hardware got selected, and I've got no clue why
> there's a reset with no further logging out of Xen...

I second this - even after looking closely at the patches again, I can't
make a connection between them and the observed behavior. Didn't yet look
at what, if anything, osstest may have to say. Do I understand correctly
that the cited log messages are the last sign of life prior to the
systems rebooting?

Jan

