Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A843E5BC51E
	for <lists+xen-devel@lfdr.de>; Mon, 19 Sep 2022 11:13:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408578.651365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaCph-0008CF-7K; Mon, 19 Sep 2022 09:12:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408578.651365; Mon, 19 Sep 2022 09:12:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaCph-00087Y-27; Mon, 19 Sep 2022 09:12:53 +0000
Received: by outflank-mailman (input) for mailman id 408578;
 Mon, 19 Sep 2022 09:12:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3sJ0=ZW=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1oaCpf-0007Fl-TZ
 for xen-devel@lists.xenproject.org; Mon, 19 Sep 2022 09:12:52 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2fa1d8ae-37fb-11ed-bad8-01ff208a15ba;
 Mon, 19 Sep 2022 11:12:29 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id a10so247609ljq.0
 for <xen-devel@lists.xenproject.org>; Mon, 19 Sep 2022 02:12:50 -0700 (PDT)
Received: from jade.urgonet (h-79-136-84-253.A175.priv.bahnhof.se.
 [79.136.84.253]) by smtp.gmail.com with ESMTPSA id
 f3-20020a05651c02c300b0025fdf1af42asm4815394ljo.78.2022.09.19.02.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 02:12:49 -0700 (PDT)
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
X-Inumbo-ID: 2fa1d8ae-37fb-11ed-bad8-01ff208a15ba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=6I3/XH3qPV3YutRTqfgDPkoEm9m6vnrvTMroZ0piAAQ=;
        b=B3T/f6oj76QvIWRa+RhS/iC5bJ7/14WTEXrZwB53jAd8KlbG29+wHvozzIHA4flZat
         H7XTfkHpIHTYDKdTEuQ4+zlZ7bceOSLVW7DtcUc7g4LYxSyY3NSNsnX04GaSTn/xFguW
         RqthVJJkOWEpxHGoKn6Br1zlGMxFf6ENGfW6pMmuNg6CMk7B5FVk6U05DSPxkBoZLtOn
         8vG9VCUEmd+eUAruqMLS6dJukku2gE2rhw6naNp4JeZdmgKTM8rnF4VT7tfCWqSfhvQk
         oRVsVbEDoYn1kQfA7mbHdCxSy1qCaohGBX5gbqFHsevBBSzsXi6V/QHGi5AdJ1xl2Gfw
         vV7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=6I3/XH3qPV3YutRTqfgDPkoEm9m6vnrvTMroZ0piAAQ=;
        b=jEmO/kl32JoxjT3+MJey+QGiu716K+pn3vYzKLBags9QGTzlCQqWuo47bdjTMaBdqo
         kDQ3+zMkwZIPpg44jFpKVkxs50vrIcIiqt/rpO7zCxBZ3lv6Q4+apZE5vOIuGgu8vh2E
         9vZOpTBfIeypXKbUAz3XRyqIkA7s+UvX8Zm3iGyg+Px24A5Ee4ZddHskA4TkeP0EU7AF
         aVWLyKrMSHO4eVSf+IWIzYyuK100P2K1430HnTnVaraeyZPdztKdLeCB7v7/D3G6YIXu
         1p84w2U2r0UsDibzm8gc1s16iWhgt1xF3LSz/FlrG/nXegcYhtI+1aq8u6fUZDJqY5XW
         GyuQ==
X-Gm-Message-State: ACrzQf3keu/Zduhh3X7UDGC0Ve2+zdGkwiLYEj3262++Q8y5x/T7SFJQ
	W9QzI6sY07eN3aMiowOOa76Lg0S1wyxf54d5
