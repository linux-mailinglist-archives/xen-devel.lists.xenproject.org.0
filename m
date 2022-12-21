Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC790652F03
	for <lists+xen-devel@lfdr.de>; Wed, 21 Dec 2022 10:58:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467688.726727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7vrJ-0006Xx-Iw; Wed, 21 Dec 2022 09:57:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467688.726727; Wed, 21 Dec 2022 09:57:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7vrJ-0006VL-Fv; Wed, 21 Dec 2022 09:57:57 +0000
Received: by outflank-mailman (input) for mailman id 467688;
 Wed, 21 Dec 2022 09:57:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VCPi=4T=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1p7vrI-0006G0-Id
 for xen-devel@lists.xenproject.org; Wed, 21 Dec 2022 09:57:56 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id eacd276f-8115-11ed-8fd4-01056ac49cbb;
 Wed, 21 Dec 2022 10:57:45 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7CA192F4;
 Wed, 21 Dec 2022 01:58:35 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 65AF03F71E;
 Wed, 21 Dec 2022 01:57:53 -0800 (PST)
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
X-Inumbo-ID: eacd276f-8115-11ed-8fd4-01056ac49cbb
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 1/2] public: misra rule 20.7 fix on errno.h
Date: Wed, 21 Dec 2022 09:57:41 +0000
Message-Id: <20221221095742.54859-2-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221221095742.54859-1-luca.fancellu@arm.com>
References: <20221221095742.54859-1-luca.fancellu@arm.com>

Cppcheck has found a violation of rule 20.7 for the macro XEN_ERRNO,
while the macro parameter is never used as an expression, it doesn't
harm the code or the readability to add parenthesis, so add them.

This finding is reported also by eclair and coverity.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
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


