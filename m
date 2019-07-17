Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 993506BEDB
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 17:13:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnlYf-0005rJ-Ao; Wed, 17 Jul 2019 15:09:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o+Bt=VO=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hnlYc-0005rE-TK
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 15:09:27 +0000
X-Inumbo-ID: dc512e52-a8a4-11e9-a61a-83d600107e37
Received: from new3-smtp.messagingengine.com (unknown [66.111.4.229])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dc512e52-a8a4-11e9-a61a-83d600107e37;
 Wed, 17 Jul 2019 15:09:23 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5B9483798;
 Wed, 17 Jul 2019 11:09:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Wed, 17 Jul 2019 11:09:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=wonQ8g
 shNqewMsFbTxTFPI976yZqDWQhEsJy5e8Q1Ec=; b=Ccwggsm7tMi/aH+2YBycoR
 bdifUsQzw3qIvYSxfScKXJIdMvbLY6VGnfq5WnBYcUslf1vZ01QVV/4/TVcsNz3m
 32cA1Ts9/DGLwddrO/w4P/6jyWqfsh733Gj8/H/xpVU+qqwriPAAbg0nvoM9RWnz
 zGnH01u8pVimBqxy7yukhg0AW0UIHCW8bQPWMhbMBHtDXRjR0xsANhZxfgrSPjkR
 0TIXKe86c6ZxIpgV1wwVP0iasxEqJPZ3L3w5AF4fVbmeYJhqAwDYu1uJD+4Nrgn8
 gX6jz5NAuMzvrgToMo3I96prH87usdaMysAU/aAnI0N6vS3SPbGmq4EzE4MpIdTg
 ==
X-ME-Sender: <xms:HTovXSV2SIudeCXFr0zk6xcGUXtfxx9qg06hqZ5-vwsJm-jNZ9ic8A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrieefgdeivdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujggfsehgtderredtreejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucffohhmrghinhepghhithhhuhgs
 rdgtohhmnecukfhppeeluddrieehrdefgedrfeefnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmnecu
 vehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:HTovXYrraLqacgbdsRUjkFhjCWMGcjxuCjKDsjCpFRO7UZdjzszs_Q>
 <xmx:HTovXWShXOWiSTbtFotxRbVCuDVFHXnh33BLFibW2NurnYb8mToMfw>
 <xmx:HTovXa2KCfBJChzA4OOtXRRu7nOEHHWZ-6wvhmNrCrwq22bZSdg_XQ>
 <xmx:IzovXXRaaaH5DoVBVYD9y6J6TeNL4IMXK4d8fg0C2ZSwHfP-vDLSQg>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6EE2E80060;
 Wed, 17 Jul 2019 11:09:15 -0400 (EDT)
Date: Wed, 17 Jul 2019 17:09:12 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20190717150912.GW1250@mail-itl>
References: <cover.537da3804adbe71352bed871578f3e893e2210c5.1563325215.git-series.marmarek@invisiblethingslab.com>
 <bf64e46ec03145da1887cfff4c632c86784792f6.1563325215.git-series.marmarek@invisiblethingslab.com>
 <20190717095435.sds3wsivmforlxzj@Air-de-Roger.citrite.net>
MIME-Version: 1.0
In-Reply-To: <20190717095435.sds3wsivmforlxzj@Air-de-Roger.citrite.net>
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
Content-Type: multipart/mixed; boundary="===============6406411280137365050=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============6406411280137365050==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="glDgwcODtpHomn63"
Content-Disposition: inline


