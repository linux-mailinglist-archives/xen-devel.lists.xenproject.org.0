Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8E6BD3272
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 15:15:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142356.1476547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8IOp-0005VC-7k; Mon, 13 Oct 2025 13:15:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142356.1476547; Mon, 13 Oct 2025 13:15:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8IOp-0005So-4V; Mon, 13 Oct 2025 13:15:39 +0000
Received: by outflank-mailman (input) for mailman id 1142356;
 Mon, 13 Oct 2025 13:15:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rMZy=4W=gmail.com=randomdude@srs-se1.protection.inumbo.net>)
 id 1v8IOn-0005Si-Hr
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 13:15:37 +0000
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com
 [2607:f8b0:4864:20::a36])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b342d8a3-a836-11f0-980a-7dc792cee155;
 Mon, 13 Oct 2025 15:15:34 +0200 (CEST)
Received: by mail-vk1-xa36.google.com with SMTP id
 71dfb90a1353d-54a9852eb65so207081e0c.3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Oct 2025 06:15:34 -0700 (PDT)
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
X-Inumbo-ID: b342d8a3-a836-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760361333; x=1760966133; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=E6KAvPCzoS6dErcsErznmNYP9kFi+nq+O7uNahpRfqo=;
        b=N7cR4vDvsA61UKXlqaKZJVpMrqZfBx2fjGLiZbOQmyeOq3JRTjwHyuGmPiH+Rs4niw
         uXnTNAhX30WQGF1MQ56chXbIEBDXrau8vA29ywCQGuyvDr8vhv4V8HALW+e5ZydNLfFO
         k6YLDIPu3u8CXJTv4W9orY3XizlmSwgfe6YH83UXL/XKCIzItQsWwSTQD+WsJ0bVWoku
         Whw456oPmHvAKGty7z9cT2CTwW/ISO1MU0otjnltbKoIObZ8YikUvT/R07OlVGbbgp7A
         Y0LA1xjjn73GFkd57Ov6Dlq6ByIOC2EcTCJObVjwvE7FvlcQIGcO4Xv4DBKX/bldb6SD
         sL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760361333; x=1760966133;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E6KAvPCzoS6dErcsErznmNYP9kFi+nq+O7uNahpRfqo=;
        b=VIlC5mcUFW+222Cas2Ub2FJ/cmwgfLB4N33mq3LmlDov4RFOmIeJiStvsKaLyw0QPB
         6tVQDhAJzqg2p2EeCi2Q+0jGks2ej40mIXTb7xsnUXmMIplZzspn0YuwAR9++tkkdbTv
         TcjTiFABgIORKdY5vsYOP2kaCTrThuJGtfzxfC/f/H3elu3Otro0LRrfQam+wJsPTw8y
         MFwD/zykRUOX7tghe7cSLaweXso4GXH04+hlyrDSm+lTompAeYhEs4uozLEalcsH6KnX
         fr+p7VByecTCFZI62RUaZxwbMz/CvJATg5ATlc1PLnPQdXbblhG0LXkygp6lQxyLCFgq
         WsCA==
X-Gm-Message-State: AOJu0YzQE3JN/kbH/75Y+5QbQnztJLxS1TnzV+Xyh1cE+Wzrgt+Vbmqs
	o5triGDWzAUo3o9XrswLNeJg3TShS9iDonaXzGyooOC20NuYwpn/f3wQJ9Yd4UoFto5xq2t7GUI
	NETQMdJ2rkiTsNAXfKBH3Xb2mlLSrtYLmkeHA
X-Gm-Gg: ASbGncs5YT7a7auvxq1kzyK3mOZwM+8zQbN0A0lUZHZ9j2YomvlwVwlZCqhJhle0c4m
	3yZMD8LOZ0+OJauBidijL5D+97m/2+plxCyXx9DQe8tXNqZWLP7T9XwVD8s3mHMpmFSSTkOsvEE
	+HM4cJmi1Yi067FKwlqtGh8yOB1kuFkZiKys/0fLBiVgX8qN/Q0F81rLNvblvGBiVd7wjGZx6oz
	Rt5Vzvt4Mt7p/Hg7S/V1ezx8P6d957/QdI=
X-Google-Smtp-Source: AGHT+IFnOsLmdnF+epSPLe1YNgYIME44ahTw81+xVd1ILDIMIGt+NsPiaMUmbpaeHNG4ftjbv0X2qkN82rUJc+ZOpJg=
X-Received: by 2002:a05:6122:1698:b0:552:2c6f:d9a3 with SMTP id
 71dfb90a1353d-554b8909fcfmr3165847e0c.0.1760361332706; Mon, 13 Oct 2025
 06:15:32 -0700 (PDT)
MIME-Version: 1.0
From: "Aliz 'Randomdude'" <randomdude@gmail.com>
Date: Mon, 13 Oct 2025 21:15:21 +0800
X-Gm-Features: AS18NWALZ-6L9SKPbGvVoe9UGUepw4tIx_llMRlI4xNo2nxGQd-_qzSEZv9wU6Q
Message-ID: <CAEMXWCDS37Bd87SA=d3bSEVOzJsM_+TJoT0kO4ZUT0ShgNiA5A@mail.gmail.com>
Subject: [BUG] XHCI_NO_64BIT_SUPPORT on ASM1042A USB controller breaks PCIE passthrough
To: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

Hi all. Many thanks for Xen.

