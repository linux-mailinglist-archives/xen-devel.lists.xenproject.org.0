Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOhOFqqb5ml8ywEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5585434262
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287813.1568252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwF8-0003Yj-CB; Mon, 20 Apr 2026 21:33:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287813.1568252; Mon, 20 Apr 2026 21:33:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwF7-0003Kq-Hz; Mon, 20 Apr 2026 21:33:21 +0000
Received: by outflank-mailman (input) for mailman id 1287813;
 Mon, 20 Apr 2026 21:33:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEwF3-0002hy-O6
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:33:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEwF3-00CCKM-2t
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:33:17 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b55-bab6-0a2a0a5309dd-0a2a450b9074-46
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:17 +0200
Received: from [52.101.193.135]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b9b-212f-0a2a450b0019-3465c1872f62-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:16 +0200
Received: from BY5PR17CA0015.namprd17.prod.outlook.com (2603:10b6:a03:1b8::28)
 by PH0PR08MB11076.namprd08.prod.outlook.com (2603:10b6:510:38e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:33:10 +0000
Received: from CO1PEPF00012E80.namprd03.prod.outlook.com
 (2603:10b6:a03:1b8:cafe::fc) by BY5PR17CA0015.outlook.office365.com
 (2603:10b6:a03:1b8::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:10 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 CO1PEPF00012E80.mail.protection.outlook.com (10.167.249.55) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:33:09 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzzHT4Kfnz1wdS; 
 Mon, 20 Apr 2026 14:33:09 -0700 (PDT)
Received: from DM2PR0701CU001.outbound.protection.outlook.com
 (mail-dm2pr0701cu00101.outbound.protection.outlook.com [40.93.13.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:33:09 -0700 (PDT)
Received: from BY1P220CA0050.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59e::12)
 by BLAPR08MB6850.namprd08.prod.outlook.com (2603:10b6:208:322::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:33:03 +0000
Received: from SJ1PEPF000026C8.namprd04.prod.outlook.com
 (2603:10b6:a03:59e:cafe::d) by BY1P220CA0050.outlook.office365.com
 (2603:10b6:a03:59e::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:03 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 SJ1PEPF000026C8.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:33:03 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:32:58 +0200
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
 b=IFJXlA/Nw6uuO4y49dGJ0dPDVmj4uDbzdOl3Esj99/nzp0d3dGGyR5NgjR2OUwF0pUyq2KKqaoFStHZH/ER0Fx/5wbDm2qV0zRWPiuAjTDmoggmhCdTG5uXJUZYMKt2Cp4vKZ+59KtLvGMTadd2OsHjNCDpc+rspnOgLT8m9Jgw2fG77I+X9drprNWHzJw8+E9QRCHc7Zan0UXZCA23apKbP3WSPeY04igxv6zP2b2xjrAC8Oxiw/5XV7ubtrcbn4Jp+STxk2AbZbFmlQoWOTo7yQdPEvZlT+ETkpovsbcu3pJfJ1XT1J0DNSfQ8nolohTP0Ed7sI1lP8NvwHRMgLA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oIAPv9xmUqmZOQALhD1wFmf2mfwJESnPZqbe9aDV5X0=;
 b=BOkOTKWhwWIuzqYqVS3vZwbNjBPlP8RujWRPkoHudZn/btcts/opBsLifgx3mJvSBvBxaTt1ELJAJ/M/BoeiGHAHE3xPX6vRzt7vEuSWdo+oTTo03k8JyHPjpMrthLwxKml+TQLN+70xh7+vEzneG/eZHAs4WTXigixZAO8PdOMQfNuXOuwgUetVVklAMjL6jqG4zYNeGFhyPvpS/YnQraA3jadH6KiXze/iMznmWoWpn+bGJRyUOFb7b1xlJ0lAnWBP55rolq7xU89+9FHoHk4fbGGX/1XxtTmgGlnibruNoF4zAJEuyeZ6ETb1cKmLriMlQx5qxbvPVLHem4Qmuw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.13.65) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oIAPv9xmUqmZOQALhD1wFmf2mfwJESnPZqbe9aDV5X0=;
 b=Lz6qM0Rp6TNmDNRVEpLB/OE7gQ08Bles5NCjjzGY9a6ZG6wc+wgF0Bf029iQK0QBRDtYq35lwymAILdr0tP1lKsIpaDSOUDwsLmc+DshkxEbSTbwJ0guqWo1SUjJMGT6RsE7qWhxHVY0T8aQx9fDB3WfNloCZJd4Rra3ZH8JUKM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.13.65)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.13.65 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.13.65; helo=DM2PR0701CU001.outbound.protection.outlook.com;
 pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YjKY49tnTydtyS2qWDss8GOSgPuQJ1iR5LZ+DGkETfYvUzTm6YsjvOB0BszpS4pS9dBqtiagMB09diBp9VgwUGHqVCCLS2VSHrD5tfw/8nqZZO25KkOKy6VWUcgubLWq8qEUUKhvH4GUfP1WqpedIdRwaLlKS5An+PbYKwZ5vSmDw+B167a+cbVrhiXKtL1cL6OZCSSS6bMssy6xgQMuwu7DVfXYrckGCowbCVq7aJ04hYVN5eHjb2UJTT3bpvUt6IimBUOB4f2gd8j0gIq8byKRCcNeeWmze509nE6fHEnioyVvfu8pT+FanFrSVXtxF1wfPttMBG02jagTw1BcFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oIAPv9xmUqmZOQALhD1wFmf2mfwJESnPZqbe9aDV5X0=;
 b=gZG+4l/3cHaTiiDY7AvwjYr2iqbky5F8jqdQaQoZyHrjDxJL/sbds+D+Dd12fYIhviUKP9zKZLmDEDMvQi/zVKSWM8AnbE4NqdGx3bGOSjZ5FyvsjdvKmB5S/Ek1tygW9ZVQ0KcqJCd3vxEwxFabdBpsJ/AOYdrHbhn09QZdDdKzFWoJ3DbxKQnM7YUl03fCrEbi6wCn+WFqIAAEHrYpRUjObocMsiSTsGvRIT+kur1zy1ROpkjGr4C7HanIp7m9IRsuDGewMp1S9nh1AeLjTC5XQiAcG110QVN+c9+QOVXQtOktgK2ZF0P3hkCNuX+axGPvTFM7/AoMcY6JI7x+8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oIAPv9xmUqmZOQALhD1wFmf2mfwJESnPZqbe9aDV5X0=;
 b=Lz6qM0Rp6TNmDNRVEpLB/OE7gQ08Bles5NCjjzGY9a6ZG6wc+wgF0Bf029iQK0QBRDtYq35lwymAILdr0tP1lKsIpaDSOUDwsLmc+DshkxEbSTbwJ0guqWo1SUjJMGT6RsE7qWhxHVY0T8aQx9fDB3WfNloCZJd4Rra3ZH8JUKM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 213.95.148.172)
 smtp.mailfrom=elektrobit.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 213.95.148.172 as permitted sender)
 receiver=protection.outlook.com; client-ip=213.95.148.172;
 helo=denue6es012.ebgroup.elektrobit.com; pr=C
From: Rose Spangler <Rose.Spangler@elektrobit.com>
To: <xen-devel@lists.xenproject.org>
CC: Sergej Proskurin <proskurin@sec.in.tum.de>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH v6 21/43] arm/p2m: Change func prototype and impl of p2m_{alloc,free}_vmid
Date: Mon, 20 Apr 2026 17:31:44 -0400
Message-ID: <20260420213206.208750-22-Rose.Spangler@elektrobit.com>
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
	SJ1PEPF000026C8:EE_|BLAPR08MB6850:EE_|CO1PEPF00012E80:EE_|PH0PR08MB11076:EE_
