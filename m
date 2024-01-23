Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DE683928B
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jan 2024 16:24:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670524.1043372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSIcs-0005Rq-Jb; Tue, 23 Jan 2024 15:23:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670524.1043372; Tue, 23 Jan 2024 15:23:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSIcs-0005Pq-Gl; Tue, 23 Jan 2024 15:23:46 +0000
Received: by outflank-mailman (input) for mailman id 670524;
 Tue, 23 Jan 2024 15:23:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gDjx=JB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rSIcr-0005Ph-66
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2024 15:23:45 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64741d1c-ba03-11ee-9b0f-b553b5be7939;
 Tue, 23 Jan 2024 16:23:43 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40ebf373130so6747635e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jan 2024 07:23:42 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 m22-20020a05600c4f5600b0040ebf603a89sm1885177wmq.11.2024.01.23.07.23.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 07:23:42 -0800 (PST)
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
X-Inumbo-ID: 64741d1c-ba03-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706023422; x=1706628222; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vnd+4bDLpE0hI7k7uD4FhqHy1XKVQ5YE8s7v778V7hQ=;
        b=LIpovmO9ig/+CanLS1YAYvazWSJFuzFVl8JslbPNya+cUnro1hFk4SJXZt0e1P4qDf
         j+IDKqFMAsjJDqZg1LDjYRqNlEMOsPTDVtGz1LqI0oCHhw2Y1gnB5OR2OBo6ec2xisvX
         fAUOX4MfiDx7W1BuBOj5AqTMo3OPkFkOouDxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706023422; x=1706628222;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vnd+4bDLpE0hI7k7uD4FhqHy1XKVQ5YE8s7v778V7hQ=;
        b=cBzgNBYUiexxWkX/6q7D/3nQeJqgCflfDP80GlWIqLl8VYLp84rxhUsBobfN4Qlpu4
         b8MMIcoervwe/ufecUdhEPcdf1t31p6LsImyZKiwNAZWUsEY3PY0gcIir00+0AKwzb64
         YwgkBOikpKqUPXZtvX6HFoHi3sH434q2Z1N1ZT5SuT5Qav8IpG73LUMSVnppKE4QuIT3
         lQ6a3J1P8cEFKS52JkZJX5Luufa2UpDN5U2I/9iusVmDN040bMzZAuaWI0ModydMpSYi
         WTpaHuIEgWr4fLVmWpgU9u1ZvsNPniJ0B+e9a51Scnj7YZ4R5ACTDZcC0n2+tXh1jO0t
         Om/w==
X-Gm-Message-State: AOJu0YxGQ/cLqYnU+Rzr6/dsu/jjT+agrLss122tMnhXu3kayfQi19hk
	I81jcVLVNhfEFNadL66Xo73TJoQi8yngUTUhW4WX6DzgTlzsqha/GCEb4OgM2Ag=
X-Google-Smtp-Source: AGHT+IFHhAQJ6Bg2EZI1aBLlm2bezAr5vAGrjUj2BdbtL2d/r5NTXQfKiXnE3s226r64Nl/bNfjI3A==
X-Received: by 2002:a05:600c:21c3:b0:40e:4683:9d69 with SMTP id x3-20020a05600c21c300b0040e46839d69mr656707wmj.132.1706023422411;
        Tue, 23 Jan 2024 07:23:42 -0800 (PST)
Date: Tue, 23 Jan 2024 16:23:41 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v12.2 01/15] vpci: use per-domain PCI lock to protect
 vpci structure
Message-ID: <Za_Z_WlLbBgb0EzF@macbook>
References: <20240109215145.430207-1-stewart.hildebrand@amd.com>
 <20240109215145.430207-2-stewart.hildebrand@amd.com>
 <20240115194309.45683-1-stewart.hildebrand@amd.com>
 <18ec3401-4334-40c0-82a0-31abfd9797d0@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <18ec3401-4334-40c0-82a0-31abfd9797d0@suse.com>

