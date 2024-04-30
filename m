Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D21028B729C
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 13:10:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714730.1116039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1lMf-0003bd-VS; Tue, 30 Apr 2024 11:09:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714730.1116039; Tue, 30 Apr 2024 11:09:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1lMf-0003a3-SW; Tue, 30 Apr 2024 11:09:37 +0000
Received: by outflank-mailman (input) for mailman id 714730;
 Tue, 30 Apr 2024 11:09:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=efY1=MD=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1s1lMe-0003Lb-3O
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 11:09:36 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 1fccf056-06e2-11ef-b4bb-af5377834399;
 Tue, 30 Apr 2024 13:09:34 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA0A0339;
 Tue, 30 Apr 2024 04:09:59 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 434D03F73F;
 Tue, 30 Apr 2024 04:09:32 -0700 (PDT)
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
X-Inumbo-ID: 1fccf056-06e2-11ef-b4bb-af5377834399
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	nicola.vetrini@bugseng.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/2] xen/kernel.h: Import __struct_group from Linux
Date: Tue, 30 Apr 2024 12:09:21 +0100
Message-Id: <20240430110922.15052-2-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240430110922.15052-1-luca.fancellu@arm.com>
References: <20240430110922.15052-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Import __struct_group from Linux, commit 50d7bd38c3aa
("stddef: Introduce struct_group() helper macro"), in order to
allow the access through the anonymous structure to the members
without having to write also the name, e.g:

struct foo {
    int one;
    struct {
        int two;
        int three, four;
    } thing;
    int five;
};

would become:

struct foo {
    int one;
    __struct_group(/* None */, thing, /* None */,
        int two;
        int three, four;
    );
    int five;
};

Allowing the users of this structure to access the .thing members by
using .two/.three/.four on the struct foo.
This construct will become useful in order to have some generalized
interfaces that shares some common members.

Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 50d7bd38c3aa
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/include/xen/kernel.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/xen/include/xen/kernel.h b/xen/include/xen/kernel.h
index bb6b0f38912d..bc2440b5f96e 100644
--- a/xen/include/xen/kernel.h
+++ b/xen/include/xen/kernel.h
@@ -54,6 +54,27 @@
         typeof_field(type, member) *__mptr = (ptr);             \
         (type *)( (char *)__mptr - offsetof(type,member) );})
 
+/**
+ * __struct_group() - Create a mirrored named and anonyomous struct
+ *
+ * @TAG: The tag name for the named sub-struct (usually empty)
+ * @NAME: The identifier name of the mirrored sub-struct
+ * @ATTRS: Any struct attributes (usually empty)
+ * @MEMBERS: The member declarations for the mirrored structs
+ *
+ * Used to create an anonymous union of two structs with identical layout
+ * and size: one anonymous and one named. The former's members can be used
+ * normally without sub-struct naming, and the latter can be used to
+ * reason about the start, end, and size of the group of struct members.
+ * The named struct can also be explicitly tagged for layer reuse, as well
+ * as both having struct attributes appended.
+ */
+#define __struct_group(TAG, NAME, ATTRS, MEMBERS...) \
+    union { \
+        struct { MEMBERS } ATTRS; \
+        struct TAG { MEMBERS } ATTRS NAME; \
+    } ATTRS
+
 /*
  * Check at compile time that something is of a particular type.
  * Always evaluates to 1 so you may use it easily in comparisons.
-- 
2.34.1


