Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCB0AB8300
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 11:39:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985053.1371013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFV3L-0006XE-KH; Thu, 15 May 2025 09:38:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985053.1371013; Thu, 15 May 2025 09:38:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFV3L-0006RN-Fv; Thu, 15 May 2025 09:38:59 +0000
Received: by outflank-mailman (input) for mailman id 985053;
 Thu, 15 May 2025 09:38:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DjGQ=X7=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1uFV3K-0005Wo-9m
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 09:38:58 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c0137ca-3170-11f0-9ffb-bf95429c2676;
 Thu, 15 May 2025 11:38:56 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ad51ba0af48so58362966b.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 May 2025 02:38:56 -0700 (PDT)
Received: from rossla-pc.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad23ad2b386sm895152066b.104.2025.05.15.02.38.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 02:38:55 -0700 (PDT)
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
X-Inumbo-ID: 6c0137ca-3170-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747301936; x=1747906736; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=okbZGT2Jgvj2XKdLpr7X/vM9N54wOcCp6yj7ItvaHiA=;
        b=U4RgSM7f7+/6g1bNjKKaUMxvJBHiT/0ygXUFiu4B4gXPpNUmFhJetQjoyQ03wOofIa
         rJ2rrpOHkh7h9RD58cSb0kqBtRX74GR85Rd2+JBC9nQ/yrJfPFDfnGXNV0zeBof3sHf7
         YvHl1Nr4nmhlIxaObqsUMPjuY+EsXiyRND1Kg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747301936; x=1747906736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=okbZGT2Jgvj2XKdLpr7X/vM9N54wOcCp6yj7ItvaHiA=;
        b=ZAXSg25WcqFHtlOhVmGN1dSFTMbGl6DmcHMxsowTi02aEo56NhFL3yWes/Sq7SdmZ3
         4oDLyRFUAPSxoeOxrqNDrEqcU6GZF13475YRaYaz0F5vGq02ZYUUleK99F4Qr02wG1Qa
         +zidlrPNnJADWYSeRrq2Rk6v1Z6I/iyCFGt/s7pqDHP9LVJL7H3pmzNPrf+N4cdVh/8N
         CzODUt+SEa2IR/inzUQ93k0lXepuuuNd+dMdPRYYnDDsXuZr5VBDX5S8ppBI/Qy4LWV7
         tUXekCgAZW6XKWA6diRGYXjKVw62tsj7KhH9dmDKkaJxN290MIDeQRg3435rIsKzDF7o
         GZdQ==
X-Gm-Message-State: AOJu0YxyB0d2az7W4XftelZB0/mU3gRl5bRqDSIyKp/PnGw+Mk3UeEOJ
	sUFHJsqMY7Otdoie/Y6YaCZs43F3OTX/5o+Fm+Y06GLDRBF/PeO7aJsoyK0e3uDWvATC9FEGqTo
	E6Q8=
X-Gm-Gg: ASbGncs10YgBLm977riUgL7UbSW3QWkBmNVouPRoq1qardJHzN625lOLOgpdzq8sjjo
	Mx3ImkHCcP5Tadv9Zvq4qk5Z0CtsaF/m6OYtJpr6uMzlgT7KykmJTAKXZmUAWwnAUDs1K/isNL/
	JWfu9dnlee9+7bUVDCFizcnAGEXOACBtzqwFsv3WZF+c5c2paX25wNkUVq6kQ4Ro0vCVJv6HmTI
	lv2rtD0Er/koTwR0Wo8WsDfuZG8P0dbQ6AB5EQWmhcWmga/79QtAUUhVFA80Hn2ouANhBa+pwVX
	yBKePIQ1VS3yE4wYJXU0m8BfcIaIdKrennma5SGCnTV/LqK7551BmhAUr3RebTNrZxNwG4W+YZo
	=
X-Google-Smtp-Source: AGHT+IFctHIRcQo3bF2A5ibn3Ijwsfd3cMMmC3cFjPJqYXvmIPs9A36jyg0GXBexdQxZnyE3pCSXIg==
X-Received: by 2002:a17:907:7289:b0:ad2:3fec:7e99 with SMTP id a640c23a62f3a-ad50f7c1bcemr239810966b.21.1747301935991;
        Thu, 15 May 2025 02:38:55 -0700 (PDT)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 4/5] livepatch: Load built-in key during boot
Date: Thu, 15 May 2025 10:38:19 +0100
Message-ID: <20250515093822.659916-5-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515093822.659916-1-ross.lagerwall@citrix.com>
References: <20250515093822.659916-1-ross.lagerwall@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Parse the raw data of the embedded RSA key into a form that can be later
used for verifying live patch signatures.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---

In v2:

* Split out from "livepatch: Embed public key in Xen"

 xen/common/livepatch.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index be9b7e367553..bc158971b4bf 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -11,6 +11,8 @@
 #include <xen/lib.h>
 #include <xen/list.h>
 #include <xen/mm.h>
+#include <xen/mpi.h>
+#include <xen/rsa.h>
 #include <xen/sched.h>
 #include <xen/smp.h>
 #include <xen/softirq.h>
@@ -73,6 +75,10 @@ static struct livepatch_work livepatch_work;
 static DEFINE_PER_CPU(bool, work_to_do);
 static DEFINE_PER_CPU(struct tasklet, livepatch_tasklet);
 
+#ifdef CONFIG_PAYLOAD_VERIFY
+static struct rsa_public_key builtin_payload_key;
+#endif
+
 static int get_name(const struct xen_livepatch_name *name, char *n)
 {
     if ( !name->size || name->size > XEN_LIVEPATCH_NAME_SIZE )
@@ -2287,6 +2293,31 @@ static void cf_check livepatch_printall(unsigned char key)
     spin_unlock(&payload_lock);
 }
 
+static int __init load_builtin_payload_key(void)
+{
+#ifdef CONFIG_PAYLOAD_VERIFY
+    const uint8_t *ptr;
+    uint32_t len;
+
+    rsa_public_key_init(&builtin_payload_key);
+
+    ptr = xen_livepatch_key_data;
+
+    memcpy(&len, ptr, sizeof(len));
+    ptr += sizeof(len);
+    builtin_payload_key.n = mpi_read_raw_data(ptr, len);
+    ptr += len;
+
+    memcpy(&len, ptr, sizeof(len));
+    ptr += sizeof(len);
+    builtin_payload_key.e = mpi_read_raw_data(ptr, len);
+
+    return rsa_public_key_prepare(&builtin_payload_key);
+#else
+    return 0;
+#endif
+}
+
 static int cf_check cpu_callback(
     struct notifier_block *nfb, unsigned long action, void *hcpu)
 {
@@ -2305,6 +2336,11 @@ static struct notifier_block cpu_nfb = {
 static int __init cf_check livepatch_init(void)
 {
     unsigned int cpu;
+    int err;
+
+    err = load_builtin_payload_key();
+    if (err)
+        return err;
 
     for_each_online_cpu ( cpu )
     {
-- 
2.49.0


