Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A661FA88B
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 08:12:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jl4oV-0001RN-B3; Tue, 16 Jun 2020 06:11:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LuhO=75=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jl4oT-0001RI-Qe
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 06:11:13 +0000
X-Inumbo-ID: 2da20916-af98-11ea-8496-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2da20916-af98-11ea-8496-bc764e2007e4;
 Tue, 16 Jun 2020 06:11:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B745AAC85;
 Tue, 16 Jun 2020 06:11:15 +0000 (UTC)
Subject: Re: [PATCH for-4.14 v2 1/2] x86/passthrough: do not assert edge
 triggered GSIs for PVH dom0
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200610142923.9074-1-roger.pau@citrix.com>
 <20200610142923.9074-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b3bd8641-4cf9-d432-145a-d19bb852ffdc@suse.com>
Date: Tue, 16 Jun 2020 08:11:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200610142923.9074-2-roger.pau@citrix.com>
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
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 10.06.2020 16:29, Roger Pau Monne wrote:
> @@ -186,9 +187,10 @@ void hvm_gsi_assert(struct domain *d, unsigned int gsi)
>       * to know if the GSI is pending or not.
>       */
>      spin_lock(&d->arch.hvm.irq_lock);
> -    if ( !hvm_irq->gsi_assert_count[gsi] )
> +    if ( trig == VIOAPIC_EDGE_TRIG || !hvm_irq->gsi_assert_count[gsi] )
>      {
> -        hvm_irq->gsi_assert_count[gsi] = 1;
> +        if ( trig == VIOAPIC_LEVEL_TRIG )
> +            hvm_irq->gsi_assert_count[gsi] = 1;

Btw, along the lines of how you do things here, I think ...

> @@ -196,11 +198,12 @@ void hvm_gsi_assert(struct domain *d, unsigned int gsi)
>  
>  void hvm_gsi_deassert(struct domain *d, unsigned int gsi)
>  {
> +    int trig = vioapic_get_trigger_mode(d, gsi);
>      struct hvm_irq *hvm_irq = hvm_domain_irq(d);
>  
> -    if ( gsi >= hvm_irq->nr_gsis )
> +    if ( trig <= VIOAPIC_EDGE_TRIG || gsi >= hvm_irq->nr_gsis )

... this would better have been "trig != VIOAPIC_LEVEL_TRIG", to
avoid the code being dependent upon the actual values of both
VIOAPIC_*_TRIG constants.

Jan

> -        ASSERT_UNREACHABLE();
> +        ASSERT(trig == VIOAPIC_EDGE_TRIG && gsi < hvm_irq->nr_gsis);
>          return;
>      }
>  
> 


