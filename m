Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3D1819ABC
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 09:42:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657436.1026252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFs9S-0008HX-BE; Wed, 20 Dec 2023 08:42:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657436.1026252; Wed, 20 Dec 2023 08:42:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFs9S-0008FI-8Y; Wed, 20 Dec 2023 08:42:02 +0000
Received: by outflank-mailman (input) for mailman id 657436;
 Wed, 20 Dec 2023 08:42:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m81q=H7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFs9Q-0008FB-Dw
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 08:42:00 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3553ed8-9f13-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 09:41:59 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-33621d443a7so5573912f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 00:41:59 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n6-20020a05600c500600b0040c1d2c6331sm6436870wmr.32.2023.12.20.00.41.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Dec 2023 00:41:58 -0800 (PST)
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
X-Inumbo-ID: a3553ed8-9f13-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703061718; x=1703666518; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dZKeXvxpoq9mdMW4swaLCDNC7gJ1Lo/uSGJXoUku94A=;
        b=Li7QtFCnjT/q1Z8JH9UEuRrjd0mUBJq38b6q3GYRbz3fzxtBD3IWYT/MC+Apz0acJ4
         SD/XR3NgAnjaUVSmWUAs54Ls0Yg1vP6PYLNnqGYNIC9YfxrYBF58XFsJrzWunUG7Invh
         HKI3MtoPJLLyq8zJycv1sKtoU0BLiQ5Ye2f3ahHpANs3crl4+/Om25cTLPbDgYx1Iu/V
         87H1F1zBbSJypJ7rLpy2IqtADscDuU67FqAIVTh0GO2DtQ1mgiDJIuDGAWnIrAwZJwEq
         9/UaQNZeocpcSGLKqL7AO33pyU6irsh5MrUyASw5mdoAJ3bo8lz94JKmkbNdRmgckPR1
         nXvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703061718; x=1703666518;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dZKeXvxpoq9mdMW4swaLCDNC7gJ1Lo/uSGJXoUku94A=;
        b=tBEYdS6AoZH6a+xinvVlNqLERWQJOPrvYGMNAzFL6DlsnREx7qVksauyIr1xvW5WBV
         JHT/NOMYp/I9L7k7LS35xZfYbyLMiV/eqLeTDrhAykSTxaUKU1wk21JTrmE5CS81DPpz
         SOuQva8HXXpFfqyvXq+XjpucjJjJ9PgZD7TPRFhE2vpYsQlEvrM/DNFGHsK85URhZous
         FAQVl7D7YZ1wweMzpChF8ldEPMhP15ayYsWODSHcC7UiYeN0X8Aqkk6MMkkvL3sMe97g
         gkq76vyRhBlTf17ICyXSSt3UI0w95Qowacf8w7ptzyG0Bceog11jMBD9QXDDR3CHBMMj
         U/BA==
X-Gm-Message-State: AOJu0Yxv1RENFgG/zOKWPrB72ka1K58na9v6y7mvsxdtmD7g+uXxWh/b
	B60wlyWyEIlmFbBpax+wbtpu
X-Google-Smtp-Source: AGHT+IERGa0Em4CritFvPjoVaaDQVKABscY+BGG1GuYfTPRlAEIsRWaUIfqUyiN+RQcXZC5wa+Brcg==
X-Received: by 2002:a05:600c:538a:b0:40d:3084:e6d6 with SMTP id hg10-20020a05600c538a00b0040d3084e6d6mr600034wmb.235.1703061718483;
        Wed, 20 Dec 2023 00:41:58 -0800 (PST)
Message-ID: <70b0b556-d103-46dd-a69c-004e9adf27bf@suse.com>
Date: Wed, 20 Dec 2023 09:41:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen: add acmacros.h to exclude-list.json
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: "consulting@bugseng.com" <consulting@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Luca Fancellu <Luca.Fancellu@arm.com>
References: <664ddc412905546d44d3e311a743ba5217a6243b.1702976486.git.nicola.vetrini@bugseng.com>
 <055b6cf3-4f29-4f1d-b650-26c6d9be8832@suse.com>
 <2fd03776043811a8ceae9ae41de5f0fa@bugseng.com>
 <2c64af71dcb3984f1753ef115868cb7b@bugseng.com>
 <2F345562-4049-4A50-9793-D0002B239C43@arm.com>
 <alpine.DEB.2.22.394.2312191616400.3175268@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2312191616400.3175268@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.12.2023 01:17, Stefano Stabellini wrote:
> On Tue, 19 Dec 2023, Luca Fancellu wrote:
>>> On 19 Dec 2023, at 11:05, Nicola Vetrini <nicola.vetrini@bugseng.com> wrote:
>>> On 2023-12-19 11:51, Nicola Vetrini wrote:
>>>> On 2023-12-19 11:37, Jan Beulich wrote:
>>>>> On 19.12.2023 10:02, Nicola Vetrini wrote:
>>>>>> --- a/docs/misra/exclude-list.json
>>>>>> +++ b/docs/misra/exclude-list.json
>>>>>> @@ -209,6 +209,10 @@
>>>>>>           "rel_path": "include/acpi/acglobal.h",
>>>>>>           "comment": "Imported from Linux, ignore for now"
>>>>>>         },
>>>>>> +        {
>>>>>> +          "rel_path": "include/acpi/acmacros.h",
>>>>>> +          "comment": "Imported from Linux, ignore for now"
>>>>>> +        },
>>>>> Together with what's already there (in context), wouldn't it better be
>>>>> the entire directory then which is excluded, or at least all
>>>>> include/acpi/ac*.h collectively (and perhaps also
>>>>> include/acpi/platform/ac*.h)?
>>>>> Jan
>>>> +Cc Luca Fancellu
>>>> Sure. I wasn't certain which files are imported from ACPI CA and which aren't.
>>>> I'm also not sure whether "include/acpi/ac*.h" would be properly recognized by other tooling that uses exclude-list.json (only cppcheck I think). I Cc-ed Luca Fancellu on this.
>>>
>>> It occurred to me that it's surely ok to use "include/acpi/ac*" and "include/acpi/platform/ac*".
>>
>> Yes I think it’s fine, it just come to my mind now that this could have the risk that if
>> another file is added with ‘ac' prefix, even if it could be subject to MISRA compliance,
>> it will be excluded.
>>
>> If that risk is negligible for the maintainer of that part, then it’s fine.
> 
> I think it is OK either way, I'll let Jan pick his preference.

It hasn't become clear to me what the benefit would be of omitting the
trailing .h.

Jan

