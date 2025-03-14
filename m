Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE80EA60ACB
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 09:08:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.913908.1319762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt05t-0007jt-6Z; Fri, 14 Mar 2025 08:08:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 913908.1319762; Fri, 14 Mar 2025 08:08:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt05t-0007hQ-3e; Fri, 14 Mar 2025 08:08:37 +0000
Received: by outflank-mailman (input) for mailman id 913908;
 Fri, 14 Mar 2025 08:08:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RvUE=WB=gmail.com=sultanovandriy@srs-se1.protection.inumbo.net>)
 id 1tt05r-0007Rs-SX
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 08:08:35 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86c8a7fe-00ab-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 09:08:35 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-30762598511so19000141fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 01:08:34 -0700 (PDT)
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
X-Inumbo-ID: 86c8a7fe-00ab-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741939714; x=1742544514; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9hOdmBxnWbTP2n+vUrJK8JjjRCHza3MzVU6kVBwBw88=;
        b=K00SCUXyo8/dHlFOjJLXpKJMs4s2X7dOwu0p0k55xkNhjJsPJtsNXM+SUN4CO3QDgE
         UltqrUJeYzIktF55+c2aEBt2dxOuIJd2rKJBeKZnkz0YdqHnxe4KPvVsbkuWEDjIaQs8
         GiJa2mxnmngbWe+RImo8AYPz7MmVvtYNAWDOqTD9g+9IqsttxkdV4WxX+N4VY9sUomhd
         zR6QQ54c6ww0LaUt51t6Myf7LUh+OzvOk9vvK3yTd2AykMh5ohgF5G3wF5xqGmKjDjdM
         OUu+0p9Vz3l81WURbZgdC/r06DLVhwbS4EHe21nGZp7Yay8a4a3xM/+6tSA6r8aknesC
         CEeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741939714; x=1742544514;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9hOdmBxnWbTP2n+vUrJK8JjjRCHza3MzVU6kVBwBw88=;
        b=LaoWzRgQMYLcwl4v6R5lDPdFy6l+Vds1AqPD+/z4oyw9/IWllZfNKCH+tP2XVxAsQN
         GO1KCdAvGGMM2tXZIkxdBHO00QoTGMJdyE1ErXLa4YuCHm8h/HD2ML9unQdIQMdyRBNb
         Kk8gxoELPuowYLvMBSTeHDXu3X8S/Ru3MiZoQ3BjSIMSWxi78wSWbgtoCfPE64S71jBA
         HfMnv68QJmT2J2k41UEKtojA/WqXmoOi0VBN914Z2iIsX+eFi5tUp6Yf93IyyUTU8YJ6
         vfshf8OcuWlbUiqLro2unvLutxLG+mqes10V2gJ32zn2kB2WS7ZQQdLNOf+lte7bPHm9
         fK1A==
X-Gm-Message-State: AOJu0Ywi8sG9HHaloMNFWwaoSjLCdvR7MbVatMUkt83T+BQON76+KHtp
	ljEMpbWM2zEVTwu0d0ZhIPgTf27Anevrg37XfqG60j66+yCNnmTTttfXjk66dDGEvDIJ93LTxC9
	F99pu9v5tRlrw36Ca5M3Ty562DDR5tsFXL/M=
X-Gm-Gg: ASbGncvPA7KerGXDxmIxcWWKYT3n5R7htj2p9lXNrZmwP9bSPQm9g19Gt9sott2NDKk
	FxvXIHRpxXutZF80Esgq5AMMLomdo/bgEwUK+Kr2at0N4f80WDFANcQN7ZAv90ZkOOTW73t2HVL
	B7iNDXaZHTDkNVM1p6PJnVTmkH
X-Google-Smtp-Source: AGHT+IE2BMWD3U3YNzWcKYsQ3RHOagvVzlnKrhlxq4bdkjCQ3qQzeixw1jWP9NW2ltCbdm08MV3v+8UA1NtuLoyrFTI=
X-Received: by 2002:a2e:bea2:0:b0:30b:9813:b00d with SMTP id
 38308e7fff4ca-30c4a8ca0e8mr5463401fa.23.1741939714071; Fri, 14 Mar 2025
 01:08:34 -0700 (PDT)
MIME-Version: 1.0
References: <7e5a37e51303ba17dab8e6a92830257f670f3355.1741891599.git.sultanovandriy@gmail.com>
 <bb0090da-c2ac-453e-972d-b06a66c51530@citrix.com>
