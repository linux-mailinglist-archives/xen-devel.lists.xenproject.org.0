Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOtqBOeb5ml8ywEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:34:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DEA43431F
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:34:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288048.1568442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwG6-0006ig-UN; Mon, 20 Apr 2026 21:34:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288048.1568442; Mon, 20 Apr 2026 21:34:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwG6-0006bD-Ij; Mon, 20 Apr 2026 21:34:22 +0000
Received: by outflank-mailman (input) for mailman id 1288048;
 Mon, 20 Apr 2026 21:34:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEwG4-0006Pi-J6
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:34:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEwG3-00CCTa-Vc
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:34:19 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69bbd-bab6-0a2a0a5309dd-0a2a450ab8e6-38
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:34:19 +0200
Received: from [40.107.200.94]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69bda-56b3-0a2a450a0019-286bc85e257c-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:34:19 +0200
Received: from DM6PR07CA0099.namprd07.prod.outlook.com (2603:10b6:5:337::32)
 by SA6PR08MB10377.namprd08.prod.outlook.com (2603:10b6:806:442::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:33:13 +0000
Received: from DS2PEPF00003441.namprd04.prod.outlook.com
 (2603:10b6:5:337:cafe::6d) by DM6PR07CA0099.outlook.office365.com
 (2603:10b6:5:337::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:13 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 DS2PEPF00003441.mail.protection.outlook.com (10.167.17.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:33:12 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzzHX1Mrqz1wdW; 
 Mon, 20 Apr 2026 14:33:12 -0700 (PDT)
Received: from CO1PR08CU001.outbound.protection.outlook.com
 (mail-co1pr08cu00105.outbound.protection.outlook.com [40.93.10.101])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:33:11 -0700 (PDT)
Received: from BY1P220CA0050.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59e::12)
 by DS1PR08MB10100.namprd08.prod.outlook.com (2603:10b6:8:20f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:33:07 +0000
Received: from SJ1PEPF000026C8.namprd04.prod.outlook.com
 (2603:10b6:a03:59e:cafe::9d) by BY1P220CA0050.outlook.office365.com
 (2603:10b6:a03:59e::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:06 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 SJ1PEPF000026C8.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:33:06 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:33:03 +0200
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
 b=FMSJb+aycSBeSNUd2T2odW6B6bxjmQ6Rm8gpTxZ6fSBUSxTFtwJokiIXh1/TkgEdTefxjrFQIP87cd5OsUEm2lhCL7NpwMReJAUWh/8ADSWHiXpsrsArTygBKwxLJ8ZOA8S7YymLOwK5JqPy69ZD1z1r1BdmQ8ykm2GhEiauuQbQWJZaWhOpC74qhKogZrtWK4NIWhJ9HqMCfTjhb+vBfeCx+XifgOBgIEA++3oA1VlwxH/E3sbALtKxDOKXqmPkJJyKll06m7Ix1Y0GbstFX67X7RlgpnkJAwcslZHq1Im9MwMDjGdRNrtirU6KbSLkYI82JGHTug0ZKWBA6GsfZA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/xFPvcddJmAh/7k7Gzv3o+d1z1DGyz3l1lzwxv3F8MY=;
 b=FtO5hosF4UFmybFgkE5MNXObp9CcuUkGfkAsyOaO6x5jr91YWzqiEYm8TI8/kCMG/ucXudBzu0XQMjLiNGlHPpRrFzKgOrRg159uUzJHABRA9ki54/aevmq4WVwOgTWa7xcZXT51XUMOAsqGbL1BXm9FsFn+983PGBkrSfHDDais0vD4oYnQyhCCjje02ogzUe7304PWaLJzY4CIroFJlbi4waWg/sxPawI+5VoL5YbpAwGZTBaESi5UXCnUk2IdDGHNU/5GUOQpw/RcmoSQnBjRIHJzVuvfrLXhlNm90/WhA6Q03Xx9/HkBY4FzfmEREBWXnMJY6Gy6PnQE5681iA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.10.101) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/xFPvcddJmAh/7k7Gzv3o+d1z1DGyz3l1lzwxv3F8MY=;
 b=Do+yb01PklVe/ucKnNrT5TGaO5B9IhPKJf4Jqav+iIHTFb8I7gVa6LxD9CevNrzf90um7qnIeBvYmgQQh9DkvRzTqYqb2YAO41k9+Rni1SUs4/0Qbv5vlg5ROw7cw8XcUQX1lca/ZxYQYynArxOWCwgw1DQpe7Ry3lgbRzj938s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.10.101)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.10.101 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.10.101; helo=CO1PR08CU001.outbound.protection.outlook.com;
 pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GBCsg2ercueuEKeF0TYR6sv3g/OnwKJI/KoHsck0DQNbLFjG5pIepqMPcVHXAzBObIn3zIKw/2/pl7exPVM5nRBwds3pu7y714zCSxcVPPNkQUy0chpCq6GaMXqc+6Skss3/IJJulxmhPQr0fOXnbSFEaYomnI9JjSMB1so5CEO2QmXppDp4U39c7Wf/Wu97ZFRsjt5nsYsZwNvQqosO+GI24VpE4oYhnSwK7zPSEM6XVKt4RWkE5Ew9e/6buI5Uq+EW8+h+RiRsRNfYSiIbbwepCnzg2IvMBrI1BY8/fuuKdwAgovvFXmooD+FhHhKJuSKHcK4LNpuyUqnxfB0eDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/xFPvcddJmAh/7k7Gzv3o+d1z1DGyz3l1lzwxv3F8MY=;
 b=ToZBUZNWZo6MlM2dD8W1B4+Q9cgbz/akBeKRXuWhVEnaG3Xki+ozy5dk2DOvIUJy7ot6If9Zyq9W/5B1m3M+/ILe0m1dE2dMKDc9HQiQ2pASmnz6pjd91JHxCGP1OS1y98izFgSPmWTmzfvxWMbQ3/KeZlIfKQowco23K5BZNiiM3+hxaeF3iZxoxBXDuGzI81uRz04o331FXfrw/vEd0kAsbLKJnu4Y3PPZfe3RhvXNC9W7o+IOifKdk5HJGmHxYHFR4FbwDwl3Zjrx9dJCSWAMpwoPTfCpB01VmMsevQG9Oq577gHB3Wzq7em0llBJa+vzDaHfJjIQnB2nWxwEfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/xFPvcddJmAh/7k7Gzv3o+d1z1DGyz3l1lzwxv3F8MY=;
 b=Do+yb01PklVe/ucKnNrT5TGaO5B9IhPKJf4Jqav+iIHTFb8I7gVa6LxD9CevNrzf90um7qnIeBvYmgQQh9DkvRzTqYqb2YAO41k9+Rni1SUs4/0Qbv5vlg5ROw7cw8XcUQX1lca/ZxYQYynArxOWCwgw1DQpe7Ry3lgbRzj938s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 213.95.148.172)
 smtp.mailfrom=elektrobit.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 213.95.148.172 as permitted sender)
 receiver=protection.outlook.com; client-ip=213.95.148.172;
 helo=denue6es012.ebgroup.elektrobit.com; pr=C
