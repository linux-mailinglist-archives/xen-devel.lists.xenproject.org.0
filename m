Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5400A895A4
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 09:51:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.952205.1347728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4b42-000425-3o; Tue, 15 Apr 2025 07:50:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 952205.1347728; Tue, 15 Apr 2025 07:50:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4b42-0003zZ-0L; Tue, 15 Apr 2025 07:50:38 +0000
Received: by outflank-mailman (input) for mailman id 952205;
 Tue, 15 Apr 2025 07:50:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xs7D=XB=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u4b40-0003zT-Vl
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 07:50:37 +0000
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch
 [79.135.106.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4feecb46-19ce-11f0-9ffb-bf95429c2676;
 Tue, 15 Apr 2025 09:50:34 +0200 (CEST)
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
X-Inumbo-ID: 4feecb46-19ce-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1744703433; x=1744962633;
	bh=0uA0gSuZ8ehKVnuRHD7qwXsnzRgMhsN53ojlh5hil8U=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=cnam2zPPeVeU7ictPVFRvLS1jcml2E/tZ9ZPZavpNtS4vt1YROkScwf8Qbx0a/7pQ
	 D66Shy6JRHxMJMvO01VIE2klExkKzTxogXPVLkG+B5qti+iNsV8Wx/e10iwJuhD/yR
	 z4SHcTJPt9ksbemu973ucWXySysLl87/18cuLBh6imuKRnZVMpofwqRg6s7QfrDupB
	 6ubnZoUHdvIGWK39ZFE93kEHH6mkix927Vu+7T4CkIA6wwOinG4FPJcNMStI9lJUiD
	 2hyMehOP2CW7Qd6VpqZ0OZgCBFMJSHJlZI1RZ+vsMbZnPQloiZRYu+gtsqb6hTCGjq
	 R66ZzVApJ0Fkg==
Date: Tue, 15 Apr 2025 07:50:28 +0000
To: Andrii Sultanov <sultanovandriy@gmail.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 2/3] drivers: Change find_iommu_for_device function to take pci_sbdf_t, simplify code
Message-ID: <Z/4PweTE6AoZOccf@starscream>
In-Reply-To: <34125ae23ff54f55637f25afb7972374c87172cd.1744657012.git.andriy.sultanov@vates.tech>
References: <cover.1744657012.git.andriy.sultanov@vates.tech> <34125ae23ff54f55637f25afb7972374c87172cd.1744657012.git.andriy.sultanov@vates.tech>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: ab18dae08dfa34f3da365ce1da5e4dea9f01eadf
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 08:19:17PM +0100, Andrii Sultanov wrote:
> From: Andrii Sultanov <sultanovandriy@gmail.com>
>=20
> Following a similar change to amd_iommu struct, change the
> find_iommu_for_device function to take pci_sbdf_t as a single parameter.
> This removes conversions in the majority of cases.
>=20
> Bloat-o-meter reports (on top of the first patch in the series):
> add/remove: 0/0 grow/shrink: 12/11 up/down: 95/-95 (0)
> Function                                     old     new   delta
> amd_iommu_get_supported_ivhd_type             54      86     +32
> parse_ivrs_table                            3955    3966     +11
> amd_iommu_assign_device                      271     282     +11
> __mon_lengths                               2928    2936      +8
> update_intremap_entry_from_msi_msg           859     864      +5
> iov_supports_xt                              270     275      +5
> amd_setup_hpet_msi                           232     237      +5
> amd_iommu_domain_destroy                      46      51      +5
> _hvm_dpci_msi_eoi                            155     160      +5
> find_iommu_for_device                        242     246      +4
> amd_iommu_ioapic_update_ire                  572     575      +3
> allocate_domain_resources                     82      83      +1
> amd_iommu_read_ioapic_from_ire               347     344      -3
> reassign_device                              843     838      -5
> amd_iommu_remove_device                      352     347      -5
> amd_iommu_get_reserved_device_memory         521     516      -5
> amd_iommu_flush_iotlb                        359     354      -5
> amd_iommu_add_device                         844     839      -5
> amd_iommu_setup_domain_device               1478    1472      -6
> build_info                                   752     744      -8
> amd_iommu_detect_one_acpi                    886     876     -10
> register_range_for_device                    297     281     -16
> parse_ivmd_block                            1339    1312     -27
>=20
> Signed-off-by: Andrii Sultanov <sultanovandriy@gmail.com>
>=20
> Acked-by: Jan Beulich <jbeulich@suse.com>

