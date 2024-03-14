Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1849787B8A8
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 08:43:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692955.1080712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkfjv-0002xo-KK; Thu, 14 Mar 2024 07:42:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692955.1080712; Thu, 14 Mar 2024 07:42:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkfjv-0002wI-Hm; Thu, 14 Mar 2024 07:42:59 +0000
Received: by outflank-mailman (input) for mailman id 692955;
 Thu, 14 Mar 2024 07:42:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pU9H=KU=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rkfju-0002wC-1B
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 07:42:58 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79553d23-e1d6-11ee-afdd-a90da7624cb6;
 Thu, 14 Mar 2024 08:42:57 +0100 (CET)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 5FC174EE0739;
 Thu, 14 Mar 2024 08:42:55 +0100 (CET)
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
X-Inumbo-ID: 79553d23-e1d6-11ee-afdd-a90da7624cb6
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	bertrand.marquis@arm.com,
	julien@xen.org,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [XEN PATCH] amd/iommu: add fixed size to function parameter of array type
Date: Thu, 14 Mar 2024 08:42:52 +0100
Message-Id: <533a2d4f0c92d7fe92aa200b64434389de546f69.1710343652.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'cmd' parameter of amd_iommu_send_guest_cmd is passed
to a function that expects arrays of size 4, therefore
specifying explicitly the size also in amd_iommu_send_guest_cmd
allows not to accidentally pass a smaller array or assume that
send_iommu_command handles array sizes >4 correctly.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
All current users pass an array of size 4, hence this patch is addressing
a potential issue noticed by the analyzer in the context of Rule 17.5
("The function argument corresponding to a parameter declared to have an array
type shall have an appropriate number of elements"), not an actual problem in
the sources.
---
 xen/drivers/passthrough/amd/iommu.h     | 2 +-
 xen/drivers/passthrough/amd/iommu_cmd.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/passthrough/amd/iommu.h b/xen/drivers/passthrough/amd/iommu.h
index 1b62c083ba67..be82bd950e30 100644
--- a/xen/drivers/passthrough/amd/iommu.h
+++ b/xen/drivers/passthrough/amd/iommu.h
@@ -346,7 +346,7 @@ void cf_check amd_iommu_crash_shutdown(void);
 
 /* guest iommu support */
 #ifdef CONFIG_HVM
-void amd_iommu_send_guest_cmd(struct amd_iommu *iommu, u32 cmd[]);
+void amd_iommu_send_guest_cmd(struct amd_iommu *iommu, u32 cmd[4]);
 void guest_iommu_add_ppr_log(struct domain *d, u32 entry[]);
 void guest_iommu_add_event_log(struct domain *d, u32 entry[]);
 int guest_iommu_init(struct domain* d);
diff --git a/xen/drivers/passthrough/amd/iommu_cmd.c b/xen/drivers/passthrough/amd/iommu_cmd.c
index 49b9fcac9410..321a814eb810 100644
--- a/xen/drivers/passthrough/amd/iommu_cmd.c
+++ b/xen/drivers/passthrough/amd/iommu_cmd.c
@@ -390,7 +390,7 @@ void amd_iommu_flush_all_caches(struct amd_iommu *iommu)
     flush_command_buffer(iommu, 0);
 }
 
-void amd_iommu_send_guest_cmd(struct amd_iommu *iommu, u32 cmd[])
+void amd_iommu_send_guest_cmd(struct amd_iommu *iommu, u32 cmd[4])
 {
     send_iommu_command(iommu, cmd);
     /* TBD: Timeout selection may require peeking into cmd[]. */
-- 
2.34.1

