Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAB35981C5
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 12:56:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389436.626378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOdCF-00051c-05; Thu, 18 Aug 2022 10:56:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389436.626378; Thu, 18 Aug 2022 10:56:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOdCE-0004va-PS; Thu, 18 Aug 2022 10:56:18 +0000
Received: by outflank-mailman (input) for mailman id 389436;
 Thu, 18 Aug 2022 10:56:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=avir=YW=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1oOdCD-0003wI-Iw
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 10:56:17 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6239e1c2-1ee4-11ed-9250-1f966e50362f;
 Thu, 18 Aug 2022 12:56:16 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id u9so1609894lfg.11
 for <xen-devel@lists.xenproject.org>; Thu, 18 Aug 2022 03:56:16 -0700 (PDT)
Received: from jade.urgonet (h-79-136-84-253.A175.priv.bahnhof.se.
 [79.136.84.253]) by smtp.gmail.com with ESMTPSA id
 y27-20020a0565123f1b00b0048a85334a11sm176837lfa.143.2022.08.18.03.56.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 03:56:15 -0700 (PDT)
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
X-Inumbo-ID: 6239e1c2-1ee4-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=pbpcq5/7brehKyi97FiJOw5kIYqiG7iSR5D6amj2SQs=;
        b=Hzks//CH+GAmvxbeDIuYTF4c0sxqyUup/iwBIo8HeMGduxcixNKiog8NS8Vk7i8PUF
         G84LvY8S4zlfNXNAbsCN9bmRDaEbz8M48tnIcxRpt9QZHJbuvGZmdcevcGdEezza+A9E
         0ylJ/N9eQUzoJ1xNyKjtURPXHRSc3SceM/7mcF7OwyzbYNFzM1imqgUtIXOCfdCCnkZG
         z1KjuXM54syqdAkiU5hpLNKHQ+hyGJkB01XhPml+PHLOLTIs2TDi30jETR1jvDWN+Hqa
         rslM34U4A3WWKo4lV8rNLAJRGDcsupCZ1N5nC+OFOMQfUleRVk2D2c559zW/ivRcoWeY
         seSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=pbpcq5/7brehKyi97FiJOw5kIYqiG7iSR5D6amj2SQs=;
        b=4hp8fz2H9nJmf7ORVaYfFf9/6CcjP2ZBiF6eLsEP45KHq8k1HHI34TYR6ESl9GgjQL
         wJ4awcNIZtrXAs3wsnCXPsRqhXnJxTsHC4ifqHDmnUt44M6TkhFCTFrx9p/gccxcoZ/z
         srOwA8AH1Gow5+qh4VQs19rEHIkZhLUKw6Lk1LCmXdq5myXhij9ADlfxwTBGUUZNBoYe
         ykTLqe342IVi1Rd0cuZRReSY7jcKkavM6p5Zzcfxf/R6tgQ8gTRKyGawyfQ8hKm5QChu
         M12bYCQaYG7uglqa+c3TVNj8xoZld2jUredU6QHQGEimBoPWt4hHKCUqVpWYk9d306CH
         J/JA==
X-Gm-Message-State: ACgBeo3fp+E62O+VD8MseyhC4VZaF7spkI3MJgLZMfviKbo2QNaSGBJL
	ylaoh6Io7UqEKeBxoX26HDQ3jjHuI/jfUA==
X-Google-Smtp-Source: AA6agR7U+SP50b6NDvV90q44cjvslfWk0ewjS13Rru+OntMtSOCiHAIq6+4aHIelV/FC4u4NnojeDQ==
X-Received: by 2002:a05:6512:25a3:b0:48a:e7e7:eea3 with SMTP id bf35-20020a05651225a300b0048ae7e7eea3mr726381lfb.205.1660820176237;
        Thu, 18 Aug 2022 03:56:16 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand.Marquis@arm.com,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v5 5/9] xen/arm: ffa: map SPMC rx/tx buffers
Date: Thu, 18 Aug 2022 12:55:57 +0200
Message-Id: <20220818105601.1896082-6-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220818105601.1896082-1-jens.wiklander@linaro.org>
References: <20220818105601.1896082-1-jens.wiklander@linaro.org>
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
index cd5eefb437f8..b1bf5538b111 100644
--- a/xen/arch/arm/ffa.c
+++ b/xen/arch/arm/ffa.c
@@ -195,6 +195,15 @@ struct ffa_ctx {
 /* Negotiated FF-A version to use with the SPMC */
 static uint32_t ffa_version __read_mostly;
 
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
@@ -264,6 +273,17 @@ static bool check_mandatory_feature(uint32_t id)
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
@@ -425,6 +445,7 @@ int ffa_relinquish_resources(struct domain *d)
 static int __init ffa_init(void)
 {
     uint32_t vers;
+    int e;
     unsigned int major_vers;
     unsigned int minor_vers;
 
@@ -462,11 +483,45 @@ static int __init ffa_init(void)
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


