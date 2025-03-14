Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 844F9A60AC3
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 09:08:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.913898.1319751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt05C-0007Cq-Pt; Fri, 14 Mar 2025 08:07:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 913898.1319751; Fri, 14 Mar 2025 08:07:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt05C-0007Aj-NH; Fri, 14 Mar 2025 08:07:54 +0000
Received: by outflank-mailman (input) for mailman id 913898;
 Fri, 14 Mar 2025 08:07:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RvUE=WB=gmail.com=sultanovandriy@srs-se1.protection.inumbo.net>)
 id 1tt05A-0007Ab-Vd
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 08:07:53 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b3f7fb2-00ab-11f0-9898-31a8f345e629;
 Fri, 14 Mar 2025 09:07:48 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-30761be8fcfso20024241fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 01:07:50 -0700 (PDT)
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
X-Inumbo-ID: 6b3f7fb2-00ab-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741939670; x=1742544470; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nxB2jQ0iobqW9o2GQiAA6p4u5EblEGkxSjLg68A8DtA=;
        b=BejE+cK2scLbut3UMshAe0U9DD8kpW4mZ7anDqjHz4z7lcrqHd0eNPYQflOX/OKHFD
         H9rmUaj2sZ0e+hymPonbgewGRnASMU50Gj2p2o4NjG4J63J5Uw+ivGl4m3gjEwuxn6p3
         sdHKoDtUXaO/y/Sr+e/FhmfVbxCIIeqv/YDrLYWIqZclBYU0qPrzZyOvCZjWJXRGjedu
         /Oy3LQb8B3AMA/0TXwqn1JaFNjVlteO5xRO/ZzaDsVrDYKg75ZCB8+tOf4ge1DPL4jLe
         M2JDOrf4hPa0FEhJg0RWkssepvYYtW2dlNOjiP4Rhy7irDAt10lQ16cnTlxYU8hQHVo+
         6ZBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741939670; x=1742544470;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nxB2jQ0iobqW9o2GQiAA6p4u5EblEGkxSjLg68A8DtA=;
        b=fUaMcVx9Uu+32R7fonA2ZsZehVReSdFyTsx8htJ5Wags2GhNdY689g00CmUOKzy91/
         CnXk8Cq1OvUNqi6dqXeVttp6sIrkRNqVuAJvlMlNfK+8eZvNae2NUkw3P2ipst/FJqeG
         NrBEM0Z3bhtngS5vZBCs6vgRICLu1zqlAYMx/G3SYTLJbpDzraj+E6B+V1maNRx9J1hz
         H1yzPfVJaEbBgIHRX86odxLHniINaNQt83CHlDoxyzqSSkAQDUXhRMGnvZ36uSjm0FxG
         br5LmzBuX26/4bhMUe21QViyUo548pfiY9vLXpx/mc3bq05GRKI1v3nvdiUXPv7UH4w0
         O2nQ==
X-Gm-Message-State: AOJu0Yyt8VLLpbBg5DqkoXjYWtFjbLX+F5LuvDsMC5oIltUEOJGPEMPg
	f2UVCQgz0zpKusb1NefEMfdcMWaAsLiGtbopTl8sGxbiNTAkqWkWCB2ktWiQF+IntO5ATmXo9q8
	Z4wv/qQjVMSNonMZl1CS8qAtwIh/1et8fZwo=
X-Gm-Gg: ASbGncv/z2ys389NJEcbygbvCxSh+mt2zT4JALbPkuMTYaM02Gcpu6dR342Al5zKRGP
	JQKy3QJxHM9br7de0P79f/m1ruTFHWgD4uS3RigD4ciUjkBMlrVYZACrn5hq2SLVjbXK5jw72J4
	Us0zL4IMjgCSHWxUNqK3QWW6ti
X-Google-Smtp-Source: AGHT+IHwTrWfIRL4WXwCA8C24QiGJojOi5IAhOclf4XH1TjENNqXMcKSm46Eu9ZNFdpb2yPnoC36pR3fILD4jb0tZDI=
X-Received: by 2002:a05:6512:3ba4:b0:544:ca1:da41 with SMTP id
 2adb3069b0e04-549c39897ddmr530824e87.44.1741939669617; Fri, 14 Mar 2025
 01:07:49 -0700 (PDT)
