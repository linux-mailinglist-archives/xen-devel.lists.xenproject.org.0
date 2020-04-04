Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BF819E473
	for <lists+xen-devel@lfdr.de>; Sat,  4 Apr 2020 12:27:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKg16-00008D-0M; Sat, 04 Apr 2020 10:27:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7qE9=5U=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jKg13-00007y-V8
 for xen-devel@lists.xenproject.org; Sat, 04 Apr 2020 10:27:05 +0000
X-Inumbo-ID: d21e80dc-765e-11ea-be07-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d21e80dc-765e-11ea-be07-12813bfff9fa;
 Sat, 04 Apr 2020 10:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O8qi6CyUcG6jB4s0EzoV2dMvYHGdJrUt2FlFqXtPOl8=; b=YlH0HS7iY7bQCuXO+2W9jQewuq
 9DBzxuGAVlalJMPEKMMvBaMGojlJDJXFcseVSdRSadg7AjhSDt6P+gUKexJ4kGxx62OyBkYpmOrDg
 BSQ1IC0EkeiC7dbc+SQetgs/mzoi0hVZL5zY/Jx9n5YBFtmYpjr3obwlrRTeIULJ5gs8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jKg0y-0005A3-Or; Sat, 04 Apr 2020 10:27:00 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jKg0y-0005h7-FD; Sat, 04 Apr 2020 10:27:00 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 1/3] xen/x86: ioapic: Use true/false in
 bad_ioapic_register()
Date: Sat,  4 Apr 2020 11:26:54 +0100
Message-Id: <20200404102656.29730-2-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404102656.29730-1-julien@xen.org>
References: <20200404102656.29730-1-julien@xen.org>
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
Cc: julien@xen.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

bad_ioapic_register() is returning a bool, so we should switch to
true/false.

Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Wei Liu <wl@xen.org>
Acked-by: Jan Beulich <jbeulich@suse.com>

---
    Changes in v2:
        - Add Wei's reviewed-by
        - Fix typo
        - Add Jan's acked-by
---
 xen/arch/x86/io_apic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index e98e08e9c8..9868933287 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -2531,10 +2531,10 @@ static __init bool bad_ioapic_register(unsigned int idx)
     {
         printk(KERN_WARNING "I/O APIC %#x registers return all ones, skipping!\n",
                mp_ioapics[idx].mpc_apicaddr);
-        return 1;
+        return true;
     }
 
-    return 0;
+    return false;
 }
 
 void __init init_ioapic_mappings(void)
-- 
2.17.1


