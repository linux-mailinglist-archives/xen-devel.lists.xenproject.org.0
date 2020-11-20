Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 312D02BA6E8
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 11:00:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31905.62700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg3Di-0000CE-Vg; Fri, 20 Nov 2020 10:00:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31905.62700; Fri, 20 Nov 2020 10:00:46 +0000
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
	id 1kg3Di-0000BC-OC; Fri, 20 Nov 2020 10:00:46 +0000
Received: by outflank-mailman (input) for mailman id 31905;
 Fri, 20 Nov 2020 10:00:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kg3Dh-0000AK-2w
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 10:00:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kg3Dg-0002vb-0J; Fri, 20 Nov 2020 10:00:44 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com
 ([109.146.187.185] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kg32b-0003d1-Bb; Fri, 20 Nov 2020 09:49:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kg3Dh-0000AK-2w
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 10:00:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=/tzXLkeYgeohzzpZOobPIXPIDOQTKzNBQ+V78872kJQ=; b=aljZn49SbQde/x5Nfc4qojAcC9
	PmWnCmYLuahJRepbdlcp7D10Hf7/4GZGlmy4UacseYU3bW0hcFi4rzFS5VtVbEXZSyZ6HDF3UQIyW
	BgIbKsJb5C6OoEFWjSnKcH9N0A5eWc42xHT6tgBvcneNt0Dli+cysl18664ZNsNtqc4U=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kg3Dg-0002vb-0J; Fri, 20 Nov 2020 10:00:44 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com ([109.146.187.185] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kg32b-0003d1-Bb; Fri, 20 Nov 2020 09:49:17 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 12/12] xl / libxl: add 'ex_processor_mask' into 'libxl_viridian_enlightenment'
Date: Fri, 20 Nov 2020 09:49:00 +0000
Message-Id: <20201120094900.1489-13-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201120094900.1489-1-paul@xen.org>
References: <20201120094900.1489-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

Adding the new value into the enumeration makes it immediately available
to xl, so this patch adjusts the xl.cfg(5) documentation accordingly.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
---
 docs/man/xl.cfg.5.pod.in         | 8 ++++++++
 tools/include/libxl.h            | 7 +++++++
 tools/libs/light/libxl_types.idl | 1 +
 tools/libs/light/libxl_x86.c     | 3 +++
 4 files changed, 19 insertions(+)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 0532739c1fff..3f0f8de1e988 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2318,6 +2318,14 @@ This set incorporates use of a hypercall for interprocessor interrupts.
 This enlightenment may improve performance of Windows guests with multiple
 virtual CPUs.
 
+=item B<ex_processor_masks>
+
+This set enables new hypercall variants taking a variably-sized sparse
+B<Virtual Processor Set> as an argument, rather than a simple 64-bit
+mask. Hence this enlightenment must be specified for guests with more
+than 64 vCPUs if B<hcall_remote_tlb_flush> and/or B<hcall_ipi> are also
+specified.
+
 =item B<defaults>
 
 This is a special value that enables the default set of groups, which
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 1ea5b4f446e8..eaffccb30f37 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -444,6 +444,13 @@
  */
 #define LIBXL_HAVE_DISK_SAFE_REMOVE 1
 
+/*
+ * LIBXL_HAVE_VIRIDIAN_EX_PROCESSOR_MASKS indicates that the
+ * 'ex_processor_masks' value is present in the viridian enlightenment
+ * enumeration.
+ */
+#define LIBXL_HAVE_VIRIDIAN_EX_PROCESSOR_MASKS 1
+
 /*
  * libxl ABI compatibility
  *
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 9d3f05f39978..05324736b744 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -238,6 +238,7 @@ libxl_viridian_enlightenment = Enumeration("viridian_enlightenment", [
     (7, "synic"),
     (8, "stimer"),
     (9, "hcall_ipi"),
+    (10, "ex_processor_masks"),
     ])
 
 libxl_hdtype = Enumeration("hdtype", [
diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
index e18274cc10e2..86d272999d67 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -366,6 +366,9 @@ static int hvm_set_viridian_features(libxl__gc *gc, uint32_t domid,
     if (libxl_bitmap_test(&enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_HCALL_IPI))
         mask |= HVMPV_hcall_ipi;
 
+    if (libxl_bitmap_test(&enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_EX_PROCESSOR_MASKS))
+        mask |= HVMPV_ex_processor_masks;
+
     if (mask != 0 &&
         xc_hvm_param_set(CTX->xch,
                          domid,
-- 
2.20.1


