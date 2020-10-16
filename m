Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C865290236
	for <lists+xen-devel@lfdr.de>; Fri, 16 Oct 2020 11:52:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7866.20741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTMP1-0008Mw-Bu; Fri, 16 Oct 2020 09:51:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7866.20741; Fri, 16 Oct 2020 09:51:59 +0000
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
	id 1kTMP1-0008MX-8V; Fri, 16 Oct 2020 09:51:59 +0000
Received: by outflank-mailman (input) for mailman id 7866;
 Fri, 16 Oct 2020 09:51:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VWaZ=DX=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kTMP0-0008MS-0k
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 09:51:58 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 08496328-16b9-4bd0-9ae4-24bd755f4584;
 Fri, 16 Oct 2020 09:51:56 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kTMOv-0000ER-W6; Fri, 16 Oct 2020 09:51:53 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kTMOv-0004Av-OG; Fri, 16 Oct 2020 09:51:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VWaZ=DX=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kTMP0-0008MS-0k
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 09:51:58 +0000
X-Inumbo-ID: 08496328-16b9-4bd0-9ae4-24bd755f4584
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 08496328-16b9-4bd0-9ae4-24bd755f4584;
	Fri, 16 Oct 2020 09:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=bL9WSIRH/SISe4Ipc18xF683oHqDGoGyeZXxSZi2kno=; b=c3fHHpfgZGt81zWS9pyxXRzW55
	lssBM9+3yH5I0OgSsKdWWd8pplTbS/JMGjAqoK/H/ZJ2b27Ig6ii2662zgDB4pbMGv6V6mhUDVjsy
	G1Kd1FJgQZMCoNQ5IgsTH2gcNcjwMo9cQPwmU4hdqU5dZRE1mKhPeY5TTn2tDNb6OB6M=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kTMOv-0000ER-W6; Fri, 16 Oct 2020 09:51:53 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kTMOv-0004Av-OG; Fri, 16 Oct 2020 09:51:53 +0000
Subject: Re: [PATCH v2 2/2] xen/evtchn: rework per event channel lock
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20201012092740.1617-1-jgross@suse.com>
 <20201012092740.1617-3-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c97130a4-3ba0-3fbf-f10d-761c6bb51e1e@xen.org>
Date: Fri, 16 Oct 2020 10:51:51 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201012092740.1617-3-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 12/10/2020 10:27, Juergen Gross wrote:
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

The approach looks ok to me. I have a couple of remarks below.

[...]

> diff --git a/xen/include/xen/event.h b/xen/include/xen/event.h
> index 509d3ae861..39a93f7556 100644
> --- a/xen/include/xen/event.h
> +++ b/xen/include/xen/event.h
> @@ -105,6 +105,45 @@ void notify_via_xen_event_channel(struct domain *ld, int lport);
>   #define bucket_from_port(d, p) \
>       ((group_from_port(d, p))[((p) % EVTCHNS_PER_GROUP) / EVTCHNS_PER_BUCKET])
>   
> +#define EVENT_WRITE_LOCK_INC    MAX_VIRT_CPUS
> +static inline void evtchn_write_lock(struct evtchn *evtchn)

I think it would be good to describe the locking expectation in-code.

> +{
> +    int val;
> +
> +    /* No barrier needed, atomic_add_return() is full barrier. */
> +    for ( val = atomic_add_return(EVENT_WRITE_LOCK_INC, &evtchn->lock);
> +          val != EVENT_WRITE_LOCK_INC;
> +          val = atomic_read(&evtchn->lock) )
> +        cpu_relax();
> +}
> +
> +static inline void evtchn_write_unlock(struct evtchn *evtchn)
> +{
> +    arch_lock_release_barrier();
> +
> +    atomic_sub(EVENT_WRITE_LOCK_INC, &evtchn->lock);
> +}
> +
> +static inline bool evtchn_tryread_lock(struct evtchn *evtchn)
> +{
> +    if ( atomic_read(&evtchn->lock) >= EVENT_WRITE_LOCK_INC )
> +        return false;
> +
> +    /* No barrier needed, atomic_inc_return() is full barrier. */
> +    if ( atomic_inc_return(&evtchn->lock) < EVENT_WRITE_LOCK_INC )
> +        return true;
> +
> +    atomic_dec(&evtchn->lock);

NIT: Can you add a newline here?

> +    return false;
> +}
> +

Cheers,

-- 
Julien Grall

