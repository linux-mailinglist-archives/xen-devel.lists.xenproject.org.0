Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 595BD7E2750
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 15:43:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628087.979158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r00p5-0007AS-HU; Mon, 06 Nov 2023 14:43:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628087.979158; Mon, 06 Nov 2023 14:43:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r00p5-000783-Ca; Mon, 06 Nov 2023 14:43:27 +0000
Received: by outflank-mailman (input) for mailman id 628087;
 Mon, 06 Nov 2023 14:43:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wwoJ=GT=infradead.org=prvs=667a8cc2a=dwmw2@srs-se1.protection.inumbo.net>)
 id 1r00iD-0008Lv-9o
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 14:36:21 +0000
Received: from smtp-fw-80008.amazon.com (smtp-fw-80008.amazon.com
 [99.78.197.219]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8f81c57-7cb1-11ee-98da-6d05b1d4d9a1;
 Mon, 06 Nov 2023 15:36:20 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-pdx-2a-m6i4x-af372327.us-west-2.amazon.com)
 ([10.25.36.214]) by smtp-border-fw-80008.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 14:36:18 +0000
Received: from smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev
 (pdx2-ws-svc-p26-lb5-vlan2.pdx.amazon.com [10.39.38.66])
 by email-inbound-relay-pdx-2a-m6i4x-af372327.us-west-2.amazon.com (Postfix)
 with ESMTPS id 2CCF460F5A; Mon,  6 Nov 2023 14:36:16 +0000 (UTC)
Received: from EX19MTAUWA002.ant.amazon.com [10.0.38.20:39754]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.11.184:2525]
 with esmtp (Farcaster)
 id 765750b6-add6-4432-93b6-144cb5af84c7; Mon, 6 Nov 2023 14:36:15 +0000 (UTC)
Received: from EX19MTAUWB001.ant.amazon.com (10.250.64.248) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Mon, 6 Nov 2023 14:36:07 +0000
Received: from u3832b3a9db3152.ant.amazon.com (10.106.83.6) by
 mail-relay.amazon.com (10.250.64.254) with Microsoft SMTP Server id
 15.2.1118.39 via Frontend Transport; Mon, 6 Nov 2023 14:36:04 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: d8f81c57-7cb1-11ee-98da-6d05b1d4d9a1
X-IronPort-AV: E=Sophos;i="6.03,281,1694736000"; 
   d="scan'208";a="41362663"
X-Farcaster-Flow-ID: 765750b6-add6-4432-93b6-144cb5af84c7
From: David Woodhouse <dwmw2@infradead.org>
To: <qemu-devel@nongnu.org>
CC: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, Paul
 Durrant <paul@xen.org>, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?=
	<marcandre.lureau@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Eduardo Habkost
	<eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Jason Wang <jasowang@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>, <qemu-block@nongnu.org>,
	<xen-devel@lists.xenproject.org>, <kvm@vger.kernel.org>
Subject: [PATCH v4 17/17] docs: update Xen-on-KVM documentation
Date: Mon, 6 Nov 2023 14:35:07 +0000
Message-ID: <20231106143507.1060610-18-dwmw2@infradead.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231106143507.1060610-1-dwmw2@infradead.org>
References: <20231106143507.1060610-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: Bulk

From: David Woodhouse <dwmw@amazon.co.uk>

Add notes about console and network support, and how to launch PV guests.
Clean up the disk configuration examples now that that's simpler, and
remove the comment about IDE unplug on q35/AHCI now that it's fixed.

Update the -initrd option documentation to explain how to quote commas
in module command lines, and reference it when documenting PV guests.

Also update stale avocado test filename in MAINTAINERS.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 MAINTAINERS              |   2 +-
 docs/system/i386/xen.rst | 107 +++++++++++++++++++++++++++++----------
 qemu-options.hx          |  14 +++--
 3 files changed, 91 insertions(+), 32 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8e8a7d5be5..3252be2696 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -490,7 +490,7 @@ S: Supported
 F: include/sysemu/kvm_xen.h
 F: target/i386/kvm/xen*
 F: hw/i386/kvm/xen*
