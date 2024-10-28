Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3539B384A
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 18:54:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826927.1241382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5Tw9-00028o-Rx; Mon, 28 Oct 2024 17:53:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826927.1241382; Mon, 28 Oct 2024 17:53:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5Tw9-00025g-P7; Mon, 28 Oct 2024 17:53:53 +0000
Received: by outflank-mailman (input) for mailman id 826927;
 Mon, 28 Oct 2024 17:53:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=owpo=RY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t5Tw8-00025a-1f
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 17:53:52 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96b403f9-9555-11ef-a0c2-8be0dac302b0;
 Mon, 28 Oct 2024 18:53:50 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5c984352742so5080179a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 10:53:50 -0700 (PDT)
Received: from localhost ([213.195.115.182]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1f298dfcsm395051366b.127.2024.10.28.10.53.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 10:53:49 -0700 (PDT)
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
X-Inumbo-ID: 96b403f9-9555-11ef-a0c2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730138030; x=1730742830; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DS70Cmtp5Y1Fg8qeoAQYkAxwuzEI7WvkRwuV3OTMcZU=;
        b=jYBMR+65K5swD2VhmbiX7fXqqn2Ww+8Da3oURNfpyln26Wk6uA0OcTjXaXWT6C09fb
         jAR3HwOJOv55FkWGBPfc9MhUK+uYmfh5F2E+dfnkfs9w34KuSqz0l9fVm9CWMSAeLYwX
         k0xcggumNhckkQxjpGxPCXS62YKspTc4qQ7gI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730138030; x=1730742830;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DS70Cmtp5Y1Fg8qeoAQYkAxwuzEI7WvkRwuV3OTMcZU=;
        b=HSPNQgqx/XRb9upG+v/D/lTHs4SogUfaeoKKnhOmlt5HAhDLvfGo98GR2MGPERuY7/
         Ig3XrbPQL9dmX0/YXXhumuOur1oU4ZIh3Sb6QA+OVpvxHv3LnpmHk0mTL4JCYjPUHVeJ
         cbkJg2px03shsY34gPYcK4pxC6jLj8+uSuES9o4TOGibvTfP/jd7rDS1mNgrbkpeNICP
         yRifWPNJ5EtOCnl80yEb5lsnCuJWeW61XFH/L3QCNMpw1dRe/ERXe3f9LHJfPWeMiEuF
         hDUMbG/9RwCK3iADS+19m5OTANdkt/T9nxXpVWwOwkNKuWDnCdD2mtxNc+lmcxLr/+CV
         i9gQ==
X-Forwarded-Encrypted: i=1; AJvYcCVy2Q/MW6WZ/MblbtEHxEifXdaUtrNpwRJO0nvkjoKUyHX5gKuuRMlvkCOB6BRBb3GHJchiQ1Jd7K4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz4Wfw9ZGVJepkk/bZCd5dD8mbJmCZi2fDRiRRZMpsehEAXwopU
	1829mH85lYF4dx6sJdjvJnYlupnDgjznhd42NUFozG4VXdzD/GK7PJ/KZBNHGgU=
X-Google-Smtp-Source: AGHT+IG4lYDu8qpraI80iUxnH3EVxo26+Dr8s62Rp39aGf57QQ6Ox1kx1P6hl/qUF5YZsqODdqFOSg==
X-Received: by 2002:a17:907:96a9:b0:a9a:a88a:466c with SMTP id a640c23a62f3a-a9de632e59emr859556966b.61.1730138029897;
        Mon, 28 Oct 2024 10:53:49 -0700 (PDT)
Date: Mon, 28 Oct 2024 18:53:48 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 1/3] x86/msi: harden stale pdev handling
Message-ID: <Zx_PrF9_ITzfcCcI@macbook>
References: <20241018203913.1162962-1-stewart.hildebrand@amd.com>
 <20241018203913.1162962-2-stewart.hildebrand@amd.com>
 <fdb156eb-ea82-4afa-afa6-105e605eba6d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fdb156eb-ea82-4afa-afa6-105e605eba6d@suse.com>

