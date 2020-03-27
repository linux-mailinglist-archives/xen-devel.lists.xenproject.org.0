Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D47841956B9
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 13:06:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHneq-00045j-VH; Fri, 27 Mar 2020 12:00:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o0RR=5M=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jHneq-00045c-0e
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 12:00:16 +0000
X-Inumbo-ID: 84b13a8e-7022-11ea-bec1-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 84b13a8e-7022-11ea-bec1-bc764e2007e4;
 Fri, 27 Mar 2020 12:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585310415;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3zecb8UoruLe8k6oyCnLslUZVMBeRnsGfcpGFmS7ae8=;
 b=frhPV5cmRJV7eKvrF3ZvB201jdDUzP9jH8uHCTBJ4PFc5AHPJsEMCUeh
 6BmFaYnDAStbpk7XEnj1JWniz/5IQrwzk8IxjaUihw3Yrw+m2y62KJfhB
 KNiLVa/J0wrcbzBJ1obCrzJc+O194Dq4W2GYSrYQXlXVnXw12bdoIFPiO c=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: gOaZ1B9JaOf4Idtxp/61dibrx+4rGRfd8L8B5lholzDUL4A73IjfJleIulm+PktCXsixxMd63H
 nE211xXvAYa+GK5+CmMQaReSSAPKLFo32UkBB4FBYxR1rDGjs9tITUUQSJFR7gVKmBMqWb0hIg
 M4P6jVkJtCSyuKf5OQJ5OVheYuqbXpbI6EVX3j9mF1CEFQpORAd41PVN/CeVbEQmd5R1KTW51o
 D8JfLWQMUq84+LuwnLeOLrqDoipZA3yW/eQBwhwWZ3oN9fan2DT8ZF27oEV+ba58gyBC5k+0HN
 8T8=
X-SBRS: 2.7
X-MesageID: 14963276
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,312,1580792400"; d="scan'208";a="14963276"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 27 Mar 2020 11:59:49 +0000
Message-ID: <20200327115949.18611-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: [Xen-devel] [PATCH] x86/ucode/amd: Fix buffer overrun with equiv
 table handling
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

find_equiv_cpu_id() loops until it finds a 0 installed_cpu entry.  Well formed
AMD microcode containers have this property.

Extend the checking in install_equiv_cpu_table() to reject tables which don't
have a sentinal at the end.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>

All of this logic needs rewriting, but this is the minimally invasive version
for backport.
---
 xen/arch/x86/cpu/microcode/amd.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index b8b83d248d..9fe1a3c941 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -310,6 +310,7 @@ static int install_equiv_cpu_table(
     size_t *offset)
 {
     const struct mpbhdr *mpbuf = data + *offset + 4;
+    const struct equiv_cpu_entry *eq;
 
     *offset += mpbuf->len + CONT_HDR_SIZE;	/* add header length */
 
@@ -319,7 +320,9 @@ static int install_equiv_cpu_table(
         return -EINVAL;
     }
 
-    if ( mpbuf->len == 0 )
+    if ( mpbuf->len == 0 || mpbuf->len % sizeof(*eq) ||
+         (eq = (const void *)mpbuf->data,
+          eq[(mpbuf->len / sizeof(*eq)) - 1].installed_cpu) )
     {
         printk(KERN_ERR "microcode: Wrong microcode equivalent cpu table length\n");
         return -EINVAL;
-- 
2.11.0


