Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84177417BD3
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 21:35:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195600.348369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTqxG-0000RL-KJ; Fri, 24 Sep 2021 19:33:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195600.348369; Fri, 24 Sep 2021 19:33:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTqxG-0000Om-Gn; Fri, 24 Sep 2021 19:33:54 +0000
Received: by outflank-mailman (input) for mailman id 195600;
 Fri, 24 Sep 2021 19:33:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UhVx=OO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTqxF-0000Og-8F
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 19:33:53 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b54de261-7f0e-487f-8cea-2c8eee6516b0;
 Fri, 24 Sep 2021 19:33:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1E35661164;
 Fri, 24 Sep 2021 19:33:51 +0000 (UTC)
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
X-Inumbo-ID: b54de261-7f0e-487f-8cea-2c8eee6516b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632512031;
	bh=3ikA21jUfX+27vnyX9raytkHozwFnL1Vzbqobe6Vmvg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HSZNcDrcACykuSPV9IpsIPnvlFgAPUipXZ+BrtzpIuFEaoe2mQjKb8abORy/k9XUW
	 OrOCUkuHJwcUYkQo0Nu4O7rgX1rKgCbS810G88TioUjxF33OFxaK8ndEuak8ywAUuY
	 v5EkyPJRZ+OPynH79QWgjseZ8sdwSqb+eZIxdMchcYWLdmo7RP4pyPY1N2v2LfNi4k
	 s52rXfJCT7LyHb8ls0hnRTzYXYGc2ilSLRz/+AmcKpF+mURIwawqOzy5in8bHpm86Z
	 ZfY/sYSRgwfQpmkagqSXkRsynJGt8OHhVL8LOAJdAjGCwOktnI6kwvO1WQUdPuZEvC
	 JIdHJAwErevWw==
Date: Fri, 24 Sep 2021 12:33:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Chen <wei.chen@arm.com>, 
    xen-devel@lists.xenproject.org, julien@xen.org, Bertrand.Marquis@arm.com, 
    andrew.cooper3@citrix.com, roger.pau@citrix.com, wl@xen.org
Subject: Re: [PATCH 25/37] xen/arm: implement bad_srat for Arm NUMA
 initialization
In-Reply-To: <d6973324-52e2-1c78-4f57-929d3af07a80@suse.com>
Message-ID: <alpine.DEB.2.21.2109241231460.17979@sstabellini-ThinkPad-T480s>
References: <20210923120236.3692135-1-wei.chen@arm.com> <20210923120236.3692135-26-wei.chen@arm.com> <alpine.DEB.2.21.2109231906570.17979@sstabellini-ThinkPad-T480s> <d6973324-52e2-1c78-4f57-929d3af07a80@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 24 Sep 2021, Jan Beulich wrote:
> On 24.09.2021 04:09, Stefano Stabellini wrote:
> > On Thu, 23 Sep 2021, Wei Chen wrote:
> >> NUMA initialization will parse information from firmware provided
> >> static resource affinity table (ACPI SRAT or DTB). bad_srat if a
> >> function that will be used when initialization code encounters
> >> some unexcepted errors.
> >>
> >> In this patch, we introduce Arm version bad_srat for NUMA common
> >> initialization code to invoke it.
> >>
> >> Signed-off-by: Wei Chen <wei.chen@arm.com>
> >> ---
> >>  xen/arch/arm/numa.c | 7 +++++++
> >>  1 file changed, 7 insertions(+)
> >>
> >> diff --git a/xen/arch/arm/numa.c b/xen/arch/arm/numa.c
> >> index 3755b01ef4..5209d3de4d 100644
> >> --- a/xen/arch/arm/numa.c
> >> +++ b/xen/arch/arm/numa.c
> >> @@ -18,6 +18,7 @@
> >>   *
> >>   */
> >>  #include <xen/init.h>
> >> +#include <xen/nodemask.h>
> >>  #include <xen/numa.h>
> >>  
> >>  static uint8_t __read_mostly
> >> @@ -25,6 +26,12 @@ node_distance_map[MAX_NUMNODES][MAX_NUMNODES] = {
> >>      { 0 }
> >>  };
> >>  
> >> +__init void bad_srat(void)
> >> +{
> >> +    printk(KERN_ERR "NUMA: Firmware SRAT table not used.\n");
> >> +    fw_numa = -1;
> >> +}
> > 
> > I realize that the series keeps the "srat" terminology everywhere on DT
> > too. I wonder if it is worth replacing srat with something like
> > "numa_distance" everywhere as appropriate. I am adding the x86
> > maintainers for an opinion.
> > 
> > If you guys prefer to keep srat (if nothing else, it is concise), I am
> > also OK with keeping srat although it is not technically accurate.
> 
> I think we want to tell apart both things: Where we truly talk about
> the firmware's SRAT table, keeping that name is fine. But I suppose
> there no "Firmware SRAT table" (as in the log message above) when
> using DT?

No. FYI this is the DT binding:
https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/numa.txt

The interesting bit is the "distance-map"


> If so, at the very least in log messages SRAT shouldn't be
> mentioned. Perhaps even functions serving both an ACPI and a DT
> purpose would better not use "srat" in their names (but I'm not as
> fussed about it there.)

I agree 100% with what you wrote.

