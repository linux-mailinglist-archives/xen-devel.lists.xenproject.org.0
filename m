Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9DC24F37F
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 10:00:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kA7P6-0004dY-Sl; Mon, 24 Aug 2020 08:00:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h8JF=CC=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kA7P5-0004dT-2l
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 08:00:31 +0000
X-Inumbo-ID: e6373e45-d51d-4568-ab9d-f6f959d73a30
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e6373e45-d51d-4568-ab9d-f6f959d73a30;
 Mon, 24 Aug 2020 08:00:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1A8CFAD2C;
 Mon, 24 Aug 2020 08:00:59 +0000 (UTC)
Subject: Re: [linux-linus test] 152672: regressions - FAIL
To: Jan Beulich <jbeulich@suse.com>
Cc: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <osstest-152672-mainreport@xen.org>
 <93d94ca3-1a87-a11a-daef-11ec183d9a2f@suse.com>
 <d8fb302b-8dae-a0fe-7617-dc9d3b0ec6fa@suse.com>
 <0061138a-749f-4702-2dbc-084690062976@suse.com>
 <28c918a3-7290-b3c3-4e10-009e5ea48aa0@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <7b8fd84b-a0bb-9976-ff57-3e104b57ffcc@suse.com>
Date: Mon, 24 Aug 2020 10:00:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <28c918a3-7290-b3c3-4e10-009e5ea48aa0@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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

On 24.08.20 09:51, Jan Beulich wrote:
> On 24.08.2020 09:23, Jürgen Groß wrote:
>> On 24.08.20 08:44, Jan Beulich wrote:
>>> On 23.08.2020 07:52, Jürgen Groß wrote:
>>>> On 23.08.20 07:24, osstest service owner wrote:
>>>>> flight 152672 linux-linus real [real]
>>>>> http://logs.test-lab.xenproject.org/osstest/logs/152672/
>>>>>
>>>>> Regressions :-(
>>>>
>>>> With 32-bit pv support now removed from the kernel the associated tests
>>>> should be removed for the upstream kernel, too.
>>>
>>> Not exactly sure how things are organized, but isn't the 2nd
>>> <arch> in the test identifier currently specifying "Dom0
>>> bitness" as a whole? If so, shouldn't testing a 32-bit tool
>>> stack build continue to be done (under this same name perhaps),
>>> just with a 64-bit kernel now? In which case the next question
>>
>> Only the linux-linus tests are affected right now. "Old" kernels can
>> still be used for 32-bit tests. And PVH ones, of course.
>>
>>> is whether the 64-bit kernel is actually fully ready to be used
>>> this way. I'm afraid it isn't, as there's still no privcmd
>>> compat ioctl handling afaict, which I would say should have
>>> been a prereq for removing PV support from 32-bit kernels.
>>
>> No, I don't think so.
>>
>> 32-bit pv linux kernels are missing Meltdown mitigation and using a
>> 32-bit toolstack on a 64-bit kernel is no feature I'd like to encourage.
> 
> Where else do you propose to test the 32-bit tool stack then?

Right now stable kernels, later PVH only.

> Even if right now only linux-linus is really affected, sooner
> or later the stable Linux tree will also be switched to one
> which doesn't have 32-bit PV support anymore.

Yes.

> I also have trouble seeing why it should be use to dictate what
> bitness a user space people are running. Even more so that we've

We are not talking about some random user programs, but the tools
we are providing and which are running in dom0 only.

And I don't think running a 32-bit toolstack on a 64-bit kernel is
supported right now (in case it is, then we don't need to worry as
it should continue to work). I don't think we should start supporting
that just for being able to test it.


Juergen

