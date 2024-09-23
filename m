Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC8297EAD2
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 13:32:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801980.1212069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sshIf-0007CX-Rk; Mon, 23 Sep 2024 11:32:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801980.1212069; Mon, 23 Sep 2024 11:32:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sshIf-0007Ag-P4; Mon, 23 Sep 2024 11:32:17 +0000
Received: by outflank-mailman (input) for mailman id 801980;
 Mon, 23 Sep 2024 11:32:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZUN=QV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sshIf-0007Aa-2B
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 11:32:17 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b318e15-799f-11ef-99a2-01e77a169b0f;
 Mon, 23 Sep 2024 13:32:14 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a83562f9be9so484623766b.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 04:32:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c42bb497adsm10154299a12.14.2024.09.23.04.32.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2024 04:32:13 -0700 (PDT)
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
X-Inumbo-ID: 7b318e15-799f-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727091134; x=1727695934; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uGjMUgz53wY2XMYEslNfrP3IUKYPpJbfBeEJ0vzqSDM=;
        b=Rg2kkX/jomoW2JkGWl6HSR85IwZn2Qw7vAtPmlekOYbX9CbE9Lg/sW9ne3AM1Amv/B
         LkuU6NISuDF5oBNojnzQdabUZhEHYK7lgz+HQJsAeHPTIZmqSpX10QKRtF3a35EmJW1Y
         QQuJgvJK9a9uybA6LXHFn/KnXJMebYIZB8E9ilxwD9ZuAKiiuaXvW3YUmHXuxBNjS6jK
         /w1YGKAsAy+OC3c1exwtJRRtzX8FY0v3yQUQ9IRyBPPo0nR+tgp5hG5jbZegCMDJ6BOs
         398pFsHc/x0jfSPHlhKGaQRR33u2aU6W8hW9UDc1jR/Lc7kdu9r3guMeTPmkX3aNkV4w
         +GYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727091134; x=1727695934;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uGjMUgz53wY2XMYEslNfrP3IUKYPpJbfBeEJ0vzqSDM=;
        b=sAnDGciMp0ewlDZTgqtqLVd4qE08RSYOLOdriPdR2TKcdeXJlABy9AcEdMjiCd98UQ
         isfKU5DaZ9CneHWvnTFbTgvSwAEELzkumHoiSWY/RzSqmy1lWP6ybsLHs3YyyvIxIjrB
         tu8IcQJRI0XP4HjD5nAs1N26OJAn9h4mobV3TMB+Qbm+BJGEwK4Zgvoc7woUtx5ZxH5u
         2p6jCKNZ02At/RZcz6MssnaUIFrIewF/S8yFd8eNPYTP82R+7VkWXoZQfguGy4hWi3wz
         1SabqTXNaPE/MZKcSm1BbDAXObZ4av3VD9bZPuCnVZ6gd3pqzeZSBwr2vv8epeyaMYot
         6Qrg==
X-Gm-Message-State: AOJu0YxAK5axv69Qmo0i7Aunda3lEBvsyDRVUGelvjkIcD+n1+VeBljn
	EKkPakdlANVPJNJKUDfqP7+LhXnkIR8CLB77RGnuFWFFTYDGq0VYhhkCUG5TSQ==
X-Google-Smtp-Source: AGHT+IG5ttXYcQeF+vqYGTO61dLa22KPwT63VWb5YWgxo8S8udgtX3xBqMR9sA2EPIxrvzRuIsl3Kw==
X-Received: by 2002:a05:6402:1e8a:b0:5c4:d986:7f34 with SMTP id 4fb4d7f45d1cf-5c4d9868129mr5770868a12.21.1727091134048;
        Mon, 23 Sep 2024 04:32:14 -0700 (PDT)
Message-ID: <81afd5ee-8372-413c-ac54-39193836915b@suse.com>
Date: Mon, 23 Sep 2024 13:32:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Drop stale comment about zeroing the stack
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20240916115811.2076392-1-andrew.cooper3@citrix.com>
 <CACHz=ZiemNMMBk7GT9+Y=WLN5zm-M7-QDwa-H760Ca=THPvkNw@mail.gmail.com>
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
In-Reply-To: <CACHz=ZiemNMMBk7GT9+Y=WLN5zm-M7-QDwa-H760Ca=THPvkNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.09.2024 15:16, Frediano Ziglio wrote:
> On Mon, Sep 16, 2024 at 12:58 PM Andrew Cooper
> <andrew.cooper3@citrix.com> wrote:
>>
>> This used to be true, but was altered by commit 37786b23b027 ("x86/cet: Remove
>> writeable mapping of the BSPs shadow stack") which moved cpu0_stack into
>> .init.bss.stack_aligned.
>>
>> Fixes: 37786b23b027 ("x86/cet: Remove writeable mapping of the BSPs shadow stack")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

>> --- a/xen/arch/x86/boot/head.S
>> +++ b/xen/arch/x86/boot/head.S
>> @@ -652,11 +652,7 @@ trampoline_setup:
>>          cmpb    $0, sym_esi(efi_platform)
>>          jnz     1f
>>
>> -        /*
>> -         * Initialise the BSS.
>> -         *
>> -         * !!! WARNING - also zeroes the current stack !!!
>> -         */
>> +        /* Initialise the BSS. */
>>          lea     sym_esi(__bss_start), %edi
>>          lea     sym_esi(__bss_end), %ecx
>>          sub     %edi,%ecx
>>
>> base-commit: a8bf14f6f331d4f428010b4277b67c33f561ed19
> 
> Nice to know!
> 
> Acked-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Frediano, just FYI on the formal aspects here (which we don't always follow to
the letter, but still): If you had offered Reviewed-by:, Andrew would have been
fine to commit with just that. You can't just ack anything you're not
maintainer for (or really: you can, but formally it has no meaning).

Jan

