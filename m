Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7082B6AF00D
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 19:28:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507793.781935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZc2K-00080V-BM; Tue, 07 Mar 2023 18:27:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507793.781935; Tue, 07 Mar 2023 18:27:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZc2J-0007eQ-5K; Tue, 07 Mar 2023 18:27:43 +0000
Received: by outflank-mailman (input) for mailman id 507793;
 Tue, 07 Mar 2023 18:27:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yYpO=67=casper.srs.infradead.org=BATV+9298a7250c90fe94fbb7+7135+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1pZc26-0002MP-79
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 18:27:30 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2cf22e3-bd15-11ed-a550-8520e6686977;
 Tue, 07 Mar 2023 19:27:21 +0100 (CET)
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pZc1o-006deU-A1; Tue, 07 Mar 2023 18:27:12 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pZc1o-009eA9-10; Tue, 07 Mar 2023 18:27:12 +0000
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
X-Inumbo-ID: b2cf22e3-bd15-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=OoYpLHePGTOV3SgREKPbrdXd7gYiqaJPFQARRGBbtMA=; b=t8MD13g0Z1OMh5Mw+Z6Cgptp0o
	qV8M8NSUbcUHYB0wxnYsJPBmTLVNym79gxTpjO9HxaZou0B7oDvbUUrG1rpnM8zwRE82UHYmY9scZ
	ne0H443HyU/lL8PkuGfFDAsUAWoKndAAcIToKoVVFxoC+OkjQjaVI8zsH4J3uVQk2Bh141DdCPmRZ
	fyvYtRT7jKlwWEzWmy9Hll+uqVBCQ5XPUH7nV4hR04P5DxxoOjoK5HdvRzDlm+ep/vl9MzNixNIVp
	u2lBBq8obOqMI6XnpJqBavvNS1igXesMCjmBmZic2HfCzd63SYtd5b1AP7QgTs6IINNhqNMLKes/U
	IUbKWvsA==;
From: David Woodhouse <dwmw2@infradead.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Joao Martins <joao.m.martins@oracle.com>,
	Ankur Arora <ankur.a.arora@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	vikram.garhwal@amd.com,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org,
	Juan Quintela <quintela@redhat.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PULL 27/27] docs: Update Xen-on-KVM documentation for PV disk support
Date: Tue,  7 Mar 2023 18:27:07 +0000
Message-Id: <20230307182707.2298618-28-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230307182707.2298618-1-dwmw2@infradead.org>
References: <20230307182707.2298618-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 docs/system/i386/xen.rst | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/docs/system/i386/xen.rst b/docs/system/i386/xen.rst
index a00523b492..f06765e88c 100644
--- a/docs/system/i386/xen.rst
+++ b/docs/system/i386/xen.rst
@@ -9,6 +9,8 @@ KVM has support for hosting Xen guests, intercepting Xen hypercalls and event
 channel (Xen PV interrupt) delivery. This allows guests which expect to be
 run under Xen to be hosted in QEMU under Linux/KVM instead.
 
+Using the split irqchip is mandatory for Xen support.
+
 Setup
 -----
 
@@ -17,14 +19,14 @@ accelerator, for example for Xen 4.10:
 
 .. parsed-literal::
 
-  |qemu_system| --accel kvm,xen-version=0x4000a
+  |qemu_system| --accel kvm,xen-version=0x4000a,kernel-irqchip=split
 
 Additionally, virtual APIC support can be advertised to the guest through the
 ``xen-vapic`` CPU flag:
 
 .. parsed-literal::
 
-  |qemu_system| --accel kvm,xen-version=0x4000a --cpu host,+xen_vapic
+  |qemu_system| --accel kvm,xen-version=0x4000a,kernel-irqchip=split --cpu host,+xen_vapic
 
 When Xen support is enabled, QEMU changes hypervisor identification (CPUID
 0x40000000..0x4000000A) to Xen. The KVM identification and features are not
@@ -33,11 +35,25 @@ moves to leaves 0x40000100..0x4000010A.
 
 The Xen platform device is enabled automatically for a Xen guest. This allows
 a guest to unplug all emulated devices, in order to use Xen PV block and network
-drivers instead. Note that until the Xen PV device back ends are enabled to work
-with Xen mode in QEMU, that is unlikely to cause significant joy. Linux guests
-can be dissuaded from this by adding 'xen_emul_unplug=never' on their command
-line, and it can also be noted that AHCI disk controllers are exempt from being
-unplugged, as are passthrough VFIO PCI devices.
+drivers instead. Under Xen, the boot disk is typically available both via IDE
+emulation, and as a PV block device. Guest bootloaders typically use IDE to load
+the guest kernel, which then unplugs the IDE and continues with the Xen PV block
+device.
+
+This configuration can be achieved as follows
+
+.. parsed-literal::
+
+  |qemu_system| -M pc --accel kvm,xen-version=0x4000a,kernel-irqchip=split \\
+       -drive file=${GUEST_IMAGE},if=none,id=disk,file.locking=off -device xen-disk,drive=disk,vdev=xvda \\
+       -drive file=${GUEST_IMAGE},index=2,media=disk,file.locking=off,if=ide
+
+It is necessary to use the pc machine type, as the q35 machine uses AHCI instead
+of legacy IDE, and AHCI disks are not unplugged through the Xen PV unplug
+mechanism.
+
+VirtIO devices can also be used; Linux guests may need to be dissuaded from
+umplugging them by adding 'xen_emul_unplug=never' on their command line.
 
 Properties
 ----------
-- 
2.39.0


