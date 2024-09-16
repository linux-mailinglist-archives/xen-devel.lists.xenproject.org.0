Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FE197A4D1
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 17:09:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799581.1209568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqDLg-0006FT-1I; Mon, 16 Sep 2024 15:09:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799581.1209568; Mon, 16 Sep 2024 15:09:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqDLf-0006DD-UY; Mon, 16 Sep 2024 15:09:07 +0000
Received: by outflank-mailman (input) for mailman id 799581;
 Mon, 16 Sep 2024 15:09:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CVXs=QO=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sqDLe-0005jt-EG
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 15:09:06 +0000
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [2607:f8b0:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c990415-743d-11ef-99a2-01e77a169b0f;
 Mon, 16 Sep 2024 17:09:04 +0200 (CEST)
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-39f526fd19bso10278695ab.1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2024 08:09:04 -0700 (PDT)
Received: from gmail.com (ip190-5-140-142.intercom.com.sv. [190.5.140.142])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ec3d0aasm1507302173.84.2024.09.16.08.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2024 08:09:02 -0700 (PDT)
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
X-Inumbo-ID: 9c990415-743d-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726499343; x=1727104143; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9fGayqu8/3BSy8pNgZk7M/4P7YOiJj/gcULOkYYJOg=;
        b=V3FaZAZFR6mOelvJJfOo8+gD3EtSRLxaRV5D3ZaPE1gbj7RRCh2/ZM11SjNqGkYPPj
         QpuW5tmOXxJozOXZ2c1CkzANPK24Leq7OZVNgQZR0l5MrseFxEiuU6GKYjavddClDfvv
         yqHM4oBFbJCh2gFRXrGSiPwb/1YDUCi2INocjsF50wGCy3mYZfCV5qrIbZvEKJRMUfhF
         UDsOReqH/VQN7cUQ2sAZYECo8zwdq2H8zYK8nvZqQ5xD3aStcG9AuDKvDyGh8Cg5w+yA
         /f/Fzwuio0vqGkFpmtaU5YCJSzYn1prmiZsU3jpXkVGZnSmEYGsuM25CsPFXzhnhW9cR
         QcbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726499343; x=1727104143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z9fGayqu8/3BSy8pNgZk7M/4P7YOiJj/gcULOkYYJOg=;
        b=r6eyrm+eSGUegBvSt3Imnf7FVfaihuuEAEY2+OHl4AO/lMjzrGHMw6fbCtIpotS1vA
         KCazv5g/T3QEbZ1m0rFCDX+rz+tfvFoY1LSlytQHJBjec+g/208E5fHMvqB1QeaJsFrK
         LAMTimpJUXibmcdx8VbvAqBGjo7MOht8YoZH15+f1vfehCdE6ZRA6HiArLxFHmuh66gQ
         iFb9LXekrink/rnBuNxsVKsMhOEcY0jYtjrn+CnuujcZmwuSnR89KVyHznaKzd/gobHb
         4NQ4SEm6EMki/zptYjYliM8uHhHH60Uf/a6YDPY2f4oxZSpsvHQtHOagrLiU7VO8jjFz
         zj9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXwv/i3aC1+8qas8x2GcB5kAEK01018yyMF4CTKSppCTrNvQEtlkz7vNueVZKBDV4TPgBbqpOZ/9ew=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyax17ep94wugjK7jguxFsSMPh9isEaG9oxylqRPWnHnsDYCYcm
	8oCPBgJHGMbMUZa8a/WNhaU/J3DId9PVEpQW/eMzq7/yhiqmFuLBS54B75h2
X-Google-Smtp-Source: AGHT+IEqUvGdjraR0wBvs0H47m4U/lbEz4963FbfsqjYnrckE5XmjraeI29NnHQZvwRQLEUjUdTYsg==
X-Received: by 2002:a05:6e02:12e7:b0:3a0:8eb3:5160 with SMTP id e9e14a558f8ab-3a08eb35230mr80173955ab.11.1726499343305;
        Mon, 16 Sep 2024 08:09:03 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-arm@nongnu.org
Subject: [PATCH v1 2/4] hw/xen: xenpvh: Disable buffered IOREQs for ARM
Date: Mon, 16 Sep 2024 17:08:50 +0200
Message-ID: <20240916150853.1216703-3-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240916150853.1216703-1-edgar.iglesias@gmail.com>
References: <20240916150853.1216703-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Add a way to enable/disable buffered IOREQs for PVH machines
and disable them for ARM. ARM does not support buffered
IOREQ's nor the legacy way to map IOREQ info pages.

See the following for more details:
https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=2fbd7e609e1803ac5e5c26e22aa8e4b5a6cddbb1
https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/ioreq.c;h=2e829d2e7f3760401b96fa7c930e2015fb1cf463;hb=HEAD#l138

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/arm/xen-pvh.c                | 3 +++
 hw/i386/xen/xen-pvh.c           | 3 +++
 hw/xen/xen-pvh-common.c         | 2 +-
 include/hw/xen/xen-pvh-common.h | 3 +++
 4 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/hw/arm/xen-pvh.c b/hw/arm/xen-pvh.c
index 04cb9855af..28af3910ea 100644
--- a/hw/arm/xen-pvh.c
+++ b/hw/arm/xen-pvh.c
@@ -66,6 +66,9 @@ static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
      */
     mc->max_cpus = GUEST_MAX_VCPUS;
 
+    /* Xen/ARM does not use buffered IOREQs.  */
+    xpc->handle_bufioreq = HVM_IOREQSRV_BUFIOREQ_OFF;
+
     /* List of supported features known to work on PVH ARM.  */
     xpc->has_tpm = true;
     xpc->has_virtio_mmio = true;
diff --git a/hw/i386/xen/xen-pvh.c b/hw/i386/xen/xen-pvh.c
index 45645667e9..f1f02d3311 100644
--- a/hw/i386/xen/xen-pvh.c
+++ b/hw/i386/xen/xen-pvh.c
@@ -89,6 +89,9 @@ static void xen_pvh_machine_class_init(ObjectClass *oc, void *data)
     /* We have an implementation specific init to create CPU objects.  */
     xpc->init = xen_pvh_init;
 
+    /* Enable buffered IOREQs.  */
+    xpc->handle_bufioreq = HVM_IOREQSRV_BUFIOREQ_ATOMIC;
+
     /*
      * PCI INTX routing.
      *
diff --git a/hw/xen/xen-pvh-common.c b/hw/xen/xen-pvh-common.c
index 08641fdcec..76a9b2b945 100644
--- a/hw/xen/xen-pvh-common.c
+++ b/hw/xen/xen-pvh-common.c
@@ -195,7 +195,7 @@ static void xen_pvh_init(MachineState *ms)
 
     xen_pvh_init_ram(s, sysmem);
     xen_register_ioreq(&s->ioreq, ms->smp.max_cpus,
-                       HVM_IOREQSRV_BUFIOREQ_ATOMIC,
+                       xpc->handle_bufioreq,
                        &xen_memory_listener);
 
     if (s->cfg.virtio_mmio_num) {
diff --git a/include/hw/xen/xen-pvh-common.h b/include/hw/xen/xen-pvh-common.h
index bc09eea936..62c44a1ce7 100644
--- a/include/hw/xen/xen-pvh-common.h
+++ b/include/hw/xen/xen-pvh-common.h
@@ -43,6 +43,9 @@ struct XenPVHMachineClass {
      */
     int (*set_pci_link_route)(uint8_t line, uint8_t irq);
 
+    /* Allow implementations to optionally enable buffered ioreqs.  */
+    int handle_bufioreq;
+
     /*
      * Each implementation can optionally enable features that it
      * supports and are known to work.
-- 
2.43.0


