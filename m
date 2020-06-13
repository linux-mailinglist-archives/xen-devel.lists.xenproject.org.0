Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 707F41F84AA
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2020 20:43:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkB6G-0007Iz-IE; Sat, 13 Jun 2020 18:41:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rKRb=72=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jkB6F-0007Iu-Cg
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2020 18:41:51 +0000
X-Inumbo-ID: 8a686928-ada5-11ea-b6c2-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8a686928-ada5-11ea-b6c2-12813bfff9fa;
 Sat, 13 Jun 2020 18:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MFePwdJckU5c3mtocnCg48ruUviS+H7vs4qM4vnDBuQ=; b=xx9UH4tMWXBSWwg1m983PJovE2
 iXY7FqpAd1BMM8GVdN/o0KQyILC0u7Udsfbz2XhfqkyW7tXAZPiw82R+Z9uRtOc8x56FE1aDdW+sA
 DMjKJmZROmvizR7nNLcXjKDbdr09tXBYENnCiHp4ULmq9/lHhmczbUsFZh03lhTAxRWc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jkB6B-0004vi-Lx; Sat, 13 Jun 2020 18:41:47 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jkB6B-0003hP-C5; Sat, 13 Jun 2020 18:41:47 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v3 for-4.14] pvcalls: Document correctly and explicitely the
 padding for all arches
Date: Sat, 13 Jun 2020 19:41:32 +0100
Message-Id: <20200613184132.11880-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

The documentation of pvcalls suggests there is padding for 32-bit x86
at the end of most the structure. However, they are not described in
in the public header.

Because of that all the structures would be 32-bit aligned and not
64-bit aligned for 32-bit x86.

For all the other architectures supported (Arm and 64-bit x86), the
structure are aligned to 64-bit because they contain uint64_t field.
Therefore all the structures contain implicit padding.

The paddings are now corrected for 32-bit x86 and written explicitly for
all the architectures.

While the structure size between 32-bit and 64-bit x86 is different, it
shouldn't cause any incompatibility between a 32-bit and 64-bit
frontend/backend because the commands are always 56 bits and the padding
are at the end of the structure.

As an aside, the padding sadly cannot be mandated to be 0 as they are
already present. So it is not going to be possible to use the padding
for extending a command in the future.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---
    Changes in v3:
        - Use __i386__ rather than CONFIG_X86_32

    Changes in v2:
        - It is not possible to use the same padding for 32-bit x86 and
        all the other supported architectures.
---
 docs/misc/pvcalls.pandoc        | 18 ++++++++++--------
 xen/include/public/io/pvcalls.h | 14 ++++++++++++++
 2 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/docs/misc/pvcalls.pandoc b/docs/misc/pvcalls.pandoc
index 665dad556c39..caa71b36d78b 100644
--- a/docs/misc/pvcalls.pandoc
+++ b/docs/misc/pvcalls.pandoc
@@ -246,9 +246,9 @@ The format is defined as follows:
     			uint32_t domain;
     			uint32_t type;
     			uint32_t protocol;
-    			#ifdef CONFIG_X86_32
+			#ifndef __i386__
     			uint8_t pad[4];
-    			#endif
+			#endif
     		} socket;
     		struct xen_pvcalls_connect {
     			uint64_t id;
@@ -257,16 +257,18 @@ The format is defined as follows:
     			uint32_t flags;
     			grant_ref_t ref;
     			uint32_t evtchn;
-    			#ifdef CONFIG_X86_32
+			#ifndef __i386__
     			uint8_t pad[4];
-    			#endif
+			#endif
     		} connect;
     		struct xen_pvcalls_release {
     			uint64_t id;
     			uint8_t reuse;
-    			#ifdef CONFIG_X86_32
+			#ifndef __i386__
     			uint8_t pad[7];
-    			#endif
+			#else
+			uint8_t pad[3];
+			#endif
     		} release;
     		struct xen_pvcalls_bind {
     			uint64_t id;
@@ -276,9 +278,9 @@ The format is defined as follows:
     		struct xen_pvcalls_listen {
     			uint64_t id;
     			uint32_t backlog;
-    			#ifdef CONFIG_X86_32
+			#ifndef __i386__
     			uint8_t pad[4];
-    			#endif
+			#endif
     		} listen;
     		struct xen_pvcalls_accept {
     			uint64_t id;
diff --git a/xen/include/public/io/pvcalls.h b/xen/include/public/io/pvcalls.h
index cb8171275c13..28374a82f410 100644
--- a/xen/include/public/io/pvcalls.h
+++ b/xen/include/public/io/pvcalls.h
@@ -65,6 +65,9 @@ struct xen_pvcalls_request {
             uint32_t domain;
             uint32_t type;
             uint32_t protocol;
+#ifndef __i386__
+            uint8_t pad[4];
+#endif
         } socket;
         struct xen_pvcalls_connect {
             uint64_t id;
@@ -73,10 +76,18 @@ struct xen_pvcalls_request {
             uint32_t flags;
             grant_ref_t ref;
             uint32_t evtchn;
+#ifndef __i386__
+            uint8_t pad[4];
+#endif
         } connect;
         struct xen_pvcalls_release {
             uint64_t id;
             uint8_t reuse;
+#ifndef __i386__
+            uint8_t pad[7];
+#else
+            uint8_t pad[3];
+#endif
         } release;
         struct xen_pvcalls_bind {
             uint64_t id;
@@ -86,6 +97,9 @@ struct xen_pvcalls_request {
         struct xen_pvcalls_listen {
             uint64_t id;
             uint32_t backlog;
+#ifndef __i386__
+            uint8_t pad[4];
+#endif
         } listen;
         struct xen_pvcalls_accept {
             uint64_t id;
-- 
2.17.1


