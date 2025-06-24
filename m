Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBC3AE5E9D
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 10:02:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023282.1399237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTybZ-0008AE-Tz; Tue, 24 Jun 2025 08:02:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023282.1399237; Tue, 24 Jun 2025 08:02:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTybZ-00088O-Qy; Tue, 24 Jun 2025 08:02:09 +0000
Received: by outflank-mailman (input) for mailman id 1023282;
 Tue, 24 Jun 2025 08:02:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uTybY-00088I-Qe
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 08:02:08 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8601fbcb-50d1-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 10:02:07 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a589d99963so4873338f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 01:02:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d8664f0esm101196515ad.159.2025.06.24.01.02.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jun 2025 01:02:06 -0700 (PDT)
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
X-Inumbo-ID: 8601fbcb-50d1-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750752127; x=1751356927; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0pxYU9k82gDdxrz2FGnKvbqTeEJcdt1/BVM28t12BPw=;
        b=Ee+CnrXrn/biHH4UbxuQ5TCgn/+AbqB9FoKDAMFJZgqqcIMp5+FWzlWZZnhBh9awMu
         hAQV+x5HEZYwPqAyJVhLtKLK0X5dY3cssTsFJAKnPep6aMGR9r/sx8+PzGMPk9b9an3c
         ffcRrypYGppzE+TQScwh1dVvE4dSXOd0dillob07xxhxTrlSYe0wBJVxqLaakDnijwmH
         tH0BAhkHe3lPW887CigXyV0z8rX8y8Sdfljd8zu0w6QsjkbirfTlV5QkcMMYTWFyLXWz
         B9VIYSwF4Rjz+yJkpOjsUl7dJE40lTtzNk+xqUZtfQb8Y9JcG4esPRivM7VK7LfiL84j
         BZeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750752127; x=1751356927;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0pxYU9k82gDdxrz2FGnKvbqTeEJcdt1/BVM28t12BPw=;
        b=O/8WPiFtQz+AUXgcVN19dPyOf6Bokj0ESItiCouTVKsjeTolXC7e9vyej1kZVvcOrd
         2xAcFMQUJ/0ug3XYuJYtAXOv1Q9d/8mI9++PqUsclMOd7C7n5WqVV3C9sbINczd6n3k3
         OzZNKQlCYWFaw8ChxgTnVNDr7ds8k1rO/MRXUr4mKqP52R2627SWtwiUUsbFCQFgz8XI
         cco6Xrv6/NfmemGgTxBKkxZJyC9TxWKZ9cHXP4NYEc0GCpE9UmRCCsGlevr/VIRI5AvP
         VBLL1b9ZcK5zVt43FiPCtNp3inVSWbM/dLUCfBI4it4dbAN5pSwH+IbkvTdabmR1BCsd
         t01g==
X-Forwarded-Encrypted: i=1; AJvYcCVUfm/KkYaToN92+NGPKuSq2k4J2pbF9ajB5l4M8f2QEIQKQ0FXMPoAVaZblmfSwD6K0p4FqR3Z3Lg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywr+/PkgERruwdsMd+ydbnTaUuR2brfQ3g+FdxVB/Dhy/WOzZrz
	jvNYmeV7/YdVg2gL8unNcjTeMMv9TwmsLWlElikqg8iXIW2XJbMsr1G8gdlp1NjuiQ==
X-Gm-Gg: ASbGnctwPwaemXPpE1TgBoB1TNihcoy9zKB/XQKHYR9zs2bBpE8ZyK3/n12X+cbQIc5
	ArTxzYgO7kq2GW2l7uaAnz61CIblTz0e/Xxr/KIHtYk7yTeQ5QRt1MTI5F2SZ8X+vEwsNLRoG4A
	0KlfwESc9O4rcuBgkLlKK70/yhx4UI2bkpvqM023kioDdnA3W8sLEOKTaPV6ETwf8tk6YI9CXRc
	4v13NggObVAY+DtlIUMX1vjz3ZEHFPEKT0ex+OmoH8ufxafpcQac13vu9WwtkJd4sU9QlbTKSZv
	xKRuLRcyxIvWJfGcw8VbC47hPuNiRLkRKbV+EzpCiNYTFsVrIgS7P66cBKvrja5OJeWL9zgdp+d
	fr2UfKSC5mw5FzSE9NlpFdn6yD32rO1iKbyBvy67DAi0FE4c=