X-MS-Office365-Filtering-Correlation-Id: 506760c6-d271-40b4-4ea2-08de9f246b3a
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?hshR0nMS4OSo5YHkJCHX27RuQkiqa/EVtyVd/3T/ljjmI0fTS/axaZLOkIMG?=
 =?us-ascii?Q?aJJnOhOCAqtoTHyoJjEbpZPWKSbuGWvjlX0jolym7vVsmLEQE7HJCs+jt1E3?=
 =?us-ascii?Q?qJ2YNxzziD2n9m2rUatySc8GypAkSw4ISk4F36rsmwtNHTeK63idOgAU0MIl?=
 =?us-ascii?Q?3mnaIQ9hawUqAMTitjbP4b2QCbb4jnW45qwpU28WRbxHYF9NDRWB97BEDmXG?=
 =?us-ascii?Q?xL1U+qroqs0d7MWd+6EJ+4L9g6Uvz6OwIU8EyceTEsTaiUh8n/NUKI3jOXNS?=
 =?us-ascii?Q?4O0Vv2U8cAcNW8Q0+qYz1PpFb+6MWbcVhIBplijL5wZLhZbESLzHBWidS+0S?=
 =?us-ascii?Q?ZBK7JFWBFdQ7DPUfg7XJJJzwDD6BDj8tZ1iRhq3Ft3iypvFi5ks5SI14peiV?=
 =?us-ascii?Q?w1A5936BiUgt1MaXrbmTenCfsvVagIlSES5GM2tfvpLosFQ09DNAda8kpGK7?=
 =?us-ascii?Q?V2Q0LySAzQZSjVMTfNJHbdL+YG5PiFsASwRZShQKAiOaUPBIahS/60jLqaDF?=
 =?us-ascii?Q?BD+ywY4f7ASTIoi4IMZTncJ1B79onX3heto2nQbIMkcWIRIzlwXwgy80/fOo?=
 =?us-ascii?Q?7lSqyhUUGH61wdmInNGnRq93W8WjaPtrJ81i0L0299twITUt+iXUXdZkFcgC?=
 =?us-ascii?Q?ulyixdbsZ1b60bMRjiC57PToOtE/BUf53gHG2wW4DjFGzG+4lDTO0ogmICku?=
 =?us-ascii?Q?Ua1BZSGILR0FmTB0lA4iI4KwR/8Bp+ujW70fSKc1YJ4wV9JlDCLbwezj0kk1?=
 =?us-ascii?Q?Gh/mdpski7YvQu17EPDacKRK4dgKLfA06As1gUTmREDaQKdHk3JHB+TCU6U+?=
 =?us-ascii?Q?aQUIFfaPjNtQ/YLl5Sk9H+OUenPDllyPHgLFTPtMCzk/5ZJrXEvQ61ZxPY+O?=
 =?us-ascii?Q?8/TNVFtHXNfDtqQFzvxWqgZtrRH9vYUEpALx0Ima+bjqXaDg2Nib0lv4cmpD?=
 =?us-ascii?Q?5me5qBcfL/22Q2QylsTn+xidZTU/EuJv7voiotzrutw7lqrGntwS/v4a7SqM?=
 =?us-ascii?Q?5pu9tS/sfzZCtv6Tc7DVynYc7ahoCZloxtQhi2/td0hkaA2pxq3+fYO3pXHu?=
 =?us-ascii?Q?6m4ioXWSoiDj6dCE8ScQTyIjm/qOmCDIpe5DpNikY0q2ovsc7c6rWi/Jse75?=
 =?us-ascii?Q?gLHF/ftj4fB/tcu7Q1evvZrTbQatV7vAP9J1WPlP89CktzYVxNS3Jj9TOtBP?=
 =?us-ascii?Q?pq87aQoMcAm7oQaGuk/m2GtWZAea3vT1KW8k9mBc3CbToCxCK3W5xNKbIjA?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 V/8dX3MBB7hb+TqGGVpuPOjqi3yill0SQbdcD/QLEO+d/wJH6VBC31FtCzSExNemKOR4/lQcLIGFq5WdS/d4V53K3kpF9vFZQVE0fzk7xPjOjEHA10RKljT5lL0l/bEvV+xif2pM/YrEgShIvvu6ATVrPCTNFz+bRQvxqjWJ0sb7i+z2LaeYlY029qHKcI78mCl1G0EAKn8IdLfKG9yoHGwEOGW8YzgWZl4azmHwai/6ViTmhDacnExaed+IwF0AsTUDhDq51KiqAxrNCdNprhhAUxXM8rKUUiiKPuYffmCWqU1++i0cNraj+0qE3lJQwrnoP9WJt9ww+vSiOMtZqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR08MB6850
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.13.65];domain=DM2PR0701CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.13.65];domain=DM2PR0701CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 CO1PEPF00012E80.namprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0ea5026a-c6b0-41eb-335e-08de9f24678c
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|156008|35042699022|36860700016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gKsJSLHddY95jEm9j0nm9+FRfGZd4GExHH6+SL4iCD5wNSjfSEFDnwEjQNzv?=
 =?us-ascii?Q?doktyHg4lDRNsfK3EJ+iYgHD2BG5kBC0MNB/W2n4Db4FlxgwPSKy1dh9p/Hf?=
 =?us-ascii?Q?5nSF19yRpcf452JP2WWIEeIM7Iz7q2hBm7EgMM32F1sxiLzGuARmMCgjOhI2?=
 =?us-ascii?Q?m/eolnDiyiBHTQIfFhdUq/ua8nQokmZp6kYmNixP1F3+oL4zf1+fya3MbH/L?=
 =?us-ascii?Q?iUPzk7OnqSkT0442Re1U1zk+j5sqqD/UQIv+5Q24IgRrfGRkLkDFn88rCvoa?=
 =?us-ascii?Q?yyjQX2joPWrfD1klkJCU1HtXOkQfOS/X0LBEJTBdXPy70a0OGOrGg/ENLl06?=
 =?us-ascii?Q?TyIYQrnF6aU774iyYRFHfZrxI8pIAXerUumsn8mPNcvmZqYkosjWILQWm/rg?=
 =?us-ascii?Q?wYeqw8A5jGhv1fTmy2XBjSKhVvhmZ4iFChraduE4yoc0uQdekeHoZ/bf0bu+?=
 =?us-ascii?Q?yYiQURth1fSoLNIg4tWbkI6gpnvh9WlZqs1rnrnEAOv1qcRAgxK5eKsArQUl?=
 =?us-ascii?Q?RUJHZXKU0uxFQsp7jIOsdS3dnJsUzk/iVvUM3ZNZpmWR8d2Jy9X0HMw2lVpK?=
 =?us-ascii?Q?gs4add5UZ8WMbEEHhVvyj19J/5KHezSr9y9kJVHR5jIxWsR8fg9AOh+4lG6m?=
 =?us-ascii?Q?Ks6vSseFALUEO1O304k9LogQ8IrmhP2uaihxaDpawLGRXOv6VOZLcvWpDdyl?=
 =?us-ascii?Q?sr8Rd34biTDhOffnPWRM48zAf/2KDVVhxrEDkjOkRX8vJv7PpSnghJT7ssuV?=
 =?us-ascii?Q?Ag532MTDJySFYxjJQW+OY+bh2+0UZA4PQdzL3pp2hvgeP2mpL4Ov2NhBr9n7?=
 =?us-ascii?Q?Y53ZiRl1ZQsbd6diIVo8lziNNnpN/kCHu2gaZvvN+dl1P0fw1QQZnu3/U7My?=
 =?us-ascii?Q?iQPz3miCjKhVUaBv2uVrm8qkdgTjw3d0pH74gLbuRZStJv5lSERTF9VtWY5Q?=
 =?us-ascii?Q?F7nJr+mCFBllHAVfS1KSsWctuE3yRuA1cd0/B5sCW8o8LojL3uHc5B7xfpda?=
 =?us-ascii?Q?qDgUUO1EA+XzLUkoXZP9zapSRz+Epq6Q4OdgmXyBfM1cNH2iOrwTRB8pLuCn?=
 =?us-ascii?Q?HIF16wlJ6QY4SdTlvFJFrmAWYSwlR83y4Zc/wJVXjw5zoCQ31bcT+diMMlNk?=
 =?us-ascii?Q?A1spCF9Wc5VMZmnCXEc1R5jid+rykImC++IapnOpfxoYPuenmiB4D/8oQdVp?=
 =?us-ascii?Q?/4qAGTdMoEgZXnh6GpzTberiMRDABS09IH196+H6FQzHsj/DnLjslW2pefs?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM2PR0701CU001.outbound.protection.outlook.com;PTR:mail-dm2pr0701cu00101.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(156008)(35042699022)(36860700016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	r5reXL1z6K5EdEg/2NZM7zmALNw0WD7hQk1Clp9adUSzPfVK1MxYBWEo4zuZJgWx7Mqjsj0C/z/jmRpb4in1+LEV+IhlA49cLyRyjp1qg9X0K0vMYf1bquxfqvxR1mTkfaXCtSIiW+ybLOTVCIZVMmDNuPubZOs/MEEfZ1JGaiQdPYYKdYpTqbk9Az4Dpl5ASmxgGTx0/j5vUBySMLaRFgPXxYofOu7+7wTX8g8fVt62IbKiUmXXzvcOjeZaTssPizSLYIwjlPU+K1bMy/yafmaa9whGULCidntFlwlKGj0Vq6c15ztuFEL/0KmneakgUQP3nmkGPxt+d3652j7MHlDPF4YPX1PHOM6/bizJduqKeHrzZ+uxh1qzbU8BjIo0q1ZhjTjVx+E0i9EHLLqJlzYxQN6JKgDfDdv5TOgZ10XVALXoUONmLe+9xu5ZiwOk
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:33:09.8813
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 506760c6-d271-40b4-4ea2-08de9f246b3a
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF00012E80.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR08MB11076
X-purgate-ID: tlsNG-42698a/1776720797-7E36CF3B-2DB5D848/0/0
X-purgate-type: clean
X-purgate-size: 3941
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:proskurin@sec.in.tum.de,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.244];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: E5585434262
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Sergej Proskurin <proskurin@sec.in.tum.de>