From: Rose Spangler <Rose.Spangler@elektrobit.com>
To: <xen-devel@lists.xenproject.org>
CC: Rose Spangler <Rose.Spangler@elektrobit.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Teddy Astie
	<teddy.astie@vates.tech>, Anthony PERARD <anthony.perard@vates.tech>, "Michal
 Orzel" <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [RFC PATCH v6 24/43] altp2m: Move altp2m_{get,set}_altp2m to common code
Date: Mon, 20 Apr 2026 17:31:47 -0400
Message-ID: <20260420213206.208750-25-Rose.Spangler@elektrobit.com>
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
	SJ1PEPF000026C8:EE_|DS1PR08MB10100:EE_|DS2PEPF00003441:EE_|SA6PR08MB10377:EE_
X-MS-Office365-Filtering-Correlation-Id: ba8a10f7-8e77-4801-bc5f-08de9f246d21
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|704162011799003|82310400026|376014|36860700016|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?plf4No1i4qaig8xaNEwulhp9ZVMS/ZyAQELNLk/dGWWGgshsKxx1P1JLJnDv?=
 =?us-ascii?Q?LlCTn9jFUx3napKq/tRKiWvv8+peRaJN3g5ekR+JzY6kxARfsjqZ8sskLrJS?=
 =?us-ascii?Q?NwyAHS/RQbrwkW/CEPq65+1Wxan2M4NzUfLzPXLX4k3e93bfS9JiTdCzWili?=
 =?us-ascii?Q?2UFRIPrp9u7ilIInwWfFIi3PXbeVJl4jH/ecdl0ZBMhBq+cGLYhr082FBo0H?=
 =?us-ascii?Q?csPTdBw+G9UHyzp2sugI5PNjlT+Z19VV3/kgZZcqbL3M79SbQuEZR9apPXsJ?=
 =?us-ascii?Q?GofE0d7SgvnAfvNx7TXcsYNL2BEMGMOXdPGOE9FqljrXem48zSdq31ZmCPQe?=
 =?us-ascii?Q?74SJjYqFtuB/9JzFwo0FwYbjyK55mi12svYDlfrFNCw+hSGUdIbPsStw+5uK?=
 =?us-ascii?Q?v+rkife7z9IvxZ1beIbUPNGbHNlQMBf6cGL04qfOn6QXnoWlr1bJktQ0BCms?=
 =?us-ascii?Q?k4bMNl4M4IcnQEWDgvMxdAH29Y8ZJbOuspq6RiUc1I9SHfbVUoE3XsZdsuJC?=
 =?us-ascii?Q?OK+mNkbCEdTWYkLbvhREtFAsZytrRfQSq/ghwZXDk5FHiGikR9zJ84222kzH?=
 =?us-ascii?Q?mMIsddWewL7qdCVyDaEdV1P8PeffyCMNj5V0UfWERvG5vyTPBpkyvoheaEFB?=
 =?us-ascii?Q?ypfeMJBFzxSwk2OxruCQU4ISk+u6jKxMDouB69xYAtgdJF/dA5TDTzAFeTUH?=
 =?us-ascii?Q?vfSybHG5vXgcUgEJrpXA2HicuRCvScpEP+FKkHvFQ//q6XXFRVA9/fU7j79L?=
 =?us-ascii?Q?SlYt5QOZQbkFJOavlF5YyVTQkPwn9wn7OajD09WXX01yNypvuSF3+VvbQKcB?=
 =?us-ascii?Q?jjRm38HTwKgJjKFnd9mk54NxgyV152rpJFMtOOZXM8Rn5qF7rFDOnL1gBeEU?=
 =?us-ascii?Q?f0LxjqrxskXNi8Esf9TloGOfM9NPOPmPlZiKxSIuCMmkdudExFQM0yoJtxsz?=
 =?us-ascii?Q?wPeKqxH7lIx4yF3NFKXz/HL/06/l/PM8YOmoriWzxjJ0Q1Zpvlv243GF7jTe?=
 =?us-ascii?Q?Udg8CsopbZeEfv+6Vugw//l0Q8JovXXzyYltwuvfyscwXh2I53boir7SRgbc?=
 =?us-ascii?Q?15A1zV4uYUp7FpaEGQAFikayhrLIhT2zFDtbWkP8mYVobYc9cEk=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(704162011799003)(82310400026)(376014)(36860700016)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 kF+1R3q0ur4DjIQj5hLgP9cliSm+EMnL67vX7yTykMLxpaQSoX4ILvEwjYndQaNVoe2aE07imtcVPlpiIOUPgjMqtevpmlHwPgpFH9b+GaqXUehF7jgc50/wQoRUmoRRhiq56yrlj7ZYWTTIvWLxvx//ipfw48Na0x93WjVkmRbnpJ+qxIAbZ7ImPf6/5Kqs+5dKSGMskOUC7Dtuk1TZvXU72zhsW2Zsyp5RdASssIjG+Q/QL7zkZ0yKCE2ZOI87PvkJ+K6uyO2jwJ9xVrIAiZ2f+ts36kng37q8Ao7frfC2SDOC20SloRYvBGE4za+bNMrTi+Hdu39+8pSZ2Uq8Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR08MB10100
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.10.101];domain=CO1PR08CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.10.101];domain=CO1PR08CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DS2PEPF00003441.namprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4527a19b-3f7b-4a49-a2b8-08de9f24695f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|704162011799003|82310400026|14060799003|35042699022|156008|36860700016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jzNqBdScYahaIBUAshj2iQ7+IFxB2vjNP9H9zhY3GQ36KzBL9aW2ieKFtMcF?=
 =?us-ascii?Q?q/LqRa6sx2R2DQPtfbtShrVRrrn8EWueEZCGjIA4l6OUJrcjr4nT2SWMvXiD?=
 =?us-ascii?Q?50qu5ZDCLy7euOi+Vok2ryJ9vTAtZP3EMWdAJyjxdZ6Jv7KukbU4FRprrCWC?=
 =?us-ascii?Q?OLQ6ADPdU1/bLud2AxqtJntqI4BOXsBYVCS4sR3QSZJD21oYuztI3tCyvt3u?=
 =?us-ascii?Q?Pe7n+eXPn53flpinrJCjbX7w3wPaRvhNyX+wfoZHuTr5FPzYDJj09HGujZEE?=
 =?us-ascii?Q?5YzrEYMS0BdqKxjeY8ZVKgY3fwLh9BmUqbu28FHadDY1b4AmVOCz2Su4osij?=
 =?us-ascii?Q?ZTUkLbLiRwCtxiGdmmcW/PPaoXIs5lbmvoBPf1Vtk7BgEp+DoRvUVWfLu9lW?=
 =?us-ascii?Q?4NjTOKkifnty1Wqjqr2XdwTwXXxAhsxAjid+oorKgGLRHEKbCcaUCOey+x2F?=
 =?us-ascii?Q?y0ZYPRcwe44AZGR7V6sXrWqy+TVf1Tlf8JQv05vVxWIPhPKd7C2vbhoEiOW9?=
 =?us-ascii?Q?yG2J2Xl+Y/l7xgGWvKsxdrQZ2nq/apqvxgZ06o6i4mcteNihVpI6XnG7TTYY?=
 =?us-ascii?Q?qwgsrhZpd1YiBVQHUQlmrgy0E66SDr7cCXhfiGBAMXIig8sHor52crGhqtrC?=
 =?us-ascii?Q?1UK5I+09qCHwmqXbcFAJ8tSc1fFI7vvzDMPTDfg2ihIKvCl1dioaciy9J6/C?=
 =?us-ascii?Q?d382OW6MemMP8ucs2W809VtYyzEwxItON53ttiXQ8xaiBxxhwR63EZL7CnTO?=
 =?us-ascii?Q?jkaKfWEhTSDjwdqDriDyFDx1QgowIFABTqeXjwbDth8IX0Ej2VD6RpiMgSKW?=
 =?us-ascii?Q?UrcEg+Z2nGqdqe+pyWIP/snGljz838x5zfpVHFyK5GFPFigS3BMQSZRgqXMh?=
 =?us-ascii?Q?sUJSELYBOe/BlYA/HfsOTOeUQm2LF6s2NeP91bWP8Tiw6QSadKwsrJ+uFiRy?=
 =?us-ascii?Q?aE4ou4eM6gLI4O6A+tj1nD4GWGnNQaQlN+3p9wQJW3Fi9l1A7rU7t3qvyEIT?=
 =?us-ascii?Q?H2bSSPhpmxhLv+XeulACct0Av6rJ4VUXt6lDRqVlyHg2P6FNbQwyAQ/fcici?=
 =?us-ascii?Q?9JjZW8rioYW4r+c5yLzPU7fkVr9rcefE5kUSuCbwoj8zChrGEeQ=3D?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR08CU001.outbound.protection.outlook.com;PTR:mail-co1pr08cu00105.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(704162011799003)(82310400026)(14060799003)(35042699022)(156008)(36860700016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3gCVpOTRP8Rxv8bgbH/+D3/HnDM2ynhus4TnTzhKaXuJDm2Zudoxylf315XGq04vLUnO4+522F55/KyPAx5RrEk4cA2nIZc8Mg2veO8B9PM67jxoPKZlA+ySKE2E5BCGY3fGMWsVd1BOcjv4FCc7qLxVGocV0jEZQYTINvZHMSJfhy3F4C2UJIPZUGpx/8RJth6P7OCjkUObxCbgUuf7ocgqEgARksOXTsZAlsLUfEqZpcDFlXf7aD3fu36qFtSh9oSZgI48z5A1lYApV3o0NI+5DYnbwIkbSfJsvvgVJ709SzXYfOlUJnLyaeP9MjbGmGSBDPr2CE6owEzHeHHwZepjvTuswlgpSSa1HtzV/fGesWA8xx7QqNi8QJGf/WKOM2FQXX+mF2jcf5H96+3dQcVGf/zE+DWWRh20SJIuahx1lTogJy5er3MG4m4cWHO3
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:33:12.8485
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba8a10f7-8e77-4801-bc5f-08de9f246d21
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS2PEPF00003441.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR08MB10377
X-purgate-ID: tlsNG-4011c0/1776720859-81B878B7-49AFD179/0/0
X-purgate-type: clean
X-purgate-size: 5044
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.289];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 76DEA43431F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This commit moves the altp2m_get_altp2m and altp2m_set_altp2m functions to
the common code. This make sit possible to use them in other common
routines (namely, altp2m_vcpu_{initialise,destroy}).

