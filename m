Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F53787C8E7
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 07:59:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693643.1082040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl1X9-0000Cy-Rr; Fri, 15 Mar 2024 06:59:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693643.1082040; Fri, 15 Mar 2024 06:59:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl1X9-00009o-Og; Fri, 15 Mar 2024 06:59:15 +0000
Received: by outflank-mailman (input) for mailman id 693643;
 Fri, 15 Mar 2024 06:59:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZGBu=KV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rl1X8-00009g-Ni
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 06:59:14 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8797ca88-e299-11ee-a1ee-f123f15fe8a2;
 Fri, 15 Mar 2024 07:59:12 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-512f3e75391so1640402e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 23:59:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 sa37-20020a1709076d2500b00a4635a21ff0sm1412722ejc.38.2024.03.14.23.59.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Mar 2024 23:59:12 -0700 (PDT)
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
X-Inumbo-ID: 8797ca88-e299-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710485952; x=1711090752; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f0BNugw9oUIIEpNu31+YGP/DO2a6/E/ajyMHR3fBV80=;
        b=HooDN3ajluP6RuuBLWqwGDh29pU+7eqQThknQISR1skmA8enov1j5RbptEYUTeN7Ur
         tZuDOqfF8hVvllTp6LZpthvTJM5yqx9HsFQau1C8twtlRRqbb/Pl++5rCQmfxlAB84cE
         +WISJZpLBFhnton59Y+zO6yo+lSezKdgggg5wzPkoMINaKNEHubuSo0HEqtOOwQhiJ+f
         MifCSqUKRLFOjnKkEuVCiPwhIgnRCeHojqhU1yvixPxMwxaHQ/+2Mxwnd0NW7CU7j8n4
         eaw6DlFgs0iYs6BwTSbdwHQKYnhPWpLAWnIXn9FeUJhM6S1endznTB68n/qQ3SEDza0G
         Q/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710485952; x=1711090752;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f0BNugw9oUIIEpNu31+YGP/DO2a6/E/ajyMHR3fBV80=;
        b=vtkdJ408xD7e/YYX38HAq6Vg0A+xTFRbo84qEIPW6x7W1XPw08NnB9skf7oT5UQBVq
         h24nxWT1/4IV9JnQUrmUFuA9tAopJh9GVDaXWqzn45PDh/Y+1KObxQy+yTqRe/w9o7Lw
         PVZi/RL896ftiMm9dXoyeMLhexnRO6OgrwViBKCu64B3BEuE95OxdTL3pmufQerXyq2w
         AGcuxPS2u2KmO67ft+Qd2dbP+hA97h3Cj01b+fb/y5EusHZ658Xd7IMx9eKcyiB8Aybt
         H3XjCq+hDMOCS2slOeHAvZosqJ9QwqwnLEEUu4OHNozjOaV5bD1h70jZO7Nrtn/humFt
         +rEA==
X-Forwarded-Encrypted: i=1; AJvYcCU80P/BAShU6/LtenH8w/jxu5gr4zbWqF87B1Im6KDph7qbBsO6mTcfOznV+wAY9bSdVcvLWr7OTnyepDkZFT9NWfAxoT79Qaddy7KaSoo=
X-Gm-Message-State: AOJu0YzZ6xmIEfIhl61hwKvcwZZdNxj/u+qXoycD3DM46MST0b9st7uw
	/4hX/vJ62sxzEb/pp49pexCS+/emii209R58D5qB2z6sOtOrDOceFm+ASMi9Vg==
X-Google-Smtp-Source: AGHT+IGSBkE57xWXRzEnNDTEof79wsq4rPg9HP96IMo0m54w5Eo51e690dvYzWz80KPwy9rwq1NJwQ==
X-Received: by 2002:a05:6512:3ca6:b0:513:d3e3:f78c with SMTP id h38-20020a0565123ca600b00513d3e3f78cmr2959529lfv.40.1710485952333;
        Thu, 14 Mar 2024 23:59:12 -0700 (PDT)
Message-ID: <2ea3d566-1b21-44e6-bdb6-7c554a7f7996@suse.com>
Date: Fri, 15 Mar 2024 07:59:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 01/16] misra: add deviation for headers that
 explicitly avoid guards
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Simone Ballarin <simone.ballarin@bugseng.com>, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1710145041.git.simone.ballarin@bugseng.com>
 <310fe4a0ccd0ad45bcf1cd9811ac56c9a560dd0b.1710145041.git.simone.ballarin@bugseng.com>
 <def59c84-13e6-4175-ae5d-e0ba7770f68e@suse.com>
 <alpine.DEB.2.22.394.2403141554040.853156@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2403141554040.853156@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.03.2024 23:55, Stefano Stabellini wrote:
> On Mon, 11 Mar 2024, Jan Beulich wrote:
>> On 11.03.2024 09:59, Simone Ballarin wrote:
>>> Some headers, under specific circumstances (documented in a comment at
>>> the beginning of the file), explicitly avoid inclusion guards: the caller
>>> is responsible for including them correctly.
>>>
>>> These files are not supposed to comply with Directive 4.10:
>>> "Precautions shall be taken in order to prevent the contents of a header
>>> file being included more than once"
>>>
>>> This patch adds deviation cooments for headers that avoid guards.
>>>
>>> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
>>>
>>> ---
>>> Changes in v3:
>>> - fix inconsistent deviation ID
>>> - change comment-based deviation text
>>> Changes in v2:
>>> - use the format introduced with doc/misra/safe.json instead of
>>>   a generic text-based deviation
>>> ---
>>>  docs/misra/safe.json                        | 9 +++++++++
>>>  xen/include/public/arch-x86/cpufeatureset.h | 1 +
>>>  xen/include/public/errno.h                  | 1 +
>>>  3 files changed, 11 insertions(+)
>>
>> I understand something wants doing, but having such comments appear in public
>> headers feels wrong to me. I'm afraid I have no good alternative suggestion.
> 
> Given that in both cases there is very nice explanation on how to use
> the headers as an in-code comment just above, could we embed the
> SAF-3-safe marker in the existing comment?

I'm afraid that won't address my remark, and I'm further afraid this would
then render the SAF part of the comment ineffectual.

> If not, I think we should go with this patch as is (I don't think it is
> worth my, your, and Simone's time to look for alternatives).

Easy alternative: Simply leave public headers alone.

Jan

