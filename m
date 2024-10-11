Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C3E99A3B2
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2024 14:17:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.817002.1231107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szEZ6-0001Or-Jq; Fri, 11 Oct 2024 12:16:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 817002.1231107; Fri, 11 Oct 2024 12:16:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szEZ6-0001MF-Gi; Fri, 11 Oct 2024 12:16:16 +0000
Received: by outflank-mailman (input) for mailman id 817002;
 Fri, 11 Oct 2024 12:16:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HAGb=RH=redhat.com=pstanner@srs-se1.protection.inumbo.net>)
 id 1szEZ5-0001M9-3g
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2024 12:16:15 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9af4a98d-87ca-11ef-a0bd-8be0dac302b0;
 Fri, 11 Oct 2024 14:16:13 +0200 (CEST)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-339-W5qLY6JVMlCTZpeTFVPQvw-1; Fri, 11 Oct 2024 08:16:10 -0400
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-42cb635b108so12315665e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 11 Oct 2024 05:16:10 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3d05:4700:3e59:7d70:cabd:144b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-430ccf4841asm73010925e9.19.2024.10.11.05.16.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2024 05:16:08 -0700 (PDT)
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
X-Inumbo-ID: 9af4a98d-87ca-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728648972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8DzWcgAzoXUhVubU9tIpQ2PRRCDDT62+SnuJMczqGUs=;
	b=T1esOLKVX9KzsX8/q5YrjHDvjkbL+Gum+irNFoD3/wV0Fu67ZyR+GvZLnUkRSYYAwsQpzh
	i8EOU5hxvqOPlEWXSsQFUHgLG70mkg05FOLywRVEbiZOrqmp5/KlnIrwQ0bUbiag5TpWMw
	7bbBfAd3B0zm6E9IBiZazmllVWgm38g=
X-MC-Unique: W5qLY6JVMlCTZpeTFVPQvw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728648969; x=1729253769;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W3YR/eN7EDVZPnEUtVVl/DT7O1jzPEky1m6YBwoyhuE=;
        b=rLSZNmLMX63euihBINUYi82sFfFSnfD04V4F9L/cmzr7Haryt/dMdtiOwkgNGH+3VR
         cUQuuQTgHf8QSmfIv8zFdB70kYaYpYPl9WdNl1/pXxNT7FTJkU7DbLoaQsSdEo4DHJ7Q
         xYKLa8OZdtWb3VWCtuUSCM1WysXu7a98p+TFffgZHLBehOo4+NtEu4rtgmvuD/wqvfCm
         mJOJn2YTf+/sy6iTzKyQv97HyrtNl2GAV1IvUiQAipY8fG68w8TvidtzZ3wvqotT6cUA
         mIo50BH32karZP8MxIeLvcA2aBgwwvcX4H5Q7uvXRvfYIC3RycIN+J7i/4FyuDt7MYrB
         6J+A==
X-Forwarded-Encrypted: i=1; AJvYcCW79xzQAK1p0HhfacXTuAhFWMyrokQuZVtCeeVQQU2jZVFKUHdfbQN5kX6O6O+k+ukglekVNSrJckw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxqmDkm/upCuEJ7agKoXUwuaBX8tbBIvRlDV3dYw8PBLRedvwM0
	BrI/O9Q8+fuG2rPKhXXu/kR6wqlWF8lTFQDO5owGlGlxOs9yhy4KPke00trHksrwmfPG3eXYwN+
	DMyTRhHBfJKfWbgGjPBJG01rGULMkZEShqPWMOb8IzE8GuZOoLDDLXQt8SzJNkh/0
X-Received: by 2002:a05:600c:1d0e:b0:42c:b2fa:1c0a with SMTP id 5b1f17b1804b1-4311df429c8mr19539435e9.23.1728648969419;
        Fri, 11 Oct 2024 05:16:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJ7w0P8euwuh1uWsgO1hBzdaK+5QHv+AFGT0Iwx99lPo3ic55Ocuel+lqlVPvlsAnC7ezD6A==
X-Received: by 2002:a05:600c:1d0e:b0:42c:b2fa:1c0a with SMTP id 5b1f17b1804b1-4311df429c8mr19538645e9.23.1728648968995;
        Fri, 11 Oct 2024 05:16:08 -0700 (PDT)
