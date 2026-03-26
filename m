Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGFiGpcyxWk98AQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 14:20:23 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A066D335E10
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 14:20:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1264122.1555845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5kd6-0000FN-Bl; Thu, 26 Mar 2026 13:20:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1264122.1555845; Thu, 26 Mar 2026 13:20:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5kd6-0000CZ-8i; Thu, 26 Mar 2026 13:20:08 +0000
Received: by outflank-mailman (input) for mailman id 1264122;
 Thu, 26 Mar 2026 13:20:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w5kd5-00006D-IS
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 13:20:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5kd4-009lZ2-UW
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 14:20:06 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c53282-2eae-0a2a0a5409dd-0a2a45018922-30
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 14:20:06 +0100
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c53286-6400-0a2a45010019-d1558032d4cf-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 14:20:06 +0100
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4852a9c6309so9201515e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 06:20:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b9192e35esm7365813f8f.6.2026.03.26.06.20.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2026 06:20:05 -0700 (PDT)
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
        d=suse.com; s=google; t=1774531206; x=1775136006; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rcYqFzyqvI8ig/NcoUHj2uFaipLPsf86wtjiCfYrbmU=;
        b=gI0b8CCaJlgJ5sXy+HtFh+Q5n4OLESpBaNvfex3KEv1kiWZzXykJgOY5+6Jv6Pfiup
         Le5MROHqo+l7THP0HJRwA5da2+E72kure2v5cNs7K4uHFiGfFCLoMmj8clpI2DaOAeBu
         UT7Wz5IqxdLunkJw3VL2M0VSyoKJdlJjfKSz3WsxlmHypXOzrO/oG3VMGgmBFBi1t8an
         qTcKuunsOLR66CkS3q7HJSE16UTgJdaxXrBluSMMoog+VWCiWJ9VPnHXdTYPCvUSgg9t
         Zfagozrx1mbtRfpVRgor9GOszWN3EwPADr2f17O7IbCyYqB18/Xe8WkfVI0ITSgRYXhn
         BT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774531206; x=1775136006;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rcYqFzyqvI8ig/NcoUHj2uFaipLPsf86wtjiCfYrbmU=;
        b=i06ZFctn4dPZnWTW1gpn6GS0hYzA6WJb8BHUlGr37wXI9ZEnKU/Y+uGNOhmoJUpORt
         3LJd86UPrsOfz1BvyjURO3rPG0qW8nB9tB1rnaY8h0xSNNPyF4PxT4wPf9haA6jAh4D+
         b2zy9nwkaQwjAknGFKsh9pnoRP9Pn4lpy4VHYcA8E3bx6zNSvQRfcNGQMa5BUzxdLfWP
         2lJRbwypKR1W9zmnTRgOXnrqW4PtYmhgWZdpRvQjNWbYDR0ZN65k49RtjMPK9Hi/D8EB
         CtP9qEsJL2aMLMGNbbd5K/jND9Zz0slYI6XlApmO1acOC0WerYlUW6gbNguJrFWXo7HK
         sO7g==
X-Gm-Message-State: AOJu0YzMWzuKvXY1gvFG1f7VvA7THtxA8okEATE4TpWXZS7spcXJ5hH8
	zumlRS7jyrSFhd5BgDWvUYDpUcsWQiwFJJIOkb16kn1hidybnT0Ga6Sojsb+cQRS5UPj7iunJJv
	TDErQ3g==
X-Gm-Gg: ATEYQzxftaFPcRhsTiLmqbitkrD4xoYcezXrlb7uQOn+vn/KDw1MowHLFJbHRkEgPWA
	gnQpUv6sbTNpxKyoP0nXfNQbOTyJYSzBLbkgr8RdZv4ZXV3sfXBbKSL7l5UkOTmIGS+EtMR+HaY
	vlJ1LOaob8CMmaCuN6LnQoXKlxUo0aRVVSKN1x6D8ek/RqrPcLLCvrOUzf/WXlknF+Mj9KInbaJ
	cFJxQg6jRIOgT5+BhMBuXgBI59PyUgKoo+1MBf7BbxQzKXCSE3Jazhdw5olqi9c7yxEwZ/N9R/p
	zM8oflm9YUmnPGbBhx6FLyj3fJmPBEoZZ3GLYFtRu0zMqSQTjRtgnaaRsQan2IpIPuXBs9Oq4Ok
	9Rf7yPMO84HhOkXNfOqh7o7uR8BWhRB7MaqjJTOBA7Jrm+P2E3DB3ZfI/NUHFmjF2WPMyDPRHvW
	KCF985SYTxYt3iGI+rOeag8qHhGopXbT441O/RuSEwSLRcg/sKQR7uZJKi6EGJkdG1qDQ2Brf0D
	KarQ4O6T2fU+r8=
X-Received: by 2002:a05:600c:1394:b0:486:fe46:b647 with SMTP id 5b1f17b1804b1-48715fd6193mr114025445e9.10.1774531206116;
        Thu, 26 Mar 2026 06:20:06 -0700 (PDT)
