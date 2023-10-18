Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 656CA7CDF9E
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 16:26:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618623.962545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt7VG-0003EF-Pr; Wed, 18 Oct 2023 14:26:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618623.962545; Wed, 18 Oct 2023 14:26:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt7VG-0003BM-Lu; Wed, 18 Oct 2023 14:26:30 +0000
Received: by outflank-mailman (input) for mailman id 618623;
 Wed, 18 Oct 2023 14:26:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MOie=GA=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qt7VE-0001YJ-O3
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 14:26:28 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5320d6e0-6dc2-11ee-98d4-6d05b1d4d9a1;
 Wed, 18 Oct 2023 16:26:28 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.161.127.233])
 by support.bugseng.com (Postfix) with ESMTPSA id 70AE34EE073F;
 Wed, 18 Oct 2023 16:26:26 +0200 (CEST)
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
X-Inumbo-ID: 5320d6e0-6dc2-11ee-98d4-6d05b1d4d9a1
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 6/7] x86/vmce: address violations of MISRA C:2012 Rule 8.2
Date: Wed, 18 Oct 2023 16:25:59 +0200
Message-Id: <f6df2bcbbe4bc0050edc1d62837d5e9a6ff56064.1697638486.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697638486.git.federico.serafini@bugseng.com>
References: <cover.1697638486.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter names. No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/cpu/mcheck/vmce.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/vmce.h b/xen/arch/x86/cpu/mcheck/vmce.h
index 2e9b32a9bd..a9a325f776 100644
--- a/xen/arch/x86/cpu/mcheck/vmce.h
+++ b/xen/arch/x86/cpu/mcheck/vmce.h
@@ -11,10 +11,10 @@ int vmce_init(struct cpuinfo_x86 *c);
 
 int unmmap_broken_page(struct domain *d, mfn_t mfn, unsigned long gfn);
 
-int vmce_intel_rdmsr(const struct vcpu *, uint32_t msr, uint64_t *val);
-int vmce_intel_wrmsr(struct vcpu *, uint32_t msr, uint64_t val);
-int vmce_amd_rdmsr(const struct vcpu *, uint32_t msr, uint64_t *val);
-int vmce_amd_wrmsr(struct vcpu *, uint32_t msr, uint64_t val);
+int vmce_intel_rdmsr(const struct vcpu *v, uint32_t msr, uint64_t *val);
+int vmce_intel_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val);
+int vmce_amd_rdmsr(const struct vcpu *v, uint32_t msr, uint64_t *val);
+int vmce_amd_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val);
 
 int fill_vmsr_data(struct mcinfo_bank *mc_bank, struct domain *d,
                    uint64_t gstatus, int vmce_vcpuid);
-- 
2.34.1


