Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8D/nI7u1KmqCvgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 15:18:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA236672494
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 15:18:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=apertussolutions.com header.s=zoho header.b=JJw7VYzS;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=none;
	arc=pass ("zohomail.com:s=zohoarc:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1335503.1597712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXfIl-00065n-5y; Thu, 11 Jun 2026 13:18:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1335503.1597712; Thu, 11 Jun 2026 13:18:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXfIl-00063J-2w; Thu, 11 Jun 2026 13:18:31 +0000
Received: by outflank-mailman (input) for mailman id 1335503;
 Thu, 11 Jun 2026 13:18:30 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wXfIj-00063B-Un
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 13:18:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXfIj-006bdp-Be
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 15:18:29 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a2ab5a1-2eae-0a2a0a5409dd-0a2a4504bfe4-22
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 15:18:28 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a2ab5a2-1dec-0a2a45040019-888fbc335297-3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 15:18:28 +0200
Received: by mx.zohomail.com with SMTPS id 1781183897179415.6699944155713;
 Thu, 11 Jun 2026 06:18:17 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1781183898; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KiK47b7Wx5F3S1vodA2pJOSTE3OqXdM64WJGAjhygW68M86WSO+VAWTYAFrjnro7laGTPZWi2vb0QOHFw1WO24Ubvp+o1gT0PhnOozE4HNHPT98EIOKCDBd2hBam19L/qPbC2Xr0VrYWuu/jGsj0QA+mOm7QnWzh2echnO2P9rM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1781183898; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=qQCFxp6aIawyEFEbO9MDcAvAv2Pl6Hm7nYjdGiVHO1U=; 
	b=KePHQ15fJBu8G9KoDzfkGXkdfnLcMPn2WwGUD1JrEHG9sPZVQytOmR793ZtUSUXIXKLxLAjqYyQOVv9pH8wDrWwpDv0Tc85kEWca8i+xB4Auon98vRnxorLf+6lbCfAcZOg4cRUyXL1sXVf+mRJcGgCeBTxI6mJOhBjFsQU/2cg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781183898;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=qQCFxp6aIawyEFEbO9MDcAvAv2Pl6Hm7nYjdGiVHO1U=;
	b=JJw7VYzSiCICel4H9XzClWYdd1vqOUmmez8W2aWRWLFAeWM2Zz9DhkXJUvJt6ynM
	STbRUJlwaT3XriG+9wSEBLbr79d+q2REZXqw0X0s+fXiZpJNQMmOtEBdhxF3N2f9yVm
	Vxrhw58gJhZWoPRATiOeYjXB3jsA3/74KdKEgyas=
Message-ID: <987f029b-02c0-423c-88fc-2e588f03a5bf@apertussolutions.com>
Date: Thu, 11 Jun 2026 09:18:15 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] domctl: Handle some of XEN_DOMCTL_shadow_op
 without the domctl lock
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20260609151528.2426788-1-ross.lagerwall@citrix.com>
 <20260609151528.2426788-3-ross.lagerwall@citrix.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20260609151528.2426788-3-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-ebf023/1781183908-42F653FF-13200196/0/0
X-purgate-type: clean
X-purgate-size: 3405
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.69 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[apertussolutions.com:s=zoho];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ross.lagerwall@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,apertussolutions.com:dkim,apertussolutions.com:email,apertussolutions.com:mid,apertussolutions.com:from_mime];
	DMARC_NA(0.00)[apertussolutions.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[apertussolutions.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EA236672494

On 6/9/26 11:15 AM, Ross Lagerwall wrote:
> Handle XEN_DOMCTL_SHADOW_OP_{CLEAN,PEEK} without taking the domctl lock.
> This is safe because for these subops, the paging lock is mostly held
> which prevents it from operating concurrently on the same domain. There
> are some parts that are called without the paging lock held:
> 
> * hvm_mapped_guest_frames_mark_dirty() - The function itself takes a
>    spinlock so is protected from concurrent calls. In any case, it will
>    mark all the pages dirty as required.
> 
> * domain_pause() - The toolstack cannot unpause the domain while in
>    paging_log_dirty_op() because the toolstack's pause/unpause ops have
>    a separate ref count.
> 
> * p2m_flush_hardware_cached_dirty() - This is called elsewhere without
>    the domctl lock held so holding it wouldn't achieve anything. It
>    should be fine as long as it is called at least once.
> 
> * log_dirty.ops->clean() - If the callback is hap_clean_dirty_bitmap(),
>    then it will hold the p2m lock while modifying the table. If the
>    callback is sh_clean_dirty_bitmap(), it will hold the paging lock
>    while modifying the table. In both cases, this is OK.
> 
> * domain_unpause() - Same as the earlier domain_pause().

Please add a comment that that xsm check is to continue protecting the 
sub-ops with XS_PRIV.


> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> ---
>   xen/arch/x86/mm/paging.c |  8 ++++++--
>   xen/common/domctl.c      | 12 ++++++++++++
>   2 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
> index 1a5822808620..bfb5b423a0dd 100644
> --- a/xen/arch/x86/mm/paging.c
> +++ b/xen/arch/x86/mm/paging.c
> @@ -746,11 +746,15 @@ long do_paging_domctl_cont(
>       ret = xsm_domctl(XSM_OTHER, d, &op);
>       if ( !ret )
>       {
> -        if ( domctl_lock_acquire() )
> +        bool lock = !(op.u.shadow_op.op == XEN_DOMCTL_SHADOW_OP_CLEAN ||
> +                      op.u.shadow_op.op == XEN_DOMCTL_SHADOW_OP_PEEK);
> +
> +        if ( !lock || domctl_lock_acquire() )
>           {
>               ret = paging_domctl(d, &op.u.shadow_op, u_domctl, 1);
>   
> -            domctl_lock_release();
> +            if ( lock )
> +                domctl_lock_release();
>           }
>           else
>               ret = -ERESTART;
> diff --git a/xen/common/domctl.c b/xen/common/domctl.c
> index 35144d95b808..a3888c4e87d4 100644
> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -559,6 +559,18 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>           ret = arch_do_domctl(op, d, u_domctl);
>           goto domctl_out_unlock_domonly;
>   
> +    case XEN_DOMCTL_shadow_op:
> +        if ( op->u.shadow_op.op == XEN_DOMCTL_SHADOW_OP_CLEAN ||
> +             op->u.shadow_op.op == XEN_DOMCTL_SHADOW_OP_PEEK )
> +        {
> +            ret = xsm_domctl(XSM_OTHER, d, op);
> +            if ( ret )
> +                goto domctl_out_unlock_domonly;
> +
> +            ret = arch_do_domctl(op, d, u_domctl);
> +            goto domctl_out_unlock_domonly;
> +        }
> +        fallthrough;
>       default:
>           /* Everything else handled further down. */
>           break;

After commit message change,

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

