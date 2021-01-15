Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CC72F7633
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 11:05:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67884.121363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Lz5-0004Nt-D2; Fri, 15 Jan 2021 10:05:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67884.121363; Fri, 15 Jan 2021 10:05:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Lz5-0004NU-9m; Fri, 15 Jan 2021 10:05:35 +0000
Received: by outflank-mailman (input) for mailman id 67884;
 Fri, 15 Jan 2021 10:05:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nfe5=GS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l0Lz4-0004NP-5b
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 10:05:34 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9031da23-53ba-4ce9-9f52-0c9dcf7a0cc3;
 Fri, 15 Jan 2021 10:05:33 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4FBAFAA6F;
 Fri, 15 Jan 2021 10:05:32 +0000 (UTC)
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
X-Inumbo-ID: 9031da23-53ba-4ce9-9f52-0c9dcf7a0cc3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610705132; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EhshLPoK7F9zj4hONOOxq5DJ/bYZcorWv2GCzIijfsw=;
	b=eNnPJBxyOe1SKk+dKZ7iwaWcwrJ3bkZj1hZh16Hcc96huHG54vJBNkFofWDm9f+Fawj/WY
	FAOKE1NhOa7DvipUVIlJeNjoSly38FzRoF9LPHyo3erXHZ8p5LepZ8iEmT+AdKlumRd084
	LNNsd0Je/490r6EnfzlXJQsAPdvGxBM=
Subject: [PATCH 1/3] introduce unaligned.h
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, M A Young <m.a.young@durham.ac.uk>
References: <0eba95b9-66eb-2692-1da1-c27784b9f51e@suse.com>
Message-ID: <12f26ab9-8a8c-19f0-ea65-8b354bd326a6@suse.com>
Date: Fri, 15 Jan 2021 11:05:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <0eba95b9-66eb-2692-1da1-c27784b9f51e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Rather than open-coding commonly used constructs in yet more places when
pulling in zstd decompression support (and its xxhash prereq), pull out
the custom bits into a commonly used header (for the hypervisor build;
the tool stack and stubdom builds of libxenguest will still remain in
need of similarly taking care of). For now this is limited to x86, where
custom logic isn't needed (considering this is going to be used in init
code only, even using alternatives patching to use MOVBE doesn't seem
worthwhile).

No change in generated code.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Iirc use of include/asm-generic/ was disliked, hence the generic header
goes into include/xen/.

--- a/xen/common/lz4/defs.h
+++ b/xen/common/lz4/defs.h
@@ -10,18 +10,21 @@
 
 #ifdef __XEN__
 #include <asm/byteorder.h>
-#endif
+#include <asm/unaligned.h>
+#else
 
-static inline u16 INIT get_unaligned_le16(const void *p)
+static inline u16 get_unaligned_le16(const void *p)
 {
 	return le16_to_cpup(p);
 }
 
-static inline u32 INIT get_unaligned_le32(const void *p)
+static inline u32 get_unaligned_le32(const void *p)
 {
 	return le32_to_cpup(p);
 }
 
+#endif
+
 /*
  * Detects 64 bits mode
  */
--- a/xen/common/lzo.c
+++ b/xen/common/lzo.c
@@ -97,13 +97,12 @@
 #ifdef __XEN__
 #include <xen/lib.h>
 #include <asm/byteorder.h>
+#include <asm/unaligned.h>
+#else
+#define get_unaligned_le16(_p) (*(u16 *)(_p))
 #endif
 
 #include <xen/lzo.h>
-#define get_unaligned(_p) (*(_p))
-#define put_unaligned(_val,_p) (*(_p)=_val)
-#define get_unaligned_le16(_p) (*(u16 *)(_p))
-#define get_unaligned_le32(_p) (*(u32 *)(_p))
 
 #include "decompress.h"
 
--- a/xen/common/unlzo.c
+++ b/xen/common/unlzo.c
@@ -34,30 +34,19 @@
 
 #ifdef __XEN__
 #include <asm/byteorder.h>
-#endif
+#include <asm/unaligned.h>
+#else
 
-#if 1 /* ndef CONFIG_??? */
-static inline u16 INIT get_unaligned_be16(void *p)
+static inline u16 get_unaligned_be16(const void *p)
 {
 	return be16_to_cpup(p);
 }
 
-static inline u32 INIT get_unaligned_be32(void *p)
+static inline u32 get_unaligned_be32(const void *p)
 {
 	return be32_to_cpup(p);
 }
