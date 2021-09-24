Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E9A417BDB
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 21:36:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195606.348381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTqzZ-00013R-2p; Fri, 24 Sep 2021 19:36:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195606.348381; Fri, 24 Sep 2021 19:36:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTqzY-000101-Ua; Fri, 24 Sep 2021 19:36:16 +0000
Received: by outflank-mailman (input) for mailman id 195606;
 Fri, 24 Sep 2021 19:36:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UhVx=OO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTqzX-0000zs-QT
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 19:36:15 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 53ad9104-a96a-4f1b-88a6-2de41d0346fe;
 Fri, 24 Sep 2021 19:36:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EC71560F9C;
 Fri, 24 Sep 2021 19:36:13 +0000 (UTC)
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
X-Inumbo-ID: 53ad9104-a96a-4f1b-88a6-2de41d0346fe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632512174;
	bh=pSTOQ28ChJIeFpsB9MN0yrrxhbt2p0i8GULiGjbziCI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gTbiAeySPcJxFw6eeyPjK9TlyD2rQG8VOpuLLrnn2u/zRVTHIXy7Dgap4DoGa0+em
	 GUacClFqlMWhkjeSeCdtrRT3snsUOiSaE4SGzrDEfgiWLgIA34oUW+pJsHeXPmKQ+y
	 F6gMRL6NAkAyc1pZ5EY5EpoJi+CkAo8tHRzU8zoHyAm5S45E7pcNFs5L4UILqX6lj1
	 y8SsvntPJLy98hCHuwBbaELmsRfrfx8ACPZ8WF97Sk2YymxzLGRS1C5tbVJ+4aE3yO
	 52yHhULrRn6ODJRn1cWFhZytVDB9NjZOb+KfRZTvdiEhZ6Kf9abJh8UbfseB5eIZ/z
	 bXdE0MqxRF+kw==
