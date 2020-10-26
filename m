Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D12B32993BD
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 18:26:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12501.32574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX6Fr-0004Wa-Ot; Mon, 26 Oct 2020 17:25:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12501.32574; Mon, 26 Oct 2020 17:25:59 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX6Fr-0004Vh-KX; Mon, 26 Oct 2020 17:25:59 +0000
Received: by outflank-mailman (input) for mailman id 12501;
 Mon, 26 Oct 2020 17:25:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dsar=EB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kX6Fp-0004UI-R8
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 17:25:57 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ba839629-3739-46e5-9838-5a6827041efd;
 Mon, 26 Oct 2020 17:25:56 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Dsar=EB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kX6Fp-0004UI-R8
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 17:25:57 +0000
X-Inumbo-ID: ba839629-3739-46e5-9838-5a6827041efd
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ba839629-3739-46e5-9838-5a6827041efd;
	Mon, 26 Oct 2020 17:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603733156;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nO7Qr7V6r7ZHR8K0sMdn1GJ/DwtEeYhxjW4WWT4T3NU=;
  b=heZv7/3TLNmlMc2Pveatv6cAyO7ECJrenlRTBs0UuXo00kNAnQ6HJebA
   8iGaitDKMBCehtrJ10xvcTaRDsxXpLtbJCvH8OMo3xPr9r0bB5/+sLJyd
   FpY/0+zD23gKyQV9dKRUFg1HVJTRn0ewRkOgHwTIDtK02NSgdkRlOx0m0
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: lGVp5LQRwa7XhBUO7HSZMpI7+PjUyiPEgfU6FBq5AXzG3dTwVyujYJUgr0FBZTd/dBKNFBeJ2b
 NSe4YHuqS6BvwKY4aoXBiBuSaSNQtccJ/EAEHMpg9OQdxS1XYF6Pa3/PIoS/cuF2IiV7ugkLLU
 jkdVev3TaAlU6sPZpfGVXXZ8SsFiq35j3srlovjqsbJfPOuDA2KaiyZEPuf6XdiHSbOVykd3SZ
 yePPIoxUAr8I6m+Mu2u/YfuLZ/Q3Gj5J8DVbxpLJfkWkhhFa4eSH/imZ32/GnyQMGvA11aUSmb
 JSg=
X-SBRS: None
X-MesageID: 30138966
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,420,1596513600"; 
   d="scan'208";a="30138966"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Igor Druzhinin <igor.druzhinin@citrix.com>
Subject: [PATCH 3/3] x86/ucode: Introduce ucode=allow-same for testing purposes
Date: Mon, 26 Oct 2020 17:25:19 +0000
Message-ID: <20201026172519.17881-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201026172519.17881-1-andrew.cooper3@citrix.com>
References: <20201026172519.17881-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Many CPUs will actually reload microcode when offered the same version as
currently loaded.  This allows for easy testing of the late microcode loading
path.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Juergen Gross <jgross@suse.com>
CC: Igor Druzhinin <igor.druzhinin@citrix.com>

I was hoping to make this a runtime parameter, but I honestly can't figure out
the new HYPFS-only infrastructure is supposed to work.
---
 docs/misc/xen-command-line.pandoc    | 7 ++++++-
 xen/arch/x86/cpu/microcode/amd.c     | 3 +++
 xen/arch/x86/cpu/microcode/core.c    | 4 ++++
 xen/arch/x86/cpu/microcode/intel.c   | 3 +++
 xen/arch/x86/cpu/microcode/private.h | 2 ++
 5 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 4ae9391fcd..97b1cc67a4 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2216,7 +2216,7 @@ logic applies:
    active by default.
 
 ### ucode
-> `= List of [ <integer> | scan=<bool>, nmi=<bool> ]`
+> `= List of [ <integer> | scan=<bool>, nmi=<bool>, allow-same=<bool> ]`
 
     Applicability: x86
     Default: `nmi`
@@ -2248,6 +2248,11 @@ precedence over `scan`.
 stop_machine context. In NMI handler, even NMIs are blocked, which is
 considered safer. The default value is `true`.
 
+'allow-same' alters the default acceptance policy for new microcode to permit
+trying to reload the same version.  Many CPUs will actually reload microcode
+of the same version, and this allows for easily testing of the late microcode
+loading path.
+
 ### unrestricted_guest (Intel)
 > `= <boolean>`
 
diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index 7d2f57c4cb..5255028af7 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -174,6 +174,9 @@ static enum microcode_match_result compare_revisions(
     if ( new_rev > old_rev )
         return NEW_UCODE;
 
+    if ( opt_ucode_allow_same && new_rev == old_rev )
+        return NEW_UCODE;
+
     return OLD_UCODE;
 }
 
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 18ebc07b13..ac3ceb567c 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -95,6 +95,8 @@ static bool_t __initdata ucode_scan;
 /* By default, ucode loading is done in NMI handler */
 static bool ucode_in_nmi = true;
 
+bool __read_mostly opt_ucode_allow_same;
+
 /* Protected by microcode_mutex */
 static struct microcode_patch *microcode_cache;
 
@@ -121,6 +123,8 @@ static int __init parse_ucode(const char *s)
 
         if ( (val = parse_boolean("nmi", s, ss)) >= 0 )
             ucode_in_nmi = val;
+        else if ( (val = parse_boolean("allow-same", s, ss)) >= 0 )
+            opt_ucode_allow_same = val;
         else if ( !ucode_mod_forced ) /* Not forced by EFI */
         {
             if ( (val = parse_boolean("scan", s, ss)) >= 0 )
diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index 5fa2821cdb..f6d01490e0 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -232,6 +232,9 @@ static enum microcode_match_result compare_revisions(
     if ( new_rev > old_rev )
         return NEW_UCODE;
 
+    if ( opt_ucode_allow_same && new_rev == old_rev )
+        return NEW_UCODE;
+
     /*
      * Treat pre-production as always applicable - anyone using pre-production
      * microcode knows what they are doing, and can keep any resulting pieces.
diff --git a/xen/arch/x86/cpu/microcode/private.h b/xen/arch/x86/cpu/microcode/private.h
index 9a15cdc879..c085a10268 100644
--- a/xen/arch/x86/cpu/microcode/private.h
+++ b/xen/arch/x86/cpu/microcode/private.h
@@ -3,6 +3,8 @@
 
 #include <asm/microcode.h>
 
+extern bool opt_ucode_allow_same;
+
 enum microcode_match_result {
     OLD_UCODE, /* signature matched, but revision id is older or equal */
     NEW_UCODE, /* signature matched, but revision id is newer */
-- 
2.11.0


