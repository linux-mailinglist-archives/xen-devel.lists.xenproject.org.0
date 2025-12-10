Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FCFCB2BDE
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 11:51:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182843.1505675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTHn6-0004ZT-Ml; Wed, 10 Dec 2025 10:51:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182843.1505675; Wed, 10 Dec 2025 10:51:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTHn6-0004X0-Js; Wed, 10 Dec 2025 10:51:28 +0000
Received: by outflank-mailman (input) for mailman id 1182843;
 Wed, 10 Dec 2025 10:51:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K7qh=6Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vTHn5-0004Wu-Ph
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 10:51:27 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ca2af1d-d5b6-11f0-b15b-2bf370ae4941;
 Wed, 10 Dec 2025 11:51:25 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4779cb0a33fso88901605e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 10 Dec 2025 02:51:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a82d218b4sm40105645e9.6.2025.12.10.02.51.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Dec 2025 02:51:25 -0800 (PST)
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
X-Inumbo-ID: 2ca2af1d-d5b6-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765363885; x=1765968685; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SP83DRLjKwl2F6FH5cE9Kcg3hGXJWYv0BaXlMX5omu8=;
        b=QmnMlG9ry1IDYadgOfBaCQOAkO55T8JhLYxozTRNed3SqGIDZZHBTxe4w73qoaiIHp
         yPSELDoXxaDs3y81qxVQ7e+uX5oOJr/NEyVTnGNmBR6kYBp293SJBGMoHZFSkvwpaA0a
         C2NtxTd5mIN9S5FN5nB3XNVQix50H8HSGTS5ZhS9ImYIO3zEwHlx8EDcqkNONIMnwj9Q
         iSMRqeeSVWNWQDaEDTq7O/CZ82B+J/NGIevrRBDnTHxkgj0BQz+5brncX/i2w5Y/hm9V
         JfLso+nC+u0+6b5eZkjTRxTHLLPjpZvdKX+8NxLC83/QRCedKIbR07Y429JelssqCGcz
         tgtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765363885; x=1765968685;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SP83DRLjKwl2F6FH5cE9Kcg3hGXJWYv0BaXlMX5omu8=;
        b=lHx8AlelwgX3ztfJm41Ode8xvtCQ6pPuecqonHkM7aeYIn/AbfktOlOygBwj1jNx8p
         hJKq+NRZTzAo3k6X8zre7bV4zBel4+t5fykuGGLFRD4/HZA/4Oj2aCJEEjsoLvxQP5KC
         nQlCYXXVXBP6+/UeJuQz6RxvRfW5WYY9i0IIJmJWqN8Q1hSChcgaacxRs+jDT97KB/0I
         P/v0uqQP8wA+Q0SWE7ciRWyeTw6Wwnn3lYX8NJpYQD05N+5gLCANI1bPlc72OzNJRSe5
         ZzriyO8wc58pj/ibS58hAQ89vl0ZL+zbGgg3LnPvB321URKeur0Aoj0uucXa+JbNuHYx
         pnZw==
X-Forwarded-Encrypted: i=1; AJvYcCVi+pUkp4orK1hdn/9AYY7tGT9SrcjyrTfuSaWzu4DeT9gX0zvXKLA2Vk7v10K13uJ2pF+Wc+10H38=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxScsJL5OKHK5pzDlAkAyzI5aykVVIiwdVfPEPNwihHWDJuUgPc
	YvsncZ7XZm5qR5fEwOSF7dS2N2NGXU/k/ARGqDMPuGxW+Jaaz+FxJtKAfiAJi1MJ3w==
X-Gm-Gg: ASbGncv1/WOOit6NxmpWon9FJz3TIJhTn3JBYKJBZDvOOeWCxbCzzCsQHiS6DCe1Jhn
	HmaD5WkN550XQDuYI8eF3t8wzd2YCQekQbGs2rEespVcBTV7eK7yfFwbPmV3rrt3K/R6q1p/UTk
	tRyA1e/DIR1Vyi0sDBkN14iATBQ1UemLKQQ8StaLGm/7qxMKGt/5PO0jl/ckZMqyys8E6pdRze+
	FMFT1hi61DTT2ADQJKdJOPqUnaUa3kZiFW6SpHtYPXXtOXw5LwxDi2uMeWxvkpowUM0XKjP0Mco
	+UnpPtuwHLqzD/xfEB8gBt3wCAsgRwZF/Qa8xvPv+V8WH+0E3mDKnIJLCzS1KkTcO62l5G0Z6JY
	l1GBF+gS9SFVLVAlyPWUVfgWGHASkxbTDBAdNvLQrknqo0uRLqSClmKIyG3A6/lzFg7ATMCSdJQ
	+pL2HFQddm20LcrqksgZ5jUc2/qtpYJdYkFw+RRSVHeueEBx/xtVUdmw/b4p02HzjOuCTEpi8zs
	5FWxQl+Cy00Qw==
X-Google-Smtp-Source: AGHT+IEjmlNgaBcmiB3wyfJeUFXDTaCcviKXqL3fNDi8YllTW+ptx5Ar2S6oNbXuP8B+2b/2hJkRRA==
X-Received: by 2002:a05:600c:4e8b:b0:46e:35a0:3587 with SMTP id 5b1f17b1804b1-47a838586bbmr19080675e9.27.1765363885366;
        Wed, 10 Dec 2025 02:51:25 -0800 (PST)
Message-ID: <0dd5b703-afe7-4d6f-9b86-d89c77f29bd9@suse.com>
Date: Wed, 10 Dec 2025 11:51:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] xenpm: Add get-intel-temp subcommand
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1765300623.git.teddy.astie@vates.tech>
 <6fcfea5d3f6be1bcf1d34ea5ccec40a477100472.1765300623.git.teddy.astie@vates.tech>
 <29100824-303a-46b2-b394-d15d617131bc@suse.com>
 <f7803da9-951e-427f-9f1b-c8bcc1ab76e7@vates.tech>
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
In-Reply-To: <f7803da9-951e-427f-9f1b-c8bcc1ab76e7@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.12.2025 11:26, Teddy Astie wrote:
> Le 10/12/2025 à 09:50, Jan Beulich a écrit :
>> On 09.12.2025 18:19, Teddy Astie wrote:
>>> --- a/tools/misc/xenpm.c
>>> +++ b/tools/misc/xenpm.c
>>> @@ -30,6 +30,7 @@
>>>   #include <inttypes.h>
>>>   #include <sys/time.h>
>>>   
>>> +#include <xen/asm/msr-index.h>
>>
>> For this to not break non-x86 builds, don't you need to constrain the building
>> of the tool to CONFIG_X86? (I have no clue why it is being built for Arm as
>> well right now, as I don't see how it could provide any value there.)
> 
> I don't know what are the plans on that area for ARM, the only thing 
> that seems supported right now is "get-cpu-topology".

Anthony and/or the Arm maintainers will then need to decide whether the tool
wants to continue to be kept building for non-x86.

>>> +    if ( ret == 2 )
>>> +        tjmax = (entries[1].val >> 16) & 0xff;
>>> +    else
>>> +    {
>>> +        /*
>>> +         * The CPU doesn't support MSR_IA32_TEMPERATURE_TARGET, we assume it's 100 which
>>> +         * is correct aside a few selected Atom CPUs. Check coretemp source code for more
>>> +         * information.
>>> +         */
>>
>> What is "coretemp source code" in xen.git context? (I understand you mean the
>> Linux driver, but that also needs saying then.)
> 
> Is "Linux kernel's coretemp.c" better ?

Yes.

Jan

