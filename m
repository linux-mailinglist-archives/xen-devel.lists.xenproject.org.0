Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id g+JyOGSa5mk+ywEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:28:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D8943407B
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:28:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287507.1567966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEw9h-0002oZ-UU; Mon, 20 Apr 2026 21:27:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287507.1567966; Mon, 20 Apr 2026 21:27:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEw9h-0002iC-73; Mon, 20 Apr 2026 21:27:45 +0000
Received: by outflank-mailman (input) for mailman id 1287507;
 Mon, 20 Apr 2026 21:27:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEw9e-0002AV-9l
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:27:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEw9d-00CBiW-M9
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:27:41 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69a14-e002-0a2a0a5209dd-0a2a4507df78-16
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:27:41 +0200
Received: from [52.101.57.132]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69a4b-229c-0a2a45070019-34653984b9ac-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:27:41 +0200
Received: from MN2PR15CA0045.namprd15.prod.outlook.com (2603:10b6:208:237::14)
 by CH3PR08MB9569.namprd08.prod.outlook.com (2603:10b6:610:1c6::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Mon, 20 Apr
 2026 21:27:32 +0000
Received: from BL6PEPF0001AB56.namprd02.prod.outlook.com
 (2603:10b6:208:237:cafe::c4) by MN2PR15CA0045.outlook.office365.com
 (2603:10b6:208:237::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:27:32 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 BL6PEPF0001AB56.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:27:31 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzz8z0bHYz1wdS; 
 Mon, 20 Apr 2026 14:27:31 -0700 (PDT)
Received: from DM2PR0701CU001.outbound.protection.outlook.com
 (mail-dm2pr0701cu00100.outbound.protection.outlook.com [40.93.13.64])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:27:30 -0700 (PDT)
Received: from CH5PR05CA0009.namprd05.prod.outlook.com (2603:10b6:610:1f0::15)
 by LV2PR08MB972878.namprd08.prod.outlook.com (2603:10b6:408:3a0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Mon, 20 Apr
 2026 21:27:27 +0000
Received: from CH2PEPF00000099.namprd02.prod.outlook.com
 (2603:10b6:610:1f0:cafe::e6) by CH5PR05CA0009.outlook.office365.com
 (2603:10b6:610:1f0::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:27:27 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 CH2PEPF00000099.mail.protection.outlook.com (10.167.244.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:27:27 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:27:24 +0200
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
 b=nvBh7wwOzQniENouyjA5m66omeRXKTlsRWUSHjM4fJD1h2ZLdB+pxDGLfcZMEgz7QhmbGJS/G9Cqnmrqf1uc5N18XcMUOIQMeuiCteZuhW1E488TVYIhLSfpVEdx77aM+70X7/CeIOim7BXN9iW9ZsF5Ky0ISbWbI639XvTuWyGj4eEOYHmRo8NbquQ1U4bB284E8tsNNSKYeC0xZwTbk0wfmDQMllujPhGv8MP4xt/p4V2QYQudSl7x7QENavkBBf/hUNQr1iAp6a8GvjPqhCe/DJN7eCS5VBhJg5pBkCFtTiIntzAGWOvXhRVj/URyzI1hix3nCIqmuSnwo3KBIg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qwOwmfrmWpA5bcreD0lLuuQUt9f7SqfexhLWTcmlGbU=;
 b=vT4bAMOt0kNdByuz35nDdRJgHMX4WRne876Ilmxu8g8TEJurAXc87m+krz+87d7kDip/ThUOezo8eOvC/VXFq/7fUrom/rUmW4HXIftBIvUN6Wt2wfepzYcQiWQLs5fMjlCIXJ+nhWg4EGC4psV9N8eAuA6UtcfDYb3ZWY0VEEDGKg1vT7HOpyxxXFuRHxza9uo0ejPgOslAQOLhfKSL0/brXqFcxnYLYGtzwi1sBybgtxXAovnXcXW69a6yoRqoy973GbNq783QH6vKGo+5FTJ09CIJZf3vd4tngtM8y5WnbwPnE0BxZlPuteS1zwrGc2tk2yRlK6FAJmYCdcyPew==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.13.64) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwOwmfrmWpA5bcreD0lLuuQUt9f7SqfexhLWTcmlGbU=;
 b=1Xjw1GIyJgWJ+fOWapuVo3epCodvZLGDi4BcONF4Di8p7mjNd8bQGQWkRiKR8j93EZ5M9aDCS6ECBsKhdB7IuJVKMon/0o0+nxFCaxoaanFnI7shxUc9OcuJqOca9iIouakRQnj4rBiFdxOINXu+Httkc7uSlEEQi5iy8jrpofM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.13.64)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.13.64 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.13.64; helo=DM2PR0701CU001.outbound.protection.outlook.com;
 pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lN52LmQ9MKmS2oGNIic4BpW2Vr0MzZ52cN64EezhXk9uMfKN2vAF3nVcOQ2AAMauJ6VZYMvnw+jjNjSimEHJGNYbhvEn9bNCnHYr+677+ejNJSNdlH1ehk+9BWET425jCyAzxODVqBJ0A4mEid1NjzLqs/gu8rqgpkBddEInyoypXTGkmfo3vcWcC4iADY+b25xTMm1swJUEWVXMwY8emPgAysUvTWcjklXsjiU/329UZPlgj6fJziRS4ivFVP9kCCMqsXPkXfzL879temr6FrpLgBxEsq8kEtXm5jTug1p4vPdTITfmyelq+xwnv1MLxRNkDaZm7EE46ngyYA4peA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qwOwmfrmWpA5bcreD0lLuuQUt9f7SqfexhLWTcmlGbU=;
 b=obJDdRFxNYXVLj7CkfSNfHwI0T2EHdFt9JrtxSvGkJhyEE2M2MhYdyN7riqG80exGqus3JQsU687NTqxp8T23YccbGOHPKncri8hErV+n0FflMi5OFo9xR8MmxM06awS4GvQHyGVjnWgUTy9/Ci8fzKUr8Z0OVg+WSgeYxpzkjuJGbRXwz+n+B2rf95CCC+PIwoiKj6M83OQXMzinti10rXxI5Ya/4MvrNAzBbMX7gpTKjVHwlPgp8iklRdpmccOR+5FxmuuuChQbGc3HWJ9hDyboTO8AVbWs26FUfMh/In/1SWp0USMjGTj8HKusqHyaqZzo4bHIEr5NDaaZoekcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwOwmfrmWpA5bcreD0lLuuQUt9f7SqfexhLWTcmlGbU=;
 b=1Xjw1GIyJgWJ+fOWapuVo3epCodvZLGDi4BcONF4Di8p7mjNd8bQGQWkRiKR8j93EZ5M9aDCS6ECBsKhdB7IuJVKMon/0o0+nxFCaxoaanFnI7shxUc9OcuJqOca9iIouakRQnj4rBiFdxOINXu+Httkc7uSlEEQi5iy8jrpofM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 213.95.148.172)
 smtp.mailfrom=elektrobit.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 213.95.148.172 as permitted sender)
 receiver=protection.outlook.com; client-ip=213.95.148.172;
 helo=denue6es012.ebgroup.elektrobit.com; pr=C
From: Rose Spangler <Rose.Spangler@elektrobit.com>
To: <xen-devel@lists.xenproject.org>
CC: Rose Spangler <Rose.Spangler@elektrobit.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Sergej Proskurin
	<proskurin@sec.in.tum.de>
Subject: [RFC PATCH v6 18/43] arm/p2m: Invalidate root page table entries and flush TLB in p2m_flush_table
Date: Mon, 20 Apr 2026 17:26:23 -0400
Message-ID: <20260420212648.208640-11-Rose.Spangler@elektrobit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420212648.208640-1-Rose.Spangler@elektrobit.com>
References: <20260420212648.208640-1-Rose.Spangler@elektrobit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.10.178.50]
X-ClientProxiedBy: denue6es013.ebgroup.elektrobit.com (10.243.160.141) To
 denue6es012.ebgroup.elektrobit.com (10.243.160.140)
