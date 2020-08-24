Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A0C24F35D
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 09:52:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kA7Gd-0003AX-HP; Mon, 24 Aug 2020 07:51:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIEj=CC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kA7Gc-0003AQ-OX
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 07:51:46 +0000
X-Inumbo-ID: a3604e84-740e-4284-ac84-1956698560b4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a3604e84-740e-4284-ac84-1956698560b4;
 Mon, 24 Aug 2020 07:51:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DB51EAF34;
 Mon, 24 Aug 2020 07:52:14 +0000 (UTC)
Subject: Re: [linux-linus test] 152672: regressions - FAIL
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <osstest-152672-mainreport@xen.org>
 <93d94ca3-1a87-a11a-daef-11ec183d9a2f@suse.com>
 <d8fb302b-8dae-a0fe-7617-dc9d3b0ec6fa@suse.com>
 <0061138a-749f-4702-2dbc-084690062976@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <28c918a3-7290-b3c3-4e10-009e5ea48aa0@suse.com>
Date: Mon, 24 Aug 2020 09:51:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <0061138a-749f-4702-2dbc-084690062976@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24.08.2020 09:23, Jürgen Groß wrote:
> On 24.08.20 08:44, Jan Beulich wrote:
>> On 23.08.2020 07:52, Jürgen Groß wrote:
>>> On 23.08.20 07:24, osstest service owner wrote:
>>>> flight 152672 linux-linus real [real]
>>>> http://logs.test-lab.xenproject.org/osstest/logs/152672/
>>>>
>>>> Regressions :-(
>>>
>>> With 32-bit pv support now removed from the kernel the associated tests
>>> should be removed for the upstream kernel, too.
>>
>> Not exactly sure how things are organized, but isn't the 2nd
>> <arch> in the test identifier currently specifying "Dom0
>> bitness" as a whole? If so, shouldn't testing a 32-bit tool
>> stack build continue to be done (under this same name perhaps),
>> just with a 64-bit kernel now? In which case the next question
> 
> Only the linux-linus tests are affected right now. "Old" kernels can
> still be used for 32-bit tests. And PVH ones, of course.
> 
>> is whether the 64-bit kernel is actually fully ready to be used
>> this way. I'm afraid it isn't, as there's still no privcmd
>> compat ioctl handling afaict, which I would say should have
>> been a prereq for removing PV support from 32-bit kernels.
> 
> No, I don't think so.
> 
> 32-bit pv linux kernels are missing Meltdown mitigation and using a
> 32-bit toolstack on a 64-bit kernel is no feature I'd like to encourage.

Where else do you propose to test the 32-bit tool stack then?
Even if right now only linux-linus is really affected, sooner
or later the stable Linux tree will also be switched to one
which doesn't have 32-bit PV support anymore.

I also have trouble seeing why it should be use to dictate what
bitness a user space people are running. Even more so that we've
never cared to support the x32 environment (irrespective of me
not being certain whether this shouldn't be considered mostly
dead by now: I'm unaware of uses, but I do know that the tool
chain continues to support it).

Jan

