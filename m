Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25339652F05
	for <lists+xen-devel@lfdr.de>; Wed, 21 Dec 2022 10:58:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467689.726739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7vrK-0006oy-R3; Wed, 21 Dec 2022 09:57:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467689.726739; Wed, 21 Dec 2022 09:57:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7vrK-0006lp-Mx; Wed, 21 Dec 2022 09:57:58 +0000
Received: by outflank-mailman (input) for mailman id 467689;
 Wed, 21 Dec 2022 09:57:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VCPi=4T=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1p7vrJ-0006Ds-6c
 for xen-devel@lists.xenproject.org; Wed, 21 Dec 2022 09:57:57 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id f164a077-8115-11ed-91b6-6bf2151ebd3b;
 Wed, 21 Dec 2022 10:57:56 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CAFBCAD7;
 Wed, 21 Dec 2022 01:58:36 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B3BD13F71E;
 Wed, 21 Dec 2022 01:57:54 -0800 (PST)
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
X-Inumbo-ID: f164a077-8115-11ed-91b6-6bf2151ebd3b
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 2/2] public: misra rule 20.7 fix on memory.h
Date: Wed, 21 Dec 2022 09:57:42 +0000
Message-Id: <20221221095742.54859-3-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221221095742.54859-1-luca.fancellu@arm.com>
References: <20221221095742.54859-1-luca.fancellu@arm.com>

Cppcheck has found a violation of rule 20.7 for the macro
XENMEM_SHARING_OP_FIELD_MAKE_GREF, the argument "val" is used in an
expression, hence add parenthesis to the argument "val" to fix the
violation.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/include/public/memory.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
index 29cf5c823902..c5f0d31e235d 100644
--- a/xen/include/public/memory.h
+++ b/xen/include/public/memory.h
@@ -485,7 +485,7 @@ DEFINE_XEN_GUEST_HANDLE(xen_mem_access_op_t);
 #define XENMEM_SHARING_OP_FIELD_IS_GREF_FLAG   (xen_mk_ullong(1) << 62)
 
 #define XENMEM_SHARING_OP_FIELD_MAKE_GREF(field, val)  \
-    (field) = (XENMEM_SHARING_OP_FIELD_IS_GREF_FLAG | val)
+    (field) = (XENMEM_SHARING_OP_FIELD_IS_GREF_FLAG | (val))
 #define XENMEM_SHARING_OP_FIELD_IS_GREF(field)         \
     ((field) & XENMEM_SHARING_OP_FIELD_IS_GREF_FLAG)
 #define XENMEM_SHARING_OP_FIELD_GET_GREF(field)        \
-- 
2.17.1


