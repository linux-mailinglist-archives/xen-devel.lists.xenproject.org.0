Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A869AFCC8
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2024 10:39:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825675.1239953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4Fpk-0002Fs-5i; Fri, 25 Oct 2024 08:38:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825675.1239953; Fri, 25 Oct 2024 08:38:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4Fpk-0002Dz-2v; Fri, 25 Oct 2024 08:38:12 +0000
Received: by outflank-mailman (input) for mailman id 825675;
 Fri, 25 Oct 2024 08:38:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/DtA=RV=redhat.com=pstanner@srs-se1.protection.inumbo.net>)
 id 1t4Fpi-0002Dr-F5
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2024 08:38:10 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75009ec8-92ac-11ef-a0bf-8be0dac302b0;
 Fri, 25 Oct 2024 10:38:07 +0200 (CEST)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-114-M_eoI-kMNI2jFpS_NdFO3A-1; Fri, 25 Oct 2024 04:38:02 -0400
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-37d5a3afa84so1054149f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Oct 2024 01:38:02 -0700 (PDT)
Received: from ?IPv6:2001:16b8:2de5:ba00:738a:c8da:daac:7543?
 (200116b82de5ba00738ac8dadaac7543.dip.versatel-1u1.de.
 [2001:16b8:2de5:ba00:738a:c8da:daac:7543])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b70c44sm932452f8f.80.2024.10.25.01.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 01:38:00 -0700 (PDT)
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
X-Inumbo-ID: 75009ec8-92ac-11ef-a0bf-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729845486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+CU0p5rXSrPP3uBwt5801R3G6t7PRg+8+rdxS6Av4Qw=;
	b=ItN5n2bvmMWT3zaOVF1BxaKMzv6b1yx6hUH3iAc4Ce/zU+C+N/O2FO/yFOnr1UxDg8Y5g2
	X63PWexd5bizFkToP+mfjPXCN50xycUaB2y25h4xIm+FOjsU3dcJokU6WkYrsfm3q9B9rk
	5nsw1Si7iUEIoJwTFHHJsEF3E1N1sJM=
X-MC-Unique: M_eoI-kMNI2jFpS_NdFO3A-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729845481; x=1730450281;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t5SfsCaa6OQtbrocW2yvj8So2+UMhrgJURtFbTDl4+U=;
        b=OHBzUGGWM1ALK9eOihNsID9JH//B05vmBrZK+LWka2hew4iA+fzvj8DbgF+oHxKLbU
         raeUzW6WUU42OWMox5zaqms2wMDAgp5dBQlSoUAiL5qeyRlPi4DTBikABgqg7k17qoYc
         CQARB0Im71W0QYjgdwj4Y3YXtkkW5ZaGUoNuHOyh2BacG6Ar51S8b3M+xL22lJuEXZPc
         pc0KGsacjDFpcZ0iCT/TjBzT6snMZm7KFr49OAnhHP0CKFVINSSITvP727RLt61gEaY7
         TOTXWE13mk4Bf7xlVTEHHwv4XpnYFY5NcwIRqow7YzWdxvNFnJuqv1eUvwDJ/v2/cSsq
         XV6w==
X-Forwarded-Encrypted: i=1; AJvYcCULunVcsPv7Ch9+PdkVFU9b/4V+DW55/hyb8L+PmVBN/TusU03BjZcRANLCL81eLFw7V/pIuL3DboE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxkvlULB6Pfke7uCIixZhRLn4YiICHx9wfxje55RwJnz9LqY6TM
	+PpW1FzE3DgFbzvabMpxrFvmQCLtB1VBA+8YK0K7NYVLcdaRH5vwZxupuoBDuZAlgD5WBmiv8ij
	eSdA5pc8ZpELqcXSQXHGptqPABZeOZhVM4aKDQTAz/FD+YH0fT1d34SX2qHFcizd2
X-Received: by 2002:a5d:45d2:0:b0:37d:5103:8894 with SMTP id ffacd0b85a97d-37efcf78dadmr5976824f8f.42.1729845481104;
        Fri, 25 Oct 2024 01:38:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcYWpz+kQZdr3vU0ccyDv2e4lUiNEwepdTyBtEeS9wkTJkf/x/0hfBIa/kJv59+/PzqJJV1A==
