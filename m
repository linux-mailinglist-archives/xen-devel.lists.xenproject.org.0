Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 937A077FF3F
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 22:46:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585625.916782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWjrx-0001LM-7z; Thu, 17 Aug 2023 20:45:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585625.916782; Thu, 17 Aug 2023 20:45:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWjrx-0001Ik-58; Thu, 17 Aug 2023 20:45:25 +0000
Received: by outflank-mailman (input) for mailman id 585625;
 Thu, 17 Aug 2023 20:45:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E+2S=EC=citrix.com=prvs=586922e9e=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qWjrv-0001Id-DN
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 20:45:23 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa16f209-3d3e-11ee-9b0c-b553b5be7939;
 Thu, 17 Aug 2023 22:45:20 +0200 (CEST)
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
X-Inumbo-ID: fa16f209-3d3e-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692305120;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=D/jAkRt1KfcvpKAFpb9VU/UhXCXuaJgh+NGAJP3wVWI=;
  b=Jrx1i2ipZaioGY9y0RJ4veWs8rjBcTBGl9wMJg1w/Dczv6a/IxbvI2A0
   SAr4axtQVcBw9IROlRARe9JUt0vQcgkBAqOxw1ds+OlXTw2VWUJAoooF8
   /MNFVN/3osaU+wELS97u0VMuSU6cwqpxM2BlHj3UtUaLM39akE62NgAWA
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 118505682
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:15h1TqsOPUvj7Wx+MoWDdRdEW+fnVEpeMUV32f8akzHdYApBsoF/q
 tZmKTuHP6mLNmukeookPtiwp0IHvZXcz4IxTlRp+ShhFC0Q+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4Vv0gnRkPaoQ5A+HyCFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwJRFSQCuj186NmZmGSOowpdskCpbABdZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfA5NU/rSn8/x7pX7WxRepEiYuuwc5G/LwRYq+LPsLMDUapqBQsA9ckOw/
 zuWojykXEFAXDCZ4Sjb9FKHtsTkpHzQY7wuPeOFzNlEsULGkwT/DzVJDADm8JFVkHWWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8UYwgyQzqvf4y6CG3MJCDVGbbQOq8seVTEsk
 FiTkLvU6SdH6ePPDyjHr/HN8G30YHJORYMfWcMaZQYkvPfYgNEftUvkc9RgTI2qifuqMgill
 lhmsxMCr7kUiMcK0YCy8lbGny+gq/D1c+Il2unEdjn7t10kPeZJc6TtsAGGtqgYcO51W3Hb5
 BA5d96iAPfi5H1nvAiEW60zEb6g/J5p2xWM0Ac0T/HNG9lAkkNPnLy8AhkkdC+F0e5eI1cFh
 XM/XisIvPdu0IOCN/MfXm5II51CIVLcPdrkTOvISdFFf4J8cgSKlAk3Ox/KhTGyyBl1yv9hU
 Xt+TSpKJSxKYUiA5GDqL9rxLJdxnnxurY8tbcGTI+ubPUq2OyfOFOZt3KqmZeEl9qKUyDg5A
 P4GX/ZmPy53CbWkCgGOqN57ELz/BSRjbXwAg5ANJ7Hrz8sPMD1JNsI9Npt6J9E9wvkLyLqgE
 7PUchYw9WcTTEbvcW2iAk2Popu2NXqjhRrX5RARAGs=
IronPort-HdrOrdr: A9a23:DQetjqog3zIBrQvc1tAY68YaV5oneYIsimQD101hICG8cqSj+f
 xG+85rsiMc6QxhPE3I9urhBEDtex/hHP1OkOws1NWZLWrbUQKTRekIh+bfKlXbakvDH4VmtJ
 uIHZIQNDSJNykZsfrH
X-Talos-CUID: =?us-ascii?q?9a23=3Aml/7G2obtG4CX1nGJhgZPvrmUc0ELVPm7Cf8GBa?=
 =?us-ascii?q?TNGRqFJ6KTnnP05oxxg=3D=3D?=
X-Talos-MUID: 9a23:2abbtAul1bZLoxb19M2nlm9kFOxYyI+XV2s2r6kv5fS+EgJBJGLI
X-IronPort-AV: E=Sophos;i="6.01,180,1684814400"; 
   d="scan'208";a="118505682"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] rombios: Work around GCC issue 99578
Date: Thu, 17 Aug 2023 21:45:06 +0100
Message-ID: <20230817204506.34827-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

GCC 12 objects to pointers derived from a constant:

  util.c: In function 'find_rsdp':
  util.c:429:16: error: array subscript 0 is outside array bounds of 'uint16_t[0]' {aka 'short unsigned int[]'} [-Werror=array-bounds]
    429 |     ebda_seg = *(uint16_t *)ADDR_FROM_SEG_OFF(0x40, 0xe);
  cc1: all warnings being treated as errors

This is a GCC bug, but work around it rather than turning array-bounds
checking off generally.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

This only manifests in release builds, presumably a side effect of neediung
some constant-folding to notice the ADDR_FROM_SEG_OFF() expression.

We don't see this in CI because debug isn't configured correctly for the
tools/ part of the build
---
 tools/firmware/rombios/32bit/util.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/firmware/rombios/32bit/util.c b/tools/firmware/rombios/32bit/util.c
index 6c1c4805144b..a47e000a2629 100644
--- a/tools/firmware/rombios/32bit/util.c
+++ b/tools/firmware/rombios/32bit/util.c
@@ -424,10 +424,10 @@ static struct acpi_20_rsdp *__find_rsdp(const void *start, unsigned int len)
 struct acpi_20_rsdp *find_rsdp(void)
 {
     struct acpi_20_rsdp *rsdp;
-    uint16_t ebda_seg;
+    uint16_t *volatile /* GCC issue 99578 */ ebda_seg =
+        ADDR_FROM_SEG_OFF(0x40, 0xe);
 
-    ebda_seg = *(uint16_t *)ADDR_FROM_SEG_OFF(0x40, 0xe);
-    rsdp = __find_rsdp((void *)(ebda_seg << 16), 1024);
+    rsdp = __find_rsdp((void *)(*ebda_seg << 16), 1024);
     if (!rsdp)
         rsdp = __find_rsdp((void *)0xE0000, 0x20000);
 

base-commit: d0eabe3eaf0db5b78843095a2918d50961e99e96
-- 
2.30.2


