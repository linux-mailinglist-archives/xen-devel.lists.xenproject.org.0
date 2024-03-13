Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF2587A834
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 14:22:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692432.1079553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkOXi-0008Dj-HU; Wed, 13 Mar 2024 13:21:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692432.1079553; Wed, 13 Mar 2024 13:21:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkOXi-0008Ac-Ej; Wed, 13 Mar 2024 13:21:14 +0000
Received: by outflank-mailman (input) for mailman id 692432;
 Wed, 13 Mar 2024 13:21:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bR7k=KT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rkOXg-0008AW-FP
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 13:21:12 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f44786f-e13c-11ee-afdd-a90da7624cb6;
 Wed, 13 Mar 2024 14:21:11 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a450bedffdfso131149366b.3
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 06:21:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 qw14-20020a170906fcae00b00a46647b6496sm226510ejb.155.2024.03.13.06.21.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Mar 2024 06:21:10 -0700 (PDT)
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
X-Inumbo-ID: 8f44786f-e13c-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710336071; x=1710940871; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8NOnulto4mHXTGIK1YPxftEbHfrfAN5ZyCaTfuQAlFU=;
        b=QojkelqBZBpuQ8yEPI/z3pljqp5nUyiN2FJU1+K5hiEDKFEsFPzi7VDp53ZCLYCf85
         bOdu3tyXCJir1CcXcPWSIsf2S1Vrl45yRwDR81HX8ZuwkE5tMv+udWu9JxOn2mMN/Bb7
         TIP5RPMcO/2IBy++686iA6SIq8iyKn9+tX8a11pmVkpYP0MoTVOFCLG7SXoUp6LiEFZ1
         fO/UP0HJ8fU82ZfTlMZ2Lyd8tXSqbFH3AkzFGhsA3LHSoeoQqL9m+zpGUHTVW9m5dHXF
         3DB3zuQZJuhOPS3fr1bhDMHZq5hLjtvvxe8ZGNq6EKfzn1fPWqYceMdfW5fvpL1uZYfx
         ux3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710336071; x=1710940871;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8NOnulto4mHXTGIK1YPxftEbHfrfAN5ZyCaTfuQAlFU=;
        b=FCSA/LSdntehRI5VuB9/B2dO8b2pAx02PWzSjxfpZ6ZkggRfHsSxGEepMlrt3MMqHx
         c/CcYOavqcg6FXxdZT8BlwwVtTwF5uEPwQAlXXUNNRJx9z9z8DxWzxozxF+Fylm4TbPi
         VUu+xIJR0f3ZC25hhI3HZgvjvdL1Y/xinqkkVIgDhZ21tGhViZLmOk/HSdVsamwj6aY/
         bfi0Z2adlbaZDg3mgc7UCOJV4E8tJ1hxctiqbNwXXdwWlXugEIoyEHcNGnVoP3Os+nAj
         eN217P9ePH4nY2Ywc1zuCme9eE6mwrA+C02JWblpRKg8/soKRD9ReQM0yNLcg6IBQnQe
         AS9w==
X-Forwarded-Encrypted: i=1; AJvYcCVQVNK2bnSYY+55OEM0gaa+9klgsprhIbLzWIGBhzCzTDvo6QqKsd2jfqPcOZopOgf52rG48Bec7337f2YrE1V4XYekQ0C9YqSrJL4Cqb8=
X-Gm-Message-State: AOJu0YwP5SBniIVS04MZ7QoEbLNvpbCyWMAY5jRY7uXKfReyxrzcHSBE
	6v/WOpCUeFQ7fI08TOC2krY01CuGLgxe+vsMyYVEsEIBiQHzJRjdqNh+jxVeNw==
X-Google-Smtp-Source: AGHT+IHRm90eFCHbE29SVeSOxCuo9s6xD3+IoZIwlc/7pNVLGrCIhDDtZHbv9Pwt4+Rk4KoFt1a57w==
X-Received: by 2002:a17:907:d311:b0:a3e:b263:d769 with SMTP id vg17-20020a170907d31100b00a3eb263d769mr2622677ejc.4.1710336070950;
        Wed, 13 Mar 2024 06:21:10 -0700 (PDT)
Message-ID: <86d27aa3-4ac7-4717-bafd-598b1201faf1@suse.com>
Date: Wed, 13 Mar 2024 14:21:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 8/9] x86/smp: make cpu_state per-CPU
Content-Language: en-US
To: Krystian Hebel <krystian.hebel@3mdeb.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1699982111.git.krystian.hebel@3mdeb.com>
 <52083114d4cbbc75f021e8c61763ad0e166cf05b.1699982111.git.krystian.hebel@3mdeb.com>
 <c1e23e38-aaac-44c5-a1af-999f71909110@suse.com>
 <848c6735-c700-4feb-bc0c-259d00147564@3mdeb.com>
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
In-Reply-To: <848c6735-c700-4feb-bc0c-259d00147564@3mdeb.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.03.2024 17:38, Krystian Hebel wrote:
> On 8.02.2024 13:13, Jan Beulich wrote:
>> On 14.11.2023 18:50, Krystian Hebel wrote:
>>> @@ -320,6 +317,10 @@ void start_secondary(unsigned int cpu)
>>>   
>>>       /* Critical region without IDT or TSS.  Any fault is deadly! */
>>>   
>>> +    /* Wait until data set up by CPU_UP_PREPARE notifiers is ready. */
>>> +    while ( cpu_data[cpu].cpu_state != CPU_STATE_CALLOUT )
>>> +        cpu_relax();
>> I'm afraid I don't understand the comment (and hence whether this loop
>> is actually needed here): __cpu_up() is called only after those
>> notifiers completed.
> Yes, but broadcasted INIT-SIPI-SIPI sequence added in next patch will be
> sent before that call is made, and consequently APs potentially can get
> to this point before that data is set up.

That's fine, and I was able to conclude this once having read that following
patch. But the patch here, including its description, wants to the self-
contained.

Jan

