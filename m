Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA65627C22C
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 12:16:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8.33 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNCgb-0001se-Do; Tue, 29 Sep 2020 10:16:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8.33; Tue, 29 Sep 2020 10:16:41 +0000
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
	id 1kNCgb-0001sF-AW; Tue, 29 Sep 2020 10:16:41 +0000
Received: by outflank-mailman (input) for mailman id 8;
 Tue, 29 Sep 2020 10:16:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pXYx=DG=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kNCgZ-0001s9-T2
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 10:16:39 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bf9163dc-82be-4773-a980-def122b0efd0;
 Tue, 29 Sep 2020 10:16:38 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kNCgU-0007G9-KC; Tue, 29 Sep 2020 10:16:34 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kNCgU-0006O6-BC; Tue, 29 Sep 2020 10:16:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=pXYx=DG=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kNCgZ-0001s9-T2
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 10:16:39 +0000
X-Inumbo-ID: bf9163dc-82be-4773-a980-def122b0efd0
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id bf9163dc-82be-4773-a980-def122b0efd0;
	Tue, 29 Sep 2020 10:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=Ei/1w9oLYc4i/afEuAnYnUqWWZiXTx6Lwy3ihwhdqQc=; b=Icrdn883RYjiwZrO1uLbc3rfrI
	/z41+jTVmCEX8h7ayiXHQe6vjEVspvPJzdx+KygWY0zB+pPVOROpO/HBsNqwNrSAnvSa3UhP0LNFW
	hRhAlwtDIg1cB5atFXFqb4/3Tvp+g60Jul9H97aa/kzT/0f3z7+oZPP0OlEZke0TL0fE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kNCgU-0007G9-KC; Tue, 29 Sep 2020 10:16:34 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kNCgU-0006O6-BC; Tue, 29 Sep 2020 10:16:34 +0000
Subject: Re: [PATCH 03/12] evtchn: don't call Xen consumer callback with
 per-channel lock held
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com>
 <1bf3959d-c097-f8ef-cce4-3a325d0984c4@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <895e7361-4d63-15b8-76c1-84ea39051b68@xen.org>
Date: Tue, 29 Sep 2020 11:16:32 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1bf3959d-c097-f8ef-cce4-3a325d0984c4@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 28/09/2020 11:57, Jan Beulich wrote:
> While there don't look to be any problems with this right now, the lock
> order implications from holding the lock can be very difficult to follow
> (and may be easy to violate unknowingly).

I think this is a good idea given that we are disabling interrupts now. 
Unfortunately...

> The present callbacks don't
> (and no such callback should) have any need for the lock to be held.

... I think the lock is necessary for the vm_event subsystem to avoid 
racing with the vm_event_disable().

The notification callback will use a data structure that is freed by 
vm_event_disable(). There is a lock, but it is part of the data structure...

One solution would be to have the lock outside of the data structure.

> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -746,9 +746,18 @@ int evtchn_send(struct domain *ld, unsig
>           rport = lchn->u.interdomain.remote_port;
>           rchn  = evtchn_from_port(rd, rport);
>           if ( consumer_is_xen(rchn) )
> -            xen_notification_fn(rchn)(rd->vcpu[rchn->notify_vcpu_id], rport);
> -        else
> -            evtchn_port_set_pending(rd, rchn->notify_vcpu_id, rchn);
> +        {
> +            /* Don't keep holding the lock for the call below. */
> +            xen_event_channel_notification_t fn = xen_notification_fn(rchn);
> +            struct vcpu *rv = rd->vcpu[rchn->notify_vcpu_id];
> +
> +            rcu_lock_domain(rd);
> +            spin_unlock_irqrestore(&lchn->lock, flags);
> +            fn(rv, rport);
> +            rcu_unlock_domain(rd);
> +            return 0;
> +        }
> +        evtchn_port_set_pending(rd, rchn->notify_vcpu_id, rchn);
>           break;
>       case ECS_IPI:
>           evtchn_port_set_pending(ld, lchn->notify_vcpu_id, lchn);
>

Cheers,

-- 
Julien Grall

