Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4119C09E8
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 16:18:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832013.1247403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t94HR-0006pY-LM; Thu, 07 Nov 2024 15:18:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832013.1247403; Thu, 07 Nov 2024 15:18:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t94HR-0006n4-Ij; Thu, 07 Nov 2024 15:18:41 +0000
Received: by outflank-mailman (input) for mailman id 832013;
 Thu, 07 Nov 2024 15:18:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aElt=SC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t94Et-0002r4-Oz
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 15:16:03 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 323a3306-9d1b-11ef-99a3-01e77a169b0f;
 Thu, 07 Nov 2024 16:16:00 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4315e62afe0so9754415e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 07:16:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432aa74bab3sm63693805e9.43.2024.11.07.07.15.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Nov 2024 07:15:59 -0800 (PST)
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
X-Inumbo-ID: 323a3306-9d1b-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzYiLCJoZWxvIjoibWFpbC13bTEteDMzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjMyM2EzMzA2LTlkMWItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwOTkyNTYwLjYzOTAwOCwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730992560; x=1731597360; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cqtMN9EGeIA5v+4lD5d3V0U1O8kx/oJv/Lx46QMzrvQ=;
        b=X32MR5azRg3a90eMGnoObWeITU/DPfV2rfxmRT76kHK9bwlJCCFU5rn8XWpEPHRAyu
         yVX2qAbL816YjKOKNH1sxAI/x9qyDbisnUMiFPp0HtQ9tWcepNVKZ+roohzFzjHrBufo
         7pEvw+8TT5daFT8D+UWFBv4CMKZgOIEsDVGEEfVbxMIG8puLs97kBeHQHwWk/Rmxmerb
         84UpJt46cYsuW50nQt8iDbJmd7DItNEzjN1/v8Xiu5quAED6NJfJCF7MuaXDewyi758W
         ehx4EaI4qizSb9Ki/CTCU++fEOa33Hr+xTmUxZ3+Im5YA+2unn/SqRi5aPF6fSZ1wq5q
         t0Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730992560; x=1731597360;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cqtMN9EGeIA5v+4lD5d3V0U1O8kx/oJv/Lx46QMzrvQ=;
        b=byqJBcsuIoaTjFE/kJrSZ2HBdsBADQForjmSlRNsoRdkBT5ee7D2fqJRUIpXykwn/x
         h+LXQOeUfCJmSER0W4wvy2bBO7NPV80+CoH6bWeUPpe3BRAG3xGpr8jxn6FDOL/t1J0s
         xo3bMwNxmrEfwtqPs1sgv6iF2qh1qtNVigxavvFd8uTkyLs9j+4//uGhl07/JF/R03ZQ
         nFueqeoqISqn3+XNXGH6lwlEw7T8ZPB0K6IPlYFP0eszph/Byukwy8bwqQbf8OlKdbgM
         j4rM97/v3N3I7WvctFH4Un6soxA6FWSHUWXcGp7WFb7JHZPOTNqXuqMvIWu46y9dxNsQ
         cOTA==
X-Forwarded-Encrypted: i=1; AJvYcCW+u8bS7Jt0dsR9zGFJqJtGAdD0rAeZLYTH6NytL60OVjZUMR2UIZQ7LllrfaCIn1DJWdmBgELn/Io=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyvK6JOOLNjt8RdXnfNLwrtH9EitWtegRIz4AtPbQ4A5hrM9ho9
	+7n0R7qZRwnUNSy4oNgi37Yg8Q0102N8SLCTxN3EdinLw0nHnqnAVF+f6LStzQ==
X-Google-Smtp-Source: AGHT+IF45QnaEaPTx/IunvBoQd237OwZAaaIab44RVM3b0QQtyOUsttojU8mQI6NYvfW8KzdaLAR4w==
X-Received: by 2002:a05:600c:1c01:b0:431:12a8:7f1a with SMTP id 5b1f17b1804b1-4319acadc13mr398860205e9.16.1730992559993;
        Thu, 07 Nov 2024 07:15:59 -0800 (PST)
Message-ID: <4c40ca3e-73ab-402b-b5f9-23146ec14e60@suse.com>
Date: Thu, 7 Nov 2024 16:15:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] x86/boot: eliminate module_map
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241102172551.17233-1-dpsmith@apertussolutions.com>
 <20241102172551.17233-3-dpsmith@apertussolutions.com>
 <d32a3eb9-c0cb-4f87-9f88-4fc0d32cf1e8@suse.com>
 <bc6dab85-75a6-4bb2-83cc-884bc07650f5@apertussolutions.com>
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
In-Reply-To: <bc6dab85-75a6-4bb2-83cc-884bc07650f5@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.11.2024 16:08, Daniel P. Smith wrote:
> On 11/7/24 05:05, Jan Beulich wrote:
>> On 02.11.2024 18:25, Daniel P. Smith wrote:
>>> --- a/xen/xsm/xsm_policy.c
>>> +++ b/xen/xsm/xsm_policy.c
>>> @@ -33,22 +33,18 @@
>>>   int __init xsm_multiboot_policy_init(
>>>       struct boot_info *bi, void **policy_buffer, size_t *policy_size)
>>>   {
>>> -    int i;
>>> +    unsigned int i;
>>>       int rc = 0;
>>>       u32 *_policy_start;
>>>       unsigned long _policy_len;
>>>   
>>> -    /*
>>> -     * Try all modules and see whichever could be the binary policy.
>>> -     * Adjust module_map for the module that is the binary policy.
>>> -     */
>>> -    for ( i = bi->nr_modules - 1; i >= 1; i-- )
>>> +    /* Try all unknown modules and see whichever could be the binary policy. */
>>> +    for_each_boot_module_by_type(i, bi, BOOTMOD_UNKNOWN)
>>>       {
>>> -        if ( !test_bit(i, bi->module_map) )
>>> -            continue;
>>> +        struct boot_module *bm = &bi->mods[i];
>>
>> ... same here (and likely elsewhere in the series).
> 
> Nope, you can't const this one as that will cause this is at the tail 
> end of the loop to fail:
> 
> +            bm->type = BOOTMOD_XSM_POLICY;

Oh, I had managed to not spot that.

Jan

