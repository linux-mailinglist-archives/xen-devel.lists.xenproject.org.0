Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B89B2262CBF
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 12:00:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFwtK-0008Ta-Fn; Wed, 09 Sep 2020 09:59:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wApk=CS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kFwtJ-0008SC-R2
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 09:59:49 +0000
X-Inumbo-ID: 139cdb79-b791-44cc-b3cf-a633b1c4ad5a
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 139cdb79-b791-44cc-b3cf-a633b1c4ad5a;
 Wed, 09 Sep 2020 09:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599645580;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yPfE7IFhRvz6YNbwtl+ttGI5B1vy4mIV43q6LhhTiko=;
 b=OFzPl2q8Nx5aFQYx14csQ6ZOUxvLn7lzZfONlazSbDVgdrGbwIzeM9wI
 sI+Iy1UNgduryWiBZQUtFjf6+zXYZGSZkcxRUTg3ptMED4lCQwYAmjMVo
 5WQfINcx4XuzKRbVk5BT/VyK0KDEpAmOdqiYrMuKF8MhQA4S4yPa9SA6j U=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: goTY5gotyZpbps2UdqdYIU7CrWTkPlXDUbv50DyDhBFL1WnCvKw26rm4W9rTlGB09Hhig07Tu9
 w5PI1hOm+QzsCFWk4ikb55mCbRKHlCCfrDOON8ioWZtAw8WUVSx7/sks5Fi/PXpgT5esA4B3/f
 ZanTu6N+eVD9lVlOhc6hEAa7jSR5EMh6Qcfomo42DsN9xObkzagdsS7WcSOOHp/bzo++V0sM3B
 15DC/S+IcY7R9wePk3Ar065F0RfMTm+i3nqzVw3EFzSDAmRW9PamwXYmd4J7oWBHg3wcmwY/VT
 I78=
X-SBRS: 2.7
X-MesageID: 26574721
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,409,1592884800"; d="scan'208";a="26574721"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 2/5] x86/asm: Split __wr{fs, gs}base() out of write_{fs,
 gs}_base()
Date: Wed, 9 Sep 2020 10:59:17 +0100
Message-ID: <20200909095920.25495-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200909095920.25495-1-andrew.cooper3@citrix.com>
References: <20200909095920.25495-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

To match the read side which is already split out.  A future change will want
to use them.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/include/asm-x86/msr.h | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/xen/include/asm-x86/msr.h b/xen/include/asm-x86/msr.h
index 5e141ac5a5..16f95e7344 100644
--- a/xen/include/asm-x86/msr.h
+++ b/xen/include/asm-x86/msr.h
@@ -156,6 +156,24 @@ static inline unsigned long __rdgsbase(void)
     return base;
 }
 
+static inline void __wrfsbase(unsigned long base)
+{
+#ifdef HAVE_AS_FSGSBASE
+    asm volatile ( "wrfsbase %0" :: "r" (base) );
+#else
+    asm volatile ( ".byte 0xf3, 0x48, 0x0f, 0xae, 0xd0" :: "a" (base) );
+#endif
+}
+
+static inline void __wrgsbase(unsigned long base)
+{
+#ifdef HAVE_AS_FSGSBASE
+    asm volatile ( "wrgsbase %0" :: "r" (base) );
+#else
+    asm volatile ( ".byte 0xf3, 0x48, 0x0f, 0xae, 0xd8" :: "a" (base) );
+#endif
+}
+
 static inline unsigned long read_fs_base(void)
 {
     unsigned long base;
@@ -199,11 +217,7 @@ static inline unsigned long read_gs_shadow(void)
 static inline void write_fs_base(unsigned long base)
 {
     if ( read_cr4() & X86_CR4_FSGSBASE )
-#ifdef HAVE_AS_FSGSBASE
-        asm volatile ( "wrfsbase %0" :: "r" (base) );
-#else
-        asm volatile ( ".byte 0xf3, 0x48, 0x0f, 0xae, 0xd0" :: "a" (base) );
-#endif
+        __wrfsbase(base);
     else
         wrmsrl(MSR_FS_BASE, base);
 }
@@ -211,11 +225,7 @@ static inline void write_fs_base(unsigned long base)
 static inline void write_gs_base(unsigned long base)
 {
     if ( read_cr4() & X86_CR4_FSGSBASE )
-#ifdef HAVE_AS_FSGSBASE
-        asm volatile ( "wrgsbase %0" :: "r" (base) );
-#else
-        asm volatile ( ".byte 0xf3, 0x48, 0x0f, 0xae, 0xd8" :: "a" (base) );
-#endif
+        __wrgsbase(base);
     else
         wrmsrl(MSR_GS_BASE, base);
 }
-- 
2.11.0


