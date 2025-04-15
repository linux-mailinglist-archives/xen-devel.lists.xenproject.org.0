Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C39A89532
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 09:35:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.952161.1347696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4aok-0007OA-AZ; Tue, 15 Apr 2025 07:34:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 952161.1347696; Tue, 15 Apr 2025 07:34:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4aok-0007MN-6p; Tue, 15 Apr 2025 07:34:50 +0000
Received: by outflank-mailman (input) for mailman id 952161;
 Tue, 15 Apr 2025 07:34:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xs7D=XB=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u4aoh-0007MA-ML
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 07:34:48 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17cbbf22-19cc-11f0-9ffb-bf95429c2676;
 Tue, 15 Apr 2025 09:34:41 +0200 (CEST)
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
X-Inumbo-ID: 17cbbf22-19cc-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=5qw2wwrvczbdzgf2rpfip7mrnq.protonmail; t=1744702479; x=1744961679;
	bh=p8Al5BkiU4fITEoE2EBWyFpPIrjqNzc5NaFXBei/bfc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=Qu7D/mdUWIZz+gSawPbFths46fPHC0JeNZjdgnJollKFUGWzOFlVcv59u/gSI53d5
	 /MfOm54Bz7ysDaT3hZPWChsn6XY+Et8xZOAiRxFSL5Bofe6RomGBHdqrXmhgBEtQd2
	 IHMqQpEY43ErcYugnqX2j3Nl534XkiYG/iCzO4Kv467d+U70LEJdA9znCKpKPkjit+
	 hCDU9bLsJfpFCs0mCPcP+X1LnIaBC6XDYVownvFYn9oq0bcdRbACTcPyqPsPgkiu66
	 ykCY8LceWeFVb9TBeeI6ypJFCu+735NcvOD7MHLaRSdStgXNmbVAFIKFn0u5pai+LI
	 gP8Q+kbYnUCOg==
