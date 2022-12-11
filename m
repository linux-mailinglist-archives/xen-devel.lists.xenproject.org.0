Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8286491BF
	for <lists+xen-devel@lfdr.de>; Sun, 11 Dec 2022 03:11:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.458707.716513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4BnU-0002hF-1v; Sun, 11 Dec 2022 02:10:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 458707.716513; Sun, 11 Dec 2022 02:10:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4BnT-0002dJ-Ta; Sun, 11 Dec 2022 02:10:31 +0000
Received: by outflank-mailman (input) for mailman id 458707;
 Sun, 11 Dec 2022 02:10:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=97oD=4J=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1p4BnS-0002cH-2T
 for xen-devel@lists.xenproject.org; Sun, 11 Dec 2022 02:10:30 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8f35360-78f8-11ed-8fd2-01056ac49cbb;
 Sun, 11 Dec 2022 03:10:26 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id CD8705C00AB;
 Sat, 10 Dec 2022 21:10:23 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sat, 10 Dec 2022 21:10:23 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 10 Dec 2022 21:10:22 -0500 (EST)
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
X-Inumbo-ID: f8f35360-78f8-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1670724623; x=1670811023; bh=CbI6DnKTlZiBh+WyyenklvldjcWlzpgpmYP
	gqCb7f/o=; b=aHJXcmE2DVVext2/+fpOY+Fmy52qA0OJkjLYpK8UG/H7HR1Vg7j
	fK/+Z8YrFZ+1wTpeASuoTjQcmq2HxxBsJm4Y2YCgS1JwNMFvW9u3uVnH2aDvEHOT
	e4LltikmGP6fgX+Jc59ZXjQdSqbIdDc6022ay2ZeGgH/coydZMsgTjydxKHkbUVL
	grGVPggs61MaN9TAzQLFqE8fP1YclUQ92vjDxxcSpTI0OTvEJMiaKz1bME+m9fN4
	tmZD/dB1jEAm6HbIFbwwl4oLO0J1YpnoN4PvlhzNzJsBAQjo6nW5tL+JRDXFDWfH
	+smUM7Stb+gOTGbuHQYjKI7RsHVFcUB71wQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1670724623; x=1670811023; bh=CbI6DnKTlZiBh
	+WyyenklvldjcWlzpgpmYPgqCb7f/o=; b=q8Iq6GV4XVBFpB+IU9SgY65XS0Nr7
	TKnNuD5bjaN3URIWP1Edn65zI4wL2NIjqKOEkeWn9EEacbZkX1RcK+f99Yy+CV7b
	WTwxkLiom5VHPL+jniWffxzIbovYXknY47pOGdX4H4b7L15mxc6x/H3MxznUf+/c
	u83HKL59C3lMqdS39O5AtJlCgTmbkuNoN4mSoNv4teZq0DvgfQnOOrFql7ThMmje
	bs32kijTH27BtHs9btyiTz5Js/P7xiHc9BXfz0Z384oIhiEujabo3mIxTFYr6VaQ
	+epWiWNh1T6NOrqW4sISqWL1Q1GYc3J7IpQdK9lYh1R6ce2OEM0+CRScQ==
X-ME-Sender: <xms:DzyVYycUjYPLyGVQHRmiYN0S-CE1onU13FSZtL6CMK4v5V0DDeg_Og>
    <xme:DzyVY8O6FnFFcuEUMIgz35bDYm-ajLnh75UMxbs8ZomnoSfs13GysfjiBG2Mm8lLN
    yDRHfZj-dqi3Q>
X-ME-Received: <xmr:DzyVYzgPnc9-Jc85VYM7D6aVieYR9pe5SPP4rLzFOQft1Ah4bJTrJWt7gFblL-7SbWy3ZZ59LZWAEWmN9rSkGwORkJTyABah6gfAj3mgblUxA36X1us>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehgdeggecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepteelhedv
    vddtvdetfeeileeftdduteefgeetuedukeffledvjedtveetvefftdeknecuffhomhgrih
    hnpehinhhtvghlrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsg
    drtghomh
X-ME-Proxy: <xmx:DzyVY_82D16x19JUh1DBGPCJ1dBz-fcUX-JvGDYj36tKupD2GGHa7g>
    <xmx:DzyVY-tIO8lyGAn9kBinzfdjlmTYGVsb6pfG-Krq8FUXH1xfhqFGkw>
    <xmx:DzyVY2HKS3V6EZ1AtBWCgttIB6WJJsxx_BYJgYPj02z96HIPsaay_A>
    <xmx:DzyVY03bF3Oru4uLnYuX9Wjhm6fPW0K6ShFE79naXt5-KEwJrfxlEA>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [RFC PATCH 0/3] Try to fix XHCI console on AMD systems (help needed)
Date: Sun, 11 Dec 2022 03:10:03 +0100
Message-Id: <cover.932f486c1b08268190342f8918b09fa6a7c3f149.1670724490.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series has two fixes to the xhci console for AMD systems. But it isn't
enough to get it working. The third patch allows collecting some debug info.