--glDgwcODtpHomn63
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2019 at 11:54:35AM +0200, Roger Pau Monn=C3=A9 wrote:
> On Wed, Jul 17, 2019 at 03:00:42AM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > Stubdomains need to be given sufficient privilege over the guest which =
it
> > provides emulation for in order for PCI passthrough to work correctly.
> > When a HVM domain try to enable MSI, QEMU in stubdomain calls
> > PHYSDEVOP_map_pirq, but later it needs to call XEN_DOMCTL_bind_pt_irq as
> > part of xc_domain_update_msi_irq. Allow for that as part of
> > PHYSDEVOP_map_pirq.
> >=20
> > This is not needed for PCI INTx, because IRQ in that case is known
> > beforehand and the stubdomain is given permissions over this IRQ by
> > libxl__device_pci_add (there's a do_pci_add against the stubdomain).
> >=20
> > create_irq() already grant IRQ access to hardware_domain, with
> > assumption the device model (something managing this IRQ) lives there.
> > Modify create_irq() to take additional parameter pointing at device
> > model domain - which may be dom0 or stubdomain.  Save ID of the domain
> > given permission, to revoke it in destroy_irq() - easier and cleaner
> > than replaying logic of create_irq() parameter. Use domid instead of
> > actual reference to the domain, because it might get destroyed before
> > destroying IRQ (stubdomain is destroyed before its target domain). And
> > it is not an issue, because IRQ permissions live within domain
> > structure, so destroying a domain also implicitly revoke the permission.
> > Potential domid reuse is detected by by checking if that domain does
> > have permission over the IRQ being destroyed.
> >=20
> > Then, adjust all callers to provide the parameter. In case of calls not
> > related to stubdomain-initiated allocations, give it either
> > hardware_domain (so the behavior is unchanged there), or NULL for
> > interrupts used by Xen internally.
> >=20
> > Inspired by https://github.com/OpenXT/xenclient-oe/blob/5e0e7304a5a3c75=
ef01240a1e3673665b2aaf05e/recipes-extended/xen/files/stubdomain-msi-irq-acc=
ess.patch by Eric Chanudet <chanudete@ainfosec.com>.
> >=20
> > Signed-off-by: Simon Gaiser <simon@invisiblethingslab.com>
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
> > Changes in v3:
> >  - extend commit message
> > Changes in v4:
> >  - add missing destroy_irq on error path
> > Changes in v5:
> >  - move irq_{grant,revoke}_access() to {create,destroy}_irq(), which
> >    basically make it a different patch
> >  - add get_dm_domain() helper
> >  - do not give hardware_domain permission over IRQs used in Xen
> >    internally
> >  - rename create_irq argument to just 'd', to avoid confusion
> >    when it's called by hardware domain
> >  - verify that device is de-assigned before pci_remove_device call
> >  - save ID of domain given permission in create_irq(), to revoke it in
> >  destroy_irq()
> >  - drop domain parameter from destroy_irq() and msi_free_irq()
> >  - do not give hardware domain permission over IRQ created in
> >  iommu_set_interrupt()
> > ---
> >  xen/arch/x86/hpet.c                      |  3 +-
> >  xen/arch/x86/irq.c                       | 51 ++++++++++++++++++-------
> >  xen/common/irq.c                         |  1 +-
> >  xen/drivers/char/ns16550.c               |  2 +-
> >  xen/drivers/passthrough/amd/iommu_init.c |  2 +-
> >  xen/drivers/passthrough/pci.c            |  3 +-
> >  xen/drivers/passthrough/vtd/iommu.c      |  3 +-
> >  xen/include/asm-x86/irq.h                |  2 +-
> >  xen/include/xen/irq.h                    |  1 +-
> >  9 files changed, 50 insertions(+), 18 deletions(-)
> >=20
> > diff --git a/xen/arch/x86/hpet.c b/xen/arch/x86/hpet.c
> > index 4b08488..b4854ff 100644
> > --- a/xen/arch/x86/hpet.c
> > +++ b/xen/arch/x86/hpet.c
> > @@ -11,6 +11,7 @@
> >  #include <xen/softirq.h>
> >  #include <xen/irq.h>
> >  #include <xen/numa.h>
> > +#include <xen/sched.h>
> >  #include <asm/fixmap.h>
> >  #include <asm/div64.h>
> >  #include <asm/hpet.h>
> > @@ -368,7 +369,7 @@ static int __init hpet_assign_irq(struct hpet_event=
_channel *ch)
> >  {
> >      int irq;
> > =20
> > -    if ( (irq =3D create_irq(NUMA_NO_NODE)) < 0 )
> > +    if ( (irq =3D create_irq(NUMA_NO_NODE, hardware_domain)) < 0 )
>=20
> Shouldn't this be NULL? I don't think the hardware domain should be
> allowed to play with the HPET IRQs?

Good point.

> >          return irq;
> > =20
> >      ch->msi.irq =3D irq;
> > diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
> > index 2cac28a..dc5d302 100644
> > --- a/xen/arch/x86/irq.c
> > +++ b/xen/arch/x86/irq.c
> > @@ -164,10 +164,21 @@ int __init bind_irq_vector(int irq, int vector, c=
onst cpumask_t *cpu_mask)
> >      return ret;
> >  }
> > =20
> > +static struct domain *get_dm_domain(struct domain *d)
>                                        ^ const
> > +{
> > +    return current->domain->target =3D=3D d ? current->domain : hardwa=
re_domain;
> > +}
> > +
> >  /*
> >   * Dynamic irq allocate and deallocation for MSI
> >   */
> > -int create_irq(nodeid_t node)
> > +
> > +/*
> > + * create_irq - allocate irq for MSI
> > + * @d domain that will get permission over the allocated irq; this per=
mission
> > + * will automatically be revoked on destroy_irq
> > + */
> > +int create_irq(nodeid_t node, struct domain *d)
> >  {
> >      int irq, ret;
> >      struct irq_desc *desc;
> > @@ -200,18 +211,24 @@ int create_irq(nodeid_t node)
> >          desc->arch.used =3D IRQ_UNUSED;
> >          irq =3D ret;
> >      }
>=20
> I would assert that desc->creator_domid =3D=3D DOMID_INVALID here, since
> in the failure case creator_domid is not overwritten.

Yes, see below.

> > -    else if ( hardware_domain )
> > +    else if ( d )
> >      {
> > -        ret =3D irq_permit_access(hardware_domain, irq);
> > +        ASSERT(d =3D=3D current->domain);
> > +        ret =3D irq_permit_access(d, irq);
> >          if ( ret )
> >              printk(XENLOG_G_ERR
> > -                   "Could not grant Dom0 access to IRQ%d (error %d)\n",
> > -                   irq, ret);
> > +                   "Could not grant Dom%u access to IRQ%d (error %d)\n=
",
> > +                   d->domain_id, irq, ret);
> > +        else
> > +            desc->creator_domid =3D d->domain_id;
> >      }
> > =20
> >      return irq;
> >  }
> > =20
> > +/*
> > + * destroy_irq - deallocate irq for MSI
> > + */
> >  void destroy_irq(unsigned int irq)
> >  {
> >      struct irq_desc *desc =3D irq_to_desc(irq);
> > @@ -220,14 +237,22 @@ void destroy_irq(unsigned int irq)
> > =20
> >      BUG_ON(!MSI_IRQ(irq));
> > =20
> > -    if ( hardware_domain )
> > +    if ( desc->creator_domid !=3D DOMID_INVALID )
> >      {
> > -        int err =3D irq_deny_access(hardware_domain, irq);
> > +        struct domain *d =3D get_domain_by_id(desc->creator_domid);
> > =20
> > -        if ( err )
> > -            printk(XENLOG_G_ERR
> > -                   "Could not revoke Dom0 access to IRQ%u (error %d)\n=
",
> > -                   irq, err);
> > +        if ( d && irq_access_permitted(d, irq) ) {
> > +            int err;
> > +
> > +            err =3D irq_deny_access(d, irq);
> > +            if ( err )
> > +                printk(XENLOG_G_ERR
> > +                       "Could not revoke Dom%u access to IRQ%u (error =
%d)\n",
> > +                       d->domain_id, irq, err);
> > +        }
> > +
> > +        if ( d )
> > +            put_domain(d);
>=20
> Don't you need to set creator_domid =3D DOMID_INVALID in destroy_irq at
> some point?
>=20
> Or else a failure in create_irq could leak the irq to it's previous
> owner. Note that init_one_irq_desc would only init the fields the
> first time the IRQ is used, but not for subsequent usages AFAICT.

I assumed init_one_irq_desc do the work on subsequent usages too. If not,
indeed I need to modify creator_domid in few more places.

> >      }
> > =20
> >      spin_lock_irqsave(&desc->lock, flags);
> > @@ -2058,7 +2083,7 @@ int map_domain_pirq(
> >              spin_unlock_irqrestore(&desc->lock, flags);
> > =20
> >              info =3D NULL;
> > -            irq =3D create_irq(NUMA_NO_NODE);
> > +            irq =3D create_irq(NUMA_NO_NODE, get_dm_domain(d));
>=20
> Isn't it fine to just use current->domain here directly?
>=20
> It's always going to be the current domain the one that calls
> map_domain_pirq in order to get a PIRQ mapped for it's target
> domain I think.

I wasn't sure if that's true if all the cases. Especially if hardware
domain !=3D toolstack domain. How is it then? Is it hardware domain
calling map_domain_pirq in that case?

> >              ret =3D irq >=3D 0 ? prepare_domain_irq_pirq(d, irq, pirq =
+ nr, &info)
> >                             : irq;
> >              if ( ret < 0 )
> > @@ -2691,7 +2716,7 @@ int allocate_and_map_msi_pirq(struct domain *d, i=
nt index, int *pirq_p,
> >          if ( irq =3D=3D -1 )
> >          {
> >      case MAP_PIRQ_TYPE_MULTI_MSI:
> > -            irq =3D create_irq(NUMA_NO_NODE);
> > +            irq =3D create_irq(NUMA_NO_NODE, get_dm_domain(d));
> >          }
> > =20
> >          if ( irq < nr_irqs_gsi || irq >=3D nr_irqs )
> > diff --git a/xen/common/irq.c b/xen/common/irq.c
> > index f42512d..42b27a9 100644
> > --- a/xen/common/irq.c
> > +++ b/xen/common/irq.c
> > @@ -16,6 +16,7 @@ int init_one_irq_desc(struct irq_desc *desc)
> >      spin_lock_init(&desc->lock);
> >      cpumask_setall(desc->affinity);
> >      INIT_LIST_HEAD(&desc->rl_link);
> > +    desc->creator_domid =3D DOMID_INVALID;
> > =20
> >      err =3D arch_init_one_irq_desc(desc);
> >      if ( err )
> > diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
> > index 189e121..ccc8b04 100644
> > --- a/xen/drivers/char/ns16550.c
> > +++ b/xen/drivers/char/ns16550.c
> > @@ -719,7 +719,7 @@ static void __init ns16550_init_irq(struct serial_p=
ort *port)
> >      struct ns16550 *uart =3D port->uart;
> > =20
> >      if ( uart->msi )
> > -        uart->irq =3D create_irq(0);
> > +        uart->irq =3D create_irq(0, NULL);
> >  #endif
> >  }
> > =20
> > diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/pas=
sthrough/amd/iommu_init.c
> > index 4e76b26..50785e0 100644
> > --- a/xen/drivers/passthrough/amd/iommu_init.c
> > +++ b/xen/drivers/passthrough/amd/iommu_init.c
> > @@ -781,7 +781,7 @@ static bool_t __init set_iommu_interrupt_handler(st=
ruct amd_iommu *iommu)
> >      hw_irq_controller *handler;
> >      u16 control;
> > =20
> > -    irq =3D create_irq(NUMA_NO_NODE);
> > +    irq =3D create_irq(NUMA_NO_NODE, NULL);
> >      if ( irq <=3D 0 )
> >      {
> >          dprintk(XENLOG_ERR, "IOMMU: no irqs\n");
> > diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pc=
i.c
> > index e886894..507b3d1 100644
> > --- a/xen/drivers/passthrough/pci.c
> > +++ b/xen/drivers/passthrough/pci.c
> > @@ -845,6 +845,9 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
> >      list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
> >          if ( pdev->bus =3D=3D bus && pdev->devfn =3D=3D devfn )
> >          {
> > +            ret =3D -EBUSY;
> > +            if ( pdev->domain && pdev->domain !=3D hardware_domain )
> > +                break;
>=20
> This seems like an unlrelated fix?
>=20
> ie: preventing device removal while in use by a domain different than
> dom0?

Indeed it may warrant separate commit now.

> Note that you don't need the pdev->domain !=3D NULL check, just doing
> pdev->domain !=3D hardware_domain seems enough, since you don't
> dereference the pdev->domain pointer in the expression (unless I'm
> missing other usages below).

I don't want to prevent removal if pdev->domain is NULL (if that's even
possible).

> >              ret =3D iommu_remove_device(pdev);
> >              if ( pdev->domain )
> >                  list_del(&pdev->domain_list);
> > diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthro=
ugh/vtd/iommu.c
> > index 8b27d7e..79f9682 100644
> > --- a/xen/drivers/passthrough/vtd/iommu.c
> > +++ b/xen/drivers/passthrough/vtd/iommu.c
> > @@ -1138,7 +1138,8 @@ static int __init iommu_set_interrupt(struct acpi=
_drhd_unit *drhd)
> >      struct irq_desc *desc;
> > =20
> >      irq =3D create_irq(rhsa ? pxm_to_node(rhsa->proximity_domain)
> > -                          : NUMA_NO_NODE);
> > +                          : NUMA_NO_NODE,
> > +                     NULL);
> >      if ( irq <=3D 0 )
> >      {
> >          dprintk(XENLOG_ERR VTDPREFIX, "IOMMU: no irq available!\n");
> > diff --git a/xen/include/asm-x86/irq.h b/xen/include/asm-x86/irq.h
> > index c0c6e7c..5b24428 100644
> > --- a/xen/include/asm-x86/irq.h
> > +++ b/xen/include/asm-x86/irq.h
> > @@ -155,7 +155,7 @@ int  init_irq_data(void);
> >  void clear_irq_vector(int irq);
> > =20
> >  int irq_to_vector(int irq);
> > -int create_irq(nodeid_t node);
> > +int create_irq(nodeid_t node, struct domain *d);
> >  void destroy_irq(unsigned int irq);
> >  int assign_irq_vector(int irq, const cpumask_t *);
> > =20
> > diff --git a/xen/include/xen/irq.h b/xen/include/xen/irq.h
> > index 586b783..c7a6a83 100644
> > --- a/xen/include/xen/irq.h
> > +++ b/xen/include/xen/irq.h
> > @@ -91,6 +91,7 @@ typedef struct irq_desc {
> >      spinlock_t lock;
> >      struct arch_irq_desc arch;
> >      cpumask_var_t affinity;
> > +    domid_t creator_domid; /* weak reference to domain handling this I=
RQ */
>=20
> I feel like handling is too vague here, but I'm not a native speaker
> so I'm not sure. I would maybe write:
>=20
> ... domain having permissions over this IRQ (which can be different
> from the domain actually having the IRQ assigned) */
>=20
> Which I think is less ambiguous.

I wanted to fit the comment in one line. But your version indeed may be
better.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--glDgwcODtpHomn63
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl0vObYACgkQ24/THMrX
1yztbgf9Hu+dYg9HtDoDrgP82GioH1tSpPyQezh5E+lO2YjCuQ3FRuXm28l4jMLX
ahIrsT1Ayq77J5vL+G7Yk1H+gk4wFm+QovFi3uaovNGKnWnqc9W3NbPLGwHmQKh1
CHi3QpStqWwexUy/wsZtT+l+dG/PqW7ZkbbmK28/dmoC7nVPiqoF+YY+g6J/Oaxg
gNmZa437UOXt3e4iOgFKuKBk4VILgQFHvJuY5U/RBwrfM/VIT5AspbKM1RL4M0Tz
wFPRmLctdU8+arzGJ6JIzzSq3MD5R69v9iSNyb/TTWE9RnvciLFKfih3GBhdWTbq
sE5LrwGzq6rAicyRtKWeMXkzYzz91Q==
=Guxz
-----END PGP SIGNATURE-----

--glDgwcODtpHomn63--


--===============6406411280137365050==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6406411280137365050==--

