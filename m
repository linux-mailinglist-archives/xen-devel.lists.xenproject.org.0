Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C0E9E6658
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 05:42:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.849425.1264154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQAC-0008R3-KF; Fri, 06 Dec 2024 04:42:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 849425.1264154; Fri, 06 Dec 2024 04:42:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQAA-0007z2-EG; Fri, 06 Dec 2024 04:41:58 +0000
Received: by outflank-mailman (input) for mailman id 849425;
 Fri, 06 Dec 2024 04:41:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5aHD=S7=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tJQA1-0004Kb-07
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 04:41:49 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 630748e6-b38c-11ef-99a3-01e77a169b0f;
 Fri, 06 Dec 2024 05:41:41 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9F06E5C730D;
 Fri,  6 Dec 2024 04:40:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3FE89C4CEE4;
 Fri,  6 Dec 2024 04:41:38 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 3203AE77175;
 Fri,  6 Dec 2024 04:41:38 +0000 (UTC)
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
X-Inumbo-ID: 630748e6-b38c-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733460098;
	bh=Cap5cSdXQnJhIWZIJycGmw66XTO7q8HjNlh67Jy7JB4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=slEVXgrcxRMdts8sPlpZiuEnq6nMd1CJXo5dkrY+iH95kxfsnlS15QRK3taaMDw/s
	 dPCF6+DfrrCLhxwuD3D6XopmRXmgdFB/iSP+TzFCBg/sedGESnVGWnRASO5Fso76EK
	 NaSmqdwiVn9s2mRCzADjsbRv80BHc4iZOWzINZfusKq7300RwgQ1Zfs7+THoMEVH4P
	 ZRd8LzFIdF59o69nF+1xazOq9dTsU8h6fUQWzOUi3rwun1X+sutRdo6TD2lWqVUHw6
	 Dt7Z0eHhaqMvCRyxJ3+rENlf7l3fqcrkeFnYH/8wEXAjcLZT7BjIEydTOwZgDfSl+W
	 MElWGA+tKeDFQ==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Thu, 05 Dec 2024 20:41:44 -0800
Subject: [PATCH v2 14/35] xen/console: rename switch_serial_input() to
 console_find_owner()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-vuart-ns8250-v1-14-e9aa923127eb@ford.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
In-Reply-To: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733460094; l=1478;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=kkv+AJB+iT69SEANPtdQ4jOx6o8Fe+p28DiGHObsMCE=;
 b=gRXgx+DD5GIcVMPVQK7C1jj92QDW/kIDm/IOc/pZCgabGTEox1asRi6IgoPghVmZ7TWS8niFN
 n4qeqreO2lEBoEOFAlckvn2W2tk/QOfgi/PUKW8+0xqTiyq+lSP5ZG8
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

Updated the name to highlight the logic of selection the physical console
owner: existing code does not switch only serial console, it also switches
video console and debugging console (debug I/O port and console hypercall).

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/drivers/char/console.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 01fcbd5581d11f8f4f2b23592255b5c744430a3e..f8a7db385c9525cabc69ceb1a84d73f57863aa45 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -485,7 +485,7 @@ struct domain *rcu_lock_domain_console_owner(void)
 }
 #endif
 
-static void switch_serial_input(void)
+static void console_find_owner(void)
 {
     unsigned int next_rx = console_rx;
 
@@ -588,7 +588,7 @@ static void cf_check serial_rx(char c)
         /* We eat CTRL-<switch_char> in groups of 3 to switch console input. */
         if ( ++switch_code_count == 3 )
         {
-            switch_serial_input();
+            console_find_owner();
             switch_code_count = 0;
         }
         return;
@@ -1128,7 +1128,7 @@ void __init console_endboot(void)
                             "toggle host/guest log level adjustment", 0);
 
     /* Serial input is directed to DOM0 by default. */
-    switch_serial_input();
+    console_find_owner();
 }
 
 int __init console_has(const char *device)

-- 
2.34.1



