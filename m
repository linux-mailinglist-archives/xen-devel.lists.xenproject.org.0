Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1912170A39E
	for <lists+xen-devel@lfdr.de>; Sat, 20 May 2023 02:02:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537305.836336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q0A3J-0005Ad-MT; Sat, 20 May 2023 00:02:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537305.836336; Sat, 20 May 2023 00:02:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q0A3J-00058x-IV; Sat, 20 May 2023 00:02:29 +0000
Received: by outflank-mailman (input) for mailman id 537305;
 Sat, 20 May 2023 00:02:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fgvr=BJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1q0A3H-00058r-Ac
 for xen-devel@lists.xenproject.org; Sat, 20 May 2023 00:02:27 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99d57031-f6a1-11ed-b22d-6b7b168915f2;
 Sat, 20 May 2023 02:02:25 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A0EF065BEA;
 Sat, 20 May 2023 00:02:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 131AEC4339B;
 Sat, 20 May 2023 00:02:22 +0000 (UTC)
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
X-Inumbo-ID: 99d57031-f6a1-11ed-b22d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684540944;
	bh=AB8uAjp95laAlH2gCZ2ccb+KwHo8hvVoZJ47TGn3mlY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=iYIUAbZq4kqtFHfSMjcXadrGYkUDTOomP0j8t677vUFIhUDJk5tVzUXpEyaFAnpV2
	 BXgY44Kwj4lFgjXb0ZA/WvQDj1jB7QmVHeQq/h5OezCAX+yK0wGISNop3wAwmdoDQL
	 bWrWD5DsEE0WYGq6PQqBxPCTNlBqSCd1Qql0M2TqoHFoPDLqR9kmKR/1RfXtMxkYSp
	 mKxzpJ1B4Ybitfxjlz4l0+Za3DiRt/bzia9milu8wID8tsb24Z0q/xs4ZPj9EKjH83
	 0hS3z29aqQVhO/RkoJ06Za5OtZsoOhXA/0tpJ5EHwBiY4WLjVMW/tFQYD3hnmxC+Lf
	 Zf07KTHabMsZw==
Date: Fri, 19 May 2023 17:02:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, jbeulich@suse.com, 
    andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org, 
    marmarek@invisiblethingslab.com, xenia.ragiadakou@amd.com
Subject: Re: PVH Dom0 related UART failure
In-Reply-To: <ZGcu7EWW1cuNjwDA@Air-de-Roger>
Message-ID: <alpine.DEB.2.22.394.2305191641010.815658@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2305171745450.128889@ubuntu-linux-20-04-desktop> <ZGX/Pvgy3+onJOJZ@Air-de-Roger> <alpine.DEB.2.22.394.2305181748280.128889@ubuntu-linux-20-04-desktop> <ZGcu7EWW1cuNjwDA@Air-de-Roger>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1971014780-1684540943=:815658"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1971014780-1684540943=:815658
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 19 May 2023, Roger Pau Monné wrote:
> On Thu, May 18, 2023 at 06:46:52PM -0700, Stefano Stabellini wrote:
> > On Thu, 18 May 2023, Roger Pau Monné wrote:
> > > On Wed, May 17, 2023 at 05:59:31PM -0700, Stefano Stabellini wrote:
> > > > Hi all,
> > > > 
> > > > I have run into another PVH Dom0 issue. I am trying to enable a PVH Dom0
> > > > test with the brand new gitlab-ci runner offered by Qubes. It is an AMD
> > > > Zen3 system and we already have a few successful tests with it, see
> > > > automation/gitlab-ci/test.yaml.
> > > > 
> > > > We managed to narrow down the issue to a console problem. We are
> > > > currently using console=com1 com1=115200,8n1,pci,msi as Xen command line
> > > > options, it works with PV Dom0 and it is using a PCI UART card.
> > > > 
> > > > In the case of Dom0 PVH:
> > > > - it works without console=com1
> > > > - it works with console=com1 and with the patch appended below
> > > > - it doesn't work otherwise and crashes with this error:
> > > > https://matrix-client.matrix.org/_matrix/media/r0/download/invisiblethingslab.com/uzcmldIqHptFZuxqsJtviLZK
> > > 
> > > Jan also noticed this, and we have a ticket for it in gitlab:
> > > 
> > > https://gitlab.com/xen-project/xen/-/issues/85
> > > 
> > > > What is the right way to fix it?
> > > 
> > > I think the right fix is to simply avoid hidden devices from being
> > > handled by vPCI, in any case such devices won't work propewrly with
> > > vPCI because they are in use by Xen, and so any cached information by
> > > vPCI is likely to become stable as Xen can modify the device without
> > > vPCI noticing.
> > > 
> > > I think the chunk below should help.  It's not clear to me however how
> > > hidden devices should be handled, is the intention to completely hide
> > > such devices from dom0?
> > 
> > I like the idea but the patch below still failed:
> > 
> > (XEN) Xen call trace:
> > (XEN)    [<ffff82d0402682b0>] R drivers/vpci/header.c#modify_bars+0x2b3/0x44d
> > (XEN)    [<ffff82d040268714>] F drivers/vpci/header.c#init_bars+0x2ca/0x372
> > (XEN)    [<ffff82d0402673b3>] F vpci_add_handlers+0xd5/0x10a
> > (XEN)    [<ffff82d0404408b9>] F drivers/passthrough/pci.c#setup_one_hwdom_device+0x73/0x97
> > (XEN)    [<ffff82d0404409b0>] F drivers/passthrough/pci.c#_setup_hwdom_pci_devices+0x63/0x15b
> > (XEN)    [<ffff82d04027df08>] F drivers/passthrough/pci.c#pci_segments_iterate+0x43/0x69
> > (XEN)    [<ffff82d040440e29>] F setup_hwdom_pci_devices+0x25/0x2c
> > (XEN)    [<ffff82d04043cb1a>] F drivers/passthrough/amd/pci_amd_iommu.c#amd_iommu_hwdom_init+0xd4/0xdd
> > (XEN)    [<ffff82d0404403c9>] F iommu_hwdom_init+0x49/0x53
> > (XEN)    [<ffff82d04045175e>] F dom0_construct_pvh+0x160/0x138d
> > (XEN)    [<ffff82d040468914>] F construct_dom0+0x5c/0xb7
> > (XEN)    [<ffff82d0404619c1>] F __start_xen+0x2423/0x272d
> > (XEN)    [<ffff82d040203344>] F __high_start+0x94/0xa0
> > 
> > I haven't managed to figure out why yet.
> 
> Do you have some other patches applied?
> 
> I've tested this by manually hiding a device on my system and can
> confirm that without the fix I hit the ASSERT, but with the patch
> applied I no longer hit it.  I have no idea how can you get into
> init_bars if the device is hidden and thus belongs to dom_xen.

