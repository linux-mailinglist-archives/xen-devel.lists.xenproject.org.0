Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B92EC1F9EB1
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 19:40:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkt5E-0003i3-7J; Mon, 15 Jun 2020 17:39:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7yVv=74=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jkt5D-0003hx-4G
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 17:39:43 +0000
X-Inumbo-ID: 319d1e34-af2f-11ea-b823-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 319d1e34-af2f-11ea-b823-12813bfff9fa;
 Mon, 15 Jun 2020 17:39:42 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: LIxLEXBTV2Py4kYVPLwlph6n2kLbGFZEteyCwyNN9O8yAhLZX05mF3koPnpXXVTVQ9QToYHwQL
 aiK8Y/HrwR/F9GgUQWapTo50R8Qo2yTKDS8M4m1NPAsp+TsDWFhbP0N2LnbvhH3hbl0/3JmruW
 CEjVhy5g4L6c0Y7XkvpnqTzJnq1wJXB0qGAe+LxTV/cZmP4Vu4S1mfiBefrboiShDP9KOk8nQY
 6imTynHUbUTmZeuE1FsPhTtu1GxRRlNKxgP6OjA/Db8yaY3VGKKIViHzH+zvdEFQt+VS319SXL
 hbg=
X-SBRS: 2.7
X-MesageID: 20386887
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,515,1583211600"; d="scan'208";a="20386887"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24295.45650.388910.186169@mariner.uk.xensource.com>
Date: Mon, 15 Jun 2020 18:39:30 +0100
To: "paul@xen.org" <paul@xen.org>
Subject: RE: [PATCH] libxl: tooling expects wrong errno
In-Reply-To: <003401d64337$f43c1990$dcb44cb0$@xen.org>
References: <ebdcefb5ab4b9053dee7c090b4e6562e597b3474.1592151144.git.gorbak25@gmail.com>
 <24295.36070.945693.791220@mariner.uk.xensource.com>
 <20200615155646.GI735@Air-de-Roger>
 <24295.41945.883230.966002@mariner.uk.xensource.com>
 <003401d64337$f43c1990$dcb44cb0$@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: Kevin Tian <kevin.tian@intel.com>, 'Wei Liu' <wl@xen.org>,
 "jakub@bartmin.ski" <jakub@bartmin.ski>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>,
 'Grzegorz Uriasz' <gorbak25@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>,
 "j.nowak26@student.uw.edu.pl" <j.nowak26@student.uw.edu.pl>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "contact@puzio.waw.pl" <contact@puzio.waw.pl>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Paul Durrant writes ("RE: [PATCH] libxl: tooling expects wrong errno"):
> > -----Original Message-----
> > From: Ian Jackson <ian.jackson@citrix.com>
> > Thanks for the analysis.  So:
> > 
> > Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
> > 
> > This would seem to be a backport candidate.  AFAICT check has been
> > there, looking for ENOSYS, since this code was introduced in
> >    826eb17271d3c647516d9944c47b0779afedea25
> >    libxl: suppress device assignment to HVM guest when there is no IOMMU
> > ?
> > 
> > But that commit has a Tested-by.  Maybe Xen changed its error return
> > at some point ?
> > 
> 
> Yes, it happened in 71e617a6b8f69849c70eda1b3c58f1ff6b244e5a
> use is_iommu_enabled() where appropriate...

So,

Backport: 4.13

Thanks!

Ian.

