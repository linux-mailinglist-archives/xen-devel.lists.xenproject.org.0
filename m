Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E868B7567
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 14:07:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714783.1116100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1mFu-0006eo-IO; Tue, 30 Apr 2024 12:06:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714783.1116100; Tue, 30 Apr 2024 12:06:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1mFu-0006bc-FD; Tue, 30 Apr 2024 12:06:42 +0000
Received: by outflank-mailman (input) for mailman id 714783;
 Tue, 30 Apr 2024 12:06:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q3to=MD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s1mFt-0006bW-A7
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 12:06:41 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a0346c1-06ea-11ef-909b-e314d9c70b13;
 Tue, 30 Apr 2024 14:06:40 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-34a32ba1962so4493389f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 05:06:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g2-20020a5d5542000000b0034720354152sm31838270wrw.117.2024.04.30.05.06.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Apr 2024 05:06:39 -0700 (PDT)
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
X-Inumbo-ID: 1a0346c1-06ea-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714478799; x=1715083599; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uBYB0KU75nEFt9ffW9ZeKwEeAIsRsojIbfhPCN2LxDk=;
        b=QNQ8YGtLp+sL44O7aBdRR3DO9hoaYHeWHlWCdpb/JIAUmmeh9c1TofGQR1kcDibFfR
         AGgikWk3IIDY97bYoIm+Q8C98AZ2bwixcvgLVsyeN0NftnUfgopiOpplNy7Yt+in0RV/
         GskHiV7s470HlYADqz9QHeP+QUpK/DHgboLkv+XRhcFAVi4eaZ1k36JhOwnWiE6Yo1c/
         KSgCf4NBqoJ/qz6Fyw+erar5Ei7Y636RR3bGsQLFqF1ab4L3OJptKBS20C1FJ3+QEocg
         3Rsp1KzvCdAqCKlMEgnhsLRHNBa1mgnnXwLYcdgWhaul3vkk7mGcMPDp6S2F7REoZiLj
         c//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714478799; x=1715083599;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uBYB0KU75nEFt9ffW9ZeKwEeAIsRsojIbfhPCN2LxDk=;
        b=ix8bjZCaCTY27gDtcYE3QA8Sgf8zNLLUOgjr7d8f8wHZDCCQ3lqB5C/HJwNU4R4D6e
         IawwULcP1o8qNeYI3oFOrqfl2TRNG3/e2wecXlDu2AFb3BEu86++uyGf+Zs17nvWfPox
         xOVMoLkQ0LhqXw00wuxE2rBOydGcyqgSBrlCBXGrnxc/zMXtXIaMinCAFHvB+iE28m+9
         4M5dIaYOUR5TnsPBesFFEleXSDOC2SxqITtonY7eBqvgk/mz4biOeqYE/ZxCzQmt7zLP
         or4qB9m5JTk/BfmJE6Wz/L/8umI+6n5gLEPvhpkAvnmPLr2SL1TvaZN0YBLb/AeioF0/
         kP9A==
X-Forwarded-Encrypted: i=1; AJvYcCU0IF1P+g9DxtG7X7dZnyISu7yeiBtmLaMERJZDdpspsZyN2dgrv9KLUoSlw6pyvn8cNjE1uNQ72Cz9ar0AQJ6CoVJv1HG/qb3Vy3Ylch0=
X-Gm-Message-State: AOJu0YxcANe0IiKe+TMk9S8tWZDmPPO2So1Zyt71usn7EOPNZ1cMn3hP
	2perlIWu1NcwYAEtjDf9mtMMc7NbQBCKK9tZvYdQfvByBH4glqkAhVwaaWRmgg==
X-Google-Smtp-Source: AGHT+IGtM5G4E4B/DFSbOquO+pJd1NoZNXo+ArSWHVN1v1d1SDk/tMgutoTRY2O4kyIuCkxYmrI6kQ==
X-Received: by 2002:a5d:6d06:0:b0:349:8a92:7eda with SMTP id e6-20020a5d6d06000000b003498a927edamr9729805wrq.12.1714478799613;
        Tue, 30 Apr 2024 05:06:39 -0700 (PDT)
