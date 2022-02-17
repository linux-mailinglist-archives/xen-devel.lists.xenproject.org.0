Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 032D64BAAAB
	for <lists+xen-devel@lfdr.de>; Thu, 17 Feb 2022 21:16:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275011.470711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKnBl-0007KB-N3; Thu, 17 Feb 2022 20:15:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275011.470711; Thu, 17 Feb 2022 20:15:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKnBl-0007H7-JE; Thu, 17 Feb 2022 20:15:41 +0000
Received: by outflank-mailman (input) for mailman id 275011;
 Thu, 17 Feb 2022 20:15:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K7LG=TA=wind.enjellic.com=greg@srs-se1.protection.inumbo.net>)
 id 1nKnBk-0007H1-QK
 for xen-devel@lists.xen.org; Thu, 17 Feb 2022 20:15:40 +0000
Received: from wind.enjellic.com (wind.enjellic.com [76.10.64.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 5dee8133-902e-11ec-8723-dd0c611c5f35;
 Thu, 17 Feb 2022 21:15:38 +0100 (CET)
Received: from wind.enjellic.com (localhost [127.0.0.1])
 by wind.enjellic.com (8.15.2/8.15.2) with ESMTP id 21HKFY7Z029544;
 Thu, 17 Feb 2022 14:15:34 -0600
Received: (from greg@localhost)
 by wind.enjellic.com (8.15.2/8.15.2/Submit) id 21HKFY8l029543;
 Thu, 17 Feb 2022 14:15:34 -0600
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
X-Inumbo-ID: 5dee8133-902e-11ec-8723-dd0c611c5f35
Date: Thu, 17 Feb 2022 14:15:34 -0600
From: "Dr. Greg" <greg@enjellic.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Dr. Greg" <greg@enjellic.com>, xen-devel@lists.xen.org
Subject: Re: IGD pass-through failures since 4.10.
Message-ID: <20220217201534.GA29303@wind.enjellic.com>
Reply-To: "Dr. Greg" <greg@enjellic.com>
References: <20220214060011.GA24404@wind.enjellic.com> <198ef291-4dee-ddac-aef6-8451bc1e880c@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Description: tgrregfiierifhrlngrgdjl
Content-Disposition: inline
In-Reply-To: <198ef291-4dee-ddac-aef6-8451bc1e880c@suse.com>
User-Agent: Mutt/1.4i
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.2.3 (wind.enjellic.com [127.0.0.1]); Thu, 17 Feb 2022 14:15:34 -0600 (CST)

On Mon, Feb 14, 2022 at 09:56:34AM +0100, Jan Beulich wrote:

Good morning, I hope the day is starting well for everyone, Jan thanks
for taking the time to reply.

> On 14.02.2022 07:00, Dr. Greg wrote:

> > It appears to be a problem with mapping interrupts back to dom0 given
> > that we see the following:
> > 
> > Feb 10 08:16:05 hostname kernel: xhci_hcd 0000:00:14.0: xen map irq failed -19 for 32752 domain
> > 
> > Feb 10 08:16:05 hostname kernel: i915 0000:00:02.0: xen map irq failed -19 for 32752 domain
> > 
> > Feb 10 08:16:12 hostname kernel: xhci_hcd 0000:00:14.0: Error while assigning device slot ID

> Just on this one aspect: It depends a lot what precisely you've used
> as 4.10 before. Was this the plain 4.10.4 release, or did you track
> the stable branch, accumulating security fixes?

It was based on the Xen GIT tree with a small number of modifications
that had been implemented by Intel to support their IGD
virtualization.

We did not end up using 'IGD virtualization', for a number of
technical reasons, instead we reverted back to using straight device
passthrough with qemu-traditional that we had previously been using.

If it would up being useful, we could come up with a diff between the
stock 4.10.4 tag and the codebase we used.

One of the purposes of the infrastructure upgrade was to try and get
on a completely mainline Xen source tree.

> would suspect device quarantining to get getting in your way. In
> which case it would be relevant to know what exactly "re-attach to
> the Dom0" means in your case.

Re-attach to Dom0 means to unbind the device from the pciback driver
and then bind the device to its original driver.  In the logs noted
above, the xhci_hcd driver to the USB controller and the i915 driver
to the IGD hardware.

It is the same strategy, same script actually, that we have been using
for 8+ years.

In the case of the logs above, the following command sequence is being
executed upon termination of the domain:

# Unbind devices.
echo 0000:00:14.0 >| /sys/bus/pci/drivers/pciback/unbind
echo 0000:00:02.0 >| /sys/bus/pci/drivers/pciback/unbind

# Rebind devices.
echo 0000:00:14.0 >| /sys/bus/pci/drivers/xhci_hcd/bind
echo 0000:00:02.0 >| /sys/bus/pci/drivers/i915/bind

Starting with the stock 4.11.4 release, the Dom0 re-attachment fails
with the 'xen_map_irq' failures being logged.

> Which brings me to this more general remark: What you describe sounds
> like a number of possibly independent problems. I'm afraid it'll be
> difficult for anyone to help without you drilling further down into
> what lower level operations are actually causing trouble. It also feels
> as if things may have ended up working for you on 4.10 just by
> chance.

I think the issue comes down to something that the hypervisor does, on
behalf of the domain doing the passthrough, as part of whatever
qemu-traditional needs to do in order to facilitate the attachment of
the PCI devices to the domain.

Running the detach/re-attach operation works perfectly in absence of
qemu-traditional being started in the domain.  The failure to
re-attach only occurs after qemu-traditional has been run in the
domain.

> I'm sorry that I'm not really of any help here,

Actually your reflections have been helpful.

Perhaps the most important clarification that we could get, for posterity
in this thread, is whether or not IGD pass-through is actually
supported in the mind of the Xen team.

According to the Xen web-site, IGD PCI pass-through is documented as
working with the following combinations:

Xen 4.11.x: QEMU >= 3.1

Xen 4.14.x: QEMU >= 5.2

We are currently having IGD pass-through with qemu-dm (3.1/5.2) fail
completely in those combinations.

Pass through with qemu-traditional works with 4.11.x but the
re-attachment fails.  On 4.14.x, execution of qemu-traditional is
failing secondary to some type of complaint about the inability to
determine the CPU type, which is some other issue that we haven't been
able to run down yet.

Those tests were done with builds from stock tagged releases in the
Xen GIT tree.

So it may be helpful to verify whether or not any of this is expected
to work, and if not, the Xen web-site would seem to need correction.

> Jan

Hopefully the following is helpful, I will be replying to Roger's
comments later.

Have a good day.

Dr. Greg

As always,
Dr. G.W. Wettstein, Ph.D.   Enjellic Systems Development, LLC.
4206 N. 19th Ave.           Specializing in information infra-structure
Fargo, ND  58102            development.
PH: 701-281-1686            EMAIL: greg@enjellic.com
------------------------------------------------------------------------------
"If your doing something the same way you have been doing it for ten years,
 the chances are you are doing it wrong."
                                -- Charles Kettering

