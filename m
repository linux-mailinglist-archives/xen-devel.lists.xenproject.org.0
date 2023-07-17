Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E782755CA4
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 09:22:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564185.881557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLIY4-00089L-Ss; Mon, 17 Jul 2023 07:21:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564185.881557; Mon, 17 Jul 2023 07:21:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLIY4-00082n-LZ; Mon, 17 Jul 2023 07:21:36 +0000
Received: by outflank-mailman (input) for mailman id 564185;
 Mon, 17 Jul 2023 07:21:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xV9D=DD=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qLIY3-0005A9-2e
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 07:21:35 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ebc5e2b-2472-11ee-8611-37d641c3527e;
 Mon, 17 Jul 2023 09:21:33 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4fb7373dd35so6646335e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jul 2023 00:21:33 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 l10-20020ac24a8a000000b004f846cd74bcsm2658938lfp.245.2023.07.17.00.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 00:21:32 -0700 (PDT)
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
X-Inumbo-ID: 8ebc5e2b-2472-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689578493; x=1692170493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6PcGNOj2uFVtSWdI80VqpOM3Tw157fUaqVtYpkv27I=;
        b=cJMTpeW9Nv2fHAIsIMl9o3An6ZclOge0jq+KZkmwk/6ZRiEPtjmB9sRidhvNETMl6u
         Us9RohRHhBu0hfNZf0zLIYAPx+IfG2v5xRJRdJokjOt762fjg9JgyZCRxSPhek6xL37J
         pz7nH6A4gpDj2uECzLKOLgd9VWBgjbAPZyhbsxmewKJsleaYn0Z6qEyYc1nroZGnQCm0
         mHsYnSvYB/CLsFw0ZLdfdvhmLEHHU/7PmBjRtR4j8f23BS8IjTj1gion63r0Hc1BWzVY
         /9OJvWh/8TnPBa+OtoqTco4NDmrCy5D3WtULFzVXoR2q9sdAs/jpzAnswv09SwK+5XC3
         mJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689578493; x=1692170493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I6PcGNOj2uFVtSWdI80VqpOM3Tw157fUaqVtYpkv27I=;
        b=JNUtGIz7oXjG8rv13MF5wuDMecK8QMg4Gv6/F8xrNo6pExFjgh/Avpwgu93zisVf0R
         OkRLmPG3bfVAce34OaK60qRbtmBqDpxEpMdzFhna6URVTDkh4TlnlS+kBAUV0ZYJHa11
         UPi6Vy9DT1MLl25L11caYXJFOcRzkQuWCGdcV0UNZ5CTmC1CAW/Fws0bEBlJFstJm0EH
         WrL9zPn21jTVlv/an659X6xc+lzQUJRZyk1rtQu+wA9oKQ+D4O5wLrZQAzchsDsF4ljJ
         BOhfKGfZZh8kkKZmexs9Q+Dt+UWpQSyRvlLMvgMHnY/s6LOH9xJaPRfKTUBlr/uVZ/rj
         A+2g==
X-Gm-Message-State: ABy/qLYiNUNYJjYM13LD1rT2hx6IYtd9hJUg+YGLOhZbxbIpxfWOujAc
	QGLJ2FfeO5h1I9pgiZfD53tlFiTWSEECYalNHPc=
X-Google-Smtp-Source: APBJJlEHdF+sylsEGBuTLVkRKIU3lKo+4KNeZ6W0Fb4VaLp6sEq9EVIXBfZD6Yquf+I5aSvpL8Nvbg==
X-Received: by 2002:a19:7111:0:b0:4fb:103f:7d56 with SMTP id m17-20020a197111000000b004fb103f7d56mr2948669lfc.14.1689578492785;
        Mon, 17 Jul 2023 00:21:32 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand.Marquis@arm.com,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Marc Bonnici <marc.bonnici@arm.com>,
	Achin Gupta <achin.gupta@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [XEN PATCH v10 11/24] xen/arm: ffa: map SPMC rx/tx buffers
