Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 076ADA21602
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2025 02:16:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878823.1289019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcwg4-0002wd-Lx; Wed, 29 Jan 2025 01:15:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878823.1289019; Wed, 29 Jan 2025 01:15:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcwg4-0002tY-Ic; Wed, 29 Jan 2025 01:15:36 +0000
Received: by outflank-mailman (input) for mailman id 878823;
 Wed, 29 Jan 2025 01:15:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CGF7=UV=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1tcwg2-0002tR-Mo
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2025 01:15:34 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 881df907-ddde-11ef-a0e6-8be0dac302b0;
 Wed, 29 Jan 2025 02:15:31 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6AB14A4165D;
 Wed, 29 Jan 2025 01:13:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1D51C4CED3;
 Wed, 29 Jan 2025 01:15:29 +0000 (UTC)
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
X-Inumbo-ID: 881df907-ddde-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738113329;
	bh=LPH+rFFvj0cEdutC7LtIU0vNsmeZQG7HJPWEn8vdN3Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=iV9OlV/aXWEEdLHO2uvdr6xaCFhmHutsN2xpsLTRCNq2ST+c6gCBo6fi6NBvY/82X
	 RqfudEpz9SDziEyepzeBi/dwX51b7VPEjIu2iEdjwsJ/qv6KrjptJohHIQJH1rYeKn
	 G2md0z7KlR0jvwPODLzLE1jexGtQXpw2qeHFEtG/l+Lz7oGBvQgOA1lFEjMnpWJdnr
	 V/gUaKp2W66i76UxCCRSkIl+3+XZb4utYI+NC3GHw6XOvsXwtUZ4c8/bYubYizdFMZ
	 6S/4D8RImB6QC5xpgk8TPVKMevaOwjiXqVBZL2jtzjif7CueSC6RkTXr44ZLEEthad
	 s2vGUM3FxWKJA==
Date: Tue, 28 Jan 2025 19:15:26 -0600
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
Message-ID: <20250129011526.GA184585@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z4pHll_6GX7OUBzQ@mail-itl>

On Fri, Jan 17, 2025 at 01:05:30PM +0100, Marek Marczykowski-Górecki wrote:
> After updating PV dom0 to Linux 6.12, The Mediatek MT7922 device reports
> all 0xff when accessing its config space. This happens only after device
> reset (which is also triggered when binding the device to the
> xen-pciback driver).

Thanks for the report and for all the debugging you've already done!

> Reproducer:
> 
>     # lspci -xs 01:00.0
>     01:00.0 Network controller: MEDIATEK Corp. MT7922 802.11ax PCI Express Wireless Network Adapter
>     00: c3 14 16 06 00 00 10 00 00 00 80 02 10 00 00 00
>     ...
>     # echo 1 > /sys/bus/pci/devices/0000:01:00.0/reset
>     # lspci -xs 01:00.0
>     01:00.0 Network controller: MEDIATEK Corp. MT7922 802.11ax PCI Express Wireless Network Adapter
>     00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>
> The same operation done on Linux 6.12 running without Xen works fine.
> 
> git bisect points at:
> 
>     commit d591f6804e7e1310881c9224d72247a2b65039af
>     Author: Bjorn Helgaas <bhelgaas@google.com>
>     Date:   Tue Aug 27 18:48:46 2024 -0500
> 
>     PCI: Wait for device readiness with Configuration RRS
> 
> part of that commit:
> @@ -1311,9 +1320,15 @@ static int pci_dev_wait(struct pci_dev *dev, char *reset_type, int timeout)
>                         return -ENOTTY;
>                 }
>  
> -               pci_read_config_dword(dev, PCI_COMMAND, &id);
> -               if (!PCI_POSSIBLE_ERROR(id))
> -                       break;
> +               if (root && root->config_crs_sv) {
> +                       pci_read_config_dword(dev, PCI_VENDOR_ID, &id);
> +                       if (!pci_bus_crs_vendor_id(id))
> +                               break;
> +               } else {
> +                       pci_read_config_dword(dev, PCI_COMMAND, &id);
> +                       if (!PCI_POSSIBLE_ERROR(id))
> +                               break;
> +               }
>  
>     
> Adding some debugging, the PCI_VENDOR_ID read in pci_dev_wait() returns
> initially 0xffffffff. If I extend the condition with
> "&& !PCI_POSSIBLE_ERROR(id)", then the issue disappear. But reading the
> patch description, it would break VF.
> I'm not sure where the issue is, but given it breaks only when running
> with Xen, I guess something is wrong with "Configuration RRS Software
> Visibility" in that case.

I'm missing something.  If you get 0xffffffff, that is not the 0x0001
Vendor ID, so pci_dev_wait() should exit immediately.  But the log at
https://github.com/QubesOS/qubes-issues/issues/9689#issuecomment-2582927149
says it *doesn't* exit and eventually times out.

And the lspci above shows ~0 data for much of the header, even though
the device must be ready by then.

I don't have any good ideas, but since the problem only happens with
Xen, and it seems to affect more than just the Vendor ID, maybe you
could instrument xen_pcibk_config_read() and see if there's something
wonky going on there?

> BTW, shouldn't PCI_VENDOR_ID be accessed via pci_read_config_word()
> instead of pci_read_config_dword()?

Per PCIe r6.0, sec 2.3.2:

  If Configuration RRS Software Visibility is enabled (see below):

    For a Configuration Read Request that includes both bytes of the
    Vendor ID field of a device Function's Configuration Space Header,
    the Root Complex must complete the Request to the host by
    returning a read-data value of 0001h for the Vendor ID field and
    all ‘1’s for any additional bytes included in the request.

Since either a word (16 bit) or dword (32 bit) read includes both
bytes of Vendor ID, I think either should work.  We use a 32-bit read
in the enumeration path, where we need both Vendor ID and Device ID,
but we don't care about the Device ID here, so it probably doesn't
really matter here.

