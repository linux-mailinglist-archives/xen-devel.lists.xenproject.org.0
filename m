Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id hQ6uMLCX5mnCygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:16:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2B4433E9A
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:16:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287407.1567826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvyQ-0003nv-Rv; Mon, 20 Apr 2026 21:16:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287407.1567826; Mon, 20 Apr 2026 21:16:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvyQ-0003gq-O7; Mon, 20 Apr 2026 21:16:06 +0000
Received: by outflank-mailman (input) for mailman id 1287407;
 Mon, 20 Apr 2026 21:13:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEvvb-0003dD-PI
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:13:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEvvZ-009PGD-Kh
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:13:11 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e696e1-5cb7-0a2a0a5109dd-0a2a4502cc4c-8
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:13:11 +0200
Received: from [52.101.56.100]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e696e6-af86-0a2a45020019-346538647a89-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:13:11 +0200
Received: from SJ0PR05CA0037.namprd05.prod.outlook.com (2603:10b6:a03:33f::12)
 by DS0PR08MB10990.namprd08.prod.outlook.com (2603:10b6:8:2f1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Mon, 20 Apr
 2026 21:13:06 +0000
Received: from SJ5PEPF000001F7.namprd05.prod.outlook.com
 (2603:10b6:a03:33f:cafe::69) by SJ0PR05CA0037.outlook.office365.com
 (2603:10b6:a03:33f::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:13:06 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 SJ5PEPF000001F7.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:13:05 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzyrK1wX8z1wdP; 
 Mon, 20 Apr 2026 14:13:05 -0700 (PDT)
Received: from BL0PR07CU001.outbound.protection.outlook.com
 (mail-bl0pr07cu00102.outbound.protection.outlook.com [40.93.4.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:13:04 -0700 (PDT)
Received: from BL1PR13CA0201.namprd13.prod.outlook.com (2603:10b6:208:2be::26)
 by LV2PR08MB972943.namprd08.prod.outlook.com (2603:10b6:408:3a0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:12:59 +0000
Received: from MN1PEPF0000ECDA.namprd02.prod.outlook.com
 (2603:10b6:208:2be:cafe::59) by BL1PR13CA0201.outlook.office365.com
 (2603:10b6:208:2be::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:12:59 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 MN1PEPF0000ECDA.mail.protection.outlook.com (10.167.242.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:12:59 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:12:56 +0200
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=elektrobit.com header.i="@elektrobit.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=selector1 header.d=elektrobit.com header.i="@elektrobit.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=IrSVasPxxTL0ZoO04U3adNpaITcw0dKBtlYntQ5eok0bqKYlg01/5wdyS3NipqniU6dS7jY200+ihHSsNi1+7KxnncGaFdFDkdney/3aMCAwK5boTa7hjiodELdk6Yj+wgtC5KbQF5lHqn/Rs8Fzxu6o6YPTCSN9p35twZUaVidtyC12jPrzpaVrLU2JlgmipJ6oZMxPDCE3i2mjmYdpNsCZxMVKH1Zg0PDOMAOsyBcZCki/ayPXXgc9989eypsbUxOLzFO6FCDZ8vFk+GxI7eH4Aq8JUJKi44dWT27i5Evye+zqFsIoku+jhs8OeZQCG5eoa4pPp//ZwQZtcu3T/Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RIbbeMLPJ1Oc8O3jfNscoU93ycEkxovMGroMGjaJzMA=;
 b=kx6JU8Vxw1NGJF2koco4PrqFYSbI+3hHE1NvOqRnlF0TtcO6+IUM3Zy94yYHtpf9uN6GcVPZlIFpVBOxV7NBQLbo6YtKkm0lG/hbrjmHvUud08+cg7KnJ/H0DC8yLiMROc9fvf20ZzwJwGmyCPj3cdQAyrW5taGbXrggXQLH0ekX5skzQQnA10xt+i/Ak1JuiLJ08Y0tLkRfe8gXmeyN03ajDGDVKSoYOrUC9k03TpeafWXK1cOBwsVr1qyzqgT7xjlNjEprcIC3/DEja7BrW0xXU0K6HgK4yQsXDm267IXjyPgtEReh+xPyJjITD619eH60J3k3H3BLhuohAuScwA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.4.2) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=elektrobit.com;
 dkim=pass (signature was verified) header.d=elektrobit.com; arc=pass (0 oda=1
 ltdi=1 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RIbbeMLPJ1Oc8O3jfNscoU93ycEkxovMGroMGjaJzMA=;
 b=RAFtHgwZ8YEtMApgnUSi/BTrJoEf7v4+aFJI6DTEJj48uidy+UoyIZCgJyYMh9y3wuNyG1+rubU7DA0IVj9BxNZ0o9jScseIjxvzqfpZXFiYPWm8Lt5rHEEqbyVn99Ot8jCwVye12dK+LoSaFpfPNk9mYoL/BPgF8TGsr02+gPM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.4.2)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.4.2 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.4.2; helo=BL0PR07CU001.outbound.protection.outlook.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lmope0VixLC6eO48M+QJnuN1F4awexcIjSjvK7kqTbS4Vs11bnvMYY4fHQxrO7Z399pJhbCR/oihkQ131AqrI0lLAGvLPxAIiPU5ELv6mtKMNiJkMilM+yZr7OKZGiFuCJuOQD/UURDRCrq/M9Xszm/b+na3dWJ7pmitHm2hp5HzzYzLS1jR9N2MCc/4x7myAcHDAN2/Zfa7uaMQN9jXCCbzlTq+TbJ/3DQxiTU13uID5AO7UoGfPRXodgFoLscnRXYyps/8PIxzGASOaab3BH2XR/7DwxNCBIDB3HtFz1TGCjdYCEtGbjXvK3KZbpr4GTRe/5uS3wG13QocKGtizg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RIbbeMLPJ1Oc8O3jfNscoU93ycEkxovMGroMGjaJzMA=;
 b=T0LCJB7rL/UY+egkfN296qSV9whVNTOg/bnzGkQZ3LjUK1m4t6rtX6sBfD+z61TCPwmxAP7CQW1wwqkTpt+Y2NHajbz5SbRudvkewKsUZtEpZcdXa7rP+lxmIv42qect0XbJgODdJwAojYjFIOXyaP0WkFjYhy67l4osCRA/4U6kWsP+NwxjXEpANgy2WXXcsNjwtUNsJX1qYlN9f2KtRcAILd+kKWmZCejUFVQOswPpe6EA27BAJskhY+Am7jwFL+FmqJCF1Tzva1vCE2u2PQfy9afvLWp/P988OfM7J5wbDUtnVsIsirQZWxieU8ERRs7HtA6CN72EQH1+JWEm3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RIbbeMLPJ1Oc8O3jfNscoU93ycEkxovMGroMGjaJzMA=;
 b=RAFtHgwZ8YEtMApgnUSi/BTrJoEf7v4+aFJI6DTEJj48uidy+UoyIZCgJyYMh9y3wuNyG1+rubU7DA0IVj9BxNZ0o9jScseIjxvzqfpZXFiYPWm8Lt5rHEEqbyVn99Ot8jCwVye12dK+LoSaFpfPNk9mYoL/BPgF8TGsr02+gPM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 213.95.148.172)
 smtp.mailfrom=elektrobit.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 213.95.148.172 as permitted sender)
 receiver=protection.outlook.com; client-ip=213.95.148.172;
 helo=denue6es012.ebgroup.elektrobit.com; pr=C
From: Rose Spangler <Rose.Spangler@elektrobit.com>
To: <xen-devel@lists.xenproject.org>
CC: Rose Spangler <Rose.Spangler@elektrobit.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC PATCH v6 01/43] altp2m: Add template common altp2m.c/altp2m.h
Date: Mon, 20 Apr 2026 17:12:47 -0400
Message-ID: <20260420211247.208474-1-Rose.Spangler@elektrobit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420211104.208444-1-Rose.Spangler@elektrobit.com>
References: <20260420211104.208444-1-Rose.Spangler@elektrobit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.10.178.50]
X-ClientProxiedBy: denue6es012.ebgroup.elektrobit.com (10.243.160.140) To
 denue6es012.ebgroup.elektrobit.com (10.243.160.140)
X-EOPAttributedMessage: 1
X-MS-Exchange-SkipListedInternetSender:
 ip=[213.95.148.172];domain=denue6es012.ebgroup.elektrobit.com
X-MS-TrafficTypeDiagnostic:
	MN1PEPF0000ECDA:EE_|LV2PR08MB972943:EE_|SJ5PEPF000001F7:EE_|DS0PR08MB10990:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e3a45e7-31d7-44a6-107f-08de9f219db3
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?q5q6TxtKB78aoiFGp0P1iHO626Hji1KpXr4f43/p4McS6reY1OnMtgvgjBGI?=
 =?us-ascii?Q?B7gFgvTMVVbZjTGpP/Gp3tKN+WEc0u698QGZwBtVbhHhSorjjWpT0vMnNfz1?=
 =?us-ascii?Q?dD/3gFB2Sewc72E6J04MHk5dA7XDoaR+kSmzQ8CjVPZVkPbcoYTdv+zXzLUy?=
 =?us-ascii?Q?LPprGGNRiGVA/gkDHPwSR6Or7Z0forACBq8gOsRGK4HZsFpEimF32dpfauFT?=
 =?us-ascii?Q?CT5Ampc62RwjEmuBTLHy0jwV7WI7N3OA4hYqYp3c5XWpBQYnfUqNeB67GEtG?=
 =?us-ascii?Q?mIDIOC9QlzCD3NWWvvjsc+7UNDqfR1j6e0XWBylGB1HAJlEVWGX7lMI1B043?=
 =?us-ascii?Q?H9p1MAP7lGvS2l29r4q9aLhngjHdMGNuxcDqwPWDdWR1/1EzJybXskWBoQwU?=
 =?us-ascii?Q?oZKCSwySdFgiSh044QWZ14EDlfTXMwCI9kRVDz+Qxsl5lASMf8VX1m0V5tB6?=
 =?us-ascii?Q?f+eXiTBCnf2b3oHyVcL0F7IUmkwTWgZigkZKxOS7MqVEeJhwwUvLrAkE6u9/?=
 =?us-ascii?Q?oO7fB3iKwtEQWyK8WVteaPXPFojKdEpGCyi7NtFUz/asBVwWYqFFSdj+/JAI?=
 =?us-ascii?Q?FUn81+OjzhfilJBbs6tpfWJTc1kulcGS7JAyvqvvtbKCZETRhePLo/XBJP4S?=
 =?us-ascii?Q?n+8Y7AjGujV7etTV7NHJ3TZkz5pJ6/SiqygCJyYkPiHDI3j/kqO1ElydWodv?=
 =?us-ascii?Q?v8xsEaDUk2/K5a2Gc+vHS1oCesXvjellY/nFB7fQiJ2d+BVtEIOxjtSBIUX1?=
 =?us-ascii?Q?VYbP4hz2Ix1dzeB8N7DNC5/t1KUGgo1I6JOys2/12wZcRYfOCgXAOtdiFrYc?=
 =?us-ascii?Q?q+cRNQ/4nz3dAn+OQqIFwlP9US1miMRD/2n/5Jf76MjGe6s8z5Qg89uvZRvG?=
 =?us-ascii?Q?LxmF8xI5b0BR2kNu4q4ze9py9n8qBGUdQU8yejq1Yh+vGzlmT5N0k5GY9L2Q?=
 =?us-ascii?Q?b1QEn69gKT2Z0E/RRJasuGiaP+uiUPLhL6TvYVtFug9QQnu+PLJ/zYHqQsuD?=
 =?us-ascii?Q?ckMPrfmgawTU0piDTeecz6gdz6x6OpIM4NNLSBRm8AJ6rc9tpoKkhp2nPL6P?=
 =?us-ascii?Q?GLZT5eLEIEQbq8Usg5kN8lrs1nmJQY/wFHE1TbF+ykKPJ2mDGeEiacO6ymI8?=
 =?us-ascii?Q?tcjzuC1J+0V5vapMuWm5cJ0xp8qIZw25tiubxs8T+ChUohVV09tqU664v+Uw?=
 =?us-ascii?Q?6PmsTlqSiLm5DT7WLhIYwNi6K/+zWpVWkUh+8PmSAU0NrlHZqJ1zeh57yRaa?=
 =?us-ascii?Q?wSbE1w4iL3mUxgh0Yy9X?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 lKo/hXNivnCF6PqNSCv2PLuy5EPWMWCcdbdiMY4dh4SgkzsIm3LkvO6WzY08Bs9QbalgotO8tJL0b1fD/rb0tnfMDCXrB86AALrpkfNgnT2E9P6PV030BsN2K2+i/A1W3XHNNNvk35zToN9R+XoB5IOfTa8d6P31BObu1kS2W7Thtrkn9GwJq1zZJjleeHP7zXmDfHZtBoCXlrosMa4FSrixC/FatRwFhXN+Qy2zPYyRARRdV0rPP+Jgk8pU0j/ShPjwAEA1Gk6cmeV6sbJZSZWszMJ+ZT/JHaNKnuIu3sr8mo7WTgsFWdfPns7+w4lG6J405i/9zfYMcE70KbkDSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR08MB972943
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.4.2];domain=BL0PR07CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.4.2];domain=BL0PR07CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 SJ5PEPF000001F7.namprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	89f7e43d-b216-43a0-221b-08de9f21998f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|156008|1800799024|36860700016|35042699022|14060799003|376014|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MZ5FBXNJerC6s2Z4w++gFpk6Dmruxxtq0/we52UTO+v8nswj8o+cFN+pMORO?=
 =?us-ascii?Q?X9Vmr8nU4IzXNZEngTmXzWZBW54n836M0y8HtBDwG25GZ7qctnfDbElKvEat?=
 =?us-ascii?Q?3BiWTcjsHib+AhhbZj05WGO1NZqqdP71c5UQdi/jFLEGvdoFKY9DtTXnI1Xl?=
 =?us-ascii?Q?mORyOmIedZ/adNvOGv5q4T/G1eAtgqi9qZfG52Ey5MU4NuWNpIZkcIGlqV2p?=
 =?us-ascii?Q?LtcUot9Y8Vulo4W9uzuxH0fLZM1r2XJXkpp2Fwt9xk1kx1WcNmLtZgDoQ/3V?=
 =?us-ascii?Q?PQQHaYR3DDel/IDW427iIEQOYCRhxyPkNS0i391g6obvx2adyfCAe2xCdHX8?=
 =?us-ascii?Q?FY9h5/gbQ0Y5tzJW2ax59DkQ2VaoVOj/YCN7GzPaZ74e+7lbC1Y4UCTwqIjc?=
 =?us-ascii?Q?A6ADg97e1dJzss4XImAexuMNF4LHL0mBN8mFVh+ZkqIuokT6VmXCxCgcwO/9?=
 =?us-ascii?Q?/IrgtwZEm8N2Peuj9zEgekMtcEHelko8u35OcNwJNrKmbDfp0tufxTKKjpIy?=
 =?us-ascii?Q?XTybtggtb/5Rbg7Vuvhyuw2FaXfECu9a3VoCYZfjlPFADmrPKk43dlOesz+W?=
 =?us-ascii?Q?20BLwFbyWfP5oOdf0QaUw0bxJgZNAs4OlNZkT4lYAjMOQ4Un6IQfXNG49LmZ?=
 =?us-ascii?Q?xpWssGRHmA+noayhR7qj27M6+z/2cd+z/h/ZH5jABFWttqTWJoLKtWA31gJS?=
 =?us-ascii?Q?oMGAn3VGvdPgP69UWngVYq5Kvs+mCY5pdr32Xe6qsciAsM3jTIwnmEdn70JW?=
 =?us-ascii?Q?fBGvblqYHxRx+wd3bDdHngLGRB5VeDBDq/CfnNVptjI+00LtZjF1B4NAh+g/?=
 =?us-ascii?Q?qym+Cu0h6VvwK0tcXga1OICMPqcFO8ffbD9P6xjNy/cmarkrHHE5lLT3WH3s?=
 =?us-ascii?Q?f7Zf1/WmMZiGYpvsUlo+VGrg6efj2uRtic5UBZUwZ46LQfESU0pdX2PApXKy?=
 =?us-ascii?Q?d5mIsP8EXBUxw7Chamk/LYMtgJ2XfoyrPqPkGQ8BvMQofA0tyj5XTcwTlMBQ?=
 =?us-ascii?Q?BIZhz+8T0HVfSStr6XEY/I28u9fvfuFaREfyC+jXSS6bSX3n7iYx/PKZZYq+?=
 =?us-ascii?Q?vHQezNRnZelCHJp/+ekCw/HpocvYCJNWYI7iHv1dtQF6Sai0WvzACfvNyLKB?=
 =?us-ascii?Q?ywugcz1GXHmYzJ5sSbbTsg++EKH3cQtzm5tX8UuW+38XHdHIDI1bvvbiXhH2?=
 =?us-ascii?Q?NbI8/YDyuBXX8NXdj5eOpuAfA+ZgMZRLMCIYP5DbyuEPY9MHb1XZRdOHs1FD?=
 =?us-ascii?Q?N9YCEKO8RAChkEki8CJh?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR07CU001.outbound.protection.outlook.com;PTR:mail-bl0pr07cu00102.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(156008)(1800799024)(36860700016)(35042699022)(14060799003)(376014)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sR4DaRhWQa2mcqpExYDlDxIe+ngN2Egy9Y3wNdm/wjqpV+CvE/M2eMarg4ozovSwsa4ANuH/W515C7KPwioqRxpZNQ7blV/2s9JMxKRAP0gEamnb2lp9BsC5FaeaOXovNtdJln3Nk1D4XRweRil/RaCkMljJJRNeIeCfmd9WWoo4zQWtEyF8T6Iyep+36PnAdbK9ASqRGhBhSNulNmpts2/hi2BOpt061aPpDMrtgLVj/hSWOT4nHgwxISr2PeZ7csWLKcYpDRguCasM30LQ+M4bEpJ5Y5LqHTWv0cn0k0mb0oM0p4kEdXUBWaJzCJDTB2Nlior5az2QtFA2/XUEzID1CPnb+nwP/Tyv7eiRgx4mHETiAVC5e4h1eqDh4iT9RP9rkDz4vaoLXZ/IBj82x7woIgHnjUvNri+N1yOh3L5Oe8GhDF+IV1j9y3Uj42TF
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:13:05.9164
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e3a45e7-31d7-44a6-107f-08de9f219db3
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001F7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR08MB10990
X-purgate-ID: tlsNG-720697/1776719591-8A6C4161-059C4634/0/0
X-purgate-type: clean
X-purgate-size: 1801
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[elektrobit.com,quarantine];
	R_DKIM_ALLOW(-0.20)[elektrobit.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[17];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[elektrobit.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.340];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: EE2B4433E9A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This commit adds an empty common altp2m.c and altp2m.h file to be added to
in later commits. Creating a commit with just the empty file additions
makes it easier to reorder later commits which add to these files.

This commit can be squashed into the first commit which actually adds
something to altp2m.c/altp2m.h for the actual submission if that would be
preferred.

This is commit 1/8 of the preparation phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.
---
 xen/common/Makefile      |  1 +
 xen/common/altp2m.c      | 12 ++++++++++++
 xen/include/xen/altp2m.h |  5 +++++
 3 files changed, 18 insertions(+)
 create mode 100644 xen/common/altp2m.c
 create mode 100644 xen/include/xen/altp2m.h

diff --git a/xen/common/Makefile b/xen/common/Makefile
index 6018e256147f..dbe0094006df 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -1,3 +1,4 @@
+obj-$(CONFIG_ALTP2M) += altp2m.o
 obj-$(CONFIG_ARGO) += argo.o
 obj-y += bitmap.o
 obj-bin-$(CONFIG_SELF_TESTS) += bitops.init.o
diff --git a/xen/common/altp2m.c b/xen/common/altp2m.c
new file mode 100644
index 000000000000..1a4e102324d4
--- /dev/null
+++ b/xen/common/altp2m.c
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include <xen/altp2m.h>
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/xen/altp2m.h b/xen/include/xen/altp2m.h
new file mode 100644
index 000000000000..520328fd3fa8
--- /dev/null
+++ b/xen/include/xen/altp2m.h
@@ -0,0 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __XEN_ALTP2M_H__
+#define __XEN_ALTP2M_H__
+
+#endif /* __XEN_ALTP2M_H__ */
-- 
2.34.1


