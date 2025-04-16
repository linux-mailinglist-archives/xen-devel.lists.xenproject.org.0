Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F5CA90485
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 15:41:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956137.1349633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u530k-0002d5-8L; Wed, 16 Apr 2025 13:41:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956137.1349633; Wed, 16 Apr 2025 13:41:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u530k-0002bN-55; Wed, 16 Apr 2025 13:41:06 +0000
Received: by outflank-mailman (input) for mailman id 956137;
 Wed, 16 Apr 2025 13:41:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yQHX=XC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u530i-0002Zo-Ff
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 13:41:04 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 700fb9d2-1ac8-11f0-9ffb-bf95429c2676;
 Wed, 16 Apr 2025 15:41:02 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-39c266c1389so4756893f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Apr 2025 06:41:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae96c102sm17344592f8f.35.2025.04.16.06.41.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Apr 2025 06:41:01 -0700 (PDT)
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
X-Inumbo-ID: 700fb9d2-1ac8-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744810862; x=1745415662; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9UNDj2N3ABKPhWPzqwVQhyl5tSbX4LoPnVF3aIWatIE=;
        b=TIjTI2jKXiRMaK9GW+sf0h2C2CXaAH9MI+MfyyO4TzyfJCSqw+AzgnQZIOvHEcBHbS
         NPnVeD+QFyX0sczV5QN2/YNoVGMdeknbD0i634/4uFfyx3iNjqKWYQTcKga/tdrvAInd
         I/EvYvvy8Q9t/VMQdc7/M+rYOQXwqyoxq4YtJjJdt53Bo2Bqq9+2kOXYviVrXZF9bdwD
         E6QT4PoOFUhP03wHDd+3BT8Bu9ngQGbGeHZyEuGwBpjEPmXKV3rU/xo6WV40X4w4fNHe
         W54Je8vZG46z7I4Y7MxNJ6HEgPte36L1XaXffsl7rgb5BT5yPv/aTodizDSKK45MEsI2
         Ahxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744810862; x=1745415662;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9UNDj2N3ABKPhWPzqwVQhyl5tSbX4LoPnVF3aIWatIE=;
        b=HzMHmqpWT0wesUiHRDEkBkqEg6KhFsN3dt7pzbWav5jAjZNHDlouDQMumWOgs7zjU7
         bQwWph/IDqLuYvINzK1anWDNn077C/kw1ZAWPITUcO/Q3+oWI7xGtJlYcSy7KQ4L5jl0
         964r1SwqJLwbWBgR4dPGmqJntiLINvWTRti22m4pVcpS5OI6rISxef8LjLH6SKyoKH/r
         MAjaGT5CiiUmJYIzbKumnNlcWSFbJOuzM8g2ICfcT8a05PYEKoJg+nZ5KIqKYXLBt2y9
         NTBOd62+ItuHtjBl6nlJP/eFiZHNpkDnmwbsGwPQVnmW5BQZFPNVRwqADz4hFI3mr4MR
         pNZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXh46pPGHSjQ3QwbWtNAh0JO6jfoqM4JTvj8CaqmN3tjDv6gU50r2NwSyqtNRwwrS86R1QtGSaTtkk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyjliGfE9WqNlCdIRPSzQ2DK9xxJuUbkBsFmnoW7iF9cF0eO95s
	QhBfXQ8R7h5IZHnLOrdL7StnKpo2UlQxSJCoHeEZJkR/K+VhmFIVMrciNsb+ig==
X-Gm-Gg: ASbGncuEbWvajj3h+SxvVvQXDQEufPSTqVSwf02D0ZirRw9WJ490zXMqIytNDmUZo/C
	gF8kckf8V7XJoulqEq6bzKZAdLTB25rSFihjeFEkWfKibtOh1BWP3dWaT+gFz/koC7Lq7GTrJos
	YNYczeHMVzIu2/wWrlTzuGkSiUI51e3NHIFWvdX2tOKzBHzgNV6RF8+XWldfSWoMRNHj+ix/iPu
	M4TTrE1pMZwlq637P6Nsvh8f7HysOW60qMf4Qe7RVxzHjC5zwTX97iKLh7bcK/KE5QvZVu8Jjnl
	qoOUp0iqdxa5/YQw5bxHmfxpNJ9N4L3JhwrIZqzZ7BUYmYy7Od8xvmAhsJy5rItDSpktL+IGIbd
	O1PPZfHNFNKngAvH7ixTKOPAMrJqTI2Kyc+UV
X-Google-Smtp-Source: AGHT+IFknJCgvLe6wVs/np9N2Tu2PXZjFz0sh43WnwtrUZca6TvW5BKM9FIgKBKbhTGoEQzwtND7NA==
X-Received: by 2002:a05:6000:2510:b0:39e:cbd2:9ad2 with SMTP id ffacd0b85a97d-39ee5b13b95mr1556281f8f.4.1744810861961;
        Wed, 16 Apr 2025 06:41:01 -0700 (PDT)
Message-ID: <1c12c10f-02e3-4b12-a890-205d3fa0ca39@suse.com>
Date: Wed, 16 Apr 2025 15:41:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/16] x86/hyperlaunch: add memory parsing to domain
 config
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org, Alejandro Vallejo <agarciav@amd.com>
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-15-agarciav@amd.com>
 <e78824bc-3b0a-406e-80ac-5a67b127254f@suse.com>
 <2fe06df0-ee92-4466-a532-ff246efffdac@apertussolutions.com>
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
In-Reply-To: <2fe06df0-ee92-4466-a532-ff246efffdac@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.04.2025 15:37, Daniel P. Smith wrote:
> On 4/10/25 08:03, Jan Beulich wrote:
>> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>>> @@ -212,6 +213,39 @@ static int __init process_domain_node(
>>>               else
>>>                   printk("PV\n");
>>>           }
>>> +        else if ( strncmp(prop_name, "memory", name_len) == 0 )
>>> +        {
>>> +            uint64_t kb;
>>> +            if ( fdt_prop_as_u64(prop, &kb) != 0 )
>>
>> Nit (you know what I have to say here, and again below.)
>>
>>> +            {
>>> +                printk("  failed processing memory for domain %s\n", name);
>>> +                return -EINVAL;
>>
>> Any reason to override fdt_prop_as_u64()'s return value here?
> 
> IMHO this should be a function that libfdt should provide, but altering 
> libftd directly would make uprev'ing it challenging. The least I could 
> do is make the function behave like the rest of libfdt's helper functions.

How's this related to the question that I raised? I didn't question the
function, but a particular aspect of the specific use that is being made
of it here.

Jan

