Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F99FA2D035
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2025 23:01:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884023.1293821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgWOx-0002ZX-48; Fri, 07 Feb 2025 22:00:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884023.1293821; Fri, 07 Feb 2025 22:00:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgWOx-0002Y4-18; Fri, 07 Feb 2025 22:00:43 +0000
Received: by outflank-mailman (input) for mailman id 884023;
 Fri, 07 Feb 2025 22:00:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vEis=U6=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1tgWOv-0002Xy-KP
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2025 22:00:41 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f79a04c3-e59e-11ef-a073-877d107080fb;
 Fri, 07 Feb 2025 23:00:40 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D90405C6605;
 Fri,  7 Feb 2025 21:59:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22FA0C4CED1;
 Fri,  7 Feb 2025 22:00:38 +0000 (UTC)
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
X-Inumbo-ID: f79a04c3-e59e-11ef-a073-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738965638;
	bh=4PGYM9LPpF81CkP+dcwE5M0h4Uk8y1TRbzHF+S4mrSg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=JgBmDIUSMtN2LUp4JgTti/w5aOvqAfn8tfTr98vk6LzaZOnfHUNZU9uCWEBeHkCAH
	 PlnjaL1FU/Bx9kYoT/YXSv15Sw2Z+cNYRX+j48aXSBaNerzS+PYhnaBIR6tHMZ7/4N
	 NwhsetfZvEto2kn+yQC2b3hbn5J/dZreHDW3sDscj2aUxOTxqqUrmnYBXxuSaF6wj2
	 BeaoetvZyzai1WS3sbTBbnPZ6Cv6660UUqvIR20iaZleZktFnc3pzlYistoJpPnLg6
	 dpVAeu0IZoRSodWengEdNdqcDW+U9oy9/2RQsK+XxiJ+ojS9HWV9HuPEiQIhmDoIad
	 XtocnImHdquZw==
Date: Fri, 7 Feb 2025 16:00:36 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Jan Beulich <jbeulich@suse.com>, Bjorn Helgaas <bhelgaas@google.com>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Subject: Re: Config space access to Mediatek MT7922 doesn't work after device
 reset in Xen PV dom0 (regression, Linux 6.12)
Message-ID: <20250207220036.GA1018004@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z6PiuRDjml0UNWd_@mail-itl>

On Wed, Feb 05, 2025 at 11:14:17PM +0100, Marek Marczykowski-Górecki wrote:
> On Thu, Jan 30, 2025 at 03:31:23PM -0600, Bjorn Helgaas wrote:
> > On Thu, Jan 30, 2025 at 10:30:33AM +0100, Jan Beulich wrote:
> > > On 30.01.2025 05:55, Marek Marczykowski-Górecki wrote:
> > > > I've added logging of all config read/write to this device. Full log at
> > > > [1].
> > > ...

> ... Generally it looks like this device has broken FLR, and the
> reset works due to the fallback to the secondary bus reset on
> timeout. I repeated the test with my additional "&&
> !PCI_POSSIBLE_ERROR(id)" and I got this:
> [2] https://gist.github.com/marmarek/db0808702131b69ea2f66f339a55d71b
> 
> The first log is with xen, and the second with native linux (and
> added PCI config space logging in drivers/pci/access.c).

This is just to annotate these logs.  Correct me if you see something
wrong.

Both logs include this patch:

  @@ -1297,7 +1297,8 @@ static int pci_dev_wait(struct pci_dev *dev, char *reset_type, int timeout)
                  if (root && root->config_rrs_sv) {
                          pci_read_config_dword(dev, PCI_VENDOR_ID, &id);
  -                     if (!pci_bus_rrs_vendor_id(id))
  +                     if (!pci_bus_rrs_vendor_id(id) &&
  +                         !PCI_POSSIBLE_ERROR(id))
                                  break;

I think both logs show this sequence:

  - Initiate FLR on 01:00.0

  - In pci_dev_wait(), poll PCI_VENDOR_ID, looking for something other
    than 0x0001 (which would indicate RRS response) or 0xffff (from
    patch above).

  - Time out after ~70 seconds and return -ENOTTY.

  - Attempt Secondary Bus Reset using 00:02.2, the Root Port leading
    to 01:00.0.

  - Successfully read PCI_VENDOR_ID.

  - Looks the same, whether linux is running natively or on top of
    Xen.

Relevant devices (from mediatek-debug-6.12-patch2+bridgelog.log):

  00:02.2 PCI bridge: Advanced Micro Devices, Inc. [AMD] Phoenix GPP Bridge
    Bus: primary=00, secondary=01, subordinate=01, sec-latency=0

  01:00.0 Network controller: MEDIATEK Corp. MT7922 802.11ax PCI Express Wireless Network Adapter
    Capabilities: [80] Express (v2) Endpoint, IntMsgNum 0

From mediatek-debug-6.12-patch2+bridgelog.log (from [2] above):

  [anaconda root@test-12 /]# time echo 1 > /sys/bus/pci/devices/0000:01:00.0/reset
  (XEN) d0v3 conf write cf8 0x80010088 bytes 2 offset 0 data 0xa910      <-- set 01:00.0 FLR
  (XEN) d0v3 conf read cf8 0x80010000 bytes 4 offset 0 data 0xffffffff
  ...
  (XEN) d0v4 conf read cf8 0x80010000 bytes 4 offset 0 data 0xffffffff
  ...
  (XEN) d0v4 conf read cf8 0x8000123c bytes 2 offset 2 data 0x2          (0x3c + offset 2 = 0x3e)
  (XEN) d0v4 conf write cf8 0x8000123c bytes 2 offset 2 data 0x42        <-- set 00:02.2 SBR
  (XEN) d0v4 conf write cf8 0x8000123c bytes 2 offset 2 data 0x2
  ...
  (XEN) d0v4 conf read cf8 0x80010000 bytes 4 offset 0 data 0x61614c3    <-- 01:00.0 VID/DID
  ...
  real    1m10.825s

From mediatek-debug-native-6.12-patch2+bridgelog.log (also from [2]
above):

  [anaconda root@test-12 ~]# time echo 1 > /sys/bus/pci/devices/0000:01:00.0/reset
  [  240.449215] pciback 0000:01:00.0: resetting
  [  240.450709] PCI: write bus 0x1 devfn 0x0 pos 0x88 size 2 value 0xa910   <-- set 01:00.0 FLR
  [  240.553264] PCI: read bus 0x1 devfn 0x0 pos 0x0 size 4 value 0xffffffff
  ...
  [  309.481728] PCI: read bus 0x1 devfn 0x0 pos 0x0 size 4 value 0xffffffff
  [  309.481747] pciback 0000:01:00.0: not ready 65535ms after FLR; giving up
  ...
  [  309.482667] PCI: read bus 0x0 devfn 0x12 pos 0x3e size 2 value 0x2      PCI_BRIDGE_CONTROL
  [  309.482670] PCI: write bus 0x0 devfn 0x12 pos 0x3e size 2 value 0x42    <-- set 00:02.2 SBR
  [  309.485184] PCI: write bus 0x0 devfn 0x12 pos 0x3e size 2 value 0x2

  ...
  [  309.617782] PCI: read bus 0x1 devfn 0x0 pos 0x0 size 4 value 0x61614c3  <-- 01:00.0 VID/DID
  [  309.629234] pciback 0000:01:00.0: reset done