This commit changes the prototype and implementation of the functions
"p2m_alloc_vmid" and "p2m_free_vmid". The function "p2m_alloc_vmid" does
not expect the struct domain as argument anymore and returns an
allocated vmid. The function "p2m_free_vmid" takes only the vmid that is
to be freed as argument.

This is commit 10/12 of the altp2m_init/altp2m_teardown routines phase.

Signed-off-by: Sergej Proskurin <proskurin@sec.in.tum.de>
---
v3: Changed function prototypes and implementation of the functions
    "p2m_alloc_vmid" and "p2m_free_vmid".

    Changes in "p2m_alloc_vmid":
    This function does not expect any arguments. Also, in this commit,
    the function "p2m_alloc_vmid" returns either the successfully
    allocated vmid or the value INVALID_VMID. Thus, it is now the
    responsibility of the caller to set the returned vmid in the
    associated fields.

    Changes in "p2m_free_vmid":
    This function expects now only the vmid of type uint8_t.
---
 xen/arch/arm/include/asm/p2m.h |  4 ++--
 xen/arch/arm/mmu/p2m.c         |  8 ++++----
 xen/arch/arm/p2m.c             | 23 ++++++++---------------
 3 files changed, 14 insertions(+), 21 deletions(-)

diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
index 5c6dfe4a9789..62261d41e780 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -195,8 +195,8 @@ static inline bool arch_acquire_resource_check(struct domain *d)
 void p2m_restrict_ipa_bits(unsigned int ipa_bits);
 
 void p2m_vmid_allocator_init(void);
