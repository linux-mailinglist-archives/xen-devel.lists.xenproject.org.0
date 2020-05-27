Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9481E38FB
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 08:23:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdpSm-0000p1-I2; Wed, 27 May 2020 06:22:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+pkZ=7J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jdpSk-0000ow-I0
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 06:22:50 +0000
X-Inumbo-ID: 7cce32e6-9fe2-11ea-9947-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7cce32e6-9fe2-11ea-9947-bc764e2007e4;
 Wed, 27 May 2020 06:22:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 735FCB140;
 Wed, 27 May 2020 06:22:51 +0000 (UTC)
Subject: Re: [PATCH 2/2] xen: credit2: limit the max number of CPUs in a
 runqueue
To: Dario Faggioli <dfaggioli@suse.com>
References: <158818022727.24327.14309662489731832234.stgit@Palanthas>
 <158818179558.24327.11334680191217289878.stgit@Palanthas>
 <b368ccef-d3b1-1338-6325-8f81a963876d@suse.com>
 <d60d5b917d517b1dfa8292cfb456639c736ec173.camel@suse.com>
 <7e039c65-4532-c3ea-8707-72a86cf48e0e@suse.com>
 <8bf86f0c2bcce449cf7643aa9b98aa26ea558c2c.camel@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9948ac59-af64-d77d-57df-38a771a472b4@suse.com>
Date: Wed, 27 May 2020 08:22:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <8bf86f0c2bcce449cf7643aa9b98aa26ea558c2c.camel@suse.com>
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org, paul@xen.org,
 George Dunlap <george.dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 26.05.2020 23:18, Dario Faggioli wrote:
> On Thu, 2020-04-30 at 14:52 +0200, Jürgen Groß wrote:
>> On 30.04.20 14:28, Dario Faggioli wrote:
>>> That being said, I can try to make things a bit more fair, when
>>> CPUs
>>> come up and are added to the pool. Something around the line of
>>> adding
>>> them to the runqueue with the least number of CPUs in it (among the
>>> suitable ones, of course).
>>>
>>> With that, when the user removes 4 CPUs, we will have the 6 vs 10
>>> situation. But we would make sure that, when she adds them back, we
>>> will go back to 10 vs. 10, instead than, say, 6 vs 14 or something
>>> like
>>> that.
>>>
>>> Was something like this that you had in mind? And in any case, what
>>> do
>>> you think about it?
>>
>> Yes, this would be better already.
>>
> So, a couple of thoughts. Doing something like what I tried to describe
> above is not too bad, and I have it pretty much ready.
> 
> With that, on an Intel system with 96 CPUs on two sockets, and
> max_cpus_per_runqueue set to 16, I got, after boot, instead of just 2
> giant runqueues with 48 CPUs in each:
> 
>  - 96 CPUs online, split in 6 runqueues (3 for each socket) with 16 
>    runqueues in each of them
> 
> I can also "tweak" it in such a way that, if one for instance boots
> with "smt=no", we get to a point where we have:
> 
>  - 48 CPUs online, split in 6 runqueues, with 8 CPUs in each
> 
> Now, I think this is good, and actually better than the current
> situation where on such a system, we only have two very big runqueues
> (and let me repeat that introducing a per-LLC runqueue arrangement, on
> which I'm also working, won't help in this case, as NUMA node == LLC).
> 
> So, problem is that if one starts to fiddle with cpupools and cpu on
> and offlining, things can get pretty unbalanced. E.g., I can end up
> with 2 runqueues on a socket, one with 16 CPUs and the other with just
> a couple of them.
> 
> Now, this is all possible as of now (I mean, without this patch)
> already, although at a different level. In fact, I can very well remove
> all-but-1 CPUs of node 1 from Pool-0, and end up again with a runqueue
> with a lot of CPUs and another with just one.
> 
> It looks like we need a way to rebalance the runqueues, which should be
> doable... But despite having spent a couple of days trying to come up
> with something decent, that I could include in v2 of this series, I
> couldn't get it to work sensibly.

CPU on-/offlining may not need considering here at all imo. I think it
would be quite reasonable as a first step to have a static model where
from system topology (and perhaps a command line option) one can
predict which runqueue a particular CPU will end up in, no matter when
it gets brought online.

Jan

