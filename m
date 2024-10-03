Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BC198F6A3
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 20:57:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809820.1222375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swR0g-0008At-Tv; Thu, 03 Oct 2024 18:57:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809820.1222375; Thu, 03 Oct 2024 18:57:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swR0g-00085w-OM; Thu, 03 Oct 2024 18:57:10 +0000
Received: by outflank-mailman (input) for mailman id 809820;
 Thu, 03 Oct 2024 18:57:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3wyt=Q7=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1swR0f-0007Yu-Le
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 18:57:09 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a9200a3-81b9-11ef-a0ba-8be0dac302b0;
 Thu, 03 Oct 2024 20:57:09 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2fac787f39fso15854521fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 11:57:09 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2faecc6c18dsm2772521fa.97.2024.10.03.11.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 11:57:07 -0700 (PDT)
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
X-Inumbo-ID: 4a9200a3-81b9-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727981829; x=1728586629; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G14n863A5XJ+R3OWZM+ShGFWWx326n2e7KMDwbqTXOk=;
        b=a99UYE7nXSpY1HYv37N0v6ZFjaqCg1L+nbTk4Clp515RUg7PoYcPE1fytyrPXfP449
         23dlwgvU5UJyacXitdMK0sPCdW24F6RYpEjrI74DDAVLfOjFFYC/BiIPyOZnTyvTf8x3
         PYWhV8Hw9rWjsx8w7GB+T8wfWTpm0qQK7wbmZn70+D8XnFe1nQFjxBFIRqgbTFK/V4iV
         YemhA0Pc+YiLUq9oDrx23h54EeMt5lh9MOJQQ2SmI6Z/Tp6VLxZRp90fNgeGkDkecPmj
         Zn8th1mAwy8LOTtP6XFVfy+wtFq/XGXWRdlWFUzqxseFMIWzN8Rb4w7P4LXpUow+y7Vc
         XnAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727981829; x=1728586629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G14n863A5XJ+R3OWZM+ShGFWWx326n2e7KMDwbqTXOk=;
        b=ceSoRlaAVjVwX3ja4KWvx+q8j568+2K+A4niMyFlkoggvTbU+irPfQo16ghF0wXCNS
         yHM7OwGJa3YzSsv/lqqJ1A3TpQWaU+6ABQMixWi6GCZXZX/7ddwrwaFrFWEWMjGSirQb
         dgGay3MPwnEvoOexwP4u1UTSUlz5yx9GU8JCNNY2UYij4m1rG0zaC3UKo0ZHisd/+9aK
         9Boj9fPpkUszKSCXoxnMsg9xI1nDwSc2eKP/x8hbHmpjbTxwuVLw8zQmv/8Gnixg/hVU
         IZ3hO9qOGvmzr1S10hF1E5gV4rrU0QhkSFOX64YbwrfXaYsZqaTXt925YWuTZGS3RDiY
         FhxA==
X-Forwarded-Encrypted: i=1; AJvYcCVbbh7CdVMPbk0jak/jvu+RpPzplqzA3v+J0bzOjqj0+OXveUvO/MB+/e2cqJvMk8GvIqf37LWlyBM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyRSqIJuNHKZ/KH8FgnuOAxuFRAbiOpNGp5tgaKOJSs0XBKR2Dh
	2adFLlLLpYcTNtu9EbpI/nRdpLJdGHDqcZcQJ3PWAjEyf3gcVJVg
X-Google-Smtp-Source: AGHT+IGQBj0NQJQro7UzQrosv5xSzNbo69XNoBKLZB/U0eu07okLlmd7xHxmDysYwKwHtl0qaDQP6Q==
X-Received: by 2002:a2e:a543:0:b0:2fa:c5e5:629d with SMTP id 38308e7fff4ca-2faf3c1404bmr240971fa.3.1727981828500;
        Thu, 03 Oct 2024 11:57:08 -0700 (PDT)
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
Subject: [PULL v2 3/5] hw/xen: xenpvh: Disable buffered IOREQs for ARM
Date: Thu,  3 Oct 2024 20:56:52 +0200
Message-ID: <20241003185655.1480819-4-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241003185655.1480819-1-edgar.iglesias@gmail.com>
References: <20241003185655.1480819-1-edgar.iglesias@gmail.com>
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


