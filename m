Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE31D36BF7C
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 08:54:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.117839.223984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbHbl-0007TM-6n; Tue, 27 Apr 2021 06:54:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 117839.223984; Tue, 27 Apr 2021 06:54:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbHbl-0007Sv-3g; Tue, 27 Apr 2021 06:54:09 +0000
Received: by outflank-mailman (input) for mailman id 117839;
 Mon, 26 Apr 2021 17:25:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2OOr=JX=gmail.com=scottwd@srs-us1.protection.inumbo.net>)
 id 1lb4z4-0002uj-AJ
 for xen-devel@lists.xenproject.org; Mon, 26 Apr 2021 17:25:22 +0000
Received: from mail-qv1-xf2f.google.com (unknown [2607:f8b0:4864:20::f2f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4d641eb6-058d-44d8-a1c3-2ae2c604017a;
 Mon, 26 Apr 2021 17:25:21 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id gv2so18312271qvb.8
 for <xen-devel@lists.xenproject.org>; Mon, 26 Apr 2021 10:25:21 -0700 (PDT)
Received: from lagunitas.localdomain (c-73-133-107-223.hsd1.md.comcast.net.
 [73.133.107.223])
 by smtp.gmail.com with ESMTPSA id n16sm12106858qtl.48.2021.04.26.10.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 10:25:20 -0700 (PDT)
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
X-Inumbo-ID: 4d641eb6-058d-44d8-a1c3-2ae2c604017a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yavZ8Mp3QoAF3oXvGJpeEdswou3Jx8Tn5pRND0ZlaNg=;
        b=B84teXQJslcnj210mBWkFDKbE8jvJUmlNZL/qTImqptMgap+j/G8W8wkxum+RZedJl
         +KkQmMv02MtyuQAqjzPMIVJFWWpRwU7ddlmT3rVhFfGT2KV7UYup7MxrnQJmiCW9OUQY
         zuE/ki7ixlf1UQzglhkR8LXhUr3lYxTvKasx3Lj++P+IKq3pWOcZnjG1X9lf7zyb2334
         egVgEh2cbXYlndBCqCduyhEG+8QHBPlUYwMK1ThebZ0AKQZ/AzF+vF1AG2A/vfGg8IfO
         ePcWHJESse3MqkmP1bznSpALQmrxc9S2tnPSyW+ik392I6SXpsjEUWMn0TDhEDY5YdFQ
         L8bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yavZ8Mp3QoAF3oXvGJpeEdswou3Jx8Tn5pRND0ZlaNg=;
        b=e9p9Vk3hlUZYLN2SInIF9i81dX69O0OtL8if1MS5ew2OhkThDQWaZJnrCgA/pAfKq1
         VpGIuRENjILGcAAMJXxOiShq5C23QDYbJsSvggWgybh5APBPMTZsaolpqCe4kvzsVb3G
         lcOwC0tAMUQTssRDlf/Z7/jvsPf1puPrRl54WV8XdCO8pCCsH2H8PqMnkRDijQ9orbNL
         gq2mxp26OeKkPtW6uhM9g6i/P/HB8GsE9ECLaYtxs4WO2aj99JFD3DLfOYtxQNaIp7Ig
         QvQAemf4wmFsjUQwlOpOvTSw15NL45CNpTznaOF4qUAURv/b0BonTIEFpJkW+Rv+8aDs
         WXPw==
X-Gm-Message-State: AOAM531BWqqN/7oNwJK5GBWpscejJ+MIlnc/aIPI3UzsvZObp5IeUhG4
	mxdLBEvr8xeJQgKqo4DjoeaVNP0gJEQDqmt4
X-Google-Smtp-Source: ABdhPJx+VaIsfSDf8tNITIvqClyd3IVcPWhiNYkJ1Vr/Rzjdku9LVpGOjSGuYZAaQgzUScU+JLt0rA==
X-Received: by 2002:a0c:b218:: with SMTP id x24mr19197551qvd.55.1619457920442;
        Mon, 26 Apr 2021 10:25:20 -0700 (PDT)
From: Scott Davis <scottwd@gmail.com>
X-Google-Original-From: Scott Davis <scott.davis@starlab.io>
To: xen-devel@lists.xenproject.org
Cc: Scott Davis <scott.davis@starlab.io>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <ian.jackson@eu.citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>
Subject: [RFC PATCH] iommu: make no-quarantine mean no-quarantine
Date: Mon, 26 Apr 2021 13:25:12 -0400
Message-Id: <0a292d952ff71dbfed5234d27b42a05f7b49a1fe.1619451434.git.scott.davis@starlab.io>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch modifies Xen's behavior when making devices assignable while the
iommu=no-quarantine command line option is in effect. Currently this option
only affects device deassignment, causing devices to get immediately assigned
back to Dom0 instead of to the quarantine dom_io domain. This patch extends
no-quarantine to device assignment as well, preventing devices from being
assigned to dom_io when they are made assignable while no-quarantine is in
effect.

Signed-off-by: Scott Davis <scott.davis@starlab.io>
---
First patch submission, apologies in advance for any formatting or other errors.

Background: I am setting up a QEMU-based development and testing environment for
the Crucible team at Star Lab that includes emulated PCIe devices for
passthrough and hotplug. I encountered an issue with `xl pci-assignable-add`
that causes the host QEMU to rapidly allocate memory until getting OOM-killed.
I then found that the issue could be worked around either by using manual sysfs
commands to rebind devices to pciback or by skipping over the quarantine logic
in `libxl__device_pci_assignable_add`, producing a working system. I hoped that
setting iommu=no-quarantine on the command line would have the same effect, only
to be surprised that it did not.

This patch fixes the issue I encountered and, in my opinion, makes the behavior
of no-quarantine more intuitive. While I intend to root-cause whatever
interaction between Xen and QEMU's VT-d vIOMMU is causing the problem, I plan to
carry this patch, or one like it, in the meantime. I'd welcome any feedback on
its design or intent. Note that this RFC version is based and tested on
Crucible's 4.14.1 branch of Xen, but I will rebase and test on staging if it's
desired upstream in some form.
---
 docs/misc/xen-command-line.pandoc | 8 ++++----
 xen/drivers/passthrough/pci.c     | 9 +++++++--
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 4ae9391fcd..1015f95dd5 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1317,10 +1317,10 @@ boolean (e.g. `iommu=no`) can override this and leave the IOMMUs disabled.
     successfully.

 *   The `quarantine` boolean can be used to control Xen's behavior when
-    de-assigning devices from guests.  If enabled (the default), Xen always
-    quarantines such devices; they must be explicitly assigned back to Dom0
-    before they can be used there again.  If disabled, Xen will only
-    quarantine devices the toolstack hass arranged for getting quarantined.
+    making devices assignable to guests and de-assigning devices from guests.
+    If enabled (the default), Xen will quarantine such devices; they must be
+    explicitly assigned back to Dom0 before they can be used there again.  If
+    disabled, Xen will not quarantine devices.

 *   The `sharept` boolean controls whether the IOMMU pagetables are shared
     with the CPU-side HAP pagetables, or allocated separately.  Sharing
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 2d6238a5bb..4c37f2d272 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -935,9 +935,14 @@ static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
         return -EINVAL;

     ASSERT(pcidevs_locked());
-    pdev = pci_get_pdev_by_domain(d, seg, bus, devfn);
+    pdev = pci_get_pdev(seg, bus, devfn);
     if ( !pdev )
         return -ENODEV;
+    else if ( d == dom_io && pdev->domain != dom_io )
+        /* OK: Request to de-quarantine a device that is not quarantined */
+        return 0;
+    else if ( pdev->domain != d )
+        return -ENODEV;

     /* De-assignment from dom_io should de-quarantine the device */
     target = ((pdev->quarantine || iommu_quarantine) &&
@@ -1510,7 +1515,7 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
     struct pci_dev *pdev;
     int rc = 0;

-    if ( !is_iommu_enabled(d) )
+    if ( !is_iommu_enabled(d) || (d == dom_io && !iommu_quarantine) )
         return 0;

     /* Prevent device assign if mem paging or mem sharing have been
--
2.25.1

