Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 012C8287BF3
	for <lists+xen-devel@lfdr.de>; Thu,  8 Oct 2020 20:58:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4557.11922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQb6m-0005Ru-Me; Thu, 08 Oct 2020 18:57:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4557.11922; Thu, 08 Oct 2020 18:57:44 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQb6m-0005RT-J7; Thu, 08 Oct 2020 18:57:44 +0000
Received: by outflank-mailman (input) for mailman id 4557;
 Thu, 08 Oct 2020 18:57:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3RzB=DP=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kQb6l-0005RO-VE
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 18:57:44 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a700aef9-855c-45d9-8cc0-d4c741c137d9;
 Thu, 08 Oct 2020 18:57:42 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kQb6i-000419-5v; Thu, 08 Oct 2020 18:57:40 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com
 ([109.146.187.185] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kQb6h-0002P9-TL; Thu, 08 Oct 2020 18:57:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=3RzB=DP=xen.org=paul@srs-us1.protection.inumbo.net>)
	id 1kQb6l-0005RO-VE
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 18:57:44 +0000
X-Inumbo-ID: a700aef9-855c-45d9-8cc0-d4c741c137d9
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id a700aef9-855c-45d9-8cc0-d4c741c137d9;
	Thu, 08 Oct 2020 18:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=UWh3z72cedco8BYeLrNyT1WM5VqVHSPK2ry97ilWHbM=; b=GjA3D5gCTCKzxAjMsiSTBtmec7
	4sW0wpdtMyI6pbtzYn6+nMRW9K21NGSRQIhc52CajAn9qcI7fE4KGu3ApClPqcczOOgVbebO695aW
	M6nf9Q3/OZa2iZPZMnJ/aP3PR+vSrmZZSIKtlmia6uRcfWCE/UwfrenEnaPV7LNtKSME=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kQb6i-000419-5v; Thu, 08 Oct 2020 18:57:40 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com ([109.146.187.185] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kQb6h-0002P9-TL; Thu, 08 Oct 2020 18:57:40 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v10 01/11] docs / include: introduce a new framework for 'domain context' records
Date: Thu,  8 Oct 2020 19:57:25 +0100
Message-Id: <20201008185735.29875-2-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201008185735.29875-1-paul@xen.org>
References: <20201008185735.29875-1-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

To allow enlightened HVM guests (i.e. those that have PV drivers) to be
migrated without their co-operation it will be necessary to transfer 'PV'
state such as event channel state, grant entry state, etc.

Currently there is a framework (entered via the hvm_save/load() functions)
that allows a domain's 'HVM' (architectural) state to be transferred but
'PV' state is also common with pure PV guests and so this framework is not
really suitable.

This patch adds the specification of a new common 'domain context' image and
the supporting public header. Subsequent patches will introduce other parts of
the framework, and code that will make use of it.

This patch also marks the HVM-only framework as deprecated in favour of the
new framework.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wl@xen.org>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>

v10:
 - New in v10
---
 docs/specs/domain-context.md           | 137 +++++++++++++++++++++++++
 xen/include/public/arch-arm/hvm/save.h |   5 +
 xen/include/public/arch-x86/hvm/save.h |   5 +
 xen/include/public/save.h              |  66 ++++++++++++
 4 files changed, 213 insertions(+)
 create mode 100644 docs/specs/domain-context.md
 create mode 100644 xen/include/public/save.h

