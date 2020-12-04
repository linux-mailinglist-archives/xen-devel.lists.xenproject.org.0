Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A022CED66
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 12:48:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44633.79996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9ZE-0006Fy-CS; Fri, 04 Dec 2020 11:48:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44633.79996; Fri, 04 Dec 2020 11:48:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9ZE-0006FS-8L; Fri, 04 Dec 2020 11:48:04 +0000
Received: by outflank-mailman (input) for mailman id 44633;
 Fri, 04 Dec 2020 11:48:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c9tS=FI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kl9ZB-0006F4-Ud
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 11:48:01 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c2b01667-3aed-46b2-8eaa-97d939b7021a;
 Fri, 04 Dec 2020 11:48:00 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F2AA0AC9A;
 Fri,  4 Dec 2020 11:47:59 +0000 (UTC)
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
X-Inumbo-ID: c2b01667-3aed-46b2-8eaa-97d939b7021a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607082480; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kuaCdU3/SANic9kCA6C0IYdinVYmrdvcgidim9WiC+k=;
	b=ftHmDNIh0IEJwtUqUBdkGBYqBo/cuGVp1u9MNJqkHPOEUW8tHvcfxGgZc/TTGn4iiTLKnR
	ocoCjEUwupFHsCj12focqfbjBPf40dmn8Ecmk4k2pEbvxyT32VXDmqh91RnoUgP0Ig6D3R
	Frzh8SwJElq4jaN1oxBUpp+ILfCONMM=
Subject: Re: [PATCH v3 5/5] evtchn: don't call Xen consumer callback with
 per-channel lock held
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <lengyelt@ainfosec.com>,
 Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9d7a052a-6222-80ff-cbf1-612d4ca50c2a@suse.com>
 <d821c715-966a-b48b-a877-c5dac36822f0@suse.com>
 <17c90493-b438-fbc1-ca10-3bc4d89c4e5e@xen.org>
 <7a768bcd-80c1-d193-8796-7fb6720fa22a@suse.com>
 <1a8250f5-ea49-ac3a-e992-be7ec40deba9@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <269f9a2d-7a8d-cba2-801f-6d3b12f9455f@suse.com>
Date: Fri, 4 Dec 2020 12:48:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <1a8250f5-ea49-ac3a-e992-be7ec40deba9@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04.12.2020 12:28, Julien Grall wrote:
> Hi Jan,
> 
> On 03/12/2020 10:09, Jan Beulich wrote:
>> On 02.12.2020 22:10, Julien Grall wrote:
>>> On 23/11/2020 13:30, Jan Beulich wrote:
>>>> While there don't look to be any problems with this right now, the lock
>>>> order implications from holding the lock can be very difficult to follow
>>>> (and may be easy to violate unknowingly). The present callbacks don't
>>>> (and no such callback should) have any need for the lock to be held.
>>>>
>>>> However, vm_event_disable() frees the structures used by respective
>>>> callbacks and isn't otherwise synchronized with invocations of these
>>>> callbacks, so maintain a count of in-progress calls, for evtchn_close()
>>>> to wait to drop to zero before freeing the port (and dropping the lock).
>>>
>>> AFAICT, this callback is not the only place where the synchronization is
>>> missing in the VM event code.
>>>
>>> For instance, vm_event_put_request() can also race against
>>> vm_event_disable().
>>>
>>> So shouldn't we handle this issue properly in VM event?
>>
>> I suppose that's a question to the VM event folks rather than me?
> 
> Yes. From my understanding of Tamas's e-mail, they are relying on the 
> monitoring software to do the right thing.
> 
> I will refrain to comment on this approach. However, given the race is 
> much wider than the event channel, I would recommend to not add more 
> code in the event channel to deal with such problem.
> 
> Instead, this should be fixed in the VM event code when someone has time 
> to harden the subsystem.

Are effectively saying I should now undo the addition of the
refcounting, which was added in response to feedback from you?
Or else what exactly am I to take from your reply?

Jan

