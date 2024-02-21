Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7027985D599
	for <lists+xen-devel@lfdr.de>; Wed, 21 Feb 2024 11:32:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683938.1063567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcju3-0000tY-0S; Wed, 21 Feb 2024 10:32:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683938.1063567; Wed, 21 Feb 2024 10:32:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcju2-0000qc-Ty; Wed, 21 Feb 2024 10:32:38 +0000
Received: by outflank-mailman (input) for mailman id 683938;
 Wed, 21 Feb 2024 10:32:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TA2L=J6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rcju1-0000qT-Mu
 for xen-devel@lists.xenproject.org; Wed, 21 Feb 2024 10:32:37 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87cb8e8c-d0a4-11ee-8a53-1f161083a0e0;
 Wed, 21 Feb 2024 11:32:36 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-564d9b0e96dso1909125a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 21 Feb 2024 02:32:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 q29-20020a50cc9d000000b00563a3ff30basm4767647edi.59.2024.02.21.02.32.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Feb 2024 02:32:35 -0800 (PST)
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
X-Inumbo-ID: 87cb8e8c-d0a4-11ee-8a53-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708511556; x=1709116356; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7h4uJdEKu2CZ2gxhOJx5jx71sYHCisevUny+2+RNbFU=;
        b=PAdRi2/Wzo+azYDJBu1eNkbc626VjVe9SAPrsnCWFFTQuLZpdmVcJbfadZwELEtX9/
         UJONa6uzTtrUiiJOU53tLd9gOkojW/L+DHZ4SvPkjJgwLUbGK5qIkAaZ25VJmgYer+Vo
         AjeeP7wVvB4ZOuIvmDol9BTIOXAj6Tl/4c7qHCec0WhlHD8gq4UuQI/ss/9793RbNzSu
         qtQcieYarcjhuIr+nlQYPoWQxYyU/i+EJnfcEYPdiuXS6kZhHf8T1tivGkf5EXPsdNCd
         fzpxNtI+rf4ln9CAqoc47Dql9jIegcddgB4rJI8+V9sP8DZ6kVOLXdGs66npFpuPjJDx
         VJvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708511556; x=1709116356;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7h4uJdEKu2CZ2gxhOJx5jx71sYHCisevUny+2+RNbFU=;
        b=ObCuyoboCf20lyL4zjUPJl4gFo8haMj6tlkZOXVEiz9o/yzC5/DKd6mR53Zy3nBfbz
         Q5+sZQxJD+nV80fJXOAJ2cdvx2evjqWYq4ol53qOJ1JWrP1dz+m1B/XmuQCTKHOFwmJJ
         BQSMeyNKyE0FOgV+BgZ+928y6OU4dGhyzr4OOnIEoiA6In59lQ4c3bKARTj0PdwiMl5S
         GBUPhHDg8zGMcWsQvqfpty8wHeW+hOdg3KxfvJyY9i5aNMfU8veFC/HxFbN+7UIhhbMI
         iPgP/H1+I/Y4vkSna36NuaWKmy+9fkhu7YCBPA6DJjT9tm07zGVIYw+jo1F+HXyBeqGR
         AO6w==
X-Forwarded-Encrypted: i=1; AJvYcCWyvxOEa5tRcBmYBTzudY79wPNb7RbrsXPuy8u4L0W/clHrTPAPhMMvt8oePt2gwIma39+/Thxm1ZMBMgcT6wsO5nfdf4KJL87tjbQR5bU=
X-Gm-Message-State: AOJu0Yw3kjaNVOZXqXh/0lq0KvYou44u7ILhxQMtLrt3z7GxCsNkO8Or
	QSwhJ4TGl+3BIJuhiCbE7J/VxygM0LwIsMGiSxKtXmCIyPOS/CmGt22NyxyeeQ==
X-Google-Smtp-Source: AGHT+IEApuCKf6SmUPmwql2xgmSZSO/BbQ86WTWMc2R6ueDTLctemSCEwDnYSAWJneRQL39l7IgsLQ==
X-Received: by 2002:a05:6402:608:b0:564:3bca:8bb7 with SMTP id n8-20020a056402060800b005643bca8bb7mr7968056edv.12.1708511556307;
        Wed, 21 Feb 2024 02:32:36 -0800 (PST)
Message-ID: <2002c36b-1e48-4778-abb3-c2d12189df50@suse.com>
Date: Wed, 21 Feb 2024 11:32:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] almost fully ignore zero-size flush requests
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a0a7fa35-4615-4a9b-9887-569353f05e33@suse.com>
 <26ff8f42-2a76-4f8d-9af6-5830b0aae739@suse.com>
 <7dd78c97-b82f-4ae1-a257-98f612c6bad2@xen.org>
 <6466155e-9883-4743-a897-ef565f14fdf0@suse.com>
 <a2348c5f-39ce-42f3-ad2a-a5edf88352e9@xen.org>
 <d0090122-c013-4dbf-97a2-3003352433a1@suse.com>
 <3a277c20-462d-44f1-bedb-dc0adba04224@xen.org>
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
In-Reply-To: <3a277c20-462d-44f1-bedb-dc0adba04224@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.02.2024 10:34, Julien Grall wrote:
> Hi,
> 
> On 20/02/2024 12:25, Jan Beulich wrote:
>> On 20.02.2024 12:52, Julien Grall wrote:
>>> Hi Jan,
>>>
>>> On 20/02/2024 08:26, Jan Beulich wrote:
>>>> On 19.02.2024 23:22, Julien Grall wrote:
>>>>> Title: I would add 'gnttab:' to clarify which subsystem you are modifying.
>>>>
>>>> That's how I actually have it here; it's not clear to me why I lost the
>>>> prefix when sending.
>>>>
>>>>> On 05/02/2024 11:03, Jan Beulich wrote:
>>>>>> Along the line with observations in the context of XSA-448, besides
>>>>>> "op" no field is relevant when the range to be flushed is empty, much
>>>>>> like e.g. the pointers passed to memcpy() are irrelevant (and would
>>>>>> never be "validated") when the passed length is zero. Split the existing
>>>>>> condition validating "op", "offset", and "length", leaving only the "op"
>>>>>> part ahead of the check for length being zero (or no flushing to be
>>>>>> performed).
>>>>>
>>>>> I am probably missing something here. I understand the theory behind
>>>>> reducing the number of checks when len == 0. But an OS cannot rely on it:
>>>>>      1) older hypervisor would still return an error if the check doesn't
>>>>> pass)
>>>>
>>>> Right, but that's no reason to keep the bogus earlier behavior.
>>>
>>> Hmmm... I am not sure why you say the behavior is bogus. From the commit
>>> message, it seems this is just an optimization that have side effect
>>> (ignoring the other fields).
>>
>> I don't view this as primarily an optimization; I'm in particular after
>> not raising errors for cases where there is no error to be raised.
>> Hence the comparison to memcpy(), which you can pass "bogus" pointers
>> so long as you pass zero size.
> 
> The part I am missing is why this approach is better than what we have. 
> So far what you described is just a matter of taste.
> 
> To give a concrete example, if tomorrow a contributor decides to send a 
> patch undoing what you did (IOW enforcing the check for zero-length or 
> replace | with two branches), then on what grounds I will be able to 
> refuse their patch?

On the grounds of the argument I gave before: Consistency with other
more or less similar operations, where length 0 simply means "no-op",
up to and including "no errors from arguments specifying the address(es)
to operate on".

Jan

