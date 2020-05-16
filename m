Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D571E1D63B6
	for <lists+xen-devel@lfdr.de>; Sat, 16 May 2020 21:04:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ja24q-0004zT-9f; Sat, 16 May 2020 19:02:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H74w=66=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ja24p-0004zO-JX
 for xen-devel@lists.xenproject.org; Sat, 16 May 2020 19:02:27 +0000
X-Inumbo-ID: c83f51b2-97a7-11ea-a6f8-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c83f51b2-97a7-11ea-a6f8-12813bfff9fa;
 Sat, 16 May 2020 19:02:27 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: GVkynst+cvXN7JmYxKUw0wzgjon4EQJhl7SNg2qSyhvX70uvy0IAA4Kk3pM3YGTjihGQMCxt4H
 eHBh9s3M+R+23UgGJ+1DMiRlhzCS1sIqeZWGrl5T9WU9EEjzGRbbbPB6aYFjv0dcJwtmr/lShz
 aBi+n9AMma00cEQQkisy+MnfjifUmaIQ3yQSZW2HwsT/W9lqCFKw2FvpPNehW5P9P4gB1/AZwP
 n5pQAfQcvwM8sEWXk0b7pKJFeUGHAwFYfpuWF3SskIX5XXl/26ZjZZCGs4o06Kwbv4horo+KUn
 HUc=
X-SBRS: None
X-MesageID: 17735596
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,400,1583211600"; d="scan'208";a="17735596"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/hvm: Fix shifting in stdvga_mem_read()
Date: Sat, 16 May 2020 20:02:11 +0100
Message-ID: <20200516190211.4120-1-andrew.cooper3@citrix.com>
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

stdvga_mem_read() has a return type of uint8_t, which promotes to int rather
than unsigned int.  Shifting by 24 may hit the sign bit.

Spotted by Coverity.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/stdvga.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/stdvga.c b/xen/arch/x86/hvm/stdvga.c
index bd398dbb1b..e2675139e7 100644
--- a/xen/arch/x86/hvm/stdvga.c
+++ b/xen/arch/x86/hvm/stdvga.c
@@ -322,7 +322,7 @@ static int stdvga_mem_read(const struct hvm_io_handler *handler,
         data = stdvga_mem_readb(addr);
         data |= stdvga_mem_readb(addr + 1) << 8;
         data |= stdvga_mem_readb(addr + 2) << 16;
-        data |= stdvga_mem_readb(addr + 3) << 24;
+        data |= (uint32_t)stdvga_mem_readb(addr + 3) << 24;
         break;
 
     case 8:
-- 
2.11.0


