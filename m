Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BAE79CC0A
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 11:39:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600161.935794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfzrX-00039k-AE; Tue, 12 Sep 2023 09:39:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600161.935794; Tue, 12 Sep 2023 09:39:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfzrX-00037w-6s; Tue, 12 Sep 2023 09:39:15 +0000
Received: by outflank-mailman (input) for mailman id 600161;
 Tue, 12 Sep 2023 09:39:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V3Pz=E4=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qfzrW-0000lh-56
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 09:39:14 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3413f20a-5150-11ee-8786-cb3800f73035;
 Tue, 12 Sep 2023 11:39:01 +0200 (CEST)
Received: from beta.station (net-93-66-137-131.cust.vodafonedsl.it
 [93.66.137.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 786624EE0743;
 Tue, 12 Sep 2023 11:39:00 +0200 (CEST)
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
X-Inumbo-ID: 3413f20a-5150-11ee-8786-cb3800f73035
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	sstabellini@kernel.org,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [XEN PATCH v2 08/10] xen/efi: address violations of MISRA C:2012 Directive 4.10
Date: Tue, 12 Sep 2023 11:36:54 +0200
Message-Id: <5585708f62883ada3e7900c45a2c97dbcf927294.1694510856.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694510856.git.simone.ballarin@bugseng.com>
References: <cover.1694510856.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add inclusion guards to address violations of
MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
to prevent the contents of a header file being included more than
once").

Mechanical change.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

---
Changes in v2:
- drop changes in C files
---
 xen/common/efi/efi.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/common/efi/efi.h b/xen/common/efi/efi.h
index c02fbb7b69..cef9381d30 100644
--- a/xen/common/efi/efi.h
+++ b/xen/common/efi/efi.h
@@ -1,3 +1,6 @@
+#ifndef __COMMON_EFI_EFI_H__
+#define __COMMON_EFI_EFI_H__
+
 #include <asm/efibind.h>
 #include <efi/efidef.h>
 #include <efi/efierr.h>
@@ -51,3 +54,5 @@ void free_ebmalloc_unused_mem(void);
 
 const void *pe_find_section(const void *image, const UINTN image_size,
                             const CHAR16 *section_name, UINTN *size_out);
+
+#endif /* __COMMON_EFI_EFI_H__ */
-- 
2.34.1


