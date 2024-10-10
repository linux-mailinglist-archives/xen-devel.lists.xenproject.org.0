Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE11997EA4
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 10:03:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815652.1229644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syo99-000312-AK; Thu, 10 Oct 2024 08:03:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815652.1229644; Thu, 10 Oct 2024 08:03:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syo99-0002zF-6a; Thu, 10 Oct 2024 08:03:43 +0000
Received: by outflank-mailman (input) for mailman id 815652;
 Thu, 10 Oct 2024 08:03:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qC6z=RG=redhat.com=pstanner@srs-se1.protection.inumbo.net>)
 id 1syo98-0002hR-9T
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 08:03:42 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28706312-86de-11ef-99a2-01e77a169b0f;
 Thu, 10 Oct 2024 10:03:40 +0200 (CEST)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-547-YIxMJ3kNOQyo82OvGeYG7Q-1; Thu, 10 Oct 2024 04:03:37 -0400
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-37d45f1e935so239812f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 10 Oct 2024 01:03:37 -0700 (PDT)
Received: from dhcp-64-16.muc.redhat.com (nat-pool-muc-t.redhat.com.
 [149.14.88.26]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d4b7edecasm776544f8f.97.2024.10.10.01.03.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2024 01:03:33 -0700 (PDT)
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
X-Inumbo-ID: 28706312-86de-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728547418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o6Yj13wTDdGSHGjmO/sKiO7EHFlnxmZYRbSplb6dOKU=;
	b=Ky3II9Pe3t+C8sy+q5JqGqtM4N6q9hBTKb3fJQlgpGWMAjh/9cw+QGUXkpPqBg1rpTBzT8
	V4UmNt3nnLLogexCYPieKb+IRFQhRRogi+ShxZMy9j5iU2XQht2xYDAkOysu8eD3CrUejR
	B7Q/maoBGW7UXO+VSgfbhrm788fJ/ZA=
X-MC-Unique: YIxMJ3kNOQyo82OvGeYG7Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728547415; x=1729152215;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o6Yj13wTDdGSHGjmO/sKiO7EHFlnxmZYRbSplb6dOKU=;
        b=K0+LBCj2I6P98SKBHXaF6SBuFfsBw9OeQs5aWHt3Z3pr1sJ/bfTZYZHDxBFkrTGN3p
         rKVvG5NfW7qwwyLwl1Tooo7QFJKkETcCak7xha/4iaQNO9OYe5giIifJmTwLKAPA5W8N
         zNYHtpZ1l8EHSpgNQv0D8jsVJKpHMCPIrksn4fg1urKzgOdPnE6dBxNu1H82qstYDpGx
         65IgyJUVOkLaNVFNzKdPV2PvCvPgM19jLkzC6ZzXOpvjQZJJ0856Jb70ifyzA7u86zHR
         T07ID+jwAixILDSfZihxNu+d4eJxuMuXrT1DC8rGTanSCktnv3MISPICuSD7Wqa+4nbE
         Ks6A==
X-Forwarded-Encrypted: i=1; AJvYcCU08vwutwQD3RqhCr2ucbLKLSkfjygv3G7NuZtv4QZJThpGwptr/1FBVFFoUATbGRIdfNt70PYL9+o=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx26VVFKyb4wWi6qvayn6MvqpInxbMjjR4tMLUST6IetIRDBwW0
	ydVaeM6eTJNNmKUcXFzIZrUfYGnYu4+XVfZM+zT7tPj41b9OsSQgbbqKepSVvWEphEDefAatwjQ
	7Czd0qnSaNcnv6qxYRdsbDClHanzjiJLmukPHRPQGbBO1REGhzTDM2vuKjwLj377S
X-Received: by 2002:adf:f3c7:0:b0:37c:d299:b5f0 with SMTP id ffacd0b85a97d-37d3ab44f04mr2752605f8f.59.1728547414858;
        Thu, 10 Oct 2024 01:03:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCPZ/N+8I6yvkHpm2WH4x1aWbcKYPe3oMumoEtWLk5b9nz8TmEseUc5OhVu0HO7+xCgvRnQw==
X-Received: by 2002:adf:f3c7:0:b0:37c:d299:b5f0 with SMTP id ffacd0b85a97d-37d3ab44f04mr2752523f8f.59.1728547414296;
        Thu, 10 Oct 2024 01:03:34 -0700 (PDT)
Message-ID: <b57dbf0c83125d58e4e2b488b5b5f71410fd8d6a.camel@redhat.com>
Subject: Re: [RFC PATCH 10/13] staging: rts5280: Use always-managed version
 of pci_intx()
From: Philipp Stanner <pstanner@redhat.com>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
 Sergey Shtylyov <s.shtylyov@omp.ru>, Basavaraj Natikar
 <basavaraj.natikar@amd.com>, Jiri Kosina <jikos@kernel.org>,  Benjamin
 Tissoires <bentiss@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Alex Dubov
 <oakad@yahoo.com>,  Sudarsana Kalluru <skalluru@marvell.com>, Manish Chopra
 <manishc@marvell.com>, "David S. Miller" <davem@davemloft.net>,  Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>,  Rasesh Mody <rmody@marvell.com>,
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
 <smostafa@google.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hannes Reinecke <hare@suse.de>, John Garry <john.g.garry@oracle.com>,
 Soumya Negi <soumya.negi97@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>, Yi
 Liu <yi.l.liu@intel.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
 Christian Brauner <brauner@kernel.org>, Ankit Agrawal <ankita@nvidia.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Eric Auger
 <eric.auger@redhat.com>, Ye Bin <yebin10@huawei.com>, Marek
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
Date: Thu, 10 Oct 2024 10:03:30 +0200
In-Reply-To: <411f3c94-58b5-471e-bc58-e23d89d2078f@gmail.com>
References: <20241009083519.10088-1-pstanner@redhat.com>
	 <20241009083519.10088-11-pstanner@redhat.com>
	 <2024100936-brunette-flannels-0d82@gregkh>
	 <411f3c94-58b5-471e-bc58-e23d89d2078f@gmail.com>
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2024-10-09 at 21:41 +0200, Philipp Hortmann wrote:
> On 10/9/24 11:38, Greg Kroah-Hartman wrote:
> > On Wed, Oct 09, 2024 at 10:35:16AM +0200, Philipp Stanner wrote:
> > > pci_intx() is a hybrid function which can sometimes be managed
> > > through
> > > devres. To remove this hybrid nature from pci_intx(), it is
> > > necessary to
> > > port users to either an always-managed or a never-managed
> > > version.
> > >=20
> > > rts5208 enables its PCI-Device with pcim_enable_device(). Thus,
> > > it needs the
> > > always-managed version.
> > >=20
> > > Replace pci_intx() with pcim_intx().
> > >=20
> > > Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> > > ---
> > > =C2=A0 drivers/staging/rts5208/rtsx.c | 2 +-
> > > =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >=20
>=20
> Hi Philipp,
>=20
> this driver (rts5208) will be removed soon - patch is send in.
>=20
> Discussion about removal:
> https://lore.kernel.org/linux-staging/2024100943-shank-washed-a765@gregkh=
/T/#t


Alright, thx for the heads up.

I'm not entirely how best to deal with that, though. I could drop this
patch, but then the driver would end up with an unmanaged pci_intx().

Might this be a problem for users if my series lands sooner than the
removal, say in v6.13 and your removal in v6.14?

P.

>=20
> Thanks for your support.
>=20
> Bye Philipp
>=20


