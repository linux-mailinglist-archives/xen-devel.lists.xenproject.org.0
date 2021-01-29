Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A29CA308981
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 15:21:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78186.142125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Ued-0001gD-QZ; Fri, 29 Jan 2021 14:21:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78186.142125; Fri, 29 Jan 2021 14:21:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Ued-0001fq-Md; Fri, 29 Jan 2021 14:21:43 +0000
Received: by outflank-mailman (input) for mailman id 78186;
 Fri, 29 Jan 2021 14:21:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mmvf=HA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l5Ueb-0001fk-ST
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 14:21:41 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c2327b5d-8f06-402b-8ef7-d2eecf367b3f;
 Fri, 29 Jan 2021 14:21:40 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F41D8ABDA;
 Fri, 29 Jan 2021 14:21:39 +0000 (UTC)
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
X-Inumbo-ID: c2327b5d-8f06-402b-8ef7-d2eecf367b3f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611930100; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rSIB/mwGOIbDIICwLyh8IByBrAEDyLGQTx3QpR/M254=;
	b=qLwyPs+FxY/fJV/DRVK3LnpyWd+F+MdB0aMlfFbY09a2RPohmFERiPF0N/Eg4ucx67k5zY
	vFupfoWylyFL1CIs9VTr7h0KPDvojlBJKzZUCTgV+DFN+bWuIWfD16eUm46VKhs0HRn6/A
	N1ovAaz4RmDkoh5KN9UtBf4AwwQY+QM=
Subject: Re: Problems with APIC on versions 4.9 and later (4.8 works)
To: Claudemir Todo Bom <claudemir@todobom.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <CANyqHYfNBHnUiBiXHdt+R3mZ72oYQBnQcaWuKw5gY0uDb_ZqKw@mail.gmail.com>
 <e1d69914-c6bc-40b9-a9f4-33be4bd022b6@suse.com>
 <CANyqHYcifnCgd5C5vbYoi4CTtoMX5+jzGqHfs6JZ+e=d2Y_dmg@mail.gmail.com>
 <ff799cd4-ba42-e120-107c-5011dc803b5a@suse.com>
 <609a82d8-af12-4764-c4e0-f5ee0e11c130@suse.com>
 <CANyqHYehUWeNfVXqVJX6nrBS_CcKL1DQjyNVa1cUbvbx+zD83w@mail.gmail.com>
 <9d04edfe-0059-6fbf-c1da-2087f6190e64@suse.com>
 <CANyqHYfOC6JY978SRPAQ8Ug3GevFD=jbT6bVVET4+QOv8mv7qA@mail.gmail.com>
 <a0a7bbd0-c4c3-cfb8-5af0-a5a4aff14b76@suse.com>
 <CANyqHYeDR_NUKzPtbfLiUzxAUzerKepbU4B-_6=U-7Y6uy8gpQ@mail.gmail.com>
 <8837c3fb-1e0c-5941-258c-e76551a9e02b@suse.com>
 <8cf69fb3-5b8c-60ea-bd1c-39a0cbd5cb5c@suse.com>
 <CANyqHYeCQc2bt836uyrtm9Eo2T1uPP-+ups-ygfACu6zK36BQg@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ae48d027-535d-b076-e232-abcb128a4185@suse.com>
Date: Fri, 29 Jan 2021 15:21:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CANyqHYeCQc2bt836uyrtm9Eo2T1uPP-+ups-ygfACu6zK36BQg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 28.01.2021 14:08, Claudemir Todo Bom wrote:
> Em qui., 28 de jan. de 2021 às 06:49, Jan Beulich <jbeulich@suse.com> escreveu:
>>
>> On 28.01.2021 10:47, Jan Beulich wrote:
>>> On 26.01.2021 14:03, Claudemir Todo Bom wrote:
>>>> If this information is good for more tests, please send the patch and
>>>> I will test it!
>>>
>>> Here you go. For simplifying analysis it may be helpful if you
>>> could limit the number of CPUs in use, e.g. by "maxcpus=4" or
>>> at least "smt=0". Provided the problem still reproduces with
>>> such options, of course.
>>
>> Speaking of command line options - it doesn't look like you have
>> told us what else you have on the Xen command line, and without
>> a serial log this isn't visible (e.g. in your video).
> 
> All tests are done with xen command line:
> 
> dom0_mem=1024M,max:2048M dom0_max_vcpus=4 dom0_vcpus_pin=true
> smt=false vga=text-80x50,keep
> 
> and kernel command line:
> 
> loglevel=0 earlyprintk=xen nomodeset
> 
> this way I can get all xen messages on console.
> 
> Attached are the frames I captured from a video, I manually selected
> them starting from the first readable frame.

Okay, so we seem to be hitting two previously noticed issues, neither
of which so far was necessary to address directly (because there was
always something else to be tweaked such that the problems went away).

For one, the boot CPU has a TSC value that lags by more than a
second compared to all secondary CPUs. The way
time_calibration_tsc_rendezvous() works, together with the way we
calculate system time from the TSC (get_s_time_fixed() - this is
where the known issue here is: the function breaks when trying to
scale a negative delta, hence the absurdly high s= values in the
screenshots you've provided), allows for small negative deltas
between CPUs, but expects to bring all CPUs' TSCs forward (i.e. over
the 1s interval between rendezvous' the lagging CPUs are assumed to
have made enough progress to be ahead of the more towards the future
timestamps on the previous run). Secondary lagging behind the boot
CPU more than this could also be dealt with, but on your system the
situation is the other way around.

Btw - what kind of BIOS do you have on this system? This way of the
TSCs being set is pretty odd, and must be - unless you run other
pre-boot software or an unusual boot loader - caused by the BIOS.

And then this points out (again, afaic at least) that the way we
kickstart the rendezvous handling is likely inappropriate.
Especially when TSCs are skewed like they are here, it is unhelpful
to launch Dom0 before having brought the TSC in sync. (Related to
this, I also don't think we should arm the respective timer before
AP bringup was done, or else we risk the first rendezvous instance
to not hit all CPUs.)

I'll work on addressing both, hoping that in particular for the
first one you'll be ready to help with testing (through perhaps
multiple iterations).

> As a sidenote, I managed to get the system working with the parameter
> "tsc=unstable", performance looks satisfactory but I do not know what
> problems I may end with this parameter.

I _think_ you'd be running into trouble if you removed dom0_vcpus_pin
(which imo really no-one should use without reporting a bug, despite
all the hits to the contrary that one gets when searching the web),
and if you ran any guests (PV at least) without pinning their vCPU-s
to pCPU-s.

Jan

