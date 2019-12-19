Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B32125A26
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 04:57:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihmr3-0007w9-3k; Thu, 19 Dec 2019 03:52:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qt5P=2J=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1ihmr1-0007w0-My
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 03:51:59 +0000
X-Inumbo-ID: e2e5d078-2212-11ea-b6f1-bc764e2007e4
Received: from wout5-smtp.messagingengine.com (unknown [64.147.123.21])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e2e5d078-2212-11ea-b6f1-bc764e2007e4;
 Thu, 19 Dec 2019 03:51:50 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 180DC4B7;
 Wed, 18 Dec 2019 22:51:49 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Wed, 18 Dec 2019 22:51:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=7U4uqi
 6ABhC5qBj9R/ZcCBmK6z8OtzvS2PRjAzZxrcs=; b=cN24tuNQVpgDP0N9I9e1G6
 rKGJKLSNZOhg1dKb/b6tcR9mw9TowqqYDgO7eD+nR1JFpexTe1ncG+bj4OtUH+TG
 N9+QYqc2Z22NJJFZzAFZlPJPsyMjzaWTevGwq1EOP8Mb7wIgcD1vW/flaKW6bwfJ
 trV9GTU5bWb2MpDvRySjPjCTxNnm8ZugnFlqcZ1lqAuidLOnxcdcTAkqFkiQUtLh
 mdguC1P25vIAlN8inBOqRHGeFVk0bkAARDBrEFeqMmStNjf1gPiY1n5ONArcMs6m
 DEH2qB+5wscGvGfLHkQ1V23KeEZKzT3dDDwB1maHmxrXF3f3NYh976u9zSuphBxw
 ==
X-ME-Sender: <xms:1PP6XdcvaXr3SRNiIoAiXSKYfOICIIiHf--aZRtQX-lshGTbOmdzGg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddutddgieduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucffohhmrghinhepmhgrrhhkmhgr
 ihhlrdhorhhgpdhinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhenucfkpheple
 durdeihedrfeegrdeffeenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
 sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiii
 gvpedt
X-ME-Proxy: <xmx:1PP6XXh1o-36POe9yRra2Wj3vLtkhFTGikWuIZQ2dJjUUKkJUaxW0g>
 <xmx:1PP6XZTdwXPUtZyO3RM_Y8FTBMkzAX3k-b8Q3mpRY5V7rWY4D-bkRg>
 <xmx:1PP6XYzvoeu6JfLEsVgwTSua7n2f8bcRhWr5EdM9massx8M8OPnMrw>
 <xmx:1PP6XXXYZN8fBxH1kTnkGQeeC1UgINnyxwmNHKt_V8YY61uY7rNOeQ>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5F40E306074E;
 Wed, 18 Dec 2019 22:51:47 -0500 (EST)
Date: Thu, 19 Dec 2019 04:51:45 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20191219035145.GC25022@mail-itl>
References: <20191203054222.7966-1-marmarek@invisiblethingslab.com>
 <20191203151733.GF980@Air-de-Roger>
MIME-Version: 1.0
In-Reply-To: <20191203151733.GF980@Air-de-Roger>
Subject: Re: [Xen-devel] [PATCH v1] xen-pciback: optionally allow interrupt
 enable flag writes
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 YueHaibing <yuehaibing@huawei.com>, open list <linux-kernel@vger.kernel.org>,
 Simon Gaiser <simon@invisiblethingslab.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: multipart/mixed; boundary="===============0469688122096229531=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============0469688122096229531==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZwgA9U+XZDXt4+m+"
Content-Disposition: inline


--ZwgA9U+XZDXt4+m+
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] [PATCH v1] xen-pciback: optionally allow interrupt
 enable flag writes

