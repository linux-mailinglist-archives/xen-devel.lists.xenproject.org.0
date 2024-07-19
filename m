Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2536493791E
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2024 16:21:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761098.1171085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUoU1-0001s8-4e; Fri, 19 Jul 2024 14:21:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761098.1171085; Fri, 19 Jul 2024 14:21:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUoU1-0001qX-1q; Fri, 19 Jul 2024 14:21:17 +0000
Received: by outflank-mailman (input) for mailman id 761098;
 Fri, 19 Jul 2024 14:21:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hWFp=OT=cloud.com=matthew.barnes@srs-se1.protection.inumbo.net>)
 id 1sUoTz-0001qR-6L
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2024 14:21:15 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26e7d52e-45da-11ef-8776-851b0ebba9a2;
 Fri, 19 Jul 2024 16:21:13 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5a167b9df7eso1237327a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jul 2024 07:21:13 -0700 (PDT)
Received: from EMEAENGAAD91498.citrite.net ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c7bddc6sm38351866b.69.2024.07.19.07.21.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jul 2024 07:21:11 -0700 (PDT)
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
X-Inumbo-ID: 26e7d52e-45da-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1721398872; x=1722003672; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5mKoKQlcx9bJbBptsIYJsL6Whb62TcTKnY7xLKDf1v0=;
        b=hC2DujudJ++7S9frQp9ywk9jbCqt3FKXEMilz6nMI0n4XPevP4Dai6CybnXyixfpBa
         VOMHhtM3xSMQUXzR6LXRgqyOGOSQgZfTx3zR6fX0v1WQ+SJxecwkNJSfl2hDqyF6D9Px
         A01Ewv1hwnYWWI4jl/m1QE8F5g9fEBstd6tJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721398872; x=1722003672;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5mKoKQlcx9bJbBptsIYJsL6Whb62TcTKnY7xLKDf1v0=;
        b=grkGXOPSsokzEv8RhRnsBecgQ8DkWeqqXsjDTsYEUMq/2R9hQ+uz94WXefmQObjZbg
         qLdsmI3oLUGxpaxguf4ryAXMQB8aEGC/P/9bSYgn1P20QBXS0NFvMGh3TdWiHvaobDmt
         3sgoxeERxXRBquSVw4ncHDPUrIn9GyHzA2lnu/1vmOtSdiXTaRF7pm4eiwwBun9N43Bd
         jATBYr4F89P/+KlwHLszIkaP2LsnM/MKICXr8Yl2VTeQyXMa7N+VYQ1x+UJj+KPJIrrc
         VoU1Gck5YxHuuksl/2rdhksLYNvZLuQeOlnDudM9ckuEeC/hOWF+gKcPkxIHziaSY8iA
         1blA==
X-Gm-Message-State: AOJu0Yw1Zg0N7F+OG477Wy1LhGFAli4NZlMY1S2ER/rTcG+ukGF+G9hg
	aeuouXfs5FR8dj6jY9NIEdKwbqHq8kL/TknofurXmph+ywvKIUR6SGktpCIFuB1JmwzPEZ2Bi2i
	O
X-Google-Smtp-Source: AGHT+IG5+aGcvK2yZQ2J1dJ41Tx5MoQ32oGaGTOkUPFPBwbDx4YkjxUNmXkKePi211DRsWbpDrtabg==
X-Received: by 2002:a17:906:7b4d:b0:a6f:6803:57ef with SMTP id a640c23a62f3a-a7a0119ddddmr561622366b.27.1721398872096;
        Fri, 19 Jul 2024 07:21:12 -0700 (PDT)
From: Matthew Barnes <matthew.barnes@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Matthew Barnes <matthew.barnes@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: [RFC XEN PATCH v2] x86/cpuid: Expose max_vcpus field in HVM hypervisor leaf
Date: Fri, 19 Jul 2024 15:21:09 +0100
Message-Id: <fa24cd3b232e8865eb6451e5f7af9cd203ce52ab.1721224079.git.matthew.barnes@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, OVMF is hard-coded to set up a maximum of 64 vCPUs on
startup.

There are efforts to support a maximum of 128 vCPUs, which would involve
bumping the OVMF constant from 64 to 128.

However, it would be more future-proof for OVMF to access the maximum
number of vCPUs for a domain and set itself up appropriately at
run-time.

GitLab ticket: https://gitlab.com/xen-project/xen/-/issues/191

For OVMF to access the maximum vCPU count, this patch has Xen expose
the maximum vCPU ID via cpuid on the HVM hypervisor leaf in edx.

Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>
---
Changes in v2:
- Tweak value from "maximum vcpu count" to "maximum vcpu id"
- Reword commit message to avoid "have to" wording
- Fix vpcus -> vcpus typo
---
 xen/arch/x86/traps.c                | 4 ++++
 xen/include/public/arch-x86/cpuid.h | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index ee91fc56b125..f39b598e9bba 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1169,6 +1169,10 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
         res->a |= XEN_HVM_CPUID_DOMID_PRESENT;
         res->c = d->domain_id;
 
+        /* Indicate presence of max vcpu id and set it in edx */
+        res->a |= XEN_HVM_CPUID_MAX_VCPU_ID_PRESENT;
+        res->d = d->max_vcpus - 1;
+
         /*
          * Per-vCPU event channel upcalls are implemented and work
          * correctly with PIRQs routed over event channels.
diff --git a/xen/include/public/arch-x86/cpuid.h b/xen/include/public/arch-x86/cpuid.h
index 3bb0dd249ff9..7673e285a9ec 100644
--- a/xen/include/public/arch-x86/cpuid.h
+++ b/xen/include/public/arch-x86/cpuid.h
@@ -87,6 +87,7 @@
  * Sub-leaf 0: EAX: Features
  * Sub-leaf 0: EBX: vcpu id (iff EAX has XEN_HVM_CPUID_VCPU_ID_PRESENT flag)
  * Sub-leaf 0: ECX: domain id (iff EAX has XEN_HVM_CPUID_DOMID_PRESENT flag)
+ * Sub-leaf 0: EDX: max vcpu id (iff EAX has XEN_HVM_CPUID_MAX_VCPU_ID_PRESENT flag)
  */
 #define XEN_HVM_CPUID_APIC_ACCESS_VIRT (1u << 0) /* Virtualized APIC registers */
 #define XEN_HVM_CPUID_X2APIC_VIRT      (1u << 1) /* Virtualized x2APIC accesses */
@@ -107,6 +108,8 @@
  */
 #define XEN_HVM_CPUID_UPCALL_VECTOR    (1u << 6)
 
+#define XEN_HVM_CPUID_MAX_VCPU_ID_PRESENT (1u << 7) /* max vcpu id is present in EDX */
+
 /*
  * Leaf 6 (0x40000x05)
  * PV-specific parameters
-- 
2.34.1


