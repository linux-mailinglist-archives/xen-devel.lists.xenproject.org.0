Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2FC7F78F9
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 17:30:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640824.999559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Z4F-0001ae-T4; Fri, 24 Nov 2023 16:30:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640824.999559; Fri, 24 Nov 2023 16:30:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Z4F-0001Xc-MH; Fri, 24 Nov 2023 16:30:11 +0000
Received: by outflank-mailman (input) for mailman id 640824;
 Fri, 24 Nov 2023 16:30:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SB6C=HF=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1r6Z4E-0000du-3C
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 16:30:10 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id baffe575-8ae6-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 17:30:08 +0100 (CET)
Received: from beta.station (net-37-182-35-120.cust.vodafonedsl.it
 [37.182.35.120])
 by support.bugseng.com (Postfix) with ESMTPSA id 810044EE0747;
 Fri, 24 Nov 2023 17:30:07 +0100 (CET)
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
X-Inumbo-ID: baffe575-8ae6-11ee-9b0e-b553b5be7939
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	maria.celeste.cesario@bugseng.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [PATCH 3/5] AMD/IOMMU: address violations of MISRA C:2012 Rule 11.8
Date: Fri, 24 Nov 2023 17:29:17 +0100
Message-Id: <11fc193f35be188165294665b1e989b2db17a776.1700842832.git.maria.celeste.cesario@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700842832.git.maria.celeste.cesario@bugseng.com>
References: <cover.1700842832.git.maria.celeste.cesario@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>

Add missing const qualifier in casting to comply with Rule 11.8.
The type of the formal parameter ivhd_block is const qualified.
No functional change.

Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
---
 xen/drivers/passthrough/amd/iommu_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/amd/iommu_acpi.c b/xen/drivers/passthrough/amd/iommu_acpi.c
index 699d33f429..00923a6bb5 100644
--- a/xen/drivers/passthrough/amd/iommu_acpi.c
+++ b/xen/drivers/passthrough/amd/iommu_acpi.c
@@ -1232,7 +1232,7 @@ static int __init get_last_bdf_ivhd(
     while ( ivhd_block->header.length >=
             (block_length + sizeof(struct acpi_ivrs_de_header)) )
     {
-        ivhd_device = (const void *)((u8 *)ivhd_block + block_length);
+        ivhd_device = (const void *)((const uint8_t *)ivhd_block + block_length);
 
         switch ( ivhd_device->header.type )
         {
-- 
2.40.0


