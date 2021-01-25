Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7260B3025AA
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 14:48:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74083.133147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l42D9-0001pI-Ll; Mon, 25 Jan 2021 13:47:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74083.133147; Mon, 25 Jan 2021 13:47:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l42D9-0001ot-IV; Mon, 25 Jan 2021 13:47:19 +0000
Received: by outflank-mailman (input) for mailman id 74083;
 Mon, 25 Jan 2021 13:47:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dw2F=G4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l42D8-0001oo-8p
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 13:47:18 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 182049ad-019b-4471-896d-ab1d4ca06e58;
 Mon, 25 Jan 2021 13:47:17 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 16147AC45;
 Mon, 25 Jan 2021 13:47:16 +0000 (UTC)
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
X-Inumbo-ID: 182049ad-019b-4471-896d-ab1d4ca06e58
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611582436; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sLiddK6WxHpSs2F+LzPqIN9aPYHgm2uxw7VxXear1Zs=;
	b=oP++ymbX6wai0GwW7D6qH9IxNhhHuF2nv7dcpfUyXlHJ810oI/uWcGbkYEEgPLTDdgAQc3
	Xy1YD6gh9Ir970FgmVDuHHhOoTkWA6kkMOFHN9QOKiYdLtDfqZ0UISkhNMDaPvsns1sx6m
	7xlavQesUsGoV7/3QOb6ppqmu+jVO+0=
Subject: Re: [PATCH v4 02/10] evtchn: bind-interdomain doesn't need to hold
 both domains' event locks
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cf0a1c24-0146-1017-7310-9536f2ed0ad1@suse.com>
 <8b21ff13-d6ea-3fa5-8d87-c05157112e4b@suse.com>
 <ab03e9a4-5c5f-347f-f084-f587b95794e5@xen.org>
 <00f5f88e-5fa5-495a-520d-ba2221b8276b@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <279137db-d986-b370-ae31-4a792ec1e743@suse.com>
Date: Mon, 25 Jan 2021 14:47:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <00f5f88e-5fa5-495a-520d-ba2221b8276b@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 09.01.2021 17:14, Julien Grall wrote:
> On 09/01/2021 15:41, Julien Grall wrote:
>> On 05/01/2021 13:09, Jan Beulich wrote:
>>> The local domain's lock is needed for the port allocation, but for the
>>> remote side the per-channel lock is sufficient. The per-channel locks
>>> then need to be acquired slightly earlier, though.
>>
>> I was expecting is little bit more information in the commit message 
>> because there are a few changes in behavior with this change:
>>
>>   1) AFAICT, evtchn_allocate_port() rely on rchn->state to be protected 
>> by the rd->event_lock. Now that you dropped the rd->event_lock, 
>> rchn->state may be accessed while it is updated in 
>> evtchn_bind_interdomain(). The port cannot go back to ECS_FREE here, but 
>> I think the access needs to be switched to {read, write}_atomic() or 
>> ACCESS_ONCE.
>>
>>    2) xsm_evtchn_interdomain() is now going to be called without the 
>> rd->event_lock. Can you confirm that the lock is not needed by XSM?
> 
> Actually, I think there is a bigger issue. evtchn_close() will check 
> chn1->state with just d1->event_lock held (IOW, there chn1->lock is not 
> held).
> 
> If the remote domain happen to close the unbound port at the same time 
> the local domain bound it, then you may end up in the following situation:
> 
> 
> evtchn_bind_interdomain()        | evtchn_close()
>                                   |
>                                   |  switch ( chn1->state )
>                                   |  case ECS_UNBOUND:
>                                   |      /* nothing to do */
>     double_evtchn_lock()          |
>     rchn->state = ECS_INTERDOMAIN |
>     double_evtchn_unlock()        |
>                                   |  evtchn_write_lock(chn1)
>                                   |  evtchn_free(d1, chn1)
>                                   |  evtchn_write_unlock(chn1)
> 
> When the local domain will try to close the port, it will hit the 
> BUG_ON(chn2->state != ECS_INTERDOMAIN) because the remote port were 
> already freed.

Hmm, yes, thanks for spotting (and sorry for taking a while to
reply).

> I think this can be solved by acquiring the event lock earlier on in 
> evtchn_close(). Although, this may become a can of worms as it would be 
> more complex to prevent lock inversion because chn1->lock and chn2->lock.

Indeed. I think I'll give up on trying to eliminate the double
per-domain event locking for the time being, and resubmit with
both patches dropped.

Jan