In-Reply-To: <bb0090da-c2ac-453e-972d-b06a66c51530@citrix.com>
From: Andriy Sultanov <sultanovandriy@gmail.com>
Date: Fri, 14 Mar 2025 08:08:23 +0000
X-Gm-Features: AQ5f1Joub_4NC35hLnwjS2c_Ggto5mbHVaqcywVGMaPyzjr94ZzRH85zLT2kVn0
Message-ID: <CAHPYgaVRgHJLke8p8NBpQ-Wtv4kWVJrbjHABOgMHvCT6MSTJ6g@mail.gmail.com>
Subject: Re: [PATCH v1] drivers: Change amd_iommu struct to contain
 pci_sbdf_t, simplify code
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 13 Mar 2025 at 20:16, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> On 13/03/2025 6:57 pm, Andrii Sultanov wrote:
> > Following on from 250d87dc, struct amd_iommu has its seg and bdf fields
> > backwards with relation to pci_sbdf_t. Swap them around, and simplify the
> > expressions regenerating an sbdf_t from seg+bdf.
> >
> > Simplify ioapic_sbdf and bpet_sbdf along the way. Adjust functions
> > taking seg and bdf fields of these structs to take pci_sbdf_t instead.
> > Simplify comparisons similarly.
> >
> > Bloat-o-meter reports:
> >
> > ```
> > add/remove: 0/0 grow/shrink: 13/21 up/down: 352/-576 (-224)
> > Function                                     old     new   delta
> > _einittext                                 22028   22220    +192
> > amd_iommu_prepare                            853     897     +44
> > _invalidate_all_devices                      133     154     +21
> > amd_iommu_domain_destroy                      46      63     +17
> > disable_fmt                                12336   12352     +16
> > _acpi_module_name                            416     432     +16
> > amd_iommu_get_reserved_device_memory         521     536     +15
> > parse_ivrs_table                            3955    3966     +11
> > amd_iommu_assign_device                      271     282     +11
> > find_iommu_for_device                        242     246      +4
> > get_intremap_requestor_id                     49      52      +3
> > amd_iommu_free_intremap_table                360     361      +1
> > allocate_domain_resources                     82      83      +1
> > reassign_device                              843     838      -5
> > amd_iommu_remove_device                      352     347      -5
> > amd_iommu_flush_iotlb                        359     354      -5
> > iov_supports_xt                              270     264      -6
> > amd_iommu_setup_domain_device               1478    1472      -6
> > amd_setup_hpet_msi                           232     224      -8
> > amd_iommu_ioapic_update_ire                  572     564      -8
> > _hvm_dpci_msi_eoi                            157     149      -8
> > amd_iommu_msi_enable                          33      20     -13
> > register_range_for_device                    297     281     -16
> > amd_iommu_add_device                         856     839     -17
> > update_intremap_entry_from_msi_msg           879     861     -18
> > amd_iommu_read_ioapic_from_ire               347     323     -24
> > amd_iommu_msi_msg_update_ire                 472     431     -41
> > flush_command_buffer                         460     417     -43
> > set_iommu_interrupt_handler                  421     377     -44
> > amd_iommu_detect_one_acpi                    918     868     -50
> > amd_iommu_get_supported_ivhd_type             86      31     -55
> > iterate_ivrs_mappings                        169     113     -56
> > parse_ivmd_block                            1339    1271     -68
> > enable_iommu                                1745    1665     -80
> > ```
> >
> > Resolves: https://gitlab.com/xen-project/xen/-/issues/198
> >
> > Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Signed-off-by: Andrii Sultanov <sultanovandriy@gmail.com>
>
> Well, this is awkward.  This is the task I'd put together for Cody to
> try.  I guess I have to find another one.

My apologies! Just noticed it wasn't claimed on Gitlab, probably should
have pinged you first.

