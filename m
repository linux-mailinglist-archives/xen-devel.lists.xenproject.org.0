Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF367F373F
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 21:27:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638208.994552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5XKW-00037I-Ew; Tue, 21 Nov 2023 20:26:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638208.994552; Tue, 21 Nov 2023 20:26:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5XKW-00035d-CH; Tue, 21 Nov 2023 20:26:44 +0000
Received: by outflank-mailman (input) for mailman id 638208;
 Tue, 21 Nov 2023 20:26:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T8a9=HC=citrix.com=prvs=682c61bdb=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1r5XA8-0006aW-D0
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 20:16:00 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8f4c279-88aa-11ee-98e1-6d05b1d4d9a1;
 Tue, 21 Nov 2023 21:15:59 +0100 (CET)
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
X-Inumbo-ID: c8f4c279-88aa-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1700597759;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=h72RGL0wBeTp69VGUdWNFI72/Va5/mOVad612sj0U0Y=;
  b=UXLJgQO4VsJYfcf8NLXV7gwqw3mFiLVsbWJHJqscvaRiuQNnpB3RK3lm
   gjNCQMBElgAI/sVfwOH4IJ05ZSMcWLUSiJvREotZcPaqNn4TRS0tP47kZ
   VEmwkTdiNCpvwBDnZaemk55ZsBLl7mnbm0HxMz8jTiJmX8AlRC3a5liAc
   8=;
X-CSE-ConnectionGUID: BxdPn14FSKGZsTscOECGPg==
X-CSE-MsgGUID: KCcTuWliSAmd0KYlcd8jzQ==
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 127464604
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:2DIThqqwhsqCBxbA7XebtHi81kNeBmL+ZRIvgKrLsJaIsI4StFCzt
 garIBmFPPjbYDbxf4hzad6+8U0FupLTy9JgHVNvpCpmEiwb95uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbOCYmYpA1Y8FE/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04G9wUmAWP6gR5waHzSBNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXABodYiiF3r6Y+5GUePJQnc8EAeLEBIxK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSaxFIUPrSn8/x7pX7WxRepEiYuuwc5G/LwRYq+LPsLMDUapqBQsA9ckOw/
 ziZozqlXElGXDCZ4Rmu+U6xuevOpgr+VNoxJbmz+q5okmTGkwT/DzVJDADm8JFVkHWWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8UYwgyQzqvf4y6CG3MJCDVGbbQOr9QqTDYn0
 luImdLBBjF1trCRD3WH+d+8sjeaKSUTa2gYakcsTxYB4tTliJE+iFTIVNkLOJCyitr5CDTh2
 QegpSI1h6gQpcMT3qD99lfC6xqmq4LVVAcz6kPSV3i88wJiTIe/Ysqj7l2zxexHJouDUl7Ht
 nELncGE5cgEEJ6WmSqCBu4KGdmB4feONznVx0BiA4Mg8TWF8WOsZo1W73d1I0IBDyofUWa3O
 gmJ41oXvcICeiTyBUNqX26vI+46wZDmTIjLbdP7XMFyeZNWWSSoxC47MCZ8wFvRfFgQfbAXY
 MjDKZv8VytFWcxaICyKq/DxOILHJxzSJkuJHPgXNzz9jdKjiIe9EN/pymemYOEj97+jqw7I6
 dtZPMbi40wACLWjM3CJrN5KdAxiwZ0H6Xbe8ZQ/mgmre1oOJY3cI6WJneNJl3JNw8y5adskD
 lniAxQFmTITdFXMKBmQa2ALVV8cdc8XkJ7PBgR1ZQzA8yF6Me6SAFI3K8NfkU8PqLYykpaZj
 pAtJ629Pxi4Ym2eoGxENcmk8dAKmdbCrVvmAhdJqQMXJ/ZILzElMPe9Fucz3EHi1haKiPY=
