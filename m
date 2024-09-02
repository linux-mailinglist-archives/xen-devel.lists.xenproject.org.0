Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1015396818E
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 10:20:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.787615.1197031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl2Ht-0003Sn-Ol; Mon, 02 Sep 2024 08:19:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 787615.1197031; Mon, 02 Sep 2024 08:19:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl2Ht-0003Qe-KM; Mon, 02 Sep 2024 08:19:49 +0000
Received: by outflank-mailman (input) for mailman id 787615;
 Mon, 02 Sep 2024 08:19:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uQw9=QA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sl2Hr-0003QX-Rz
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 08:19:47 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1cc2485d-6904-11ef-99a1-01e77a169b0f;
 Mon, 02 Sep 2024 10:19:45 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a86a37208b2so449315266b.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 01:19:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89891d72c3sm529261166b.147.2024.09.02.01.19.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Sep 2024 01:19:44 -0700 (PDT)
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
X-Inumbo-ID: 1cc2485d-6904-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725265185; x=1725869985; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Iu6+MRZjsBLYB6iduGse1EV7wkBNhB7w4LnLbF+fNwA=;
        b=D+BViakdZaO3HDBY2XeVqWOu0c13oVJEofcv5XKJVOtyDELyd8gXzBh2V5iXjaLD0N
         PvQgeHK/h5Y7YTICgG/AjSzhX3lgIs6se0psOFDMaFVh8F1aBWHjVrfQtWrfsl+Ll6ST
         JgkxeX9G0Ue8L0q+5RZ0AqgBjKX0uGPtxSXAvEUUU3HsEs9B26sqGD4WTqdBuVy0+oNC
         yMER3ucQoAYZaDudcSsTXpM0uSGA3aLoG65s4cdOmWQdwp0EDAAQRiYq9yFOYnw1xTtp
         84RVhUikbN7xUdU/3vDLO6ZZE3mRSZv0J3P1VLOOVz5DG/2P25wsHJ9TuZ1dEVNJ8D8b
         jXEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725265185; x=1725869985;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iu6+MRZjsBLYB6iduGse1EV7wkBNhB7w4LnLbF+fNwA=;
        b=W8IEoF4nL+BmIMd07dstTe/d94+IWZPAMluCU5XmzR5epdKV6aV9ea5ym4BWuYIy18
         UKM1Yr7NK++kk/l+cwOl5biS2EauLisN5rCuc+lO8jWSOOTs7ohAWGZHtIP90pZOQMdy
         NbWmfWwV4D8LT2HeJyne3ylisJQmf73V0Xk0iJhY+yT7e3Zbo7adwMjZLJcRBEAOxTrI
         E9pBEpr59Msz4BX1p/BiotuYTLCwMGcRkIlhBr5JG6Ts2R5Fc0rUA2k7niq3i8O2swqh
         KLFR467dr4ITJDw6OvmsZZ0EvbJMjarB6x8FF7F52+y+sw8tGZlbH2i2jp0oMWZW5/yl
         1wHg==
X-Forwarded-Encrypted: i=1; AJvYcCWedvvRavQecDL4WawaFZHD4jFDCju+4qPcvWxdQ39Q5U8ca49G2mduzaRf9PEnY+sxRvLaxtpfHdI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YziEp1i/VksYwChvH1foEwghJCbwqeLfVtHw8+DbZG8Oo0oR0EV
	wAiZ0F3eV492Bn6J3wVPNLbXI4JXgBZ8k95/O59++Rv3dR2xG89co2NUfpXoYg==
X-Google-Smtp-Source: AGHT+IEWA5qITxVMrv9ahAdjLLBXGIAvJvbdYJ7OCNQBR1ss9ofHcpHzY1sctvqm1nxI3Uyabvzaww==
X-Received: by 2002:a17:907:869f:b0:a86:851e:3a2b with SMTP id a640c23a62f3a-a897f8bc9b9mr1114489366b.29.1725265185112;
        Mon, 02 Sep 2024 01:19:45 -0700 (PDT)
Message-ID: <f6eb3bd6-31f0-433c-a353-0abdec17e350@suse.com>
Date: Mon, 2 Sep 2024 10:19:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/libs/store: add missing USE_PTHREAD to target .o
To: Andrei Stan <andreistan2003@gmail.com>
References: <20240705145910.32736-3-andreistan2003@gmail.com>
 <36ad6b62-9186-41e3-bfa7-7a6d81d9efe1@suse.com>
 <CAH=Ecdj8PThEpMckjbciHhxK6H4K0qeympJvd5uQ=pX_G6rOFQ@mail.gmail.com>
 <CAH=EcdidfuPaxxL-Fz29KZ4ZeDTDVwcEWgTv6G2Z3EP7mcEZ9A@mail.gmail.com>
Content-Language: en-US
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@vates.tech>
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
In-Reply-To: <CAH=EcdidfuPaxxL-Fz29KZ4ZeDTDVwcEWgTv6G2Z3EP7mcEZ9A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31.08.2024 12:34, Andrei Stan wrote:
> Ping

This is pinging what exactly? From ...

> On Fri, Jul 5, 2024 at 7:05 PM Andrei Stan <andreistan2003@gmail.com> wrote:
>>
>> On Fri, Jul 5, 2024 at 6:22 PM Jürgen Groß <jgross@suse.com> wrote:
>>>
>>> On 05.07.24 16:59, Andrei Stan wrote:
>>>> Currently only shared libraries build with USE_PTHREAD enabled.
>>>>
>>>> This patch adds the macro also to xs.o.
>>>>
>>>> Backport: 4.18+ # maybe older
>>>> Signed-off-by: Andrei Stan <andreistan2003@gmail.com>
>>>
>>> Commit dde3e02b7068 did that explicitly, stating that phtreads are
>>> not compatible with static linking.
>>>
>>> Was that reasoning wrong?

... Jürgen's question it imo follows that ...

>>>> ---
>>>>   tools/libs/store/Makefile | 1 +
>>>>   1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/tools/libs/store/Makefile b/tools/libs/store/Makefile
>>>> index 0649cf8307..c6f147c72f 100644
>>>> --- a/tools/libs/store/Makefile
>>>> +++ b/tools/libs/store/Makefile
>>>> @@ -20,6 +20,7 @@ CFLAGS += -include $(XEN_ROOT)/tools/config.h
>>>>   CFLAGS += $(CFLAGS_libxentoolcore)
>>>>
>>>>   xs.opic: CFLAGS += -DUSE_PTHREAD
>>>> +xs.o: CFLAGS += -DUSE_PTHREAD
>>>>   ifeq ($(CONFIG_Linux),y)
>>>>   xs.opic: CFLAGS += -DUSE_DLSYM
>>>>   endif
>>
>> It was a pretty nasty situation, giving some context, this is for a Go based CLI
>> tool and some things in there are multithreaded, but i don't think
>> calling in the
>> bindings happens anywhere in parallel. Without this patch there would be
>> some sort of race conditions (or so I assume from the debugging i've done)
>> happening withing the xen/tools code, making it impossible to start a domain.
>>
>> In this case there were no issues in linking pthreads statically. I was not even
>> aware of that being a possible issue. Is it really?
>>
>> Also I am not too sure how much that code path is actually tested, probably the
>> majority of the testing is done with dynamic builds.

... this answer is insufficient, from two angles:
- You do in no way answer the question itself, as such an answer would clearly
  need to say something about the commit Jürgen pointed you at.
- It needs to be in the patch description, not just in a reply on list. IOW a
  re-submission is needed anyway.

Jan

