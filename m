Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDE1230536
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 10:21:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0KrK-0005GZ-CX; Tue, 28 Jul 2020 08:21:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZWt7=BH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k0KrJ-0005GU-Hl
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 08:21:13 +0000
X-Inumbo-ID: 4baff204-d0ab-11ea-8b19-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4baff204-d0ab-11ea-8b19-bc764e2007e4;
 Tue, 28 Jul 2020 08:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595924472;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=aZP3t9TBueTxsgu8tPwdePqIEMOiI1XOwqtOVR0zxI8=;
 b=DTnn0z0CJyesWKzCqYkrow1RZ0BLD7YSw4umNxi1LOkxBDgN9BnWDXlh
 igrp7FR5QJUi2QZNwYr9Qhfv2MxIxVF97x9/rcUw9u5WhMTKgxSlYRTzT
 vR6vzh0XWP5JoA37TsKVCUiMVC2eqgaPDvj/MMLgC7aWSKn5K1wF8LoI8 Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 204lIH4aEN1DMKu9W6chZFoKKFrr+fR5AGV6o8C0mfa5uMecM6x6MG50KFcF71MwTE5hygykD7
 QXILzuNXpybRnAMRSul4OdYTVUthcSE2nqxYtD9bFuB8RkJ1ts6z8UcfTseXSpVZVa3iBzujoe
 ZkiUhcvTynp9KOt4VzNyZWasBrGtnIUWQlKPrxAF+acPoeWCF+9gPkRUQbEObmNRpFX0frulFQ
 VJG9IkSoLQg6fljKJQnqb+Rvf3af4wmEb2h4VcJNwmOxKYyY3eCBmnZJ3bp2aUT94hRcsvtwHq
 aCE=
X-SBRS: 2.7
X-MesageID: 23660252
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,405,1589256000"; d="scan'208";a="23660252"
Date: Tue, 28 Jul 2020 10:21:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Rahul Singh <Rahul.Singh@arm.com>
Subject: Re: [RFC PATCH v1 1/4] arm/pci: PCI setup and PCI host bridge
 discovery within XEN on ARM.
Message-ID: <20200728082100.GV7191@Air-de-Roger>
References: <cover.1595511416.git.rahul.singh@arm.com>
 <64ebd4ef614b36a5844c52426a4a6a4a23b1f087.1595511416.git.rahul.singh@arm.com>
 <20200724144404.GJ7191@Air-de-Roger>
 <567A8D4D-9D7F-4D53-B740-6095F5512026@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <567A8D4D-9D7F-4D53-B740-6095F5512026@arm.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jul 28, 2020 at 08:06:17AM +0000, Rahul Singh wrote:
> 
> 
> > On 24 Jul 2020, at 3:44 pm, Roger Pau Monné <roger.pau@citrix.com> wrote:
> > 
> > On Thu, Jul 23, 2020 at 04:40:21PM +0100, Rahul Singh wrote:
> >> +
> >> +    struct pci_host_bridge *bridge = pci_find_host_bridge(sbdf.seg, sbdf.bus);
> >> +
> >> +    if ( unlikely(!bridge) )
> >> +    {
> >> +        printk(XENLOG_ERR "Unable to find bridge for "PRI_pci"\n",
> >> +                sbdf.seg, sbdf.bus, sbdf.dev, sbdf.fn);
> > 
> > I had a patch to add a custom modifier to out printf format in
> > order to handle pci_sbdf_t natively:
> > 
> > https://patchew.org/Xen/20190822065132.48200-1-roger.pau@citrix.com/
> > 
> > It missed maintainers Acks and was never committed. Since you are
> > doing a bunch of work here, and likely adding a lot of SBDF related
> > prints, feel free to import the modifier (%pp) and use in your code
> > (do not attempt to switch existing users, or it's likely to get
> > stuck again).
> 
> Ok Will integrate that patch once submitted.

I've posted an updated version to the list yesterday:

https://lore.kernel.org/xen-devel/20200727103136.53343-1-roger.pau@citrix.com/

> >> diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
> >> index de13359f65..94fd00360a 100644
> >> --- a/xen/include/asm-arm/pci.h
> >> +++ b/xen/include/asm-arm/pci.h
> >> @@ -1,7 +1,98 @@
> >> -#ifndef __X86_PCI_H__
> >> -#define __X86_PCI_H__
> >> +/*
> >> + * Copyright (C) 2020 Arm Ltd.
> >> + *
> >> + * Based on Linux drivers/pci/ecam.c
> >> + * Copyright 2016 Broadcom.
> >> + *
> >> + * Based on Linux drivers/pci/controller/pci-host-common.c
> >> + * Based on Linux drivers/pci/controller/pci-host-generic.c
> >> + * Copyright (C) 2014 ARM Limited Will Deacon <will.deacon@arm.com>
> >> + *
> >> + * This program is free software; you can redistribute it and/or modify
> >> + * it under the terms of the GNU General Public License version 2 as
> >> + * published by the Free Software Foundation.
> >> + *
> >> + * This program is distributed in the hope that it will be useful,
> >> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> >> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> >> + * GNU General Public License for more details.
> >> + *
> >> + * You should have received a copy of the GNU General Public License
> >> + * along with this program.  If not, see <http://secure-web.cisco.com/1YIShdE6aU0WIMsRjhIYYGdRo_H_wyOVeLqk0ITHI7i_FMIXuMEmV9Y6lR76qCBB4XHss0ba_WMfQa0mLGD37bM1S3AFMBVC1WUEF0LmbURPWld2kU2zuyOamUxqnYwy4ZAv4N2EUJy7HCgDYn2s183YCQ-5YBc98vH8TO-tfBgEShkKVzAm23AgzIqikuKN_BIhcQhAbsjypr9ffeNZDsSX2jC8ClqegEPXFsCWJldrASGgWoR16rMjI-INfPNy55m9nGP5UmHIYWBmTpnHLjXtqCkruENixh20vPWIUROhcjjtzVBrR8d-Q5HnJy0hSR97WdlUSAryfxeH-8VxcPw/http%3A%2F%2Fwww.gnu.org%2Flicenses%2F>.
> >> + */
> >> 
> >> +#ifndef __ARM_PCI_H__
> >> +#define __ARM_PCI_H__
> >> +
> >> +#include <xen/pci.h>
> >> +#include <xen/device_tree.h>
> >> +#include <asm/device.h>
> >> +
> >> +#ifdef CONFIG_ARM_PCI
> >> +
> >> +/* Arch pci dev struct */
> >> struct arch_pci_dev {
> >> +    struct device dev;
> >> +};
> > 
> > This seems to be completely unused?
> 
> Will be using going forward.

Please introduce it when it's required then.

Thanks, Roger.