On Mon, Oct 28, 2024 at 05:58:28PM +0100, Jan Beulich wrote:
> On 18.10.2024 22:39, Stewart Hildebrand wrote:
> > Dom0 normally informs Xen of PCI device removal via
> > PHYSDEVOP_pci_device_remove, e.g. in response to SR-IOV disable or
> > hot-unplug. We might find ourselves with stale pdevs if a buggy dom0
> > fails to report removal via PHYSDEVOP_pci_device_remove. In this case,
> > attempts to access the config space of the stale pdevs would be invalid
> > and return all 1s.
> > 
> > Some possible conditions leading to this are:
> > 
> > 1. Dom0 disables SR-IOV without reporting VF removal to Xen.
> > 
> > The Linux SR-IOV subsystem normally reports VF removal when a PF driver
> > disables SR-IOV. In case of a buggy dom0 SR-IOV subsystem, SR-IOV could
> > become disabled with stale dangling VF pdevs in both dom0 Linux and Xen.
> > 
> > 2. Dom0 reporting PF removal without reporting VF removal.
> > 
> > During SR-IOV PF removal (hot-unplug), a buggy PF driver may fail to
> > disable SR-IOV, thus failing to remove the VFs, leaving stale dangling
> > VFs behind in both Xen and Linux. At least Linux warns in this case:
> > 
> > [  100.000000]  0000:01:00.0: driver left SR-IOV enabled after remove
> > 
> > In either case, Xen is left with stale VF pdevs, risking invalid PCI
> > config space accesses.
> > 
> > When Xen is built with CONFIG_DEBUG=y, the following Xen crashes were
> > observed when dom0 attempted to access the config space of a stale VF:
> > 
> > (XEN) Assertion 'pos' failed at arch/x86/msi.c:1274
> > (XEN) ----[ Xen-4.20-unstable  x86_64  debug=y  Tainted:   C    ]----
> > ...
> > (XEN) Xen call trace:
> > (XEN)    [<ffff82d040346834>] R pci_msi_conf_write_intercept+0xa2/0x1de
> > (XEN)    [<ffff82d04035d6b4>] F pci_conf_write_intercept+0x68/0x78
> > (XEN)    [<ffff82d0403264e5>] F arch/x86/pv/emul-priv-op.c#pci_cfg_ok+0xa0/0x114
> > (XEN)    [<ffff82d04032660e>] F arch/x86/pv/emul-priv-op.c#guest_io_write+0xb5/0x1c8
> > (XEN)    [<ffff82d0403267bb>] F arch/x86/pv/emul-priv-op.c#write_io+0x9a/0xe0
> > (XEN)    [<ffff82d04037c77a>] F x86_emulate+0x100e5/0x25f1e
> > (XEN)    [<ffff82d0403941a8>] F x86_emulate_wrapper+0x29/0x64
> > (XEN)    [<ffff82d04032802b>] F pv_emulate_privileged_op+0x12e/0x217
> > (XEN)    [<ffff82d040369f12>] F do_general_protection+0xc2/0x1b8
> > (XEN)    [<ffff82d040201aa7>] F x86_64/entry.S#handle_exception_saved+0x2b/0x8c
> > 
> > (XEN) Assertion 'pos' failed at arch/x86/msi.c:1246
> > (XEN) ----[ Xen-4.20-unstable  x86_64  debug=y  Tainted:   C    ]----
> > ...
> > (XEN) Xen call trace:
> > (XEN)    [<ffff82d040346b0a>] R pci_reset_msix_state+0x47/0x50
> > (XEN)    [<ffff82d040287eec>] F pdev_msix_assign+0x19/0x35
> > (XEN)    [<ffff82d040286184>] F drivers/passthrough/pci.c#assign_device+0x181/0x471
> > (XEN)    [<ffff82d040287c36>] F iommu_do_pci_domctl+0x248/0x2ec
> > (XEN)    [<ffff82d040284e1f>] F iommu_do_domctl+0x26/0x44
> > (XEN)    [<ffff82d0402483b8>] F do_domctl+0x8c1/0x1660
> > (XEN)    [<ffff82d04032977e>] F pv_hypercall+0x5ce/0x6af
> > (XEN)    [<ffff82d0402012d3>] F lstar_enter+0x143/0x150
> > 
> > These ASSERTs triggered because the MSI-X capability position can't be
> > found for a stale pdev.
> > 
> > Latch the capability positions of MSI and MSI-X during device init, and
> > replace instances of pci_find_cap_offset(..., PCI_CAP_ID_MSI{,X}) with
> > the stored value. Introduce one additional ASSERT, while the two
> > existing ASSERTs in question continue to work as intended, even with a
> > stale pdev.
> > 
> > Fixes: 484d7c852e4f ("x86/MSI-X: track host and guest mask-all requests separately")
> > Fixes: 575e18d54d19 ("pci: clear {host/guest}_maskall field on assign")
> > Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> Looks largely okay to me now, just two type selection aspects:
> 
> > --- a/xen/arch/x86/msi.c
> > +++ b/xen/arch/x86/msi.c
> > @@ -278,23 +278,21 @@ void __msi_set_enable(u16 seg, u8 bus, u8 slot, u8 func, int pos, int enable)
> >  
> >  static void msi_set_enable(struct pci_dev *dev, int enable)
> >  {
> > -    int pos;
> > +    int pos = dev->msi_pos;
> 
> This and ...
> 
> >      u16 seg = dev->seg;
> >      u8 bus = dev->bus;
> >      u8 slot = PCI_SLOT(dev->devfn);
> >      u8 func = PCI_FUNC(dev->devfn);
> >  
> > -    pos = pci_find_cap_offset(dev->sbdf, PCI_CAP_ID_MSI);
> >      if ( pos )
> >          __msi_set_enable(seg, bus, slot, func, pos, enable);
> >  }
> >  
> >  static void msix_set_enable(struct pci_dev *dev, int enable)
> >  {
> > -    int pos;
> > +    int pos = dev->msix_pos;
> 
> ... this want to become unsigned int at this occasion, imo. Like we have ...
> 
> > @@ -764,7 +762,7 @@ static int msix_capability_init(struct pci_dev *dev,
> >      u8 slot = PCI_SLOT(dev->devfn);
> >      u8 func = PCI_FUNC(dev->devfn);
> >      bool maskall = msix->host_maskall, zap_on_error = false;
> > -    unsigned int pos = pci_find_cap_offset(dev->sbdf, PCI_CAP_ID_MSIX);
> > +    unsigned int pos = dev->msix_pos;
> 
> ... e.g. here already.
> 
> > --- a/xen/include/xen/pci.h
> > +++ b/xen/include/xen/pci.h
> > @@ -113,6 +113,9 @@ struct pci_dev {
> >          pci_sbdf_t sbdf;
> >      };
> >  
> > +    unsigned int msi_pos;
> > +    unsigned int msix_pos;
> > +
> >      uint8_t msi_maxvec;
> >      uint8_t phantom_stride;
> 
> As can be seen from the subsequent members, we're trying to be space
> conserving here. Both fields won't require more than 8 bits, so uint8_t
> or unsigned char would be the better type to use. Again imo. Preferably
> with those adjustments (which could likely be done while committing)
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

uint8_t would seem preferable here, as it's fixed-size width clearly
related to the offset into the PCI configuration space for a device.

It might also be worth noting in the commit message that having the
position cached should be a small perf improvement, by not having to
walk the capability list each time.

Anyway, no strong opinion about the commit message adjustment, so with
the type changed:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

