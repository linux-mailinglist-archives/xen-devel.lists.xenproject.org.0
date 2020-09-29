Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB27427CA1C
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 14:17:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136.289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNEZD-00061G-KS; Tue, 29 Sep 2020 12:17:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136.289; Tue, 29 Sep 2020 12:17:11 +0000
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
	id 1kNEZD-00060t-HB; Tue, 29 Sep 2020 12:17:11 +0000
Received: by outflank-mailman (input) for mailman id 136;
 Tue, 29 Sep 2020 12:17:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pXYx=DG=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kNEZC-00060o-HE
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 12:17:10 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 42d744b6-aa6a-4bb2-84ba-8a960a1e8859;
 Tue, 29 Sep 2020 12:17:09 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kNEZ8-0001Np-I7; Tue, 29 Sep 2020 12:17:06 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kNEZ8-0007co-7O; Tue, 29 Sep 2020 12:17:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=pXYx=DG=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kNEZC-00060o-HE
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 12:17:10 +0000
X-Inumbo-ID: 42d744b6-aa6a-4bb2-84ba-8a960a1e8859
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 42d744b6-aa6a-4bb2-84ba-8a960a1e8859;
	Tue, 29 Sep 2020 12:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=7FroRu0mwblMndlVMh3E1YoFonbej4asN6jkqkxNWvk=; b=aluXLx5nuE2opEqgHaoXXy8TMH
	8C8EKzcoMRWpy6tsKePc62BGNMXYJRIqYPCIizPWLndwo6XTLC7DTiUkhWhqcGjDOZKtBRM6IKb8K
	qbX9QmZ7hVGK9YPDEz/Y19M4DhpFnQDCfKmvqFo4NjgR3mzfj2+soPYpoCxEL0d9J6DE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kNEZ8-0001Np-I7; Tue, 29 Sep 2020 12:17:06 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kNEZ8-0007co-7O; Tue, 29 Sep 2020 12:17:06 +0000
Subject: Re: [PATCH 05/12] evtchn/sched: reject poll requests for unusable
 ports
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Dario Faggioli <dfaggioli@suse.com>
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com>
 <802a0866-6bcf-cb52-1c3f-edb628fbc9c7@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <2fc8d5e2-8a94-4259-1a34-4458d8df04fe@xen.org>
Date: Tue, 29 Sep 2020 13:17:04 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <802a0866-6bcf-cb52-1c3f-edb628fbc9c7@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 28/09/2020 11:58, Jan Beulich wrote:
> Before and after XSA-342 there has been an asymmetry in how not really
> usable ports get treated in do_poll(): Ones beyond a certain boundary
> (max_evtchns originally, valid_evtchns subsequently) did get refused
> with -EINVAL, while lower ones were accepted despite there potentially
> being no way to wake the vCPU again from its polling state. Arrange to
> also honor evtchn_usable() output in the decision.
> 
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

With one request (see below):

Reviewed-by: Julien Grall <jgrall@amazon.com>

> 
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -1427,13 +1427,13 @@ static long do_poll(struct sched_poll *s
>           if ( __copy_from_guest_offset(&port, sched_poll->ports, i, 1) )
>               goto out;
>   
> -        rc = -EINVAL;
> -        if ( !port_is_valid(d, port) )
> -            goto out;
> -
> -        rc = 0;
> -        if ( evtchn_port_is_pending(d, port) )
> +        rc = evtchn_port_poll(d, port);
> +        if ( rc )
> +        {
> +            if ( rc > 0 )
> +                rc = 0;

This check wasn't obvious to me until I spent some times understanding 
how evtchn_port_poll() is working. I think it would be worth to...

>               goto out;
> +        }
>       }
>   
>       if ( sched_poll->nr_ports == 1 )
> --- a/xen/include/xen/event.h
> +++ b/xen/include/xen/event.h
> @@ -240,19 +240,6 @@ static inline bool evtchn_is_pending(con
>       return evtchn_usable(evtchn) && d->evtchn_port_ops->is_pending(d, evtchn);
>   }
>   
> -static inline bool evtchn_port_is_pending(struct domain *d, evtchn_port_t port)
> -{
> -    struct evtchn *evtchn = evtchn_from_port(d, port);
> -    bool rc;
> -    unsigned long flags;
> -
> -    spin_lock_irqsave(&evtchn->lock, flags);
> -    rc = evtchn_is_pending(d, evtchn);
> -    spin_unlock_irqrestore(&evtchn->lock, flags);
> -
> -    return rc;
> -}
> -
>   static inline bool evtchn_is_masked(const struct domain *d,
>                                       const struct evtchn *evtchn)
>   {
> @@ -279,6 +266,24 @@ static inline bool evtchn_is_busy(const
>              d->evtchn_port_ops->is_busy(d, evtchn);
>   }
>   
> +static inline int evtchn_port_poll(struct domain *d, evtchn_port_t port)

... add a comment on top of evtchn_port_poll() explaining that it will 
return a value < 0 if the port is not valid and > 0 if the port is pending.

> +{
> +    int rc = -EINVAL;
> +
> +    if ( port_is_valid(d, port) )
> +    {
> +        struct evtchn *evtchn = evtchn_from_port(d, port);
> +        unsigned long flags;
> +
> +        spin_lock_irqsave(&evtchn->lock, flags);
> +        if ( evtchn_usable(evtchn) )
> +            rc = evtchn_is_pending(d, evtchn);
> +        spin_unlock_irqrestore(&evtchn->lock, flags);
> +    }
> +
> +    return rc;
> +}
> +
>   static inline int evtchn_port_set_priority(struct domain *d,
>                                              struct evtchn *evtchn,
>                                              unsigned int priority)
> 

Cheers,

-- 
Julien Grall

