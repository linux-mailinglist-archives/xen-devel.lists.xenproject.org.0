Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBvzEb2b5ml8ywEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B604342A5
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287847.1568290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwFI-0005Zw-3j; Mon, 20 Apr 2026 21:33:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287847.1568290; Mon, 20 Apr 2026 21:33:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwFH-0005Hr-4g; Mon, 20 Apr 2026 21:33:31 +0000
Received: by outflank-mailman (input) for mailman id 1287847;
 Mon, 20 Apr 2026 21:33:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEwFC-0004Wu-Ir
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:33:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEwFB-00CD6F-Si
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:33:25 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69ba5-2eae-0a2a0a5409dd-0a2a4507a6d6-0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:25 +0200
Received: from [40.93.198.132]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69ba4-229c-0a2a45070019-285dc6847bd8-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:25 +0200
Received: from BY3PR10CA0009.namprd10.prod.outlook.com (2603:10b6:a03:255::14)
 by CYXPR08MB9321.namprd08.prod.outlook.com (2603:10b6:930:d8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:33:20 +0000
Received: from SJ5PEPF000001CA.namprd05.prod.outlook.com
 (2603:10b6:a03:255:cafe::11) by BY3PR10CA0009.outlook.office365.com
 (2603:10b6:a03:255::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:19 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 SJ5PEPF000001CA.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:33:19 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzzHf6lGvz1wdS; 
 Mon, 20 Apr 2026 14:33:18 -0700 (PDT)
Received: from SN1PR07CU001.outbound.protection.outlook.com
 (mail-sn1pr07cu00106.outbound.protection.outlook.com [40.93.14.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:33:18 -0700 (PDT)
Received: from SJ0PR05CA0131.namprd05.prod.outlook.com (2603:10b6:a03:33d::16)
 by PH7PR08MB8179.namprd08.prod.outlook.com (2603:10b6:510:15d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:33:12 +0000
Received: from SJ1PEPF000026C5.namprd04.prod.outlook.com
 (2603:10b6:a03:33d:cafe::1e) by SJ0PR05CA0131.outlook.office365.com
 (2603:10b6:a03:33d::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:12 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 SJ1PEPF000026C5.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:33:11 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:33:08 +0200
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
 b=YTZ9PLxYVLJw9+iaRVgHYAPxDmph3BUORtRrfuUdt3szLrM5m+Px7m9WnfQX2cDBTCUb9jaeRUkvkgOS6PRMHoRY99XCHT6+IRWib5KOZzs9JcA86YGfIfqAKHBSOnQK3Xz/1tJJc2q5iI0NlKCsnGZNcdaxu4rFwAod24RvAMU00qan4Uac7CYpKa1n1Q49PfLDEyjAQBsvywqp02R5yV5aM9Qist9z0NRs47PALY+DwF7V6gIQhuU1F9bv36ehXCOUgVhrdp/GtGz1p0BZ1maxlulnTUEg8jvCwd7PUqMITht+w0Q2eMUwxMleRtAd8pe2cf+CkhrrvShh/rtdGQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2GKS7huUjzjhqkDR3rg4P6NQTDEiD+t2h7OWKwFuOAU=;
 b=pZcVMxBlWKNCAuC0wq5fB+OxqZ7QEAb3cefYgTzN9fjLO/iO1w0Ni+Mtpjr29h1ACwdKWJijSOH9YFJ3HO27IJFLdtXod8xFwxvasXdJXUaKqbj/fCs8lGOZWK09vtsA4sWnYx5jOs5xe9cJx2M2LUmW0DA+UJeXHYjo/OHhjnhl0iOCL1+tJOva1Ven7P11tXMk/lDj+Cx3xZKO1solbn3b0nX4Mec6UmrhDOORX/O35PwLXFZaHUhLim5qDTh3JIhHu40G3f6JB92Fm+7TVD0NB4lH9hlN2kl93P4Bd09gtSLYX+cGLfNPkSuDYkozycEkw7QiWz/XsEbgFMVC9g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.14.102) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2GKS7huUjzjhqkDR3rg4P6NQTDEiD+t2h7OWKwFuOAU=;
 b=1VQqidNwjqYSxrjHGICCjdD8Ar4gKWypkx+I7zfg4upTrw1f19yefVmMw7+Y4jEe06eMfPbHcLUCQH5u9WbStl4H0b7m1P+YDo9wzwZANtpVyqtlKularEl/xHP6+47VfDkz37h6MBadpRhIcZATxsM/royIwX8Nlzqfc62tXJA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.14.102)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.14.102 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.14.102; helo=SN1PR07CU001.outbound.protection.outlook.com;
 pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aQcBDk3xeVNDFjWmLOcNKrqzF7njqybv5nCzVGtgasmGcSPDcOAFd0wqe0+stJVcxKXSsL00uTYa2RcMVwfQaTKQdP/pFA4TECwJVPZssB04dSkEDPPbkkI2sX0N4CIzjKqZGKwVWp/xdgRipBSDZZNI8G3fvdgBV2pYt7T/ellTftsXyniGYU5EQDas2MFsHmbdpww91WsLQhx6jOBtH8d5qdm4Li6DE/tsdNzr74w+GlDOhY/EabOoZEhb7BMIwOP3oPCurXJgwzvx7juGJMgD7XBPkShQ9NgKPY6GHNr1TyQbkq3HQDIkmL5gOvLDAPYRXUhlzks8tzlcAUp7zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2GKS7huUjzjhqkDR3rg4P6NQTDEiD+t2h7OWKwFuOAU=;
 b=Dw3/haY//C7Ii7UOxpqHvDbNF9GALTH4KK0N7mMb669saII/4Rt3WwfyDgq2ebmGEbNZHeuq+eZe2ct3V5+D4nDSzYgMcX1xhGHXUglwVie/4JpmD2PqmiKpPpBvhcrK5xAibu4Me90z1D/KfpdRh2A+LDC1x1BQk7zotAHoQfhMIzhiO2lTgYSzpdQ2W60DWsGzzp39Dn1jpZOtso4tvRzN+sQZo905mCOEko2Zwy4lEmGe1nPLrsmYwdcUI+3XYpgTh8tuUEyQfMSMPR4qWDrPMwtOGSpmqd8+EyKSXXx15DA+1NPCMABhX3bL+CNnNaifLq8sx6SYoAW8rCEwUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2GKS7huUjzjhqkDR3rg4P6NQTDEiD+t2h7OWKwFuOAU=;
 b=1VQqidNwjqYSxrjHGICCjdD8Ar4gKWypkx+I7zfg4upTrw1f19yefVmMw7+Y4jEe06eMfPbHcLUCQH5u9WbStl4H0b7m1P+YDo9wzwZANtpVyqtlKularEl/xHP6+47VfDkz37h6MBadpRhIcZATxsM/royIwX8Nlzqfc62tXJA=
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
Subject: [RFC PATCH v6 27/43] arm/altp2m: Add support for altp2m_{get,set}_altp2m
Date: Mon, 20 Apr 2026 17:31:50 -0400
Message-ID: <20260420213206.208750-28-Rose.Spangler@elektrobit.com>
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
	SJ1PEPF000026C5:EE_|PH7PR08MB8179:EE_|SJ5PEPF000001CA:EE_|CYXPR08MB9321:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c9bd3d8-bb54-4dbc-7c83-08de9f247100
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|704161411799003|36860700016|1800799024|376014|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?Qbnj3+LRkZr3oC14PJrZ3EqbuB/Im7qwaoBBxSxGtGjDF1MQwqKoHluXwPWv?=
 =?us-ascii?Q?apxaj2k55iqxYMzaEbp9SRnvLKjlq0DtwPoeMlaR4xgiuG6bCUb7u5Afy7Yb?=
 =?us-ascii?Q?6U5sKb6Vlgyux+i5xXjQSAFppKSqT+4YHb2SV2Ruck2lDv0vJ9wi+h0jC8Pq?=
 =?us-ascii?Q?jhf5AonIxGqoS7YCtiqUk4erE5DuaWXlMrCBb20BSuXkbrt4mTR2EI4UZVgi?=
 =?us-ascii?Q?K+2H8L3yzI2TjeKcTQfVJp6MitEDpk0ZTvK2wT3Ne04E3ftzr+Ld/L74zuq5?=
 =?us-ascii?Q?vSnXD10irj2e6vqQ/4kUfhieL+eQ6ESOrdPqz01g3dHj11Q5Y4Xizh4qSWpl?=
 =?us-ascii?Q?64Wzr0kA0xZChhZHqez337zx7KIDu+OjB7ZVykcv1Fc9MyX2hWMyryZbPuI1?=
 =?us-ascii?Q?+JFRtHXyv8+Poa10zoJruXEGXPE+p3KroX9dTUnIdSLAJfR3nPAJFAQ6X/p3?=
 =?us-ascii?Q?TEiZAOXQHkK+B7VlyC4srCk9hptJIhUCZBuOrEfYMJj3FV2De72/PkEeFolp?=
 =?us-ascii?Q?yovWJFG3KNILbxrIic/xCI73RkfXqX1KTWo80lF6tuLt3Wg9lS4BrEpWRm2x?=
 =?us-ascii?Q?HLMLYBRnv5nuMApR/59k5P31kXFbb5aa9RCRQeXQHHIYYKv5HgN1g//qyphl?=
 =?us-ascii?Q?ZvJPCtgb/oih21ofEJG0aej9fRgvPt7s+9yrNiamsJfo3hnm5MZgpGHftjqN?=
 =?us-ascii?Q?SucPxAQvLXQDw5Whu1H+FFxvuD6JGgpuLe0el6hrAOYjLZ8zp3yo1V0EHps+?=
 =?us-ascii?Q?IzJ+68b5WDqb7Pdwd+ptanndtZEzbqtRnY/PyGPmZJxApV+mpqk2/B/VN2PR?=
 =?us-ascii?Q?NSaFOEzA7pYQsTac09s1kWTI7utKpa4FU+Qc3WpAn4UWHo5C0vNVY4bXqrdt?=
 =?us-ascii?Q?baCCwTtFCunJFWJBEfIltF+xuWIIx7+FDUuSz1z5rsKXIwDGNwVkop0jneU5?=
 =?us-ascii?Q?XSQU2oRUVXWuAoZ9Hk6BP9QGA9GOj62U+y8ZrVF4z/jm69cDIpZtMb4wf68K?=
 =?us-ascii?Q?3sIa5e0WuZHrm7Q6P6LNegT1VEiGB1SkBY0Fd+PEeUw6Gxv0UDZA2TcHl1t4?=
 =?us-ascii?Q?CHJd8RSKaxdY0cOXaeSa47NzCmozOl+SlyaPD3Na3F/iJ83PlzZcVt2R4/tq?=
 =?us-ascii?Q?FPcSu7mDgXYj?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(704161411799003)(36860700016)(1800799024)(376014)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 fbkxuHJ2WviD4afycZ8CYND2dwCigXQxzrpWdUItRIm5PG+vo0Wh+w5ygf8rEos2caV3qJHQsQwvGvzG3Zk18Z49R/ghBA3Gv9+f9B4KhDShEEIoqxZfcY84EFyan0jLYW+n9DuvD0ynjUKMSDCqVldVNrgw/hIehWAnRYlp/cXgZoxnPoqhEAsVUPqTIOfbYCY4uyWvSNYo4iifZSROkCh+MWjRfHHwRZ7p3tjJg3lfTAQne3KL4w78JSj82feDJVHWmkBcscXbjTUmhtqw9+lNpGQQrYtUILqmoLl0DfxVBjDpsSwATyMyvQkw2kkZuVrmm0ieQ9tC9vGgxcYgKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR08MB8179
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.14.102];domain=SN1PR07CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.14.102];domain=SN1PR07CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 SJ5PEPF000001CA.namprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	af969c1a-ffff-4434-21e5-08de9f246c74
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|704161411799003|1800799024|35042699022|376014|14060799003|36860700016|82310400026|156008|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SbFSRTCnG3Tn3LYMThnGHyzgTlUho6sfft03B89cS8isD5/9c5FiacUf/KBt?=
 =?us-ascii?Q?LIZaHFaGyYNY5Bc0sm45Jb0azn36Y8fLu+bqOUss+7DXcuu1SKka8T6qbkli?=
 =?us-ascii?Q?mQohUqiRzY4FbHxidBaoKTVA3hsjlj8ZiKlmqZWgEFsOqkONNJgK/gnIfDFs?=
 =?us-ascii?Q?oY3Fhp42RfeZYL5KEf+i8NheLUniv3jzuHXiqaJTGjfgQhPFiXVoTtIkabPE?=
 =?us-ascii?Q?4k3beOiKpDUwqNqIJK80fJoZzEqYVR6ivblxgkfaPrLJgqfXcOq7fCGS24a3?=
 =?us-ascii?Q?bHmggFN/XQYtamobEmf77NWJNuCfRP6dzLdY37vUtcPN+4a5Pvqnv6UTkSwI?=
 =?us-ascii?Q?v9Hg8ycglIltuXVXqT78/tPhpbykI20rihD9YYEiNzVsVA9qiWIv8wcSSSsc?=
 =?us-ascii?Q?H3nBhERDG+ZXhH+B4CPOvv/VsKaA+NTgZ4esTifv3PufZq8Afjbd+PBdWCs+?=
 =?us-ascii?Q?E6yjx7o1Uy+frvpOGLCrfTe2sXAdZULKK2SqUN06giZ2qm6TD8PnBN9M0wyH?=
 =?us-ascii?Q?n4lXf8Afg1CQLX3uZ9OXbAb++F4c1dGA0eltX/63j31hvE3iqy/vf6C1KGh6?=
 =?us-ascii?Q?VFEzg3ksoFYknqAoQdVJ9UG1jQbu29AhJc6Teu/wGp0lO7q2LF1h+lRxSyZX?=
 =?us-ascii?Q?xVEZk6OzN0uFXRY0lu4roYAkMbRdhv8DTvhpPFMaqNpEc1cJmXdAaxWDO/3c?=
 =?us-ascii?Q?FXxzQqHADPJnv0wB6x9krXJb2iPCTMNqdn4jsO6AHxlSjCaET+vcG8PS1Ckr?=
 =?us-ascii?Q?rWoUZX19jJc2PoiaJAbPsIigElK6wV9cCZHMoZBXSfMKMAG7XWNY5ZnX2AQ1?=
 =?us-ascii?Q?SWfxpS/1wEZ2WXIbOZwDcIh9xqrgijCnI+LcKtxx/bSt+oK4L1KTODhzJvwj?=
 =?us-ascii?Q?vO5HhtfT9pmKh4G0rxmW1lrGAKTLk5YlK12RTSwcRNRy+ovecLt0pwsCpYzN?=
 =?us-ascii?Q?iihL+2+MrhKAxJSY2plr2OZ1/fcA8Ux0AvUWC1gD2RMTfsekXwM2Vbyhnzz5?=
 =?us-ascii?Q?PK5/EDf12+vFX3KfRN+sYMHvkUegKy9eZG/auVjP+weSpJFCAq9NbqWGm5B5?=
 =?us-ascii?Q?+W42sFotfdnyfxv9jsNsBp+my50J5xR9jVoVg3sVJXogDbm4C6VqrYtWTFNe?=
 =?us-ascii?Q?RLYuMdGchJfF?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN1PR07CU001.outbound.protection.outlook.com;PTR:mail-sn1pr07cu00106.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(704161411799003)(1800799024)(35042699022)(376014)(14060799003)(36860700016)(82310400026)(156008)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+U5MP/qAvqabj9vaHrSAxddta1q6t9drd6hhsUt1Q7uy66BoCbmsf9AvewP1gB1hWNOfnJE3be3yipIYHdnnqDlPE+8BhXI7nlfufjSGBxnV+JoI1eLwrvzu2li+hYJ3VvekOxiG09zQZNELcj/d5Icbl7JxlFBGGZ2OQ/WeexLuTuM+gwEz2lriap498VWG4bZoA4KOpxxpzIl/V2URabzvgGnuThpKGZMpyyQJYQmr7Dkxhm3Ijyp2mPMaOc9rKSHhnPYPT5Bll77eAD4mEwxoQU4WDEmJ1HdhmJodUen1/LBumn3mQx4vw5EoRnFjsVCC95LyQgaxZS9bK1SO7ZHvAY+8nNJL2/fP39vzDkOx5ZGWKIarOtoDyzlWkQDGfszSBV9VwWgNAa9500vqVtiorhUI8z0sRuljjXF2PYvVdhBeDmGvwObD2cSa3Ef6
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:33:19.4172
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c9bd3d8-bb54-4dbc-7c83-08de9f247100
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001CA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR08MB9321
X-purgate-ID: tlsNG-ef75cf/1776720805-2BF7EC48-CD86CD37/0/0
X-purgate-type: clean
X-purgate-size: 1778
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
	NEURAL_HAM(-0.00)[-0.306];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: D5B604342A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This commit adds support for altp2m_get_altp2m and altp2m_set_altp2m on
ARM. The x86-specific VCPU accesses have been replaced with the
architecture independent functions altp2m_vcpu_idx and altp2m_set_vcpu_idx.

This is commit 4/4 of the altp2m_{get,set}_altp2m phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.
---
 xen/include/xen/altp2m.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/xen/include/xen/altp2m.h b/xen/include/xen/altp2m.h
index 58e74be6deb0..f5a4d0e60562 100644
--- a/xen/include/xen/altp2m.h
+++ b/xen/include/xen/altp2m.h
@@ -8,6 +8,7 @@
 
 #include <public/hvm/hvm_op.h>
 
+#include <asm/altp2m.h>
 #include <asm/p2m.h>
 
 #define INVALID_ALTP2M  0xffff
@@ -31,11 +32,10 @@ static inline bool altp2m_active(const struct domain *d)
     return d->altp2m_active;
 }
 
-#ifdef CONFIG_X86
 /* get current alternate p2m table */
 static inline struct p2m_domain *altp2m_get_altp2m(struct vcpu *v)
 {
-    unsigned int index = vcpu_altp2m(v).p2midx;
+    unsigned int index = altp2m_vcpu_idx(v);
 
     if ( index == INVALID_ALTP2M )
         return NULL;
@@ -52,19 +52,18 @@ static inline bool altp2m_set_altp2m(struct vcpu *v, unsigned int idx)
 
     BUG_ON(idx >= v->domain->nr_altp2m);
 
-    if ( idx == vcpu_altp2m(v).p2midx )
+    if ( idx == altp2m_vcpu_idx(v) )
         return false;
 
     orig = altp2m_get_altp2m(v);
     BUG_ON(!orig);
     atomic_dec(&orig->active_vcpus);
 
-    vcpu_altp2m(v).p2midx = idx;
+    altp2m_set_vcpu_idx(v, idx);
     atomic_inc(&v->domain->altp2m_p2m[idx]->active_vcpus);
 
     return true;
 }
-#endif
 
 int do_altp2m_op(XEN_GUEST_HANDLE_PARAM(void) arg);
 
-- 
2.34.1


