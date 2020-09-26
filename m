Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0D9279C80
	for <lists+xen-devel@lfdr.de>; Sat, 26 Sep 2020 22:56:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMHEs-0003jt-ST; Sat, 26 Sep 2020 20:56:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a+g/=DD=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kMHEq-0003jB-NI
 for xen-devel@lists.xenproject.org; Sat, 26 Sep 2020 20:56:12 +0000
X-Inumbo-ID: 41132070-a02a-410e-b2ba-be4694155843
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 41132070-a02a-410e-b2ba-be4694155843;
 Sat, 26 Sep 2020 20:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=gZXdNFgGKyJnQOeN1ZdTo8GlRhovmbEZsA8e62YRgQQ=; b=Dt2Sofehf4XDzYmaL/oKzfYu5
 RlrQ3rn3RcNX0p3fmWtRZAKPGd+UIWJ7UniZwkXBZFQmfG7nTbFk0b0vcYgeKOl9U0hbjyK+3fqcN
 m0SN60hsBmiEn7jZO8O0l/p34Afi2DgHLeT2TJo6ZvUp0vAsBtRnkdT1FCqVckX3kFJww=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kMHEl-0000CX-Am; Sat, 26 Sep 2020 20:56:07 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kMHEl-0004I0-1u; Sat, 26 Sep 2020 20:56:07 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: alex.bennee@linaro.org, masami.hiramatsu@linaro.org, ehem+xen@m5p.com,
 bertrand.marquis@arm.com, andre.przywara@arm.com,
 Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 3/4] xen/arm: Check if the platform is not using ACPI before
 initializing Dom0less
Date: Sat, 26 Sep 2020 21:55:41 +0100
Message-Id: <20200926205542.9261-4-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200926205542.9261-1-julien@xen.org>
References: <20200926205542.9261-1-julien@xen.org>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

Dom0less requires a device-tree. However, since commit 6e3e77120378
"xen/arm: setup: Relocate the Device-Tree later on in the boot", the
device-tree will not get unflatten when using ACPI.

This will lead to a crash during boot.

Given the complexity to setup dom0less with ACPI (for instance how to
assign device?), we should skip any code related to Dom0less when using
ACPI.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/setup.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index f16b33fa87a2..35e5bee04efa 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -987,7 +987,8 @@ void __init start_xen(unsigned long boot_phys_offset,
 
     system_state = SYS_STATE_active;
 
-    create_domUs();
+    if ( acpi_disabled )
+        create_domUs();
 
     domain_unpause_by_systemcontroller(dom0);
 
-- 
2.17.1


