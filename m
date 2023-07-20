Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B1D75B13A
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 16:30:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566639.885730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMUfA-0005Eg-OM; Thu, 20 Jul 2023 14:29:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566639.885730; Thu, 20 Jul 2023 14:29:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMUfA-0005C6-La; Thu, 20 Jul 2023 14:29:52 +0000
Received: by outflank-mailman (input) for mailman id 566639;
 Thu, 20 Jul 2023 14:29:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BeWc=DG=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qMUf8-0005C0-OH
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 14:29:50 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e185c2a1-2709-11ee-8611-37d641c3527e;
 Thu, 20 Jul 2023 16:29:48 +0200 (CEST)
Received: from nico.bugseng.com (unknown [37.162.143.190])
 by support.bugseng.com (Postfix) with ESMTPSA id 576EB4EE0C89;
 Thu, 20 Jul 2023 16:29:46 +0200 (CEST)
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
X-Inumbo-ID: e185c2a1-2709-11ee-8611-37d641c3527e
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [XEN PATCH] xen/arm: optee: provide an initialization for struct arm_smccc_res
Date: Thu, 20 Jul 2023 16:29:02 +0200
Message-Id: <a86604d6c85a0d516b8e29258ffebb2841dc6aff.1689863236.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The local variables with type 'struct arm_smccc_res' are initialized
just after the declaration to avoid any possible read usage prior
to any write usage, which would constitute a violation of
MISRA C:2012 Rule 9.1.

This is already prevented by suitable checks in the code,
but the correctness of this approach is difficult to prove and
reason about.

Therefore, storing a suitable initial value in those registers
(OPTEE_SMC_RETURN_ENOTAVAIL) will prevent futher checks from
assuming the operation performed by the macro 'arm_smccc_smc'
was completed correctly.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
I was in doubt about the safe value to put in 'optee_relinquish_resources'
therefore I zero-initialized it.
---
 xen/arch/arm/tee/optee.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
index 301d205a36..2c2ae88c28 100644
--- a/xen/arch/arm/tee/optee.c
+++ b/xen/arch/arm/tee/optee.c
@@ -171,6 +171,10 @@ static bool optee_probe(void)
 {
     struct dt_device_node *node;
     struct arm_smccc_res resp;
+    resp.a0 = OPTEE_SMC_RETURN_ENOTAVAIL;
+    resp.a1 = OPTEE_SMC_RETURN_ENOTAVAIL;
+    resp.a2 = OPTEE_SMC_RETURN_ENOTAVAIL;
+    resp.a3 = OPTEE_SMC_RETURN_ENOTAVAIL;
 
     /* Check for entry in dtb */
     node = dt_find_compatible_node(NULL, NULL, "linaro,optee-tz");
@@ -229,6 +233,7 @@ static int optee_domain_init(struct domain *d)
 {
     struct arm_smccc_res resp;
     struct optee_domain *ctx;
+    resp.a0 = OPTEE_SMC_RETURN_ENOTAVAIL;
 
     ctx = xzalloc(struct optee_domain);
     if ( !ctx )
@@ -640,7 +645,7 @@ static void free_optee_shm_buf_pg_list(struct optee_domain *ctx,
 
 static int optee_relinquish_resources(struct domain *d)
 {
-    struct arm_smccc_res resp;
+    struct arm_smccc_res resp = {0};
     struct optee_std_call *call, *call_tmp;
     struct shm_rpc *shm_rpc, *shm_rpc_tmp;
     struct optee_shm_buf *optee_shm_buf, *optee_shm_buf_tmp;
@@ -1169,6 +1174,10 @@ static void do_call_with_arg(struct optee_domain *ctx,
                              register_t a3, register_t a4, register_t a5)
 {
     struct arm_smccc_res res;
+    res.a0 = OPTEE_SMC_RETURN_ENOTAVAIL;
+    res.a1 = OPTEE_SMC_RETURN_ENOTAVAIL;
+    res.a2 = OPTEE_SMC_RETURN_ENOTAVAIL;
+    res.a3 = OPTEE_SMC_RETURN_ENOTAVAIL;
 
     arm_smccc_smc(a0, a1, a2, a3, a4, a5, 0, OPTEE_CLIENT_ID(current->domain),
                   &res);
@@ -1608,6 +1617,8 @@ static void handle_exchange_capabilities(struct cpu_user_regs *regs)
 {
     struct arm_smccc_res resp;
     uint32_t caps;
+    resp.a0 = OPTEE_SMC_RETURN_ENOTAVAIL;
+    resp.a1 = OPTEE_SMC_RETURN_ENOTAVAIL;
 
     /* Filter out unknown guest caps */
     caps = get_user_reg(regs, 1);
@@ -1643,6 +1654,10 @@ static bool optee_handle_call(struct cpu_user_regs *regs)
 {
     struct arm_smccc_res resp;
     struct optee_domain *ctx = current->domain->arch.tee;
+    resp.a0 = OPTEE_SMC_RETURN_ENOTAVAIL;
+    resp.a1 = OPTEE_SMC_RETURN_ENOTAVAIL;
+    resp.a2 = OPTEE_SMC_RETURN_ENOTAVAIL;
+    resp.a3 = OPTEE_SMC_RETURN_ENOTAVAIL;
 
     if ( !ctx )
         return false;
-- 
2.34.1


