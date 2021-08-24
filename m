Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBBD3F5C97
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 13:01:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170959.312062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUAy-0002nH-AY; Tue, 24 Aug 2021 11:01:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170959.312062; Tue, 24 Aug 2021 11:01:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUAy-0002i9-6W; Tue, 24 Aug 2021 11:01:04 +0000
Received: by outflank-mailman (input) for mailman id 170959;
 Tue, 24 Aug 2021 11:01:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxNM=NP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mIU2W-0001EC-Aq
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:52:20 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 930ad33d-b515-4fe2-b6d7-25f038806064;
 Tue, 24 Aug 2021 10:51:23 +0000 (UTC)
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
X-Inumbo-ID: 930ad33d-b515-4fe2-b6d7-25f038806064
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629802283;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FW24mf7gQhBpHHcg9GJm9hyluG+ERn9X5WYN2UmMbPk=;
  b=Z8r2AQdRi+/NjWbISrBzb8qehjOIyKDNS9p5iaj8V6DqJuOC0jRxm75g
   oNnbyo5uAXyLbBOKGUvUSy3E7tImlzPtpGN0aque1S2kKf6soeSVhwLzU
   Cl/CermTQzEzMY/UA5q9kzKjXrZOxyxFX5sVH2tqrgUIYTfB9qmjHw/vO
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: x5Me5gMX8yanwNrzDTYwNTAHf2ybo9F+pMvILih7HdtcE7pw9zqLMUWBWkPRp+4fXIYG5AGyht
 QM8xPEpFuqJAEd6MFcfXfodn9F14gtJh/WkpAz6qOmYDc4jOkd3Kj72eEM6FvSKEosX0UlpJAj
 jnm03gXfEIVmGqQfUOh7To5T9SJFBOhVnJyRzD8v7M/Oc7RHR353I7WmX/6vHhMCQ6zt8EX3SC
 T3R/DUcIftFHPMZVSO2D+R2qMZy6n+Q+W3a7nTj+YCdlkDwPK+E/hLkW/pkIGWpX3z46JC9BH+
 nXq20fkEqjRTWEmSqKWHzMur
X-SBRS: 5.1
X-MesageID: 52875464
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:R4R896rLEWB0taI4l5WiHM0aV5oTeYIsimQD101hICG8cqSj+f
 xG+85rsyMc6QxhIE3I9urhBEDtex/hHNtOkOws1NSZLW7bUQmTXeJfBOLZqlWKcUDDH6xmpM
 NdmsBFeaTN5DNB7PoSjjPWLz9Z+qjkzJyV
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="52875464"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH v7 18/51] build: fix $(TARGET).efi creation in arch/arm
Date: Tue, 24 Aug 2021 11:50:05 +0100
Message-ID: <20210824105038.1257926-19-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210824105038.1257926-1-anthony.perard@citrix.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
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


