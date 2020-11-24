Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2B62C30BE
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 20:30:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36923.69034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khe1X-0005eU-O0; Tue, 24 Nov 2020 19:30:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36923.69034; Tue, 24 Nov 2020 19:30:47 +0000
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
	id 1khe1X-0005dk-G6; Tue, 24 Nov 2020 19:30:47 +0000
Received: by outflank-mailman (input) for mailman id 36923;
 Tue, 24 Nov 2020 19:30:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1khe1V-0005bX-7u
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 19:30:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1khe1U-0004Oe-6T; Tue, 24 Nov 2020 19:30:44 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com
 ([86.183.162.145] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1khdfS-0000r4-Q4; Tue, 24 Nov 2020 19:07:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khe1V-0005bX-7u
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 19:30:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=aEBO33IoPtgfp4ROpOAovObbOPgE7wiSsLQNJbsivrE=; b=g+b9RfjYbai05izai8aY8mU7QG
	2ypBZdv6GtWwikgt0qJgTIxANwyidRIyRzauSJFicVbTOGDmuBrbX7+FMWQp8/0xajgItlT14hMIO
	nfkuAFubCjyFLzPKp6GYOW9iDcjyBvLid5/H/PMYc0XY8KKyaTYQRhXlbSAhwF/6XPko=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khe1U-0004Oe-6T; Tue, 24 Nov 2020 19:30:44 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com ([86.183.162.145] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khdfS-0000r4-Q4; Tue, 24 Nov 2020 19:07:59 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Wei Liu <wl@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 11/13] viridian: add a new '_HVMPV_ex_processor_masks' bit into HVM_PARAM_VIRIDIAN...
Date: Tue, 24 Nov 2020 19:07:42 +0000
Message-Id: <20201124190744.11343-12-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201124190744.11343-1-paul@xen.org>
References: <20201124190744.11343-1-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

... and advertise ExProcessorMasks support if it is set.

Support is advertised by setting bit 11 in CPUID:40000004:EAX.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Wei Liu <wl@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/arch/x86/hvm/viridian/viridian.c | 3 +++
 xen/include/public/hvm/params.h      | 7 ++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
index 3c18908b7b35..32bf58db3a73 100644
--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -84,6 +84,7 @@ typedef union _HV_CRASH_CTL_REG_CONTENTS
 #define CPUID4A_MSR_BASED_APIC         (1 << 3)
 #define CPUID4A_RELAX_TIMER_INT        (1 << 5)
 #define CPUID4A_SYNTHETIC_CLUSTER_IPI  (1 << 10)
+#define CPUID4A_EX_PROCESSOR_MASKS     (1 << 11)
 
 /* Viridian CPUID leaf 6: Implementation HW features detected and in use */
 #define CPUID6A_APIC_OVERLAY    (1 << 0)
@@ -197,6 +198,8 @@ void cpuid_viridian_leaves(const struct vcpu *v, uint32_t leaf,
             res->a |= CPUID4A_MSR_BASED_APIC;
         if ( viridian_feature_mask(d) & HVMPV_hcall_ipi )
             res->a |= CPUID4A_SYNTHETIC_CLUSTER_IPI;
+        if ( viridian_feature_mask(d) & HVMPV_ex_processor_masks )
+            res->a |= CPUID4A_EX_PROCESSOR_MASKS;
 
         /*
          * This value is the recommended number of attempts to try to
diff --git a/xen/include/public/hvm/params.h b/xen/include/public/hvm/params.h
index 0e3fdca09646..3b0a0f45da53 100644
--- a/xen/include/public/hvm/params.h
+++ b/xen/include/public/hvm/params.h
@@ -164,6 +164,10 @@
 #define _HVMPV_hcall_ipi 9
 #define HVMPV_hcall_ipi (1 << _HVMPV_hcall_ipi)
 
+/* Enable ExProcessorMasks */
+#define _HVMPV_ex_processor_masks 10
+#define HVMPV_ex_processor_masks (1 << _HVMPV_ex_processor_masks)
+
 #define HVMPV_feature_mask \
         (HVMPV_base_freq | \
          HVMPV_no_freq | \
@@ -174,7 +178,8 @@
          HVMPV_crash_ctl | \
          HVMPV_synic | \
          HVMPV_stimer | \
-         HVMPV_hcall_ipi)
+         HVMPV_hcall_ipi | \
+         HVMPV_ex_processor_masks)
 
 #endif
 
-- 
2.20.1


