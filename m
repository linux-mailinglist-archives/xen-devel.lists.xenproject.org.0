Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B60B99A35C
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2024 14:08:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816992.1231097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szER5-00089m-TV; Fri, 11 Oct 2024 12:07:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816992.1231097; Fri, 11 Oct 2024 12:07:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szER5-00086x-QD; Fri, 11 Oct 2024 12:07:59 +0000
Received: by outflank-mailman (input) for mailman id 816992;
 Fri, 11 Oct 2024 12:07:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HAGb=RH=redhat.com=pstanner@srs-se1.protection.inumbo.net>)
 id 1szER3-0007jz-Ur
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2024 12:07:57 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72fbf564-87c9-11ef-a0bd-8be0dac302b0;
 Fri, 11 Oct 2024 14:07:57 +0200 (CEST)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-yanmd-OxMHW1decCApMelQ-1; Fri, 11 Oct 2024 08:07:53 -0400
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43057c9b32bso12260865e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 11 Oct 2024 05:07:53 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3d05:4700:3e59:7d70:cabd:144b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431182d7929sm40692135e9.4.2024.10.11.05.07.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2024 05:07:50 -0700 (PDT)
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
X-Inumbo-ID: 72fbf564-87c9-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728648475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MwKBr4MW13REKEdZEAqTL7D+rRGFsGjM7n9xGoHUCEw=;
	b=LyAC5Pmw3syzJenHzvdqCObXZtgZ/Fp6azkWcy0NIy5N36U+PNgK8BDipIwSfeBrRBgzlT
	4UTbnZJrWHTtPsvqO9hubsFwWp9uTcwOw2GBes5dhB4oeJRqYRF49UShG2ufKBHU/fzp4t
	DmouwrSVJiL36FnVsxmAD2fLhuCjefQ=
X-MC-Unique: yanmd-OxMHW1decCApMelQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728648472; x=1729253272;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MwKBr4MW13REKEdZEAqTL7D+rRGFsGjM7n9xGoHUCEw=;
        b=jS1AYMTDkquO8ZEFxlpd5CP7GJrUOYTliCdbSKgmMvE6e6xC3jpR4XhDPHaEr4G/1u
         asoXsa21+9zWK0bOj+dFiG0puHUQ3fv0BcxCfbsq485eQ4zGG8VCF+mq6UFsfMIbYOzn
         kvtk7KtlVjcne3eUZhs8X71I/GXOQd5MEmzEJPE7XJEC/dlrxS54Ol6BQuBWMgOsjDi3
         6pnSgecbLjq+VNtiHek1JmVTjFWGJ/G4L11D1OH89x47jG/JXsnPRzWcnxqYDv3f/j4g
         uogrHap0EYZSYpINeiOjb5bnV9RQtGl/5DSLaRs9xc8Fs90UThO8l6dlFFLo4hbYXayj
         MOqw==
X-Forwarded-Encrypted: i=1; AJvYcCUI3M2g7LxEOPz+snFjn1CcUSwsQKIOBPaW1qe0EWmijympVI5ZeZOt/wdcp+gJd2upN4RCGW86jLI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz5HF0zcDG0fQWTIG+ABFzfPsDFXe0F+yEYPDHj94g5j7cYUkeq
	/FMsBE/dxOCYBDr9/gFPZiJtLWLUUFNxNaCeMPoWjXy7Gq2rQfuMghzIK21jBJXsgXLnTF1WOup
	UhPvCvTrGfKBT+Qux3dXRvAZo80WG2bqz+wOVLdcx9HCTmClMPwgMNHc82Bm3q+bO
X-Received: by 2002:a05:600c:1d26:b0:42f:75cd:2566 with SMTP id 5b1f17b1804b1-4311deaea05mr17632295e9.2.1728648472039;
        Fri, 11 Oct 2024 05:07:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfafWJbYY7XgafIoUBODjA0mqAG0Im27BYfV9oETn5/NEqgGUi/qx3b+BLDWe06kqudkM50g==
X-Received: by 2002:a05:600c:1d26:b0:42f:75cd:2566 with SMTP id 5b1f17b1804b1-4311deaea05mr17631395e9.2.1728648471511;
        Fri, 11 Oct 2024 05:07:51 -0700 (PDT)
