Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9B47F75EE
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 15:05:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640736.999414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6WnX-0006Uo-SI; Fri, 24 Nov 2023 14:04:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640736.999414; Fri, 24 Nov 2023 14:04:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6WnX-0006Nq-Mx; Fri, 24 Nov 2023 14:04:47 +0000
Received: by outflank-mailman (input) for mailman id 640736;
 Fri, 24 Nov 2023 14:04:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wuqv=HF=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1r6WnV-0005N1-VZ
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 14:04:45 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b5493b8-8ad2-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 15:04:44 +0100 (CET)
Received: from Dell.bugseng.com (unknown [37.161.237.167])
 by support.bugseng.com (Postfix) with ESMTPSA id 768CB4EE0C96;
 Fri, 24 Nov 2023 15:04:43 +0100 (CET)
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
X-Inumbo-ID: 6b5493b8-8ad2-11ee-9b0e-b553b5be7939
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 05/11] xen/domain: address violations of MISRA C:2012 Rule 8.2
Date: Fri, 24 Nov 2023 15:03:20 +0100
Message-Id: <d38b5f555c622a23b2433793e70156efe459a811.1700832962.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700832962.git.federico.serafini@bugseng.com>
References: <cover.1700832962.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter names. No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/include/xen/domain.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 460c8c3d27..d345278b71 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -25,7 +25,7 @@ unsigned int dom0_max_vcpus(void);
 int parse_arch_dom0_param(const char *s, const char *e);
 struct vcpu *alloc_dom0_vcpu0(struct domain *dom0);
 
-int vcpu_reset(struct vcpu *);
+int vcpu_reset(struct vcpu *v);
 int vcpu_up(struct vcpu *v);
 
 void setup_system_domains(void);
@@ -65,9 +65,9 @@ void free_vcpu_struct(struct vcpu *v);
 
 /* Allocate/free a PIRQ structure. */
 #ifndef alloc_pirq_struct
-struct pirq *alloc_pirq_struct(struct domain *);
+struct pirq *alloc_pirq_struct(struct domain *d);
 #endif
-void cf_check free_pirq_struct(void *);
+void cf_check free_pirq_struct(void *ptr);
 
 /*
  * Initialise/destroy arch-specific details of a VCPU.
@@ -103,8 +103,8 @@ void arch_domain_creation_finished(struct domain *d);
 
 void arch_p2m_set_access_required(struct domain *d, bool access_required);
 
-int arch_set_info_guest(struct vcpu *, vcpu_guest_context_u);
-void arch_get_info_guest(struct vcpu *, vcpu_guest_context_u);
+int arch_set_info_guest(struct vcpu *v, vcpu_guest_context_u c);
+void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c);
 
 int arch_initialise_vcpu(struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg);
 int default_initialise_vcpu(struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg);
@@ -112,7 +112,7 @@ int default_initialise_vcpu(struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg);
 int arch_get_paging_mempool_size(struct domain *d, uint64_t *size /* bytes */);
 int arch_set_paging_mempool_size(struct domain *d, uint64_t size /* bytes */);
 
-bool update_runstate_area(struct vcpu *);
+bool update_runstate_area(struct vcpu *v);
 
 int domain_relinquish_resources(struct domain *d);
 
@@ -122,7 +122,7 @@ void arch_dump_vcpu_info(struct vcpu *v);
 
 void arch_dump_domain_info(struct domain *d);
 
-int arch_vcpu_reset(struct vcpu *);
+int arch_vcpu_reset(struct vcpu *v);
 
 bool domctl_lock_acquire(void);
 void domctl_lock_release(void);
-- 
2.34.1


