Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 770B59BAF9B
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2024 10:27:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829887.1244802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7tMa-0003j6-Fy; Mon, 04 Nov 2024 09:27:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829887.1244802; Mon, 04 Nov 2024 09:27:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7tMa-0003gv-DI; Mon, 04 Nov 2024 09:27:08 +0000
Received: by outflank-mailman (input) for mailman id 829887;
 Mon, 04 Nov 2024 09:27:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UQGP=R7=redhat.com=pstanner@srs-se1.protection.inumbo.net>)
 id 1t7tMY-0003gn-K2
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2024 09:27:06 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f015ee9a-9a8e-11ef-99a3-01e77a169b0f;
 Mon, 04 Nov 2024 10:26:58 +0100 (CET)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-444-MVDSc3zqOpq0R_bRrpQZaw-1; Mon, 04 Nov 2024 04:26:56 -0500
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-37d5a3afa84so1946243f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 04 Nov 2024 01:26:55 -0800 (PST)
Received: from ?IPv6:2001:16b8:2d7f:e400:7f8:722c:bb2e:bb7f?
 (200116b82d7fe40007f8722cbb2ebb7f.dip.versatel-1u1.de.
 [2001:16b8:2d7f:e400:7f8:722c:bb2e:bb7f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10b7d20sm12817150f8f.7.2024.11.04.01.26.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2024 01:26:53 -0800 (PST)
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
X-Inumbo-ID: f015ee9a-9a8e-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE3MC4xMC4xMzMuMTI0IiwiaGVsbyI6InVzLXNtdHAtZGVsaXZlcnktMTI0Lm1pbWVjYXN0LmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImYwMTVlZTlhLTlhOGUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwNzEyNDE4Ljc4MjE1Mywic2VuZGVyIjoicHN0YW5uZXJAcmVkaGF0LmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730712417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M7ueN/LQ529FLGouL/3BXVgrjx8tY87847WIrlhrom4=;
	b=hs7Ppm7wXaEwXylZk3WlnuRhOBVi9EZFeFaHA5C2kpvSH/VjkVm6K0TiNsnRe0z8Kj9ISO
	QeHbTMdAtNM8OMz7ZsX56g97CaQyWzdOZ7ETkNzghr2NW+8F20RyIMZTCqi56KBYvwZI4U
	2b2TxZfnuV5aUNIoqBdGJ9P5nVrVU+4=
X-MC-Unique: MVDSc3zqOpq0R_bRrpQZaw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730712415; x=1731317215;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M7ueN/LQ529FLGouL/3BXVgrjx8tY87847WIrlhrom4=;
        b=GWEyNvVf5qo0bX5ejSohPS02CrH86TUY1BX0AK5VdEjPVIBMz/P9JOg+LTBMVQFiMm
         2hjHoaCEgMbbr8iJqgzsgUPJmLSaJcUe2bGc8j08ktdH9fOh8lJAv7vwwoIh7K3F1yf+
         Fie7LqwlvPf7PaZNtJNwP2z0zOGoF9WoDEubDvewfuoST+4BSFBXWZ2WEerq/PtdnQ26
         tmIHusl3o6dcVuF+/9Rxjn0it/ggecaCHJ7j17JAtjl/w7X/BJowstlIE/jC5q7LuIyQ
         oKuHx+Przzj481HgZOnG6QA4V9J2Tr8vt7usT3maAdi6HoOCfdilv3JxOisLGTYAjVay
         l0jA==
X-Forwarded-Encrypted: i=1; AJvYcCXXgk3r5wA04tTYWBpWoor60x015OM0YGtOxFCIbnquxB4He8UODrBWlnNWcd742GIarbY9/gii0zA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz/icDEQaHSU3f1sq6w019jb+nfhx0kiyb5lBpkkjd/9kPPEJyi
	W9wD4SZn2ekXb0CAHjVDT+mgXF5i8ImCZ1+uQGmK5fAf5Ca5TRvL5YCD8W10JwW2uWOQG63mfGf
	uoKjZ5133VXltfB09VwhhNMLD4ZoC3l4YwwnQduAtZYQwyXYz74Dr5ogsRerS3bWV
X-Received: by 2002:a5d:5f54:0:b0:37d:373c:ed24 with SMTP id ffacd0b85a97d-381c7a3a49cmr8192656f8f.4.1730712414699;
        Mon, 04 Nov 2024 01:26:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHUG4i3r4RT/0mDz+U1cY7m40dZcu2ijC6eEouX1uNQBldOHTZd5hoduIq2TUsnjYO3wLrnew==
X-Received: by 2002:a5d:5f54:0:b0:37d:373c:ed24 with SMTP id ffacd0b85a97d-381c7a3a49cmr8192628f8f.4.1730712414212;
        Mon, 04 Nov 2024 01:26:54 -0800 (PST)
Message-ID: <a8d9f32f60f55c58d79943c4409b8b94535ff853.camel@redhat.com>
Subject: Re: [PATCH 01/13] PCI: Prepare removing devres from pci_intx()
From: Philipp Stanner <pstanner@redhat.com>
To: Thomas Gleixner <tglx@linutronix.de>, Damien Le Moal
 <dlemoal@kernel.org>,  Niklas Cassel <cassel@kernel.org>, Sergey Shtylyov
 <s.shtylyov@omp.ru>, Basavaraj Natikar <basavaraj.natikar@amd.com>, Jiri
 Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Dubov <oakad@yahoo.com>, Sudarsana Kalluru <skalluru@marvell.com>,
 Manish Chopra <manishc@marvell.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rasesh Mody
 <rmody@marvell.com>, GR-Linux-NIC-Dev@marvell.com, Igor Mitsyanko
 <imitsyanko@quantenna.com>, Sergey Matyukevich <geomatsi@gmail.com>, Kalle
 Valo <kvalo@kernel.org>, Sanjay R Mehta <sanju.mehta@amd.com>, Shyam Sundar
 S K <Shyam-sundar.S-k@amd.com>, Jon Mason <jdmason@kudzu.us>, Dave Jiang
 <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Alex Williamson <alex.williamson@redhat.com>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, Chen Ni <nichen@iscas.ac.cn>, Mario Limonciello
 <mario.limonciello@amd.com>, Ricky Wu <ricky_wu@realtek.com>, Al Viro
 <viro@zeniv.linux.org.uk>, Breno Leitao <leitao@debian.org>, Kevin Tian
 <kevin.tian@intel.com>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Mostafa Saleh <smostafa@google.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Yi Liu <yi.l.liu@intel.com>, Christian
 Brauner <brauner@kernel.org>, Ankit Agrawal <ankita@nvidia.com>, Eric Auger
 <eric.auger@redhat.com>, Reinette Chatre <reinette.chatre@intel.com>, Ye
 Bin <yebin10@huawei.com>, Marek =?ISO-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.dev>, Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,  Rui Salvaterra <rsalvaterra@gmail.com>
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, netdev@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ntb@lists.linux.dev,
 linux-pci@vger.kernel.org,  kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-sound@vger.kernel.org
Date: Mon, 04 Nov 2024 10:26:51 +0100
In-Reply-To: <87cyjgwfmo.ffs@tglx>
References: <20241015185124.64726-1-pstanner@redhat.com>
	 <20241015185124.64726-2-pstanner@redhat.com> <87cyjgwfmo.ffs@tglx>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2024-10-31 at 14:45 +0100, Thomas Gleixner wrote:
> On Tue, Oct 15 2024 at 20:51, Philipp Stanner wrote:
> > +/**
> > + * pci_intx - enables/disables PCI INTx for device dev, unmanaged
> > version
>=20
> mismatch vs. actual function name.

ACK, will fix

>=20
> > + * @pdev: the PCI device to operate on
> > + * @enable: boolean: whether to enable or disable PCI INTx
> > + *
> > + * Enables/disables PCI INTx for device @pdev
> > + *
> > + * This function behavios identically to pci_intx(), but is never
> > managed with
> > + * devres.
> > + */
> > +void pci_intx_unmanaged(struct pci_dev *pdev, int enable)
>=20
> This is a misnomer. The function controls the INTX_DISABLE bit of a
> PCI device. Something like this:
>=20
> void __pci_intx_control()
> {
> }
>=20
> static inline void pci_intx_enable(d)
> {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __pci_intx_control(d, true);
> }
>=20
> .....
>=20
> makes it entirely clear what this is about.

Well, I would agree if it were about writing a 'real' new function. But
this is actually about creating a _temporary_ function which is added
here and removed again in patch 12 of this same series.

It wouldn't even be needed; the only reason why it exists is to make it
easy for the driver maintainers concerned by patches 2-11 to review the
change and understand what's going on. Hence it is
"pci_intx_unmanaged()" =3D=3D "Attention, we take automatic management away
from your driver"

pci_intx() is then fully restored after patch 12 and it keeps its old
name.

Gr=C3=BC=C3=9Fe,
Philipp


>=20
> Hmm?
>=20
> Thanks,
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tglx
>=20


