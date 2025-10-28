Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CB2C13705
	for <lists+xen-devel@lfdr.de>; Tue, 28 Oct 2025 09:07:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1151954.1482495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDejc-0000Jw-Kp; Tue, 28 Oct 2025 08:07:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1151954.1482495; Tue, 28 Oct 2025 08:07:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDejc-0000HD-Hu; Tue, 28 Oct 2025 08:07:16 +0000
Received: by outflank-mailman (input) for mailman id 1151954;
 Tue, 28 Oct 2025 08:07:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LPue=5F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vDejb-0000H7-0T
 for xen-devel@lists.xenproject.org; Tue, 28 Oct 2025 08:07:15 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18902ae9-b3d5-11f0-980a-7dc792cee155;
 Tue, 28 Oct 2025 09:07:07 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-475dd559a83so17057205e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Oct 2025 01:07:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd494d5csm184028105e9.9.2025.10.28.01.07.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 01:07:06 -0700 (PDT)
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
X-Inumbo-ID: 18902ae9-b3d5-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761638826; x=1762243626; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IAct4j+Vvjx7lylSiDx3Nm0RM/0ItrX+e5KxOgxfqnA=;
        b=gRrTBamZre1dYF0ImnnvgKztjRgMjURpXSzQ56zKXyR1CEOk5rfTga+nGqVRhwSNQo
         w2SXkOs31N9r5JGsjYlwojfGOC8h7HWN32XElrYQc7IB2nmF6o3uzqCqvskm1MOAYj42
         ABG4u0eoEC9gOM7x5D0IB2eKF3utyJdVUtbZGpOMx3gETnxu246Xqey34ZOfGizXXtHC
         2OETdt1VtDHgm4/SPF7wYCUEvJ+FGvoAodSBvxW/hqeTk75M1Nwx4gWyHdHh3PscZmeR
         6bNWu18nxCtfA62YGvhKJR7DNnf7fvzDvKI70EN8XlJTUGReQPHqOK0/FdTfXLF2wHD4
         2Ngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761638826; x=1762243626;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IAct4j+Vvjx7lylSiDx3Nm0RM/0ItrX+e5KxOgxfqnA=;
        b=DXtJkknwnnLAXtbFhf/EArQhd2vLMMFRD2OvSzK+lRwzNTU40YE1b9wbyIg0r18X/G
         FdHOrKAnZNOXgeRaiIk8xmZrxCr9QOGPSi7h6LK6AZGoMLCfr5R0/Vjbm/lc2ViQ+n6s
         A+bTTapNNdowiN68aRYbiR0Ue1S66zNbHi4uZdbZaPxeve9c3mifQ4isUI19OBGd5TbA
         /13KKW16X4+t8Ig90Ejcc7I5gtcw1LnhOnpT7pnXZOfR2Qtn11Dq1VGUMNdXZteQ05LH
         g54/5iTrzcrituj+6OB9QlCnkPzTmQi0+PhoDGU+doAyafHyXC+2OitOjpsc1YAfDGRw
         sZ7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWGCrkp3J/25wiq/y9EGGt23SvtzZx6vc83w3Tr42XBczV5fMkaSYiXNxTD2ijbpc2j9NUtsXS2q6Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw6eL4aASEjjxVre7zPkSmPdespMjZbpVMnLYRDut1jMXToq04A
	YBuVDMweXq4qW2V600oCt4ee8ENuTMUqveYx5Dl6qpoEjnd2LigZOJK7mupaa4NcAA==
X-Gm-Gg: ASbGncvIpATkT9iY0ptSGRa8qYDr3po7exChr/JaIGv4bz8p30a1MY0sxtRKXSD0hj0
	+zw2/AUaxwy7Q+aFGT2LKlIMtMl5rnZD75QaGueH3TNmutKuaP8CvqYf8t8NbSkpsDLRjmnPXsk
	xP/J9TfVAtrQCBnfrceT7lbRm3U8hXaIlMVxsL7X/wR6zLmH6MBUbKsbaW63GtwwkYOR4LZAMaE
	J3wo4hMTyr22i8iPAzh6VcQQQzWqWjPDIottRT7DtVwYPjTWZnt2oFurpk2VGqa4/gSUX9vmExn
	k7JVVFZ5e3bj4uXlkoupHjgKnKVTXNBuIXfvpoDs7HrD1cq8kuG67EYK7joOXqB396Vwoc81WMx
	/ucKiVzL725E72/m35glKoona+ua9LXPoCRVNgGCM1mWdeHJLsPmiaFhw8ds57T272I6sAwHej0
	+26X/6oTfgh1bo9ThJzpvkCb+jpVHKtRyljHZhXxf48Jwvo8ha7RcyiLiewB79
X-Google-Smtp-Source: AGHT+IEdBoPYwV+rny5bBkzqoXUam1c91SUSZpHo1laSLtI36ZXlHXaTISdi1b20kvLDnPFCz6SnmA==
X-Received: by 2002:a05:600c:358c:b0:477:e70:592b with SMTP id 5b1f17b1804b1-47717df8398mr25465665e9.2.1761638826454;
        Tue, 28 Oct 2025 01:07:06 -0700 (PDT)
