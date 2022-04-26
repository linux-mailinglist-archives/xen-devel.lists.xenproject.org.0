Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6E650FB48
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 12:44:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313764.531494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njIgO-00078q-D0; Tue, 26 Apr 2022 10:44:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313764.531494; Tue, 26 Apr 2022 10:44:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njIgO-00075t-9o; Tue, 26 Apr 2022 10:44:36 +0000
Received: by outflank-mailman (input) for mailman id 313764;
 Tue, 26 Apr 2022 10:44:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1njIgN-00075n-Lo
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 10:44:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1njIgN-0002D5-HJ; Tue, 26 Apr 2022 10:44:35 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.15.135]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1njIgN-0002Yn-9p; Tue, 26 Apr 2022 10:44:35 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=+e68LPkInZ1uO46tqfE6PlUwwKXp+5BEWR8drb64tCU=; b=GPmgf+1KdR/jPKi4P6jOdNao5G
	mb7bEDc9xUrNN1nF3kuOz+Vv5V+jIQYthnxHcKUpiqbNZUWUBoM8mgrG8vLc2ZhdWxTp6NMHFrJNT
	1HRx352i8Yl91/OORavOMAms41yW1rTSMSTViSCJlXPAQ4grKs2Eg95xVhPiKwNI60QY=;
Message-ID: <8bca62e3-1075-f1f7-1a92-1a4c58ba2aeb@xen.org>
Date: Tue, 26 Apr 2022 11:44:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [PATCH v1.1] evtchn: add early-out to evtchn_move_pirqs()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>
References: <acd0dfae-b045-8505-3f6c-30ce72653660@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <acd0dfae-b045-8505-3f6c-30ce72653660@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 26/04/2022 11:33, Jan Beulich wrote:
> See the code comment. The higher the rate of vCPU-s migrating across
> pCPU-s, the less useful this attempted optimization actually is. With
> credit2 the migration rate looks to be unduly high even on mostly idle
> systems, and hence on large systems lock contention here isn't very
> difficult to observe (as was the case for a failed 4.12 osstest flight).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Tested-by: Luca Fancellu <luca.fancellu@arm.com>
> 
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -1559,6 +1559,16 @@ void evtchn_move_pirqs(struct vcpu *v)
>       unsigned int port;
>       struct evtchn *chn;
>   
> +    /*
> +     * The work done below is an attempt to keep pIRQ-s on the pCPU-s that the
> +     * vCPU-s they're to be delivered to run on. In order to limit lock
> +     * contention, check for an empty list prior to acquiring the lock. In the
> +     * worst case a pIRQ just bound to this vCPU will be delivered elsewhere
> +     * until the vCPU is migrated (again) to another pCPU.
> +     */
> +    if ( !v->pirq_evtchn_head )
> +        return;

I was hoping Andrew would give some insight (hence why I haven't replied 
to your previous answer).

I am still not really convinced about this optimization. Aside what I 
wrote about the IRQ raised on the "wrong" pCPU, the lock contention 
would still be present if an OS is deciding to spread the PIRQs across 
all the vCPUs.

So it seems to me switching to a rwlock would help to address the 
contention on all the cases.

> +
>       spin_lock(&d->event_lock);
>       for ( port = v->pirq_evtchn_head; port; port = chn->u.pirq.next_port )
>       {
> 

Cheers,

-- 
Julien Grall

