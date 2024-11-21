Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4495A9D4C22
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2024 12:39:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841425.1256911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE5Wk-0001iS-Hc; Thu, 21 Nov 2024 11:39:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841425.1256911; Thu, 21 Nov 2024 11:39:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE5Wk-0001g3-Dj; Thu, 21 Nov 2024 11:39:14 +0000
Received: by outflank-mailman (input) for mailman id 841425;
 Thu, 21 Nov 2024 11:39:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0oSv=SQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tE5Wj-0001ft-Dt
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2024 11:39:13 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38cabce2-a7fd-11ef-99a3-01e77a169b0f;
 Thu, 21 Nov 2024 12:39:09 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5cfcf4df87aso1054333a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2024 03:39:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cff44de5easm1749201a12.11.2024.11.21.03.39.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Nov 2024 03:39:08 -0800 (PST)
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
X-Inumbo-ID: 38cabce2-a7fd-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzAiLCJoZWxvIjoibWFpbC1lZDEteDUzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjM4Y2FiY2UyLWE3ZmQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMTg5MTQ5LjQ4NDQxLCJzZW5kZXIiOiJqYmV1bGljaEBzdXNlLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732189149; x=1732793949; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sQQYFckKR7i8Pp7p+uENb6vD4qdhzRZ2nVmgvgxnsJI=;
        b=XRnO9W86mKVP0pfFpw76WOfwRekd9p86LgJMOWyYh7Q5OXmGZor5ubQtKFWPHwxHHG
         tSOwxE7jvQBynF4iwwUpdrrD8PA+vNbHFGLKogV6YSe4FYTNTSIdI3tJoJ0mMMg/efh/
         tXNjBaoTeLnOWhZazbSjlnM6Ycy1RPBI3R1sX5OWZi1R1QaUul0plj6oBPnvL/tF5e5Q
         MrcboFan7PrkgbxkJVfM7UWMsXLEV95LXsu8531tUFlamwhKu3/+3S4UrVbR/F3ovUKB
         WdPpI62QyiWrOICIxcvgvAH4qd+a0zHmjlQu5CvrJIPClf1c6UDhcSBigQ6+62nD24EE
         9KvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732189149; x=1732793949;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQQYFckKR7i8Pp7p+uENb6vD4qdhzRZ2nVmgvgxnsJI=;
        b=RKdTmNhymsl5jZ65+dlXLbkyRNBkGq+SOmAu+PXJbEJw29gC6Zlop1vjR8DfYxSZHy
         vB61xdiqRhH1rRKyuRQKouVbKJvaatgBTdA8QGTDAoN5rGsiHTpCGvumeoF45sO7Mg+g
         h/P0JX0rRouxY8/mX/MYbEsORuM2B2+U437yfWxboH11pfxnHvX/vrRSs9U7LgUTOD/J
         MFi8Jl4PAaoK5zsGzVTrYH/fELeLcfSmB02yzXnrnfWnBRTZQlGPSjiuoeMo8S/N0zn/
         3wpWA4ZnI5K0UQ6BWtgzHBi6C+IDfsieMY8Jzu4Tl3DbjUp8v1hqrgLoo2uSBlxvJ1Ha
         BS5g==
X-Forwarded-Encrypted: i=1; AJvYcCW5aLTnhRMH0jqNH67+lnULLxcVrWNhFKai40uw05lpkq2pz7dqOMvR74feoNVBVdNpjOo38rwSG2g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YysuEU1lNZMX6/bm7kyc8Evg+i1HXJiy2mn5m5ymucpJjUbIIfo
	k6WFWYeTuZ0t9C4r4pAR2f5I5rUcjR4aXBMyyP2f1Q9NVS8nbm+//Hbr/9OBGg==
X-Google-Smtp-Source: AGHT+IE/WHDsBF7A8Nl4XdZMrjrMccybyNAX2IEyxMfeDyg3LK6hqgbgoUYi6QULdLgazAN8FPZiRg==
X-Received: by 2002:a17:907:9709:b0:a9a:478:2ee3 with SMTP id a640c23a62f3a-aa4dd71e851mr650827266b.40.1732189148931;
        Thu, 21 Nov 2024 03:39:08 -0800 (PST)
Message-ID: <f0c0cdca-e6a8-47c9-934a-85a91609e9e7@suse.com>
Date: Thu, 21 Nov 2024 12:39:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/irq: fix calculation of max PV dom0 pIRQs
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20241120113555.38146-1-roger.pau@citrix.com>
 <20241120113555.38146-2-roger.pau@citrix.com>
 <b849f46d-501a-4083-aecd-fdf0c4319eda@suse.com> <Zz8Tugu22NPzAQUo@macbook>
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
In-Reply-To: <Zz8Tugu22NPzAQUo@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.11.2024 12:04, Roger Pau Monné wrote:
> On Thu, Nov 21, 2024 at 11:49:44AM +0100, Jan Beulich wrote:
>> On 20.11.2024 12:35, Roger Pau Monne wrote:
>>> The current calculation of PV dom0 pIRQs uses:
>>>
>>> n = min(fls(num_present_cpus()), dom0_max_vcpus());
>>>
>>> The usage of fls() is wrong, as num_present_cpus() already returns the number
>>> of present CPUs, not the bitmap mask of CPUs.
>>
>> Hmm. Perhaps that use of fls() should have been accompanied by a comment, but
>> I think it might have been put there intentionally, to avoid linear growth.
>> Which isn't to say that I mind the adjustment, especially now that we don't
>> use any clustered modes anymore for I/O interrupts. I'm merely questioning
>> the Fixes: tag, and with that whether / how far to backport.
> 
> Hm, sorry I've assumed the fls() was a typo.  It seems wrong to cap
> dom0 vCPUs with the fls of the present CPUs number.  For consistency,
> if the intention was to use fls to limit growth, I would have expected
> to also be applied to the dom0 number of vCPUs.

FTR: My vague recollection (it has been nearly 10 years) is that I first had
it there, too. Until I realized that it hardly ever would have any effect,
because of the min(). And for Dom0-s with extremely few vCPU-s it seemed
reasonable to not apply that cap there.

Jan

