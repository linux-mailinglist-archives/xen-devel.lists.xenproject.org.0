Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD862C6407
	for <lists+xen-devel@lfdr.de>; Fri, 27 Nov 2020 12:42:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39213.72031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kic8s-0005s0-FY; Fri, 27 Nov 2020 11:42:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39213.72031; Fri, 27 Nov 2020 11:42:22 +0000
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
	id 1kic8s-0005rc-C5; Fri, 27 Nov 2020 11:42:22 +0000
Received: by outflank-mailman (input) for mailman id 39213;
 Fri, 27 Nov 2020 11:42:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rmeX=FB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kic8r-0005rX-Gn
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 11:42:21 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1a267842-0997-4bf6-b8d2-075604802f00;
 Fri, 27 Nov 2020 11:42:20 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AB3B9AC23;
 Fri, 27 Nov 2020 11:42:19 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=rmeX=FB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kic8r-0005rX-Gn
	for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 11:42:21 +0000
X-Inumbo-ID: 1a267842-0997-4bf6-b8d2-075604802f00
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 1a267842-0997-4bf6-b8d2-075604802f00;
	Fri, 27 Nov 2020 11:42:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606477339; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5euZdDABe2W1BEOLxYMKgD6idvirOY2OQbp4p+WrtIU=;
	b=bVW43O75tQDPYXePNjLRHMyQg9dSEuRPdkb3nHY+V1yJpeqV8HTZCaK0XtkWX/fc+NpQkM
	jmkazpmfQZBDExH2+xLLeXSmeYF7nE6OgrjgYEKI9ynjTYbvTcvMG9oCIJ8RsGDO71k3ti
	JXoCUgslmLXJuVXdGM8a+yWy6McnMbc=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id AB3B9AC23;
	Fri, 27 Nov 2020 11:42:19 +0000 (UTC)
Subject: Re: [PATCH v8 1/3] xen/events: modify struct evtchn layout
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201125105122.3650-1-jgross@suse.com>
 <20201125105122.3650-2-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4c054bdb-e74a-4ca8-ede3-8df3874b39fb@suse.com>
Date: Fri, 27 Nov 2020 12:42:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201125105122.3650-2-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25.11.2020 11:51, Juergen Gross wrote:
> In order to avoid latent races when updating an event channel put
> xen_consumer and pending fields in different bytes. This is no problem
> right now, but especially the pending indicator isn't used only when
> initializing an event channel (unlike xen_consumer), so any future
> addition to this byte would need to be done with a potential race kept
> in mind.
> 
> At the same time move some other fields around to have less implicit
> paddings and to keep related fields more closely together.
> 
> Finally switch struct evtchn to no longer use fixed sized types where
> not needed.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one more adjustment (can be done while committing, I guess):

> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -93,31 +93,33 @@ struct evtchn
>  #define ECS_PIRQ         4 /* Channel is bound to a physical IRQ line.       */
>  #define ECS_VIRQ         5 /* Channel is bound to a virtual IRQ line.        */
>  #define ECS_IPI          6 /* Channel is bound to a virtual IPI line.        */
> -    u8  state;             /* ECS_* */
> -    u8  xen_consumer:XEN_CONSUMER_BITS; /* Consumer in Xen if nonzero */
> -    u8  pending:1;
> -    u16 notify_vcpu_id;    /* VCPU for local delivery notification */
> -    u32 port;
> +    unsigned char state;   /* ECS_* */
> +#ifndef NDEBUG
> +    unsigned char old_state; /* State when taking lock in write mode. */
> +#endif
> +    unsigned char xen_consumer:XEN_CONSUMER_BITS; /* Consumer in Xen if != 0 */
> +    unsigned int port;

evtchn_port_t, to be in line with ...

>      union {
>          struct {
>              domid_t remote_domid;
> -        } unbound;     /* state == ECS_UNBOUND */
> +        } unbound;          /* state == ECS_UNBOUND */
>          struct {
>              evtchn_port_t  remote_port;
>              struct domain *remote_dom;
> -        } interdomain; /* state == ECS_INTERDOMAIN */
> +        } interdomain;      /* state == ECS_INTERDOMAIN */
>          struct {
> -            u32            irq;
> +            unsigned int   irq;
>              evtchn_port_t  next_port;
>              evtchn_port_t  prev_port;

... three of the fields above from here.

> -        } pirq;        /* state == ECS_PIRQ */
> -        u16 virq;      /* state == ECS_VIRQ */
> +        } pirq;             /* state == ECS_PIRQ */
> +        unsigned int virq;  /* state == ECS_VIRQ */
>      } u;
> -    u8 priority;
> -#ifndef NDEBUG
> -    u8 old_state;      /* State when taking lock in write mode. */
> -#endif
> -    u32 fifo_lastq;    /* Data for fifo events identifying last queue. */
> +
> +    bool pending;                  /* FIFO event channels only. */
> +    unsigned char priority;        /* FIFO event channels only. */
> +    unsigned short notify_vcpu_id; /* VCPU for local delivery notification */

I have to admit though that I'm not fully happy with the uses of
"unsigned char" and "unsigned short". Yes, I did ask for this
change (based on ./CODING_STYLE), but I did also hint towards the
use of bitfields. If bitfields aren't an option here to achieve
the desired dense packing, perhaps this desire should be permitted
as another reason to use fixed width types. (Question goes more
towards everyone who cares than to you specifically.)

Otoh, as long as we have the odd alignment attribute on the struct,
packing density doesn't really matter all this much. I was more
hoping for this change to be a step towards us dropping that
attribute.

Jan