On Tue, Dec 03, 2019 at 04:17:33PM +0100, Roger Pau Monn=C3=A9 wrote:
> On Tue, Dec 03, 2019 at 06:41:56AM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > QEMU running in a stubdom needs to be able to set INTX_DISABLE, and the
> > MSI(-X) enable flags in the PCI config space. This adds an attribute
> > 'allow_interrupt_control' which when set for a PCI device allows writes
> > to this flag(s). The toolstack will need to set this for stubdoms.
> > When enabled, guest (stubdomain) will be allowed to set relevant enable
> > flags, but only one at a time - i.e. it refuses to enable more than one
> > of INTx, MSI, MSI-X at a time.
> >=20
> > This functionality is needed only for config space access done by device
> > model (stubdomain) serving a HVM with the actual PCI device. It is not
> > necessary and unsafe to enable direct access to those bits for PV domain
> > with the device attached. For PV domains, there are separate protocol
> > messages (XEN_PCI_OP_{enable,disable}_{msi,msix}) for this purpose.
> > Those ops in addition to setting enable bits, also configure MSI(-X) in
> > dom0 kernel - which is undesirable for PCI passthrough to HVM guests.
> >=20
> > This should not introduce any new security issues since a malicious
> > guest (or stubdom) can already generate MSIs through other ways, see
> > [1] page 8. Additionally, when qemu runs in dom0, it already have direct
> > access to those bits.
> >=20
> > This is the second iteration of this feature. First was proposed as a
> > direct Xen interface through a new hypercall, but ultimately it was
> > rejected by the maintainer, because of mixing pciback and hypercalls for
> > PCI config space access isn't a good design. Full discussion at [2].
> >=20
> > [1]: https://invisiblethingslab.com/resources/2011/Software%20Attacks%2=
0on%20Intel%20VT-d.pdf
> > [2]: https://xen.markmail.org/thread/smpgpws4umdzizze
> >=20
> > [part of the commit message and sysfs handling]
> > Signed-off-by: Simon Gaiser <simon@invisiblethingslab.com>
> > [the rest]
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
> > I'm not very happy about code duplication regarding MSI/MSI-X/INTx
> > exclusivity test, but I don't have better ideas how to structure it. Any
> > suggestions?
>=20
> Can't you create a helper that returns the currently enabled interrupt
> mode?
>=20
> I expect returning an enum (ie: NONE, INTX, MSI, MSIX) should be fine
> since no two of those should be enabled at the same time.

Done in v2 (plus ERR member).

>=20
> > ---
> >  .../xen/xen-pciback/conf_space_capability.c   | 113 ++++++++++++++++++
> >  drivers/xen/xen-pciback/conf_space_header.c   |  30 +++++
> >  drivers/xen/xen-pciback/pci_stub.c            |  66 ++++++++++
> >  drivers/xen/xen-pciback/pciback.h             |   1 +
> >  4 files changed, 210 insertions(+)
> >=20
> > diff --git a/drivers/xen/xen-pciback/conf_space_capability.c b/drivers/=
xen/xen-pciback/conf_space_capability.c
> > index e5694133ebe5..c5a7c58ff3e3 100644
> > --- a/drivers/xen/xen-pciback/conf_space_capability.c
> > +++ b/drivers/xen/xen-pciback/conf_space_capability.c
> > @@ -189,6 +189,109 @@ static const struct config_field caplist_pm[] =3D=
 {
> >  	{}
> >  };
> > =20
> > +static struct msi_msix_field_config {
> > +	u16 enable_bit;  /* bit for enabling MSI/MSI-X */
> > +	int other_cap;  /* the other capability for exclusiveness check */
>=20
> Nit: just one space between the declaration and the comment IMO.
>=20
> Also capability ID is not a signed value, hence unsigned int would
> feel more natural.

Replaced with enum in v2.

> > +} msi_field_config =3D {
> > +	.enable_bit =3D PCI_MSI_FLAGS_ENABLE,
> > +	.other_cap =3D PCI_CAP_ID_MSIX,
> > +}, msix_field_config =3D {
> > +	.enable_bit =3D PCI_MSIX_FLAGS_ENABLE,
> > +	.other_cap =3D PCI_CAP_ID_MSI,
> > +};
>=20
> I think it would be more helpful to store the current capability ID
> rather the one you need to check against. Then if you had a helper
> that returns the currently enabled interrupt mode you would have to
> check that either it's NONE or matches the capability requested to be
> enabled.

Done in v2.

