Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C993C8A83AB
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 15:03:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707499.1105472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx4wf-0007sP-TQ; Wed, 17 Apr 2024 13:03:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707499.1105472; Wed, 17 Apr 2024 13:03:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx4wf-0007q1-Q9; Wed, 17 Apr 2024 13:03:25 +0000
Received: by outflank-mailman (input) for mailman id 707499;
 Wed, 17 Apr 2024 13:03:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T4Tg=LW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rx4we-0007pv-9z
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 13:03:24 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de4e437d-fcba-11ee-94a3-07e782e9044d;
 Wed, 17 Apr 2024 15:03:22 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-416a8ec0239so5058605e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2024 06:03:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 m22-20020a05600c4f5600b004148d7b889asm2820028wmq.8.2024.04.17.06.03.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Apr 2024 06:03:21 -0700 (PDT)
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
X-Inumbo-ID: de4e437d-fcba-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713359001; x=1713963801; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uqVmfvf2YlryzZx+Qt1pJ7dO7WxSLOQ2A70cmmLmEpQ=;
        b=aMuNCePDez8QwZIwRC+pWX4+ffvPhG6TI2jKctK9gVZ7KCC9GLo4D8DXMU9ixuWxB1
         P14OAG3p6FVhJOD1u6gyCQ05i3Jocryl1XffKsIn7g3Jb8fYJyWfjkyE2htX6HBWMRnQ
         4GvbbmWzi+dd9Nc2Pi/iienqsTEuFiaDKdjax9ei7gQYofkS3YKiR/ujY15Ti2AkLnpR
         5gjUR5JO861b5QwBGCj5nfT5DnGw+KYeGcWku7VvlgPLAThM8DiKCmpbJUvxopZwWwPd
         6HujOgtd8sWhIkwgC+Opg/j7d1IC3cG56TDoBve8TfMiZr+k+elFSAEWhSgeycWStD7b
         OWHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713359001; x=1713963801;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uqVmfvf2YlryzZx+Qt1pJ7dO7WxSLOQ2A70cmmLmEpQ=;
        b=fpBfn1+izHnUSi2AfIvGsxnpmS9rbletV3HC4KpoztBBpAkTB5uTohx6fg7Sf9YvP0
         i2hSna9YZghQ44KY+m5zmJMh2NXW0aRg2fYbIlk98AqNesfzSTENJUfxd3Kx+WpqLDF6
         FRSOIVBNHCVIuO0iruPgjx7/jvsmajBIezcMTnnLBa1bQ8CXrt10Iu8wUFpDmEO9yH7T
         6nVMzOb8YgsZtkVhBEssyRhn8wkW70lz7YKAfUtf79Navau7DgBnA1loqfnNhaB349bt
         QtEbazhkDu+OqmhE/4qEMcGHLIhY++UQ+jXDajoKJL+00TVQm58wT9wNsFKe4KAUO30s
         NaTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhTd2y6LssEsvMH9NLZr2XZKoFcIbRgnbspc/EMfwR4uoWu6H9E3hjJA75T7XOfFkmGTOS2IdxrTDCAb+yj982n0r3LEn0PmZ1XSYpVFA=
X-Gm-Message-State: AOJu0Yyp2d5H7j3UjrLHPwEdKdjJQfvUqrmYua1R6yxwbOSKsFWj0Xrr
	HOwnuUoNeaMf3qaJb6/be/WVf0TDjrEWpshBQ/eLS42yhxVy7ZKSahUe+zvPBh7gRXiciRco0Hk
	=
X-Google-Smtp-Source: AGHT+IGbwqyjK5SGanMmraqkyCyMBxHQNFi+3jTKtzXTPGiCaPh08+3DneuLWLUuBLXscwQ7g55crw==
X-Received: by 2002:a05:600c:444a:b0:418:60d6:8590 with SMTP id v10-20020a05600c444a00b0041860d68590mr4536907wmn.1.1713359001428;
        Wed, 17 Apr 2024 06:03:21 -0700 (PDT)
Message-ID: <b86f1056-9667-47ef-90a9-91f09298277c@suse.com>
Date: Wed, 17 Apr 2024 15:03:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/9] xen/ppc: Introduce stub asm/static-shmem.h
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: tpearson@raptorengineering.com, xen-devel@lists.xenproject.org
References: <cover.1710443965.git.sanastasio@raptorengineering.com>
 <0cf8286269a1c5cdc63e2c19d832a4923cd14f39.1710443965.git.sanastasio@raptorengineering.com>
 <aaaaa735-ce88-42a3-9a2c-22de7f5eeb32@suse.com>
 <d9a61ba5-3f75-4d06-a033-0ee0ffc4cd23@raptorengineering.com>
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
In-Reply-To: <d9a61ba5-3f75-4d06-a033-0ee0ffc4cd23@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.04.2024 01:35, Shawn Anastasio wrote:
> On 3/25/24 10:24 AM, Jan Beulich wrote:
>> On 14.03.2024 23:15, Shawn Anastasio wrote:
>>> Required for bootfdt.c to build.
>>>
>>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>>
>> As a temporary workaround this may be okay, but was the alternative
>> considered to properly provide stubs in a single central place for
>> anything !CONFIG_STATIC_SHM?
>>
> 
> I can't think of an existing place where this would cleanly fit, but if
> you have any suggestions I'm open to it.

Just like was done for ACPI and before that for NUMA, there ought to be
a respective header in include/xen/, I'd say.

Jan

