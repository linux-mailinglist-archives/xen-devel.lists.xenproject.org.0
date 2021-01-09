Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA9F2F00EF
	for <lists+xen-devel@lfdr.de>; Sat,  9 Jan 2021 16:42:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64194.113576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyGNE-0004SB-5E; Sat, 09 Jan 2021 15:41:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64194.113576; Sat, 09 Jan 2021 15:41:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyGNE-0004Rh-1D; Sat, 09 Jan 2021 15:41:52 +0000
Received: by outflank-mailman (input) for mailman id 64194;
 Sat, 09 Jan 2021 15:41:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kyGND-0004Rb-8r
 for xen-devel@lists.xenproject.org; Sat, 09 Jan 2021 15:41:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kyGNA-0002Vr-OV; Sat, 09 Jan 2021 15:41:48 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kyGNA-0000rJ-Gj; Sat, 09 Jan 2021 15:41:48 +0000
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
	bh=G9lT3ATXMYjY9k48kGu77PePnQFLXjqFbklhDR+XS5U=; b=ClOkHeDcE7n5qk4EXRnuaZCN8i
	1K6ZvcN8CdERRuPhEdjmrgsYnhZPf3Nkay0XN6ek9racOF1TDsiBCKC5lPfQAIcg/upQp1qfOPEFj
	s6GMfYG3QbxBm3+1s/ssP3qzh/MhHZZe57ZFbrq7YVFR2fu44x+tR9tus6yxNvCtFwWk=;
Subject: Re: [PATCH v4 04/10] evtchn: don't call Xen consumer callback with
 per-channel lock held
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cf0a1c24-0146-1017-7310-9536f2ed0ad1@suse.com>
 <e0179c46-face-4c64-9aeb-186be65ab77b@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <087cca1a-3a15-0d40-291c-893fa6c7f243@xen.org>
Date: Sat, 9 Jan 2021 15:41:46 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <e0179c46-face-4c64-9aeb-186be65ab77b@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 05/01/2021 13:10, Jan Beulich wrote:
> While there don't look to be any problems with this right now, the lock
> order implications from holding the lock can be very difficult to follow
> (and may be easy to violate unknowingly). The present callbacks don't
> (and no such callback should) have any need for the lock to be held.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

> ---
> v4: Go back to v2.
> v3: Drain callbacks before proceeding with closing. Re-base.
> 
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -767,9 +767,18 @@ int evtchn_send(struct domain *ld, unsig
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
> +            evtchn_read_unlock(lchn);
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

