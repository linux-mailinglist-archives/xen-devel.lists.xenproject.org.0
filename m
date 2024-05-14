Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C51CA8C5681
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 15:05:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721489.1124936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6rpx-0003wD-AO; Tue, 14 May 2024 13:04:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721489.1124936; Tue, 14 May 2024 13:04:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6rpx-0003tA-6P; Tue, 14 May 2024 13:04:57 +0000
Received: by outflank-mailman (input) for mailman id 721489;
 Tue, 14 May 2024 13:04:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VieR=MR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s6rpv-0003t4-HC
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 13:04:55 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e72418d-11f2-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 15:04:54 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-572b37afd73so93241a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 06:04:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a55275e80sm438942666b.8.2024.05.14.06.04.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 06:04:53 -0700 (PDT)
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
X-Inumbo-ID: 8e72418d-11f2-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715691894; x=1716296694; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=owwrnOYg/hRDFZK+JFkSVjuytfCfeFkLX9e2EIhvdoE=;
        b=Lg3lLkLJCUDOnISrBH2tod8fscQGk44e3j8JEq/pIFpUPySuCFjw8ngw9+rzoO9FUB
         1qehOv/Q0AiluKw1BBP6EYQdqBx6nZN3+AHdCq+z/elUQjoIXrxeK8+DBatPtJzQ02UI
         bGstxmjcNNkFAwArFiyQ/pk9DiWWgLyxTHdN0mmnmpCORqZY3fW2gK+w3abjW9epe1TN
         7A8PNzC006VP7YrdenrVsIwHle1EYXAHzpqRSun5tkb7rWtt+zEZ7ya+lNjh2SgGJIZ6
         v7pARxz0dy3HVviTG9zCEi2Wtp7/Z0wSpok9XeRzFnJWG1BxVygTE/Aj3CzpDq+fPM/u
         za5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715691894; x=1716296694;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=owwrnOYg/hRDFZK+JFkSVjuytfCfeFkLX9e2EIhvdoE=;
        b=GlUScnWvdr8UwTxTiQ+WSRnFNAWj9IU8iyYf2C36fBDxm9aZEogL1tEOOXRihCkvwa
         EwwPdigjl5AyjXnmOoQdIPlHPt8bohM0qaaQ/7Rw16bSv7k4ZAAu8yY8iPcmKaGXJ4D/
         eaKXu9rI7UlkIEXUfeNdRuCgZOP2/qtjMVtz69p3Aq/2HwKcpgXj8T6r6/YKIN2nK66P
         ma+ed49frAvkTU7ogkm3VzhetdyiR9xwttbOuWgCzRn+GLii/aRI5OSBjrBl/iBuOaUH
         tUPROtD8bXG8wvhAzprelEndYznwrLt/33X712cIPPGtCCsuq825OcxoHj30MIdQtt3L
         9aFg==
X-Gm-Message-State: AOJu0YzqdVIULL0yI7d3beQLFgbfpiqUM3dftamVGbQvJIazjR4XmZzP
	QdMmt1wVAXWrWt3+gQ/GeVuctBoI1KiwDQVtkZchB1ucx0LvBf8zqqFgm+4swKerth+2COOj+ew
	=
X-Google-Smtp-Source: AGHT+IHBR29rK0DZF7QT9dOOsKkppf0MKSNEF1GxleHS/Ed2Sde3UTAPQsHDarV7j3kxvswGnMqGRw==
X-Received: by 2002:a17:907:7daa:b0:a59:ddec:b339 with SMTP id a640c23a62f3a-a5a2d66b530mr1011658966b.50.1715691893640;
        Tue, 14 May 2024 06:04:53 -0700 (PDT)
Message-ID: <bed75dc2-1cd4-462f-9ab7-f06a2e596d15@suse.com>
Date: Tue, 14 May 2024 15:05:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] tools/xen-cpuid: Use automatically generated feature
 names
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20240510224002.2324578-1-andrew.cooper3@citrix.com>
 <20240510224002.2324578-4-andrew.cooper3@citrix.com>
 <ZkMYXSf9abR3J3FE@macbook>
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
In-Reply-To: <ZkMYXSf9abR3J3FE@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.05.2024 09:53, Roger Pau Monné wrote:
> On Fri, May 10, 2024 at 11:40:01PM +0100, Andrew Cooper wrote:
>> Differences in names are:
>>
>>  sysenter    -> sep
>>  tm          -> tm1
>>  ds-cpl      -> dscpl
>>  est         -> eist
>>  sse41       -> sse4-1
>>  sse42       -> sse4-2
>>  movebe      -> movbe
>>  tsc-dl      -> tsc-deadline
>>  rdrnd       -> rdrand
>>  hyper       -> hypervisor
>>  mmx+        -> mmext
>>  fxsr+       -> ffxsr
>>  pg1g        -> page1gb
>>  3dnow+      -> 3dnowext
>>  cmp         -> cmp-legacy
>>  cr8d        -> cr8-legacy
>>  lzcnt       -> abm
>>  msse        -> misalignsse
>>  3dnowpf     -> 3dnowprefetch
>>  nodeid      -> nodeid-msr
>>  dbx         -> dbext
>>  tsc-adj     -> tsc-adjust
>>  fdp-exn     -> fdp-excp-only
>>  deffp       -> no-fpu-sel
>>  <24>        -> bld
>>  ppin        -> amd-ppin
>>  lfence+     -> lfence-dispatch
>>  ppin        -> intel-ppin
>>  energy-ctrl -> energy-filtering
>>
>> Apparently BLD missed the update to xen-cpuid.c.  It appears to be the only
>> one.  Several of the + names would be nice to keep as were, but doing so isn't
>> nice in gen-cpuid.  Any changes would alter the {dom0-}cpuid= cmdline options,
>> but we intentionally don't list them, so I'm not worried.
>>
>> Thoughts?
> 
> I'm fine with this, we are now coherent between libxl, the Xen command
> line cpuid= option and the output of xen-cpuid.

Hmm, consistency across the components is of course a fair goal. Otherwise I
would have suggested to consider putting in place overrides in feature_names[]
for those cases where e.g. the trailing + might indeed be neater (and shorter).

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
> 
> Won't it be best to not specify the number of array elements here, as
> we could then use a BUILD_BUG_ON() to detect when new leafs are added
> to the featureset and thus adjust xen-cpuid.c?  Otherwise new
> additions to the featureset will go unnoticed.

I, too, would be in favor of that.

>> @@ -291,6 +292,9 @@ static const struct {
>>  
>>  #define COL_ALIGN "24"
>>  
>> +static const char *const feature_names[(FEATURESET_NR_ENTRIES + 1) << 5] =
>> +    INIT_FEATURE_VAL_TO_NAME;
> 
> I've also considered this when doing the original patch, but it seemed
> worse to force each user of INIT_FEATURE_VAL_TO_NAME to have to
> correctly size the array.  I would also use '* 32', as it's IMO
> clearer and already used below when accessing the array.  I'm fine
> if we want to go this way, but the extra Python code to add a last
> array entry if required didn't seem that much TBH.

Same here.

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

I realize right here this 64 can't very well be expanded to a useful
expression ((FEATURESET_e1d - FEATURESET_1d) * 32); could I talk you
into at least adding a comment to this effect?

Jan

