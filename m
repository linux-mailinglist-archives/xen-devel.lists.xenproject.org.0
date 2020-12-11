Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D55E82D8070
	for <lists+xen-devel@lfdr.de>; Fri, 11 Dec 2020 22:09:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.50896.89727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knpe8-0000YA-N1; Fri, 11 Dec 2020 21:08:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 50896.89727; Fri, 11 Dec 2020 21:08:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knpe8-0000Xl-Jj; Fri, 11 Dec 2020 21:08:12 +0000
Received: by outflank-mailman (input) for mailman id 50896;
 Fri, 11 Dec 2020 21:08:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YvCS=FP=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1knpe6-0000Wt-Sk
 for xen-devel@lists.xenproject.org; Fri, 11 Dec 2020 21:08:11 +0000
Received: from galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 34743719-b6af-49b8-8e4c-b2c2f3560e50;
 Fri, 11 Dec 2020 21:08:09 +0000 (UTC)
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
X-Inumbo-ID: 34743719-b6af-49b8-8e4c-b2c2f3560e50
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1607720888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HhSZk3JoDjyQOLMPOFgRgzwUyrTACu0UGSGM/7NvY6I=;
	b=ODjND6hv3nPITeDJOTxlIhVMHSqc6z+V97F+ULhmNWUDUg4MeWWcc8/RjfBSpJ+3E7KGvI
	7u3oIQ1T0blXK7tiZjRPA+EmHIW9gpYRAbWAbVY6gfKBefi2hgLwHuva9Pr5DzcIfb4zGY
	SuyetRvP8eIvO7dEK0SnW5NkAhYPqinzrr4Dc4PuL6rLfSElkjk6Dm5HgGKkZSl8lMyVVb
	GCj6eMo+nj1M3TWtminM7NXFXEDFn7q5iOiTlBNVs+z2wkgYrK9LnDALIH7BFq1ID6L7rE
	ud/rYvRghXbFi0znwvlxBBbwl+qtg9iLqpnrT1m9/JCtlXDnnHPHRcYj9dijAA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1607720888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HhSZk3JoDjyQOLMPOFgRgzwUyrTACu0UGSGM/7NvY6I=;
	b=jd0RTQztrN1EtCKge/4M0pzHQ/MU02TRkL1ocrE3lvW4v9ht90/z6O6t5eEalNoD9uJ0/m
	DmETqLTaJjhHPNAQ==
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Marc Zyngier <maz@kernel.org>, "James E.J.
 Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller
 <deller@gmx.de>, afzal mohammed <afzal.mohd.ma@gmail.com>,
 linux-parisc@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, Mark
 Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Christian Borntraeger
 <borntraeger@de.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 linux-s390@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Pankaj Bharadiya
 <pankaj.laxminarayan.bharadiya@intel.com>, Chris Wilson
 <chris@chris-wilson.co.uk>, Wambui Karuga <wambui.karugax@gmail.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>, Linus Walleij
 <linus.walleij@linaro.org>, "open list\:GPIO SUBSYSTEM"
 <linux-gpio@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>, Jon Mason
 <jdmason@kudzu.us>, Dave Jiang <dave.jiang@intel.com>, Allen Hubbe
 <allenbh@gmail.com>, linux-ntb@googlegroups.com, Lorenzo Pieralisi
 <lorenzo.pieralisi@arm.com>, Rob Herring <robh@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Michal Simek <michal.simek@xilinx.com>, linux-pci
 <linux-pci@vger.kernel.org>, Karthikeyan Mitran
 <m.karthikeyan@mobiveil.co.in>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Tariq
 Toukan <tariqt@nvidia.com>, "David S. Miller" <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, netdev <netdev@vger.kernel.org>, "open
 list\:HFI1 DRIVER" <linux-rdma@vger.kernel.org>, Saeed Mahameed
 <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [patch 03/30] genirq: Move irq_set_lockdep_class() to core
In-Reply-To: <CAHp75Vc-2OjE2uwvNRiyLMQ8GSN3P7SehKD-yf229_7ocaktiw@mail.gmail.com>
References: <20201210192536.118432146@linutronix.de> <20201210194042.860029489@linutronix.de> <CAHp75Vc-2OjE2uwvNRiyLMQ8GSN3P7SehKD-yf229_7ocaktiw@mail.gmail.com>
Date: Fri, 11 Dec 2020 22:08:07 +0100
Message-ID: <87h7osgifc.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Dec 11 2020 at 19:53, Andy Shevchenko wrote:

> On Thu, Dec 10, 2020 at 10:14 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>>
>> irq_set_lockdep_class() is used from modules and requires irq_to_desc() to
>> be exported. Move it into the core code which lifts another requirement for
>> the export.
>
> ...
>
>> +       if (IS_ENABLED(CONFIG_LOCKDEP))
>> +               __irq_set_lockdep_class(irq, lock_class, request_class);

You are right. Let me fix that.

