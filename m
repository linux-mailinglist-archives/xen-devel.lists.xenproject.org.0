Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5BE8001F5
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 04:15:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645259.1007337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8u02-0002nl-Gd; Fri, 01 Dec 2023 03:15:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645259.1007337; Fri, 01 Dec 2023 03:15:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8u02-0002kl-Dq; Fri, 01 Dec 2023 03:15:30 +0000
Received: by outflank-mailman (input) for mailman id 645259;
 Fri, 01 Dec 2023 03:15:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QmaB=HM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r8u01-0002kZ-8S
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 03:15:29 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dea0e43b-8ff7-11ee-9b0f-b553b5be7939;
 Fri, 01 Dec 2023 04:15:26 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 30CF8CE1733;
 Fri,  1 Dec 2023 03:15:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03048C433C8;
 Fri,  1 Dec 2023 03:15:18 +0000 (UTC)
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
X-Inumbo-ID: dea0e43b-8ff7-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701400521;
	bh=Dp7B5vd2hVcODH9a2EoW3LvQCYVBsy+Yg/mVTlE9inU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QXRXIIGk3RVLPsM4TCRp2cn2iBCqITDx3AWfqYRl3Lln3cRggUuDlXWdreqcykGsL
	 W946LuhkL2qPLsf3/raIlDTPk3Drc5irqHJGg+oPby4lLnrTsYhV2sUc0Izv52YpnF
	 MRqsfAVPlzx8Bdl426zUVsiMIKfPvPR+8o0LbOwEsfebODMAxZ1AkXV6gzv5WvMGnE
	 vdvaGhSthObuKzxmpx6yuRcmH+6r9KHtlZT407gtbyKQMPFQvGGS8oyqREfhVDDmUp
	 wLcJikr7LGhwsoJ199+0r9HNU5FRwIsMBGlQY0omccS71m+/4uYUdIB17v3shmvoVW
	 FYAxePMeaTQbw==
Date: Thu, 30 Nov 2023 19:15:17 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Jiqian Chen <Jiqian.Chen@amd.com>, Juergen Gross <jgross@suse.com>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Thomas Gleixner <tglx@linutronix.de>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
    Bjorn Helgaas <bhelgaas@google.com>, xen-devel@lists.xenproject.org, 
    linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    Alex Deucher <Alexander.Deucher@amd.com>, 
    Christian Koenig <Christian.Koenig@amd.com>, 
    Stewart Hildebrand <Stewart.Hildebrand@amd.com>, 
    Xenia Ragiadakou <xenia.ragiadakou@amd.com>, 
    Honglei Huang <Honglei1.Huang@amd.com>, Julia Zhang <Julia.Zhang@amd.com>, 
    Huang Rui <Ray.Huang@amd.com>
Subject: Re: [RFC KERNEL PATCH v2 2/3] xen/pvh: Unmask irq for passthrough
 device in PVH dom0
In-Reply-To: <ZWiyBP4Lzz5lXraP@macbook>
Message-ID: <alpine.DEB.2.22.394.2311301912350.110490@ubuntu-linux-20-04-desktop>
References: <20231124103123.3263471-1-Jiqian.Chen@amd.com> <20231124103123.3263471-3-Jiqian.Chen@amd.com> <alpine.DEB.2.22.394.2311291950350.3533093@ubuntu-linux-20-04-desktop> <ZWiyBP4Lzz5lXraP@macbook>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-351411740-1701400521=:110490"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-351411740-1701400521=:110490
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 30 Nov 2023, Roger Pau Monné wrote:
> On Wed, Nov 29, 2023 at 07:53:59PM -0800, Stefano Stabellini wrote:
> > On Fri, 24 Nov 2023, Jiqian Chen wrote:
> > > This patch is to solve two problems we encountered when we try to
> > > passthrough a device to hvm domU base on Xen PVH dom0.
> > > 
> > > First, hvm guest will alloc a pirq and irq for a passthrough device
> > > by using gsi, before that, the gsi must first has a mapping in dom0,
> > > see Xen code pci_add_dm_done->xc_domain_irq_permission, it will call
> > > into Xen and check whether dom0 has the mapping. See
> > > XEN_DOMCTL_irq_permission->pirq_access_permitted, "current" is PVH
> > > dom0 and it return irq is 0, and then return -EPERM.
> > > This is because the passthrough device doesn't do PHYSDEVOP_map_pirq
> > > when thay are enabled.
> > > 
> > > Second, in PVH dom0, the gsi of a passthrough device doesn't get
> > > registered, but gsi must be configured for it to be able to be
> > > mapped into a domU.
> > > 
> > > After searching codes, we can find map_pirq and register_gsi will be
> > > done in function vioapic_write_redirent->vioapic_hwdom_map_gsi when
> > > the gsi(aka ioapic's pin) is unmasked in PVH dom0. So the problems
> > > can be conclude to that the gsi of a passthrough device doesn't be
> > > unmasked.
> > > 
> > > To solve the unmaske problem, this patch call the unmask_irq when we
> > > assign a device to be passthrough. So that the gsi can get registered
> > > and mapped in PVH dom0.
> > 
> > 
> > Roger, this seems to be more of a Xen issue than a Linux issue. Why do
> > we need the unmask check in Xen? Couldn't we just do:
> > 
> > 
> > diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
> > index 4e40d3609a..df262a4a18 100644
> > --- a/xen/arch/x86/hvm/vioapic.c
> > +++ b/xen/arch/x86/hvm/vioapic.c
> > @@ -287,7 +287,7 @@ static void vioapic_write_redirent(
> >              hvm_dpci_eoi(d, gsi);
> >      }
> >  
> > -    if ( is_hardware_domain(d) && unmasked )
> > +    if ( is_hardware_domain(d) )
> >      {
> >          /*
> >           * NB: don't call vioapic_hwdom_map_gsi while holding hvm.irq_lock
> 
> There are some issues with this approach.
> 
> mp_register_gsi() will only setup the trigger and polarity of the
> IO-APIC pin once, so we do so once the guest unmask the pin in order
> to assert that the configuration is the intended one.  A guest is
> allowed to write all kind of nonsense stuff to the IO-APIC RTE, but
> that doesn't take effect unless the pin is unmasked.
> 
> Overall the question would be whether we have any guarantees that
> the hardware domain has properly configured the pin, even if it's not
> using it itself (as it hasn't been unmasked).
> 
> IIRC PCI legacy interrupts are level triggered and low polarity, so we
> could configure any pins that are not setup at bind time?

That could work.

Another idea is to move only the call to allocate_and_map_gsi_pirq at
bind time? That might be enough to pass a pirq_access_permitted check.
--8323329-351411740-1701400521=:110490--

