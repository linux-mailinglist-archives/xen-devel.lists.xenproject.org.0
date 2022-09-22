Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0D15E680D
	for <lists+xen-devel@lfdr.de>; Thu, 22 Sep 2022 18:06:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410326.653352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obOhw-0004bT-Nx; Thu, 22 Sep 2022 16:05:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410326.653352; Thu, 22 Sep 2022 16:05:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obOhw-0004YM-KA; Thu, 22 Sep 2022 16:05:48 +0000
Received: by outflank-mailman (input) for mailman id 410326;
 Thu, 22 Sep 2022 16:05:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BbBw=ZZ=citrix.com=prvs=2576c1e40=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1obOhu-0004Xa-Pa
 for xen-devel@lists.xenproject.org; Thu, 22 Sep 2022 16:05:46 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65b226f8-3a90-11ed-9374-c1cf23e5d27e;
 Thu, 22 Sep 2022 18:05:44 +0200 (CEST)
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
X-Inumbo-ID: 65b226f8-3a90-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1663862744;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=SVAiD7YKyxL7SV+rU9d5Js2kd29w7GVAQLzAiCndMQg=;
  b=C4YR4l3scqSWbS7jj8ZfvPLqYHVFXKWR7qvq6FLJOrpp/8AejH4IETk2
   sJBRnbdXYJlFd+YVeKi3WLNLW1Cd7p5r5omoLz7vwhHDdiTxDVyGJx0z+
   M8+3HxxPMCryZGNtdDfzCvxAzSLTIVtHVQYJj7Oson9Zyssw/6r5/ihAs
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 80275683
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:fG+jeqz0xApMAPcx3bB6t+dJxirEfRIJ4+MujC+fZmUNrF6WrkUFm
 DFJCm+DOveJM2qgf9B+bIS0/UhSuMOHn4AwTwBkrCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv676yEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii8tjjMPR7zml4
 LsemOWCfg7+s9JIGjhMsfjb+Uk15K6aVA4w5TTSW9ga5DcyqFFNZH4vDfnZB2f1RIBSAtm7S
 47rpF1u1jqEl/uFIorNfofTKiXmcJaLVeS9oiM+t5yZqgpDvkQPPpMTb5LwX6v1ZwKhxLidw
 P0V3XC5pJxA0qfkwIzxWDEAe81y0DEvFBYq7hFTvOTKp3AqfUcAzN1uNUAaO6oi9d0wEGQe7
 cc7M3MBdhWM0rfeLLKTEoGAh+wmJcjveogepmth3XfSCvNOrZLrGvuQo4UChXFp254ITa22i
 8kxMFKDaDzJZQFPPVEGToozhu6yilH0ciFCqULTrq0yi4TW5FwpiuewboqOEjCMbeRbpFm1t
 mudxFnGWB4FLcLCmQKv1n3504cjmgukAdlPRdVU7MVCglee22gSAx0+TkagrL+yjUvWc9dWM
 Ukd4Ccthak06k2wT9P5UgG4oXiLpRoVUZxbFOhSwBGAzO/Y7hiUAkAATyVdc5o2uckuXzso2
 1SV2dTzClRSXKa9ECzHsO3O9HXrZHZTfTRqiTI4oRUt4+DijIcUtB30CcdmQLaOrca2FSn1z
 GXfxMQhvIn/nfLnxo3iow6c02nz9siYJuImzl6JBzz4t2uVcKbgPtX1sgaDsJ6sOa7DFjG8U
 G44d99yBQzkJbWEj2SzTeoEB9lFDN7VYWSH0TaD83TMnglBGkJPnqgKulmS3G8zbq45lcbBO
 Sc/Qz956p5JJ2eNZqRqeY+3AMlC5fG+S4+6Bq2PM4UWP8EZmOq7EMZGOiatM53FyhBwwcnTx
 7/CGSpTMZrqIfs+l2fnLwvs+bQq2jo/1QvueHwP9Dz+iOL2WZJgYe1aWLd4RrxmsfjsTcS82
 4o3CvZmPD0GCLChOnaOqN5PRb3IRFBiba3LRwVsXrbrCmJb9KsJUJc9HZtJl1RZoplo
IronPort-HdrOrdr: A9a23:kQDcBqBrgTKNHHblHemm55DYdb4zR+YMi2TC1yhKJyC9Vvbo8v
 xG+85rsSMc6QxhOk3I9ursBEDtex/hHP1OkOos1NWZPDUO0VHAROoJ0WKL+UyGJ8SUzI9gPM
 lbHJRDNA==
X-IronPort-AV: E=Sophos;i="5.93,335,1654574400"; 
   d="scan'208";a="80275683"
Date: Thu, 22 Sep 2022 17:05:18 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
	<marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?=
	<roger.pau@citrix.com>
Subject: Design session "MSI-X support with Linux stubdomain" notes
Message-ID: <YyyHvp34Wg1kSqFu@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

WARNING: Notes missing at the beginning of the meeting.

session description:
> Currently a HVM with PCI passthrough and Qemu Linux stubdomain doesn’t
> support MSI-X. For the device to (partially) work, Qemu needs a patch masking
> MSI-X from the PCI config space. Some drivers are not happy about that, which
> is understandable (device natively supports MSI-X, so fallback path are
> rarely tested).
>
> This is mostly (?) about qemu accessing /dev/mem directly (here:
> https://github.com/qemu/qemu/blob/master/hw/xen/xen_pt_msi.c#L579) - lets
> discuss alternative interface that stubdomain could use.



when qemu forward interrupt,
    for correct mask bit, it read physical mask bit.
    an hypercall would make sense.
    -> benefit, mask bit in hardware will be what hypervisor desire, and device model desire.
    from guest point of view, interrupt should be unmask.

interrupt request are first forwarded to qemu, so xen have to do some post processing once request comes back from qemu.
    it's weird..

someone should have a look, and rationalize this weird path.

Xen tries to not forward everything to qemu.

why don't we do that in xen.
    there's already code in xen for that.

Issue: having QEMU open /dev/mem within stubdom isn't working.

We could look at removing the need for /dev/mem by improving support for qemu-depriv.

hypervisor configuration interface was intended for one domain. having stubdom in
the middle makes thing difficult.

See QEMU's code
    https://github.com/qemu/qemu/blob/master/hw/xen/xen_pt_msi.c#L579
        fd = open("/dev/mem", O_RDWR);

TODO:
step1: Find out why qemu wants that mask?
step2: identify what is missing in the PV interface.

QEMU use this to read the Pending Bit Array (PBA), and read entry in  table

comments at L465 (of xen_pt_msi.c) doesn't makes sense

Xen could do more fixup

passing value from hardware??
    can't pass vector to the guest,
    xen overwrite mask bit. (or something)

Did MSI-X worked in qemu-trad in stubdom?
    No one in the room could remember.

MSI-X is required for pci express, not that thing are implemented correctly.

TODO:
- get rid of opening /dev/mem in qemu


Cheers,

-- 
Anthony PERARD

