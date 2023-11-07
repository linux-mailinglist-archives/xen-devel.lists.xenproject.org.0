Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB1E7E37A8
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 10:22:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628630.980285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0IHr-00022P-Nx; Tue, 07 Nov 2023 09:22:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628630.980285; Tue, 07 Nov 2023 09:22:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0IHr-0001zm-Ko; Tue, 07 Nov 2023 09:22:19 +0000
Received: by outflank-mailman (input) for mailman id 628630;
 Tue, 07 Nov 2023 09:22:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vjcX=GU=casper.srs.infradead.org=BATV+0fd401c0b30749933da3+7380+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1r0IHq-0001Vh-0H
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 09:22:18 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24892248-7d4f-11ee-98da-6d05b1d4d9a1;
 Tue, 07 Nov 2023 10:22:16 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1r0IHO-00BPkY-3C; Tue, 07 Nov 2023 09:21:50 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1r0IHO-001hKo-19; Tue, 07 Nov 2023 09:21:50 +0000
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
X-Inumbo-ID: 24892248-7d4f-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=YJV5o104qjauuiRqcLLaaBRiRTHcW4la7jnMKfwf+K4=; b=cXL8LypY6rlFsaV56+e/DjbVqU
	RoQUR6lbnGbrqsclyoZC+HYzegiv3pFjFQCZ7gU1ug+xOoRcxJP3Jr9OOK+SfkppcR9DD7sHeC+SN
	wjm1KPuYqZNv/VLy9SXZY5IF9fqUMwNebr0vQlGypMe3zYjRc9oiPNycttxsNL4IZd8/ADWGaEeSE
	dWJg+EL41yAVH6MXSwbteq9Ap45i+71y9TTtGb+V+pX2DyOlmPVLdgizOivb2ajAMP2irEh/yb0w6
	GLxqgwCm40NU5OBiXq/u8G4vv7N+HssHaZXqAtZjQpL3Owh2OMm9N0oGg4KWw/eWtAWh4+4MZyE20
	rPtyB4cQ==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Jason Wang <jasowang@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	qemu-block@nongnu.org,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org
Subject: [PULL 15/15] docs: update Xen-on-KVM documentation
Date: Tue,  7 Nov 2023 09:21:47 +0000
Message-ID: <20231107092149.404842-16-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231107092149.404842-1-dwmw2@infradead.org>
References: <20231107092149.404842-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Add notes about console and network support, and how to launch PV guests.
Clean up the disk configuration examples now that that's simpler, and
remove the comment about IDE unplug on q35/AHCI now that it's fixed.

Update the -initrd option documentation to explain how to quote commas
in module command lines, and reference it when documenting PV guests.

Also update stale avocado test filename in MAINTAINERS.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 MAINTAINERS              |   2 +-
 docs/system/i386/xen.rst | 107 +++++++++++++++++++++++++++++----------
 qemu-options.hx          |  12 ++++-
 3 files changed, 90 insertions(+), 31 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 59b92ee640..fd6b362311 100644
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
index f06765e88c..81898768ba 100644
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
+module. For more complicated alternatives, see the command line
+documentation for the ``-initrd`` option.
+
+Host OS requirements
+--------------------
 
 The minimal Xen support in the KVM accelerator requires the host to be running
 Linux v5.12 or newer. Later versions add optimisations: Linux v5.17 added
diff --git a/qemu-options.hx b/qemu-options.hx
index 7809036d8c..3eee3c33eb 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3986,14 +3986,22 @@ ERST
 DEF("initrd", HAS_ARG, QEMU_OPTION_initrd, \
            "-initrd file    use 'file' as initial ram disk\n", QEMU_ARCH_ALL)
 SRST
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
2.41.0


