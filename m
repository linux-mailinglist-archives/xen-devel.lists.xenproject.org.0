Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C20B81A8A7
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 22:47:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658318.1027441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rG4PX-0005lt-CI; Wed, 20 Dec 2023 21:47:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658318.1027441; Wed, 20 Dec 2023 21:47:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rG4PX-0005is-9D; Wed, 20 Dec 2023 21:47:27 +0000
Received: by outflank-mailman (input) for mailman id 658318;
 Wed, 20 Dec 2023 21:47:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dQ/e=H7=citrix.com=prvs=7116826ff=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1rG4PV-00059K-Of
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 21:47:25 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a795307-9f81-11ee-9b0f-b553b5be7939;
 Wed, 20 Dec 2023 22:47:23 +0100 (CET)
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
X-Inumbo-ID: 5a795307-9f81-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1703108843;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yk92W/mfN3XK5pyV+BunhluKT6FClpgUmPt9KQysWdw=;
  b=hWuGNTnWMlYQXzyT3WU42LS2orF1eULEqraebmWVgDKZXxhV/KBaAW5g
   BEAqcfKwIY5Y6yucJdm1iktSWFNRN7NwdpEw7hZpp+jlgychahEjwg/yC
   gtKMoXpUe4uRfo6L3CrkYBhw/sYQrgpv/lngLfCu7iy0CmFIV0kqu8AF6
   g=;
X-CSE-ConnectionGUID: X2YHk+T9TlSU1zBXUuZ2HQ==
X-CSE-MsgGUID: LrgrxHZbSSGwWsvlSFSLVQ==
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 129369735
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:GaN9g6JW/zyAgdOMFE+RupUlxSXFcZb7ZxGr2PjKsXjdYENS0DUHn
 TRMDGjSMvuKYTehfY8kbYripkpVsMSBzIVrSQFlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAhk/nOHvylULKs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrfwP9TlK6q4mhB5AZmPasjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5HW1Bu9
 r8keQwJVS3alciG/a+JEMlV05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGspM0yojx5nYz/7DLoXmuuyi2a5WDpfsF+P/oI84nTJzRw327/oWDbQUoXQFJ4LzxnD+
 woq+UzdGB4AJPytwwG+3W2TnfHLpg3AfLwrQejQGvlC3wTImz175ActfUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxasnDQRRt5RGO0S8xyWx+zf5APxLnMfUjdLZdgitck3bT8nz
 FmEm5XuHzMHmKKRYWKQ8PGTtzzaESoIKW4PYwcUQA1D5MPsyLzflTqWEIwlSvTsyISoSHevm
 1hmsRTSmZ0j1/8r1OaHrGzDuA/1tLL5cxMHvCXuCzfNAhxCWGK1W2C5wQGEta0YfdbFHwDpg
 ZQSpySJAAkz4XCxeM+lGrxl8EmBvartDdElqQcH82Md3zqs4WW/Wotb/StzIkxkWu5dJmeyO
 B6M5VwItc8JVJdPUUOQS9vhY/nGMIC6TYi1PhwqRosmjmdNmP+vo3g1OB/4M5HFm0kwi6AvU
 ap3gu71ZUv2/Z9PlWLsL89EiO9D+8zL7T+LLXwN50j9gOX2ib/8YettDWZimchgs//V/l6Kr
 IkBXyZIoj0GONDDjuDs2dZ7BTg3wbITXPgad+Q/mja/Hzdb
IronPort-HdrOrdr: A9a23:IOhBsqnXrGPeiES5GfQToRZJzNDpDfIg3DAbv31ZSRFFG/Fxl6
 iV8sjzsiWE7wr5OUtQ/exoV5PhfZqxz/JICOoqTNKftWvdyQiVxehZhOOIqVDd8kXFh4hgPM
 xbEpSWZueeMbEDt7eZ3DWF
X-Talos-CUID: 9a23:vnhp3m4C9VP6ouTm8dssxBQlOsNmTizhyEztel2SOVt0eue1cArF
X-Talos-MUID: =?us-ascii?q?9a23=3At4gRIwzS+1HnJncthipE+lX/4f2aqIC0B1odsac?=
 =?us-ascii?q?MgPKrKhNrJTOmog+TfLZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.04,292,1695700800"; 
   d="scan'208";a="129369735"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] xen/xmalloc: XMEM_POOL_POISON improvements
Date: Wed, 20 Dec 2023 21:47:16 +0000
Message-ID: <20231220214716.2510402-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

When in use, the spew:

  (XEN) Assertion '!memchr_inv(b->ptr.buffer + MIN_BLOCK_SIZE, POISON_BYTE, (b->size & BLOCK_SIZE_MASK) - MIN_BLOCK_SIZE)' failed at common/xmalloc_tlsf.c:246

is unweidly and likely meaningless to non-Xen developers.  Therefore:

 * Switch to IS_ENABLED().  There's no need for full #ifdef-ary.
 * Pull memchr_inv() out into the if(), and provide an error message which
   clearly states that corruption has been found.

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

v2:
 * Switch to printk()+BUG()
---
 xen/common/xmalloc_tlsf.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/xen/common/xmalloc_tlsf.c b/xen/common/xmalloc_tlsf.c
index 349b31cb4cc1..5e55fc463e7d 100644
--- a/xen/common/xmalloc_tlsf.c
+++ b/xen/common/xmalloc_tlsf.c
@@ -249,11 +249,14 @@ static inline void EXTRACT_BLOCK(struct bhdr *b, struct xmem_pool *p, int fl,
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
+    {
+        printk(XENLOG_ERR "XMEM Pool corruption found");
+        BUG();
+    }
 }
 
 /**
@@ -261,11 +264,10 @@ static inline void EXTRACT_BLOCK(struct bhdr *b, struct xmem_pool *p, int fl,
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