Date: Fri, 24 Sep 2021 12:36:13 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Chen <Wei.Chen@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "julien@xen.org" <julien@xen.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [PATCH 23/37] xen/arm: implement node distance helpers for Arm
In-Reply-To: <DB9PR08MB68571BAA4C8B07BB2061C8579EA49@DB9PR08MB6857.eurprd08.prod.outlook.com>
Message-ID: <alpine.DEB.2.21.2109241233590.17979@sstabellini-ThinkPad-T480s>
References: <20210923120236.3692135-1-wei.chen@arm.com> <20210923120236.3692135-24-wei.chen@arm.com> <alpine.DEB.2.21.2109231843530.17979@sstabellini-ThinkPad-T480s> <DB9PR08MB68571BAA4C8B07BB2061C8579EA49@DB9PR08MB6857.eurprd08.prod.outlook.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-59369348-1632512174=:17979"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-59369348-1632512174=:17979
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 24 Sep 2021, Wei Chen wrote:
> > -----Original Message-----
> > From: Stefano Stabellini <sstabellini@kernel.org>
> > Sent: 2021年9月24日 9:47
> > To: Wei Chen <Wei.Chen@arm.com>
> > Cc: xen-devel@lists.xenproject.org; sstabellini@kernel.org; julien@xen.org;
> > Bertrand Marquis <Bertrand.Marquis@arm.com>
> > Subject: Re: [PATCH 23/37] xen/arm: implement node distance helpers for
> > Arm
> > 
> > On Thu, 23 Sep 2021, Wei Chen wrote:
> > > We will parse NUMA nodes distances from device tree or ACPI
> > > table. So we need a matrix to record the distances between
> > > any two nodes we parsed. Accordingly, we provide this
> > > node_set_distance API for device tree or ACPI table parsers
> > > to set the distance for any two nodes in this patch.
> > > When NUMA initialization failed, __node_distance will return
> > > NUMA_REMOTE_DISTANCE, this will help us avoid doing rollback
> > > for distance maxtrix when NUMA initialization failed.
> > >
> > > Signed-off-by: Wei Chen <wei.chen@arm.com>
> > > ---
> > >  xen/arch/arm/Makefile      |  1 +
> > >  xen/arch/arm/numa.c        | 69 ++++++++++++++++++++++++++++++++++++++
> > >  xen/include/asm-arm/numa.h | 13 +++++++
> > >  3 files changed, 83 insertions(+)
> > >  create mode 100644 xen/arch/arm/numa.c
> > >
> > > diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> > > index ae4efbf76e..41ca311b6b 100644
> > > --- a/xen/arch/arm/Makefile
> > > +++ b/xen/arch/arm/Makefile
> > > @@ -35,6 +35,7 @@ obj-$(CONFIG_LIVEPATCH) += livepatch.o
> > >  obj-y += mem_access.o
> > >  obj-y += mm.o
> > >  obj-y += monitor.o
> > > +obj-$(CONFIG_NUMA) += numa.o
> > >  obj-y += p2m.o
> > >  obj-y += percpu.o
> > >  obj-y += platform.o
> > > diff --git a/xen/arch/arm/numa.c b/xen/arch/arm/numa.c
> > > new file mode 100644
> > > index 0000000000..3f08870d69
> > > --- /dev/null
> > > +++ b/xen/arch/arm/numa.c
> > > @@ -0,0 +1,69 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Arm Architecture support layer for NUMA.
> > > + *
> > > + * Copyright (C) 2021 Arm Ltd
> > > + *
> > > + * This program is free software; you can redistribute it and/or modify
> > > + * it under the terms of the GNU General Public License version 2 as
> > > + * published by the Free Software Foundation.
> > > + *
> > > + * This program is distributed in the hope that it will be useful,
> > > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > > + * GNU General Public License for more details.
> > > + *
> > > + * You should have received a copy of the GNU General Public License
> > > + * along with this program. If not, see <http://www.gnu.org/licenses/>.
> > > + *
> > > + */
> > > +#include <xen/init.h>
> > > +#include <xen/numa.h>
> > > +
> > > +static uint8_t __read_mostly
> > > +node_distance_map[MAX_NUMNODES][MAX_NUMNODES] = {
> > > +    { 0 }
> > > +};
> > > +
> > > +void __init numa_set_distance(nodeid_t from, nodeid_t to, uint32_t
> > distance)
> > > +{
> > > +    if ( from >= MAX_NUMNODES || to >= MAX_NUMNODES )
> > > +    {
> > > +        printk(KERN_WARNING
> > > +               "NUMA: invalid nodes: from=%"PRIu8" to=%"PRIu8"
> > MAX=%"PRIu8"\n",
> > > +               from, to, MAX_NUMNODES);
> > > +        return;
> > > +    }
> > > +
> > > +    /* NUMA defines 0xff as an unreachable node and 0-9 are undefined
> > */
> > > +    if ( distance >= NUMA_NO_DISTANCE ||
> > > +        (distance >= NUMA_DISTANCE_UDF_MIN &&
> > > +         distance <= NUMA_DISTANCE_UDF_MAX) ||
> > > +        (from == to && distance != NUMA_LOCAL_DISTANCE) )
> > > +    {
> > > +        printk(KERN_WARNING
> > > +               "NUMA: invalid distance: from=%"PRIu8" to=%"PRIu8"
> > distance=%"PRIu32"\n",
> > > +               from, to, distance);
> > > +        return;
> > > +    }
> > > +
> > > +    node_distance_map[from][to] = distance;
> > > +}
> > > +
> > > +uint8_t __node_distance(nodeid_t from, nodeid_t to)
> > > +{
> > > +    /* When NUMA is off, any distance will be treated as remote. */
> > > +    if ( srat_disabled() )
> > 
> > Given that this is ARM specific code and specific to ACPI, I don't think
> > we should have any call to something called "srat_disabled".
> > 
> > I suggest to either rename srat_disabled to numa_distance_disabled.
> > 
> > Other than that, this patch looks OK to me.
> > 
> 
> srat stands for static resource affinity table, I think dtb also can be
> treated as a static resource affinity table. So I keep SRAT in this patch
> and other patches. I have seen your comment in patch#25. Before x86 maintainers
> give any feedback, can we still keep srat here?

Jan and I replied in the other thread. I think that in warning messages
"SRAT" should not be mentioned when booting from DT. Ideally functions
names and variables should be renamed too when shared between ACPI and
DT but it is less critical, and it is fine if you don't do that in the
next version.
--8323329-59369348-1632512174=:17979--

