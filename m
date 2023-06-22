Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A1B7396EE
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 07:41:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553277.863744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCD3m-0008TM-8O; Thu, 22 Jun 2023 05:40:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553277.863744; Thu, 22 Jun 2023 05:40:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCD3m-0008RL-4c; Thu, 22 Jun 2023 05:40:46 +0000
Received: by outflank-mailman (input) for mailman id 553277;
 Thu, 22 Jun 2023 05:40:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GgAu=CK=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1qCD3k-0008RF-VC
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 05:40:45 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53d641d7-10bf-11ee-b237-6b7b168915f2;
 Thu, 22 Jun 2023 07:40:43 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4f4b2bc1565so9104066e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jun 2023 22:40:43 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-191-235-040.77.191.pool.telefonica.de.
 [77.191.235.40]) by smtp.gmail.com with ESMTPSA id
 d22-20020a1c7316000000b003f80946116dsm17773724wmb.45.2023.06.21.22.40.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jun 2023 22:40:41 -0700 (PDT)
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
X-Inumbo-ID: 53d641d7-10bf-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687412442; x=1690004442;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z5xLOgxc5yMmFB/xqkfPkgAUKFtQLoPEIBnqwRG9wrE=;
        b=jYm+kmGqKaSQjS88IKrNZ+9qWwZb4bzsJzZE5oCs8oJ5udAJqOKgvF4np3iAz35QlO
         opBvnyjViyJaO1Jae0oL5TCzc9oieIbUCytZUMTdC7Mk4FPfPBAyetS08ZFB94dsyK8q
         IIAi9NPtf3BMvq2X/eiOhb3RGW6vkt4vdHDlbzomGPDEEzb40pgNWwvxYlWFl/up77ip
         zssrlwrl1fRVcHpERrVb4f/O7zH3YX4f4vfSiZi7bgNQ+TjQZfZs1Ew+5pEQrMqeV3qk
         nprdgpvFwuFRXdAE2Nx/aJbSuGUJfgKpd4dRCpU2+1jmRQx2AObP5n4nnm2R+fhavt78
         6A2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687412442; x=1690004442;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z5xLOgxc5yMmFB/xqkfPkgAUKFtQLoPEIBnqwRG9wrE=;
        b=M6m/VGqLmSkeBgDB5m8YHYUabDn0mxz7LwKMRZ5x2DbywETWOdtNRr+3VZJcHSkTQJ
         /G4zsJTWwtmYIRUe+LXLTZNcPxBeCq8R9QRGtOOBE6thdpNxKmKD1/+G8laFYKPmpoUZ
         58BP+3IC1N68n3K0+Fa0ud8fRwx2hCmvhZ0wssHyoI0++fcf0OqoJRUoMeyDQ4Hgf3w0
         3fNSF3nZaTdX2/Pr2GesqKN4OntOlsxjmf+k3U4aSwNJ4HboekKlSc++uC+DgmBkpiQh
         V10GotNYzW3YzKW/AxcgcieSHTyN6767DoY8piFLVbMmTDwOfTLUBUFkoKJX2586QwgV
         qFsA==
X-Gm-Message-State: AC+VfDzUgTFERLhXHqFLMkXskcc1LtpZPRnBhZua2RAgF7QLY9yjQ7U3
	X1kKo/d+yfkhos+nwtw78o4=
X-Google-Smtp-Source: ACHHUZ5gW7KeklYhgZOV3gDoeY9HwOEt6afLaSv7fml+weuZZE2JHhoRm1bGUB6n/dPmb4JnYQam3g==
X-Received: by 2002:a19:9151:0:b0:4f8:6b82:56c4 with SMTP id y17-20020a199151000000b004f86b8256c4mr7278192lfj.33.1687412441768;
        Wed, 21 Jun 2023 22:40:41 -0700 (PDT)
Date: Thu, 22 Jun 2023 05:40:36 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org, Joel Upham <jupham125@gmail.com>
CC: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 20/23] xen platform: unplug ahci object
In-Reply-To: <9b8183903cbf20db4e2f0dafda9e0ed271a86a8e.1687278381.git.jupham125@gmail.com>
References: <cover.1687278381.git.jupham125@gmail.com> <9b8183903cbf20db4e2f0dafda9e0ed271a86a8e.1687278381.git.jupham125@gmail.com>
Message-ID: <CB4239A2-8502-406A-A594-3065C0D3B104@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



Am 20=2E Juni 2023 17:24:54 UTC schrieb Joel Upham <jupham125@gmail=2Ecom>=
:
>This will unplug the ahci device when the Xen driver calls for an unplug=
=2E
>This has been tested to work in linux and Windows guests=2E
>When q35 is detected, we will remove the ahci controller
>with the hard disks=2E  In the libxl config, cdrom devices
>are put on a seperate ahci controller=2E This allows for 6 cdrom
>devices to be added, and 6 qemu hard disks=2E

