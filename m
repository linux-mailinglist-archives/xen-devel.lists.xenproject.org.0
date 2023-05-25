Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCAE711A85
	for <lists+xen-devel@lfdr.de>; Fri, 26 May 2023 01:20:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539904.841238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2KEV-0007Jj-Rb; Thu, 25 May 2023 23:18:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539904.841238; Thu, 25 May 2023 23:18:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2KEV-0007Hx-Om; Thu, 25 May 2023 23:18:59 +0000
Received: by outflank-mailman (input) for mailman id 539904;
 Thu, 25 May 2023 23:18:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gGWh=BO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1q2KEU-0007Hr-6w
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 23:18:58 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84dd478f-fb52-11ed-b230-6b7b168915f2;
 Fri, 26 May 2023 01:18:56 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E1A0E60B97;
 Thu, 25 May 2023 23:18:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55C29C433D2;
 Thu, 25 May 2023 23:18:53 +0000 (UTC)
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
X-Inumbo-ID: 84dd478f-fb52-11ed-b230-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685056734;
	bh=En/PW37VhNrHjZx8SCC8JoA7W2AGgRTtjGtgFDrtiYk=;
	h=From:To:Cc:Subject:Date:From;
	b=hPtQ2y5IDzTlekGESTgzGnfNKZ+ChPKwBC7nztZUi6SK6OfScobvpDtHS5DNB69nP
	 jl15k7FfLaROdDaVGjc39IPNIxrjDo+hFA9anzskY1VlhJbnr8VfB8FAAE284KY3vy
	 9pHScrkzEmVpbtdvTX9MA0A+5PCRBvuLf2M6S8rUmL6CADtlEOw7C3FWwAj8/cQmfI
	 5HMl0RdhX4bieIg7R8Soc9ZK2l0l59yrvlsCXW6Hgw038yvSwFY1JZxSwbhpE2iS6M
	 +luSkV/AjdvrmjcTy16M2puTtCb4IzRI3M7OVvLV9R4nwz2Q3L3dwd5MI64IGBTHc6
	 XsxGfISFmcfpQ==
From: Stefano Stabellini <sstabellini@kernel.org>
To: roger.pau@citrix.com,
	jbeulich@suse.com
Cc: andrew.cooper3@citrix.com,
	sstabellini@kernel.org,
	xen-devel@lists.xenproject.org,
	Xenia.Ragiadakou@amd.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH v2] xen/x86/pvh: handle ACPI RSDT table in PVH Dom0 build
Date: Thu, 25 May 2023 16:18:51 -0700
Message-Id: <20230525231851.700750-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

Xen always generates a XSDT table even if the firmware provided a RSDT
table. Copy the RSDT header from the firmware table when the XSDT table
is missing.

Fixes: 1d74282c455f ('x86: setup PVHv2 Dom0 ACPI tables')
Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---

Note that this patch is sufficient to get Xen and Dom0 PVH to boot on
QEMU. It turns out that dom0-iommu=none is not needed because QEMU can
actually emulate an AMD IOMMU. I just needed to use the right command
line arguments. Without dom0-iommu=none, the error fixed by the second
patch in v1 doesn't manifest, so I dropped patch 2/2.

FYI this is the QEMU command line to use:

qemu-system-x86_64 \
    -machine q35 \
    -device amd-iommu \
    -m 2G -smp 2 \
    -monitor none -serial stdio \
    -nographic \
    -device virtio-net-pci,netdev=n0 \
    -netdev user,id=n0,tftp=binaries,bootfile=/pxelinux.0

This is pxelinux.0:

kernel xen console=com1 dom0=pvh dom0_mem=1G noreboot
module bzImage console=hvc0
module xen-rootfs.cpio.gz
boot

I'll work on adding a gitlab-ci test for this next.

---
 xen/arch/x86/hvm/dom0_build.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index fd2cbf68bc..e1043e40d2 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -966,7 +966,16 @@ static int __init pvh_setup_acpi_xsdt(struct domain *d, paddr_t madt_addr,
         rc = -EINVAL;
         goto out;
     }
-    xsdt_paddr = rsdp->xsdt_physical_address;
+    /*
+     * Note the header is the same for both RSDT and XSDT, so it's fine to
+     * copy the native RSDT header to the Xen crafted XSDT if no native
+     * XSDT is available.
+     */
+    if ( rsdp->revision > 1 && rsdp->xsdt_physical_address )
+        xsdt_paddr = rsdp->xsdt_physical_address;
+    else
+        xsdt_paddr = rsdp->rsdt_physical_address;
+
     acpi_os_unmap_memory(rsdp, sizeof(*rsdp));
     table = acpi_os_map_memory(xsdt_paddr, sizeof(*table));
     if ( !table )
-- 
2.25.1


