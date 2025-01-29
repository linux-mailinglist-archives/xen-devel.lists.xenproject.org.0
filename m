Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFFFA22442
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2025 19:48:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879290.1289508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdD72-0008SX-Cs; Wed, 29 Jan 2025 18:48:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879290.1289508; Wed, 29 Jan 2025 18:48:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdD72-0008Pu-AG; Wed, 29 Jan 2025 18:48:32 +0000
Received: by outflank-mailman (input) for mailman id 879290;
 Wed, 29 Jan 2025 18:48:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CGF7=UV=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1tdD71-0008Po-Ep
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2025 18:48:31 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a102a445-de71-11ef-99a4-01e77a169b0f;
 Wed, 29 Jan 2025 19:48:29 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 59D0AA41B5A;
 Wed, 29 Jan 2025 18:46:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1B5BC4CED1;
 Wed, 29 Jan 2025 18:48:27 +0000 (UTC)
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
X-Inumbo-ID: a102a445-de71-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738176507;
	bh=5x5C3oXKgTMBkuDA8TFCAbx9AmZk4D3MjTvrIrifUXk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=DvX932J5IFZQf2YexIlDBTZ5Df9aWNzivuNpCN5l7X4KAeZwbG0RZ0NyHVY8Hoi3x
	 4HvDF7qV+6rNmC84cpQZE22mdmEfWpz1LtheIrgOA4lWfW7gGfCDe2afYg4yMGcGE+
	 ecyPV2je07PaXbi8BzPgoPNTwFNg4V6myMKgUiCEwJ3Sogm9GtaJDhCNMYegeAvWqb
	 /nxRHnPUyJJPdIi5+qliYETKlYoBWLt8HNvGgKrfobvjvOKX3KkYkRy8esy6Fse3vl
	 k1TVeaVbk1Qk7dkdv7GAuLkFDJyLE1cjyi2D3+iO/S3SXLPFvKRfnaGvAVGaNtmmIt
	 5oGFcJOGrkdLw==
Date: Wed, 29 Jan 2025 12:48:25 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Subject: Re: Config space access to Mediatek MT7922 doesn't work after device
 reset in Xen PV dom0 (regression, Linux 6.12)
Message-ID: <20250129184825.GA484760@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z5mOKQUrgeF_r6te@mail-itl>

On Wed, Jan 29, 2025 at 03:10:49AM +0100, Marek Marczykowski-Górecki wrote:
> On Tue, Jan 28, 2025 at 07:15:26PM -0600, Bjorn Helgaas wrote:
> > On Fri, Jan 17, 2025 at 01:05:30PM +0100, Marek Marczykowski-Górecki wrote:
> > > After updating PV dom0 to Linux 6.12, The Mediatek MT7922 device reports
> > > all 0xff when accessing its config space. This happens only after device
> > > reset (which is also triggered when binding the device to the
> > > xen-pciback driver).
> > 
> > Thanks for the report and for all the debugging you've already done!
> > 
> > > Reproducer:
> > > 
> > >     # lspci -xs 01:00.0
> > >     01:00.0 Network controller: MEDIATEK Corp. MT7922 802.11ax PCI Express Wireless Network Adapter
> > >     00: c3 14 16 06 00 00 10 00 00 00 80 02 10 00 00 00
> > >     ...
> > >     # echo 1 > /sys/bus/pci/devices/0000:01:00.0/reset
> > >     # lspci -xs 01:00.0
> > >     01:00.0 Network controller: MEDIATEK Corp. MT7922 802.11ax PCI Express Wireless Network Adapter
> > >     00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> > >
> > > The same operation done on Linux 6.12 running without Xen works fine.
> > > 
> > > git bisect points at:
> > > 
> > >     commit d591f6804e7e1310881c9224d72247a2b65039af
> > >     Author: Bjorn Helgaas <bhelgaas@google.com>
> > >     Date:   Tue Aug 27 18:48:46 2024 -0500
> > > 
> > >     PCI: Wait for device readiness with Configuration RRS
> > > 
> > > part of that commit:
> > > @@ -1311,9 +1320,15 @@ static int pci_dev_wait(struct pci_dev *dev, char *reset_type, int timeout)
> > >                         return -ENOTTY;
> > >                 }
> > >  
> > > -               pci_read_config_dword(dev, PCI_COMMAND, &id);
> > > -               if (!PCI_POSSIBLE_ERROR(id))
> > > -                       break;
> > > +               if (root && root->config_crs_sv) {
> > > +                       pci_read_config_dword(dev, PCI_VENDOR_ID, &id);
> > > +                       if (!pci_bus_crs_vendor_id(id))
> > > +                               break;
> > > +               } else {
> > > +                       pci_read_config_dword(dev, PCI_COMMAND, &id);
> > > +                       if (!PCI_POSSIBLE_ERROR(id))
> > > +                               break;
> > > +               }
> > >  
> > >     
> > > Adding some debugging, the PCI_VENDOR_ID read in pci_dev_wait() returns
> > > initially 0xffffffff. If I extend the condition with
> > > "&& !PCI_POSSIBLE_ERROR(id)", then the issue disappear. But reading the
> > > patch description, it would break VF.
> > > I'm not sure where the issue is, but given it breaks only when running
> > > with Xen, I guess something is wrong with "Configuration RRS Software
> > > Visibility" in that case.
> > 
> > I'm missing something.  If you get 0xffffffff, that is not the 0x0001
> > Vendor ID, so pci_dev_wait() should exit immediately.  
> 
> I'm not sure what is going on there either, but my _guess_ is that the
> loop exits too early due to the above. And it makes some further actions
> to fail.

Seems like a good guess worth investigating.  Maybe log all config
accesses to this device after the FLR and see what we're doing?

