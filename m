Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3041F80EE44
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 15:02:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653153.1019457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD3KM-00077w-De; Tue, 12 Dec 2023 14:01:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653153.1019457; Tue, 12 Dec 2023 14:01:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD3KM-000755-Az; Tue, 12 Dec 2023 14:01:38 +0000
Received: by outflank-mailman (input) for mailman id 653153;
 Tue, 12 Dec 2023 14:01:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A/PU=HX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rD3KK-00074z-GY
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 14:01:36 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f576038e-98f6-11ee-9b0f-b553b5be7939;
 Tue, 12 Dec 2023 15:01:34 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40c3f68b79aso35855735e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 12 Dec 2023 06:01:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 j25-20020a05600c1c1900b004076f522058sm19095667wms.0.2023.12.12.06.01.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Dec 2023 06:01:32 -0800 (PST)
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
X-Inumbo-ID: f576038e-98f6-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702389694; x=1702994494; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q07JDhtC8/CzI+mPapQNHYKf/7pRxNuK6H1n1J5tdx0=;
        b=d+vSCH4+dS6AEg1+CQls5ly+HJuODXl98cHE6FNHiYhi9DXbx2PNU9adwor40DmsFH
         6HCnQekBSLAS56YfThFoom62vkm94wndhosA15LBtI3fzzceSI3A5GYx7s8JcQmCvYHj
         2mFgVB3oRH+b1RLZDUUPYYTEXGC/y46s4yUg7xDKdc874w+IhwnSApel5Cmp7RCTYtYX
         m0d4gWX5tvUUStPB8rfTgtHVbF8pG9kcIxMqhmt3KGDMq1QnOWRzoToDbBi5RIsRNlMW
         ryB4SsD8tXYQdFIGIcmYTkIS86R9WzBgOl8DOjTvh/VjvXFl4IVhGXwsExM/g02RUjfc
         T2aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702389694; x=1702994494;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q07JDhtC8/CzI+mPapQNHYKf/7pRxNuK6H1n1J5tdx0=;
        b=CUu+FLLPXt3Dr5WH95o771ZZ27rno/2cSk8YDMdlBI6Y5eFSH6xs+e7G3YnqsJ7KG4
         eacEDWw4VkmVucSfFSLVVL8uIXzXbcEHDi2FN4osHy1woDZB501JFFqKu5IkPSOVh/Ic
         +SNh30d4VIFs0GvkhyGtUEAVJNZrECv7uu+3ethXxY+bcjCVqO7FPP0GeAgjfS85U9RW
         qUo1xEeQEnC8U7EFVGaOjhNoSlNTeTdJyilrp9AWD2m8iv3HTJ7Esdxrb26Dyfcp+R6e
         LaB7O5JmV2JolY4tg0CEpmz8SX1t1gr7MOTKKcDE6jDNPn4Q5vQvruAOioL30QIZQdVt
         gNOQ==
X-Gm-Message-State: AOJu0Yz2gvqUGrb+YNwaWLDXgdHFN74KW1JrX5DUj8jeq8tuHdrcrQmQ
	0Wq1yDN3tVSK88VLQccRtbst
X-Google-Smtp-Source: AGHT+IFEzJOrzF0IqeM7Q/R6hO1T7X20KDmEYbUoYh72xADGXyuGrIIU0Yc2N9ew/IBWlmVrD5xWRA==
X-Received: by 2002:a05:600c:22c2:b0:40c:2a2b:4ef with SMTP id 2-20020a05600c22c200b0040c2a2b04efmr3516456wmg.43.1702389693836;
        Tue, 12 Dec 2023 06:01:33 -0800 (PST)
Message-ID: <c2679666-9cd6-45aa-a222-82a589247ea2@suse.com>
Date: Tue, 12 Dec 2023 15:01:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 7/7] x86/xstate: move BUILD_BUG_ON to address MISRA
 C:2012 Rule 2.1
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1702283415.git.nicola.vetrini@bugseng.com>
 <a969550faea681c69730c0968264781f7739670d.1702283415.git.nicola.vetrini@bugseng.com>
 <1d05baf2-e262-4151-b5a3-308f0ffa1e97@suse.com>
 <af20721d-c353-4327-8ae2-6e803de4ba37@suse.com>
 <06787876c18401f7adbfb23f7f91ee84@bugseng.com>
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
In-Reply-To: <06787876c18401f7adbfb23f7f91ee84@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.12.2023 14:38, Nicola Vetrini wrote:
> On 2023-12-12 11:07, Jan Beulich wrote:
>> On 12.12.2023 11:04, Jan Beulich wrote:
>>> On 11.12.2023 11:30, Nicola Vetrini wrote:
>>>> The string literal inside the expansion of BUILD_BUG_ON is considered
>>>> unreachable code; however, such statement can be moved earlier
>>>> with no functional change.
>>>
>>> First: Why is this deemed dead code in its present position, but okay 
>>> when
>>> moved? Second: While moving is indeed no functional change (really
>>> BUILD_BUG_ON() can be moved about anywhere, for not producing any code 
>>> in
>>> the final binary), it removes the connection between it and the 
>>> respective
>>> asm() (where %z would have been nice to use).
>>
>> Oh, and third: Which string literal? I expect you're not building with
>> an ancient compiler, so it got to be
>>
>> #define BUILD_BUG_ON(cond) ({ _Static_assert(!(cond), "!(" #cond ")"); 
>> })
>>
>> which you see in use. Yet that string literal isn't "code" or "data", 
>> but
>> an argument to _Static_assert(). Is Eclair perhaps not properly aware 
>> of
>> _Static_assert()?
> 
> On further inspection, this should have fallen into the deviation for 
> pure decls. This patch can be dropped, we'll adjust this inside ECLAIR.

What's the connection to "pure" here? Or are you merely piggybacking on
that attribute for this non-function?

Jan

