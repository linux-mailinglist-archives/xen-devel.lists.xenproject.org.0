Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2354486C165
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 07:53:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686848.1069375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfaHH-0003R4-GM; Thu, 29 Feb 2024 06:52:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686848.1069375; Thu, 29 Feb 2024 06:52:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfaHH-0003OV-DG; Thu, 29 Feb 2024 06:52:23 +0000
Received: by outflank-mailman (input) for mailman id 686848;
 Thu, 29 Feb 2024 06:52:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8AV=KG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfaHG-0003OP-MT
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 06:52:22 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15bdb294-d6cf-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 07:52:20 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-55a5e7fa471so916307a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 28 Feb 2024 22:52:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l10-20020a170906794a00b00a3d8a76a92esm355081ejo.175.2024.02.28.22.52.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 22:52:19 -0800 (PST)
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
X-Inumbo-ID: 15bdb294-d6cf-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709189540; x=1709794340; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HfhBD+zsE1vHXkJemddi5dsD6z61IxsMSWlOltOFLzU=;
        b=TbIvVt4gB+UYaQF7cC3EqtwaIc0H+erM1P/Bg89OjE4DjJvef1x44sp2lHuHPnIvQR
         ckIwgCl7KNXBgE03HNpay0xWYKN1ydTXU/YMSJXTMqJIqqM2UEE11wO304289Iw/9LEg
         NoiTazXUqW4uzpvRpVE2cqrO605ujbDdaEb9WWvl871Ug7itpv2cjFLU95nrbBkPiTMI
         s0cPyHVowRj30Khyu3ulctAY4UjSBNE2IFRIvP8FRQL1j4SHtQIINO0aAtAyJovRFap4
         DNLLSokyHxymrjoK9ZLdM0EDAMLAgLoYTwWl1mLFncJkjkdBeqxPBGSZPaXxQs+6ELkN
         lHbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709189540; x=1709794340;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HfhBD+zsE1vHXkJemddi5dsD6z61IxsMSWlOltOFLzU=;
        b=GWr1FQ9hjuimfQRFulTfBBo+OlsNyTeWMD1Ij3P9uYIECLHATcPBI4JNPrHgBY4Yhv
         Qf6Pu6nNFigpXgUvFvH8EdNUzjax8s7NyeeXEdn4X4Ykd4lPiHgy9+hOS6/oo5dlBjJd
         AVcmgqcGn2iQPc4emq20l6s2xgBxRUYiC9PoJgRrLUeSG3ZqIlUbcanOSfoj9g9RRDMX
         ePD/g4Qm6QUjaWqTZkOHZVfLWJIfKp9AqDfZbT0idw7+Rb5PS0T9hCKHnFQod96XfYif
         ZdpWP0FNqAHkGhR7iVZirzeqrTCf3XXEyFjBER6V4d2W+O/xMzKylxIMNeZQcS+WnZde
         0uUg==
X-Forwarded-Encrypted: i=1; AJvYcCXTwRZjIhwG4WKJfMYR41kZpzbZBBoiqTiy87oYy2Ie9W10dZb9YNon9gnai5/R2aorlfMrnsNqUZYNDJOLNzgG017a9bgzcGqXvdCiSGc=
X-Gm-Message-State: AOJu0YxqnKXPiLMgbm2nbNNLvWVOiz3VMN0ncT+n4Rwou2MmZrlSGH5V
	D54OBwQhbOx0cZxmYRITzSt+sXgAt0Ff61PmE5wcGFMTj6rZhx9GRm2pWaGQkg==
X-Google-Smtp-Source: AGHT+IE1pIao1LomA1koX1ZEnF7eS33jfqer77o36Ksv1cn0L/o/bhnQEG16EaiU3vm7C1U2L979qw==
X-Received: by 2002:a17:906:6b85:b0:a44:2636:2c68 with SMTP id l5-20020a1709066b8500b00a4426362c68mr817762ejr.13.1709189540277;
        Wed, 28 Feb 2024 22:52:20 -0800 (PST)
Message-ID: <4b6d34a7-38ec-4be4-bb7d-3e83137bd704@suse.com>
Date: Thu, 29 Feb 2024 07:52:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/altcall: always use a temporary parameter stashing
 variable
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240228135908.13319-1-roger.pau@citrix.com>
 <11f0e1dd-01b4-4d13-8137-e86b0975ad80@suse.com> <Zd9lvN2tUrmEt2pg@macbook>
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
In-Reply-To: <Zd9lvN2tUrmEt2pg@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.02.2024 17:56, Roger Pau Monné wrote:
> On Wed, Feb 28, 2024 at 03:28:25PM +0100, Jan Beulich wrote:
>> On 28.02.2024 14:59, Roger Pau Monne wrote:
>>> The usage in ALT_CALL_ARG() on clang of:
>>>
>>> register union {
>>>     typeof(arg) e;
>>>     const unsigned long r;
>>> } ...
>>>
>>> When `arg` is the first argument to alternative_{,v}call() and
>>> const_vlapic_vcpu() is used results in clang 3.5.0 complaining with:
>>>
>>> arch/x86/hvm/vlapic.c:141:47: error: non-const static data member must be initialized out of line
>>>          alternative_call(hvm_funcs.test_pir, const_vlapic_vcpu(vlapic), vec) )
>>>
>>> Workaround this by pulling `arg1` into a local variable, like it's done for
>>> further arguments (arg2, arg3...)
>>>
>>> Originally arg1 wasn't pulled into a variable because for the a1_ register
>>> local variable the possible clobbering as a result of operators on other
>>> variables don't matter:
>>>
>>> https://gcc.gnu.org/onlinedocs/gcc/Local-Register-Variables.html#Local-Register-Variables
>>>
>>> Note clang version 3.8.1 seems to already be fixed and don't require the
>>> workaround, but since it's harmless do it uniformly everywhere.
>>>
>>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Fixes: 2ce562b2a413 ('x86/altcall: use a union as register type for function parameters on clang')
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> I'm okay with this change, but since you don't mention anything in this
>> regard: Did you look at whether / how generated code (with gcc) changes?
> 
> So the specific example of vlapic_test_irq() shows no changes to the
> generated code. bloat-o-meter shows a 0 delta:
> 
> add/remove: 0/0 grow/shrink: 0/0 up/down: 0/0 (0)
> Function                                     old     new   delta
> Total: Before=3570098, After=3570098, chg +0.00%
> 
> I assume there can be some reordering of instructions, as we now force
> arg1 temporary variable (v1_) to be initialized ahead of the rest of
> the arguments.

Yeah, re-ordering is okay. I was more worried of new unnecessary register
copying, for example. Thanks for confirming.

Jan

