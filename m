Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3F78903F3
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 16:55:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699008.1091390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rps5p-0007mP-AA; Thu, 28 Mar 2024 15:55:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699008.1091390; Thu, 28 Mar 2024 15:55:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rps5p-0007k4-5R; Thu, 28 Mar 2024 15:55:05 +0000
Received: by outflank-mailman (input) for mailman id 699008;
 Thu, 28 Mar 2024 15:55:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yxy0=LC=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rps5n-00071m-Oe
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 15:55:03 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 894fca6a-ed1b-11ee-a1ef-f123f15fe8a2;
 Thu, 28 Mar 2024 16:55:02 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-56c441e66a5so1506470a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 08:55:02 -0700 (PDT)
Received: from m1x-phil.lan (pas38-h02-176-184-5-52.dsl.sta.abo.bbox.fr.
 [176.184.5.52]) by smtp.gmail.com with ESMTPSA id
 d15-20020a056402400f00b0056c5395e581sm753171eda.70.2024.03.28.08.54.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 28 Mar 2024 08:55:01 -0700 (PDT)
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
X-Inumbo-ID: 894fca6a-ed1b-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711641301; x=1712246101; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2NXhpW96pCgkEoWuYwRT5cvChay+RSkHkEuAn7B/Dd0=;
        b=bkqBL4bo2Svvjj7lEOuBvYoMO9KyQw1FlEWq8WhstjxaJe5bYOJ2lutvnT0lVF37El
         kXxDRSVgVXG7daUTsiz59Jp2hRR0LR/R5lciyFjSDRuWW6XXFMnjFJghzb9zjE8d4z2t
         1UZebdVecrURjkLyjcJfRJwl4AFfIaF7ou6VlZHT1mS2reFhFHe0ckoG3wRbDwJp4Csv
         zsOPYwWYnlWNCewDgG8qGJBFt7drYCaX1TQ9AraDv7m6Tj6N/fbq1GzntKUdXccX0MpH
         cOCYxrN278D0Y1UVqYvalm0SsVwkmUDmA7VlPJJyPTBZuBi9PLR9swsoHY2suSs8T6oa
         zBbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711641301; x=1712246101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2NXhpW96pCgkEoWuYwRT5cvChay+RSkHkEuAn7B/Dd0=;
        b=XKDcOvqv2vMEWxzzryQdZrEVwUnqpVSq8Y1znEOTUCej69+L+eypyW0rphHZ1e4W0Y
         Wss0wAPuKnchKuWawBUtOqFylq8pVOuhqXq1Mn2HV6J2hJrhvOS3GEVBvvNAjbuO84rt
         rnHa7v1H1TxObKay/p8IKH4K6LOyNFioq0p7Hd3gCq2TbnpHRGjMrYAs4Q9PEAaH/Y85
         suyy5jxvJxsy/JaeKkkmgyFDQeBl/ufMghQ/NuZKKwL4rpMX2EILlOjnY5g5mE7X3xV6
         d0OX2A8hQ5OUGnjODpn54I8EE6lHAvCqTY89LV936SvYdWSh5fg2AIJt6Fx9Ev+g8+UD
         LBqA==
X-Forwarded-Encrypted: i=1; AJvYcCVilW8zfLRtF0jW1HiH7xiz76ZaJxmAAcsf7brJ+Rl96H9VaFE1MlvvQ2ui4o32tTR0dJCbWZpnsTv3z89KuAp9RKOUTM5EvON0Ef+9bcw=
X-Gm-Message-State: AOJu0YwSc+xZWf1UBoYox8q1pKFalShlMBZL+BP7rmH3yG71kjPHaTj4
	o5LNBGqa107fORaQO4tIQGs8JqFfnYT5qI04qByDoqSQrFSDxepUpeNjydEq8AY=
