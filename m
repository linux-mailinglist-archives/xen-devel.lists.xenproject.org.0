Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B29320728
	for <lists+xen-devel@lfdr.de>; Sat, 20 Feb 2021 22:08:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.87345.164484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lDZTc-0000me-Gk; Sat, 20 Feb 2021 21:07:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87345.164484; Sat, 20 Feb 2021 21:07:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lDZTc-0000mF-D4; Sat, 20 Feb 2021 21:07:44 +0000
Received: by outflank-mailman (input) for mailman id 87345;
 Sat, 20 Feb 2021 21:07:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H6fi=HW=tklengyel.com=tamas@srs-us1.protection.inumbo.net>)
 id 1lDZTb-0000mA-5W
 for xen-devel@lists.xenproject.org; Sat, 20 Feb 2021 21:07:43 +0000
Received: from MTA-10-1.privateemail.com (unknown [68.65.122.30])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6b5e563f-c885-4b5f-a9f4-a64d8f235e01;
 Sat, 20 Feb 2021 21:07:42 +0000 (UTC)
Received: from MTA-10.privateemail.com (localhost [127.0.0.1])
 by MTA-10.privateemail.com (Postfix) with ESMTP id 1F45660033;
 Sat, 20 Feb 2021 16:07:41 -0500 (EST)
Received: from drt-xps-ubuntu.lan (unknown [10.20.151.239])
 by MTA-10.privateemail.com (Postfix) with ESMTPA id 7C24660045;
 Sat, 20 Feb 2021 21:07:40 +0000 (UTC)
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
X-Inumbo-ID: 6b5e563f-c885-4b5f-a9f4-a64d8f235e01
From: Tamas K Lengyel <tamas@tklengyel.com>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH for-4.15] tools/misc/xen-vmtrace: use reset and enable
Date: Sat, 20 Feb 2021 16:07:38 -0500
Message-Id: <d63d274c46f964d89f791d5e5166971387c0e2e8.1613855006.git.tamas@tklengyel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

The expected behavior while using xen-vmtrace is to get a clean start, even if
the tool was used previously on the same VM.

Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
---
 tools/misc/xen-vmtrace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/misc/xen-vmtrace.c b/tools/misc/xen-vmtrace.c
index 7572e880c5..35d14c6a9b 100644
--- a/tools/misc/xen-vmtrace.c
+++ b/tools/misc/xen-vmtrace.c
@@ -119,7 +119,7 @@ int main(int argc, char **argv)
         goto out;
     }
 
-    if ( xc_vmtrace_enable(xch, domid, vcpu) )
+    if ( xc_vmtrace_reset_and_enable(xch, domid, vcpu) )
     {
         perror("xc_vmtrace_enable()");
         goto out;
-- 
2.27.0


