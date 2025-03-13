Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B01A6023A
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 21:16:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.913487.1319515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsoyS-0004pq-6m; Thu, 13 Mar 2025 20:16:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 913487.1319515; Thu, 13 Mar 2025 20:16:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsoyS-0004o3-3v; Thu, 13 Mar 2025 20:16:12 +0000
Received: by outflank-mailman (input) for mailman id 913487;
 Thu, 13 Mar 2025 20:16:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2IX=WA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tsoyQ-0004nx-4i
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 20:16:10 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff342ba0-0047-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 21:16:07 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43cfb6e9031so13316845e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 13:16:07 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c7df3512sm3389770f8f.12.2025.03.13.13.16.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 13:16:06 -0700 (PDT)
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
X-Inumbo-ID: ff342ba0-0047-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741896967; x=1742501767; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RB/MyG+0LRPEbvbzRUvEJYPoTi+GNQ1GdxWLQViUUto=;
        b=gh+xSPePj5d+kCEKAOZzVnmmtKHd7Ze9A7ir6Y0fyhRF2UTHg/ZbTpvQ8Jct0KNJ9l
         qRrot7kYNdp/VeKx/mqt3LTeblbkOAUywf1kPG4qPjxPh9BxLDOExzv7Oo+Ug0EgBBBn
         IWUQvRd11EzrEp4XrfMW22tR4dxDmL+YSlsAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741896967; x=1742501767;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RB/MyG+0LRPEbvbzRUvEJYPoTi+GNQ1GdxWLQViUUto=;
        b=Sre4IMc0uUR66JaCxtZjnyPXwChAgxbwKsjpUDLYDulcErooToN709WJO6du9LxswZ
         8r4JNgsXIJXKbG+DU/8R1279eRptQTKlgLtfC569trDwwnKB06uPrGhKQKJ92cjXw9tv
         2afb9zuHwWVxLZOIi9Cmu1UE7w+7fLHJr2QPs2+dSq9S6SH5R2zaPXq0A5e6kBw8IVwI
         BAni4qmcvrKOGhpeeUKVu2w/PQZbMba2awF6JZ3ZcoY9e6o6SQqhLn49gLxulyCl7zlG
         bkOhJ+V09NWHZHLB5aKfK1QQBm8uZMqGpSmqUHYSEH0I0Mp0RJsVpSusX3IJMEGptOYO
         5HVA==
X-Forwarded-Encrypted: i=1; AJvYcCXYvHnvfKwPzBpPkR/nsk3DVUwW+Q35XregCRxCwf6KLlXUT0TsWkySuLiJbZefsaoIimqEuo4m+VI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz+/WwcledGCmuFVehRstguD2221Av0jJzXcfN9lXqVgoNKJ8kk
	EYKDnQ4BzToHKPW2yqolYYwt2BnlBz/MZtxgdPpYYO2L2B1e8wSRgR40lcA+sga/4u/2eZGDeCK
	b
X-Gm-Gg: ASbGncsNF7DvxDtEq27Hjz8WuNVVTsYW4Xl2kpGoKrn+W0qMj8rCAYzAYp4T4jqaVly
	e44HHD59fj600jUO7Tuckw2O0hCo1vMwQazgzTe2GjhrizTXlx3GFVJCDY2s4J5n/ECaV1oP9QG
	OOjYrgwQ6hE/fN4tMBC1yXIzaxyg4VIAeu++LdNL72i1uSRKFQ1c7ZQFlYu20SqL5+jDmbGKfko
	sRRqbC0UQmFX1Lpaql9tHL/nvioRyN6YWEBhLZIridQbSHrmW4HpGt4LUgMbnfy/05kI2XC/kWl
	fpf5k+LAdG2wzxHQjYbGsKC8ZQU4RVj4EkGJsl5U9pwZeBH7zaXicRh5TaOGODQfdv3kcV5gKQa
	FQWW4piet
