Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 216531A2F3B
	for <lists+xen-devel@lfdr.de>; Thu,  9 Apr 2020 08:31:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMQiO-0004Jg-U3; Thu, 09 Apr 2020 06:31:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6Jhw=5Z=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jMQiN-0004Jb-Ip
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2020 06:31:03 +0000
X-Inumbo-ID: aea8634a-7a2b-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aea8634a-7a2b-11ea-b58d-bc764e2007e4;
 Thu, 09 Apr 2020 06:31:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 66A18AC65;
 Thu,  9 Apr 2020 06:31:00 +0000 (UTC)
Subject: Re: [PATCH 6/7] xen/guest_access: Consolidate guest access helpers in
 xen/guest_access.h
To: Julien Grall <julien@xen.org>
References: <20200404131017.27330-1-julien@xen.org>
 <20200404131017.27330-7-julien@xen.org>
 <e2588f6e-1f13-b66f-8e3d-b8568f67b62a@suse.com>
 <041a9f9f-cc9e-eac5-cdd2-555fb1c88e6f@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cf6c0e0b-ade0-587f-ea0e-80b02b21b1a9@suse.com>
Date: Thu, 9 Apr 2020 08:30:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <041a9f9f-cc9e-eac5-cdd2-555fb1c88e6f@xen.org>
Content-Type: text/plain; charset=utf-8
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 09.04.2020 00:05, Julien Grall wrote:
> Hi Jan,
> 
> On 07/04/2020 09:14, Jan Beulich wrote:
>> On 04.04.2020 15:10, Julien Grall wrote:
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> Most of the helpers to access guest memory are implemented the same way
>>> on Arm and x86. The only differences are:
>>>      - guest_handle_{from, to}_param(): while on x86 XEN_GUEST_HANDLE()
>>>        and XEN_GUEST_HANDLE_PARAM() are the same, they are not on Arm. It
>>>        is still fine to use the Arm implementation on x86.
>>>      - __clear_guest_offset(): Interestingly the prototype does not match
>>>        between the x86 and Arm. However, the Arm one is bogus. So the x86
>>>        implementation can be used.
>>>      - guest_handle{,_subrange}_okay(): They are validly differing
>>>        because Arm is only supporting auto-translated guest and therefore
>>>        handles are always valid.
>>
>> While I'm fine in principle with such consolidation, I'm afraid I
>> really need to ask for some historical background to be added
>> here. It may very well be that there's a reason for the separation
>> (likely to be found in the removed ia64 or ppc ports), which may
>> then provide a hint at why future ports may want to have these
>> separated. If such reasons exist, I'd prefer to avoid the back and
>> forth between headers. What we could do in such a case is borrow
>> Linux'es asm-generic/ concept, and move the "typical"
>> implementation there. (And of course if there were no noticable
>> reasons for the split, the change as it is would be fine in
>> general; saying so without having looked at the details of it,
>> yet).
> 
> Looking at the history, ia64 and ppc used to include a common
> header called xen/xencomm.h from asm/guest_access.h.
> 
> This has now disappeared with the removal of the two ports.
> 
> Regarding future arch, the fact arm and x86 gives me some confidence
> we are unlikely going to get a new ABI for an arch. Do you see any
> reason to?

Well, there surely had be a reason for ia64 and ppc to use a
different approach. I don't see why a new port may not also want
to go that route instead of the x86/Arm one.

Jan

