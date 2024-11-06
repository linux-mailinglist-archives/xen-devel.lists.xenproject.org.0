Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F74E9BE596
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 12:32:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830749.1245818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8eGZ-0003zC-RE; Wed, 06 Nov 2024 11:32:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830749.1245818; Wed, 06 Nov 2024 11:32:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8eGZ-0003x2-O0; Wed, 06 Nov 2024 11:32:03 +0000
Received: by outflank-mailman (input) for mailman id 830749;
 Wed, 06 Nov 2024 11:32:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZUQe=SB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t8eGY-0003ww-Qt
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 11:32:02 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bced1013-9c32-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 12:32:00 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-37d47b38336so4987971f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 03:32:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c113e69fsm18874058f8f.69.2024.11.06.03.31.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Nov 2024 03:31:59 -0800 (PST)
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
X-Inumbo-ID: bced1013-9c32-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MmIiLCJoZWxvIjoibWFpbC13cjEteDQyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImJjZWQxMDEzLTljMzItMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODkyNzIwLjU1NjYxMywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730892720; x=1731497520; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8HZ5iGSiMy1yvt8HIMxpQHnNm+Cmu7IHALBG2+41EP8=;
        b=aYnRnaMpH2W8Sr8g6/e/zFQ+wMCY4yv+e0//KVR7Jb9Ebs/9zdsYSDfEn5gi+PLar9
         WG9kAAuwtxdAaJ8JZGj7/8fTl+rAhOjrgGa25iaF6SLbdNi7NukS0lF6nlRGfTYmsuZ1
         RUk2HLkTbwfBjUbUM/nxKqFp521cN27mt2MbPyE6hON2C3pssHinuDrYrR61JVXCq3dy
         8GfiGJdFFcc3XlgpHh8f8gnogUjwcjzYGVAzJmv+pzAh8IBrVicUJJybY2lEue3Pgf/z
         lVl3NAqZV2XyzVwgXWCPFdWbxXb5hEFYZQgsOXyiK3Azku5+3+rQIb1uG85pSZRsBIKA
         PsBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730892720; x=1731497520;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8HZ5iGSiMy1yvt8HIMxpQHnNm+Cmu7IHALBG2+41EP8=;
        b=HXSPuM14HGVMRiGuHRMaiUHACDBeGCJrTaxPjkK8XiOZN0+i2bHgAYQRBUffgrDY2S
         q4zQ74RnGE+CFnLfhf3UD7HfWsgqiwpm5Xd5l+crIKoIhauVXSt5PNrnoDrUzG2Ip8yM
         XZnGiyyTbZhxLhvRZSU4XOFz8123j1QhKvDgSyvLVxpKO0PZdxqe5OTyJHt45Af+yE2g
         FOq3yT1dES/VhPFiiOTC2q8J2eKrAxJWxERxwL/EOyPjhm/f6+Hd9pPBQe2NIdnuifov
         pO+RseknG3sLnmSZxzp8x8RfWOrYeQzdMH82z3A6/ovtFbrIq2URnAvgACxKg3cZJiHw
         uFFg==
X-Gm-Message-State: AOJu0YyknWf13v/z4o56EfWiBZVHFa82vI06PU+omRxrITmgwUw7ATFk
	DDDWjPxO/Ec3NJdsNGpKuysBTXjoSfDKmw0VQi4Z5ToH/Pft0aBBAxmOLDqEG81NaGd0eVPKusc
	=
X-Google-Smtp-Source: AGHT+IHi1DwSVLWfYvbudA5Hr2/orG5aub90+1/QEOaPF6sXGnEQpuI0oijgqN378wLPE8ucP27o5A==
X-Received: by 2002:adf:f282:0:b0:37d:4a00:5704 with SMTP id ffacd0b85a97d-38061200c32mr26673278f8f.38.1730892719992;
        Wed, 06 Nov 2024 03:31:59 -0800 (PST)
Message-ID: <6d3f322f-7047-4033-95b5-86751a58cc70@suse.com>
Date: Wed, 6 Nov 2024 12:31:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen/vpci: Fix UB in mask_write
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <559dfac91b8f097bc59c4de194fd2ae2b5b4144c.1730880005.git.mykyta_poturai@epam.com>
 <ZyswF4grJSNcVqY_@macbook> <Zysx4ZwCUv62uTBw@macbook>
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
In-Reply-To: <Zysx4ZwCUv62uTBw@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.11.2024 10:07, Roger Pau Monné wrote:
> On Wed, Nov 06, 2024 at 10:00:07AM +0100, Roger Pau Monné wrote:
>> On Wed, Nov 06, 2024 at 08:05:19AM +0000, Mykyta Poturai wrote:
>>> During the construction of dmask value, it gets shifted by
>>> (32 - msi->vectors) bits. If msi->vectors is 0, the result of the shift
>>> becomes undefined due to shifting by a size of the type. While this
>>> works fine on x86, on ARM the resulting mask becomes 0xFFFFFFFF, which
>>> is incorrect.
>>>
>>> Fix this by adding an explicit check for msi->vectors == 0.
> 
> Wait - how can msi->vectors ever be 0?  AFAICT there's no way in the
> MSI logic to configure 0 vectors, there will always be at least 1 vector
> enabled.
> 
> Maybe what you want, if this fix is for compliance reasons, is an
> assert unreachable that msi->vectors > 0?

Which raises a question as to (lack of) context: Was this spotted by
mere code inspection? Or by a static analyzer? If so, which one? That
may help figure whether some workaround like the one suggested is
necessary, or whether it can simply be left alone.

Jan

