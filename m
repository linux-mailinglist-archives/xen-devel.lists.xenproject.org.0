Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 815832B98AF
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 17:58:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31201.61499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfnFm-0006Ru-Mb; Thu, 19 Nov 2020 16:57:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31201.61499; Thu, 19 Nov 2020 16:57:50 +0000
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
	id 1kfnFm-0006RV-It; Thu, 19 Nov 2020 16:57:50 +0000
Received: by outflank-mailman (input) for mailman id 31201;
 Thu, 19 Nov 2020 16:57:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kdOd=EZ=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1kfnFl-0006RQ-5U
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 16:57:49 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 77c26135-2719-43ff-8f84-d50e9cdcd87b;
 Thu, 19 Nov 2020 16:57:46 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id
 0AJGvdDk003498
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
 Thu, 19 Nov 2020 17:57:40 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
 id 437A42E9CA8; Thu, 19 Nov 2020 17:57:34 +0100 (MET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=kdOd=EZ=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
	id 1kfnFl-0006RQ-5U
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 16:57:49 +0000
X-Inumbo-ID: 77c26135-2719-43ff-8f84-d50e9cdcd87b
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 77c26135-2719-43ff-8f84-d50e9cdcd87b;
	Thu, 19 Nov 2020 16:57:46 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
	by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id 0AJGvdDk003498
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Thu, 19 Nov 2020 17:57:40 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
	id 437A42E9CA8; Thu, 19 Nov 2020 17:57:34 +0100 (MET)
Date: Thu, 19 Nov 2020 17:57:34 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
Message-ID: <20201119165734.GA4903@antioche.eu.org>
References: <20201117155807.a7jgmftnj6njg6oz@Air-de-Roger>
 <20201117164033.GB3093@antioche.eu.org>
 <20201118085738.wpnfmjagxjf6cofp@Air-de-Roger>
 <20201118092425.GC1085@antioche.eu.org>
 <20201118100025.ic7r3kfsbdnr6muz@Air-de-Roger>
 <20201118121403.GC3126@antioche.eu.org>
 <20201118143928.hvamuf7t7jycsrzb@Air-de-Roger>
 <bb2b6182-f3a6-61e5-ee70-90a65ae56435@suse.com>
 <20201119141915.igyb7djkw47rf2dt@Air-de-Roger>
 <20201119155718.GB4104@antioche.eu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201119155718.GB4104@antioche.eu.org>
X-Greylist: Sender succeeded STARTTLS authentication, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Thu, 19 Nov 2020 17:57:40 +0100 (MET)

On Thu, Nov 19, 2020 at 04:57:18PM +0100, Manuel Bouyer wrote:
> On Thu, Nov 19, 2020 at 03:19:15PM +0100, Roger Pau Monné wrote:
> > I've got two different debug patches for you to try. I'm attaching both
> > to this email but I think we should start with Jan's suggestion
> > (conditional_print.patch). That patch will only print extra messages
> > between the ioregsel 3 ... ioregsel f existing debug messages, you
> > will have to trigger this from NetBSD by using ioapic_dump_raw AFAICT.
> 
> thanks. I didn't see any change in behavior or XEN output with this
> patch (especially the vioapic_deliver string doesn't show up in the
> logs).

I tried forcing print to 1, and I still don't see "vioapic_deliver" on the
console. I changed the patch to:
#define vioapic_deliver(vioapic, irq) ({\ 
    if ( /* print && irq == 34 */ 1 ) \
        printk("%s:%d:%s: vioapic_deliver %d\n", __FILE__, __LINE__, __func__, i
rq); \
    _vioapic_deliver(vioapic, irq); })

and got:
[  13.8853432] ioapic2: pin2 0x0000a067 0x00000000^M
[  13.8853432] mfii0: cmd timeout ccb 0xffff9780023b7d60 status 0x40000008^M
(XEN) *** Serial input to Xen (type 'CTRL-a' three times to switch input)
(XEN) vioapic.c:511:vioapic_irq_positive_edge: vioapic_deliver 2
[  17.0001093] mfii0: cmd aborted ccb 0xffff9780023b7d60^M
(XEN) vioapic.c:511:vioapic_irq_positive_edge: vioapic_deliver 2
[  17.0217772] config_pending_decr: scsibus0 0^M
(XEN) vioapic.c:511:vioapic_irq_positive_edge: vioapic_deliver 2
[  17.(XEN) vioapic.c:511:vioapic_irq_positive_edge: vioapic_deliver 2
0417095] config_finalize 2185^M

So I guess that the interrupt delivery on XEN output is
vioapic.c:511

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

