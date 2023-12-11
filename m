Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AE580C690
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 11:31:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651598.1017351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCdYf-00064c-Ka; Mon, 11 Dec 2023 10:30:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651598.1017351; Mon, 11 Dec 2023 10:30:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCdYf-0005x1-EM; Mon, 11 Dec 2023 10:30:41 +0000
Received: by outflank-mailman (input) for mailman id 651598;
 Mon, 11 Dec 2023 10:30:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BtsV=HW=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rCdYd-0005Em-T4
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 10:30:39 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5238be18-9810-11ee-9b0f-b553b5be7939;
 Mon, 11 Dec 2023 11:30:36 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 801C84EE0743;
 Mon, 11 Dec 2023 11:30:35 +0100 (CET)
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
X-Inumbo-ID: 5238be18-9810-11ee-9b0f-b553b5be7939
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH 3/7] xen/arm: address MISRA C:2012 Rule 2.1
Date: Mon, 11 Dec 2023 11:30:24 +0100
Message-Id: <4c0d38f2b707afa9aed1853a99d286fa2424fb9d.1702283415.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702283415.git.nicola.vetrini@bugseng.com>
References: <cover.1702283415.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "return 1;" statements at the end of some cases in the switch
of function 'vgic_v3_its_mmio_write' in 'vcig-v3-its.c' cause the
unreachability of the "return 1;" statement after the switch, thus
violating MISRA C:2012 Rule 2.1:
"A project shall not contain unreachable code".

The same is true for the switch in 'arch_memory_op' from
'xen/arch/arm/mm.c'.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/arm/mm.c          |  2 +-
 xen/arch/arm/vgic-v3-its.c | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index eeb65ca6bb79..9be8e711f61e 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -277,7 +277,7 @@ long arch_memory_op(int op, XEN_GUEST_HANDLE_PARAM(void) arg)
     /* XXX: memsharing not working yet */
     case XENMEM_get_sharing_shared_pages:
     case XENMEM_get_sharing_freed_pages:
-        return 0;
+        break;
 
     default:
         return -ENOSYS;
diff --git a/xen/arch/arm/vgic-v3-its.c b/xen/arch/arm/vgic-v3-its.c
index 05429030b539..b9195bbd0538 100644
--- a/xen/arch/arm/vgic-v3-its.c
+++ b/xen/arch/arm/vgic-v3-its.c
@@ -1255,7 +1255,7 @@ static int vgic_v3_its_mmio_write(struct vcpu *v, mmio_info_t *info,
                                                      reg32 & GITS_CTLR_ENABLE);
         spin_unlock(&its->its_lock);
         spin_unlock(&its->vcmd_lock);
-        return 1;
+        break;
     }
 
     case VREG32(GITS_IIDR):
@@ -1292,7 +1292,7 @@ static int vgic_v3_its_mmio_write(struct vcpu *v, mmio_info_t *info,
         its->creadr = 0;
         spin_unlock(&its->its_lock);
 
-        return 1;
+        break;
 
     case VREG64(GITS_CWRITER):
         if ( !vgic_reg64_check_access(info->dabt) ) goto bad_width;
@@ -1308,7 +1308,7 @@ static int vgic_v3_its_mmio_write(struct vcpu *v, mmio_info_t *info,
 
         spin_unlock(&its->vcmd_lock);
 
-        return 1;
+        break;
 
     case VREG64(GITS_CREADR):
         goto write_ignore_64;
@@ -1353,7 +1353,7 @@ static int vgic_v3_its_mmio_write(struct vcpu *v, mmio_info_t *info,
 
         its->baser_dev = reg;
         spin_unlock(&its->its_lock);
-        return 1;
+        break;
 
     case VREG64(GITS_BASER1):           /* collection table */
         if ( !vgic_reg64_check_access(info->dabt) ) goto bad_width;
@@ -1384,7 +1384,7 @@ static int vgic_v3_its_mmio_write(struct vcpu *v, mmio_info_t *info,
             its->max_collections = 0;
         its->baser_coll = reg;
         spin_unlock(&its->its_lock);
-        return 1;
+        break;
 
     case VRANGE64(GITS_BASER2, GITS_BASER7):
         goto write_ignore_64;
-- 
2.34.1


