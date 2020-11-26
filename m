Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 731A62C56E0
	for <lists+xen-devel@lfdr.de>; Thu, 26 Nov 2020 15:17:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.38569.71324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiI4R-0002k0-Ay; Thu, 26 Nov 2020 14:16:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 38569.71324; Thu, 26 Nov 2020 14:16:27 +0000
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
	id 1kiI4R-0002jV-7U; Thu, 26 Nov 2020 14:16:27 +0000
Received: by outflank-mailman (input) for mailman id 38569;
 Thu, 26 Nov 2020 14:16:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=smDs=FA=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1kiI4P-0002jQ-F3
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 14:16:25 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8cb1f05b-ffe3-4645-ad21-a2b638b37f03;
 Thu, 26 Nov 2020 14:16:22 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id
 0AQEGDC3018777
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
 Thu, 26 Nov 2020 15:16:14 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
 id 9DF9F2E9CAC; Thu, 26 Nov 2020 15:16:08 +0100 (MET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=smDs=FA=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
	id 1kiI4P-0002jQ-F3
	for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 14:16:25 +0000
X-Inumbo-ID: 8cb1f05b-ffe3-4645-ad21-a2b638b37f03
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8cb1f05b-ffe3-4645-ad21-a2b638b37f03;
	Thu, 26 Nov 2020 14:16:22 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
	by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id 0AQEGDC3018777
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Thu, 26 Nov 2020 15:16:14 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
	id 9DF9F2E9CAC; Thu, 26 Nov 2020 15:16:08 +0100 (MET)
Date: Thu, 26 Nov 2020 15:16:08 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
Message-ID: <20201126141608.GA4123@antioche.eu.org>
References: <b3912e97-9684-fe97-1053-ad7168a19721@suse.com>
 <20201124122102.3igsriesou3vl6mu@Air-de-Roger>
 <20201124135948.GL2020@antioche.eu.org>
 <6d6a77cf-58de-4e4d-ed75-e9365be060b7@suse.com>
 <20201124142713.GM2020@antioche.eu.org>
 <e6a0fc84-e7ed-825c-5356-29b8a6359a2b@suse.com>
 <20201124150842.GN2020@antioche.eu.org>
 <20201124154917.l3jwa6w4ejumjuqw@Air-de-Roger>
 <20201124160914.GQ2020@antioche.eu.org>
 <20201126133444.r2oi24i3umh7shb3@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201126133444.r2oi24i3umh7shb3@Air-de-Roger>
X-Greylist: Sender succeeded STARTTLS authentication, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Thu, 26 Nov 2020 15:16:15 +0100 (MET)

On Thu, Nov 26, 2020 at 02:34:44PM +0100, Roger Pau Monné wrote:
> On Tue, Nov 24, 2020 at 05:09:14PM +0100, Manuel Bouyer wrote:
> > On Tue, Nov 24, 2020 at 04:49:17PM +0100, Roger Pau Monné wrote:
> > > Could you also give a try with ioapic_ack=new on the Xen command line?
> > 
> > With this I still have the interrupt issue, but Xen doesn't panic on 'i'.
> > http://www-soc.lip6.fr/~bouyer/xen-log8.txt
> 
> Sorry for the delay, I have yet another debug patch for you to try.
> Can you remove the ioapic_ack=new from the command line and rebuild
> the hypervisor with the provided patch applied and debug trace
> enabled? (`gmake -C xen menuconfig` and go into Debugging Options to
> find it).

menuconfig doens't build on NetBSD, I set CONFIG_DEBUG_TRACE=y in
.config. I guess it is enough ?

For the record, my boot commad line is now
menu=Boot Xen PVH:load /test console=com0 root=dk0 -vx; multiboot /xen-test.gz dom0_mem=1024M console=com2 com2=57600,8n1,,0 loglvl=all guest_loglvl=all gnttab_max_nr_frames=64 dom0=pvh iommu=debug dom0_vcpus_pin sync_console dom0_max_vcpus=1 watchdog=force iommu=no-intremap


> 
> Then once the system stalls use the 'T' debug key to dump the buffer.

Here it is. It seems to be stuck in an infinite loop, I hit the 'R' key
after several minutes
http://www-soc.lip6.fr/~bouyer/xen-log9.txt

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