It got me this:

    (XEN) dbc error: timeout 2
    (XEN) dbc debug: XHCI DBC DUMP:
    (XEN) dbc debug:     ctrl: 0x800f0000 stat: 0x6000000 psc: 0x621063
    (XEN) dbc debug:     id: 0xf000a, db: 0x0
    (XEN) dbc debug:     erstsz: 1, erstba: 0xcbebb000
    (XEN) dbc debug:     erdp: 0xcbe7b000, cp: 0xcbebb010
    (XEN) dbc debug:     ddi1: 0x1d6b0000, ddi2: 0x10
    (XEN) dbc debug:     erstba == virt_to_dma(erst): 1
    (XEN) dbc debug:     erdp == virt_to_dma(erst[0].base): 1
    (XEN) dbc debug:     cp == virt_to_dma(ctx): 1

On the other side of the cable I got:

    usb usb2-port2: Cannot enable. Maybe the USB cable is bad?
    usb 2-2: Device not responding to setup address.
    usb 2-2: Device not responding to setup address.
    usb 2-2: device not accepting address 92, error -71
    usb usb2-port2: attempt power cycle
    usb 2-2: Device not responding to setup address.
    usb 2-2: Device not responding to setup address.
    usb 2-2: device not accepting address 93, error -71
    usb 2-2: Device not responding to setup address.
    usb 2-2: Device not responding to setup address.
    usb 2-2: device not accepting address 94, error -71
    usb usb2-port2: unable to enumerate USB device

Linux seems to reset the port only for Intel, so I tried to disable that part,
but it still didn't work - I got this instead:

    (XEN) dbc error: timeout 2
    (XEN) dbc debug: XHCI DBC DUMP:
    (XEN) dbc debug:     ctrl: 0x800f0000 stat: 0x0 psc: 0xa0
    (XEN) dbc debug:     id: 0xf000a, db: 0x0
    (XEN) dbc debug:     erstsz: 1, erstba: 0xcbebb000
    (XEN) dbc debug:     erdp: 0xcbe7b000, cp: 0xcbebb010
    (XEN) dbc debug:     ddi1: 0x1d6b0000, ddi2: 0x10
    (XEN) dbc debug:     erstba == virt_to_dma(erst): 1
    (XEN) dbc debug:     erdp == virt_to_dma(erst[0].base): 1
    (XEN) dbc debug:     cp == virt_to_dma(ctx): 1

And then on the other side of the cable, I got:

    [16773160.618004] usb usb2-port2: Cannot enable. Maybe the USB cable is bad?
    [16773164.850055] usb usb2-port2: Cannot enable. Maybe the USB cable is bad?
    [16773168.938085] usb usb2-port2: Cannot enable. Maybe the USB cable is bad?
    [16773168.938380] usb usb2-port2: attempt power cycle
    [16773173.102097] usb usb2-port2: Cannot enable. Maybe the USB cable is bad?
    [16773177.190139] usb usb2-port2: Cannot enable. Maybe the USB cable is bad?
    [16773177.190431] usb usb2-port2: unable to enumerate USB device
    [16773181.262176] usb usb2-port2: Cannot enable. Maybe the USB cable is bad?
    [16773185.494221] usb usb2-port2: Cannot enable. Maybe the USB cable is bad?
    [16773189.582247] usb usb2-port2: Cannot enable. Maybe the USB cable is bad?
    [16773189.582542] usb usb2-port2: attempt power cycle

The xhci console works fine from within native Linux, when enabled with:

    echo enable > /sys/bus/pci/devices/0000:04:00.3/dbc

I did not managed to get it working via earlyprintk=xhci (but I'm not sure if
that's specific to this hardware, or something else - haven't tried
earlyprintk=xhci anywhere else).

Info about the xhci from native linux:
    04:00.3 USB controller: Advanced Micro Devices, Inc. [AMD] Renoir USB 3.1 (prog-if 30 [XHCI])
        Subsystem: Hewlett-Packard Company Device 8730
        Flags: bus master, fast devsel, latency 0, IRQ 44, IOMMU group 5
        Memory at e0300000 (64-bit, non-prefetchable) [size=1M]
        Capabilities: [48] Vendor Specific Information: Len=08 <?>
        Capabilities: [50] Power Management version 3
        Capabilities: [64] Express Endpoint, MSI 00
        Capabilities: [a0] MSI: Enable- Count=1/8 Maskable- 64bit+
        Capabilities: [c0] MSI-X: Enable+ Count=8 Masked-
        Capabilities: [100] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
        Kernel driver in use: xhci_hcd

I tried to find AMD's equivalet of
https://www.intel.com/content/dam/www/public/us/en/documents/technical-specifications/extensible-host-controler-interface-usb-xhci.pdf
to see if there are any differences (shouldn't be...), but I haven't found
anything like this.

Any ideas what is wrong?

Marek Marczykowski-Górecki (3):
  drivers/char: support up to 1M BAR0 of xhci
  drivers/char: search all buses for xhci
  DEBUG: dump xhci state on connection timeout

 xen/arch/x86/include/asm/fixmap.h |   4 +-
 xen/drivers/char/xhci-dbc.c       | 116 +++++++++++++++++++++++++------
 2 files changed, 98 insertions(+), 22 deletions(-)

base-commit: f86d0a1ff200264aaf80b65d7d200a3ba19c7845
-- 
git-series 0.9.1

