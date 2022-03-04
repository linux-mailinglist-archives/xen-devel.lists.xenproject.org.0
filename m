Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 633EE4CDC07
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 19:17:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284416.483722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCU8-0003K1-Gb; Fri, 04 Mar 2022 18:17:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284416.483722; Fri, 04 Mar 2022 18:17:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCU7-00031O-SC; Fri, 04 Mar 2022 18:16:59 +0000
Received: by outflank-mailman (input) for mailman id 284416;
 Fri, 04 Mar 2022 17:48:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WvCO=TP=xt3.it=ms@srs-se1.protection.inumbo.net>)
 id 1nQC26-0005R4-GX
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 17:48:02 +0000
Received: from radon.xt3.it (radon.xt3.it [2a01:4f8:190:4055::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c7d6c1b-9be3-11ec-8eba-a37418f5ba1a;
 Fri, 04 Mar 2022 18:48:01 +0100 (CET)
Received: from nb2assolieri.mat.unimo.it ([155.185.4.56] helo=localhost)
 by radon.xt3.it with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <ms@xt3.it>)
 id 1nQC24-0008S3-TQ; Fri, 04 Mar 2022 18:48:01 +0100
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
X-Inumbo-ID: 3c7d6c1b-9be3-11ec-8eba-a37418f5ba1a
From: Marco Solieri <marco.solieri@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: Marco Solieri <marco.solieri@minervasys.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Marco Solieri <marco.solieri@unimore.it>,
	Andrea Bastoni <andrea.bastoni@minervasys.tech>,
	Luca Miccio <lucmiccio@gmail.com>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH 11/36] xen/include: define hypercall parameter for coloring
Date: Fri,  4 Mar 2022 18:46:36 +0100
Message-Id: <20220304174701.1453977-12-marco.solieri@minervasys.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

During domU creation process the colors selection has to be passed to
the Xen hypercall.
This is generally done using what Xen calls GUEST_HANDLE_PARAMS. In this
case a simple bitmask for the coloring configuration suffices.
Currently the maximum amount of supported colors is 128.
Add a new parameter that allows us to pass both the colors bitmask
and the number of elements in it.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 xen/arch/arm/include/asm/coloring.h | 2 --
 xen/include/public/arch-arm.h       | 8 ++++++++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/include/asm/coloring.h b/xen/arch/arm/include/asm/coloring.h
index fdd46448d7..1f7e0dde79 100644
--- a/xen/arch/arm/include/asm/coloring.h
+++ b/xen/arch/arm/include/asm/coloring.h
@@ -23,8 +23,6 @@
 #ifndef __ASM_ARM_COLORING_H__
 #define __ASM_ARM_COLORING_H__
 
-#define MAX_COLORS_CELLS 4
-
 #ifdef CONFIG_COLORING
 #include <xen/sched.h>
 
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index 94b31511dd..627cc42164 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -303,6 +303,12 @@ struct vcpu_guest_context {
 typedef struct vcpu_guest_context vcpu_guest_context_t;
 DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
 
+#define MAX_COLORS_CELLS 4
+struct color_guest_config {
+    uint32_t max_colors;
+    uint32_t colors[MAX_COLORS_CELLS];
+};
+
 /*
  * struct xen_arch_domainconfig's ABI is covered by
  * XEN_DOMCTL_INTERFACE_VERSION.
@@ -335,6 +341,8 @@ struct xen_arch_domainconfig {
      *
      */
     uint32_t clock_frequency;
+    /* IN */
+    struct color_guest_config colors;
 };
 #endif /* __XEN__ || __XEN_TOOLS__ */
 
-- 
2.30.2


