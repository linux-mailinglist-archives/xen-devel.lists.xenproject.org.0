Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5701DACAF27
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 15:37:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003322.1382867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM5LV-0000ed-Pk; Mon, 02 Jun 2025 13:36:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003322.1382867; Mon, 02 Jun 2025 13:36:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM5LV-0000d5-MX; Mon, 02 Jun 2025 13:36:57 +0000
Received: by outflank-mailman (input) for mailman id 1003322;
 Mon, 02 Jun 2025 13:36:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2MT+=YR=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1uM5LU-0000AN-6C
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 13:36:56 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a664d860-3fb6-11f0-a300-13f23c93f187;
 Mon, 02 Jun 2025 15:36:55 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ad8a6c202ffso855479666b.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 06:36:55 -0700 (PDT)
Received: from rossla-pc.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ada5d82becbsm801962166b.39.2025.06.02.06.36.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 06:36:54 -0700 (PDT)
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
X-Inumbo-ID: a664d860-3fb6-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748871415; x=1749476215; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D4baIbDrOsM/y9vBJw3lc1/l5s3LVRFoojQrWo8j6uc=;
        b=cLEY13ZWw57uHIDQFppYDQ79QwNpvQZbHtCr9SDi7hTkR/iKKWkzJQlfGQRtNfAhD5
         ISvMhjmjz0fl4oNJqjTP85DoFaXH9yn20WkV2soZLh3VBdRDAziL7JjYAEmRjE787hku
         Qd3PjNakR9T3wzc/yFmEzRRid9cr/o1gF9bL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748871415; x=1749476215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D4baIbDrOsM/y9vBJw3lc1/l5s3LVRFoojQrWo8j6uc=;
        b=en8C3jibS4cnCI/bXmqU1oSmCZvfZ5Ayl4Wy6DR+xYlXvErrp14OerG+0qOQH6Xlve
         eWPiFADutOVSjZPYfjpJCMi8YZBc6cauUZqJMYnXW0NelAlNbIuW7NIyfgJsACtXk+tb
         cZ7HqqH7eKfM4yrAIk5anmpRj1X+nQCQg6klXjeKpAziIC49QuW71UYWSqCQx71mx4G0
         /ho+UpuKihQ9ki9rDpSM7Jns2PIZ+ngZpgXYpXIuQ+8ZdcYcDY7/qOV8XoZvKmJNVxx5
         AsS/55tKO9SxyElHI51UbzqjEiflHK4+GI5J0S9M8Kv2kWO6Py0PqAJLOxl8J+60lfcW
         Cr6A==
X-Gm-Message-State: AOJu0Yx1fsMPLu9I/Mxj236owerRfa6zXbgDJqgC14SjZKQ2KjIb1lRm
	zP2Gob65P4/0dujMpKxsPOoZEcpWHgnkAIsMlLhEt8qkCpQPaubTXKyyChZc87H28DdbyMleM4I
	3NUc=
X-Gm-Gg: ASbGncv07aszco3ek8cxSLOkOh08TArGnu91Z1w3Dt4W7WKPlNb/kkBggBICDRpNMp8
	/WRo79tHf6U7kvZ+T4yoFwvACZNAxEajHtyeLOnxwuN7W05afzopL/Fw8/vyXgy1kTiA8+wui0S
	nbVt7I7s+OrCkBkNc82reLA+JxsEVXfRDeK+vxio7vUlURoXVYBs+Ex8isQ/ej33DvnUovLz3s/
	Fm6zGdo6XaqW6FOjeZgsgLvawrChSjE3ADYg9DBq7SDrhxLeQICJ+a2I81CGqtR+TLL9kwVdh7D
	3aBI/jnbZZNGGrB2WEn2CJRpxbekEqqAiwRLv/KnEIb8WwlFbtvug90G9xTPgKb+2biCtKqvkBG
	j3xTHGwozZA==
X-Google-Smtp-Source: AGHT+IGyzrBL1oEx1GJqgPBxBT5OrZ6loM+nv7/VroTRyESh/NW9kHGjgB8y/GwOZNWzbhJ1PHSi4A==
X-Received: by 2002:a17:907:9711:b0:ad8:9b16:58cc with SMTP id a640c23a62f3a-adb494e5aa2mr765152666b.39.1748871414513;
        Mon, 02 Jun 2025 06:36:54 -0700 (PDT)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 4/5] livepatch: Load built-in key during boot
Date: Mon,  2 Jun 2025 14:36:36 +0100
Message-ID: <20250602133639.2871212-5-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602133639.2871212-1-ross.lagerwall@citrix.com>
References: <20250602133639.2871212-1-ross.lagerwall@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Parse the raw data of the embedded RSA key into a form that can be later
used for verifying live patch signatures.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---

* Fix endianness of builtin key lengths
* Set builtin key to __ro_after_init

 xen/common/livepatch.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index 9a0df5363b59..92d1d342d872 100644
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
+static struct rsa_public_key __ro_after_init builtin_payload_key;
+#endif
+
 static int get_name(const struct xen_livepatch_name *name, char *n)
 {
     if ( !name->size || name->size > XEN_LIVEPATCH_NAME_SIZE )
@@ -2300,6 +2306,31 @@ static void cf_check livepatch_printall(unsigned char key)
     spin_unlock(&payload_lock);
 }
 
+static int load_builtin_payload_key(void)
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
+    builtin_payload_key.n = mpi_read_raw_data(ptr, le32_to_cpu(len));
+    ptr += len;
+
+    memcpy(&len, ptr, sizeof(len));
+    ptr += sizeof(len);
+    builtin_payload_key.e = mpi_read_raw_data(ptr, le32_to_cpu(len));
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
@@ -2318,6 +2349,11 @@ static struct notifier_block cpu_nfb = {
 static int __init cf_check livepatch_init(void)
 {
     unsigned int cpu;
+    int err;
+
+    err = load_builtin_payload_key();
+    if ( err )
+        return err;
 
     for_each_online_cpu ( cpu )
     {
-- 
2.49.0


