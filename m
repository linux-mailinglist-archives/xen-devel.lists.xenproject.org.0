Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QO4xO5mb5mnCygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5883D434210
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287765.1568187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwEp-0000SK-Vi; Mon, 20 Apr 2026 21:33:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287765.1568187; Mon, 20 Apr 2026 21:33:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwEp-0000Jn-KT; Mon, 20 Apr 2026 21:33:03 +0000
Received: by outflank-mailman (input) for mailman id 1287765;
 Mon, 20 Apr 2026 21:33:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEwEo-00008s-85
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:33:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEwEn-00CD6F-LC
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:33:01 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b6b-2eae-0a2a0a5409dd-0a2a450289b2-48
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:01 +0200
Received: from [52.101.53.79]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b8c-af86-0a2a45020019-3465354f7b1e-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:01 +0200
Received: from BN9PR03CA0281.namprd03.prod.outlook.com (2603:10b6:408:f5::16)
 by LV8PR08MB9219.namprd08.prod.outlook.com (2603:10b6:408:1ff::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:32:56 +0000
Received: from BN3PEPF0000B070.namprd21.prod.outlook.com
 (2603:10b6:408:f5:cafe::c0) by BN9PR03CA0281.outlook.office365.com
 (2603:10b6:408:f5::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:32:55 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 BN3PEPF0000B070.mail.protection.outlook.com (10.167.243.75) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.4
 via Frontend Transport; Mon, 20 Apr 2026 21:32:55 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzzHB4R06z1wdP; 
 Mon, 20 Apr 2026 14:32:54 -0700 (PDT)
Received: from CH4PR07CU001.outbound.protection.outlook.com
 (mail-ch4pr07cu00103.outbound.protection.outlook.com [40.93.20.99])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:32:54 -0700 (PDT)
Received: from BY1P220CA0039.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59e::7)
 by DM8PR08MB7526.namprd08.prod.outlook.com (2603:10b6:8:9::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9818.32; Mon, 20 Apr 2026 21:32:46 +0000
Received: from SJ1PEPF000026C8.namprd04.prod.outlook.com
 (2603:10b6:a03:59e:cafe::20) by BY1P220CA0039.outlook.office365.com
 (2603:10b6:a03:59e::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:32:46 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 SJ1PEPF000026C8.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:32:46 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:32:43 +0200
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
 b=ITXgFYmhRlJWMthx+bteFC6wDJlWh5Lce5W/JQu0h7L3x/lrs3bGixjiNu80b7YTvyCXJtCLIi35/XDoB4rc1cbEbz7HHIg+7gwhBnGt4zWY8avqmLcxvvtgsaL+f3njGXi6V2dH8vzXomvfXCYsYUX4DgQAa7UY0b/D/IHWCc/sjQtuKl3snWSBq6OrD1HpnKJyHs6bXpLURC7UNtoAVExQgts/a7eGuwZujIAwPlM4Asz96QbRlXre9OJNqukNLUU7sfBhD6pDyvq3eTHFgqLNSK/hizClwdePYxc0IjWMXTc3ky+EZ3uIuEPhScf876IPR+U3Hvt20nX+ZGTpCg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W3upe/u9EtcR35MDKboxPwogT42enux6AtMfl8vUTCc=;
 b=JXRv3KDvPC+2M25eC7ZTrdWHeE0dciYxgjXC3iq3evWgZAwlSXfc1ov7nEnoPFkzcRp/GteYykoxNAxh1lHbusl/+JLivcQbTvR2jSh67j4QfVOn7Kit/8hW1R3TIOrNsJL1QlTUiosxtrUuCdbChL09rFkjuUqfFzdp5Mxio87jhQhbhSx4uR+7bhH8+dbYZnlB0BngyJvg8N2E9mf9/iJo7fDudyeCnlsOx/5Qv5MzkrEELi6KouP8taxWDjx3APeSn7IOHzm2c4MYge3tNmA7YWDGsTom1T6QWm7N4ve6r0Qq23MK1qnFdEvSufuo4H1TyhGEKOcXwx2M/C5y3w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.20.99) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W3upe/u9EtcR35MDKboxPwogT42enux6AtMfl8vUTCc=;
 b=WRcJe3HTC0eKDE+EVpUaR6HOkaLv2epLDLH5L5rx393wZ5ObOEc6LrvwlqBbqe1Oi9IDTkZl3i/2m9VVY9APR7liBI043aexjI5OFGxNdQF8FCc6dcLWMjHxGIaQl5HyKlbgr/hPTztbzcw2pPx5lbYUSdwuOqDUZlbUUaQ0alU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.20.99)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.20.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.20.99; helo=CH4PR07CU001.outbound.protection.outlook.com;
 pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OAX1nxFOYuboaN0C8RWRQXhKY4QYG9Dwd1R3W6PN3Qt8Z3OiFAf4FblTxKBWtC42z5Je2ZK3GgYRg9+3ylw0G13r4Z/4RLMl0xCGdlUjjAUWpUNHfLhAUHjTaxkittpNyIuU20A5AlRfNdBwwujIx9BdtF+78qfyxqv80D2VOGgqI4Z1VOQVsLXUr9PQTjNOER5a1YThPldlfU/v050kvPD59SIZfxQdmTDTyg77C3oqHJvZ+macg9MTu3Uxz1F5hN+m577KgoswVb0AatTqkm+mOTT6pYgRfxIZITyIQrDr8eb2b4keiyPS0RY4YM310fPUY3Dsv9NB2uYLJyWgEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W3upe/u9EtcR35MDKboxPwogT42enux6AtMfl8vUTCc=;
 b=POoprVeFu8yymL1KveJYRQCqR6WwNkQGnU2OkGdgjql45hpsQWIfy0N7UCLNhyePCLO5SJGRcizNwCb2x8U207/LRZrLDUftpb8nvqm6QV1DjlkQPHWJPTTT5rx4InSzVHA1Mi1TpK+IzZv/pDAv3fLyZA9mWnA1IRJ0poQNUTdCJfAvF0S3UEd6yoiAivvnV6UNsUSzZzq+xQTo48Yh7vCRxv3CvMuZIhn52Lv1LZ+N1cPo9Z/E3bzBj6OBeAjwELPthlHnNpuZgJ8MIfkjyRNs2oxKOlXZbcpcBC00SjaKKSV4cNQk12wmT43BTP56cbMFWGwJuTGYGgpGB4QBcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W3upe/u9EtcR35MDKboxPwogT42enux6AtMfl8vUTCc=;
 b=WRcJe3HTC0eKDE+EVpUaR6HOkaLv2epLDLH5L5rx393wZ5ObOEc6LrvwlqBbqe1Oi9IDTkZl3i/2m9VVY9APR7liBI043aexjI5OFGxNdQF8FCc6dcLWMjHxGIaQl5HyKlbgr/hPTztbzcw2pPx5lbYUSdwuOqDUZlbUUaQ0alU=
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
Subject: [RFC PATCH v6 11/43] arm/altp2m: Add support for HVMOP_altp2m_get_domain_state
Date: Mon, 20 Apr 2026 17:31:34 -0400
Message-ID: <20260420213206.208750-12-Rose.Spangler@elektrobit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420213206.208750-1-Rose.Spangler@elektrobit.com>
References: <20260420213206.208750-1-Rose.Spangler@elektrobit.com>
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
	SJ1PEPF000026C8:EE_|DM8PR08MB7526:EE_|BN3PEPF0000B070:EE_|LV8PR08MB9219:EE_
X-MS-Office365-Filtering-Correlation-Id: f01228a8-c02c-4955-de26-08de9f2462b1
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?hYGqKqMyvWU9lXXEFEUiMOUlIHRS4AeuEiuH+DpQGz8IXkeCHI9QOJvGEIwE?=
 =?us-ascii?Q?EhDK5wFmPK/b+LReZPmCy2qc3vZhIoeqoZTp13YV62K6FzwGRbUCogQdBKWn?=
 =?us-ascii?Q?tnpj5i0cQK2S1F2obe0wu3uzSo4knZXDB+Nz9wv79z/HJI8Ed7M0dObJ9k9/?=
 =?us-ascii?Q?4ttZy4D5KX9EUjEP90ALtCnk9KvhRz/Dje7rfom/GRBG7wjhFeSh7uZ641Rs?=
 =?us-ascii?Q?bZy/DMbYSJ1UOxN6WrXR9jYs+PCqwIjx38DGZzqmOyH9cNe0aCYMThTHzghv?=
 =?us-ascii?Q?/SbHjQ3h7bWOMaypFEq6QMSqq/UPHkbloF1aw8zyaX3PdhNjD65HqIfX86qf?=
 =?us-ascii?Q?UAOI5UExm3PqhOceDiq0v07ayZ15i9yYXvPzyoLbNjHfAnzdsTBU3Q7GEVxq?=
 =?us-ascii?Q?8Uc6l/SJgMaggyYiZtF4D818tpCepmPo7KIHU754Vs2QgFgrd3IntdqnDUO0?=
 =?us-ascii?Q?wXUCquwp+4CwgRwhTKjZ8vTioCefPc5X+wcZEXIT+hhEzGfDCpWsyjoOmyUz?=
 =?us-ascii?Q?H8zdIRbDTo+CJaaAcdpx+UeW6eLZ2JniZrSv6eRRCOcZYVwE8AbJwW4OawbV?=
 =?us-ascii?Q?pOnM7H11QwtBKbdj3YRKGvw8KZR9yV/nQX/63P9AuoncPe0hk8tjuAkq0oPX?=
 =?us-ascii?Q?XWPMKT63VYP5LJjXcejVx9rStt7V5028Q9lXu4rfCcEBUccNCXJPlpS32zv2?=
 =?us-ascii?Q?RD/PBSZuya0ZkwQRAwjiNVJ36zdLv0OBWWPKLgW05hLe7NF5lMDjm/ljDrd7?=
 =?us-ascii?Q?xWrMevsg34RninQrDJjJZeJmEmOQy+k/n9v6hQB/7X7iyZAncXW+XSzuUuVO?=
 =?us-ascii?Q?U+OqVLBc+hAFWacHehIu3+D7xvJasRLMg1w5vfUkp7m8YsK5881+WhxvAoGh?=
 =?us-ascii?Q?lNCjnwCAmQQAffTOkP85tMdeYdLQG93JtJdKNVKkP6YQHVHIJXAdqSi0lZ79?=
 =?us-ascii?Q?blgccPE3l8HuyYVmUtHHmOddEHVzf0ZXmz40XVCAWaGB4Hp9x0tKRLOF05M7?=
 =?us-ascii?Q?9m52fNO8YwUzmegtgt15ryAaoG1esV+uX3/lrMg9mJzo2qWjeFz9Way3P5pn?=
 =?us-ascii?Q?9I4BudtO1FYFS765oOTYKfcM0WyXksBpXXT81oYzgEBh7Jfg9sgG9E/si5Bf?=
 =?us-ascii?Q?CjOf69ImrJ15FFpBKGUOujvgjkeNqrkSvKmUnCZRdQOQxhcEx7X0hlJRIgrH?=
 =?us-ascii?Q?3xOJO85Ls8O1uZYHe5WwWEz/ciNCuHLWul4HlJLNef+jkSlQcV/XPpgsbibz?=
 =?us-ascii?Q?+XxuvtlchSU1CsdUl9CCJfVcFOQVM05mbuEfBlyEnA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 SD1M68ce2XIfO93b+ZC3s9e4zpqX2C7v9qjBgvP4XY1lUmpS4ACzMlZNgE2S0dQqI7TEID2YnYyfwJZ2rqTSVg9O5/Mx9PuHq53W7LQYkEKMvLqxu2pevMnoaV6t27EekXhzIxGucttMBnoIw7EDgS02P81Xk9PJLxJVrI881R2mGQKTyA+HL0ibmsnQusBKU1ljtcZ4SJs3IeH0panl5RV+j3tuHZCzwXz8hDkhT3jaYMN63zfFVabJ5h0vL8If9guHN1ODqfq/szedmOYM5oe7XJvcpGyUxo34qoiOsV3amP3F47T70P7r7yag63cx0kUsEHNhRU3e8qqIPsFuhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR08MB7526
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.20.99];domain=CH4PR07CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.20.99];domain=CH4PR07CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 BN3PEPF0000B070.namprd21.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f8ec3c23-5058-4cc6-905f-08de9f245d45
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|14060799003|36860700016|35042699022|156008|82310400026|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NMMDxcMGKNpoKvc0ufye+b60cuWFafOlpyXikUw72klxvzy3etbUH93PMbWE?=
 =?us-ascii?Q?r6uG4nFEXuQQaLKoa6/FheG5h84nwBWbWKWVPvSAlmvjmYVHziR5fMy+z5FN?=
 =?us-ascii?Q?XNhx2XDHrVjF9wdxeIcplxx+dH+8/O/zXHsiII97q65H9C+i1ar1ijXZ50oh?=
 =?us-ascii?Q?aH7Z93Q0BySHvBUcqHmKojdzIyniozvs6bXgpMSpVTYByVLH4gDKKOSjPjdP?=
 =?us-ascii?Q?sNy42x9Cmcsev4OYkEod+WJjcmMdAHNWD1lHx4PH7e9VFCx2DTAKuKNCt4hv?=
 =?us-ascii?Q?McUlIT6terfvcrgySG2kLPXZ3/4i8+Ngkcqk0Hwv+B3lQgKXPqdQKeqodNhg?=
 =?us-ascii?Q?fdmEZmoKeetwI3TW28qDZRR2GxvE6iEa7pEUA3o+USc6sjwTxdVWJrB5i9c7?=
 =?us-ascii?Q?Fn1CFswLcdoqFNt8Sx/HwTKIl2EBh2BM9eumIdBRLmm8pqu5Iumd99XU3rFO?=
 =?us-ascii?Q?UmT9u9A11kgwmwggOQxwJql73jK1BvJpTCVLRZl9jDMbyQuZanVfLAo5sYOU?=
 =?us-ascii?Q?LwZYN0zgR/yksDPpDJjhRSl8Jmla0A1IA4xTd5ZRS0NWO8tjJWa7Bo0C/AUz?=
 =?us-ascii?Q?8pvcgTAUy+Gu+iyPBpDuRGwQUYGiztnTRHA3korxUYU7YBrnyXu4VtEM8OG5?=
 =?us-ascii?Q?aKHvMYOx3MGdq/MboN8njyO2lea0DL8Dd8g5/l4+PWbjMTkkhge0EZVzq3dC?=
 =?us-ascii?Q?xrTTEXSmB8+WfqDh5MMUjcAroTPGMMwvQTWaaab7z4d9srzyY+J5SSzVQGjj?=
 =?us-ascii?Q?4fSH6NJPz0PMQ5WNHLdFjWunlepM1HXQLSNhd+nciUlhamOxVp3HrwOdJTB6?=
 =?us-ascii?Q?zYczOZosxv1FDQ5ALUbhyVgZr46DldjPhXzhgDez5OCEoDVbOQyhkUBQ0ANK?=
 =?us-ascii?Q?ALP4ZINpdv5cL57Tc99JFaj7p8cwtEceHwHUQwN0WYxY0ikNy+omEGXKHpaT?=
 =?us-ascii?Q?Q/shsI8TG8n6iO7fzClgLsWP4EIagkfgtBwCcxn1wtBqb6XCs8SUtdbPmTL5?=
 =?us-ascii?Q?pzhpFeCh/QLrRPVYmF6sHkVF4YsmohcOz73bIZd/RlTglJ1wYPmd2m4MRhxv?=
 =?us-ascii?Q?T3VKHOu1z23CLye4wBwmbc28MuQ7vTzrD38lpW9EOKRMzAR2vxRhWdT/5YCs?=
 =?us-ascii?Q?M5bl/M8JptbU2F8HY+5X4ieVW2M2tJwDf/3S1EMhm++Xnxpp84Y4wKUnHxv4?=
 =?us-ascii?Q?VuPus2dbUyCGw5nt7DMFyxXpsrhCdl5X5UsfMjxzI7JmXTWwqpU205yWNJyi?=
 =?us-ascii?Q?PdUe9NtUd6fYKBxcs4sNbH1WEaqrc1s0WQFUGO+iwQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH4PR07CU001.outbound.protection.outlook.com;PTR:mail-ch4pr07cu00103.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(376014)(14060799003)(36860700016)(35042699022)(156008)(82310400026)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ae0uBpfE2g6Q/BkFzUX+nmd5l+Y22qtfMRMNK8diJGi+pDTyPCe9RZ2um+Rf0I+eILzODBY2ryXO7T63QeyeIoQMFhOUYc3SCZkaLcEK0BIfVtPtWUKD0WcIFbMIGdREhmKWKCQ1FZY8Y9Uj8KSA1zAl5C8XVBzMljmjtwEuXKoTEy7LsqvMO6Y23pSz+wZ6LHx6e1YM5Nr4wOpoDNPVkEXaPc9T7U5EvyA6OaW8fzoityrE/GgpQ3mfPWox5YZqbGSzFk0qwdPTsZqlA565zCEwx9OS2ZWUIS75rdFCEHJ49rnzNzB/6drW1u7o3SXuya0gOtdePeN7m+9K8l/cqla5fcFFtVLdIYTWxzd0l9XPlvKs4Ax2BJBukhvgXWeDvRul3ySFXR79bzRH9DSt0ciDE6ailnO4VrhF65t/1hauHMxFxXBCVwhCq7f221xl
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:32:55.2570
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f01228a8-c02c-4955-de26-08de9f2462b1
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B070.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR08MB9219
X-purgate-ID: tlsNG-720697/1776720781-894CD161-697DBD9B/0/0
X-purgate-type: clean
X-purgate-size: 1215
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[elektrobit.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[elektrobit.com:s=selector1];
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
	NEURAL_HAM(-0.00)[-0.294];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 5883D434210
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This commit adds support for the altp2m_get_domain_state HVMOP on ARM. All
code used in the command implementation already works on ARM, so no further
changes beyond moving the #ifdef are necessary.

This is commit 1/1 of the get_domain_state phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.

    This commit can be squashed into the previous commit for the actual
    submission if that would be preferred, but I thought it might be easier
    to understand the command #ifdef gate approach by splitting this into a
    separate patch.
---
 xen/common/altp2m.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/altp2m.c b/xen/common/altp2m.c
index 6481fae1ed12..3a3283f0860a 100644
--- a/xen/common/altp2m.c
+++ b/xen/common/altp2m.c
@@ -124,12 +124,12 @@ int do_altp2m_op(
 
     switch ( a.cmd )
     {
-#ifdef CONFIG_X86
     case HVMOP_altp2m_get_domain_state:
         a.u.domain_state.state = altp2m_active(d);
         rc = __copy_to_guest(arg, &a, 1) ? -EFAULT : 0;
         break;
 
+#ifdef CONFIG_X86
     case HVMOP_altp2m_set_domain_state:
     {
         struct vcpu *v;
-- 
2.34.1


