Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A01AB9C0A
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 14:29:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.987062.1372522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFuBm-0003U3-2R; Fri, 16 May 2025 12:29:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 987062.1372522; Fri, 16 May 2025 12:29:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFuBl-0003SX-Vx; Fri, 16 May 2025 12:29:21 +0000
Received: by outflank-mailman (input) for mailman id 987062;
 Fri, 16 May 2025 12:29:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T4W4=YA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uFuBk-0003SR-GX
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 12:29:20 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63aafdb7-3251-11f0-9eb6-5ba50f476ded;
 Fri, 16 May 2025 14:29:19 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-442ed8a275fso23346945e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 05:29:19 -0700 (PDT)
Received: from andrew-laptop.. ([46.149.103.12])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca4dfffsm2759532f8f.9.2025.05.16.05.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 05:29:18 -0700 (PDT)
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
X-Inumbo-ID: 63aafdb7-3251-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747398559; x=1748003359; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oM9b8wT66TmQJfExo6/g2uvlE85/1tsMkkMPcvkrzTY=;
        b=U4Afe3FOk88cNcxGlRuqhximVwGOabMdtgAVJhkvV7dSvabuXHDD1A6kGgYHljlCkN
         GpGI1a87R3NBtlljs4C6kJkzXA7vmr0+IYxVNl+BC8XW7mTCtzmoBlNVTFC1JCtgnRyu
         KYd08U6VDcge2FMG2WLXOhrxn6X1Us3so3u8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747398559; x=1748003359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oM9b8wT66TmQJfExo6/g2uvlE85/1tsMkkMPcvkrzTY=;
        b=FOlyx74KqZRBA61IrZS/Q0xEKmLpp4G76+te/5FavyiLuTZ6fgfIzl1UkiOLReYUAy
         jAoMQxDyumUOp0d7oWKnn0qX+cjDwtq66YUvTspEkVod3zcRhs9XnDrYFlszcU2pldFw
         x3ZVfnHEPFNLIIk6bdMEJU96kWdWocjgLqrD9B+BL7XnFQ+5dhO4V4ObZz4yG1dU4WUu
         kOy1ugoZf8duO1d8WtK+zzCu4slQouGV26zlG6Gbwj/xgvfJpYY70SmeugpI4+SPkRGK
         lWnaTQGPDHBYoqZ1NVRZAlCxoaU7NdMw5T+Kh6PWiuOu6NQsP8OrVdULX0tEK+xA5jLF
         LKBw==
X-Gm-Message-State: AOJu0YzyG4RT0pFyk9K1/KZNftV8vPNR5W6OiXCFkJgX1gIVP1H+x82O
	F0GqjMTi7Vmmdh3q4ggwHMy5K4W/PnMlwzlUNTic0l7rEkJ4Uhob8b4ti+QgETTNvWiF8Ki5Z2g
	iE3mq
X-Gm-Gg: ASbGnctt+Ez8R1OiL+qemx4qzG3M7ddXIIg1XRHkOSoTmKEfM+lZkijtgBKHdkwhOHM
	mVaQzCXtA8wtQ4/zA/4gFXYtRTwHF4k1yW2IvDeCyuNk3Dvml3CDSoo2sNopuiq4zAVRga956iL
	2YLRQJeUbXH6cPyTDYPudYuPn1/RS/QOtzWLa6Alt41kT8vt2Q3aJKQxadwjj40klS6VeFNRP3I
	fn79KsD3FXM+l75hqLPWe2jNHQ2/YRwC/jj/OKdT/3wbWtwKrNHIOIH/Xlsgc3StViAcTHErFXh
	jMdffctPb2130kOz22AafbBqhIv96faqJoe8pisT0WtljYP1HEMFdrzIqo7OoOg=
X-Google-Smtp-Source: AGHT+IFjbSA2rplbjLSxfKLQw8bGe/n2OmFf84NRYG9MLYnDr2qk+85wmcN8QJQvL1lc8hm9o6em8g==
X-Received: by 2002:a05:600c:a413:b0:43d:98e7:38dc with SMTP id 5b1f17b1804b1-442fe3fd7eemr24602705e9.5.1747398558793;
        Fri, 16 May 2025 05:29:18 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH] x86/vmx: Annotate the VMCS field widths
Date: Fri, 16 May 2025 13:29:16 +0100
Message-Id: <20250516122916.27070-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This helps identify the appropriate type to use.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
index cde4fe011bcd..ff5dd66b0ad9 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -436,6 +436,7 @@ extern struct vmx_caps vmx_caps;
 /* VMCS field encodings. */
 #define VMCS_HIGH(x) ((x) | 1)
 enum vmcs_field {
+    /* 16-bit fields. */
     VIRTUAL_PROCESSOR_ID            = 0x00000000,
     POSTED_INTR_NOTIFICATION_VECTOR = 0x00000002,
     EPTP_INDEX                      = 0x00000004,
@@ -457,6 +458,8 @@ enum vmcs_field {
     HOST_FS_SELECTOR                = 0x00000c08,
     HOST_GS_SELECTOR                = 0x00000c0a,
     HOST_TR_SELECTOR                = 0x00000c0c,
+
+    /* 64-bit fields. */
     IO_BITMAP_A                     = 0x00002000,
     IO_BITMAP_B                     = 0x00002002,
     MSR_BITMAP                      = 0x00002004,
@@ -493,6 +496,8 @@ enum vmcs_field {
     HOST_PAT                        = 0x00002c00,
     HOST_EFER                       = 0x00002c02,
     HOST_PERF_GLOBAL_CTRL           = 0x00002c04,
+
+    /* 32-bit fields. */
     PIN_BASED_VM_EXEC_CONTROL       = 0x00004000,
     CPU_BASED_VM_EXEC_CONTROL       = 0x00004002,
     EXCEPTION_BITMAP                = 0x00004004,
@@ -546,6 +551,8 @@ enum vmcs_field {
     GUEST_SYSENTER_CS               = 0x0000482a,
     GUEST_PREEMPTION_TIMER          = 0x0000482e,
     HOST_SYSENTER_CS                = 0x00004c00,
+
+    /* Natural-width fields. */
     CR0_GUEST_HOST_MASK             = 0x00006000,
     CR4_GUEST_HOST_MASK             = 0x00006002,
     CR0_READ_SHADOW                 = 0x00006004,
-- 
2.34.1