X-Received: by 2002:a5d:45d2:0:b0:37d:5103:8894 with SMTP id ffacd0b85a97d-37efcf78dadmr5976745f8f.42.1729845480512;
        Fri, 25 Oct 2024 01:38:00 -0700 (PDT)
Message-ID: <ae081c36c49733b007a8946dceeec0af94fc449a.camel@redhat.com>
Subject: Re: [PATCH 02/13] ALSA: hda_intel: Use always-managed version of
 pcim_intx()
From: Philipp Stanner <pstanner@redhat.com>
To: Takashi Iwai <tiwai@suse.de>
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
Date: Fri, 25 Oct 2024 10:37:57 +0200
In-Reply-To: <875xphzeun.wl-tiwai@suse.de>
References: <20241015185124.64726-1-pstanner@redhat.com>
	 <20241015185124.64726-3-pstanner@redhat.com> <87v7xk2ps5.wl-tiwai@suse.de>
	 <6f3db65fe9a5dcd1a7a8d9bd5352ecb248ef57b1.camel@redhat.com>
	 <87ttd2276j.wl-tiwai@suse.de>
	 <aec23bb79b9ff7dd7f13eb67460e0605eac22912.camel@redhat.com>
	 <875xphzeun.wl-tiwai@suse.de>
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2024-10-24 at 17:43 +0200, Takashi Iwai wrote:
> On Thu, 24 Oct 2024 10:02:59 +0200,
> Philipp Stanner wrote:
> >=20
> > On Wed, 2024-10-23 at 17:03 +0200, Takashi Iwai wrote:
> > > On Wed, 23 Oct 2024 15:50:09 +0200,
> > > Philipp Stanner wrote:
> > > >=20
> > > > On Tue, 2024-10-22 at 16:08 +0200, Takashi Iwai wrote:
> > > > > On Tue, 15 Oct 2024 20:51:12 +0200,
> > > > > Philipp Stanner wrote:
> > > > > >=20
> > > > > > pci_intx() is a hybrid function which can sometimes be
> > > > > > managed
> > > > > > through
> > > > > > devres. To remove this hybrid nature from pci_intx(), it is
> > > > > > necessary to
> > > > > > port users to either an always-managed or a never-managed
> > > > > > version.
> > > > > >=20
> > > > > > hda_intel enables its PCI-Device with pcim_enable_device().
> > > > > > Thus,
> > > > > > it needs
> > > > > > the always-managed version.
> > > > > >=20
> > > > > > Replace pci_intx() with pcim_intx().
> > > > > >=20
> > > > > > Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> > > > > > ---
> > > > > > =C2=A0sound/pci/hda/hda_intel.c | 2 +-
> > > > > > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> > > > > >=20
> > > > > > diff --git a/sound/pci/hda/hda_intel.c
> > > > > > b/sound/pci/hda/hda_intel.c
> > > > > > index b4540c5cd2a6..b44ca7b6e54f 100644
> > > > > > --- a/sound/pci/hda/hda_intel.c
> > > > > > +++ b/sound/pci/hda/hda_intel.c
> > > > > > @@ -786,7 +786,7 @@ static int azx_acquire_irq(struct azx
> > > > > > *chip,
> > > > > > int do_disconnect)
> > > > > > =C2=A0=09}
> > > > > > =C2=A0=09bus->irq =3D chip->pci->irq;
> > > > > > =C2=A0=09chip->card->sync_irq =3D bus->irq;
> > > > > > -=09pci_intx(chip->pci, !chip->msi);
> > > > > > +=09pcim_intx(chip->pci, !chip->msi);
> > > > > > =C2=A0=09return 0;
> > > > > > =C2=A0}
> > > > > > =C2=A0
> > > > >=20
> > > > > Hm, it's OK-ish to do this as it's practically same as what
> > > > > pci_intx()
> > > > > currently does.=C2=A0 But, the current code can be a bit
> > > > > inconsistent
> > > > > about
> > > > > the original intx value.=C2=A0 pcim_intx() always stores !enable
> > > > > to
> > > > > res->orig_intx unconditionally, and it means that the
> > > > > orig_intx
> > > > > value
> > > > > gets overridden at each time pcim_intx() gets called.
> > > >=20
> > > > Yes.
> > > >=20
> > > > >=20
> > > > > Meanwhile, HD-audio driver does release and re-acquire the
> > > > > interrupt
> > > > > after disabling MSI when something goes wrong, and pci_intx()
> > > > > call
> > > > > above is a part of that procedure.=C2=A0 So, it can rewrite the
> > > > > res->orig_intx to another value by retry without MSI.=C2=A0 And
> > > > > after
> > > > > the
> > > > > driver removal, it'll lead to another state.
> > > >=20
> > > > I'm not sure that I understand this paragraph completely.
> > > > Still,
> > > > could
> > > > a solution for the driver on the long-term just be to use
> > > > pci_intx()?
> > >=20
> > > pci_intx() misses the restore of the original value, so it's no
> > > long-term solution, either.
> >=20
> > Sure that is missing =E2=80=93 I was basically asking whether the drive=
r
> > could
> > live without that feature.
> >=20
> > Consider that point obsolete, see below
> >=20
> > >=20
> > > What I meant is that pcim_intx() blindly assumes the negative of
> > > the
> > > passed argument as the original state, which isn't always true.=C2=A0
> > > e.g.
> > > when the driver calls it twice with different values, a wrong
> > > value
> > > may be remembered.
> >=20
> > Ah, I see =E2=80=93 thoguh the issue is when it's called several times =
with
> > the
> > *same* value, isn't it?
> >=20
> > E.g.
> >=20
> > pcim_intx(pdev, 1); // 0 is remembered as the old value
> > pcim_intx(pdev, 1); // 0 is falsely remembered as the old value
> >=20
> > Also, it would seem that calling the function for the first time
> > like
> > that:
> >=20
> > pcim_intx(pdev, 0); // old value: 1
> >=20
> > is at least incorrect, because INTx should be 0 per default,
> > shouldn't
> > it? Could then even be a 1st class bug, because INTx would end up
> > being
> > enabled despite having been disabled all the time.
>=20
> Yeah, and the unexpected restore can happen even with a single call
> of
> pcim_intx(), if the driver calls it unnecessarily.
>=20
> > > That said, I thought of something like below.
> >=20
> > At first glance that looks like a good idea to me, thanks for
> > working
> > this out!
> >=20
> > IMO you can submit that as a patch so we can discuss it separately.
>=20
> Sure, I'm going to submit later.

