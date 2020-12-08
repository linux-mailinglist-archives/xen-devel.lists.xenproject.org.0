Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE862D2C3A
	for <lists+xen-devel@lfdr.de>; Tue,  8 Dec 2020 14:52:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47447.83932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmdPE-0007ag-EB; Tue, 08 Dec 2020 13:51:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47447.83932; Tue, 08 Dec 2020 13:51:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmdPE-0007aK-BA; Tue, 08 Dec 2020 13:51:52 +0000
Received: by outflank-mailman (input) for mailman id 47447;
 Tue, 08 Dec 2020 13:51:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LMSP=FM=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kmdPC-0007aF-Ar
 for xen-devel@lists.xenproject.org; Tue, 08 Dec 2020 13:51:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id faf721a8-32d4-4c15-a694-c2bf48cacf82;
 Tue, 08 Dec 2020 13:51:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 54A71AC9A;
 Tue,  8 Dec 2020 13:51:48 +0000 (UTC)
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
X-Inumbo-ID: faf721a8-32d4-4c15-a694-c2bf48cacf82
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607435508; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3Xetfu6kFyQluvFamyEt0BBT9TTyFFzpymYZUbEc6A0=;
	b=nCX7Dhye++ZDa5FaLmKfyA1b6PgdaBy5pzYKw9sgTqMbefhAtZ9dOgKg0atb3QX1v95DmF
	7aWaBZ97xhDH8LWTmgdh01Tm+jZmMzuRaCNl3QPZwnFMBRk6/GiYto5gwYm2MKCMFJUc7h
	5ean9dSm+bV/V2nKKlJE+foLmrp1cM8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] xen: CONFIG_PV_SHIM_EXCLUSIVE and CONFIG_HVM are mutually exclusive
Date: Tue,  8 Dec 2020 14:51:46 +0100
Message-Id: <20201208135146.30540-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With CONFIG_PV_SHIM_EXCLUSIVE some sources required for CONFIG_HVM are
not built, so let CONFIG_HVM depend on !CONFIG_PV_SHIM_EXCLUSIVE.

Let CONFIG_HVM default to !CONFIG_PV_SHIM instead.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/arch/x86/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 24868aa6ad..0107cfa12f 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -90,7 +90,8 @@ config PV_LINEAR_PT
          If unsure, say Y.
 
 config HVM
-	def_bool !PV_SHIM_EXCLUSIVE
+	depends on !PV_SHIM_EXCLUSIVE
+	def_bool !PV_SHIM
 	prompt "HVM support"
 	---help---
 	  Interfaces to support HVM domains.  HVM domains require hardware
-- 
2.26.2


