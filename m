Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5493A7A277
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 14:07:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936748.1337923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0JLZ-0007OL-Ei; Thu, 03 Apr 2025 12:07:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936748.1337923; Thu, 03 Apr 2025 12:07:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0JLZ-0007M4-Ba; Thu, 03 Apr 2025 12:07:01 +0000
Received: by outflank-mailman (input) for mailman id 936748;
 Thu, 03 Apr 2025 12:06:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lWYu=WV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u0JLX-0007Lw-La
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 12:06:59 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24a4aba7-1084-11f0-9eaa-5ba50f476ded;
 Thu, 03 Apr 2025 14:06:58 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43d0782d787so5195775e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Apr 2025 05:06:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ea8d1673dsm63722155e9.0.2025.04.03.05.06.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Apr 2025 05:06:57 -0700 (PDT)
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
X-Inumbo-ID: 24a4aba7-1084-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743682018; x=1744286818; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oUOEEAT0fdYR1j+yOGrKrOC7UgZ4pcUGyDF96IOo+iQ=;
        b=Q7qsLqA2hBW1+qj38AJ0y/r/w1UXCkblpkxJS8Z/sxjaam1FMmWhCIeFTqp7TUDVnd
         Waa73VxRLOh51v2L/iAHQoTZ36sQVHe3ruhI192u4Q+S9+IIX/0hkzFidjy+trushFfk
         AWwPPBRxKyhV1t+9/ltMQJD0bKRWtmDY0GbGvfAxKMt+JJKPNxl5SsFfsQSuO4aeJUzx
         wbr3Q3U/QhzdZvOptt8mfiDtI9JG7ijPsyMQP3wG5w+kixRheqt1FcsuGNp7I2Wkkojv
         ClCSLkKKYt4dALyR6K7l9fzm44EnIDNcRKY0cAi7NjjknKkfGZ0mZ059Qu3smQmZMAfp
         Q0wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743682018; x=1744286818;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oUOEEAT0fdYR1j+yOGrKrOC7UgZ4pcUGyDF96IOo+iQ=;
        b=iHt4jMgj5nR03KBvcGbRug7FprLFb90j1QqoNaHTShl6sReVAd45KO2TJLr3zA/MW7
         lv+EcBhskeCcYmy3guZnbsXQjAh77X97UwGdjUjxkH2d4TA0FjuGF3rWLivVYQZqG+2b
         9qZFVlHS4LMwOPrHA2O91y8go+qHA/5im8tE6T3NU4cJfsmj/NK/uReooHAybA+pETqq
         y4Wy+1yXS46W5NIHgKzT5qOim3VeLcUAerwKxaIhn5H05vYSTdwtJpaFcoAtcpei1+Pt
         ZxyJWEKk6Lp6yxM+kx6Hc9LN4GGI8/ewfcvkp07j49RjPJhxsqfMb9kykAIXffwPRUn1
         Cy1g==
X-Forwarded-Encrypted: i=1; AJvYcCUSSGYwlsv6U+hRlYusDIROB680eDK+EBT8Ip/s66TM9g8g+csSoLeeftxqLk9CGDXhkyL44kYwBTM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzFhV+ZEITfAa5tnVLpiIUwkVO/2fKGOLzthvMSsIP+HvuQphlF
	hzBEAT3UIaIVD2ICH4K2Wv4UtiaqhqIvcTXGwPaRxACExCdY+nSQuf8xT6QhxA==
X-Gm-Gg: ASbGnct54eP9TLfXZ/y1LSfnBrXxQuKCpfA45YYyysEH5J0mTEthgU6cxMFj8ZpBSFu
	C3C2IV4rLHUNWOxtvapS1+0c2/0JIJPPHlj6OUTRzelPWe0ceh1nSG8rUBdHF27uNoK9MzNmciJ
	0i2HTN0RIhmJXHOOunwXSAQiq/V2LF1tQ5JvtijyrufjJrwkhqIQj8CPUkN2fgk3FgkmE1RpcHt
	LNZtdhzPFfRB9AZ7yITkR5lqYNCaA2eCSMN1VVWW2gVMj36Ddox+/vWwBaYnSnpj2QFqdQz96sH
	yh/6SmQZ1bEz3ueL3L7gJFfsJO5mT+/uiyi/dU48CW4mv24pucEtEYhTblTBT6cDhK4DGW6TQ7P
	aTUcV4P0TRNDTPX68nM2E+xqeHrd9FUIERP+Ts00l
X-Google-Smtp-Source: AGHT+IGGEZvIwxMbdelq1TpjPwnitRk0RvL7PSiSTkCyTEwrYm0b/X77NTIKN9hiauMpV1B05XBwPg==
X-Received: by 2002:a05:600c:1382:b0:43d:b32:40aa with SMTP id 5b1f17b1804b1-43db61dc79bmr198048405e9.3.1743682018065;
        Thu, 03 Apr 2025 05:06:58 -0700 (PDT)
Message-ID: <3928bdd8-56d8-489a-ba6a-42ca3d93964b@suse.com>
Date: Thu, 3 Apr 2025 14:06:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: re-order .init.data contributions
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b0266c19-d0e5-4de7-b2fb-a50e2766168c@suse.com>
 <b8200dc3-35a9-4ae5-a345-45f4c6143e55@citrix.com>
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
In-Reply-To: <b8200dc3-35a9-4ae5-a345-45f4c6143e55@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.04.2025 14:02, Andrew Cooper wrote:
> On 01/04/2025 6:56 am, Jan Beulich wrote:
>> Putting a few bytes ahead of page tables isn't very efficient; there's
>> a gap almost worth a full page. To avoid re-ordering of items in the
>> source file, simply put the few small items in sub-section 1, for them
>> to end up after the page tables, followed (in the final binary) by non-
>> page-aligned items from other CUs.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/arch/x86/boot/head.S
>> +++ b/xen/arch/x86/boot/head.S
>> @@ -136,6 +136,7 @@ multiboot2_header:
>>  .Lno_nx_msg:   .asciz "ERR: Not an NX-capable CPU!"
>>  
>>          .section .init.data, "aw", @progbits
>> +        .subsection 1 /* Put data here after the page tables (in x86_64.S). */
>>          .align 4
>>  
>>          .word   0
> 
> Just as a note, this depends on the toolchain baseline bump, so can't be
> backported.
> 
> Clang-11 does now like subsection, so we can remove the !__clang__
> specialisation for UNLIKELY_{START,END}_SECTION.

Funny you should mention that: I did check before even making the change, and
in assembly code we used .subsection already before. We just needed to be
careful about inline assembly. See UNLIKELY_START() vs the two forms of
UNLIKELY_START_SECTION.

Irrespective of that: I had no intention to backport this.

Jan

