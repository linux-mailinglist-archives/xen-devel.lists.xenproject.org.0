Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E886BF084
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 19:16:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511216.790192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdEcE-0004VJ-Lu; Fri, 17 Mar 2023 18:15:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511216.790192; Fri, 17 Mar 2023 18:15:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdEcE-0004Sx-JF; Fri, 17 Mar 2023 18:15:46 +0000
Received: by outflank-mailman (input) for mailman id 511216;
 Fri, 17 Mar 2023 18:15:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mGfD=7J=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pdEcC-0004Sr-Li
 for xen-devel@lists.xenproject.org; Fri, 17 Mar 2023 18:15:44 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bafdd27b-c4ef-11ed-87f5-c1b5be75604c;
 Fri, 17 Mar 2023 19:15:43 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7C8CBB82648;
 Fri, 17 Mar 2023 18:15:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C53AC433D2;
 Fri, 17 Mar 2023 18:15:39 +0000 (UTC)
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
X-Inumbo-ID: bafdd27b-c4ef-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679076941;
	bh=/qGcJtejSlTENBTI8pguwRGkxNxtJYTWTvm0WUB2KAQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ShDh5Eg98u6K3nmk+HnD8JROh9idH3OmQhFX+mhHwG6Y+29M8roSaBXiC2dO/NpEu
	 iS9qgRZRVaIRzNEn1C56UiT0PArSxGgi3pEkzUtW2MUYAJdN7HOJyb9pXp5BqEYGQR
	 g5I9tWgQ9O/14btoxXkJmu+u8DSefyrwHEiQe3LSw0OMI7RzE+epC7WbN3zi8xBUrH
	 azpfDCRG9NzX8eXN6O+zRBwAQO/rRPiq8UvJK9/dA+6Ru4XnP00E/wMyYCQIlbtsLF
	 KStXQxFBpmYEhFXnTQuInQiH9JO/quhi2LtP63sahL0pIsuiLqqQ0Fa7z0m7huLubq
	 0gaxW+Uj/70Dg==
Date: Fri, 17 Mar 2023 11:15:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
cc: Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Huang Rui <ray.huang@amd.com>, 
    Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, 
    Alex Deucher <alexander.deucher@amd.com>, 
    =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
    Stewart Hildebrand <Stewart.Hildebrand@amd.com>, 
    Xenia Ragiadakou <burzalodowa@gmail.com>, 
    Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>, 
    Chen Jiqian <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH 6/6] tools/libs/light: pci: translate irq to
 gsi
In-Reply-To: <ZBQ4DKJ8ZAroyPIQ@Air-de-Roger>
Message-ID: <alpine.DEB.2.22.394.2303171115320.3359@ubuntu-linux-20-04-desktop>
References: <20230312075455.450187-1-ray.huang@amd.com> <20230312075455.450187-7-ray.huang@amd.com> <ZBHz7PpUbKM69Xxe@Air-de-Roger> <alpine.DEB.2.22.394.2303151729590.3462@ubuntu-linux-20-04-desktop> <e8843d7a-eecc-373c-a6b3-6a893bc0eb2a@suse.com>
 <ZBLg8WB8HCoZvwz5@Air-de-Roger> <df607690-0bfb-94a3-fac6-5e20f183dc20@suse.com> <alpine.DEB.2.22.394.2303161611220.3359@ubuntu-linux-20-04-desktop> <4edb59db-d2b8-122a-fc10-59001857bee0@suse.com> <ZBQ4DKJ8ZAroyPIQ@Air-de-Roger>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-25818414-1679076836=:3359"
Content-ID: <alpine.DEB.2.22.394.2303171114120.3359@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-25818414-1679076836=:3359
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2303171114121.3359@ubuntu-linux-20-04-desktop>

