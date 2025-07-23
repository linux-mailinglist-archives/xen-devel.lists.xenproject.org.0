Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23978B0F2AA
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 14:56:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053933.1422717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueZ0p-0002ow-UH; Wed, 23 Jul 2025 12:55:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053933.1422717; Wed, 23 Jul 2025 12:55:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueZ0p-0002mf-RK; Wed, 23 Jul 2025 12:55:59 +0000
Received: by outflank-mailman (input) for mailman id 1053933;
 Wed, 23 Jul 2025 12:55:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TLFC=2E=bounce.vates.tech=bounce-md_30504962.6880dbda.v1-5e2e1958c38c429281fa694e6807cbe7@srs-se1.protection.inumbo.net>)
 id 1ueZ0o-0002mZ-6O
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 12:55:58 +0000
Received: from mail132-21.atl131.mandrillapp.com
 (mail132-21.atl131.mandrillapp.com [198.2.132.21])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ead96f7-67c4-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 14:55:55 +0200 (CEST)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-21.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4bnDdk0X5yz1bMRGS
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jul 2025 12:55:54 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 5e2e1958c38c429281fa694e6807cbe7; Wed, 23 Jul 2025 12:55:54 +0000
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
X-Inumbo-ID: 5ead96f7-67c4-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1753275354; x=1753545354;
	bh=MgErOxe/ALMyMqsDukIrS/ZytE2FlQ51pcmaAoJ27ec=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=XDdFjF8CVx/paTc9dsAion8DkgeXpJYnVBVnRL/PuC3nSj3aN2RhYMEKkPAYoheGs
	 G0t3nWU3jj7AifNF0XhQTpfQY9Auk1dWWYnpnbHbHengMVVLrHLwyD3kq6iEWk/kfc
	 9jGzfLJYbuMg6fYWfPucMXP4a4ipp5oocj3iJ6F9CPGyU5mUB1MTTiXix7C9lwDj0K
	 Jx80uuRmbhwgXOHcjyM1GGBGixfDBVOCQNMrY2s6NrgoFS+1GotkQCIJJfNCMxS7yL
	 H5MwsHHs/pBlm+rhFyxK26yM8AQ67Ni4DgrocgpLwzRjVym4/rVaX1JruK9xTeQsxM
	 IN4vAGZijypqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1753275354; x=1753535854; i=ngoc-tu.dinh@vates.tech;
	bh=MgErOxe/ALMyMqsDukIrS/ZytE2FlQ51pcmaAoJ27ec=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=pIj+1qA8jzQbnqgFJZ7aH+LpBIkY803aSDqG8kTaubHVcbJKnG7woP/FjkP46jmlc
	 A/don2+ivh3XGIXIZ8CoC6wtQqVYh2hB6Kuhzpz/JIltywd92I4N1yYiGsH6ZcWw3O
	 QGf9u5Ljacz9dMrHJrrc7sTrmWD/gCdf7yg+mTk3cWI6+sbtFwI67kBNm0/u53tJOl
	 csbqRE5TeADvM1HGrzcnekM05Dn6Yi5g2WmTqXwcxu1kDZxd5qgf1XlU3jOHD4YSOa
	 6zPct4+nJPzFbp95AqGxKDF7W/WhoQedu0P8cezAVePpmbFoOgsWOSkHDSxT3zvvKr
	 RZ6bqLsZc0SzA==
