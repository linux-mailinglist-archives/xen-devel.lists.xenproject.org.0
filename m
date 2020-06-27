Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A7320C08D
	for <lists+xen-devel@lfdr.de>; Sat, 27 Jun 2020 11:56:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jp7Yn-00072Q-6r; Sat, 27 Jun 2020 09:55:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=M84L=AI=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jp7Yl-00071i-7W
 for xen-devel@lists.xenproject.org; Sat, 27 Jun 2020 09:55:43 +0000
X-Inumbo-ID: 5b952b42-b85c-11ea-bca7-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5b952b42-b85c-11ea-bca7-bc764e2007e4;
 Sat, 27 Jun 2020 09:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ToWAhOBizK7AhT+LuF1MG0+z4Ou3oX83o1ykrw66Sw8=; b=aFNlYAfDwg9xx6gyCp3FpqEA1c
 /BkSNm2k9jy+KiZ58TVbt8HJ43i2+l8Ktp14blO3XovY8HAPgKRdE+usRG0n5gChvHCuaY3RdxpJw
 xmOiW8j+/LhmrmYkyzumzSrSMYfE9flTbAm9+1/3E5F3bcDfhUKhsOoyRaLF2tzpgBmw=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jp7Yh-0005pb-EW; Sat, 27 Jun 2020 09:55:39 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jp7Yh-00017R-55; Sat, 27 Jun 2020 09:55:39 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v4 for-4.14 2/2] pvcalls: Document correctly and explicitely
 the padding for all arches
Date: Sat, 27 Jun 2020 10:55:33 +0100
Message-Id: <20200627095533.14145-3-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200627095533.14145-1-julien@xen.org>
References: <20200627095533.14145-1-julien@xen.org>
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

The specification of pvcalls suggests there is padding for 32-bit x86
at the end of most the structure. However, they are not described in
in the public header.

Because of that all the structures would be 32-bit aligned and not
64-bit aligned for 32-bit x86.

For all the other architectures supported (Arm and 64-bit x86), the
structure are aligned to 64-bit because they contain uint64_t field.
Therefore all the structures contain implicit padding.

Given the specification is authoriitative, the padding will the same for
the all architectures. The potential breakage of compatibility is ought
to be fine as pvcalls is still a tech preview.

As an aside, the padding sadly cannot be mandated to be 0 as they are
already present. So it is not going to be possible to use the padding
for extending a command in the future.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---
    This wants to be included in Xen 4.14 to avoid more users to rely on
    wrong public headers.

    Changes in v4:
        - Revert back to v1 for the patch and expand the commit message

    Changes in v3:
        - Use __i386__ rather than CONFIG_X86_32

    Changes in v2:
        - It is not possible to use the same padding for 32-bit x86 and
        all the other supported architectures.
---
 docs/misc/pvcalls.pandoc        | 8 --------
 xen/include/public/io/pvcalls.h | 4 ++++
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/docs/misc/pvcalls.pandoc b/docs/misc/pvcalls.pandoc
index 665dad556c39..971cd8f4b122 100644
--- a/docs/misc/pvcalls.pandoc
+++ b/docs/misc/pvcalls.pandoc
@@ -246,9 +246,7 @@ The format is defined as follows:
     			uint32_t domain;
     			uint32_t type;
     			uint32_t protocol;
-    			#ifdef CONFIG_X86_32
     			uint8_t pad[4];
-    			#endif
     		} socket;
     		struct xen_pvcalls_connect {
     			uint64_t id;
@@ -257,16 +255,12 @@ The format is defined as follows:
     			uint32_t flags;
     			grant_ref_t ref;
     			uint32_t evtchn;
-    			#ifdef CONFIG_X86_32
     			uint8_t pad[4];
-    			#endif
     		} connect;
     		struct xen_pvcalls_release {
     			uint64_t id;
     			uint8_t reuse;
-    			#ifdef CONFIG_X86_32
     			uint8_t pad[7];
-    			#endif
     		} release;
     		struct xen_pvcalls_bind {
     			uint64_t id;
@@ -276,9 +270,7 @@ The format is defined as follows:
     		struct xen_pvcalls_listen {
     			uint64_t id;
     			uint32_t backlog;
-    			#ifdef CONFIG_X86_32
     			uint8_t pad[4];
-    			#endif
     		} listen;
     		struct xen_pvcalls_accept {
     			uint64_t id;
diff --git a/xen/include/public/io/pvcalls.h b/xen/include/public/io/pvcalls.h
index 905880735dda..6da6b5533a10 100644
--- a/xen/include/public/io/pvcalls.h
+++ b/xen/include/public/io/pvcalls.h
@@ -68,6 +68,7 @@ struct xen_pvcalls_request {
             uint32_t domain;
             uint32_t type;
             uint32_t protocol;
+            uint8_t pad[4];
         } socket;
         struct xen_pvcalls_connect {
             uint64_t id;
@@ -76,10 +77,12 @@ struct xen_pvcalls_request {
             uint32_t flags;
             grant_ref_t ref;
             uint32_t evtchn;
+            uint8_t pad[4];
         } connect;
         struct xen_pvcalls_release {
             uint64_t id;
             uint8_t reuse;
+            uint8_t pad[7];
         } release;
         struct xen_pvcalls_bind {
             uint64_t id;
@@ -89,6 +92,7 @@ struct xen_pvcalls_request {
         struct xen_pvcalls_listen {
             uint64_t id;
             uint32_t backlog;
+            uint8_t pad[4];
         } listen;
         struct xen_pvcalls_accept {
             uint64_t id;
-- 
2.17.1


