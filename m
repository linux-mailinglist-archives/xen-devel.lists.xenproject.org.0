Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB0B924042
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 16:16:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752514.1160746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOeJ4-00051B-Re; Tue, 02 Jul 2024 14:16:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752514.1160746; Tue, 02 Jul 2024 14:16:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOeJ4-0004yg-ND; Tue, 02 Jul 2024 14:16:30 +0000
Received: by outflank-mailman (input) for mailman id 752514;
 Tue, 02 Jul 2024 14:16:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WXFQ=OC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sOeJ2-0004wm-Kf
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 14:16:28 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab1a42f1-387d-11ef-aaf1-7f3abd7486c0;
 Tue, 02 Jul 2024 16:16:26 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2ebe6495aedso45768491fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jul 2024 07:16:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fb0e3326f7sm1132955ad.105.2024.07.02.07.16.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 07:16:25 -0700 (PDT)
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
X-Inumbo-ID: ab1a42f1-387d-11ef-aaf1-7f3abd7486c0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719929786; x=1720534586; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WjHVNV/Z3Z6hFdefiRUGPfdlh8VnrTiKVM95SieSxcQ=;
        b=fG3/eNAXoBbUalp34m4GmcXP7586sd+7gpcyp5mwNOKu/fuprw7YtJjdOuCSaDwDi5
         IU/g8OnnDbjwR7pSMff7FGzytE6CLO8byC/GGx44oBvCr/1VSOlVa5GKzp+T/9Eoolg2
         +zuUxRYRpUNRiRLr8lm1HIjwdox/xGPtyvEVdR+mZUebIi8d1ahRAAqg3ev/f0gF+Oq9
         Eq3Xvr8SeAiWEf/rdiaArh0hZT/Vt3fzj57EG6eXgPDhJ07icczJVWi9L3m+IuXcxOJ5
         4MgKAFeXo1qbATR+wpFiuReAhYAc5O8xtleVIR1Z3vFTUM9ZFyyXvVh/vTG5GFf++BQp
         nwCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719929786; x=1720534586;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WjHVNV/Z3Z6hFdefiRUGPfdlh8VnrTiKVM95SieSxcQ=;
        b=IVdgJmDJ9DAa+9su2ElceYGn5inJrkFfeQynqPKW5vapE1zBeaw3wSv3uaimLAmC3q
         gtSeM2CyOa9YySb1UKr/hfK9gcmYzrpfkVrWBQR90POhZVUDhCwlZpeDcjVBUxg1Q1WN
         kObWVvi5QoGwRoF1weB0On3wKYPlyhpdiLmGrCi/M8ePQGEY0hmCZUsijwUDY2IdX4MR
         BwX1MSfB13jWNc2W6X13ZVxaubj6FuXJ6afL59giR1RCpuPaeANlLt/9nMzvBncGKsDN
         XptzCdV6FQKAVnm5LKVGmdVKsftj4i1BK+1jtg9VNWelmjRxuWPxVaNF0JS8F5RxyyQ0
         jCdw==
X-Forwarded-Encrypted: i=1; AJvYcCWPWZWeknpNuGjuSINeqjtL7T5k7G5mkrGmi1qDTa+E5iH2Mk0jKBM9/Y9DubhtrCm6XYbX2Gqf5KbgCWReSA1lhWR4jQxBeGR69P+k3Vo=
X-Gm-Message-State: AOJu0YxR1ajRDoyIqFvjBuyqyecZnalRdTyUdOBbSW692DSQ7k3Cgilh
	xmxr1CeqTqGTtuJx3URbMbjw/jETogveZWptguqYplTnDu/3IBRqhDx+DbPn0w==
X-Google-Smtp-Source: AGHT+IGtu6zHCV6++NlrrhOY18SUMpI3cGi2m20b2MTgudO3noR7Pdbe5Z4iR8iQJ13LetJYM3rH9A==
X-Received: by 2002:a05:651c:54a:b0:2ec:5172:dbbc with SMTP id 38308e7fff4ca-2ee5e37e7acmr74742771fa.5.1719929785931;
        Tue, 02 Jul 2024 07:16:25 -0700 (PDT)
Message-ID: <2e284cad-d5de-467a-9d5a-19a1a31615cf@suse.com>
Date: Tue, 2 Jul 2024 16:16:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 1/9] xen: introduce generic non-atomic test_*bit()
To: Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1719917348.git.oleksii.kurochko@gmail.com>
 <2f60d1fd7b3ac7d603486ce03a112d58352bf16d.1719917348.git.oleksii.kurochko@gmail.com>
 <baae2108-675a-4e83-84b3-c791e57c3509@amd.com>
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
In-Reply-To: <baae2108-675a-4e83-84b3-c791e57c3509@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.07.2024 15:11, Michal Orzel wrote:
> Hi Oleksii,
> 
> On 02/07/2024 13:01, Oleksii Kurochko wrote:
>>
>>
>> The following generic functions were introduced:
>> * test_bit
>> * generic__test_and_set_bit
>> * generic__test_and_clear_bit
>> * generic__test_and_change_bit
>>
>> These functions and macros can be useful for architectures
>> that don't have corresponding arch-specific instructions.
>>
>> Also, the patch introduces the following generics which are
>> used by the functions mentioned above:
>> * BITOP_BITS_PER_WORD
>> * BITOP_MASK
>> * BITOP_WORD
>> * BITOP_TYPE
>>
>> The following approach was chosen for generic*() and arch*() bit
>> operation functions:
>> If the bit operation function that is going to be generic starts
>> with the prefix "__", then the corresponding generic/arch function
>> will also contain the "__" prefix. For example:
>>  * test_bit() will be defined using arch_test_bit() and
>>    generic_test_bit().
>>  * __test_and_set_bit() will be defined using
>>    arch__test_and_set_bit() and generic__test_and_set_bit().
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> 
> with one question...
> 
> [...]
> 
>> diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
>> index 6a5e28730a..cc09d273c9 100644
>> --- a/xen/include/xen/bitops.h
>> +++ b/xen/include/xen/bitops.h
>> @@ -4,6 +4,19 @@
>>  #include <xen/compiler.h>
>>  #include <xen/types.h>
>>
>> +#define BITOP_BITS_PER_WORD 32
>> +typedef uint32_t bitop_uint_t;
>> +
>> +#define BITOP_MASK(nr)  ((bitop_uint_t)1 << ((nr) % BITOP_BITS_PER_WORD))
>> +
>> +#define BITOP_WORD(nr)  ((nr) / BITOP_BITS_PER_WORD)
>> +
>> +#define BITS_PER_BYTE 8
> Shouldn't you remove the same macros from riscv and x86 config.h ?

Oh, good that you spotted that: This wasn't supposed to be here anymore.
Iirc we settled on this specifically wanting setting by each arch.

Jan

