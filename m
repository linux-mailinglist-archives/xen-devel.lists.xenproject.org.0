Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 717BD6C1F77
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 19:21:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512062.791674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peK80-000391-Rr; Mon, 20 Mar 2023 18:21:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512062.791674; Mon, 20 Mar 2023 18:21:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peK80-00036T-O4; Mon, 20 Mar 2023 18:21:04 +0000
Received: by outflank-mailman (input) for mailman id 512062;
 Mon, 20 Mar 2023 18:21:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xqGy=7M=citrix.com=prvs=436e66757=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1peK7y-000367-Mh
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 18:21:02 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f52cc2e3-c74b-11ed-b464-930f4c7d94ae;
 Mon, 20 Mar 2023 19:20:59 +0100 (CET)
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
X-Inumbo-ID: f52cc2e3-c74b-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679336459;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ewB48VVVTqCfeKXnvd51+6AIJ1OC9YPhA6YX0qasxSI=;
  b=JTljJy2VeVa7GIpnDpSMgwFp4l7Zcwvc5rpwrNHeVugOaR/TZLfxjUJR
   A9WHK6srMRxL0vLNAQ0BPYzWO3GGkLEw578+4i6dXCjeDZMoESlzsJolD
   nhtb/i8/cHFD6P0g21avUGchpmaeMW9k3Y1fj68T+db5CTWS12AZeXVfX
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 102000891
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:s0hAPq6EESZUaL0TGCG1tgxRtFbHchMFZxGqfqrLsTDasY5as4F+v
 jMfUT+HM/uONzDyKNlyaI6wpEgB6J7Xy4BrGQBl/nxnHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7JwehBtC5gZlPasR5AeH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m6
 +YkNWAVfgy6hv/u/emLWO51gNZyFZy+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrlD5fydVtxS+oq0v7nKI5AdwzKLsIJzefdniqcB9xx7C/
 jqerzWgav0cHP3ClQOc8FyLvL7SmA/0RNwDG5qo1PE/1TV/wURMUUZLBDNXu8KRlUqWS99Zb
 UsO9UIGrqUs9UrtUtj0WTW5pmKJulgXXN84O/037kSBx7TZ5y6dB3MYVXhRZdo+rsg0SDc2k
 FiTkLvBJxZirbmUQnK17aqPoHW5Pi19EIMZTXZaF01fuYCl+dxtyEuVFb6PDZJZkPXrAw3tk
 yiasBE/mu0u1v4Z0Ly97wH+1mfESofycuIl2unGdjv7sVIhPtP9ONzABUvztqgZctvAJrWVl
 D1dwpXFsrhTZX2YvHbVKNjhCo1F8Bps3Nf0pVd0V6cs+D22k5JIVdABuWouTKuF3yttRNMIX
 KMwkVkLjHOrFCH2BZKbmb5d9uxwlfSwfTgaahwkRoUXOcUgHON21CpveVSRzwjQraTYqolmY
 c3zWZ/1XR4n5VFPkGLeb/0DyoUi2i1W7TqVHfgXOTz7i+vBDJNUIJ9ZWGazghcRtf3U+VqJq
 I0BbKNnCXx3CYXDX8UeyqZLRXhiEJTxLcqeRxB/HgJbHjdbJQ==
IronPort-HdrOrdr: A9a23:4F9A+aFzr2eqgFxPpLqEOceALOsnbusQ8zAXPidKOH5om62j5q
 OTdZEgvnXJYVkqNU3I5urwX5VoLUmxyXcX2+ks1NWZMjUO0VHARL2KhrGC/9SPIULDH+dmpM
 FdWrk7ANniSUJ8l4L/7BOjG9gthNmLmZrY4Nv23jNkSRIvcaZ7qx1kARyQCU1uWQlBAt4wD5
 303Lsimwad
X-IronPort-AV: E=Sophos;i="5.98,276,1673931600"; 
   d="scan'208";a="102000891"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Kevin Tian
	<kevin.tian@intel.com>
Subject: [PATCH] x86/vmx: Provide named fields for IO exit qualification
Date: Mon, 20 Mar 2023 18:20:52 +0000
Message-ID: <20230320182052.1831486-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This removes most of the opencoded bit logic on the exit qualification.
Unfortunately, size is 1-based not 0-based, so need adjusting in a separate
variable.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Kevin Tian <kevin.tian@intel.com>
---
 xen/arch/x86/hvm/vmx/vmx.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 00b531f76cbf..a96c601efded 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -4560,23 +4560,37 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
         break;
 
     case EXIT_REASON_IO_INSTRUCTION:
-        __vmread(EXIT_QUALIFICATION, &exit_qualification);
-        if ( exit_qualification & 0x10 )
+    {
+        union {
+            unsigned long raw;
+            struct {
+                uint32_t size:3;
+                bool     in:1;
+                bool     str:1;
+                bool     rep:1;
+                bool     imm:1;
+                uint32_t :9;
+                uint16_t port;
+            };
+        } io_qual;
+        unsigned int bytes;
+
+        __vmread(EXIT_QUALIFICATION, &io_qual.raw);
+        bytes = io_qual.size + 1;
+
+        if ( io_qual.str )
         {
-            /* INS, OUTS */
             if ( !hvm_emulate_one_insn(x86_insn_is_portio, "port I/O") )
                 hvm_inject_hw_exception(TRAP_gp_fault, 0);
         }
         else
         {
-            /* IN, OUT */
-            uint16_t port = (exit_qualification >> 16) & 0xFFFF;
-            int bytes = (exit_qualification & 0x07) + 1;
-            int dir = (exit_qualification & 0x08) ? IOREQ_READ : IOREQ_WRITE;
-            if ( handle_pio(port, bytes, dir) )
+            if ( handle_pio(io_qual.port, bytes,
+                            io_qual.in ? IOREQ_READ : IOREQ_WRITE) )
                 update_guest_eip(); /* Safe: IN, OUT */
         }
         break;
+    }
 
     case EXIT_REASON_INVD:
     case EXIT_REASON_WBINVD:
-- 
2.30.2


