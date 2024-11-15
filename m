Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2879CDA8A
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 09:33:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836952.1252864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBrkl-0007sz-9o; Fri, 15 Nov 2024 08:32:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836952.1252864; Fri, 15 Nov 2024 08:32:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBrkl-0007qQ-79; Fri, 15 Nov 2024 08:32:31 +0000
Received: by outflank-mailman (input) for mailman id 836952;
 Fri, 15 Nov 2024 08:32:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PbAW=SK=redhat.com=pstanner@srs-se1.protection.inumbo.net>)
 id 1tBrkj-0007qK-GU
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 08:32:29 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 234398c0-a32c-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 09:32:24 +0100 (CET)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-407-eDXXFYHWPNyftcVlg5u1_w-1; Fri, 15 Nov 2024 03:32:21 -0500
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-38223a3262bso267552f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 00:32:21 -0800 (PST)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3821ada2da2sm3716393f8f.15.2024.11.15.00.32.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 00:32:19 -0800 (PST)
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
X-Inumbo-ID: 234398c0-a32c-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE3MC4xMC4xMjkuMTI0IiwiaGVsbyI6InVzLXNtdHAtZGVsaXZlcnktMTI0Lm1pbWVjYXN0LmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjIzNDM5OGMwLWEzMmMtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjU5NTQ1LjA4NDczNSwic2VuZGVyIjoicHN0YW5uZXJAcmVkaGF0LmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731659543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KwwtRZveGMe16US76kOe+Iauo+yTFHTCMml6hFlPRTY=;
	b=iyBHw73neaeyiBXj5LGmJBkvbZEUjiGNpqfaOvY94KTx3G4j82p/3Bw3+zRo2VIwKy9D8a
	I6RlZncOcCEimvcYxfZgiVK24CFtvPR5unBMiNLtRJIv7OPEQymTS04AbZtpkJ0+AJceid
	+DniDpu755iUXXNPxpb0B/gEuf0RRgA=
X-MC-Unique: eDXXFYHWPNyftcVlg5u1_w-1
X-Mimecast-MFC-AGG-ID: eDXXFYHWPNyftcVlg5u1_w
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731659540; x=1732264340;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KwwtRZveGMe16US76kOe+Iauo+yTFHTCMml6hFlPRTY=;
        b=OpT7kuRAMRLqxKsPikUu7R1k1f8FDJck+sPAp80WAQXtZyZqoezAgj8oQbhznY01XQ
         Ha/DtRlExAxSEiZY9fP9OFWUPequNaS1UkOncRuVuEmB/3N7TZtgqoLyG4/4IpVTNjq7
         RnrUWN8X7+T6Tpqnf9i6yDxffD3n1UwFet7R7GbwT2exbCNlgcguCUYF44i28MJahEvt
         BtBr4cEU8xefAfLlwVGqGYqErvCdWf5P90XhVC2F5/fTcm6GcNo+TX/BQNxU9wK7UaLQ
         RI84IoUf2mhA2joyFxERxHrlO+3H5tjfcNEZFYnIEUxJHyu5heLk/UaKhGAocfIQHKXV
         AzTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeFDx9X/VATh+mvxCa8fM+H5Rsz2X+pZoRF9WDIONsRlhwM/kRtEKSTQIW9WBIEP2aioteKApVtL8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw51zTh/1ytzn+yeHEJ8xLga1i0FrVTXPAZ8PKPBSAaTu4vlh42
	E9jZx6iYbCu57zR38l2JwAglvI6SdouX1mkgv8MYkGMBO+zNkXgtFC6+jovu/2sGOy4ab5C74fa
	av2apMo51nw9j9z0/uJPnC86KwtpafwaneRrDyiJwTSN6zCkVsu83ZnXqGipw1U8J
X-Received: by 2002:a5d:64c9:0:b0:37d:5173:7a54 with SMTP id ffacd0b85a97d-38225aafc0bmr1382355f8f.52.1731659540138;
        Fri, 15 Nov 2024 00:32:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGdh/kmNlYkC/WQKFf2J1h1Btsr4ZUjp0WRHuv0DJX0wKMjNySBXwoM4GCHyqPFiIGeYI7IOw==
X-Received: by 2002:a5d:64c9:0:b0:37d:5173:7a54 with SMTP id ffacd0b85a97d-38225aafc0bmr1382314f8f.52.1731659539626;
        Fri, 15 Nov 2024 00:32:19 -0800 (PST)
Message-ID: <ff7f7358cec4bb03423879a2e4efd16d0a3e8ed7.camel@redhat.com>
Subject: Re: [PATCH v2 11/11] Remove devres from pci_intx()
From: Philipp Stanner <pstanner@redhat.com>
To: Thomas Gleixner <tglx@linutronix.de>, Damien Le Moal
 <dlemoal@kernel.org>,  Niklas Cassel <cassel@kernel.org>, Basavaraj Natikar
 <basavaraj.natikar@amd.com>, Jiri Kosina <jikos@kernel.org>,  Benjamin
 Tissoires <bentiss@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Alex Dubov <oakad@yahoo.com>,
 Sudarsana Kalluru <skalluru@marvell.com>, Manish Chopra
 <manishc@marvell.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rasesh Mody
 <rmody@marvell.com>,  GR-Linux-NIC-Dev@marvell.com, Igor Mitsyanko
 <imitsyanko@quantenna.com>,  Sergey Matyukevich <geomatsi@gmail.com>, Kalle
 Valo <kvalo@kernel.org>, Sanjay R Mehta <sanju.mehta@amd.com>, Shyam Sundar
 S K <Shyam-sundar.S-k@amd.com>, Jon Mason <jdmason@kudzu.us>, Dave Jiang
 <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Alex Williamson <alex.williamson@redhat.com>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, Mario Limonciello
 <mario.limonciello@amd.com>, Chen Ni <nichen@iscas.ac.cn>, Ricky Wu
 <ricky_wu@realtek.com>,  Al Viro <viro@zeniv.linux.org.uk>, Breno Leitao
 <leitao@debian.org>, Kevin Tian <kevin.tian@intel.com>, Mostafa Saleh
 <smostafa@google.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yi Liu <yi.l.liu@intel.com>, Kunwu Chan
 <chentao@kylinos.cn>, Ankit Agrawal <ankita@nvidia.com>, Christian Brauner
 <brauner@kernel.org>, Reinette Chatre <reinette.chatre@intel.com>, Eric
 Auger <eric.auger@redhat.com>, Ye Bin <yebin10@huawei.com>
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, netdev@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ntb@lists.linux.dev,
 linux-pci@vger.kernel.org,  kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org