Looks good to me:

Reviewed-by: Denis Mukhin <dmukhin@ford.com>
>=20
> ---
> Changes in V4:
> * After amendments to the previous commit which increased improvements
>   there, this commit now does not improve code size anymore (but still
>   simplifies code), so I've updated the bloat-o-meter report.
>=20
> Changes in V3:
> * Amended commit message
> * As the previous patch dropped the aliasing of seg and bdf, renamed user=
s of
>   amd_iommu as appropriate.
>=20
> Changes in V2:
> * Split single commit into several patches
> * Dropped brackets around &(iommu->sbdf) and &(sbdf)
> * Dropped most of the hunk in _invalidate_all_devices - it was
>   bloat-equivalent to the existing code - just convert with PCI_SBDF
>   instead
> * Dropped the hunk in get_intremap_requestor_id (iommu_intr.c) and
>   amd_iommu_get_reserved_device_memory (iommu_map.c) as they were only
>   increasing the code size.
> * Kept "/* XXX */" where appropriate
> * Fixed a slip-up in register_range_for_iommu_devices where iommu->sbdf
>   replaced the usage of *different* seg and bdf.
> ---
>  xen/drivers/passthrough/amd/iommu.h         |  2 +-
>  xen/drivers/passthrough/amd/iommu_acpi.c    | 14 +++++-----
>  xen/drivers/passthrough/amd/iommu_cmd.c     |  2 +-
>  xen/drivers/passthrough/amd/iommu_init.c    |  4 +--
>  xen/drivers/passthrough/amd/iommu_intr.c    | 17 ++++++------
>  xen/drivers/passthrough/amd/iommu_map.c     |  2 +-
>  xen/drivers/passthrough/amd/pci_amd_iommu.c | 30 ++++++++++-----------
>  7 files changed, 35 insertions(+), 36 deletions(-)
>=20
> diff --git a/xen/drivers/passthrough/amd/iommu.h b/xen/drivers/passthroug=
h/amd/iommu.h
> index ba541f7943..2599800e6a 100644
> --- a/xen/drivers/passthrough/amd/iommu.h
> +++ b/xen/drivers/passthrough/amd/iommu.h
> @@ -240,7 +240,7 @@ void amd_iommu_flush_intremap(struct amd_iommu *iommu=
, uint16_t bdf);
>  void amd_iommu_flush_all_caches(struct amd_iommu *iommu);
>=20
>  /* find iommu for bdf */
> -struct amd_iommu *find_iommu_for_device(int seg, int bdf);
> +struct amd_iommu *find_iommu_for_device(pci_sbdf_t sbdf);
>=20
>  /* interrupt remapping */
>  bool cf_check iov_supports_xt(void);
> diff --git a/xen/drivers/passthrough/amd/iommu_acpi.c b/xen/drivers/passt=
hrough/amd/iommu_acpi.c
> index 025d9be40f..9e4fbee953 100644
> --- a/xen/drivers/passthrough/amd/iommu_acpi.c
> +++ b/xen/drivers/passthrough/amd/iommu_acpi.c
> @@ -239,17 +239,17 @@ static int __init register_range_for_device(
>      unsigned int bdf, paddr_t base, paddr_t limit,
>      bool iw, bool ir, bool exclusion)
>  {
> -    int seg =3D 0; /* XXX */
> -    struct ivrs_mappings *ivrs_mappings =3D get_ivrs_mappings(seg);
> +    pci_sbdf_t sbdf =3D { .seg =3D 0 /* XXX */, .bdf =3D bdf };
> +    struct ivrs_mappings *ivrs_mappings =3D get_ivrs_mappings(sbdf.seg);
>      struct amd_iommu *iommu;
>      u16 req;
>      int rc =3D 0;
>=20
> -    iommu =3D find_iommu_for_device(seg, bdf);
> +    iommu =3D find_iommu_for_device(sbdf);
>      if ( !iommu )
>      {
>          AMD_IOMMU_WARN("IVMD: no IOMMU for device %pp - ignoring constra=
in\n",
> -                       &PCI_SBDF(seg, bdf));
> +                       &sbdf);
>          return 0;
>      }
>      req =3D ivrs_mappings[bdf].dte_requestor_id;
> @@ -263,9 +263,9 @@ static int __init register_range_for_device(
>          paddr_t length =3D limit + PAGE_SIZE - base;
>=20
>          /* reserve unity-mapped page entries for device */
> -        rc =3D reserve_unity_map_for_device(seg, bdf, base, length, iw, =
ir,
> +        rc =3D reserve_unity_map_for_device(sbdf.seg, bdf, base, length,=
 iw, ir,
>                                            false) ?:
> -             reserve_unity_map_for_device(seg, req, base, length, iw, ir=
,
> +             reserve_unity_map_for_device(sbdf.seg, req, base, length, i=
w, ir,
>                                            false);
>      }
>      else
> @@ -297,7 +297,7 @@ static int __init register_range_for_iommu_devices(
>      /* reserve unity-mapped page entries for devices */
>      for ( bdf =3D rc =3D 0; !rc && bdf < ivrs_bdf_entries; bdf++ )
>      {
> -        if ( iommu !=3D find_iommu_for_device(iommu->sbdf.seg, bdf) )
> +        if ( iommu !=3D find_iommu_for_device(PCI_SBDF(iommu->sbdf.seg, =
bdf)) )
>              continue;
>=20
>          req =3D get_ivrs_mappings(iommu->sbdf.seg)[bdf].dte_requestor_id=
;
> diff --git a/xen/drivers/passthrough/amd/iommu_cmd.c b/xen/drivers/passth=
rough/amd/iommu_cmd.c
> index eefd626161..6b80c57f44 100644
> --- a/xen/drivers/passthrough/amd/iommu_cmd.c
> +++ b/xen/drivers/passthrough/amd/iommu_cmd.c
> @@ -288,7 +288,7 @@ void amd_iommu_flush_iotlb(u8 devfn, const struct pci=
_dev *pdev,
>      if ( !pci_ats_enabled(pdev->seg, pdev->bus, pdev->devfn) )
>          return;
>=20
> -    iommu =3D find_iommu_for_device(pdev->seg, pdev->sbdf.bdf);
> +    iommu =3D find_iommu_for_device(pdev->sbdf);
>=20
>      if ( !iommu )
>      {
> diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passt=
hrough/amd/iommu_init.c
> index 58d657060a..3f6d2f5db5 100644
> --- a/xen/drivers/passthrough/amd/iommu_init.c
> +++ b/xen/drivers/passthrough/amd/iommu_init.c
> @@ -1540,13 +1540,13 @@ static void invalidate_all_domain_pages(void)
>  static int cf_check _invalidate_all_devices(
>      u16 seg, struct ivrs_mappings *ivrs_mappings)
>  {
> -    unsigned int bdf;
> +    unsigned int bdf;
>      u16 req_id;
>      struct amd_iommu *iommu;
>=20
>      for ( bdf =3D 0; bdf < ivrs_bdf_entries; bdf++ )
>      {
> -        iommu =3D find_iommu_for_device(seg, bdf);
> +        iommu =3D find_iommu_for_device(PCI_SBDF(seg, bdf));
>          req_id =3D ivrs_mappings[bdf].dte_requestor_id;
>          if ( iommu )
>          {
> diff --git a/xen/drivers/passthrough/amd/iommu_intr.c b/xen/drivers/passt=
hrough/amd/iommu_intr.c
> index a7347fcbad..16075cd5a1 100644
> --- a/xen/drivers/passthrough/amd/iommu_intr.c
> +++ b/xen/drivers/passthrough/amd/iommu_intr.c
> @@ -337,7 +337,7 @@ void cf_check amd_iommu_ioapic_update_ire(
>      /* get device id of ioapic devices */
>      bdf =3D ioapic_sbdf[idx].bdf;
>      seg =3D ioapic_sbdf[idx].seg;
> -    iommu =3D find_iommu_for_device(seg, bdf);
> +    iommu =3D find_iommu_for_device(PCI_SBDF(seg, bdf));
>      if ( !iommu )
>      {
>          AMD_IOMMU_WARN("failed to find IOMMU for IO-APIC @ %04x:%04x\n",
> @@ -383,7 +383,7 @@ unsigned int cf_check amd_iommu_read_ioapic_from_ire(
>=20
>      seg =3D ioapic_sbdf[idx].seg;
>      bdf =3D ioapic_sbdf[idx].bdf;
> -    iommu =3D find_iommu_for_device(seg, bdf);
> +    iommu =3D find_iommu_for_device(PCI_SBDF(seg, bdf));
>      if ( !iommu )
>          return val;
>      req_id =3D get_intremap_requestor_id(seg, bdf);
> @@ -495,16 +495,15 @@ static int update_intremap_entry_from_msi_msg(
>      return fresh;
>  }
>=20
> -static struct amd_iommu *_find_iommu_for_device(int seg, int bdf)
> +static struct amd_iommu *_find_iommu_for_device(pci_sbdf_t sbdf)
>  {
>      struct amd_iommu *iommu;
> -    pci_sbdf_t sbdf =3D PCI_SBDF(seg, bdf);
>=20
>      for_each_amd_iommu ( iommu )
>          if ( iommu->sbdf.sbdf =3D=3D sbdf.sbdf )
>              return NULL;
>=20
> -    iommu =3D find_iommu_for_device(seg, bdf);
> +    iommu =3D find_iommu_for_device(sbdf);
>      if ( iommu )
>          return iommu;
>=20
> @@ -524,7 +523,7 @@ int cf_check amd_iommu_msi_msg_update_ire(
>      bdf =3D pdev ? pdev->sbdf.bdf : hpet_sbdf.bdf;
>      seg =3D pdev ? pdev->seg : hpet_sbdf.seg;
>=20
> -    iommu =3D _find_iommu_for_device(seg, bdf);
> +    iommu =3D _find_iommu_for_device(PCI_SBDF(seg, bdf));
>      if ( IS_ERR_OR_NULL(iommu) )
>          return PTR_ERR(iommu);
>=20
> @@ -661,8 +660,8 @@ bool __init cf_check iov_supports_xt(void)
>          if ( idx =3D=3D MAX_IO_APICS )
>              return false;
>=20
> -        if ( !find_iommu_for_device(ioapic_sbdf[idx].seg,
> -                                    ioapic_sbdf[idx].bdf) )
> +        if ( !find_iommu_for_device(PCI_SBDF(ioapic_sbdf[idx].seg,
> +                                             ioapic_sbdf[idx].bdf)) )
>          {
>              AMD_IOMMU_WARN("no IOMMU for IO-APIC %#x (ID %x)\n",
>                             apic, IO_APIC_ID(apic));
> @@ -691,7 +690,7 @@ int __init cf_check amd_setup_hpet_msi(struct msi_des=
c *msi_desc)
>          return -ENODEV;
>      }
>=20
> -    iommu =3D find_iommu_for_device(hpet_sbdf.seg, hpet_sbdf.bdf);
> +    iommu =3D find_iommu_for_device(PCI_SBDF(hpet_sbdf.seg, hpet_sbdf.bd=
f));
>      if ( !iommu )
>          return -ENXIO;
>=20
> diff --git a/xen/drivers/passthrough/amd/iommu_map.c b/xen/drivers/passth=
rough/amd/iommu_map.c
> index d28c475650..320a2dc64c 100644
> --- a/xen/drivers/passthrough/amd/iommu_map.c
> +++ b/xen/drivers/passthrough/amd/iommu_map.c
> @@ -717,7 +717,7 @@ int cf_check amd_iommu_get_reserved_device_memory(
>              pcidevs_unlock();
>=20
>              if ( pdev )
> -                iommu =3D find_iommu_for_device(seg, bdf);
> +                iommu =3D find_iommu_for_device(sbdf);
>              if ( !iommu )
>                  continue;
>          }
> diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/pa=
ssthrough/amd/pci_amd_iommu.c
> index 6b58e3380b..3a14770855 100644
> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> @@ -32,35 +32,35 @@ static bool __read_mostly init_done;
>=20
>  static const struct iommu_init_ops _iommu_init_ops;
>=20
> -struct amd_iommu *find_iommu_for_device(int seg, int bdf)
> +struct amd_iommu *find_iommu_for_device(pci_sbdf_t sbdf)
>  {
> -    struct ivrs_mappings *ivrs_mappings =3D get_ivrs_mappings(seg);
> +    struct ivrs_mappings *ivrs_mappings =3D get_ivrs_mappings(sbdf.seg);
>=20
> -    if ( !ivrs_mappings || bdf >=3D ivrs_bdf_entries )
> +    if ( !ivrs_mappings || sbdf.bdf >=3D ivrs_bdf_entries )
>          return NULL;
>=20
> -    if ( unlikely(!ivrs_mappings[bdf].iommu) && likely(init_done) )
> +    if ( unlikely(!ivrs_mappings[sbdf.bdf].iommu) && likely(init_done) )
>      {
> -        unsigned int bd0 =3D bdf & ~PCI_FUNC(~0);
> +        unsigned int bd0 =3D sbdf.bdf & ~PCI_FUNC(~0);
>=20
> -        if ( ivrs_mappings[bd0].iommu && ivrs_mappings[bd0].iommu->sbdf.=
bdf !=3D bdf )
> +        if ( ivrs_mappings[bd0].iommu && ivrs_mappings[bd0].iommu->sbdf.=
bdf !=3D sbdf.bdf )
>          {
>              struct ivrs_mappings tmp =3D ivrs_mappings[bd0];
>=20
>              tmp.iommu =3D NULL;
>              if ( tmp.dte_requestor_id =3D=3D bd0 )
> -                tmp.dte_requestor_id =3D bdf;
> -            ivrs_mappings[bdf] =3D tmp;
> +                tmp.dte_requestor_id =3D sbdf.bdf;
> +            ivrs_mappings[sbdf.bdf] =3D tmp;
>=20
>              printk(XENLOG_WARNING "%pp not found in ACPI tables;"
> -                   " using same IOMMU as function 0\n", &PCI_SBDF(seg, b=
df));
> +                   " using same IOMMU as function 0\n", &sbdf);
>=20
>              /* write iommu field last */
> -            ivrs_mappings[bdf].iommu =3D ivrs_mappings[bd0].iommu;
> +            ivrs_mappings[sbdf.bdf].iommu =3D ivrs_mappings[bd0].iommu;
>          }
>      }
>=20
> -    return ivrs_mappings[bdf].iommu;
> +    return ivrs_mappings[sbdf.bdf].iommu;
>  }
>=20
>  /*
> @@ -107,7 +107,7 @@ static bool any_pdev_behind_iommu(const struct domain=
 *d,
>          if ( pdev =3D=3D exclude )
>              continue;
>=20
> -        if ( find_iommu_for_device(pdev->seg, pdev->sbdf.bdf) =3D=3D iom=
mu )
> +        if ( find_iommu_for_device(pdev->sbdf) =3D=3D iommu )
>              return true;
>      }
>=20
> @@ -468,7 +468,7 @@ static int cf_check reassign_device(
>      struct amd_iommu *iommu;
>      int rc;
>=20
> -    iommu =3D find_iommu_for_device(pdev->seg, pdev->sbdf.bdf);
> +    iommu =3D find_iommu_for_device(pdev->sbdf);
>      if ( !iommu )
>      {
>          AMD_IOMMU_WARN("failed to find IOMMU: %pp cannot be assigned to =
%pd\n",
> @@ -581,7 +581,7 @@ static int cf_check amd_iommu_add_device(u8 devfn, st=
ruct pci_dev *pdev)
>          if ( pdev->sbdf.sbdf =3D=3D iommu->sbdf.sbdf )
>              return is_hardware_domain(pdev->domain) ? 0 : -ENODEV;
>=20
> -    iommu =3D find_iommu_for_device(pdev->seg, pdev->sbdf.bdf);
> +    iommu =3D find_iommu_for_device(pdev->sbdf);
>      if ( unlikely(!iommu) )
>      {
>          /* Filter bridge devices. */
> @@ -666,7 +666,7 @@ static int cf_check amd_iommu_remove_device(u8 devfn,=
 struct pci_dev *pdev)
>      if ( !pdev->domain )
>          return -EINVAL;
>=20
> -    iommu =3D find_iommu_for_device(pdev->seg, pdev->sbdf.bdf);
> +    iommu =3D find_iommu_for_device(pdev->sbdf);
>      if ( !iommu )
>      {
>          AMD_IOMMU_WARN("failed to find IOMMU: %pp cannot be removed from=
 %pd\n",
> --
> 2.49.0
>=20
>=20


