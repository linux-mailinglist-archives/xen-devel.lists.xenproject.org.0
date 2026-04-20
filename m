Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKyICc6b5mnCygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:34:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B13DF4342EA
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:34:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287906.1568361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwFe-0001DO-8y; Mon, 20 Apr 2026 21:33:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287906.1568361; Mon, 20 Apr 2026 21:33:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwFd-0000oR-5U; Mon, 20 Apr 2026 21:33:53 +0000
Received: by outflank-mailman (input) for mailman id 1287906;
 Mon, 20 Apr 2026 21:33:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEwFR-0007Sr-6k
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:33:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEwFQ-00EgCp-HK
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:33:40 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b9e-e002-0a2a0a5209dd-0a2a450be734-32
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:40 +0200
Received: from [52.101.52.87]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69bb3-212f-0a2a450b0019-34653457c753-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:40 +0200
Received: from SJ0PR03CA0097.namprd03.prod.outlook.com (2603:10b6:a03:333::12)
 by BN0PR08MB6920.namprd08.prod.outlook.com (2603:10b6:408:12c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.31; Mon, 20 Apr
 2026 21:33:36 +0000
Received: from MWH0EPF000C6185.namprd02.prod.outlook.com
 (2603:10b6:a03:333:cafe::af) by SJ0PR03CA0097.outlook.office365.com
 (2603:10b6:a03:333::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:35 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 MWH0EPF000C6185.mail.protection.outlook.com (10.167.249.117) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:33:35 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzzHz0WFnz1wdW; 
 Mon, 20 Apr 2026 14:33:35 -0700 (PDT)
Received: from BN1PR07CU003.outbound.protection.outlook.com
 (mail-bn1pr07cu00307.outbound.protection.outlook.com [40.93.12.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:33:34 -0700 (PDT)
Received: from BY1P220CA0019.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::15)
 by DS1PR08MB10099.namprd08.prod.outlook.com (2603:10b6:8:215::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.30; Mon, 20 Apr
 2026 21:33:30 +0000
Received: from SJ1PEPF000026C9.namprd04.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::6c) by BY1P220CA0019.outlook.office365.com
 (2603:10b6:a03:5c3::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:30 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 SJ1PEPF000026C9.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:33:30 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:33:26 +0200
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
 b=q5eh3nY18OETb0x5CzmhK2gh3rJ5UHCk7B3NbxzsIlfpG/12JqVNyJkyMhEq9qAKUN02uS7iL4txF0F5ta1U0povTkfjpL8/UcK8tM50NBDDZjHnoibF8zxa78GpvKA3vDedZAAaPlE3WaDLiQMXcghQEJuLFTVaPkXKniRHCUvMupHKuGPkrzeUeicaawEE29G0OPwt7ne5aGByTMigQ5MX/2lLwCRS0qRaoaMS0D3xG/n2B29hMVzCTunkDFIA80DTzWkHKZa9ZOF4pvDcRzsN4NMPiwzxoBWcp6ShbDtCE/9euYzBfmQ0S2e4iNAzetM1jlAFc2QQemt9vQKqMA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+mqQCFvGSShVoc1hxR4OmlozNt7Xc1M2crX/MK/P+3E=;
 b=xvaf4xOdNdbwG1AWjZkpkO7qrbMOd3QI8Hb4NIThX4LoNZ/emn6o44hWZklf9bTpoLhETwvf8455hW4+gbPquPv6WJBSCxMAJHDMiLPsqvTawiQ+w15xf60pDgvm4SAOpYDzdYUkkS339gPR9oPBD/jl8C/TRiVffOXBLrfTxQcFH/H7NVfRtISopWVkfTt2vAYu8e9vr6B7j8OzdHyOoxj4pBHB26E0jpUakcoHeIle4a1dOTKVehvKtSXdqjdkdQ1YgStdl32saG3ld6VPLImqm0pHlvHVfFoN9LFnult/XfJ45DdcTWuxS/0Ex9z3ZX90BZRBygVMW+GMdJ/bbg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.12.7) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+mqQCFvGSShVoc1hxR4OmlozNt7Xc1M2crX/MK/P+3E=;
 b=iKhXIE8gnOu6bVbwCbc2pQ9szkdZudhqt3XNLdIH2zsp3YL2pb4ffNL31xtwO4DzXYC/zA81yCpgjmwPpcfKVodqMC3TdTlDv9DMW87M6bCNVCYO4Ldh5zYQ5+sTD3FvA0gBS+M1hHaKNqHSJW60iKJ0b4I6XgyGCFCEJQMSK0k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.12.7)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.12.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.12.7; helo=BN1PR07CU003.outbound.protection.outlook.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vmXL+0Iw+nFTKu+TK/l3A8H8Md5QaUu8NOXhUPBn0W53/phPeGkD06YQ/KfnV4TxVWUtLVpFmwaEkMSnMVC4nM3lrhU8wOU/hvsIvAbCZu1MiNE7DMb4Q9HFNDOJcsXlgU/uXRslJhvJ1wBlMoYm08Hgkik4bPNDVVZEd34de9x0mvAQcrBpRzzNTBmv7U6JxWg5JxsIU7pwGTbfl5kt7l8sIvnrixuo7TZLpM3tbb97YfL/9JhWGJnUhW2lGEm1hWKxlMh7xP4/ISnlvd2/T5WsgWMiPgoekIsW1hDvuIp03nllINotcFJuimHueaJVy4iG/YYLGIMnbJcwzj+E/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+mqQCFvGSShVoc1hxR4OmlozNt7Xc1M2crX/MK/P+3E=;
 b=XGAq2T+D08L/gbcGXTX/QqxenU2vVZeYhhUAFevLVEX+5X4lIeYWSo5YolAKLQkGAj7guH8eJdcvRyr/m9VU/X+rhxf52MNYBuTmNwLK4aEPchBMcUpPT/VzfNKiSp8Yp7Dv4tT0S7Mr2++VPxguZ7N5D9NTb+Wlp9GbHkYucau6aTxHe6ifLofekoniqSpJ9WWslOnIU58BKsC+PsjmFUMqn/Kv/xUKPTZwxvDIFSHA2lRbVfCQ4EtlvV8+9zXHGpazfRguYfE6Jqn5sX3c0JqnRWxil7q58BKmIU5Jc0Y+2PQhaMfiMYaAo9YXnp7C5hD6E71GKcAtXMUcJJ/sMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+mqQCFvGSShVoc1hxR4OmlozNt7Xc1M2crX/MK/P+3E=;
 b=iKhXIE8gnOu6bVbwCbc2pQ9szkdZudhqt3XNLdIH2zsp3YL2pb4ffNL31xtwO4DzXYC/zA81yCpgjmwPpcfKVodqMC3TdTlDv9DMW87M6bCNVCYO4Ldh5zYQ5+sTD3FvA0gBS+M1hHaKNqHSJW60iKJ0b4I6XgyGCFCEJQMSK0k=
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
Subject: [RFC PATCH v6 38/43] arm/altp2m: Add support for altp2m_init_by_id
Date: Mon, 20 Apr 2026 17:32:01 -0400
Message-ID: <20260420213206.208750-39-Rose.Spangler@elektrobit.com>
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
	SJ1PEPF000026C9:EE_|DS1PR08MB10099:EE_|MWH0EPF000C6185:EE_|BN0PR08MB6920:EE_
X-MS-Office365-Filtering-Correlation-Id: ead1d366-7fa0-41f8-8d0e-08de9f247a8e
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?AOwhsdbYL4bDC9CWS7pnSrSlCuy24/CPyYIuRDv93TJHWsfLbWsvfAvXzB23?=
 =?us-ascii?Q?BUEx/nFfNsDXZEHYaYlpQPSKr1oJZzkYqu977j+kf4yeCgOprzLKs711mdR9?=
 =?us-ascii?Q?D+gPURAHuw/5KwEAj7AkBatFKUCH4dV93D0tDx7JxdPMKBTJYYs6LbvfiPCO?=
 =?us-ascii?Q?sjdnI1+Pg9G2l7bzxrn/48TBj3tcyKraYks8x3L6nEsbTOQkneUa8e/eAEtD?=
 =?us-ascii?Q?gHpW/+ztO3sZhyI9SjJE1sbVppg/KrNU+sh77BxqyRt7Krqi7kGKFz14l5G5?=
 =?us-ascii?Q?XVaugMWv/6cVzhlR1jZWIEZlCV9L/GBfTZyjP45dZPmGudKlSot/2MgKeG4d?=
 =?us-ascii?Q?VZSHFkzvDantKBs3RJ7MYm8fbYMrnQ0SXbVh0LJLUGMWy2AFHjrwGfgtSAEO?=
 =?us-ascii?Q?yrU4WANKw3YPbnLW9xl3ayyZrch5/UfLcD3co2feGTBVzLlYowcl6aOYETNs?=
 =?us-ascii?Q?hrvWbAp6L0sJxPwGQawz3ONyPb6oBQK1b+hiljn/pWdbaV/eAyOmyAjgJBJn?=
 =?us-ascii?Q?55eYdCceT4T3atSd/BKGNWvaHmTMGz+zi/wlQJuEpFiD5eJH/xeT9BtQvGsW?=
 =?us-ascii?Q?A7luczdYsuEtS4NihWjluj+RiP+MJh/6epqDVDz/zU6tC4Yd9qEQSHVdemwT?=
 =?us-ascii?Q?mR4kW2ybHvlOZNis4sMuN3ioGzCKUKEuiEaCgaFjcnFLlnUHszHhXUQVeRtp?=
 =?us-ascii?Q?67id44ztjRCnP8GGSWTVK73+wDz3GGtYHq2GAJtNC48Akz3aEHUkxzSNWYIv?=
 =?us-ascii?Q?Zxu3ADlaxnbdKGHm5f/+eKgxmqUxWp+sDwwEsYFf81gO7gy0PyOk3LQUHsQs?=
 =?us-ascii?Q?McdoLsOC+wu25vvhsiWMpInV1k9dly6w9g1+49ISwsuqJxeKJCp9h13XhSAs?=
 =?us-ascii?Q?Gg82aihpXr3FCsf8yHdx5mHjUSTl479IuTVAeqJ+b9X0B1ABr3A2R934B8FT?=
 =?us-ascii?Q?s+3ZNOTxFEDlcBgH6YibAaxJLh7pC2nppafAEgDhWxlRiLa4/pyfHonVuFL5?=
 =?us-ascii?Q?4WmC5PsZ+9vI3H54knGp/MBUaBayJ0waoeQgmEgZxFFJJj0e5LQPpVF1Apxx?=
 =?us-ascii?Q?/WRgtZXUpYhVjOhVCO5cwQHndB+PhdhX4inUeYBNXFCFT4+EjiO4y5NII5Lu?=
 =?us-ascii?Q?ZBpRzUkfNOFMWZ1wnsDvFR7T9wUUAMPNLEncyNliRiFjU7SYOk/2I4DwXgd6?=
 =?us-ascii?Q?ZZaVRw9PpaimwKP1E7DqumVIiwZj3945A+kWnyx0BqEV+5A97ydhAst3X0Ls?=
 =?us-ascii?Q?HYcjAvL1ZvK0orBpJR/L?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 uTiSGuTxkmOZwL4lNf+a06EX2VHSnKDXc0p8bU77+AJk4qLgrOulvZ/zlIlVJjuiXyGMFnJ5JZooI1B3T/SpjmADvic4/UJNvDFKUYD8Ug9x3KtqJLGXj8zWVH95BaX8+CrZsoOmJwiReqWTbENk6upZ1rGSlwh96fdWHjiQsnPoaDqgVgq5JViiQ8C+hg+P+FpFif8QsnToaKbZMDuEkIJfrBDBkAMxqEH49UItsjN/QG9yfy3KNcmiKPGmXtG7TIzy8oSpH5z1WMJOWNFmqkbMRPjsvZB6yVKJnJJLhsIvgDG5LtOiaN+XVlHjBk4I0+1MBdH86dpFRfHRWsySAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR08MB10099
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.12.7];domain=BN1PR07CU003.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.12.7];domain=BN1PR07CU003.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 MWH0EPF000C6185.namprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3286eb50-8f0c-4385-be6d-08de9f247773
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|14060799003|35042699022|376014|82310400026|156008|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NnetbnwJvX18TCuumQ7Ji2CnoQdxRNOvamS3ZZBBWJ6LyzSfhU173tjFePus?=
 =?us-ascii?Q?PrELWA929vsHy1S4MAIni0ZJIe+CxfXRs6OMlXmilPDXWgh3J63BnM/t9BZf?=
 =?us-ascii?Q?yk8AENn78dYHZdsXliGhaY3ZBmsT2k1tWSW1vahcNUz99ldYyTVOXfuA5tWb?=
 =?us-ascii?Q?Ao0MjkOFj+v0IaZorY9Kk3Sz2ZC75o4w2kWwZud9IMRQYA6kj4LhZTCDXt7k?=
 =?us-ascii?Q?sKY6oKoIqg4E6LNJfc3o4g7nY4Mtlen7iqiC0yvnGgLYwQI6dfdPtseaUx5i?=
 =?us-ascii?Q?Nfm3NalUcL3UbzwDyP5aDxwGRrXLaqDtn6AjD5RmRCOOMdvRF2bUIT+PSl0n?=
 =?us-ascii?Q?ixIxXHseCfK8twl80EwxkOP/cWQT4/JGCIi1YTC+4WOTxnCYgSjGGwDmnni5?=
 =?us-ascii?Q?aVY1ulDCK6N7dmEm+uAZ4//v54wu4qteQUPuB/JeIEbISLsgzegY15SzqKfP?=
 =?us-ascii?Q?8MIeWsZ+vyxOVU2SxwVkUIQuku3dCBBvYtDplfeAXOCx/vq+SzToU2AFVZWK?=
 =?us-ascii?Q?Iq64TwlJE2Pay6vNTlD7OX042ELK0Z/ocUbVRdxiS/SmqEWM5NFIiKFttQk4?=
 =?us-ascii?Q?2seENOqlYHB5sVC19aTj35RHkk3eIcSWzKIBTmq2/4Y2FrpRoJgT4fW4qtTo?=
 =?us-ascii?Q?sVzHxph3l8652hz7VLAXzl1BpPSqXxgndpfw569yLNzKGYcxVUVzlVTGtuRN?=
 =?us-ascii?Q?hd6Soi3R6gIEc45KOAfqXSYOXVEXa4TVaWII2Md/+ozbknoWWxZ+jAe7Nz5M?=
 =?us-ascii?Q?RMy84Ky4IN7Y1mhcpFShILwKMQXpk/20LfQ4PbYoT1jOqNnbdIOihgka0DFI?=
 =?us-ascii?Q?RlMsn75PppN1634MjXK8tg15SEOQN2aQf219jT7uBnsVhmJNGsR5S6n9auQB?=
 =?us-ascii?Q?CgIHAYn3vT4mmsahPmDe3C2LoBqW2davl8e/nz7+s5TYT9Hemv+jMaVE5UHj?=
 =?us-ascii?Q?99UKPDHZtCX46zB/XmluGQagxtgc9gBzOC8ZqjqrRFyRcBJJ4BANO7IFI70r?=
 =?us-ascii?Q?4XTN4DT7OV8qSfGuFI6NVGSOLyOdNHM2Em6b60eUCMJizAdE4/elQZYpJ+Xr?=
 =?us-ascii?Q?SVmJJY6SyxDbE+eapokIpQZMV1ipscma9Mkb8uaxnylh3zJMEGlKkOxWgQpO?=
 =?us-ascii?Q?a21O6C2M9zFv0dH53xXFRcFagvhz6D8bhlJET4ECib5a14TbgmV4GpASMhST?=
 =?us-ascii?Q?UCNmhzBVLcl3dPA/YxbPoMa57xAI5MaV6ayCNkZ8/CiI+wZXqkIIy5vdYSpg?=
 =?us-ascii?Q?7ooCvWt+0Bhxb49PAl5x?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN1PR07CU003.outbound.protection.outlook.com;PTR:mail-bn1pr07cu00307.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(36860700016)(14060799003)(35042699022)(376014)(82310400026)(156008)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2wa6ZVX9f1JCMWd8JHft/npKOl0AqbsaQ4YNPJ6O5BD55W1SAJSB+uE5gO6RZLxrhSr+0CPci0556uEFOV1b+VjfeWympzAK2CqyY9wnQn8VZLgH60k5yEk2v3oPPqdHucXdcKSAjVHLDtWUnXzM1JAGxjVxASV+Dc2r/tMcllKwe7ttIXhTuS1ASfgqM6DDNpYIW6HCRyWLtIniP9cYGXg4JHXXlw5++YZaoVszFP03F+G/xUzno5jKWJww8D9kO/Ux+nYdZV5QQ10SDZJCW3AXt2ZMlBYCeErSBr3HrmeRmpVTAxRwDia15lXYjVqjS0N1BXcw7CaDQs4kI8/r0gg06HzYlWJ+pvBzL4Zp0pbiSgZWVEVMAfARCsN33gLDX9xvTJpUhZte38/p8Mq7aCJKIMu/L1XK5u3jZ8X/aykKElhe6k3xuNjooxuPoIa1
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:33:35.4840
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ead1d366-7fa0-41f8-8d0e-08de9f247a8e
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000C6185.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR08MB6920
X-purgate-ID: tlsNG-42698a/1776720820-04D67F3B-040191CC/0/0
X-purgate-type: clean
X-purgate-size: 1848
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
	NEURAL_HAM(-0.00)[-0.317];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: B13DF4342EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This commit makes altp2m_init_by_id compatible with ARM by replacing the
