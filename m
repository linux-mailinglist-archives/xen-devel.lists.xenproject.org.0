Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BA44F9373
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 13:02:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301388.514344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncmNd-00084t-DU; Fri, 08 Apr 2022 11:02:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301388.514344; Fri, 08 Apr 2022 11:02:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncmNd-00082P-AW; Fri, 08 Apr 2022 11:02:17 +0000
Received: by outflank-mailman (input) for mailman id 301388;
 Fri, 08 Apr 2022 11:02:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ncmNb-00082G-Sq
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 11:02:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ncmNb-0000J0-Nd; Fri, 08 Apr 2022 11:02:15 +0000
Received: from [54.239.6.190] (helo=[192.168.16.176])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ncmNb-0002T0-HR; Fri, 08 Apr 2022 11:02:15 +0000
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
	bh=LMe3To61OXohR7koCtJf8NTT774Wi+Jroh75YN21Vb0=; b=5darWaA3SQnnGMU31KF+ialTyi
	6i76DSi7gmjgqRzLPnmHn8BKiLONZ0nlEMQOLRM/4W4x0gMQKx6fmX37Q3p9CoNfmaf4b7G/3GiG8
	fSOHiP89aBKuq71FM2GswLT6icBpBpxdKIdtHLLP5Nk37PCQWcgxu2m95DHD/bgjV3DI=;
Message-ID: <42d16ff2-725d-ae10-ba6b-561487252125@xen.org>
Date: Fri, 8 Apr 2022 12:02:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH RFC] evtchn: add early-out to evtchn_move_pirqs()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>
References: <a0fbf06a-be3c-37bd-2abf-599912ad9bf5@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a0fbf06a-be3c-37bd-2abf-599912ad9bf5@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 08/04/2022 08:16, Jan Beulich wrote:
> See the code comment. The higher the rate of vCPU-s migrating across
> pCPU-s, the less useful this attempted optimization actually is. With
> credit2 the migration rate looks to be unduly high even on mostly idle
> systems, and hence on large systems lock contention here isn't very
> difficult to observe.

"high" and "large" is quite vague. Do you have more details on where you 
observed this issue and the improvement after this patch?

> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
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

AFAIU, the downside is another pCPU (and therefore vCPU) will get 
disturbed by the interrupt. Maybe we should revive "evtchn: convert 
domain event lock to an r/w one"?

> +    if ( !v->pirq_evtchn_head )
> +        return;
> +
>       spin_lock(&d->event_lock);
>       for ( port = v->pirq_evtchn_head; port; port = chn->u.pirq.next_port )
>       {
> 

Cheers,

-- 
Julien Grall

