Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 312F1296251
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 18:01:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10544.28034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVd1X-0002zz-7z; Thu, 22 Oct 2020 16:01:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10544.28034; Thu, 22 Oct 2020 16:01:07 +0000
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
	id 1kVd1X-0002za-4n; Thu, 22 Oct 2020 16:01:07 +0000
Received: by outflank-mailman (input) for mailman id 10544;
 Thu, 22 Oct 2020 16:01:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mO8V=D5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kVd1W-0002zV-3h
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:01:06 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 34bc227d-d751-49ae-81e5-606dae3d9519;
 Thu, 22 Oct 2020 16:01:05 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=mO8V=D5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kVd1W-0002zV-3h
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:01:06 +0000
X-Inumbo-ID: 34bc227d-d751-49ae-81e5-606dae3d9519
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 34bc227d-d751-49ae-81e5-606dae3d9519;
	Thu, 22 Oct 2020 16:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603382465;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ycOh5zIYrtDHzOnI9vkGH/2BnhNlPoyPcXDQJ+1Hg9s=;
  b=Oor8rARHe34G85BVP/Wh1JFbOESNIXCWtu5zvzEDt6BLvuzHxK/cRr49
   3WGnD7lGdp0wOkCCNaM2pauiqZ5GxXyQcdU1f6LJ98A+aBZxU5L2ZVh7d
   qBmqBff/tTqEFWvyC0teTxRI976eQTispeN8u0VnKFy6AaIFgfaMM/hQP
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: WnF1brx971V3mH0zByaXpVYo/7QElDkSbf7CJ+0Mu4aF1TXQfgP6m/1tAKRdbv5sMQSpqTVT7O
 sf4cUlwJawvZ/hPJwlMx5YMVCKYb/kjomjuP1nY/ydukI8xgbN6FrGD5lmvQB77mgN3BlsNvrI
 G/yQKzamKKTZpgmRhHjnawAwqgUm2BkClNVqOLKAXWoQHEsbas/dthAtEM4u7HhjajsIyVqGGn
 2XLrFWnGClNTVqh3suCTvpVn2KQKwFKMFToWzdEmUfqEoytX9GYZ6HVfgVUQmF3LWdfeogGfnq
 Ji8=
X-SBRS: None
X-MesageID: 29829737
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,404,1596513600"; 
   d="scan'208";a="29829737"
Date: Thu, 22 Oct 2020 18:00:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH v2 5/8] evtchn: drop acquiring of per-channel lock from
 send_guest_{global,vcpu}_virq()
Message-ID: <20201022160055.nlucvj2bsxolxd5o@Air-de-Roger>
References: <19babf20-3649-5c63-44a9-7edfa81835aa@suse.com>
 <53eb30ca-9b3f-0ef4-bc90-e1c196b716b3@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <53eb30ca-9b3f-0ef4-bc90-e1c196b716b3@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Tue, Oct 20, 2020 at 04:10:09PM +0200, Jan Beulich wrote:
> The per-vCPU virq_lock, which is being held anyway, together with there
> not being any call to evtchn_port_set_pending() when v->virq_to_evtchn[]
> is zero, provide sufficient guarantees.

This is also fine because closing the event channel will be done with
the VIRQ hold held also AFAICT.

> Undo the lock addition done for
> XSA-343 (commit e045199c7c9c "evtchn: address races with
> evtchn_reset()"). Update the description next to struct evtchn_port_ops
> accordingly.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: New.
> 
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -794,7 +794,6 @@ void send_guest_vcpu_virq(struct vcpu *v
>      unsigned long flags;
>      int port;
>      struct domain *d;
> -    struct evtchn *chn;
>  
>      ASSERT(!virq_is_global(virq));
>  
> @@ -805,10 +804,7 @@ void send_guest_vcpu_virq(struct vcpu *v
>          goto out;
>  
>      d = v->domain;
> -    chn = evtchn_from_port(d, port);
> -    spin_lock(&chn->lock);
> -    evtchn_port_set_pending(d, v->vcpu_id, chn);
> -    spin_unlock(&chn->lock);
> +    evtchn_port_set_pending(d, v->vcpu_id, evtchn_from_port(d, port));
>  
>   out:
>      spin_unlock_irqrestore(&v->virq_lock, flags);
> @@ -837,9 +833,7 @@ void send_guest_global_virq(struct domai
>          goto out;
>  
>      chn = evtchn_from_port(d, port);
> -    spin_lock(&chn->lock);
>      evtchn_port_set_pending(d, chn->notify_vcpu_id, chn);
> -    spin_unlock(&chn->lock);
>  
>   out:
>      spin_unlock_irqrestore(&v->virq_lock, flags);
> --- a/xen/include/xen/event.h
> +++ b/xen/include/xen/event.h
> @@ -177,9 +177,16 @@ int evtchn_reset(struct domain *d, bool
>   * Low-level event channel port ops.
>   *
>   * All hooks have to be called with a lock held which prevents the channel
> - * from changing state. This may be the domain event lock, the per-channel
> - * lock, or in the case of sending interdomain events also the other side's
> - * per-channel lock. Exceptions apply in certain cases for the PV shim.
> + * from changing state. This may be
> + * - the domain event lock,
> + * - the per-channel lock,
> + * - in the case of sending interdomain events the other side's per-channel
> + *   lock,
> + * - in the case of sending non-global vIRQ-s the per-vCPU virq_lock (in
> + *   combination with the ordering enforced through how the vCPU's
> + *   virq_to_evtchn[] gets updated),
> + * - in the case of sending global vIRQ-s vCPU 0's virq_lock.
> + * Exceptions apply in certain cases for the PV shim.

Having such a wide locking discipline looks dangerous to me, it's easy
to get things wrong without notice IMO.

Maybe we could add an assert to that effect in
evtchn_port_set_pending in order to make sure callers follow the
discipline?

Roger.

