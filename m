Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CBB2A2C23
	for <lists+xen-devel@lfdr.de>; Mon,  2 Nov 2020 14:53:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.17666.42471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZaGZ-0003Nl-RG; Mon, 02 Nov 2020 13:52:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 17666.42471; Mon, 02 Nov 2020 13:52:59 +0000
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
	id 1kZaGZ-0003NM-Nn; Mon, 02 Nov 2020 13:52:59 +0000
Received: by outflank-mailman (input) for mailman id 17666;
 Mon, 02 Nov 2020 13:52:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iSH1=EI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kZaGX-0003NA-W6
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2020 13:52:58 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 4e8783a3-702b-43c5-8cf2-555bb8e3d1b8;
 Mon, 02 Nov 2020 13:52:57 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 90768AC3F;
 Mon,  2 Nov 2020 13:52:56 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=iSH1=EI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kZaGX-0003NA-W6
	for xen-devel@lists.xenproject.org; Mon, 02 Nov 2020 13:52:58 +0000
X-Inumbo-ID: 4e8783a3-702b-43c5-8cf2-555bb8e3d1b8
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 4e8783a3-702b-43c5-8cf2-555bb8e3d1b8;
	Mon, 02 Nov 2020 13:52:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604325176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gza3k4FbBeMI9MxVAdSOqIzM9oPUqn08pyvWUJUwN6g=;
	b=SQLG6KFm2DbYucRpb6FNU4zfsmj3kJRm7yV8j0v3YF5IxxOjPBCvOXPWACa9eOzUiK6EVk
	ca8lfycYzPS1kEtGY1dBRmmnkGDqGZEE/YarWjBAg0UUpr5PLmhEa7fpj1wb2P/Qk4O0Ko
	l55+FSvUB5bvWPPIbtSCLssVZSubeaQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 90768AC3F;
	Mon,  2 Nov 2020 13:52:56 +0000 (UTC)
Subject: Re: [PATCH v3 2/2] xen/evtchn: rework per event channel lock
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20201016105839.14796-1-jgross@suse.com>
 <20201016105839.14796-3-jgross@suse.com>
 <0c5975b1-97ec-9bbb-0ed9-9055556215cd@suse.com>
 <0c39eb60-9843-9659-f7c5-4e2c3e697ee0@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c77add99-f92e-126a-5a5e-81a2b5983aa0@suse.com>
Date: Mon, 2 Nov 2020 14:52:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <0c39eb60-9843-9659-f7c5-4e2c3e697ee0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 02.11.2020 14:41, Jürgen Groß wrote:
> On 20.10.20 11:28, Jan Beulich wrote:
>> On 16.10.2020 12:58, Juergen Gross wrote:
>>> --- a/xen/arch/x86/pv/shim.c
>>> +++ b/xen/arch/x86/pv/shim.c
>>> @@ -660,11 +660,12 @@ void pv_shim_inject_evtchn(unsigned int port)
>>>       if ( port_is_valid(guest, port) )
>>>       {
>>>           struct evtchn *chn = evtchn_from_port(guest, port);
>>> -        unsigned long flags;
>>>   
>>> -        spin_lock_irqsave(&chn->lock, flags);
>>> -        evtchn_port_set_pending(guest, chn->notify_vcpu_id, chn);
>>> -        spin_unlock_irqrestore(&chn->lock, flags);
>>> +        if ( evtchn_read_trylock(chn) )
>>> +        {
>>> +            evtchn_port_set_pending(guest, chn->notify_vcpu_id, chn);
>>> +            evtchn_read_unlock(chn);
>>> +        }
>>
>> Does this want some form of else, e.g. at least a printk_once()?
> 
> No, I don't think so.
> 
> This is just a race with the port_is_valid() test above where the
> port is just being switched to invalid.

This may be such a race yes, but why do you think it _will_ be?
Any holding of the lock for writing (or in fact, any pending
acquire in write mode) will make this fail, which - if it's not
such a race - will mean an event which wasn't sent when it
should have been, with potentially fatal (to the guest)
consequences.

>>> @@ -360,7 +352,7 @@ static long evtchn_bind_interdomain(evtchn_bind_interdomain_t *bind)
>>>       if ( rc )
>>>           goto out;
>>>   
>>> -    flags = double_evtchn_lock(lchn, rchn);
>>> +    double_evtchn_lock(lchn, rchn);
>>
>> This introduces an unfortunate conflict with my conversion of
>> the per-domain event lock to an rw one: It acquires rd's lock
>> in read mode only, while the requirements here would not allow
>> doing so. (Same in evtchn_close() then.)
> 
> Is it a problem to use write mode for those cases?

"Problem" can have a wide range of meanings - it's not going to
be the end of the world, but I view any use of a write lock as
a problem when a read lock would suffice. This can still harm
parallelism.

Jan

