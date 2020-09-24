Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CD8276FAC
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 13:18:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLPEc-00024z-Q9; Thu, 24 Sep 2020 11:16:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+2aH=DB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kLPEa-00024u-WD
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 11:16:21 +0000
X-Inumbo-ID: e116f3a7-3b22-438f-b6e7-fdcc348bfdd7
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e116f3a7-3b22-438f-b6e7-fdcc348bfdd7;
 Thu, 24 Sep 2020 11:16:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600946179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HaAQw64JeqM+M97kx6S7rX2n0mWRkYzCgCI4XdECla8=;
 b=nVc6XGQDRdtXiX3KPGTjYDLuFdwVTjFYnUjmWOfC8IddkA+jyakhDcjZnMtfKJQXEiojCA
 rO+FmV56dcvOg5nM5/BDo+BvsBx6rlT4aZglaGqm7GVW7Dr5R0WkNCn5jEfkImuIRR5gDK
 mLVspTTzjPACyIyG0HFXz1k1qL04l5I=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2BD82AC85;
 Thu, 24 Sep 2020 11:16:19 +0000 (UTC)
Subject: Re: [PATCH V1 13/16] xen/ioreq: Make x86's invalidate qemu mapcache
 handling common
To: Oleksandr <olekstysh@gmail.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-14-git-send-email-olekstysh@gmail.com>
 <83dfb207-c191-8dad-1474-ce57b6d51102@suse.com>
 <2cab3ca5-0f2b-a813-099f-95bbf54bb9c8@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <17f1c7d2-7a84-a6a5-4afb-f82e67bc9fd0@suse.com>
Date: Thu, 24 Sep 2020 13:16:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <2cab3ca5-0f2b-a813-099f-95bbf54bb9c8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 22.09.2020 21:32, Oleksandr wrote:
> On 16.09.20 11:50, Jan Beulich wrote:
>> On 10.09.2020 22:22, Oleksandr Tyshchenko wrote:
>>> --- a/xen/common/memory.c
>>> +++ b/xen/common/memory.c
>>> @@ -1651,6 +1651,11 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>           break;
>>>       }
>>>   
>>> +#ifdef CONFIG_IOREQ_SERVER
>>> +    if ( op == XENMEM_decrease_reservation )
>>> +        curr_d->qemu_mapcache_invalidate = true;
>>> +#endif
>> I don't see why you put this right into decrease_reservation(). This
>> isn't just to avoid the extra conditional, but first and foremost to
>> avoid bypassing the earlier return from the function (in the case of
>> preemption). In the context of this I wonder whether the ordering of
>> operations in hvm_hypercall() is actually correct.
> Good point, indeed we may return earlier in case of preemption, I missed 
> that.
> Will move it to decrease_reservation(). But, we may return even earlier 
> in case of error...
> Now I am wondering should we move it to the very beginning of command 
> processing or not?

In _this_ series I'd strongly recommend you keep things working as
they are. If independently you think you've found a reason to
re-order certain operations, then feel free to send a patch with
suitable justification.

>> I'm also unconvinced curr_d is the right domain in all cases here;
>> while this may be a pre-existing issue in principle, I'm afraid it
>> gets more pronounced by the logic getting moved to common code.
> 
> Sorry I didn't get your concern here.

Well, you need to be concerned whose qemu_mapcache_invalidate flag
you set.

Jan