Message-ID: <c9931ed8-1706-4c13-8f68-7eb251915871@suse.com>
Date: Tue, 28 Oct 2025 09:07:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] x86/ucode: Abort parallel load early on any control
 thread error
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251020131955.2928261-1-andrew.cooper3@citrix.com>
 <20251020131955.2928261-3-andrew.cooper3@citrix.com>
 <4fb57b9e-2a39-471a-a629-e8cd00997f22@suse.com>
 <342ead3d-3d10-46b9-bb2f-89f941582d96@citrix.com>
 <b62ae9fd-01db-43df-9966-98d028ca24e1@suse.com>
 <eb1b8e4b-aaba-4615-bc0f-6ad908732e89@citrix.com>
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
In-Reply-To: <eb1b8e4b-aaba-4615-bc0f-6ad908732e89@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.10.2025 23:46, Andrew Cooper wrote:
> On 23/10/2025 7:24 am, Jan Beulich wrote:
>> On 22.10.2025 21:28, Andrew Cooper wrote:
>>> On 20/10/2025 4:55 pm, Jan Beulich wrote:
>>>> On 20.10.2025 15:19, Andrew Cooper wrote:
>>>>> EIO is not the only error that ucode_ops.apply_microcode() can produce.
>>>>> EINVAL, EEXISTS and ENXIO can be generated too, each of which mean that Xen is
>>>>> unhappy in some way with the proposed blob.
>>>> Yes, yet wasn't that the case already when the EIO check was added? Were we
>>>> perhaps trying to deal with a certain level of asymmetry in the system? I
>>>> think a little more is needed here, also to ...
>>>>
>>>>> Some of these can be bypassed with --force, which will cause the parallel load
>>>>> to be attempted.
>>>>>
>>>>> Fixes: 5ed12565aa32 ("microcode: rendezvous CPUs in NMI handler and load ucode")
>>>> ... justify there being a Fixes: tag. It would also seem possible that the
>>>> check was intentional and correct at the time of introduction, but was
>>>> rendered stale by some later change.
>>> The parallel load logic more bugs than lines of code.  What hasn't
>>> already been rewritten either has pending patches, or pending bugs
>>> needing fixing.
>>>
>>> I didn't care to check why it was limited to EIO at the time.  It's
>>> definitely wrong.
>>>
>>> But if you insist that I waste time doing so, at the time EIO was
>>> introduced, both apply_microcode()'s could fail with -ENOENT for a NULL
>>> pointer, -EINVAL for "patch isn't for this CPU".
>> The latter fits my "trying to deal with a certain level of asymmetry" guess,
>> doesn't it?
> 
> If you mean CPU asymmetry, I'm going to argue this as a bugfix.  Some
> Intel CPUs are known not to check the stepping, accept the wrong
> microcode, and crash.  I have more patches to at least make this case
> very obvious, but I need to get through some of the existing queue first.
> 
> If you mean revision asymmetry, nothing has really changed here.  The
> parallel load is only started if a blob newer than the cache is found. 
> If --force is used to override this check and load anyway, you also
> won't get -EEXISTs out of apply_microcode().
> 
>> And btw, why are you being so negative again? "Waste time" is a pretty clear
>> sign of you (once again) thinking that your view of the world is the only
>> possibly sensible one.
> 
> I have rewritten most of microcode loading from scratch.  What hasn't
> yet been rewritten is pending, with serious errors already identified
> on-list and more still that haven't made it into public.
> 
> I would be further through if it had not taken an unreasonable amount of
> effort to make the changes so far.  You refused my module changes
> despite the blatant issues in the existing code, forcing me to
> manoeuvrer them in via the boot_info changes (and in so doing discover
> that module handling in general was even more broken than originally
> realised).
> 
> The current pending series is in part stuck because I haven't had the
> energy to tell you to stop trying to scope creep the work.
> 
> So yes, I was irritated at being asked to justify not breaking a thing
> which has been thoroughly demonstrated to be broken.

Hmm. You may have memorized all the details. I haven't. Instead I need
pointers to where aspects were discussed that matter here. It still
feels odd to me that my (implicit) request to supply such is deemed a
waste of time.

As to me refusing changes (here or elsewhere): In case it hadn't become
obvious to you, no matter whether it's your or my (or actually also
other people's) changes - when things get stuck, they almost always get
stuck at your end. You simply don't get back. When it's your changes -
I can be convinced. But if I raise questions or even objections, that
means I also _want_ to be convinced (rather than silently giving in).
That requires taking the time to respond accordingly, yes. When it's my
patches, I do take the time (often in vein, as a response then never
appears). When it's your patches, you will want to accept that you need
to take the time then as well, in order to make your work make progress.
Simply coming back months or years later claiming I (or somebody else)
blocked some of your work is at best a very subjective view of the world,
imo at least.

Jan