-F: tests/avocado/xen_guest.py
+F: tests/avocado/kvm_xen_guest.py
 
 Guest CPU Cores (other accelerators)
 ------------------------------------
diff --git a/docs/system/i386/xen.rst b/docs/system/i386/xen.rst
index f06765e88c..f3bd90d4d6 100644
--- a/docs/system/i386/xen.rst
+++ b/docs/system/i386/xen.rst
@@ -15,46 +15,24 @@ Setup
 -----
 
 Xen mode is enabled by setting the ``xen-version`` property of the KVM
-accelerator, for example for Xen 4.10:
+accelerator, for example for Xen 4.17:
 
 .. parsed-literal::
 
-  |qemu_system| --accel kvm,xen-version=0x4000a,kernel-irqchip=split
+  |qemu_system| --accel kvm,xen-version=0x40011,kernel-irqchip=split
 
 Additionally, virtual APIC support can be advertised to the guest through the
 ``xen-vapic`` CPU flag:
 
 .. parsed-literal::
 
-  |qemu_system| --accel kvm,xen-version=0x4000a,kernel-irqchip=split --cpu host,+xen_vapic
+  |qemu_system| --accel kvm,xen-version=0x40011,kernel-irqchip=split --cpu host,+xen-vapic
 
 When Xen support is enabled, QEMU changes hypervisor identification (CPUID
 0x40000000..0x4000000A) to Xen. The KVM identification and features are not
 advertised to a Xen guest. If Hyper-V is also enabled, the Xen identification
 moves to leaves 0x40000100..0x4000010A.
 
-The Xen platform device is enabled automatically for a Xen guest. This allows
-a guest to unplug all emulated devices, in order to use Xen PV block and network
-drivers instead. Under Xen, the boot disk is typically available both via IDE
-emulation, and as a PV block device. Guest bootloaders typically use IDE to load
-the guest kernel, which then unplugs the IDE and continues with the Xen PV block
-device.
-
-This configuration can be achieved as follows
-
-.. parsed-literal::
-
-  |qemu_system| -M pc --accel kvm,xen-version=0x4000a,kernel-irqchip=split \\
-       -drive file=${GUEST_IMAGE},if=none,id=disk,file.locking=off -device xen-disk,drive=disk,vdev=xvda \\
-       -drive file=${GUEST_IMAGE},index=2,media=disk,file.locking=off,if=ide
-
-It is necessary to use the pc machine type, as the q35 machine uses AHCI instead
-of legacy IDE, and AHCI disks are not unplugged through the Xen PV unplug
-mechanism.
-
-VirtIO devices can also be used; Linux guests may need to be dissuaded from
-umplugging them by adding 'xen_emul_unplug=never' on their command line.
-
 Properties
 ----------
 
@@ -63,7 +41,10 @@ The following properties exist on the KVM accelerator object:
 ``xen-version``
   This property contains the Xen version in ``XENVER_version`` form, with the
   major version in the top 16 bits and the minor version in the low 16 bits.
-  Setting this property enables the Xen guest support.
+  Setting this property enables the Xen guest support. If Xen version 4.5 or
+  greater is specified, the HVM leaf in Xen CPUID is populated. Xen version
+  4.6 enables the vCPU ID in CPUID, and version 4.17 advertises vCPU upcall
+  vector support to the guest.
 
 ``xen-evtchn-max-pirq``
   Xen PIRQs represent an emulated physical interrupt, either GSI or MSI, which
@@ -83,8 +64,78 @@ The following properties exist on the KVM accelerator object:
   through simultaneous grants. For guests with large numbers of PV devices and
   high throughput, it may be desirable to increase this value.
 
