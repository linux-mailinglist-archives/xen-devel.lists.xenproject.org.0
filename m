Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D07DAB0ABE7
	for <lists+xen-devel@lfdr.de>; Sat, 19 Jul 2025 00:03:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1049287.1419257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uctAg-0003Po-JY; Fri, 18 Jul 2025 22:03:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1049287.1419257; Fri, 18 Jul 2025 22:03:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uctAg-0003OM-Gq; Fri, 18 Jul 2025 22:03:14 +0000
Received: by outflank-mailman (input) for mailman id 1049287;
 Fri, 18 Jul 2025 22:03:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nesZ=Z7=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uctAe-0003OG-FZ
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 22:03:12 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fde4c244-6422-11f0-a319-13f23c93f187;
 Sat, 19 Jul 2025 00:03:10 +0200 (CEST)
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
X-Inumbo-ID: fde4c244-6422-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1752876188; x=1753135388;
	bh=Fmb2BmTCMprhWzXYicbsvQvIcWFoE1SVq/+mXbZrvKE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=YmAAxY9A5xGJY9UTCvYMwY7Ldc+sub5qk1LpAS6QmiR6W+aX1UM8f0vwW2yihNFeQ
	 ZGRYdURf4Y6n+TI3k3tbmeKEtrd2ct5rOXstkDPhcIhzLlcHbIjPvgYjoaoVoZKyXx
	 n3Y4MXMoEVoiFIY5HWeaFXiMjrKROaAU738jPu0n5w22Og9FlSF7q2eeSBKSCHPiD5
	 oWzzEtkX2KEw4ufnEbvEcsUv6BlSALoMGdGoHzoXkXC7HitZQmD0TWFmPJb3diRhbX
	 cw55QUCrKFLGk/v5UDB5G0CDAX2pLtZ3T1nDeA90hObgW/P63F8sPc24cbxbjuEr3D
	 AXN8EhaFfgXgQ==
