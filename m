Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0452CC8B6
	for <lists+xen-devel@lfdr.de>; Wed,  2 Dec 2020 22:14:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43016.77402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkZSP-0001RB-Ob; Wed, 02 Dec 2020 21:14:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43016.77402; Wed, 02 Dec 2020 21:14:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkZSP-0001Qm-LO; Wed, 02 Dec 2020 21:14:37 +0000
Received: by outflank-mailman (input) for mailman id 43016;
 Wed, 02 Dec 2020 21:14:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kkZSO-0001Qh-Om
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 21:14:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kkZSM-0003wn-Jr; Wed, 02 Dec 2020 21:14:34 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kkZSM-0003Ud-DL; Wed, 02 Dec 2020 21:14:34 +0000
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
	bh=PMNxof0t/q+zpIFpcEyHRgoWAfoohyTYPUe/y/T+DLU=; b=iljXsA1wn7crLPV6J1kB4AgqpT
	mmmtzAxW/BHVlHYBXM9Ds+cVgA+EFIwNXXRXuSOSjOzVjKnwPiobpnFPO588kRJUWBrEt1bQedYlm
	axy0EqBOfY3gZBqb6cZKxCIEadYC3YK3IJ2kFBvmVUcgMA0/FGK8w5VPZbin99kPJ+iM=;
Subject: Re: [PATCH v3 2/5] evtchn: avoid access tearing for
 ->virq_to_evtchn[] accesses
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <9d7a052a-6222-80ff-cbf1-612d4ca50c2a@suse.com>
 <ce6ce543-d57a-4111-2e66-871c4f4633a8@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <dae588c9-69ab-36f8-f945-b9f6fb0cb14d@xen.org>
Date: Wed, 2 Dec 2020 21:14:32 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <ce6ce543-d57a-4111-2e66-871c4f4633a8@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 23/11/2020 13:28, Jan Beulich wrote:
> Use {read,write}_atomic() to exclude any eventualities, in particular
> observing that accesses aren't all happening under a consistent lock.
> 
> Requested-by: Julien Grall <julien@xen.org>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
> v3: New.
> 
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -446,7 +446,7 @@ int evtchn_bind_virq(evtchn_bind_virq_t
>   
>       spin_lock(&d->event_lock);
>   
> -    if ( v->virq_to_evtchn[virq] != 0 )
> +    if ( read_atomic(&v->virq_to_evtchn[virq]) )
>           ERROR_EXIT(-EEXIST);
>   
>       if ( port != 0 )
> @@ -474,7 +474,8 @@ int evtchn_bind_virq(evtchn_bind_virq_t
>   
>       evtchn_write_unlock(chn);
>   
> -    v->virq_to_evtchn[virq] = bind->port = port;
> +    bind->port = port;
> +    write_atomic(&v->virq_to_evtchn[virq], port);
>   
>    out:
>       spin_unlock(&d->event_lock);
> @@ -660,9 +661,9 @@ int evtchn_close(struct domain *d1, int
>       case ECS_VIRQ:
>           for_each_vcpu ( d1, v )
>           {
> -            if ( v->virq_to_evtchn[chn1->u.virq] != port1 )
> +            if ( read_atomic(&v->virq_to_evtchn[chn1->u.virq]) != port1 )
>                   continue;
> -            v->virq_to_evtchn[chn1->u.virq] = 0;
> +            write_atomic(&v->virq_to_evtchn[chn1->u.virq], 0);
>               spin_barrier(&v->virq_lock);
>           }
>           break;
> @@ -801,7 +802,7 @@ bool evtchn_virq_enabled(const struct vc
>       if ( virq_is_global(virq) && v->vcpu_id )
>           v = domain_vcpu(v->domain, 0);
>   
> -    return v->virq_to_evtchn[virq];
> +    return read_atomic(&v->virq_to_evtchn[virq]);
>   }
>   
>   void send_guest_vcpu_virq(struct vcpu *v, uint32_t virq)
> @@ -814,7 +815,7 @@ void send_guest_vcpu_virq(struct vcpu *v
>   
>       spin_lock_irqsave(&v->virq_lock, flags);
>   
> -    port = v->virq_to_evtchn[virq];
> +    port = read_atomic(&v->virq_to_evtchn[virq]);
>       if ( unlikely(port == 0) )
>           goto out;
>   
> @@ -843,7 +844,7 @@ void send_guest_global_virq(struct domai
>   
>       spin_lock_irqsave(&v->virq_lock, flags);
>   
> -    port = v->virq_to_evtchn[virq];
> +    port = read_atomic(&v->virq_to_evtchn[virq]);
>       if ( unlikely(port == 0) )
>           goto out;
>   
> 

-- 
Julien Grall

