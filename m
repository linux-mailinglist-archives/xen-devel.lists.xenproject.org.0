Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2973F3E915A
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 14:32:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166032.303241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDnPD-0004GK-Sf; Wed, 11 Aug 2021 12:32:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166032.303241; Wed, 11 Aug 2021 12:32:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDnPD-0004EK-Nx; Wed, 11 Aug 2021 12:32:23 +0000
Received: by outflank-mailman (input) for mailman id 166032;
 Wed, 11 Aug 2021 12:32:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u8Eh=NC=citrix.com=Kevin.Stefanov@srs-us1.protection.inumbo.net>)
 id 1mDnPC-0003bF-It
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 12:32:22 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 26f9ca29-faa0-11eb-a06f-12813bfff9fa;
 Wed, 11 Aug 2021 12:32:13 +0000 (UTC)
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
X-Inumbo-ID: 26f9ca29-faa0-11eb-a06f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1628685133;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TGd9oCbPhWLBkQ8whA4VOs8vPrbai8+dznFmO2B/H0w=;
  b=hw+ktms0wlKu7Bbs8WM38dPxBptjcJd3Z3MpuctyOI0vwL1FB99O6jpE
   Hf0b/AjIekGAbY20ylTnVNxCuh0Hpe2VITpllUObq7AUwZ5aOvTkPFlv4
   aZ6qTzU8DG2xlqMRmP6YL9v2OEsuMQesFj2+n9ZJn/FQO8nA3bVc3fQ+j
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 0Pr+/cXMiNF+ductPW+UauNj+pLbwi+9Quh/Ktpe1IXnqZVPorHwVoA3nTd1jbH6rlvbJMgOMb
 zd/CuEpGoRoJGgqReD7rlzpBR1NtrVserPTme3xNaiUKYTR5wd0DoNCKzrpUVfFrUEdVp+i4jx
 6rBDM+x1eCGQkFJPHX5UYEt1sbCWLZ/1HUPaAzrb61s+bBMXQ1240oG2WpTGJOhUlMLJ4GKvgu
 eGfuXfdsXYQBFIAvCf7oAOmH29E1DreBPSsIZHGcGjsepbBw7561IV0FI4UMGqt1QgUyg7QQ5S
 /j8fTwDPnhcEoAkrw3NHZNsm
X-SBRS: 5.1
X-MesageID: 51909393
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:j9dgbqpEV4v1NQiFn5gA3YUaV5oReYIsimQD101hICG8cqSj9v
 xG+85rrCMc6QxhI03I9urwW5VoLUmyyXcx2/h0AV7AZniBhILLFvAB0WKK+VSJcEeSmtK1l5
 0QFJSWYOeAdWSS5vyb3ODXKbgdKaG8gcWVuds=
X-IronPort-AV: E=Sophos;i="5.84,311,1620705600"; 
   d="scan'208";a="51909393"
From: Kevin Stefanov <kevin.stefanov@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Kevin Stefanov <kevin.stefanov@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 1/2] xen/kexec: Remove use of TRUE/FALSE
Date: Wed, 11 Aug 2021 13:31:34 +0100
Message-ID: <20210811123135.18195-2-kevin.stefanov@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811123135.18195-1-kevin.stefanov@citrix.com>
References: <20210811123135.18195-1-kevin.stefanov@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Whilst fixing this, also changed bool_t to bool, and use __read_mostly.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Kevin Stefanov <kevin.stefanov@citrix.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>

v2:
 *Use __read_mostly
---
 xen/common/kexec.c      | 6 +++---
 xen/include/xen/kexec.h | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/common/kexec.c b/xen/common/kexec.c
index ebeee6405a..c63db618a7 100644
--- a/xen/common/kexec.c
+++ b/xen/common/kexec.c
@@ -35,7 +35,7 @@
 #include <compat/kexec.h>
 #endif
 
-bool_t kexecing = FALSE;
+bool __read_mostly kexecing;
 
 /* Memory regions to store the per cpu register state etc. on a crash. */
 typedef struct { Elf_Note * start; size_t size; } crash_note_range_t;
@@ -383,7 +383,7 @@ void kexec_crash(enum crash_reason reason)
     if ( !test_bit(KEXEC_IMAGE_CRASH_BASE + pos, &kexec_flags) )
         return;
 
-    kexecing = TRUE;
+    kexecing = true;
 
     if ( kexec_common_shutdown() != 0 )
         return;
@@ -399,7 +399,7 @@ static long kexec_reboot(void *_image)
 {
     struct kexec_image *image = _image;
 
-    kexecing = TRUE;
+    kexecing = true;
 
     kexec_common_shutdown();
     machine_reboot_kexec(image);
diff --git a/xen/include/xen/kexec.h b/xen/include/xen/kexec.h
index 9f7a912e97..e66eb6a8e5 100644
--- a/xen/include/xen/kexec.h
+++ b/xen/include/xen/kexec.h
@@ -17,7 +17,7 @@ typedef struct xen_kexec_reserve {
 extern xen_kexec_reserve_t kexec_crash_area;
 extern paddr_t kexec_crash_area_limit;
 
-extern bool_t kexecing;
+extern bool kexecing;
 
 void set_kexec_crash_area_size(u64 system_ram);
 
@@ -81,7 +81,7 @@ void vmcoreinfo_append_str(const char *fmt, ...)
 #else /* !CONFIG_KEXEC */
 
 #define crashinfo_maxaddr_bits 0
-#define kexecing 0
+#define kexecing false
 
 static inline void kexec_early_calculations(void) {}
 static inline void kexec_crash(enum crash_reason reason)
-- 
2.25.1


