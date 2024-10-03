Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF18A98F172
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 16:31:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809515.1221906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swMrN-0000h0-KS; Thu, 03 Oct 2024 14:31:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809515.1221906; Thu, 03 Oct 2024 14:31:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swMrN-0000eY-GT; Thu, 03 Oct 2024 14:31:17 +0000
Received: by outflank-mailman (input) for mailman id 809515;
 Thu, 03 Oct 2024 14:31:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3wyt=Q7=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1swMrL-0008IT-RY
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 14:31:15 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 248dfebe-8194-11ef-99a2-01e77a169b0f;
 Thu, 03 Oct 2024 16:31:14 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5399041167cso1754292e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 07:31:14 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539a8256ab3sm188873e87.79.2024.10.03.07.31.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 07:31:12 -0700 (PDT)
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
X-Inumbo-ID: 248dfebe-8194-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727965873; x=1728570673; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G14n863A5XJ+R3OWZM+ShGFWWx326n2e7KMDwbqTXOk=;
        b=gtBipwiL8/mWZjt7rgjpbEyZ+gZPw2VoYxBzvpV/1YAJ/iePVJzwZBUA3buXe4ulho
         hVOP2zAK3A1LUWMI1PFg7xPRBf9Co840gqswG1xkjl6dzHPqXmAhgGOX6JXYgVZ7s3V3
         Phz5CjkPi5ljV/Hb+lEez2mK3bfZ09LDdIQHfTQh2qnGIx7odPI6fRH4Q4U9MH5N+uIV
         BC/rSmRiz8PuarRlnDVo7NTlxSciFYhDOc5h1LxqNy6Ty+/E7Utf0hGPXf49e7fFGw0Z
         jMbOgOla6H9QYNhGORvxtWnX/+fbCxUhcDz7tF18j70SrJx5Y8ndLadQ6Wo5F4AQakjD
         5fEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727965873; x=1728570673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G14n863A5XJ+R3OWZM+ShGFWWx326n2e7KMDwbqTXOk=;
        b=f2V9s2TkP6jttm8Utv4SeHK/3aQ21/BWqVKHwcH3aq1fsM/p4bBCrKYu+9xfYejC+q
         br0znZCuqO1MrjEsRHKFuU56vH8rGL/kQ18H/baNQ5ZcX0JG/YixW0Gq4M0yiVP8YFA+
         i7bL5PEGDCp4UACp1aj1SlzAvcZr3EChAxRxuZTcaAix7HaHwuTPjstYrUwZkhKAYnHD
         qyXIAltxLB2BTETWGb/ntgeVmk0iuc4RnOj3BUuT3phI2kPBMldHwhG9H9D+i76ndWV9
         5mfVGhfXWWPywuOIY98FKYlFK0NbyfV6Sm8hxjHSZKwQffmbdEix9AHkTQ0JA7y2Obls
         84GQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzsX/Gh4dO7OtVb6UT6FHVzH69FDjgbNihdddfeeTk68Kc/CNPUVVvX9NKcT/r17y9fPwAGtEsCUw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzjYuxe463e255gmtQiu/QE7hhUDSK6nJG9JyYyI+4jYMVbrwGV
	WuM9+UzlINFuuwJuLgw5uFsEcb3VUT4nsy4UqAmY71GBZStABiZ9
X-Google-Smtp-Source: AGHT+IHOBNtTy8Z6hlO7HIVsJ2JrpsTcBJsLU3WHSwU8CKz+ObM1If7037IORqFyBvOjTb7coQLByw==
X-Received: by 2002:a05:6512:304e:b0:539:8d9b:b61c with SMTP id 2adb3069b0e04-539a07a62c1mr6698903e87.51.1727965873124;
        Thu, 03 Oct 2024 07:31:13 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	peter.maydell@linaro.org,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-arm@nongnu.org
Subject: [PULL v1 3/5] hw/xen: xenpvh: Disable buffered IOREQs for ARM
Date: Thu,  3 Oct 2024 16:31:00 +0200
Message-ID: <20241003143103.1476805-4-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241003143103.1476805-1-edgar.iglesias@gmail.com>
References: <20241003143103.1476805-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Add a way to enable/disable buffered IOREQs for PVH machines
and disable them for ARM. ARM does not support buffered
IOREQ's nor the legacy way to map IOREQ info pages.

See the following for more details:
https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=2fbd7e609e1803ac5e5c26e22aa8e4b5a6cddbb1
https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/ioreq.c;h=2e829d2e7f3760401b96fa7c930e2015fb1cf463;hb=HEAD#l138

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
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


