Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B76B39C0115
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 10:25:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831554.1246873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8ylJ-0005Gs-QQ; Thu, 07 Nov 2024 09:25:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831554.1246873; Thu, 07 Nov 2024 09:25:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8ylJ-0005EY-Nn; Thu, 07 Nov 2024 09:25:09 +0000
Received: by outflank-mailman (input) for mailman id 831554;
 Thu, 07 Nov 2024 09:25:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aElt=SC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t8ylI-0005ES-2v
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 09:25:08 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c0a772e-9cea-11ef-99a3-01e77a169b0f;
 Thu, 07 Nov 2024 10:25:04 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-539f6e1f756so712876e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 01:25:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432aa5b5db0sm52938515e9.5.2024.11.07.01.25.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Nov 2024 01:25:03 -0800 (PST)
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
X-Inumbo-ID: 2c0a772e-9cea-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMzAiLCJoZWxvIjoibWFpbC1sZjEteDEzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjJjMGE3NzJlLTljZWEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwOTcxNTA0LjgyODg4NCwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730971504; x=1731576304; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=55xtnYlRJmcZKTVbj5Xk7NZjM10t2C3yrI4zdzF2On8=;
        b=WDQBRvEi5aX2q1Y4TWFP2qhaJPWIBDTShJUHAHC0WnQnnUAvPsnpNzB2AJ9Ht0KKzN
         6+YQB2ujfKCY+f284/pnA+qYDnsEDpofNXsGUL4u95s0E71h6GZazkeguUhFcKPcUqx6
         4box9TTpb9zT8aVYH9jdHBIMa8bYSpdBJKjmn5fqUdMiqLLrwSZ1RSLUbGCYTiusRqj2
         KFjLjNEnkNHLPclbr0ZG1KeCVj8DtETWKFYX1h4uhXdx+3nhH5aS6AbR3mf/OxU9gvCv
         7HIRN8QynIrVHUXg7kB0JnXUA7znu2Dx9Fw4KBhQXq6Dx8NhnlPpg8pwk7CkhiNR/DJ6
         oU6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730971504; x=1731576304;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=55xtnYlRJmcZKTVbj5Xk7NZjM10t2C3yrI4zdzF2On8=;
        b=m31dd/jFEnIzrG/BkVgxdd5/SzhgOltnHsfXwnusomAmpatieje9ItKjzQ5Oye3gKW
         oAF3JR8bQjBSSJYYyuPPgi22xUklsvaJ/ZkX3Mg6xXLALieKELDBdsOqvyb5FDHiLzbo
         lmWN1AnsB41PfguKe5dj2v+PpT982cK6981giFGDLxsXw5ePFp2wffQvN++p9YgdmDsQ
         bQdSfqMzLlCZjoz2G7iaLxg6Kxzp86tbalh5Y4PoAUvlnjfzr9xTlDtewsR4ZZLcCsar
         wXoDci5JlAcatOdGWM+ghBhDA0oAUy+/9O5vL0jsoAKK1kyEZ9TUf/W1pX1nJwTSfsPQ
         JuuA==
X-Gm-Message-State: AOJu0YzEodutO44ubonjOG5Qr6IaH2lDz8kc1/c2bu+icvaUyAqSf5ay
	uMjFukbYX0wRpH3lUB7Q9p0k54l6rUZVa1QiBlGakLBZmfjpOIm8TTWCaGcmOg==
X-Google-Smtp-Source: AGHT+IFtl7PEmQYB1DE3RhvcSsEkaqf3zbSuLCz07gMBXRuwp4DvU8u7neRCTn/WeFEs5kzypFhckg==
X-Received: by 2002:a05:6512:1385:b0:539:e60a:6dd0 with SMTP id 2adb3069b0e04-53b34b373admr21873364e87.51.1730971504171;
        Thu, 07 Nov 2024 01:25:04 -0800 (PST)
Message-ID: <f731b7a3-9581-4acc-85d2-2b3decd35fae@suse.com>
Date: Thu, 7 Nov 2024 10:25:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen/vpci: Fix UB in mask_write
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <559dfac91b8f097bc59c4de194fd2ae2b5b4144c.1730880005.git.mykyta_poturai@epam.com>
 <ZyswF4grJSNcVqY_@macbook> <Zysx4ZwCUv62uTBw@macbook>
 <6d3f322f-7047-4033-95b5-86751a58cc70@suse.com>
 <65d2043f-5e6f-4d84-8241-eb28dd94fc45@epam.com>
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
In-Reply-To: <65d2043f-5e6f-4d84-8241-eb28dd94fc45@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.11.2024 13:26, Mykyta Poturai wrote:
> On 06.11.2024 10:07, Roger Pau Monné wrote:>
>> Wait - how can msi->vectors ever be 0?  AFAICT there's no way in the
>> MSI logic to configure 0 vectors, there will always be at least 1 vector
>> enabled.
>>
>> Maybe what you want, if this fix is for compliance reasons, is an
>> assert unreachable that msi->vectors > 0?
> 
> I did some investigation and figured out that the value of 0 is being
> set by guest writing to msi_control_reg. As far as I understand, the
> control_write() function only checks that vectors are not greater than
> the maximum allowed value, but does not check for 0.

How that? How could it even check for 0, when 0 isn't possible? Quoting
the code there:

    unsigned int vectors = min_t(uint8_t,
                                 1u << MASK_EXTR(val, PCI_MSI_FLAGS_QSIZE),
                                 pdev->msi_maxvec);

"val" in the guest written value. As that's used as a shift count, how
could 0 result there? The only way I can see 0 ending up in vectors is
when pdev->msi_maxvec was still zero. Yet that's then a bug in device
initialization.

Jan

