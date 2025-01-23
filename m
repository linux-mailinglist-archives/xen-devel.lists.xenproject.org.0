Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4F8A1AD9E
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2025 00:50:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876452.1286847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tb6yJ-0005Kz-1p; Thu, 23 Jan 2025 23:50:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876452.1286847; Thu, 23 Jan 2025 23:50:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tb6yI-0005HD-TX; Thu, 23 Jan 2025 23:50:50 +0000
Received: by outflank-mailman (input) for mailman id 876452;
 Thu, 23 Jan 2025 23:50:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QxCy=UP=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tb6to-0007hN-Ta
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2025 23:46:12 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3989e658-d9e4-11ef-99a4-01e77a169b0f;
 Fri, 24 Jan 2025 00:46:11 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-38a25d4b9d4so823024f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2025 15:46:11 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd4d34e3sm6953255e9.39.2025.01.23.15.46.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Jan 2025 15:46:10 -0800 (PST)
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
X-Inumbo-ID: 3989e658-d9e4-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737675971; x=1738280771; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xSu/7xOdAlhOhpGqndt0dd/xIMB7MzmL+xgNpZ/1JvM=;
        b=MpF2rRi6k7bvT8XV5swq9D7SwhLpMTGCQ0qzULPbxAT0EYMx5yw6XlgiQYoI/Hb0c+
         rUKSsgvtH4jocAc8JcdM3xW8dzMIE1NGRKwbfpFS+kf28/h3YMzA2u4XQpeLFYgyDTyj
         k7pMa5oB2GA/VvijECAfW8p+Mrh++5//KGB0tcVHIAbGMpHMI3KyIMiJOP8EbG1CIDQk
         DBDz+ISRJB14LQ9e6DaqhynYqTDvcgyRNEivIfABdvlDjPD7DDYOua6FZ/yDANN6djK6
         9PYQLjkDMEUX2i3X4U7zbNAQRcEaON84WKUZY2VtPS/7xeRGs5rEUY9305H/073V3US5
         gzTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737675971; x=1738280771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xSu/7xOdAlhOhpGqndt0dd/xIMB7MzmL+xgNpZ/1JvM=;
        b=Xc8+8N19wTqQ6NdhsP/8HWXYxGMA+nP2yCeSWllmkP5BV6rV1v5Gf7Gva1fyhRs5jQ
         PRSJPS0eX/9v6+shSdyQJrCg8YvUugTTyLDchZWjQKNt4qJG/RV20wTS0DPXojPeqjJ7
         rqWOsOsxB6SXtA37nQiZ2nnDCoLvg+AaXpw9U2pFoXnkCmjljELdN1YSwPoZecpA8/nb
         y4Osl2nDluB6Ors1jfx7/9udwg4mjhWCZw/55dv1SiBvsu1EO4QbriLcY8dLGYmbTq79
         MAz224yF+R1UpqVOYQujWw5H3q9hJK6BZk1I3+Gk1edL3wM/T/mZt4QGHE6FMrtE6n+e
         Z0ow==
X-Forwarded-Encrypted: i=1; AJvYcCU7MFNtEMpJwOJcKWJMlK1sNotzbEAFBMzk9OjnYfAJc+xa62Bg1cQhAUmN3EsP9br5MCA6jjvHy1U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyYuFfOS1lb2nKCjbfh0KTf4UYIzENA8txIGTbmQNqwnh4L1c0X
	X3EA2D19cxLzbAPER3SeDamwSyIKjQxA4jldIMxOAiGqCStroJJHawqJEVRauJk=
X-Gm-Gg: ASbGncv0h+cU0BGypouSVAY1GeBfcMG2DffjUDGdxw72jcApIt2w7S1v/assMatryPB
	G3jD/gG5QzBLuFD2Fuu89yavBDF0MA9arshcyZj71GYUAs2KQ59G4Hdw4aoVEkNYu8OW2hSuc8g
	+WK9lUqUVWFRRVyzdWiq6wuCSqYa5+LPKtpOJfssSXYN3mduBeruiQiS1zq57O5XMVcsN78z33s
	kwXoigWEjYPzM1BSbLTFlzL2CF9q0KbW7tYAnKey5YizwY4LfbbeoCzxNtmzuYHUAXaJ3lYZPe1
	HjBaJjuK2reZBJo/OWGF9l93uPp4iCtXZDmhFWowtm2EEztt63XpynA=
