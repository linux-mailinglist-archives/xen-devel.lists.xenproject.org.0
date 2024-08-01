Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3B5944AAF
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2024 14:00:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769648.1180534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZUTI-0006iP-4p; Thu, 01 Aug 2024 11:59:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769648.1180534; Thu, 01 Aug 2024 11:59:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZUTI-0006g9-2A; Thu, 01 Aug 2024 11:59:52 +0000
Received: by outflank-mailman (input) for mailman id 769648;
 Thu, 01 Aug 2024 11:59:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/4YK=PA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZUTG-0006g3-Ej
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2024 11:59:50 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8daef14c-4ffd-11ef-bc02-fd08da9f4363;
 Thu, 01 Aug 2024 13:59:49 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2eecd2c6432so102956471fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2024 04:59:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad91010sm895199066b.172.2024.08.01.04.59.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Aug 2024 04:59:48 -0700 (PDT)
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
X-Inumbo-ID: 8daef14c-4ffd-11ef-bc02-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722513589; x=1723118389; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fcVcK1zGJ9Bi5IET0nl3Cef0XxJfM3QerBIsPmvZYho=;
        b=Tgo/tZxTZ7jQNt0HEnoqL8nn9JFSF8o330qBwienWXokJdv2vV8iRFcMiu0nDExDow
         oDxIU8qigIiiazy1e/H7DzIujms/7tn/YZ77C4vZpuELci5pBVJGbtxroyzYjTnV0f7E
         xCNT3Bj1O9RuN/aK91aX8wA5n4A8nh5ChsDYIdx5aknwJIlHWNNjWmYtWhd20az7qDJV
         D6Y0uV2xBTtvQPqchiWAZkGWRj9VtGqy/tRQqY41bBAC0rL6gNPD8rPJTEuEIGpnsgF/
         UvVKVzYd8fDn1a5kMFVQGApfWgIkzYgUonXz6RhiQsRXNnRc/q04ZWV8QWwiKuohj+i4
         YCOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722513589; x=1723118389;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fcVcK1zGJ9Bi5IET0nl3Cef0XxJfM3QerBIsPmvZYho=;
        b=VsrMdo9vVjnGXmY+gkoAOoNBNkgDnGy9rheaiulz9tR5CAKJdP+Sy2hrXYIZlfzdby
         LynujiPNYBhzu2l9MzhAOB2BSQeytdlKegPkVrJ+TGJR9y9KYE9oJfjjWc8rAEYBClbV
         AJPZfA4q+acQqu0hYtnl+qhyzXc//govZHgrPhqITulEo/slklK2V1WAqvIlHTu1NljQ
         3BPWa8BH3dUFBKwdsMu/1xRpYj7cICPVODl+HJXII6vBuveWb/l7rC9EFJge3XFjyqhy
         T3MeEqfPmCsGZG9Nc0sI63PVl7/iA4Omidr3Yh7IEnuzZho/b1QEDhY7R3SlWIfk4ZKY
         81dw==
X-Forwarded-Encrypted: i=1; AJvYcCX3e1SQHMiAgxfYhrGsMXdvp9IUm/pxTxldAlZ6Akqqs5WgVg7Prt6ySiW670TezYOt7s6BRkd/ujiAIyobkfSiCZjTgmiAB5rXWhfJ7Is=
X-Gm-Message-State: AOJu0YzOVXiR422wa5x5HqEZQY6A3y7h3nCuSh7RZQxscfJ2xjX1/Q4N
	jMwE1MsGodLto8+nFPWMyvCq6dquavf++wc4B7iYHety7rFC1E97cgHc9U73JQ==
X-Google-Smtp-Source: AGHT+IE76/DUj1LcZVyXJ3A5/v6f8wROB/hV/CUzmXCF/HuiC5ltqrmKnF9C8J6X3bcYM0+D6HEyqw==
X-Received: by 2002:a2e:b90a:0:b0:2ef:2490:46f1 with SMTP id 38308e7fff4ca-2f153102cebmr19186981fa.23.1722513588838;
        Thu, 01 Aug 2024 04:59:48 -0700 (PDT)
Message-ID: <76e81ce0-f251-4c4b-a4c9-fbe06e7a6a84@suse.com>
Date: Thu, 1 Aug 2024 13:59:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/9] xen/riscv: page table handling
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1721834549.git.oleksii.kurochko@gmail.com>
 <595c7b6736d6f718bafc7a677fb13881584ce4dc.1721834549.git.oleksii.kurochko@gmail.com>
 <c2496115-5c42-4cbb-8dde-686a97259609@suse.com>
 <04b40498494cbbd0d78744d87a2310e211f26b85.camel@gmail.com>
 <afc24e73-78e8-4088-9292-33560e599cbe@suse.com>
 <d816816c0cb37279f45fad46553b1fa267b0febc.camel@gmail.com>
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
In-Reply-To: <d816816c0cb37279f45fad46553b1fa267b0febc.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.08.2024 13:55, oleksii.kurochko@gmail.com wrote:
> On Thu, 2024-08-01 at 12:43 +0200, Jan Beulich wrote:
>>>>> +int map_pages_to_xen(unsigned long virt,
>>>>> +                     mfn_t mfn,
>>>>> +                     unsigned long nr_mfns,
>>>>> +                     unsigned int flags)
>>>>> +{
>>>>> +    return xen_pt_update(virt, mfn, nr_mfns, flags);
>>>>> +}
>>>>
>>>> Why this wrapping of two functions taking identical arguments?
>>> map_pages_to_xen() sounds more clear regarding the way how it
>>> should be
>>> used.
>>>
>>> xen_pt_update() will be also used inside other functions. Look at
>>> the
>>> example above.
>>
>> They could as well use map_pages_to_xen() then? Or else the wrapper
>> may
>> want to check (assert) that it is _not_ called with one of the
>> special
>> case arguments that xen_pt_update() knows how to deal with?
> Yes, map_pages_to_xen() will be used in other functions/wrappers.
> At the momemnt, I don't see what should be checked additionally in
> map_pages_to_xen(). It seems to me that xen_pt_update() covers all the
> checks at the start it needs for now. ( i will double-check that ).

I was referring to cases that xen_pt_update() can handle, but that
map_pages_to_xen() isn't supposed to be handling (if already you
want to separate both).

Jan

