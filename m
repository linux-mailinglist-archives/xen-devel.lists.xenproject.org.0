Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6BD6D0DC
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 17:16:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho85j-0002Fe-N5; Thu, 18 Jul 2019 15:13:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0/+e=VP=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1ho85h-0002FU-Sq
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 15:13:06 +0000
X-Inumbo-ID: 89d3719c-a96e-11e9-8c26-bb7443c4c4f6
Received: from new3-smtp.messagingengine.com (unknown [66.111.4.229])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 89d3719c-a96e-11e9-8c26-bb7443c4c4f6;
 Thu, 18 Jul 2019 15:13:03 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 40D711ABB;
 Thu, 18 Jul 2019 11:13:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Thu, 18 Jul 2019 11:13:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=jubw9S
 GhbmFHGlE5LN3z/zjYuSj1b+tCeQ0yS23RxDQ=; b=wfSnzubvqM0UnUgZFc6lUx
 Wf1pqUgjhKA1D8JocC8iISmrQbFSvdbxzmbhmA6uiERUL2RV2mXuRWRXFPuW/O/A
 REtb1tcBE5cT1a2y5hy05hIdihnpISuwqa4qFVNI6TP31tJLpvo8rfeuXW+bw+m+
 UO6V6AU1LeLy39GYJYgGhJJegMT1byxsqdl9yXsYScrh7HAklxi+NGK4diLlznC/
 VPzrx1DA1WyL+DlN5QsuqjYprB/k5PZGgU/70YKouShytFvhSpS29tePuHGHwAnl
 3zNOu32gbVMh4rNcXThatWISSus0pMjJTKvQkGw26/L1lNnVRQlxlNtOSEi1/vZQ
 ==
X-ME-Sender: <xms:e4wwXXH9G43I8NcmcRsIr2njk4YuIN_PJ9jERGZ5h9Vooumf3JC_ag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrieehgdekkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujggfsehgtderredtreejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:e4wwXfy8YCv3fMns8Vq1OU0jNYRJFQ_uYwMCOk-rN1tB0K8kxmeusA>
 <xmx:e4wwXcryNap10jZ4eGALnJXztLXThNTcucKaEFkm2lsFdrdlZj2gNg>
 <xmx:e4wwXZjCfgrhwRaqhuRCLecv25Jk6Iv1y1C3QkQCZWsZ-vyMj6AhDA>
 <xmx:f4wwXShWN_fDJnf0VCQMJKwNV2I9QVZSrljBAeJ-2OXHzuEWFn2alQ>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id B743338008A;
 Thu, 18 Jul 2019 11:12:57 -0400 (EDT)
Date: Thu, 18 Jul 2019 17:12:54 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20190718151254.GZ1250@mail-itl>
References: <cover.537da3804adbe71352bed871578f3e893e2210c5.1563325215.git-series.marmarek@invisiblethingslab.com>
 <bf64e46ec03145da1887cfff4c632c86784792f6.1563325215.git-series.marmarek@invisiblethingslab.com>
 <20190717095435.sds3wsivmforlxzj@Air-de-Roger.citrite.net>
 <20190717150912.GW1250@mail-itl>
 <20190718092939.2m3di3dtspsku6jk@Air-de-Roger.citrite.net>
MIME-Version: 1.0
In-Reply-To: <20190718092939.2m3di3dtspsku6jk@Air-de-Roger.citrite.net>
User-Agent: Mutt/1.12+29 (a621eaed) (2019-06-14)
Subject: Re: [Xen-devel] [PATCH v5 4/6] xen/x86: Allow stubdom access to irq
 created for msi.
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Simon Gaiser <simon@invisiblethingslab.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Brian Woods <brian.woods@amd.com>
Content-Type: multipart/mixed; boundary="===============7319527582677900313=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============7319527582677900313==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="p+/4B2pcxE3X6xU6"
Content-Disposition: inline


