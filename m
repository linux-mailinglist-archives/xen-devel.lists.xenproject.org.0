Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D44B972D25
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 11:13:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795164.1204344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snwwR-0000xN-GT; Tue, 10 Sep 2024 09:13:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795164.1204344; Tue, 10 Sep 2024 09:13:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snwwR-0000v8-DB; Tue, 10 Sep 2024 09:13:43 +0000
Received: by outflank-mailman (input) for mailman id 795164;
 Tue, 10 Sep 2024 09:13:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g1em=QI=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1snwwP-0000uu-Sg
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 09:13:41 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f87f4741-6f54-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 11:13:41 +0200 (CEST)
Received: from delta.bugseng.com.homenet.telecomitalia.it
 (host-87-1-204-86.retail.telecomitalia.it [87.1.204.86])
 by support.bugseng.com (Postfix) with ESMTPSA id 105C04EE079F;
 Tue, 10 Sep 2024 11:13:37 +0200 (CEST)
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
X-Inumbo-ID: f87f4741-6f54-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1725959620; bh=QcU5Da4ktj/P01VY4CMaXtB1BLdZaSbVnPFlS6EMHw4=;
	h=From:To:Cc:Subject:Date:From;
	b=QPDVMWdB5ZRW60XVNp7v7Te/TlZe/FC5fwOjUTI6F1t6WNuySJ7RCbwj+LlrDdjXF
	 e/QiKuxckX+G7Iow9L7Bgvtv4RVnCxNCSd28r7eQdzyuMW4yPP8C22BkJW5qIqcRWd
	 oHAAW46ZUEfm6kto4f+amB5KdpGhsu2ZzuvbDrVbglUy+7UsyVeR6RpNsuYhmh9aji
	 o15jYNbc8hTVMUj69XNmR9ZdhkspuzLcjW/fPkyhTBC7NMSqa91/6hmaGthQHE7ewu
	 B/wW5OHLmZr9yX/DH6yshdO84waax0hEnM2xak4KjIRN9A8cUPp9ZujdSCQ6tji3OH
	 z0JRTQOoRl+gQ==
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Subject: [XEN PATCH v2] x86/APIC: address violation of MISRA C Rule 21.2
Date: Tue, 10 Sep 2024 11:13:24 +0200
Message-Id: <e482f5f5355b1a278195d59a3f74eda81ff97695.1725959398.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nicola Vetrini <nicola.vetrini@bugseng.com>

The rule disallows the usage of an identifier reserved by the C standard.
All identfiers starting with '__' are reserved for any use, so the label
can be renamed in order to avoid the violation.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
---
Changes in v2:
- added correct signature
- applied proper indentation for label `next'

 xen/arch/x86/apic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
index e077bf7edc..254ab5d388 100644
--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -925,7 +925,7 @@ void __init init_apic_mappings(void)
     unsigned long apic_phys;
 
     if ( x2apic_enabled )
-        goto __next;
+        goto next;
     /*
      * If no local APIC can be found then set up a fake all
      * zeroes page to simulate the local APIC and another
@@ -941,7 +941,7 @@ void __init init_apic_mappings(void)
     apic_printk(APIC_VERBOSE, "mapped APIC to %p (%08lx)\n",
                 fix_to_virt(FIX_APIC_BASE), apic_phys);
 
-__next:
+ next:
     /*
      * Fetch the APIC ID of the BSP in case we have a
      * default configuration (or the MP table is broken).
-- 
2.34.1


