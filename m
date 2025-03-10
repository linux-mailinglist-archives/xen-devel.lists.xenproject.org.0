Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA9EA59A40
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 16:43:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906687.1314082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trfHG-0001IP-SA; Mon, 10 Mar 2025 15:42:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906687.1314082; Mon, 10 Mar 2025 15:42:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trfHG-0001GE-Oh; Mon, 10 Mar 2025 15:42:50 +0000
Received: by outflank-mailman (input) for mailman id 906687;
 Mon, 10 Mar 2025 15:42:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B6N5=V5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1trfHF-0001G5-2K
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 15:42:49 +0000
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ff5c233-fdc6-11ef-9ab8-95dc52dad729;
 Mon, 10 Mar 2025 16:42:46 +0100 (CET)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-22359001f1aso106556925ad.3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 08:42:46 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-224109ddbf2sm79534945ad.18.2025.03.10.08.42.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 08:42:44 -0700 (PDT)
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
X-Inumbo-ID: 4ff5c233-fdc6-11ef-9ab8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741621365; x=1742226165; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=On0kVqxDo+Wcr67gdF9MF+rNkvzHcv2wGO4dJ9QaaCI=;
        b=juu1t8uvP4/5pot9v5pPjQkwTINLWsU7uPnWWY/3xJUiiUVrSrQbnXhjrxaFygasJp
         J7wgkUd7Q+RYp5UO9BvtHEDL2h5BkIKyi+iTj9QZTDhGSQuvj5mYYszRhOBl2QlNzPGD
         OoUDP0Ukifi43I2XxuaSW9/hgHzfr2Y1PBVzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741621365; x=1742226165;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=On0kVqxDo+Wcr67gdF9MF+rNkvzHcv2wGO4dJ9QaaCI=;
        b=mlEsRn0/6LKbZIeWMMAWfM9w/3i6rclL9gvaGtiY2EgOR7T2qwlr/mFnhvZtvSk+iM
         8In0oIHMtYB1mXv6E7jw+wWZh9vfoMscQru97lxTHtxqesNUMw/NBYaLh2dQhuSKPuAP
         QkI3XxJ4aP0/0P4HgSm65777dsO1wiPHM/5yjnpm9kGx4xve9cODDLMUNdkI0RFDpwdR
         jef+jHGgzNq+qGc7c2X8D4yEh2ci12TY6rLE5Hv0cETvhaFnrnKHJJbqWpXuf954HGQA
         cihILIJyeSZusldL3MA9SDG1Ti5Q9uU/sPxTEOjSmJQyQAkaj/G7E6z/STLTcWNj4TWc
         SSjw==
X-Forwarded-Encrypted: i=1; AJvYcCUJ9bnxHwUegVA6e+3pc5ZGtRonh8nRHwWORSg1WiZx9jW48Mgi/rpVV/90S+q4dIierJhoh4jUs1M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxozfL3whgZa0ZOoEm/03u6Guq7s5Dk+JmU5LihxGK1sG0vmgJA
	IHqPGoDxnLs/FYh6dwR2vpXpYgqW6Vqu/WmVIQHVH7Ni7jy13Z/rq/zz0Wy41iE=
X-Gm-Gg: ASbGnct00I5nMeZwzSWunB5wEYc7Y0PtyuhWsVjakRHTsi1sWhb8jx1phsIWUaIX9OV
	fKXF89Qg9Z2q4ua2js7IuO2MefnXtrc1Owwl/KMdw9XexHE/i1MOQU5Jf8lBTVzV/l0ziUYfWJt
	Ba7IgEibJfrcukbwf8OCjZ0BD6NYGq0/iamQx7uqworQESSc+KfxuMCFoCK091eUj/v60zmB8lC
	gQOj4V13WCtRQT/HdZVdiu7DYGQjfZ1i4+7abNnHUH6dphE+fb/yjGkBKP3pJUD2EDvhlITuB1K
	7S3ah6leDwHr3niuorVOLIKCsSc6+sgryTuiHhgLo5aQOphklx3JhcNNJ42w9LmLtQ==
X-Google-Smtp-Source: AGHT+IHjFe6dDuLqlhwItMU1i9wCzI1O4A9ra3UYH7d1CtRs8AnYfXVPGz0WZ/D9SIqAJx48E8PDAw==
X-Received: by 2002:a17:902:e845:b0:223:635d:3e38 with SMTP id d9443c01a7336-2242888a9a3mr233132265ad.15.1741621365181;
        Mon, 10 Mar 2025 08:42:45 -0700 (PDT)
Date: Mon, 10 Mar 2025 16:42:39 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 2/2] x86/iommu: avoid MSI address and data writes if
 IRT index hasn't changed
Message-ID: <Z88Ib1ewzugJmepe@macbook.local>
References: <20250310095535.46033-1-roger.pau@citrix.com>
 <20250310095535.46033-3-roger.pau@citrix.com>
 <507eef19-92ff-44ca-bd0a-86299949c03b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <507eef19-92ff-44ca-bd0a-86299949c03b@suse.com>

