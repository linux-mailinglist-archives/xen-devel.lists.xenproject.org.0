Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAE82F00F0
	for <lists+xen-devel@lfdr.de>; Sat,  9 Jan 2021 16:42:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64190.113563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyGMV-0004MQ-Rq; Sat, 09 Jan 2021 15:41:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64190.113563; Sat, 09 Jan 2021 15:41:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyGMV-0004M8-O8; Sat, 09 Jan 2021 15:41:07 +0000
Received: by outflank-mailman (input) for mailman id 64190;
 Sat, 09 Jan 2021 15:41:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kyGMT-0004M3-DP
 for xen-devel@lists.xenproject.org; Sat, 09 Jan 2021 15:41:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kyGMR-0002V7-7k; Sat, 09 Jan 2021 15:41:03 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kyGMQ-0000q8-UF; Sat, 09 Jan 2021 15:41:03 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=Q+eQvLYfV87DwT/wxZegDg/v9m5TpIoyn0cf5TkonKk=; b=xNMuYcN+5LZRDvJ4c8aiLmcFT8
	dfcQ2My2H+L0fylm+XVGe1wrRVPKuMJmU54Qt3k3HZrOWL7O95aiySwl+tgCRWk1+i8Pgs345p8y+
	DSMrtKKI7lHUS88VyZqDeLPeLT+LvdFFgeqGvsDSLSWUyMg7XQNK0zxdX/XdUB8MqDPA=;
Subject: Re: [PATCH v4 02/10] evtchn: bind-interdomain doesn't need to hold
 both domains' event locks
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cf0a1c24-0146-1017-7310-9536f2ed0ad1@suse.com>
 <8b21ff13-d6ea-3fa5-8d87-c05157112e4b@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ab03e9a4-5c5f-347f-f084-f587b95794e5@xen.org>
Date: Sat, 9 Jan 2021 15:41:00 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <8b21ff13-d6ea-3fa5-8d87-c05157112e4b@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 05/01/2021 13:09, Jan Beulich wrote:
> The local domain's lock is needed for the port allocation, but for the
> remote side the per-channel lock is sufficient. The per-channel locks
> then need to be acquired slightly earlier, though.

I was expecting is little bit more information in the commit message 
because there are a few changes in behavior with this change:

  1) AFAICT, evtchn_allocate_port() rely on rchn->state to be protected 
by the rd->event_lock. Now that you dropped the rd->event_lock, 
rchn->state may be accessed while it is updated in 
evtchn_bind_interdomain(). The port cannot go back to ECS_FREE here, but 
I think the access needs to be switched to {read, write}_atomic() or 
ACCESS_ONCE.

   2) xsm_evtchn_interdomain() is now going to be called without the 
rd->event_lock. Can you confirm that the lock is not needed by XSM?

> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v4: New.
> 
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -355,18 +355,7 @@ static long evtchn_bind_interdomain(evtc
>       if ( (rd = rcu_lock_domain_by_id(rdom)) == NULL )
>           return -ESRCH;
>   
> -    /* Avoid deadlock by first acquiring lock of domain with smaller id. */
> -    if ( ld < rd )
> -    {
> -        spin_lock(&ld->event_lock);
> -        spin_lock(&rd->event_lock);
> -    }
> -    else
> -    {
> -        if ( ld != rd )
> -            spin_lock(&rd->event_lock);
> -        spin_lock(&ld->event_lock);
> -    }
> +    spin_lock(&ld->event_lock);
>   
>       if ( (lport = get_free_port(ld)) < 0 )
>           ERROR_EXIT(lport);
> @@ -375,15 +364,19 @@ static long evtchn_bind_interdomain(evtc
>       if ( !port_is_valid(rd, rport) )
>           ERROR_EXIT_DOM(-EINVAL, rd);
>       rchn = evtchn_from_port(rd, rport);
> +
> +    double_evtchn_lock(lchn, rchn);
> +
>       if ( (rchn->state != ECS_UNBOUND) ||
>            (rchn->u.unbound.remote_domid != ld->domain_id) )

You want to unlock the event channels here.

>           ERROR_EXIT_DOM(-EINVAL, rd);
>   
>       rc = xsm_evtchn_interdomain(XSM_HOOK, ld, lchn, rd, rchn);
>       if ( rc )
> +    {
> +        double_evtchn_unlock(lchn, rchn);
>           goto out;
> -
> -    double_evtchn_lock(lchn, rchn);
> +    }
>   
>       lchn->u.interdomain.remote_dom  = rd;
>       lchn->u.interdomain.remote_port = rport;
> @@ -407,8 +400,6 @@ static long evtchn_bind_interdomain(evtc
>    out:
>       check_free_port(ld, lport);
>       spin_unlock(&ld->event_lock);
> -    if ( ld != rd )
> -        spin_unlock(&rd->event_lock);
>       
>       rcu_unlock_domain(rd);
>   
> 

Cheers,

-- 
Julien Grall

