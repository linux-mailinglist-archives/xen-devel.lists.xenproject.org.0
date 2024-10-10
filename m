Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D359981AD
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 11:12:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815858.1230091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sypD2-0002S0-BQ; Thu, 10 Oct 2024 09:11:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815858.1230091; Thu, 10 Oct 2024 09:11:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sypD2-0002QK-7M; Thu, 10 Oct 2024 09:11:48 +0000
Received: by outflank-mailman (input) for mailman id 815858;
 Thu, 10 Oct 2024 09:11:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qC6z=RG=redhat.com=pstanner@srs-se1.protection.inumbo.net>)
 id 1sypD1-0002QE-9P
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 09:11:47 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id abb6af13-86e7-11ef-a0bd-8be0dac302b0;
 Thu, 10 Oct 2024 11:11:45 +0200 (CEST)
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-LzH53bzWPoOSYHlHFYpBcg-1; Thu, 10 Oct 2024 05:11:40 -0400
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-53991bb134bso444049e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 10 Oct 2024 02:11:40 -0700 (PDT)
Received: from dhcp-64-16.muc.redhat.com (nat-pool-muc-t.redhat.com.
 [149.14.88.26]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d4b79fdc2sm949476f8f.88.2024.10.10.02.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2024 02:11:38 -0700 (PDT)
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
X-Inumbo-ID: abb6af13-86e7-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728551504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+ex92FX/6NsvBWmXun+uf0gF3wK3BeTi9EqHuTvNsZQ=;
	b=aI3DpDX06ByTUbEOGcSHGw0XgaA8VQ0q+/pk5Hl5RiyESo3Wq3irRC0zA7kSF5fG5vse3t
	QOUQ0qZ9Dsxu8HH3jBd9zvBP3gLtEM9FJPvE41mAf9qq3kye3XzGVwjUvbpXDZIOJJMiH4
	l5Q29pQDuFVRXh+qs5/FB7F3RJAKXRc=
X-MC-Unique: LzH53bzWPoOSYHlHFYpBcg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728551499; x=1729156299;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+ex92FX/6NsvBWmXun+uf0gF3wK3BeTi9EqHuTvNsZQ=;
        b=HgvHO2PHmGfrYjGZEF5RgMJ2kLcnkOtZ4Zzx3fT4XNRToqcVDwWg34nH5UU4rX9z5q
         po3Ru0VVgomDVZTV3avPcN5nBEY2gAaE/8cBvvfgnN4Emb4i9DMT+JOm8aV3dkWOj1qp
         T7+phuNJTxqMKDUR64jezDNtDhNZv7HQ51/QUPUR9R1PeBe2gYmVh6n0NqGE2KHTELLV
         0SorYyWKoCG/VEHGbfzV3dYGf/rLhDjzLEYf+BpLZ2nHxXxWFWdQwmSA5whM0DmKPXFi
         9+NTPenMqvJmR8SS1OeA0VzMXzELkBl6E293QaTYXzbQR3sEUMqfqKLwD5ek/u8P69ql
         XVSg==
X-Forwarded-Encrypted: i=1; AJvYcCV8BMHjO5Nm/Umikvgjh3UK0HesmTX61EZ7y3Iu1HTY3s09Cw7OsMXaNOmUKiTdXMr3JoWmaSsVkNg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxOjADm25CgXS+jL527dr1Se5jB/SlpZ5gzi3fOUsXdLSbJBlHj
	128BamMNaWO/lio00m6sR8naZQf6Yzztw5OyHS/nA2iRGYCi8Hz7hpYzAvwVpGSYwmv3rmxatV3
	/cniBH1UD3IzXaDP2aj6fbsUnqyiYIAkbciM6dIl6MTa7LjK8urtgOIUkGd1kW2Oj
X-Received: by 2002:a05:6512:10d1:b0:536:55ae:7444 with SMTP id 2adb3069b0e04-539c4896eb7mr3177293e87.22.1728551499304;
        Thu, 10 Oct 2024 02:11:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExq3OJhlyNTGpjtR1+LjaW3R0iv5Mu7sB9drW/xRJaoCLaoe8gSPgF49M2/ruF8wr/J6TLJA==
X-Received: by 2002:a05:6512:10d1:b0:536:55ae:7444 with SMTP id 2adb3069b0e04-539c4896eb7mr3177227e87.22.1728551498734;
        Thu, 10 Oct 2024 02:11:38 -0700 (PDT)
Message-ID: <f42bb5de4c9aca307a3431dd15ace4c9cade1cb9.camel@redhat.com>
Subject: Re: [RFC PATCH 13/13] Remove devres from pci_intx()
From: Philipp Stanner <pstanner@redhat.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
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
Date: Thu, 10 Oct 2024 11:11:36 +0200
In-Reply-To: <7f624c83-115b-4045-b068-0813a18c8200@stanley.mountain>
References: <20241009083519.10088-1-pstanner@redhat.com>
	 <20241009083519.10088-14-pstanner@redhat.com>
	 <7f624c83-115b-4045-b068-0813a18c8200@stanley.mountain>
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2024-10-10 at 11:50 +0300, Dan Carpenter wrote:
> On Wed, Oct 09, 2024 at 10:35:19AM +0200, Philipp Stanner wrote:
> > pci_intx() is a hybrid function which can sometimes be managed
> > through
> > devres. This hybrid nature is undesirable.
> >=20
> > Since all users of pci_intx() have by now been ported either to
> > always-managed pcim_intx() or never-managed pci_intx_unmanaged(),
> > the
> > devres functionality can be removed from pci_intx().
> >=20
> > Consequently, pci_intx_unmanaged() is now redundant, because
> > pci_intx()
> > itself is now unmanaged.
> >=20
> > Remove the devres functionality from pci_intx(). Remove
> > pci_intx_unmanaged().
> > Have all users of pci_intx_unmanaged() call pci_intx().
> >=20
> > Signed-off-by: Philipp Stanner <pstanner@redhat.com>
>=20
> I don't like when we change a function like this but it still
> compiles fine.
> If someone is working on a driver and hasn't pushed it yet, then it's
> probably
> supposed to be using the new pcim_intx() but they won't discover that
> until they
> detect the leaks at runtime.

There wouldn't be any *leaks*, it's just that the INTx state would not
automatically be restored. BTW the official documentation in its
current state does not hint at pci_intx() doing anything automatically,
but rather actively marks it as deprecated.

But you are right that a hypothetical new driver and OOT drivers could
experience bugs through this change.

>=20
> Why not leave the pci_intx_unmanaged() name.=C2=A0 It's ugly and that wil=
l
> discorage
> people from introducing new uses.

I'd be OK with that. Then we'd have to remove pci_intx() as it has new
users anymore.

Either way should be fine and keep the behavior for existing drivers
identical.

I think Bjorn should express a preference

P.

>=20
> regards,
> dan carpenter
>=20


