Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 043D169F808
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 16:34:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499549.770818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUr8F-0003pr-62; Wed, 22 Feb 2023 15:34:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499549.770818; Wed, 22 Feb 2023 15:34:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUr8E-0003Xc-7k; Wed, 22 Feb 2023 15:34:10 +0000
Received: by outflank-mailman (input) for mailman id 499549;
 Wed, 22 Feb 2023 15:34:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvgA=6S=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pUr89-0001MH-MV
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 15:34:05 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55cba0ed-b2c6-11ed-93b6-47a8fe42b414;
 Wed, 22 Feb 2023 16:34:03 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id n2so7258380lfb.12
 for <xen-devel@lists.xenproject.org>; Wed, 22 Feb 2023 07:34:04 -0800 (PST)
Received: from localhost.localdomain (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 q9-20020ac25289000000b004db0d26adb4sm927746lfm.182.2023.02.22.07.34.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 07:34:03 -0800 (PST)
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
X-Inumbo-ID: 55cba0ed-b2c6-11ed-93b6-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r2jocSbtwo5F8M83i1Ug9henF/cqlpwGkk7d8f2nrvc=;
        b=o5OthBNe4k7qeC6QV8RqK6drlj4jAq/lTI23snrg+DvDPxM+xJK65Q1P8runQ9137I
         ReT0cfDRYfkgXfuJjNr9N8Z6wCwNiJyum2M8HWqpj/FDtp4Y+xT/1oD4uVWTjtUVTYkv
         CtflFM/RddhzC0zM47ANJf60jfNG8GyOiw3vcvrLSGrR4d1+2oKk4bEusteknyRlnBLK
         T7//T4PE6O9Cas86oK9ib+TYAeUlQ9/zxM1FH0FFyZmsgoFD4WVxbGvqcNkDv+BieOzt
         pDZhB+SFslJtKcXM5/sH3HxC8KgojFhYxTc9zQvH9XamCPNDqYHQTzdU68lTfbWTgC58
         NIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r2jocSbtwo5F8M83i1Ug9henF/cqlpwGkk7d8f2nrvc=;
        b=yy5nrO89KuzlbXRzx/OBKwNKhOn+ROU12H/+BP5pyZiCPPfZpOtjTV9GndZq5Ce++Y
         heytb61npoRVK60EV8u6L+6l813H/EF6uetyDO9Ouhv0mX1FR2xxY2X+DpcBYorxEZB6
         yk3uvR7FgrEKTHRrUSIZigQrXiFdl2P4DwUXuz4ogWojboDV2n6WFRKtkBmjaslVytJv
         OEvhZ+I8nlb6DgnafEXfE3H7aEvRYZhsY7k1wIul/1lUgscSMpmwA+vEOdkdz7r/TItz
         /RMTwqnrzZ+AFRcJm8Bidwllux1iU6HTdjvpVWVtVWN28eIEOPvZC2ZGMVZqerjlhZ4e
         PAJw==
X-Gm-Message-State: AO0yUKW3cT339U7bQE4JJTk3bv3ZlVEMoa2JVGRUJCEuCISZDy1zf/M+
	1PVW+WIKxuYqRqcpxcXTaY59yr41hKQ3L68AnDY=
X-Google-Smtp-Source: AK7set8Mt0ftqqKEa4+wKLn4rNec2sPsBqbyC9zFbjak0+oSQqFYa7nlPlOPUNPvcX9LYg6RQn498Q==
X-Received: by 2002:ac2:5615:0:b0:4a4:68b8:f4bd with SMTP id v21-20020ac25615000000b004a468b8f4bdmr2975009lfd.3.1677080043409;
        Wed, 22 Feb 2023 07:34:03 -0800 (PST)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com,
	Marc Bonnici <marc.bonnici@arm.com>,
	Achin Gupta <achin.gupta@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [XEN PATCH v7 11/20] xen/arm: ffa: map SPMC rx/tx buffers
Date: Wed, 22 Feb 2023 16:33:08 +0100
Message-Id: <c553f850d76f4c31f5ce464f39bcb010722b9f99.1677079672.git.jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677079671.git.jens.wiklander@linaro.org>
References: <cover.1677079671.git.jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When initializing the FF-A mediator map the RX and TX buffers shared with
the SPMC.

These buffer are later used to to transmit data that cannot be passed in
registers only.

Adds a check that the SP supports the needed FF-A features
FFA_RXTX_MAP_64 / FFA_RXTX_MAP_32 and FFA_RXTX_UNMAP. In 64-bit mode we
must use FFA_RXTX_MAP_64 since registers are used to transmit the
physical addresses of the RX/TX buffers.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/tee/ffa.c | 57 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index a5d8a12635b6..07dd5c36d54b 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -148,6 +148,15 @@ struct ffa_ctx {
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
@@ -217,6 +226,17 @@ static bool check_mandatory_feature(uint32_t id)
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
 static uint16_t get_vm_id(const struct domain *d)
 {
     /* +1 since 0 is reserved for the hypervisor in FF-A */
@@ -384,6 +404,7 @@ static int ffa_relinquish_resources(struct domain *d)
 static bool ffa_probe(void)
 {
     uint32_t vers;
+    int e;
     unsigned int major_vers;
     unsigned int minor_vers;
 
@@ -426,12 +447,46 @@ static bool ffa_probe(void)
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
         return false;
 
+    ffa_rx = alloc_xenheap_pages(0, 0);
+    if ( !ffa_rx )
+        return false;
+
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
 
     return true;
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
+    return false;
 }
 
 static const struct tee_mediator_ops ffa_ops =
-- 
2.34.1


