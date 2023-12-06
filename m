Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41154806838
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 08:28:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648949.1013076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAmKB-0004bA-OD; Wed, 06 Dec 2023 07:28:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648949.1013076; Wed, 06 Dec 2023 07:28:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAmKB-0004Yw-Kt; Wed, 06 Dec 2023 07:28:03 +0000
Received: by outflank-mailman (input) for mailman id 648949;
 Wed, 06 Dec 2023 07:28:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X1yw=HR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rAmK9-0004V8-VA
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 07:28:01 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc6c86a8-9408-11ee-98e5-6d05b1d4d9a1;
 Wed, 06 Dec 2023 08:28:01 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40c09dfd82aso44219875e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 23:28:01 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bg24-20020a05600c3c9800b0040b3d33ab55sm24914006wmb.47.2023.12.05.23.28.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 23:28:00 -0800 (PST)
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
X-Inumbo-ID: fc6c86a8-9408-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701847680; x=1702452480; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GXLZiTAwLu1s40lVr9O7yGIqujpbJL4Gq57EsZEVx8g=;
        b=aCzsWfaQVOUltGHqavJaM0idhe7cZ+IgOPxDMgm4xUeAb4T0llCVIm58UwLcDOcv72
         U+TO73GswyS9k4mZ1K5Qky0+DgfZvkYRr5vdUkvJrzCPmXak3WTJsAOJyVI1bIySDeu0
         DOI1sganpuPwbcgpWWhbNgqM0gm3XGXtk6zxGYA33cD44duMcaFn9awmGv11GrYIgLuq
         NiyJW4ywt80Exs1QvE7+4GI6nWW1Z20/OCoMCcAkbZtBIslTYCi/GuLQkuWrtG3dRDUe
         YqoIoSz1tyIEb3ukXXx3C+FwvpzNG/JRAJfq3XxPknyQ3hzlbuWGYxwx8SCGR3ZfzMlR
         0D9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701847680; x=1702452480;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GXLZiTAwLu1s40lVr9O7yGIqujpbJL4Gq57EsZEVx8g=;
        b=a4SnO0XRiWtV1CRnL8IfFoIs6oGLtdvqRPp/tXOqrx8hpLBy1uSudKr18iwVLtT/Kv
         QSNWi4vwItOO5ZIhZUfarouG3fLBWN3c0j/+KKABiCIV1OzA+TeC3aY13scgRpz0dv2n
         iSY3aMsCY9F8G7nLaaUR/p8EBfcUyjxwuCnsKcsX4T0qlMJYP7Y6PbrkxMectAe59mzv
         8/82otTlSQgIcsfOpfkFH7FZVDtcqaXylnZCw/DaJzkJcbimp3XevmXa0tQbebImA38V
         XV9mFCKIjXqauT3iQUHqPpPU9nzwb/NYHwQ8MC2IVgxIXYU5Ny7gtxlMrAFqp3QTY7ES
         uzNw==
X-Gm-Message-State: AOJu0YyHz8ik85jzwZHea/RzHn8q+PYQ2GJW3XMmjEF0OAtLDZ2N0U/C
	uWzKxPi3FYk+Bwn4z7VWFmfm
X-Google-Smtp-Source: AGHT+IGRFvalsSP5M4p0rcuCux53hLd7fRLymC1Og6XKKiNa9tDEnGnLJotfcwe1dgaYz0HqWIHGNg==
X-Received: by 2002:a05:600c:225a:b0:40c:22b5:d16d with SMTP id a26-20020a05600c225a00b0040c22b5d16dmr121843wmm.29.1701847680604;
        Tue, 05 Dec 2023 23:28:00 -0800 (PST)
Message-ID: <21cdb9ad-81f5-497a-bfd8-ef6aea5906e2@suse.com>
Date: Wed, 6 Dec 2023 08:27:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] x86/HVM: split restore state checking from state
 loading
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
References: <49a17ffa-c873-4b0f-81ed-9587053ca159@suse.com>
 <dcc726f5-634e-4b48-aa8f-d477cdc8dea9@suse.com> <ZW4L5Q4SMprtmbK-@macbook>
 <5f7c43ca-dfc4-4929-8776-6985e610e154@suse.com> <ZW8zyXkUJDKVt-HX@macbook>
 <2ded19f7-2ba6-4b1c-8752-a73894dcdae0@suse.com> <ZW9H1uE_6k3d-uWn@macbook>
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
In-Reply-To: <ZW9H1uE_6k3d-uWn@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.12.2023 16:55, Roger Pau Monné wrote:
> On Tue, Dec 05, 2023 at 03:59:13PM +0100, Jan Beulich wrote:
>> On 05.12.2023 15:29, Roger Pau Monné wrote:
>>> On Tue, Dec 05, 2023 at 09:52:31AM +0100, Jan Beulich wrote:
>>>> On 04.12.2023 18:27, Roger Pau Monné wrote:
>>>>> On Tue, Nov 28, 2023 at 11:34:04AM +0100, Jan Beulich wrote:
>>>>>> ..., at least as reasonably feasible without making a check hook
>>>>>> mandatory (in particular strict vs relaxed/zero-extend length checking
>>>>>> can't be done early this way).
>>>>>>
>>>>>> Note that only one of the two uses of hvm_load() is accompanied with
>>>>>> hvm_check(). The other directly consumes hvm_save() output, which ought
>>>>>> to be well-formed. This means that while input data related checks don't
>>>>>> need repeating in the "load" function when already done by the "check"
>>>>>> one (albeit assertions to this effect may be desirable), domain state
>>>>>> related checks (e.g. has_xyz(d)) will be required in both places.
>>>>>>
>>>>>> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>> ---
>>>>>> Do we really need all the copying involved in use of _hvm_read_entry()
>>>>>> (backing hvm_load_entry()? Zero-extending loads are likely easier to
>>>>>> handle that way, but for strict loads all we gain is a reduced risk of
>>>>>> unaligned accesses (compared to simply pointing into h->data[]).
>>>>>
>>>>> See below, but I wonder whether the checks could be performed as part
>>>>> of hvm_load() without having to introduce a separate handler and loop
>>>>> over the context entries.
>>>>
>>>> Specifically not. State loading (in the longer run) would better not fail
>>>> once started. (Imo it should have been this way from the beginning.) Only
>>>> then will the vCPU still be in a predictable state even after a possible
>>>> error.
>>>
>>> Looking at the callers, does such predictable state after failure
>>> matter?
>>>
>>> One caller is an hypercall used by the toolstack at domain create,
>>> failing can just lead to the domain being destroyed.  The other caller
>>> is vm fork, which will also lead to the fork being destroyed if
>>> context loading fails.
>>>
>>> Maybe I'm overlooking something.
>>
>> You don't (I think), but existing callers necessarily have to behave the
>> way you describe. From an abstract perspective, though, failed state
>> loading would better allow a retry. And really I thought that when you
>> suggested to split checking from loading, you had exactly that in mind.
> 
> Not really TBH, because I didn't think that much on a possible
> implementation when proposing it.

But what else did you think of then in terms of separating checking from
loading?

> Maybe a suitable compromise would be to reset the state to the initial
> (at domain build) one on failure?

That's an option, sure.

> I do dislike the duplicated loops, as it seems like a lot of duplicate
> boilerplate code, and I have fears of it going out of sync.

There's a certain risk, yes, but that exists similarly with the save and
load sides imo.

Andrew - before I go and undo the v2 changes, what is your view?

Jan

