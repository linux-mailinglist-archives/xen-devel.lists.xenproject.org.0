Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72390A01196
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 02:59:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864703.1275938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTtQi-0005Hf-OK; Sat, 04 Jan 2025 01:58:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864703.1275938; Sat, 04 Jan 2025 01:58:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTtQi-0005Ci-IG; Sat, 04 Jan 2025 01:58:20 +0000
Received: by outflank-mailman (input) for mailman id 864703;
 Sat, 04 Jan 2025 01:58:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AhC6=T4=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tTtQh-0005Ax-Cc
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 01:58:19 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ceb498d-ca3f-11ef-a0de-8be0dac302b0;
 Sat, 04 Jan 2025 02:58:16 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 922D5A411CC;
 Sat,  4 Jan 2025 01:56:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7FC86C4CEE1;
 Sat,  4 Jan 2025 01:58:15 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 78E9EE77199;
 Sat,  4 Jan 2025 01:58:15 +0000 (UTC)
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
X-Inumbo-ID: 5ceb498d-ca3f-11ef-a0de-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735955895;
	bh=l5CaQI1poeUeBhWKU19UCrMQ4g4rX0YNIDC4pnEb90I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=E9oQQTd5LujcPgVUdEcB2UZB99M9Snlv5YHhTBLda8b+uM9O3bCrGkpcfWKPiOKPV
	 HdT+JfFaJCdGXFElA2IxlT5teosXI3PU33DFQE0GPMd3s0ZmWrQSybRJoomY2tHOXl
	 JlNw4fAz52BbVAE1wt1RYF90QePRggzFjahrOPay5YglUG2Awkdr7exH90vsysxzT7
	 +iXc2Jq/bEK5M43IHQnKVTH9ibaxUrcv8kXbZ36WF+FYGEnFjpOlVlH3dVWv6w3ROv
	 Euq2c3x5bJUj6UbDPkhwOCUy/CAgWJRc4uRiITJoajQu9CDtQeJpsJbg+dPNfRsJP7
	 x3gMUyg7U1EHQ==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Fri, 03 Jan 2025 17:58:20 -0800
Subject: [PATCH v3 14/24] xen/console: simplify console owner switch hint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-vuart-ns8250-v3-v1-14-c5d36b31d66c@ford.com>
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
In-Reply-To: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, 
 Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735955892; l=896;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=WzdT/Oy8WMU/I7irURWT2SUpInPaVWdH8Z0/y7n+8AQ=;
 b=0j4lA25445KHzzpLVNgHBUI7bv00MN0Fqcvm5irJlwmNd4cGdfAKratJveXfG1O5lhSWXgwHE
 Y4tyt3EKNmYC05cRxLpm0AvVDCaAFO7SHVx7/Fypjcnz0cJJZjLKzPO
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

Update the hint with the combination of keys to press for the physical console
focus switch between the domains.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/drivers/char/console.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index f5ff3ebd830d631fa5d8fb5db1cf68adafcd02b4..1308236403df8a0f87aeb7e2c00a036c2d8433a7 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -518,8 +518,8 @@ int console_set_owner(domid_t domid)
     console_owner = domid;
 
     if ( switch_code )
-        printk(" (type 'CTRL-%c' three times to switch input)",
-               opt_conswitch[0]);
+        printk(" (type 'CTRL-%c%c%c' to switch input)",
+               opt_conswitch[0], opt_conswitch[0], opt_conswitch[0]);
     printk("\n");
 
     return 0;

-- 
2.34.1



