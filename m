Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3698B19E51E
	for <lists+xen-devel@lfdr.de>; Sat,  4 Apr 2020 15:10:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKiZF-0005kS-6w; Sat, 04 Apr 2020 13:10:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7qE9=5U=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jKiZD-0005kH-Pl
 for xen-devel@lists.xenproject.org; Sat, 04 Apr 2020 13:10:31 +0000
X-Inumbo-ID: a96112d8-7675-11ea-9e09-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a96112d8-7675-11ea-9e09-bc764e2007e4;
 Sat, 04 Apr 2020 13:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IbfxDvUU3r+UopRQDKG0coR2ogjCp6rmXPtnRoSVZOs=; b=MEVkTDcoXfkDtJsYM62DK5Npnf
 b6aXYCgdZW1mTq6uwWOcRIjKviemkf5SYW+E2L1Fguuvg5CwHjudNHIgdmmO8K69NG77lRwnDCFyf
 g9HkB5K6SwZGBl9cY2D4vBuut2kBYAunJwVyLXfWg577EvmtNho+g8q9qvmrXoeG45sA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jKiZC-0008Fn-So; Sat, 04 Apr 2020 13:10:30 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jKiZC-0007rM-Jx; Sat, 04 Apr 2020 13:10:30 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 3/7] xen/arm: decode: Re-order the includes
Date: Sat,  4 Apr 2020 14:10:13 +0100
Message-Id: <20200404131017.27330-4-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404131017.27330-1-julien@xen.org>
References: <20200404131017.27330-1-julien@xen.org>
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
index 8b1e15d118..144793c8ce 100644
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
index f95fa392af..032923853f 100644
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


