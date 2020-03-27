Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A56F4195E49
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 20:09:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHuIu-00010d-EG; Fri, 27 Mar 2020 19:06:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=FIC2=5M=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jHuIs-00010S-J6
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 19:06:02 +0000
X-Inumbo-ID: fff63f92-705d-11ea-a6c1-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fff63f92-705d-11ea-a6c1-bc764e2007e4;
 Fri, 27 Mar 2020 19:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LbkHRMejVzjX2Y1W5Wqka+7qxm9kBms8I4prnQ0VkJ4=; b=O3Pnm3WTHlxwO/aHPiA6TzTVb7
 z93HNWeUDmHKZptteXNzz/tIQ9Am3ge431GMOPbjS79vSNNJuEf+wjJ4PdCfvOKnCP1ozJsHkONyz
 Bm6Xq+aLsXI1dKHK7eZanZ/zXFVBBvLfwbb8FBFZUbgk7hKSlE/1+tChL44swRLvzYJ8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jHuIr-0000HW-7V; Fri, 27 Mar 2020 19:06:01 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jHuIq-0008GW-UI; Fri, 27 Mar 2020 19:06:01 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Date: Fri, 27 Mar 2020 19:05:44 +0000
Message-Id: <20200327190546.21580-2-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200327190546.21580-1-julien@xen.org>
References: <20200327190546.21580-1-julien@xen.org>
Subject: [Xen-devel] [PATCH 1/3] xen/x86: ioapic: Use true/false in
 bad_ioapic_register()
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

bad_ioapic_register() is return a bool, so we should switch to
true/false.

Signed-off-by: Julien Grall <jgrall@amazon.com>
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


