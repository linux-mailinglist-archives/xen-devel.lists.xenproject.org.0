Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7952723384B
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 20:18:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1D8a-0002qi-W6; Thu, 30 Jul 2020 18:18:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IK5u=BJ=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k1D8Z-0002pV-Gv
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 18:18:39 +0000
X-Inumbo-ID: 148584be-d291-11ea-8db3-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 148584be-d291-11ea-8db3-bc764e2007e4;
 Thu, 30 Jul 2020 18:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ShgvcGkxdE4OnoXDwV1go3UlHBZgZS/RIoOwLBZvFGA=; b=E+IGhPDl7danxh4SjSMTZ/xLmg
 AFaMOSYRRWeUpDl2o2vXYQMkdOsxv+Sj0sjJBx6ibdDy614jf4APgOvpj9SWysnsv/iWfK+CjOe2J
 KTC50qvJWhRmiQ3RXayIcqjjvDu79tRw3DBF7+5ktqSjjFY050jpItqPN0KwVj2Otq8M=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k1D8U-0007p6-2z; Thu, 30 Jul 2020 18:18:34 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k1D8T-0006Uf-Qd; Thu, 30 Jul 2020 18:18:34 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [RESEND][PATCH v2 2/7] xen/arm: kernel: Re-order the includes
Date: Thu, 30 Jul 2020 19:18:22 +0100
Message-Id: <20200730181827.1670-3-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200730181827.1670-1-julien@xen.org>
References: <20200730181827.1670-1-julien@xen.org>
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
 julien@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

We usually have xen/ includes first and then asm/. They are also ordered
alphabetically among themselves.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/kernel.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
index 8eff0748367d..f95fa392af44 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -3,20 +3,20 @@
  *
  * Copyright (C) 2011 Citrix Systems, Inc.
  */
+#include <xen/domain_page.h>
 #include <xen/errno.h>
+#include <xen/gunzip.h>
 #include <xen/init.h>
 #include <xen/lib.h>
+#include <xen/libfdt/libfdt.h>
 #include <xen/mm.h>
-#include <xen/domain_page.h>
 #include <xen/sched.h>
-#include <asm/byteorder.h>
-#include <asm/setup.h>
-#include <xen/libfdt/libfdt.h>
-#include <xen/gunzip.h>
 #include <xen/vmap.h>
 
+#include <asm/byteorder.h>
 #include <asm/guest_access.h>
 #include <asm/kernel.h>
+#include <asm/setup.h>
 
 #define UIMAGE_MAGIC          0x27051956
 #define UIMAGE_NMLEN          32
-- 
2.17.1


