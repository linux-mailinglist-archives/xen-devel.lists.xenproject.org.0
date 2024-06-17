Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAE390AD57
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 13:51:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742242.1149001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJAsu-00010M-Tp; Mon, 17 Jun 2024 11:50:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742242.1149001; Mon, 17 Jun 2024 11:50:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJAsu-0000xJ-R5; Mon, 17 Jun 2024 11:50:52 +0000
Received: by outflank-mailman (input) for mailman id 742242;
 Mon, 17 Jun 2024 11:50:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E9YK=NT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sJAst-0000vv-Gs
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 11:50:51 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5d5cacd-2c9f-11ef-b4bb-af5377834399;
 Mon, 17 Jun 2024 13:50:47 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-57c7ec8f1fcso4930869a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jun 2024 04:50:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb72da790sm6287464a12.35.2024.06.17.04.50.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 04:50:46 -0700 (PDT)
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
X-Inumbo-ID: d5d5cacd-2c9f-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718625047; x=1719229847; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FxqEqOYubojEKCidWitbRztrsng+kGn7n5ru+wAjWu4=;
        b=UeH2DP0+BPzRBBz5e1NqKT57mOAlZgDADp2h0tkB49xis9L5AtFrmnWXrj+PhSg5yb
         +wvoRPYCefmmneeKmqqB0n3kWsVwLN4ifDXNUNpV1wEcY2hNGPRndwapryjWi+vlgz1I
         Q4RqF56osLbD/ecfJLwL3gDSFUO6Zy/llIVaJTqCQxnNCVFif/sznIsUJYig3byTbFzx
         2zmOU9wVdKjAHXVc/QdlWYsFSy5pQ7gQUED7S2bcrXQUGSy6GMA7UqZh9NrPhgtVR2yH
         i3Sj8EVQyBhHEyc6E5dq/LmV1jLHeVQzYHaq0TKc47o9g5Q+FwKsmRBn4twSWUankeJ/
         taeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718625047; x=1719229847;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FxqEqOYubojEKCidWitbRztrsng+kGn7n5ru+wAjWu4=;
        b=spMpM25RH71DlX141tLSAZ/sgM53RABH9utVroFqAIl2qFjmXf8aCMk+ecgtY5wNO/
         EjSvBhtthJLE2ZwNe7vGTtoZkG0Kha/m/46IGl8JWeoCmZ+cO+3EN5qHTYDMmWx3Kaki
         AvZ4J9yVDp1S9q/FY9jN0DnFTjo+44VnhrXYxQ73TmInmN/iotpPTqrWuZxDJ3/Brthn
         3/PuHSyisFliA755ggfz0LUQoI/NLKljg19aVXlBcGGzNtYyqFZyrGT59a6sPMQyMJBJ
         ii4aMJEDILopk9xRUX3/vJccU4EieVYlLnjb6sywwNaRKTeGAKdZV8aSHjFVepdHVmM2
         J+Ag==
X-Forwarded-Encrypted: i=1; AJvYcCXW+xV5r3q6k6XeM/HmT4npzBl3fppNtANBl3fVoyVbDedkoCf6q3HxjC/2Hkn9zB75OpSWxhlcTOiukIFUA1vfc3n8bX78fmnXtZbVXv0=
X-Gm-Message-State: AOJu0YyCbAYhrZYgBCG+/ZPrBY7zjcwi2T2ozSU+8keFKdEh7lWX36rL
	X4GIHhD9p68q/Hfab4o57UWCk2mWSMordUKkdxC52CG8hTZ6VW2IzPnGnFACng==
X-Google-Smtp-Source: AGHT+IGF953aUAHGv06+vvTlpgMejmOWWOK64EY+jPjgESVI4Xnt1Qp/n0nOHfCDwKobPPMhniOUiQ==
X-Received: by 2002:a50:d59b:0:b0:57c:6d58:e1f1 with SMTP id 4fb4d7f45d1cf-57cbd65246emr6125379a12.9.1718625046534;
        Mon, 17 Jun 2024 04:50:46 -0700 (PDT)