-int p2m_alloc_vmid(struct domain *d);
-void p2m_free_vmid(struct domain *d);
+uint8_t p2m_alloc_vmid(void);
+void p2m_free_vmid(uint8_t vmid);
 
 /* Second stage paging setup, to be called on all CPUs */
 void setup_virt_paging(void);
diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index f546f63f2489..0d37760ef5d5 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -1519,7 +1519,7 @@ void p2m_free_one(struct p2m_domain *p2m)
 
     p2m->root = NULL;
 
-    p2m_free_vmid(p2m->domain);
+    p2m_free_vmid(p2m->vmid);
 
     radix_tree_destroy(&p2m->mem_access_settings, NULL);
 
@@ -1570,9 +1570,9 @@ static int p2m_initialise(struct domain *d, struct p2m_domain *p2m)
      */
     p2m->domain = d;
 
-    rc = p2m_alloc_vmid(d);
-    if ( rc )
-        return rc;
+    p2m->vmid = p2m_alloc_vmid();
+    if ( p2m->vmid == INVALID_VMID )
+        return -EBUSY;
 
     rc = p2m_alloc_table(p2m);
     if ( rc )
diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index 2c43b6033360..3342fafcc8a7 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -282,11 +282,9 @@ void p2m_vmid_allocator_init(void)
     set_bit(INVALID_VMID, vmid_mask);
 }
 
