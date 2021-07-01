Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 316B03B92F3
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 16:11:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148718.274931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxP9-00021c-Mv; Thu, 01 Jul 2021 14:10:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148718.274931; Thu, 01 Jul 2021 14:10:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxP9-0001xE-HV; Thu, 01 Jul 2021 14:10:59 +0000
Received: by outflank-mailman (input) for mailman id 148718;
 Thu, 01 Jul 2021 14:10:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXwC=LZ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lyxP7-0005F9-Jw
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 14:10:57 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1916428c-da76-11eb-8327-12813bfff9fa;
 Thu, 01 Jul 2021 14:10:33 +0000 (UTC)
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
X-Inumbo-ID: 1916428c-da76-11eb-8327-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625148633;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+mNOgsYjrFmWoNxBPJggXZS7DoTw6+WYH4Z2rQexo4M=;
  b=BvH0y00sbPb2wB7+eBju3BUjPhtXsz16o6bbZ1Crzt+2rd4ya9512AiR
   rAkvqhCK3T0A/hNYo2N0rUwhAWVSQ4kSxi6wXg0wftkN61YYQ6cmPxgCn
   DTIHjbIAsmdpPK3XoyUZ8N1CT2OG6+rCjDQ6nmYYvr5zMxK0s9EGJIhsx
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: r1gCmWINHhjbKSKErWNZwtKtXPUGKanRJOUw7HRnVp3h3EFpmQgP8qOxcR/IRhXRfYbYBcJbM7
 sqsfpJRbq1Yer9qI3BSlMVATSaXhUbEj+4o63sdDuME7897nsFrWG4Y6wPVVtfGtS1WlcqBMRR
 wjVhMVZHjYW3SDXlm23C/zm9ryuW17cgmLnas8MyxF0xF1L8DkvoHFZ97Q92cM6FurGnPiBsum
 rpgKHuonpnXKhUB38Gy2NyrGh05JcVY+cgyZwcN7obuVT1nw4vxNnliaeTolltbMlUsriwMRou
 J5w=
X-SBRS: 5.1
X-MesageID: 47384384
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:pqbNFK2Fb+IAVhT9QkyFfwqjBLQkLtp133Aq2lEZdPRUGvb2qy
 nIpoV96faUskdpZJhOo7G90cW7LE80sKQFg7X5Xo3SODUO2lHJEGgK1+KLqFfd8m/Fh4tgPM
 9bAs5D4bbLY2SS4/yX3ODBKadC/OW6
X-IronPort-AV: E=Sophos;i="5.83,314,1616472000"; 
   d="scan'208";a="47384384"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v6 10/31] build: use $(kconfig) shortcut in clean rule
Date: Thu, 1 Jul 2021 15:09:50 +0100
Message-ID: <20210701141011.785641-11-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210701141011.785641-1-anthony.perard@citrix.com>
References: <20210701141011.785641-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/Makefile b/xen/Makefile
index e4deceab2c9a..dae0247067ff 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -341,7 +341,7 @@ _clean: delete-unfresh-files
 	$(MAKE) $(clean) arch/riscv
 	$(MAKE) $(clean) arch/x86
 	$(MAKE) $(clean) test
-	$(MAKE) -f $(BASEDIR)/tools/kconfig/Makefile.kconfig ARCH=$(ARCH) SRCARCH=$(SRCARCH) clean
+	$(MAKE) $(kconfig) clean
 	find . \( -name "*.o" -o -name ".*.d" -o -name ".*.d2" \
 		-o -name "*.gcno" -o -name ".*.cmd" -o -name "lib.a" \) -exec rm -f {} \;
 	rm -f include/asm $(TARGET) $(TARGET).gz $(TARGET).efi $(TARGET).efi.map $(TARGET)-syms $(TARGET)-syms.map *~ core
-- 
Anthony PERARD