On Tue, Jan 23, 2024 at 03:26:26PM +0100, Jan Beulich wrote:
> On 15.01.2024 20:43, Stewart Hildebrand wrote:
> > --- a/xen/arch/x86/hvm/vmsi.c
> > +++ b/xen/arch/x86/hvm/vmsi.c
> > @@ -468,7 +468,7 @@ int msixtbl_pt_register(struct domain *d, struct pirq *pirq, uint64_t gtable)
> >      struct msixtbl_entry *entry, *new_entry;
> >      int r = -EINVAL;
> >  
> > -    ASSERT(pcidevs_locked());
> > +    ASSERT(pcidevs_locked() || rw_is_locked(&d->pci_lock));
> >      ASSERT(rw_is_write_locked(&d->event_lock));
> >  
> >      if ( !msixtbl_initialised(d) )
> > @@ -538,7 +538,7 @@ void msixtbl_pt_unregister(struct domain *d, struct pirq *pirq)
> >      struct pci_dev *pdev;
> >      struct msixtbl_entry *entry;
> >  
> > -    ASSERT(pcidevs_locked());
> > +    ASSERT(pcidevs_locked() || rw_is_locked(&d->pci_lock));
> >      ASSERT(rw_is_write_locked(&d->event_lock));
> 
> I was hoping to just ack this patch, but the two changes above look
> questionable to me: How can it be that holding _either_ lock is okay?
> It's not obvious in this context that consumers have to hold both
> locks now. In fact consumers looks to be the callers of
> msixtbl_find_entry(), yet the list is RCU-protected. Whereas races
> against themselves or against one another are avoided by holding
> d->event_lock.

The reason for the change here is that msixtbl_pt_{un,}register() gets
called by pt_irq_{create,destroy}_bind(), which is in turn called by
vPCI code (pcidevs_locked()) that has been switched to not take the
pcidevs lock anymore, and hence the ASSERT would trigger.

> My only guess then for the original need of holding pcidevs_lock is
> the use of msi_desc->dev, with the desire for the device to not go
> away. Yet the description doesn't talk about interactions of the per-
> domain PCI lock with that one at all; it all circles around the
> domain'd vPCI lock.

I do agree that it looks like the original intention of holding
pcidevs_lock is to prevent msi_desc->dev from being removed - yet I'm
not sure it's possible for the device to go away while the domain
event_lock is hold, as device removal would need to take that same
lock in order to destroy the irq_desc.

> Feels like I'm missing something that's obvious to everyone else.
> Or maybe this part of the patch is actually unrelated, and should be
> split off (with its own [proper] justification)? Or wouldn't it then
> be better to also change the other paths leading here to acquire the
> per-domain PCI lock?

Other paths in vPCI vpci_msi_update(), vpci_msi_arch_update(),
vpci_msi_arch_enable()... are switched in this patch to use the
per-domain pci_lock instead of pcidevs lock.

> > --- a/xen/arch/x86/hvm/vmx/vmx.c
> > +++ b/xen/arch/x86/hvm/vmx/vmx.c
> > @@ -413,7 +413,7 @@ static int cf_check vmx_pi_update_irte(const struct vcpu *v,
> >  
> >      spin_unlock_irq(&desc->lock);
> >  
> > -    ASSERT(pcidevs_locked());
> > +    ASSERT(pcidevs_locked() || rw_is_locked(&msi_desc->dev->domain->pci_lock));
> >  
> >      return iommu_update_ire_from_msi(msi_desc, &msi_desc->msg);
> 
> This then falls in the same category. And apparently there are more.

This one is again a result of such function being called from
pt_irq_create_bind() from vPCI code that has been switched to use the
per-domain pci_lock.

IOMMU state is already protected by it's own internal locks, and
doesn't rely on pcidevs lock.  Hence I can also only guess that the
usage here is to prevent the device from being removed.

Regards, Roger.