Date: Fri, 18 Jul 2025 22:03:05 +0000
To: Andrii Sultanov <sultanovandriy@gmail.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v5 3/3] drivers: Make ioapic_sbdf and hpet_sbdf contain pci_sbdf_t
Message-ID: <aHrElE4KN7djeXzn@kraken>
In-Reply-To: <94d8b7537021337a6b54d8950294702f5bbd2590.1752736989.git.andriy.sultanov@vates.tech>
References: <cover.1752736989.git.andriy.sultanov@vates.tech> <94d8b7537021337a6b54d8950294702f5bbd2590.1752736989.git.andriy.sultanov@vates.tech>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 980e473515732f86d96e2642ad35805ac863692e
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 17, 2025 at 08:31:27AM +0100, Andrii Sultanov wrote:
> Following a similar change to amd_iommu struct, make two more structs
> take pci_sbdf_t directly instead of seg and bdf separately. This lets us
> drop several conversions from the latter to the former and simplifies
> several comparisons and assignments.
>=20
> Bloat-o-meter reports:
> add/remove: 0/0 grow/shrink: 1/10 up/down: 256/-320 (-64)
> Function                                     old     new   delta
> _einittext                                 22092   22348    +256
> parse_ivrs_hpet                              248     245      -3
> amd_iommu_detect_one_acpi                    876     868      -8
> iov_supports_xt                              275     264     -11
> amd_iommu_read_ioapic_from_ire               344     332     -12
> amd_setup_hpet_msi                           237     224     -13
> amd_iommu_ioapic_update_ire                  575     555     -20
> reserve_unity_map_for_device                 453     424     -29
> _hvm_dpci_msi_eoi                            160     128     -32
> amd_iommu_get_supported_ivhd_type             86      30     -56
> parse_ivrs_table                            3966    3830    -136
>=20
> Signed-off-by: Andrii Sultanov <sultanovandriy@gmail.com>
>=20
> ---
> Changes in V5:
> * Dropped PCI_BDF usage inside PCI_SBDF macros
> * Joined separate seg and bdf comparisons into a single sbdf one in
>   parse_ivrs_table
> * Dropped unnecessary bdf in parse_ivhd_device_special, using sbdf.bdf
>   instead
> * Reverted print formatting change in amd_iommu_ioapic_update_ire
>=20
> Changes in V4:
> * Folded several separate seg+bdf comparisons and assignments into one
>   with sbdf_t
> * With reshuffling in the prior commits, this commit is no longer
>   neutral in terms of code size
>=20
> Changes in V3:
> * Dropped aliasing of seg and bdf, renamed users.
>=20
> Changes in V2:
> * Split single commit into several patches
> * Change the format specifier to %pp in amd_iommu_ioapic_update_ire
> ---
>  xen/drivers/passthrough/amd/iommu.h      |  5 +--
>  xen/drivers/passthrough/amd/iommu_acpi.c | 40 ++++++++++------------
>  xen/drivers/passthrough/amd/iommu_intr.c | 43 ++++++++++++------------
>  3 files changed, 41 insertions(+), 47 deletions(-)
>=20
> diff --git a/xen/drivers/passthrough/amd/iommu.h b/xen/drivers/passthroug=
h/amd/iommu.h
> index 2599800e6a..52f748310b 100644
> --- a/xen/drivers/passthrough/amd/iommu.h
> +++ b/xen/drivers/passthrough/amd/iommu.h
> @@ -262,7 +262,7 @@ int cf_check amd_setup_hpet_msi(struct msi_desc *msi_=
desc);
>  void cf_check amd_iommu_dump_intremap_tables(unsigned char key);
>=20
>  extern struct ioapic_sbdf {
> -    u16 bdf, seg;
> +    pci_sbdf_t sbdf;
>      u8 id;
>      bool cmdline;
>      u16 *pin_2_idx;
> @@ -273,7 +273,8 @@ unsigned int ioapic_id_to_index(unsigned int apic_id)=
;
>  unsigned int get_next_ioapic_sbdf_index(void);
>=20
>  extern struct hpet_sbdf {
> -    u16 bdf, seg, id;
> +    pci_sbdf_t sbdf;
> +    uint16_t id;
>      enum {
>          HPET_NONE,
>          HPET_CMDL,
> diff --git a/xen/drivers/passthrough/amd/iommu_acpi.c b/xen/drivers/passt=
hrough/amd/iommu_acpi.c
> index a9c5432e86..c007a427f2 100644
> --- a/xen/drivers/passthrough/amd/iommu_acpi.c
> +++ b/xen/drivers/passthrough/amd/iommu_acpi.c
> @@ -707,8 +707,7 @@ static int __init cf_check parse_ivrs_ioapic(const ch=
ar *str)
>          }
>      }
>=20
> -    ioapic_sbdf[idx].bdf =3D PCI_BDF(bus, dev, func);
> -    ioapic_sbdf[idx].seg =3D seg;
> +    ioapic_sbdf[idx].sbdf =3D PCI_SBDF(seg, bus, dev, func);
>      ioapic_sbdf[idx].id =3D id;
>      ioapic_sbdf[idx].cmdline =3D true;
>=20
> @@ -734,8 +733,7 @@ static int __init cf_check parse_ivrs_hpet(const char=
 *str)
>          return -EINVAL;
>=20
>      hpet_sbdf.id =3D id;
> -    hpet_sbdf.bdf =3D PCI_BDF(bus, dev, func);
> -    hpet_sbdf.seg =3D seg;
> +    hpet_sbdf.sbdf =3D PCI_SBDF(seg, bus, dev, func);
>      hpet_sbdf.init =3D HPET_CMDL;
>=20
>      return 0;
> @@ -746,8 +744,9 @@ static u16 __init parse_ivhd_device_special(
>      const struct acpi_ivrs_device8c *special, u16 seg,
>      u16 header_length, u16 block_length, struct amd_iommu *iommu)
>  {
> -    u16 dev_length, bdf;
> +    u16 dev_length;
>      unsigned int apic, idx;
> +    pci_sbdf_t sbdf;
>=20
>      dev_length =3D sizeof(*special);
>      if ( header_length < (block_length + dev_length) )
> @@ -756,16 +755,16 @@ static u16 __init parse_ivhd_device_special(
>          return 0;
>      }
>=20
> -    bdf =3D special->used_id;
> -    if ( bdf >=3D ivrs_bdf_entries )
> +    sbdf =3D PCI_SBDF(seg, special->used_id);
> +    if ( sbdf.bdf >=3D ivrs_bdf_entries )
>      {
> -        AMD_IOMMU_ERROR("IVHD: invalid Device_Entry Dev_Id %#x\n", bdf);
> +        AMD_IOMMU_ERROR("IVHD: invalid Device_Entry Dev_Id %#x\n", sbdf.=
bdf);

                                                              ^^
Suggest using %pp as a formatter (similar to modification below).

>          return 0;
>      }
>=20
>      AMD_IOMMU_DEBUG("IVHD Special: %pp variety %#x handle %#x\n",
> -                    &PCI_SBDF(seg, bdf), special->variety, special->hand=
le);
> -    add_ivrs_mapping_entry(bdf, bdf, special->header.data_setting, 0, tr=
ue,
> +                    &sbdf, special->variety, special->handle);
> +    add_ivrs_mapping_entry(sbdf.bdf, sbdf.bdf, special->header.data_sett=
ing, 0, true,
>                             iommu);
>=20
>      switch ( special->variety )
> @@ -780,8 +779,7 @@ static u16 __init parse_ivhd_device_special(
>           */
>          for ( idx =3D 0; idx < nr_ioapic_sbdf; idx++ )
>          {
> -            if ( ioapic_sbdf[idx].bdf =3D=3D bdf &&
> -                 ioapic_sbdf[idx].seg =3D=3D seg &&
> +            if ( ioapic_sbdf[idx].sbdf.sbdf =3D=3D sbdf.sbdf &&
>                   ioapic_sbdf[idx].cmdline )
>                  break;
>          }
> @@ -790,7 +788,7 @@ static u16 __init parse_ivhd_device_special(
>              AMD_IOMMU_DEBUG("IVHD: Command line override present for IO-=
APIC %#x"
>                              "(IVRS: %#x devID %pp)\n",
>                              ioapic_sbdf[idx].id, special->handle,
> -                            &PCI_SBDF(seg, bdf));
> +                            &sbdf);
>              break;
>          }
>=20
> @@ -805,8 +803,7 @@ static u16 __init parse_ivhd_device_special(
>                                  special->handle);
>              else if ( idx !=3D MAX_IO_APICS && ioapic_sbdf[idx].pin_2_id=
x )
>              {
> -                if ( ioapic_sbdf[idx].bdf =3D=3D bdf &&
> -                     ioapic_sbdf[idx].seg =3D=3D seg )
> +                if ( ioapic_sbdf[idx].sbdf.sbdf =3D=3D sbdf.sbdf )
>                      AMD_IOMMU_WARN("IVHD: duplicate IO-APIC %#x entries\=
n",
>                                      special->handle);
>                  else
> @@ -827,8 +824,7 @@ static u16 __init parse_ivhd_device_special(
>                  }
>=20
>                  /* set device id of ioapic */
> -                ioapic_sbdf[idx].bdf =3D bdf;
> -                ioapic_sbdf[idx].seg =3D seg;
> +                ioapic_sbdf[idx].sbdf =3D sbdf;
>                  ioapic_sbdf[idx].id =3D special->handle;
>=20
>                  ioapic_sbdf[idx].pin_2_idx =3D xmalloc_array(
> @@ -862,13 +858,12 @@ static u16 __init parse_ivhd_device_special(
>              AMD_IOMMU_DEBUG("IVHD: Command line override present for HPE=
T %#x "
>                              "(IVRS: %#x devID %pp)\n",
>                              hpet_sbdf.id, special->handle,
> -                            &PCI_SBDF(seg, bdf));
> +                            &sbdf);
>              break;
>          case HPET_NONE:
>              /* set device id of hpet */
>              hpet_sbdf.id =3D special->handle;
> -            hpet_sbdf.bdf =3D bdf;
> -            hpet_sbdf.seg =3D seg;
> +            hpet_sbdf.sbdf =3D sbdf;
>              hpet_sbdf.init =3D HPET_IVHD;
>              break;
>          default:
> @@ -1139,9 +1134,8 @@ static int __init cf_check parse_ivrs_table(struct =
acpi_table_header *table)
>                  return -ENXIO;
>          }
>=20
> -        if ( !ioapic_sbdf[idx].seg &&
> -             /* SB IO-APIC is always on this device in AMD systems. */
> -             ioapic_sbdf[idx].bdf =3D=3D PCI_BDF(0, 0x14, 0) )
> +        /* SB IO-APIC is always on this device in AMD systems. */
> +        if ( ioapic_sbdf[idx].sbdf.sbdf =3D=3D PCI_SBDF(0, 0, 0x14, 0).s=
bdf )
>              sb_ioapic =3D 1;
>=20
>          if ( ioapic_sbdf[idx].pin_2_idx )
> diff --git a/xen/drivers/passthrough/amd/iommu_intr.c b/xen/drivers/passt=
hrough/amd/iommu_intr.c
> index 25bf25904e..7dae89bcc0 100644
> --- a/xen/drivers/passthrough/amd/iommu_intr.c
> +++ b/xen/drivers/passthrough/amd/iommu_intr.c
> @@ -323,7 +323,8 @@ void cf_check amd_iommu_ioapic_update_ire(
>      unsigned int apic, unsigned int pin, uint64_t rte)
>  {
>      struct IO_APIC_route_entry new_rte;
> -    int seg, bdf, rc;
> +    pci_sbdf_t sbdf;
> +    int rc;
>      struct amd_iommu *iommu;
>      unsigned int idx;
>=20
> @@ -335,20 +336,19 @@ void cf_check amd_iommu_ioapic_update_ire(
>      new_rte.raw =3D rte;
>=20
>      /* get device id of ioapic devices */
> -    bdf =3D ioapic_sbdf[idx].bdf;
> -    seg =3D ioapic_sbdf[idx].seg;
> -    iommu =3D find_iommu_for_device(PCI_SBDF(seg, bdf));
> +    sbdf =3D ioapic_sbdf[idx].sbdf;
> +    iommu =3D find_iommu_for_device(sbdf);
>      if ( !iommu )
>      {
>          AMD_IOMMU_WARN("failed to find IOMMU for IO-APIC @ %04x:%04x\n",

                                                                ^^
Use %pp ?

> -                       seg, bdf);
> +                       sbdf.seg, sbdf.bdf);
>          __ioapic_write_entry(apic, pin, true, new_rte);
>          return;
>      }
>=20
>      /* Update interrupt remapping entry */
>      rc =3D update_intremap_entry_from_ioapic(
> -             bdf, iommu, &new_rte,
> +             sbdf.bdf, iommu, &new_rte,
>               &ioapic_sbdf[idx].pin_2_idx[pin]);
>=20
>      if ( rc )
> @@ -369,7 +369,8 @@ unsigned int cf_check amd_iommu_read_ioapic_from_ire(
>      unsigned int offset;
>      unsigned int val =3D __io_apic_read(apic, reg);
>      unsigned int pin =3D (reg - 0x10) / 2;
> -    uint16_t seg, bdf, req_id;
> +    pci_sbdf_t sbdf;
> +    uint16_t req_id;
>      const struct amd_iommu *iommu;
>      union irte_ptr entry;
>=20
> @@ -381,12 +382,11 @@ unsigned int cf_check amd_iommu_read_ioapic_from_ir=
e(
>      if ( offset >=3D INTREMAP_MAX_ENTRIES )
>          return val;
>=20
> -    seg =3D ioapic_sbdf[idx].seg;
> -    bdf =3D ioapic_sbdf[idx].bdf;
> -    iommu =3D find_iommu_for_device(PCI_SBDF(seg, bdf));
> +    sbdf =3D ioapic_sbdf[idx].sbdf;
> +    iommu =3D find_iommu_for_device(sbdf);
>      if ( !iommu )
>          return val;
> -    req_id =3D get_intremap_requestor_id(seg, bdf);
> +    req_id =3D get_intremap_requestor_id(sbdf.seg, sbdf.bdf);
>      entry =3D get_intremap_entry(iommu, req_id, offset);
>=20
>      if ( !(reg & 1) )
> @@ -515,15 +515,15 @@ int cf_check amd_iommu_msi_msg_update_ire(
>      struct msi_desc *msi_desc, struct msi_msg *msg)
>  {
>      struct pci_dev *pdev =3D msi_desc->dev;
> -    int bdf, seg, rc;
> +    pci_sbdf_t sbdf;
> +    int rc;
>      struct amd_iommu *iommu;
>      unsigned int i, nr =3D 1;
>      u32 data;
>=20
> -    bdf =3D pdev ? pdev->sbdf.bdf : hpet_sbdf.bdf;
> -    seg =3D pdev ? pdev->seg : hpet_sbdf.seg;
> +    sbdf =3D pdev ? pdev->sbdf : hpet_sbdf.sbdf;

I think it is worth moving initialization a bit up:

       pci_sbdf_t sbdf =3D pdev ? pdev->sbdf : hpet_sbdf.sbdf;

>=20
> -    iommu =3D _find_iommu_for_device(PCI_SBDF(seg, bdf));
> +    iommu =3D _find_iommu_for_device(sbdf);
>      if ( IS_ERR_OR_NULL(iommu) )
>          return PTR_ERR(iommu);
>=20
> @@ -532,7 +532,7 @@ int cf_check amd_iommu_msi_msg_update_ire(
>=20
>      if ( msi_desc->remap_index >=3D 0 && !msg )
>      {
> -        update_intremap_entry_from_msi_msg(iommu, bdf, nr,
> +        update_intremap_entry_from_msi_msg(iommu, sbdf.bdf, nr,
>                                             &msi_desc->remap_index,
>                                             NULL, NULL);
>=20
> @@ -543,7 +543,7 @@ int cf_check amd_iommu_msi_msg_update_ire(
>      if ( !msg )
>          return 0;
>=20
> -    rc =3D update_intremap_entry_from_msi_msg(iommu, bdf, nr,
> +    rc =3D update_intremap_entry_from_msi_msg(iommu, sbdf.bdf, nr,
>                                              &msi_desc->remap_index,
>                                              msg, &data);
>      if ( rc >=3D 0 )
> @@ -660,8 +660,7 @@ bool __init cf_check iov_supports_xt(void)
>          if ( idx =3D=3D MAX_IO_APICS )
>              return false;
>=20
> -        if ( !find_iommu_for_device(PCI_SBDF(ioapic_sbdf[idx].seg,
> -                                             ioapic_sbdf[idx].bdf)) )
> +        if ( !find_iommu_for_device(ioapic_sbdf[idx].sbdf) )
>          {
>              AMD_IOMMU_WARN("no IOMMU for IO-APIC %#x (ID %x)\n",
>                             apic, IO_APIC_ID(apic));
> @@ -690,14 +689,14 @@ int __init cf_check amd_setup_hpet_msi(struct msi_d=
esc *msi_desc)
>          return -ENODEV;
>      }
>=20
> -    iommu =3D find_iommu_for_device(PCI_SBDF(hpet_sbdf.seg, hpet_sbdf.bd=
f));
> +    iommu =3D find_iommu_for_device(hpet_sbdf.sbdf);
>      if ( !iommu )
>          return -ENXIO;
>=20
> -    lock =3D get_intremap_lock(hpet_sbdf.seg, hpet_sbdf.bdf);
> +    lock =3D get_intremap_lock(hpet_sbdf.sbdf.seg, hpet_sbdf.sbdf.bdf);
>      spin_lock_irqsave(lock, flags);
>=20
> -    msi_desc->remap_index =3D alloc_intremap_entry(iommu, hpet_sbdf.bdf,=
 1);
> +    msi_desc->remap_index =3D alloc_intremap_entry(iommu, hpet_sbdf.sbdf=
.bdf, 1);
>      if ( msi_desc->remap_index >=3D INTREMAP_MAX_ENTRIES )
>      {
>          msi_desc->remap_index =3D -1;
> --
> 2.49.0
>=20
>=20


