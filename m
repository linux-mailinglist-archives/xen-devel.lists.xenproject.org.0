Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D753D23ED9F
	for <lists+xen-devel@lfdr.de>; Fri,  7 Aug 2020 15:01:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k41zi-0007Pb-1M; Fri, 07 Aug 2020 13:01:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ERlR=BR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k41zh-0007PS-2j
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2020 13:01:09 +0000
X-Inumbo-ID: f1ff6f57-1318-494e-a1e1-5306b0a4eb1c
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f1ff6f57-1318-494e-a1e1-5306b0a4eb1c;
 Fri, 07 Aug 2020 13:01:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 98DFCAC1C;
 Fri,  7 Aug 2020 13:01:25 +0000 (UTC)
Subject: Re: [PATCH 04/14] kernel-doc: public/event_channel.h
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.2008061605410.16004@sstabellini-ThinkPad-T480s>
 <20200806234933.16448-4-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <57b251fc-8997-48b8-693c-08e38d643fc3@suse.com>
Date: Fri, 7 Aug 2020 15:01:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200806234933.16448-4-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: julien@xen.org, wl@xen.org, andrew.cooper3@citrix.com,
 ian.jackson@eu.citrix.com, george.dunlap@citrix.com,
 xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07.08.2020 01:49, Stefano Stabellini wrote:
> @@ -137,65 +147,78 @@ typedef struct evtchn_bind_interdomain evtchn_bind_interdomain_t;
>   *     binding cannot be changed.
>   */
>  struct evtchn_bind_virq {
> -    /* IN parameters. */
> -    uint32_t virq; /* enum virq */
> +    /** @virq: IN parameter, enum virq */
> +    uint32_t virq;
> +    /** @vcpu: IN parameter */
>      uint32_t vcpu;
> -    /* OUT parameters. */
> +    /** @port: OUT parameter */
>      evtchn_port_t port;
>  };
>  typedef struct evtchn_bind_virq evtchn_bind_virq_t;
>  
> -/*
> - * EVTCHNOP_bind_pirq: Bind a local event channel to a real IRQ (PIRQ <irq>).
> +/**
> + * struct evtchn_bind_pirq - EVTCHNOP_bind_pirq
> + *
> + * Bind a local event channel to a real IRQ (PIRQ <irq>).
>   * NOTES:
>   *  1. A physical IRQ may be bound to at most one event channel per domain.
>   *  2. Only a sufficiently-privileged domain may bind to a physical IRQ.
>   */
>  struct evtchn_bind_pirq {
> -    /* IN parameters. */
> +    /** @pirq: IN parameter */
>      uint32_t pirq;
> +    /** @flags: IN parameter,  BIND_PIRQ__* */
>  #define BIND_PIRQ__WILL_SHARE 1
> -    uint32_t flags; /* BIND_PIRQ__* */
> -    /* OUT parameters. */
> +    uint32_t flags;
> +    /** @port: OUT parameter */
>      evtchn_port_t port;
>  };
>  typedef struct evtchn_bind_pirq evtchn_bind_pirq_t;
>  
> -/*
> - * EVTCHNOP_bind_ipi: Bind a local event channel to receive events.
> +/**
> + * struct struct evtchn_bind_ipi - EVTCHNOP_bind_ipi
> + *
> + * Bind a local event channel to receive events.
>   * NOTES:
>   *  1. The allocated event channel is bound to the specified vcpu. The binding
>   *     may not be changed.
>   */
>  struct evtchn_bind_ipi {
> +    /** @vcpu: IN parameter */
>      uint32_t vcpu;
> -    /* OUT parameters. */
> +    /** @port: OUT parameter */
>      evtchn_port_t port;
>  };
>  typedef struct evtchn_bind_ipi evtchn_bind_ipi_t;
>  
> -/*
> - * EVTCHNOP_close: Close a local event channel <port>. If the channel is
> - * interdomain then the remote end is placed in the unbound state
> +/**
> + * struct evtchn_close - EVTCHNOP_close
> + *
> + * Close a local event channel <port>. If the channel is interdomain
> + * then the remote end is placed in the unbound state
>   * (EVTCHNSTAT_unbound), awaiting a new connection.
>   */
>  struct evtchn_close {
> -    /* IN parameters. */
> +    /** @port: IN parameter */
>      evtchn_port_t port;
>  };
>  typedef struct evtchn_close evtchn_close_t;
>  
> -/*
> - * EVTCHNOP_send: Send an event to the remote end of the channel whose local
> - * endpoint is <port>.
> +/**
> + * struct evtchn_send - EVTCHNOP_send
> + *
> + * Send an event to the remote end of the channel whose local endpoint
> + * is <port>.
>   */
>  struct evtchn_send {
> -    /* IN parameters. */
> +    /** @port: IN parameter */
>      evtchn_port_t port;
>  };
>  typedef struct evtchn_send evtchn_send_t;
>  
> -/*
> +/**
> + * struct evtchn_status - EVTCHNOP_status
> + *
>   * EVTCHNOP_status: Get the current status of the communication channel which
>   * has an endpoint at <dom, port>.
>   * NOTES:

Nit: I guess you meant to remove the "EVTCHNOP_status: " prefix from
the original comment, like is done elsewhere?

Jan