Message-ID: <f1e594f7-2bf2-4898-824f-abd407690644@suse.com>
Date: Tue, 30 Apr 2024 14:06:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] tools/xen-cpuid: switch to use cpu-policy
 defined names
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20240430082901.77662-1-roger.pau@citrix.com>
 <78d009f4-6610-4fcf-9cdc-ee1081e6c763@suse.com> <ZjDVN6kexFD0vcT2@macbook>
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
In-Reply-To: <ZjDVN6kexFD0vcT2@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.04.2024 13:25, Roger Pau Monné wrote:
> On Tue, Apr 30, 2024 at 12:37:44PM +0200, Jan Beulich wrote:
>> On 30.04.2024 10:29, Roger Pau Monne wrote:
>>>  static const struct {
>>>      const char *name;
>>>      const char *abbr;
>>> -    const char *const *strs;
>>
>> While how you're doing it looks all technically correct (so even without
>> changes I may later ack this as is), I'm still a little puzzled. I was
>> kind of expecting xen-cpuid.py to be extended to supply another (set
>> of) #define(s) more suitable for use here. In particular, while
>> performance surely isn't of much concern in this tool, ...
>>
>>> @@ -301,21 +52,32 @@ static const char *const fs_names[] = {
>>>      [XEN_SYSCTL_cpu_featureset_hvm_max] = "HVM Max",
>>>  };
>>>  
>>> -static void dump_leaf(uint32_t leaf, const char *const *strs)
>>> +static const char *find_name(unsigned int index)
>>>  {
>>> -    unsigned i;
>>> +    static const struct feature_name {
>>> +        const char *name;
>>> +        unsigned int bit;
>>> +    } feature_names[] = INIT_FEATURE_NAMES;
>>> +    unsigned int i;
>>>  
>>> -    if ( !strs )
>>> -    {
>>> -        printf(" ???");
>>> -        return;
>>> -    }
>>> +    for ( i = 0; i < ARRAY_SIZE(feature_names); i++ )
>>> +        if ( feature_names[i].bit == index )
>>> +            return feature_names[i].name;
>>
>> ... a linear search, repeated perhaps hundreds of times, looks still a
>> little odd to me.
> 
> I didn't benchmark what kind of performance impact this change would
> have on the tool, but I didn't think it was that relevant, as this is
> a diagnostic/debug tool, and hence performance (unless it took seconds
> to execute) shouldn't be that important.

As indicated, performance itself isn't much of a concern here. My earlier
question wants reading in relation to the other question raised, regarding
the script maybe wanting to produce macro(s) more suitable for the purpose
here.

> I could switch to a non-const array and sort it at the start in order
> to do a binary search, but that might be over engineering it.

Switching to non-const would in particular not seem overly desirable to
me.

>>> @@ -326,6 +88,7 @@ static void decode_featureset(const uint32_t *features,
>>>                                const char *name,
>>>                                bool detail)
>>>  {
>>> +    static const uint32_t known_features[] = INIT_KNOWN_FEATURES;
>>>      unsigned int i;
>>
>> So this variable exists solely to ...
>>
>>> @@ -336,11 +99,14 @@ static void decode_featureset(const uint32_t *features,
>>>      if ( !detail )
>>>          return;
>>>  
>>> -    for ( i = 0; i < length && i < ARRAY_SIZE(decodes); ++i )
>>> +    /* Ensure leaf names stay in sync with the policy leaf count. */
>>> +    BUILD_BUG_ON(ARRAY_SIZE(known_features) != ARRAY_SIZE(leaf_names));
>>
>> ... calculate its size here. Thus relying on the compiler to not flag
>> such effectively unused static const variables.
> 
> I wondered whether to add the unused attribute, but seeing as gitlab
> didn't complain I've forgot to add it.  I could add it.

Actually I was rather trying to hint at omitting the variable altogether,
like this:

   BUILD_BUG_ON(ARRAY_SIZE((unsigned[])INIT_KNOWN_FEATURES) != ARRAY_SIZE(leaf_names));

Yet I realize the look of it may not be liked, so adding the unused
attribute (if a suitable abstraction exists in the tool stack) would
probably be fine, too.

Jan

