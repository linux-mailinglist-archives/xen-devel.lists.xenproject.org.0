Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B40AD77C2
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 18:14:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1013269.1391778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPkYs-0003og-Oa; Thu, 12 Jun 2025 16:13:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1013269.1391778; Thu, 12 Jun 2025 16:13:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPkYs-0003mx-Lh; Thu, 12 Jun 2025 16:13:54 +0000
Received: by outflank-mailman (input) for mailman id 1013269;
 Thu, 12 Jun 2025 16:13:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uPkYq-0003mr-Un
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 16:13:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uPkYp-00FWFX-27;
 Thu, 12 Jun 2025 16:13:51 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uPkYp-003geS-06;
 Thu, 12 Jun 2025 16:13:51 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=pkwJg1Z7WP8ceKiFmJPtTot2/IJTJqUJPo/zaZ1Avlg=; b=b9Y6QPnDqIdCQN1/qrvFCsgUI+
	UI7b/kBmdLZ8VLNIjqFO5/9gIFBLMMXRyjJsE+jfE2YQCoKyPOqq3L8fcQZqHvVNcWnURtfjT+Rk3
	EytdmY9yC73mQ2p58uz6kFUxi/klGbsFfx4zlGYBOZQolJ1feM9hxy3hJHyvGfSILg+w=;
Date: Thu, 12 Jun 2025 18:13:48 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Anthoine Bourgeois <anthoine.bourgeois@vates.tech>
Subject: Re: [PATCH v4] x86/hvmloader: select xenpci MMIO BAR UC or WB MTRR
 cache attribute
Message-ID: <aEr8vGYeEDmmm2B6@l14>
References: <20250610162930.89055-1-roger.pau@citrix.com>
 <aEm8LuDrNBqjgaWF@l14>
 <aErqkcLYqTkykpp5@macbook.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aErqkcLYqTkykpp5@macbook.local>

On Thu, Jun 12, 2025 at 04:56:17PM +0200, Roger Pau Monné wrote:
> On Wed, Jun 11, 2025 at 07:26:06PM +0200, Anthony PERARD wrote:
> > On Tue, Jun 10, 2025 at 06:29:30PM +0200, Roger Pau Monne wrote:
> > > diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> > > index c388899306c2..ddbff6fffc16 100644
> > > --- a/docs/man/xl.cfg.5.pod.in
> > > +++ b/docs/man/xl.cfg.5.pod.in
> > > @@ -2351,6 +2351,14 @@ Windows L<https://xenproject.org/windows-pv-drivers/>.
> > >  Setting B<xen_platform_pci=0> with the default device_model "qemu-xen"
> > >  requires at least QEMU 1.6.
> > >  
> > > +
> > > +=item B<xenpci_bar_uc=BOOLEAN>
> > > +
> > > +B<x86 only:> Select whether the memory BAR of the Xen PCI device should have
> > > +uncacheable (UC) cache attribute set in MTRR.
> > 
> > For information, here are different name used for this pci device:
> > 
> > - man xl.cfg:
> >     xen_platform_pci=<bool>
> >         Xen platform PCI device
> > - QEMU:
> >     -device xen-platform
> >     in comments: XEN platform pci device
> >     with pci device-id PCI_DEVICE_ID_XEN_PLATFORM
> > - EDK2 / OVMF:
> >     XenIoPci
> >         described virtual Xen PCI device
> >         But XenIo is a generic protocol in EDK2
> >     Before XenIo, the pci device would be linked to XenBus, and
> >     loaded with PCI_DEVICE_ID_XEN_PLATFORM
> > - Linux:
> >     Seems to be called "xen-platform-pci"
> > 
> > Overall, this PCI device is mostly referenced as the Xen Platform PCI
> > device. So "xenpci" or "Xen PCI device" is surprising to me, and I'm not
> > quite sure what it is.
> 
> I can do xen_platform_pci_bar_uc, but it seems a bit long.

I don't think it matter much how long it is, it is just a word that is
surly copy-past from the man page. What I think matter more is that it's
descriptive enough and match the existing option name for the same
device, which is "xen_platform_pci".

> > > +    /* Select the MTRR cache attribute of the xenpci device BAR. */
> > > +    bool xenpci_bar_uc = false;
> > 
> > This default value for `xenpci_bar_uc` mean that hvmloader changes
> > behavior compared to previous version, right? Shouldn't we instead have
> > hvmloader keep the same behavior unless the toolstack want to use the
> > new behavior? (Like it's done for `allow_memory_relocate`,
> > "platform/mmio_hole_size")
> > 
> > It would just mean that toolstack other than `xl` won't be surprised by
> > a change of behavior.
> 
> My plan was that we didn't need changes to XAPI to implement this new
> mode, but given the comment I will change to keep the previous
> behavior in absence of a xenstore node.

Why would guests created with XAPI get the new behavior, but guest
created with libxl have to stick with the old one?

I do like that there's an option for libxl to choose between the old and
new behavior, and allow to revert in case someone got an issue for a
particular guest, but otherwise, it is probably better to have the same
default for both XAPI and libxl.

> > > @@ -271,6 +279,44 @@ void pci_setup(void)
> > >              if ( bar_sz == 0 )
> > >                  continue;
> > >  
> > > +            if ( !xenpci_bar_uc &&
> > > +                 ((bar_data & PCI_BASE_ADDRESS_SPACE) ==
> > > +                   PCI_BASE_ADDRESS_SPACE_MEMORY) &&
> > > +                 vendor_id == 0x5853 &&
> > > +                 (device_id == 0x0001 || device_id == 0x0002) )
> > 
> > We don't have defines for 0x5853 in the tree (and those device_id)?
> > Maybe introduce at least one for the vendor_id:
> > 
> > These two names are use by QEMU, OVMF, Linux, for example.
> > 
> > #define PCI_VENDOR_ID_XEN           0x5853
> > #define PCI_DEVICE_ID_XEN_PLATFORM  0x0001
> > 
> > There's even PCI_DEVICE_ID_XEN_PLATFORM_XS61 in Linux
> 
> You mean in the public headers?
> 
> For Device IDs we have ranges allocated to downstream vendors, I'm not
> sure we want to keep track of whatever IDs they use for their devices.
> OTOH, not tracking those IDs here means OSes are likely to miss
> additions of new Xen platform PCI devices?
> 
> I could introduce public/pci.h to contain those IDs, but I would like
> consensus on what should be there, otherwise this patch will get
> stuck.

I guess, just start with adding the vendor_id define in this same file
(pci.c), that would be a good start, it would give a name to an
otherwise magic number.
Reading `vendor_id == PCI_VENDOR_ID_XEN` is better than reading
`vendor_id == 0x5853`.

If for some reason, we want to use the value in a different part of the
repo, we could introduce or edit a common header and move the define
there.

For the device ids, using a define is less of a need, we would at least
know we have a condition on Xen specific PCI device.

This patch is only about a single device, isn't speaking about ID of
other device a bit out of scope? And anyway, there's already a document
about those, that is "xen-pci-device-reservations.7.pod".

Thanks,

-- 
Anthony PERARD

