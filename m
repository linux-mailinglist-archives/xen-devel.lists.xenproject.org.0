Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0524BB3E0F2
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 13:06:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104450.1455502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut2Me-00030n-Di; Mon, 01 Sep 2025 11:06:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104450.1455502; Mon, 01 Sep 2025 11:06:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut2Me-0002zI-AU; Mon, 01 Sep 2025 11:06:20 +0000
Received: by outflank-mailman (input) for mailman id 1104450;
 Mon, 01 Sep 2025 11:06:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wdOO=3M=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ut2Md-0002zB-68
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 11:06:19 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae8ff5f8-8723-11f0-8dd7-1b34d833f44b;
 Mon, 01 Sep 2025 13:06:17 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-45b7d497ab9so36303875e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 04:06:17 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d0b9402299sm13918384f8f.18.2025.09.01.04.06.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 04:06:16 -0700 (PDT)
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
X-Inumbo-ID: ae8ff5f8-8723-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756724777; x=1757329577; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yjy4r8CxSau9HWpgnwP6xnZso1qjHrdX2I5alpTzcQI=;
        b=I9/vbXwyV4336w3offsjXt/E0uBAuXXjgjTHymHcBQ6n2iY/0AUnj0LLBONsANhXEX
         +s2gn2aqcaqZDBpl6zw7WaYEQI/5979rbmPyL2vtQhC/R1rUs9X+I/UtoWLZnEASRqhB
         mEZ8tQV0kdtTK5IygFbaEeVP9hCwrgSRomXL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756724777; x=1757329577;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yjy4r8CxSau9HWpgnwP6xnZso1qjHrdX2I5alpTzcQI=;
        b=ailEy8l5jM4c+h/whB0cIAG/SI3rRncYyUl2yVKbUSN8NdjYvl1wFt9uY2OIJMfRl3
         yuz5m9SO63ZDOe9oYTG7zc/fxSTV4mgZ981mjRAEhnoj1kcEf0nUmt68PgxUsAn6B2sM
         MMawAkJwA0nyyRYsjrX+hE84y9D4j36AcU1rL8S2a650hXrKuvN59x+zC0HbnTPZ8M6I
         OhZ5AMz6+WiP2PCM+WZA0fUH9tnsNnW62HqJiVAF8LWIWAL3B99pfwtL3/fBiVbmg3VM
         icu/FJgB54DQe1yVsdfQm0JHbgs/pu1FhNjGZ/BxmsrPF6OU8L/XVdT9wDEOUH9M6tLC
         R0gQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcr96eCCajbXN90D2auDNSujI0aKkxGksiJlgbnGsIn+zZEr4uhLBiA43wn5L9zoBFvD+na/1cYeg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwqHSyyecoIN9V6XH1sH5V+fe/LysbqgRjPwCXHERB3g8dcRdgO
	esf3Jt+bnVWzsFL8bLa36a+hlmN4FVoBH7qDLpyipP9XsCExoVKMgGWJht+btuNrh7g=
X-Gm-Gg: ASbGncudijkrT2TK/Z25S8JygSoVbbRPNKqFp+mKj3tfzmsJoFjW8VdKp1af/HvTMZj
	FpqBPb66ihuLKqDXTag8MyZjOMIo/buCUCeYJGScE7PxJpSjCNjxWyK2isFChwiTD3qPrvlmp7i
	ENHSZPYnL9y/Oz+jCvFfZw2wZNO2vW8OjWekXTryh0ffDSfqysLz4qDrLhjnVn2xs0Aq550OO+M
	XyrY6PzpaOSoCE25mqXvlCPYFwpF/0C0EsWNaXyqturpkExY90yyrs3Wo2/98ERKTJwsbSM+RkS
	6f9HAI0ugxiQEGx3PBMFvmz68tEB6ZFDntabGxK9OYTILlSTU7x/CKkQlzT7u9OWTniuQsA9auo
	Jgpk6ynnZgesz2Su+2RRWW9de5PV39mCvr8XJzG6ru+LS1cB4vHRg6R3oGfUo9s6sBkuOCVXm1M
	FkPoI=
X-Google-Smtp-Source: AGHT+IEplDcJAkQVkk7Z/wNtbk8hnX050Ak0zbsjhu8/2pr0ZoTKCrvgrrF7OtivxAlrSTla9JtjrQ==
X-Received: by 2002:a05:600c:1e87:b0:45b:47e1:ef68 with SMTP id 5b1f17b1804b1-45b855bec6emr58422695e9.35.1756724776573;
        Mon, 01 Sep 2025 04:06:16 -0700 (PDT)
Message-ID: <b382c150-d3e9-4536-85fc-f4a11bc270fb@citrix.com>
Date: Mon, 1 Sep 2025 12:06:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/gen-cpuid: correct cycle detection
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <41ba214a-6137-4d8f-9f4f-3a362940d8a8@suse.com>
 <327eb40c-8fcb-42dc-a0b2-3b756a566b23@citrix.com>
 <a0f6d7fb-2442-47b6-a0bc-c8b9b3b34079@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <a0f6d7fb-2442-47b6-a0bc-c8b9b3b34079@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/09/2025 12:02 pm, Jan Beulich wrote:
> On 01.09.2025 12:31, Andrew Cooper wrote:
>> On 01/09/2025 9:56 am, Jan Beulich wrote:
>>> With the processing done linearly (rather than recursively), checking
>>> whether any of the features was previously seen is wrong: That would
>>> e.g. trigger for this simple set of dependencies
>>>
>>>     X: [A, B]
>>>     A: [C]
>>>     B: [C]
>>>
>>> (observed in reality when making AMX-AVX512 dependent upon both
>>> AMX-TILE and AVX512F, causing XSAVE to see AMX-AVX512 twice in its list
>>> of dependents). But checking the whole accumulated set also isn't
>>> necessary - just checking the feature we're processing dependents of is
>>> sufficient. We may detect a cycle later that way, but we still will
>>> detect it. What we need to avoid is adding a feature again when we've
>>> already seen it.
>>>
>>> As a result, seeding "seen[]" with "feat" isn't necessary anymore.
>>>
>>> Fixes: fe4408d180f4 ("xen/x86: Generate deep dependencies of features")
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>, with one further
>> minor adjustment.
> Thanks.
>
>>> --- a/xen/tools/gen-cpuid.py
>>> +++ b/xen/tools/gen-cpuid.py
>>> @@ -379,14 +379,17 @@ def crunch_numbers(state):
>>>  
>>>              f = to_process.pop(0)
>>>  
>>> +            if f == feat:
>>> +                raise Fail("ERROR: Cycle found when processing %s" % \
>> No need for the \ here.
> Okay, but then why is there one in the commented out code you touch in the
> other patch?

Oh, that's wrong too.

That will have originally been a print statement (no brackets in py2,
thus needing the line continuation) which I refactored to
sys.stderr.write() (has brackets) and didn't clean up correctly.

I'll adjust it in my patch, as I'm dropping the trailing whitespace as well.

~Andrew