X-EOPAttributedMessage: 1
X-MS-Exchange-SkipListedInternetSender:
 ip=[213.95.148.172];domain=denue6es012.ebgroup.elektrobit.com
X-MS-TrafficTypeDiagnostic:
	CH2PEPF00000099:EE_|LV2PR08MB972878:EE_|BL6PEPF0001AB56:EE_|CH3PR08MB9569:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ba325b9-8fc0-4e39-824b-08de9f23a202
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?96zUFnE2WS1YOFLwkP7518prjTJKBApoFFjoTJfufjKZDGGCIh8388VJVv1N?=
 =?us-ascii?Q?HpauZxmteIjaEmB50irptKiJLqevcGwljCJiswZvAnaMVOVE5Bwn2DJ6sxu6?=
 =?us-ascii?Q?qBKJkxlhNJNmNu0lOloN7g0hKsh/sL1XEfRYs5CWD6yeGxk/9D+5mwM1WBHg?=
 =?us-ascii?Q?HxQ2tfH+R9bZPCbPqkOhNhfJHX1EfVMtfBVd/Ss5vEZQJuRReS4EPumKwgoY?=
 =?us-ascii?Q?HjWlgT2YH41DK/OYjktHo51yLDqsBII1qNLOyg1Nt5WTpxKU3MGIABecvKM+?=
 =?us-ascii?Q?UzHbGEoB6mqQOp79U+JrGQaZezT6y9tp2An+pfA0YzEHhGQtmw+R33lvJ0ex?=
 =?us-ascii?Q?JJRZACWTl8fjz0gJku3raS5hX2v932f18i14G+P7NGdAaFnwz9h99Kgp/ORg?=
 =?us-ascii?Q?gWPg2mD1h8T5LmlEoJyOwyf0Mdw6ueC62jschwnDSaN8jTfA0yKcodsccm1j?=
 =?us-ascii?Q?jRY6Qp89ik9h08lsZXawo04OcAW4PtJiUTRfX/zGxPDikbBQf+mFm5q3KUxg?=
 =?us-ascii?Q?Z/YqfnG9OTdStah5EqRUo7FTF7UPmUmb0g6eknzIw70cSVPRHFjNR/tfNHRx?=
 =?us-ascii?Q?JFZ1bHJZiHgwGdD/9jXvChQmExQ/R1CFCabv7J73Cik39GgJaZXYvlJ+wxHt?=
 =?us-ascii?Q?VIMOAxTnhOkD1djD7TYABqTFnACmxeHIC+JMXWnAK5woVoFmffGrFGTEidsA?=
 =?us-ascii?Q?Q6K4vVrDa90SgPyRVmap8za1nlR1u4aY4mrCh58jFVnV754Zt7X3/46k02pD?=
 =?us-ascii?Q?OBIGKIbGl1y/NZziLn+tBcYc4FDLeUTgK/mE2eRRhQvmdiLwU+9QBlQM2nSN?=
 =?us-ascii?Q?RSNx1QUOJ8PPNXOSUi2dl0jncSL67WQQNbvQtAsIGBIBujCSnybgM4IUvY/N?=
 =?us-ascii?Q?Jtyb7FrTn595iZ7lsii8fj5GmH2Asgworl3U0436H+EPU6Qlos/M/4gf81+o?=
 =?us-ascii?Q?NnC77VwYOdKWq3C/cb4LYmig175yqAnt1+K3yDMpHtAG47Xj8+N6gKcIhtZX?=
 =?us-ascii?Q?XRPNkn07YHS027KeX6s34qCF4cF1vOyL+x6Qo6B3tez3QZX0Eaq24ViHeBo/?=
 =?us-ascii?Q?i+XD4zEAICERkZ731uPjjMGmjvg+HKUGtIISLvPVf+3V0eveqzZjh9fp6hEb?=
 =?us-ascii?Q?W0UgD/Ay823umjWElbqBm8IDWFM+647Oxk1DCSoE64W5HDiGwUJozKOTlbPN?=
 =?us-ascii?Q?EKVFYzNkBReMJZ1M?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 h1sD7//lwMrZvYfq1895suROwTy/4sBmkvFlvctGtGXP/leT18U02zj6Cbko6HkZFcPnzW7wCruKWmb5wBLHy+YKBjWlGV7c+lcFI4ZNQnQrQyjPh9osFxtS8NfTMh6EYbHXN/Es83mKV/0/AwM8CHltsH95z13vXLTkow0GjQu2BEwoK2c39QHMPInDaW1nwcOlaZmmw6oaBpB3RRVOkpavA67ERkoKomivUKc/ZtJ0+QqENm7dORprg8ml4Qpy3Z4VjpGs/7tHBRXJvrFwHUNmI6D6jUEnXBtRRsK3M+Js2jqg8ZIL5G268AzctHpC3Y3ORCksIwSzLnVs96+K5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR08MB972878
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.13.64];domain=DM2PR0701CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.13.64];domain=DM2PR0701CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 BL6PEPF0001AB56.namprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	42722f38-9840-491c-8c38-08de9f239f28
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|14060799003|156008|35042699022|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZKC/H2dYDMb7OU//FiQ3T3veHxblzZh8SsQICAgWgSuzP6k/og0Vasi2Tek5?=
 =?us-ascii?Q?HpaO1Sz5JrVxZ0tzZVHLjGi/1MwzjcxiX/WShsy+9F5BfvDva2CCKUGxCp6z?=
 =?us-ascii?Q?iVrqeb9l2cG4MzzreS6EhwCIJTz3wRjYcziZ3F16jA5R5bi4yiSlLZO/FUwg?=
 =?us-ascii?Q?WAO8SEhIMfMgioSax5wU7aIMdSmkLRT0LEl7aWE0LE9VuuUxZ2ZaFkAsYzTB?=
 =?us-ascii?Q?T7UcA8150mQW9OZ2YztNMEx34BSzlrOYJur8PPVKvJpQP72o3q7QZTuFnkuT?=
 =?us-ascii?Q?AJ6jthJvgosoT817GDfoJlBrDhORbx97+rCAxM3VosHf/2I5S4LmLYSXk1H9?=
 =?us-ascii?Q?xlmWQQH9bF67K285gkHmWQSrZ6EjEj2uCG0XlvV16xgrGM0dJCQNk5l78Zno?=
 =?us-ascii?Q?uQj8MfE/qnC7JLUuFx/OCdlVuAkPfyHld2zOESAFccCcF77apwzKgU2a+3WH?=
 =?us-ascii?Q?XbutBlYcMAIuaSzoAp5vFjGwmPaFrA5T/tnSxGY1hQBK7ziMocmmcAecowB6?=
 =?us-ascii?Q?FseVLdu2BUHdxGyiZLYV17QFNoVMts16TmOVzJwidPE28CUd7xFork6sc70T?=
 =?us-ascii?Q?sMUWGwn+nHsV85wvsCOA6aDEMEqjcCQyr/uQkVcA8e0wYOpCP9jnK20ap9kr?=
 =?us-ascii?Q?JEQSCM5Kpf/akt84ekHlF5Mj6/rSniXB8nhEXnrontPNZZujgZ/aHMX5XJBR?=
 =?us-ascii?Q?xsVSPD0PSATD8bnzzIDQ/rQjK00TeuuiM/husO/KwXLylx5Yk4mAP2ZVlzW5?=
 =?us-ascii?Q?3Wm9nOyf7pirwBWpvgKYnNmJ/bI96fWVKxBQbknuWPmTHzWRVlIppz+xr6V1?=
 =?us-ascii?Q?AWP+ylFS8OPYxOJZ9fO28IdnMDP+sezRL+SjQoKkrakVHA8edbYw8EUNu87J?=
 =?us-ascii?Q?Eiat/4+9fBiSx784LB41KApWamkliDdbsd+Jw4Frm6CE2T1XJ73nefQt6N0W?=
 =?us-ascii?Q?KqiUUiNG09yT+cskb0bYaFZkYxaNR/+lHI/oM1ZPQpdwPcx2O9V/9Vd/tEN5?=
 =?us-ascii?Q?8J+7kc5fAhRTk2/zjXzREPSI7/9ayegli7g0wn2RfbDLh7XMo8ST3UKLx0pC?=
 =?us-ascii?Q?aRh2RJCc22ieTq5VdCEg1+qHPRVTcEGkQKxPWcEybWHewWmGY8L9rBMH0pQ/?=
 =?us-ascii?Q?mJGX2WNyXAqYHHb68SyYpRY9g8u+xVh+t6qUgEFSuHIjuZKf27woP/RiVyML?=
 =?us-ascii?Q?hFW3Gcnwd0C/bzjH?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM2PR0701CU001.outbound.protection.outlook.com;PTR:mail-dm2pr0701cu00100.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(14060799003)(156008)(35042699022)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lDsp+67GXhvLnPeqaTu2H7Lvq5E1MbhF7hMLw4Mxa1Nm85i4ow1v4B81s7ruun80pFkV4eyd8ogyTeowxAMFHLAlheSEzMS4djgNGCyRK5oho21OzRdeODa8XQNhuR4KEpoMAqZVah3w4IA4uuF9JrF2se62b5eYy2xdv/cPbH/k1/noy0+dC+hkpZCVgNJ/dl6ub4c+MvZMZSHB5XJHvINBsgky+LW3O/bG7J7S+DPPHA8FL69WzxvcNP8lAZ/QozkHwp/pNyYtTYAj8WQrJ2bYHtutMJ/OCUs1tLDJHkG99pMs0VoHQwh7Cov89LewEV9a5cylZryrCT7t7JDOi5YqkiOaY0dCYjMYYG8Ge+pNHtn6qk8dxKCDzclmPQYkbzfEakcVRllHldE9/5DegjhENTr5w5907s2SA1kHvlynkZrqLw9RfouosdSa/FIW
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:27:31.9896
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ba325b9-8fc0-4e39-824b-08de9f23a202
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB56.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR08MB9569
X-purgate-ID: tlsNG-ef75cf/1776720461-AD969C48-6D67B4B2/0/0
X-purgate-type: clean
X-purgate-size: 4874
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[elektrobit.com,quarantine];
	R_DKIM_ALLOW(-0.20)[elektrobit.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:proskurin@sec.in.tum.de,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[elektrobit.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[17];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.263];
	TAGGED_RCPT(0.00)[xen-devel];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tum.de:email]
