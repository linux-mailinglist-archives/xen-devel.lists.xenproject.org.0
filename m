Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B111A5BA8A
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 09:12:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907367.1314603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1truiZ-0002mg-Bf; Tue, 11 Mar 2025 08:12:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907367.1314603; Tue, 11 Mar 2025 08:12:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1truiZ-0002jZ-8G; Tue, 11 Mar 2025 08:12:03 +0000
Received: by outflank-mailman (input) for mailman id 907367;
 Tue, 11 Mar 2025 08:12:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=siat=V6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1truiY-0002jT-5z
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 08:12:02 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81e93461-fe50-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 09:12:00 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43cfa7e7f54so10405175e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 01:12:00 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3912bfb79fbsm17640954f8f.13.2025.03.11.01.11.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 01:11:59 -0700 (PDT)
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
X-Inumbo-ID: 81e93461-fe50-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741680720; x=1742285520; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bxrr+XATuevJM9vQ7yRwFAVvEo3YRRpdOMjLc443al0=;
        b=CEPzx7tv188decfTQlq9a2NFQHTrk0LrOglH7waM4cU/t0ZWOiwt+DH+976DOLZsjT
         heot1OjC2/ez5l4GUTAzDZKM4oLdjFNBwb9PTF/ZreiF8BgVLHXo69FhxnkuSZNee3F6
         zPTHp3SpuL9Nj9U2mgvhyLwcsmd9yiBW3OD4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741680720; x=1742285520;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bxrr+XATuevJM9vQ7yRwFAVvEo3YRRpdOMjLc443al0=;
        b=vZIYJg0nM3NYIk4GEuFy+ylffpHv5tfH/wGAMAfvdVK/p3KCre8qx/LmzwHPtxf5S/
         1y5ztv0Igb/tlSeGsUtzoJcNf2gqiKNuoO9VsOR6A8clGz+aaiePjy7lLDSea9nd+W3J
         0qQ40yW78Iyq+/93zFcOCX1Hox/VjqaghPaoo085vVx5ATws+63FTN6GmapKROP/USJd
         H/v4tyoYkeesN0q6EZxii038rKdckJLCEzIxwScZwwsOU0Tl6s0dutC1PimQfF9dXkOr
         opMS3r3JETLED/FxB6UDHUYs9eFkVZgUTCooH32++W9ba8M0T9WfSjLPz957Hk8w1XSn
         iAaA==
X-Forwarded-Encrypted: i=1; AJvYcCW4a9GdVKWoan+KUjAHz7W0hf72SQ3I7AWEqf4HxspPqv1nDRoj0NqsWAAefpMJGikzIQcePqZTXv0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yymx1EsegvTMSLUBQ2KO7aab00p08rhzK4kqG7oDE8VK3jaFuIw
	dyCE5abxOrprzC8JtdTu6WnW0+qhfxKhDjwpxVLKa5Zev3PtxW7wecvZLVYeoTM=
X-Gm-Gg: ASbGncvDaHxYNt7Mx9AE7tBDzjIU/poEdhZOhLXiYbCIq4yDHqi8vwV4DMDhxrsGRBC
	m0psY2jrw3qFj1BIb0deNnDrO+fTqghtKk45b6qzDbm0CfUSB4x1ZfZlqkVxj+5IeifSns/xlMx
	faPxB5iWmeOUH27eWS7pB85HVLcvDn5WZc4hBlKq9e0MKIH6dULYsKTJlO4N5jnDazPce13NBIS
	u7b6h5DzdcxE39BtV03c9y3bIXvfaREgzx4U2/kZwSdbRrZr3yGpMIbFWEvsZAuq9qbqvchkLdS
	nBWqtJ00/Zyp15FaGl955sO1vbEPGSqPjRfOOYLxtlBxNv/K3LmtJkQ=
X-Google-Smtp-Source: AGHT+IHjfOI3/Vk5A9n9fFqAICwvlQxV9cQdFpD07MTcD7FzcHWa727F6x0cENVxH9qQXJr4/Az5bQ==
X-Received: by 2002:a05:600c:450f:b0:43b:ca8c:fca3 with SMTP id 5b1f17b1804b1-43d01d37e77mr31401135e9.11.1741680719669;
        Tue, 11 Mar 2025 01:11:59 -0700 (PDT)
Date: Tue, 11 Mar 2025 09:11:58 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 2/2] x86/iommu: avoid MSI address and data writes if
 IRT index hasn't changed
Message-ID: <Z8_wTrf9nalT82bf@macbook.local>
References: <20250310095535.46033-1-roger.pau@citrix.com>
 <20250310095535.46033-3-roger.pau@citrix.com>
 <507eef19-92ff-44ca-bd0a-86299949c03b@suse.com>
 <Z88Ib1ewzugJmepe@macbook.local>
 <804fd071-16d1-4703-b314-3ee3b8da4f6c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <804fd071-16d1-4703-b314-3ee3b8da4f6c@suse.com>

