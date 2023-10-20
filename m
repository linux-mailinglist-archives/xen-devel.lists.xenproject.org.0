Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B335A7D16FE
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 22:28:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.620434.965853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtw5J-0005mT-7x; Fri, 20 Oct 2023 20:27:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 620434.965853; Fri, 20 Oct 2023 20:27:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtw5J-0005jj-51; Fri, 20 Oct 2023 20:27:05 +0000
Received: by outflank-mailman (input) for mailman id 620434;
 Fri, 20 Oct 2023 20:27:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d6HR=GC=citrix.com=prvs=650384eb3=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qtw5H-0005jd-Lv
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 20:27:03 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03e55955-6f87-11ee-9b0e-b553b5be7939;
 Fri, 20 Oct 2023 22:26:59 +0200 (CEST)
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
X-Inumbo-ID: 03e55955-6f87-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1697833619;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dpNHhf1PLHrfMvYwmsb5wJU3HaHS1PzXmQZrVIsAsAg=;
  b=Gtrj6JB2ez7EP2vdgZDQ3Fnj4oOf5nfwdi17CY/gxn6R56lDSAEka/63
   7ggUMR+u46+IRbMZQRSPCRVKHHOvbwU6DSEZGUK2wfvmZqAskGZqnCyc2
   pjF1gUTeOJ4Qdp5FoV4ELIe2h/jjhEdOrcsyLx7xC2fkTckZM+oBhE2e7
   4=;
X-CSE-ConnectionGUID: VFknDW17QTKBnFx1+urDdQ==
X-CSE-MsgGUID: AomJxvRuQtuPSynYheseFA==
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 128996198
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:YJvAFK+hHP6ulIQ8kfnhDrUDqH6TJUtcMsCJ2f8bNWPcYEJGY0x3x
 jMYCjjSP/7fM2byeY8nOtiy8k5U6J+AzIVjQQdsq308E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjVAOK6UKidYnwZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks01BjOkGlA5AdnPaoT5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklw2
 /8eBA9UMSm/pMiw7qLiCfR2qsgaeZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUWGPEUn1lQ/UfrSmM+BgHXlfiIeg1WSvactuEDYzRBr0airO93QEjCPbZwPzhfJ+
 DuXrwwVBDkzM9m92SS/70uwm9f0jCXKWI8JGZORo6sCbFq7mTVIVUx+uUGAiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0efBdDuk74wGl0bfP7kCSAW1sZiVadNUsucsyRDor/
 lyEhdXkAXpoqrL9YW2Z3qeZq3W1Iyd9BW0fYS4JSyMV7t+lp5s85i8jVf46TvTz1IesX2itk
 nbV9EDSmon/k+Y1+aa90W+e3AuQhbLPYB5spRjNcm6cu1YRiJGeW2C41bTKxa8efdnDEwXb5
 ihsd9u2tr5UUM3T/MCZaKBdROj2uazt3Cj02wYHInU3y9i6F5dPl6ho5zRmLUFueuwJcDTpC
 KM4kVgKvMENVJdGgLUeXm5QNyjJ5fK6fTgdfqqIBueim7AoHON9wAlgZFSLw0fmm1U2nKc0N
 P+zKJj9UiZAV/o6lmvqH4/xNIPHIAhklAs/oriqpylLLJLEPCLFIVv7GAfmgh8FAFOs/1yOr
 oc32zqiwBRDSuzuChTqHXooBQlSdxATXMmuw+QOL7LrH+aTMDx4YxMn6eh6ININcmU8vrqgw
 0xRrWcCkAGm2SOddlTTAp2hAZu2NatCQbsAFXREFT6VN7ILOO5DMI93m0MLQIQa
IronPort-HdrOrdr: A9a23:jArVZqvB8mqv6MBH1+3RtMxP7skDetV00zEX/kB9WHVpmszxra
 6TdZMgpHjJYVcqKRUdcL+7WJVoLUmxyXcX2/h1AV7BZniEhILAFugLhuGO/9SJIVyZygc378
 ZdmsZFZ+EYdWIK7/rH3A==