X-Rspamd-Queue-Id: 72D8943407B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This commit invalidates the root page table entries and flushes the TLB
when the table is flushed. The TLB is flushed to ensure that altp2m views
after being reset or torn down. Previously, the code in p2m_flush_table was
only used to free p2m pages during domain teardown. This function will
later be used to teardown/reset altp2m views of a still-running domain, so
the page table entries must be properly invalidated.

Additionally, the p2m_invalidate_root function is split into
p2m_invalidate_root and p2m_invalidate_root_locked. The p2m_flush_table
function already holds the lock, so it calls p2m_invalidate_root_locked
directly, as opposed to the existing callers which don't already hold the
lock.

This is commit 7/12 of the altp2m_init/altp2m_teardown routines phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
Signed-off-by: Sergej Proskurin <proskurin@sec.in.tum.de>
---
v3: Added a "p2m_flush_tlb" call in "p2m_flush_table". On altp2m reset
    in function "altp2m_reset", it is important to flush the TLBs after
    clearing the root table pages and before clearing the intermediate
    altp2m page tables to prevent illegal access to stalled TLB entries on
    currently active VCPUs.

v4: Replaced the former use of clear_and_clean_page in p2m_flush_table
    by a routine that invalidates every p2m entry atomically. This
    avoids inconsistencies on CPUs that continue to use the views that
    are to be flushed (e.g., see altp2m_reset).

