Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62220871B06
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 11:26:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688720.1073203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhS0K-0007T3-L8; Tue, 05 Mar 2024 10:26:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688720.1073203; Tue, 05 Mar 2024 10:26:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhS0K-0007PO-HG; Tue, 05 Mar 2024 10:26:36 +0000
Received: by outflank-mailman (input) for mailman id 688720;
 Tue, 05 Mar 2024 10:26:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mek3=KL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rhS0J-00073u-2X
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 10:26:35 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d67e033d-dada-11ee-a1ee-f123f15fe8a2;
 Tue, 05 Mar 2024 11:26:33 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a458b6d9cfeso149291366b.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 Mar 2024 02:26:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 o4-20020a17090611c400b00a458d85f9d9sm1065893eja.142.2024.03.05.02.26.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Mar 2024 02:26:32 -0800 (PST)
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
X-Inumbo-ID: d67e033d-dada-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709634393; x=1710239193; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7/rqBa4/qMoI+hdaAUnra3/joT1gvh94hGsQmmJ4oqk=;
        b=Et03VlktzmHFu3T+CjdMB57bMOWW1GzaYbNk30mNx7f5VEfSenWndTmsGOsi1+ox3+
         oK/Egd2ZRBU4/ZwG+xb5KH4Xx6CtyvrmnDiIN1ZF/puqUET0Lrxxg14961NSp4LHGxK0
         ZhlaISBlarHuLDxC1vqRTsiwVw0DU1jn513Dm+4iCDvypJ1IKUlEAw4Fx9elksy/B0Ty
         tj0Gf96w8e3FPYBgo098nAQ/w+Eb6KCU+3TtACFBEx5WIsB1JJNscQLnGAwU4EDRDVbe
         5NlpSnie9RpX5gTxDUFdl1WzNR7eQelQe+13XuzAwDzgN9rMG//T+dSUKhmTjCCl1BmY
         9kBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709634393; x=1710239193;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7/rqBa4/qMoI+hdaAUnra3/joT1gvh94hGsQmmJ4oqk=;
        b=vLQo+86LAItqIQJt0n+1rNNGFXGV9HdVgjldHXnfcWJwLcIR5VtgVz3773zotB+oM7
         ZbFtX5wHE1RPIg07Ld1fMP7crpVa924vM+qIqCZxPP2SZYSRIe6IczXFH2heRb/M+ME9
         E6cOLoW7f7QeHw9avbdDrueiRYp8Ts1+rrkGaO+iom1bl0PTktj4YdnJa99rklTTh+px
         e8DoCbUKMN7sB4nBss+QYnwp+mn1BjlIHifxsQYBJeD7+FhkNkjUDYEhg7mA/KQARXVm
         KRA/b2RG9nNx88uj5jh+PJKkEx3wVw4N1LzfUU+5jAnJZgojy5KgBURdrniPGf80nsIT
         7GOg==
X-Forwarded-Encrypted: i=1; AJvYcCV6gGQ2n8pTJ9zG7Cb1rhmY3qiXjw96BjlBVlWAytcY6eeTPr0pzBVhwiruVmFiU8x7WJGAehjL1kLZTJu2kN5FBG9jCF4VAAM9KsEBj/o=
X-Gm-Message-State: AOJu0YzpWExNF2LZDX7Rw+J5/CASd1YA5gbkDBLz658YmMmP7fYDjLPO
	rg0rbD09ub8XdD1imigMOMGh/vVrTyj30XPMQ9Quf5ghQ+Zajs0psJ1qs5q1tA==
X-Google-Smtp-Source: AGHT+IFtWEnKPumr3vfzU3rW7noykNtvAMT51pEL4kW6LMT/p47V/p5yJonDJ2F8dx02xD02vEZ5Vw==
X-Received: by 2002:a17:906:d045:b0:a44:5589:c098 with SMTP id bo5-20020a170906d04500b00a445589c098mr8263548ejb.7.1709634392759;
        Tue, 05 Mar 2024 02:26:32 -0800 (PST)
Message-ID: <ce926fd9-15b7-4c81-9581-b6e904963a24@suse.com>
Date: Tue, 5 Mar 2024 11:26:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 04/10] xen/public: address violations of MISRA C Rule
 20.7
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1709219010.git.nicola.vetrini@bugseng.com>
 <0cdc4dc2fcad699a2274277b32de3ee0207d5a2d.1709219010.git.nicola.vetrini@bugseng.com>
 <bd95193c-522a-4c74-98e0-68fa088a5b49@suse.com>
 <82940f688e5a5eee274fa579991ebd15@bugseng.com>
 <alpine.DEB.2.22.394.2402291447590.853156@ubuntu-linux-20-04-desktop>
 <0e131a6795c9d28583e5e8c248843e67@bugseng.com>
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
In-Reply-To: <0e131a6795c9d28583e5e8c248843e67@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.03.2024 11:21, Nicola Vetrini wrote:
> On 2024-02-29 23:49, Stefano Stabellini wrote:
>> On Thu, 29 Feb 2024, Nicola Vetrini wrote:
>>> On 2024-02-29 17:40, Jan Beulich wrote:
>>>> On 29.02.2024 16:27, Nicola Vetrini wrote:
>>>>> --- a/xen/include/public/xen.h
>>>>> +++ b/xen/include/public/xen.h
>>>>> @@ -988,7 +988,7 @@ typedef struct {
>>>>>        ((b) >>  8) & 0xFF, ((b) >>  0) & 0xFF,                           \
>>>>>        ((c) >>  8) & 0xFF, ((c) >>  0) & 0xFF,                           \
>>>>>        ((d) >>  8) & 0xFF, ((d) >>  0) & 0xFF,                           \
>>>>> -                e1, e2, e3, e4, e5, e6}}
>>>>> +                (e1), (e2), (e3), (e4), (e5), (e6)}}
>>>>
>>>> Why? Wasn't it agreed already that long macro arguments passed on
>>>> (no matter whether to a function, a macro, or like used here) don't
>>>> need parenthesizing?
>>>>
>>>
>>> That applies to all outermost macro invocations, but not to the 
>>> innermost one.
>>
>> I don't understand what you mean. Maybe a couple of trivial examples
>> would help.
>>
>>
>>> If you want also aggregate initalizers to be deviated, that could be 
>>> done
>>> (provided that the macro arg is not included in some expression, such 
>>> as
>>> "{..., e1 + 1, ...}"
>>
> 
> Sorry for the late reply. This is the current state:
> 
> #define N(x) somestruct var = {..., x, ...}; // <- not deviated, 
> violation here
> #define M(x) N(x) // <- deviated, no violation here
> 
> ...
> 
> M(0xff);
> 
> The violation is resolved by {..., (x), ...} or by saying that when "x" 
> is a whole expression in its fully expanded form, then we allow it not 
> to be needlessly parenthesized, as Jan requested (unless I misunderstood 
> his reply).

Well, the thing I continue to have trouble with is "fully expanded form".
That's not the criteria I'd like to see applied. To me all depends on how
the macro is written, not what uses of the macro expand to.

> In that case, the only this that would still give a 
> violation in the above setting is questionable patterns such as
> 
> #define Q(x) x, x

Right.

#define Q(x) (x, x)

ought to be okay though, rule-wise, no matter that it's questionable too.

Jan