On Tue, Mar 11, 2025 at 08:35:35AM +0100, Jan Beulich wrote:
> On 10.03.2025 16:42, Roger Pau Monné wrote:
> > On Mon, Mar 10, 2025 at 11:51:09AM +0100, Jan Beulich wrote:
> >> On 10.03.2025 10:55, Roger Pau Monne wrote:
> >>> Attempt to reduce the MSI entry writes, and the associated checking whether
> >>> memory decoding and MSI-X is enabled for the PCI device, when the MSI data
> >>> hasn't changed.
> >>>
> >>> When using Interrupt Remapping the MSI entry will contain an index into
> >>> the remapping table, and it's in such remapping table where the MSI vector
> >>> and destination CPU is stored.  As such, when using interrupt remapping,
> >>> changes to the interrupt affinity shouldn't result in changes to the MSI
> >>> entry, and the MSI entry update can be avoided.
> >>>
> >>> Signal from the IOMMU update_ire_from_msi hook whether the MSI data or
> >>> address fields have changed, and thus need writing to the device registers.
> >>> Such signaling is done by returning 1 from the function.  Otherwise
> >>> returning 0 means no update of the MSI fields, and thus no write
> >>> required.
> >>>
> >>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>
> >> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> >> with two purely cosmetic suggestions and an only loosely related question below.
> >>
> >>> --- a/xen/arch/x86/hvm/vmx/vmx.c
> >>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> >>> @@ -415,7 +415,9 @@ static int cf_check vmx_pi_update_irte(const struct vcpu *v,
> >>>  
> >>>      ASSERT_PDEV_LIST_IS_READ_LOCKED(msi_desc->dev->domain);
> >>>  
> >>> -    return iommu_update_ire_from_msi(msi_desc, &msi_desc->msg);
> >>> +    rc = iommu_update_ire_from_msi(msi_desc, &msi_desc->msg);
> >>> +
> >>> +    return rc < 0 ? rc : 0;
> >>
> >> Only tangential here, but: Why does this function have a return type of
> >> non-void, when neither caller cares?
> > 
> > I'm afraid there's more wrong in vmx_pi_update_irte() that I've just
> > spotted afterwards.
> > 
> > vmx_pi_update_irte() passes to iommu_update_ire_from_msi() the
> > msi_desc->msg field, but that field is supposed to always contain the
> > non-translated MSI data, as you correctly pointed out in v1 it's
> > consumed by dump_msi().  vmx_pi_update_irte() using msi_desc->msg to
> > store the translated MSI effectively breaks dump_msi().
> 
> Oh, indeed - it violates what write_msi_msg() specifically checks by
> an assertion.

Indeed.  I have a pre-patch to fix this.

> > Also vmx_pi_update_irte() relies on the IRT index never changing, as
> > otherwise it's missing any logic to update the MSI registers.
> 
> Isn't this a valid assumption here? msi_msg_to_remap_entry() will only
> ever allocate a new index if none was previously allocated.

Yes, but I think it needs to be accounted for, I've now switched this
to:

    rc = iommu_update_ire_from_msi(msi_desc, &msg);
    if ( rc > 0 )
    {
        /*
         * Callers of vmx_pi_update_irte() won't propagate the updated MSI
         * fields to the hardware, must assert there are no changes.
         */
        ASSERT_UNREACHABLE();
        rc = -EILSEQ;
    }

    return rc;

Which I think better reflects the expectations of the function.

> >>> --- a/xen/drivers/passthrough/amd/iommu_intr.c
> >>> +++ b/xen/drivers/passthrough/amd/iommu_intr.c
> >>> @@ -492,7 +492,7 @@ static int update_intremap_entry_from_msi_msg(
> >>>                 get_ivrs_mappings(iommu->seg)[alias_id].intremap_table);
> >>>      }
> >>>  
> >>> -    return 0;
> >>> +    return !fresh ? 0 : 1;
> >>>  }
> >>
> >> Simply
> >>
> >>     return fresh;
> >>
> >> ?
> >>
> >>> @@ -546,7 +546,7 @@ int cf_check amd_iommu_msi_msg_update_ire(
> >>>      rc = update_intremap_entry_from_msi_msg(iommu, bdf, nr,
> >>>                                              &msi_desc->remap_index,
> >>>                                              msg, &data);
> >>> -    if ( !rc )
> >>> +    if ( rc > 0 )
> >>>      {
> >>>          for ( i = 1; i < nr; ++i )
> >>>              msi_desc[i].remap_index = msi_desc->remap_index + i;
> >>> --- a/xen/drivers/passthrough/vtd/intremap.c
> >>> +++ b/xen/drivers/passthrough/vtd/intremap.c
> >>> @@ -506,6 +506,7 @@ static int msi_msg_to_remap_entry(
> >>>      unsigned int index, i, nr = 1;
> >>>      unsigned long flags;
> >>>      const struct pi_desc *pi_desc = msi_desc->pi_desc;
> >>> +    bool alloc = false;
> >>>  
> >>>      if ( msi_desc->msi_attrib.type == PCI_CAP_ID_MSI )
> >>>          nr = msi_desc->msi.nvec;
> >>> @@ -529,6 +530,7 @@ static int msi_msg_to_remap_entry(
> >>>          index = alloc_remap_entry(iommu, nr);
> >>>          for ( i = 0; i < nr; ++i )
> >>>              msi_desc[i].remap_index = index + i;
> >>> +        alloc = true;
> >>>      }
> >>>      else
> >>>          index = msi_desc->remap_index;
> >>> @@ -601,7 +603,7 @@ static int msi_msg_to_remap_entry(
> >>>      unmap_vtd_domain_page(iremap_entries);
> >>>      spin_unlock_irqrestore(&iommu->intremap.lock, flags);
> >>>  
> >>> -    return 0;
> >>> +    return alloc ? 1 : 0;
> >>>  }
> >>
> >> Like above, simply
> >>
> >>     return alloc;
> >>
> >> ?
> > 
> > I wasn't sure whether this was overloading the boolean type and
> > possibly breaking some MISRA rule.  I can adjust.
> 
> What we are to do with Misra's essential type system is entirely unclear at
> this point, aiui.

Thanks, given the findings above I will post v4 with the extra
adjustments.

Roger.

