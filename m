Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 487CDA65230
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 15:01:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916943.1321951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuB1V-0003TJ-AB; Mon, 17 Mar 2025 14:00:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916943.1321951; Mon, 17 Mar 2025 14:00:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuB1V-0003S3-6k; Mon, 17 Mar 2025 14:00:57 +0000
Received: by outflank-mailman (input) for mailman id 916943;
 Mon, 17 Mar 2025 14:00:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuB1T-0003Ld-CB
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 14:00:55 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e340547-0338-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 15:00:54 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43d2d952eb1so9961815e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 07:00:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d23cddb2asm91452795e9.39.2025.03.17.07.00.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 07:00:53 -0700 (PDT)
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
X-Inumbo-ID: 3e340547-0338-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742220054; x=1742824854; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xWgXaWODrr+G3KRTJqH/TFZqkhlDaxqEhtsaNkOfvz4=;
        b=TfEQLglwgHRPqrN5n83a5TucAj6hQrOXrSCk8PnxU9CiGpWs/xJi/FEemxfUYgdyXC
         Ppay3+YcrWzLk4soFC/gie0WYfY+i/idYtouQsBS563ipRN37HWxNJzjtf4RhqAXIMQD
         KYn2k1ckA8upa+aLpECKRFrNiOZ8g33SAtF1k5GCudb+cqhi8Bg/ARN/erenC+k1tn2N
         A1Y8jPlTj6ceHmqDORlCAqh7SKEWjM3crrPJHTYq7NQq3PCdwvyCm4609yf3RCAEvq0p
         YS0jiHsILHQEqQ41YtWOmwmhb2bV3aZbGbYx0IbSxsd9Ge2JzMkrrM6wtxBZ5AH3RUjJ
         dmlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742220054; x=1742824854;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xWgXaWODrr+G3KRTJqH/TFZqkhlDaxqEhtsaNkOfvz4=;
        b=UCsS0yQdhGCOeis8AWFVK6UtAEeug2cXCk8+BRRdgI8/3bmcxqUtnPVW8jnQrQ+iJb
         ojLiA/vsr0wuR5f3t2MXC0/wRcO7mpwLTSrnS2J/hNRerCwxOnZX7owJhxATEQqLMe6h
         8R/xjz7R6o42nipToIGdzEorOkUHsrxcY0njkhmnFQ+8aAkT2UKa2qHSf82SViwFmZRT
         avH1s88EBBcOK6kClGY8zn2egGQFZRlEFM3wE6Vm5Cghk4y8k5BZ9nc+ohAXSD5jUfQv
         z/TnuAWXl1zKNk9ptr5zr7PLrGPfGVRaaYhBL6CzLbaeCaWvrof7uT/2BonFbLMXt8oN
         JXlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVc7tQQ7w5kj/jZQcWU1lNEPwGGPrNke3U9TrBzfktZpDcTRAmDCUjFtcsMo6janZd3t4Y7FKQ0mv4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YydYv+tfLQgZu/BEKtXs9qKDD6Vbmufq0k3ex4+0Kod+sF24urE
	9xptQVilj6Dxt73/sVAGfUsFPtT3cxhC4p9L6WH4snHlYkKMmyqfz/0Nw7G5nRhmWTVG5y0rqjU
	=
X-Gm-Gg: ASbGncun7Ac1qjSZysVgXYkfoqxi/OkqZgcGTHDmw9WnadcBa29c/+OpzCZkxWU+tYo
	+j1heEYGpqSqKxld+AQlvGq7Qy6E6qGkKJ0rOn9G076MwljH9eNlYWDZTPT0MQ5zNzdtPWWio6f
	9jM9HwVy1qw7Q9SNDj4mRfeiK7guuaveiaAQmYO8huz5CR3MJ2L4YEGOaJM8GLV15icvtWxg7gN
	AQBO56QbwoObC30VsVl0GLy8I2TN5e+WhVnllMeGIJpUmmso0XegU+XTS15CxDnDcv5PwPhQdgg
	K8KVHX4AFch1iQjYoydn2LhDh12GkXBEi9E9ww9ha4BaaVp6SP7a5O88Z7ZdD/x7vWj3IS3wU0v
	CFiyAzfj3pSDvlke2nLbEco5DmVROVg==
