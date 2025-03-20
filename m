Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B515A6A3B5
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 11:31:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.921639.1325427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvDBP-0000KI-Lt; Thu, 20 Mar 2025 10:31:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 921639.1325427; Thu, 20 Mar 2025 10:31:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvDBP-0000Hb-JA; Thu, 20 Mar 2025 10:31:27 +0000
Received: by outflank-mailman (input) for mailman id 921639;
 Thu, 20 Mar 2025 10:31:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B8C5=WH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tvDBO-0000HV-8C
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 10:31:26 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 793415d5-0576-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 11:31:25 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43cf034d4abso6298035e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 03:31:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c8e43244sm23953237f8f.60.2025.03.20.03.31.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 03:31:23 -0700 (PDT)
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
X-Inumbo-ID: 793415d5-0576-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742466684; x=1743071484; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SDvLG63LQvZ5h/c0fOhQVYpb2iNM5gpvtaO14f1Aa+U=;
        b=U9SY7+2M47AAY5AuX4jyobvBA6xn2xWVGBmfzV+gj0dMj6t9R0MNx4SvthRNiIk4v3
         eF6eqhHKC8EjBRcIbUuFG44BHzAvTsdjIliWl5UeGX7ImrU2mmGuO2xhJ47ehAyxn9Uy
         YrsseuOz+PkBCo3bKIMWTqgYjjw4Qqel01Kl9VfesQUUb0kQ2vOwRDfFz+pyUG2/C/2a
         8cQZinuq71Lww4He5/pRG00XTMNt743+wLR6/J/DMR5h8foNtygri0SzPT1p2+I9wnqK
         1l/QOtii4I3OxkVBjQmlculCPjzPVSTensfBo5prEzGnZpwXiqNscOiiELYh6lN6GZ7l
         Tk9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742466684; x=1743071484;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SDvLG63LQvZ5h/c0fOhQVYpb2iNM5gpvtaO14f1Aa+U=;
        b=XWdMPCUDhVseAlsQZQiwQG53P/9g8/FXuYw02waf/43B7Ib9Txp5kUNkQBX1D35S5y
         iNPS2csT0wcc0DjR1fYBLYWpQKYZqX8vg0mT4K9dCB7xrL2ddSZyFQT4RN4eG+HoJ7pN
         s2OzSriub8Abi166DWWqWDkG87X/mDWN/HvReSjqR5EsK6WFM2qfqGf3Z7AEkehmfBsZ
         /AH7y3i0QGkYw6f6G7eJdWR5d2vpo3UyEYjmQvonVguOctvMiydAjVmRKJgI6OaOjfr7
         qywLI8ICSbgCnSruL/8EYKRxhSoOyB9bxXqqiUU22sedz65Q5AML1SOzz701K+RDjhuy
         lHXA==
X-Forwarded-Encrypted: i=1; AJvYcCVL+x2wXLqBbq0sxCZ5VQPMVR0EzwwqoBftNbzz0Ybb9XhM2gYHawMn4wijz9thkoS/9kuDI4wSZgM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzBPiZlsvOK+9Ky9c+dV2Ppj7H8HQ0oXtCH6CwiUCcSnUZ3zeYi
	+cqqCf9/cjbrgzZOLnZD0CrpbHFg/yB+8KBGvKyv6uMG+tZURHHKPegyxg5XPw==
X-Gm-Gg: ASbGncvYwxYCwfdT14hg2d5QNLEWNWzUg2M3V/jc0i4jEpJ+OW7vLU+xoiE37JAkQXD
	+eetQv/RT/Yn2QjRxWZsskOQNACFPOXWEfMfbYyOeDnHZn6Kz4X8BmAf1st3kg+9ytjU6xHxQyM
	aWgUQR330aa7fZIfxk3BRmQ6Lc4zBQ1V0y1erCx0jhr16KomZGS20+7TN9o7Otpk5S231YKOji6
	QadErS6/HKaBcbs9LCYglSFa1BTuYRk23u+kUExnxIkcjKmTXOdW8tEwykURM5atU6ivmwSGVMO
	AmA0GdbKpnCDjan5uCwPXYlTOQRHgzolcuSNgqMOTEUa+7rBw5tKJPX9QwYCBmvWAMQxONevODH
	+QkrmG649QgdlDD9UvxIm1uy8JkDPUYTXpc0R40Zj