-#else
-#include <asm/unaligned.h>
-
-static inline u16 INIT get_unaligned_be16(void *p)
-{
-	return be16_to_cpu(__get_unaligned(p, 2));
-}
 
-static inline u32 INIT get_unaligned_be32(void *p)
-{
-	return be32_to_cpu(__get_unaligned(p, 4));
-}
 #endif
 
 static const unsigned char lzop_magic[] = {
--- a/xen/common/xz/private.h
+++ b/xen/common/xz/private.h
@@ -13,34 +13,23 @@
 #ifdef __XEN__
 #include <xen/kernel.h>
 #include <asm/byteorder.h>
-#endif
-
-#define get_le32(p) le32_to_cpup((const uint32_t *)(p))
+#include <asm/unaligned.h>
+#else
 
-#if 1 /* ndef CONFIG_??? */
-static inline u32 INIT get_unaligned_le32(void *p)
+static inline u32 get_unaligned_le32(const void *p)
 {
 	return le32_to_cpup(p);
 }
 
-static inline void INIT put_unaligned_le32(u32 val, void *p)
+static inline void put_unaligned_le32(u32 val, void *p)
 {
 	*(__force __le32*)p = cpu_to_le32(val);
 }
-#else
-#include <asm/unaligned.h>
-
-static inline u32 INIT get_unaligned_le32(void *p)
-{
-	return le32_to_cpu(__get_unaligned(p, 4));
-}
 
-static inline void INIT put_unaligned_le32(u32 val, void *p)
-{
-	__put_unaligned(cpu_to_le32(val), p, 4);
-}
 #endif
 
+#define get_le32(p) le32_to_cpup((const uint32_t *)(p))
+
 #define false 0
 #define true 1
 
--- /dev/null
+++ b/xen/include/asm-x86/unaligned.h
@@ -0,0 +1,6 @@
+#ifndef __ASM_UNALIGNED_H__
+#define __ASM_UNALIGNED_H__
+
+#include <xen/unaligned.h>
+
+#endif /* __ASM_UNALIGNED_H__ */
--- /dev/null
+++ b/xen/include/xen/unaligned.h
@@ -0,0 +1,79 @@
+/*
+ * This header can be used by architectures where unaligned accesses work
+ * witout faulting, and at least reasonably efficiently.  Other architectures
+ * will need to have a custom asm/unaligned.h.
+ */
+#ifndef __ASM_UNALIGNED_H__
+#error "xen/unaligned.h should not be included directly - include asm/unaligned.h instead"
+#endif
+
+#ifndef __XEN_UNALIGNED_H__
+#define __XEN_UNALIGNED_H__
+
+#include <xen/types.h>
+#include <asm/byteorder.h>
+
+#define get_unaligned(p) (*(p))
+#define put_unaligned(val, p) (*(p) = (val))
+
+static inline uint16_t get_unaligned_be16(const void *p)
+{
+	return be16_to_cpup(p);
+}
+
+static inline void put_unaligned_be16(uint16_t val, void *p)
+{
+	*(__force __be16*)p = cpu_to_be16(val);
+}
+
+static inline uint32_t get_unaligned_be32(const void *p)
+{
+	return be32_to_cpup(p);
+}
+
+static inline void put_unaligned_be32(uint32_t val, void *p)
+{
+	*(__force __be32*)p = cpu_to_be32(val);
+}
+
+static inline uint64_t get_unaligned_be64(const void *p)
+{
+	return be64_to_cpup(p);
+}
+
+static inline void put_unaligned_be64(uint64_t val, void *p)
+{
+	*(__force __be64*)p = cpu_to_be64(val);
+}
+
+static inline uint16_t get_unaligned_le16(const void *p)
+{
+	return le16_to_cpup(p);
+}
+
+static inline void put_unaligned_le16(uint16_t val, void *p)
+{
+	*(__force __le16*)p = cpu_to_le16(val);
+}
+
+static inline uint32_t get_unaligned_le32(const void *p)
+{
+	return le32_to_cpup(p);
+}
+
+static inline void put_unaligned_le32(uint32_t val, void *p)
+{
+	*(__force __le32*)p = cpu_to_le32(val);
+}
+
+static inline uint64_t get_unaligned_le64(const void *p)
+{
+	return le64_to_cpup(p);
+}
+
+static inline void put_unaligned_le64(uint64_t val, void *p)
+{
+	*(__force __le64*)p = cpu_to_le64(val);
+}
+
+#endif /* __XEN_UNALIGNED_H__ */


