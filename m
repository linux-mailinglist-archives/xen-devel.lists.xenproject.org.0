Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCADD220A2E
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 12:38:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvenq-000156-Qv; Wed, 15 Jul 2020 10:38:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9G22=A2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jvenp-00014E-Fi
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 10:38:17 +0000
X-Inumbo-ID: 4a7fa0cf-c687-11ea-93b5-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4a7fa0cf-c687-11ea-93b5-12813bfff9fa;
 Wed, 15 Jul 2020 10:38:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ED61DB1BA;
 Wed, 15 Jul 2020 10:38:18 +0000 (UTC)
Subject: [PATCH 3/8] x86: shrink struct arch_{vcpu,domain} when !HVM
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3375cacd-d3b7-9f06-44a7-4b684b6a77d6@suse.com>
Message-ID: <4a9040f0-dbb1-18ce-ebea-2bfe5d68bf86@suse.com>
Date: Wed, 15 Jul 2020 12:38:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3375cacd-d3b7-9f06-44a7-4b684b6a77d6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

While this won't affect overall memory overhead (struct vcpu as well as
struct domain get allocated as single pages) nor code size (the offsets
into the base structures are too large to be representable as signed 8-
bit displacements), it'll allow the tail of struct pv_{domain,vcpu} to
share a cache line with subsequent struct arch_{domain,vcpu} fields.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: There is a risk associated with this: If we still have code
     somewhere accessing the HVM parts of the structures without a prior
     type check of the guest, this going to end up worse than the so far
     not uncommon case of the access simply going to space unused by PV.
     We may therefore want to consider whether to further restrict when
     this conversion to union gets done.
     And of course there's also the risk of future compilers complaining
     about this abuse of unions. But this is limited to code that's dead
     in !HVM configs, so only an apparent problem.

--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -709,7 +709,7 @@ long arch_do_domctl(
         unsigned int fmp = domctl->u.ioport_mapping.first_mport;
         unsigned int np = domctl->u.ioport_mapping.nr_ports;
         unsigned int add = domctl->u.ioport_mapping.add_mapping;
-        struct hvm_domain *hvm;
+        hvm_domain_t *hvm;
         struct g2m_ioport *g2m_ioport;
         int found = 0;
 
--- a/xen/include/asm-x86/domain.h
+++ b/xen/include/asm-x86/domain.h
@@ -310,7 +310,7 @@ struct arch_domain
 
     union {
         struct pv_domain pv;
-        struct hvm_domain hvm;
+        hvm_domain_t hvm;
     };
 
     struct paging_domain paging;
@@ -573,7 +573,7 @@ struct arch_vcpu
     /* Virtual Machine Extensions */
     union {
         struct pv_vcpu pv;
-        struct hvm_vcpu hvm;
+        hvm_vcpu_t hvm;
     };
 
     pagetable_t guest_table_user;       /* (MFN) x86/64 user-space pagetable */
--- a/xen/include/asm-x86/hvm/domain.h
+++ b/xen/include/asm-x86/hvm/domain.h
@@ -99,7 +99,13 @@ struct hvm_pi_ops {
 
 #define MAX_NR_IOREQ_SERVERS 8
 
-struct hvm_domain {
+typedef
+#ifdef CONFIG_HVM
+struct
+#else
+union
+#endif
+hvm_domain {
     /* Guest page range used for non-default ioreq servers */
     struct {
         unsigned long base;
@@ -203,7 +209,7 @@ struct hvm_domain {
 #ifdef CONFIG_MEM_SHARING
     struct mem_sharing_domain mem_sharing;
 #endif
-};
+} hvm_domain_t;
 
 #endif /* __ASM_X86_HVM_DOMAIN_H__ */
 
--- a/xen/include/asm-x86/hvm/vcpu.h
+++ b/xen/include/asm-x86/hvm/vcpu.h
@@ -149,7 +149,13 @@ struct altp2mvcpu {
 
 #define vcpu_altp2m(v) ((v)->arch.hvm.avcpu)
 
-struct hvm_vcpu {
+typedef
+#ifdef CONFIG_HVM
+struct
+#else
+union
+#endif
+hvm_vcpu {
     /* Guest control-register and EFER values, just as the guest sees them. */
     unsigned long       guest_cr[5];
     unsigned long       guest_efer;
@@ -213,7 +219,7 @@ struct hvm_vcpu {
     struct x86_event     inject_event;
 
     struct viridian_vcpu *viridian;
-};
+} hvm_vcpu_t;
 
 #endif /* __ASM_X86_HVM_VCPU_H__ */
 


