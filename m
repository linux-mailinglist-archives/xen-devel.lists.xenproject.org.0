Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D69719BFED
	for <lists+xen-devel@lfdr.de>; Thu,  2 Apr 2020 13:11:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJxi7-0005MW-1J; Thu, 02 Apr 2020 11:08:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ugol=5S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jJxi6-0005MR-74
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 11:08:34 +0000
X-Inumbo-ID: 4a43daf0-74d2-11ea-83d8-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a43daf0-74d2-11ea-83d8-bc764e2007e4;
 Thu, 02 Apr 2020 11:08:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4A2BDAC6E;
 Thu,  2 Apr 2020 11:08:31 +0000 (UTC)
Subject: Re: [PATCH 1/5] xen/common: introduce a new framework for
 save/restore of 'domain' context
To: paul@xen.org
References: <20200327185012.1795-1-paul@xen.org>
 <20200327185012.1795-2-paul@xen.org>
 <e9b21d59-3a4a-1498-e5f4-45d1420ddbc4@suse.com>
 <001201d608d5$513a7490$f3af5db0$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fc7ffa50-5648-f335-02a4-1819d826c193@suse.com>
Date: Thu, 2 Apr 2020 13:08:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <001201d608d5$513a7490$f3af5db0$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 02.04.2020 11:58, Paul Durrant wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 01 April 2020 15:51
>> To: Paul Durrant <paul@xen.org>
>> Cc: xen-devel@lists.xenproject.org; Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap
>> <george.dunlap@citrix.com>; Ian Jackson <ian.jackson@eu.citrix.com>; Julien Grall <julien@xen.org>;
>> Stefano Stabellini <sstabellini@kernel.org>; Wei Liu <wl@xen.org>
>> Subject: Re: [PATCH 1/5] xen/common: introduce a new framework for save/restore of 'domain' context
>>
>> On 27.03.2020 19:50, Paul Durrant wrote:
>>> Domain context is state held in the hypervisor that does not come under
>>> the category of 'HVM state' but is instead 'PV state' that is common
>>> between PV guests and enlightened HVM guests (i.e. those that have PV
>>> drivers) such as event channel state, grant entry state, etc.
>>
>> Without looking at the patch details yet, I'm having some difficulty
>> understanding how this is going to work in a safe/correct manner. I
>> suppose for LU the system is in a frozen enough state that
>> snapshotting and copying state like this is okay, but ...
>>
>>> To allow enlightened HVM guests to be migrated without their co-operation
>>> it will be necessary to transfer such state along with the domain's
>>> memory image, architectural state, etc. This framework is introduced for
>>> that purpose.
>>>
>>> This patch adds the new public header and the low level implementation,
>>> entered via the domain_save() or domain_load() functions. Subsequent
>>> patches will introduce other parts of the framwork, and code that will
>>> make use of it within the current version of the libxc migration stream.
>>
>> ... here you suggest (and patch 5 appears to match this) that this
>> is going to be used even in "normal" migration streams.
> 
> Well, 'transparent' (or non-cooperative) migration will only work in some cases but it definitely does work.
> 
>> All of the
>> items named are communication vehicles, and hence there are always
>> two sides that can influence the state. For event channels, the
>> other side (which isn't paused) or the hardware (for passed through
>> devices) might signal them, or it (just the former obviously) could
>> close their end, resulting in a state change also for the domain
>> being migrated. If this happens after the snapshot was taken, the
>> state change is lost.
> 
> Indeed, which is why we *do* rely on co-operation from the other end
> of the event channels in the migration case. In the initial case it
> is likely we'll veto transparent migration unless all event channels
> are connected to either dom0 or Xen.

Co-operation for "normal" migration, iirc, consists of tearing down
and re-establishing everything. There's simply no risk of losing e.g.
events this way.

>> Otoh I'm sure the case was considered, so perhaps I'm simply missing
>> some crucial aspect (which then could do with spelling out in the
>> description of the cover letter).
>>
> 
> Does that need to be explained for a series that is just
> infrastructure?

I think so, yes - this infrastructure is pointless to introduce if
it doesn't allow fulfilling all requirements. Pointing at the design
doc (in the cover letter) may be enough if all aspects are covered
by what's there. I wouldn't have assumed using this infrastructure
also for co-operative migration to also be mentioned there.

Considering the situation with event channels (all closed), doing
what you do for the shared info page is probably going to be fine;
large parts of it are in a known state (or need re-filling on the
destination) anyway. What other plans do you have for non-LU
migration wrt this new infrastructure? If the shared info page is
all that's going to get migrated with its help, I'd wonder whether
the infrastructure wasn't better conditional upon a LU config
option, and the shared info migration was left as it is now.

> The overall design doc is now committed in the repo (although may
> need some expansion in future) so I could point at that.
> I don't think I'm giving anything away when I say that EC2's
> downstream code simply (ab)uses HVM save records for transferring
> the extra state; all I'm trying to do here is create something
> cleaner onto which I can re-base and upstream the EC2 code.

That was my guess, indeed.

Jan

