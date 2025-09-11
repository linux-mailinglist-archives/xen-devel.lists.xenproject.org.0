Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D78B53D03
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 22:20:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1120842.1465534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwnld-0000nD-8D; Thu, 11 Sep 2025 20:19:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1120842.1465534; Thu, 11 Sep 2025 20:19:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwnld-0000k4-4u; Thu, 11 Sep 2025 20:19:41 +0000
Received: by outflank-mailman (input) for mailman id 1120842;
 Thu, 11 Sep 2025 20:18:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew@xen.org>)
 id 1uwnkl-0000j2-TP; Thu, 11 Sep 2025 20:18:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <andrew@xen.org>) id 1uwnkk-0051p6-2S;
 Thu, 11 Sep 2025 20:18:46 +0000
Received: from host-195-149-20-212.as13285.net ([195.149.20.212]
 helo=[192.168.1.183])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <andrew@xen.org>) id 1uwnkk-004kUE-2p;
 Thu, 11 Sep 2025 20:18:46 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=BybyxlsIV5NU/aaN9hg4Y0yoTFvcU+i2l/qm/JtmDIo=; b=Gax9dLpuU0+dWAwU7RwgqsfmfX
	TQz8AQjZT7ub4pFBjgpvrCzN3vXtxTlG9dJZsNnf2dB0JH+3ITHX9Lc3UA9yigUz2mUUQb+ljFPoe
	cYpMOtsEYU4KB4dhcYl+w1wd9JqWEbIMKQLqJVchQpuhJ3lEExm12nKemXKpDB8Uisa0=;
Message-ID: <2daad10e-e1ae-4e95-9b29-13c27425d8c3@xen.org>
Date: Thu, 11 Sep 2025 21:18:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: domU reboot claim failed
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Jan Beulich <jbeulich@suse.com>, Jason Andryuk <jason.andryuk@amd.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Xen-devel <xen-devel-bounces@lists.xenproject.org>
References: <fae4b58f-c6ff-4db1-8198-1a5f76868d4d@amd.com>
 <d81b0c13-853e-479a-ad11-9b9990b723a3@citrix.com>
 <dfed2c2a-f4b7-4efe-bb1e-c5173c1fe531@suse.com>
 <DCQ36BD5H3WJ.3HQWZERCZS2JD@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew@xen.org>
In-Reply-To: <DCQ36BD5H3WJ.3HQWZERCZS2JD@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

[Resend from an account which will let me...]

On 11/09/2025 4:46 pm, Alejandro Vallejo wrote:
> On Thu Sep 11, 2025 at 9:55 AM CEST, Jan Beulich wrote:
>> On 10.09.2025 23:57, Andrew Cooper wrote:
>>> On 10/09/2025 7:58 pm, Jason Andryuk wrote:
>>>> Hi,
>>>>
>>>> We're running Android as a guest and it's running the Compatibility
>>>> Test Suite.  During the CTS, the Android domU is rebooted multiple times.
>>>>
>>>> In the middle of the CTS, we've seen reboot fail.  xl -vvv shows:
>>>> domainbuilder: detail: Could not allocate memory for HVM guest as we
>>>> cannot claim memory!
>>>> xc: error: panic: xg_dom_boot.c:119: xc_dom_boot_mem_init: can't
>>>> allocate low memory for domain: Out of memory
>>>> libxl: error: libxl_dom.c:581:libxl__build_dom: xc_dom_boot_mem_init
>>>> failed: Cannot allocate memory
>>>> domainbuilder: detail: xc_dom_release: called
>>>>
>>>> So the claim failed.  The system has enough memory since we're just
>>>> rebooting the same VM.  As a work around, I added sleep(1) + retry,
>>>> which works.
>>>>
>>>> The curious part is the memory allocation.  For d2 to d5, we have:
>>>> domainbuilder: detail: range: start=0x0 end=0xf0000000
>>>> domainbuilder: detail: range: start=0x100000000 end=0x1af000000
>>>> xc: detail: PHYSICAL MEMORY ALLOCATION:
>>>> xc: detail:   4KB PAGES: 0x0000000000000000
>>>> xc: detail:   2MB PAGES: 0x00000000000006f8
>>>> xc: detail:   1GB PAGES: 0x0000000000000003
>>>>
>>>> But when we have to retry the claim for d6, there are no 1GB pages used:
>>>> domainbuilder: detail: range: start=0x0 end=0xf0000000
>>>> domainbuilder: detail: range: start=0x100000000 end=0x1af000000
>>>> domainbuilder: detail: HVM claim failed! attempt 0
>>>> xc: detail: PHYSICAL MEMORY ALLOCATION:
>>>> xc: detail:   4KB PAGES: 0x0000000000002800
>>>> xc: detail:   2MB PAGES: 0x0000000000000ce4
>>>> xc: detail:   1GB PAGES: 0x0000000000000000
>>>>
>>>> But subsequent reboots for d7 and d8 go back to using 1GB pages.
>>>>
>>>> Does the change in memory allocation stick out to anyone?
>>>>
>>>> Unfortunately, I don't have insight into what the failing test is doing.
>>>>
>>>> Xen doesn't seem set up to track the claim across reboot.  Retrying
>>>> the claim works in our scenario since we have a controlled configuration.
>>> This looks to me like a known phenomenon.  Ages back, a change was made
>>> in how Xen scrubs memory, from being synchronous in domain_kill(), to
>>> being asynchronous in the idle loop.
>>>
>>> The consequence being that, on an idle system, you can shutdown and
>>> reboot the domain faster, but on a busy system you end up trying to
>>> allocate the new domain while memory from the old domain is still dirty.
>>>
>>> It is a classic example of a false optimisation, which looks great on an
>>> idle system only because the idle CPUs are swallowing the work.
>> I wouldn't call this a "false optimization",

Sorry - I was referring to things more generally.  There's a huge number
of things that look like great ideas when you develop and demo them on
an idle system, and then they fall off a cliff on a busy system.

This is one.  Releasing the domctl lock in domain_kill() was another
(this one did get reverted IIRC).  XenServer's attempt to compress the
migrate stream, etc.

Performance is hard, and definitely harder than functional fixes.  All
of these were reasonable hypotheses and a valid line of experimentation,
but were not tested outside of idle conditions.

All of these examples have behaviour on a busy system which is far worse
than not having the improvement in the first place.  Hence the "false"
part of the optimisation.

>>  but rather one ...
>>
>>> This impacts the ability to find a 1G aligned block of free memory to
>>> allocate a superpage with, and by the sounds of it, claims (which
>>> predate this behaviour change) aren't aware of the "to be scrubbed"
>>> queue and fail instead.
>> ... which isn't sufficiently integrated with the rest of the allocator.
>>
>> Jan
> That'd depend on the threat model.

I'm pretty sure Kconfig post-dates the change in question here.

> At the very least there ought to be a
> Kconfig knob to control it. You can't really tell a customer "your data is
> gone from our systems" unless it really is gone. I'm guessing part of the
> rationale was speeding up the obnoxiously slow destroydomain, since it hogs
> a dom0 vCPU until it's done and it can take many minutes in large domains.

It was Oracle being unhappy at domain shutdown on a 2T VM taking 20 minutes.

> IOW: It's a nice optimisation, but there's multiple use cases for specifically
> not wanting something like that.

My recommendation at some point under the fact was a parameter to
domain_kill().  In a mixed system, you might care about it for some
domains and not others.

Although it occurs to me now that really it needs to be an input to
domain_create(), because if you care about it on a VM, you care about
anything that gets freed, not just the things freed right at the end of
the domain's lifetime.

~Andrew

