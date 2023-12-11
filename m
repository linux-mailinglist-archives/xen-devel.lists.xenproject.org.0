Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC1780C804
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 12:32:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651673.1017474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCeVI-0000sq-JC; Mon, 11 Dec 2023 11:31:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651673.1017474; Mon, 11 Dec 2023 11:31:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCeVI-0000qH-Fn; Mon, 11 Dec 2023 11:31:16 +0000
Received: by outflank-mailman (input) for mailman id 651673;
 Mon, 11 Dec 2023 11:31:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mRXB=HW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rCeVH-0000o1-1H
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 11:31:15 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca149645-9818-11ee-98e8-6d05b1d4d9a1;
 Mon, 11 Dec 2023 12:31:13 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3360ae2392eso2656150f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Dec 2023 03:31:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 k18-20020a5d5192000000b0033339027c89sm8343295wrv.108.2023.12.11.03.31.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Dec 2023 03:31:12 -0800 (PST)
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
X-Inumbo-ID: ca149645-9818-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702294273; x=1702899073; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=83gXcqfV4M4Rq2MIDetw8tx4YogahfP23wLJtBN0HSU=;
        b=GnEdK9EPWMEodU/XHOGIH0HXJn5EOcKZKHF0Gzo6aQJD2RC/+8R+3nrdW6jwArxNUY
         AizM6YFFa5GuVUhpcQN3ZjqMml33TkYwoySTDjLO8eoq/1kZcw9ervUDzY9T+IYHq0Jr
         MixdO00JvQsXGEV5Nt2FnloEzic/F/IzYsxy3TdZybheIQGPM+HrYtAWUbYcMNnKnpAh
         z4NTWR5xAg4ZzkAwQaL1hw6HU3E1D1AY045MsHu0mDDRPK/rkIxI/EN/FBxcp+LucdzW
         0gcyOjs8gGuQlLv+vrkDQsUuPC8YAncRe4hq4JetmjPq36x4NYe/9Om2CAzrk0KBkawN
         nB5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702294273; x=1702899073;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=83gXcqfV4M4Rq2MIDetw8tx4YogahfP23wLJtBN0HSU=;
        b=U5cAW477u6SH803GFl4hfVcxwjvcAdEImLth52veHNO7WEjXq2Ofvc/9DfM43OxViF
         UhXX826N9W9sPmdpNh713uqyBWEZUCTRw00NSdZcGjOM/tANAXJm35D7713wzHcKfG1J
         zrBllumzagZxBQ88fHlkigE9SpL1ljAbYEnOllr/jY/MKOsXejBP7aCg8OYLtKDJZxbB
         s4O9kz+1Akb44RLE8kAdU8nTIFC8qJD+qcaouUokBGBvOkGUHL/S45mUvfR6uOQUf95h
         7KAuGrFgErE7ywCaIdQwn8YUN/9yX5DoEGbAFYVn4q/gCYWiqDxP0Jsbsqb6yjfumh6o
         ivYw==
X-Gm-Message-State: AOJu0YzLkl7M04oMcpm3ebmhsbQGY+vuD6erizMb/PbTv14sP5/wiT4L
	OLZRGFGYhmT3IN3qxCkXYtWo
X-Google-Smtp-Source: AGHT+IHj1Ig0fggHrT0UmiQeHJpklwRW630mVm9oIwLLaN0mwlHYQC9AB1hA1pcNShUN/QiDRy4HXw==
X-Received: by 2002:adf:ab10:0:b0:333:389b:4a2c with SMTP id q16-20020adfab10000000b00333389b4a2cmr1874350wrc.118.1702294273202;
        Mon, 11 Dec 2023 03:31:13 -0800 (PST)
