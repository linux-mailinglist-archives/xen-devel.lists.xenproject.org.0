Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7138E87EC66
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 16:45:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694812.1083950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmFAV-0003au-0P; Mon, 18 Mar 2024 15:44:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694812.1083950; Mon, 18 Mar 2024 15:44:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmFAU-0003Y5-Tq; Mon, 18 Mar 2024 15:44:54 +0000
Received: by outflank-mailman (input) for mailman id 694812;
 Mon, 18 Mar 2024 15:44:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=emy9=KY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmFAT-0003Xz-AS
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 15:44:53 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 752ebf22-e53e-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 16:44:51 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a44ad785a44so531383766b.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 08:44:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g17-20020a17090670d100b00a46a04d7dc4sm3045410ejk.61.2024.03.18.08.44.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 08:44:50 -0700 (PDT)
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
X-Inumbo-ID: 752ebf22-e53e-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710776691; x=1711381491; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KL7DNASydYh7/Nnby9dmK1L4kzHGl7aNreX8OwqpHNc=;
        b=HXg1p8NqRB5mUI9Sxg8YMZ6qmPIT+6CiIcr1ZsF7zkfKfVyZXpmtILOcpWbhaLvkJC
         9hXOmtBN04ob7hrNus5icsM1p1zgH4A+wffYdUgIUhMf/qIDGZYTuLChUEdTIghRaHAg
         hjhYcHrC3x7DpJjoam0LuzEIKNa8qVZ4QjPK2vZx+2i6iXLsITdC4c4o9gAX84EI9Eqr
         U8M/P8iE+iMgZUB+g+nmNeds8OIU697zKEeEhVWCeehuAzNU/LRbiLLtbVS0rbw4jd9A
         tka0NzPpHJdCMa2HPCb30UgEvx2gWNhCnh4oPUqJ4BDiZKSp8dvA8OD3Izp6G7p0vF27
         lNlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710776691; x=1711381491;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KL7DNASydYh7/Nnby9dmK1L4kzHGl7aNreX8OwqpHNc=;
        b=NgHFC4G3+PkqF6WKU+AakMoMXNhNUqDVhscLOKfgDjjQrSQ5X6OH5oR1dNdEZ5Dzf9
         Q6Q3BUKSzNBd93qpnYNUq2tE7WPkICKJgETNrOlMjV7nbBvaTwMGSNwtdrtXgJhj/AyF
         77WC28aHaI82kQP+WwbPj9zPKKnHMiWk23DdbTxUJ1NEPcnW9J2FcngrJAXzmhGOptmE
         euKUYQJr3UCQ0FfGcScbJCS44zqY8uvMsr8d1yWWTPkxcUVI+o4l6lqNwMHsAbPGUtCc
         6BG9ikup03wrRYtNrEngOiYgD5if6XKKJ3giLjtGQESVIHvY5O7YeHQ6rjxD88SETe0R
         U+sg==
X-Forwarded-Encrypted: i=1; AJvYcCX5b870Z9Ax8TvrxN/X+q8s6GaLlH9Vk1sAM/oIZf9Q/jvkvMS/+iLqXmOTUpUXpxDhbN0M666JrraNl7i0pbjQBfReY/j7W7xdPY4lypw=
X-Gm-Message-State: AOJu0YwNT3V4MHOwVzsMpbqJoPqkcjlzejkOPec3X8ufDSbGVAtK+9Tn
	p6HCbHMz5oeptdtjTAQQYWHhdB0xl8lpOhMc1+vrF7izpmQAtRjD7iMy5TXqIw==
X-Google-Smtp-Source: AGHT+IGLstH1DTXFtC+UbFWA1/l3lDRMWJvUU64qSfJKfB3TqKRtcKkeep0VPtiIQSjSK0edwiN9Ug==
X-Received: by 2002:a17:906:2c1a:b0:a46:bde3:91ec with SMTP id e26-20020a1709062c1a00b00a46bde391ecmr2243639ejh.52.1710776690784;
        Mon, 18 Mar 2024 08:44:50 -0700 (PDT)
