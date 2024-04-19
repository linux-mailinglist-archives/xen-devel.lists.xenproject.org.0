Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E69C8AB0B6
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 16:26:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709125.1108385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxpCC-0005th-6R; Fri, 19 Apr 2024 14:26:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709125.1108385; Fri, 19 Apr 2024 14:26:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxpCC-0005r3-3O; Fri, 19 Apr 2024 14:26:32 +0000
Received: by outflank-mailman (input) for mailman id 709125;
 Fri, 19 Apr 2024 14:26:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EmAy=LY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxpCA-0005qv-Iy
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 14:26:30 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfa98dd1-fe58-11ee-b909-491648fe20b8;
 Fri, 19 Apr 2024 16:26:29 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-349c4505058so1452579f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Apr 2024 07:26:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 e32-20020a5d5960000000b0033ec9ddc638sm4540722wri.31.2024.04.19.07.26.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Apr 2024 07:26:28 -0700 (PDT)
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
X-Inumbo-ID: cfa98dd1-fe58-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713536788; x=1714141588; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5kG/ARgXXVfg4WMLMW/eCHKrePD3IkK7jN6W0hWBsZo=;
        b=TboJ+UYRuxFLlQMiivVf/I6vaV1TwxPItl8VRSY7LpT8cyXHlvzzY/zKlfwMOzzLHU
         mStnELpSMhgWzQhK/Mj892kzaPTsWSff+NwvpaM1mYqvvMTx+H03WLGlj8eqxS5pHpaH
         b50rtWii9+H+A//Ay8XM/fyhp+Y/C+zY1g9QsdTQV+1uS5HBNl25KvEyOhPrwktn0mMm
         CHdvWqq0M0+KXPXUkLpE5ZujpLcGlZf2FJwJh3esncEeYb8P/d5hQxAOCp+jLwjtRhlk
         Jpns5Hst63tuT+zZoPDmdqepmZQigO72hOgRN6b01qRsk7Hzw2tUahSnXu6dU3WrlMgE
         OESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713536788; x=1714141588;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5kG/ARgXXVfg4WMLMW/eCHKrePD3IkK7jN6W0hWBsZo=;
        b=GuDSRSgy1VemgPVyTNuFIV3e4cthXn0TKLSE8jHY8x9vD/7T9NFCZ53EHccvk4KnSr
         NfSW5UDq7SvlL/cBiOW6EQYBRJQ+EXLT4qv4bwF4ubzoNo8IlV1+vEWQXouaa9FvVqdO
         0qLUzw0G3zWe9pqdsvDZCQ3uvQ/uXvHPDklkt18Wk6WnxwyNyhNb8o5TAjg8yvaNS0pn
         dLQ5pFnaO8t0a+vs3fY+hLCH7/r+KaZYEs7jzOUliv3VWwBjHnGDemgCRpiFwhy9TlSl
         bGE2P8f2cuCoFqabdx/3UKum7+A5q4zwlm4I5NTqOBtoEg/Ty1p2Tn7l0wXWz6QwWX82
         HlgA==
X-Forwarded-Encrypted: i=1; AJvYcCV9JbEarwPHILS17sdvuHEkoNam56stocWhofCOtWEG2SJFUBDhXOvyO9+RDKow1O83kLwKZtXu9YEVIF6fkhg7UMKtbPyLGWuBUbjMba4=
X-Gm-Message-State: AOJu0Yx7Mr6r4EXyiAeDrnnueD5Xd/ZiBm4Wa/Tmr8YaZl50Eu85Uwed
	HPwrjhgjpwjqXnqaYmh2sI93uqmD6RnS14jqK9CrNqmnBt8MqnVip0xTVgexew==
X-Google-Smtp-Source: AGHT+IFVmZOOeNrVnld2Wc3xNSPneTnIC1oeWhMaYpKWlPLEwm9NkoMEvJpCjTjPU+MPoXNI9i/n4Q==
X-Received: by 2002:adf:f88d:0:b0:344:3dd:5092 with SMTP id u13-20020adff88d000000b0034403dd5092mr1359721wrp.16.1713536788503;
        Fri, 19 Apr 2024 07:26:28 -0700 (PDT)
Message-ID: <e04fbfc0-c020-472f-bb82-5414adbaa6fd@suse.com>
Date: Fri, 19 Apr 2024 16:26:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] automation/eclair_analysis: substitute deprecated
 service STD.emptrecd
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, bertrand.marquis@arm.com,
 julien@xen.org, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, Julien Grall <jgrall@amazon.com>,
 xen-devel@lists.xenproject.org
References: <7b60faa6e627b3a4df298f2ef4d9ba4d72e5e206.1713510915.git.nicola.vetrini@bugseng.com>
 <c94d739e-0517-487f-8ba9-d9b19fe8f916@suse.com>
 <58ed38830469a027b9cedd9d5f68cfae@bugseng.com>
 <3c6e3fa1-a312-4872-9b7f-9e6935490bcb@suse.com>
 <4406fa44cb54d07bc43ffee6e42689da@bugseng.com>
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
In-Reply-To: <4406fa44cb54d07bc43ffee6e42689da@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.04.2024 15:01, Nicola Vetrini wrote:
> On 2024-04-19 11:21, Jan Beulich wrote:
>> On 19.04.2024 09:49, Nicola Vetrini wrote:
>>> On 2024-04-19 09:35, Jan Beulich wrote:
>>>> On 19.04.2024 09:16, Nicola Vetrini wrote:
>>>>> The ECLAIR service STD.emptrecd is being deprecated; hence, as a
>>>>> preventive
>>>>> measure, STD.anonstct is used here, which for Xen's purposes has
>>>>> equivalent
>>>>> functionality.
>>>>
>>>> I'm sorry, but no, this still does not clarify things enough. It is
>>>> still
>>>> entirely unclear how "empty record" can reasonably be substituted by
>>>> "anonymous struct". Even the expansion of the respective 
>>>> abbreviations
>>>> continues to be just a guess.
>>>
>>> anonstct checks for structs with no named members,
>>
>> So "anonstct" != "anonymous structures". As indicated, part of the
>> description wants to be de-ciphering of these acronyms, so they can
>> make sense to readers.
>>
>> Jan
>>
>>> hence also empty
>>> structs, but only the former is an undefined behaviour for C99.
>>>
> 
> Would this be a sufficiently clear explanation for you?
> 
> "The ECLAIR service STD.emptrecd (which checks for empty structures) is 
> being deprecated; hence, as a preventive measure, STD.anonstct (which 
> checks for structures with no named members, an UB in C99) is used here; 
> the latter being a more general case than the previous one, this change 
> does not affect the analysis. This new service is already supported by 
> the current version of ECLAIR."

Yes, this is much better. Thanks.

Jan