Date: Fri, 15 Nov 2024 09:32:16 +0100
In-Reply-To: <8734jtl3xm.ffs@tglx>
References: <20241113124158.22863-2-pstanner@redhat.com>
	 <20241113124158.22863-13-pstanner@redhat.com> <87msi3ksru.ffs@tglx>
	 <49bb6fc9ebff3cae844da0465ceadeef8d3217c7.camel@redhat.com>
	 <8734jtl3xm.ffs@tglx>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9E6bu4ctaUO5cN9tZkAB8V9DkLTU3rE0IPuFH_lWcJY_1731659540
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2024-11-15 at 01:46 +0100, Thomas Gleixner wrote:
> On Thu, Nov 14 2024 at 10:05, Philipp Stanner wrote:
> > On Wed, 2024-11-13 at 17:22 +0100, Thomas Gleixner wrote:
> > > On Wed, Nov 13 2024 at 13:41, Philipp Stanner wrote:
> > > > pci_intx() is a hybrid function which can sometimes be managed
> > > > through
> > > > devres. This hybrid nature is undesirable.
> > > >=20
> > > > Since all users of pci_intx() have by now been ported either to
> > > > always-managed pcim_intx() or never-managed
> > > > pci_intx_unmanaged(),
> > > > the
> > > > devres functionality can be removed from pci_intx().
> > > >=20
> > > > Consequently, pci_intx_unmanaged() is now redundant, because
> > > > pci_intx()
> > > > itself is now unmanaged.
> > > >=20
> > > > Remove the devres functionality from pci_intx(). Have all users
> > > > of
> > > > pci_intx_unmanaged() call pci_intx(). Remove
> > > > pci_intx_unmanaged().
> > > >=20
> > > > Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> > > > ---
> > > > =C2=A0drivers/misc/cardreader/rtsx_pcr.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > > =C2=A0drivers/misc/tifm_7xx1.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 6 +--
> > > > =C2=A0.../net/ethernet/broadcom/bnx2x/bnx2x_main.c=C2=A0 |=C2=A0 2 =
+-
> > > > =C2=A0drivers/net/ethernet/brocade/bna/bnad.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > > =C2=A0drivers/ntb/hw/amd/ntb_hw_amd.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +-
> > > > =C2=A0drivers/ntb/hw/intel/ntb_hw_gen1.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > > =C2=A0drivers/pci/devres.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +-
> > > > =C2=A0drivers/pci/msi/api.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > > =C2=A0drivers/pci/msi/msi.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > > =C2=A0drivers/pci/pci.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 43 +----------
> > > > ----
> > > > ----
> > > > =C2=A0drivers/vfio/pci/vfio_pci_core.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > > =C2=A0drivers/vfio/pci/vfio_pci_intrs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 10 ++---
> > > > =C2=A0drivers/xen/xen-pciback/conf_space_header.c=C2=A0=C2=A0 |=C2=
=A0 2 +-
> > > > =C2=A0include/linux/pci.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 -
> > > > =C2=A014 files changed, 22 insertions(+), 62 deletions(-)
> > >=20
> > > Now I'm utterly confused. This undoes the pci_intx_unmanaged()
> > > churn
> > > which you carefully split into several patches first.
> >=20
> > Have you read the email I have linked?
> >=20
> > There is also the cover-letter (does anyone in the community ever
> > read
> > those?) which explicitly states:
> >=20
> > "Patch "Remove devres from pci_intx()" obviously reverts the
> > previous
> > patches that made drivers use pci_intx_unmanaged(). But this way
> > it's
> > easier to review and approve. It also makes sure that each checked
> > out
> > commit should provide correct behavior, not just the entire series
> > as a
> > whole."
>=20
> I read it and I assume your intention was to force an eye on every
> use
> case of pci_intx() and not just on those which need to be converted
> to
> pcim_intx().
>=20
> I'm not convinced that this is needed, but fair enough.

Whether pcim_enable_device() is really not used could have been
overlooked, or the driver could move to "managed mode" in parallel for
v6.13 for example. Then a bug would be silently introduced into those
drivers.

Besides, me touching pci_intx() unfortunately caused a few explosions
in the past already, in

fc8c818e756991f5f50b8dfab07f970a18da2556 and
00f89ae4e759a7eef07e4188e1534af7dd2c7e9c

So this time I prefer to be rather safe than sorry.


BTW, if you can review the MSI patch and check whether removing devres
from there really is fine, that would be helpful.


Regards,
P.