Message-ID: <011bdf3f-6cbd-49e6-b1d8-10c77722664e@suse.com>
Date: Mon, 11 Dec 2023 12:31:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] x86/HVM: split restore state checking from state
 loading
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
References: <49a17ffa-c873-4b0f-81ed-9587053ca159@suse.com>
 <dcc726f5-634e-4b48-aa8f-d477cdc8dea9@suse.com> <ZW4L5Q4SMprtmbK-@macbook>
 <5f7c43ca-dfc4-4929-8776-6985e610e154@suse.com> <ZW8zyXkUJDKVt-HX@macbook>
 <2ded19f7-2ba6-4b1c-8752-a73894dcdae0@suse.com> <ZW9H1uE_6k3d-uWn@macbook>
 <21cdb9ad-81f5-497a-bfd8-ef6aea5906e2@suse.com> <ZXbodK0CcT5U1i5V@macbook>
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
In-Reply-To: <ZXbodK0CcT5U1i5V@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.12.2023 11:46, Roger Pau Monné wrote:
> On Wed, Dec 06, 2023 at 08:27:59AM +0100, Jan Beulich wrote:
>> On 05.12.2023 16:55, Roger Pau Monné wrote:
>>> On Tue, Dec 05, 2023 at 03:59:13PM +0100, Jan Beulich wrote:
>>>> On 05.12.2023 15:29, Roger Pau Monné wrote:
>>>>> On Tue, Dec 05, 2023 at 09:52:31AM +0100, Jan Beulich wrote:
>>>>>> On 04.12.2023 18:27, Roger Pau Monné wrote:
>>>>>>> On Tue, Nov 28, 2023 at 11:34:04AM +0100, Jan Beulich wrote:
>>>>>>>> ..., at least as reasonably feasible without making a check hook
>>>>>>>> mandatory (in particular strict vs relaxed/zero-extend length checking
>>>>>>>> can't be done early this way).
>>>>>>>>
>>>>>>>> Note that only one of the two uses of hvm_load() is accompanied with
>>>>>>>> hvm_check(). The other directly consumes hvm_save() output, which ought
>>>>>>>> to be well-formed. This means that while input data related checks don't
>>>>>>>> need repeating in the "load" function when already done by the "check"
>>>>>>>> one (albeit assertions to this effect may be desirable), domain state
>>>>>>>> related checks (e.g. has_xyz(d)) will be required in both places.
>>>>>>>>
>>>>>>>> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
>>>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>>>> ---
>>>>>>>> Do we really need all the copying involved in use of _hvm_read_entry()
>>>>>>>> (backing hvm_load_entry()? Zero-extending loads are likely easier to
>>>>>>>> handle that way, but for strict loads all we gain is a reduced risk of
>>>>>>>> unaligned accesses (compared to simply pointing into h->data[]).
>>>>>>>
>>>>>>> See below, but I wonder whether the checks could be performed as part
>>>>>>> of hvm_load() without having to introduce a separate handler and loop
>>>>>>> over the context entries.
>>>>>>
>>>>>> Specifically not. State loading (in the longer run) would better not fail
>>>>>> once started. (Imo it should have been this way from the beginning.) Only
>>>>>> then will the vCPU still be in a predictable state even after a possible
>>>>>> error.
>>>>>
>>>>> Looking at the callers, does such predictable state after failure
>>>>> matter?
>>>>>
>>>>> One caller is an hypercall used by the toolstack at domain create,
>>>>> failing can just lead to the domain being destroyed.  The other caller
>>>>> is vm fork, which will also lead to the fork being destroyed if
>>>>> context loading fails.
>>>>>
>>>>> Maybe I'm overlooking something.
>>>>
>>>> You don't (I think), but existing callers necessarily have to behave the
>>>> way you describe. From an abstract perspective, though, failed state
>>>> loading would better allow a retry. And really I thought that when you
>>>> suggested to split checking from loading, you had exactly that in mind.
>>>
>>> Not really TBH, because I didn't think that much on a possible
>>> implementation when proposing it.
>>
>> But what else did you think of then in terms of separating checking from
>> loading?
> 
> Just calling the check and load functions inside of the same loop was
> my initial thought.

Okay, I was meanwhile also guessing that this might have been what you
thought of. I can go that route, but I wouldn't want to make it "and", but
"or" then, depending on a new boolean parameter to be passed to hvm_load().
IOW I'd still like to do all checking before all loading (in the longer
run, that is i.e. after individual handlers have been adapted). Would that
be okay with you?

Jan