X-Google-Smtp-Source: AGHT+IFycJysfhMaCpSR16Rzr8MUGZyLqdkkV1WoJ+3KdF//Z7stLVwsFpncYG19E6JH49Nuy1YUSA==
X-Received: by 2002:a05:6000:e4a:b0:385:ed16:c91 with SMTP id ffacd0b85a97d-38bf566f3bemr20406552f8f.24.1737675970851;
        Thu, 23 Jan 2025 15:46:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	qemu-s390x@nongnu.org,
	xen-devel@lists.xenproject.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 20/20] cpus: Build cpu_exec_[un]realizefn() methods once
Date: Fri, 24 Jan 2025 00:44:14 +0100
Message-ID: <20250123234415.59850-21-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123234415.59850-1-philmd@linaro.org>
References: <20250123234415.59850-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Now that cpu_exec_realizefn() and cpu_exec_unrealizefn()
methods don't use any target specific definition anymore,
we can move them to cpu-common.c to be able to build them
once.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Eventually they'll be absorbed within cpu_common_[un]realizefn().
---
 cpu-target.c         | 30 ------------------------------
 hw/core/cpu-common.c | 26 ++++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 30 deletions(-)

diff --git a/cpu-target.c b/cpu-target.c
index bfcd48f9ae2..8f4477be417 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -19,43 +19,13 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#include "qemu/error-report.h"
 #include "qemu/qemu-print.h"
 #include "system/accel-ops.h"
 #include "system/cpus.h"
 #include "exec/replay-core.h"
-#include "exec/cpu-common.h"
 #include "exec/log.h"
 #include "accel/accel-cpu-target.h"
 #include "trace/trace-root.h"
-#include "qemu/accel.h"
-#include "hw/core/cpu.h"
-
-bool cpu_exec_realizefn(CPUState *cpu, Error **errp)
-{
-    if (!accel_cpu_common_realize(cpu, errp)) {
-        return false;
-    }
-
-    /* Wait until cpu initialization complete before exposing cpu. */
-    cpu_list_add(cpu);
-
-    cpu_vmstate_register(cpu);
-
-    return true;
-}
-
-void cpu_exec_unrealizefn(CPUState *cpu)
-{
-    cpu_vmstate_unregister(cpu);
-
-    cpu_list_remove(cpu);
-    /*
-     * Now that the vCPU has been removed from the RCU list, we can call
-     * accel_cpu_common_unrealize, which may free fields using call_rcu.
-     */
-    accel_cpu_common_unrealize(cpu);
-}
 
 char *cpu_model_from_type(const char *typename)
 {
diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index 71425cb7422..c5382a350fc 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -193,6 +193,20 @@ static void cpu_common_parse_features(const char *typename, char *features,
     }
 }
 
+bool cpu_exec_realizefn(CPUState *cpu, Error **errp)
+{
+    if (!accel_cpu_common_realize(cpu, errp)) {
+        return false;
+    }
+
+    /* Wait until cpu initialization complete before exposing cpu. */
+    cpu_list_add(cpu);
+
+    cpu_vmstate_register(cpu);
+
+    return true;
+}
+
 static void cpu_common_realizefn(DeviceState *dev, Error **errp)
 {
     CPUState *cpu = CPU(dev);
@@ -234,6 +248,18 @@ static void cpu_common_unrealizefn(DeviceState *dev)
     cpu_exec_unrealizefn(cpu);
 }
 
+void cpu_exec_unrealizefn(CPUState *cpu)
+{
+    cpu_vmstate_unregister(cpu);
+
+    cpu_list_remove(cpu);
+    /*
+     * Now that the vCPU has been removed from the RCU list, we can call
+     * accel_cpu_common_unrealize, which may free fields using call_rcu.
+     */
+    accel_cpu_common_unrealize(cpu);
+}
+
 static void cpu_common_initfn(Object *obj)
 {
     CPUState *cpu = CPU(obj);
-- 
2.47.1