Date: Tue, 15 Apr 2025 07:34:37 +0000
To: Andrii Sultanov <sultanovandriy@gmail.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 1/3] drivers: Change amd_iommu struct to contain pci_sbdf_t, simplify code
Message-ID: <Z/4MCopF/j5357Mf@starscream>
In-Reply-To: <40f504017d71c16a3e2bc8945ac5e674a3e791ed.1744657012.git.andriy.sultanov@vates.tech>
References: <cover.1744657012.git.andriy.sultanov@vates.tech> <40f504017d71c16a3e2bc8945ac5e674a3e791ed.1744657012.git.andriy.sultanov@vates.tech>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 8ef8c707fcb0dd97eba4a6b1f7f8a72dafb9ee17
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 08:19:16PM +0100, Andrii Sultanov wrote:
> From: Andrii Sultanov <sultanovandriy@gmail.com>
>=20
> Following on from 250d87dc3ff9 ("x86/msi: Change __msi_set_enable() to
> take pci_sbdf_t"), make struct amd_iommu contain pci_sbdf_t directly
> instead of specifying seg+bdf separately and regenerating sbdf_t from the=
m,
> which simplifies code.
>=20
> Bloat-o-meter reports:
> add/remove: 0/0 grow/shrink: 4/13 up/down: 121/-377 (-256)
> Function                                     old     new   delta
> _einittext                                 22028   22092     +64
> amd_iommu_prepare                            853     897     +44
> __mon_lengths                               2928    2936      +8
> _invalidate_all_devices                      133     138      +5
> _hvm_dpci_msi_eoi                            157     155      -2
> build_info                                   752     744      -8
> amd_iommu_add_device                         856     844     -12
> amd_iommu_msi_enable                          33      20     -13
> update_intremap_entry_from_msi_msg           879     859     -20
> amd_iommu_msi_msg_update_ire                 472     448     -24
> send_iommu_command                           251     224     -27
> amd_iommu_get_supported_ivhd_type             86      54     -32
> amd_iommu_detect_one_acpi                    918     886     -32
> iterate_ivrs_mappings                        169     129     -40
> flush_command_buffer                         460     417     -43
> set_iommu_interrupt_handler                  421     377     -44
> enable_iommu                                1745    1665     -80
>=20
> Resolves: https://gitlab.com/xen-project/xen/-/issues/198
>=20
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Andrii Sultanov <sultanovandriy@gmail.com>
>=20
> ---
> Changes in V4:
> * Dropped references to the order of seg/bdf in the commit message
> * Dropped unnecessary detail from the commit message
> * Reverted to a macro usage in one case where it was mistakenly dropped
> * Folded several separate seg+bdf comparisons into a single one between
>   sbdf_t, folded separate assignments with a macro.
> * More code size improvements with the changes, so I've refreshed the
>   bloat-o-meter report
>=20
> Changes in V3:
> * Dropped the union with seg+bdf/pci_sbdf_t to avoid aliasing, renamed
>   all users appropriately
>=20
> Changes in V2:
> * Split single commit into several patches
> * Added the commit title of the referenced patch
> * Dropped brackets around &(iommu->sbdf) and &(sbdf)
> ---
>  xen/drivers/passthrough/amd/iommu.h         |  4 +--
>  xen/drivers/passthrough/amd/iommu_acpi.c    | 16 +++++-----
>  xen/drivers/passthrough/amd/iommu_cmd.c     |  8 ++---
>  xen/drivers/passthrough/amd/iommu_detect.c  | 18 +++++------
>  xen/drivers/passthrough/amd/iommu_init.c    | 35 ++++++++++-----------
>  xen/drivers/passthrough/amd/iommu_intr.c    | 29 ++++++++---------
>  xen/drivers/passthrough/amd/iommu_map.c     |  4 +--
>  xen/drivers/passthrough/amd/pci_amd_iommu.c | 22 ++++++-------
>  8 files changed, 67 insertions(+), 69 deletions(-)
>=20
> diff --git a/xen/drivers/passthrough/amd/iommu.h b/xen/drivers/passthroug=
h/amd/iommu.h
> index 00e81b4b2a..ba541f7943 100644
> --- a/xen/drivers/passthrough/amd/iommu.h
> +++ b/xen/drivers/passthrough/amd/iommu.h
> @@ -77,8 +77,8 @@ struct amd_iommu {
>      struct list_head list;
>      spinlock_t lock; /* protect iommu */
>=20
> -    u16 seg;
> -    u16 bdf;
> +    pci_sbdf_t sbdf;
> +
>      struct msi_desc msi;
>=20
>      u16 cap_offset;
> diff --git a/xen/drivers/passthrough/amd/iommu_acpi.c b/xen/drivers/passt=
hrough/amd/iommu_acpi.c
> index 5bdbfb5ba8..025d9be40f 100644
> --- a/xen/drivers/passthrough/amd/iommu_acpi.c
> +++ b/xen/drivers/passthrough/amd/iommu_acpi.c
> @@ -58,7 +58,7 @@ static void __init add_ivrs_mapping_entry(
>      uint16_t bdf, uint16_t alias_id, uint8_t flags, unsigned int ext_fla=
gs,
>      bool alloc_irt, struct amd_iommu *iommu)
>  {
> -    struct ivrs_mappings *ivrs_mappings =3D get_ivrs_mappings(iommu->seg=
);
> +    struct ivrs_mappings *ivrs_mappings =3D get_ivrs_mappings(iommu->sbd=
f.seg);
>=20
>      ASSERT( ivrs_mappings !=3D NULL );
>=20
> @@ -70,7 +70,7 @@ static void __init add_ivrs_mapping_entry(
>      ivrs_mappings[bdf].device_flags =3D flags;
>=20
>      /* Don't map an IOMMU by itself. */
> -    if ( iommu->bdf =3D=3D bdf )
> +    if ( iommu->sbdf.bdf =3D=3D bdf )
>          return;
>=20
>      /* Allocate interrupt remapping table if needed. */
> @@ -96,7 +96,7 @@ static void __init add_ivrs_mapping_entry(
>=20
>              if ( !ivrs_mappings[alias_id].intremap_table )
>                  panic("No memory for %pp's IRT\n",
> -                      &PCI_SBDF(iommu->seg, alias_id));
> +                      &PCI_SBDF(iommu->sbdf.seg, alias_id));
>          }
>      }
>=20
> @@ -112,7 +112,7 @@ static struct amd_iommu * __init find_iommu_from_bdf_=
cap(
>      struct amd_iommu *iommu;
>=20
>      for_each_amd_iommu ( iommu )
> -        if ( (iommu->seg =3D=3D seg) && (iommu->bdf =3D=3D bdf) &&
> +        if ( (iommu->sbdf.seg =3D=3D seg) && (iommu->sbdf.bdf =3D=3D bdf=
) &&

Perhaps something like

           if ( (iommu->sbdf.sbdf =3D=3D PCI_SBDF(seg, bdf).sbdf &&

?

>               (iommu->cap_offset =3D=3D cap_offset) )
>              return iommu;
>=20
> @@ -297,13 +297,13 @@ static int __init register_range_for_iommu_devices(
>      /* reserve unity-mapped page entries for devices */
>      for ( bdf =3D rc =3D 0; !rc && bdf < ivrs_bdf_entries; bdf++ )
>      {
> -        if ( iommu !=3D find_iommu_for_device(iommu->seg, bdf) )
> +        if ( iommu !=3D find_iommu_for_device(iommu->sbdf.seg, bdf) )
>              continue;
>=20
> -        req =3D get_ivrs_mappings(iommu->seg)[bdf].dte_requestor_id;
> -        rc =3D reserve_unity_map_for_device(iommu->seg, bdf, base, lengt=
h,
> +        req =3D get_ivrs_mappings(iommu->sbdf.seg)[bdf].dte_requestor_id=
;
> +        rc =3D reserve_unity_map_for_device(iommu->sbdf.seg, bdf, base, =
length,
>                                            iw, ir, false) ?:
> -             reserve_unity_map_for_device(iommu->seg, req, base, length,
> +             reserve_unity_map_for_device(iommu->sbdf.seg, req, base, le=
ngth,
>                                            iw, ir, false);
>      }
>=20
> diff --git a/xen/drivers/passthrough/amd/iommu_cmd.c b/xen/drivers/passth=
rough/amd/iommu_cmd.c
> index 83c525b84f..eefd626161 100644
> --- a/xen/drivers/passthrough/amd/iommu_cmd.c
> +++ b/xen/drivers/passthrough/amd/iommu_cmd.c
> @@ -40,7 +40,7 @@ static void send_iommu_command(struct amd_iommu *iommu,
>                       IOMMU_RING_BUFFER_PTR_MASK) )
>      {
>          printk_once(XENLOG_ERR "AMD IOMMU %pp: no cmd slot available\n",
> -                    &PCI_SBDF(iommu->seg, iommu->bdf));
> +                    &iommu->sbdf);
>          cpu_relax();
>      }
>=20
> @@ -85,7 +85,7 @@ static void flush_command_buffer(struct amd_iommu *iomm=
u,
>              threshold |=3D threshold << 1;
>              printk(XENLOG_WARNING
>                     "AMD IOMMU %pp: %scompletion wait taking too long\n",
> -                   &PCI_SBDF(iommu->seg, iommu->bdf),
> +                   &iommu->sbdf,
>                     timeout_base ? "iotlb " : "");
>              timeout =3D 0;
>          }
> @@ -95,7 +95,7 @@ static void flush_command_buffer(struct amd_iommu *iomm=
u,
>      if ( !timeout )
>          printk(XENLOG_WARNING
>                 "AMD IOMMU %pp: %scompletion wait took %lums\n",
> -               &PCI_SBDF(iommu->seg, iommu->bdf),
> +               &iommu->sbdf,
>                 timeout_base ? "iotlb " : "",
>                 (NOW() - start) / 10000000);
>  }
> @@ -300,7 +300,7 @@ void amd_iommu_flush_iotlb(u8 devfn, const struct pci=
_dev *pdev,
>      if ( !iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) )
>          return;
>=20
> -    req_id =3D get_dma_requestor_id(iommu->seg, PCI_BDF(pdev->bus, devfn=
));
> +    req_id =3D get_dma_requestor_id(iommu->sbdf.seg, PCI_BDF(pdev->bus, =
devfn));
>      queueid =3D req_id;
>      maxpend =3D pdev->ats.queue_depth & 0xff;
>=20
> diff --git a/xen/drivers/passthrough/amd/iommu_detect.c b/xen/drivers/pas=
sthrough/amd/iommu_detect.c
> index cede44e651..72cc554b08 100644
> --- a/xen/drivers/passthrough/amd/iommu_detect.c
> +++ b/xen/drivers/passthrough/amd/iommu_detect.c
> @@ -162,8 +162,8 @@ int __init amd_iommu_detect_one_acpi(
>      spin_lock_init(&iommu->lock);
>      INIT_LIST_HEAD(&iommu->ats_devices);
>=20
> -    iommu->seg =3D ivhd_block->pci_segment_group;
> -    iommu->bdf =3D ivhd_block->header.device_id;
> +    iommu->sbdf =3D PCI_SBDF(ivhd_block->pci_segment_group,
> +                           ivhd_block->header.device_id);
>      iommu->cap_offset =3D ivhd_block->capability_offset;
>      iommu->mmio_base_phys =3D ivhd_block->base_address;
>=20
> @@ -210,16 +210,16 @@ int __init amd_iommu_detect_one_acpi(
>      /* override IOMMU HT flags */
>      iommu->ht_flags =3D ivhd_block->header.flags;
>=20
> -    bus =3D PCI_BUS(iommu->bdf);
> -    dev =3D PCI_SLOT(iommu->bdf);
> -    func =3D PCI_FUNC(iommu->bdf);
> +    bus =3D PCI_BUS(iommu->sbdf.bdf);
> +    dev =3D PCI_SLOT(iommu->sbdf.bdf);
> +    func =3D PCI_FUNC(iommu->sbdf.bdf);
>=20
> -    rt =3D get_iommu_capabilities(iommu->seg, bus, dev, func,
> +    rt =3D get_iommu_capabilities(iommu->sbdf.seg, bus, dev, func,

I would update signature of get_iommu_capabilities() so it takes pci_sbdf_t
as an agument instead of disaggregated PCI address. I think it will simplif=
y
the code futher.

>                                  iommu->cap_offset, iommu);
>      if ( rt )
>          goto out;
>=20
> -    rt =3D get_iommu_msi_capabilities(iommu->seg, bus, dev, func, iommu)=
;
> +    rt =3D get_iommu_msi_capabilities(iommu->sbdf.seg, bus, dev, func, i=
ommu);

... and same idea for get_iommu_msi_capabilities()

What do you think?

>      if ( rt )
>          goto out;
>=20
> @@ -228,10 +228,10 @@ int __init amd_iommu_detect_one_acpi(
>      if ( !iommu->domid_map )
>          goto out;
>=20
> -    rt =3D pci_ro_device(iommu->seg, bus, PCI_DEVFN(dev, func));
> +    rt =3D pci_ro_device(iommu->sbdf.seg, bus, PCI_DEVFN(dev, func));

There's not so many users of pci_ro_device(). I think it makes sense to upd=
ate
pci_ro_device() to something like:

    int pci_ro_device(pci_sbdf_t pciaddr);

But probably in a separate code change.

>      if ( rt )
>          printk(XENLOG_ERR "Could not mark config space of %pp read-only =
(%d)\n",
> -               &PCI_SBDF(iommu->seg, iommu->bdf), rt);
> +               &iommu->sbdf, rt);
>=20
>      list_add_tail(&iommu->list, &amd_iommu_head);
>      rt =3D 0;
> diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passt=
hrough/amd/iommu_init.c
> index bb25b55c85..58d657060a 100644
> --- a/xen/drivers/passthrough/amd/iommu_init.c
> +++ b/xen/drivers/passthrough/amd/iommu_init.c
> @@ -409,9 +409,7 @@ static void iommu_reset_log(struct amd_iommu *iommu,
>=20
>  static void amd_iommu_msi_enable(struct amd_iommu *iommu, int flag)
>  {
> -    pci_sbdf_t sbdf =3D { .seg =3D iommu->seg, .bdf =3D iommu->bdf };
> -
> -    __msi_set_enable(sbdf, iommu->msi.msi_attrib.pos, flag);
> +    __msi_set_enable(iommu->sbdf, iommu->msi.msi_attrib.pos, flag);
>  }
>=20
>  static void cf_check iommu_msi_unmask(struct irq_desc *desc)
> @@ -566,7 +564,7 @@ static void cf_check parse_event_log_entry(struct amd=
_iommu *iommu, u32 entry[])
>=20
>          printk(XENLOG_ERR "AMD-Vi: %s: %pp d%u addr %016"PRIx64
>                 " flags %#x%s%s%s%s%s%s%s%s%s%s\n",
> -               code_str, &PCI_SBDF(iommu->seg, device_id),
> +               code_str, &PCI_SBDF(iommu->sbdf.seg, device_id),
>                 domain_id, addr, flags,
>                 (flags & 0xe00) ? " ??" : "",
>                 (flags & 0x100) ? " TR" : "",
> @@ -583,8 +581,8 @@ static void cf_check parse_event_log_entry(struct amd=
_iommu *iommu, u32 entry[])
>              amd_iommu_print_entries(iommu, device_id, daddr_to_dfn(addr)=
);
>=20
>          for ( bdf =3D 0; bdf < ivrs_bdf_entries; bdf++ )
> -            if ( get_dma_requestor_id(iommu->seg, bdf) =3D=3D device_id =
)
> -                pci_check_disable_device(iommu->seg, PCI_BUS(bdf),
> +            if ( get_dma_requestor_id(iommu->sbdf.seg, bdf) =3D=3D devic=
e_id )
> +                pci_check_disable_device(iommu->sbdf.seg, PCI_BUS(bdf),
>                                           PCI_DEVFN(bdf));
>      }
>      else
> @@ -643,7 +641,7 @@ static void cf_check parse_ppr_log_entry(struct amd_i=
ommu *iommu, u32 entry[])
>      struct pci_dev *pdev;
>=20
>      pcidevs_lock();
> -    pdev =3D pci_get_real_pdev(PCI_SBDF(iommu->seg, device_id));
> +    pdev =3D pci_get_real_pdev(PCI_SBDF(iommu->sbdf.seg, device_id));
>      pcidevs_unlock();
>=20
>      if ( pdev )
> @@ -752,12 +750,11 @@ static bool __init set_iommu_interrupt_handler(stru=
ct amd_iommu *iommu)
>      }
>=20
>      pcidevs_lock();
> -    iommu->msi.dev =3D pci_get_pdev(NULL, PCI_SBDF(iommu->seg, iommu->bd=
f));
> +    iommu->msi.dev =3D pci_get_pdev(NULL, iommu->sbdf);
>      pcidevs_unlock();
>      if ( !iommu->msi.dev )
>      {
> -        AMD_IOMMU_WARN("no pdev for %pp\n",
> -                       &PCI_SBDF(iommu->seg, iommu->bdf));
> +        AMD_IOMMU_WARN("no pdev for %pp\n", &iommu->sbdf);
>          return 0;
>      }
>=20
> @@ -779,7 +776,7 @@ static bool __init set_iommu_interrupt_handler(struct=
 amd_iommu *iommu)
>          hw_irq_controller *handler;
>          u16 control;
>=20
> -        control =3D pci_conf_read16(PCI_SBDF(iommu->seg, iommu->bdf),
> +        control =3D pci_conf_read16(iommu->sbdf,
>                                    iommu->msi.msi_attrib.pos + PCI_MSI_FL=
AGS);
>=20
>          iommu->msi.msi.nvec =3D 1;
> @@ -843,22 +840,22 @@ static void amd_iommu_erratum_746_workaround(struct=
 amd_iommu *iommu)
>           (boot_cpu_data.x86_model > 0x1f) )
>          return;
>=20
> -    pci_conf_write32(PCI_SBDF(iommu->seg, iommu->bdf), 0xf0, 0x90);
> -    value =3D pci_conf_read32(PCI_SBDF(iommu->seg, iommu->bdf), 0xf4);
> +    pci_conf_write32(iommu->sbdf, 0xf0, 0x90);
> +    value =3D pci_conf_read32(iommu->sbdf, 0xf4);
>=20
>      if ( value & (1 << 2) )
>          return;
>=20
>      /* Select NB indirect register 0x90 and enable writing */
> -    pci_conf_write32(PCI_SBDF(iommu->seg, iommu->bdf), 0xf0, 0x90 | (1 <=
< 8));
> +    pci_conf_write32(iommu->sbdf, 0xf0, 0x90 | (1 << 8));
>=20
> -    pci_conf_write32(PCI_SBDF(iommu->seg, iommu->bdf), 0xf4, value | (1 =
<< 2));
> +    pci_conf_write32(iommu->sbdf, 0xf4, value | (1 << 2));
>      printk(XENLOG_INFO
>             "AMD-Vi: Applying erratum 746 workaround for IOMMU at %pp\n",
> -           &PCI_SBDF(iommu->seg, iommu->bdf));
> +           &iommu->sbdf);
>=20
>      /* Clear the enable writing bit */
> -    pci_conf_write32(PCI_SBDF(iommu->seg, iommu->bdf), 0xf0, 0x90);
> +    pci_conf_write32(iommu->sbdf, 0xf0, 0x90);
>  }
>=20
>  static void enable_iommu(struct amd_iommu *iommu)
> @@ -1095,7 +1092,7 @@ static int __init amd_iommu_init_one(struct amd_iom=
mu *iommu, bool intr)
>          goto error_out;
>=20
>      /* Make sure that the device table has been successfully allocated. =
*/
> -    ivrs_mappings =3D get_ivrs_mappings(iommu->seg);
> +    ivrs_mappings =3D get_ivrs_mappings(iommu->sbdf.seg);
>      if ( !IVRS_MAPPINGS_DEVTAB(ivrs_mappings) )
>          goto error_out;
>=20
> @@ -1363,7 +1360,7 @@ static bool __init amd_sp5100_erratum28(void)
>=20
>  static int __init amd_iommu_prepare_one(struct amd_iommu *iommu)
>  {
> -    int rc =3D alloc_ivrs_mappings(iommu->seg);
> +    int rc =3D alloc_ivrs_mappings(iommu->sbdf.seg);
>=20
>      if ( !rc )
>          rc =3D map_iommu_mmio_region(iommu);
> diff --git a/xen/drivers/passthrough/amd/iommu_intr.c b/xen/drivers/passt=
hrough/amd/iommu_intr.c
> index 9abdc38053..a7347fcbad 100644
> --- a/xen/drivers/passthrough/amd/iommu_intr.c
> +++ b/xen/drivers/passthrough/amd/iommu_intr.c
> @@ -132,7 +132,7 @@ static int get_intremap_requestor_id(int seg, int bdf=
)
>  static unsigned int alloc_intremap_entry(const struct amd_iommu *iommu,
>                                           unsigned int bdf, unsigned int =
nr)
>  {
> -    const struct ivrs_mappings *ivrs_mappings =3D get_ivrs_mappings(iomm=
u->seg);
> +    const struct ivrs_mappings *ivrs_mappings =3D get_ivrs_mappings(iomm=
u->sbdf.seg);
>      unsigned long *inuse =3D ivrs_mappings[bdf].intremap_inuse;
>      unsigned int nr_ents =3D
>          intremap_table_entries(ivrs_mappings[bdf].intremap_table, iommu)=
;
> @@ -167,7 +167,7 @@ static union irte_ptr get_intremap_entry(const struct=
 amd_iommu *iommu,
>                                           unsigned int bdf, unsigned int =
index)
>  {
>      union irte_ptr table =3D {
> -        .ptr =3D get_ivrs_mappings(iommu->seg)[bdf].intremap_table
> +        .ptr =3D get_ivrs_mappings(iommu->sbdf.seg)[bdf].intremap_table
>      };
>=20
>      ASSERT(table.ptr && (index < intremap_table_entries(table.ptr, iommu=
)));
> @@ -184,7 +184,7 @@ static void free_intremap_entry(const struct amd_iomm=
u *iommu,
>                                  unsigned int bdf, unsigned int index)
>  {
>      union irte_ptr entry =3D get_intremap_entry(iommu, bdf, index);
> -    struct ivrs_mappings *ivrs =3D get_ivrs_mappings(iommu->seg);
> +    struct ivrs_mappings *ivrs =3D get_ivrs_mappings(iommu->sbdf.seg);
>=20
>      if ( iommu->ctrl.ga_en )
>      {
> @@ -281,8 +281,8 @@ static int update_intremap_entry_from_ioapic(
>      unsigned int dest, offset;
>      bool fresh =3D false;
>=20
> -    req_id =3D get_intremap_requestor_id(iommu->seg, bdf);
> -    lock =3D get_intremap_lock(iommu->seg, req_id);
> +    req_id =3D get_intremap_requestor_id(iommu->sbdf.seg, bdf);
> +    lock =3D get_intremap_lock(iommu->sbdf.seg, req_id);
>=20
>      delivery_mode =3D rte->delivery_mode;
>      vector =3D rte->vector;
> @@ -419,10 +419,10 @@ static int update_intremap_entry_from_msi_msg(
>      unsigned int dest, offset, i;
>      bool fresh =3D false;
>=20
> -    req_id =3D get_dma_requestor_id(iommu->seg, bdf);
> -    alias_id =3D get_intremap_requestor_id(iommu->seg, bdf);
> +    req_id =3D get_dma_requestor_id(iommu->sbdf.seg, bdf);
> +    alias_id =3D get_intremap_requestor_id(iommu->sbdf.seg, bdf);
>=20
> -    lock =3D get_intremap_lock(iommu->seg, req_id);
> +    lock =3D get_intremap_lock(iommu->sbdf.seg, req_id);
>      spin_lock_irqsave(lock, flags);
>=20
>      if ( msg =3D=3D NULL )
> @@ -486,10 +486,10 @@ static int update_intremap_entry_from_msi_msg(
>       */
>=20
>      if ( ( req_id !=3D alias_id ) &&
> -         get_ivrs_mappings(iommu->seg)[alias_id].intremap_table !=3D NUL=
L )
> +         get_ivrs_mappings(iommu->sbdf.seg)[alias_id].intremap_table !=
=3D NULL )
>      {
> -        BUG_ON(get_ivrs_mappings(iommu->seg)[req_id].intremap_table !=3D
> -               get_ivrs_mappings(iommu->seg)[alias_id].intremap_table);
> +        BUG_ON(get_ivrs_mappings(iommu->sbdf.seg)[req_id].intremap_table=
 !=3D
> +               get_ivrs_mappings(iommu->sbdf.seg)[alias_id].intremap_tab=
le);
>      }
>=20
>      return fresh;
> @@ -498,16 +498,17 @@ static int update_intremap_entry_from_msi_msg(
>  static struct amd_iommu *_find_iommu_for_device(int seg, int bdf)
>  {
>      struct amd_iommu *iommu;
> +    pci_sbdf_t sbdf =3D PCI_SBDF(seg, bdf);
>=20
>      for_each_amd_iommu ( iommu )
> -        if ( iommu->seg =3D=3D seg && iommu->bdf =3D=3D bdf )
> +        if ( iommu->sbdf.sbdf =3D=3D sbdf.sbdf )
>              return NULL;
>=20
>      iommu =3D find_iommu_for_device(seg, bdf);
>      if ( iommu )
>          return iommu;
>=20
> -    AMD_IOMMU_DEBUG("No IOMMU for MSI dev =3D %pp\n", &PCI_SBDF(seg, bdf=
));
> +    AMD_IOMMU_DEBUG("No IOMMU for MSI dev =3D %pp\n", &sbdf);
>      return ERR_PTR(-EINVAL);
>  }
>=20
> @@ -730,7 +731,7 @@ static void dump_intremap_table(const struct amd_iomm=
u *iommu,
>          if ( ivrs_mapping )
>          {
>              printk("  %pp:\n",
> -                   &PCI_SBDF(iommu->seg, ivrs_mapping->dte_requestor_id)=
);
> +                   &PCI_SBDF(iommu->sbdf.seg, ivrs_mapping->dte_requesto=
r_id));
>              ivrs_mapping =3D NULL;
>          }
>=20
> diff --git a/xen/drivers/passthrough/amd/iommu_map.c b/xen/drivers/passth=
rough/amd/iommu_map.c
> index dde393645a..d28c475650 100644
> --- a/xen/drivers/passthrough/amd/iommu_map.c
> +++ b/xen/drivers/passthrough/amd/iommu_map.c
> @@ -558,14 +558,14 @@ void amd_iommu_print_entries(const struct amd_iommu=
 *iommu, unsigned int dev_id,
>=20
>      if ( !dt[dev_id].tv )
>      {
> -        printk("%pp: no root\n", &PCI_SBDF(iommu->seg, dev_id));
> +        printk("%pp: no root\n", &PCI_SBDF(iommu->sbdf.seg, dev_id));
>          return;
>      }
>=20
>      pt_mfn =3D _mfn(dt[dev_id].pt_root);
>      level =3D dt[dev_id].paging_mode;
>      printk("%pp root @ %"PRI_mfn" (%u levels) dfn=3D%"PRI_dfn"\n",
> -           &PCI_SBDF(iommu->seg, dev_id), mfn_x(pt_mfn), level, dfn_x(df=
n));
> +           &PCI_SBDF(iommu->sbdf.seg, dev_id), mfn_x(pt_mfn), level, dfn=
_x(dfn));
>=20
>      while ( level )
>      {
> diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/pa=
ssthrough/amd/pci_amd_iommu.c
> index d00697edb3..6b58e3380b 100644
> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> @@ -43,7 +43,7 @@ struct amd_iommu *find_iommu_for_device(int seg, int bd=
f)
>      {
>          unsigned int bd0 =3D bdf & ~PCI_FUNC(~0);
>=20
> -        if ( ivrs_mappings[bd0].iommu && ivrs_mappings[bd0].iommu->bdf !=
=3D bdf )
> +        if ( ivrs_mappings[bd0].iommu && ivrs_mappings[bd0].iommu->sbdf.=
bdf !=3D bdf )
>          {
>              struct ivrs_mappings tmp =3D ivrs_mappings[bd0];
>=20
> @@ -121,7 +121,7 @@ static bool use_ats(
>  {
>      return !ivrs_dev->block_ats &&
>             iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) &&
> -           pci_ats_device(iommu->seg, pdev->bus, pdev->devfn);
> +           pci_ats_device(iommu->sbdf.seg, pdev->bus, pdev->devfn);

Same idea about updating signature to take pci_sbdf_t.

>  }
>=20
>  static int __must_check amd_iommu_setup_domain_device(
> @@ -147,17 +147,17 @@ static int __must_check amd_iommu_setup_domain_devi=
ce(
>      if ( rc )
>          return rc;
>=20
> -    req_id =3D get_dma_requestor_id(iommu->seg, pdev->sbdf.bdf);
> -    ivrs_dev =3D &get_ivrs_mappings(iommu->seg)[req_id];
> +    req_id =3D get_dma_requestor_id(iommu->sbdf.seg, pdev->sbdf.bdf);
> +    ivrs_dev =3D &get_ivrs_mappings(iommu->sbdf.seg)[req_id];
>      sr_flags =3D (iommu_hwdom_passthrough && is_hardware_domain(domain)
>                  ? 0 : SET_ROOT_VALID)
>                 | (ivrs_dev->unity_map ? SET_ROOT_WITH_UNITY_MAP : 0);
>=20
>      /* get device-table entry */
> -    req_id =3D get_dma_requestor_id(iommu->seg, PCI_BDF(bus, devfn));
> +    req_id =3D get_dma_requestor_id(iommu->sbdf.seg, PCI_BDF(bus, devfn)=
);
>      table =3D iommu->dev_table.buffer;
>      dte =3D &table[req_id];
> -    ivrs_dev =3D &get_ivrs_mappings(iommu->seg)[req_id];
> +    ivrs_dev =3D &get_ivrs_mappings(iommu->sbdf.seg)[req_id];
>=20
>      if ( domain !=3D dom_io )
>      {
> @@ -275,7 +275,7 @@ static int __must_check amd_iommu_setup_domain_device=
(
>      ASSERT(pcidevs_locked());
>=20
>      if ( use_ats(pdev, iommu, ivrs_dev) &&
> -         !pci_ats_enabled(iommu->seg, bus, pdev->devfn) )
> +         !pci_ats_enabled(iommu->sbdf.seg, bus, pdev->devfn) )

... and same for pci_ats_enabled()

>      {
>          if ( devfn =3D=3D pdev->devfn )
>              enable_ats_device(pdev, &iommu->ats_devices);
> @@ -418,12 +418,12 @@ static void amd_iommu_disable_domain_device(const s=
truct domain *domain,
>=20
>      ASSERT(pcidevs_locked());
>=20
> -    if ( pci_ats_device(iommu->seg, bus, pdev->devfn) &&
> -         pci_ats_enabled(iommu->seg, bus, pdev->devfn) )
> +    if ( pci_ats_device(iommu->sbdf.seg, bus, pdev->devfn) &&
> +         pci_ats_enabled(iommu->sbdf.seg, bus, pdev->devfn) )
>          disable_ats_device(pdev);
>=20
>      BUG_ON ( iommu->dev_table.buffer =3D=3D NULL );
> -    req_id =3D get_dma_requestor_id(iommu->seg, PCI_BDF(bus, devfn));
> +    req_id =3D get_dma_requestor_id(iommu->sbdf.seg, PCI_BDF(bus, devfn)=
);
>      table =3D iommu->dev_table.buffer;
>      dte =3D &table[req_id];
>=20
> @@ -578,7 +578,7 @@ static int cf_check amd_iommu_add_device(u8 devfn, st=
ruct pci_dev *pdev)
>          return -EINVAL;
>=20
>      for_each_amd_iommu(iommu)
> -        if ( pdev->seg =3D=3D iommu->seg && pdev->sbdf.bdf =3D=3D iommu-=
>bdf )
> +        if ( pdev->sbdf.sbdf =3D=3D iommu->sbdf.sbdf )
>              return is_hardware_domain(pdev->domain) ? 0 : -ENODEV;
>=20
>      iommu =3D find_iommu_for_device(pdev->seg, pdev->sbdf.bdf);
> --
> 2.49.0
>=20
>=20


