Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 441643F18CC
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 14:09:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168683.307974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGgr0-0001ed-29; Thu, 19 Aug 2021 12:09:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168683.307974; Thu, 19 Aug 2021 12:09:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGgqz-0001cY-VG; Thu, 19 Aug 2021 12:09:01 +0000
Received: by outflank-mailman (input) for mailman id 168683;
 Thu, 19 Aug 2021 12:09:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HKsV=NK=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1mGgqy-0001W6-GO
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 12:09:00 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 39acc188-00e6-11ec-a5f6-12813bfff9fa;
 Thu, 19 Aug 2021 12:08:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 128DC31B;
 Thu, 19 Aug 2021 05:08:55 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C87D3F70D;
 Thu, 19 Aug 2021 05:08:54 -0700 (PDT)
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
X-Inumbo-ID: 39acc188-00e6-11ec-a5f6-12813bfff9fa
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1 13/14] xen/arm: Fixed error when PCI device is assigned to guest
Date: Thu, 19 Aug 2021 13:02:53 +0100
Message-Id: <917720808121c3098690b51d55f2d60118ec6408.1629366665.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1629366665.git.rahul.singh@arm.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
In-Reply-To: <cover.1629366665.git.rahul.singh@arm.com>
References: <cover.1629366665.git.rahul.singh@arm.com>

XEN_DOMCTL_ioport_permission, PHYSDEVOP_unmap_pirq, PHYSDEVOP_unmap_pirq
are unimplemented for ARM. When libxl assigning a PCI device to the
guest error is observed related to above functions.

Implement dummy functions to fix the error.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/arch/arm/domctl.c  | 2 ++
 xen/arch/arm/physdev.c | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
index b7d27f37df..38813be893 100644
--- a/xen/arch/arm/domctl.c
+++ b/xen/arch/arm/domctl.c
@@ -173,6 +173,8 @@ long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
 
         return rc;
     }
+    case XEN_DOMCTL_ioport_permission:
+        return 0;
     default:
     {
         int rc;
diff --git a/xen/arch/arm/physdev.c b/xen/arch/arm/physdev.c
index ccce8f0eba..4a0affeada 100644
--- a/xen/arch/arm/physdev.c
+++ b/xen/arch/arm/physdev.c
@@ -42,6 +42,9 @@ int do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         break;
     }
 #endif
+    case PHYSDEVOP_unmap_pirq:
+    case PHYSDEVOP_map_pirq:
+        break;
     default:
         gdprintk(XENLOG_DEBUG, "PHYSDEVOP cmd=%d: not implemented\n", cmd);
         ret = -ENOSYS;
-- 
2.17.1