IronPort-HdrOrdr: A9a23:KdwwAKtt6CL7MDSRsPcG2+mE7skCQYMji2hC6mlwRA09TyXPrb
 HgoB19726DtN9xYgBWpTnkAtj7fZqyz+8K3WAuB8baYOCLghrYEGlNhbGSpAEIMReOlNK07M
 9bAsxD4DeZNykdsS+C2njcLz9D+qj0zEnYv5ar8543d3ATV0gI1W4QYWv2fSMWJDWuY6BJZK
 Z0yfA32AZIEk5nG/hTaEN1LNQrjue72q4PoHY9dn0awTjLozO0zbbwVyGZxxsaUzRChZcumF
 K12TDR1+GMs+yfwhSZ7m/L45FXn9ek8ddNbfb8x/Q9G3HDihuMbI8kYr2asDU0p+3q0ksjjc
 XXyi1Qc/hb2jf+fnyRqRCo4hLn0zol9hbZuBalqEqmj8zlYTowT/Nbg4FUeAacy0dIhqA17I
 t7m0yYqr9eBlf4hyL/69LUEyhji0vcmwtorccjy1xZTY8UbvtwgOUkjTho+N9pJlOG1GhseN
 MecP301bJxbU6UanjfvC1KyNyoWnw1dy3tfnQ/
X-Talos-CUID: =?us-ascii?q?9a23=3AcfEDrGssQNguq/RYovAvZDMy6IsPYnHlyi6MDXS?=
 =?us-ascii?q?bJlRydKaebnK715trxp8=3D?=
X-Talos-MUID: 9a23:ZBJCTwhp+fBEYwUQ+LWh2sMpF+xj37mRDEE2uJAK4+q1MSd8azWPtWHi
X-IronPort-AV: E=Sophos;i="6.04,216,1695700800"; 
   d="scan'208";a="127464604"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Roberto Bagnara <roberto.bagnara@bugseng.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>
Subject: [PATCH v2 4/5] arm/efi: Simplify efi_arch_handle_cmdline()
Date: Tue, 21 Nov 2023 20:15:39 +0000
Message-ID: <20231121201540.1528161-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231121201540.1528161-1-andrew.cooper3@citrix.com>
References: <20231121201540.1528161-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

-Wwrite-strings is unhappy with assigning "xen" to a mutable pointer, but this
logic looks incorrect.  It was inherited from the x86 side, where the logic
was redundant and has now been removed.

In the ARM case it inserts the image name into "xen,xen-bootargs" and there is
no logic at all to strip this before parsing it as the command line.

The absence of any logic to strip an image name suggests that it shouldn't
exist there, or having a Xen image named e.g. "hmp-unsafe" in the filesystem
is going to lead to some unexpected behaviour on boot.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>

v2:
 * New.

I'm afraid that all of this reasoning is based on reading the source code.  I
don't have any way to try this out in a real ARM UEFI environment.
---
 xen/arch/arm/efi/efi-boot.h | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index 1c3640bb65fd..59d217667ff3 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -461,7 +461,7 @@ static void __init efi_arch_handle_cmdline(CHAR16 *image_name,
     union string name;
     char *buf;
     EFI_STATUS status;
-    int prop_len;
+    int prop_len = 0;
     int chosen;
 
     /* locate chosen node, which is where we add Xen module info. */
@@ -473,20 +473,6 @@ static void __init efi_arch_handle_cmdline(CHAR16 *image_name,
     if ( EFI_ERROR(status) )
         PrintErrMesg(L"Unable to allocate string buffer", status);
 
-    if ( image_name )
-    {
-        name.w = image_name;
-        w2s(&name);
-    }
-    else
-        name.s = "xen";
-
-    prop_len = 0;
-    prop_len += snprintf(buf + prop_len,
-                           EFI_PAGE_SIZE - prop_len, "%s", name.s);
-    if ( prop_len >= EFI_PAGE_SIZE )
-        blexit(L"FDT string overflow");
-
     if ( cfgfile_options )
     {
         PrintMessage(L"Using bootargs from Xen configuration file.");
-- 
2.30.2


