Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE8CABAB0B
	for <lists+xen-devel@lfdr.de>; Sat, 17 May 2025 18:25:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.988346.1373191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGKKE-0007Hc-Re; Sat, 17 May 2025 16:23:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 988346.1373191; Sat, 17 May 2025 16:23:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGKKE-0007Fd-Np; Sat, 17 May 2025 16:23:50 +0000
Received: by outflank-mailman (input) for mailman id 988346;
 Sat, 17 May 2025 16:23:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JLOd=YB=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1uGKKC-0007FX-Bk
 for xen-devel@lists.xenproject.org; Sat, 17 May 2025 16:23:48 +0000
Received: from mail.zytor.com (terminus.zytor.com [2607:7c80:54:3::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4db11186-333b-11f0-9eb8-5ba50f476ded;
 Sat, 17 May 2025 18:23:46 +0200 (CEST)
Received: from [192.168.7.202] ([71.202.166.45]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 54HGNEBu917019
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Sat, 17 May 2025 09:23:15 -0700
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
X-Inumbo-ID: 4db11186-333b-11f0-9eb8-5ba50f476ded
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 54HGNEBu917019
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1747498996;
	bh=maOuVxjg5o1o3ZGZ5VTl3WY0MMdEeWcAek4IAaxp2Tc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JmhzoS6ELcdbp9uSIzDOg8w2fMwp3grFVOk6J/F1MTs2tTo6AeD6I2ci7Vqb9Cw+r
	 RWtA5sW9Xgj8fDLRFSVyqE3FQb4gIV6e6j21PeHZfx/Z2nIkmN8vSMOxKamYKxtpFg
	 DgDJbWqT3tLRjHUQTNQkGKZhcujD2j0GB2RKF18ft9cKxg2Ov9d1tg7AI5T8NGz1mM
	 HHbQtySfIgbPkFiqWkflCI50y0dtLptX75e77lME9Z3+Xw9Hot6hMqF2DXtJ/LN9ML
	 1TKFVv3+JrNZLKx+1inrWt6BMWMlOwox35mY5mXit+uKZozEG9hxAG7dYb9KLpBCNh
	 Ptgae8SZzlnYQ==
Message-ID: <57f29caa-c952-4ea5-9e63-d19696512235@zytor.com>
Date: Sat, 17 May 2025 09:23:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] x86/xen/msr: Fix uninitialized symbol 'err'
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
        Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
        linux-acpi@vger.kernel.org, tglx@linutronix.de, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        peterz@infradead.org, boris.ostrovsky@oracle.com, rafael@kernel.org,
        lenb@kernel.org
References: <20250512084552.1586883-1-xin@zytor.com>
 <20250512084552.1586883-3-xin@zytor.com> <aCYIblffvBGUuxWf@gmail.com>
 <30affad5-4f26-4e22-9d64-b8ece1199773@zytor.com>
 <ae1d05f6-cd65-4ca4-87c5-af0ae34e21ce@suse.com>
Content-Language: en-US
From: Xin Li <xin@zytor.com>
Autocrypt: addr=xin@zytor.com; keydata=
 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
 l75w1xInsg==
In-Reply-To: <ae1d05f6-cd65-4ca4-87c5-af0ae34e21ce@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/16/2025 6:42 AM, Jürgen Groß wrote:
> On 15.05.25 20:11, Xin Li wrote:
>> On 5/15/2025 8:29 AM, Ingo Molnar wrote:
>>>
>>> * Xin Li (Intel) <xin@zytor.com> wrote:
>>>
>>>> xen_read_msr_safe() currently passes an uninitialized argument err to
>>>> xen_do_read_msr().  But as xen_do_read_msr() may not set the argument,
>>>> xen_read_msr_safe() could return err with an unpredictable value.
>>>>
>>>> To ensure correctness, initialize err to 0 (representing success)
>>>> in xen_read_msr_safe().
>>>>
>>>> Because xen_read_msr_safe() is essentially a wrapper of 
>>>> xen_do_read_msr(),
>>>> the latter should be responsible for initializing the value of *err 
>>>> to 0.
>>>> Thus initialize *err to 0 in xen_do_read_msr().
>>>>
>>>> Fixes: 502ad6e5a619 ("x86/msr: Change the function type of 
>>>> native_read_msr_safe()")
>>>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>>>> Closes: https://lore.kernel.org/xen-devel/aBxNI_Q0- 
>>>> MhtBSZG@stanley.mountain/
>>>> Signed-off-by: Xin Li (Intel) <xin@zytor.com>
>>>> ---
>>>>   arch/x86/xen/enlighten_pv.c | 5 ++++-
>>>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
>>>> index 3be38350f044..01f1d441347e 100644
>>>> --- a/arch/x86/xen/enlighten_pv.c
>>>> +++ b/arch/x86/xen/enlighten_pv.c
>>>> @@ -1091,6 +1091,9 @@ static u64 xen_do_read_msr(u32 msr, int *err)
>>>>   {
>>>>       u64 val = 0;    /* Avoid uninitialized value for safe variant. */
>>>> +    if (err)
>>>> +        *err = 0;
>>>> +
>>>>       if (pmu_msr_chk_emulated(msr, &val, true))
>>>>           return val;
>>>> @@ -1162,7 +1165,7 @@ static void xen_do_write_msr(u32 msr, u64 val, 
>>>> int *err)
>>>>   static int xen_read_msr_safe(u32 msr, u64 *val)
>>>>   {
>>>> -    int err;
>>>> +    int err = 0;
>>>>       *val = xen_do_read_msr(msr, &err);
>>>>       return err;
>>>
>>> So why not initialize 'err' with 0 in both callers, xen_read_msr_safe()
>>> and xen_read_msr(), and avoid all the initialization trouble in
>>> xen_do_read_msr()?
>>
>> Yeah, I should make the change in xen_read_msr() too.
>>
>> However xen_do_read_msr() should be implemented in a defensive way to
>> set *err properly as it's part of its return value.  Actually it was so,
>> but one of my previous cleanup patch removed it because err is no longer
>> passed to pmu_msr_chk_emulated().
> 
> xen_do_read_msr() is usable only in enlighten_pv.c as it is static.
> 
> So I'd prefer to drop setting err to 0 in xen_do_read_msr() initially
> and to set err to 0 in all callers.

Okay, I will send v1A to address this comment then.

Thanks!
     Xin

> Juergen


