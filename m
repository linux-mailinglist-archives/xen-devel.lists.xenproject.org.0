Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D963F5CB9
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 13:02:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171077.312379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUCK-0001Hi-8D; Tue, 24 Aug 2021 11:02:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171077.312379; Tue, 24 Aug 2021 11:02:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUCJ-00017t-TD; Tue, 24 Aug 2021 11:02:27 +0000
Received: by outflank-mailman (input) for mailman id 171077;
 Tue, 24 Aug 2021 11:02:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxNM=NP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mIU3j-0001EC-Da
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:53:35 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7f3296c2-4a59-43ad-a4bf-4b8d046730d0;
 Tue, 24 Aug 2021 10:52:00 +0000 (UTC)
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
X-Inumbo-ID: 7f3296c2-4a59-43ad-a4bf-4b8d046730d0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629802319;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LKnefkuuFQC10LfXqSSu32yIG5VWHpcMy+rZtD5GY5M=;
  b=eEwAx4v1ZGiEb9pm3DxVtA7a2E1oZ8sqvm2mzMCSepGZemJFmbtgMBJ3
   z7DTIjO1zeAchluBKQWHemO/LMAEuiWT5ioFr3nQgCNX/0mQgl1rc0xyN
   R6AZPFPqofLkj/9fpQ4iX6fkkhcpn+sS7on+ZDdGhVO59SaSU//gMVFoR
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: hrtj/xVk7OBG1Xzg12jeuHsxK9i1d5xzj3+P6ioyBFUBqzTemmlde9WUQb/eFXhjQg5X06y0bi
 EopKUQOBhRor8ZclJLs2ZDvzs9lRpYUZESt5X01z7CmkcA+x3FjsrVjVU/205gsp4hkRzfftiN
 vlLgZ5rZ6n93g2ZKjj/bdGT03NxwNMXZjRxajznNJUurdaaq/LXFae1s0N1TpTryUST9fexErr
 2Spxps7QL9qKca6knT1ZTJV+YjSLC86S8XKOGqVPtsMWi9yg9gdHy7jFMxWiXHfkdD7UkL9Kvs
 d7nWuQSPQimzGQRPzPOP5EmC
X-SBRS: 5.1
X-MesageID: 52875493
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:poDF1q2GPhQGKok5wq2zgwqjBLQkLtp133Aq2lEZdPRUGvb2qy
 nIpoV96faUskdpZJhOo7G90cW7LE80sKQFg7X5Xo3SODUO2lHJEGgK1+KLqFfd8m/Fh4tgPM
 9bAs5D4bbLY2SS4/yX3ODBKadC/OW6
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="52875493"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH v7 28/51] build: rename __LINKER__ to LINKER_SCRIPT
Date: Tue, 24 Aug 2021 11:50:15 +0100
Message-ID: <20210824105038.1257926-29-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210824105038.1257926-1-anthony.perard@citrix.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

For two reasons: this macro is used to generate a "linker script" and
is not by the linker, and name starting with an underscore '_' are
supposed to be reserved, so better avoid them when not needed.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/Rules.mk                      | 2 +-
 xen/arch/arm/include/asm/config.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/Rules.mk b/xen/Rules.mk
index 9b8415160649..a62c761be8d1 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -257,7 +257,7 @@ $(obj)/%.s: $(src)/%.S FORCE
 
 # Linker scripts, .lds.S -> .lds
 quiet_cmd_cpp_lds_S = LDS     $@
-cmd_cpp_lds_S = $(CPP) -P $(call cpp_flags,$(a_flags)) -D__LINKER__ -MQ $@ -o $@ $<
+cmd_cpp_lds_S = $(CPP) -P $(call cpp_flags,$(a_flags)) -DLINKER_SCRIPT -MQ $@ -o $@ $<
 
 targets := $(filter-out $(PHONY), $(targets))
 
diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
index c7b77912013e..2aced0bc3b8b 100644
--- a/xen/arch/arm/include/asm/config.h
+++ b/xen/arch/arm/include/asm/config.h
@@ -191,7 +191,7 @@ extern unsigned long frametable_virt_end;
 #define watchdog_disable() ((void)0)
 #define watchdog_enable()  ((void)0)
 
-#if defined(__ASSEMBLY__) && !defined(__LINKER__)
+#if defined(__ASSEMBLY__) && !defined(LINKER_SCRIPT)
 #include <asm/asm_defns.h>
 #include <asm/macros.h>
 #endif
-- 
Anthony PERARD