> In commit messages, we always want the subject alongside a hash.  I have
> this local alias to help:
>
> > xen.git/xen$ git commit-str 250d87dc
> > commit 250d87dc3ff9 ("x86/msi: Change __msi_set_enable() to take
> > pci_sbdf_t")
> > xen.git/xen$ git help commit-str
> > 'commit-str' is aliased to 'log -1 --abbrev=12 --pretty=format:'commit
> > %h ("%s")''
>
> (The name is not imaginative, and could probably be better.)

Thanks, will amend.

> > @@ -239,17 +239,17 @@ static int __init register_range_for_device(
> >      unsigned int bdf, paddr_t base, paddr_t limit,
> >      bool iw, bool ir, bool exclusion)
> >  {
> > -    int seg = 0; /* XXX */
> > -    struct ivrs_mappings *ivrs_mappings = get_ivrs_mappings(seg);
> > +    pci_sbdf_t sbdf = { .seg = 0, .bdf = bdf };
>
> The /* XXX */ wants to stay.  It's highlighting that this code isn't
> muti-segment aware (yet).

Will do.

> > +    struct ivrs_mappings *ivrs_mappings = get_ivrs_mappings(sbdf.seg);
> >      struct amd_iommu *iommu;
> >      u16 req;
> >      int rc = 0;
> >
> > -    iommu = find_iommu_for_device(seg, bdf);
> > +    iommu = find_iommu_for_device(sbdf);
> >      if ( !iommu )
> >      {
> >          AMD_IOMMU_WARN("IVMD: no IOMMU for device %pp - ignoring constrain\n",
> > -                       &PCI_SBDF(seg, bdf));
> > +                       &(sbdf));
>
> The brackets should be dropped now.  This should be just &sbdf.

Will do

> > @@ -1543,14 +1540,14 @@ static void invalidate_all_domain_pages(void)
> >  static int cf_check _invalidate_all_devices(
> >      u16 seg, struct ivrs_mappings *ivrs_mappings)
> >  {
> > -    unsigned int bdf;
> > +    pci_sbdf_t sbdf = { .seg = seg, .bdf = 0 };
> >      u16 req_id;
> >      struct amd_iommu *iommu;
> >
> > -    for ( bdf = 0; bdf < ivrs_bdf_entries; bdf++ )
> > +    for ( /* sbdf.bdf = 0 */ ; sbdf.bdf < ivrs_bdf_entries; sbdf.bdf++ )
> >      {
> > -        iommu = find_iommu_for_device(seg, bdf);
> > -        req_id = ivrs_mappings[bdf].dte_requestor_id;
> > +        iommu = find_iommu_for_device(sbdf);
> > +        req_id = ivrs_mappings[sbdf.bdf].dte_requestor_id;
>
> See how bloat-o-meter reports this as the 3rd most increased function.
> This is an example where merging to a pci_sbdf_t local variable is
> making things worse.
>
> Keep the bdf local variable, and use PCI_SBDF() for the call to
> find_iommu_for_device().
>
> The reason is that you're now modifying the low uint16_t half of a
> uint32_t.  This requires emitting 16-bit logic (requires the Operand
> Size Override prefix, contributing to your code size), it also suffers
> register merge penalty

This particular example would be equivalent:
add/remove: 0/0 grow/shrink: 2/2 up/down: 24/-24 (0)
Function                                     old     new   delta
_invalidate_all_devices                      138     154     +16
build_info                                   744     752      +8
__mon_lengths                               2936    2928      -8
iterate_ivrs_mappings                        129     113     -16

Will drop the hunk anyhow to reduce the size of diff. Thanks!


> > diff --git a/xen/drivers/passthrough/amd/iommu_intr.c b/xen/drivers/passthrough/amd/iommu_intr.c
> > index 9abdc38053..0c91125ec0 100644
> > --- a/xen/drivers/passthrough/amd/iommu_intr.c
> > +++ b/xen/drivers/passthrough/amd/iommu_intr.c
> > @@ -123,10 +123,10 @@ static spinlock_t* get_intremap_lock(int seg, int req_id)
> >             &shared_intremap_lock);
> >  }
> >
> > -static int get_intremap_requestor_id(int seg, int bdf)
> > +static int get_intremap_requestor_id(pci_sbdf_t sbdf)
> >  {
> > -    ASSERT( bdf < ivrs_bdf_entries );
> > -    return get_ivrs_mappings(seg)[bdf].dte_requestor_id;
> > +    ASSERT( sbdf.bdf < ivrs_bdf_entries );
> > +    return get_ivrs_mappings(sbdf.seg)[sbdf.bdf].dte_requestor_id;
>
> This is also an example where merging the parameter is not necessarily
> wise.  The segment and bdf parts are used differently, so this function
> now has to split the one parameter in two, and shift segment by 16 just
> to use it.

Will do:
add/remove: 0/0 grow/shrink: 4/6 up/down: 32/-64 (-32)

> > @@ -335,20 +336,19 @@ void cf_check amd_iommu_ioapic_update_ire(
> >      new_rte.raw = rte;
> >
> >      /* get device id of ioapic devices */
> > -    bdf = ioapic_sbdf[idx].bdf;
> > -    seg = ioapic_sbdf[idx].seg;
> > -    iommu = find_iommu_for_device(seg, bdf);
> > +    sbdf.sbdf = ioapic_sbdf[idx].sbdf.sbdf;
>
> sbdf = ioapic_sbdf[idx].sbdf;
>
> > +    iommu = find_iommu_for_device(sbdf);
> >      if ( !iommu )
> >      {
> >          AMD_IOMMU_WARN("failed to find IOMMU for IO-APIC @ %04x:%04x\n",
> > -                       seg, bdf);
> > +                       sbdf.seg, sbdf.bdf);
>
> This should be converted to %pp, which has a side effect of correcting
> the rendering of bdf.
>
> > @@ -515,15 +515,15 @@ int cf_check amd_iommu_msi_msg_update_ire(
> >      struct msi_desc *msi_desc, struct msi_msg *msg)
> >  {
> >      struct pci_dev *pdev = msi_desc->dev;
> > -    int bdf, seg, rc;
> > +    pci_sbdf_t sbdf;
> > +    int rc;
> >      struct amd_iommu *iommu;
> >      unsigned int i, nr = 1;
> >      u32 data;
> >
> > -    bdf = pdev ? pdev->sbdf.bdf : hpet_sbdf.bdf;
> > -    seg = pdev ? pdev->seg : hpet_sbdf.seg;
> > +    sbdf.sbdf = pdev ? pdev->sbdf.sbdf : hpet_sbdf.sbdf.sbdf;
>
> This is a better example where
>
> sbdf = pdev ? pdev->sbdf : hpet_sbdf.sbdf;
>
> is equivalent.
>
> > diff --git a/xen/drivers/passthrough/amd/iommu_map.c b/xen/drivers/passthrough/amd/iommu_map.c
> > index dde393645a..17070904fa 100644
> > --- a/xen/drivers/passthrough/amd/iommu_map.c
> > +++ b/xen/drivers/passthrough/amd/iommu_map.c
> > @@ -694,17 +694,16 @@ int amd_iommu_reserve_domain_unity_unmap(struct domain *d,
> >  int cf_check amd_iommu_get_reserved_device_memory(
> >      iommu_grdm_t *func, void *ctxt)
> >  {
> > -    unsigned int seg = 0 /* XXX */, bdf;
> > -    const struct ivrs_mappings *ivrs_mappings = get_ivrs_mappings(seg);
> > +    pci_sbdf_t sbdf = {0};
>
> "= {}" please.
>
> GCC has just introduced a nasty bug (they claim its a feature) where {0}
> on unions now zeros less than it used to do.  pci_sbdf_t doesn't tickle
> this corner case, but we need to be proactive about removing examples of
> "= {0}".

Will amend with all of these.

> > +    const struct ivrs_mappings *ivrs_mappings = get_ivrs_mappings(sbdf.seg);
> >      /* At least for global entries, avoid reporting them multiple times. */
> >      enum { pending, processing, done } global = pending;
> >
> > -    for ( bdf = 0; bdf < ivrs_bdf_entries; ++bdf )
> > +    for ( /* sbdf.bdf = 0 */ ; sbdf.bdf < ivrs_bdf_entries; ++sbdf.bdf )
> >      {
> > -        pci_sbdf_t sbdf = PCI_SBDF(seg, bdf);
> > -        const struct ivrs_unity_map *um = ivrs_mappings[bdf].unity_map;
> > -        unsigned int req = ivrs_mappings[bdf].dte_requestor_id;
> > -        const struct amd_iommu *iommu = ivrs_mappings[bdf].iommu;
> > +        const struct ivrs_unity_map *um = ivrs_mappings[sbdf.bdf].unity_map;
> > +        unsigned int req = ivrs_mappings[sbdf.bdf].dte_requestor_id;
> > +        const struct amd_iommu *iommu = ivrs_mappings[sbdf.bdf].iommu;
>
> Again, this will be better staying as two split variables.

Indeed (on top of the previous similar suggestion):
add/remove: 0/0 grow/shrink: 4/9 up/down: 32/-128 (-96)

> ~Andrew

Thank you!

