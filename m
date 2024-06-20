Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 746A8910107
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 12:03:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744373.1151403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKEdD-0006Dw-Vn; Thu, 20 Jun 2024 10:03:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744373.1151403; Thu, 20 Jun 2024 10:03:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKEdD-0006Ar-S1; Thu, 20 Jun 2024 10:03:03 +0000
Received: by outflank-mailman (input) for mailman id 744373;
 Thu, 20 Jun 2024 10:03:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zqic=NW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sKEdD-0006AV-79
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 10:03:03 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4703056e-2eec-11ef-b4bb-af5377834399;
 Thu, 20 Jun 2024 12:03:01 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2ec0f3b9cfeso6802621fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jun 2024 03:03:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9c2560b9csm16685705ad.224.2024.06.20.03.02.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jun 2024 03:03:00 -0700 (PDT)
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
X-Inumbo-ID: 4703056e-2eec-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718877780; x=1719482580; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cow1dyunLsKcbbFUcMDyyuUU2arBYKLGUfIwHegxd7M=;
        b=IRvYTnzD36xjKUqwjiLEZ4RKE2RPjYDHAu3bJl7OuLnHng9UZm86JWozZGrSob7hOM
         hg/r/A5NiRqQmvlJbg+6aKdI3xHD7QuhEo8+etoUMEc7wJzUsVUB6/eNYbbJEqZRwq+z
         3BbuwBgaytUdxKd0yOUD6qnojH05KPA225gVE4KNPxS825EUwHLMCM0qP+YLERQ6KGUh
         6pO+5DLlyjjZz0nE90k3DiKutch7Fv+JDIfGcmgdGO6tbIlE3Wfxk55apR6g+Q9QaRUe
         kQNduXWRXZ1iBQszRKSqKfDPHS/qkOm5fBgQFncfrwFWCMos/DImpQNX4GaPl4UbLeZy
         gYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718877780; x=1719482580;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cow1dyunLsKcbbFUcMDyyuUU2arBYKLGUfIwHegxd7M=;
        b=roOO5uwpNugmnJvbjcVsL/TiGsk0Km9yRirBy0g+iYOfrvOU8jrHs+hqJ9vZSGwIXD
         lRR0SEzpqC/J2K6xsJptvDAZ4bllxJcu3jObapoOoJRl6FstB7lCwt0flh1/0YebAiRg
         AV2O4p+Y8PdCKUcq+s1h0IjvECkRvOwVWLSSRV1YEYyy1DZ1QuBuwkPCotkErglvLvpZ
         aFP2Mb6H7xAJjHqle9f/5BOOhWXTsdK16xEmQKfkv+8o1hYGADPGbsKyLaxT5xOJkbO0
         exDltHxC7GJfyp0OaClyklLElMlnKt8yDs/s2WoB5+Am+7xKsOUV6r5wn5Xcbk8ffNKK
         ep9g==
X-Forwarded-Encrypted: i=1; AJvYcCUwB+Iph94OthTD4wIOs/TXKj7dbssrq0FpUWO1MUO+4KE1qNXvs6um3KAb8xeYWvhT2xoITc07oYQTHt2TjorUuXogXL1CQ/UtVY54z1g=
X-Gm-Message-State: AOJu0YwAx9e/H2XHNwdt4FJDcWsnLDbO4Ig1dwLBG3R2VQY2kvW+FH1i
	jreGpfCwjTpf6X1O/Jxgiwjoq8TKJp3xesrnnNJXTGC5Rs2PyXTVZEkzb8nq+Q==
X-Google-Smtp-Source: AGHT+IEcMIm7+Uc0QVu6WxcvSehHFwynkTCRGetU+DRoPS087TYmMpvPbXyIpIwSK3uRzOf88AWdtw==
X-Received: by 2002:a2e:87c2:0:b0:2ec:488c:cfe5 with SMTP id 38308e7fff4ca-2ec488cd173mr5989071fa.8.1718877780582;
        Thu, 20 Jun 2024 03:03:00 -0700 (PDT)
Message-ID: <fb3c9a3b-8630-4c25-9013-720535eba322@suse.com>
Date: Thu, 20 Jun 2024 12:02:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/libs/light: Fix nic->vlan memory allocation
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: Leigh Brown <leigh@solinno.co.uk>,
 Xen Devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk
 <jandryuk@gmail.com>, Jason Andryuk <jason.andryuk@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20240520164400.15740-1-leigh@solinno.co.uk>
 <c600e5e8-d169-417c-bc02-d33e84dca0fb@amd.com> <ZnLVxB2XuWL9UKWI@l14>
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
In-Reply-To: <ZnLVxB2XuWL9UKWI@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.06.2024 14:57, Anthony PERARD wrote:
> On Mon, May 20, 2024 at 01:08:03PM -0400, Jason Andryuk wrote:
>> On 2024-05-20 12:44, Leigh Brown wrote:
>>> After the following commit:
>>> 3bc14e4fa4b9 ("tools/libs/light: Add vlan field to libxl_device_nic")
>>> xl list -l aborts with a double free error if a domain has at least
>>> one vif defined:
>>>
>>>    $ sudo xl list -l
>>>    free(): double free detected in tcache 2
>>>    Aborted
>>>
>>> Orginally, the vlan field was called vid and was defined as an integer.
>>> It was appropriate to call libxl__xs_read_checked() with gc passed as
>>> the string data was copied to a different variable.  However, the final
>>> version uses a string data type and the call should have been changed
>>> to use NOGC instead of gc to allow that data to live past the gc
>>> controlled lifetime, in line with the other string fields.
>>>
>>> This patch makes the change to pass NOGC instead of gc and moves the
>>> new code to be next to the other string fields (fixing a couple of
>>> errant tabs along the way), as recommended by Jason.
>>>
>>> Fixes: 3bc14e4fa4b9 ("tools/libs/light: Add vlan field to libxl_device_nic")
>>> Signed-off-by: Leigh Brown <leigh@solinno.co.uk>
>>
>> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Btw, at the example of this: Are you meaning to update ./MAINTAINERS with
that new email address of yours. Strictly speaking I think for Acked-by: to
actually fulfill its purpose (and for R-b to have its normally implied
meaning of "ack" when coming from a maintainer), it probably ought to match
the corresponding entry in ./MAINTAINERS.

Jan


