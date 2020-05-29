Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E621E7979
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 11:31:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jebMY-0002Gf-Dn; Fri, 29 May 2020 09:31:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jshP=7L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jebMW-0002Ga-Dd
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 09:31:36 +0000
X-Inumbo-ID: 30298bda-a18f-11ea-9947-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30298bda-a18f-11ea-9947-bc764e2007e4;
 Fri, 29 May 2020 09:31:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9303AAF77;
 Fri, 29 May 2020 09:31:33 +0000 (UTC)
Subject: Re: [RFC PATCH 1/1] xen: Use a global mapping for runstate
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <cover.1590675919.git.bertrand.marquis@arm.com>
 <03e7cd740922bfbaa479f22d81d9de06f718a305.1590675919.git.bertrand.marquis@arm.com>
 <e63a83a1-7d71-9cc5-517a-275e17880e2b@xen.org>
 <3B88C76B-6972-4A66-AFDC-0B5C27FBA740@arm.com>
 <52e26c9d-b662-2597-b521-dacf4f8acfc8@suse.com>
 <077FCC5B-AD47-4707-AF55-12F0455ED26F@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3dce8e37-b9a3-c3e6-10f4-b7489f1dea03@suse.com>
Date: Fri, 29 May 2020 11:31:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <077FCC5B-AD47-4707-AF55-12F0455ED26F@arm.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, "paul@xen.org" <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, "Xia, Hongyan" <hongyxia@amazon.com>,
 xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29.05.2020 11:18, Bertrand Marquis wrote:
> Hi Jan,
> 
>> On 29 May 2020, at 09:45, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 29.05.2020 10:13, Bertrand Marquis wrote:
>>>> On 28 May 2020, at 19:54, Julien Grall <julien@xen.org> wrote:
>>>> AFAICT, there is no restriction on when the runstate hypercall can be called. So this can even be called before the vCPU is brought up.
>>>
>>> I understand the remark but it still feels very weird to allow an invalid address in an hypercall.
>>> Wouldn’t we have a lot of potential issues accepting an address that we cannot check ?
>>
>> I don't think so: The hypervisor uses copy_to_guest() to protect
>> itself from the addresses to be invalid at the time of copying.
>> If the guest doesn't make sure they're valid at that time, it
>> simply won't get the information (perhaps until Xen's next
>> attempt to copy it out).
>>
>> You may want to take a look at the x86 side of this (also the
>> vCPU time updating): Due to the way x86-64 PV guests work, the
>> address may legitimately be unmapped at the time Xen wants to
>> copy it, when the vCPU is currently executing guest user mode
>> code. In such a case the copy gets retried the next time the
>> guest transitions from user to kernel mode (which involves a
>> page table change).
> 
> If I understand everything correctly runstate is updated only if there is
> a context switch in xen while the guest is running in kernel mode and
> if the address is mapped at that time.
> 
> So this is a best effort in Xen and the guest cannot really rely on the
> runstate information (as it might not be up to date).
> Could this have impacts somehow if this is used for scheduling ?

Yes, it could, and hence it's not really best effort only, but
said retry upon guest mode switch had been added years ago.
(This was one of the things overlooked when x86-64 support was
introduced, as x86-32 doesn't have this same problem.) The
updating is best-effort only as far as a misbehaving guest goes;
in all other aspects it's reliable, assuming that vCPU's only
look at their own data for the purpose of making decisions
(logging and alike are of course still fine, as long as people
are aware of the data possibly being stale).

> In the end the only accepted trade off would be to:
> - reduce error verbosity and just ignore it
> - introduce a new system call using a physical address
>   -> Using a virtual address with restrictions sounds very complex
>   to document (current core, no remapping).
> 
> But it feels like having only one hypercall using guest physical addresses
> would not really be logic and this kind of change should be made across
> all hypercalls if it is done.

Hence my request to preferably first settle on a model, such
that the change here could be simply the first step on that
journey.

Jan

