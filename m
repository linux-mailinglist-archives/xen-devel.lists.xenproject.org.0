Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C87A2D7399
	for <lists+xen-devel@lfdr.de>; Fri, 11 Dec 2020 11:13:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.50305.88910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knfQe-0005WS-5T; Fri, 11 Dec 2020 10:13:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 50305.88910; Fri, 11 Dec 2020 10:13:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knfQe-0005W2-26; Fri, 11 Dec 2020 10:13:36 +0000
Received: by outflank-mailman (input) for mailman id 50305;
 Fri, 11 Dec 2020 10:13:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YvCS=FP=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1knfQc-0005Vx-Km
 for xen-devel@lists.xenproject.org; Fri, 11 Dec 2020 10:13:34 +0000
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 05c504c2-a916-4904-9a79-4ff2af0040cd;
 Fri, 11 Dec 2020 10:13:33 +0000 (UTC)
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
X-Inumbo-ID: 05c504c2-a916-4904-9a79-4ff2af0040cd
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1607681612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4TDbx5/eRxAHfo/4EOFfTsBBr8/iJ4NkSA5alVnInbw=;
	b=Ebn4XFcCDWYTM7X6Ch/mHznY5CAClfBbnhfLrO3Y6Kuikr6oFUaWSYQxhfOCU5ekEgEuk5
	ABxuPFqFDpUr/6fqEOmv/vOsnXIUuOejIYPyy0GJ0t4RBjN90FMlPlJ+tVDpM1qv0p7R8a
	xeZwcfSm29wJ/oRRI9rOhGLtzHCBhA3bpzeRWeG0Z24sHj1GQq05/L9FR4mQ32JHOYHSXu
	dDKuIj780YnhAu3jYewZAvLFsgNKDUqY7qYYXiJp4nkUDKsOaT+FgTS0xQYjkM48kJqr48
	89TXlGkoZBhTjLzmOxl42qVBK3QR64G1yObP38Wf6bryGtmLISA8jiMWLoDDjQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1607681612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4TDbx5/eRxAHfo/4EOFfTsBBr8/iJ4NkSA5alVnInbw=;
	b=xExbb1LasawAWe5q2U6DGt3Co7x6OFVa9wgrktZhoDZT1DZdHSUTeF92DjXx94ng108/hg
	9efMO3KmpdkXHQDQ==
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 boris.ostrovsky@oracle.com, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Marc Zyngier <maz@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>,
 afzal mohammed <afzal.mohd.ma@gmail.com>, linux-parisc@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Heiko Carstens
 <hca@linux.ibm.com>, linux-s390@vger.kernel.org, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Pankaj
 Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>, Chris Wilson
 <chris@chris-wilson.co.uk>, Wambui Karuga <wambui.karugax@gmail.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Tvrtko
 Ursulin <tvrtko.ursulin@linux.intel.com>, Linus Walleij
 <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Lee Jones
 <lee.jones@linaro.org>, Jon Mason <jdmason@kudzu.us>, Dave Jiang
 <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>,
 linux-ntb@googlegroups.com, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Michal
 Simek <michal.simek@xilinx.com>, linux-pci@vger.kernel.org, Karthikeyan
 Mitran <m.karthikeyan@mobiveil.co.in>, Hou Zhiqiang
 <Zhiqiang.Hou@nxp.com>, Tariq Toukan <tariqt@nvidia.com>, "David S.
 Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, linux-rdma@vger.kernel.org, Saeed Mahameed
 <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>
Subject: Re: [patch 27/30] xen/events: Only force affinity mask for percpu interrupts
In-Reply-To: <a4bce428-4420-6064-c7cc-7136a7544a52@suse.com>
References: <20201210192536.118432146@linutronix.de> <20201210194045.250321315@linutronix.de> <7f7af60f-567f-cdef-f8db-8062a44758ce@oracle.com> <a4bce428-4420-6064-c7cc-7136a7544a52@suse.com>
Date: Fri, 11 Dec 2020 11:13:31 +0100
Message-ID: <874kksiras.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 11 2020 at 07:17, J=C3=BCrgen Gro=C3=9F wrote:
> On 11.12.20 00:20, boris.ostrovsky@oracle.com wrote:
>>=20
>> On 12/10/20 2:26 PM, Thomas Gleixner wrote:
>>> All event channel setups bind the interrupt on CPU0 or the target CPU f=
or
>>> percpu interrupts and overwrite the affinity mask with the corresponding
>>> cpumask. That does not make sense.
>>>
>>> The XEN implementation of irqchip::irq_set_affinity() already picks a
>>> single target CPU out of the affinity mask and the actual target is sto=
red
>>> in the effective CPU mask, so destroying the user chosen affinity mask
>>> which might contain more than one CPU is wrong.
>>>
>>> Change the implementation so that the channel is bound to CPU0 at the X=
EN
>>> level and leave the affinity mask alone. At startup of the interrupt
>>> affinity will be assigned out of the affinity mask and the XEN binding =
will
>>> be updated.
>>=20
>>=20
>> If that's the case then I wonder whether we need this call at all and in=
stead bind at startup time.
>
> This binding to cpu0 was introduced with commit 97253eeeb792d61ed2
> and I have no reason to believe the underlying problem has been
> eliminated.

    "The kernel-side VCPU binding was not being correctly set for newly
     allocated or bound interdomain events.  In ARM guests where 2-level
     events were used, this would result in no interdomain events being
     handled because the kernel-side VCPU masks would all be clear.

     x86 guests would work because the irq affinity was set during irq
     setup and this would set the correct kernel-side VCPU binding."

I'm not convinced that this is really correctly analyzed because affinity
setting is done at irq startup.

                switch (__irq_startup_managed(desc, aff, force)) {
	        case IRQ_STARTUP_NORMAL:
	                ret =3D __irq_startup(desc);
                        irq_setup_affinity(desc);
			break;

which is completely architecture agnostic. So why should this magically
work on x86 and not on ARM if both are using the same XEN irqchip with
the same irqchip callbacks.

Thanks,

        tglx



