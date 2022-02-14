Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A904B4246
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 08:00:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271197.465550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJVLE-0002A3-4p; Mon, 14 Feb 2022 07:00:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271197.465550; Mon, 14 Feb 2022 07:00:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJVLE-00027Q-1o; Mon, 14 Feb 2022 07:00:08 +0000
Received: by outflank-mailman (input) for mailman id 271197;
 Mon, 14 Feb 2022 07:00:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ur5s=S5=wind.enjellic.com=greg@srs-se1.protection.inumbo.net>)
 id 1nJVLC-00023A-U8
 for xen-devel@lists.xen.org; Mon, 14 Feb 2022 07:00:06 +0000
Received: from wind.enjellic.com (wind.enjellic.com [76.10.64.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id bc1ea17d-8d63-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 08:00:04 +0100 (CET)
Received: from wind.enjellic.com (localhost [127.0.0.1])
 by wind.enjellic.com (8.15.2/8.15.2) with ESMTP id 21E60CFD024972
 for <xen-devel@lists.xen.org>; Mon, 14 Feb 2022 00:00:12 -0600
Received: (from greg@localhost)
 by wind.enjellic.com (8.15.2/8.15.2/Submit) id 21E60BjV024971
 for xen-devel@lists.xen.org; Mon, 14 Feb 2022 00:00:11 -0600
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
X-Inumbo-ID: bc1ea17d-8d63-11ec-b215-9bbe72dcb22c
Date: Mon, 14 Feb 2022 00:00:11 -0600
From: "Dr. Greg" <greg@enjellic.com>
To: xen-devel@lists.xen.org
Subject: IGD pass-through failures since 4.10.
Message-ID: <20220214060011.GA24404@wind.enjellic.com>
Reply-To: "Dr. Greg" <greg@enjellic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.4i
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.2.3 (wind.enjellic.com [127.0.0.1]); Mon, 14 Feb 2022 00:00:12 -0600 (CST)

Good morning, I hope the week is starting well for everyone.

We've made extensive use of PCI based graphics pass through for many
years, since around Xen 4.2.  In fact, we maintained a set of patches
for ATI cards against qemu-traditional that have seen a lot of
downloads from our FTP site.

We ended up switching to IGD based graphics a couple of years ago and
built a stack on top of Xen 4.10 using qemu-traditional.  That
coincided with our transition from Windows 7 to Windows 10.

We've never enjoyed anywhere near the stability with IGD/Windows-10
that we had with the ATI/Windows-7 desktops, ie. we see fairly
frequent crashes, lockups, reduced performance etc.  The ATI/Windows-y
desktops were almost astonishingly reliable, ie. hundreds of
consecutive Windows VM boot/passthrough cycles.

In order to try and address this issue we set out to upgrade our
workstation infrastructure.  Unfortunately we haven't found anything
that has worked post 4.10.

To be precise, 4.11 with qemu-traditional works, but upon exit from
the virtual machine, to which the graphics adapter and USB controller
are passed through to, both the USB controller and the graphics
controller cannot be re-initialized and re-attached to the Dom0
instance.

It appears to be a problem with mapping interrupts back to dom0 given
that we see the following:

Feb 10 08:16:05 hostname kernel: xhci_hcd 0000:00:14.0: xen map irq failed -19 for 32752 domain

Feb 10 08:16:05 hostname kernel: i915 0000:00:02.0: xen map irq failed -19 for 32752 domain

Feb 10 08:16:12 hostname kernel: xhci_hcd 0000:00:14.0: Error while assigning device slot ID

At which point the monitor has green and block bars on it and the USB
controller doesn't function.

Upstream QEMU doesn't work at all, the qemu-system-i386 process fails
and is caught by xl and then tries to re-start the domain, which
remains dead to the world and has to be destroyed.

We revved up to the most current 4.14.x release, but that acts exactly
the same way that 4.11.x does.  We've built up the most recent 4.15.x
release, so that we would be testing the most current release that
still supports qemu-traditional, but haven't been able to get the
testing done yet.  Given our current experiences, I would be surpised
if it would work.

We've tentatively tracked the poor Windows 10 performance down to the
hypervisor emitting hundreds of thousands of IOMMU/DMA violations.  We
made those go away by disabling the IGD IOMMU but that doesn't fix the
problem with upstream QEMU being able to boot the Windows instance,
nor does it fix the problem with remapping the device interrupts back
to Dom0 on domain exit.

The 4.10 based stack had been running with 16 GIG of memory in the
DomU Windows instances.  Based on some online comments, we tested
guests with 4 GIG of RAM but that doesn't impact the issues we are
seeing.

We've tested with the most recent 5.4 and 5.10 Linux kernels but the
Dom0 kernel version doesn't seem to have any impact on the issues we
are seeing.

We'd be interested in any comments/suggestions the group may have.  We
have the in-house skills to do fairly significant investigations and
would like to improve the performance of IGD pass-through for other
users of what is fairly useful and ubiquitious (IGD) technology.

Have a good day.

Dr. Greg

As always,
Dr. Greg Wettstein, Ph.D, Worker      Autonomously self-defensive
Enjellic Systems Development, LLC     IOT platforms and edge devices.
4206 N. 19th Ave.
Fargo, ND  58102
PH: 701-281-1686                      EMAIL: dg@enjellic.com
------------------------------------------------------------------------------
"My thoughts on the composition and effectiveness of the advisory
 committee?

 I think they are destined to accomplish about the same thing as what
 you would get from locking 9 chimpanzees in a room with an armed
 thermonuclear weapon and a can opener with orders to disarm it."
                                -- Dr. Greg Wettstein
                                   Resurrection

