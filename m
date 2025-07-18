Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1ECB09B06
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 07:53:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047971.1418284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uce1s-0000ke-9m; Fri, 18 Jul 2025 05:53:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047971.1418284; Fri, 18 Jul 2025 05:53:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uce1s-0000hw-78; Fri, 18 Jul 2025 05:53:08 +0000
Received: by outflank-mailman (input) for mailman id 1047971;
 Fri, 18 Jul 2025 05:53:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RNMk=Z7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uce1r-0000hq-4D
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 05:53:07 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 791b34d8-639b-11f0-a319-13f23c93f187;
 Fri, 18 Jul 2025 07:53:05 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a6e8b1fa37so1196172f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 22:53:05 -0700 (PDT)
Received: from ?IPV6:2003:ca:b711:f268:e016:4ee6:ecac:2480?
 (p200300cab711f268e0164ee6ecac2480.dip0.t-ipconnect.de.
 [2003:ca:b711:f268:e016:4ee6:ecac:2480])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca4d92csm830589f8f.74.2025.07.17.22.53.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 22:53:04 -0700 (PDT)
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
X-Inumbo-ID: 791b34d8-639b-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752817985; x=1753422785; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0QLg1vWNuYYeC+M39h1tpVaeeQKLY+pfPHlLPsE19oI=;
        b=YYk1wDZmwsflr9og7Ld0iZ5PoUpqdnEUJwAB6F9g1n8fU6DY6/eX/f2A+CHad3MdJC
         5m045ox4mlZp7DOy5uSHZA+SWhS4ntXyQvqmxJIvHkX8O7D0xwUqdJyKh2aFgJHqC06V
         3Fy0wScbZ3xTQwVcPLv4+MIINJooO1tWRDs+aeJbFOEGmAfaXQqyq82b3tSndoPJX5VY
         8nco2U8tAmsHIFWwkg1cqEDlS072d9LwAoOfBOOtiu9mt37JMmFKEPH5uSY9Mj3Gno6L
         9NxMfdnQxKkg7ftJCcJXWqDusPIDxH5QzQV5vFkP4g1I+hJJBIk2G2KPBAb3gOe01ySD
         q9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752817985; x=1753422785;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0QLg1vWNuYYeC+M39h1tpVaeeQKLY+pfPHlLPsE19oI=;
        b=KINB4B9fbZ70SpkAcaBgmCnRA3gaxfemguig3W4ZaWCW/7R1Pd0uXnUzgZcCTA6yz1
         OJg6T6dN93tih9RxnHAaKrVdejAXssLId0pYrcUnr1hZbsyTUn98p4nfZtyx6qPG5kE/
         N5RJi9mKRAtP2ShfJM41J6hZx29OPh/NTLIY7FR4DGIdzLhryX+Pr4rspl8PEmgbFfzg
         Pcw0bjEtUZ2OOa8fo6KlSF7gGxNsAhIf6+zssL4sJAX6BVwg0kq+D3bAt9YF7+aAROmy
         86+rQip7to8NdLg5oeqa+HPJGFV+i82pKysGatJTIG9TJiP1mPeun0UqoL+YGsADunI8
         yaZw==
X-Forwarded-Encrypted: i=1; AJvYcCXDw3bUHFg6Ri9sV00ugqF5v5SF/qsA5NfJjU0DN8K/Nu1OEN/gZykiu323sMOIgFP6nqg855U2TsM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx4d+nw9nNlFP60AhOfR4c4BYiVhEr8EdvUa/a0pr3UjCVQHlZv
	yHgggsjJa3oSkAP+YpsGgibgax4+NThfIA1B58ffUFRuhvgYuVIDY2TMowMd3OesaQ==
X-Gm-Gg: ASbGnctmzYFbNAdI7iUI6EGsE/JJNF0iKRADX8V1Wmayjn+myVsy8RO9eDwdGNcrdEm
	g6qNX/HW8NG8/EPqLbips5tn7RSfSjxTsIFqGD0miuknvpEUh3skdU2InhWqKYpSisByNCLM/uZ
	nsq7z5U4UlfKrWAPIrzcT/dKPAQZzmX+n5vFqQxa97ZEsdioumKXnsNgMippcJqXI74wWGJbbuj
	pGw6WXypol2OqzcaJXLxoa326Twj64ThwkmUW0NOX8o3Zpzv9JXaOAEeCi/qBY7jF5oDJ0Mjz3m
	yfoWWxzUDuvdtG43sa1cO621yIkyGmycCI6d042SyhFT4JaNpkfWkNYx9lYFzT/yb0Ggyk1yR8z
	2hzbYO41mMQ3CkU4e4SWOf8NPv/U9gXzEnCISf35KqTSvUpC4jEqAYvy0I/9cLyqofmLl7Sr0ep
	55fXPBijlN8eCgxf0pCrstXfFAlAr0hoZjrpRRo3wcpfzITJClyiZoPEk1