Unfortunately it doesn't work. Here are the full logs with interesting
DEBUG messages (search for "DEBUG"):
https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/4318489116
https://gitlab.com/xen-project/people/sstabellini/xen/-/commit/31c400caa7b86d4c14f9553138e02af18d3b3284

[...]
(XEN) DEBUG ns16550_init_postirq 432  03:00.0
[...]
(XEN) DEBUG vpci_add_handlers 75 0000:00:00.0 0^M
(XEN) DEBUG vpci_add_handlers 75 0000:00:00.2 1^M
(XEN) DEBUG vpci_add_handlers 78 0000:00:00.2^M
(XEN) DEBUG vpci_add_handlers 75 0000:00:01.0 0^M
(XEN) DEBUG vpci_add_handlers 75 0000:00:02.0 0^M
(XEN) DEBUG vpci_add_handlers 75 0000:00:02.1 0^M

Then crash on drivers/vpci/header.c#modify_bars

vpci_add_handlers hasn't even been called yet for the interesing device,
which is 03:00.0 (not 00:02.1).

At that pointed I doubted myself on the previous test so I went back and
re-run it again. I do confirm that the below patch instead (instead, not
in addition) works:


diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 212a9c49ae..24abfaae30 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -429,17 +429,6 @@ static void __init cf_check ns16550_init_postirq(struct serial_port *port)
 #ifdef NS16550_PCI
     if ( uart->bar || uart->ps_bdf_enable )
     {
-        if ( uart->param && uart->param->mmio &&
-             rangeset_add_range(mmio_ro_ranges, PFN_DOWN(uart->io_base),
-                                PFN_UP(uart->io_base + uart->io_size) - 1) )
-            printk(XENLOG_INFO "Error while adding MMIO range of device to mmio_ro_ranges\n");
-
-        if ( pci_ro_device(0, uart->ps_bdf[0],
-                           PCI_DEVFN(uart->ps_bdf[1], uart->ps_bdf[2])) )
-            printk(XENLOG_INFO "Could not mark config space of %02x:%02x.%u read-only.\n",
-                   uart->ps_bdf[0], uart->ps_bdf[1],
-                   uart->ps_bdf[2]);
-
         if ( uart->msi )
         {
             struct msi_info msi = {
--8323329-1971014780-1684540943=:815658--

