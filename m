Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF14305808
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 11:15:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75922.136898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4hrV-0002g6-Jy; Wed, 27 Jan 2021 10:15:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75922.136898; Wed, 27 Jan 2021 10:15:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4hrV-0002fh-GO; Wed, 27 Jan 2021 10:15:45 +0000
Received: by outflank-mailman (input) for mailman id 75922;
 Wed, 27 Jan 2021 10:15:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Shlr=G6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4hrU-0002fc-5u
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 10:15:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a8948d7e-619b-41b5-976f-ed04b8563c0f;
 Wed, 27 Jan 2021 10:15:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 03B55AD57;
 Wed, 27 Jan 2021 10:15:41 +0000 (UTC)
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
X-Inumbo-ID: a8948d7e-619b-41b5-976f-ed04b8563c0f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611742541; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bHkei/tqo+0OHikaoGIMMxLv2x5s4qUGEBk2rOEbsKk=;
	b=ByaxDbR9W1oSgQT1thdT1GiItrlFEEcausEaTxJQnqp5KdlprKofvscbgLadG+dIY81cTg
	ZpMIzCi2voD3N/d77csCs4qR2OWkgrabxMXd+RGl6E2zJjVh8XQanF/ewvYgctHaBo8tNx
	lYNE3g6rDA0/h43kNotG/DyY3ihp+pw=
Subject: Re: [PATCH V5 14/22] arm/ioreq: Introduce arch specific bits for
 IOREQ/DM features
To: Oleksandr <olekstysh@gmail.com>
Cc: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
 <1611601709-28361-15-git-send-email-olekstysh@gmail.com>
 <ff05bfd8-150a-1dbc-8c25-c922ee863146@suse.com>
 <9016d379-2b79-0b1c-ff25-9c5f7284e3c9@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e654d314-8549-f7dc-4b9f-abb2484d7515@suse.com>
Date: Wed, 27 Jan 2021 11:15:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <9016d379-2b79-0b1c-ff25-9c5f7284e3c9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 27.01.2021 10:54, Oleksandr wrote:
> 
> On 26.01.21 11:15, Jan Beulich wrote:
> 
> Hi Jan
> 
>> On 25.01.2021 20:08, Oleksandr Tyshchenko wrote:
>>> --- a/xen/include/xen/dm.h
>>> +++ b/xen/include/xen/dm.h
>>> @@ -19,6 +19,8 @@
>>>   
>>>   #include <xen/sched.h>
>>>   
>>> +#include <public/hvm/dm_op.h>
>>> +
>>>   struct dmop_args {
>>>       domid_t domid;
>>>       unsigned int nr_bufs;
>> How come this becomes necessary at this point in the series, when
>> nothing else in this header changes, and nothing changes in the
>> public headers at all? Is it perhaps a .c file that needs the
>> #include instead? Headers shouldn't pull in other headers without
>> clear need - as indicated in reply to a prior version, we have
>> way too many bad examples (causing headaches in certain cases),
>> and we'd like to avoid gaining more.
> 
> Yes, I understand this and completely agree. I remember last discussion 
> on that, this is not forgotten. The only reason I made this (non 
> entirely correct) change is to make
> series compilable on Arm with IOREQ support enabled. If I considered 
> this change as a correct one I would make it from the very beginning (in 
> patch #9 which adds this common header)...
> I added remark to draw reviewer's attention on the fact that I got stuck 
> with resolving that, what I did wrong and how it should be done 
> properly. The problem is that I didn't manage to make it properly.
> 
> Of course, I tried to include it directly by dm.c, but this didn't help 
> much without violating "alphabetical order" rule. Details here:
> https://lore.kernel.org/xen-devel/e0bc7f80-974e-945d-4605-173bd05302af@gmail.com/
> 
> I would appreciate any input on that.

I'll try to reply there.

Jan

