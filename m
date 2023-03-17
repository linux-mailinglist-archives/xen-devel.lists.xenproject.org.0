Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B3C6BF338
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 21:56:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511287.790258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdH6d-0003Er-7J; Fri, 17 Mar 2023 20:55:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511287.790258; Fri, 17 Mar 2023 20:55:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdH6d-0003Ch-3d; Fri, 17 Mar 2023 20:55:19 +0000
Received: by outflank-mailman (input) for mailman id 511287;
 Fri, 17 Mar 2023 20:55:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mGfD=7J=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pdH6c-0003CC-Ar
 for xen-devel@lists.xenproject.org; Fri, 17 Mar 2023 20:55:18 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 030db59a-c506-11ed-b464-930f4c7d94ae;
 Fri, 17 Mar 2023 21:55:14 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 659396175C;
 Fri, 17 Mar 2023 20:55:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6FDAC433EF;
 Fri, 17 Mar 2023 20:55:09 +0000 (UTC)
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
X-Inumbo-ID: 030db59a-c506-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679086511;
	bh=nNxX3W4zD4W0tQR3a0TlsLHP1VauIQsS79fnJNJOQcE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pI/Oi6DMdTi0z+qOPCXOzF3S7oD8Rp4Bw7dFmBNIXz8rQY6kgHzUkT52mQhSIfiNH
	 reF0LvEnWxqM1UXjFYYvbEsjM1fTtOgIbFmwrGBNYB2l4A4rchDqY5RPfNCH0J3kdf
	 AQ4xK3XweDtdlm+8PMy/dVRZathGpM2noVOrc0kXZ2LbyTiJG0kJQtgkt4GxwbULdV
	 vwLXPKGPNideEhEAXawJZ9gJE8cfECAegIo+KOmCBxjILmYroHosdowGJrlefrHvZG
	 HSrYqCXuLVr4iI+7ufn1C0smDslqdnQxrwGEV6BnJqbI41SZVmEXIC0yajNXQB/0Sx
	 IZErcHVXI7nJQ==
Date: Fri, 17 Mar 2023 13:55:08 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>, Huang Rui <ray.huang@amd.com>, 
    Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, 
    Alex Deucher <alexander.deucher@amd.com>, 
    =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
    Stewart Hildebrand <Stewart.Hildebrand@amd.com>, 
    Xenia Ragiadakou <burzalodowa@gmail.com>, 
    Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>, 
    Chen Jiqian <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH 6/6] tools/libs/light: pci: translate irq to
 gsi
