Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E9427D228
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 17:08:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.247.567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNHDp-0005y0-Bd; Tue, 29 Sep 2020 15:07:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247.567; Tue, 29 Sep 2020 15:07:17 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNHDp-0005xi-4a; Tue, 29 Sep 2020 15:07:17 +0000
Received: by outflank-mailman (input) for mailman id 247;
 Tue, 29 Sep 2020 15:07:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F2Z1=DG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kNHDn-0005xd-0k
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 15:07:15 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 076badb3-d1ef-4245-ac0d-2d062aa10570;
 Tue, 29 Sep 2020 15:07:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3C013AC12;
 Tue, 29 Sep 2020 15:07:12 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=F2Z1=DG=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kNHDn-0005xd-0k
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 15:07:15 +0000
X-Inumbo-ID: 076badb3-d1ef-4245-ac0d-2d062aa10570
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 076badb3-d1ef-4245-ac0d-2d062aa10570;
	Tue, 29 Sep 2020 15:07:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601392032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dOa0wpuQndgl56eeXdfdwH7arOm2wavoz7azBXHBdGE=;
	b=vRixopApbbZS3AeOjMp176EyANmmHbQsK72LWM3Wm3UAM5owVpQRl3tEhTyHNaDPV/cA3W
	of+x7jzOOOLaNcFEmHlnwp4c0Xd+Tm8ikfDOrNmsbEfZjTPvMki2zx2yedMmoQWeATlKnA
	lib3R8wFPNgWviJfBcY74K44hX913rk=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 3C013AC12;
	Tue, 29 Sep 2020 15:07:12 +0000 (UTC)
Subject: Re: [Xen-devel] Xen crash after S3 suspend - Xen 4.13
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Juergen Gross <jgross@suse.de>
Cc: Dario Faggioli <dfaggioli@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <20200318141635.GW7869@mail-itl>
 <fa845540-fd8e-bc63-a3af-50673dede579@citrix.com>
 <20200318221006.GS18599@mail-itl>
 <413cac496e18bcb04b0691ef633d206f3a14a8e3.camel@suse.com>
 <20200323000946.GH18599@mail-itl> <20200929142730.GA25731@mail-itl>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <d243c1b5-712d-a958-0b6c-b232eb4edc80@suse.com>
Date: Tue, 29 Sep 2020 17:07:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200929142730.GA25731@mail-itl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 29.09.20 16:27, Marek Marczykowski-Górecki wrote:
> On Mon, Mar 23, 2020 at 01:09:49AM +0100, Marek Marczykowski-Górecki wrote:
>> On Thu, Mar 19, 2020 at 01:28:10AM +0100, Dario Faggioli wrote:
>>> [Adding Juergen]
>>>
>>> On Wed, 2020-03-18 at 23:10 +0100, Marek Marczykowski-Górecki wrote:
>>>> On Wed, Mar 18, 2020 at 02:50:52PM +0000, Andrew Cooper wrote:
>>>>> On 18/03/2020 14:16, Marek Marczykowski-Górecki wrote:
>>>>>> Hi,
>>>>>>
>>>>>> In my test setup (inside KVM with nested virt enabled), I rather
>>>>>> frequently get Xen crash on resume from S3. Full message below.
>>>>>>
>>>>>> This is Xen 4.13.0, with some patches, including "sched: fix
>>>>>> resuming
>>>>>> from S3 with smt=0".
>>>>>>
>>>>>> Contrary to the previous issue, this one does not happen always -
>>>>>> I
>>>>>> would say in about 40% cases on this setup, but very rarely on
>>>>>> physical
>>>>>> setup.
>>>>>>
>>>>>> This is _without_ core scheduling enabled, and also with smt=off.
>>>>>>
>>>>>> Do you think it would be any different on xen-unstable? I cat
>>>>>> try, but
>>>>>> it isn't trivial in this setup, so I'd ask first.
>>>>>>
>>> Well, Juergen has fixed quite a few issues.
>>>
>>> Most of them where triggering with core-scheduling enabled, and I don't
>>> recall any of them which looked similar or related to this.
>>>
>>> Still, it's possible that the same issue causes different symptoms, and
>>> hence that maybe one of the patches would fix this too.
>>
>> I've tested on master (d094e95fb7c), and reproduced exactly the same crash
>> (pasted below for the completeness).
>> But there is more: additionally, in most (all?) cases after resume I've got
>> soft lockup in Linux dom0 in smp_call_function_single() - see below. It
>> didn't happened before and the only change was Xen 4.13 -> master.
>>
>> Xen crash:
>>
>> (XEN) Assertion 'c2rqd(sched_unit_master(unit)) == svc->rqd' failed at credit2.c:2133
> 
> Juergen, any idea about this one? This is also happening on the current
> stable-4.14 (28855ebcdbfa).
> 

Oh, sorry I didn't come back to this issue.

I suspect this is related to stop_machine_run() being called during
suspend(), as I'm seeing very sporadic issues when offlining and then
onlining cpus with core scheduling being active (it seems as if the
dom0 vcpu doing the cpu online activity sometimes is using an old
vcpu state).

I wasn't able to catch the real problem despite of having tried lots
of approaches using debug patches.

Recently I suspected the whole problem could be somehow related to
RCU handling, as stop_machine_run() is relying on tasklets which are
executing in idle context, and RCU handling is done in idle context,
too. So there might be some kind of use after free scenario in case
some memory is freed via RCU despite it still being used by a tasklet.

I "just" need to find some time to verify this suspicion. Any help doing
this would be appreciated. :-)


Juergen

