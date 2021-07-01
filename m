Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CA23B9312
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 16:21:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148778.275051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxZV-0002CH-TM; Thu, 01 Jul 2021 14:21:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148778.275051; Thu, 01 Jul 2021 14:21:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxZV-00026g-Lu; Thu, 01 Jul 2021 14:21:41 +0000
Received: by outflank-mailman (input) for mailman id 148778;
 Thu, 01 Jul 2021 14:21:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXwC=LZ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lyxQT-0005tj-33
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 14:12:21 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a4370ab4-7d26-431f-8643-4db42b9cbd9d;
 Thu, 01 Jul 2021 14:10:59 +0000 (UTC)
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
X-Inumbo-ID: a4370ab4-7d26-431f-8643-4db42b9cbd9d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625148659;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FW24mf7gQhBpHHcg9GJm9hyluG+ERn9X5WYN2UmMbPk=;
  b=cbdYfVzPIy5KNJccFmRaz2ouIUyoBrGCGeHeYbXyzxTttZRmy2wp2iKV
   I6gRqVwE+5oidon18IaiLTgC5r3QmsI7YS6miijS5RtoDH28XeOujqPFq
   xM/C3VwEBDTzkpPV74Pt+d3hZYHvFKPeEf3e4CEoFSdtj8rQDVbO/8NwL
   g=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: X0x55L6E6elZNa5DJCSBz8AQs/xTDbH104JZsGk/ivXRryutvpwmKbBMTXXbLDFK4nPOb5IBzZ
 0N5u5mvjxwK5S7vfU9LXCRVSlic9OhDTTNnw/iycBej8XIsnoDmq/Ff9iAU6aEOJ55V+0ymsHi
 TCbaTwrM+aSUTSccuqsEZUvJ1CHW7CvDDyh1RHwTU3KvT1V4SScRuwj87NJu3HuSjBOK3pQrar
 Z773hjmZAvEW7Q12YELsTT8HyTYIHhhf0A+2/YncVPuxcjkg8aR7xlQXE74+qETDW2FWTC8vEh
 YmE=
X-SBRS: 5.1
X-MesageID: 47384424
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:RoSt96FZ/cY7VNDdpLqE0MeALOsnbusQ8zAXP0AYc3Jom6uj5q
 aTdZUgpGfJYVkqOE3I9ertBEDEewK4yXcX2/h3AV7BZniEhILAFugLhuGO/9SjIVybygc079
 YYT0EUMrzN5DZB4voSmDPIceod/A==
X-IronPort-AV: E=Sophos;i="5.83,314,1616472000"; 
   d="scan'208";a="47384424"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH v6 22/31] build: fix $(TARGET).efi creation in arch/arm
Date: Thu, 1 Jul 2021 15:10:02 +0100
Message-ID: <20210701141011.785641-23-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210701141011.785641-1-anthony.perard@citrix.com>
References: <20210701141011.785641-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

There is no need to try to guess a relative path to the "xen.efi" file,
we can simply use $@. Also, there's no need to use `notdir`, make
already do that work via $(@F).

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/arch/arm/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index cc90d9796e6e..dc1d09c8b429 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -93,7 +93,7 @@ endif
 $(TARGET): $(TARGET)-syms
 	$(OBJCOPY) -O binary -S $< $@
 ifeq ($(CONFIG_ARM_64),y)
-	ln -sf $(notdir $@)  ../../$(notdir $@).efi
+	ln -sf $(@F) $@.efi
 endif
 
 ifeq ($(CONFIG_LTO),y)
-- 
Anthony PERARD