X-Google-Smtp-Source: AGHT+IGFyxl+7nOKsuI1pQgKgOiWsnysY2rC2Wn41L7v+XXAofvJRC0FJOiNA7dGpNfKgXi7HPMKDw==
X-Received: by 2002:a05:600d:1c:b0:43d:79:ae1b with SMTP id 5b1f17b1804b1-43d2018096amr141737065e9.14.1742220053462;
        Mon, 17 Mar 2025 07:00:53 -0700 (PDT)
Message-ID: <fc468e90-de5b-4478-a19a-d49602852abe@suse.com>
Date: Mon, 17 Mar 2025 15:00:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/traps: Drop incorrect BUILD_BUG_ON() and comment in
 load_system_tables()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250314183346.77356-1-andrew.cooper3@citrix.com>
 <5fa5f84b-0cae-4757-af06-155d68de3209@suse.com>
 <46821c0b-45ca-4016-a997-518ea29475c7@citrix.com>
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
In-Reply-To: <46821c0b-45ca-4016-a997-518ea29475c7@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.03.2025 13:29, Andrew Cooper wrote:
> On 17/03/2025 9:03 am, Jan Beulich wrote:
>> On 14.03.2025 19:33, Andrew Cooper wrote:
>>> It is only the hardware task switching mechanism which cares about a TSS being
>>> at least 0x67 bytes long.
>> I/O bitmap accesses are where this particular limit comes into play. For
>> 32-bit task switching a slightly shorter one would still do, I think?
> 
> Even by x86 standards its a terrible hack.  32-bit task switching
> mandates 0x67, even though the IO bitmap is not accessed for the
> outgoing or incoming task.
> 
> For IO accesses in general, a limit shorter than the IO bitmap pointer
> means no IO bitmap, and IO accesses in Ring3 take #GP.
> 
>>
>>>  Furthermore, since this check was added, the limit is now 0x6b if CET-SS is
>>> active.
>> Which isn't reflected at all in struct tss64: Aiui that's an addition to the
>> 32-bit TSS only.
> 
> 0x67 isn't relevant to tss64 either.  It's strictly for hardware task
> switching, which is strictly for 32bit.
> 
> 
>>> --- a/xen/arch/x86/cpu/common.c
>>> +++ b/xen/arch/x86/cpu/common.c
>>> @@ -900,8 +900,6 @@ void load_system_tables(void)
>>>  		wrmsrl(MSR_INTERRUPT_SSP_TABLE, (unsigned long)ist_ssp);
>>>  	}
>>>  
>>> -	BUILD_BUG_ON(sizeof(*tss) <= 0x67); /* Mandated by the architecture. */
>>> -
>>>  	_set_tssldt_desc(gdt + TSS_ENTRY, (unsigned long)tss,
>>>  			 sizeof(*tss) - 1, SYS_DESC_tss_avail);
>> All of the above said, the removal worries me primarily with the sizeof()
>> still in use here.
> 
> Xen uses IST4 but not IST5.
> 
> Xen could set the limit to 67 (== 0x43) and everything would continue to
> be fine.  In fact, this is quite possibly a better option than poisoning
> IST[5..7].
> 
> I'm deleting the BUILD_BUG_ON() because everything about it, even the
> comment, is incorrect for Xen.

Okay, yet then there's still that sizeof() use, and iirc that's the sole reason
why the BUILD_BUG_ON() was originally put there. Now we can of course promise
to ourselves that we won't ever edit struct tss64 in an undue way. On that
basis dropping one but not the other is perhaps okay-ish. Irrespective I think
that the better route would be to replace the other sizeof() as well. Perhaps,
as you say, to even lower the limit. (Provided that doesn't run into bugs on,
say, qemu. Given how well all of this is documented, finding bugs in emulation
code wouldn't be entirely unexpected.)

Jan

