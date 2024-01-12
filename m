Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 990BF82BE65
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 11:19:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666728.1037558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOEd8-0004LW-AG; Fri, 12 Jan 2024 10:19:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666728.1037558; Fri, 12 Jan 2024 10:19:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOEd8-0004Jw-7X; Fri, 12 Jan 2024 10:19:14 +0000
Received: by outflank-mailman (input) for mailman id 666728;
 Fri, 12 Jan 2024 10:19:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nnUc=IW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rOEd6-0004Jq-7V
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2024 10:19:12 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 070ef816-b134-11ee-98f0-6d05b1d4d9a1;
 Fri, 12 Jan 2024 11:19:11 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2ccbbb5eb77so74009431fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jan 2024 02:19:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 u18-20020a05660229b200b007befaf58e52sm702869ios.30.2024.01.12.02.19.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jan 2024 02:19:10 -0800 (PST)
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
X-Inumbo-ID: 070ef816-b134-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705054750; x=1705659550; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=orxMPBtpMhujs16DjlWq79nyG9ufDIOFOOYn0DaHUSw=;
        b=NEnLawB8JJt8Nqj9d/We53CTXWEcywyB/vGXgV8UOOI5TT/YkedzAjdI8iDg1Zsg/k
         uXUI1Y9M912XYHv5iGXQVhjQ9uaLhWGfmryzPFfPtCjZ/u9e4vSicwLeQWhacRGo0+1t
         YXimVaELuQfnihZXjA3pQgx8492m1aABhpH8NC9rzZhQxf2JiwDedZzuAsWSXUz7P7Ja
         wO4N9JWBMZMpXLaHoZrF/LFfK29jSA1SWnAIgTIIjyiKTCBvtkl2vpfyIAmAbg6GL8Hb
         TPdPm433EuUsoVtoPRm3KUAQbyiL1pbMjslyuTb61x+vW+65GiNS2Ucpsu03M3NS5JcQ
         xWyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705054750; x=1705659550;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=orxMPBtpMhujs16DjlWq79nyG9ufDIOFOOYn0DaHUSw=;
        b=CKA7URo6uDmjdtYEaZFIVZUI6M1mjcIHiuBbP+87jcjqy0E2YLuNjB8FRyAMi2h2bo
         BlUsRBrldktatr/NnWwVYuzcEu2uS1EWFx0Nopy9YuHA7fyq6YeKuGth5Ow9pcOUmmXn
         z0j2yjf1vdekG7w0dEwD5yDn6k1oDz5gLX9j2XpjsFLtpvMl6gO71VvCXNqw+Ps9hhSB
         EPSQciXg1ayWLiom2OoraEq8Jd/cMUShc1X9VCJLWd9C9XgXhmoGsbEi8S2wm5awKNz7
         4v1iDsnBivRa4kGiKwCp30gvvDzLEH5VpZ3OVdbkpAQ/k32b+kHtrbengRrSYDARqz0S
         yqsQ==
X-Gm-Message-State: AOJu0Yx+fBEdj5k0lTxdxC/Pm+OgJV7N1k3K1vvev0PYi5PE2udrYqh3
	LP8VxZuLeFSt12wkNyjbrxOj361R8W5I
X-Google-Smtp-Source: AGHT+IElRIokT8PGniw9klyZZ/u2d02srmb53Ko7F34Jb4Hd1jieNYuJC5WQxp5qpRnjqFau7pv58Q==
X-Received: by 2002:a05:651c:14b:b0:2cd:6c8d:4c7 with SMTP id c11-20020a05651c014b00b002cd6c8d04c7mr538056ljd.38.1705054750583;
        Fri, 12 Jan 2024 02:19:10 -0800 (PST)