> > +
> > +static void *msi_field_init(struct pci_dev *dev, int offset)
> > +{
> > +	return &msi_field_config;
> > +}
> > +
> > +static void *msix_field_init(struct pci_dev *dev, int offset)
> > +{
> > +	return &msix_field_config;
> > +}
> > +
> > +static int msi_msix_flags_write(struct pci_dev *dev, int offset, u16 n=
ew_value,
> > +			 void *data)
> > +{
> > +	int err;
> > +	u16 old_value;
> > +	struct msi_msix_field_config *field_config =3D data;
> > +	struct xen_pcibk_dev_data *dev_data =3D pci_get_drvdata(dev);
>=20
> const for both the above.

Done in v2.

> > +	int other_cap_offset;
>=20
> unsigned int

Done in v2.

> > +	u16 other_cap_enable_bit;
> > +	u16 other_cap_value;
> > +
> > +	if (xen_pcibk_permissive || dev_data->permissive)
> > +		goto write;
> > +
> > +	err =3D pci_read_config_word(dev, offset, &old_value);
> > +	if (err)
> > +		return err;
> > +
> > +	if (new_value =3D=3D old_value)
> > +		return 0;
> > +
> > +	if (!dev_data->allow_interrupt_control ||
> > +	    (new_value ^ old_value) & ~field_config->enable_bit)
> > +		return PCIBIOS_SET_FAILED;
> > +
> > +	if (new_value & field_config->enable_bit) {
> > +		/* don't allow enabling together with INTx */
> > +		err =3D pci_read_config_word(dev, PCI_COMMAND, &other_cap_value);
> > +		if (err)
> > +			return err;
> > +		if (!(other_cap_value & PCI_COMMAND_INTX_DISABLE))
> > +			return PCIBIOS_SET_FAILED;
> > +
> > +		/* and the other MSI(-X) */
> > +		switch (field_config->other_cap) {
> > +		case PCI_CAP_ID_MSI:
> > +			other_cap_offset =3D dev->msi_cap + PCI_MSI_FLAGS;
> > +			other_cap_enable_bit =3D PCI_MSI_FLAGS_ENABLE;
> > +			break;
> > +		case PCI_CAP_ID_MSIX:
> > +			other_cap_offset =3D dev->msix_cap + PCI_MSIX_FLAGS;
> > +			other_cap_enable_bit =3D PCI_MSIX_FLAGS_ENABLE;
> > +			break;
>=20
> I think you should check whether the other capability exists. I guess
> msi{x}_cap will be 0 if not present?

Done in v2 (and the code is moved into separate function).

> > +		default:
> > +			BUG_ON(1);
>=20
> Doesn't Linux have a plain BUG();?

Not needed anymore.

> > +		}
> > +		err =3D pci_read_config_word(dev,
> > +					   other_cap_offset,
> > +					   &other_cap_value);
> > +		if (err)
> > +			return err;
> > +
> > +		if (other_cap_value & other_cap_enable_bit)
> > +			return PCIBIOS_SET_FAILED;
> > +	}
> > +
> > +write:
> > +	return pci_write_config_word(dev, offset, new_value);
> > +}
> > +
> > +static const struct config_field caplist_msix[] =3D {
> > +	{
> > +		.offset    =3D PCI_MSIX_FLAGS,
> > +		.size      =3D 2,
> > +		.init      =3D msix_field_init,
> > +		.u.w.read  =3D xen_pcibk_read_config_word,
> > +		.u.w.write =3D msi_msix_flags_write,
> > +	},
> > +	{}
> > +};
> > +
> > +static const struct config_field caplist_msi[] =3D {
> > +	{
> > +		.offset    =3D PCI_MSI_FLAGS,
> > +		.size      =3D 2,
> > +		.init      =3D msi_field_init,
> > +		.u.w.read  =3D xen_pcibk_read_config_word,
> > +		.u.w.write =3D msi_msix_flags_write,
> > +	},
> > +	{}
> > +};
> > +
> >  static struct xen_pcibk_config_capability xen_pcibk_config_capability_=
pm =3D {
> >  	.capability =3D PCI_CAP_ID_PM,
> >  	.fields =3D caplist_pm,
> > @@ -197,11 +300,21 @@ static struct xen_pcibk_config_capability xen_pci=
bk_config_capability_vpd =3D {
> >  	.capability =3D PCI_CAP_ID_VPD,
> >  	.fields =3D caplist_vpd,
> >  };
> > +static struct xen_pcibk_config_capability xen_pcibk_config_capability_=
msi =3D {
> > +	.capability =3D PCI_CAP_ID_MSI,
> > +	.fields =3D caplist_msi,
> > +};
> > +static struct xen_pcibk_config_capability xen_pcibk_config_capability_=
msix =3D {
> > +	.capability =3D PCI_CAP_ID_MSIX,
> > +	.fields =3D caplist_msix,
> > +};
> > =20
> >  int xen_pcibk_config_capability_init(void)
> >  {
> >  	register_capability(&xen_pcibk_config_capability_vpd);
> >  	register_capability(&xen_pcibk_config_capability_pm);
> > +	register_capability(&xen_pcibk_config_capability_msi);
> > +	register_capability(&xen_pcibk_config_capability_msix);
> > =20
> >  	return 0;
> >  }
> > diff --git a/drivers/xen/xen-pciback/conf_space_header.c b/drivers/xen/=
xen-pciback/conf_space_header.c
> > index 10ae24b5a76e..1e0fff02e21b 100644
> > --- a/drivers/xen/xen-pciback/conf_space_header.c
> > +++ b/drivers/xen/xen-pciback/conf_space_header.c
> > @@ -64,6 +64,7 @@ static int command_write(struct pci_dev *dev, int off=
set, u16 value, void *data)
> >  	int err;
> >  	u16 val;
> >  	struct pci_cmd_info *cmd =3D data;
> > +	u16 cap_value;
> > =20
> >  	dev_data =3D pci_get_drvdata(dev);
> >  	if (!pci_is_enabled(dev) && is_enable_cmd(value)) {
> > @@ -117,6 +118,35 @@ static int command_write(struct pci_dev *dev, int =
offset, u16 value, void *data)
> >  		pci_clear_mwi(dev);
> >  	}
> > =20
> > +	if (dev_data && dev_data->allow_interrupt_control) {
> > +		if (!(cmd->val & PCI_COMMAND_INTX_DISABLE) &&
> > +		    (value & PCI_COMMAND_INTX_DISABLE)) {
> > +			pci_intx(dev, 0);
> > +		} else if ((cmd->val & PCI_COMMAND_INTX_DISABLE) &&
> > +		    !(value & PCI_COMMAND_INTX_DISABLE)) {
> > +			/* Do not allow enabling INTx together with MSI or MSI-X. */
> > +			/* Do not trust dev->msi(x)_enabled here, as enabling could be done
> > +			 * bypassing the pci_*msi* functions, by the qemu.
> > +			 */
> > +			err =3D pci_read_config_word(dev,
> > +						   dev->msi_cap + PCI_MSI_FLAGS,
> > +						   &cap_value);
> > +			if (!err && (cap_value & PCI_MSI_FLAGS_ENABLE))
> > +				err =3D -EBUSY;
> > +			if (!err)
> > +				err =3D pci_read_config_word(dev,
> > +							   dev->msix_cap + PCI_MSIX_FLAGS,
> > +							   &cap_value);
> > +			if (!err && (cap_value & PCI_MSIX_FLAGS_ENABLE))
> > +				err =3D -EBUSY;
>=20
> Shouldn't this return PCI-style errors?
>=20
> I think PCIBIOS_SET_FAILED would be more appropriate here. Note sure
> whether you should terminate the function here in that case, or else
> the error is lost and not returned to the caller, yet the function
> failed at least partially.

Fixed in v2.

> > +			if (err)
> > +				pr_warn("%s: cannot enable INTx (%d)\n",
>=20
> This should be ratelimited since it's guest triggerable.

Message removed in favor of not loosing error value.

> > +					pci_name(dev), err);
> > +			else
> > +				pci_intx(dev, 1);
> > +		}
> > +	}
> > +
> >  	cmd->val =3D value;
> > =20
> >  	if (!xen_pcibk_permissive && (!dev_data || !dev_data->permissive))
> > diff --git a/drivers/xen/xen-pciback/pci_stub.c b/drivers/xen/xen-pciba=
ck/pci_stub.c
> > index 097410a7cdb7..7af93d65ed51 100644
> > --- a/drivers/xen/xen-pciback/pci_stub.c
> > +++ b/drivers/xen/xen-pciback/pci_stub.c
> > @@ -304,6 +304,8 @@ void pcistub_put_pci_dev(struct pci_dev *dev)
> >  	xen_pcibk_config_reset_dev(dev);
> >  	xen_pcibk_config_free_dyn_fields(dev);
> > =20
> > +	dev_data->allow_interrupt_control =3D 0;
>=20
> Why do you need to do this here? I don't see any other options being
> cleared here (I would expect for example permissive to also be
> cleared if required).

To ensure the option isn't erroneously left enabled after switching the
device from HVM domain (with stubdom) to PV one. This may happen when tools=
tack only
do write when enabling this option (HVM with stubdom case), but do
not disable it in other cases.
In fact exactly the same issue applies to permissive setting - if you
first boot a guest with:

    pci =3D [ '...,permisive=3D1' ]

and then with:

    pci =3D [ '...,permisive=3D0' ]

the permissive mode will stay enabled. Unless you unbind the device from
the driver in the meantime. The easiest method would be xl
pci-assignable-remove && xl pci-assignable-add, but since XSA-302 that
would re-introduce the very same security issue.

> > +
> >  	xen_unregister_device_domain_owner(dev);
> > =20
> >  	spin_lock_irqsave(&found_psdev->lock, flags);
> > @@ -1431,6 +1433,65 @@ static ssize_t permissive_show(struct device_dri=
ver *drv, char *buf)
> >  }
> >  static DRIVER_ATTR_RW(permissive);
> > =20
> > +static ssize_t allow_interrupt_control_store(struct device_driver *drv,
> > +					     const char *buf, size_t count)
> > +{
> > +	int domain, bus, slot, func;
> > +	int err;
> > +	struct pcistub_device *psdev;
> > +	struct xen_pcibk_dev_data *dev_data;
> > +
> > +	err =3D str_to_slot(buf, &domain, &bus, &slot, &func);
> > +	if (err)
> > +		goto out;
> > +
> > +	psdev =3D pcistub_device_find(domain, bus, slot, func);
> > +	if (!psdev) {
> > +		err =3D -ENODEV;
> > +		goto out;
> > +	}
> > +
> > +	dev_data =3D pci_get_drvdata(psdev->dev);
> > +	/* the driver data for a device should never be null at this point */
> > +	if (!dev_data) {
> > +		err =3D -ENXIO;
> > +		goto release;
> > +	}
> > +	dev_data->allow_interrupt_control =3D 1;
> > +release:
> > +	pcistub_device_put(psdev);
> > +out:
> > +	if (!err)
> > +		err =3D count;
> > +	return err;
> > +}
> > +
> > +static ssize_t allow_interrupt_control_show(struct device_driver *drv,
> > +					    char *buf)
> > +{
> > +	struct pcistub_device *psdev;
> > +	struct xen_pcibk_dev_data *dev_data;
> > +	size_t count =3D 0;
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&pcistub_devices_lock, flags);
> > +	list_for_each_entry(psdev, &pcistub_devices, dev_list) {
> > +		if (count >=3D PAGE_SIZE)
> > +			break;
> > +		if (!psdev->dev)
> > +			continue;
> > +		dev_data =3D pci_get_drvdata(psdev->dev);
> > +		if (!dev_data || !dev_data->allow_interrupt_control)
> > +			continue;
> > +		count +=3D
> > +		    scnprintf(buf + count, PAGE_SIZE - count, "%s\n",
> > +			      pci_name(psdev->dev));
> > +	}
> > +	spin_unlock_irqrestore(&pcistub_devices_lock, flags);
> > +	return count;
> > +}
> > +static DRIVER_ATTR_RW(allow_interrupt_control);
>=20
> This is mostly a clone of permissive_{store/show}, I wonder if those
> functions could be generalized since it's just repeated boilerplate
> code in order to fetch allow_interrupt_control or permissive. Anyway,
> likely not part of this patch.