This commit contains only code movement, and no change in functionality is
intended.

This is commit 1/4 of the altp2m_{get,set}_altp2m phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.
---
 xen/arch/x86/include/asm/altp2m.h | 35 -------------------------
 xen/arch/x86/include/asm/domain.h |  2 --
 xen/common/altp2m.c               |  1 -
 xen/include/xen/altp2m.h          | 43 +++++++++++++++++++++++++++++++
 4 files changed, 43 insertions(+), 38 deletions(-)

diff --git a/xen/arch/x86/include/asm/altp2m.h b/xen/arch/x86/include/asm/altp2m.h
index 13017525a62f..a1b078783b3e 100644
--- a/xen/arch/x86/include/asm/altp2m.h
+++ b/xen/arch/x86/include/asm/altp2m.h
@@ -64,39 +64,6 @@ static inline uint16_t altp2m_vcpu_idx(const struct vcpu *v)
  * Alternate p2m: shadow p2m tables used for alternate memory views
  */
 
-/* get current alternate p2m table */
-static inline struct p2m_domain *altp2m_get_altp2m(struct vcpu *v)
-{
-    unsigned int index = vcpu_altp2m(v).p2midx;
-
-    if ( index == INVALID_ALTP2M )
-        return NULL;
-
-    BUG_ON(index >= v->domain->nr_altp2m);
-
-    return v->domain->altp2m_p2m[index];
-}
-
-/* set current alternate p2m table */
-static inline bool altp2m_set_altp2m(struct vcpu *v, unsigned int idx)
-{
-    struct p2m_domain *orig;
-
-    BUG_ON(idx >= v->domain->nr_altp2m);
-
-    if ( idx == vcpu_altp2m(v).p2midx )
-        return false;
-
-    orig = altp2m_get_altp2m(v);
-    BUG_ON(!orig);
-    atomic_dec(&orig->active_vcpus);
-
-    vcpu_altp2m(v).p2midx = idx;
-    atomic_inc(&v->domain->altp2m_p2m[idx]->active_vcpus);
-
-    return true;
-}
-
 /* Switch alternate p2m for a single vcpu */
 bool altp2m_switch_vcpu_by_id(struct vcpu *v, unsigned int idx);
 