Does this also work with KVM Xen emulation? If so, the QEMU manual should =
be updated accordingly in this patch since it explicitly rules out Q35 due =
to missing AHCI unplug: https://gitlab=2Ecom/qemu-project/qemu/-/blob/stabl=
e-8=2E0/docs/system/i386/xen=2Erst?plain=3D1&ref_type=3Dheads#L51

Best regards,
Bernhard

>
>
>Signed-off-by: Joel Upham <jupham125@gmail=2Ecom>
>---
> hw/i386/xen/xen_platform=2Ec | 19 ++++++++++++++++++-
> hw/pci/pci=2Ec               | 17 +++++++++++++++++
> include/hw/pci/pci=2Eh       |  3 +++
> 3 files changed, 38 insertions(+), 1 deletion(-)
>
>diff --git a/hw/i386/xen/xen_platform=2Ec b/hw/i386/xen/xen_platform=2Ec
>index 57f1d742c1=2E=2E0375337222 100644
>--- a/hw/i386/xen/xen_platform=2Ec
>+++ b/hw/i386/xen/xen_platform=2Ec
>@@ -34,6 +34,7 @@
> #include "sysemu/block-backend=2Eh"
> #include "qemu/error-report=2Eh"
> #include "qemu/module=2Eh"
>+#include "include/hw/i386/pc=2Eh"
> #include "qom/object=2Eh"
>=20
> #ifdef CONFIG_XEN
>@@ -223,6 +224,12 @@ static void unplug_disks(PCIBus *b, PCIDevice *d, vo=
id *opaque)
>         if (flags & UNPLUG_NVME_DISKS) {
>             object_unparent(OBJECT(d));
>         }
>+        break;
>+
>+    case PCI_CLASS_STORAGE_SATA:
>+	if (!aux) {
>+            object_unparent(OBJECT(d));
>+        }
>=20
>     default:
>         break;
>@@ -231,7 +238,17 @@ static void unplug_disks(PCIBus *b, PCIDevice *d, vo=
id *opaque)
>=20
> static void pci_unplug_disks(PCIBus *bus, uint32_t flags)
> {
>-    pci_for_each_device(bus, 0, unplug_disks, &flags);
>+    PCIBus *q35 =3D find_q35();
>+    if (q35) {
>+        /* When q35 is detected, we will remove the ahci controller
>+	 * with the hard disks=2E  In the libxl config, cdrom devices
>+	 * are put on a seperate ahci controller=2E This allows for 6 cdrom
>+	 * devices to be added, and 6 qemu hard disks=2E
>+	 */
>+        pci_function_for_one_bus(bus, unplug_disks, &flags);
>+    } else {
>+        pci_for_each_device(bus, 0, unplug_disks, &flags);
>+    }
> }
>=20
> static void platform_fixed_ioport_writew(void *opaque, uint32_t addr, ui=
nt32_t val)
>diff --git a/hw/pci/pci=2Ec b/hw/pci/pci=2Ec
>index 1cc7c89036=2E=2E8eac3d751a 100644
>--- a/hw/pci/pci=2Ec
>+++ b/hw/pci/pci=2Ec
>@@ -1815,6 +1815,23 @@ void pci_for_each_device_reverse(PCIBus *bus, int =
bus_num,
>     }
> }
>=20
>+void pci_function_for_one_bus(PCIBus *bus,
>+                          void (*fn)(PCIBus *b, PCIDevice *d, void *opaq=
ue),
>+                          void *opaque)
>+{
>+    bus =3D pci_find_bus_nr(bus, 0);
>+
>+    if (bus) {
>+        PCIDevice *d;
>+
>+        d =3D bus->devices[PCI_DEVFN(4,0)];
>+        if (d) {
>+            fn(bus, d, opaque);
>+            return;
>+        }
>+    }
>+}
>+
> void pci_for_each_device_under_bus(PCIBus *bus,
>                                    pci_bus_dev_fn fn, void *opaque)
> {
>diff --git a/include/hw/pci/pci=2Eh b/include/hw/pci/pci=2Eh
>index e6d0574a29=2E=2Ec53e21082a 100644
>--- a/include/hw/pci/pci=2Eh
>+++ b/include/hw/pci/pci=2Eh
>@@ -343,6 +343,9 @@ void pci_for_each_device_under_bus(PCIBus *bus,
> void pci_for_each_device_under_bus_reverse(PCIBus *bus,
>                                            pci_bus_dev_fn fn,
>                                            void *opaque);
>+void pci_function_for_one_bus(PCIBus *bus,
>+                         void (*fn)(PCIBus *bus, PCIDevice *d, void *opa=
que),
>+                         void *opaque);
> void pci_for_each_bus_depth_first(PCIBus *bus, pci_bus_ret_fn begin,
>                                   pci_bus_fn end, void *parent_state);
> PCIDevice *pci_get_function_0(PCIDevice *pci_dev);

