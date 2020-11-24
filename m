Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C532C24CA
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 12:43:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.35781.67433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khWie-00067u-Oo; Tue, 24 Nov 2020 11:42:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35781.67433; Tue, 24 Nov 2020 11:42:48 +0000
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
	id 1khWie-00067V-LR; Tue, 24 Nov 2020 11:42:48 +0000
Received: by outflank-mailman (input) for mailman id 35781;
 Tue, 24 Nov 2020 11:42:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nkWz=E6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khWid-00067N-4b
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 11:42:47 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 06790d6d-c3cb-4afa-8d9b-587322f914ce;
 Tue, 24 Nov 2020 11:42:46 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5C784AD21;
 Tue, 24 Nov 2020 11:42:45 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nkWz=E6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khWid-00067N-4b
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 11:42:47 +0000
X-Inumbo-ID: 06790d6d-c3cb-4afa-8d9b-587322f914ce
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 06790d6d-c3cb-4afa-8d9b-587322f914ce;
	Tue, 24 Nov 2020 11:42:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606218165; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KjFa8dYabyDR+EBZEGf5cxuhNmEhJOb9hv+kHZNMPYg=;
	b=GRRYmqds40yt+rDmIpdOTFVjyUom70zNjOvH9hS9XlnXJ9u06m9h2bC5IF5KKsQBl8x+4+
	Sj485EBHmWLgyh8V1qPpt+2XOYE+H3sDuTju/P1ekZTLnCdQW8fAx2iQr2DqNR4vlGDcdy
	++/I1a+IBljigMD4Ii3pTD4F/COQOcI=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 5C784AD21;
	Tue, 24 Nov 2020 11:42:45 +0000 (UTC)
Subject: Re: [PATCH v7 2/3] xen/events: modify struct evtchn layout
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201124070106.26854-1-jgross@suse.com>
 <20201124070106.26854-3-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <440bced0-97ec-33c4-f6fa-01850777e5c2@suse.com>
Date: Tue, 24 Nov 2020 12:42:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201124070106.26854-3-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 24.11.2020 08:01, Juergen Gross wrote:
> In order to avoid latent races when updating an event channel put
> xen_consumer and pending fields in different bytes.

I think there's a little more to be said here as to what the
actual risk is, as the two fields are - afaict - at present
fine the way they're declared.

> @@ -94,9 +93,10 @@ struct evtchn
>  #define ECS_VIRQ         5 /* Channel is bound to a virtual IRQ line.        */
>  #define ECS_IPI          6 /* Channel is bound to a virtual IPI line.        */
>      u8  state;             /* ECS_* */
> -    u8  xen_consumer:XEN_CONSUMER_BITS; /* Consumer in Xen if nonzero */

I see no reason to use a full byte for this one; in fact I
was considering whether it, state, and old_state couldn't
share storage (the latest when we run into space issues with
this struct). (In this context I'm also observing that
old_state could get away with just 2 bits, i.e. all three
fields would fit in a single byte.)

> -    u8  pending:1;
> -    u16 notify_vcpu_id;    /* VCPU for local delivery notification */
> +#ifndef NDEBUG
> +    u8  old_state;     /* State when taking lock in write mode. */
> +#endif
> +    u8  xen_consumer;  /* Consumer in Xen if nonzero */
>      u32 port;
>      union {
>          struct {
> @@ -113,11 +113,13 @@ struct evtchn
>          } pirq;        /* state == ECS_PIRQ */
>          u16 virq;      /* state == ECS_VIRQ */
>      } u;
> -    u8 priority;
> -#ifndef NDEBUG
> -    u8 old_state;      /* State when taking lock in write mode. */
> -#endif
> -    u32 fifo_lastq;    /* Data for fifo events identifying last queue. */
> +
> +    /* FIFO event channels only. */
> +    u8  pending;
> +    u8  priority;
> +    u16 notify_vcpu_id;    /* VCPU for local delivery notification */

This field definitely isn't FIFO-only.

Also for all fields you touch anyway, may I ask that you switch to
uint<N>_t or, in the case of "pending", bool?

Jan

