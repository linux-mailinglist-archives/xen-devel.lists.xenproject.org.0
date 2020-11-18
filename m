Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE822B7E33
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 14:20:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29838.59523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfNMY-00059i-TF; Wed, 18 Nov 2020 13:19:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29838.59523; Wed, 18 Nov 2020 13:19:06 +0000
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
	id 1kfNMY-00059J-Py; Wed, 18 Nov 2020 13:19:06 +0000
Received: by outflank-mailman (input) for mailman id 29838;
 Wed, 18 Nov 2020 13:19:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=763w=EY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kfNMX-00059E-CE
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 13:19:05 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a9b9006b-6191-4470-9e9c-8753a214ded9;
 Wed, 18 Nov 2020 13:19:02 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D593EAFD8;
 Wed, 18 Nov 2020 13:19:01 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=763w=EY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kfNMX-00059E-CE
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 13:19:05 +0000
X-Inumbo-ID: a9b9006b-6191-4470-9e9c-8753a214ded9
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id a9b9006b-6191-4470-9e9c-8753a214ded9;
	Wed, 18 Nov 2020 13:19:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605705542; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sGHdC2L5o1J1lqE6yUAnA1GvuIm+6bMrJhY8jdQST/I=;
	b=qySZxs66lDCP88+3Z2BcvdKm+gXwqRXJDfZNttxjnJXw75PLKB/CorpjXfUGsN3H/a4A5R
	UA9mPNVhc4/Ya61IXseangR8Of75SAsaeTPGFcP2lS4juBHREimhDHinpE7CUmIrjB0mov
	doMELB36q1i/16owwchcfoyxvuvrrz0=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id D593EAFD8;
	Wed, 18 Nov 2020 13:19:01 +0000 (UTC)
Subject: Re: [PATCH v6 2/3] xen/evtchn: rework per event channel lock
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20201109163826.13035-1-jgross@suse.com>
 <20201109163826.13035-3-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <77067fa0-d902-9091-50e0-d6e15e34b159@suse.com>
Date: Wed, 18 Nov 2020 14:19:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201109163826.13035-3-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09.11.2020 17:38, Juergen Gross wrote:
> Currently the lock for a single event channel needs to be taken with
> interrupts off, which causes deadlocks in some cases.
> 
> Rework the per event channel lock to be non-blocking for the case of
> sending an event and removing the need for disabling interrupts for
> taking the lock.
> 
> The lock is needed for avoiding races between event channel state
> changes (creation, closing, binding) against normal operations (set
> pending, [un]masking, priority changes).
> 
> Use a rwlock, but with some restrictions:
> 
> - Changing the state of an event channel (creation, closing, binding)
>   needs to use write_lock(), with ASSERT()ing that the lock is taken as
>   writer only when the state of the event channel is either before or
>   after the locked region appropriate (either free or unbound).
> 
> - Sending an event needs to use read_trylock() mostly, in case of not
>   obtaining the lock the operation is omitted. This is needed as
>   sending an event can happen with interrupts off (at least in some
>   cases).
> 
> - Dumping the event channel state for debug purposes is using
>   read_trylock(), too, in order to avoid blocking in case the lock is
>   taken as writer for a long time.
> 
> - All other cases can use read_lock().

One of the implications is that racing invocations of ->set_pending()
are now possible for the same port. Beyond what I said in reply to
0/3 already, I'm afraid there are (latent) issues:

1) The update of ->pending (or basically any bitfield in struct
evtchn, or yet more generically any field getting updated in a read-
modify-write fashion) is no longer generally safe in any of the
hooks called with just a read lock held. ->pending itself is not an
issue now merely because it shares storage only with xen_consumer,
which won't get updated once a port was bound.

2) Of two racing sends, one may now complete without the port
actually having got fully recorded as linked in the FIFO code. This
is because the party losing the race of setting EVTCHN_FIFO_LINKED
will return early, without regard to whether the winner has made
enough progress. (Of course this is possible only with an
intermediate queue change, as only then the lock would become
available to the second of the senders early enough.)

I've gone through other functions called from this path and didn't
find any further race potential there, but I'm not entirely certain
I didn't miss anything.

Jan

