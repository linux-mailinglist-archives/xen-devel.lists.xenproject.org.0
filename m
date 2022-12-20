Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F9D651CAB
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 09:55:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466669.725683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7YOz-0002nz-RT; Tue, 20 Dec 2022 08:55:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466669.725683; Tue, 20 Dec 2022 08:55:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7YOz-0002lO-Nj; Tue, 20 Dec 2022 08:55:09 +0000
Received: by outflank-mailman (input) for mailman id 466669;
 Tue, 20 Dec 2022 08:55:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TAHQ=4S=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1p7YLa-0001kV-8j
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 08:51:38 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 80b00519-8043-11ed-91b6-6bf2151ebd3b;
 Tue, 20 Dec 2022 09:51:33 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EBDE31688;
 Tue, 20 Dec 2022 00:52:13 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E10413F71A;
 Tue, 20 Dec 2022 00:51:31 -0800 (PST)
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
X-Inumbo-ID: 80b00519-8043-11ed-91b6-6bf2151ebd3b
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH 17/18] public: misra rule 20.7 deviation on errno.h
Date: Tue, 20 Dec 2022 08:50:59 +0000
Message-Id: <20221220085100.22848-18-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221220085100.22848-1-luca.fancellu@arm.com>
References: <20221220085100.22848-1-luca.fancellu@arm.com>

Cppcheck has found a violation of rule 20.7 for the macro XEN_ERRNO,
while the macro parameter is never used as an expression, it doesn't
harm the code or the readability to add parenthesis, so add them.

This finding is reported also by eclair and coverity.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/include/public/errno.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/public/errno.h b/xen/include/public/errno.h
index 6bdc8c507990..5a78a7607c0d 100644
--- a/xen/include/public/errno.h
+++ b/xen/include/public/errno.h
@@ -31,7 +31,7 @@
 
 #ifndef __ASSEMBLY__
 
-#define XEN_ERRNO(name, value) XEN_##name = value,
+#define XEN_ERRNO(name, value) XEN_##name = (value),
 enum xen_errno {
 
 #elif __XEN_INTERFACE_VERSION__ < 0x00040700
-- 
2.17.1


