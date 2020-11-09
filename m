Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 961612ABF69
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 16:08:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.22635.49011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc8lk-0000Z4-UI; Mon, 09 Nov 2020 15:07:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22635.49011; Mon, 09 Nov 2020 15:07:44 +0000
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
	id 1kc8lk-0000Yh-RC; Mon, 09 Nov 2020 15:07:44 +0000
Received: by outflank-mailman (input) for mailman id 22635;
 Mon, 09 Nov 2020 15:07:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a0OZ=EP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kc8lj-0000Yc-AI
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 15:07:43 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9b910015-2f54-4ac7-8034-067ef38d7d67;
 Mon, 09 Nov 2020 15:07:42 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 78254ABAE;
 Mon,  9 Nov 2020 15:07:41 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=a0OZ=EP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kc8lj-0000Yc-AI
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 15:07:43 +0000
X-Inumbo-ID: 9b910015-2f54-4ac7-8034-067ef38d7d67
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 9b910015-2f54-4ac7-8034-067ef38d7d67;
	Mon, 09 Nov 2020 15:07:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604934461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uk0rdmTBIxSJxNqONHLje+CAA9BWzyn2FGHgBU+NhL8=;
	b=TXhbGNsrcHvRmUPxIYucDI6loUyKFEEUyhEc1pljVw+s/n6RKM0esLKi+E6gmP2q5I6ZAl
	3TE55YOHxx5SpYAsmOD2ZdBqp+mjOgUlYU2EJlJ4iMts5EpRegdbVtR1mYrwpkU/h/LhYy
	Bgpk8UN/eRk0dlSGQFkj0ZfjSxQXpOQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 78254ABAE;
	Mon,  9 Nov 2020 15:07:41 +0000 (UTC)
Subject: Re: [PATCH v5 2/2] xen/evtchn: rework per event channel lock
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20201109064128.3908-1-jgross@suse.com>
 <20201109064128.3908-3-jgross@suse.com>
 <df9737a4-f90a-0498-b67d-ce254b835287@suse.com>
 <7fa67b64-4114-736b-660c-2ec5be8f7da1@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2add23c5-8fae-5637-a132-b25b2d856a7b@suse.com>
Date: Mon, 9 Nov 2020 16:07:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <7fa67b64-4114-736b-660c-2ec5be8f7da1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 09.11.2020 14:16, Jürgen Groß wrote:
> On 09.11.20 12:58, Jan Beulich wrote:
>> On 09.11.2020 07:41, Juergen Gross wrote:
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
>> Does this need trylock?
> 
> It is called directly from the event upcall, so interrupts should be
> off here. Without trylock this would result in check_lock() triggering.

Hmm, right. Since the trylock function needs exposing anyway, this
isn't much of a problem, the more that it fits the pattern of being
a send.

Jan