--p+/4B2pcxE3X6xU6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 18, 2019 at 11:29:39AM +0200, Roger Pau Monn=C3=A9 wrote:
> On Wed, Jul 17, 2019 at 05:09:12PM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Wed, Jul 17, 2019 at 11:54:35AM +0200, Roger Pau Monn=C3=A9 wrote:
> > > On Wed, Jul 17, 2019 at 03:00:42AM +0200, Marek Marczykowski-G=C3=B3r=
ecki wrote:
> > > > @@ -220,14 +237,22 @@ void destroy_irq(unsigned int irq)
> > > > =20
> > > >      BUG_ON(!MSI_IRQ(irq));
> > > > =20
> > > > -    if ( hardware_domain )
> > > > +    if ( desc->creator_domid !=3D DOMID_INVALID )
> > > >      {
> > > > -        int err =3D irq_deny_access(hardware_domain, irq);
> > > > +        struct domain *d =3D get_domain_by_id(desc->creator_domid);
> > > > =20
> > > > -        if ( err )
> > > > -            printk(XENLOG_G_ERR
> > > > -                   "Could not revoke Dom0 access to IRQ%u (error %=
d)\n",
> > > > -                   irq, err);
> > > > +        if ( d && irq_access_permitted(d, irq) ) {
> > > > +            int err;
> > > > +
> > > > +            err =3D irq_deny_access(d, irq);
> > > > +            if ( err )
> > > > +                printk(XENLOG_G_ERR
> > > > +                       "Could not revoke Dom%u access to IRQ%u (er=
ror %d)\n",
> > > > +                       d->domain_id, irq, err);
> > > > +        }
> > > > +
> > > > +        if ( d )
> > > > +            put_domain(d);
> > >=20
> > > Don't you need to set creator_domid =3D DOMID_INVALID in destroy_irq =
at
> > > some point?
> > >=20
> > > Or else a failure in create_irq could leak the irq to it's previous
> > > owner. Note that init_one_irq_desc would only init the fields the
> > > first time the IRQ is used, but not for subsequent usages AFAICT.
> >=20
> > I assumed init_one_irq_desc do the work on subsequent usages too. If no=
t,
> > indeed I need to modify creator_domid in few more places.
>=20
> I don't think so, init_one_irq_desc will only init the fields if
> handler =3D=3D NULL, which will only happen the first time the IRQ is
> used, afterwards handler is set to &no_irq_type by destroy_irq.
>=20
> Just setting creator_domid =3D DOMID_INVALID in destroy_irq and adding
> the assert to create_irq should be enough AFAICT, since those
> functions are used exclusively by non-shared IRQs (MSI and MSI-X).

Ok.

