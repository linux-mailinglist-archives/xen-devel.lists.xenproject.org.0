Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8731E7AFB
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 12:52:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeccx-0002OE-0h; Fri, 29 May 2020 10:52:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mKAR=7L=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jeccv-0002O1-2j
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 10:52:37 +0000
X-Inumbo-ID: 81e48a82-a19a-11ea-9dbe-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 81e48a82-a19a-11ea-9dbe-bc764e2007e4;
 Fri, 29 May 2020 10:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u2KZ2qiKEr4Ck19+FUrXzpklwGUqh5WnUQyBrGCeDOs=; b=m/j2ibkZXK68SLVA719KFXwvPa
 l/A98ixm5eAues8zmQCImBrvCgCmR2WKxxMDCGnIh+u/D68HsS7ADY7NWPi02f+5AywflmHrt/lrH
 cIMLwubJwpj0W5o40pL5bq2zuYINdGfK4mJHcyxI4ewvYyJQj3oHumkxjzn3S5jv66YU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jeccp-0001Xr-IZ; Fri, 29 May 2020 10:52:31 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jeccp-0005Ru-Am; Fri, 29 May 2020 10:52:31 +0000
Subject: Re: [RFC PATCH 1/1] xen: Use a global mapping for runstate
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Jan Beulich <jbeulich@suse.com>
References: <cover.1590675919.git.bertrand.marquis@arm.com>
 <03e7cd740922bfbaa479f22d81d9de06f718a305.1590675919.git.bertrand.marquis@arm.com>
 <e63a83a1-7d71-9cc5-517a-275e17880e2b@xen.org>
 <3B88C76B-6972-4A66-AFDC-0B5C27FBA740@arm.com>
 <52e26c9d-b662-2597-b521-dacf4f8acfc8@suse.com>
 <077FCC5B-AD47-4707-AF55-12F0455ED26F@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <038f55bc-5486-4347-f902-3e3ab5c9a53d@xen.org>
Date: Fri, 29 May 2020 11:52:28 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <077FCC5B-AD47-4707-AF55-12F0455ED26F@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "paul@xen.org" <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, "Xia, Hongyan" <hongyxia@amazon.com>,
 xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 29/05/2020 10:18, Bertrand Marquis wrote:
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
> 
> In the end the only accepted trade off would be to:
> - reduce error verbosity and just ignore it

The error is already a dprintk(XENLOG_G_DEBUG,...). So you can't really 
do better in term of verbosity.

But I would still like to keep it as there was some weirdness hapenning 
also in the non-KPTI case (see [1]).

> - introduce a new system call using a physical address
>    -> Using a virtual address with restrictions sounds very complex
>    to document (current core, no remapping).
> 
> But it feels like having only one hypercall using guest physical addresses
> would not really be logic and this kind of change should be made across
> all hypercalls if it is done.

This is not correct, there are other hypercalls using guest physical 
address (for instance, EVTCHNOP_init_control).

At least on Arm, this is the only hypercall that requires to keep the 
virtual address across the hypercall.

For all the other hypercalls, the virtual address is used for buffer. 
This is still risky but less than this one. It is also going to be a 
major rework that would require quite a bit of work.

So I would rather trying to fix the most concerning instance now and 
address the rest afterwards.

Cheers,

[1] https://lists.xen.org/archives/html/xen-devel/2017-11/msg00942.html

-- 
Julien Grall

