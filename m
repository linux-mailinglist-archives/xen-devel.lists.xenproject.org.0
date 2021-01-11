Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E83632F0FCD
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 11:14:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64741.114426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyuDi-0006I6-1n; Mon, 11 Jan 2021 10:14:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64741.114426; Mon, 11 Jan 2021 10:14:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyuDh-0006Hk-Uu; Mon, 11 Jan 2021 10:14:41 +0000
Received: by outflank-mailman (input) for mailman id 64741;
 Mon, 11 Jan 2021 10:14:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AoMp=GO=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1kyuDh-0006Ha-36
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 10:14:41 +0000
Received: from galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 83cd1273-2a5b-45e9-a0cd-eabceaab5909;
 Mon, 11 Jan 2021 10:14:39 +0000 (UTC)
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
X-Inumbo-ID: 83cd1273-2a5b-45e9-a0cd-eabceaab5909
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1610360078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vdITQROn2Urg2SWnxxpWECg8/2piMq1rysKQi+Js6AM=;
	b=UnYkeRyOrRU1KtT5e+L+fQ3h1X+pI6IQmvvPVQCyBzb6fOAslMZh9kmf6riX6Uc0jR5HAW
	kLM9jzvLqGc+Imjy/0I2rAsMH2VpuQIdJ98CwfEhcoTYCCXiQ/XwFpRt6Jep7zrPxwT0va
	Xwof1xtTH5Z/PeoiWTuI7XI6GZ2R5aGzpohXNnayNbUAXzj5+Rf7t2lNRSQCuUkrunBvvh
	E6YQGrr8aPBg88a1jm3tkQeNaO9yiXQdYW2cQM+bbmj0FEDrh39+sh5VynpFZhESsKImAx
	DwV8ajINKrlorxI1UlTNWgwAXJMXRe809J7/lTBl2XxW6BUf7G/4P1Qx4lUTcA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1610360078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vdITQROn2Urg2SWnxxpWECg8/2piMq1rysKQi+Js6AM=;
	b=X4gUVuzYQlznnJ4rBpJlj0pVo1A0rJo22Rpjt8+XaTFqV54Id4MU7M5oqDy1KDl8a6a4jG
	+hpoSFj00cPTvyCg==
To: Guenter Roeck <linux@roeck-us.net>
Cc: LKML <linux-kernel@vger.kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
 Peter Zijlstra <peterz@infradead.org>, Catalin Marinas
 <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org, Chris Wilson
 <chris@chris-wilson.co.uk>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Saeed Mahameed
 <saeedm@nvidia.com>, netdev@vger.kernel.org, Will Deacon
 <will@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 linux-s390@vger.kernel.org, afzal mohammed <afzal.mohd.ma@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Dave Jiang
 <dave.jiang@intel.com>, xen-devel@lists.xenproject.org, Leon Romanovsky
 <leon@kernel.org>, linux-rdma@vger.kernel.org, Marc Zyngier
 <maz@kernel.org>, Helge Deller <deller@gmx.de>, Russell King
 <linux@armlinux.org.uk>, Christian Borntraeger <borntraeger@de.ibm.com>,
 linux-pci@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Heiko
 Carstens <hca@linux.ibm.com>, Wambui Karuga <wambui.karugax@gmail.com>,
 Allen Hubbe <allenbh@gmail.com>, Juergen Gross <jgross@suse.com>, David
 Airlie <airlied@linux.ie>, linux-gpio@vger.kernel.org, Stefano Stabellini
 <sstabellini@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Bjorn
 Helgaas <bhelgaas@google.com>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>, linux-parisc@vger.kernel.org, Pankaj
 Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>, Hou Zhiqiang
 <Zhiqiang.Hou@nxp.com>, Tariq Toukan <tariqt@nvidia.com>, Jon Mason
 <jdmason@kudzu.us>, linux-ntb@googlegroups.com,
 intel-gfx@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>
Subject: Re: [patch 02/30] genirq: Move status flag checks to core
In-Reply-To: <20201227192049.GA195845@roeck-us.net>
References: <20201210192536.118432146@linutronix.de> <20201210194042.703779349@linutronix.de> <20201227192049.GA195845@roeck-us.net>
Date: Mon, 11 Jan 2021 11:14:38 +0100
Message-ID: <87im837pbl.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain

On Sun, Dec 27 2020 at 11:20, Guenter Roeck wrote:
> On Thu, Dec 10, 2020 at 08:25:38PM +0100, Thomas Gleixner wrote:
> Yes, but that means that irq_check_status_bit() may be called from modules,
> but it is not exported, resulting in build errors such as the following.
>
> arm64:allmodconfig:
>
> ERROR: modpost: "irq_check_status_bit" [drivers/perf/arm_spe_pmu.ko] undefined!

Duh. Yes, that lacks an export obviously.

Thanks,

        tglx