v6: Introduced this patch. While the code in this patch is mostly new, it
    is the same in spirit as the p2m_flush_table additions in the original
    patch series, so the relevant comments have been reproduced above.

    In the v4/v5 versions of this patch series, this patch was a part of
    the previous patch. It has been split out to minimize the number of
    functionality changes in the previous patch.

    Additionally, the original patch series used a routine here which was
    nearly identical to p2m_invalidate_root, which was implemented a few
    years after the patch series. Therefore, the existing
    p2m_invalidate_root implementation is used here instead.

    Also, since the original patch series p2m_teardown (and by extension
    p2m_flush_table, as it was extracted from p2m_teardown) was made
    preemptible. As a consequence of this, introducing a call to
    p2m_invalidate_root here also means that p2m_invalidate_root and
    p2m_tlb_flush_sync is called each time p2m_flush_table is called, even
    if a previous call to p2m_flush_table was preempted. This might cause
    some additional overhead, as p2m_flush_table will iterate over the root
    page tables and flush the TLB before it can return to freeing p2m
    pages. I'm not sure if there's a better way of handling this, or if
    the overhead here is negligible/acceptable.

    I'm not sure how IOMMU interacts with altp2m here. I haven't looked
    into it extensively, so I would appreciate some feedback here. I've
    just copied over the iommu_use_hap_pt conditional from
    p2m_domain_creation_finished, but this is probably not the right
    behavior since we probably still need to invalidate the altp2m view
    page tables on flush somehow. Is the issue with invalidating root page
    tables when using IOMMU only relevant for the hostp2m, or is it also
    relevant for the altp2m views?
