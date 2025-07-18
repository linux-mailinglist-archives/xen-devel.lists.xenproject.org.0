Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B1FB09AF4
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 07:32:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047939.1418254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucdhN-0004si-6F; Fri, 18 Jul 2025 05:31:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047939.1418254; Fri, 18 Jul 2025 05:31:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucdhN-0004rH-2z; Fri, 18 Jul 2025 05:31:57 +0000
Received: by outflank-mailman (input) for mailman id 1047939;
 Fri, 18 Jul 2025 05:31:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RNMk=Z7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ucdhL-0004r9-Ja
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 05:31:55 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82fd294b-6398-11f0-b894-0df219b8e170;
 Fri, 18 Jul 2025 07:31:53 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-455fdfb5d04so9378445e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 22:31:53 -0700 (PDT)
Received: from ?IPV6:2003:ca:b711:f268:e016:4ee6:ecac:2480?
 (p200300cab711f268e0164ee6ecac2480.dip0.t-ipconnect.de.
 [2003:ca:b711:f268:e016:4ee6:ecac:2480])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e8860cdsm69844865e9.20.2025.07.17.22.31.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 22:31:52 -0700 (PDT)
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
X-Inumbo-ID: 82fd294b-6398-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752816713; x=1753421513; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Dxl6raMY1c8O31W/FGgb5Qpyi5BLP3JdWzbanFYYeCI=;
        b=fJayx79uagbmtyfFAgj7glW8pM5gfSJBvhq+xsdAP+06TzbPhOLKdkS92hXLlIa7xD
         gHgi0lY65Mg8UFTB7UCdTe8MsxsKwuLTZKPqQgd0hdo76BFYMBYhbl31lDxgatDck6k2
         e2eLNB1ZFJ2GETYR/QC14XEJILkhKVayxTtdxiSKgODl4PYA+O1JZ//mA/szkbFLVyDQ
         vmydMqysZrWnOFUREO17gPgmls5jRj7RVhXLU55J1HuJFCZ0qcQQz4GMMN0O3kbYGJEe
         Yk2D9UMLewh5IMXKhpCMZYLV+YNpEfA1Tb4KKgQMx1D6yvyGJq6wpCdEBjOnf9+212HI
         AG9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752816713; x=1753421513;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dxl6raMY1c8O31W/FGgb5Qpyi5BLP3JdWzbanFYYeCI=;
        b=ebxsMw2ApwXNIBt74m1PdYZvav1SQTLgznDQB/QVMFaxAk6lM8E1DHHS/BgUABFse6
         aG/sOr3CzIctHyAShYefeZf5/bklBAdfMznqGpDDgjwOinKHVFKfrR9xRJJ1Ro3rowxh
         Bd1d0yY7po4EzlIPxHH2OWgTTmB1URabLKxFosA74zWQPqytyVSNodLWo7QuYnrjjFTt
         ZokW1yNLacZ0PoNhJD66z3u5qrYPOgCcmXo9qnXH6eQLIOdLDJyhVFl8mPOSQ34hfgmw
         H9lpqmFQVhYE/hwp4kX54pyKB1tsr67DoRKtFpJxDhz0nO3tAN3TssvThqkFx3e5xzqE
         UXIA==
X-Gm-Message-State: AOJu0YyaoVyKRcy20ZtHhianZFGUP3kc8npju7Cg3Q86RsrgQTVeI5+c
	lKTHvQZ5w9qtcgQN/Mq1HJIvQVWuBRbAkPoWZmcfjIJnzlvf1X7FfPpAU/aWFprFHg==
X-Gm-Gg: ASbGnctESm8hJ6/Va5p3NUylJyMZxO/O4AlFkSauplD1JTiH9zIe8sRjawzO1HgWg/u
	LIpXqOZL8QQdsPHTzi6PjQV0/4RnetlSzpTK2kUaPonV+EsiGsf8s5nPvRILQah2juT0hYfRb2q
	/pDHqshBArhgdescuZ24i8YIOteeRp8Ff8XP7Rsc0WeUahai+4lKwwbuHDs8shCNWcqAEe0lgOy
	DvKDSyLsWfhVWY8Hp+Hxad+DmavJyyYoVZjLUcbxXxsgNghsfM/FqqRgg1poOCvwaDz34DM98nh
	2Jk1OY9hiApWoxUkAIELqEeA/dkWR2eH0ZSSidG/atAEwPFXDekoyZcTUsXrcSh0fiwVT4WPYh+
	ETLwOr3PKnskoSA/wkoKM6HMleLCSmxuDFEvj4iJUBiwgqe7geNdmHFUkvp2E0haStWeyjbBvu1
	UrzJBNNzYgyNbT18j7W53CSMjx+iIGMGz8u6TxqTQZr3rABwRA5AIr+4L9