X-Google-Smtp-Source: AGHT+IF6f1YMBvOfsUocaggEtYJ9a+Kecpnx8/ab4gXfJ3RdBR3huqwiywmto+50jVUBk5TY6jKE5g==
X-Received: by 2002:a50:a412:0:b0:566:f81:41a1 with SMTP id u18-20020a50a412000000b005660f8141a1mr2402222edb.22.1711641301544;
        Thu, 28 Mar 2024 08:55:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	Bernhard Beschow <shentey@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Ani Sinha <anisinha@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH-for-9.1 03/29] hw/i386/pc: Pass base machine type as argument to DEFINE_PC_MACHINE()
Date: Thu, 28 Mar 2024 16:54:11 +0100
Message-ID: <20240328155439.58719-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240328155439.58719-1-philmd@linaro.org>
References: <20240328155439.58719-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently PC machines are based on TYPE_PC_MACHINE.
In preparation of being based on different types,
pass the current type as argument.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/i386/pc.h | 4 ++--
 hw/i386/pc_piix.c    | 9 +++++----
 hw/i386/pc_q35.c     | 3 ++-
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 6b885424bb..33023ebbbe 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -268,7 +268,7 @@ extern const size_t pc_compat_2_4_len;
 extern GlobalProperty pc_compat_2_3[];
 extern const size_t pc_compat_2_3_len;
 
-#define DEFINE_PC_MACHINE(suffix, namestr, initfn, optsfn) \
+#define DEFINE_PC_MACHINE(suffix, namestr, initfn, optsfn, parent_class) \
     static void pc_machine_##suffix##_class_init(ObjectClass *oc, void *data) \
     { \
         MachineClass *mc = MACHINE_CLASS(oc); \
@@ -277,7 +277,7 @@ extern const size_t pc_compat_2_3_len;
     } \
     static const TypeInfo pc_machine_type_##suffix = { \
         .name       = namestr TYPE_MACHINE_SUFFIX, \
-        .parent     = TYPE_PC_MACHINE, \
+        .parent     = parent_class, \
         .class_init = pc_machine_##suffix##_class_init, \
     }; \
     static void pc_machine_init_##suffix(void) \
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 1be1e050c7..b9f85148e3 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -462,7 +462,8 @@ static void pc_xen_hvm_init(MachineState *machine)
         } \
         pc_init1(machine, TYPE_I440FX_PCI_DEVICE); \
     } \
-    DEFINE_PC_MACHINE(suffix, name, pc_init_##suffix, optionfn)
+    DEFINE_PC_MACHINE(suffix, name, pc_init_##suffix, optionfn, \
+                      TYPE_PC_MACHINE)
 
 static void pc_i440fx_machine_options(MachineClass *m)
 {
@@ -824,7 +825,7 @@ static void isapc_machine_options(MachineClass *m)
 }
 
 DEFINE_PC_MACHINE(isapc, "isapc", pc_init_isa,
-                  isapc_machine_options);
+                  isapc_machine_options, TYPE_PC_MACHINE);
 #endif
 
 #ifdef CONFIG_XEN
@@ -837,7 +838,7 @@ static void xenfv_4_2_machine_options(MachineClass *m)
 }
 
 DEFINE_PC_MACHINE(xenfv_4_2, "xenfv-4.2", pc_xen_hvm_init,
-                  xenfv_4_2_machine_options);
+                  xenfv_4_2_machine_options, TYPE_PC_MACHINE);
 
 static void xenfv_3_1_machine_options(MachineClass *m)
 {
@@ -849,5 +850,5 @@ static void xenfv_3_1_machine_options(MachineClass *m)
 }
 
 DEFINE_PC_MACHINE(xenfv, "xenfv-3.1", pc_xen_hvm_init,
-                  xenfv_3_1_machine_options);
+                  xenfv_3_1_machine_options, TYPE_PC_MACHINE);
 #endif
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 43ee1e595c..7dbee38f03 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -338,7 +338,8 @@ static void pc_q35_init(MachineState *machine)
         } \
         pc_q35_init(machine); \
     } \
-    DEFINE_PC_MACHINE(suffix, name, pc_init_##suffix, optionfn)
+    DEFINE_PC_MACHINE(suffix, name, pc_init_##suffix, optionfn, \
+                      TYPE_PC_MACHINE)
 
 
 static void pc_q35_machine_options(MachineClass *m)
-- 
2.41.0