---
 xen/arch/arm/mmu/p2m.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index 1d598c66450b..51753bb2c34d 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -1271,17 +1271,20 @@ void p2m_clear_root_pages(struct p2m_domain *p2m)
  * p2m_invalid_root() should not be called when the P2M is shared with
  * the IOMMU because it will cause IOMMU fault.
  */
-static void p2m_invalidate_root(struct p2m_domain *p2m)
+static void p2m_invalidate_root_locked(struct p2m_domain *p2m)
 {
     unsigned int i;
 
     ASSERT(!iommu_use_hap_pt(p2m->domain));
 
-    p2m_write_lock(p2m);
-
     for ( i = 0; i < P2M_ROOT_PAGES; i++ )
         p2m_invalidate_table(p2m, page_to_mfn(p2m->root + i));
+}
 
+static void p2m_invalidate_root(struct p2m_domain *p2m)
+{
+    p2m_write_lock(p2m);
+    p2m_invalidate_root_locked(p2m);
     p2m_write_unlock(p2m);
 }
 
@@ -1449,6 +1452,13 @@ int p2m_flush_table(struct p2m_domain *p2m)
     unsigned long count = 0;
     struct page_info *pg;
 
+    /* TODO: How does IOMMU interact with altp2m? */
+    if ( !iommu_use_hap_pt(p2m->domain) )
+    {
+        p2m_invalidate_root_locked(p2m);
+        p2m_tlb_flush_sync(p2m);
+    }
+
     while ( (pg = page_list_remove_head(&p2m->pages)) )
     {
         p2m_free_page(p2m->domain, pg);
-- 
2.34.1