X-Google-Smtp-Source: AGHT+IHB/ceOGqNWbENKWw+Z663gXpGAiV0wGtuPPQ7bw+RebP/mG2ZS06x5uTluAxKowixabFCvKw==
X-Received: by 2002:a05:600c:310a:b0:456:1608:c807 with SMTP id 5b1f17b1804b1-45635d86bcfmr36235545e9.26.1752816712639;
        Thu, 17 Jul 2025 22:31:52 -0700 (PDT)
Message-ID: <39114395-5aa0-4c4a-a0b9-f151c6976674@suse.com>
Date: Fri, 18 Jul 2025 07:31:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] misra: add deviation for rules 21.1 and 21.2
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "victorm.lira@amd.com" <victorm.lira@amd.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <9e1210f2a9c794d68dcc6b897239b228b141296a.1745427770.git.victorm.lira@amd.com>
 <f1d1dbe4-5b62-4540-a480-afa6045d9622@epam.com>
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
In-Reply-To: <f1d1dbe4-5b62-4540-a480-afa6045d9622@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.07.2025 22:47, Dmytro Prokopchuk1 wrote:
> 
> 
> On 4/23/25 20:54, victorm.lira@amd.com wrote:
>> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>
>> MISRA C Rules 21.1 ("#define and #undef shall not be used on a
>> reserved identifier or reserved macro name") and R21.2 ("A reserved
>> identifier or reserved macro name shall not be declared") violations
>> are not problematic for Xen, as it does not use the C or POSIX
>> libraries.
>>
>> Xen uses -fno-builtin and -nostdinc to ensure this, but there are still
>> __builtin_* functions from the compiler that are available so
>> a deviation is formulated for all identifiers not starting with
>> "__builtin_".
>>
>> The missing text of a deviation for Rule 21.2 is added to
>> docs/misra/deviations.rst.
>>
>> To avoid regressions, tag both rules as clean and add them to the
>> monitored set.
>>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>> Signed-off-by: Victor Lira <victorm.lira@amd.com>
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>> ---
>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
>> Cc: Anthony PERARD <anthony.perard@vates.tech>
>> Cc: Michal Orzel <michal.orzel@amd.com>
>> Cc: Jan Beulich <jbeulich@suse.com>
>> Cc: Julien Grall <julien@xen.org>
>> Cc: Roger Pau Monné <roger.pau@citrix.com>
>> Cc: Stefano Stabellini <sstabellini@kernel.org>
>> Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> Cc: Federico Serafini <federico.serafini@bugseng.com>
>> Cc: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>>   .../eclair_analysis/ECLAIR/deviations.ecl     |  9 ++++++-
>>   .../eclair_analysis/ECLAIR/monitored.ecl      |  2 ++
>>   automation/eclair_analysis/ECLAIR/tagging.ecl |  2 ++
>>   docs/misra/deviations.rst                     | 26 ++++++++++++++++++-
>>   4 files changed, 37 insertions(+), 2 deletions(-)
>>
>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> index 2c8fb92713..ffa23b53b7 100644
>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> @@ -639,8 +639,15 @@ in the expansion."
>>   # Series 21.
>>   #
>>
>> +-doc_begin="Xen does not use C and POSIX libraries:
>> +identifiers reserved by these libraries can be used safely, except for those
>> +beginning with '__builtin_'."
>> +-config=MC3A2.R21.1,macros={safe, "!^__builtin_.*$"}
>> +-config=MC3A2.R21.2,declarations={safe, "!^__builtin_.*$"}
>> +-doc_end
>> +
>>   -doc_begin="or, and and xor are reserved identifiers because they constitute alternate
>> -spellings for the corresponding operators (they are defined as macros by iso646.h).
>> +spellings for the corresponding logical operators (as defined in header 'iso646.h').
>>   However, Xen doesn't use standard library headers, so there is no risk of overlap."
>>   -config=MC3A2.R21.2,reports+={safe, "any_area(stmt(ref(kind(label)&&^(or|and|xor|not)$)))"}
>>   -doc_end
>> diff --git a/automation/eclair_analysis/ECLAIR/monitored.ecl b/automation/eclair_analysis/ECLAIR/monitored.ecl
>> index 8351996ec8..da229a0d84 100644
>> --- a/automation/eclair_analysis/ECLAIR/monitored.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/monitored.ecl
>> @@ -79,6 +79,8 @@
>>   -enable=MC3A2.R20.12
>>   -enable=MC3A2.R20.13
>>   -enable=MC3A2.R20.14
>> +-enable=MC3A2.R21.1
>> +-enable=MC3A2.R21.2
>>   -enable=MC3A2.R21.3
>>   -enable=MC3A2.R21.4
>>   -enable=MC3A2.R21.5
>> diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
>> index 1d078d8905..3292bf751e 100644
>> --- a/automation/eclair_analysis/ECLAIR/tagging.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
>> @@ -88,6 +88,8 @@ MC3A2.R20.11||
>>   MC3A2.R20.12||
>>   MC3A2.R20.13||
>>   MC3A2.R20.14||
>> +MC3A2.R21.1||
>> +MC3A2.R21.2||
>>   MC3A2.R21.3||
>>   MC3A2.R21.4||
>>   MC3A2.R21.5||
>> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
>> index fe0b1e10a2..88328eaa8a 100644
>> --- a/docs/misra/deviations.rst
>> +++ b/docs/misra/deviations.rst
>> @@ -587,7 +587,31 @@ Deviations related to MISRA C:2012 Rules:
>>          construct is deviated only in Translation Units that present a violation
>>          of the Rule due to uses of this macro.
>>        - Tagged as `deliberate` for ECLAIR.
>> -
>> +
>> +   * - R21.1
>> +     - Rule 21.1 reports identifiers reserved for the C and POSIX standard
>> +       libraries. Xen does not use such libraries and all translation units
>> +       are compiled with option '-nostdinc', therefore there is no reason to
>> +       avoid to use `#define` or `#undef` on such identifiers except for those
>> +       beginning with `__builtin_` for which compilers may perform (wrong)
>> +       optimizations.
>> +     - Tagged as `safe` for ECLAIR.
>> +
>> +   * - R21.2
>> +     - Rule 21.2 reports identifiers reserved for the C and POSIX standard
>> +       libraries. Xen does not use such libraries and all translation units
>> +       are compiled with option '-nostdinc', therefore there is no reason to
>> +       avoid declaring such identifiers except for those beginning with
>> +       `__builtin_` for which compilers may perform (wrong) optimizations.
>> +     - Tagged as `safe` for ECLAIR.
>> +
>> +   * - R21.2
>> +     - `or`, `and` and `xor` are reserved identifiers because they constitute
>> +       alternate spellings for the corresponding logical operators
>> +       (as defined in Standard Library header `\<iso646.h\>`). Xen does not use
>> +       Standard library headers, so there is no risk of overlap.
>> +     - Tagged as `safe` for ECLAIR.
>> +
>>      * - R21.9
>>        - Xen does not use the `bsearch` and `qsort` functions provided by the C
>>          Standard Library, but provides in source form its own implementation,
>> --
>> 2.47.0
> 
> Hello All!
> 
> I tried to play with Rule 21.1 deviations.
> 
> After applying the following configurations:
> 
> -config=MC3A2.R21.1,macros+={safe, "^offsetof$ || ^(is|to)[a-z]+$ || 
> name(NULL) || name(bool) || name(true) || name(false)"}
> -config=MC3A2.R21.1,macros+={safe, 
> "loc(file(^xen/include/xen/inttypes\\.h$))"}
> -config=MC3A2.R21.1,macros+={safe, "loc(file(^xen/include/xen/types\\.h$))"}
> -config=MC3A2.R21.1,macros+={safe, "^str[a-z]+$ || ^(v)?sprintf$ || 
> ^va_[a-z]+$"}

Can you spell these out in words? I can only vaguely interpret these Eclair
patterns, sorry.

> Eclair showed 699 remaining violations.
> All of them were related to names beginning with an underscore (_).
> 
> It's possible to resolve the rest of them with help of (all, except for 
> those beginning with '__builtin_' and '__x86_64__'):
> 
> -config=MC3A2.R21.1,macros+={safe, "^_.*$ && !^__builtin_.*$ && 
> !^__x86_64__$"}
> 
> Probably, the exception list can be extended.
> 
> Jan,
> I know you don't want to disallow "_all_" such reserved identifiers.
> But how to deal with that?

How do I not want this? I've been arguing for years that we should respect
the reserved name spaces. (Did you perhaps mean "... you don't want to
deviate ..."?) There are exceptions, yes, e.g. ...

> Try to cover all macros? Like this, for example (I assume that there are 
> no such reserved macros):
> -config=MC3A2.R21.1,macros+={safe, "^.*XEN.*$ || ^.*HYPERVISOR.*$"}

... anything we may have (wrongly) introduced into the public headers. We
can't very well change naming there.

Jan