X-Talos-CUID: 9a23:3By55WG3/CsiP353qmJZ2k0SNv98LUTh713WDV/hSntzZLGsHAo=
X-Talos-MUID: 9a23:8zqruQkFlF/fqDXFO12CdnpLM8JK87qUFXkRjK09qs+1NSFrNhm02WE=
X-IronPort-AV: E=Sophos;i="6.03,239,1694750400"; 
   d="scan'208";a="128996198"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH for-4.19] xen/xmalloc: XMEM_POOL_POISON improvements
Date: Fri, 20 Oct 2023 21:26:49 +0100
Message-ID: <20231020202649.1802700-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

When in use, the spew:

  (XEN) Assertion '!memchr_inv(b->ptr.buffer + MIN_BLOCK_SIZE, POISON_BYTE, (b->size & BLOCK_SIZE_MASK) - MIN_BLOCK_SIZE)' failed at common/xmalloc_tlsf.c:246

is unweidly and meaningless to non-Xen developers.  Therefore:

 * Switch to IS_ENABLED().  There's no need for full #ifdef-ary.
 * Pull memchr_inv() out into the if(), and provide a better error message.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>

Observations from the debugging of:
  https://github.com/Dasharo/dasharo-issues/issues/488

There's a further bug.  XMEM_POOL_POISON can be enabled in release builds,
where the ASSERT() gets dropped.

However, upping to a BUG() can't provide any helpful message out to the user.

I tried modifying BUG() to take an optional message, but xen/bug.h needs
untangling substantially before that will work, and I don't have time right now.
---
 xen/common/xmalloc_tlsf.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/xen/common/xmalloc_tlsf.c b/xen/common/xmalloc_tlsf.c
index 349b31cb4cc1..13305cd87c2f 100644
--- a/xen/common/xmalloc_tlsf.c
+++ b/xen/common/xmalloc_tlsf.c
@@ -249,11 +249,11 @@ static inline void EXTRACT_BLOCK(struct bhdr *b, struct xmem_pool *p, int fl,
     }
     b->ptr.free_ptr = (struct free_ptr) {NULL, NULL};
 
-#ifdef CONFIG_XMEM_POOL_POISON
-    if ( (b->size & BLOCK_SIZE_MASK) > MIN_BLOCK_SIZE )
-        ASSERT(!memchr_inv(b->ptr.buffer + MIN_BLOCK_SIZE, POISON_BYTE,
-                           (b->size & BLOCK_SIZE_MASK) - MIN_BLOCK_SIZE));
-#endif /* CONFIG_XMEM_POOL_POISON */
+    if ( IS_ENABLED(CONFIG_XMEM_POOL_POISON) &&
+         (b->size & BLOCK_SIZE_MASK) > MIN_BLOCK_SIZE &&
+         memchr_inv(b->ptr.buffer + MIN_BLOCK_SIZE, POISON_BYTE,
+                    (b->size & BLOCK_SIZE_MASK) - MIN_BLOCK_SIZE) )
+        ASSERT(!"XMEM Pool corruption found");
 }
 
 /**
@@ -261,11 +261,10 @@ static inline void EXTRACT_BLOCK(struct bhdr *b, struct xmem_pool *p, int fl,
  */
 static inline void INSERT_BLOCK(struct bhdr *b, struct xmem_pool *p, int fl, int sl)
 {
-#ifdef CONFIG_XMEM_POOL_POISON
-    if ( (b->size & BLOCK_SIZE_MASK) > MIN_BLOCK_SIZE )
+    if ( IS_ENABLED(CONFIG_XMEM_POOL_POISON) &&
+         (b->size & BLOCK_SIZE_MASK) > MIN_BLOCK_SIZE )
         memset(b->ptr.buffer + MIN_BLOCK_SIZE, POISON_BYTE,
                (b->size & BLOCK_SIZE_MASK) - MIN_BLOCK_SIZE);
-#endif /* CONFIG_XMEM_POOL_POISON */
 
     b->ptr.free_ptr = (struct free_ptr) {NULL, p->matrix[fl][sl]};
     if ( p->matrix[fl][sl] )
-- 
2.30.2