On Fri, 17 Mar 2023, Roger Pau Monné wrote:
> On Fri, Mar 17, 2023 at 09:39:52AM +0100, Jan Beulich wrote:
> > On 17.03.2023 00:19, Stefano Stabellini wrote:
> > > On Thu, 16 Mar 2023, Jan Beulich wrote:
> > >> So yes, it then all boils down to that Linux-
> > >> internal question.
> > > 
> > > Excellent question but we'll have to wait for Ray as he is the one with
> > > access to the hardware. But I have this data I can share in the
> > > meantime:
> > > 
> > > [    1.260378] IRQ to pin mappings:
> > > [    1.260387] IRQ1 -> 0:1
> > > [    1.260395] IRQ2 -> 0:2
> > > [    1.260403] IRQ3 -> 0:3
> > > [    1.260410] IRQ4 -> 0:4
> > > [    1.260418] IRQ5 -> 0:5
> > > [    1.260425] IRQ6 -> 0:6
> > > [    1.260432] IRQ7 -> 0:7
> > > [    1.260440] IRQ8 -> 0:8
> > > [    1.260447] IRQ9 -> 0:9
> > > [    1.260455] IRQ10 -> 0:10
> > > [    1.260462] IRQ11 -> 0:11
> > > [    1.260470] IRQ12 -> 0:12
> > > [    1.260478] IRQ13 -> 0:13
> > > [    1.260485] IRQ14 -> 0:14
> > > [    1.260493] IRQ15 -> 0:15
> > > [    1.260505] IRQ106 -> 1:8
> > > [    1.260513] IRQ112 -> 1:4
> > > [    1.260521] IRQ116 -> 1:13
> > > [    1.260529] IRQ117 -> 1:14
> > > [    1.260537] IRQ118 -> 1:15
> > > [    1.260544] .................................... done.
> > 
> > And what does Linux think are IRQs 16 ... 105? Have you compared with
> > Linux running baremetal on the same hardware?
> 
> So I have some emails from Ray from he time he was looking into this,
> and on Linux dom0 PVH dmesg there is:
> 
> [    0.065063] IOAPIC[0]: apic_id 33, version 17, address 0xfec00000, GSI 0-23
> [    0.065096] IOAPIC[1]: apic_id 34, version 17, address 0xfec01000, GSI 24-55
> 
> So it seems the vIO-APIC data provided by Xen to dom0 is at least
> consistent.
>  
> > > And I think Ray traced the point in Linux where Linux gives us an IRQ ==
> > > 112 (which is the one causing issues):
> > > 
> > > __acpi_register_gsi->
> > >         acpi_register_gsi_ioapic->
> > >                 mp_map_gsi_to_irq->
> > >                         mp_map_pin_to_irq->
> > >                                 __irq_resolve_mapping()
> > > 
> > >         if (likely(data)) {
> > >                 desc = irq_data_to_desc(data);
> > >                 if (irq)
> > >                         *irq = data->irq;
> > >                 /* this IRQ is 112, IO-APIC-34 domain */
> > >         }
> 
> 
> Could this all be a result of patch 4/5 in the Linux series ("[RFC
> PATCH 4/5] x86/xen: acpi registers gsi for xen pvh"), where a different
> __acpi_register_gsi hook is installed for PVH in order to setup GSIs
> using PHYSDEV ops instead of doing it natively from the IO-APIC?
> 
> FWIW, the introduced function in that patch
> (acpi_register_gsi_xen_pvh()) seems to unconditionally call
> acpi_register_gsi_ioapic() without checking if the GSI is already
> registered, which might lead to multiple IRQs being allocated for the
> same underlying GSI?

I understand this point and I think it needs investigating.


> As I commented there, I think that approach is wrong.  If the GSI has
> not been mapped in Xen (because dom0 hasn't unmasked the respective
> IO-APIC pin) we should add some logic in the toolstack to map it
> before attempting to bind.

But this statement confuses me. The toolstack doesn't get involved in
IRQ setup for PCI devices for HVM guests? Keep in mind that this is a
regular HVM guest creation on PVH Dom0, so normally the IRQ setup is
done by QEMU, and QEMU already calls xc_physdev_map_pirq and
xc_domain_bind_pt_pci_irq. So I don't follow your statement about "the
toolstack to map it before attempting to bind".
--8323329-25818414-1679076836=:3359--

