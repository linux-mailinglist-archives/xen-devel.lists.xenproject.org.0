Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0AE1AD80F
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 09:55:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPLpZ-0006dR-Ns; Fri, 17 Apr 2020 07:54:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ygd1=6B=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jPLpY-0006dM-8o
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 07:54:32 +0000
X-Inumbo-ID: ab0dd8fe-8080-11ea-b4f4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ab0dd8fe-8080-11ea-b4f4-bc764e2007e4;
 Fri, 17 Apr 2020 07:54:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1FA6CACC3;
 Fri, 17 Apr 2020 07:54:29 +0000 (UTC)
Subject: Re: [PATCH] sched: print information about scheduler granularity
To: Dario Faggioli <dfaggioli@suse.com>,
 Sergey Dyasli <sergey.dyasli@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20200416083341.21122-1-sergey.dyasli@citrix.com>
 <996ed66e-3782-5187-a804-9291741a2241@suse.com>
 <1587028832608.72974@citrix.com>
 <bd38c4da-b982-0d13-bdbd-ab363dae68e0@suse.com>
 <4716e235b5a5723c7cf55c3ef2d6295bcb27d8e0.camel@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <0a46eff8-454a-4bd8-6d7d-e90b8bb148a2@suse.com>
Date: Fri, 17 Apr 2020 09:54:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <4716e235b5a5723c7cf55c3ef2d6295bcb27d8e0.camel@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 16.04.20 18:47, Dario Faggioli wrote:
> On Thu, 2020-04-16 at 11:25 +0200, Jürgen Groß wrote:
>> On 16.04.20 11:20, Sergey Dyasli wrote:
>>> On 16/04/2020 09:57, Jürgen Groß wrote:
>>>>
>>>> The xen commandline ins part of the boot messages and is
>>>> contained
>>>> in the "xl info" output.
>>>
>>> It's true that you can see "sched-gran=core" in "xl info" output.
>>> But that's
>>> just the switch - not the end result. A user might want to verify
>>> that he did
>>> everything correctly and core-scheduling mode has indeed been
>>> enabled.
>>
>> I'm not opposed to your patch, but as soon as we have per-cpupool
>> granularity it should be reverted again.
>>
> Why reverted? Each cpupool dumps its own scheduling information. With
> per-pool granularity, we'll see something like
> 
> cpupool: Pool-A
> Scheduler: SMP Credit Scheduler (credit)
> Scheduling granularity: cpu
> ...
> cpupool: Pool-B
> Scheduler: SMP Credit Scheduler (credit)
> Scheduling granularity: core
> 
> etc.
> 
> Or am I missing something?

"Reworking" might have been a better wording.

The patch is looking only at the global variable opt_sched_granularity
for deciding which granularity to print out.


Juergen