I just took a look into the old implementation of pci_intx() (there was
no pcim_intx() back then), before I started cleaning up PCI's devres.
This what it looked like before
25216afc9db53d85dc648aba8fb7f6d31f2c8731:

void pci_intx(struct pci_dev *pdev, int enable)
{
=09u16 pci_command, new;

=09pci_read_config_word(pdev, PCI_COMMAND, &pci_command);

=09if (enable)
=09=09new =3D pci_command & ~PCI_COMMAND_INTX_DISABLE;
=09else
=09=09new =3D pci_command | PCI_COMMAND_INTX_DISABLE;

=09if (new !=3D pci_command) {
=09=09struct pci_devres *dr;

=09=09pci_write_config_word(pdev, PCI_COMMAND, new);

=09=09dr =3D find_pci_dr(pdev);
=09=09if (dr && !dr->restore_intx) {
=09=09=09dr->restore_intx =3D 1;
=09=09=09dr->orig_intx =3D !enable;
=09=09}
=09}
}
EXPORT_SYMBOL_GPL(pci_intx);

If I'm not mistaken the old version did not have the problem because
the value to be restored only changed if new !=3D pci_command.

That should always be correct, what do you think?

If so, only my commit 25216afc9db53d85dc648aba8fb7f6d31f2c8731 needs to
be fixed.

Thanks,
P.


>=20
>=20
> thanks,
>=20
> Takashi
>=20


