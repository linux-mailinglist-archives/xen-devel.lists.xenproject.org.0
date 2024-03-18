Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C3787EA20
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 14:32:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694705.1083741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmD5r-0003D0-QB; Mon, 18 Mar 2024 13:31:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694705.1083741; Mon, 18 Mar 2024 13:31:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmD5r-0003Ax-NN; Mon, 18 Mar 2024 13:31:59 +0000
Received: by outflank-mailman (input) for mailman id 694705;
 Mon, 18 Mar 2024 13:31:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=emy9=KY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmD5q-0003Ar-Mb
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 13:31:58 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e49351bc-e52b-11ee-afdd-a90da7624cb6;
 Mon, 18 Mar 2024 14:31:57 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a2f22bfb4e6so604015866b.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 06:31:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 o1-20020a1709064f8100b00a4671c92907sm4752876eju.28.2024.03.18.06.31.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 06:31:56 -0700 (PDT)
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
X-Inumbo-ID: e49351bc-e52b-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710768717; x=1711373517; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NwtRDyHtFf43gosol81bXfRCcxu/+x2qM2XPgA/Ti4U=;
        b=DO7N15OUc+/K4qXobBsO9g7SE7v8I+aMDMGIiYuo6bZJmlDAszSjo+s7LhYMMF86UD
         wyzZfahojShkV0of5cVHLtMu/eybUkiKAfn5J0b2KuB/PXpeqpJZyDAinLyzXzNeNLx5
         uBYdPspdPH9KirgciOtb9/ed6Fbg8FOI3/1nZ6827s2MarlnCZKW3wFcbjbRRbxyNhBw
         byw97YxyJ0YjkJorCdtEJdYFdFaLyhCTDzL1qgzF5OcfdrFLlnNKnmd6edF02pSxvvQ9
         zGz7re7taUl/ofLH0LDfGgeXgQvPbf9R//1SJU8PoUeZhkxyCJ90d1KaJeUBtftBwV3T
         fjDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710768717; x=1711373517;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NwtRDyHtFf43gosol81bXfRCcxu/+x2qM2XPgA/Ti4U=;
        b=IKsCDTGpAioL8Di152r5zArX+uvltgXLYQ3hWycQp8ycDqtZ9LwicRUprRN1I2JTb6
         5hNgEocI0+CAeu6y6Y2eklYCX9CXU05Q8Mv1Bcc8hmuSVBWE6R/f8DhhlavIaHYsktY5
         zAsptzJUcB8nmR62UqwE7mZGKyeD1Q67S9FADMnVHhrskfzafWaRVwR4XSub4iKNphJX
         /TEK/YUmDA2NXf+jo/NA/WkdPsd2rpFJeplA4YmYItiYnKYGqEL0wSDIhMkk7scAq+Pr
         tUj86V7A71pTGBulKncDaLEag6sijoQfMwtXQuuGFfztLIKiGDLvJ3vB2Zc/tapqJ7Sm
         7VnA==
X-Forwarded-Encrypted: i=1; AJvYcCXfBt/6dn2wKmNEGUAKmsiXzV1UlOvmZZUxLpr5vSkKKDyvnpsy+bBkV5hgFfCWDu+N3o1hAThpzNVz1FMipc1NTPjBZ0+EUj4SmsvOeiM=
X-Gm-Message-State: AOJu0Yzz1K0/af9t/rzsCMH5aWq6Xr4gnjzdfBqu0TUuDPZ0ekxKQYfl
	ewPi7hen4sCXPgEeVdsYX15etfidOx9LhLhfndUS1CJl26+eTjIewDIhiJDQwg==
X-Google-Smtp-Source: AGHT+IEr+zR6ClnN/KUAR9W//MIivAR+DQEXPo4ZFegAYSwO36SxGRR0u/QUm4DnJG45P3UVmdmhqA==
X-Received: by 2002:a17:907:6d0d:b0:a46:a928:3034 with SMTP id sa13-20020a1709076d0d00b00a46a9283034mr4776803ejc.18.1710768717257;
        Mon, 18 Mar 2024 06:31:57 -0700 (PDT)
Message-ID: <5e9321b7-9d7a-4b1c-bcad-b5850e03aed8@suse.com>
Date: Mon, 18 Mar 2024 14:31:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] xen/virtual-region: Rework how bugframe linkage works
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240318110442.3653997-1-andrew.cooper3@citrix.com>
 <20240318110442.3653997-3-andrew.cooper3@citrix.com>
 <47ae2b45-b5da-4c5c-bbea-387f44d21a2f@suse.com>
 <fdf6a4fc-f975-4b57-9170-d9e274de1c35@citrix.com>
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
In-Reply-To: <fdf6a4fc-f975-4b57-9170-d9e274de1c35@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.03.2024 14:24, Andrew Cooper wrote:
> On 18/03/2024 1:17 pm, Jan Beulich wrote:
>> On 18.03.2024 12:04, Andrew Cooper wrote:
>>> --- a/xen/common/virtual_region.c
>>> +++ b/xen/common/virtual_region.c
>>> @@ -9,12 +9,25 @@
>>>  #include <xen/spinlock.h>
>>>  #include <xen/virtual_region.h>
>>>  
>>> +extern const struct bug_frame
>>> +    __start_bug_frames_0[], __stop_bug_frames_0[],
>>> +    __start_bug_frames_1[], __stop_bug_frames_1[],
>>> +    __start_bug_frames_2[], __stop_bug_frames_2[],
>>> +    __start_bug_frames_3[], __stop_bug_frames_3[];
>>> +
>>>  static struct virtual_region core = {
>>>      .list = LIST_HEAD_INIT(core.list),
>>>      .text_start = _stext,
>>>      .text_end = _etext,
>>>      .rodata_start = _srodata,
>>>      .rodata_end = _erodata,
>>> +
>>> +    .frame = {
>>> +        { __start_bug_frames_0, __stop_bug_frames_0 },
>>> +        { __start_bug_frames_1, __stop_bug_frames_1 },
>>> +        { __start_bug_frames_2, __stop_bug_frames_2 },
>>> +        { __start_bug_frames_3, __stop_bug_frames_3 },
>>> +    },
>>>  };
>>>  
>>>  /* Becomes irrelevant when __init sections are cleared. */
>>> @@ -22,6 +35,13 @@ static struct virtual_region core_init __initdata = {
>>>      .list = LIST_HEAD_INIT(core_init.list),
>>>      .text_start = _sinittext,
>>>      .text_end = _einittext,
>>> +
>>> +    .frame = {
>>> +        { __start_bug_frames_0, __stop_bug_frames_0 },
>>> +        { __start_bug_frames_1, __stop_bug_frames_1 },
>>> +        { __start_bug_frames_2, __stop_bug_frames_2 },
>>> +        { __start_bug_frames_3, __stop_bug_frames_3 },
>>> +    },
>>>  };
>> ... this is now calling yet louder for splitting runtime from init bug
>> frame records.
> 
> How do you propose we do this?
> 
> We can probably do it for *.init.o objects by renaming the bugframe
> sections too, but unless we can do it for *every* bugframe emitted in
> all init code, splitting this will break things.

On halfway recent toolchains we can pass -Wa,--sectname-subst and then
construct section names derived from the containing text ones.

Jan

