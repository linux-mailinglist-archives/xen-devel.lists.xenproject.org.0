Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6D473DBD0
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 11:53:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555385.867144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDitu-0001Wk-8y; Mon, 26 Jun 2023 09:52:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555385.867144; Mon, 26 Jun 2023 09:52:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDitu-0001Tq-4T; Mon, 26 Jun 2023 09:52:50 +0000
Received: by outflank-mailman (input) for mailman id 555385;
 Mon, 26 Jun 2023 09:52:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rDFh=CO=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qDits-0000Ov-MW
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 09:52:48 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 344ca788-1407-11ee-8611-37d641c3527e;
 Mon, 26 Jun 2023 11:52:47 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.163.27.55])
 by support.bugseng.com (Postfix) with ESMTPSA id 4170B4EE073F;
 Mon, 26 Jun 2023 11:52:45 +0200 (CEST)
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
X-Inumbo-ID: 344ca788-1407-11ee-8611-37d641c3527e
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [XEN PATCH v3 4/6] xen/arm: vgic: change parameter name in 'init' and 'free' functions.
Date: Mon, 26 Jun 2023 11:52:16 +0200
Message-Id: <0332cf060e181d60e249a004182be011f93602a2.1687771796.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687771796.git.federico.serafini@bugseng.com>
References: <cover.1687771796.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the current versions of vcpu_vgic_init() and vcpu_vgic_free(),
the declarations (correctly) use the parameter name 'v' while the
corresponding definitions use the parameter name 'vcpu'.
Since it is common to use 'v' to denote a vCPU, change the parameter
name 'vcpu' of function definitions to 'v', thus fixing violations of
MISRA C:2012 Rule 8.3.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/arm/vgic/vgic-init.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/vgic/vgic-init.c b/xen/arch/arm/vgic/vgic-init.c
index ea739d081e..76b85ea823 100644
--- a/xen/arch/arm/vgic/vgic-init.c
+++ b/xen/arch/arm/vgic/vgic-init.c
@@ -196,16 +196,16 @@ int domain_vgic_init(struct domain *d, unsigned int nr_spis)
  * vcpu_vgic_init() - Register VCPU-specific KVM iodevs
  * was: kvm_vgic_vcpu_init()
  * Xen: adding vgic_vx_enable() call
- * @vcpu: pointer to the VCPU being created and initialized
+ * @v: pointer to the VCPU being created and initialized
  */
-int vcpu_vgic_init(struct vcpu *vcpu)
+int vcpu_vgic_init(struct vcpu *v)
 {
     int ret = 0;
 
-    vgic_vcpu_early_init(vcpu);
+    vgic_vcpu_early_init(v);
 
     if ( gic_hw_version() == GIC_V2 )
-        vgic_v2_enable(vcpu);
+        vgic_v2_enable(v);
     else
         ret = -ENXIO;
 
@@ -239,9 +239,9 @@ void domain_vgic_free(struct domain *d)
     dist->nr_spis = 0;
 }
 
-int vcpu_vgic_free(struct vcpu *vcpu)
+int vcpu_vgic_free(struct vcpu *v)
 {
-    struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic;
+    struct vgic_cpu *vgic_cpu = &v->arch.vgic;
 
     INIT_LIST_HEAD(&vgic_cpu->ap_list_head);
 
-- 
2.34.1