In-Reply-To: <ZBTEBkaI8q/mrJmv@Air-de-Roger>
Message-ID: <alpine.DEB.2.22.394.2303171346410.3359@ubuntu-linux-20-04-desktop>
References: <20230312075455.450187-7-ray.huang@amd.com> <ZBHz7PpUbKM69Xxe@Air-de-Roger> <alpine.DEB.2.22.394.2303151729590.3462@ubuntu-linux-20-04-desktop> <e8843d7a-eecc-373c-a6b3-6a893bc0eb2a@suse.com> <ZBLg8WB8HCoZvwz5@Air-de-Roger>
 <df607690-0bfb-94a3-fac6-5e20f183dc20@suse.com> <alpine.DEB.2.22.394.2303161611220.3359@ubuntu-linux-20-04-desktop> <4edb59db-d2b8-122a-fc10-59001857bee0@suse.com> <ZBQ4DKJ8ZAroyPIQ@Air-de-Roger> <alpine.DEB.2.22.394.2303171115320.3359@ubuntu-linux-20-04-desktop>
 <ZBTEBkaI8q/mrJmv@Air-de-Roger>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-708690513-1679086511=:3359"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-708690513-1679086511=:3359
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 17 Mar 2023, Roger Pau Monné wrote:
> On Fri, Mar 17, 2023 at 11:15:37AM -0700, Stefano Stabellini wrote:
> > On Fri, 17 Mar 2023, Roger Pau Monné wrote:
> > > On Fri, Mar 17, 2023 at 09:39:52AM +0100, Jan Beulich wrote:
> > > > On 17.03.2023 00:19, Stefano Stabellini wrote:
> > > > > On Thu, 16 Mar 2023, Jan Beulich wrote:
> > > > >> So yes, it then all boils down to that Linux-
> > > > >> internal question.
> > > > > 
> > > > > Excellent question but we'll have to wait for Ray as he is the one with
> > > > > access to the hardware. But I have this data I can share in the
> > > > > meantime:
> > > > > 
> > > > > [    1.260378] IRQ to pin mappings:
> > > > > [    1.260387] IRQ1 -> 0:1
> > > > > [    1.260395] IRQ2 -> 0:2
> > > > > [    1.260403] IRQ3 -> 0:3
> > > > > [    1.260410] IRQ4 -> 0:4
> > > > > [    1.260418] IRQ5 -> 0:5
> > > > > [    1.260425] IRQ6 -> 0:6
> > > > > [    1.260432] IRQ7 -> 0:7
> > > > > [    1.260440] IRQ8 -> 0:8
> > > > > [    1.260447] IRQ9 -> 0:9
> > > > > [    1.260455] IRQ10 -> 0:10
> > > > > [    1.260462] IRQ11 -> 0:11
> > > > > [    1.260470] IRQ12 -> 0:12
> > > > > [    1.260478] IRQ13 -> 0:13
> > > > > [    1.260485] IRQ14 -> 0:14
> > > > > [    1.260493] IRQ15 -> 0:15
> > > > > [    1.260505] IRQ106 -> 1:8
> > > > > [    1.260513] IRQ112 -> 1:4
> > > > > [    1.260521] IRQ116 -> 1:13
> > > > > [    1.260529] IRQ117 -> 1:14
> > > > > [    1.260537] IRQ118 -> 1:15
> > > > > [    1.260544] .................................... done.
> > > > 
> > > > And what does Linux think are IRQs 16 ... 105? Have you compared with
> > > > Linux running baremetal on the same hardware?
> > > 
> > > So I have some emails from Ray from he time he was looking into this,
> > > and on Linux dom0 PVH dmesg there is:
> > > 
> > > [    0.065063] IOAPIC[0]: apic_id 33, version 17, address 0xfec00000, GSI 0-23
> > > [    0.065096] IOAPIC[1]: apic_id 34, version 17, address 0xfec01000, GSI 24-55
> > > 
> > > So it seems the vIO-APIC data provided by Xen to dom0 is at least
> > > consistent.
> > >  
> > > > > And I think Ray traced the point in Linux where Linux gives us an IRQ ==
> > > > > 112 (which is the one causing issues):
> > > > > 
> > > > > __acpi_register_gsi->
> > > > >         acpi_register_gsi_ioapic->
> > > > >                 mp_map_gsi_to_irq->
> > > > >                         mp_map_pin_to_irq->
> > > > >                                 __irq_resolve_mapping()
> > > > > 
> > > > >         if (likely(data)) {
> > > > >                 desc = irq_data_to_desc(data);
> > > > >                 if (irq)
> > > > >                         *irq = data->irq;
> > > > >                 /* this IRQ is 112, IO-APIC-34 domain */
> > > > >         }
> > > 
> > > 
> > > Could this all be a result of patch 4/5 in the Linux series ("[RFC
> > > PATCH 4/5] x86/xen: acpi registers gsi for xen pvh"), where a different
> > > __acpi_register_gsi hook is installed for PVH in order to setup GSIs
> > > using PHYSDEV ops instead of doing it natively from the IO-APIC?
> > > 
> > > FWIW, the introduced function in that patch
> > > (acpi_register_gsi_xen_pvh()) seems to unconditionally call
> > > acpi_register_gsi_ioapic() without checking if the GSI is already
> > > registered, which might lead to multiple IRQs being allocated for the
> > > same underlying GSI?
> > 
> > I understand this point and I think it needs investigating.
> > 
> > 
> > > As I commented there, I think that approach is wrong.  If the GSI has
> > > not been mapped in Xen (because dom0 hasn't unmasked the respective
> > > IO-APIC pin) we should add some logic in the toolstack to map it
> > > before attempting to bind.
> > 
> > But this statement confuses me. The toolstack doesn't get involved in
> > IRQ setup for PCI devices for HVM guests?
> 
> It does for GSI interrupts AFAICT, see pci_add_dm_done() and the call
> to xc_physdev_map_pirq().  I'm not sure whether that's a remnant that
> cold be removed (maybe for qemu-trad only?) or it's also required by
> QEMU upstream, I would have to investigate more.

You are right. I am not certain, but it seems like a mistake in the
toolstack to me. In theory, pci_add_dm_done should only be needed for PV
guests, not for HVM guests. I am not sure. But I can see the call to
xc_physdev_map_pirq you were referring to now.


> It's my understanding it's in pci_add_dm_done() where Ray was getting
> the mismatched IRQ vs GSI number.

I think the mismatch was actually caused by the xc_physdev_map_pirq call
from QEMU, which makes sense because in any case it should happen before
the same call done by pci_add_dm_done (pci_add_dm_done is called after
sending the pci passthrough QMP command to QEMU). So the first to hit
the IRQ!=GSI problem would be QEMU.
--8323329-708690513-1679086511=:3359--