X-Google-Smtp-Source: AGHT+IGOb07u/4x5M5RIlmAFIZ1E2pO54cEXI6L7PHKEIEmwqISJn85jzxfyTY8AS7WG9cIJGj8ubw==
X-Received: by 2002:a05:6000:41cb:b0:3b6:46d:fb70 with SMTP id ffacd0b85a97d-3b60e4d2a8bmr6745069f8f.25.1752817984674;
        Thu, 17 Jul 2025 22:53:04 -0700 (PDT)
Message-ID: <29cb9771-ee2a-4c7d-b661-74b37728bc2f@suse.com>
Date: Fri, 18 Jul 2025 07:53:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] x86/match-cpu: Support matching on steppings
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250716173132.2213891-1-andrew.cooper3@citrix.com>
 <20250716173132.2213891-6-andrew.cooper3@citrix.com>
 <a6abcc07-535f-433b-948a-702dc33093fa@suse.com>
 <03ecaa72-2370-47f7-b84b-83831d188f4e@citrix.com>
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
In-Reply-To: <03ecaa72-2370-47f7-b84b-83831d188f4e@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.07.2025 21:39, Andrew Cooper wrote:
> On 17/07/2025 9:11 am, Jan Beulich wrote:
>> On 16.07.2025 19:31, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/cpu/common.c
>>> +++ b/xen/arch/x86/cpu/common.c
>>> @@ -1003,13 +1003,15 @@ const struct x86_cpu_id *x86_match_cpu(const struct x86_cpu_id table[])
>>>  	const struct x86_cpu_id *m;
>>>  	const struct cpuinfo_x86 *c = &boot_cpu_data;
>>>  
>>> -	for (m = table; m->vendor | m->family | m->model | m->feature; m++) {
>>> +	for (m = table; m->vendor | m->family | m->model | m->steppings | m->feature; m++) {
>> Nit: Line length. But - do we need the change at all? It looks entirely
>> implausible to me to use ->steppings with all of vendor, family, and
>> model being *_ANY (if, as per below, they would be 0 in the first place).
> 
> I do keep on saying that | like this is pure obfuscation.  This is an
> excellent example.
> 
> It's looking for the {} entry, by looking for 0's in all of the metadata
> fields.  A better check would be *(uint64_t *)m, or perhaps a unioned
> metadata field, but..
> 
> This is also a good demonstration of binary | is a bad thing to use, not
> only for legibility.  Swapping | for || lets the compiler do:
> 
> add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-76 (-76)
> Function                                     old     new   delta
> x86_match_cpu                                243     167     -76
> 
> and the code generation looks much better too:

Feel free to switch to ||. (The use of | producing worse code is clearly
a weakness of the compiler. Especially when used on non-adjacent fields
I expect | to be quite a bit better, first and foremost by ending up
with just a single conditional branch. Sadly I haven't seen compilers
do such a transformation for us.)

All of your reply doesn't address my remark regarding whether to check
->steppings here, though. (And no, whether to check it shouldn't be
[solely] justified by the compiler generating better code that way.)

>>>  struct x86_cpu_id {
>>> -    uint16_t vendor;
>>> -    uint16_t family;
>>> +    uint8_t vendor;
>> Is shrinking this to 8 bits a good idea? We use 5 of them already. (Of
>> course we can re-enlarge later, if and when the need arises.)
> 
> It's the same size as cpuinfo_x86's field has been for 2 decades.
> 
>>
>>> +    uint8_t family;
>> The family formula allows the value to be up to 0x10e. The return type
>> of get_cpu_family() is therefore wrong too, strictly speaking. As is
>> struct cpuinfo_x86's x86 field.
> 
> Again, this is the size of the field in cpuinfo_x86.  I don't think
> 0x10e is anything we're going to have to worry about any time soon.

Now that Intel has decided to use higher family numbers, hopefully yes.

>>>      uint16_t model;
>> Whereas the model is strictly limited to 8 bits.
> 
> There is space in here, if we need it, but you can't shrink it without
> breaking the check for the NULL entry (going back to the first obfuscation).

Breaking? Or merely affecting code generation in a negative way?

Jan

