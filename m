Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3A62945BD
	for <lists+xen-devel@lfdr.de>; Wed, 21 Oct 2020 02:00:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9794.25830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kV1Y8-0007yZ-Fp; Wed, 21 Oct 2020 00:00:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9794.25830; Wed, 21 Oct 2020 00:00:16 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kV1Y8-0007yA-Ck; Wed, 21 Oct 2020 00:00:16 +0000
Received: by outflank-mailman (input) for mailman id 9794;
 Wed, 21 Oct 2020 00:00:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=01QD=D4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kV1Y7-0007xs-8i
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 00:00:15 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 83671988-2886-4227-9646-90ec5a7dc997;
 Wed, 21 Oct 2020 00:00:14 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9986F2076A;
 Wed, 21 Oct 2020 00:00:12 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=01QD=D4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kV1Y7-0007xs-8i
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 00:00:15 +0000
X-Inumbo-ID: 83671988-2886-4227-9646-90ec5a7dc997
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 83671988-2886-4227-9646-90ec5a7dc997;
	Wed, 21 Oct 2020 00:00:14 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 9986F2076A;
	Wed, 21 Oct 2020 00:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603238413;
	bh=ZAlufUARB+MO+hXOZ2+s0SU7+f17uYJTPwjBRMscVvo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FhgXC9FX40tFcNlZf6C6aZksWsXnRjInguehqK+hTOgWCHUZCIoF2oDc9uHPOUVyG
	 Zbt5OYxarr4QlfO5uOsZi/WDAJEcHqNzypnCUpnojASzzz4UL2gF2IUfQcVMLrB3Oi
	 kaEyrrrfEL3YAs0sjHxL1vaTJZ/oJvXTS0+W2hKs=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	ian.jackson@eu.citrix.com,
	jbeulich@suse.com,
	julien@xen.org,
	wl@xen.org,
	Bertrand.Marquis@arm.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v2 01/14] kernel-doc: public/arch-arm.h
Date: Tue, 20 Oct 2020 16:59:58 -0700
Message-Id: <20201021000011.15351-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2010201646370.12247@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2010201646370.12247@sstabellini-ThinkPad-T480s>

Convert in-code comments to kernel-doc format wherever possible.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 xen/include/public/arch-arm.h | 43 ++++++++++++++++++++++-------------
 1 file changed, 27 insertions(+), 16 deletions(-)

diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index c365b1b39e..409697dede 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -27,8 +27,8 @@
 #ifndef __XEN_PUBLIC_ARCH_ARM_H__
 #define __XEN_PUBLIC_ARCH_ARM_H__
 
-/*
- * `incontents 50 arm_abi Hypercall Calling Convention
+/**
+ * DOC: Hypercall Calling Convention
  *
  * A hypercall is issued using the ARM HVC instruction.
  *
@@ -72,8 +72,8 @@
  * Any cache allocation hints are acceptable.
  */
 
-/*
- * `incontents 55 arm_hcall Supported Hypercalls
+/**
+ * DOC: Supported Hypercalls
  *
  * Xen on ARM makes extensive use of hardware facilities and therefore
  * only a subset of the potential hypercalls are required.
@@ -175,10 +175,17 @@
     typedef union { type *p; uint64_aligned_t q; }              \
         __guest_handle_64_ ## name
 
-/*
+/**
+ * DOC: XEN_GUEST_HANDLE - a guest pointer in a struct
+ *
  * XEN_GUEST_HANDLE represents a guest pointer, when passed as a field
  * in a struct in memory. On ARM is always 8 bytes sizes and 8 bytes
  * aligned.
+ */
+
+/**
+ * DOC: XEN_GUEST_HANDLE_PARAM - a guest pointer as a hypercall arg
+ *
  * XEN_GUEST_HANDLE_PARAM represents a guest pointer, when passed as an
  * hypercall argument. It is 4 bytes on aarch32 and 8 bytes on aarch64.
  */
@@ -201,7 +208,9 @@ typedef uint64_t xen_pfn_t;
 #define PRI_xen_pfn PRIx64
 #define PRIu_xen_pfn PRIu64
 
-/*
+/**
+ * DOC: XEN_LEGACY_MAX_VCPUS
+ *
  * Maximum number of virtual CPUs in legacy multi-processor guests.
  * Only one. All other VCPUS must use VCPUOP_register_vcpu_info.
  */
@@ -299,26 +308,28 @@ struct vcpu_guest_context {
 typedef struct vcpu_guest_context vcpu_guest_context_t;
 DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
 
-/*
+
+/**
+ * struct xen_arch_domainconfig - arch-specific domain creation params
+ *
  * struct xen_arch_domainconfig's ABI is covered by
  * XEN_DOMCTL_INTERFACE_VERSION.
  */
+struct xen_arch_domainconfig {
+    /** @gic_version: IN/OUT parameter */
 #define XEN_DOMCTL_CONFIG_GIC_NATIVE    0
 #define XEN_DOMCTL_CONFIG_GIC_V2        1
 #define XEN_DOMCTL_CONFIG_GIC_V3        2
-
+    uint8_t gic_version;
+    /** @tee_type: IN parameter */
 #define XEN_DOMCTL_CONFIG_TEE_NONE      0
 #define XEN_DOMCTL_CONFIG_TEE_OPTEE     1
-
-struct xen_arch_domainconfig {
-    /* IN/OUT */
-    uint8_t gic_version;
-    /* IN */
     uint16_t tee_type;
-    /* IN */
+    /** @nr_spis: IN parameter */
     uint32_t nr_spis;
-    /*
-     * OUT
+    /**
+     * @clock_frequency: OUT parameter
+     *
      * Based on the property clock-frequency in the DT timer node.
      * The property may be present when the bootloader/firmware doesn't
      * set correctly CNTFRQ which hold the timer frequency.
-- 
2.17.1