Date: Mon, 17 Jul 2023 09:20:54 +0200
Message-Id: <20230717072107.753304-12-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230717072107.753304-1-jens.wiklander@linaro.org>
References: <20230717072107.753304-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When initializing the FF-A mediator map the RX and TX buffers shared with
the SPMC.

These buffer are later used to to transmit data that cannot be passed in
registers only.

Adds a check that the SP supports the needed FF-A features
FFA_RXTX_MAP_64 and FFA_RXTX_UNMAP.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/tee/ffa.c | 50 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index e05d58cf7755..f8ccaabc568d 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -12,6 +12,7 @@
 #include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/lib.h>
+#include <xen/mm.h>
 #include <xen/sched.h>
 #include <xen/sizes.h>
 #include <xen/types.h>
@@ -67,6 +68,12 @@
  */
 #define FFA_PAGE_SIZE                   SZ_4K
 
+/*
+ * The number of pages used for each of the RX and TX buffers shared with
+ * the SPMC.
+ */
+#define FFA_RXTX_PAGE_COUNT             1
+
 /*
  * Flags and field values used for the MSG_SEND_DIRECT_REQ/RESP:
  * BIT(31): Framework or partition message
@@ -161,6 +168,13 @@ struct ffa_ctx {
 /* Negotiated FF-A version to use with the SPMC */
 static uint32_t __ro_after_init ffa_version;
 
+/*
+ * Our rx/tx buffers shared with the SPMC. FFA_RXTX_PAGE_COUNT is the
+ * number of pages used in each of these buffers.
+ */
+static void *ffa_rx __read_mostly;
+static void *ffa_tx __read_mostly;
+
 static bool ffa_get_version(uint32_t *vers)
 {
     const struct arm_smccc_1_2_regs arg = {
@@ -231,6 +245,12 @@ static bool check_mandatory_feature(uint32_t id)
     return !ret;
 }
 
+static int32_t ffa_rxtx_map(paddr_t tx_addr, paddr_t rx_addr,
+                            uint32_t page_count)
+{
+    return ffa_simple_call(FFA_RXTX_MAP_64, tx_addr, rx_addr, page_count, 0);
+}
+
 static uint16_t get_vm_id(const struct domain *d)
 {
     /* +1 since 0 is reserved for the hypervisor in FF-A */
@@ -394,6 +414,7 @@ static int ffa_relinquish_resources(struct domain *d)
 static bool ffa_probe(void)
 {
     uint32_t vers;
+    int e;
     unsigned int major_vers;
     unsigned int minor_vers;
 
@@ -441,12 +462,39 @@ static bool ffa_probe(void)
      * TODO: Rework the code to allow domain to use a subset of the
      * features supported.
      */
-    if ( !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
+    if (
+         !check_mandatory_feature(FFA_RXTX_MAP_64) ||
+         !check_mandatory_feature(FFA_RXTX_UNMAP) ||
+         !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
+        return false;
+
+    ffa_rx = alloc_xenheap_pages(get_order_from_pages(FFA_RXTX_PAGE_COUNT), 0);
+    if ( !ffa_rx )
         return false;
 
+    ffa_tx = alloc_xenheap_pages(get_order_from_pages(FFA_RXTX_PAGE_COUNT), 0);
+    if ( !ffa_tx )
+        goto err_free_ffa_rx;
+
+    e = ffa_rxtx_map(__pa(ffa_tx), __pa(ffa_rx), FFA_RXTX_PAGE_COUNT);
+    if ( e )
+    {
+        printk(XENLOG_ERR "ffa: Failed to map rxtx: error %d\n", e);
+        goto err_free_ffa_tx;
+    }
     ffa_version = vers;
 
     return true;
+
+err_free_ffa_tx:
+    free_xenheap_pages(ffa_tx, 0);
+    ffa_tx = NULL;
+err_free_ffa_rx:
+    free_xenheap_pages(ffa_rx, 0);
+    ffa_rx = NULL;
+    ffa_version = 0;
+
+    return false;
 }
 
 static const struct tee_mediator_ops ffa_ops =
-- 
2.34.1