-OS requirements
----------------
+Xen paravirtual devices
+-----------------------
+
+The Xen PCI platform device is enabled automatically for a Xen guest. This
+allows a guest to unplug all emulated devices, in order to use paravirtual
+block and network drivers instead.
+
+Those paravirtual Xen block, network (and console) devices can be created
+through the command line, and/or hot-plugged.
+
+To provide a Xen console device, define a character device and then a device
+of type ``xen-console`` to connect to it. For the Xen console equivalent of
+the handy ``-serial mon:stdio`` option, for example:
+
+.. parsed-literal::
+   -chardev stdio,mux=on,id=char0,signal=off -mon char0 \\
+   -device xen-console,chardev=char0
+
+The Xen network device is ``xen-net-device``, which becomes the default NIC
+model for emulated Xen guests, meaning that just the default NIC provided
+by QEMU should automatically work and present a Xen network device to the
+guest.
+
+Disks can be configured with '``-drive file=${GUEST_IMAGE},if=xen``' and will
+appear to the guest as ``xvda`` onwards.
+
+Under Xen, the boot disk is typically available both via IDE emulation, and
+as a PV block device. Guest bootloaders typically use IDE to load the guest
+kernel, which then unplugs the IDE and continues with the Xen PV block device.
+
+This configuration can be achieved as follows:
+
+.. parsed-literal::
+
+  |qemu_system| --accel kvm,xen-version=0x40011,kernel-irqchip=split \\
+       -drive file=${GUEST_IMAGE},if=xen \\
+       -drive file=${GUEST_IMAGE},file.locking=off,if=ide
+
+VirtIO devices can also be used; Linux guests may need to be dissuaded from
+umplugging them by adding '``xen_emul_unplug=never``' on their command line.
+
+Booting Xen PV guests
+---------------------
+
+Booting PV guest kernels is possible by using the Xen PV shim (a version of Xen
+itself, designed to run inside a Xen HVM guest and provide memory management
+services for one guest alone).
+
+The Xen binary is provided as the ``-kernel`` and the guest kernel itself (or
+PV Grub image) as the ``-initrd`` image, which actually just means the first
+multiboot "module". For example:
+
+.. parsed-literal::
+
+  |qemu_system| --accel kvm,xen-version=0x40011,kernel-irqchip=split \\
+       -chardev stdio,id=char0 -device xen-console,chardev=char0 \\
+       -display none  -m 1G  -kernel xen -initrd bzImage \\
+       -append "pv-shim console=xen,pv -- console=hvc0 root=/dev/xvda1" \\
+       -drive file=${GUEST_IMAGE},if=xen
+
+The Xen image must be built with the ``CONFIG_XEN_GUEST`` and ``CONFIG_PV_SHIM``
+options, and as of Xen 4.17, Xen's PV shim mode does not support using a serial
+port; it must have a Xen console or it will panic.
+
+The example above provides the guest kernel command line after a separator
+(" ``--`` ") on the Xen command line, and does not provide the guest kernel
+with an actual initramfs, which would need to listed as a second multiboot
+module. For more complicated alternatives, see the
+:ref:`documentation <initrd-reference-label>` for the ``-initrd`` option.
+
+Host OS requirements
+--------------------
 
 The minimal Xen support in the KVM accelerator requires the host to be running
 Linux v5.12 or newer. Later versions add optimisations: Linux v5.17 added
diff --git a/qemu-options.hx b/qemu-options.hx
index e26230bac5..e2c037815a 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3981,15 +3981,23 @@ ERST
 
 DEF("initrd", HAS_ARG, QEMU_OPTION_initrd, \
            "-initrd file    use 'file' as initial ram disk\n", QEMU_ARCH_ALL)
-SRST
+SRST(initrd)
+
 ``-initrd file``
     Use file as initial ram disk.
 
 ``-initrd "file1 arg=foo,file2"``
     This syntax is only available with multiboot.
 
-    Use file1 and file2 as modules and pass arg=foo as parameter to the
-    first module.
+    Use file1 and file2 as modules and pass ``arg=foo`` as parameter to the
+    first module. Commas can be provided in module parameters by doubling
+    them on the command line to escape them:
+
+``-initrd "bzImage earlyprintk=xen,,keep root=/dev/xvda1,initrd.img"``
+    Multiboot only. Use bzImage as the first module with
+    "``earlyprintk=xen,keep root=/dev/xvda1``" as its command line,
+    and initrd.img as the second module.
+
 ERST
 
 DEF("dtb", HAS_ARG, QEMU_OPTION_dtb, \
-- 
2.34.1