Message-ID: <f65e9fa01a1947782fc930876e5f84174408db67.camel@redhat.com>
Subject: Re: [RFC PATCH 01/13] PCI: Prepare removing devres from pci_intx()
From: Philipp Stanner <pstanner@redhat.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
 Iwai <tiwai@suse.com>, Mario Limonciello <mario.limonciello@amd.com>, Chen
 Ni <nichen@iscas.ac.cn>, Ricky Wu <ricky_wu@realtek.com>, Al Viro
 <viro@zeniv.linux.org.uk>, Breno Leitao <leitao@debian.org>, Kevin Tian
 <kevin.tian@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Mostafa Saleh
 <smostafa@google.com>, Hannes Reinecke <hare@suse.de>, John Garry
 <john.g.garry@oracle.com>, Soumya Negi <soumya.negi97@gmail.com>, Jason
 Gunthorpe <jgg@ziepe.ca>, Yi Liu <yi.l.liu@intel.com>, "Dr. David Alan
 Gilbert" <linux@treblig.org>, Christian Brauner <brauner@kernel.org>, Ankit
 Agrawal <ankita@nvidia.com>, Reinette Chatre <reinette.chatre@intel.com>,
 Eric Auger <eric.auger@redhat.com>, Ye Bin <yebin10@huawei.com>, Marek
 =?ISO-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,  Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>, Rui Salvaterra <rsalvaterra@gmail.com>,
 Marc Zyngier <maz@kernel.org>, linux-ide@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-input@vger.kernel.org,
 netdev@vger.kernel.org,  linux-wireless@vger.kernel.org,
 ntb@lists.linux.dev, linux-pci@vger.kernel.org, 
 linux-staging@lists.linux.dev, kvm@vger.kernel.org, 
 xen-devel@lists.xenproject.org, linux-sound@vger.kernel.org
Date: Fri, 11 Oct 2024 14:16:06 +0200
In-Reply-To: <ZwfnULv2myACxnVb@smile.fi.intel.com>
References: <20241009083519.10088-1-pstanner@redhat.com>
	 <20241009083519.10088-2-pstanner@redhat.com>
	 <ZwfnULv2myACxnVb@smile.fi.intel.com>
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2024-10-10 at 17:40 +0300, Andy Shevchenko wrote:
> On Wed, Oct 09, 2024 at 10:35:07AM +0200, Philipp Stanner wrote:
> > pci_intx() is a hybrid function which sometimes performs devres
> > operations, depending on whether pcim_enable_device() has been used
> > to
> > enable the pci_dev. This sometimes-managed nature of the function
> > is
> > problematic. Notably, it causes the function to allocate under some
> > circumstances which makes it unusable from interrupt context.
> >=20
> > To, ultimately, remove the hybrid nature from pci_intx(), it is
> > first
> > necessary to provide an always-managed and a never-managed version
> > of that function. Then, all callers of pci_intx() can be ported to
> > the
> > version they need, depending whether they use pci_enable_device()
> > or
> > pcim_enable_device().
> >=20
> > An always-managed function exists, namely pcim_intx(), for which
> > __pcim_intx(), a never-managed version of pci_intx() had been
> > implemented.
>=20
> > Make __pcim_intx() a public function under the name
> > pci_intx_unmanaged(). Make pcim_intx() a public function.
>=20
> To avoid an additional churn we can make just completely new APIs,
> namely:
> pcim_int_x()
> pci_int_x()
>=20
> You won't need all dirty dances with double underscored function
> naming and
> renaming.

=C3=84hm.. I can't follow. The new version doesn't use double underscores
anymore. __pcim_intx() is being removed, effectively.
After this series, we'd end up with a clean:

=09pci_intx() <-> pcim_intx()

just as in the other PCI APIs.


>=20
>=20
> ...
>=20
> > +=09pci_read_config_word(pdev, PCI_COMMAND, &pci_command);
> > +
> > +=09if (enable)
> > +=09=09new =3D pci_command & ~PCI_COMMAND_INTX_DISABLE;
> > +=09else
> > +=09=09new =3D pci_command | PCI_COMMAND_INTX_DISABLE;
> > +
> > +=09if (new !=3D pci_command)
>=20
> I would use positive conditionals as easy to read (yes, a couple of
> lines
> longer, but also a win is the indentation and avoiding an additional
> churn in
> the future in case we need to add something in this branch.

I can't follow. You mean:

if (new =3D=3D pci_command)
    return;

?

That's exactly the same level of indentation. Plus, I just copied the
code.

>=20
> > +=09=09pci_write_config_word(pdev, PCI_COMMAND, new);
>=20
> ...
>=20
> Otherwise I'm for the idea in general.

\o/

>=20


