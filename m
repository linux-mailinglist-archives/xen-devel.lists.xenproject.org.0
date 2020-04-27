Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA3C1BA379
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2020 14:21:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jT2jr-0003oI-TE; Mon, 27 Apr 2020 12:19:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=niBk=6L=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jT2jq-0003oD-Rc
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 12:19:54 +0000
X-Inumbo-ID: 65fdf948-8881-11ea-b9cf-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 65fdf948-8881-11ea-b9cf-bc764e2007e4;
 Mon, 27 Apr 2020 12:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587989993;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yhIT++WUz3JBK47J7vBNhG48F+SESFJvhU4bGq730OA=;
 b=J24wNcy44tGbVzvhEb4lfK+13sgckZwnvbAdN6acGYb7h4kYw5bnwwx6
 XxPEzSgKNEvsOup7iLXsTH2hlUYTBrHTlmIMQ+/mxb8iur+vvfoKMed/q
 dcCd+Ad0/WURHJtFAQ8q7T1ggIjM6nNm7WatTA8v6sxeiixEgUwfCSYmG o=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: xOs0uufsrCvCre/24xsB1/FOxtcsIWYMGDPxi555n/RyQHVagA8VMfgpcjxQXdnpcaewRpvK+t
 P8Iz7/3IAObkvMT4RAUN8bxumTb0aTBK4TydEBrGz82mLwo87adyHUSIlxhz5+k3QvoAI6eUhQ
 JD7YSSXEWTF6z+0/7YD8KS8nUq1aKEcP1R7g9vFm2rnFI2YaVdTWsaEmoMCLGPCgSS7fmh/LkG
 ywZTLgJX6sP8N0ufGOPabftEPwDmxK+fywGjmabNv51cRyqIKnK3i2TnipXB7XJjHFtV4AGjYV
 a0Y=
X-SBRS: 2.7
X-MesageID: 16697123
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,324,1583211600"; d="scan'208";a="16697123"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/pvh: Override opt_console_xen earlier
Date: Mon, 27 Apr 2020 13:19:44 +0100
Message-ID: <20200427121944.1443-1-andrew.cooper3@citrix.com>
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

This allows printk() to work from the start of day, and backtraces from as
early as the IDT is set up.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/boot/head.S | 3 +++
 xen/arch/x86/setup.c     | 5 -----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 153a53f250..150f7f90a2 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -402,6 +402,9 @@ __pvh_start:
 
         mov     %ebx, sym_esi(pvh_start_info_pa)
 
+        /* Force xen console.  Will revert to user choice in init code. */
+        movb    $-1, sym_esi(opt_console_xen)
+
         /* Prepare gdt and segments */
         add     %esi, sym_esi(gdt_boot_base)
         lgdt    sym_esi(gdt_boot_descr)
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 885919d5c3..eb56d78c2f 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -728,11 +728,6 @@ void __init noreturn __start_xen(unsigned long mbi_p)
 
     if ( pvh_boot )
     {
-        /*
-         * Force xen console to be enabled. We will reset it later in console
-         * initialisation code.
-         */
-        opt_console_xen = -1;
         ASSERT(mbi_p == 0);
         pvh_init(&mbi, &mod);
     }
-- 
2.11.0


