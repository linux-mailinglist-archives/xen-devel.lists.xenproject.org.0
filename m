Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5805B4B084F
	for <lists+xen-devel@lfdr.de>; Thu, 10 Feb 2022 09:32:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269651.463730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nI4s6-0006oG-N7; Thu, 10 Feb 2022 08:32:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269651.463730; Thu, 10 Feb 2022 08:32:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nI4s6-0006mJ-JQ; Thu, 10 Feb 2022 08:32:10 +0000
Received: by outflank-mailman (input) for mailman id 269651;
 Thu, 10 Feb 2022 08:29:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zl0S=SZ=vivo.com=wangqing@srs-se1.protection.inumbo.net>)
 id 1nI4pg-0005zC-JK
 for xen-devel@lists.xenproject.org; Thu, 10 Feb 2022 08:29:40 +0000
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2072b.outbound.protection.outlook.com
 [2a01:111:f400:feae::72b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 943bdc77-8a4b-11ec-8eb8-a37418f5ba1a;
 Thu, 10 Feb 2022 09:29:38 +0100 (CET)
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by PSAPR06MB4005.apcprd06.prod.outlook.com (2603:1096:301:3a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 10 Feb
 2022 08:29:32 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb%4]) with mapi id 15.20.4975.011; Thu, 10 Feb 2022
 08:29:32 +0000
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
X-Inumbo-ID: 943bdc77-8a4b-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OV3YHnXHBZ9UtqzcjCgQCWg70dU95Am2kfUYz8vBlifcarW/JGeyye7wFCcW6Z2nZvlhJ3Qc0np/5tty68+yUdIDrwGtwiKi07C+yqqHzyY+mM/0pVjNQjFe+O3KRpTFmtHR6p/pFHfqMHnuesFaMnHIGYxKsM+AnsoTLXahMT92uCtKXtqZxFIJRBbjO9Hi8k481IkFSHaOsTaINiZ6Pp5rF43z9+zxfBGxC+OqxOh8keG0AjNJphTDpNZmBJ0hQU554QgK50VyCos3nXyasACKLJELUgun/o77Qvxs+Cq6zr38h1MM9gjAhIWPooWFOfPeKOlD3/0+I2P3wPo6wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vMLJbdOpfHG63MP8VB14fg4rzHqLyuvfrpbIjSDncH8=;
 b=h4tyTpJGmQ1eRcdcSb/RDwf8pOBkEiJfkOJqYc9k2VlNltjtugwx4JbFm3uaLOMubCrYwKdCm+wv9Yt8uyIXcjoa9mgD9iPwGT+uIRF45PBW0loPz769CcfQQYnrz2RXa2wW/j6/xq2Wxio3Nwy4KweOwzFqabF68SsIjVzVWTrAXX+HbkWSXt+jpyWFuGHkZXMTl56q/FwCAVGmwSy0n/cNZF75gwx99CkJwF2NiNtu8ZvLeXuDr+obIg3zMDC40wjcaYBZNvVYliPxUByBZ0XF39C4iEhXLkxEiBL+ZtIZkxV7lrJ5TDHV07tWIkzMplHJmN/qSLX228kv4Tg0/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com;
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vMLJbdOpfHG63MP8VB14fg4rzHqLyuvfrpbIjSDncH8=;
 b=p1/MvgAiU4KAzA0ncIy8ojKqA4u+apylv4nLDAXNobKZAhTWwTsJVzSZfWmb1Jm5VW1UUu5W3E9VwvhGG5+RtNQaqUtxhwygRC6eZ1cHjGAk98h+dlI/SZkPc9bANhLGMsDFzwNHKGhtt8cavLM6f8weLQnr8j/HfrXYbfpo55w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
From: Qing Wang <wangqing@vivo.com>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>,
	xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Wang Qing <wangqing@vivo.com>
Subject: [PATCH] block: xen: use time_after_eq() instead of jiffies judgment
Date: Thu, 10 Feb 2022 00:29:23 -0800
Message-Id: <1644481765-14435-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: HKAPR04CA0006.apcprd04.prod.outlook.com
 (2603:1096:203:d0::16) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e07e6ef-8ee4-4f1b-b504-08d9ec6f7608
