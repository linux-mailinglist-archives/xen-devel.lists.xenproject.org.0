Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B168BAF24
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2024 16:42:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716519.1118683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2u6c-0002Zy-Mb; Fri, 03 May 2024 14:41:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716519.1118683; Fri, 03 May 2024 14:41:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2u6c-0002Vy-GD; Fri, 03 May 2024 14:41:46 +0000
Received: by outflank-mailman (input) for mailman id 716519;
 Fri, 03 May 2024 14:41:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8QA1=MG=solinno.co.uk=leigh@srs-se1.protection.inumbo.net>)
 id 1s2u6b-0002U8-JE
 for xen-devel@lists.xenproject.org; Fri, 03 May 2024 14:41:45 +0000
Received: from doppler.solinno.uk (doppler.solinno.uk [81.2.106.178])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41cc7167-095b-11ef-909c-e314d9c70b13;
 Fri, 03 May 2024 16:41:44 +0200 (CEST)
Received: from folly.solinno.co.uk (folly.dyn.solinno.co.uk [192.168.2.135])
 by doppler.solinno.uk (Postfix) with ESMTPSA id E26C1800A4;
 Fri,  3 May 2024 15:41:41 +0100 (BST)
Received: by folly.solinno.co.uk (Postfix, from userid 1000)
 id AAA762018A; Fri,  3 May 2024 15:41:41 +0100 (BST)
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
X-Inumbo-ID: 41cc7167-095b-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=solinno.co.uk;
	s=mail; t=1714747301;
	bh=y7+Cz3k/mrxS1xulR9+YhBk7BokYkEDmmQsPxFpElbg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lJi3qh4AzWO5q9AsQrDONF2oTzG3702q0mdtoTkVL8nMrWVE6FiAi5RKy16DYKvLI
	 K8bF5MLkVpKkLkM9SnoC824e6fhd1b5xwbdhbvlV+2a1Lu5XPpyDsfUh/5IuhUhWdI
	 ETt2YJGJYe/y20Ea6kvV+GDzEpRR8zBKyTxf7GNI=
From: Leigh Brown <leigh@solinno.co.uk>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@citrix.com,
	Leigh Brown <leigh@solinno.co.uk>
Subject: [RFC PATCH 2/5] tools/xl: add vid keyword vif option
Date: Fri,  3 May 2024 15:41:21 +0100
Message-Id: <20240503144124.12931-3-leigh@solinno.co.uk>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240503144124.12931-1-leigh@solinno.co.uk>
References: <20240503144124.12931-1-leigh@solinno.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update parse_nic_config() to support a new `vid' keyword. This
keyword specifies the numeric VLAN ID to assign to the VIF when
attaching it to the bridge port, on operating systems that support
the capability (e.g. Linux).

Signed-off-by: Leigh Brown <leigh@solinno.co.uk>
---
 tools/xl/xl_parse.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index ed983200c3..5d5dd4ec04 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -565,6 +565,8 @@ int parse_nic_config(libxl_device_nic *nic, XLU_Config **config, char *token)
         nic->devid = parse_ulong(oparg);
     } else if (MATCH_OPTION("mtu", token, oparg)) {
         nic->mtu = parse_ulong(oparg);
+    } else if (MATCH_OPTION("vid", token, oparg)) {
+        nic->vid = parse_ulong(oparg);
     } else if (!strcmp("trusted", token)) {
         libxl_defbool_set(&nic->trusted, true);
     } else if (!strcmp("untrusted", token)) {
-- 
2.39.2


