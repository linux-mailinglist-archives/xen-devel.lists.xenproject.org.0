Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA01A2C3F54
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 12:51:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37620.70081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khtKe-0005E9-6w; Wed, 25 Nov 2020 11:51:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37620.70081; Wed, 25 Nov 2020 11:51:32 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khtKe-0005Dk-32; Wed, 25 Nov 2020 11:51:32 +0000
Received: by outflank-mailman (input) for mailman id 37620;
 Wed, 25 Nov 2020 11:51:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dO0Y=E7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khtKc-0005Da-J0
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 11:51:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bc7fecdb-87e3-4233-a2d9-a1612d0af6c0;
 Wed, 25 Nov 2020 11:51:29 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 883A9AC48;
 Wed, 25 Nov 2020 11:51:28 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dO0Y=E7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khtKc-0005Da-J0
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 11:51:30 +0000
X-Inumbo-ID: bc7fecdb-87e3-4233-a2d9-a1612d0af6c0
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id bc7fecdb-87e3-4233-a2d9-a1612d0af6c0;
	Wed, 25 Nov 2020 11:51:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606305088; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1ufAIsxgz3dNrTVYHsOrmKrdgkJ0tVPi4GXrtu7oa2I=;
	b=Vp74fjys1mzPp7Tn6lgRA/sbhE2WpbtnwrahiFMFWrx0gtPBtV63oa0+Ypg2XZ1b0Qkq1A
	+h9QNMoHUWREk+TgLhlF1YhD9xRMOuPc1MrAJTPGTud7wJd/KQhCBHX/ORLEiaJUeObqzw
	YoSrtrUhVhne9meKVPEkM4fLHOmmU8w=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 883A9AC48;
	Wed, 25 Nov 2020 11:51:28 +0000 (UTC)
Subject: Re: [PATCH v4 1/3] domctl: introduce a new domain create flag,
 XEN_DOMCTL_CDF_disable_fifo, ...
To: paul@xen.org
Cc: 'Paul Durrant' <pdurrant@amazon.com>,
 'Eslam Elnikety' <elnikety@amazon.com>,
 'Christian Lindig' <christian.lindig@citrix.com>,
 'David Scott' <dave@recoil.org>, 'Ian Jackson' <iwj@xenproject.org>,
 'Wei Liu' <wl@xen.org>, 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Julien Grall' <julien@xen.org>,
 'Stefano Stabellini' <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20201124191751.11472-1-paul@xen.org>
 <20201124191751.11472-2-paul@xen.org>
 <444917ac-f2aa-5544-8f6c-097e7f57c98c@suse.com>
 <009001d6c31b$a1eaeef0$e5c0ccd0$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3ab33c4e-56af-5690-32b8-a89c5e27761b@suse.com>
Date: Wed, 25 Nov 2020 12:51:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <009001d6c31b$a1eaeef0$e5c0ccd0$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25.11.2020 12:10, Paul Durrant wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 25 November 2020 09:20
>>
>> On 24.11.2020 20:17, Paul Durrant wrote:
>>> From: Paul Durrant <pdurrant@amazon.com>
>>>
>>> ...to control the visibility of the FIFO event channel operations
>>> (EVTCHNOP_init_control, EVTCHNOP_expand_array, and EVTCHNOP_set_priority) to
>>> the guest.
>>>
>>> These operations were added to the public header in commit d2d50c2f308f
>>> ("evtchn: add FIFO-based event channel ABI") and the first implementation
>>> appeared in the two subsequent commits: edc8872aeb4a ("evtchn: implement
>>> EVTCHNOP_set_priority and add the set_priority hook") and 88910061ec61
>>> ("evtchn: add FIFO-based event channel hypercalls and port ops"). Prior to
>>> that, a guest issuing those operations would receive a return value of
>>> -ENOSYS (not implemented) from Xen. Guests aware of the FIFO operations but
>>> running on an older (pre-4.4) Xen would fall back to using the 2-level event
>>> channel interface upon seeing this return value.
>>>
>>> Unfortunately the uncontrolable appearance of these new operations in Xen 4.4
>>> onwards has implications for hibernation of some Linux guests. During resume
>>> from hibernation, there are two kernels involved: the "boot" kernel and the
>>> "resume" kernel. The guest boot kernel may default to use FIFO operations and
>>> instruct Xen via EVTCHNOP_init_control to switch from 2-level to FIFO. On the
>>> other hand, the resume kernel keeps assuming 2-level, because it was hibernated
>>> on a version of Xen that did not support the FIFO operations.
>>
>> And the alternative of the boot kernel issuing EVTCHNOP_reset has
>> other unwanted consequences. Maybe worth mentioning here, as
>> otherwise this would look like the obvious way to return to 2-level
>> mode?
>>
>> Also, why can't the boot kernel be instructed to avoid engaging
>> FIFO mode?
>>
> 
> Both of those are, of course, viable alternatives if the guest can be
> modified. The problem we need to work around is guest that are already
> out there and cannot be updated.

Making use of EVTCHNOP_reset indeed would require a change to the
kernel. But Linux has a command line option to suppress use of
FIFO event channels, so I can't see why the boot kernel couldn't
be passed this flag without any modification to the binary.

>>> To maintain compatibility it is necessary to make Xen behave as it did
>>> before the new operations were added and hence the code in this patch ensures
>>> that, if XEN_DOMCTL_CDF_disable_fifo is set, the FIFO event channel operations
>>> will again result in -ENOSYS being returned to the guest.
>>
>> Are there indeed dependencies on the precise return value anywhere?
>> If so, the generally inappropriate use (do_event_channel_op()'s
>> default case really would also need switching) would want a brief
>> comment, so it'll be understood by readers that this isn't code to
>> derive other code from. If not, -EPERM or -EACCES perhaps?
>>
> 
> The patch, as stated, is reverting behaviour and so the -ENOSYS really
> needs to stay since it is essentially ABI now. I am not aware of guest
> code that will, in fact, die if it sees -EPERM or -EACCES instead but
> there may be such code. The only safe thing to do is to make things
> look like the used to.

I don't think specific error codes can be considered "ABI". Not
the least because, if there are multiple causes for an error, it
ought to be undefined which error gets returned. A guest not
falling back to 2-level on _any_ error here is basically setting
itself up for eventual failure because of e.g. getting back
-ENOMEM. Or someone deciding to add an XSM check to the function.

As said, I'm of the opinion that the other -ENOSYS ought to be
replaced as well, which of course would be precluded if this was
considered "ABI".

Jan

