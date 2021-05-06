Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4300375410
	for <lists+xen-devel@lfdr.de>; Thu,  6 May 2021 14:48:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123478.232919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ledQH-0003HK-GY; Thu, 06 May 2021 12:48:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123478.232919; Thu, 06 May 2021 12:48:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ledQH-0003EG-CP; Thu, 06 May 2021 12:48:09 +0000
Received: by outflank-mailman (input) for mailman id 123478;
 Thu, 06 May 2021 12:48:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9FTm=KB=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1ledQG-0003EA-0W
 for xen-devel@lists.xenproject.org; Thu, 06 May 2021 12:48:08 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 83dfbb23-4d24-459d-9618-a6c0e1de1eda;
 Thu, 06 May 2021 12:48:07 +0000 (UTC)
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
X-Inumbo-ID: 83dfbb23-4d24-459d-9618-a6c0e1de1eda
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620305287;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=W/QiWTX4D53Ih8gtoglcoiha9d5V6Smayp5mH/TvMyo=;
  b=AJnYQgoo6JJ51sJU7/8IjiA+rngLtdOAmrwa5MO/vIq/8AO/ZqH2fhz6
   zq7hpbuqeNFiYU17Vw1M9dBhErux8GpJALSNrOK8Ini7/FUH5GTmm5lLL
   MwiPUN5laEhwpMbFbYRUX9VRgWH0fyQLyCNHdTg9sQX2SexETmC3khTy/
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: k3dVrGYnbc1o0t+2TzrWEtJNgCDIeGscwqWazKQboJWKrTe8E7Rk7o6HWi2PBRas9dAOmmsdYL
 w4bGFe3aiwGqp6G8zz7RTfuiWjqZOHeRVRTfjVA/qTMG16THvhV9/ZhTm/IWBDhkX6Oe/6gEch
 m3amJfTGGbScSp4pW2VepvsqLXoiF37ai1U5NooTpgscw7SNp0DftS1acX6ykqqW9qeUfihH2B
 lC0XgrVhSTMbEseYKc7s3LbaEwGtTJ+brApNu8O/AZKiloU9YT/DEfUeeS/WwmR1sFJdYDKSm9
 StI=
X-SBRS: 5.1
X-MesageID: 43009711
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:B9TjFa86UBl7NJFjquxuk+DWI+orL9Y04lQ7vn2YSXRuE/Bw8P
 re+8jztCWE8Qr5N0tQ+uxoVJPufZq+z+8Q3WByB8bBYOCOggLBR+sOgbcKqweQfREWndQ86U
 4PScZD4aXLfD1Hsfo=
X-IronPort-AV: E=Sophos;i="5.82,277,1613451600"; 
   d="scan'208";a="43009711"
From: George Dunlap <george.dunlap@citrix.com>
To: <security@xenproject.org>
CC: <xen-devel@lists.xenproject.org>, George Dunlap
	<george.dunlap@citrix.com>, Jann Horn <jannh@google.com>, Jan Beulich
	<jbeulich@suse.com>
Subject: [PATCH v2] SUPPORT.md: Un-shimmed 32-bit PV guests are no longer supported
Date: Thu, 6 May 2021 13:47:52 +0100
Message-ID: <20210506124752.65844-1-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The support status of 32-bit guests doesn't seem particularly useful.

With it changed to fully unsupported outside of PV-shim, adjust the PV32
Kconfig default accordingly.

Reported-by: Jann Horn <jannh@google.com>
Signed-off-by: George Dunlap <george.dunlap@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2:
 - add in Kconfig from advisory, ported over c/s d23d792478d
---
 SUPPORT.md           | 9 +--------
 xen/arch/x86/Kconfig | 7 +++++--
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/SUPPORT.md b/SUPPORT.md
index d0d4fc6f4f..a29680e04c 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -86,14 +86,7 @@ No hardware requirements
 
     Status, x86_64: Supported
     Status, x86_32, shim: Supported
-    Status, x86_32, without shim: Supported, with caveats
-
-Due to architectural limitations,
-32-bit PV guests must be assumed to be able to read arbitrary host memory
-using speculative execution attacks.
-Advisories will continue to be issued
-for new vulnerabilities related to un-shimmed 32-bit PV guests
-enabling denial-of-service attacks or privilege escalation attacks.
+    Status, x86_32, without shim: Supported, not security supported
 
 ### x86/HVM
 
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index e55e029b79..9b164db641 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -55,7 +55,7 @@ config PV
 config PV32
 	bool "Support for 32bit PV guests"
 	depends on PV
-	default y
+	default PV_SHIM
 	select COMPAT
 	---help---
 	  The 32bit PV ABI uses Ring1, an area of the x86 architecture which
@@ -67,7 +67,10 @@ config PV32
 	  reduction, or performance reasons.  Backwards compatibility can be
 	  provided via the PV Shim mechanism.
 
-	  If unsure, say Y.
+	  Note that outside of PV Shim, 32-bit PV guests are not security
+	  supported anymore.
+
+	  If unsure, use the default setting.
 
 config PV_LINEAR_PT
        bool "Support for PV linear pagetables"
-- 
2.30.2