X-Google-Smtp-Source: AGHT+IFi5Rh078UvQiQ7CBWVlxet/U9H2Fz3F3ucCNj2ovtFjoWb6QSv6NxUm9Tn0R5ymqldi8yhyA==
X-Received: by 2002:a05:600c:4204:b0:43c:f87c:24ce with SMTP id 5b1f17b1804b1-43d1d9c5841mr7328795e9.21.1741896966755;
        Thu, 13 Mar 2025 13:16:06 -0700 (PDT)
Message-ID: <bb0090da-c2ac-453e-972d-b06a66c51530@citrix.com>
Date: Thu, 13 Mar 2025 20:16:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drivers: Change amd_iommu struct to contain
 pci_sbdf_t, simplify code
To: Andrii Sultanov <sultanovandriy@gmail.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <7e5a37e51303ba17dab8e6a92830257f670f3355.1741891599.git.sultanovandriy@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <7e5a37e51303ba17dab8e6a92830257f670f3355.1741891599.git.sultanovandriy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/03/2025 6:57 pm, Andrii Sultanov wrote:
> Following on from 250d87dc, struct amd_iommu has its seg and bdf fields
> backwards with relation to pci_sbdf_t. Swap them around, and simplify the
> expressions regenerating an sbdf_t from seg+bdf.
>
> Simplify ioapic_sbdf and bpet_sbdf along the way. Adjust functions
> taking seg and bdf fields of these structs to take pci_sbdf_t instead.
> Simplify comparisons similarly.
>
> Bloat-o-meter reports:
>
> ```
> add/remove: 0/0 grow/shrink: 13/21 up/down: 352/-576 (-224)
> Function                                     old     new   delta
> _einittext                                 22028   22220    +192
> amd_iommu_prepare                            853     897     +44
> _invalidate_all_devices                      133     154     +21
> amd_iommu_domain_destroy                      46      63     +17
> disable_fmt                                12336   12352     +16
> _acpi_module_name                            416     432     +16
> amd_iommu_get_reserved_device_memory         521     536     +15
> parse_ivrs_table                            3955    3966     +11
> amd_iommu_assign_device                      271     282     +11
> find_iommu_for_device                        242     246      +4
> get_intremap_requestor_id                     49      52      +3
> amd_iommu_free_intremap_table                360     361      +1
> allocate_domain_resources                     82      83      +1
> reassign_device                              843     838      -5
> amd_iommu_remove_device                      352     347      -5
> amd_iommu_flush_iotlb                        359     354      -5
> iov_supports_xt                              270     264      -6
> amd_iommu_setup_domain_device               1478    1472      -6
> amd_setup_hpet_msi                           232     224      -8
> amd_iommu_ioapic_update_ire                  572     564      -8
> _hvm_dpci_msi_eoi                            157     149      -8
> amd_iommu_msi_enable                          33      20     -13
> register_range_for_device                    297     281     -16
> amd_iommu_add_device                         856     839     -17
> update_intremap_entry_from_msi_msg           879     861     -18
> amd_iommu_read_ioapic_from_ire               347     323     -24
> amd_iommu_msi_msg_update_ire                 472     431     -41
> flush_command_buffer                         460     417     -43
> set_iommu_interrupt_handler                  421     377     -44
> amd_iommu_detect_one_acpi                    918     868     -50
> amd_iommu_get_supported_ivhd_type             86      31     -55
> iterate_ivrs_mappings                        169     113     -56
> parse_ivmd_block                            1339    1271     -68
> enable_iommu                                1745    1665     -80
> ```
>
> Resolves: https://gitlab.com/xen-project/xen/-/issues/198
>
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Andrii Sultanov <sultanovandriy@gmail.com>

Well, this is awkward.  This is the task I'd put together for Cody to
try.  I guess I have to find another one.

In commit messages, we always want the subject alongside a hash.  I have
this local alias to help:

> xen.git/xen$ git commit-str 250d87dc
> commit 250d87dc3ff9 ("x86/msi: Change __msi_set_enable() to take
> pci_sbdf_t")
> xen.git/xen$ git help commit-str
> 'commit-str' is aliased to 'log -1 --abbrev=12 --pretty=format:'commit
> %h ("%s")''

(The name is not imaginative, and could probably be better.)

> @@ -239,17 +239,17 @@ static int __init register_range_for_device(
>      unsigned int bdf, paddr_t base, paddr_t limit,
>      bool iw, bool ir, bool exclusion)
>  {
> -    int seg = 0; /* XXX */
> -    struct ivrs_mappings *ivrs_mappings = get_ivrs_mappings(seg);
> +    pci_sbdf_t sbdf = { .seg = 0, .bdf = bdf };

The /* XXX */ wants to stay.  It's highlighting that this code isn't
muti-segment aware (yet).

> +    struct ivrs_mappings *ivrs_mappings = get_ivrs_mappings(sbdf.seg);
>      struct amd_iommu *iommu;
>      u16 req;
>      int rc = 0;
>  
> -    iommu = find_iommu_for_device(seg, bdf);
> +    iommu = find_iommu_for_device(sbdf);
>      if ( !iommu )
>      {
>          AMD_IOMMU_WARN("IVMD: no IOMMU for device %pp - ignoring constrain\n",
> -                       &PCI_SBDF(seg, bdf));
> +                       &(sbdf));

The brackets should be dropped now.  This should be just &sbdf.

> @@ -1543,14 +1540,14 @@ static void invalidate_all_domain_pages(void)
>  static int cf_check _invalidate_all_devices(
>      u16 seg, struct ivrs_mappings *ivrs_mappings)
>  {
> -    unsigned int bdf; 
> +    pci_sbdf_t sbdf = { .seg = seg, .bdf = 0 };
>      u16 req_id;
>      struct amd_iommu *iommu;
>  
> -    for ( bdf = 0; bdf < ivrs_bdf_entries; bdf++ )
> +    for ( /* sbdf.bdf = 0 */ ; sbdf.bdf < ivrs_bdf_entries; sbdf.bdf++ )
>      {
> -        iommu = find_iommu_for_device(seg, bdf);
> -        req_id = ivrs_mappings[bdf].dte_requestor_id;
> +        iommu = find_iommu_for_device(sbdf);
> +        req_id = ivrs_mappings[sbdf.bdf].dte_requestor_id;

See how bloat-o-meter reports this as the 3rd most increased function. 
This is an example where merging to a pci_sbdf_t local variable is
making things worse.

Keep the bdf local variable, and use PCI_SBDF() for the call to
find_iommu_for_device().

The reason is that you're now modifying the low uint16_t half of a
uint32_t.  This requires emitting 16-bit logic (requires the Operand
Size Override prefix, contributing to your code size), it also suffers
register merge penalty


> diff --git a/xen/drivers/passthrough/amd/iommu_intr.c b/xen/drivers/passthrough/amd/iommu_intr.c
> index 9abdc38053..0c91125ec0 100644
> --- a/xen/drivers/passthrough/amd/iommu_intr.c
> +++ b/xen/drivers/passthrough/amd/iommu_intr.c
> @@ -123,10 +123,10 @@ static spinlock_t* get_intremap_lock(int seg, int req_id)
>             &shared_intremap_lock);
>  }
>  
> -static int get_intremap_requestor_id(int seg, int bdf)
> +static int get_intremap_requestor_id(pci_sbdf_t sbdf)
>  {
> -    ASSERT( bdf < ivrs_bdf_entries );
> -    return get_ivrs_mappings(seg)[bdf].dte_requestor_id;
> +    ASSERT( sbdf.bdf < ivrs_bdf_entries );
> +    return get_ivrs_mappings(sbdf.seg)[sbdf.bdf].dte_requestor_id;

This is also an example where merging the parameter is not necessarily
wise.  The segment and bdf parts are used differently, so this function
now has to split the one parameter in two, and shift segment by 16 just
to use it.

> @@ -335,20 +336,19 @@ void cf_check amd_iommu_ioapic_update_ire(
>      new_rte.raw = rte;
>  
>      /* get device id of ioapic devices */
> -    bdf = ioapic_sbdf[idx].bdf;
> -    seg = ioapic_sbdf[idx].seg;
> -    iommu = find_iommu_for_device(seg, bdf);
> +    sbdf.sbdf = ioapic_sbdf[idx].sbdf.sbdf;

sbdf = ioapic_sbdf[idx].sbdf;

> +    iommu = find_iommu_for_device(sbdf);
>      if ( !iommu )
>      {
>          AMD_IOMMU_WARN("failed to find IOMMU for IO-APIC @ %04x:%04x\n",
> -                       seg, bdf);
> +                       sbdf.seg, sbdf.bdf);

This should be converted to %pp, which has a side effect of correcting
the rendering of bdf.

> @@ -515,15 +515,15 @@ int cf_check amd_iommu_msi_msg_update_ire(
>      struct msi_desc *msi_desc, struct msi_msg *msg)
>  {
>      struct pci_dev *pdev = msi_desc->dev;
> -    int bdf, seg, rc;
> +    pci_sbdf_t sbdf;
> +    int rc;
>      struct amd_iommu *iommu;
>      unsigned int i, nr = 1;
>      u32 data;
>  
> -    bdf = pdev ? pdev->sbdf.bdf : hpet_sbdf.bdf;
> -    seg = pdev ? pdev->seg : hpet_sbdf.seg;
> +    sbdf.sbdf = pdev ? pdev->sbdf.sbdf : hpet_sbdf.sbdf.sbdf;

This is a better example where

sbdf = pdev ? pdev->sbdf : hpet_sbdf.sbdf;

is equivalent.

> diff --git a/xen/drivers/passthrough/amd/iommu_map.c b/xen/drivers/passthrough/amd/iommu_map.c
> index dde393645a..17070904fa 100644
> --- a/xen/drivers/passthrough/amd/iommu_map.c
> +++ b/xen/drivers/passthrough/amd/iommu_map.c
> @@ -694,17 +694,16 @@ int amd_iommu_reserve_domain_unity_unmap(struct domain *d,
>  int cf_check amd_iommu_get_reserved_device_memory(
>      iommu_grdm_t *func, void *ctxt)
>  {
> -    unsigned int seg = 0 /* XXX */, bdf;
> -    const struct ivrs_mappings *ivrs_mappings = get_ivrs_mappings(seg);
> +    pci_sbdf_t sbdf = {0};

"= {}" please.

GCC has just introduced a nasty bug (they claim its a feature) where {0}
on unions now zeros less than it used to do.  pci_sbdf_t doesn't tickle
this corner case, but we need to be proactive about removing examples of
"= {0}".

> +    const struct ivrs_mappings *ivrs_mappings = get_ivrs_mappings(sbdf.seg);
>      /* At least for global entries, avoid reporting them multiple times. */
>      enum { pending, processing, done } global = pending;
>  
> -    for ( bdf = 0; bdf < ivrs_bdf_entries; ++bdf )
> +    for ( /* sbdf.bdf = 0 */ ; sbdf.bdf < ivrs_bdf_entries; ++sbdf.bdf )
>      {
> -        pci_sbdf_t sbdf = PCI_SBDF(seg, bdf);
> -        const struct ivrs_unity_map *um = ivrs_mappings[bdf].unity_map;
> -        unsigned int req = ivrs_mappings[bdf].dte_requestor_id;
> -        const struct amd_iommu *iommu = ivrs_mappings[bdf].iommu;
> +        const struct ivrs_unity_map *um = ivrs_mappings[sbdf.bdf].unity_map;
> +        unsigned int req = ivrs_mappings[sbdf.bdf].dte_requestor_id;
> +        const struct amd_iommu *iommu = ivrs_mappings[sbdf.bdf].iommu;

Again, this will be better staying as two split variables.

~Andrew