On Mon, Mar 10, 2025 at 11:51:09AM +0100, Jan Beulich wrote:
> On 10.03.2025 10:55, Roger Pau Monne wrote:
> > Attempt to reduce the MSI entry writes, and the associated checking whether
> > memory decoding and MSI-X is enabled for the PCI device, when the MSI data
> > hasn't changed.
> > 
> > When using Interrupt Remapping the MSI entry will contain an index into
> > the remapping table, and it's in such remapping table where the MSI vector
> > and destination CPU is stored.  As such, when using interrupt remapping,
> > changes to the interrupt affinity shouldn't result in changes to the MSI
> > entry, and the MSI entry update can be avoided.
> > 
> > Signal from the IOMMU update_ire_from_msi hook whether the MSI data or
> > address fields have changed, and thus need writing to the device registers.
> > Such signaling is done by returning 1 from the function.  Otherwise
> > returning 0 means no update of the MSI fields, and thus no write
> > required.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> with two purely cosmetic suggestions and an only loosely related question below.
> 
> > --- a/xen/arch/x86/hvm/vmx/vmx.c
> > +++ b/xen/arch/x86/hvm/vmx/vmx.c
> > @@ -415,7 +415,9 @@ static int cf_check vmx_pi_update_irte(const struct vcpu *v,
> >  
> >      ASSERT_PDEV_LIST_IS_READ_LOCKED(msi_desc->dev->domain);
> >  
> > -    return iommu_update_ire_from_msi(msi_desc, &msi_desc->msg);
> > +    rc = iommu_update_ire_from_msi(msi_desc, &msi_desc->msg);
> > +
> > +    return rc < 0 ? rc : 0;
> 
> Only tangential here, but: Why does this function have a return type of
> non-void, when neither caller cares?

I'm afraid there's more wrong in vmx_pi_update_irte() that I've just
spotted afterwards.

vmx_pi_update_irte() passes to iommu_update_ire_from_msi() the
msi_desc->msg field, but that field is supposed to always contain the
non-translated MSI data, as you correctly pointed out in v1 it's
consumed by dump_msi().  vmx_pi_update_irte() using msi_desc->msg to
store the translated MSI effectively breaks dump_msi().

Also vmx_pi_update_irte() relies on the IRT index never changing, as
otherwise it's missing any logic to update the MSI registers.

I will fix that in a pre-patch.

> 
> > --- a/xen/drivers/passthrough/amd/iommu_intr.c
> > +++ b/xen/drivers/passthrough/amd/iommu_intr.c
> > @@ -492,7 +492,7 @@ static int update_intremap_entry_from_msi_msg(
> >                 get_ivrs_mappings(iommu->seg)[alias_id].intremap_table);
> >      }
> >  
> > -    return 0;
> > +    return !fresh ? 0 : 1;
> >  }
> 
> Simply
> 
>     return fresh;
> 
> ?
> 
> > @@ -546,7 +546,7 @@ int cf_check amd_iommu_msi_msg_update_ire(
> >      rc = update_intremap_entry_from_msi_msg(iommu, bdf, nr,
> >                                              &msi_desc->remap_index,
> >                                              msg, &data);
> > -    if ( !rc )
> > +    if ( rc > 0 )
> >      {
> >          for ( i = 1; i < nr; ++i )
> >              msi_desc[i].remap_index = msi_desc->remap_index + i;
> > --- a/xen/drivers/passthrough/vtd/intremap.c
> > +++ b/xen/drivers/passthrough/vtd/intremap.c
> > @@ -506,6 +506,7 @@ static int msi_msg_to_remap_entry(
> >      unsigned int index, i, nr = 1;
> >      unsigned long flags;
> >      const struct pi_desc *pi_desc = msi_desc->pi_desc;
> > +    bool alloc = false;
> >  
> >      if ( msi_desc->msi_attrib.type == PCI_CAP_ID_MSI )
> >          nr = msi_desc->msi.nvec;
> > @@ -529,6 +530,7 @@ static int msi_msg_to_remap_entry(
> >          index = alloc_remap_entry(iommu, nr);
> >          for ( i = 0; i < nr; ++i )
> >              msi_desc[i].remap_index = index + i;
> > +        alloc = true;
> >      }
> >      else
> >          index = msi_desc->remap_index;
> > @@ -601,7 +603,7 @@ static int msi_msg_to_remap_entry(
> >      unmap_vtd_domain_page(iremap_entries);
> >      spin_unlock_irqrestore(&iommu->intremap.lock, flags);
> >  
> > -    return 0;
> > +    return alloc ? 1 : 0;
> >  }
> 
> Like above, simply
> 
>     return alloc;
> 
> ?

I wasn't sure whether this was overloading the boolean type and
possibly breaking some MISRA rule.  I can adjust.

Thanks, Roger.

