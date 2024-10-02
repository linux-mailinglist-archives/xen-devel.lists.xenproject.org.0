Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B73098CFE1
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2024 11:14:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808653.1220626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svvR8-00066A-Ot; Wed, 02 Oct 2024 09:14:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808653.1220626; Wed, 02 Oct 2024 09:14:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svvR8-000641-MC; Wed, 02 Oct 2024 09:14:22 +0000
Received: by outflank-mailman (input) for mailman id 808653;
 Wed, 02 Oct 2024 09:14:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RwxN=Q6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svvR7-00063v-44
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2024 09:14:21 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4bc5da1-809e-11ef-a0ba-8be0dac302b0;
 Wed, 02 Oct 2024 11:14:19 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5c88b5c375fso5279031a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Oct 2024 02:14:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c88240bcb3sm7320726a12.35.2024.10.02.02.14.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Oct 2024 02:14:18 -0700 (PDT)
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
X-Inumbo-ID: b4bc5da1-809e-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727860459; x=1728465259; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Es+cx9QAvki3uwZVvw/d1lfPnyI3DqKr0wQF1TFNloE=;
        b=IDErZy7EIqnIyCm2SRyI/+11tvSztXZAOQ4iqABC9Z6z8b9d9vpVo0fltHP3CiCthu
         FhFAtnc3Y3DHika63RDvdLryIy9Qvk+5WvZGE2wWIoKj2xMLtPLqkiZRdaEgcb65gvjb
         KtoRsgE1JBWGlHwPk5KRAqZZzCvnXhqnCYjkrI0ot5E6MpVBRNVDLAY25GPS2W/Fh+2s
         MnsJ3rUbftEmsNMdWsW/PsTS5WqkVG5ZWoSsFJQ7HREYU1hE+0xKWvatNdv04SOSF0lN
         PcYZRwk4gHM21neTgO7CYXio4mo+v17cht6feyDZurytWjumiC2RU4lQiekBPUxPEbsW
         RZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727860459; x=1728465259;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Es+cx9QAvki3uwZVvw/d1lfPnyI3DqKr0wQF1TFNloE=;
        b=v8oNfnpE/cAanM8Kl1O69v55yGy2qzeCyGRjOhsowS2ntbmz27ckzVzsfg5ekpkCaL
         5tCV0++PwRxGer+rrOG5+AzqLWedRlwuAeomBsQBNTpCx8zCWS0ktEavkp6wqNFsVMMs
         D1xHGydbS7sFkTMLRL3wwalybJcKYQN8F/3LSTGKNrwYvA9im8xxQUNigd5VHSFa9GcS
         mbgJUn3aZcRst+TD0Vf7mPOLTTst52geAeIbUPUgpjghrWidqecPXgunTAhseBGqUUXF
         LLxGnVtyedJE0XP8mJn0/F/tu8OcuBqHnfxQZUVIMUkDPp2xd8pZ4hOgIcV3LjoddQJV
         wTqg==
X-Forwarded-Encrypted: i=1; AJvYcCVoCVXxxMnGbkbPXfcRZVErTDun6inBz585ceMB3AioYbLrtfAQRKQLcJ1uUw1FSIXvNZGBGgRdW8A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzyGDQuvo3tI0vSEIysv319bsgnUAp6X4nP2HIkrQ1SvvRbtDQm
	pGJNr8i9GQ/ogmIDqdodtGlc6iAh8lgWF/IFxAhKiKXJ6i13gp7LEoOvpWQH8w==
X-Google-Smtp-Source: AGHT+IFiIUyNq73VSAnR1UvI4/HOpH1YhKIqXig370+VQJsgt1sR1QRNlE5QlDKBS1rOy57F2c43RA==
X-Received: by 2002:a05:6402:1d55:b0:5c4:4e2b:7553 with SMTP id 4fb4d7f45d1cf-5c8b191d271mr1949151a12.10.1727860459159;
        Wed, 02 Oct 2024 02:14:19 -0700 (PDT)
Message-ID: <123070a3-0d45-4165-8343-a2fe7c235d0d@suse.com>
Date: Wed, 2 Oct 2024 11:14:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/ACPI: annotate assembly data with type and size
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <26cfd90a-91f2-4bf4-9607-8ab6c7823048@suse.com>
 <d3fbcc9a-b85c-4cde-8559-e726670dbedb@citrix.com>
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
In-Reply-To: <d3fbcc9a-b85c-4cde-8559-e726670dbedb@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.10.2024 11:07, Andrew Cooper wrote:
> On 02/10/2024 8:41 am, Jan Beulich wrote:
>> Further use the generic framework from xen/linkage.h. While there drop
>> excess alignment and move to .bss.
>>
>> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Of course alongside ASM_INT() we could introduce ASM_QUAD() and
>> ASM_QUAD_LOCAL() (only the latter needed right here) to aid readability.
>> Thoughts?
> 
> Honestly, ASM_INT() hiding a .long is confusing enough already.
> 
> ASM_C_{INT,LONG}() wouldn't be as bad.  At least they're clear about
> being a particular type in another language.

I don't think the _C_ would add much; we all know C is the language Xen
is written in. ASM_LONG() / ASM_C_LONG() would not be generalizable, i.e.
couldn't be put in xen/linkage.h without arch customization, as that can
neither expand uniformly to .long nor to .quad. It's all solvable, but
would be getting involved.

>> --- a/xen/arch/x86/acpi/wakeup_prot.S
>> +++ b/xen/arch/x86/acpi/wakeup_prot.S
>> @@ -1,3 +1,5 @@
>> +#define DATA_FILL 0 /* For the .bss contributions at the bottom. */
>> +
> 
> I really feel that here is the wrong place for this to live.
> 
> Why isn't it in xen/linkage.h?  When is data typically padded with
> anything other than 0's?

As per what we currently have, the default data padding is ~0. Personally
I consider this marginally better than 0, but it could of course be
changed.

Jan

