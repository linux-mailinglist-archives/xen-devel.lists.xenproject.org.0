Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3634C01A9
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 19:53:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277144.473581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMaH9-0005xS-22; Tue, 22 Feb 2022 18:52:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277144.473581; Tue, 22 Feb 2022 18:52:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMaH8-0005vD-VP; Tue, 22 Feb 2022 18:52:38 +0000
Received: by outflank-mailman (input) for mailman id 277144;
 Tue, 22 Feb 2022 18:52:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lqcG=TF=wind.enjellic.com=greg@srs-se1.protection.inumbo.net>)
 id 1nMaH7-0005v7-AO
 for xen-devel@lists.xen.org; Tue, 22 Feb 2022 18:52:37 +0000
Received: from wind.enjellic.com (wind.enjellic.com [76.10.64.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 97730dc9-9410-11ec-8539-5f4723681683;
 Tue, 22 Feb 2022 19:52:33 +0100 (CET)
Received: from wind.enjellic.com (localhost [127.0.0.1])
 by wind.enjellic.com (8.15.2/8.15.2) with ESMTP id 21MIqVOD015731;
 Tue, 22 Feb 2022 12:52:31 -0600
Received: (from greg@localhost)
 by wind.enjellic.com (8.15.2/8.15.2/Submit) id 21MIqUfg015730;
 Tue, 22 Feb 2022 12:52:30 -0600
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
X-Inumbo-ID: 97730dc9-9410-11ec-8539-5f4723681683
Date: Tue, 22 Feb 2022 12:52:30 -0600
From: "Dr. Greg" <greg@enjellic.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xen.org
Subject: Re: IGD pass-through failures since 4.10.
Message-ID: <20220222185230.GA15532@wind.enjellic.com>
Reply-To: "Dr. Greg" <greg@enjellic.com>
References: <20220214060011.GA24404@wind.enjellic.com> <198ef291-4dee-ddac-aef6-8451bc1e880c@suse.com> <20220217201534.GA29303@wind.enjellic.com> <dc1a4483-7dca-aa72-6b86-4217e6840efb@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc1a4483-7dca-aa72-6b86-4217e6840efb@suse.com>
User-Agent: Mutt/1.4i
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.2.3 (wind.enjellic.com [127.0.0.1]); Tue, 22 Feb 2022 12:52:31 -0600 (CST)

On Fri, Feb 18, 2022 at 08:04:14AM +0100, Jan Beulich wrote:

Good morning, I hope the week is advancing well for everyone.

> On 17.02.2022 21:15, Dr. Greg wrote:
> > On Mon, Feb 14, 2022 at 09:56:34AM +0100, Jan Beulich wrote:
> >> On 14.02.2022 07:00, Dr. Greg wrote:
> >>> It appears to be a problem with mapping interrupts back to dom0 given
> >>> that we see the following:
> >>>
> >>> Feb 10 08:16:05 hostname kernel: xhci_hcd 0000:00:14.0: xen map irq failed -19 for 32752 domain
> >>>
> >>> Feb 10 08:16:05 hostname kernel: i915 0000:00:02.0: xen map irq failed -19 for 32752 domain
> >>>
> >>> Feb 10 08:16:12 hostname kernel: xhci_hcd 0000:00:14.0: Error while assigning device slot ID
> > 
> >> Just on this one aspect: It depends a lot what precisely you've used
> >> as 4.10 before. Was this the plain 4.10.4 release, or did you track
> >> the stable branch, accumulating security fixes?
> > 
> > It was based on the Xen GIT tree with a small number of modifications
> > that had been implemented by Intel to support their IGD
> > virtualization.
> > 
> > We did not end up using 'IGD virtualization', for a number of
> > technical reasons, instead we reverted back to using straight device
> > passthrough with qemu-traditional that we had previously been using.
> > 
> > If it would up being useful, we could come up with a diff between the
> > stock 4.10.4 tag and the codebase we used.
> > 
> > One of the purposes of the infrastructure upgrade was to try and get
> > on a completely mainline Xen source tree.

> Depending on the size of the diff, this may or may not be helpful.
> What you sadly didn't state is at least the precise base version.

The stack that is in use is 18 patches beyond what is tagged as the
Xen 4.10 release.

I can generate the diff but most of the patches appear to be
infrastructure changes to support the VGT virtual display devices.

> >> would suspect device quarantining to get getting in your way. In
> >> which case it would be relevant to know what exactly "re-attach to
> >> the Dom0" means in your case.
> > 
> > Re-attach to Dom0 means to unbind the device from the pciback driver
> > and then bind the device to its original driver.  In the logs noted
> > above, the xhci_hcd driver to the USB controller and the i915 driver
> > to the IGD hardware.
> > 
> > It is the same strategy, same script actually, that we have been using
> > for 8+ years.

> Right, but in the meantime quarantining has appeared. That wasn't
> intended to break "traditional" usage, but ...

We just finished testing the 4.15.2 release and we got one successful
execution of the Windows VM under qemu-traditional.  We still have not
gotten the VM to boot and run under upstream qemu.

Testing the upstream qemu version has resulted in the VM not wanting
to boot under anything at this point.  We are now getting a VIDEO_TDR
error out of Windows and are trying to untangle that.

> > In the case of the logs above, the following command sequence is being
> > executed upon termination of the domain:
> > 
> > # Unbind devices.
> > echo 0000:00:14.0 >| /sys/bus/pci/drivers/pciback/unbind
> > echo 0000:00:02.0 >| /sys/bus/pci/drivers/pciback/unbind
> > 
> > # Rebind devices.
> > echo 0000:00:14.0 >| /sys/bus/pci/drivers/xhci_hcd/bind
> > echo 0000:00:02.0 >| /sys/bus/pci/drivers/i915/bind

> ... you may still want to try replacing these with
> "xl pci-assignable-add ..." / "xl pci-assignable-remove ...".

We tested using the 'xl pci-assignable-add/remove' sequences and we
believe this may have resulted in the proper return of the devices to
dom0 but haven't been able to verify that since the Windows VM is now
throwing the VIDEO_TDR error.

Unless we are misunderstanding something the 'xl
pci-assignable-remove' sequence requires the manual re-binding of the
devices to their dom0 drivers.

This seems a bit odd given that the 'xl pci-assignable-add' invocation
on a device that does not have a driver gives an indication that no
driver was found and the device would not be re-bound to its driver.

This needs a bit more testing after we get the basic VM implementation
running once again.

> > Starting with the stock 4.11.4 release, the Dom0 re-attachment fails
> > with the 'xen_map_irq' failures being logged.
> > 
> >> Which brings me to this more general remark: What you describe sounds
> >> like a number of possibly independent problems. I'm afraid it'll be
> >> difficult for anyone to help without you drilling further down into
> >> what lower level operations are actually causing trouble. It also feels
> >> as if things may have ended up working for you on 4.10 just by
> >> chance.
> > 
> > I think the issue comes down to something that the hypervisor does, on
> > behalf of the domain doing the passthrough, as part of whatever
> > qemu-traditional needs to do in order to facilitate the attachment of
> > the PCI devices to the domain.
> > 
> > Running the detach/re-attach operation works perfectly in absence of
> > qemu-traditional being started in the domain.  The failure to
> > re-attach only occurs after qemu-traditional has been run in the
> > domain.

> Interesting. This suggests missing cleanup somewhere in the course
> of tearing down assignment to the DomU. Without full (and full
> verbosity) logs there's unlikely to be a way forward. Even the
> there's no promise that the logs would have useful data.

As soon as we the VM running again we will deploy a debug enabled
hypervisor.

> Of course with qemu-trad now being neither security supported nor
> recommended to use, you will want (need) to look into moving to
> upstream qemu anyway, trying to deal with problems there instead.

We have had virtually no luck whatsoever with upstream qemu at this
point, all the way from 4.10 forward to 4.15 at this point.

There are a host of PCI options in the XL configuration file that may
be impacting this but we have not yet to find any good references on
this.

> >> I'm sorry that I'm not really of any help here,
> > 
> > Actually your reflections have been helpful.
> > 
> > Perhaps the most important clarification that we could get, for posterity
> > in this thread, is whether or not IGD pass-through is actually
> > supported in the mind of the Xen team.
> > 
> > According to the Xen web-site, IGD PCI pass-through is documented as
> > working with the following combinations:
> > 
> > Xen 4.11.x: QEMU >= 3.1
> > 
> > Xen 4.14.x: QEMU >= 5.2
> > 
> > We are currently having IGD pass-through with qemu-dm (3.1/5.2) fail
> > completely in those combinations.

> I wonder on what basis these statements were added.

I don't know but you can find them at the following URL:

https://wiki.xenproject.org/wiki/Xen_VGA_Passthrough

Under the following heading.

'Status of VGA graphics passthru in Xen'

The section is quite prescriptive with respect to what is supposed to
work.

That document gave us the impression that we would be on solid ground
moving to more recent versions of the stack including upstream QEMU
but that currently has not been our experience.

Unfortunately we are now in a position where testing seems to have
resulted in a virtual machine that no longer works on the 4.10.x
stack.... :-(

> Jan

Have a good day.

Dr. Greg

As always,
Dr. G.W. Wettstein, Ph.D.   Enjellic Systems Development, LLC.
4206 N. 19th Ave.           Specializing in information infra-structure
Fargo, ND  58102            development.
PH: 701-281-1686            EMAIL: greg@enjellic.com
------------------------------------------------------------------------------
"On the other hand, the Linux philosophy is 'laugh in the face of
 danger'.  Oops.  Wrong one.  'Do it yourself'.  Thats it."
                                -- Linus Torvalds