@@ -178,8 +145,6 @@ static inline int _altp2m_get_effective_entry(struct p2m_domain *ap2m,
         _altp2m_get_effective_entry(ap2m, gfn, mfn, t, a)
 
 /* Only declaration is needed. DCE will optimise it out when linking. */
-struct p2m_domain *altp2m_get_altp2m(struct vcpu *v);
-bool altp2m_set_altp2m(struct vcpu *v, unsigned int idx);
 uint16_t altp2m_vcpu_idx(const struct vcpu *v);
 void altp2m_vcpu_initialise(struct vcpu *v);
 void altp2m_vcpu_destroy(struct vcpu *v);
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index f8038087e612..72460e38f581 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -277,8 +277,6 @@ struct paging_vcpu {
 #define MAX_NR_ALTP2M   MAX_EPTP
 #define MAX_NESTEDP2M   10
 
-#define INVALID_ALTP2M  0xffff
-
 struct p2m_domain;
 struct time_scale {
     int shift;
diff --git a/xen/common/altp2m.c b/xen/common/altp2m.c
index 989d8bdcb923..a731ad7cdab8 100644
--- a/xen/common/altp2m.c
+++ b/xen/common/altp2m.c
@@ -5,7 +5,6 @@
 #include <xen/xvmalloc.h>
 
 #include <asm/altp2m.h>
-#include <asm/p2m.h>
 
 #include <public/hvm/params.h>
 
diff --git a/xen/include/xen/altp2m.h b/xen/include/xen/altp2m.h
index 238c7a935586..58e74be6deb0 100644
--- a/xen/include/xen/altp2m.h
+++ b/xen/include/xen/altp2m.h
@@ -8,6 +8,10 @@
 
 #include <public/hvm/hvm_op.h>
 
+#include <asm/p2m.h>
+
+#define INVALID_ALTP2M  0xffff
+
 /*
  * Common alternate p2m declarations that need to be visible
  * regardless of CONFIG_ALTP2M
@@ -27,6 +31,41 @@ static inline bool altp2m_active(const struct domain *d)
     return d->altp2m_active;
 }
 
+#ifdef CONFIG_X86
+/* get current alternate p2m table */
+static inline struct p2m_domain *altp2m_get_altp2m(struct vcpu *v)
+{
+    unsigned int index = vcpu_altp2m(v).p2midx;
+
+    if ( index == INVALID_ALTP2M )
+        return NULL;
+
+    BUG_ON(index >= v->domain->nr_altp2m);
+
+    return v->domain->altp2m_p2m[index];
+}
+
+/* set current alternate p2m table */
+static inline bool altp2m_set_altp2m(struct vcpu *v, unsigned int idx)
+{
+    struct p2m_domain *orig;
+
+    BUG_ON(idx >= v->domain->nr_altp2m);
+
+    if ( idx == vcpu_altp2m(v).p2midx )
+        return false;
+
+    orig = altp2m_get_altp2m(v);
+    BUG_ON(!orig);
+    atomic_dec(&orig->active_vcpus);
+
+    vcpu_altp2m(v).p2midx = idx;
+    atomic_inc(&v->domain->altp2m_p2m[idx]->active_vcpus);
+
+    return true;
+}
+#endif
+
 int do_altp2m_op(XEN_GUEST_HANDLE_PARAM(void) arg);
 
 #else /* CONFIG_ALTP2M */
@@ -41,6 +80,10 @@ static inline int do_altp2m_op(XEN_GUEST_HANDLE_PARAM(void) arg)
     return -EOPNOTSUPP;
 }
 
+/* Only declaration is needed. DCE will optimise it out when linking. */
+struct p2m_domain *altp2m_get_altp2m(struct vcpu *v);
+bool altp2m_set_altp2m(struct vcpu *v, unsigned int idx);
+
 #endif /* CONFIG_ALTP2M */
 
 #endif /* __XEN_ALTP2M_H__ */
-- 
2.34.1


