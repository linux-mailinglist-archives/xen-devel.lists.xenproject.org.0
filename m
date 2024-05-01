Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C408B88AD
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2024 12:40:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715282.1116811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s27NO-0003A3-Pk; Wed, 01 May 2024 10:39:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715282.1116811; Wed, 01 May 2024 10:39:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s27NO-00036u-N6; Wed, 01 May 2024 10:39:50 +0000
Received: by outflank-mailman (input) for mailman id 715282;
 Wed, 01 May 2024 10:39:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f0p4=ME=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s27NN-00036o-DB
 for xen-devel@lists.xenproject.org; Wed, 01 May 2024 10:39:49 +0000
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [2607:f8b0:4864:20::732])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 210ca086-07a7-11ef-909b-e314d9c70b13;
 Wed, 01 May 2024 12:39:48 +0200 (CEST)
Received: by mail-qk1-x732.google.com with SMTP id
 af79cd13be357-790f699eb2cso281325685a.1
 for <xen-devel@lists.xenproject.org>; Wed, 01 May 2024 03:39:48 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 i19-20020a05620a0a1300b00790f72d03c7sm2498032qka.126.2024.05.01.03.39.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 May 2024 03:39:44 -0700 (PDT)
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
X-Inumbo-ID: 210ca086-07a7-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714559986; x=1715164786; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=l+LNw8JZHG9WJfE9wedst1re3+8Hol5mGi1tU7NxzNU=;
        b=jhmwf3NjcXl26/t23BtdS7Hhbt9rpCcHJ7yyL+l34bvgv1umkSt/L/H0AbTzZhjWZQ
         T4PvAYX72jpi5P6kFShWbJRFHPXbDwVXRdPn2oQjga/cgj3KHqwPQZBJxMRFzwD56rg+
         ukqVnV0kbIyt1RhKZqKiZk3F+1CZHednkYbmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714559986; x=1715164786;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+LNw8JZHG9WJfE9wedst1re3+8Hol5mGi1tU7NxzNU=;
        b=tFnd+TjUf0dJW7+nfh5Qc8MpoiITJBfSprIYVf7vqTY5qAppmDIcGA1kVOaG2IkTw5
         BTu07mnz+iAnJ/3j6NEZ9gd5J9PNO+MfeTciLv3DkFivRMJiJptzAvYkwqP+vSL/BLPp
         m0RBKXFiUgfS4IGGAq38oIUgfXIBoWFuwSPBM+cTDPsg6po1gRg4Y82tKfBrgaDbk0S2
         tWQXws8i/HC80nBuVvjNB8TXchW0X3qTC4At0tn2cYwv4QH09as/pKvaKo2LtrQtaERk
         PYaY+np9FqXGXdDSFVQSeLljEsE/Kn5K56AQfvA5otqLLFblzh0s9Cg+b5zhdEjEti0C
         0LIg==
X-Gm-Message-State: AOJu0YzMAblhtdi/re9oe9Am391kVv1SkiOt0fXqMTo1N48rrvVnBqMI
	W4PCc1ydt4IjhbmUAx7W/rRPX5/OzkGfDIdzqo/IytLqr8KMeApX4YlUJOUDQ4c=
X-Google-Smtp-Source: AGHT+IHcA3ENrP5Sbnhq8D+gW9T469J7yAaO3FK18Tz14H0zR8tSOGxUxJ1+xntMF5Svn6IS9sVyMg==
X-Received: by 2002:a05:620a:2906:b0:790:8f24:51cc with SMTP id m6-20020a05620a290600b007908f2451ccmr2425178qkp.44.1714559985434;
        Wed, 01 May 2024 03:39:45 -0700 (PDT)
Message-ID: <c5efd98f-da49-414c-8427-8e4b2311f9bc@citrix.com>
Date: Wed, 1 May 2024 11:39:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] x86/cpu-policy: Add SVM features already used by Xen
To: George Dunlap <george.dunlap@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 Andrei Semenov <andrei.semenov@vates.fr>,
 Vaishali Thakkar <vaishali.thakkar@vates.tech>
References: <20240429151625.977884-1-andrew.cooper3@citrix.com>
 <20240429151625.977884-3-andrew.cooper3@citrix.com>
 <CA+zSX=Y_fcDLonuRZZCaaKjK87tXEnnvJGjJHrKy5wzvaC2rzA@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CA+zSX=Y_fcDLonuRZZCaaKjK87tXEnnvJGjJHrKy5wzvaC2rzA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/05/2024 11:00 am, George Dunlap wrote:
> On Mon, Apr 29, 2024 at 4:16 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>> These will replace svm_feature_flags and the SVM_FEATURE_* constants over the
>> next few changes.  Take the opportunity to rationalise some names.
>>
>> Drop the opencoded "inherit from host" logic in calculate_hvm_max_policy() and
>> use 'h'/'!' annotations.  The logic needs to operate on fs, not the policy
>> object, given its position within the function.
>>
>> Drop some trailing whitespace introduced when this block of code was last
>> moved.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
>> CC: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
>> CC: George Dunlap <george.dunlap@citrix.com>
>> CC: Andrei Semenov <andrei.semenov@vates.fr>
>> CC: Vaishali Thakkar <vaishali.thakkar@vates.tech>
>> ---
>>  tools/misc/xen-cpuid.c                      | 11 +++++++++++
>>  xen/arch/x86/cpu-policy.c                   | 17 +++++------------
>>  xen/include/public/arch-x86/cpufeatureset.h | 14 ++++++++++++++
>>  xen/tools/gen-cpuid.py                      |  3 +++
>>  4 files changed, 33 insertions(+), 12 deletions(-)
>>
>> diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
>> index ab09410a05d6..0d01b0e797f1 100644
>> --- a/tools/misc/xen-cpuid.c
>> +++ b/tools/misc/xen-cpuid.c
>> @@ -266,6 +266,17 @@ static const char *const str_m10Ah[32] =
>>
>>  static const char *const str_eAd[32] =
>>  {
>> +    [ 0] = "npt",                 [ 1] = "v-lbr",
>> +    [ 2] = "svm-lock",            [ 3] = "nrips",
>> +    [ 4] = "v-tsc-rate",          [ 5] = "vmcb-cleanbits",
>> +    [ 6] = "flush-by-asid",       [ 7] = "decode-assist",
>> +
>> +    [10] = "pause-filter",
>> +    [12] = "pause-thresh",
>> +    /* 14 */                      [15] = "v-loadsave",
>> +    [16] = "v-gif",
>> +    /* 18 */                      [19] = "npt-sss",
>> +    [20] = "v-spec-ctrl",
>>  };
>>
>>  static const char *const str_e1Fa[32] =
>> diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
>> index 4b6d96276399..da4401047e89 100644
>> --- a/xen/arch/x86/cpu-policy.c
>> +++ b/xen/arch/x86/cpu-policy.c
>> @@ -9,7 +9,6 @@
>>  #include <asm/amd.h>
>>  #include <asm/cpu-policy.h>
>>  #include <asm/hvm/nestedhvm.h>
>> -#include <asm/hvm/svm/svm.h>
>>  #include <asm/intel-family.h>
>>  #include <asm/msr-index.h>
>>  #include <asm/paging.h>
>> @@ -748,22 +747,16 @@ static void __init calculate_hvm_max_policy(void)
>>      if ( !cpu_has_vmx )
>>          __clear_bit(X86_FEATURE_PKS, fs);
>>
>> -    /*
>> +    /*
>>       * Make adjustments to possible (nested) virtualization features exposed
>>       * to the guest
>>       */
>> -    if ( p->extd.svm )
>> +    if ( test_bit(X86_FEATURE_SVM, fs) )
>>      {
>> -        /* Clamp to implemented features which require hardware support. */
>> -        p->extd.raw[0xa].d &= ((1u << SVM_FEATURE_NPT) |
>> -                               (1u << SVM_FEATURE_LBRV) |
>> -                               (1u << SVM_FEATURE_NRIPS) |
>> -                               (1u << SVM_FEATURE_PAUSEFILTER) |
>> -                               (1u << SVM_FEATURE_DECODEASSISTS));
>> -        /* Enable features which are always emulated. */
>> -        p->extd.raw[0xa].d |= (1u << SVM_FEATURE_VMCBCLEAN);
>> +        /* Xen always emulates cleanbits. */
>> +        __set_bit(X86_FEATURE_VMCB_CLEANBITS, fs);
>>      }
> What about this line, at the end of recalculate_cpuid_policy()?
>
>   if ( !p->extd.svm )
>         p->extd.raw[0xa] = EMPTY_LEAF;
>
> Is there a reason to continue to operate directly on the policy here,
> or would it be better to do this up in the featureset section?

That's still needed.

Otherwise in a !SVM VM you still see svm_rev and nr_asids in a leaf that
should be all zeroes.

~Andrew

