Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B59C522ABF6
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jul 2020 11:52:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyXtN-0003xG-Nq; Thu, 23 Jul 2020 09:51:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j4k2=BC=h08.hostsharing.net=foo00@srs-us1.protection.inumbo.net>)
 id 1jyXtM-0003xB-7a
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 09:51:56 +0000
X-Inumbo-ID: 2354592e-ccca-11ea-86eb-bc764e2007e4
Received: from bmailout1.hostsharing.net (unknown [83.223.95.100])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2354592e-ccca-11ea-86eb-bc764e2007e4;
 Thu, 23 Jul 2020 09:51:54 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net
 [IPv6:2a01:37:1000::53df:5f1c:0])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.hostsharing.net",
 Issuer "COMODO RSA Domain Validation Secure Server CA" (not verified))
 by bmailout1.hostsharing.net (Postfix) with ESMTPS id AF329300011A0;
 Thu, 23 Jul 2020 11:51:52 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id 68E6B36272; Thu, 23 Jul 2020 11:51:52 +0200 (CEST)
Date: Thu, 23 Jul 2020 11:51:52 +0200
From: Lukas Wunner <lukas@wunner.de>
To: kernel test robot <lkp@intel.com>
Subject: Re: [PCI] 3233e41d3e:
 WARNING:at_drivers/pci/pci.c:#pci_reset_hotplug_slot
Message-ID: <20200723095152.nf3fmfzrjlpoi35h@wunner.de>
References: <908047f7699d9de9ec2efd6b79aa752d73dab4b6.1595329748.git.lukas@wunner.de>
 <20200723091305.GJ19262@shao2-debian>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200723091305.GJ19262@shao2-debian>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: Juergen Gross <jgross@suse.com>, Derek Chickles <dchickles@marvell.com>,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, linux-pci@vger.kernel.org,
 Satanand Burla <sburla@marvell.com>, Cornelia Huck <cohuck@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>, Felix Manlunas <fmanlunas@marvell.com>,
 Keith Busch <kbusch@kernel.org>, Alex Williamson <alex.williamson@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Govinda Tatti <govinda.tatti@oracle.com>, lkp@lists.01.org,
 Rick Farrington <ricardo.farrington@cavium.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Michael Haeuptle <michael.haeuptle@hpe.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Ian May <ian.may@canonical.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Jul 23, 2020 at 05:13:06PM +0800, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-9):
[...]
> commit: 3233e41d3e8ebcd44e92da47ffed97fd49b84278 ("[PATCH] PCI: pciehp: Fix AB-BA deadlock between reset_lock and device_lock")
[...]
> caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):
> [    0.971752] WARNING: CPU: 0 PID: 1 at drivers/pci/pci.c:4905 pci_reset_hotplug_slot+0x70/0x80

Thank you, trusty robot.

I botched the call to lockdep_assert_held_write(), it should have been
conditional on "if (probe)".

Happy to respin the patch, but I'd like to hear opinions on the locking
issues surrounding xen and octeon (and the patch in general).

In particular, would a solution be entertained wherein the pci_dev is
reset by the PCI core after driver unbinding, contingent on a flag which
is set by a PCI driver to indicate that the pci_dev is returned to the
core in an unclean state?

Also, why does xen require a device reset on bind?

Thanks!

Lukas