X-Google-Smtp-Source: AGHT+IHYWE/BUAjiy++fvaKweQGWFENROPGKN7qQC4PgvfI5hyyAG5dzIxJ5dR2blD+YxGv4JDrKJw==
X-Received: by 2002:a05:600c:3206:b0:43b:c284:5bc2 with SMTP id 5b1f17b1804b1-43d4870d738mr25217675e9.0.1742466683969;
        Thu, 20 Mar 2025 03:31:23 -0700 (PDT)
Message-ID: <7a1e9fdc-c1ec-449c-bf49-70bbc8e9c352@suse.com>
Date: Thu, 20 Mar 2025 11:31:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/16] xen/arm: introduce a separate struct for watchdog
 timers
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Mirela Simonovic <mirela.simonovic@aggios.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>, Mykyta Poturai
 <mykyta_poturai@epam.com>, Mykola Kvach <mykola_kvach@epam.com>,
 xen-devel@lists.xenproject.org
References: <cover.1741164138.git.xakep.amatop@gmail.com>
 <18a8a86ca0c1b884278d635fb18b3b53e062f10e.1741164138.git.xakep.amatop@gmail.com>
 <ddbf31ae-5877-4df2-a6c7-8b0251ce2b01@suse.com>
 <CAGeoDV_h9vgyKyk_kH4XwsoWiJN0dx2UY+N0JAezUknGk9ez3g@mail.gmail.com>
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
In-Reply-To: <CAGeoDV_h9vgyKyk_kH4XwsoWiJN0dx2UY+N0JAezUknGk9ez3g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.03.2025 11:25, Mykola Kvach wrote:
> On Thu, Mar 13, 2025 at 5:27 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 05.03.2025 10:11, Mykola Kvach wrote:
>>> From: Mirela Simonovic <mirela.simonovic@aggios.com>
>>>
>>> Introduce a separate struct for watchdog timers. It is needed to properly
>>> implement the suspend/resume actions for the watchdog timers. To be able
>>> to restart watchdog timer after suspend we need to remember their
>>> frequency somewhere. To not bloat the struct timer a new struct
>>> watchdog_timer is introduced, containing the original timer and the last
>>> set timeout.
>>>
>>> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
>>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>>
>> A From: with no corresponding S-o-b: is potentially problematic. You also
>> can't simply add one with her agreement, though.
> 
> Thank you for pointing that out! I'll revisit all commits and add the missing
> Signed-off-by tags in the next version of patch series.

Ftaod - you may not add anyone's S-o-b without their agreement.

>>> ---
>>> This commit was introduced in patch series V2.
>>
>> Yet, btw, the whole series isn't tagged with a version.
> 
> Yes, I added a description of the versions in the cover letter and
> followed the style
> used in version 2 meaning I avoided using tags. Since years have passed between
> the patch series, I thought including tags might confuse reviewers.
> If you want I'll add a correct tag in the next version of this patch series,
> i.e. V4 instead of V2.

Yes, no matter how much time has passed, versioning is helpful and
meaningful.

>>> --- a/xen/common/keyhandler.c
>>> +++ b/xen/common/keyhandler.c
>>> @@ -305,7 +305,7 @@ static void cf_check dump_domains(unsigned char key)
>>>          for ( i = 0 ; i < NR_DOMAIN_WATCHDOG_TIMERS; i++ )
>>>              if ( test_bit(i, &d->watchdog_inuse_map) )
>>>                  printk("    watchdog %d expires in %d seconds\n",
>>> -                       i, (u32)((d->watchdog_timer[i].expires - NOW()) >> 30));
>>> +                       i, (u32)((d->watchdog_timer[i].timer.expires - NOW()) >> 30));
>>
>> I realize you mean to just do a mechanical replacement here, yet the use of
>> u32 is not only against our style (should be uint32_t then), but it's also
>> not clear to me that this subtraction can't ever yield a negative result.
>> Hence the use of %d looks more correct to me than the cast to an unsigned
>> type.
>>
>> In any event the already long line now grows too long and hence needs
>> wrapping.
> 
> Maybe it would be better to send a separate patch for this. I'm not sure if such
> changes are needed within the scope of this patch series

Simple style adjustments on lines touched anyway are generally fine. That's
better than having individual (huge) patches adjusting only style, at the
very least from a "git blame" perspective. And when avoiding such, moving
towards more modern style can only be achieved if code being touched anyway
is getting modernized at such occasions.

Jan

