Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AE7B2C8AC
	for <lists+xen-devel@lfdr.de>; Tue, 19 Aug 2025 17:43:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086680.1444867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoOU4-0008HN-FX; Tue, 19 Aug 2025 15:42:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086680.1444867; Tue, 19 Aug 2025 15:42:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoOU4-0008Ea-Bj; Tue, 19 Aug 2025 15:42:48 +0000
Received: by outflank-mailman (input) for mailman id 1086680;
 Tue, 19 Aug 2025 15:42:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xm9j=27=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uoOU2-0008EU-Gc
 for xen-devel@lists.xenproject.org; Tue, 19 Aug 2025 15:42:46 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25e959a1-7d13-11f0-a32a-13f23c93f187;
 Tue, 19 Aug 2025 17:42:44 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-afcb731ca8eso869250266b.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Aug 2025 08:42:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61a755d99bbsm2043621a12.3.2025.08.19.08.42.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Aug 2025 08:42:43 -0700 (PDT)
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
X-Inumbo-ID: 25e959a1-7d13-11f0-a32a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755618164; x=1756222964; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Byu7bXIVb45Oov0sVagEHTxO8RckbisdzWS29pw9r5w=;
        b=A27M5lttvfyFvV77ekZTucduP74hS6udidmyRwtSeJQUNNe4OXk8tj1aFBgfwxshs0
         jQNIKNrjfe6dXkpHj5URaLRccrzXqr1rUgMRjS2/ynmhdLzIADspedSPzIpAbFJGDmzI
         EQ2wWgY03LJ6SQq0bGrnyNI/4afnUpyXiKlv2MUD0+Tgygk1ifXdxa8RGTlDePtMa32+
         MDpWF87tyZIVl1iXUJZloSXG7yozcFGhmajT5U6BXUsMBaPbjgS3jaN18QugnY2TBmS7
         p4slD3s9HIkBcM0pVsCb2hnh36ahMis36658w1wU30Z5dvkAdFw9a/WFXeO6rEBP+Y5b
         8Sdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755618164; x=1756222964;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Byu7bXIVb45Oov0sVagEHTxO8RckbisdzWS29pw9r5w=;
        b=iWCvt41LDnVTIg+Q5icMpcZrXb1B/SN0JgPsXjHWQZiBaO7PPnsvUVPAqGu6iHmiwh
         3d9SKEuZ4DFoD8WYO10P6VLYpD52jh+7cg+i73pRaVG9v57MES2ROU0kz6N8tYdzsl/C
         RCY6ay0vc49DwPw1Ifu3PkyelrRtuO16fkJD0xKkSstCqqctKSyVVNFshl5w8OjyeZDA
         VTOJme7jwS9yfGCj7YsUxPpzO7lSLg87z6sKrqhbpxqsExXEuB4DLlYY9UXBwZaLQtxS
         AUb/9HyiA3x1jqnJs5iJLT01cSCs5LVOPYaIuRr6WylnIufH0mYzuurF09lfKoWG8EAI
         JsIw==
X-Forwarded-Encrypted: i=1; AJvYcCW7ZEAVXYC7gtxlFx9ZHMZMdbKqce2mX+gPUhHNdEfp6vRo8NklUZDRyzLuxhKCyZSm/Q41Q/pAODA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwazRXqV0elrSIMd8DOYBh4FtACvt7GJiqFN5ZRHGuXgM2YdrZS
	oKcKtLlRn73U6O49NfCmkyLeLBEHsmAExO6FTdIIzo6/nVpSnk8gJnPynyzimFnTdA==
X-Gm-Gg: ASbGncsoO6BSMVPQEFi7HnBWiJuy2QQmMc6ZPJYUHOkth/ei3kKjBMFkhest7jkbDzn
	aLGM9NH7Qz60I+vx4otGCLRGAbFGpJvZyyVVsX7DYlsmr/b2Dlkys/B563iT7Jlam/EXdzsqwE3
	D8MncAybP4EOiDNcx2V5F1HGy6VG0XTQZv1G9FczsrQfnm8qe0wvFRvf79s5wO4yoR8laOZhf6s
	hhUykLbG+jGpjOWIsUs/cFbvkuOSolHobNIKY0+5B+oI1Gst7bR7gUemK52JqzBpX6bl4aFn3rD
	WrNb42MhGgbxDAK5xvYCsZSM+w1k7EcGfwG/u2VGZ7hfilS9N9rm2ik67OsAkzpKYj+lmsDINvN
	rt5axa58JpLD2P62tCa3uvm8sEFLm5rFfmdUjM7fedMBFBNcS7UMQzHJg/+6WNZqwR95yuIReDX
	XcSJ/20s+gHOIr18qugA==
