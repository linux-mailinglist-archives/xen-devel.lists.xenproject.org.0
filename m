Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 466C8306470
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 20:50:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76379.137798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4qon-0004ad-BR; Wed, 27 Jan 2021 19:49:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76379.137798; Wed, 27 Jan 2021 19:49:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4qon-0004aE-88; Wed, 27 Jan 2021 19:49:33 +0000
Received: by outflank-mailman (input) for mailman id 76379;
 Wed, 27 Jan 2021 19:49:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=csCD=G6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l4qol-0004a4-CW
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 19:49:31 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c0ecc852-4534-45cc-a014-3c442b1883ec;
 Wed, 27 Jan 2021 19:49:30 +0000 (UTC)
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
X-Inumbo-ID: c0ecc852-4534-45cc-a014-3c442b1883ec
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611776969;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HE6CYo1rULtA/zqqNnXd6bBpST+UgXMlh3bvVsRO67M=;
  b=hGkAMJvc4nxafRMDza03aZJCxzTJQURv00/FbQrGPnXD8baN4wDYBwbO
   SzogCXRmK4+xcvfagd1OgVX/P+bJjYSMKIghqFllTHnVr937J6h6vhBVs
   XWxJswnUcwwQecRjOlMU7ifzDgaO45n8TYyMkcc+zLUXBPqEtZ6GubLjP
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: SsovgsDCPNMSz8lYc36OPvT67G73rZPaghLLiRvDP6zU+YbLMlDy7eHdaoCax5Z1HYuPT5SbQp
 xlD4U8Ruj9PUMEmQP/HzOumoB9VoPRrkPthwhmcz0nDHZR0hQZJm3KWIRzyC6e00NCTRK4cUiz
 pnBpPoRTnYmEmOOgf1iOPYuXWX/0oPeFFNKS56Fk2jNu4I9m2021KddTducDF/GQ2SlyFZmB12
 0JF1lDs/s0CrkRuZEsNXRbsSEyjXrdCvk3n89TLZZFivVkbpRXt4qNrTYGfXzAPcjSwQfIp7hQ
 KGw=
X-SBRS: 5.2
X-MesageID: 35995632
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,380,1602561600"; 
   d="scan'208";a="35995632"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>
Subject: [PATCH for-4.15] x86/boot: Drop 'noapic' suggestion from check_timer()
Date: Wed, 27 Jan 2021 19:49:04 +0000
Message-ID: <20210127194904.9922-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

In practice, there is no such thing as a real 64bit system without
APICs.  (PVH style virtual environments, sure, but they don't end up here).

The suggestion to try and use noapic only makes a bad situation worse.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Ian Jackson <iwj@xenproject.org>

I wanted to have enough time to drop all of the pre-APIC infrastructure, but
that is a massive can of decades-old-worms.  For 4.15, suffice just to to
prevent misleading users more than necessary.
---
 xen/arch/x86/io_apic.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index e66fa99ec7..e93265f379 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -1994,8 +1994,7 @@ static void __init check_timer(void)
         return;
     }
     printk(" failed :(.\n");
-    panic("IO-APIC + timer doesn't work!  Boot with apic_verbosity=debug "
-          "and send a report.  Then try booting with the 'noapic' option\n");
+    panic("IO-APIC + timer doesn't work!  Boot with apic_verbosity=debug and send a report\n");
 }
 
 /*
-- 
2.11.0