x86 domain validity check with an architecture independent check. This
makes it possible to call the function in the common
HVMOP_altp2m_set_domain state implementation.

This is commit 2/2 of the altp2m_init_by_id phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.
---
 xen/common/altp2m.c      | 5 +----
 xen/include/xen/altp2m.h | 2 --
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/xen/common/altp2m.c b/xen/common/altp2m.c
index 9f5f98e1e8a5..929449b1b03c 100644
--- a/xen/common/altp2m.c
+++ b/xen/common/altp2m.c
@@ -106,7 +106,6 @@ void altp2m_vcpu_destroy(struct vcpu *v)
         vcpu_unpause(v);
 }
 
-#ifdef CONFIG_X86
 int altp2m_init_by_id(struct domain *d, unsigned int idx)
 {
     int rc = -EINVAL;
@@ -117,14 +116,12 @@ int altp2m_init_by_id(struct domain *d, unsigned int idx)
 
     altp2m_lock(d);
 
-    if ( d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] ==
-         mfn_x(INVALID_MFN) )
+    if ( !altp2m_view_is_valid(d, idx) )
         rc = altp2m_activate_altp2m(d, idx, hostp2m->default_access);
 
     altp2m_unlock(d);
     return rc;
 }
-#endif
 
 /*
  * altp2m operations are envisioned as being used in several different
diff --git a/xen/include/xen/altp2m.h b/xen/include/xen/altp2m.h
index cd96c3b4792a..8fc16346d95b 100644
--- a/xen/include/xen/altp2m.h
+++ b/xen/include/xen/altp2m.h
@@ -71,10 +71,8 @@ static inline bool altp2m_set_altp2m(struct vcpu *v, unsigned int idx)
 
 int do_altp2m_op(XEN_GUEST_HANDLE_PARAM(void) arg);
 
-#ifdef CONFIG_X86
 /* Make a specific alternate p2m valid */
 int altp2m_init_by_id(struct domain *d, unsigned int idx);
-#endif
 
 #else /* CONFIG_ALTP2M */
 
-- 
2.34.1


