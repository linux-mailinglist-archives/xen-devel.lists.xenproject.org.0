Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5707F104F
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 11:27:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636535.992107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r51Up-0007MN-B3; Mon, 20 Nov 2023 10:27:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636535.992107; Mon, 20 Nov 2023 10:27:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r51Up-0007Kd-8J; Mon, 20 Nov 2023 10:27:15 +0000
Received: by outflank-mailman (input) for mailman id 636535;
 Mon, 20 Nov 2023 10:27:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GG8d=HB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r51Uo-0007KX-D2
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 10:27:14 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5de73f49-878f-11ee-9b0e-b553b5be7939;
 Mon, 20 Nov 2023 11:27:12 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40839807e82so9265585e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Nov 2023 02:27:12 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 z16-20020a05600c221000b0040472ad9a3dsm12664646wml.14.2023.11.20.02.27.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 02:27:11 -0800 (PST)
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
X-Inumbo-ID: 5de73f49-878f-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700476031; x=1701080831; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H6u5IIKMrRnAgP9P3e4yJP9E097PlWxV4mL2jqDXVB0=;
        b=ggH2RJXLvQAyy7gsLP1HWHS5TcWOvDtxJjWGfok9+tkMNmXI6YSQL9obCWr14vYae7
         RKAn8wCrP3DkfIdBpVs5ObVsvDFhtip0TZcs2+ogdGdwQaRGbe4U13H4BF9Iyx0IqwfU
         XjQyqIerGSiPEaH7kqiw4jvcab5xHIWQ3lNY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700476031; x=1701080831;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H6u5IIKMrRnAgP9P3e4yJP9E097PlWxV4mL2jqDXVB0=;
        b=w3KAXFlUFlZhiKpAu9hPZdao3dWwDYr1GSt+y3P8Ha3IBw/hMUOthKbpUfI/7Cyv1q
         USnbY/nO3mtwGLiMifNExJI26P9jUHYP+2bTnaDWhK7HdGN+ZTGZLXWYMC/J2O7Ju5Wm
         WSWoGMQ0Y+V1FQ2vTvOewUFyBubq2YaWUM/Do6BONOG3DY44dSTbM4OCWmZX+KxzXwC6
         w9YiWMyCXumm67YzhjjNjELVilLuUqbc4CrSoa+fQdKp7TWUNIkPq8FSnOmcBwu8ryCt
         GgX7bJ0A4KCWwP750QND5B6paoaOBVWI5Swvv27nDUnyU2lpamUZgeSkb9IVgGnlfG6M
         K+4Q==
X-Gm-Message-State: AOJu0YxyglgutOopQAlaQ1FG6BRdFyi6O4ua5Qd+AWFC6qDHLS0vF/Pp
	YyiB96x/33lGUjVaF/Z2uiB7HQ==
X-Google-Smtp-Source: AGHT+IGk5J5lR/glBGdvdtfIlXvkZ5v4HP4RZHNQcVyz7MOPfqPgvoMaPhR0Cjy4QO6Y/oIUnxH96Q==
X-Received: by 2002:a05:600c:1d18:b0:403:c70b:b688 with SMTP id l24-20020a05600c1d1800b00403c70bb688mr5614311wms.6.1700476031614;
        Mon, 20 Nov 2023 02:27:11 -0800 (PST)
Date: Mon, 20 Nov 2023 11:27:10 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/3] amd-vi: use the same IOMMU page table levels for PV
 and HVM
Message-ID: <ZVs0fvUQI9C7NRc5@macbook.local>
References: <20231117094749.81091-1-roger.pau@citrix.com>
 <20231117094749.81091-2-roger.pau@citrix.com>
 <e90d416e-f4dd-4b2c-9247-0e3aa35c26d9@citrix.com>
 <0392fe23-7589-4dc2-b664-1e7e01c3914d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0392fe23-7589-4dc2-b664-1e7e01c3914d@suse.com>

