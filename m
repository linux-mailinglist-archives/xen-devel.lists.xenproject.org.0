Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8013C3158E9
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 22:51:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83442.155329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9auA-0006Hr-1B; Tue, 09 Feb 2021 21:50:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83442.155329; Tue, 09 Feb 2021 21:50:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9au9-0006HV-UA; Tue, 09 Feb 2021 21:50:41 +0000
Received: by outflank-mailman (input) for mailman id 83442;
 Tue, 09 Feb 2021 21:50:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5GlY=HL=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l9au8-0006HQ-LN
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 21:50:40 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d1af808a-5596-47f7-b842-bae338eac303;
 Tue, 09 Feb 2021 21:50:39 +0000 (UTC)
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
X-Inumbo-ID: d1af808a-5596-47f7-b842-bae338eac303
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612907439;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ARI5VWYbnY4OIGnzqdSyn1ER3PngI7//x6H6E5t8HQA=;
  b=bGOQPJRyfzmRIMH8ktn5/Jy8iFLLm1wCe4gW10hld/uEoK7k+9kdPzDi
   4pljENxJm8ycVqWpBZZUqlqwo45zh96HbRX02pNdYalOF65jVATLcU00l
   /v4txGHTcbEhdgla5KHE++ZIEVTGG6YrnTuJCym8Bav4y9dN0nprFxPaQ
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: pgu4N++WhcU8+9Y8T3snB+4wQNwKfuevA/seMVLw5cnRDnNkr6lpI1/6QiadHzspLIXe4iU5VJ
 wzYpTFx5rxnSWlRkFhETv/Os64AQCc5y7Rh5CsAa3pMUusijVoKupWNtSg8TdYDCpdjMkj1MBP
 JRGMMLsKDeN8lkXAPVTZubKHJ7VhX0mMs5MGR0zXpk9Kbx7UkLFte3yz4ObOdzq5oQExgQGT0U
 8NLm0J3UIFRLNQEnIOUmncS1YArFONXMs2pbRhcpBF+ip+Rv4FvfDuHKYI9Z2rE7Sl2plx+6XF
 QSg=
X-SBRS: 5.1
X-MesageID: 37280526
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,166,1610427600"; 
   d="scan'208";a="37280526"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>
Subject: [PATCH for-4.15] x86/ucode/amd: Handle length sanity check failures more gracefully
Date: Tue, 9 Feb 2021 21:49:11 +0000
Message-ID: <20210209214911.18461-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Currently, a failure of verify_patch_size() causes an early abort of the
microcode blob loop, which in turn causes a second go around the main
container loop, ultimately failing the UCODE_MAGIC check.

First, check for errors after the blob loop.  An error here is unrecoverable,
so avoid going around the container loop again and printing an
unhelpful-at-best error concerning bad UCODE_MAGIC.

Second, split the verify_patch_size() check out of the microcode blob header
check.  In the case that the sanity check fails, we can still use the
known-to-be-plausible header length to continue walking the container to
potentially find other applicable microcode blobs.

Before:
  (XEN) microcode: Bad microcode data
  (XEN) microcode: Wrong microcode patch file magic
  (XEN) Parsing microcode blob error -22

After:
  (XEN) microcode: Bad microcode length 0x000015c0 for cpu 0xa000
  (XEN) microcode: Bad microcode length 0x000015c0 for cpu 0xa010
  (XEN) microcode: Bad microcode length 0x000015c0 for cpu 0xa011
  (XEN) microcode: Bad microcode length 0x000015c0 for cpu 0xa200
  (XEN) microcode: Bad microcode length 0x000015c0 for cpu 0xa210
  (XEN) microcode: Bad microcode length 0x000015c0 for cpu 0xa500
  (XEN) microcode: couldn't find any matching ucode in the provided blob!

Fixes: 4de936a38a ("x86/ucode/amd: Rework parsing logic in cpu_request_microcode()")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Ian Jackson <iwj@xenproject.org>

For 4.15.  Found when putting a test together to prove the correctness of the
"x86/ucode: Fix microcode payload size for Fam19 processors" fix.

This allows microcode loading to still function even if the length magic
numbers aren't correct for a subset of blobs within the container(s).
---
 xen/arch/x86/cpu/microcode/amd.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index c4ab395799..fe7b79bd0a 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -348,8 +348,7 @@ static struct microcode_patch *cpu_request_microcode(const void *buf, size_t siz
 
             if ( size < sizeof(*mc) ||
                  (mc = buf)->type != UCODE_UCODE_TYPE ||
-                 size - sizeof(*mc) < mc->len ||
-                 (!skip_ucode && !verify_patch_size(mc->len)) )
+                 size - sizeof(*mc) < mc->len )
             {
                 printk(XENLOG_ERR "microcode: Bad microcode data\n");
                 error = -EINVAL;
@@ -359,6 +358,19 @@ static struct microcode_patch *cpu_request_microcode(const void *buf, size_t siz
             if ( skip_ucode )
                 goto skip;
 
+            if ( !verify_patch_size(mc->len) )
+            {
+                printk(XENLOG_WARNING
+                       "microcode: Bad microcode length 0x%08x for cpu 0x%04x\n",
+                       mc->len, mc->patch->processor_rev_id);
+                /*
+                 * If the blob size sanity check fails, trust the container
+                 * length which has already been checked to be at least
+                 * plausible at this point.
+                 */
+                goto skip;
+            }
+
             /*
              * If the new ucode covers current CPU, compare ucodes and store the
              * one with higher revision.
@@ -382,6 +394,14 @@ static struct microcode_patch *cpu_request_microcode(const void *buf, size_t siz
             if ( size >= 4 && *(const uint32_t *)buf == UCODE_MAGIC )
                 break;
         }
+
+        /*
+         * Any error means we didn't get cleanly to the end of the microcode
+         * container.  There isn't an overall length field, so we've got no
+         * way of skipping to the next container in the stream.
+         */
+        if ( error )
+            break;
     }
 
     if ( saved )
-- 
2.11.0


