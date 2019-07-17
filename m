Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBF36C3B2
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 01:58:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hntks-00015p-GA; Wed, 17 Jul 2019 23:54:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o+Bt=VO=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hntkr-00014j-2L
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 23:54:37 +0000
X-Inumbo-ID: 39c7c28c-a8ee-11e9-970c-4b090cebb108
Received: from new1-smtp.messagingengine.com (unknown [66.111.4.221])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 39c7c28c-a8ee-11e9-970c-4b090cebb108;
 Wed, 17 Jul 2019 23:54:33 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 89C6C199B;
 Wed, 17 Jul 2019 19:54:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Wed, 17 Jul 2019 19:54:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Nf6UDJ
 ZEYiU6KEpU8gpy9FC+EG5DHODbgtQKCskscwA=; b=XwWrtQG9ezN7KAc1LRHPLF
 VVLfc7BVTqsNQCWkByNtn5ML1amCKPTkJO90p+XIlboqyTqPW+OIhbsLcpMV3EY1
 NJzO43GFJF/Uz0Uwx3mD4idKqCfKRUVg77a20Y0PyXdZDXqbi1foksIWo/lGSihz
 ugZB1XOkQ3tFoTwuctztIy2JxY+e08KKFFyPrF9eZbDKfFO9bjogC7DLUDPbGfNZ
 O/yTJIQcER02dBebiRVG3mzX9f5h1jEqsQaUuYQS9nD+/sTKzOpgi9tUCL7nE9by
 igassNUd2hSE8jq5RYqmb1j7ZsR/ew87+JqZHilAAu68Md9eyb2WEU/1zIEdyN1A
 ==
X-ME-Sender: <xms:OLUvXYAquYEFe2LEWKn0cKERUnLdjXTjQyy1j8ZHrduYBUoiTzcd6w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrieeggddviecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujggfsehgtderredtreejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:OLUvXR8Q2HfDAwLcphUeuDbI5XKggVZsWR8Slvr-RhUMKk5EjMiK1w>
 <xmx:OLUvXY-_jBggIwrRMfZyonGYuzgAaW7gwqOEeHgMp9UMI6AZhqrW8g>
 <xmx:OLUvXYeNpmrXBlpLCqXah8eyE113cNhJ2m0nQO2U0gQrD5T5ED6qNQ>
 <xmx:ObUvXcb375omvS2K4M9UXppgMUzzXsH9Y3fG9RazdrgiIiNWxbZffg>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6559A80060;
 Wed, 17 Jul 2019 19:54:30 -0400 (EDT)
Date: Thu, 18 Jul 2019 01:54:26 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20190717235426.GX1250@mail-itl>
References: <cover.537da3804adbe71352bed871578f3e893e2210c5.1563325215.git-series.marmarek@invisiblethingslab.com>
 <7280f16277aa9d7bdc9c2373277ef1b40459090b.1563325215.git-series.marmarek@invisiblethingslab.com>
 <20190717101843.2nmigl4dt4kekuax@Air-de-Roger.citrite.net>
MIME-Version: 1.0
In-Reply-To: <20190717101843.2nmigl4dt4kekuax@Air-de-Roger.citrite.net>
User-Agent: Mutt/1.12+29 (a621eaed) (2019-06-14)
Subject: Re: [Xen-devel] [PATCH v5 5/6] xen/x86: add PHYSDEVOP_msi_control
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: multipart/mixed; boundary="===============5937714396799882204=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============5937714396799882204==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7fXEoLLey27Fs/d6"
Content-Disposition: inline


