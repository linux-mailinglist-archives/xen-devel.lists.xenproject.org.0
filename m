Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEXxDq1YxWkk9gQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 17:02:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9A53380DD
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 17:02:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1264453.1556009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5nAN-0006Mm-HW; Thu, 26 Mar 2026 16:02:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1264453.1556009; Thu, 26 Mar 2026 16:02:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5nAN-0006KT-Es; Thu, 26 Mar 2026 16:02:39 +0000
Received: by outflank-mailman (input) for mailman id 1264453;
 Thu, 26 Mar 2026 16:02:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w5nAM-0006KJ-7m
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 16:02:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5nAL-001Gvm-Jq
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 17:02:37 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c55899-e002-0a2a0a5209dd-0a2a4503babe-28
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 17:02:37 +0100
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c5589d-1947-0a2a45030019-d155dd35cc72-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 17:02:37 +0100
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-439b94a19fdso1085161f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 09:02:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b919df903sm9147491f8f.30.2026.03.26.09.02.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2026 09:02:36 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774540957; x=1775145757; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dI8bo9ARUgtzJLHKohHwufYiwlIKOeOrKOtPwrW4eX4=;
        b=fkGJHPpI1NFPVh74Yk9gR+42DXyupW9+TGUYUAN61k7ro4crt3hR0TC34fdCcCsVjM
         qYjVOueuxjImZDX+gEcpWkiZ7ohp2zIf2I43SzKA8vv6pLAyXzcm6jytg9uI6rydI6Xh
         sKSAZ4ucl93PbKZqiumQVy69KNE0YvvrCOtwMRHBjVjHYOGfzlU3vP2qsLEKvTPHkTYQ
         lbvhnn0C6jnu7Z6UzS47rRq6vlmo7guJgHO0C3GPKV0nA2ru4kTH09BkCiPJMSGeziwc
         /jEs4OZEdSYb2n7vpTfFMGaMJ59+SWrzNf83D0XME5o/783Fg0VNPxkjKo7te7GnIgTX
         U/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774540957; x=1775145757;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dI8bo9ARUgtzJLHKohHwufYiwlIKOeOrKOtPwrW4eX4=;
        b=tY1KwzjuT6jlLmUf3/2Iv2YKzVUcq6B9GUJY0VTrTHbjmktuz/3tYroQJxD/7VgTjA
         /8L25+Dag0ds6wEbYS66sKn33MqN4siVVMvK2vE8Ilcl2qvUND4C8ZOd6zWQ03qmo+kY
         i/GH7cjil9qB8EC3cuVJjV1ZBVGIJdFGiAe7UoNjhCTVocm0zXT+RpH+zatDbvg8DjAO
         F/vgsNDqQV+lyvW6k3QfDZOzW1fsAvbbFSLWMNOs35EBtRfCR9FjNvdT1Tz1SsXBTa9x
         K190WdIW66NQAH0knjvZkJOtFtfdfofVjKS3cNex2TvKrSV/TMHFjzH6owxNhEnFc3mO
         eBGA==
X-Gm-Message-State: AOJu0YxqqY08cWs4fLMWuIWVLz5/r5rDkBqWsGjxDsvDhTHoWZnhuOWh
	Mj6SnKH+z4vB5792Ui6f2nHDTfFrJ0crI8lXxroUMDErwTbGLHROiYb0nMcVoeqZpfmLPbSjnwo
	RxXUe9Q==
X-Gm-Gg: ATEYQzwwj7zn+KcNIJX3E1pXcPzZWIOsaYAn6fpfgHRRZ4P+njd45sZQGRpqFes02sa
	tkl2N+vQlgowENVlltvP8C3uV1GERcpDrI1XZn5Z2nBKMXwbzmDuTEJmTgECXClLiI6HacLO2oI
	+OyOmhi06nvsIaiL81xMho8ZLg0s8hcpMdPFaZZrrmnAyVBaWKACnP0aBBlvTzyhsBLy0Qf1Lxw
	znM/j67DGjanvmUCPrSYK6wnkJDx/VnK88GI3JN3sOKJLSXqv4b+8Z87og3swOMaGbVgO9Bi4YG
	bTB4PdM95Oq7oi0l+8I+9FJNVHGEAw/uLsfhvidTcCuWunmWpn9AJtt6HVSZKEwwiY5JnivEibB
	HHfyzcHbmh+vzpoVYhsvHsJiwnEAZR93fkglk2uboDJxXU1rTrqBDAvaEwd5vXk7Z4xKRc6tmo8
	WFk8PkMPX8cNRcewJsT8OFvyFTJMXLnlsBDUysU96pukDLDlxy0K/6AA54Vfo5H2UwqMTMJdWnR
	CGaZQ0NfW3AXaA=
X-Received: by 2002:a05:6000:40e0:b0:439:af81:1b23 with SMTP id ffacd0b85a97d-43b889aaf9fmr12259715f8f.21.1774540956671;
        Thu, 26 Mar 2026 09:02:36 -0700 (PDT)
