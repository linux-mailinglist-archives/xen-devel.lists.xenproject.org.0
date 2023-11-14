Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1587EAC57
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 10:00:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632209.986359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2pHa-0001e7-OL; Tue, 14 Nov 2023 09:00:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632209.986359; Tue, 14 Nov 2023 09:00:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2pHa-0001cR-LC; Tue, 14 Nov 2023 09:00:30 +0000
Received: by outflank-mailman (input) for mailman id 632209;
 Tue, 14 Nov 2023 09:00:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r2pHY-0001cL-TO
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 09:00:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r2pHY-0001O7-4z; Tue, 14 Nov 2023 09:00:28 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r2pHX-0005TR-Vq; Tue, 14 Nov 2023 09:00:28 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=boPbSaKAL3DURrnT14Uocy/rLsn+sFYBlTq/feiY5lo=; b=vHuw17YMslpCgVvQ5JgZZqhg6r
	U7ZOR+RPBggM+c+F20449BGBx2pG2DaLY/WF3FXAXzbr3Rd1yGTVjv7n0iq7aMMKo7ZdwOZrsaU0P
	kiDxkk1M1lWVl3HlcLxiMHFgtWbtSNW47aYTRroKAnWNE0fpk11xmT10ldLcZSRenmOo=;
Message-ID: <6a63e87e-16ab-4e2c-a0fe-a213d52de2b2@xen.org>
Date: Tue, 14 Nov 2023 09:00:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 26/29] tools/xenstored: mount 9pfs device in stubdom
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
References: <20231110160804.29021-1-jgross@suse.com>
 <20231110160804.29021-27-jgross@suse.com>
 <e637cc9f-246e-4834-b255-b4cdeb40178f@xen.org>
 <fe1e5b10-a9cb-4347-b148-8e5e0d290428@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <fe1e5b10-a9cb-4347-b148-8e5e0d290428@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 14/11/2023 06:40, Juergen Gross wrote:
> On 13.11.23 23:09, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 10/11/2023 16:08, Juergen Gross wrote:
>>> diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
>>> index 162b87b460..4263c1360f 100644
>>> --- a/tools/xenstored/domain.c
>>> +++ b/tools/xenstored/domain.c
>>> @@ -1236,6 +1236,8 @@ void stubdom_init(void)
>>>           barf_perror("Failed to initialize stubdom");
>>>       xenevtchn_notify(xce_handle, stubdom->port);
>>> +
>>> +    mount_9pfs();
>>>   #endif
>>>   }
>>> diff --git a/tools/xenstored/minios.c b/tools/xenstored/minios.c
>>> index 202d70387a..fddbede869 100644
>>> --- a/tools/xenstored/minios.c
>>> +++ b/tools/xenstored/minios.c
>>> @@ -19,8 +19,16 @@
>>>   #include <sys/mman.h>
>>>   #include "core.h"
>>>   #include <xen/grant_table.h>
>>> +#include <mini-os/9pfront.h>
>>>   #include <mini-os/events.h>
>>>   #include <mini-os/gnttab.h>
>>> +#include <mini-os/sched.h>
>>> +#include <mini-os/xenbus.h>
>>> +#include <mini-os/xmalloc.h>
>>> +
>>> +#define P9_STATE_PATH    "device/9pfs/0/state"
>>> +
>>> +static void *p9_device;
>>>   void write_pidfile(const char *pidfile)
>>>   {
>>> @@ -62,3 +70,31 @@ void early_init(void)
>>>       if (stub_domid == DOMID_INVALID)
>>>           barf("could not get own domid");
>>>   }
>>> +
>>> +static void mount_thread(void *p)
>>> +{
>>> +    xenbus_event_queue events = NULL;
>>> +    char *err;
>>> +    char *dummy;
>>> +
>>> +    free(xenbus_watch_path_token(XBT_NIL, P9_STATE_PATH, "9pfs", 
>>> &events));
>>
>> AFAICT, xenbus_watch_path_token() can fail. I agree this is unlikely, 
>> but if it fails, then it would be useful to get some logs. Otherwise...
>>
>>> +
>>> +    for (;;) {
>>
>> ... this loop would be infinite.
> 
> Okay, will add logging.
> 
>>
>>> +        xenbus_wait_for_watch(&events);
>>> +        err = xenbus_read(XBT_NIL, P9_STATE_PATH, &dummy);
>>
>> Can you explain why don't care about the value of the node?
> 
> I only care about the presence of the "state" node. All real state changes
> will be handled in init_9pfront().

Ok. Can this be documented in the code?

> 
>>
>>> +        if (!err)
>>> +            break;
>>> +        free(err);
>>> +    }
>>> +
>>> +    free(dummy);
>>> +
>>> +    free(xenbus_unwatch_path_token(XBT_NIL, P9_STATE_PATH, "9pfs"));
>>
>> xenbus_unwatch_path_token() could technically fails. It would be 
>> helpful to print a message.
> 
> I can add that, but do we really care? 

Well... Such approach is ok until the day all the watches are exhausted. 
At this point, the developper who hit the bug will likely wish there 
were some debugging.

> This is a common pattern in Mini-OS.

You are not selling Mini-OS :). Really all the callers should check 
error return and print errors. Let's not spread that mistake in Xenstored.

Cheers,

-- 
Julien Grall

