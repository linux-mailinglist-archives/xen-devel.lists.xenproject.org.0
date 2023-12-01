Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1C3800662
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 09:58:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645368.1007509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8zLm-0001B9-46; Fri, 01 Dec 2023 08:58:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645368.1007509; Fri, 01 Dec 2023 08:58:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8zLm-00018B-12; Fri, 01 Dec 2023 08:58:18 +0000
Received: by outflank-mailman (input) for mailman id 645368;
 Fri, 01 Dec 2023 08:58:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2bjU=HM=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r8zLk-000185-Bg
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 08:58:16 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2f21ad8-9027-11ee-9b0f-b553b5be7939;
 Fri, 01 Dec 2023 09:58:14 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-50bccc2e3efso2335727e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 01 Dec 2023 00:58:14 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 je18-20020a05600c1f9200b003feea62440bsm4755865wmb.43.2023.12.01.00.58.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Dec 2023 00:58:13 -0800 (PST)
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
X-Inumbo-ID: c2f21ad8-9027-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701421094; x=1702025894; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UaHw1hjCR3NxnrQY1ARKmRXnyrSrOCItNMW6PUMuMF4=;
        b=nbdHi+FYCEeX042Ser+FzVwekkm6fattSd3sSt/Xe8+bpg3xqAZ5YSElVDl6+vQmSi
         Uzr+L4TGN2SdikGlr9k+m6Yc48aJuWEbnYv7o2Zc96cfPfW8//UlSUTGNwP9myax97zM
         4KPQcA08huAD4DrozuVb51u/tejY0U54rOgyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701421094; x=1702025894;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UaHw1hjCR3NxnrQY1ARKmRXnyrSrOCItNMW6PUMuMF4=;
        b=JZkuOwEjOBOEohsTDB1AckYg0RTtYP/I+BkD8cQOTiF3ikncRrq4PIXKWRYOiplO+H
         i1/b5ioB9l4HDvsXKRAszsOs7P+s6Uft7BTHwU0GKbZV2YqZBKSL+vDpmdQMNeEa8Yw4
         ShsNZtdyQuc8xINxNINTnrNQxU3siRcbCqPWVkm1caUA7QqjL/6Q9iPerxiefWTA5Z7g
         M1kRF4b0PqfQrhOblWhKLnahs/EqJr+JaGOu60nOKtvVDm/yFyoqwcxxVKeg5B3dS0Ne
         nR5rOSQr4/Gq27N5PaJykeWyqV61XYfK3M42eMeyOkvc0sL8T2Q2NiOHxtP81uSBXoX1
         c82A==
X-Gm-Message-State: AOJu0YxEWpsEd6m+np7vxFSxG1EtGIxjk1DGfYvBHSpTgn6DcvwHDX40
	mKECUdMLHz0evOZKwSRTUObSgA==
X-Google-Smtp-Source: AGHT+IE4OhisR8OsQM44A4vQh8aBYtvo29xgVaO+teORZibTRNUQH3H3JBaKP/eUBwb826QuHOJKcg==
X-Received: by 2002:a05:6512:31cd:b0:50b:d763:fe5f with SMTP id j13-20020a05651231cd00b0050bd763fe5fmr728578lfe.122.1701421093872;
        Fri, 01 Dec 2023 00:58:13 -0800 (PST)
Date: Fri, 1 Dec 2023 09:58:12 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jiqian Chen <Jiqian.Chen@amd.com>, Juergen Gross <jgross@suse.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	Stefano Stabellini <stefano.stabellini@amd.com>,
	Alex Deucher <Alexander.Deucher@amd.com>,
	Christian Koenig <Christian.Koenig@amd.com>,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Honglei Huang <Honglei1.Huang@amd.com>,
	Julia Zhang <Julia.Zhang@amd.com>, Huang Rui <Ray.Huang@amd.com>
Subject: Re: [RFC KERNEL PATCH v2 2/3] xen/pvh: Unmask irq for passthrough
 device in PVH dom0
