Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7052337F7
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 19:52:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1CjX-0008IA-Al; Thu, 30 Jul 2020 17:52:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IK5u=BJ=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k1CjV-00089P-0B
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 17:52:45 +0000
X-Inumbo-ID: 6c29e948-d28d-11ea-aaff-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6c29e948-d28d-11ea-aaff-12813bfff9fa;
 Thu, 30 Jul 2020 17:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wKQvWLwb3vbFbaN60ANqWtb/FsamZy4DJptrPdgq66M=; b=QYgK3JxNc9pNbpXnViLPgxcRRN
 Yn79mzTi/xICc7L3eS5nahFQ4D0f8WDxm/mem2/w/kMTMhOOw8rtCEl4wfCAPwHn1+q8akaJfaN6e
 5F/rVQoytrqMNikKVXQ0lenWUlZXQkfBStk0lPQYlD0lth7khFY2iYvLs7uXdU2lB7bk=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k1Cj9-00079i-8i; Thu, 30 Jul 2020 17:52:23 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k1Cj8-0004nV-VM; Thu, 30 Jul 2020 17:52:23 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 3/7] xen/arm: decode: Re-order the includes
Date: Thu, 30 Jul 2020 18:52:05 +0100
Message-Id: <20200730175213.30679-6-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200730175213.30679-1-julien@xen.org>
References: <20200730175213.30679-1-julien@xen.org>
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
 xen/arch/arm/decode.c | 5 +++--
 xen/arch/arm/kernel.c | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
index 8b1e15d11892..144793c8cea0 100644
--- a/xen/arch/arm/decode.c
+++ b/xen/arch/arm/decode.c
@@ -17,11 +17,12 @@
  * GNU General Public License for more details.
  */
 
-#include <xen/types.h>
+#include <xen/lib.h>
 #include <xen/sched.h>
+#include <xen/types.h>
+
 #include <asm/current.h>
 #include <asm/guest_access.h>
-#include <xen/lib.h>
 
 #include "decode.h"
 
diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
index f95fa392af44..032923853f2c 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -5,6 +5,7 @@
  */
 #include <xen/domain_page.h>
 #include <xen/errno.h>
+#include <xen/guest_access.h>
 #include <xen/gunzip.h>
 #include <xen/init.h>
 #include <xen/lib.h>
@@ -14,7 +15,6 @@
 #include <xen/vmap.h>
 
 #include <asm/byteorder.h>
-#include <asm/guest_access.h>
 #include <asm/kernel.h>
 #include <asm/setup.h>
 
-- 
2.17.1


