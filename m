Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D64ABA5C0C9
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 13:24:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908061.1315227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tryeD-0003bh-Sa; Tue, 11 Mar 2025 12:23:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908061.1315227; Tue, 11 Mar 2025 12:23:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tryeD-0003Yx-Pc; Tue, 11 Mar 2025 12:23:49 +0000
Received: by outflank-mailman (input) for mailman id 908061;
 Tue, 11 Mar 2025 12:23:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=siat=V6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tryeC-0003Yr-C2
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 12:23:48 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id adb7c7d9-fe73-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 13:23:46 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ac289147833so438530166b.2
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 05:23:46 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac239482f3bsm927812266b.52.2025.03.11.05.23.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 05:23:45 -0700 (PDT)
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
X-Inumbo-ID: adb7c7d9-fe73-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741695825; x=1742300625; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ULC3mLT08eiUwzMYDRPpDGGckCo7E4MExnZyqsj1Hss=;
        b=MQZ8XNFUAVV8YXQi/0ZvtFm/tl5GDfv94cDNQ3QhGML1l69CoY+uoJ6T/4LMcSrhwk
         v1LMMe+UxQ6N12P2IMdPgSqa5h/YahM2YNTjZ8SOA8DhKIDwBnnGc9jJ+FLBA5qEHTeX
         nY+YGxMhSuj3eBOBZRoqrPBLvYOpAqE1xa/fE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741695825; x=1742300625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ULC3mLT08eiUwzMYDRPpDGGckCo7E4MExnZyqsj1Hss=;
        b=jYzcu8d5Osxc/1G3sazkJblx7e0hc01ZfjTOkfQnS6apJXe9zh4MfMZoSyXwpNAxnu
         QHpnE1AhJyIpr1PF0WdwreOWvRnaTEpkv0QYoDPAwxcQbseD/QrBnVr//+M5ESopFd27
         xzhKuEjb3jiCmoexdbLHQMUf90msR6DOBIz07wS8/SYDYORiojwCLtJzUNP0bFulpEfE
         yCkWcQ0v7h8kvm/VHL61KDUdMUo9p1rJGPX+EkUBJ6qoYFicgg2NKcyHIo7HclDPD7Y+
         ESWHVkeUnvlBV61xJuzC+LjYjM7VFiD3XMVoDnHoSiRj7HlxaCOjSqjC2mwI8v0t9VTA
         6GIA==
X-Gm-Message-State: AOJu0YwLqnxDMbgFqf1AvBK68+REZratHaHyBRmo+ZCROYcca3W4IJlk
	sq9L80hOty/HLtZiRLtUFnvnvMi2JK02D7a37tNxeTExXOXylZCnf/D1dWi5UU8WCRjzkXqaBXK
	F
X-Gm-Gg: ASbGncsz0J+CWtK7MRQsRW1Wh0KIqaqLVCjcamewUFi8XCbRBfNJMSCe/0KvOqZqWPE
	xWrj2z2/6Etx2+hBnkRlz+3W0oLW865RORE266g2+KxlacWmdmAkEgM2KY+b+snNRlstruzGsXM
	y/aEAQ/q5K/Qah+ymQG6vwSEHe1wKjxapGT12/cgkGYZN2iyg37yLZ3hXmaG/vQ+ea3SBV/+RV3
	DxgYH4U2gTClLxbqYpQ4YTYjKFNnnc6OY6+T9nCn1A4sZahJ+1vkZCCDi/c9Nrp1PzfHx1OcsjN
	WqXd2a0XUZN5dtiN3RDa/MoreXKvcKwSZ0GtSQa3JuqkGTThDA==
X-Google-Smtp-Source: AGHT+IFx7Yq1ZMT37sbgJ6ObWgAeZ/dwmG+yvQeUoTdsF5hdpoR1QFjmnNMg+Y6lPhnj/GKvEhOVlw==
X-Received: by 2002:a17:907:1b21:b0:ac1:e2e0:f8d6 with SMTP id a640c23a62f3a-ac2525f936amr1713605566b.17.1741695825300;
        Tue, 11 Mar 2025 05:23:45 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3] x86/msr: expose MSR_FAM10H_MMIO_CONF_BASE on AMD
Date: Tue, 11 Mar 2025 13:22:35 +0100
Message-ID: <20250311122235.61656-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The MMIO_CONF_BASE reports the base of the MCFG range on AMD systems.
Linux pre-6.14 is unconditionally attempting to read the MSR without a
safe MSR accessor, and since Xen doesn't allow access to it Linux reports
the following error:

unchecked MSR access error: RDMSR from 0xc0010058 at rIP: 0xffffffff8101d19f (xen_do_read_msr+0x7f/0xa0)
Call Trace:
 xen_read_msr+0x1e/0x30
 amd_get_mmconfig_range+0x2b/0x80
 quirk_amd_mmconfig_area+0x28/0x100
 pnp_fixup_device+0x39/0x50
 __pnp_add_device+0xf/0x150
 pnp_add_device+0x3d/0x100
 pnpacpi_add_device_handler+0x1f9/0x280
 acpi_ns_get_device_callback+0x104/0x1c0
 acpi_ns_walk_namespace+0x1d0/0x260
 acpi_get_devices+0x8a/0xb0
 pnpacpi_init+0x50/0x80
 do_one_initcall+0x46/0x2e0
 kernel_init_freeable+0x1da/0x2f0
 kernel_init+0x16/0x1b0
 ret_from_fork+0x30/0x50
 ret_from_fork_asm+0x1b/0x30

Such access is conditional to the presence of a device with PnP ID
"PNP0c01", which triggers the execution of the quirk_amd_mmconfig_area()
function.  Note that prior to commit 3fac3734c43a MSR accesses when running
as a PV guest would always use the safe variant, and thus silently handle
the #GP.

Fix by allowing access to the MSR on AMD systems for the hardware domain.

Write attempts to the MSR will still result in #GP for all domain types.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - #GP on domU accesses.

Changes since v1:
 - Expand commit message to note which device triggers the MSR read.
---
 xen/arch/x86/msr.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 1550fd9ec9f3..2cd46b6c8afa 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -318,6 +318,14 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
         *val = 0;
         break;
 
+    case MSR_FAM10H_MMIO_CONF_BASE:
+        if ( !is_hardware_domain(d) ||
+             !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) ||
+             rdmsr_safe(msr, *val) )
+            goto gp_fault;
+
+        break;
+
     case MSR_VIRT_SPEC_CTRL:
         if ( !cp->extd.virt_ssbd )
             goto gp_fault;
-- 
2.48.1


