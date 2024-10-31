Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 209649B777B
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2024 10:29:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828532.1243442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6RTx-0004Jb-Rr; Thu, 31 Oct 2024 09:28:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828532.1243442; Thu, 31 Oct 2024 09:28:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6RTx-0004HS-Oa; Thu, 31 Oct 2024 09:28:45 +0000
Received: by outflank-mailman (input) for mailman id 828532;
 Thu, 31 Oct 2024 09:28:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sKGZ=R3=redhat.com=pstanner@srs-se1.protection.inumbo.net>)
 id 1t6RTv-0004HM-TW
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2024 09:28:43 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8238b9a4-976a-11ef-99a3-01e77a169b0f;
 Thu, 31 Oct 2024 10:28:39 +0100 (CET)
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-QN7-STtIOQWMNkok5CaQMA-1; Thu, 31 Oct 2024 05:28:35 -0400
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2fb58980614so4514231fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 31 Oct 2024 02:28:35 -0700 (PDT)
Received: from dhcp-64-16.muc.redhat.com (nat-pool-muc-t.redhat.com.
 [149.14.88.26]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4327d5e94cdsm18626575e9.28.2024.10.31.02.28.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 02:28:32 -0700 (PDT)
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
X-Inumbo-ID: 8238b9a4-976a-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE3MC4xMC4xMzMuMTI0IiwiaGVsbyI6InVzLXNtdHAtZGVsaXZlcnktMTI0Lm1pbWVjYXN0LmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjgyMzhiOWE0LTk3NmEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMzY2OTE5LjEzNDc4MSwic2VuZGVyIjoicHN0YW5uZXJAcmVkaGF0LmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730366917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d6wn1lKONgblnZ++1qSDC4UeXUH/h7Owd02AbOfZVIQ=;
	b=O1Hgo5JC6FUyTNgc9e8DRsrVBH3XjpdkBRq56cQs26Z96zCNPjyrQonIkEUaWvXo6OfysK
	/r8s5Mn6pOHx86PYvyn0rblxTG+sBJuGXwpseiwGBm8a+0+mGJ2hfoUDzBWcYsRJHcbbDs
	A3vEQ1E4S9QZgLYCWrViN3YKnD6hEKo=
X-MC-Unique: QN7-STtIOQWMNkok5CaQMA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730366914; x=1730971714;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d6wn1lKONgblnZ++1qSDC4UeXUH/h7Owd02AbOfZVIQ=;
        b=CCi9DymkUOimLlw2bzVd8XufAPCKXaNyMIr/QaLTAFLbcDTrgPSRSQzcA/rW4ZJqew
         N+jnRk19JpubIel/SG/z29ZeWoTSHuqR0UlOkMZ42Z5XJQfqX0xMc0xZcvkxAFtkiSiq
         Or8WbxKkcMKFXOKfyUldmc1moUrrtwgxAgLm3gjhsAdJF3r4DQBHVPH1/pUBjjyS209o
         J8Cqfsz1EfBBqnHuHko5OmlKRPpdJ1hV4PWsRXQFuQ9kJgal5f37kzGIuTmtk/zZD9YN
         CgpOrRG8fDWdhxWCLMrl1FptZPKui8qcPlfDpMeW6fbxt/4dOC+m4+l8az5giES9rlic
         7ICA==
X-Forwarded-Encrypted: i=1; AJvYcCWuBCdH5k0DZcZLfY30kQww1rSVjZ8UEcsDvi/CgfpjAK28eReyy/oSuUDToDBExKpepprWHYxeZxQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YygHSfWfqmtD4QvQms011AGUZpvHpRzPjs+n0A5gbFNKJkltasF
	9wa/QbAVcW7SWcNT7Tq9a6/vBB6ni9Xm3delgOUA9+iTHVUf2EMddpm3FLIEBsu0zd3fmjA6zEA
	7PgHpimXDiYOtmekwMkIX+fIKVEc9udM2kAaLCy3k5ngrqZWiFr8iyCzw1A8kDWCv
X-Received: by 2002:a2e:b8cf:0:b0:2fb:58b1:3731 with SMTP id 38308e7fff4ca-2fd058fbda2mr43394621fa.6.1730366913672;
        Thu, 31 Oct 2024 02:28:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEinR4wm9boDAsEkZ9V3ivoUKK9VQmKYoIEQNVXO7Y2sjsmX4v4AmQcNIDCbC3ckt5R0LeFLA==
X-Received: by 2002:a2e:b8cf:0:b0:2fb:58b1:3731 with SMTP id 38308e7fff4ca-2fd058fbda2mr43394381fa.6.1730366913125;
        Thu, 31 Oct 2024 02:28:33 -0700 (PDT)
Message-ID: <f13c91f2d1e7672e1d9983425117eeb6347c0ea1.camel@redhat.com>
Subject: Re: [PATCH 00/13] Remove implicit devres from pci_intx()
From: Philipp Stanner <pstanner@redhat.com>
To: Takashi Iwai <tiwai@suse.de>, Bjorn Helgaas <helgaas@kernel.org>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
 Sergey Shtylyov <s.shtylyov@omp.ru>, Basavaraj Natikar
 <basavaraj.natikar@amd.com>, Jiri Kosina <jikos@kernel.org>,  Benjamin
 Tissoires <bentiss@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Alex Dubov <oakad@yahoo.com>,
 Sudarsana Kalluru <skalluru@marvell.com>, Manish Chopra
 <manishc@marvell.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Rasesh Mody <rmody@marvell.com>,
 GR-Linux-NIC-Dev@marvell.com, Igor Mitsyanko <imitsyanko@quantenna.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Kalle Valo <kvalo@kernel.org>,
 Sanjay R Mehta <sanju.mehta@amd.com>, Shyam Sundar S K
 <Shyam-sundar.S-k@amd.com>, Jon Mason <jdmason@kudzu.us>, Dave Jiang
 <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Alex Williamson <alex.williamson@redhat.com>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, Chen Ni <nichen@iscas.ac.cn>, Mario Limonciello
 <mario.limonciello@amd.com>, Ricky Wu <ricky_wu@realtek.com>, Al Viro
 <viro@zeniv.linux.org.uk>, Breno Leitao <leitao@debian.org>, Kevin Tian
 <kevin.tian@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Mostafa Saleh
 <smostafa@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Yi Liu
 <yi.l.liu@intel.com>,  Christian Brauner <brauner@kernel.org>, Ankit
 Agrawal <ankita@nvidia.com>, Eric Auger <eric.auger@redhat.com>, Reinette
 Chatre <reinette.chatre@intel.com>, Ye Bin <yebin10@huawei.com>, Marek
 =?ISO-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,  Rui Salvaterra <rsalvaterra@gmail.com>,
 linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, netdev@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ntb@lists.linux.dev,
 linux-pci@vger.kernel.org,  kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-sound@vger.kernel.org
Date: Thu, 31 Oct 2024 10:28:29 +0100
In-Reply-To: <87plngwrws.wl-tiwai@suse.de>
References: <20241015185124.64726-1-pstanner@redhat.com>
	 <20241030221737.GA1223682@bhelgaas> <87plngwrws.wl-tiwai@suse.de>
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2024-10-31 at 10:19 +0100, Takashi Iwai wrote:
> On Wed, 30 Oct 2024 23:17:37 +0100,
> Bjorn Helgaas wrote:
> >=20
> > On Tue, Oct 15, 2024 at 08:51:10PM +0200, Philipp Stanner wrote:
> > > @Driver-Maintainers: Your driver might be touched by patch
> > > "Remove
> > > devres from pci_intx()". You might want to take a look.
> > >=20
> > > Changes since the RFC [1]:
> > > =C2=A0 - Add a patch deprecating pci{m}_intx(). (Heiner, Andy, Me)
> > > =C2=A0 - Add Acked-by's already given.
> > > =C2=A0 - Export pcim_intx() as a GPL function. (Alex)
> > > =C2=A0 - Drop patch for rts5280, since this driver will be removed
> > > quite
> > > =C2=A0=C2=A0=C2=A0 soon. (Philipp Hortmann, Greg)
> > > =C2=A0 - Use early-return in pci_intx_unmanaged() and pci_intx().
> > > (Andy)
> > >=20
> > > Hi all,
> > >=20
> > > this series removes a problematic feature from pci_intx(). That
> > > function
> > > sometimes implicitly uses devres for automatic cleanup. We should
> > > get
> > > rid of this implicit behavior.
> > >=20
> > > To do so, a pci_intx() version that is always-managed, and one
> > > that is
> > > never-managed are provided. Then, all pci_intx() users are ported
> > > to the
> > > version they need. Afterwards, pci_intx() can be cleaned up and
> > > the
> > > users of the never-managed version be ported back to pci_intx().
> > >=20
> > > This way we'd get this PCI API consistent again.
> > >=20
> > > Patch "Remove devres from pci_intx()" obviously reverts the
> > > previous
> > > patches that made drivers use pci_intx_unmanaged(). But this way
> > > it's
> > > easier to review and approve. It also makes sure that each
> > > checked out
> > > commit should provide correct behavior, not just the entire
> > > series as a
> > > whole.
> > >=20
> > > Merge plan for this is to enter through the PCI tree.
> > >=20
> > > [1]
> > > https://lore.kernel.org/all/20241009083519.10088-1-pstanner@redhat.co=
m/
> >=20
> > I *think* this series depends on resolution of Takashi's "Restore
> > the
> > original INTX_DISABLE bit by pcim_intx()" patch [2], right?
>=20
> IIUC, it's not really dependent, as pcim_intx() has been used in
> pci_intx() internally when the PCI device is already managed.
> My patch is to correct the already existing behavior.

IOW, pcim_intx() does not behave correctly, independently from removing
the call to it in pci_intx().

> =C2=A0 So I guess you
> can take this series, and I'll post the revised patch later (sorry, I
> was too busy for other tasks).
>=20
>=20
> thanks,
>=20
> Takashi
>=20
> >=20
> > For now I'm postponing this series, but let me know if that's not
> > the
> > right thing.