diff --git a/docs/specs/domain-context.md b/docs/specs/domain-context.md
new file mode 100644
index 0000000000..f177cf24b3
--- /dev/null
+++ b/docs/specs/domain-context.md
@@ -0,0 +1,137 @@
+# Domain Context (v1)
+
+## Background
+
+The design for *Non-Cooperative Migration of Guests*[1] explains that extra
+information is required in the migration stream to allow a guest running PV
+drivers to be migrated without its co-operation. This information includes
+hypervisor state such as the set of event channels in operation and the
+content of the grant table.
+
+There already exists in Xen a mechanism to save and restore *HVM context*[2].
+This specification describes a new framework that will replace that
+mechanism and be suitable for transferring additional *PV state* records
+conveying the information mentioned above. There is also on-going work to
+implement *live update* of Xen where hypervisor state must be transferred in
+memory from one incarnation to the next. The framework described is designed
+to also be suitable for this purpose.
+
+## Image format
+
+The format will read from or written to the hypervisor in a single virtually
+contiguous buffer segmented into **context records** specified in the following
+sections.
+
+Fields within the records will always be aligned to their size. Padding and
+reserved fields will always be set to zero when the context buffer is read
+from the hypervisor and will be verified when written.
+The endianness of numerical values will the native endianness of the
+hypervisor. In the case of migration, that endianness is specified in the
+*libxenctrl (libxc) Domain Image Format*[3].
+
+### Record format
+
+All records have the following format:
+
+```
+    0       1       2       3       4       5       6       7    octet
++-------+-------+-------+-------+-------+-------+-------+-------+
+| type                          | instance                      |
++-------------------------------+-------------------------------+
+| length                                                        |
++---------------------------------------------------------------+
+| body
+...
+|       | padding (0 to 7 octets)                               |
++-------+-------------------------------------------------------+
+```
+
+\pagebreak
+The fields are defined as follows:
+
+
+| Field      | Description                                      |
+|------------|--------------------------------------------------|
+| `type`     | A code which determines the layout and semantics |
+|            | of `body`                                        |
+|            |                                                  |
+| `instance` | The instance of the record                       |
+|            |                                                  |
+| `length`   | The length (in octets) of `body`                 |
+|            |                                                  |
+| `body`     | Zero or more octets of record data               |
+|            |                                                  |
+| `padding`  | Zero to seven octets of zero-filled padding to   |
+|            | bring the total record length up to the next     |
+|            | 64-bit boundary                                  |
+
+The `instance` field is present to distinguish multiple occurences of
+a record. E.g. state that is per-vcpu may need to be described in multiple
+records.
+
+The first record in the image is always a **START** record. The version of
+the image format can be inferred from the `type` of this record.
+
+## Image content
+
+The following records are defined for the v1 image format. This set may be
+extended in newer versions of the hypervisor. It is not expected that an image
+saved on a newer version of Xen will need to be restored on an older version.
+Therefore an image containing unrecognized record types should be rejected.
+
+### START
+
+```
+    0       1       2       3       4       5       6       7    octet
++-------+-------+-------+-------+-------+-------+-------+-------+
+| type == 1                     | instance == 0                 |
++-------------------------------+-------------------------------+
+| length == 8                                                   |
++-------------------------------+-------------------------------+
+| xen_major                     | xen_minor                     |
++-------------------------------+-------------------------------+
+```
+
+A type 1 **START** record implies a v1 image. If a new image format version
+is needed in future then this can be indicated by a new type value for this
+(first) record in the image.
+
+\pagebreak
+The record body contains the following fields:
+
+| Field       | Description                                     |
+|-------------|-------------------------------------------------|
+| `xen_major` | The major version of Xen that created this      |
+|             | image                                           |
+|             |                                                 |
+| `xen_minor` | The minor version of Xen that created this      |
+|             | image                                           |
+
+The version of Xen that created the image can be useful to the version that
+is restoring the image to determine whether certain records are expected to
+be present in the image. For example, a version of Xen prior to X.Y may not
+generate a FOO record but Xen X.Y+ can infer its content. But Xen X.Y+1
+**must** generate the FOO record as, from that version onward, its content
+can no longer be safely inferred.
+
+### END
+
+```
+    0       1       2       3       4       5       6       7    octet
++-------+-------+-------+-------+-------+-------+-------+-------+
+| type == 0                     | instance == 0                 |
++-------------------------------+-------------------------------+
+| length == 0                                                   |
++---------------------------------------------------------------+
+```
+
+A record of this type terminates the image. No further data from the buffer
+should be consumed.
+
+* * *
+
+[1] See https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=docs/designs/non-cooperative-migration.md
+
+[2] See https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/include/public/hvm/save.h
+
+[3] See https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=docs/specs/libxc-migration-stream.pandoc
diff --git a/xen/include/public/arch-arm/hvm/save.h b/xen/include/public/arch-arm/hvm/save.h
index 75b8e65bcb..d5b0c15203 100644
--- a/xen/include/public/arch-arm/hvm/save.h
+++ b/xen/include/public/arch-arm/hvm/save.h
@@ -26,6 +26,11 @@
 #ifndef __XEN_PUBLIC_HVM_SAVE_ARM_H__
 #define __XEN_PUBLIC_HVM_SAVE_ARM_H__
 
+/*
+ * Further use of HVM state is deprecated. New state records should only
+ * be added to the domain state header: public/save.h
+ */
+
 #endif
 
 /*
diff --git a/xen/include/public/arch-x86/hvm/save.h b/xen/include/public/arch-x86/hvm/save.h
index 773a380bc2..e61e2dbcd7 100644
--- a/xen/include/public/arch-x86/hvm/save.h
+++ b/xen/include/public/arch-x86/hvm/save.h
@@ -648,6 +648,11 @@ struct hvm_msr {
  */
 #define HVM_SAVE_CODE_MAX 20
 
+/*
+ * Further use of HVM state is deprecated. New state records should only
+ * be added to the domain state header: public/save.h
+ */
+
 #endif /* __XEN_PUBLIC_HVM_SAVE_X86_H__ */
 
 /*
diff --git a/xen/include/public/save.h b/xen/include/public/save.h
new file mode 100644
index 0000000000..c4be9f570c
--- /dev/null
+++ b/xen/include/public/save.h
@@ -0,0 +1,66 @@
+/*
+ * save.h
+ *
+ * Structure definitions for common PV/HVM domain state that is held by Xen.
+ *
+ * Copyright Amazon.com Inc. or its affiliates.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to
+ * deal in the Software without restriction, including without limitation the
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+ * sell copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#ifndef XEN_PUBLIC_SAVE_H
+#define XEN_PUBLIC_SAVE_H
+
+#if defined(__XEN__) || defined(__XEN_TOOLS__)
+
+#include "xen.h"
+
+/*
+ * C structures for the Domain Context v1 format.
+ * See docs/specs/domain-context.md
+ */
+
+struct domain_context_record {
+    uint32_t type;
+    uint32_t instance;
+    uint64_t length;
+    uint8_t body[XEN_FLEX_ARRAY_DIM];
+};
+
+#define _DOMAIN_CONTEXT_RECORD_ALIGN 3
+#define DOMAIN_CONTEXT_RECORD_ALIGN (1U << _DOMAIN_CONTEXT_RECORD_ALIGN)
+
+enum {
+    DOMAIN_CONTEXT_END,
+    DOMAIN_CONTEXT_START,
+    /* New types go here */
+    DOMAIN_CONTEXT_NR_TYPES
+};
+
+/* Initial entry */
+struct domain_context_start {
+    uint32_t xen_major, xen_minor;
+};
+
+/* Terminating entry */
+struct domain_context_end {};
+
+#endif /* defined(__XEN__) || defined(__XEN_TOOLS__) */
+
+#endif /* XEN_PUBLIC_SAVE_H */
-- 
2.20.1


