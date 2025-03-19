Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD438A68D1D
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 13:44:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920638.1324748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tusmB-0008Uf-U3; Wed, 19 Mar 2025 12:44:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920638.1324748; Wed, 19 Mar 2025 12:44:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tusmB-0008SA-RS; Wed, 19 Mar 2025 12:44:03 +0000
Received: by outflank-mailman (input) for mailman id 920638;
 Wed, 19 Mar 2025 12:44:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBEQ=WG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tusmA-0008S4-OW
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 12:44:02 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d58c0105-04bf-11f0-9ea0-5ba50f476ded;
 Wed, 19 Mar 2025 13:44:01 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-399676b7c41so2031875f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 05:44:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c83b6a27sm21132642f8f.31.2025.03.19.05.44.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 05:44:00 -0700 (PDT)
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
X-Inumbo-ID: d58c0105-04bf-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742388241; x=1742993041; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yJ4e6qa87ymp6LxqwsVQ80Gh1M37qT/yMZeETXVj4YU=;
        b=OlObKHe0FCdaijfYVWU80huIPkRl3iZU/GWThXWA59n1OFJhZrEfjTCmALGoW8sW18
         o/YIWv33qfralw3zrPoyVRZsMwzXfo9y7bwW68Jtp5Z6pj52LNw5kx120kBwLunjTZih
         aeQGhZYh+ZFWzpo8qNyZ8eihGHKt54tNNn2RDYTvt4WJ49LvQ6RB/i19JU31IMB46T2f
         x3YEB2ZNfen4A5Reb+PH1MgicH9hl2c7vkeGCFq5rd2BMiV4NteXAPDWmYnOUTcVMaja
         3Kz5JbA3vjQzrTBm/+O0jas4JH0Eeik4i4EY+PG7NeSnx2A4xV1+4nuGq+rNLLQWZVNt
         dxdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742388241; x=1742993041;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yJ4e6qa87ymp6LxqwsVQ80Gh1M37qT/yMZeETXVj4YU=;
        b=WEk5ylObTumlB5Xac0fLccU48de19tW1RcCDK+nTUbqaR+9UnLDXfkAINnUoBQwl63
         ghID4FhCbb2tMvO7Mn4irzp83/DBgPhqxYAAUb6LpFq7axEjaJNlc7V3nnqdFNORkL5g
         B7AJO+nM8DMC6m4qOy18TpfOUS609sMBTDisPNRISJ3emVwhU84BuZOVm9Nu9R/56lgP
         MHwje3yYFws7E+w+5lfCB0LWFD3Jp4nPOdE8EX7O9AJ+laHWBcnHCneeQm4gOoikXPb+
         oAhJe7XgBXBApTHLvpExh0kT83ZYYn0JnCxxK9kKIGLM8QR4iwZRIAfBCe7J9BLcPs7M
         c9vQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtP68xekRrhMHFvUS0vqsb3wWmIRvAYGAyg6pYvUICMyFHPDinC1w6Uoj5Y5AeElwhdzfI4hpwxuQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwpQV2eGxuAUmGl2mrZBw+NKp/+Bv80by5W3sOdNxIWfQnHEQAX
	w3/J45Zt6xs3ShQ3mgFcEML8700xYmjeULDl4O7x7GgUwa4JCNVk3CkryqWTVA==
X-Gm-Gg: ASbGnct3a8n97AVAazWYWbZ5caLGbxUjtw3cBM9xU3LqzRWdvyEksXF1eL4E5nbwOai
	4sV00eVeyWEI9ZcC0c6DgCps2xjoegFJuENYylvouBC5s0Lr7g5ApCAIF4kNZTwBSMTTg5MMYgB
	diRkjjrsB8rcpmVWzUD3j1F9HwGGAgpBWDpqye2N0UWdgfU7BhE+ClA0SX1i6QmcvOzgreV9Sox
	GdoRjqvpAaqhzRgp7dfuUWpeb1vipLaHkxAeZMF5ra0neF0VinQJEBUQG9CV3cuvbPGYQVlcB+w
	tssBmjAlwpT6TN60apooidS6f5Q3zsB4/Ix8q/FgbMYjI43vc3OcTf014ld1u3aiusQImAskHuK
	nPjBdSI4ADfUZm24U9OmpKcS7K96nBw==
