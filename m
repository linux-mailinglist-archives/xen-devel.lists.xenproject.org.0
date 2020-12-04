Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 554342CEA42
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 09:53:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44164.79275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl6py-0006nt-8D; Fri, 04 Dec 2020 08:53:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44164.79275; Fri, 04 Dec 2020 08:53:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl6px-0006ku-T5; Fri, 04 Dec 2020 08:53:09 +0000
Received: by outflank-mailman (input) for mailman id 44164;
 Fri, 04 Dec 2020 08:53:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kl6pv-0006fg-5V
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 08:53:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kl6pv-0004A1-0R; Fri, 04 Dec 2020 08:53:07 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com
 ([86.183.162.145] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kl6pu-00081O-P7; Fri, 04 Dec 2020 08:53:06 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=hKsDOrpgiJSDA+ammFrF07gmisbXWrRCPKTZaRZM/PU=; b=PqaHCFE1LPrk7HnD2c1OEv7J/E
	0b34JrxmglfSclnRKx86yjDeRwJB4FAzShN68tZWbct3X8oRmNBYKIBHAT38QTmjY25AyiosPP9To
	LFkh8JGW4U6VmJpxjF2a7/pPEZiunbeFQGxBGb2IoeW9oU2c7Yrx96zge2CR73L5eR9Q=;
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Wei Liu <wl@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 09/11] viridian: log initial invocation of each type of hypercall
Date: Fri,  4 Dec 2020 08:52:53 +0000
Message-Id: <20201204085255.26216-10-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201204085255.26216-1-paul@xen.org>
References: <20201204085255.26216-1-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

To make is simpler to observe which viridian hypercalls are issued by a
particular Windows guest, this patch adds a per-domain mask to track them.
Each type of hypercall causes a different bit to be set in the mask and
when the bit transitions from clear to set, a log line is emitted showing
the name of the hypercall and the domain that issued it.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Wei Liu <wl@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>

v2:
 - Use DECLARE_BITMAP() for 'hypercall_flags'
 - Use an enum for _HCALL_* values
---
 xen/arch/x86/hvm/viridian/viridian.c | 21 +++++++++++++++++++++
 xen/include/asm-x86/hvm/viridian.h   | 10 ++++++++++
 2 files changed, 31 insertions(+)

diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
index 5e4a2fa53ad4..efd8e3a900c3 100644
--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -933,6 +933,7 @@ int viridian_hypercall(struct cpu_user_regs *regs)
 {
     struct vcpu *curr = current;
     struct domain *currd = curr->domain;
+    struct viridian_domain *vd = currd->arch.hvm.viridian;
     int mode = hvm_guest_x86_mode(curr);
     unsigned long input_params_gpa, output_params_gpa;
     int rc = 0;
@@ -962,6 +963,10 @@ int viridian_hypercall(struct cpu_user_regs *regs)
     switch ( input.call_code )
     {
     case HVCALL_NOTIFY_LONG_SPIN_WAIT:
+        if ( !test_and_set_bit(_HCALL_spin_wait, vd->hypercall_flags) )
+            printk(XENLOG_G_INFO "d%d: VIRIDIAN HVCALL_NOTIFY_LONG_SPIN_WAIT\n",
+                   currd->domain_id);
+
         /*
          * See section 14.5.1 of the specification.
          */
@@ -970,22 +975,38 @@ int viridian_hypercall(struct cpu_user_regs *regs)
 
     case HVCALL_FLUSH_VIRTUAL_ADDRESS_SPACE:
     case HVCALL_FLUSH_VIRTUAL_ADDRESS_LIST:
+        if ( !test_and_set_bit(_HCALL_flush, vd->hypercall_flags) )
+            printk(XENLOG_G_INFO "%pd: VIRIDIAN HVCALL_FLUSH_VIRTUAL_ADDRESS_SPACE/LIST\n",
+                   currd);
+
         rc = hvcall_flush(&input, &output, input_params_gpa,
                           output_params_gpa);
         break;
 
     case HVCALL_FLUSH_VIRTUAL_ADDRESS_SPACE_EX:
     case HVCALL_FLUSH_VIRTUAL_ADDRESS_LIST_EX:
+        if ( !test_and_set_bit(_HCALL_flush_ex, vd->hypercall_flags) )
+            printk(XENLOG_G_INFO "%pd: VIRIDIAN HVCALL_FLUSH_VIRTUAL_ADDRESS_SPACE/LIST_EX\n",
+                   currd);
+
         rc = hvcall_flush_ex(&input, &output, input_params_gpa,
                              output_params_gpa);
         break;
 
     case HVCALL_SEND_IPI:
+        if ( !test_and_set_bit(_HCALL_ipi, vd->hypercall_flags) )
+            printk(XENLOG_G_INFO "%pd: VIRIDIAN HVCALL_SEND_IPI\n",
+                   currd);
+
         rc = hvcall_ipi(&input, &output, input_params_gpa,
                         output_params_gpa);
         break;
 
     case HVCALL_SEND_IPI_EX:
+        if ( !test_and_set_bit(_HCALL_ipi_ex, vd->hypercall_flags) )
+            printk(XENLOG_G_INFO "%pd: VIRIDIAN HVCALL_SEND_IPI_EX\n",
+                   currd);
+
         rc = hvcall_ipi_ex(&input, &output, input_params_gpa,
                            output_params_gpa);
         break;
diff --git a/xen/include/asm-x86/hvm/viridian.h b/xen/include/asm-x86/hvm/viridian.h
index cbf77d9c760b..4c8ff6e80b6f 100644
--- a/xen/include/asm-x86/hvm/viridian.h
+++ b/xen/include/asm-x86/hvm/viridian.h
@@ -55,10 +55,20 @@ struct viridian_time_ref_count
     int64_t off;
 };
 
+enum {
+    _HCALL_spin_wait,
+    _HCALL_flush,
+    _HCALL_flush_ex,
+    _HCALL_ipi,
+    _HCALL_ipi_ex,
+    _HCALL_nr /* must be last */
+};
+
 struct viridian_domain
 {
     union hv_guest_os_id guest_os_id;
     union hv_vp_assist_page_msr hypercall_gpa;
+    DECLARE_BITMAP(hypercall_flags, _HCALL_nr);
     struct viridian_time_ref_count time_ref_count;
     struct viridian_page reference_tsc;
 };
-- 
2.20.1


