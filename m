Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE1D2D807D
	for <lists+xen-devel@lfdr.de>; Fri, 11 Dec 2020 22:10:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.50900.89738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knpgX-0001Lf-3s; Fri, 11 Dec 2020 21:10:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 50900.89738; Fri, 11 Dec 2020 21:10:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knpgX-0001LJ-0g; Fri, 11 Dec 2020 21:10:41 +0000
Received: by outflank-mailman (input) for mailman id 50900;
 Fri, 11 Dec 2020 21:10:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YvCS=FP=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1knpgV-0001LD-4j
 for xen-devel@lists.xenproject.org; Fri, 11 Dec 2020 21:10:39 +0000
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 335dd8a5-c5d8-4720-bfbd-08f1e6b6cb1b;
 Fri, 11 Dec 2020 21:10:38 +0000 (UTC)
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
X-Inumbo-ID: 335dd8a5-c5d8-4720-bfbd-08f1e6b6cb1b
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1607721037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Mo2pAYuz+fdW3SgRq/XPKjojssrrAkt+Ucf5porPagA=;
	b=Jwq6ijv1GHVoieraIz9ydp2q4O6t/9GUc1eMMejV0w+8HMZFh2MudG98dd8dHkmBbtcY23
	rWBcv8bjhS74ccS+ED0Y2Ffx6+AE3ILOJic4uDyRWA5WOr4daMkBthSaLo/d+kCRNbQOx4
	/u1tQekXWSXK+tnBOy8SnybwPlOHVa58yu83Wz/vzB6Q7kN2A+/PUNns70l+Y5AN2H5xGf
	7iGU6k2Q0hE5HprbYz1Eu3KcHibChvhCzqBaZRj/WCHuBdSDA1VHcJDgDidwq1qqERl/TB
	s9Q8j4pTrdZ9IKgusBRQ2bAa+V0Lruumrto07aTzrOd30AjJDgps945/dnu+DQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1607721037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Mo2pAYuz+fdW3SgRq/XPKjojssrrAkt+Ucf5porPagA=;
	b=6/ko850V23KEuDS4nOrh7BVWq2Ew0gOANx75sF2cdzYDioAkFAZKWg5jsxMNTHTfHBIf/A
	ckLpFAtkm+PHw5Bw==
To: David Laight <David.Laight@ACULAB.COM>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Marc Zyngier <maz@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "intel-gfx\@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel\@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge
 Deller <deller@gmx.de>, afzal mohammed <afzal.mohd.ma@gmail.com>,
 "linux-parisc\@vger.kernel.org" <linux-parisc@vger.kernel.org>, Russell
 King <linux@armlinux.org.uk>, "linux-arm-kernel\@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Mark Rutland
 <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Christian Borntraeger <borntraeger@de.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, "linux-s390\@vger.kernel.org"
 <linux-s390@vger.kernel.org>, Pankaj Bharadiya
 <pankaj.laxminarayan.bharadiya@intel.com>, Chris Wilson
 <chris@chris-wilson.co.uk>, Wambui Karuga <wambui.karugax@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, "linux-gpio\@vger.kernel.org"
 <linux-gpio@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>, Jon Mason
 <jdmason@kudzu.us>, Dave Jiang <dave.jiang@intel.com>, Allen Hubbe
 <allenbh@gmail.com>, "linux-ntb\@googlegroups.com"
 <linux-ntb@googlegroups.com>, Lorenzo Pieralisi
 <lorenzo.pieralisi@arm.com>, Rob Herring <robh@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Michal Simek <michal.simek@xilinx.com>,
 "linux-pci\@vger.kernel.org" <linux-pci@vger.kernel.org>, Karthikeyan
 Mitran <m.karthikeyan@mobiveil.co.in>, Hou Zhiqiang
 <Zhiqiang.Hou@nxp.com>, Tariq Toukan <tariqt@nvidia.com>, "David S.
 Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 "netdev\@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-rdma\@vger.kernel.org" <linux-rdma@vger.kernel.org>, Saeed Mahameed
 <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel\@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Subject: RE: [patch 14/30] drm/i915/pmu: Replace open coded kstat_irqs() copy
In-Reply-To: <d6cbfa118490459bb0671394f00323fc@AcuMS.aculab.com>
References: <20201210192536.118432146@linutronix.de> <20201210194043.957046529@linutronix.de> <ad05af1a-5463-2a80-0887-7629721d6863@linux.intel.com> <87y2i4h54i.fsf@nanos.tec.linutronix.de> <d6cbfa118490459bb0671394f00323fc@AcuMS.aculab.com>
Date: Fri, 11 Dec 2020 22:10:36 +0100
Message-ID: <87eejwgib7.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Dec 11 2020 at 14:19, David Laight wrote:
> From: Thomas Gleixner
>> You can't catch that. If this really becomes an issue you need a
>> sequence counter around it.
>
> Or just two copies of the high word.
> Provided the accesses are sequenced:
> writer:
> 	load high:low
> 	add small_value,high:low
> 	store high
> 	store low
> 	store high_copy
> reader:
> 	load high_copy
> 	load low
> 	load high
> 	if (high != high_copy)
> 		low = 0;

And low = 0 is solving what? You need to loop back and retry until it's
consistent and then it's nothing else than an open coded sequence count.

Thanks,

        tglx

