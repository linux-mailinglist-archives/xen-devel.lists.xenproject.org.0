Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AEC651C9E
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 09:51:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466605.725616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7YLT-00053f-Lc; Tue, 20 Dec 2022 08:51:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466605.725616; Tue, 20 Dec 2022 08:51:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7YLT-0004yp-1j; Tue, 20 Dec 2022 08:51:31 +0000
Received: by outflank-mailman (input) for mailman id 466605;
 Tue, 20 Dec 2022 08:51:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TAHQ=4S=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1p7YLQ-0001kP-ET
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 08:51:28 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 7cf44f55-8043-11ed-8fd4-01056ac49cbb;
 Tue, 20 Dec 2022 09:51:26 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1EF40FEC;
 Tue, 20 Dec 2022 00:52:07 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 13AF73F71A;
 Tue, 20 Dec 2022 00:51:24 -0800 (PST)
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
X-Inumbo-ID: 7cf44f55-8043-11ed-8fd4-01056ac49cbb
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH 11/18] xen: cppcheck: misra rule 20.7 deviation on xmalloc.h
Date: Tue, 20 Dec 2022 08:50:53 +0000
Message-Id: <20221220085100.22848-12-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221220085100.22848-1-luca.fancellu@arm.com>
References: <20221220085100.22848-1-luca.fancellu@arm.com>

Cppcheck has found violations of rule 20.7 for the macros xmalloc,
xzalloc, xmalloc_array, xzalloc_array, xzalloc_flex_struct and
xmalloc_flex_struct.
In all the cases the macro parameters are never used as an expression,
so it is safe to suppress the findings.

Eclair and coverity does not report these findings.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/include/xen/xmalloc.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/include/xen/xmalloc.h b/xen/include/xen/xmalloc.h
index 16979a117c6a..5bf440502c20 100644
--- a/xen/include/xen/xmalloc.h
+++ b/xen/include/xen/xmalloc.h
@@ -10,7 +10,9 @@
  */
 
 /* Allocate space for typed object. */
+/* SAF-1-false-positive-cppcheck R20.7 argument as text substitution */
 #define xmalloc(_type) ((_type *)_xmalloc(sizeof(_type), __alignof__(_type)))
+/* SAF-1-false-positive-cppcheck R20.7 argument as text substitution */
 #define xzalloc(_type) ((_type *)_xzalloc(sizeof(_type), __alignof__(_type)))
 
 /*
@@ -30,15 +32,19 @@
 })
 
 /* Allocate space for array of typed objects. */
+/* SAF-1-false-positive-cppcheck R20.7 argument as text substitution */
 #define xmalloc_array(_type, _num) \
     ((_type *)_xmalloc_array(sizeof(_type), __alignof__(_type), _num))
+/* SAF-1-false-positive-cppcheck R20.7 argument as text substitution */
 #define xzalloc_array(_type, _num) \
     ((_type *)_xzalloc_array(sizeof(_type), __alignof__(_type), _num))
 
 /* Allocate space for a structure with a flexible array of typed objects. */
+/* SAF-1-false-positive-cppcheck R20.7 argument as text substitution */
 #define xzalloc_flex_struct(type, field, nr) \
     ((type *)_xzalloc(offsetof(type, field[nr]), __alignof__(type)))
 
+/* SAF-1-false-positive-cppcheck R20.7 argument as text substitution */
 #define xmalloc_flex_struct(type, field, nr) \
     ((type *)_xmalloc(offsetof(type, field[nr]), __alignof__(type)))
 
-- 
2.17.1