Message-ID: <88c65ec7-b7f7-4d8b-a453-d707440b43cb@suse.com>
Date: Thu, 26 Mar 2026 17:02:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Slow (higher scheduling latency?) system after S3 - regression
 4.17 -> 4.19 ?
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
References: <aPzBO_eW8mQHM66u@mail-itl> <acQzzlXNDxNq885V@mail-itl>
 <29775afa-e17b-4c44-a2a8-4ef4bc7cdf0f@suse.com> <acUqOL232lp-Lw1v@mail-itl>
 <cbed767b-4ac4-4989-8778-43ff321ae977@suse.com> <acVWX8vkhZiFfonP@mail-itl>
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
In-Reply-To: <acVWX8vkhZiFfonP@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1774540957-77C8C72C-844C0C78/0/0
X-purgate-type: clean
X-purgate-size: 5123
X-Spamd-Result: default: False [-0.19 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,qubes-os.org:url];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9D9A53380DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26.03.2026 16:53, Marek Marczykowski-Górecki wrote:
> On Thu, Mar 26, 2026 at 02:20:04PM +0100, Jan Beulich wrote:
>> On 26.03.2026 13:44, Marek Marczykowski-Górecki wrote:
>>> On Thu, Mar 26, 2026 at 09:27:56AM +0100, Jan Beulich wrote:
>>>> On 25.03.2026 20:13, Marek Marczykowski-Górecki wrote:
>>>>> On Sat, Oct 25, 2025 at 02:23:23PM +0200, Marek Marczykowski-Górecki wrote:
>>>>>> Hi,
>>>>>>
>>>>>> After updating from Xen 4.17 to 4.19 it appears that I have some
>>>>>> performance issues if system was suspended before. For now this is just
>>>>>> vague observation, as I don't have much data yet.
>>>>>>
>>>>>> Generally, the user observable effect is that audio playback (over
>>>>>> Qubes's PV audio thing) becomes very choppy, beyond usefulness (cannot
>>>>>> make audio calls anymore, music/video playback also becomes useless with
>>>>>> some players. For me this suggests some increased latency in scheduling
>>>>>> - maybe some timer fires too late?
>>>>>>
>>>>>> This doesn't happen always, but I'd say quite often after S3, sometimes
>>>>>> may need two or three suspend cycles to trigger the issue. But it's
>>>>>> possible it is also some other factor, like which pCPU the VM gets
>>>>>> scheduled on, maybe? But for now I didn't hit this issue before
>>>>>> performing any S3. I don't have a reliable reproducer yet.
>>>>>>
>>>>>> While I write it's related to 4.17 -> 4.19 update, there is also slight
>>>>>> possibility it's related to hardware change (CFL -> MTL). But, it's
>>>>>> unlikely, since I'd probably get much more bug reports about that (the
>>>>>> stable Qubes version uses 4.17, and we have many users on MTL).
>>>>>>
>>>>>> What would be the method to collect some useful debugging info? Some
>>>>>> debug-keys (r? a?), some cmdline options?
>>>>>
>>>>> In the meantime (sharing some of it on Matrix already), I managed to
>>>>> build a much more isolated test. Specifically, a single PVH domU with
>>>>> VLC, preloading 1s of audio (and not playing it really, the output is
>>>>> set to a file). The specific command is:
>>>>>
>>>>>     VLC_VERBOSE=3 vlc -I cli -A afile --no-loop --play-and-exit --run-time 1   ./melodigne-quiz-blind-test-187140.mp3
>>>>>
>>>>> The domU rootfs (or rather: initramfs) is based on AppImage of VLC,
>>>>> there is not much more inside, and the above command is called as part
>>>>> of init script (and domU is terminated shortly after).
>>>>>
>>>>> There is no persistent state in the test, the whole thing is network
>>>>> booted from the same base. The only things changing between runs is xen
>>>>> binary + toolstack.
>>>>>
>>>>> In the output I'm looking for this line: main input debug: Stream buffering done (1018 ms in 2 ms)
>>>>>
>>>>> Before S3 it takes 0-2ms, sometimes (rarely) 10ms (not sure why). Just
>>>>> after S3 it takes very similar amount of time.
>>>>> Then, I wait 30min, and run that command (or really the whole domU)
>>>>> again a few times. I consider it "good" if I get at least one result
>>>>> below 10ms. With this test in hand, I did run bisect between
>>>>> staging-4.17 and staging-4.19. And here stuff gets interesting:
>>>>>
>>>>> At 498a4ded74b3f062c52e42568223dc5858d27731 I get the following times
>>>>> (in ms):
>>>>>
>>>>>     30m after S3: 2, 2, 10, 10, 
>>>>>     1h after S3: 2, 16, 16, 2, 17
>>>>>
>>>>> At 5effd810c629d9a836e46ee321ca7409dad27212:
>>>>>
>>>>>     30m after S3: 26, 27, 26, 15
>>>>>     1h after S3: 24, 25, 37, 37, 25
>>>>>
>>>>> This doesn't make any sense to me. There is a clear difference, yet
>>>>> 5effd810c629d9a836e46ee321ca7409dad27212 looks like a no-op change (at
>>>>> least for this Intel system).
>>>>
>>>> Pretty odd indeed. I assume you double checked the effect by going back
>>>> and forth between the two commits.
>>>
>>> Yes...
>>>
>>>> If the effect persists, could you make
>>>> both binaries (xen-syms or xen.efi respectively, depending on which one
>>>> you use of the system) available somewhere for inspection? There has to
>>>> be some relevant difference, e.g. by addresses shifting slightly.
>>>
>>> Sure, here: https://salmon.qubes-os.org/~marmarek/xen-perf-weird.tar.gz
>>
>> While said commit changes the size of init_nonfatal_mce_checker() by 4
>> bytes, that doesn't lead to any other changes. I.e. all addresses remain
>> the same. I.e. I'm completely lost as to explaining the observed behavior
>> (or even just making a wild guess).
> 
> With staging-4.19 from a week ago +
> 5effd810c629d9a836e46ee321ca7409dad27212 reverted, I got the following
> results:
> 
> 30m after S3: 23, 22, 22, 23
> 1h after S3: 7, 25, 22, 8, 25
> 
> So, there are some fast runs, but most are in line with the "bad" case
> above...
> 
> But, I have another idea why that seemingly no-op commit may change
> something: maybe it's about stack content during/after the function
> call, influencing some uninitialized variable down the road?

Possible in principle, but not something which would change specifically
by said commit, or specifically across S3.

Jan

