Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C875228B142
	for <lists+xen-devel@lfdr.de>; Mon, 12 Oct 2020 11:15:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5831.15171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRtvL-0005pe-Am; Mon, 12 Oct 2020 09:15:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5831.15171; Mon, 12 Oct 2020 09:15:19 +0000
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
	id 1kRtvL-0005pF-7g; Mon, 12 Oct 2020 09:15:19 +0000
Received: by outflank-mailman (input) for mailman id 5831;
 Mon, 12 Oct 2020 09:15:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HuXe=DT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kRtvK-0005pA-9J
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 09:15:18 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0eeefbd3-d830-4fcc-9034-d937f88127b2;
 Mon, 12 Oct 2020 09:15:15 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2B50DAF0E;
 Mon, 12 Oct 2020 09:15:15 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=HuXe=DT=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kRtvK-0005pA-9J
	for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 09:15:18 +0000
X-Inumbo-ID: 0eeefbd3-d830-4fcc-9034-d937f88127b2
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 0eeefbd3-d830-4fcc-9034-d937f88127b2;
	Mon, 12 Oct 2020 09:15:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602494115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IDSrsPtVKC/xAOGARSdlQ5HMziWm1Vwrg6lD2YWyBBU=;
	b=JTmMeqOoncfr6hQZH67pZ0ty/qhF7VDrCLg29+JZ78uFwCoWkiVyy0aTIcUsDjSp+tfqpK
	SYkx5ZPzYzGuE8A3/nlEzysKuev/hh49+uLMqT+3C9YLyiETLhLtnqZOISkh1O8Zs+GUFt
	pFrWA3jCOFFFp7/KwKsuCkdX/WyF818=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 2B50DAF0E;
	Mon, 12 Oct 2020 09:15:15 +0000 (UTC)
Subject: Re: [PATCH 2/2] xen/evtchn: rework per event channel lock
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20201012091058.27023-1-jgross@suse.com>
 <20201012091058.27023-3-jgross@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <3a7c7346-6506-f2e1-ad22-cd18aa1ccfc3@suse.com>
Date: Mon, 12 Oct 2020 11:15:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201012091058.27023-3-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12.10.20 11:10, Juergen Gross wrote:
> Currently the lock for a single event channel needs to be taken with
> interrupts off, which causes deadlocks in some cases.
> 
> Rework the per event channel lock to be non-blocking for the case of
> sending an event and removing the need for disabling interrupts for
> taking the lock.
> 
> The lock is needed for avoiding races between sending an event or
> querying the channel's state against removal of the event channel.
> 
> Use a locking scheme similar to a rwlock, but with some modifications:
> 
> - sending an event or querying the event channel's state uses an
>    operation similar to read_trylock(), in case of not obtaining the
>    lock the sending is omitted or a default state is returned
> 
> - closing an event channel is similar to write_lock(), but without
>    real fairness regarding multiple writers (this saves some space in
>    the event channel structure and multiple writers are impossible as
>    closing an event channel requires the domain's event_lock to be
>    held).
> 
> With this locking scheme it is mandatory that a writer will always
> either start with an unbound or free event channel or will end with
> an unbound or free event channel, as otherwise the reaction of a reader
> not getting the lock would be wrong.
> 
> Fixes: e045199c7c9c54 ("evtchn: address races with evtchn_reset()")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Oh, please ignore. I forgot to add the needed barriers to the locking
functions.


Juergen