That would be more significant change than just refactoring those
functions. permissive and allow_interrupt_control are separate fields in
a structure, so to generalize it I can't simply put it into a function
parameter. It would need to be a macro, or use some callbacks. I don't
like either. I may be missing something, but the best I can think of is
to convert it into some flags field with separate bits for those values.
But this means also changing every place using those values.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--ZwgA9U+XZDXt4+m+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl3689AACgkQ24/THMrX
1yzFZwf/Rbsh/lf+YkoNXTtqelnS1f375fFmZc8wH3i/87JXMXZBmwamcln7FsSD
+Ph21vo9uWugZeXyuy+lC+Lb6N74buLlmFT4SDcpEaR/bac3uql/bLrWzpVfeWiY
mHQbqFkuhsEkAmfEVM/3V+9Hv8M3xoFFtmnngUtjthc2P6VSAKGBivibYfveIkxB
yWiU/Aay0FoHLvkJdDFVEAgap0ib26ZufBNvQe9vSKdfiyRUESWvgZmv9+LWSEd+
MfWyhDgoNuO3bEYzYjEPYIk9vixksVl/BMXc+whtPWamSnvZylX5HZYaIdomCBcM
LB81aiZG8VR+Rhb3dKaLB+iGYUtA3w==
=aPKr
-----END PGP SIGNATURE-----

--ZwgA9U+XZDXt4+m+--


--===============0469688122096229531==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0469688122096229531==--

