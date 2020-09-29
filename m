Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BBC27C241
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 12:21:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.13.57 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNCkz-0002qE-8P; Tue, 29 Sep 2020 10:21:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13.57; Tue, 29 Sep 2020 10:21:13 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNCkz-0002pp-5E; Tue, 29 Sep 2020 10:21:13 +0000
Received: by outflank-mailman (input) for mailman id 13;
 Tue, 29 Sep 2020 10:21:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pXYx=DG=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kNCkx-0002pj-Kl
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 10:21:11 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9384e98a-b3c6-4e35-b5a3-289e7a929b76;
 Tue, 29 Sep 2020 10:21:10 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kNCku-0007MZ-P5; Tue, 29 Sep 2020 10:21:08 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kNCku-0006hc-HL; Tue, 29 Sep 2020 10:21:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=pXYx=DG=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kNCkx-0002pj-Kl
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 10:21:11 +0000
X-Inumbo-ID: 9384e98a-b3c6-4e35-b5a3-289e7a929b76
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 9384e98a-b3c6-4e35-b5a3-289e7a929b76;
	Tue, 29 Sep 2020 10:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=zOWSCzCjJV+vkikmLnCe/n80ppjpBSIucI+JbmaJ2uc=; b=Ev2qpzETu3ZIKXLxAmAQyftVtw
	LLwK50kSx9hqqLimPmrqa1xRcOUGcfCNGhxWXXYLM8aq35BToKKOtKjkrSwEMQBo858TONcWgpOxf
	NQQLYLc3gH4gzX38Y2dP60i7kCkcFc123VSnbGw47LJ1HUNzMcQljOMIkYt8UZJJ1/78=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kNCku-0007MZ-P5; Tue, 29 Sep 2020 10:21:08 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kNCku-0006hc-HL; Tue, 29 Sep 2020 10:21:08 +0000
Subject: Re: [PATCH 04/12] evtchn: evtchn_set_priority() needs to acquire the
 per-channel lock
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com>
 <5b1700a8-7900-9450-1c21-323bcde1fccc@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <05977dcd-8283-6022-b183-6a83500f32f6@xen.org>
Date: Tue, 29 Sep 2020 11:21:06 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <5b1700a8-7900-9450-1c21-323bcde1fccc@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 28/09/2020 11:57, Jan Beulich wrote:
> evtchn_fifo_set_pending() (invoked with the per-channel lock held) has
> two uses of the channel's priority field. The field gets updated by
> evtchn_fifo_set_priority() with only the per-domain event_lock held,
> i.e. the two reads may observe two different values. While the 2nd use
> could - afaict - in principle be replaced by q->priority, I think
> evtchn_set_priority() should acquire the per-channel lock in any event.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -1132,7 +1132,9 @@ static long evtchn_set_priority(const st
>   {
>       struct domain *d = current->domain;
>       unsigned int port = set_priority->port;
> +    struct evtchn *chn;
>       long ret;
> +    unsigned long flags;
>   
>       spin_lock(&d->event_lock);

Is it still necessary to hold d->event_lock?

>   
> @@ -1142,8 +1144,10 @@ static long evtchn_set_priority(const st
>           return -EINVAL;
>       }
>   
> -    ret = evtchn_port_set_priority(d, evtchn_from_port(d, port),
> -                                   set_priority->priority);
> +    chn = evtchn_from_port(d, port);
> +    spin_lock_irqsave(&chn->lock, flags);
> +    ret = evtchn_port_set_priority(d, chn, set_priority->priority);
> +    spin_unlock_irqrestore(&chn->lock, flags);
>   
>       spin_unlock(&d->event_lock);
>   
> 

Cheers,

-- 
Julien Grall