Message-ID: <a47db485-52df-42a6-a045-0d695b74c3eb@suse.com>
Date: Mon, 17 Jun 2024 13:50:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: for_each_set_bit() clean-up (API RFC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <46abec6c-ebe9-4426-865e-5513107949be@citrix.com>
 <5e2b6c55-8d6d-4153-8632-a6608cd41012@suse.com>
 <5746769a-6868-48ed-a58b-f8f75f17965a@citrix.com>
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
In-Reply-To: <5746769a-6868-48ed-a58b-f8f75f17965a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.06.2024 13:18, Andrew Cooper wrote:
> On 17/06/2024 10:54 am, Jan Beulich wrote:
>> On 14.06.2024 19:07, Andrew Cooper wrote:
>>> More fallout from looking at the code generation...
>>>
>>> for_each_set_bit() forces it's bitmap parameter out into memory.  For an
>>> arbitrary sized bitmap, this is fine - and likely preferable as it's an
>>> in-memory to begin with.
>>>
>>> However, more than half the current users of for_each_set_bit() are
>>> operating over an single int/long, and this too is spilled to the
>>> stack.  Worse, x86 seems to be the only architecture which (tries, but
>>> not very well) to optimise find_{first,next}_bit() for GPR-sized
>>> quantities, meaning that for_each_set_bit() hides 2 backing function calls.
>>>
>>> The ARM (v)GIC code in particular suffers horribly because of this.
>>>
>>> We also have several interesting opencoded forms:
>>> * evtchn_check_pollers() is a (preprocessor identical) opencoding.
>>> * hvm_emulate_writeback() is equivalent.
>>> * for_each_vp() exists just to hardcode a constant and swap the other
>>> two parameters.
>>>
>>> and several others forms which I think could be expressed more cleanly
>>> as for_each_set_bit().
>> I agree.
>>
>>> We also have the while()/ffs() forms which are "just" for_each_set_bit()
>>> and some even manage to not spill their main variable to memory.
>>>
>>>
>>> I want to get to a position where there is one clear API to use, and
>>> that the compiler will handle nicely.  Xen's code generation will
>>> definitely improve as a consequence.
>>>
>>>
>>> Sadly, transforming the ideal while()/ffs() form into a for() loop is a
>>> bit tricky.  This works:
>>>
>>> for ( unsigned int v = (val), (bit);
>>>       v;
>>>       v &= v - 1 )
>>> if ( 1 )
>>> {
>>>     (bit) = ffs(v) - 1;
>>>     goto body;
>>> }
>>> else
>>>     body:
>>>
>>> which is a C metaprogramming trick borrowed from PuTTY to make:
>>>
>>> for_each_BLAH ( bit, val )
>>> {
>>>     // nice loop body
>>> }
>>>
>>> work, while having the ffs() calculated logically within the loop body.
>> What's wrong with
>>
>> #define for_each_set_bit(iter, val) \
>>     for ( unsigned int v_ = (val), iter; \
>>           v_ && ((iter) = ffs(v_) - 1, true); \
>>           v_ &= v_ - 1 )
>>
>> ? I'll admit though that it's likely a matter of taste which one is
>> "uglier". Yet I'd be in favor of avoiding the scope trickery.
> 
> Oh, of course.
> 
> FWIW, Frediano pointed out a form without the goto, but this is better
> still.
> 
> It's certainly less bad than having to also explain the metaprogramming
> to get scope working nicely.
> 
> 
>>> The first issue I expect people to have with the above is the raw 'body'
>>> label, although with a macro that can be fixed using body_ ## __COUNTER__.
>>>
>>> A full example is https://godbolt.org/z/oMGfah696 although a real
>>> example in Xen is going to have to be variadic for at least ffs() and
>>> ffsl().
>> How would variadic-ness help with this? Unless we play some type
>> trickery (like typeof((val) + 0U), thus yielding at least an unsigned,
>> but an unsigned long if the incoming value is such, followed by a
>> compile-time conditional operator to select between ffs() and ffsl()),
>> I don't think we'd get away with just a single construct for both the
>> int and long (for Arm32: long long) cases.
> 
> Ideally we want _Generic() but we can't have that yet.
> 
> In lieu of that, I was thinking a chain of __builtin_choose_expr()
> instantiating variants for int/long/long-long.

Is __builtin_choose_expr() going to be a win over the conditional operator?
All forms of ffs*() return unsigned int, so the main difference between the
two is not interesting here.

> The complication is that we need a double for() loop for the
> long/long-long in order to declare the iterator as strictly unsigned
> int.Without this, a CLTQ gets emitted to extend the result of the ffs*()
> call. This https://godbolt.org/z/Px88EWdPb ought to do. I'll probably
> end up expressing that as __for_each_set_bit() taking in a type derived
> from typeof(), and an ffs*() variant to use.

The double for isn't very nice, but what do you do. If it's to be kept as
a helper, then for for_each_set_bit_uint() I'd suggest, however, to avoid
typeof(), and use unsigned int directly. I'm not sure though that helper
constructs are really going to be needed, other than to perhaps help
readability.

>>> Now, from an API point of view, it would be lovely if we could make a
>>> single for_each_set_bit() which covers both cases, and while I can
>>> distinguish the two forms by whether there are 2 or 3 args,
>> With the 3-argument form specifying the number of bits in the 3rd arg?
>> I'd fear such mixed uses may end up confusing.
>>
>>> I expect
>>> MISRA is going to have a fit at that.  Also there's a difference based
>>> on the scope of 'bit' and also whether modifications to 'val' in the
>>> loop body take effect on the loop condition (they don't because a copy
>>> is taken).
>>>
>>> So I expect everyone is going to want a new API to use here.  But what
>>> to call it?
>>>
>>> More than half of the callers in Xen really want the GPR form, so we
>>> could introduce a new bitmap_for_each_set_bit(), move all the callers
>>> over, then introduce a "new" for_each_set_bit() which is only of the GPR
>>> form.
>>>
>>> Or does anyone want to suggest an alternative name?
>> I'd be okay-ish with those, maybe with slight shortening to bitmap_for_each()
>> or bitmap_for_each_set().
> 
> Lets go with bitmap_for_each().  While we've got some examples looking
> for the first clear bit, I don't believe we've got any examples wanting
> to loop over all clear bits.
> 
> Are you happy repurposing for_each_set_bit() to be a 2-argument macro
> operating strictly on a single GPR?

As to re-purposing - yes, I think so. The construct is semantically different
enough from what we have right now that, during backporting, I believe the
compiler will flag any unconverted uses.

The "single GPR" aspect worries me, though: I think we want it to be "scalar",
permitting Arm32 to also operate on long long / uint64_t. Eventually, if need
be, we could even introduce a uint128_t form (backed by a suitable ffs128()).

Jan