There are still several reviews / acks missing from the respective
driver maintainers, so there's no hurry with this series regarding your
side ;)

Regards
P.


> >=20
> > [2] https://lore.kernel.org/r/20241024155539.19416-1-tiwai@suse.de
> >=20
> > > Philipp Stanner (13):
> > > =C2=A0 PCI: Prepare removing devres from pci_intx()
> > > =C2=A0 ALSA: hda_intel: Use always-managed version of pcim_intx()
> > > =C2=A0 drivers/xen: Use never-managed version of pci_intx()
> > > =C2=A0 net/ethernet: Use never-managed version of pci_intx()
> > > =C2=A0 net/ntb: Use never-managed version of pci_intx()
> > > =C2=A0 misc: Use never-managed version of pci_intx()
> > > =C2=A0 vfio/pci: Use never-managed version of pci_intx()
> > > =C2=A0 PCI: MSI: Use never-managed version of pci_intx()
> > > =C2=A0 ata: Use always-managed version of pci_intx()
> > > =C2=A0 wifi: qtnfmac: use always-managed version of pcim_intx()
> > > =C2=A0 HID: amd_sfh: Use always-managed version of pcim_intx()
> > > =C2=A0 Remove devres from pci_intx()
> > > =C2=A0 PCI: Deprecate pci_intx(), pcim_intx()
> > >=20
> > > =C2=A0drivers/ata/ahci.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > =C2=A0drivers/ata/ata_piix.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > =C2=A0drivers/ata/pata_rdc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > =C2=A0drivers/ata/sata_sil24.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 2 +-
> > > =C2=A0drivers/ata/sata_sis.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > =C2=A0drivers/ata/sata_uli.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > =C2=A0drivers/ata/sata_vsc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > =C2=A0drivers/hid/amd-sfh-hid/amd_sfh_pcie.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +--
> > > =C2=A0drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c |=C2=A0 2 +-
> > > =C2=A0.../wireless/quantenna/qtnfmac/pcie/pcie.c=C2=A0=C2=A0=C2=A0 |=
=C2=A0 2 +-
> > > =C2=A0drivers/pci/devres.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 29 +++++--------
> > > ------
> > > =C2=A0drivers/pci/pci.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 19 ++++--------
> > > =C2=A0include/linux/pci.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> > > =C2=A0sound/pci/hda/hda_intel.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 2 +-
> > > =C2=A014 files changed, 26 insertions(+), 47 deletions(-)
> > >=20
> > > --=20
> > > 2.47.0
> > >=20
>=20


