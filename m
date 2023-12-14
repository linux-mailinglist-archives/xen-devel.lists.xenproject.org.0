Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 279DD812F0E
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 12:44:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654489.1021421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDk8Z-0001aP-0C; Thu, 14 Dec 2023 11:44:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654489.1021421; Thu, 14 Dec 2023 11:44:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDk8Y-0001QR-Q5; Thu, 14 Dec 2023 11:44:18 +0000
Received: by outflank-mailman (input) for mailman id 654489;
 Thu, 14 Dec 2023 11:44:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=57RS=HZ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rDk8W-0000uU-PA
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 11:44:16 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b5aaf31-9a76-11ee-98e9-6d05b1d4d9a1;
 Thu, 14 Dec 2023 12:44:15 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id B8D0A4EE0742;
 Thu, 14 Dec 2023 12:44:14 +0100 (CET)
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
X-Inumbo-ID: 1b5aaf31-9a76-11ee-98e9-6d05b1d4d9a1
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [XEN PATCH 3/5] xen/acpi: Use NULL as a null pointer constant
Date: Thu, 14 Dec 2023 12:44:08 +0100
Message-Id: <bb10a86a08eb36e9f9c6bda899cdc850afada403.1702553835.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702553835.git.nicola.vetrini@bugseng.com>
References: <cover.1702553835.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resolves a violation of MISRA C Rule 11.9.
No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/include/acpi/acmacros.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/acpi/acmacros.h b/xen/include/acpi/acmacros.h
index 86c503c20f3b..e7ca18e3dc66 100644
--- a/xen/include/acpi/acmacros.h
+++ b/xen/include/acpi/acmacros.h
@@ -111,7 +111,7 @@
 
 #define ACPI_TO_POINTER(i)              ACPI_ADD_PTR (void,(void *) NULL,(acpi_native_uint) i)
 #define ACPI_TO_INTEGER(p)              ACPI_PTR_DIFF (p,(void *) NULL)
-#define ACPI_OFFSET(d,f)                (acpi_size) ACPI_PTR_DIFF (&(((d *)0)->f),(void *) NULL)
+#define ACPI_OFFSET(d,f)                (acpi_size) ACPI_PTR_DIFF (&(((d *)NULL)->f),(void *) NULL)
 #define ACPI_PHYSADDR_TO_PTR(i)         ACPI_TO_POINTER(i)
 #define ACPI_PTR_TO_PHYSADDR(i)         ACPI_TO_INTEGER(i)
 
-- 
2.34.1