--7fXEoLLey27Fs/d6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2019 at 12:18:43PM +0200, Roger Pau Monn=C3=A9 wrote:
> On Wed, Jul 17, 2019 at 03:00:43AM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > Allow device model running in stubdomain to enable/disable MSI(-X),
> > bypassing pciback. While pciback is still used to access config space
> > from within stubdomain, it refuse to write to
> > PCI_MSI_FLAGS_ENABLE/PCI_MSIX_FLAGS_ENABLE in non-permissive mode. Which
> > is the right thing to do for PV domain (the main use case for pciback),
> > as PV domain should use XEN_PCI_OP_* commands for that. Unfortunately
> > those commands are not good for stubdomain use, as they configure MSI in
> > dom0's kernel too, which should not happen for HVM domain.
> >=20
> > This new physdevop is allowed only for stubdomain controlling the domain
> > which own the device.
>=20
> I think I'm missing that part, is this maybe done by the XSM stuff?

Yes, specifically xsm_msi_control(XSM_DM_PRIV, pdev->domain, ...) call.
XSM_DM_PRIV allows call if src->is_privileged, or if src->target =3D=3D
target. Note the target being owner of the device here.

> >=20
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
> > Changes in v3:
> >  - new patch
> > Changes in v4:
> >  - adjust code style
> >  - s/msi_msix/msi/
> >  - add msi_set_enable XSM hook
> >  - flatten struct physdev_msi_set_enable
> >  - add to include/xlat.lst
> > Changes in v5:
> >  - rename to PHYSDEVOP_msi_control
> >  - combine "mode" and "enable" into "flags"
> >  - refuse to enable both MSI and MSI-X, and also to enable MSI(-X) on
> >    incapable device
> >  - disable/enable INTx when enabling/disabling MSI (?)
>=20
> You don't enable INTx when MSI is disabled.

Ah, indeed. When I look for similar code in Xen elsewhere, I found
__pci_disable_msi() has extra conditions for pci_intx(dev, true):

    if ( entry->irq > 0 && !(irq_to_desc(entry->irq)->status & IRQ_GUEST) )
        pci_intx(dev, true);

Should this be mirrored there too? Isn't IRQ_GUEST always set in case of
passthrough to HVM (the case this patch care)?

