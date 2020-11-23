Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 687C32C0D87
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 15:32:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34495.65606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khCtG-0000SY-1j; Mon, 23 Nov 2020 14:32:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34495.65606; Mon, 23 Nov 2020 14:32:26 +0000
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
	id 1khCtF-0000S7-Uk; Mon, 23 Nov 2020 14:32:25 +0000
Received: by outflank-mailman (input) for mailman id 34495;
 Mon, 23 Nov 2020 14:32:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MzqB=E5=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1khCtE-0000Ro-0L
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 14:32:24 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fa94b267-4d49-45a0-8355-46e92fb224d1;
 Mon, 23 Nov 2020 14:32:20 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id
 0ANEVtj7027034
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
 Mon, 23 Nov 2020 15:31:56 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
 id 81F5F2E9CAC; Mon, 23 Nov 2020 15:31:50 +0100 (MET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MzqB=E5=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
	id 1khCtE-0000Ro-0L
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 14:32:24 +0000
X-Inumbo-ID: fa94b267-4d49-45a0-8355-46e92fb224d1
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id fa94b267-4d49-45a0-8355-46e92fb224d1;
	Mon, 23 Nov 2020 14:32:20 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
	by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id 0ANEVtj7027034
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Mon, 23 Nov 2020 15:31:56 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
	id 81F5F2E9CAC; Mon, 23 Nov 2020 15:31:50 +0100 (MET)
Date: Mon, 23 Nov 2020 15:31:50 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
Message-ID: <20201123143150.GG2520@antioche.eu.org>
References: <1a50e1e2-b69c-afd6-a179-316231512004@suse.com>
 <20201120082855.5z4cibcd5djlwmgp@Air-de-Roger>
 <20201120085249.GA1508@antioche.eu.org>
 <97f371a9-00fe-33fe-8923-c247f44f9af6@suse.com>
 <20201120092754.GH1508@antioche.eu.org>
 <20904a6a-ac64-755d-d228-4c49faf66fb5@suse.com>
 <20201120103824.GJ1508@antioche.eu.org>
 <20201123095713.orfpg72r73m7f46n@Air-de-Roger>
 <20201123113241.GE2520@antioche.eu.org>
 <20201123125112.q3zqb4e5nk6jg4hw@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201123125112.q3zqb4e5nk6jg4hw@Air-de-Roger>
X-Greylist: Sender succeeded STARTTLS authentication, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Mon, 23 Nov 2020 15:31:57 +0100 (MET)

On Mon, Nov 23, 2020 at 01:51:12PM +0100, Roger Pau Monné wrote:
> Hm, yes, it's quite weird. Do you know whether a NetBSD kernel can be
> multibooted from pxelinux with Xen? I would like to see if I can
> reproduce this myself.

Yes, if Xen+linux can boot, Xen+netbsd should boot too.
In a previous mail I wrote:
In case it helps, I put by Xen and netbsd kernels at
http://www-soc.lip6.fr/~bouyer/netbsd-dom0-pvh/
I boot it from the NetBSD boot loader with:
menu=Boot Xen PVH:load /netbsd-test console=com0 root=dk0 -vx; multiboot /xen-te
st.gz dom0_mem=1024M console=com2 com2=57600,8n1 loglvl=all guest_loglvl=all gnt
tab_max_nr_frames=64 dom0=pvh iommu=debug
I guess with grub this would be
kernel /xen-test.gz dom0_mem=1024M console=com2 com2=57600,8n1 loglvl=all guest_
loglvl=all gnttab_max_nr_frames=64 dom0=pvh iommu=debug
module /netbsd-test console=com0 root=dk0 -vx

(yes, com2 for xen and com0 for netbsd, that's not a bug :)
You can enter the NetBSD debugger with
+++++
you can then enter commands, lile
sh ev /i
to see the interrupt counters

> 
> I have the following patch also which will print a warning message
> when GSI 34 is injected from hardware or when Xen performs an EOI
> (either from a time out or when reacting to a guest one). I would
> expect at least the interrupt injection one to trigger together with
> the existing message.

It's quite verbose. I put the full log at
http://www-soc.lip6.fr/~bouyer/xen-log4.txt

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

