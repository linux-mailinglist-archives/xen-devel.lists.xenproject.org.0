Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 144939B371B
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 17:51:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826857.1241282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5Sxm-0002vK-8F; Mon, 28 Oct 2024 16:51:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826857.1241282; Mon, 28 Oct 2024 16:51:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5Sxm-0002t9-5e; Mon, 28 Oct 2024 16:51:30 +0000
Received: by outflank-mailman (input) for mailman id 826857;
 Mon, 28 Oct 2024 16:51:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xGmR=RY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t5Sxk-0002t3-Td
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 16:51:28 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df2ac2ec-954c-11ef-99a3-01e77a169b0f;
 Mon, 28 Oct 2024 17:51:26 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-37d4ba20075so3140089f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 09:51:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b1c65dsm10081049f8f.8.2024.10.28.09.51.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 09:51:25 -0700 (PDT)
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
X-Inumbo-ID: df2ac2ec-954c-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730134286; x=1730739086; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0rz/59PHBpXoBsl7vxH3GezQoa7axSB1Thsr4A7l8zg=;
        b=ReiXRgq0zYzbmjsvRuJFh9iAfm0jIDzM+WA91L57lmmK2RTtDIAFPtJxzBKgcyc54d
         v0sh6/Wz12EOciC2kCcZqbHklD6smlK/iftwKCI7ICoB0ow6zCgJqR3aNx/6sx9SI73g
         rH2yWyn2v6EXeEWSkFU6OKLrvDkUTPqsZFnBNVtP59s7zGVLGnvurfZC7C5zLMupyYuW
         tC2mu6ovjW4j6/MqI+qCkfDobAJKFPPiTv/KFX0GX5D/v+9fabFZkCZ4mCa8Wyxo1s+S
         cRTTWpqhZ3W/3T7PxIIlVcJG7prBZ4KHGd1IfCo4BY9IC8M6OhW/4xtQJssg+bRdmvmn
         U4bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730134286; x=1730739086;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0rz/59PHBpXoBsl7vxH3GezQoa7axSB1Thsr4A7l8zg=;
        b=IrKiEP2Q+O7a3ubWnqfutQojlqJZDzvkzw+/PDJRuWrkuZw1P5hT7EH85xkJCZRS5L
         2//YHkiKnaetY8hbb2RwZJ89zsKQewtOiziRJgqkINOr5MviwYNl58dZ5wGRLLfU8nrc
         //Bq6OjkQIxWMMnx6bL9giI/kKmgNtLuAzAJ4tfKYW66Sm94AGeQLVIRvdZp6dESayWo
         YC/MM0fHRU8wtYCGQUkSnLj0C/cGVn2lAdSXeznFfVoelilaj6OaIlFLi/PuyYQIu8fQ
         /UiPvrisPJHutRAVSVLzfphezM2m0myaWCwaU7lo36oSvgnY4i+V/SFOF2IFOryHlFw6
         yYtA==
X-Forwarded-Encrypted: i=1; AJvYcCXSAxtdxSsSgwy6MbljdzYMgzUEZm2+1MJjikBt5h95yE7s8ZXcYtjkUuF5xvDSy4VIXLpMoaMZsY8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzl6AJS4q2ieHH6+ovVJlYC7YzHBG2WOFijkStOcUWb1wVT2qpQ
	1EQuW4PfGo0iLPvk0biUnQ9piR1PQRw7v+AqkdHdUIEWvwRRPnVBE1SCUPYiRw==
X-Google-Smtp-Source: AGHT+IF/jZbQb4EcN0DPhjPajQ01OwFaSAigUZDaNdR0zlPm9ag7cEGvIO8GePTHEuT2/pBfI/u0Og==
X-Received: by 2002:a5d:5346:0:b0:37e:c4e3:f130 with SMTP id ffacd0b85a97d-380612007c6mr7104004f8f.41.1730134286005;
        Mon, 28 Oct 2024 09:51:26 -0700 (PDT)
Message-ID: <fee34f7d-6d2e-44c6-aa76-e1d6d4856ddf@suse.com>
Date: Mon, 28 Oct 2024 17:51:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] earlycpio: constify find_cpio_data()'s "data" parameter
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b2fdb048-cfc5-4f61-8507-bf8020e02132@suse.com>
 <764c0116-88ed-48af-8e53-f2a0f6e850a3@citrix.com>
 <c618e09f-b88c-45c8-8cbd-8aae82891c6e@suse.com>
 <ecd11958-2ce8-41fc-87f8-7b6b090c74b5@citrix.com>
 <aab91022-5115-4af0-8f9d-569c63a296bb@suse.com>
 <f8f4e221-fbf1-4e0b-98d0-bc19e0c604a9@citrix.com>
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
In-Reply-To: <f8f4e221-fbf1-4e0b-98d0-bc19e0c604a9@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.10.2024 17:45, Andrew Cooper wrote:
> On 28/10/2024 4:25 pm, Jan Beulich wrote:
>> On 28.10.2024 17:18, Andrew Cooper wrote:
>>> On 28/10/2024 4:12 pm, Jan Beulich wrote:
>>>> On 28.10.2024 17:07, Andrew Cooper wrote:
>>>>> On 28/10/2024 4:03 pm, Jan Beulich wrote:
>>>>>> As with 9cbf61445cda ("xen/earlycpio: Drop nextoff parameter"): While
>>>>>> this is imported from Linux, the parameter not being pointer-to-const is
>>>>>> dubious in the first place and we're not plausibly going to gain a write
>>>>>> through it.
>>>>>>
>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>> You haven't tried compiling this, have you?
>>>> Of course I have. Is there any subtlety with compiler versions? Or what
>>>> else am I missing?
>>> struct cpio_data's copy of this field is non-const (which you keep on
>>> noting that new compilers will object to),
>> New compilers? I'm afraid I'm missing context. With gcc14 the patch builds
>> fine. I didn't try _older_ ones (but I see no reason why they might object;
>> see below).
>>
>>> and you can't change that
>>> without breaking the build in microcode.
>> I don't need to change that, "thanks" to
>>
>> 			cd.data = (void *)dptr;
>>
>> casting away const-ness. That is - compilers ought to be fine with the
>> change; Misra won't like it.
> 
> You have literally complained about patches of mine on the grounds of
> "GCC is about to start caring about casting away const on a void pointer".

I still don't remember what context this was in, I'm sorry.

> So which is it.

I'm not adding any such casts; the (potentially problematic) cast is
there already. I therefore still don't see what's wrong with the patch.

>>> Nothing of this form can be taken until the constness is consistent in
>>> microcode, after which yes it can mostly become const.
>> We can move there in steps, can't we?
> 
> Or you can stop trying to insist that I rebase around an
> incorrect/incomplete patch, just for the sake of the const of one void
> pointer, which can still be laundered by this function.

Okay, I won't insist; take my ack as unconditional one. I still consider
it a bad precedent though that we'd set, when elsewhere we ask for const-
correctness wherever possible.

> Especially when you could wait the ~day it will take to get an
> otherwise-good series in, and then change cpio and get all of the const
> problems in one go.

If that turns out to be true, all will indeed be fine in the end. Question
is whether we really want to diverge earlycpio.c by more than minimal
changes.

Jan

