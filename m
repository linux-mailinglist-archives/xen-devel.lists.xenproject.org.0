Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B0B2184BB
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jul 2020 12:15:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jt76a-00089G-1Y; Wed, 08 Jul 2020 10:15:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ybAq=AT=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jt76Z-00089B-3U
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2020 10:15:07 +0000
X-Inumbo-ID: e43f418a-c103-11ea-8496-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e43f418a-c103-11ea-8496-bc764e2007e4;
 Wed, 08 Jul 2020 10:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594203305;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EqX5HsGWso4KEfZeIdFy2NtZiVaj6fAO0QiUvpxlhqQ=;
 b=YDBXX74yMRQfUykzNOh5LD4LkRS71jzXltqrU8ztDNuxCXtfdG9npnaQ
 76fmhsn2Lqv3Pi1GB8VoP5lq3qFP5ybTGGHA9YRUaD4D2wcAdHQ7g1onE
 WQ7EPluyGyyyPDyIEPFNocLnitazRBEIX6ZyHaKP0JY0oNTkte5dD/lIY I=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: eWb59Zf8b6Y/+7ppjFxVF2PriIQvxQ2UMzTIrLTPf5WxgJm4zySowcz+WUflV3Mzqd2a5nH/e/
 WRtFQc9VSGIybmU1pFzJ5iNyFwSwpQo3N197/exom9v1gnNAnHbrC2VMIzdlSk76zghvWbDJfJ
 LCVhJmR/hnBDI46D3YwRCSzMYoB3hPVxiJfZvlifFRWgYYkLI8ezRnZIciLtgjJgdhzs5deupg
 8z42rSrOAl5BYaEncnpJpyC2nOWJsQnnBS4Jfo7HUpund+vWOLNQFrBiH4/zsz68rGwNVx/qbv
 1hU=
X-SBRS: 2.7
X-MesageID: 22174640
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,327,1589256000"; d="scan'208";a="22174640"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/mtrr: Drop workaround for old 32bit CPUs
Date: Wed, 8 Jul 2020 11:14:43 +0100
Message-ID: <20200708101443.27321-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
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

This logic is dead as Xen is 64bit-only these days.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/mtrr/generic.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/xen/arch/x86/cpu/mtrr/generic.c b/xen/arch/x86/cpu/mtrr/generic.c
index 89634f918f..06fa0c0420 100644
--- a/xen/arch/x86/cpu/mtrr/generic.c
+++ b/xen/arch/x86/cpu/mtrr/generic.c
@@ -570,23 +570,6 @@ int generic_validate_add_page(unsigned long base, unsigned long size, unsigned i
 {
 	unsigned long lbase, last;
 
-	/*  For Intel PPro stepping <= 7, must be 4 MiB aligned 
-	    and not touch 0x70000000->0x7003FFFF */
-	if (is_cpu(INTEL) && boot_cpu_data.x86 == 6 &&
-	    boot_cpu_data.x86_model == 1 &&
-	    boot_cpu_data.x86_mask <= 7) {
-		if (base & ((1 << (22 - PAGE_SHIFT)) - 1)) {
-			printk(KERN_WARNING "mtrr: base(%#lx000) is not 4 MiB aligned\n", base);
-			return -EINVAL;
-		}
-		if (!(base + size < 0x70000 || base > 0x7003F) &&
-		    (type == MTRR_TYPE_WRCOMB
-		     || type == MTRR_TYPE_WRBACK)) {
-			printk(KERN_WARNING "mtrr: writable mtrr between 0x70000000 and 0x7003FFFF may hang the CPU.\n");
-			return -EINVAL;
-		}
-	}
-
 	/*  Check upper bits of base and last are equal and lower bits are 0
 	    for base and 1 for last  */
 	last = base + size - 1;
-- 
2.11.0