MIME-Version: 1.0
References: <7e5a37e51303ba17dab8e6a92830257f670f3355.1741891599.git.sultanovandriy@gmail.com>
 <f308cbf6-0d2d-4843-982a-a59ea70c7ad1@amd.com>
In-Reply-To: <f308cbf6-0d2d-4843-982a-a59ea70c7ad1@amd.com>
From: Andriy Sultanov <sultanovandriy@gmail.com>
Date: Fri, 14 Mar 2025 08:07:38 +0000
X-Gm-Features: AQ5f1Jp8G4p9uwx3B_UE3eEJUhRhWpvfL-3G2DS0NpUU8voJl2jM4L-DCg0uXUI
Message-ID: <CAHPYgaXc8X5tBYN6BL2w2PVSNLwaTPP=zWhATBbjYRN-2dmE-g@mail.gmail.com>
Subject: Re: [PATCH v1] drivers: Change amd_iommu struct to contain
 pci_sbdf_t, simplify code
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 13 Mar 2025 at 19:59, Jason Andryuk <jason.andryuk@amd.com> wrote:
>
> On 2025-03-13 14:57, Andrii Sultanov wrote:
> > Following on from 250d87dc, struct amd_iommu has its seg and bdf fields
> > backwards with relation to pci_sbdf_t. Swap them around, and simplify the
> > expressions regenerating an sbdf_t from seg+bdf.
> >
> > Simplify ioapic_sbdf and bpet_sbdf along the way. Adjust functions
> > taking seg and bdf fields of these structs to take pci_sbdf_t instead.
> > Simplify comparisons similarly.
>
> It's rather large.  Can this be sensibly split into smaller patches?

Will do.