On Mon, Nov 20, 2023 at 10:45:29AM +0100, Jan Beulich wrote:
> On 17.11.2023 12:55, Andrew Cooper wrote:
> > On 17/11/2023 9:47 am, Roger Pau Monne wrote:
> >> Using different page table levels for HVM or PV guest is not helpful, and is
> >> not inline with the IOMMU implementation used by the other architecture vendor
> >> (VT-d).
> >>
> >> Switch to uniformly use DEFAULT_DOMAIN_ADDRESS_WIDTH in order to set the AMD-Vi
> >> page table levels.
> >>
> >> Note using the max RAM address for PV was bogus anyway, as there's no guarantee
> >> there can't be device MMIO or reserved regions past the maximum RAM region.
> > 
> > Indeed - and the MMIO regions do matter for P2P DMA.
> 
> So what about any such living above the 48-bit boundary (i.e. not covered
> by DEFAULT_DOMAIN_ADDRESS_WIDTH)?

That would only work for PV guests AFAICT, as HVM guests will already
refuse to create such mappings even before getting into the IOMMU
code: p2m_pt_set_entry() will return an error as the p2m code only
deals with 4 level page tables.

> 
> >> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > 
> > Variable-height IOMMU pagetables are not worth the security
> > vulnerabilities they're made of.  I regret not fighting hard enough to
> > kill them entirely several years ago...
> > 
> > Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>, although...
> > 
> >> ---
> >>  xen/drivers/passthrough/amd/pci_amd_iommu.c | 20 ++++++++------------
> >>  1 file changed, 8 insertions(+), 12 deletions(-)
> >>
> >> diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> >> index 6bc73dc21052..f9e749d74da2 100644
> >> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> >> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> >> @@ -359,21 +359,17 @@ int __read_mostly amd_iommu_min_paging_mode = 1;
> >>  static int cf_check amd_iommu_domain_init(struct domain *d)
> >>  {
> >>      struct domain_iommu *hd = dom_iommu(d);
> >> +    int pgmode = amd_iommu_get_paging_mode(
> >> +        1UL << (DEFAULT_DOMAIN_ADDRESS_WIDTH - PAGE_SHIFT));
> > 
> > "paging mode" comes from the spec, but it's a very backwards way of
> > spelling height.
> > 
> > Can we at least start to improve the comprehensibility by renaming this
> > variable.
> > 
> >> +
> >> +    if ( pgmode < 0 )
> >> +        return pgmode;
> >>  
> >>      /*
> >> -     * Choose the number of levels for the IOMMU page tables.
> >> -     * - PV needs 3 or 4, depending on whether there is RAM (including hotplug
> >> -     *   RAM) above the 512G boundary.
> >> -     * - HVM could in principle use 3 or 4 depending on how much guest
> >> -     *   physical address space we give it, but this isn't known yet so use 4
> >> -     *   unilaterally.
> >> -     * - Unity maps may require an even higher number.
> >> +     * Choose the number of levels for the IOMMU page tables, taking into
> >> +     * account unity maps.
> >>       */
> >> -    hd->arch.amd.paging_mode = max(amd_iommu_get_paging_mode(
> >> -            is_hvm_domain(d)
> >> -            ? 1UL << (DEFAULT_DOMAIN_ADDRESS_WIDTH - PAGE_SHIFT)
> >> -            : get_upper_mfn_bound() + 1),
> >> -        amd_iommu_min_paging_mode);
> >> +    hd->arch.amd.paging_mode = max(pgmode, amd_iommu_min_paging_mode);
> > 
> > I think these min/max variables can be dropped now we're not doing
> > variable height IOMMU pagetables, which further simplifies this expression.
> 
> Did you take unity maps into account? At least $subject and comment looks
> to not be consistent in this regard: Either unity maps need considering
> specially (and then we don't uniformly use the same depth), or they don't
> need mentioning in the comment (anymore).

Unity maps that require an address width > DEFAULT_DOMAIN_ADDRESS_WIDTH
will currently only work on PV at best, as HVM p2m code is limited to
4 level page tables, so even if the IOMMU page tables support a
greater address width the call to map such regions will trigger an
error in the p2m code way before attempting to create any IOMMU
mappings.

We could do:

hd->arch.amd.paging_mode =
    is_hvm_domain(d) ? pgmode : max(pgmode, amd_iommu_min_paging_mode);

Putting IVMD/RMRR regions that require the usage of 5 level page
tables would be a very short sighted move by vendors IMO.

And will put us back in a situation where PV vs HVM can get different
IOMMU page table levels, which is undesirable.  It might be better to
just assume all domains use DEFAULT_DOMAIN_ADDRESS_WIDTH and hide
devices that have IVMD/RMRR regions above that limit.

Thanks, Roger.

