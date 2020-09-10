Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6051526509F
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 22:23:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGT5v-0004Ug-PE; Thu, 10 Sep 2020 20:22:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vQLO=CT=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kGT5t-0004JK-T8
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 20:22:57 +0000
X-Inumbo-ID: 63e7381b-d19f-4728-9ca9-4a91c3d046c1
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 63e7381b-d19f-4728-9ca9-4a91c3d046c1;
 Thu, 10 Sep 2020 20:22:34 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id u4so9846844ljd.10
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2020 13:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Xd9iPDbckbDh0wvQoJOmY8nE/E6rj2WKAm7YYXahUG8=;
 b=kUHzfdbeYX+1fNweXVyqWPoIQCYSHnDosSe2bk/LjiIm2cCs8Ik0klq9GF+3f40dit
 ousNQsT54x+QnUUQliKOHytjh72T8r5X0S5TIjRaPNncQ7YgXXowWSP1JRNvR4eZN6Es
 Bb5KmjWCLZ69+5T+tL+BjSyaaqiE8sBY2UnX9/nydrHY5JR8LKI1rKh1N0JfewPbxLeD
 4WgpMqQumdoihhS4RpCC2P/NvmxtH/ALXqc3/HOQSTeSXP3sGlFkMrUe1WKCPbV/BETt
 f8ZxKA+l62lX7j5EIJ9ROdBaJqU1Tvfv0tEhfdi9d2zil4IXPubYQhz0MeTTq20NtUMS
 fYPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Xd9iPDbckbDh0wvQoJOmY8nE/E6rj2WKAm7YYXahUG8=;
 b=Q3SvBP32rgkVhSPdZ0X3W0vaKKBN+SXr+/8p1dEw0sNEj3rXcKRYB/eYMn3zmyrKO6
 Om6sbza+3j9GosBCoWjGPjFXIvYtOk6931CuMyhz7SjW4rYajoJ5QuilCzOhsPhKPwEu
 8s2Dk4seexSL5oZZ1Z9q6tAcyohE1LWgbf0PxI0WLwCluDEuPev4zuS77GKUkGLBME3f
 ahUlUl9r3GPNf176OJbUx0cpGE2GqeBXPEs3L/TmlFweAheMwYFBBOCHr7qj9qtiNJgE
 cb7cEXps85UPX4o18Vb4WXbuPxDKYK721ol94wHtrp1XCJdz+e5oczqjGFNwY4Wg4hgS
 qo8g==
X-Gm-Message-State: AOAM533wOZmitqeAoB33EyriA16CX96uFTMRd6Z/bxBlgRYkQVzZP8tT
 On47pS0nqO79kx1Q4stPtNL1HiFGn+eU1A==
X-Google-Smtp-Source: ABdhPJzHfYDsXcMyXftFqHXtCuD4MsFu2fE2g9xUrx/wZ9z3CdaN7IrEpKZ0zson/Yi+fAm+PRbyFw==
X-Received: by 2002:a2e:b0d2:: with SMTP id g18mr5569976ljl.198.1599769353414; 
 Thu, 10 Sep 2020 13:22:33 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id u5sm1584375lfq.17.2020.09.10.13.22.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Sep 2020 13:22:32 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>
Subject: [PATCH V1 06/16] xen/ioreq: Make x86's hvm_ioreq_(page/vcpu/server)
 structs common
Date: Thu, 10 Sep 2020 23:22:00 +0300
Message-Id: <1599769330-17656-7-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

The IOREQ is a common feature now and these structs will be used
on Arm as is. Move them to xen/ioreq.h

Signed-off-by: Julien Grall <julien.grall@arm.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Changes RFC -> V1:
   - new patch
---
---
 xen/include/asm-x86/hvm/domain.h | 34 ----------------------------------
 xen/include/xen/ioreq.h          | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/xen/include/asm-x86/hvm/domain.h b/xen/include/asm-x86/hvm/domain.h
index 9d247ba..765f35c 100644
--- a/xen/include/asm-x86/hvm/domain.h
+++ b/xen/include/asm-x86/hvm/domain.h
@@ -30,40 +30,6 @@
 
 #include <public/hvm/dm_op.h>
 
-struct hvm_ioreq_page {
-    gfn_t gfn;
-    struct page_info *page;
-    void *va;
-};
-
-struct hvm_ioreq_vcpu {
-    struct list_head list_entry;
-    struct vcpu      *vcpu;
-    evtchn_port_t    ioreq_evtchn;
-    bool             pending;
-};
-
-#define NR_IO_RANGE_TYPES (XEN_DMOP_IO_RANGE_PCI + 1)
-#define MAX_NR_IO_RANGES  256
-
-struct hvm_ioreq_server {
-    struct domain          *target, *emulator;
-
-    /* Lock to serialize toolstack modifications */
-    spinlock_t             lock;
-
-    struct hvm_ioreq_page  ioreq;
-    struct list_head       ioreq_vcpu_list;
-    struct hvm_ioreq_page  bufioreq;
-
-    /* Lock to serialize access to buffered ioreq ring */
-    spinlock_t             bufioreq_lock;
-    evtchn_port_t          bufioreq_evtchn;
-    struct rangeset        *range[NR_IO_RANGE_TYPES];
-    bool                   enabled;
-    uint8_t                bufioreq_handling;
-};
-
 #ifdef CONFIG_MEM_SHARING
 struct mem_sharing_domain
 {
diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
index 9521170..102f7e8 100644
--- a/xen/include/xen/ioreq.h
+++ b/xen/include/xen/ioreq.h
@@ -23,6 +23,40 @@
 
 #include <asm/hvm/ioreq.h>
 
+struct hvm_ioreq_page {
+    gfn_t gfn;
+    struct page_info *page;
+    void *va;
+};
+
+struct hvm_ioreq_vcpu {
+    struct list_head list_entry;
+    struct vcpu      *vcpu;
+    evtchn_port_t    ioreq_evtchn;
+    bool             pending;
+};
+
+#define NR_IO_RANGE_TYPES (XEN_DMOP_IO_RANGE_PCI + 1)
+#define MAX_NR_IO_RANGES  256
+
+struct hvm_ioreq_server {
+    struct domain          *target, *emulator;
+
+    /* Lock to serialize toolstack modifications */
+    spinlock_t             lock;
+
+    struct hvm_ioreq_page  ioreq;
+    struct list_head       ioreq_vcpu_list;
+    struct hvm_ioreq_page  bufioreq;
+
+    /* Lock to serialize access to buffered ioreq ring */
+    spinlock_t             bufioreq_lock;
+    evtchn_port_t          bufioreq_evtchn;
+    struct rangeset        *range[NR_IO_RANGE_TYPES];
+    bool                   enabled;
+    uint8_t                bufioreq_handling;
+};
+
 #define GET_IOREQ_SERVER(d, id) \
     (d)->arch.hvm.ioreq_server.server[id]
 
-- 
2.7.4


