Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8DE65F565
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 21:49:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472152.732297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDXAV-0006Y6-2t; Thu, 05 Jan 2023 20:48:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472152.732297; Thu, 05 Jan 2023 20:48:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDXAV-0006VM-04; Thu, 05 Jan 2023 20:48:55 +0000
Received: by outflank-mailman (input) for mailman id 472152;
 Thu, 05 Jan 2023 20:48:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u+KT=5C=citrix.com=prvs=36272ec6f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pDXAT-0006VG-A6
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 20:48:53 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b9bb47e-8d3a-11ed-91b6-6bf2151ebd3b;
 Thu, 05 Jan 2023 21:48:51 +0100 (CET)
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
X-Inumbo-ID: 5b9bb47e-8d3a-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672951731;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=r4XtkTJHtLTXCBT8B4UdVIsiYW9W6Ow00fDClOE0Tyg=;
  b=LLLDGAPuzRYRBI6AaNBbPV42exrE68jVXs3YtyEGWSu3kY8LPX51E2lP
   NEH5dvFNrE4YLrqX4t/YkvfOknXuUeqxelDYnqed2w/aY1QByBBvIjzYo
   JoJOy9T/56wemgKhKAD9MUP4TjoZVYRUM8Wl6C07QDAAwMkvTjAWWs9tV
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 93855203
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:V20rZ6kmwjj9cq3e9eJzEV/o5gxLJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJNDT3XPfrbZzSjKtAlOdywp0xQvJPWmNVrSwA6pX1mESMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aqaVA8w5ARkPqgS5AKGzBH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 d4DEgEIcgCAu8eryfWaa+1Ktsd+N/C+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsfYT/7C7pn9AusrlD5fydVtxS+oq0v7nKI5AdwzKLsIJzefdniqcB9zx3I+
 z+cpz+R7hcyGf3A52SH6lyQpLWfk2TiXaM1DriJz6s/6LGU7jNKU0BHPbehmtGmjmauVtQZL
 FYbkgIrpLI3/VamTfH8WQO5u3+OuhMAW9tWHPY+4QvLwa3Riy6VC20FZj9Hdt09tcUySCAq1
 1mGhNfgD3pkt7j9YWKQ8PKYoC2/PQARLHQefmkUQA0d+d7hrYovyBXVQb5LMoS4k9n0EjHY2
 C2RoW41gLB7sCIQ//zlpxad2Wvq/8WXCF5ujunKYo67xiFiXr+ge5yr1X3G5LFhDYK/flrcp
 0FRzqBy89syJZ2KkSWMRsAEE7eo++uJPVXgvLJ/I3Uy32/zoiD+JOi89Bk7fR40aZhcJVcFd
 WeJ4WtsCIlv0GxGhEOdS6a4EIwUwKfpDrwJvdiEP4MVMvCdmOJqlRyChHJ8PUi3yyDAcollY
 /93lPpA6l5EYZmLNBLsG48gPUYDn0jSP1/7S5Hh1AiA2rGDfnOTQrptGALQMbposPjZ8FSJo
 oc32y62J/N3Cr2Wjs7/qNd7ELz3BSJjWcCeRzJ/LIZv3TaK6El+UqSMkNvNiqRunrhPl/egw
 0xRrnRwkQKl7VWecFXiV5yWQO+3NXqJhS5hbHNE0JfB8yRLXLtDG49FJsdvLeJ3qrY8pRO2J
 tFcE/i97j10Ymyv01wggVPV9eSOqDzDadqyAheY
IronPort-HdrOrdr: A9a23:5lCdTqEnYyuT4xgkpLqE7MeALOsnbusQ8zAXPiFKJSC9F/byqy
 nAppsmPHPP5gr5OktBpTnwAsi9qBrnnPYejLX5Vo3SPzUO1lHYSL1K3M/PxCDhBj271sM179
 YGT0GmMqyTMbGtt7ee3DWF
X-IronPort-AV: E=Sophos;i="5.96,303,1665460800"; 
   d="scan'208";a="93855203"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Demi Marie Obenour
	<demi@invisiblethingslab.com>
Subject: [PATCH] x86/S3: Restore Xen's MSR_PAT value on S3 resume
Date: Thu, 5 Jan 2023 20:48:39 +0000
Message-ID: <20230105204839.3676-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

There are two paths in the trampoline, and Xen's PAT needs setting up in both,
not just the boot path.

Fixes: 4304ff420e51 ("x86/S3: Drop {save,restore}_rest_processor_state() completely")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Demi Marie Obenour <demi@invisiblethingslab.com>

Entirely untested, but this a fairly embarassing mistake in hindsight.
---
 xen/arch/x86/boot/wakeup.S | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/arch/x86/boot/wakeup.S b/xen/arch/x86/boot/wakeup.S
index c17d613b61ff..08447e193496 100644
--- a/xen/arch/x86/boot/wakeup.S
+++ b/xen/arch/x86/boot/wakeup.S
@@ -130,6 +130,11 @@ wakeup_32:
         and     %edi, %edx
         wrmsr
 1:
+        /* Set up PAT before enabling paging. */
+        mov     $XEN_MSR_PAT & 0xffffffff, %eax
+        mov     $XEN_MSR_PAT >> 32, %edx
+        mov     $MSR_IA32_CR_PAT, %ecx
+        wrmsr
 
         /* Set up EFER (Extended Feature Enable Register). */
         movl    $MSR_EFER,%ecx
-- 
2.11.0