I'm attempting to perform PCI passthrough of my RocketU 1144D USB
controller from an XCP-ng host (XCP-ng 8.3.0, kernel 4.19.0+1) to a
Linux guest. This card uses a PLX PCIe switch IC and four ASM1042A USB
controller ICs, of which I forward a single ASM1042A.

The ASM1042A is detected in the guest VM and initially appears to work
OK, but after I dd some gigabytes to an attached USB disk device, the
controller appears to go away:

[   81.076381] xhci_hcd 0000:00:09.0: xHCI host not responding to stop
endpoint command
[   81.079319] xhci_hcd 0000:00:09.0: xHCI host controller not
responding, assume dead
[   81.081503] xhci_hcd 0000:00:09.0: HC died; cleaning up
[   81.083388] usb 5-1: USB disconnect, device number 2

At this point, the controller is unusable until I reset it (via
/sys/bus/pci/devices/../remove and /sys/bus/pci/rescan). I am able to
trigger this behavior reliably, although sometimes some 30GB must be
transferred before symptoms appear.

The guest is running a 6.12.50 kernel I built from vanilla sources.

After much head-scratching, I discovered that some older guest kernels
function correctly, and do not exhibit the bug, allowing sustained use
of the controller.

I then proceeded to bisect my way to the following Linux kernel patch
(see https://lists-ec2.96boards.org/archives/list/linux-stable-mirror@lists.linaro.org/thread/WEVQDDJC72LMLPQY37JOZZNKMJ7OHHFL/):

> I've confirmed that both the ASMedia ASM1042A and ASM3242 have the same
> problem as the ASM1142 and ASM2142/ASM3142, where they lose some of the
> upper bits of 64-bit DMA addresses. As with the other chips, this can
> cause problems on systems where the upper bits matter, and adding the
> XHCI_NO_64BIT_SUPPORT quirk completely fixes the issue.
> Cc: stable@vger.kernel.org
> Signed-off-by: Forest Crossman cyrozap@gmail.com
> Signed-off-by: Mathias Nyman mathias.nyman@linux.intel.com
> ---
>  drivers/usb/host/xhci-pci.c | 8 ++++++--
> 1 file changed, 6 insertions(+), 2 deletions(-)
>
>
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index 1f989a49c8c6..5bbccc9a0179 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -66,6 +66,7 @@
> #define PCI_DEVICE_ID_ASMEDIA_1042A_XHCI 0x1142
>  #define PCI_DEVICE_ID_ASMEDIA_1142_XHCI 0x1242
>  #define PCI_DEVICE_ID_ASMEDIA_2142_XHCI 0x2142
> +#define PCI_DEVICE_ID_ASMEDIA_3242_XHCI 0x3242
>
>
> static const char hcd_name[] = "xhci_hcd";
>
>
> @@ -276,11 +277,14 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
>      pdev->device == PCI_DEVICE_ID_ASMEDIA_1042_XHCI)
>      xhci->quirks |= XHCI_BROKEN_STREAMS;
>     if (pdev->vendor == PCI_VENDOR_ID_ASMEDIA &&
> - pdev->device == PCI_DEVICE_ID_ASMEDIA_1042A_XHCI)
> + pdev->device == PCI_DEVICE_ID_ASMEDIA_1042A_XHCI) {
>      xhci->quirks |= XHCI_TRUST_TX_LENGTH;
> + xhci->quirks |= XHCI_NO_64BIT_SUPPORT;
> + }
>     if (pdev->vendor == PCI_VENDOR_ID_ASMEDIA &&
>         (pdev->device == PCI_DEVICE_ID_ASMEDIA_1142_XHCI ||
> -      pdev->device == PCI_DEVICE_ID_ASMEDIA_2142_XHCI))
> +      pdev->device == PCI_DEVICE_ID_ASMEDIA_2142_XHCI ||
> +      pdev->device == PCI_DEVICE_ID_ASMEDIA_3242_XHCI))
>      xhci->quirks |= XHCI_NO_64BIT_SUPPORT;
>
>
> if (pdev->vendor == PCI_VENDOR_ID_ASMEDIA &&

Reverting this patch fixes my immediate issue - the USB controller now
functions as expected. However, I am way out of my depth here and
strongly suspect that doing so will break things in subtle ways, and
so this is where I hand off to the experts for proper analysis. In
particular, I'd be interested to learn under which circumstances
reverting this patch is dangerous - does 'systems where the upper bits
matter' apply only to something relatively exotic? I ask in order to
determine if it is safe to revert this patch in my homelab-grade
setup.

In case it is useful, here are further details of my set-up:

* Dell R710 with BIOS 6.0.0
* 2x E5630 CPU and 64GB RAM
* XCP-ng 8.3.0 on the host
* Guest OS is Linux 6.12.0, built from vanilla kernel.org sources
* Guest runs in PVHVM mode
* PCI controller is the RocketU 1144D, which uses a PLX PEX8609 PCIe
switch IC connected to four ASM1042A controllers (allowing me to
forward each controller to a seperate VM)
* The firmware on the ASM1042A is up-to-date AFAICT
* The forwarded PCI device is connected to a JMS578-based disk array
containing three mechanical disks
* The problem exhibits in the guest VM after I run 'dd if=/dev/urandom
of=/dev/<disk> bs=1M count=10240 conv=sync', although it sometimes
needs up to three invokations
* After reverting the patch, I can run the above command without
problems ten times
* The same hardware works OK in ESXi.

I'm happy to provide further details, and please accept my apologies
in advance for any breach of etiquette - I don't report this kind of
bug very often.

