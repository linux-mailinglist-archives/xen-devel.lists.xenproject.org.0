Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE8B975503
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 16:10:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796685.1206437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soO3H-0002yS-WC; Wed, 11 Sep 2024 14:10:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796685.1206437; Wed, 11 Sep 2024 14:10:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soO3H-0002wx-TS; Wed, 11 Sep 2024 14:10:35 +0000
Received: by outflank-mailman (input) for mailman id 796685;
 Wed, 11 Sep 2024 14:10:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1soO3G-0002wr-I8
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 14:10:34 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c02f581-7047-11ef-a0b5-8be0dac302b0;
 Wed, 11 Sep 2024 16:10:33 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2f754d4a6e4so61233441fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2024 07:10:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd8c4d4sm5426541a12.82.2024.09.11.07.10.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 07:10:32 -0700 (PDT)
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
X-Inumbo-ID: 9c02f581-7047-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726063833; x=1726668633; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8vm6bJu/SSqasVGIXNfEM45aEzmZzIYaSIX+r0rHBU8=;
        b=gPQJX88NAv/OlzahJDcRxxoOQFCtljrKh0H/CP1kqIyIc1Ktl5S3ERfjneERlDtBTr
         fgZP18PRJRl3U/hy+TOiVPPI+935RtDoLr6v+gJZbI8UIKprCc339Ly8DuzGDHgX9WtJ
         PcTE2GjCKz4nurSEof38PX8/9z50kaK/NZYzxowzTfMKAzJ4CzDzr6Zs/gX2kMFr00oW
         wTPV0q5csELz7fogDva26AJtQAqSPslllesjvK5wUqVbtEIPgzwcAp0cVvpwmxSwgKOq
         unb9Ap2dbboAu7m1hT/b1RvrO24A3p9woJX1cequC5aTkRLUP9+0I76c9TSpa4KaStOc
         Ko9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726063833; x=1726668633;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8vm6bJu/SSqasVGIXNfEM45aEzmZzIYaSIX+r0rHBU8=;
        b=iUTr3SG1o120X4w1MCpleSxmEo0NU8qZ0DxiHg4AKT6sGs4nY8xlfy0OgaBfs6OUrN
         aZlynqbxIF3ZKuH+ZSNtZcANnIGaZA4ISCV+McmAvEcVUtyw1ZipSeLC/uALVPaOP387
         1DIM76JA2rY0Tz3bfG1hNT5YHnannGimPTplN96bTE4T41B53CWP3+zV3dwbM0jZNrXQ
         9J7z5XCIK7Ww+kGapmQVlYo0x3mPzs2zjyQ7DkV4p5nPfNOOCiIYt9DkYYKjd1msAJGy
         Idg8Iv75nWEeDF34LRiQflMIKqKW5ALbWrb6xfzjnBwj2McZkDPOcV2PDJw1nZj0SLvb
         ywYA==
X-Forwarded-Encrypted: i=1; AJvYcCXfUpUNNheqdNjOp0A/Ld/Pdm6+oscgOlR5OIZ943xgnXs1jn89b5DTX/E5lyAVnfyOj4y9vbZDDWo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz6OsYNuNv4hOMnGxS4IjiJTNBFg2HBBO7RNOmplcJdYKRo1cAl
	nygeNtsi+08kvHV0uXVFsU8dxW7aMvMPrH0nkVvmQbYzw/rDXO/DVKklO7KU4A==
X-Google-Smtp-Source: AGHT+IG4e2Q0lznVhDoBHk15si6B5JkqZGgjoChbOLQtc688bIM6GXYlJcWpZOQEljhvcC07+2hfhg==
X-Received: by 2002:a05:651c:1989:b0:2ef:2bb4:45d with SMTP id 38308e7fff4ca-2f751eaf2c4mr90575011fa.9.1726063832729;
        Wed, 11 Sep 2024 07:10:32 -0700 (PDT)
Message-ID: <0a36284e-4b99-413c-bc12-0328b12da0d2@suse.com>
Date: Wed, 11 Sep 2024 16:10:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 1/3] EFI: address violations of MISRA C Rule 13.6
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Federico Serafini <federico.serafini@bugseng.com>,
 consulting@bugseng.com, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1725994633.git.federico.serafini@bugseng.com>
 <2e893e6e83fdfb24c5f9c4d2da59114cba9a1df8.1725994633.git.federico.serafini@bugseng.com>
 <c068874b-a4bd-4ccc-a9bf-08a996797543@suse.com> <ZuGYOldX55_ZfJCv@mail-itl>
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
In-Reply-To: <ZuGYOldX55_ZfJCv@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.09.2024 15:16, Marek Marczykowski-Górecki wrote:
> On Wed, Sep 11, 2024 at 02:50:03PM +0200, Jan Beulich wrote:
>> On 10.09.2024 21:06, Federico Serafini wrote:
>>> Refactor the code to improve readability
>>
>> I question this aspect. I'm not the maintainer of this code anymore, so
>> my view probably doesn't matter much here.
>>
>>> and address violations of
>>> MISRA C:2012 Rule 13.6 ("The operand of the `sizeof' operator shall
>>> not contain any expression which has potential side effect").
>>
>> Where's the potential side effect? Since you move ...
>>
>>> --- a/xen/common/efi/runtime.c
>>> +++ b/xen/common/efi/runtime.c
>>> @@ -250,14 +250,20 @@ int efi_get_info(uint32_t idx, union xenpf_efi_info *info)
>>>          info->cfg.addr = __pa(efi_ct);
>>>          info->cfg.nent = efi_num_ct;
>>>          break;
>>> +
>>>      case XEN_FW_EFI_VENDOR:
>>> +    {
>>> +        XEN_GUEST_HANDLE_PARAM(CHAR16) vendor_name =
>>> +            guest_handle_cast(info->vendor.name, CHAR16);
>>
>> .. this out, it must be the one. I've looked at it, yet I can't spot
>> anything:
>>
>> #define guest_handle_cast(hnd, type) ({         \
>>     type *_x = (hnd).p;                         \
>>     (XEN_GUEST_HANDLE_PARAM(type)) { _x };      \
>> })
>>
>> As a rule of thumb, when things aren't obvious, please call out the
>> specific aspect / property in descriptions of such patches.
> 
> I guess it's because guest_handle_cast() is a macro, yet it's lowercase
> so looks like a function?

If Eclair didn't look at the macro-expanded code, it wouldn't even see
the sizeof(). Hence I don't expect the thing to be mistaken for a function
call.

> Wasn't there some other MISRA rule about lowercase/uppercase for macro names?

I can't recall having run into one, but I also haven't memorized them all.

Jan