Message-ID: <e8ba5b07-e2ac-4520-9f0b-a0bc11dd34da@suse.com>
Date: Mon, 18 Mar 2024 16:44:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/13] xen/spinlock: add missing rspin_is_locked() and
 rspin_barrier()
Content-Language: en-US
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240314072029.16937-1-jgross@suse.com>
 <20240314072029.16937-9-jgross@suse.com>
 <ceb2083a-0d57-44fb-bd78-d8f44ae0bc9b@suse.com>
 <db53e1fa-d356-4fc8-a319-2a793f964961@suse.com>
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
In-Reply-To: <db53e1fa-d356-4fc8-a319-2a793f964961@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.03.2024 16:31, Jürgen Groß wrote:
> On 18.03.24 15:57, Jan Beulich wrote:
>> On 14.03.2024 08:20, Juergen Gross wrote:
>>> --- a/xen/common/spinlock.c
>>> +++ b/xen/common/spinlock.c
>>> @@ -395,14 +395,7 @@ static bool always_inline spin_is_locked_common(const spinlock_tickets_t *t)
>>>   
>>>   int _spin_is_locked(const spinlock_t *lock)
>>>   {
>>> -    /*
>>> -     * Recursive locks may be locked by another CPU, yet we return
>>> -     * "false" here, making this function suitable only for use in
>>> -     * ASSERT()s and alike.
>>> -     */
>>> -    return lock->recurse_cpu == SPINLOCK_NO_CPU
>>> -           ? spin_is_locked_common(&lock->tickets)
>>> -           : lock->recurse_cpu == smp_processor_id();
>>> +    return spin_is_locked_common(&lock->tickets);
>>>   }
>>
>> The "only suitable for ASSERT()s and alike" part of the comment wants
>> to survive here, I think.
> 
> Why?
> 
> I could understand you asking for putting such a comment to spinlock.h
> mentioning that any *_is_locked() variant isn't safe, but with
> _spin_is_locked() no longer covering recursive locks the comment's reasoning
> is no longer true.

Hmm. I guess there is a difference in expectations. To me, these
functions in principle ought to report whether the lock is "owned",
not just "locked by some CPU". They don't, hence why they may not be
used for other than ASSERT()s.

As to the reasoning no longer being applicable here: That's why I
asked to only retain the "only ASSERT()s" part of the comment. Yes,
such a comment may also be suitable to have in spinlock.h. What I'd
like to avoid is for it to be lost altogether.

Jan

>>> @@ -465,6 +458,23 @@ void _spin_barrier(spinlock_t *lock)
>>>       spin_barrier_common(&lock->tickets, &lock->debug, LOCK_PROFILE_PAR);
>>>   }
>>>   
>>> +bool _rspin_is_locked(const rspinlock_t *lock)
>>> +{
>>> +    /*
>>> +     * Recursive locks may be locked by another CPU, yet we return
>>> +     * "false" here, making this function suitable only for use in
>>> +     * ASSERT()s and alike.
>>> +     */
>>> +    return lock->recurse_cpu == SPINLOCK_NO_CPU
>>> +           ? spin_is_locked_common(&lock->tickets)
>>> +           : lock->recurse_cpu == smp_processor_id();
>>> +}
>>
>> Here otoh I wonder if both the comment and the spin_is_locked_common()
>> part of the condition are actually correct. Oh, the latter needs
>> retaining as long as we have nrspin_*() functions, I suppose. But the
>> comment could surely do with improving a little - at the very least
>> "yet we return "false"" isn't quite right; minimally there's a "may"
>> missing.
> 
> If anything I guess the comment shouldn't gain a "may", but rather say
> "Recursive locks may be locked by another CPU via rspin_lock() ..."
> 
> 
> Juergen