> > diff --git a/xen/drivers/passthrough/amd/iommu.h b/xen/drivers/passthrough/amd/iommu.h
> > index 00e81b4b2a..6903b1bc5d 100644
> > --- a/xen/drivers/passthrough/amd/iommu.h
> > +++ b/xen/drivers/passthrough/amd/iommu.h
> > @@ -77,8 +77,14 @@ struct amd_iommu {
> >       struct list_head list;
> >       spinlock_t lock; /* protect iommu */
> >
> > -    u16 seg;
> > -    u16 bdf;
> > +    union {
> > +        struct {
> > +            uint16_t bdf;
> > +            uint16_t seg;
>
> Are these still needed by the end of this patch?

Yes - otherwise the patch would be larger as bdf and seg would be one
namespace deeper - /iommu->seg/iommu->sbdf.seg/

> > +        };
> > +        pci_sbdf_t sbdf;
> > +    };
> > +
> >       struct msi_desc msi;
> >
> >       u16 cap_offset;
>
> > diff --git a/xen/drivers/passthrough/amd/iommu_acpi.c b/xen/drivers/passthrough/amd/iommu_acpi.c
> > index 5bdbfb5ba8..57efb7ddda 100644
> > --- a/xen/drivers/passthrough/amd/iommu_acpi.c
> > +++ b/xen/drivers/passthrough/amd/iommu_acpi.c
> > @@ -107,12 +107,12 @@ static void __init add_ivrs_mapping_entry(
>
> > @@ -239,17 +239,17 @@ static int __init register_range_for_device(
> >       unsigned int bdf, paddr_t base, paddr_t limit,
> >       bool iw, bool ir, bool exclusion)
> >   {
> > -    int seg = 0; /* XXX */
> > -    struct ivrs_mappings *ivrs_mappings = get_ivrs_mappings(seg);
> > +    pci_sbdf_t sbdf = { .seg = 0, .bdf = bdf };
>
> Maybe retain the /* XXX */ to highlight that segment is hardcoded to 0.

Will do

> > +    struct ivrs_mappings *ivrs_mappings = get_ivrs_mappings(sbdf.seg);
> >       struct amd_iommu *iommu;
> >       u16 req;
> >       int rc = 0;
> >
> > -    iommu = find_iommu_for_device(seg, bdf);
> > +    iommu = find_iommu_for_device(sbdf);
> >       if ( !iommu )
> >       {
> >           AMD_IOMMU_WARN("IVMD: no IOMMU for device %pp - ignoring constrain\n",
> > -                       &PCI_SBDF(seg, bdf));
> > +                       &(sbdf));
>
> Please drop () for just &sbdf.

Will do here and below.

> >           return 0;
> >       }
> >       req = ivrs_mappings[bdf].dte_requestor_id;
> > @@ -263,9 +263,9 @@ static int __init register_range_for_device(
> >           paddr_t length = limit + PAGE_SIZE - base;
> >
> >           /* reserve unity-mapped page entries for device */
> > -        rc = reserve_unity_map_for_device(seg, bdf, base, length, iw, ir,
> > +        rc = reserve_unity_map_for_device(sbdf.seg, bdf, base, length, iw, ir,
>
> Another candidate for conversion?

This function is always used with seg and bdf coming from two different places,
and it doesn't convert them to pci_sbdf_t internally, so this is
unnecessary and would
only increase code size.*

* This particular example would be neutral:
add/remove: 0/0 grow/shrink: 3/3 up/down: 51/-51 (0)
Function                                     old     new   delta
parse_ivmd_block                            1271    1296     +25
register_range_for_device                    281     299     +18
__mon_lengths                               2928    2936      +8
build_info                                   752     744      -8
parse_ivrs_table                            3966    3953     -13
reserve_unity_map_for_device                 453     423     -30

But would still increase the diff.

> >                                             false) ?:
> > -             reserve_unity_map_for_device(seg, req, base, length, iw, ir,
> > +             reserve_unity_map_for_device(sbdf.seg, req, base, length, iw, ir,
> >                                             false);
> >       }
> >       else
>
> > @@ -916,8 +916,8 @@ static int __init parse_ivhd_block(const struct acpi_ivrs_hardware *ivhd_block)
> >                       ivhd_block->pci_segment_group, ivhd_block->info,
> >                       ivhd_block->iommu_attr);
> >
> > -    iommu = find_iommu_from_bdf_cap(ivhd_block->pci_segment_group,
> > -                                    ivhd_block->header.device_id,
> > +    iommu = find_iommu_from_bdf_cap(PCI_SBDF(ivhd_block->pci_segment_group,
> > +                                    ivhd_block->header.device_id),
>
> Please indent to match the end of "PCI_SBDF(".

Will do.

> >                                       ivhd_block->capability_offset);
> >       if ( !iommu )
> >       {
> > diff --git a/xen/drivers/passthrough/amd/iommu_cmd.c b/xen/drivers/passthrough/amd/iommu_cmd.c
> > index 83c525b84f..dc3d2394a1 100644
> > --- a/xen/drivers/passthrough/amd/iommu_cmd.c
> > +++ b/xen/drivers/passthrough/amd/iommu_cmd.c
> > @@ -85,7 +85,7 @@ static void flush_command_buffer(struct amd_iommu *iommu,
> >               threshold |= threshold << 1;
> >               printk(XENLOG_WARNING
> >                      "AMD IOMMU %pp: %scompletion wait taking too long\n",
> > -                   &PCI_SBDF(iommu->seg, iommu->bdf),
> > +                   &(iommu->sbdf),
>
> Please drop ().
>
> >                      timeout_base ? "iotlb " : "");
> >               timeout = 0;
> >           }
> > @@ -95,7 +95,7 @@ static void flush_command_buffer(struct amd_iommu *iommu,
> >       if ( !timeout )
> >           printk(XENLOG_WARNING
> >                  "AMD IOMMU %pp: %scompletion wait took %lums\n",
> > -               &PCI_SBDF(iommu->seg, iommu->bdf),
> > +               &(iommu->sbdf),
>
> Please drop ().
>
> >                  timeout_base ? "iotlb " : "",
> >                  (NOW() - start) / 10000000);
> >   }
>
> > diff --git a/xen/drivers/passthrough/amd/iommu_detect.c b/xen/drivers/passthrough/amd/iommu_detect.c
> > index cede44e651..7d60389500 100644
> > --- a/xen/drivers/passthrough/amd/iommu_detect.c
> > +++ b/xen/drivers/passthrough/amd/iommu_detect.c
> > @@ -231,7 +231,7 @@ int __init amd_iommu_detect_one_acpi(
> >       rt = pci_ro_device(iommu->seg, bus, PCI_DEVFN(dev, func));
> >       if ( rt )
> >           printk(XENLOG_ERR "Could not mark config space of %pp read-only (%d)\n",
> > -               &PCI_SBDF(iommu->seg, iommu->bdf), rt);
> > +               &(iommu->sbdf), rt);
>
> Please drop ().
>
> >
> >       list_add_tail(&iommu->list, &amd_iommu_head);
> >       rt = 0;
> > diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
> > index bb25b55c85..e2c205a857 100644
> > --- a/xen/drivers/passthrough/amd/iommu_init.c
> > +++ b/xen/drivers/passthrough/amd/iommu_init.c
>
> > @@ -752,12 +750,11 @@ static bool __init set_iommu_interrupt_handler(struct amd_iommu *iommu)
> >       }
> >
> >       pcidevs_lock();
> > -    iommu->msi.dev = pci_get_pdev(NULL, PCI_SBDF(iommu->seg, iommu->bdf));
> > +    iommu->msi.dev = pci_get_pdev(NULL, iommu->sbdf);
> >       pcidevs_unlock();
> >       if ( !iommu->msi.dev )
> >       {
> > -        AMD_IOMMU_WARN("no pdev for %pp\n",
> > -                       &PCI_SBDF(iommu->seg, iommu->bdf));
> > +        AMD_IOMMU_WARN("no pdev for %pp\n", &(iommu->sbdf));
>
> Please drop ().
>
> >           return 0;
> >       }
> >
>
>
> > @@ -1543,14 +1540,14 @@ static void invalidate_all_domain_pages(void)
> >   static int cf_check _invalidate_all_devices(
> >       u16 seg, struct ivrs_mappings *ivrs_mappings)
> >   {
> > -    unsigned int bdf;
> > +    pci_sbdf_t sbdf = { .seg = seg, .bdf = 0 };
>
> .bdf = 0 isn't necessary as it will be set to 0 by default.
> >       u16 req_id;
> >       struct amd_iommu *iommu;
> >
> > -    for ( bdf = 0; bdf < ivrs_bdf_entries; bdf++ )
> > +    for ( /* sbdf.bdf = 0 */ ; sbdf.bdf < ivrs_bdf_entries; sbdf.bdf++ )
>
> I'd either set it or just drop the comment.

Will drop _invalidate_all_devices hunk entirely, as suggested by
Andrew in the sibling reply.

> >       {
> > -        iommu = find_iommu_for_device(seg, bdf);
> > -        req_id = ivrs_mappings[bdf].dte_requestor_id;
> > +        iommu = find_iommu_for_device(sbdf);
> > +        req_id = ivrs_mappings[sbdf.bdf].dte_requestor_id;
> >           if ( iommu )
> >           {
> >               /*
> > diff --git a/xen/drivers/passthrough/amd/iommu_intr.c b/xen/drivers/passthrough/amd/iommu_intr.c
> > index 9abdc38053..0c91125ec0 100644
> > --- a/xen/drivers/passthrough/amd/iommu_intr.c
> > +++ b/xen/drivers/passthrough/amd/iommu_intr.c
>
> > diff --git a/xen/drivers/passthrough/amd/iommu_map.c b/xen/drivers/passthrough/amd/iommu_map.c
> > index dde393645a..17070904fa 100644
> > --- a/xen/drivers/passthrough/amd/iommu_map.c
> > +++ b/xen/drivers/passthrough/amd/iommu_map.c
> > @@ -694,17 +694,16 @@ int amd_iommu_reserve_domain_unity_unmap(struct domain *d,
> >   int cf_check amd_iommu_get_reserved_device_memory(
> >       iommu_grdm_t *func, void *ctxt)
> >   {
> > -    unsigned int seg = 0 /* XXX */, bdf;
> > -    const struct ivrs_mappings *ivrs_mappings = get_ivrs_mappings(seg);
> > +    pci_sbdf_t sbdf = {0};
>
> Just " = {};"
>
> > +    const struct ivrs_mappings *ivrs_mappings = get_ivrs_mappings(sbdf.seg);
> >       /* At least for global entries, avoid reporting them multiple times. */
> >       enum { pending, processing, done } global = pending;
> >
> > -    for ( bdf = 0; bdf < ivrs_bdf_entries; ++bdf )
> > +    for ( /* sbdf.bdf = 0 */ ; sbdf.bdf < ivrs_bdf_entries; ++sbdf.bdf )
>
> Like earlier, change to code or remove comment.
>
> >       {
> > -        pci_sbdf_t sbdf = PCI_SBDF(seg, bdf);
> > -        const struct ivrs_unity_map *um = ivrs_mappings[bdf].unity_map;
> > -        unsigned int req = ivrs_mappings[bdf].dte_requestor_id;
> > -        const struct amd_iommu *iommu = ivrs_mappings[bdf].iommu;
> > +        const struct ivrs_unity_map *um = ivrs_mappings[sbdf.bdf].unity_map;
> > +        unsigned int req = ivrs_mappings[sbdf.bdf].dte_requestor_id;
> > +        const struct amd_iommu *iommu = ivrs_mappings[sbdf.bdf].iommu;
> >           int rc;
> >
> >           if ( !iommu )

Will drop the entire amd_iommu_get_reserved_device_memory hunk
as suggested by Andrew.

> > diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> > index d00697edb3..16bab0f948 100644
> > --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> > +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> > @@ -32,35 +32,35 @@ static bool __read_mostly init_done;
> >
> >   static const struct iommu_init_ops _iommu_init_ops;
> >
> > -struct amd_iommu *find_iommu_for_device(int seg, int bdf)
> > +struct amd_iommu *find_iommu_for_device(pci_sbdf_t sbdf)
> >   {
> > -    struct ivrs_mappings *ivrs_mappings = get_ivrs_mappings(seg);
> > +    struct ivrs_mappings *ivrs_mappings = get_ivrs_mappings(sbdf.seg);
>
> Adding:
> unsigned int bdf = sbdf.bdf
>
> here would eliminate all the sbdf.bdf use below.
>
> Thanks,
> Jason
>
> >
> > -    if ( !ivrs_mappings || bdf >= ivrs_bdf_entries )
> > +    if ( !ivrs_mappings || sbdf.bdf >= ivrs_bdf_entries )
> >           return NULL;
> >
> > -    if ( unlikely(!ivrs_mappings[bdf].iommu) && likely(init_done) )
> > +    if ( unlikely(!ivrs_mappings[sbdf.bdf].iommu) && likely(init_done) )
> >       {
> > -        unsigned int bd0 = bdf & ~PCI_FUNC(~0);
> > +        unsigned int bd0 = sbdf.bdf & ~PCI_FUNC(~0);
> >
> > -        if ( ivrs_mappings[bd0].iommu && ivrs_mappings[bd0].iommu->bdf != bdf )
> > +        if ( ivrs_mappings[bd0].iommu && ivrs_mappings[bd0].iommu->bdf != sbdf.bdf )
> >           {
> >               struct ivrs_mappings tmp = ivrs_mappings[bd0];
> >
> >               tmp.iommu = NULL;
> >               if ( tmp.dte_requestor_id == bd0 )
> > -                tmp.dte_requestor_id = bdf;
> > -            ivrs_mappings[bdf] = tmp;
> > +                tmp.dte_requestor_id = sbdf.bdf;
> > +            ivrs_mappings[sbdf.bdf] = tmp;
> >
> >               printk(XENLOG_WARNING "%pp not found in ACPI tables;"
> > -                   " using same IOMMU as function 0\n", &PCI_SBDF(seg, bdf));
> > +                   " using same IOMMU as function 0\n", &sbdf);
> >
> >               /* write iommu field last */
> > -            ivrs_mappings[bdf].iommu = ivrs_mappings[bd0].iommu;
> > +            ivrs_mappings[sbdf.bdf].iommu = ivrs_mappings[bd0].iommu;
> >           }
> >       }
> >
> > -    return ivrs_mappings[bdf].iommu;
> > +    return ivrs_mappings[sbdf.bdf].iommu;
> >   }
> >
> >   /*

Thank you!

