Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEBC26379C
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 22:42:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kG6u7-0002dT-FB; Wed, 09 Sep 2020 20:41:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N8Zw=CS=kernel.org=helgaas@srs-us1.protection.inumbo.net>)
 id 1kG6u6-0002dO-7r
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 20:41:18 +0000
X-Inumbo-ID: f6d0faa5-af85-4dd1-aec8-28ff4c508ce1
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f6d0faa5-af85-4dd1-aec8-28ff4c508ce1;
 Wed, 09 Sep 2020 20:41:00 +0000 (UTC)
Received: from localhost (52.sub-72-107-123.myvzw.com [72.107.123.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E5C4B2064B;
 Wed,  9 Sep 2020 20:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599684059;
 bh=XYTJIX+UX5+9hkTZ1JmQGWBSE1wnXfxEBbc2SLTvbLI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=doAj1CwRVbRE50VuDa0NRPzX3puwcNhH10PkIoMJlZ7VDX3J9Cpv7+Xu8Str2rpMp
 Duyf5ETzvgvpOayzw8I6cdDNzZUgfA5LXZHANt1OAYXDMuRtnJeoYx6BVRCwrzTwl+
 +gjVdbDN5g3o6OLchOJSLhiZ4czH+k8PKVD1rqk0=
Date: Wed, 9 Sep 2020 15:40:57 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lukas Wunner <lukas@wunner.de>,
 Rick Farrington <ricardo.farrington@cavium.com>
Cc: kernel test robot <lkp@intel.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Michael Haeuptle <michael.haeuptle@hpe.com>,
 Ian May <ian.may@canonical.com>, Keith Busch <kbusch@kernel.org>,
 linux-pci@vger.kernel.org, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, Derek Chickles <dchickles@marvell.com>,
 Satanand Burla <sburla@marvell.com>,
 Felix Manlunas <fmanlunas@marvell.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Govinda Tatti <govinda.tatti@oracle.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 LKML <linux-kernel@vger.kernel.org>, lkp@lists.01.org
Subject: Re: [PCI] 3233e41d3e:
 WARNING:at_drivers/pci/pci.c:#pci_reset_hotplug_slot
Message-ID: <20200909204057.GA724236@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200723095152.nf3fmfzrjlpoi35h@wunner.de>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Jul 23, 2020 at 11:51:52AM +0200, Lukas Wunner wrote:
> On Thu, Jul 23, 2020 at 05:13:06PM +0800, kernel test robot wrote:
> > FYI, we noticed the following commit (built with gcc-9):
> [...]
> > commit: 3233e41d3e8ebcd44e92da47ffed97fd49b84278 ("[PATCH] PCI: pciehp: Fix AB-BA deadlock between reset_lock and device_lock")
> [...]
> > caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):
> > [    0.971752] WARNING: CPU: 0 PID: 1 at drivers/pci/pci.c:4905 pci_reset_hotplug_slot+0x70/0x80
> 
> Thank you, trusty robot.
> 
> I botched the call to lockdep_assert_held_write(), it should have been
> conditional on "if (probe)".
> 
> Happy to respin the patch, but I'd like to hear opinions on the locking
> issues surrounding xen and octeon (and the patch in general).

I wish liquidio/octeon weren't a special case.  Why should that driver
reset the device when unbinding when no other drivers do?

Looks like this was added by 70535350e26f ("liquidio: with embedded
f/w, don't reload f/w, issue pf flr at exit").  Maybe Rick will chime
in.

> In particular, would a solution be entertained wherein the pci_dev is
> reset by the PCI core after driver unbinding, contingent on a flag which
> is set by a PCI driver to indicate that the pci_dev is returned to the
> core in an unclean state?

How would we do this?  The PCI core isn't called after unbinding, is
it?  So I guess we'd have to have a queue and a worker thread to
process it?

Device removal also has nasty locking issues, and a queue might help
solve those, too.  Might also help in the problematic case of
40f11adc7cd9 ("PCI: Avoid race while enabling upstream bridges"),
which we had to revert.

> Also, why does xen require a device reset on bind?
> 
> Thanks!
> 
> Lukas