From: "Tu Dinh" <ngoc-tu.dinh@vates.tech>
Subject: =?utf-8?Q?Re:=20PCI=20passthrough=20of=20XHCI=20on=20Framework=20AMD=20crashes=20the=20host?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1753275352965
Message-Id: <f2d125f2-febe-4e92-a7cf-5373b069cd1c@vates.tech>
To: "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>
References: <aIDXIqA4L7wcJH2T@mail-itl>
In-Reply-To: <aIDXIqA4L7wcJH2T@mail-itl>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.5e2e1958c38c429281fa694e6807cbe7?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250723:md
Date: Wed, 23 Jul 2025 12:55:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 23/07/2025 14:35, Marek Marczykowski-G=C3=B3recki wrote:
> Hi,
> 
> There is yet another issue affecting Framework AMD... When I start a
> domU with XHCI controller attached (PCI passthrough), the whole host
> resets if there was an USB device plugged into it. I don't get any panic
> message (neither on XHCI console - which is connected to a different
> XHCI controller, nor on VGA), and the reboot reason register shows
> 0x08000800 ("an uncorrected error caused a data fabric sync flood
> event") according to [1].
> 
> This is Framework AMD with AMD Ryzen 5 7640U.
> 
> The crash itself happens quite early on domU startup - specifically when
> SeaBIOS tries to initialize XHCI. I tracked it down to the second
> readl() in xhci_controller_setup() [2]. Interestingly, it's specifically
> the second readl(), regardless of which of those comes first. I tried
> swapping their order, or even repeating read from the same register -
> always the second call triggers the crash. The first one succeeds and
> returns some value (for example 0x1200020 for HCCPARAMS).
> 
> If I start the domU when no USB devices are connected, it doesn't crash.
> 
> If I manually unbind the device from the dom0 driver (echo 0000:c3:00.4 >
> /sys/bus/pci/drivers/xhci_hcd/unbind), it doesn't crash. Note I have
> seize=3D1 in domU config, so the `xl pci-assignable-add` calls is implici=
t.
> 
> If the system doesn't crash (either by not having any USB devices
> connected initially, or by the manual unbind), the USB controller in
> domU works fine. I can later connect devices and they appear inside
> domU.
> 
> This system has a couple of XHCI controllers, and the same behavior is
> observed on at least two of them.
> 
> The controller works just fine when used in dom0.
> 
> If I passthrough another PCI device instead (tried wifi card and audio
> card), it doesn't crash.
> 
> The value read from from HCCPARAMS (BAR + 0x10) differs between good and =
bad case:
> - 0x01200020 when it crashes
> - 0x0110ffc5 when it works
> 
> It's weird to have this much differences here, given most bits in this
> register is about device capabilities[3], not its runtime state...
> 
> In this system my main debugging tool is the XHCI console. But I tried
> also without enabling XHCI console, and it still crashes, so it looks
> like it isn't caused by the XHCI console.
> 
> I tried also disabling XHCI initialization in SeaBIOS, and then it
> proceeds to booting domU's kernel. But as soon as Linux gets into
> initializing that USB controller, it crashes the same way. So, it isn't
> just SeaBIOS doing something weird (or at least not just that).
> 
> With PVH dom0, the behavior is a bit different:
> 1. Initially, the controller works fine in dom0.
> 2. When starting domU, instead of clean unbind this happens:
> 
>      [   11.248760] xhci_hcd 0000:c3:00.4: Controller not ready at resume=
 -19
>      [   11.248765] xhci_hcd 0000:c3:00.4: PCI post-resume error -19!
>      [   11.248767] xhci_hcd 0000:c3:00.4: HC died; cleaning up
>      [   11.249010] xhci_hcd 0000:c3:00.4: remove, state 4
>      [   11.249013] usb usb8: USB disconnect, device number 1
>      [   11.249437] xhci_hcd 0000:c3:00.4: USB bus 8 deregistered
>      [   11.249832] xhci_hcd 0000:c3:00.4: remove, state 4
>      [   11.249835] usb usb7: USB disconnect, device number 1
>      [   11.250074] xhci_hcd 0000:c3:00.4: Host halt failed, -19
>      [   11.250076] xhci_hcd 0000:c3:00.4: Host not accessible, reset fai=
led.
>      [   11.250389] xhci_hcd 0000:c3:00.4: USB bus 7 deregistered
>      [   11.251011] pciback 0000:c3:00.4: xen_pciback: seizing device
>      [   11.335120] pciback 0000:c3:00.4: xen_pciback: vpci: assign to vi=
rtual slot 0
>      [   11.335544] pciback 0000:c3:00.4: registering for 1
> 
> 3. Reading from BAR in domU (in SeaBIOS, and later Linux) returns
> 0xffffffff.
> 4. Does not crash the host.
> 
> Any ideas?
> 
> I don't have any other system with Zen4 to try on. The hw11 gitlab
> runner is Ryzen 7 7735HS, and it doesn't have this issue. It's also
> possible this is something related to Framework's firmware, but give all
> the observations above, I find it less likely.
> 
> [1] https://docs.kernel.org/arch/x86/amd-debugging.html#random-reboot-iss=
ues
> [2] https://github.com/coreboot/seabios/blob/master/src/hw/usb-xhci.c#L55=
3
> [3] https://www.intel.com/content/dam/www/public/us/en/documents/technica=
l-specifications/extensible-host-controler-interface-usb-xhci.pdf (page 385=
)

I had a similar problem with a Beelink mini PC with the Ryzen 5800U 
after a recent Qubes upgrade.

If the USB controller is passed through to sys-usb then the system 
simply resets without warning.


Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



