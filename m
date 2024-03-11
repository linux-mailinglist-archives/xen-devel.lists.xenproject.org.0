Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F65877C1F
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 10:00:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691268.1077103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjbW7-0008Hw-JI; Mon, 11 Mar 2024 09:00:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691268.1077103; Mon, 11 Mar 2024 09:00:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjbW7-0008Ad-8R; Mon, 11 Mar 2024 09:00:19 +0000
Received: by outflank-mailman (input) for mailman id 691268;
 Mon, 11 Mar 2024 09:00:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xWeI=KR=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rjbW4-0006j9-Q4
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 09:00:16 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6a8ece6-df85-11ee-a1ee-f123f15fe8a2;
 Mon, 11 Mar 2024 10:00:15 +0100 (CET)
Received: from beta.station (net-93-144-106-196.cust.vodafonedsl.it
 [93.144.106.196])
 by support.bugseng.com (Postfix) with ESMTPSA id BECF04EE0CA0;
 Mon, 11 Mar 2024 10:00:14 +0100 (CET)
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
X-Inumbo-ID: c6a8ece6-df85-11ee-a1ee-f123f15fe8a2
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	sstabellini@kernel.org,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
Subject: [XEN PATCH v3 08/16] xen/efi: address violations of MISRA C:2012 Directive 4.10
Date: Mon, 11 Mar 2024 09:59:17 +0100
Message-Id: <f1d014e5013c65ed66dcaf91bd0f962c078451d9.1710145041.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710145041.git.simone.ballarin@bugseng.com>
References: <cover.1710145041.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add inclusion guards to address violations of
MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
to prevent the contents of a header file being included more than
once").

Mechanical change.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>

---
Changes in v3:
- remove trailing underscores
- change inclusion guard name to adhere to the new standard
Changes in v2:
- drop changes in C files
---
 xen/common/efi/efi.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/common/efi/efi.h b/xen/common/efi/efi.h
index c02fbb7b69..ab604ebd59 100644
--- a/xen/common/efi/efi.h
+++ b/xen/common/efi/efi.h
@@ -1,3 +1,6 @@
+#ifndef XEN_COMMON_EFI_EFI_H
+#define XEN_COMMON_EFI_EFI_H
+
 #include <asm/efibind.h>
 #include <efi/efidef.h>
 #include <efi/efierr.h>
@@ -51,3 +54,5 @@ void free_ebmalloc_unused_mem(void);
 
 const void *pe_find_section(const void *image, const UINTN image_size,
                             const CHAR16 *section_name, UINTN *size_out);
+
+#endif /* XEN_COMMON_EFI_EFI_H */
-- 
2.34.1