X-Google-Smtp-Source: AMsMyM6CtZP4doffMlot6spC0CdCddbWHMTt7PwC8Yu/I60Kei1HUpWsLsqbeCSj9xasLrSgJ5N4jw==
X-Received: by 2002:a2e:b5b5:0:b0:26a:c76d:145a with SMTP id f21-20020a2eb5b5000000b0026ac76d145amr5201438ljn.119.1663578769762;
        Mon, 19 Sep 2022 02:12:49 -0700 (PDT)
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
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v6 4/9] xen/arm: ffa: map SPMC rx/tx buffers
Date: Mon, 19 Sep 2022 11:12:33 +0200
Message-Id: <20220919091238.2068052-5-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220919091238.2068052-1-jens.wiklander@linaro.org>
References: <20220919091238.2068052-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When initializing the FF-A mediator map the RX and TX buffers shared with
the SPMC.

These buffer are later used to to transmit data that cannot be passed in
registers only.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/ffa.c | 57 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/ffa.c b/xen/arch/arm/ffa.c
index 90b5aa10a1fa..8cb5c829a394 100644
--- a/xen/arch/arm/ffa.c
+++ b/xen/arch/arm/ffa.c
@@ -195,6 +195,15 @@ struct ffa_ctx {
 /* Negotiated FF-A version to use with the SPMC */
 static uint32_t ffa_version __ro_after_init;
 
+/*
+ * Our rx/tx buffers shared with the SPMC.
+ *
+ * ffa_page_count is the number of pages used in each of these buffers.
+ */
+static void *ffa_rx __read_mostly;
+static void *ffa_tx __read_mostly;
+static unsigned int ffa_page_count __read_mostly;
+
 static bool ffa_get_version(uint32_t *vers)
 {
     const struct arm_smccc_1_2_regs arg = {
@@ -264,6 +273,17 @@ static bool __init check_mandatory_feature(uint32_t id)
     return !ret;
 }
 
+static int32_t ffa_rxtx_map(register_t tx_addr, register_t rx_addr,
+                            uint32_t page_count)
+{
+    uint32_t fid = FFA_RXTX_MAP_32;
+
+    if ( IS_ENABLED(CONFIG_ARM_64) )
+        fid = FFA_RXTX_MAP_64;
+
+    return ffa_simple_call(fid, tx_addr, rx_addr, page_count, 0);
+}
+
 static u16 get_vm_id(const struct domain *d)
 {
     /* +1 since 0 is reserved for the hypervisor in FF-A */
@@ -447,6 +467,7 @@ int ffa_relinquish_resources(struct domain *d)
 static int __init ffa_init(void)
 {
     uint32_t vers;
+    int e;
     unsigned int major_vers;
     unsigned int minor_vers;
 
@@ -484,11 +505,45 @@ static int __init ffa_init(void)
     printk(XENLOG_INFO "ARM FF-A Firmware version %u.%u\n",
            major_vers, minor_vers);
 
-    if ( !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
+    if (
+#ifdef CONFIG_ARM_64
+         !check_mandatory_feature(FFA_RXTX_MAP_64) ||
+#endif
+#ifdef CONFIG_ARM_32
+         !check_mandatory_feature(FFA_RXTX_MAP_32) ||
+#endif
+         !check_mandatory_feature(FFA_RXTX_UNMAP) ||
+         !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
+        return 0;
+
+    ffa_rx = alloc_xenheap_pages(0, 0);
+    if ( !ffa_rx )
         return 0;
 
+    ffa_tx = alloc_xenheap_pages(0, 0);
+    if ( !ffa_tx )
+        goto err_free_ffa_rx;
+
+    e = ffa_rxtx_map(__pa(ffa_tx), __pa(ffa_rx), 1);
+    if ( e )
+    {
+        printk(XENLOG_ERR "ffa: Failed to map rxtx: error %d\n", e);
+        goto err_free_ffa_tx;
+    }
+    ffa_page_count = 1;
     ffa_version = vers;
 
+    return 0;
+
+err_free_ffa_tx:
+    free_xenheap_pages(ffa_tx, 0);
+    ffa_tx = NULL;
+err_free_ffa_rx:
+    free_xenheap_pages(ffa_rx, 0);
+    ffa_rx = NULL;
+    ffa_page_count = 0;
+    ffa_version = 0;
+
     return 0;
 }
 
-- 
2.31.1


