Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A406C8C5680
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 15:05:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721490.1124945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6rqG-0004Dk-Kd; Tue, 14 May 2024 13:05:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721490.1124945; Tue, 14 May 2024 13:05:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6rqG-0004CA-Hj; Tue, 14 May 2024 13:05:16 +0000
Received: by outflank-mailman (input) for mailman id 721490;
 Tue, 14 May 2024 13:05:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0FJY=MR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s6rqF-0003t4-1a
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 13:05:15 +0000
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [2607:f8b0:4864:20::72e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a024633-11f2-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 15:05:14 +0200 (CEST)
Received: by mail-qk1-x72e.google.com with SMTP id
 af79cd13be357-78ef9ce897bso441213985a.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 06:05:14 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-792bf31171esm560024885a.116.2024.05.14.06.05.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 06:05:11 -0700 (PDT)
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
X-Inumbo-ID: 9a024633-11f2-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715691913; x=1716296713; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VZlzMx15mGmoqywlKLUPpZ7ZCTX2G3tkZqOGbbqWMAc=;
        b=A+wSwPwziKfPwZ23uiViNNiwRzK7Eg2EYl6N5pEadN12/j5Po2xYAAU31PvH06FBah
         F2gu8x6xqurYghQEh+t6789FEo9N9R6/INzp8Rn3ZXXEfnZeQisAwkTkUD4TqUMULswh
         B0uYtnrus8P93N/rDSgl47r5fxKAHNXSroh1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715691913; x=1716296713;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZlzMx15mGmoqywlKLUPpZ7ZCTX2G3tkZqOGbbqWMAc=;
        b=s9jl1O6hpRXBtX69mijzHEs39VxZnZpV/9VCfUwy+GoBigI7OeAXlYJz0t4RhulMTP
         dkJSTawKOD43aqLhwC2qDg58WbfzfB+C6G5govJ3/i8zwvaPTgFEjVVRb/lFtmK1Uxjz
         50E1HyvKCAveC5+3U3EdfbjDNkjF9qUQtNYLyT4o72rgyiTqATh/jdyjfy+mzTzzeRDx
         B0dKLdGIQii0pYCiXHbUIShfHgotNbHv4u1mPEG6gOs64TANbN/FlyTfjw65YvrxvpQS
         vvhZ/nMVj0MMg5gmKtyoF0fK/bBcB6sMIJaezNH+xcgOmiN80Q+/sO1qzQu78VzgehnK
         MyqQ==
X-Gm-Message-State: AOJu0YwZcQdkoj83ASpkremn9aC0veg9AaBtXxc1ICbS7dAAvSsHwX/v
	jC+hL2z1jAjMKXs6O34eEwxOzfzJrcS0Cc/9XxDAgAv55HQRTg9jyga98Vwe2gQ=
X-Google-Smtp-Source: AGHT+IFIrovBvZy989qWX0hkNMjIMDALIASpmB3kYTBnDq+FwonlN1GJ2ZHEWGOD8W6HIVET9eI3/w==
X-Received: by 2002:a05:620a:254d:b0:792:7f5d:46a8 with SMTP id af79cd13be357-792c75f44ccmr1749144985a.56.1715691912729;
        Tue, 14 May 2024 06:05:12 -0700 (PDT)
Message-ID: <58577656-d1c9-4f54-9526-83bdbcaa37a6@citrix.com>
Date: Tue, 14 May 2024 14:05:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] tools/xen-cpuid: Use automatically generated feature
 names
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>
References: <20240510224002.2324578-1-andrew.cooper3@citrix.com>
 <20240510224002.2324578-4-andrew.cooper3@citrix.com>
 <ZkMYXSf9abR3J3FE@macbook>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZkMYXSf9abR3J3FE@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/05/2024 8:53 am, Roger Pau Monné wrote:
> On Fri, May 10, 2024 at 11:40:01PM +0100, Andrew Cooper wrote:
>> diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
>> index 6ee835b22949..2f34694e9c57 100644
>> --- a/tools/misc/xen-cpuid.c
>> +++ b/tools/misc/xen-cpuid.c
>> @@ -11,6 +11,7 @@
>>  #include <xenguest.h>
>>  
>>  #include <xen-tools/common-macros.h>
>> +#include <xen/lib/x86/cpuid-autogen.h>
>>  
>>  static uint32_t nr_features;
>>  
>> @@ -268,7 +269,7 @@ static const struct {
>>      const char *name;
>>      const char *abbr;
>>      const char *const *strs;
>> -} leaf_info[] = {
>> +} leaf_info[FEATURESET_NR_ENTRIES] = {
> Won't it be best to not specify the number of array elements here, as
> we could then use a BUILD_BUG_ON() to detect when new leafs are added
> to the featureset and thus adjust xen-cpuid.c?  Otherwise new
> additions to the featureset will go unnoticed.

Hmm.  I suppose we have the same in libxl_cpuid.c so we should do so here.

I'll do an adjustment.

>
>>      { "CPUID 0x00000001.edx",        "1d", str_1d },
>>      { "CPUID 0x00000001.ecx",        "1c", str_1c },
>>      { "CPUID 0x80000001.edx",       "e1d", str_e1d },
>> @@ -291,6 +292,9 @@ static const struct {
>>  
>>  #define COL_ALIGN "24"
>>  
>> +static const char *const feature_names[(FEATURESET_NR_ENTRIES + 1) << 5] =
>> +    INIT_FEATURE_VAL_TO_NAME;
> I've also considered this when doing the original patch, but it seemed
> worse to force each user of INIT_FEATURE_VAL_TO_NAME to have to
> correctly size the array.  I would also use '* 32', as it's IMO
> clearer and already used below when accessing the array.  I'm fine
> if we want to go this way, but the extra Python code to add a last
> array entry if required didn't seem that much TBH.

I was looking to avoid the other BUILD_BUG_ON()'s, and in particular
bringing in known_features just for a build time check.

Given that there's only one instance right now, and no obvious other
usecase, I'd say this is better.  In terms of just xen-cpuid.c, it's
clearly correct whereas leaving it implicitly to
INIT_FEATURE_VAL_TO_NAME is not.

>
>> diff --git a/xen/tools/gen-cpuid.py b/xen/tools/gen-cpuid.py
>> index 79d7f5c8e1c9..d0bb2e4a229f 100755
>> --- a/xen/tools/gen-cpuid.py
>> +++ b/xen/tools/gen-cpuid.py
>> @@ -470,6 +470,27 @@ def write_results(state):
>>      state.output.write(
>>  """}
>>  
>> +""")
>> +
>> +    state.output.write(
>> +"""
>> +#define INIT_FEATURE_VAL_TO_NAME { \\
>> +""")
>> +
>> +    for name, bit in sorted(state.values.items()):
>> +        state.output.write(
>> +            '    [%s] = "%s",\\\n' % (bit, name)
>> +            )
>> +
>> +        # Add the other alias for 1d/e1d common bits
>> +        if bit in state.common_1d:
>> +            state.output.write(
>> +                '    [%s] = "%s",\\\n' % (64 + bit, name)
>> +            )
> Had no idea we had this aliases.

Without this, you get a bunch of numbers when rendering e1d for known
features (all hardware), and all dynamic policies on AMD/Hygon hardware.

~Andrew

