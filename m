Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B5323F497
	for <lists+xen-devel@lfdr.de>; Fri,  7 Aug 2020 23:51:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k4AGm-0004ob-5R; Fri, 07 Aug 2020 21:51:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tr6f=BR=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k4AGl-0004oT-9P
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2020 21:51:19 +0000
X-Inumbo-ID: cd8d72f7-e89e-4ee6-b779-2a814443e982
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cd8d72f7-e89e-4ee6-b779-2a814443e982;
 Fri, 07 Aug 2020 21:51:18 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9CAB42177B;
 Fri,  7 Aug 2020 21:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596837078;
 bh=ZJMzXL8ZeHi2wRlmaD0+M0EXul71j0VOol4lp0yDtag=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=w0xRorkbbrOg/VIHJu50jnmvv6vVtrAV2H2Jgv3vK1wy/l4UBWTT3ns7rRzBAD+yn
 D8/rtNSbLXM7mDkBHhWkp/+gd74g0smaa/m94pMNFwiLVLR0mS6cpe1+3vHuZpWDFC
 dX/nsjihi490B/SQrIe2b2oOGkmpUBHU6EJWDrIc=
Date: Fri, 7 Aug 2020 14:51:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 04/14] kernel-doc: public/event_channel.h
In-Reply-To: <57b251fc-8997-48b8-693c-08e38d643fc3@suse.com>
Message-ID: <alpine.DEB.2.21.2008071212590.16004@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2008061605410.16004@sstabellini-ThinkPad-T480s>
 <20200806234933.16448-4-sstabellini@kernel.org>
 <57b251fc-8997-48b8-693c-08e38d643fc3@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org, wl@xen.org,
 andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, george.dunlap@citrix.com,
 xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, 7 Aug 2020, Jan Beulich wrote:
> On 07.08.2020 01:49, Stefano Stabellini wrote:
> > @@ -137,65 +147,78 @@ typedef struct evtchn_bind_interdomain evtchn_bind_interdomain_t;
> >   *     binding cannot be changed.
> >   */
> >  struct evtchn_bind_virq {
> > -    /* IN parameters. */
> > -    uint32_t virq; /* enum virq */
> > +    /** @virq: IN parameter, enum virq */
> > +    uint32_t virq;
> > +    /** @vcpu: IN parameter */
> >      uint32_t vcpu;
> > -    /* OUT parameters. */
> > +    /** @port: OUT parameter */
> >      evtchn_port_t port;
> >  };
> >  typedef struct evtchn_bind_virq evtchn_bind_virq_t;
> >  
> > -/*
> > - * EVTCHNOP_bind_pirq: Bind a local event channel to a real IRQ (PIRQ <irq>).
> > +/**
> > + * struct evtchn_bind_pirq - EVTCHNOP_bind_pirq
> > + *
> > + * Bind a local event channel to a real IRQ (PIRQ <irq>).
> >   * NOTES:
> >   *  1. A physical IRQ may be bound to at most one event channel per domain.
> >   *  2. Only a sufficiently-privileged domain may bind to a physical IRQ.
> >   */
> >  struct evtchn_bind_pirq {
> > -    /* IN parameters. */
> > +    /** @pirq: IN parameter */
> >      uint32_t pirq;
> > +    /** @flags: IN parameter,  BIND_PIRQ__* */
> >  #define BIND_PIRQ__WILL_SHARE 1
> > -    uint32_t flags; /* BIND_PIRQ__* */
> > -    /* OUT parameters. */
> > +    uint32_t flags;
> > +    /** @port: OUT parameter */
> >      evtchn_port_t port;
> >  };
> >  typedef struct evtchn_bind_pirq evtchn_bind_pirq_t;
> >  
> > -/*
> > - * EVTCHNOP_bind_ipi: Bind a local event channel to receive events.
> > +/**
> > + * struct struct evtchn_bind_ipi - EVTCHNOP_bind_ipi
> > + *
> > + * Bind a local event channel to receive events.
> >   * NOTES:
> >   *  1. The allocated event channel is bound to the specified vcpu. The binding
> >   *     may not be changed.
> >   */
> >  struct evtchn_bind_ipi {
> > +    /** @vcpu: IN parameter */
> >      uint32_t vcpu;
> > -    /* OUT parameters. */
> > +    /** @port: OUT parameter */
> >      evtchn_port_t port;
> >  };
> >  typedef struct evtchn_bind_ipi evtchn_bind_ipi_t;
> >  
> > -/*
> > - * EVTCHNOP_close: Close a local event channel <port>. If the channel is
> > - * interdomain then the remote end is placed in the unbound state
> > +/**
> > + * struct evtchn_close - EVTCHNOP_close
> > + *
> > + * Close a local event channel <port>. If the channel is interdomain
> > + * then the remote end is placed in the unbound state
> >   * (EVTCHNSTAT_unbound), awaiting a new connection.
> >   */
> >  struct evtchn_close {
> > -    /* IN parameters. */
> > +    /** @port: IN parameter */
> >      evtchn_port_t port;
> >  };
> >  typedef struct evtchn_close evtchn_close_t;
> >  
> > -/*
> > - * EVTCHNOP_send: Send an event to the remote end of the channel whose local
> > - * endpoint is <port>.
> > +/**
> > + * struct evtchn_send - EVTCHNOP_send
> > + *
> > + * Send an event to the remote end of the channel whose local endpoint
> > + * is <port>.
> >   */
> >  struct evtchn_send {
> > -    /* IN parameters. */
> > +    /** @port: IN parameter */
> >      evtchn_port_t port;
> >  };
> >  typedef struct evtchn_send evtchn_send_t;
> >  
> > -/*
> > +/**
> > + * struct evtchn_status - EVTCHNOP_status
> > + *
> >   * EVTCHNOP_status: Get the current status of the communication channel which
> >   * has an endpoint at <dom, port>.
> >   * NOTES:
> 
> Nit: I guess you meant to remove the "EVTCHNOP_status: " prefix from
> the original comment, like is done elsewhere?

Yes, good catch, I'll change it.