X-Google-Smtp-Source: AGHT+IE5RNO8pTANcjAX8Ky1NJs9vZylrPoh3wUe+0IjRVsbKqlnlAY1ds5ggbqIqsvPOR5og2bGtw==
X-Received: by 2002:a05:6000:23c1:b0:391:40bd:6222 with SMTP id ffacd0b85a97d-399739c2185mr1529163f8f.22.1742388241135;
        Wed, 19 Mar 2025 05:44:01 -0700 (PDT)
Message-ID: <943644a3-45f2-46ef-a54b-6dd0bc6171ed@suse.com>
Date: Wed, 19 Mar 2025 13:43:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] Strip build path directories in tools, xen and
 xen/arch/x86
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: =?UTF-8?Q?Fr=C3=A9d=C3=A9ric_Pierret_=28fepitre=29?=
 <frederic.pierret@qubes-os.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.a5cb9c3a17249fc067ab501818c3a3e6c7c229cf.1742317309.git-series.marmarek@invisiblethingslab.com>
 <0370c0eb1fd9ac00acab016792132fa0b943d384.1742317309.git-series.marmarek@invisiblethingslab.com>
 <017d5c41-d4ea-4d91-b6ec-b4660e7325ae@suse.com>
 <e112ecca-b891-4c23-ace1-8128e586cb94@suse.com> <Z9qxcRtap-k-wW8B@mail-itl>
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
In-Reply-To: <Z9qxcRtap-k-wW8B@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.03.2025 12:58, Marek Marczykowski-Górecki wrote:
> On Wed, Mar 19, 2025 at 10:43:12AM +0100, Jan Beulich wrote:
>> On 19.03.2025 10:15, Jan Beulich wrote:
>>> On 18.03.2025 18:01, Marek Marczykowski-Górecki wrote:
>>>> --- a/xen/Makefile
>>>> +++ b/xen/Makefile
>>>> @@ -411,6 +411,8 @@ ifneq ($(CONFIG_CC_IS_CLANG),y)
>>>>  CFLAGS += -Wa,--strip-local-absolute
>>>>  endif
>>>>  
>>>> +$(call cc-option-add CFLAGS,CC,-ffile-prefix-map=$(XEN_ROOT)=.)
>>>
>>> This is lacking a comma:
>>>
>>> $(call cc-option-add,CFLAGS,CC,-ffile-prefix-map=$(XEN_ROOT)=.)
>>
>> And then, having tried the correct form (seeing the option then is passed
>> to the compiler), I can't spot any difference in the resulting
>> xen-syms.map. There were a few absolute paths there before (for
>> arch/x86/x86_64/kexec_reloc.S and arch/x86/acpi/wakeup_prot.S), and the
>> exact same ones are present afterwards.
> 
> I'm not sure about xen-syms.map, it's about build path included in
> xen-syms. It appears at least once in .debug_str and once in
> .debug_line_str.

In which case -fdebug-prefix-map= may suffice, which is available on
more compiler versions? And then only if DEBUG_INFO=y?

> But also, I see the patch lost a chunk during rebase (from before
> 4.17...), that adjusts XEN_ROOT to use $(realpath ...). That's the part
> even mentioned in the commit message...
> 
> I'll send v2 shortly.

Provided there's actually a need. I was in fact wondering whether this
was known to have significant effect prior to Anthony's work to make
out-of-tree builds possible (plus less related adjustments), but may
have lost most of its functionality since then (yet was still carried
forward for all the time).

Jan