> > > >      }
> > > > =20
> > > >      spin_lock_irqsave(&desc->lock, flags);
> > > > @@ -2058,7 +2083,7 @@ int map_domain_pirq(
> > > >              spin_unlock_irqrestore(&desc->lock, flags);
> > > > =20
> > > >              info =3D NULL;
> > > > -            irq =3D create_irq(NUMA_NO_NODE);
> > > > +            irq =3D create_irq(NUMA_NO_NODE, get_dm_domain(d));
> > >=20
> > > Isn't it fine to just use current->domain here directly?
> > >=20
> > > It's always going to be the current domain the one that calls
> > > map_domain_pirq in order to get a PIRQ mapped for it's target
> > > domain I think.
> >=20
> > I wasn't sure if that's true if all the cases. Especially if hardware
> > domain !=3D toolstack domain. How is it then? Is it hardware domain
> > calling map_domain_pirq in that case?
>=20
> But then it's going to be the hardware domain the one that runs the
> QEMU instance, and hence the one that issues the hypercalls to
> map/unmap PIRQs to a target domain?
>=20
> ie: the PCI backend (either pciback or QEMU) is not going to run on
> the toolstack domain.

Indeed, you're right. This also means get_dm_domain() helper wouldn't be
needed anymore.

> I'm afraid I don't see a case where current->domain isn't the domain
> also requiring permissions over the IRQ, but I could be wrong. Can you
> come up with a detailed scenario where this might happen?
>=20
> >=20
> > > >              ret =3D irq >=3D 0 ? prepare_domain_irq_pirq(d, irq, p=
irq + nr, &info)
> > > >                             : irq;
> > > >              if ( ret < 0 )
> > > > @@ -2691,7 +2716,7 @@ int allocate_and_map_msi_pirq(struct domain *=
d, int index, int *pirq_p,
> > > >          if ( irq =3D=3D -1 )
> > > >          {
> > > >      case MAP_PIRQ_TYPE_MULTI_MSI:
> > > > -            irq =3D create_irq(NUMA_NO_NODE);
> > > > +            irq =3D create_irq(NUMA_NO_NODE, get_dm_domain(d));
> > > >          }
> > > > =20
> > > >          if ( irq < nr_irqs_gsi || irq >=3D nr_irqs )
> > > > diff --git a/xen/common/irq.c b/xen/common/irq.c
> > > > index f42512d..42b27a9 100644
> > > > --- a/xen/common/irq.c
> > > > +++ b/xen/common/irq.c
> > > > @@ -16,6 +16,7 @@ int init_one_irq_desc(struct irq_desc *desc)
> > > >      spin_lock_init(&desc->lock);
> > > >      cpumask_setall(desc->affinity);
> > > >      INIT_LIST_HEAD(&desc->rl_link);
> > > > +    desc->creator_domid =3D DOMID_INVALID;
> > > > =20
> > > >      err =3D arch_init_one_irq_desc(desc);
> > > >      if ( err )
> > > > diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
> > > > index 189e121..ccc8b04 100644
> > > > --- a/xen/drivers/char/ns16550.c
> > > > +++ b/xen/drivers/char/ns16550.c
> > > > @@ -719,7 +719,7 @@ static void __init ns16550_init_irq(struct seri=
al_port *port)
> > > >      struct ns16550 *uart =3D port->uart;
> > > > =20
> > > >      if ( uart->msi )
> > > > -        uart->irq =3D create_irq(0);
> > > > +        uart->irq =3D create_irq(0, NULL);
> > > >  #endif
> > > >  }
> > > > =20
> > > > diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers=
/passthrough/amd/iommu_init.c
> > > > index 4e76b26..50785e0 100644
> > > > --- a/xen/drivers/passthrough/amd/iommu_init.c
> > > > +++ b/xen/drivers/passthrough/amd/iommu_init.c
> > > > @@ -781,7 +781,7 @@ static bool_t __init set_iommu_interrupt_handle=
r(struct amd_iommu *iommu)
> > > >      hw_irq_controller *handler;
> > > >      u16 control;
> > > > =20
> > > > -    irq =3D create_irq(NUMA_NO_NODE);
> > > > +    irq =3D create_irq(NUMA_NO_NODE, NULL);
> > > >      if ( irq <=3D 0 )
> > > >      {
> > > >          dprintk(XENLOG_ERR, "IOMMU: no irqs\n");
> > > > diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthroug=
h/pci.c
> > > > index e886894..507b3d1 100644
> > > > --- a/xen/drivers/passthrough/pci.c
> > > > +++ b/xen/drivers/passthrough/pci.c
> > > > @@ -845,6 +845,9 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
> > > >      list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
> > > >          if ( pdev->bus =3D=3D bus && pdev->devfn =3D=3D devfn )
> > > >          {
> > > > +            ret =3D -EBUSY;
> > > > +            if ( pdev->domain && pdev->domain !=3D hardware_domain=
 )
> > > > +                break;
> > >=20
> > > This seems like an unlrelated fix?
> > >=20
> > > ie: preventing device removal while in use by a domain different than
> > > dom0?
> >=20
> > Indeed it may warrant separate commit now.
> >=20
> > > Note that you don't need the pdev->domain !=3D NULL check, just doing
> > > pdev->domain !=3D hardware_domain seems enough, since you don't
> > > dereference the pdev->domain pointer in the expression (unless I'm
> > > missing other usages below).
> >=20
> > I don't want to prevent removal if pdev->domain is NULL (if that's even
> > possible).
>=20
> But if pdev->domain =3D=3D NULL, then it's certainly going to be different
> from hardware_domain,=20

Exactly. And I do _not_ want to hit that break if pdev->domain =3D=3D NULL.

> so just using pdev->domain !=3D hardware_domain
> achieves both.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--p+/4B2pcxE3X6xU6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl0wjHYACgkQ24/THMrX
1yxyXwf/SLG7pPWpYJDzq12QZRA33bYoNzp5szYkkZTowBylhe/assgFlYwAp7xw
g6eSZrj5Sm8AzvrguYfhn/h6Doy/YtubmL7tiVb6qM48tNFafKEaMnQ62c+/MpvA
ntpb7efNovDfKM9n4gsNbEsLotRJrDUUW2rz7yxZM+Bq4wumx0Hda2ChFy/7iAen
FW/0jTDpn3b8iY0X2R86IA+jPH7OqlLkiKrE5e6W5SFzE/i0Ubn/RAasAEkpCmcf
ACssObvKMFLusBHl+9shUhZQLS96HriLyI6JjliqWtVsFdsYNkVrar7lvUVty0IE
drkFro0fZFJXj1HuCZvdScy/mI27yQ==
=g81n
-----END PGP SIGNATURE-----

--p+/4B2pcxE3X6xU6--


--===============7319527582677900313==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7319527582677900313==--