X-Google-Smtp-Source: AGHT+IGZg26R3xyBU7LPujOPH6B/e7Kq8IPxL6kcr+o99Xyci5c4ZpG39uGW8Mg4AGhS0sMpIakaZg==
X-Received: by 2002:a17:907:7e92:b0:af9:709f:970b with SMTP id a640c23a62f3a-afddd1e8dffmr307819166b.46.1755618163726;
        Tue, 19 Aug 2025 08:42:43 -0700 (PDT)
Message-ID: <195b9a3b-c15a-4bf8-a0e4-2255ede95310@suse.com>
Date: Tue, 19 Aug 2025 17:42:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: add deviation for PrintErrMesg() function
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5944d87aae330246b7dab6eebd04d5d71a7d7e8f.1755608417.git.dmytro_prokopchuk1@epam.com>
 <37c61f78-b723-4611-b9d5-f915f72f36e8@suse.com>
 <7bd11401-bd8d-417b-90d5-e52a501211ed@epam.com>
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
In-Reply-To: <7bd11401-bd8d-417b-90d5-e52a501211ed@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.08.2025 16:32, Dmytro Prokopchuk1 wrote:
> On 8/19/25 16:25, Jan Beulich wrote:
>> On 19.08.2025 15:12, Dmytro Prokopchuk1 wrote:
>>> MISRA C Rule 2.1 states: "A project shall not contain unreachable code."
>>>
>>> The function 'PrintErrMesg()' is implemented to never return control to
>>> its caller. At the end of its execution, it calls 'blexit()', which, in
>>> turn, invokes '__builtin_unreachable()'. This makes the 'return false;'
>>> statement in 'read_file()' function unreachable.
>>
>> I'm disappointed. In earlier review comments I pointed out that there are
>> two. Yet you say "the", without further disambiguation.
>>
>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> @@ -41,6 +41,10 @@ not executable, and therefore it is safe for them to be unreachable."
>>>   -call_properties+={"name(__builtin_unreachable)&&stmt(begin(any_exp(macro(name(ASSERT_UNREACHABLE)))))", {"noreturn(false)"}}
>>>   -doc_end
>>>   
>>> +-doc_begin="Unreachability caused by the call to the 'PrintErrMesg()' function is deliberate, as it terminates execution, ensuring no control flow continues past this point."
>>> +-config=MC3A2.R2.1,reports+={deliberate, "any_area(^.*PrintErrMesg.*$ && any_loc(file(^xen/common/efi/boot\\.c$)))"}
>>> +-doc_end
>>
>> I don't understand the description here, nor ...
>>
>>> --- a/docs/misra/deviations.rst
>>> +++ b/docs/misra/deviations.rst
>>> @@ -97,6 +97,13 @@ Deviations related to MISRA C:2012 Rules:
>>>          Xen expects developers to ensure code remains safe and reliable in builds,
>>>          even when debug-only assertions like `ASSERT_UNREACHABLE() are removed.
>>>   
>>> +   * - R2.1
>>> +     - Function `PrintErrMesg()` terminates execution (at the end it calls
>>> +       `blexit()`, which, in turn, invokes `__builtin_unreachable()`), ensuring
>>> +       no code beyond this point is ever reached. This guarantees that execution
>>> +       won't incorrectly proceed or introduce unwanted behavior.
>>> +     - Tagged as `deliberate` for ECLAIR.
>>
>> .. the text here. PrintErrMesg() is noreturn. Why would anything need saying about
>> it? Isn't the problem here solely with the tail of read_file(), while other uses
>> of PrintErrMesg() are okay?
> 
> I'm a little bit confused.
> 
> As I understood you proposed to insert the SAF comment before the 
> 'return' statement (with proper justification).
> 
> And current Eclair configuration & descriptions are not good at all.

Not sure how that's related, but apart from this, ...

> Am I right?

... yes. Yet how is what you submitted here related to the issue in read_file(),
which may be addressable by a simple SAF comment (as you say in your reply)?

Jan