> >  - refuse if !use_msi
> >  - adjust flask hook to make more sense (require "setup" access on
> >    device, not on domain)
> >  - rebase on master
> >=20
> > I'm not sure if XSM part is correct, compile-tested only, as I'm not
> > sure how to set the policy.
>=20
> I'm also not familiar with XSM, so I will have to defer to Daniel on
> this one.
>=20
> > ---
> >  xen/arch/x86/msi.c                  | 42 +++++++++++++++++++++++++++++=
+-
> >  xen/arch/x86/physdev.c              | 25 ++++++++++++++++++-
> >  xen/arch/x86/x86_64/physdev.c       |  4 +++-
> >  xen/include/asm-x86/msi.h           |  1 +-
> >  xen/include/public/physdev.h        | 16 +++++++++++-
> >  xen/include/xlat.lst                |  1 +-
> >  xen/include/xsm/dummy.h             |  7 +++++-
> >  xen/include/xsm/xsm.h               |  6 ++++-
> >  xen/xsm/dummy.c                     |  1 +-
> >  xen/xsm/flask/hooks.c               | 24 +++++++++++++++++-
> >  xen/xsm/flask/policy/access_vectors |  1 +-
> >  11 files changed, 128 insertions(+)
> >=20
> > diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
> > index 89e6116..fca1d04 100644
> > --- a/xen/arch/x86/msi.c
> > +++ b/xen/arch/x86/msi.c
> > @@ -1475,6 +1475,48 @@ int pci_restore_msi_state(struct pci_dev *pdev)
> >      return 0;
> >  }
> > =20
> > +int msi_control(struct pci_dev *pdev, bool msix, bool enable)
> > +{
> > +    int ret;
> > +    struct msi_desc *old_desc;
> > +
> > +    if ( !use_msi )
> > +        return -EOPNOTSUPP;
> > +
> > +    ret =3D xsm_msi_control(XSM_DM_PRIV, pdev->domain, pdev->sbdf.sbdf=
, msix, enable);
> > +    if ( ret )
> > +        return ret;
> > +
> > +    if ( msix )
> > +    {
> > +        if ( !pdev->msix )
> > +            return -ENODEV;
> > +        old_desc =3D find_msi_entry(pdev, -1, PCI_CAP_ID_MSI);
> > +        if ( old_desc )
> > +            return -EBUSY;
> > +        if ( enable )
> > +            pci_intx(pdev, false);
> > +        msix_set_enable(pdev, enable);
> > +    }
> > +    else
> > +    {
> > +        if ( !pci_find_cap_offset(pdev->seg,
> > +                                  pdev->bus,
> > +                                  PCI_SLOT(pdev->devfn),
> > +                                  PCI_FUNC(pdev->devfn),
> > +                                  PCI_CAP_ID_MSI) )
> > +            return -ENODEV;
> > +        old_desc =3D find_msi_entry(pdev, -1, PCI_CAP_ID_MSIX);
> > +        if ( old_desc )
> > +            return -EBUSY;
> > +        if ( enable )
> > +            pci_intx(pdev, false);
> > +        msi_set_enable(pdev, enable);
> > +    }
>=20
> I think you could just do:
>=20
> unsigned int cap =3D msix ? PCI_CAP_ID_MSIX : PCI_CAP_ID_MSI;
>=20
> [...]
>=20
> if ( !pci_find_cap_offset(pdev->seg,
>                           pdev->bus,
>                           PCI_SLOT(pdev->devfn),
>                           PCI_FUNC(pdev->devfn), cap) )
>     return -ENODEV;
>=20
> old_desc =3D find_msi_entry(pdev, -1, cap);
> if ( old_desc )
>     return -EBUSY;

Note the check prevents enabling MSI when MSI-X is enabled and vice
versa. Not enabling already enabled MSI. Anyway, if using
pci_find_cap_offset for PCI_CAP_ID_MSIX too, this code indeed can be
deduplicated a little.

> if ( enable )
> {
>     pci_intx(pdev, false);
>     if ( msix )
>         msi_set_enable(pdev, false);
>     else
>         msix_set_enable(pdev, false);
> }
>=20
> if ( msix )
>     msix_set_enable(pdev, enable);
> else
>     msi_set_enable(pdev, enable);
>=20
> Note that in the same way you make sure INTx is disabled, you should
> also make sure MSI and MSI-X are not enabled at the same time.

This is exactly what the code in the patch already does.

> > +
> > +    return 0;
> > +}
> > +
> >  void __init early_msi_init(void)
> >  {
> >      if ( use_msi < 0 )
> > diff --git a/xen/arch/x86/physdev.c b/xen/arch/x86/physdev.c
> > index 3a3c158..5000998 100644
> > --- a/xen/arch/x86/physdev.c
> > +++ b/xen/arch/x86/physdev.c
> > @@ -662,6 +662,31 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARA=
M(void) arg)
> >          break;
> >      }
> > =20
> > +    case PHYSDEVOP_msi_control: {
> > +        struct physdev_msi_control op;
> > +        struct pci_dev *pdev;
> > +
> > +        ret =3D -EFAULT;
> > +        if ( copy_from_guest(&op, arg, 1) )
> > +            break;
> > +
> > +        ret =3D -EINVAL;
> > +        if ( op.flags & ~(PHYSDEVOP_MSI_CONTROL_MSIX | PHYSDEVOP_MSI_C=
ONTROL_ENABLE) )
> > +            break;
> > +
> > +        pcidevs_lock();
> > +        pdev =3D pci_get_pdev(op.seg, op.bus, op.devfn);
> > +        if ( pdev )
> > +            ret =3D msi_control(pdev,
> > +                              op.flags & PHYSDEVOP_MSI_CONTROL_MSIX,
> > +                              op.flags & PHYSDEVOP_MSI_CONTROL_ENABLE);
> > +        else
> > +            ret =3D -ENODEV;
> > +        pcidevs_unlock();
> > +        break;
> > +
>=20
> Extra newline.
>=20
> > +    }
> > +
> >      default:
> >          ret =3D -ENOSYS;
> >          break;
> > diff --git a/xen/arch/x86/x86_64/physdev.c b/xen/arch/x86/x86_64/physde=
v.c
> > index c5a00ea..69b4ce3 100644
> > --- a/xen/arch/x86/x86_64/physdev.c
> > +++ b/xen/arch/x86/x86_64/physdev.c
> > @@ -76,6 +76,10 @@ CHECK_physdev_pci_device_add
> >  CHECK_physdev_pci_device
> >  #undef xen_physdev_pci_device
> > =20
> > +#define xen_physdev_msi_control physdev_msi_control
> > +CHECK_physdev_msi_control
> > +#undef xen_physdev_msi_control
> > +
> >  #define COMPAT
> >  #undef guest_handle_okay
> >  #define guest_handle_okay          compat_handle_okay
> > diff --git a/xen/include/asm-x86/msi.h b/xen/include/asm-x86/msi.h
> > index 10387dc..05296de 100644
> > --- a/xen/include/asm-x86/msi.h
> > +++ b/xen/include/asm-x86/msi.h
> > @@ -252,5 +252,6 @@ void guest_mask_msi_irq(struct irq_desc *, bool mas=
k);
> >  void ack_nonmaskable_msi_irq(struct irq_desc *);
> >  void end_nonmaskable_msi_irq(struct irq_desc *, u8 vector);
> >  void set_msi_affinity(struct irq_desc *, const cpumask_t *);
> > +int msi_control(struct pci_dev *pdev, bool msix, bool enable);
> > =20
> >  #endif /* __ASM_MSI_H */
> > diff --git a/xen/include/public/physdev.h b/xen/include/public/physdev.h
> > index b6faf83..f9b728f 100644
> > --- a/xen/include/public/physdev.h
> > +++ b/xen/include/public/physdev.h
> > @@ -344,6 +344,22 @@ struct physdev_dbgp_op {
> >  typedef struct physdev_dbgp_op physdev_dbgp_op_t;
> >  DEFINE_XEN_GUEST_HANDLE(physdev_dbgp_op_t);
> > =20
> > +/* when PHYSDEVOP_MSI_CONTROL_MSIX not set, control MSI */
> > +#define PHYSDEVOP_MSI_CONTROL_MSIX    1
> > +/* when PHYSDEVOP_MSI_CONTROL_ENABLE not set, disable */
> > +#define PHYSDEVOP_MSI_CONTROL_ENABLE  2
> > +
> > +#define PHYSDEVOP_msi_control   32
> > +struct physdev_msi_control {
> > +    /* IN */
> > +    uint16_t seg;
> > +    uint8_t bus;
> > +    uint8_t devfn;
> > +    uint8_t flags;
>=20
> I would just make flags uint32_t, the padding to align is going to be
> added in any case.

That would make the structure 8 bytes, not 6. Did you mean uint16_t?=20
But structure size here doesn't really matter anyway.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--7fXEoLLey27Fs/d6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl0vtTIACgkQ24/THMrX
1yym3ggAl8UjYusnO7n01yqEVQ+N49ZUaNdIXsox3TG6DbJrHU9jRXVs7cdnkDH+
oPVIIAL2LbPw3delw3flcphH9hJAWzlsnAk7lbEy+QHmcfgaqTTUPJxSEQe/LDrX
G4ZejhV6SbeSOsTMLxcdwE54kUucfuDsG3RQ5GiKQafMpf03pRPsB8QQxNVPCTFo
aAB6zhNOhxVHO9mjMT9GFgWIq5dm4zxtKM0fDNBySd+A2zzu3xlqzQJsj2i4M6ZT
jvQu8i6U16zA9hOZmfHQvLNrF40zDXGK4LxqkGa7IeESSYiGYgLv+7SIuvgX61++
myUNi5BS8GWg2i3HlCW9Y8YlS/V/AQ==
=3FF6
-----END PGP SIGNATURE-----

--7fXEoLLey27Fs/d6--


--===============5937714396799882204==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5937714396799882204==--