Message-ID: <cbed767b-4ac4-4989-8778-43ff321ae977@suse.com>
Date: Thu, 26 Mar 2026 14:20:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Slow (higher scheduling latency?) system after S3 - regression
 4.17 -> 4.19 ?
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
References: <aPzBO_eW8mQHM66u@mail-itl> <acQzzlXNDxNq885V@mail-itl>
 <29775afa-e17b-4c44-a2a8-4ef4bc7cdf0f@suse.com> <acUqOL232lp-Lw1v@mail-itl>
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
In-Reply-To: <acUqOL232lp-Lw1v@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1774531206-8EEE2DF3-35FB3285/0/0
X-purgate-type: clean
X-purgate-size: 4212
X-Spamd-Result: default: False [-0.19 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,qubes-os.org:url];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
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
X-Rspamd-Queue-Id: A066D335E10
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26.03.2026 13:44, Marek Marczykowski-Górecki wrote:
> On Thu, Mar 26, 2026 at 09:27:56AM +0100, Jan Beulich wrote:
>> On 25.03.2026 20:13, Marek Marczykowski-Górecki wrote:
>>> On Sat, Oct 25, 2025 at 02:23:23PM +0200, Marek Marczykowski-Górecki wrote:
>>>> Hi,
>>>>
>>>> After updating from Xen 4.17 to 4.19 it appears that I have some
>>>> performance issues if system was suspended before. For now this is just
>>>> vague observation, as I don't have much data yet.
>>>>
>>>> Generally, the user observable effect is that audio playback (over
>>>> Qubes's PV audio thing) becomes very choppy, beyond usefulness (cannot
>>>> make audio calls anymore, music/video playback also becomes useless with
>>>> some players. For me this suggests some increased latency in scheduling
>>>> - maybe some timer fires too late?
>>>>
>>>> This doesn't happen always, but I'd say quite often after S3, sometimes
>>>> may need two or three suspend cycles to trigger the issue. But it's
>>>> possible it is also some other factor, like which pCPU the VM gets
>>>> scheduled on, maybe? But for now I didn't hit this issue before
>>>> performing any S3. I don't have a reliable reproducer yet.
>>>>
>>>> While I write it's related to 4.17 -> 4.19 update, there is also slight
>>>> possibility it's related to hardware change (CFL -> MTL). But, it's
>>>> unlikely, since I'd probably get much more bug reports about that (the
>>>> stable Qubes version uses 4.17, and we have many users on MTL).
>>>>
>>>> What would be the method to collect some useful debugging info? Some
>>>> debug-keys (r? a?), some cmdline options?
>>>
>>> In the meantime (sharing some of it on Matrix already), I managed to
>>> build a much more isolated test. Specifically, a single PVH domU with
>>> VLC, preloading 1s of audio (and not playing it really, the output is
>>> set to a file). The specific command is:
>>>
>>>     VLC_VERBOSE=3 vlc -I cli -A afile --no-loop --play-and-exit --run-time 1   ./melodigne-quiz-blind-test-187140.mp3
>>>
>>> The domU rootfs (or rather: initramfs) is based on AppImage of VLC,
>>> there is not much more inside, and the above command is called as part
>>> of init script (and domU is terminated shortly after).
>>>
>>> There is no persistent state in the test, the whole thing is network
>>> booted from the same base. The only things changing between runs is xen
>>> binary + toolstack.
>>>
>>> In the output I'm looking for this line: main input debug: Stream buffering done (1018 ms in 2 ms)
>>>
>>> Before S3 it takes 0-2ms, sometimes (rarely) 10ms (not sure why). Just
>>> after S3 it takes very similar amount of time.
>>> Then, I wait 30min, and run that command (or really the whole domU)
>>> again a few times. I consider it "good" if I get at least one result
>>> below 10ms. With this test in hand, I did run bisect between
>>> staging-4.17 and staging-4.19. And here stuff gets interesting:
>>>
>>> At 498a4ded74b3f062c52e42568223dc5858d27731 I get the following times
>>> (in ms):
>>>
>>>     30m after S3: 2, 2, 10, 10, 
>>>     1h after S3: 2, 16, 16, 2, 17
>>>
>>> At 5effd810c629d9a836e46ee321ca7409dad27212:
>>>
>>>     30m after S3: 26, 27, 26, 15
>>>     1h after S3: 24, 25, 37, 37, 25
>>>
>>> This doesn't make any sense to me. There is a clear difference, yet
>>> 5effd810c629d9a836e46ee321ca7409dad27212 looks like a no-op change (at
>>> least for this Intel system).
>>
>> Pretty odd indeed. I assume you double checked the effect by going back
>> and forth between the two commits.
> 
> Yes...
> 
>> If the effect persists, could you make
>> both binaries (xen-syms or xen.efi respectively, depending on which one
>> you use of the system) available somewhere for inspection? There has to
>> be some relevant difference, e.g. by addresses shifting slightly.
> 
> Sure, here: https://salmon.qubes-os.org/~marmarek/xen-perf-weird.tar.gz

While said commit changes the size of init_nonfatal_mce_checker() by 4
bytes, that doesn't lead to any other changes. I.e. all addresses remain
the same. I.e. I'm completely lost as to explaining the observed behavior
(or even just making a wild guess).

Jan

