Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D54E697ED72
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 16:55:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802114.1212269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sskTM-0008JR-Dr; Mon, 23 Sep 2024 14:55:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802114.1212269; Mon, 23 Sep 2024 14:55:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sskTM-0008DB-9a; Mon, 23 Sep 2024 14:55:32 +0000
Received: by outflank-mailman (input) for mailman id 802114;
 Mon, 23 Sep 2024 14:55:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qfwC=QV=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sskTL-0007uD-Gt
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 14:55:31 +0000
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com
 [2607:f8b0:4864:20::e2b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dfcc3d57-79bb-11ef-99a2-01e77a169b0f;
 Mon, 23 Sep 2024 16:55:29 +0200 (CEST)
Received: by mail-vs1-xe2b.google.com with SMTP id
 ada2fe7eead31-49bc13c3a47so1759540137.3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 07:55:29 -0700 (PDT)
Received: from gmail.com (ip190-5-140-142.intercom.com.sv. [190.5.140.142])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-849399971dfsm3226559241.26.2024.09.23.07.55.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 07:55:27 -0700 (PDT)
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
X-Inumbo-ID: dfcc3d57-79bb-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727103329; x=1727708129; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pBoxVH+Ru8Cf8WZg/qIWXUyc6DjCMqmFHFamf1lm7RE=;
        b=dX5sjy9+yWLfarf1scATDY2zpEhlwdFAeBqML8Ad1gxK6jAUTKLmlu8SlraW11LKxE
         aiQMKyPqbnocbWV1h+SQLF80tdlH2yMgPpmr5pLbl37Sf88GR8bdkKxRLX/Y9qiFhMki
         Y3G8KdP+oFMb/vuxQBwWQcCAx8L/trqRyTDyqwBCQ+oBIFPPBK9XMI9b46PhN0xLrdLV
         DblqQMaeQbKECM0sPCYw5FSvOjCzf+twxpzPQlmM4JMuMThrKcni+8hrD3M+y1+78HgJ
         ASiaAell2Z0L2tlIhvSUAkIrCeTTkmL2WC1cswvny2GyeAtUw25nZZMugQls3gy8NWSr
         rmsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727103329; x=1727708129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pBoxVH+Ru8Cf8WZg/qIWXUyc6DjCMqmFHFamf1lm7RE=;
        b=Gv2ohFFychS416vGOJBvhH4GIg0yqK+82cChO+K6v5CKXjs1hfc3OOmzfaV20405X5
         jkeXuf9sjqjSvqKP3akrxYY+ntN/HnZ2MEMixKz8IDUguHVwdvZKGGtp26IZHOlVDsYl
         qkoc0VNS/LNUQePL5Cjiw4l+VtInwGQMItxRvbIKp3g5rn+fyToaZWv/aoj0PsqoiA1r
         j1BXBvxJT1JyttZzCfAy2opauy/ZuUP3goYitnn8lV31OSTVjb9rS57fser9+1rwQKC3
         18zZrSKwXxgv+ZFe7yVy/DmLpUSx2oHdbPH6N0phrgCUSb/3N/Q5zw2K6Wspe4IqqSek
         eA6g==
X-Forwarded-Encrypted: i=1; AJvYcCWK93c/PsutYevBUHJoB0RJ+UDBNw166+En1JB5QYjOZTwdVChhNucu/HfLwZ/9dFrSpYEgH6zOeUI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw5ow+kpNnNrUj/Js1/WAez3zUDzzWJZfnkCRKn+FdsfbI0s50S
	CgmQga0ZMnW29lJI79I2pgNIkjw6YjqOgoG5t6SHsm/psRyOecGu
X-Google-Smtp-Source: AGHT+IEVIq+5zTRJIDiwVEZ//hmPV3dnxQ6KGiEO/YrKl7+YpgOR25Qn3clhu6UZuNekZAImrbXJhA==
X-Received: by 2002:a05:6102:94c:b0:498:e25c:738f with SMTP id ada2fe7eead31-49fc7624bf3mr7212517137.18.1727103328687;
        Mon, 23 Sep 2024 07:55:28 -0700 (PDT)
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
Subject: [PATCH v2 2/4] hw/xen: xenpvh: Disable buffered IOREQs for ARM
Date: Mon, 23 Sep 2024 16:55:18 +0200
Message-ID: <20240923145520.1323504-3-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240923145520.1323504-1-edgar.iglesias@gmail.com>
References: <20240923145520.1323504-1-edgar.iglesias@gmail.com>
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
index bc09eea936..5cdd23c2f4 100644
--- a/include/hw/xen/xen-pvh-common.h
+++ b/include/hw/xen/xen-pvh-common.h
@@ -43,6 +43,9 @@ struct XenPVHMachineClass {
      */
     int (*set_pci_link_route)(uint8_t line, uint8_t irq);
 
+    /* Allow implementations to optionally enable buffered ioreqs.  */
+    uint8_t handle_bufioreq;
+
     /*
      * Each implementation can optionally enable features that it
      * supports and are known to work.
-- 
2.43.0