X-MS-TrafficTypeDiagnostic: PSAPR06MB4005:EE_
X-Microsoft-Antispam-PRVS:
	<PSAPR06MB4005B79F3FE0EA98362C655ABD2F9@PSAPR06MB4005.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gYhCSwONbXwpQvV/K83FwTHKx+g4rBUrJPxa5k3v456D9+YorC2ygNjsvfuwUp0Rbr73l6YVVL9jKflkeznbd7i8nZdINUEa7p+W7I/WwO5NCSUz4QrNFm3SkFGONJh4VB7bLKUzxUGE9xA71wR4L85dwB3NMi1r7KkxlanIP1m1PFEksB8fus21ypBFM0M086e2uZTbdrsX+cp2/BeT5MrGyIVMYAfO4UBmu8uwAmjv/7yiRlPQkSICXVxDA2GknhoExdTYZUvWFXM9c7rcCxdcIEWDkgPAyGbSdah1H2tWazftelDr/Alyp8Mxd3WNwGGD8VM9ScMA1T9+rFc0bKAtH6YUhN9VbIYzfIHOWuNDExs5E5WqlVeBqBO4RfgJNlVx81GrgTb6qW0WD0G2M+l7NgNZbSZFXaIiAVWWBQegMcxAI1EvmhqvK1ci7Xw/BvtF1axSA4lHD92MJuWkgC6/VNt9xUd4ZesYSQh0RN9jSWXpSlDHO3Rzf07Nco/E9VtkAa5jtc2lDQLddFNUQyVO0JzcawX4krreOnyvLFJ7bGg9x+jkDcngAbHtQlc4o5QlWnR3f6Ip80PJM4W3JETq47yKNhr9wnD1UEUrwrGDdXuQJSoQa1mdJr2OQD1citrkoHwHctsNKwUuGot5dA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2PR06MB3082.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(8676002)(66946007)(5660300002)(52116002)(8936002)(38100700002)(38350700002)(66556008)(6666004)(6512007)(6506007)(4326008)(6486002)(316002)(186003)(2616005)(110136005)(36756003)(86362001)(508600001)(83380400001)(107886003)(26005)(66476007)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9jjklfMSt33jCOQuhnw1XSRiFo390ZAaUqzq3NvQWiQNv13AgOh7D58PvSHic3hJ8QLXqCp3M3AmeihmWLthw/acdeunEDbl+F450jJs1QwcBvQtpdIvzD5r/7M8c8CjVMNwkF9YYQVuQJm5r46KLC08Z76GwOQ/0gl1flc9ekvEvUqCOsgLI2MTWM2pCCtIkaDaz9x8+IK0f9mMoIGzrSIW55sDQfWLkYixqGE9GDhmptuKKznWY2NtjkGCdHUHWbu98EM/NAhW0DyOcxZuh2iV3dWkh35hGPAxPVfVAgJNgiCNU91UuwKbO9GePWlyvJw9CxcefG3LbYokLYInfF/NDrGDeYoZehsXCowy3VlF8wKR5nc3/sMIwEMampa3xeZ7kEi0mFL0M9GkPRqX8lczoIy90v2JSbpLKGuo18BfN91hub3Op75Ghg/f7JLz
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e07e6ef-8ee4-4f1b-b504-08d9ec6f7608
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 08:29:31.9973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VXKod2lep4QackxmebRQK8TyNiTGqztyAvapjB/v4wF39WAdlGcvtmbbZKuMARgnlCBPpwZtI4YFjkwZSxUvsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR06MB4005

From: Wang Qing <wangqing@vivo.com>

It is better to use time_xxx() directly instead of jiffies judgment
for understanding.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 drivers/block/xen-blkback/blkback.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/block/xen-blkback/blkback.c b/drivers/block/xen-blkback/blkback.c
index d1e2646..aecc1f4
--- a/drivers/block/xen-blkback/blkback.c
+++ b/drivers/block/xen-blkback/blkback.c
@@ -42,6 +42,7 @@
 #include <linux/delay.h>
 #include <linux/freezer.h>
 #include <linux/bitmap.h>
+#include <linux/jiffies.h>
 
 #include <xen/events.h>
 #include <xen/page.h>
@@ -134,8 +135,8 @@ module_param(log_stats, int, 0644);
 
 static inline bool persistent_gnt_timeout(struct persistent_gnt *persistent_gnt)
 {
-	return pgrant_timeout && (jiffies - persistent_gnt->last_used >=
-			HZ * pgrant_timeout);
+	return pgrant_timeout &&
+			time_after_eq(jiffies, persistent_gnt->last_used + HZ * pgrant_timeout);
 }
 
 #define vaddr(page) ((unsigned long)pfn_to_kaddr(page_to_pfn(page)))
-- 
2.7.4


