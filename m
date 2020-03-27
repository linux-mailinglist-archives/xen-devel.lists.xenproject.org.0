Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A38B195721
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 13:33:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHo77-0006B3-0E; Fri, 27 Mar 2020 12:29:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o0RR=5M=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jHo75-0006A5-EH
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 12:29:27 +0000
X-Inumbo-ID: 92fe760c-7026-11ea-8967-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 92fe760c-7026-11ea-8967-12813bfff9fa;
 Fri, 27 Mar 2020 12:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585312157;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qj7uuUM3UOJjx3jxggL5Q952gnP0pujxYRywhdKJVec=;
 b=WcYjknZwQiukrUaVgzZfX/MuNvgFb43MsA4q+ZEkOJqoa+EZ+UtnpZJy
 S7f0Ex5/F9h59C0dOv9MwgjBhS39eub8H5WZkvzk2uzhVOCHElUa7Y2aN
 8zKUIPHrf2gpRu8epDdxeSqrwNt7HteKeAsIob0vTM1Ib6GVSUyypXE72 k=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: eIr0X/nW18uBV76A9TlW5wq8X3/D8xfRp411KuNQhazB6ixtNi78+AiyCNkvxaH65zF1lpIl+y
 GDBrlBQtYT5SID+917aamSPDNmcl1bcqxnSJ1fFlVLRtGRd6SxFfMaqDRt6JNqWoHPylLtoMlS
 cjmzutrV0NtJfaAmpy59FFGSiBi5U8Rqla7DqfyZcVpid/fdzsNM3NOJZ5Ez7jGJkafliSTdAT
 L3JwWBv/DdsuxoEfvJ9dUhPOLsh4sRMaZLuqk6PMjfybtuji0mI39JFycknxS0k6bBepXn/4NW
 6Cc=
X-SBRS: 2.7
X-MesageID: 14735339
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,312,1580792400"; d="scan'208";a="14735339"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 27 Mar 2020 12:28:57 +0000
Message-ID: <20200327122901.11569-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200327122901.11569-1-andrew.cooper3@citrix.com>
References: <20200327122901.11569-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: [Xen-devel] [PATCH v2 3/7] x86/ucode/intel: Remove gratuitous
 memory allocations from cpu_request_microcode()
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

cpu_request_microcode() needs to scan its container and duplicate one blob,
but the get_next_ucode_from_buffer() helper duplicates every blob in turn.
Furthermore, the length checking is only safe from overflow in 64bit builds.

Delete get_next_ucode_from_buffer() and alter the purpose of the saved
variable to simply point somewhere in buf until we're ready to return.

This is only a modest reduction in absolute code size (-144), but avoids
making memory allocations for every blob in the container.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Rebase over struct microcode_patch re-work
 * Reinstate printk() for bad data
---
 xen/arch/x86/cpu/microcode/intel.c | 65 +++++++++++++++-----------------------
 1 file changed, 25 insertions(+), 40 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index 77539a00be..2b48959573 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -315,67 +315,52 @@ static int apply_microcode(const struct microcode_patch *patch)
     return 0;
 }
 
-static long get_next_ucode_from_buffer(struct microcode_intel **mc,
-                                       const uint8_t *buf, unsigned long size,
-                                       unsigned long offset)
-{
-    struct microcode_header_intel *mc_header;
-    unsigned long total_size;
-
-    /* No more data */
-    if ( offset >= size )
-        return 0;
-    mc_header = (struct microcode_header_intel *)(buf + offset);
-    total_size = get_totalsize(mc_header);
-
-    if ( (offset + total_size) > size )
-    {
-        printk(KERN_ERR "microcode: error! Bad data in microcode data file\n");
-        return -EINVAL;
-    }
-
-    *mc = xmemdup_bytes(mc_header, total_size);
-    if ( *mc == NULL )
-        return -ENOMEM;
-
-    return offset + total_size;
-}
-
 static struct microcode_patch *cpu_request_microcode(const void *buf,
                                                      size_t size)
 {
-    long offset = 0;
     int error = 0;
-    struct microcode_intel *mc, *saved = NULL;
+    const struct microcode_patch *saved = NULL;
     struct microcode_patch *patch = NULL;
 
-    while ( (offset = get_next_ucode_from_buffer(&mc, buf, size, offset)) > 0 )
+    while ( size )
     {
-        error = microcode_sanity_check(mc);
-        if ( error )
+        const struct microcode_patch *mc;
+        unsigned int blob_size;
+
+        if ( size < MC_HEADER_SIZE ||       /* Insufficient space for header? */
+             (mc = buf)->hdr.hdrver != 1 || /* Unrecognised header version?   */
+             mc->hdr.ldrver != 1 ||         /* Unrecognised loader version?   */
+             size < (blob_size =            /* Insufficient space for patch?  */
+                     get_totalsize(&mc->hdr)) )
         {
-            xfree(mc);
+            error = -EINVAL;
+            printk(XENLOG_WARNING "microcode: Bad data in container\n");
             break;
         }
 
+        error = microcode_sanity_check(mc);
+        if ( error )
+            break;
+
         /*
          * If the new update covers current CPU, compare updates and store the
          * one with higher revision.
          */
         if ( (microcode_update_match(mc) != MIS_UCODE) &&
              (!saved || (mc->hdr.rev > saved->hdr.rev)) )
-        {
-            xfree(saved);
             saved = mc;
-        }
-        else
-            xfree(mc);
+
+        buf  += blob_size;
+        size -= blob_size;
     }
-    if ( offset < 0 )
-        error = offset;
 
     if ( saved )
-        patch = saved;
+    {
+        patch = xmemdup_bytes(saved, get_totalsize(&saved->hdr));
+
+        if ( !patch )
+            error = -ENOMEM;
+    }
 
     if ( error && !patch )
         patch = ERR_PTR(error);
-- 
2.11.0


