Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4AC7759BF
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 13:03:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580896.909371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTgxu-0007MK-0r; Wed, 09 Aug 2023 11:02:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580896.909371; Wed, 09 Aug 2023 11:02:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTgxt-0007KH-Ts; Wed, 09 Aug 2023 11:02:57 +0000
Received: by outflank-mailman (input) for mailman id 580896;
 Wed, 09 Aug 2023 11:02:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hYF7=D2=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qTgxs-0007Jy-FY
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 11:02:56 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ad2802d-36a4-11ee-b280-6b7b168915f2;
 Wed, 09 Aug 2023 13:02:55 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id A0A094EE0741;
 Wed,  9 Aug 2023 13:02:54 +0200 (CEST)
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
X-Inumbo-ID: 4ad2802d-36a4-11ee-b280-6b7b168915f2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH 1/8] arm/efi: address MISRA C:2012 Rule 8.4
Date: Wed,  9 Aug 2023 13:02:34 +0200
Message-Id: <4d087a54edb3f92e9271e3d01c1abebf00d3e298.1691575243.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691575243.git.nicola.vetrini@bugseng.com>
References: <cover.1691575243.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

the function 'fdt_add_uefi_nodes' can be defined static, as its
only callers are within the same file. This in turn avoids
violating Rule 8.4 because no declaration is present.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/arm/efi/efi-boot.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index f24df2abb9..1c3640bb65 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -227,7 +227,7 @@ static EFI_STATUS __init efi_process_memory_map_bootinfo(EFI_MEMORY_DESCRIPTOR *
  * of the System table address, the address of the final EFI memory map,
  * and memory map information.
  */
-EFI_STATUS __init fdt_add_uefi_nodes(EFI_SYSTEM_TABLE *sys_table,
+static EFI_STATUS __init fdt_add_uefi_nodes(EFI_SYSTEM_TABLE *sys_table,
                                             void *fdt,
                                             EFI_MEMORY_DESCRIPTOR *memory_map,
                                             UINTN map_size,
-- 
2.34.1