Message-ID: <ZWmgJNidFsfkDp7q@macbook>
References: <20231124103123.3263471-1-Jiqian.Chen@amd.com>
 <20231124103123.3263471-3-Jiqian.Chen@amd.com>
 <alpine.DEB.2.22.394.2311291950350.3533093@ubuntu-linux-20-04-desktop>
 <ZWiyBP4Lzz5lXraP@macbook>
 <alpine.DEB.2.22.394.2311301912350.110490@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2311301912350.110490@ubuntu-linux-20-04-desktop>

On Thu, Nov 30, 2023 at 07:15:17PM -0800, Stefano Stabellini wrote:
> On Thu, 30 Nov 2023, Roger Pau Monné wrote:
> > On Wed, Nov 29, 2023 at 07:53:59PM -0800, Stefano Stabellini wrote:
> > > On Fri, 24 Nov 2023, Jiqian Chen wrote:
> > > > This patch is to solve two problems we encountered when we try to
> > > > passthrough a device to hvm domU base on Xen PVH dom0.
> > > > 
> > > > First, hvm guest will alloc a pirq and irq for a passthrough device
> > > > by using gsi, before that, the gsi must first has a mapping in dom0,
> > > > see Xen code pci_add_dm_done->xc_domain_irq_permission, it will call
> > > > into Xen and check whether dom0 has the mapping. See
> > > > XEN_DOMCTL_irq_permission->pirq_access_permitted, "current" is PVH
> > > > dom0 and it return irq is 0, and then return -EPERM.
> > > > This is because the passthrough device doesn't do PHYSDEVOP_map_pirq
> > > > when thay are enabled.
> > > > 
> > > > Second, in PVH dom0, the gsi of a passthrough device doesn't get
> > > > registered, but gsi must be configured for it to be able to be
> > > > mapped into a domU.
> > > > 
> > > > After searching codes, we can find map_pirq and register_gsi will be
> > > > done in function vioapic_write_redirent->vioapic_hwdom_map_gsi when
> > > > the gsi(aka ioapic's pin) is unmasked in PVH dom0. So the problems
> > > > can be conclude to that the gsi of a passthrough device doesn't be
> > > > unmasked.
> > > > 
> > > > To solve the unmaske problem, this patch call the unmask_irq when we
> > > > assign a device to be passthrough. So that the gsi can get registered
> > > > and mapped in PVH dom0.
> > > 
> > > 
> > > Roger, this seems to be more of a Xen issue than a Linux issue. Why do
> > > we need the unmask check in Xen? Couldn't we just do:
> > > 
> > > 
> > > diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
> > > index 4e40d3609a..df262a4a18 100644
> > > --- a/xen/arch/x86/hvm/vioapic.c
> > > +++ b/xen/arch/x86/hvm/vioapic.c
> > > @@ -287,7 +287,7 @@ static void vioapic_write_redirent(
> > >              hvm_dpci_eoi(d, gsi);
> > >      }
> > >  
> > > -    if ( is_hardware_domain(d) && unmasked )
> > > +    if ( is_hardware_domain(d) )
> > >      {
> > >          /*
> > >           * NB: don't call vioapic_hwdom_map_gsi while holding hvm.irq_lock
> > 
> > There are some issues with this approach.
> > 
> > mp_register_gsi() will only setup the trigger and polarity of the
> > IO-APIC pin once, so we do so once the guest unmask the pin in order
> > to assert that the configuration is the intended one.  A guest is
> > allowed to write all kind of nonsense stuff to the IO-APIC RTE, but
> > that doesn't take effect unless the pin is unmasked.
> > 
> > Overall the question would be whether we have any guarantees that
> > the hardware domain has properly configured the pin, even if it's not
> > using it itself (as it hasn't been unmasked).
> > 
> > IIRC PCI legacy interrupts are level triggered and low polarity, so we
> > could configure any pins that are not setup at bind time?
> 
> That could work.
> 
> Another idea is to move only the call to allocate_and_map_gsi_pirq at
> bind time? That might be enough to pass a pirq_access_permitted check.

Maybe, albeit that would change the behavior of XEN_DOMCTL_bind_pt_irq
just for PT_IRQ_TYPE_PCI and only when called from a PVH dom0 (as the
parameter would be a GSI instead of a previously mapped IRQ).  Such
difference just for PT_IRQ_TYPE_PCI is slightly weird - if we go that
route I would recommend that we instead introduce a new dmop that has
this syntax regardless of the domain type it's called from.

Thanks, Roger.

