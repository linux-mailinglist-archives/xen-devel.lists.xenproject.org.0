Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6603023E4CA
	for <lists+xen-devel@lfdr.de>; Fri,  7 Aug 2020 01:49:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3pdj-0004FQ-I2; Thu, 06 Aug 2020 23:49:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=flvv=BQ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k3pdi-0004FC-LX
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 23:49:38 +0000
X-Inumbo-ID: ecfadc8d-df65-4027-ba04-4b0b249ec072
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ecfadc8d-df65-4027-ba04-4b0b249ec072;
 Thu, 06 Aug 2020 23:49:38 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7446422CA1;
 Thu,  6 Aug 2020 23:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596757777;
 bh=y/bvXVXIYfS8TsoXxqPnkT0rBiCwLBaUOaB2sinhwII=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RathqVvuF9/ZQFWQuqonkD41ff9FoYx3yIubp0sNft+yv8ZQW6VSkwpeGvuOJupQR
 5gg3g5RASn3D68OUyCDCc6EV+ncEoGgRcRoe4BVlEIErgqsdLdfBnJGQW3ynBRs7lS
 eCCdrIcxDlVe6hA1vPB59Qc3EXXB5I08unnoYDV8=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 02/14] kernel-doc: public/hvm/hvm_op.h
Date: Thu,  6 Aug 2020 16:49:21 -0700
Message-Id: <20200806234933.16448-2-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2008061605410.16004@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2008061605410.16004@sstabellini-ThinkPad-T480s>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: sstabellini@kernel.org, julien@xen.org, wl@xen.org,
 andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, george.dunlap@citrix.com,
 jbeulich@suse.com, Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

Convert in-code comments to kernel-doc format wherever possible.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 xen/include/public/hvm/hvm_op.h | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/xen/include/public/hvm/hvm_op.h b/xen/include/public/hvm/hvm_op.h
index 870ec52060..d62d3a96f8 100644
--- a/xen/include/public/hvm/hvm_op.h
+++ b/xen/include/public/hvm/hvm_op.h
@@ -27,14 +27,26 @@
 #include "../trace.h"
 #include "../event_channel.h"
 
-/* Get/set subcommands: extra argument == pointer to xen_hvm_param struct. */
+/**
+ * DOC: HVMOP_set_param and HVMOP_get_param
+ *
+ * Get/set subcommands: extra argument == pointer to xen_hvm_param struct.
+ */
 #define HVMOP_set_param           0
 #define HVMOP_get_param           1
+
+/**
+ * struct xen_hvm_param
+ */
 struct xen_hvm_param {
-    domid_t  domid;    /* IN */
+    /** @domid: IN parameter */
+    domid_t  domid;
+    /** @pad: padding */
     uint16_t pad;
-    uint32_t index;    /* IN */
-    uint64_t value;    /* IN/OUT */
+    /** @index: IN parameter */
+    uint32_t index;
+    /** @value: IN/OUT parameter */
+    uint64_t value;
 };
 typedef struct xen_hvm_param xen_hvm_param_t;
 DEFINE_XEN_GUEST_HANDLE(xen_hvm_param_t);
-- 
2.17.1