Message-ID: <a688a4109e292d7510ebd7206bd3296e23ca1e3b.camel@redhat.com>
Subject: Re: [RFC PATCH 13/13] Remove devres from pci_intx()
From: Philipp Stanner <pstanner@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Damien Le Moal
 <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, Sergey Shtylyov
 <s.shtylyov@omp.ru>, Basavaraj Natikar <basavaraj.natikar@amd.com>, Jiri
 Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Dubov <oakad@yahoo.com>, Sudarsana Kalluru <skalluru@marvell.com>,
 Manish Chopra <manishc@marvell.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rasesh Mody
 <rmody@marvell.com>,  GR-Linux-NIC-Dev@marvell.com, Igor Mitsyanko
 <imitsyanko@quantenna.com>,  Sergey Matyukevich <geomatsi@gmail.com>, Kalle
 Valo <kvalo@kernel.org>, Sanjay R Mehta <sanju.mehta@amd.com>, Shyam Sundar
 S K <Shyam-sundar.S-k@amd.com>, Jon Mason <jdmason@kudzu.us>, Dave Jiang
 <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Juergen Gross <jgross@suse.com>, Stefano Stabellini
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
Date: Fri, 11 Oct 2024 14:07:48 +0200
In-Reply-To: <20241010114314.296db535.alex.williamson@redhat.com>
References: <20241009083519.10088-1-pstanner@redhat.com>
	 <20241009083519.10088-14-pstanner@redhat.com>
	 <7f624c83-115b-4045-b068-0813a18c8200@stanley.mountain>
	 <f42bb5de4c9aca307a3431dd15ace4c9cade1cb9.camel@redhat.com>
	 <20241010114314.296db535.alex.williamson@redhat.com>
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2024-10-10 at 11:43 -0600, Alex Williamson wrote:
> On Thu, 10 Oct 2024 11:11:36 +0200
> Philipp Stanner <pstanner@redhat.com> wrote:
>=20
> > On Thu, 2024-10-10 at 11:50 +0300, Dan Carpenter wrote:
> > > On Wed, Oct 09, 2024 at 10:35:19AM +0200, Philipp Stanner wrote:=C2=
=A0
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
> > > > Remove the devres functionality from pci_intx(). Remove
> > > > pci_intx_unmanaged().
> > > > Have all users of pci_intx_unmanaged() call pci_intx().
> > > >=20
> > > > Signed-off-by: Philipp Stanner <pstanner@redhat.com>=C2=A0=20
> > >=20
> > > I don't like when we change a function like this but it still
> > > compiles fine.
> > > If someone is working on a driver and hasn't pushed it yet, then
> > > it's
> > > probably
> > > supposed to be using the new pcim_intx() but they won't discover
> > > that
> > > until they
> > > detect the leaks at runtime.=C2=A0=20
> >=20
> > There wouldn't be any *leaks*, it's just that the INTx state would
> > not
> > automatically be restored. BTW the official documentation in its
> > current state does not hint at pci_intx() doing anything
> > automatically,
> > but rather actively marks it as deprecated.
> >=20
> > But you are right that a hypothetical new driver and OOT drivers
> > could
> > experience bugs through this change.
> >=20
> > >=20
> > > Why not leave the pci_intx_unmanaged() name.=C2=A0 It's ugly and that
> > > will
> > > discorage
> > > people from introducing new uses.=C2=A0=20
> >=20
> > I'd be OK with that. Then we'd have to remove pci_intx() as it has
> > new
> > users anymore.
> >=20
> > Either way should be fine and keep the behavior for existing
> > drivers
> > identical.
> >=20
> > I think Bjorn should express a preference
>=20
> FWIW, I think pcim_intx() and pci_intx() align better to our naming
> convention for devres interfaces.

Yup, also my personal preference. But we can mark those functions as
deprecated via docstring-comment. That should fullfill Damien's goal.

> =C2=A0 Would it be sufficient if pci_intx()
> triggered a WARN_ON if called for a pci_is_managed() device?

No, I don't think that's a good idea; reason being that
pci_is_managed() just checks that global boolean which we inherited
from the old implementation and which should not be necessary with
proper devres.
The boolean is used for making functions such as pci_intx() and
__pci_request_region() hybrid. So with our non-hybrid version we never
need it.

P.

> =C2=A0 Thanks,
>=20
> Alex
>=20


