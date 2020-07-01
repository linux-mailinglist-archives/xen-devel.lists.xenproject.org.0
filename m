Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E2C2107B9
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jul 2020 11:11:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqYlL-0003sd-6Z; Wed, 01 Jul 2020 09:10:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eXJY=AM=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jqYlJ-0003sY-Qy
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2020 09:10:37 +0000
X-Inumbo-ID: b9a37574-bb7a-11ea-8496-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b9a37574-bb7a-11ea-8496-bc764e2007e4;
 Wed, 01 Jul 2020 09:10:37 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 11Kw2xoQRVL7WqilHuFkwhtyXZdyrzkrO9PEu8args1R1Vh7pOTeVnDou8nwpb16a6fhSiw3c9
 WlLn3YeMG5GgizWYT44ZurqCtoQRgSNZCsecYuEnkGcRItvKIJGrdGCJNwCv+zrk1+AefS3Usz
 PPlsClfpbO5yL3vDelgTzziBeRyHktAqeT1Rki/2XBulSPIzhVvBfGSTnN6BdiQ8J6bgllYFTk
 iyJCNuIL2cB4B7kES2t3hajJigArvcDNiswFiVu3ZMPW5wAAVFIJO9+zUHfba6QEuHQH7MnI3u
 nUc=
X-SBRS: 2.7
X-MesageID: 21712682
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,299,1589256000"; d="scan'208";a="21712682"
Date: Wed, 1 Jul 2020 10:10:31 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH] hvmloader: Fix reading ACPI PM1 CNT value
Message-ID: <20200701091031.GC2030@perard.uk.xensource.com>
References: <20200630170913.123646-1-anthony.perard@citrix.com>
 <20200701075257.GM735@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200701075257.GM735@Air-de-Roger>
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jul 01, 2020 at 09:52:57AM +0200, Roger Pau Monné wrote:
> On Tue, Jun 30, 2020 at 06:09:13PM +0100, Anthony PERARD wrote:
> > In order to get the CNT value from QEMU, we were supposed to read a
> > word, according to the implementation in QEMU. But it has been lax and
> > allowed to read a single byte. This has changed with commit
> > 5d971f9e6725 ("memory: Revert "memory: accept mismatching sizes in
> > memory_region_access_valid"") and result in hvmloader crashing on
> > the BUG_ON.
> 
> This is a bug on the QEMU side, the ACPI spec states: "Accesses to PM1
> control registers are accessed through byte and word accesses.".
> That's on section 4.8.3.2.1 PM1 Control Registers of my copy of the
> ACPI spec (6.2A).

I guess we can ignore this patch then, and I should write a patch for
QEMU instead.

> I'm fine with this if such bogus behavior has made it's way into a
> release version of QEMU, but it needs to state it's a workaround for a
> QEMU bug, not a bug in hvmloader.

It hasn't, but might.

> IMO the QEMU change should be reverted.

The change can't be reverted, it is to fix a CVE and isn't related to
ACPI. But we can fix the emulator.

> Thanks, Roger.

Thanks,

-- 
Anthony PERARD

