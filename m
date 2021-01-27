Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E69305753
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 10:50:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75892.136814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4hSf-0008Bm-4s; Wed, 27 Jan 2021 09:50:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75892.136814; Wed, 27 Jan 2021 09:50:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4hSf-00089k-1J; Wed, 27 Jan 2021 09:50:05 +0000
Received: by outflank-mailman (input) for mailman id 75892;
 Wed, 27 Jan 2021 09:50:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cOO2=G6=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1l4hSd-0007tr-3A
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 09:50:03 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 66619810-c66c-4afc-9933-580c06353fa2;
 Wed, 27 Jan 2021 09:50:01 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 10R9nvYV012604;
 Wed, 27 Jan 2021 10:49:57 +0100 (CET)
Received: from armandeche.soc.lip6.fr (armandeche [132.227.63.133])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 10R9nvoN029157;
 Wed, 27 Jan 2021 10:49:57 +0100 (MET)
Received: by armandeche.soc.lip6.fr (Postfix, from userid 20331)
 id B75537218; Wed, 27 Jan 2021 10:49:56 +0100 (MET)
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
X-Inumbo-ID: 66619810-c66c-4afc-9933-580c06353fa2
Date: Wed, 27 Jan 2021 10:49:56 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
        Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] libs/light: pass some infos to qemu
Message-ID: <20210127094956.GC22565@mail.soc.lip6.fr>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
 <20210112181242.1570-17-bouyer@antioche.eu.org>
 <20210116101606.sogfpgzg7upunua7@Air-de-Roger>
 <20210116112502.GA1133@antioche.eu.org>
 <20210118083642.deozyeo5o6yziba7@Air-de-Roger>
 <20210126224223.GA3740@antioche.eu.org>
 <20210127090140.qaqkvtbdkkasdd55@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210127090140.qaqkvtbdkkasdd55@Air-de-Roger>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 27 Jan 2021 10:49:57 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

On Wed, Jan 27, 2021 at 10:06:43AM +0100, Roger Pau Monné wrote:
> On Tue, Jan 26, 2021 at 11:42:23PM +0100, Manuel Bouyer wrote:
> > On Mon, Jan 18, 2021 at 09:36:42AM +0100, Roger Pau Monné wrote:
> > > [...]
> > > 
> > > Note also that there are networking modes that don't use a bridge, so
> > > you could likely end up with nics[i].bridge == NULL?
> > 
> > I couldn't cause this to happen. If no bridge is specified in the
> > domU's config file, qemu-ifup is called with xenbr0 as bridge name.
> > 
> > I tried this:
> > vif = [ 'mac=00:16:3e:00:10:54, gatewaydev=wm0 type=ioemu, model=e1000' ]
> 
> Right, that's because libxl__device_nic_setdefault will set the bridge
> field to xenbr0 if empty.
> 
> I'm not opposed to this behavior, seeing as we don't have much other
> option I'm afraid. I guess we could open the tap interface in libxl
> and pass it to QEMU, so that libxl can call the hotplug script knowing
> the tap interface name, but that seems non-trivial.
> 
> IMO if we go that route it needs to be documented that NetBSD only
> supports bridged mode for emulated HVM network interfaces for the time
> being.

that's not quite true. As long as you have the domain ID in the qemu-if script,
you can query parameters from the store and do whatever you want here
(for example I use it to setup firewall rules). 

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