-int p2m_alloc_vmid(struct domain *d)
+uint8_t p2m_alloc_vmid(void)
 {
-    struct p2m_domain *p2m = p2m_get_hostp2m(d);
-
-    int rc, vmid;
+    uint8_t vmid;
 
     spin_lock(&vmid_alloc_lock);
 
@@ -296,28 +294,23 @@ int p2m_alloc_vmid(struct domain *d)
 
     if ( vmid == MAX_VMID )
     {
-        rc = -EBUSY;
-        printk(XENLOG_ERR "p2m.c: dom%d: VMID pool exhausted\n", d->domain_id);
+        vmid = INVALID_VMID;
+        printk(XENLOG_ERR "p2m.c: VMID pool exhausted\n");
         goto out;
     }
 
     set_bit(vmid, vmid_mask);
 
-    p2m->vmid = vmid;
-
-    rc = 0;
-
 out:
     spin_unlock(&vmid_alloc_lock);
-    return rc;
+    return vmid;
 }
 
-void p2m_free_vmid(struct domain *d)
+void p2m_free_vmid(uint8_t vmid)
 {
-    struct p2m_domain *p2m = p2m_get_hostp2m(d);
     spin_lock(&vmid_alloc_lock);
-    if ( p2m->vmid != INVALID_VMID )
-        clear_bit(p2m->vmid, vmid_mask);
+    if ( vmid != INVALID_VMID )
+        clear_bit(vmid, vmid_mask);
 
     spin_unlock(&vmid_alloc_lock);
 }
-- 
2.34.1