Message-ID: <7b1f9f84-1e54-4ba5-aed4-a8b677ebdd99@suse.com>
Date: Fri, 12 Jan 2024 11:19:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/intel: ensure Global Performance Counter Control
 is setup correctly
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240111090821.67594-1-roger.pau@citrix.com>
 <3428928a-42d0-4e4b-9607-c184968c309d@suse.com> <ZZ_FjFa9mILtDZgv@macbook>
 <645e0c95-5a12-4202-8da6-3cc789a9e5c7@suse.com> <ZZ_di8pZB8bWtBuX@macbook>
 <b1e76a5f-297b-4030-a69e-33cdf179c0ce@suse.com> <ZZ_4HSvdg0R9Dv1Y@macbook>
 <4574c9d6-eb6d-4b73-a9e1-20b5635b32db@suse.com> <ZaAdEqHzbD8L_mRo@macbook>
 <b2412d90-e368-405f-813f-20a95f99ff21@suse.com> <ZaEPs5Y0SUgcOb3c@macbook>
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
In-Reply-To: <ZaEPs5Y0SUgcOb3c@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.01.2024 11:08, Roger Pau Monné wrote:
> On Fri, Jan 12, 2024 at 08:42:27AM +0100, Jan Beulich wrote:
>> On 11.01.2024 17:53, Roger Pau Monné wrote:
>>> On Thu, Jan 11, 2024 at 04:52:04PM +0100, Jan Beulich wrote:
>>>> On 11.01.2024 15:15, Roger Pau Monné wrote:
>>>>> On Thu, Jan 11, 2024 at 03:01:01PM +0100, Jan Beulich wrote:
>>>>>> On 11.01.2024 13:22, Roger Pau Monné wrote:
>>>>>>> Oh, indeed, can adjust on this same patch if that's OK (seeing as the
>>>>>>> issue was already there previous to my change).
>>>>>>
>>>>>> Well, I'm getting the impression that it was deliberate there, i.e. set
>>>>>> setting of the feature flag may want to remain thus constrained.
>>>>>
>>>>> Hm, I find it weird, but the original commit message doesn't help at
>>>>> all.  Xen itself only uses PMC0, and I don't find any other
>>>>> justification in the current code to require at least 2 counters in
>>>>> order to expose arch performance monitoring to be present.
>>>>>
>>>>> Looking at the SDM vol3, the figures there only contain PMC0 and PMC1,
>>>>> so someone only reading that manual might assume there must always be
>>>>> 2 global PMCs?
>>>>
>>>> That may have been the impression at the time. It may have been wrong
>>>> already back then, or ...
>>>>
>>>>> (vol4 clarifies the that the number of global PMCs is variable).
>>>>
>>>> ... it may have been clarified in the SDM later on. My vague guess is
>>>> that the > 1 check was to skip what may have been "obviously buggy"
>>>> back at the time.
>>>
>>> Let me know if you are OK with the adjustment in v3, or whether you
>>> would rather leave the > 1 check as-is (or maybe adjust in a different
>>> patch).
>>
>> Well, I haven't been able to make up my mind as to whether the original
>> check was wrong. Without clear indication, I think we should retain the
>> original behavior by having the __set_bit() gated by an additional if().
>> Then, since the line needs touching anyway, a further question would be
>> whether to properly switch to setup_force_cpu_cap() at the same time.
> 
> Having looked at Linux, it has exactly the same check for > 1, which I
> guess is to be expected since the code in Xen is quite likely adapted
> from the code in Linux.
> 
> Overall, it might be best to leave the check as > 1.  It's possible (as
> I think you also mention in a previous email) that there's simply no
> hardware with 1 counter.  This might no longer be true when
> virtualized, but given the current checks in both Xen and Linux any
> virtualization environment that attempts to expose arch perf support
> would need to expose at least 2 PMCs.
> 
> My suggestion is to leave the cnt > 1 check as it is in v2.
> 
> I can send a v4 with that check fixed if there's nothing else in v3
> that needs fixing.
> 
> IMO doing the adjustment to PERF_GLOBAL_CTRL without setting
> ARCH_PERFMON would be contradictory.  Either we set ARCH_PERFMON
> support and consequently adjust PERF_GLOBAL_CTRL, or we don't.

Probably fair enough.

Jan