X-Google-Smtp-Source: AGHT+IGa8ybs9SCidA+M+B6GTihe1AeTOh/o05eOY0aPpSDLr8F/0E/ZxfhiOG5F9sSSnQ8MfGufFw==
X-Received: by 2002:a05:6000:144b:b0:3a5:1471:d885 with SMTP id ffacd0b85a97d-3a6d12ec3f6mr13602383f8f.56.1750752126954;
        Tue, 24 Jun 2025 01:02:06 -0700 (PDT)
Message-ID: <35d1546a-d09c-44bf-9fbd-911604c1dd5a@suse.com>
Date: Tue, 24 Jun 2025 10:01:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/EFI: Fix detection of buildid
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250605111638.2869914-1-andrew.cooper3@citrix.com>
 <20250605111638.2869914-2-andrew.cooper3@citrix.com>
 <0a314400-126a-4c2a-b36c-dda61bb0b751@suse.com>
 <a477369d-77d0-48fa-8ac4-120d49e32d11@citrix.com>
 <4d1f1b70-e309-453b-bae6-e066d49a417a@suse.com>
 <9200277c-aa8e-4fd9-ab6a-f9e106114f54@citrix.com>
 <6eaf2b27-969a-4326-9726-8b6e0994e006@suse.com>
 <3f9c5a18-2ea1-4e2d-80a0-773abc3598ae@citrix.com>
 <ab3ad5c1-fd4c-4fa4-abfd-89641173a862@suse.com>
 <f2092e8a-2f13-40c5-b961-8a15d8298387@citrix.com>
 <134c69c8-ccff-475c-8bf7-241ec4805754@suse.com>
 <6690e6cc-60e8-4258-af80-1c8a56e76cb1@citrix.com>
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
In-Reply-To: <6690e6cc-60e8-4258-af80-1c8a56e76cb1@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.06.2025 22:18, Andrew Cooper wrote:
> On 16/06/2025 7:27 am, Jan Beulich wrote:
>> To expand on my earlier suggestion (ab)using the "efi" global: With
>> the linker script having this
>>
>> #ifdef EFI
>>   .reloc ALIGN(4) : {
>>     __base_relocs_start = .;
>>     *(.reloc)
>>     __base_relocs_end = .;
>>   }
>> #elif defined(XEN_BUILD_EFI)
>>   /*
>>    * Due to the way EFI support is currently implemented, these two symbols
>>    * need to be defined.  Their precise values shouldn't matter (the consuming
>>    * function doesn't get called), but to be on the safe side both values would
>>    * better match.  Of course the need to be reachable by the relocations
>>    * referencing them.
>>    */
>>   PROVIDE(__base_relocs_start = .);
>>   PROVIDE(__base_relocs_end = .);
>> #else
>>   efi = .;
>> #endif
>>
>> where only the #if applies to xen.efi, can't we (ab)use the combination of the
>> other two symbols here to decide between xen.efi vs xen.gz?
>> __base_relocs_{start,efi} won't possibly be equal for xen.efi, except in an
>> extremely theoretical situation (and we could cover for that case by an ASSERT
>> in the linker script). Pseudo code:
>>
>> #ifdef XEN_BUILD_EFI
>>     if ( __base_relocs_start != __base_relocs_end )
>>     {
>>         ...
>>     }
>> #endif
>>
>> IOW that #if could simply replace the CONFIG_X86 one that's there right now.
> 
> That's horrifying.  Also you can't include efi-boot.h to get the
> declarations.

The declarations could be moved, but ...

> But given that you are adamant that the (...) in there containing a
> CodeView check is unacceptable to have, why does wrapping it in yet
> another conditional make it ok?

... hmm, yes, there'll still be unreachable code there. I guess I'll shut
up here and leave this to the EFI maintainers. Just as long as there's not
going to be any Eclair / Misra fallout.

Jan

