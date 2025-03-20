Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B831CA6A36B
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 11:18:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.921594.1325397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvCym-0003Af-3L; Thu, 20 Mar 2025 10:18:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 921594.1325397; Thu, 20 Mar 2025 10:18:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvCym-00038i-0p; Thu, 20 Mar 2025 10:18:24 +0000
Received: by outflank-mailman (input) for mailman id 921594;
 Thu, 20 Mar 2025 10:18:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B8C5=WH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tvCyk-00038c-OA
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 10:18:22 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5bf75e1-0574-11f0-9ffa-bf95429c2676;
 Thu, 20 Mar 2025 11:18:20 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43cf034d4abso6176985e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 03:18:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39971b56299sm5498699f8f.98.2025.03.20.03.18.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 03:18:19 -0700 (PDT)
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
X-Inumbo-ID: a5bf75e1-0574-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742465900; x=1743070700; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CDXVfdcWZp1A3LH1gi3ApAzaUlzjg7DaBEx03R5ffyk=;
        b=VNbZWQBCQXSV0vyZvHdoXdKm2mjH6GoYMqkViD/cwGlGRP7dZd/xHdgi/pHFSUQV92
         QrS52Ne7tDzXdm5c33YRc7HxbQ4WiTFvksjGTBs7j+Ib085RZfl9uNmPmlQfi00O4koO
         3pdGBD8BTxbyy/srPb025i+RnpoKnEUCMBavRQo5AH191vpFwPu8f0qnK/YEQDDRr6Nj
         NYoDc1KtVmIuygL06aG8WJnAUT3mNNMaKQJkapRSGlRnqPCPIjZaMlbIA9pm8Ov74LH1
         /qH8eNe3/fytKNmjrwvJUcCz3lRgPWyvpN/K8++p5+v6A5F47U4dqI99k0BoprpnyNmY
         TjjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742465900; x=1743070700;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CDXVfdcWZp1A3LH1gi3ApAzaUlzjg7DaBEx03R5ffyk=;
        b=B4F7QdBXTDdf8eoRD+e3fNzAGVUIAooTai7AV4psDmedxzMS0d4tbIZZJW07FQkcov
         /+UtjOPTZ8kRfIFKFgGGR7169B4vCjDeahR1l0+hv8z9NdW7ovku5oW5a8KHAMRik9fG
         8vEFmFg5+V7Zq5Lsf/ep9mbew0B/TKoTZ+dWlHVLOJtQcBu2h6xuoeiqaZVnj+IUpdM6
         XDW6IChBjBYAXqAzR72VuDhdnF70DmOLPvTjLnXFdb383i+2NS0bo7iqQ8CmMBShrtef
         c/EAlwhia7VF+2QqJD5lyIsMvw+8FH06Vc93lf7vDO0qtL9rEvmbbxIyUYQzZXM/d+nW
         3xZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGp6Ag1ZksGVJAMvUhaHlTNZx75YhGSBqmMlwG6+RiPVR20R0EdIZvRFadVYayMhtqAVHi4ikVlQk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzGwCj5rDmVhBlOAhmv6Gs6UXfriS5zYFXJIcyW06ayQoYjmfzm
	JDhm1+qwCOoSQcWMXoZgS9AzmhfkxwjcrH6BU66M5wvQOLOvHhiHajYSx8DQIg==
X-Gm-Gg: ASbGncvSPkwkJkxXliYrDgqNViBIq2ziUde5j3zEaxHuDDyTZbpfB3d5e9BbXfVSZh2
	nnJ+/YAmnBAhhRY4nTdLnD4GZ1DJBLWJWkorrLTogwgqK0KNI+yTxG5jC+FwzspqkLj0rOgZSBV
	8wPM/+naUcisSZBl4d8RRGOzOm84psbSqBk9Csb65GCirqduHFlAPYTnDBG+yxLv7PQVeM6nKdZ
	3sjEpfb4ULmGdsDT3zC93ddLPVMOIMQXnsQXaL92KWfi3hbf14RIq2oRbdPu4HAZPverVdlZJPW
	Ig+5UrYaMqb6vjJid+yVpK0VKz3n0iDb4xben+KJmgxDQhzK5+Dt/nSicqOsSugXs/iGPKyR39o
	GMoC4z4HehuTQbXkSN71isgvukfqXpA==
X-Google-Smtp-Source: AGHT+IEi+SZkuxFY1+zuSw1LjqsRvBHUZDkALS6eOyg7sgly201aq+LCZaOycUhxfnLUff7guJSC8Q==
X-Received: by 2002:a05:600c:1f17:b0:43d:300f:fa1d with SMTP id 5b1f17b1804b1-43d4d5b6883mr8735375e9.31.1742465899751;
        Thu, 20 Mar 2025 03:18:19 -0700 (PDT)
Message-ID: <1903e4c2-6a2c-47f1-a5dd-28f13cc87da2@suse.com>
Date: Thu, 20 Mar 2025 11:18:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] x86/mkreloc: remove warning about relocations to RO
 section
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250318173547.59475-1-roger.pau@citrix.com>
 <20250318173547.59475-6-roger.pau@citrix.com>
 <a3c70637-b354-40f4-9a67-9d2aa7bcdcb0@suse.com>
 <27ebf169-ab63-4def-a98b-751ae1758293@suse.com>
 <Z9vOc5I828aV49rI@macbook.local>
 <0da7c7dd-bfbc-4e41-98ed-6e98793e6f50@suse.com>
 <3bec51cf-e3db-4f1b-ac24-4686e2498fde@suse.com>
Content-Language: en-US
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
In-Reply-To: <3bec51cf-e3db-4f1b-ac24-4686e2498fde@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.03.2025 10:53, Jan Beulich wrote:
> On 20.03.2025 09:34, Jan Beulich wrote:
>> On 20.03.2025 09:14, Roger Pau Monné wrote:
>>> I wonder how this worked then, as I've tested with the xen.efi smoke
>>> test in gitlab CI.  Maybe ovmf doesn't acknowledge the RX sections and
>>> unconditionally sets all mappings as writable?
>>
>> Possible. And that would be in line with the mode being call "physical mode":
>> There are no permissions to enforce there. It just so happens that x86-64
>> requires paging to be enabled to be able to run 64-bit code.
>>
>> My experience with OVMF has been that it's hard to find where certain code
>> lives. Perhaps I should try whether I can find respective code there. Then
>> again if I find nothing, there wouldn't be any guarantee that I merely didn't
>> spot the right place.
> 
> All I can find is BaseTools/Source/C/Common/BasePeCoff.c:PeCoffLoaderLoadImage(),
> which doesn't look to care about section flags at all.

And then there is at least one duplicate thereof elsewhere, or something very
close to a duplicate. In addition I meanwhile found ProtectUefiImage(), yet
it's unclear (to me) under what conditions execution would make it there. Plus
it leading to SetUefiImageMemoryAttributes() leaves open where
gCpu->SetMemoryAttributes() is implemented. I can spot some Arm and RISC-V code
with respective names (albeit in distinct places), and MTRR functionality with
names along these lines. None of these can be it.

Jan

