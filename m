Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6127C80844
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 13:41:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170692.1495788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVsc-000362-8P; Mon, 24 Nov 2025 12:41:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170692.1495788; Mon, 24 Nov 2025 12:41:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVsc-00033b-5G; Mon, 24 Nov 2025 12:41:18 +0000
Received: by outflank-mailman (input) for mailman id 1170692;
 Mon, 24 Nov 2025 12:41:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNVsb-0002Wl-9o
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 12:41:17 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9937ce4-c932-11f0-9d18-b5c5bf9af7f9;
 Mon, 24 Nov 2025 13:41:08 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4779cb0a33fso41261445e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 04:41:08 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7f2e5b6sm27840690f8f.1.2025.11.24.04.41.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 04:41:07 -0800 (PST)
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
X-Inumbo-ID: d9937ce4-c932-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763988068; x=1764592868; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kuBpZwz7Br0/EAp5eNNMNJlDAnTYJSU/ZoPFhNC1Isw=;
        b=LhIHCUyWHNBeVom1UJqQDK4VYDSoJvTQHVfOC2DI2nDh4ovXW95w1ojrp0uc5uYcJQ
         Ut86vT3qLnX4/Nk1IkuCIDUiAYY6ubmTWXzXs0qc6w5owEX4LujlPAanOAoae6MxvMKt
         AbW8jIhpZHbn6hHSiFlIWU7wCD0nXjVAvI59NXXU+0I6xJLXEFQhsluRCmrKn+02m/uE
         yBZE77J7PYcOjkyP0XeOeHYI11SAy7+e7oivi8xMq+n5teCJ96uydl3ABCuWfI+DHmNv
         lohVDvZ8I44Vr04tQyU9UDHJ5j4TeLdvaIjVCaN0K2K6VHGZEMLjQSrjgMMXLmMYMU87
         GrSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763988068; x=1764592868;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kuBpZwz7Br0/EAp5eNNMNJlDAnTYJSU/ZoPFhNC1Isw=;
        b=TJHc75FzQbKCf1wvwYI54HG3MOAXep/5xbx/5C1UCdFobRYCHz8+msLt/bRkSGq482
         SS76DQUhogQGTFUI7fyKIUPU7oNfmmbnJQvaRMGHXk7Eort5j1Abn3vLa27qqfpbo0jn
         +Y3ENz44KLjRwvjExYstPL0XplP7DL0dR6kNRwuYFSTDm0H4QcRSUQUEEX8R8VZxJxVG
         nkFQV9l5VgloFCtOUmLkQgXj7bUQYOT+eUYcEao3lU0bnPShAfyjQw+VDH7AH/GLTvLu
         9JxXJ9GE1dUdfRgN6//qfAlIZVLKdAveBhSCSA2Irdgr5lzPrVJqzXqMQUtcKy5zUntx
         SyUg==
X-Gm-Message-State: AOJu0YzcRXIpMRqTRpyYkYV5AnADRFVbRr+ODTF7qsuPkL65WxqEi9wW
	efPDmwsEA/EORp7AIQcKe5mHrw4QaondGlQd19zRzeGAmWrg/zB9AN6F3b6OSk8dug==
X-Gm-Gg: ASbGncuik+TbKT2tSES0i6FziIUx7IO8/Ho9FsRl+szg8JvbN8E3pWoivYzNfZGJG1E
	cGwNPGo3chZM4wUPdMIwSQJ/eJaUs/XcVIrhVCzS+/ncrOS8z+0Z+BLqpsniCSAaO4RcqY3KXlQ
	/raw3RCsMzdBG1Th9F1jYheuviyLlRiii/zvEaWvVTKIBnwl5okS0aTCgX988gJt13nTJqq4ruK
	SdqJZIdpdXMV51aEbeVk2PTZkWewD5IRvDwc1AZqzTum0OZcIOCmmTNT4NCuMIPBkiYVNaM1Vvc
	5aAApVWcD8EQN13C9siSiWbptd1UClGwSqnAYbSnMFFC0q7Htxd+spwKEl16EMOpfjwt85FsR/O
	dtMukQJW7furAJ6VaLIuLbvkyEdmkPsrMJ4P0r7GuYro+sLNffyflrpau6lPv0joWCkSfAPwgae
	Uj8/RdZDRN9xk4gc11ltUwcJ4Xac7a8eZ8LWUql6QAO2NwZf//QW62/wNjBa/OaboeAMomYmz+9
	rY=
X-Google-Smtp-Source: AGHT+IGiwunqRJBAqSkZotFoHAU1FpLNkY5i1ZejKJsH1W4Jri5OwJcLRXX8/52AtgyiGGnSfOFN0w==
X-Received: by 2002:a05:600c:3553:b0:477:63b5:7148 with SMTP id 5b1f17b1804b1-477c0174840mr109632385e9.6.1763988067830;
        Mon, 24 Nov 2025 04:41:07 -0800 (PST)
Message-ID: <fbec7d87-126d-4a0f-bce3-dde76d20433b@suse.com>
Date: Mon, 24 Nov 2025 13:41:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] XEN: enable MC/DC coverage for Clang
To: Saman Dehghan <samaan.dehghan@gmail.com>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <3bb418ae6a36a9ac89c697a417fa0745fa9ac702.1763949990.git.samaan.dehghan@gmail.com>
 <9c76a959-51c0-4eb7-9d05-ba4441318faa@citrix.com>
 <CAHFNDNikjXNHCj2RXMoZPckqaQAy2u-xw-QyCO7nXT3pttp6Hg@mail.gmail.com>
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
In-Reply-To: <CAHFNDNikjXNHCj2RXMoZPckqaQAy2u-xw-QyCO7nXT3pttp6Hg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.11.2025 13:31, Saman Dehghan wrote:
> On Mon, Nov 24, 2025 at 5:15 AM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>> On 24/11/2025 2:18 am, Saman Dehghan wrote:
>>> @@ -127,16 +131,25 @@ extern uint64_t __stop___llvm_prf_cnts[];
>>>  #define END_NAMES       ((const void *)__stop___llvm_prf_names)
>>>  #define START_COUNTERS  ((void *)__start___llvm_prf_cnts)
>>>  #define END_COUNTERS    ((void *)__stop___llvm_prf_cnts)
>>> +#define START_BITMAP    ((void *)__start___llvm_prf_bits)
>>> +#define END_BITMAP      ((void *)__stop___llvm_prf_bits)
>>>
>>>  static void cf_check reset_counters(void)
>>>  {
>>>      memset(START_COUNTERS, 0, END_COUNTERS - START_COUNTERS);
>>> +#ifdef CONFIG_CONDITION_COVERAGE
>>> +    memset(START_BITMAP, 0, END_BITMAP - START_BITMAP);
>>> +#endif
>>
>> ... this:
>>
>>     if ( IS_ENABLED(CONFIG_CONDITION_COVERAGE) )
>>         memset(START_BITMAP, 0, END_BITMAP - START_BITMAP);
>>
>>>  }
> 
> Thanks Andrew.
> 
> IS_ENABLED(CONFIG_CONDITION_COVERAGE) is not the same as #ifdef
> CONFIG_CONDITION_COVERAGE.
> When the option is completely undefined, IS_ENABLED() returns 1 (enabled).

See our many other uses of IS_ENABLED(). If what you say was true, we'd have
breakage for every one of those uses.

Jan

