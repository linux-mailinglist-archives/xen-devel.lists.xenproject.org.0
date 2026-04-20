Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLwFAEOc5ml8ywEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:36:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44747434363
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:36:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288108.1568451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwHW-0000pn-0m; Mon, 20 Apr 2026 21:35:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288108.1568451; Mon, 20 Apr 2026 21:35:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwHV-0000nL-Tq; Mon, 20 Apr 2026 21:35:49 +0000
Received: by outflank-mailman (input) for mailman id 1288108;
 Mon, 20 Apr 2026 21:35:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEwHU-0000nA-D6
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:35:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEwHT-00CDNp-Q1
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:35:47 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69c0c-2eae-0a2a0a5409dd-0a2a450283ce-28
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:35:47 +0200
Received: from [40.93.196.138]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69bba-af86-0a2a45020019-285dc48a8c50-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:47 +0200
Received: from BY1P220CA0049.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59e::15)
 by SA1PR08MB972883.namprd08.prod.outlook.com (2603:10b6:806:4c6::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:33:44 +0000
Received: from SJ1PEPF000023D2.namprd02.prod.outlook.com
 (2603:10b6:a03:59e:cafe::10) by BY1P220CA0049.outlook.office365.com
 (2603:10b6:a03:59e::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:43 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 SJ1PEPF000023D2.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:33:43 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzzJ71Vrkz1wdN; 
 Mon, 20 Apr 2026 14:33:43 -0700 (PDT)
Received: from CH4PR07CU001.outbound.protection.outlook.com
 (mail-ch4pr07cu00106.outbound.protection.outlook.com [40.93.20.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:33:42 -0700 (PDT)
Received: from SJ0PR05CA0206.namprd05.prod.outlook.com (2603:10b6:a03:330::31)
 by BY3PR08MB7073.namprd08.prod.outlook.com (2603:10b6:a03:354::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Mon, 20 Apr
 2026 21:33:39 +0000
Received: from SJ1PEPF000026C4.namprd04.prod.outlook.com
 (2603:10b6:a03:330:cafe::b4) by SJ0PR05CA0206.outlook.office365.com
 (2603:10b6:a03:330::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:39 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 SJ1PEPF000026C4.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:33:37 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:33:34 +0200
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
 b=im6LliEQZ3m2AR2HF9hF1s7UQpm9HNlH+h5Tu2HuE07+r/2f3etESXKmVGzEVp/p9rgePwxwUXca2CKl1iTPQzfTR5EkhqPcJ1/wi6/c+VZ4Sehs8xyqqeXYcOM5VfZLd9vRetRiHCHaUdGc+pMnxJk512Oos5T9r52BlAFfhFUFKZEho4qjBE4PrAqkW98pnDMywsOvUrxd99mZt5OFZrqdqQ0C2ItW8dvygxWNA8rZlow2sERQ5YzBpGNlmwLM1sUwDmM94FCDr7pxj3qMB0zflN/zD7OjtehTzHA6YC848ka+dtVj9F1v4QuEvvnVo89vejJZ9iE/ifOUoSHuCw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0lp53s3cEzb9Nvz/oAdVE45KuMPihoHv/HOfldJHvpI=;
 b=ESQoQIwe8euF5LIVQghc6IfjENqzcJk76jBUvhyI6hpcb2OhKQCyXhLgNBmA37kemK2LTT6FHCcDByD0jj5+gqS1gbB+OosetrQJ1L5zUH7LZIbhKPkSqoMGYsjnoPS1Y3f/drnex9pbmSyTIdd6ct1y3L6c/Q/ou7lA3EOCM+R1A6Xl1pzKeHIdlhJCTzwrj+mvaL1XNUJHRK8/nutBJZ37rstbkqdAeA1wVg3Efb0K04FokHhEXDZTuVBGungM9DlmIhTD3N+/8O7bXpnQ3NteltBYm1ZqfKRQGTNC91RzQwZqu/bIpkZxDTtrMhTodh8QuKmuUTxvKAsFEthSLg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.20.102) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0lp53s3cEzb9Nvz/oAdVE45KuMPihoHv/HOfldJHvpI=;
 b=H8/hFK6Ut/PXlgIFGIVC5syrzlfuJoFy6mSaEAnuE3fTo3FcjtySmJDtDEAFV4N0snSSgRtKfI1CYVj2BNv9a2nCLyuIN9a1Sx5U4+6CKdqAhPBK+/Z1oCcFOl+DRGpUycy4YAj+EoGbgjQo4hd3AtvoVia+ekSCH6v0YClZR3A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.20.102)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.20.102 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.20.102; helo=CH4PR07CU001.outbound.protection.outlook.com;
 pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jf9tnIA8AwpI8imNcSBLeboRng7KeUMit5GD9SlEZgGkXORDoCFQ0vPKShWICtEueBTzPCHxQ/yrvR5QMD1FSh0Em/0KDnRw7PfKVO15uyHssqhggEKBSebgoqcH6WrV5+ga95wg9a+UoVsuYsqWK+fbTElGwqAkJtADwy8ZYSoXjy3FpIgN5liuHXaxHbCvhEOOeyN9vOTMQvMf790hYGvTLElP44TqePpJ4ySYxsE+HJX39aH2XxsGSt+HHQSwxT9W5kmZinM9CPpnYrWZZccvI2Mn0yByA1jKUaJNPWrwiHYsMvhG9SVro4imJsKscdNNWTfrLw++6g5KWFQYow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0lp53s3cEzb9Nvz/oAdVE45KuMPihoHv/HOfldJHvpI=;
 b=zKR8dxAoXwv6XmvmDUKm89I+qDmihjxzxr9bKcgBqRhlf67TEanfnn6JeNVcpBf0VPRywUDWG8DBvj18fhB7uxbTXaKmiU6R/RaPpFKyAoKXXr+Gr0YuIC2h11TQyFFR/z7E72SJ9prRccA7eV44asqS/Q+C7h8mRa3gN+VdYReuPsve5lGpNK7tTjFs46S+Ct2muJdsT2NHEZcQLhRsCFXBSiPAaXmZgafcYZp4rJzZvlbEXagVMijbn+srlgN5SYx9MkUt7x+OpncVY0mq2AteqIlAspQGgiaC2Y/CUyhRMCGMxfIwDlFH2vYBvslj/sNx/7Y+8ptxmjwNWhqztQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0lp53s3cEzb9Nvz/oAdVE45KuMPihoHv/HOfldJHvpI=;
 b=H8/hFK6Ut/PXlgIFGIVC5syrzlfuJoFy6mSaEAnuE3fTo3FcjtySmJDtDEAFV4N0snSSgRtKfI1CYVj2BNv9a2nCLyuIN9a1Sx5U4+6CKdqAhPBK+/Z1oCcFOl+DRGpUycy4YAj+EoGbgjQo4hd3AtvoVia+ekSCH6v0YClZR3A=
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
Subject: [RFC PATCH v6 43/43] arm/p2m: Add support for HVMOP_altp2m_set_domain_state
Date: Mon, 20 Apr 2026 17:32:06 -0400
Message-ID: <20260420213206.208750-44-Rose.Spangler@elektrobit.com>
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
	SJ1PEPF000026C4:EE_|BY3PR08MB7073:EE_|SJ1PEPF000023D2:EE_|SA1PR08MB972883:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bfcb31a-e5ab-4865-8208-08de9f247f72
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?XV5aBKWlpb6NDi+PEZFfUtbkf2TWx49dxL1LnOR71yGAINOFiEHhxv94KKjm?=
 =?us-ascii?Q?TAeWPdeHGXuuiB73DnDguIjppQqwfl55Uv1Atrv1E3qv4IUO6HkF+3TvsOP+?=
 =?us-ascii?Q?zfp9oPWIYNBEiE/FZcCSuPPJQ4lafeu7F+Ch9sJFkgXnuWZzXaJMiyTeo7S2?=
 =?us-ascii?Q?biDpHRho+3dPEpGbbn5krfHtesla2H9fOAeOyoIQ5jw9GgES0wSNe7nsrIOy?=
 =?us-ascii?Q?zUdfUlcx8GxpJ+rVoO2frnrUF0s7hiokmM/9MhDMv0vKEs0C00vwMCloivVI?=
 =?us-ascii?Q?MJIUqny8+mgrpL9XYZbOFeCULELpLF3FIUZEcX+LBLCThaMiJtVhYYgxK+9i?=
 =?us-ascii?Q?TpSocLuFWgSv4C8d1dzd4M5MkPPFRXuFWAYAl15aE4ley2BZ2p+oyp7MP7VR?=
 =?us-ascii?Q?TLWYR+rPaqKkP8dOdIzpJMfqsQ7mPlxD/nn9m2jxdlzl7wluP4b4UiZopsw0?=
 =?us-ascii?Q?zDSCCRwQNzzS7ZbqDV1nf0p6Pec2zOrmEluKfCcJvgAoUNs+9W/dehDhws7o?=
 =?us-ascii?Q?9aMj2Bk3cjOc32aTB7pPiloCz6LDZGPA8qys4YtxBxUbBzlicmwwUuPd4T9K?=
 =?us-ascii?Q?wXK86PBM1X3+9ybljSP7Q3GAFdqGBjMfP9+qrgTTPCyKFxZkFLR6CBYt06zX?=
 =?us-ascii?Q?oaKYsOAj7xITVbiPzIL5/BvZAZaloQmSty0d/Njc7pTDOL2fZHGCww3+YWvf?=
 =?us-ascii?Q?vmtMmFNlb72EcrIIH0pNuejaTWzj+QiK1NM9a20h3hq8fvEZHeBFCUTYtVOm?=
 =?us-ascii?Q?BjhMNxJG0G/VdEXC3wOJKZKzjJFBwmLaeis32CfJpaAhrk1AmuzZjpDbWy37?=
 =?us-ascii?Q?Ky9rrHFY66KcqDLlFf1LHSwIKjpPxMOWauljDDz1bpGwe4RjTu93SPlgrg4g?=
 =?us-ascii?Q?BuOqbDLNvUj/HsRuPBwAD3CkDUb2QTvJMDwzWb6EiuUxvb1bjsq868Uzg/Pg?=
 =?us-ascii?Q?30g3KAYkvPEHW05O7lOgBdU1ekprEh/W3pMdqDxXsoiS3ANdcv49XO6CXfwg?=
 =?us-ascii?Q?P61oGXuq48iX8ZCPGs77jv0J1OpohyIB6B4zHjFIzC2uBFwYTvDM+ZI93BpC?=
 =?us-ascii?Q?jndUdTcw/9Ryc/V6F/6NGtZZUsCi8iCpu4ZGVPmElYlDbMFn7EZiWe5vYV42?=
 =?us-ascii?Q?94VhiRcfBVfziutLB7kGp9yfmQbUPasbJAq+4/YTMDjSihkt3zEOiD8x2TTv?=
 =?us-ascii?Q?AFtUg/aUhfIb+sWb3vcWBhDy5jb9hYwpZ1Hw1ZWJ49Gp0wPSfhcggYFzGOc?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 ExNxAdtuiKBPTX2JDOR+q+vPH+FIqED8FhsC0WEwfEWRYWT/+nwC7W470VTuAKTXZDvph9sgzjInGZZ2tmiY2z9EPbBBusfDZdmMfuZS4e8C3IzMkv8cLRsdi9hMl6Ifv4aG3WOAwKB5zxW+skHQFr8aGJ38rjVEUjkBxZaO+J25drBtj2ZlX21W6oDi8qjdQSpgquIkzgjTL0HqIxJihonyQOw0WljnHWBc5nB48nDz4VTNo9/IyAFruri87jVkomJfNR09U7QX7D4mDJl98+tEf79Qmd/WWT75a+4Ra2Joifvsw9JY0D/sum8Wzi9EH64C+PKAdRDKYf3zONIWRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR08MB7073
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.20.102];domain=CH4PR07CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.20.102];domain=CH4PR07CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 SJ1PEPF000023D2.namprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	abed3dca-89bb-4aa2-7d3e-08de9f247c07
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|14060799003|156008|82310400026|35042699022|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CzUBfs88kWSB2eNUE2NR9pK/rkKUp46uknjaT4UiI9DlbuhTI7LrW5VnqWjl?=
 =?us-ascii?Q?mv0r+4Pcvl+dDJTZ9m8CwCfnq19ecOzcTAd5KX8JC5IjolyW/XegekfHsr15?=
 =?us-ascii?Q?SUK9fPgB7oNKi8XGEmQwq3v98VrOvjdGTTt4uM9PL3fx+VOtooX3byr2M4BI?=
 =?us-ascii?Q?XLXHmHjmwcxPMrmaGdFF0IsIcm1eZTI3ZkbohJg/thtAPMQ8yEp3RuLb89e9?=
 =?us-ascii?Q?ZlSHO6z16bEJJQCKI6RWgT/ze/Nuly4BjXP/KIjc12fwlwmHeRvsdxUOM9cX?=
 =?us-ascii?Q?b9CmVJSf58QXHpjTYYlsHvZuc1HqQUSSibDem+Am4XTgP4NkmPM4B03/Rhu9?=
 =?us-ascii?Q?KykRUM6ZviRQZKB8XQDVbpKEDlaIJdKNtll4u0x1lmPiHuxqq1s59zFhYwWZ?=
 =?us-ascii?Q?aldfL9kvPxFcSKxGCxUw+MpWW195h4sHUGkunRZ0o5BFERgpOCV5k5awVEHV?=
 =?us-ascii?Q?gHP/eglXm631w1ydSHV7HLkNqHwTXKXzjXdI3U38sl65W9k8RVcmw73dECBV?=
 =?us-ascii?Q?E3t5MtnuNxpn/FCtdzVGMhxO4FD9TwoO61WigybK9pAAURyRcknHWcDurrfR?=
 =?us-ascii?Q?VIQimmMk6JlUZ8bCuWKj2Op+/k55m/lwannbrDHLtZ6G9M4J/EwEHaXes+6p?=
 =?us-ascii?Q?4iHH/H65jpbJFvoqXnW2Ku0RWbNEMti36l5m+IzFpRuai25ywKTV6YA/rRZT?=
 =?us-ascii?Q?VwHsr5eh46bxzK+YM9v35fMp2FwLnqypM6xKMbbuMzlA79vHVEt1lDrGR+7B?=
 =?us-ascii?Q?zbXhUfi/NbS3pOO9cuNnf9Z8jqhx055MKTLf6HrL+wgmLKAXVc4sfBaJ1buR?=
 =?us-ascii?Q?/V7JOx5VvFdNxpxSqHr2AumMH/7PvZQonGIy8PbGkNsgPpNgJ4+EeQ4r7Lrx?=
 =?us-ascii?Q?HsNYUydteZDcYgI952n4ZdehnLPze678BgTX3aAja4iQ3Nce+9DHWFa3msJS?=
 =?us-ascii?Q?ZFPjUsYOF/lb5d0BmH3VRanacqVuM8paVG3iq3xhu3XByemh1RAzg1Z8zBTL?=
 =?us-ascii?Q?jZlDRzcjvwILFvV6TFeSoDluieMy0kOOu1HfvUKTpZSxFSyEp+wxKMnjyj4H?=
 =?us-ascii?Q?KkzgPKKoymVxxPMVMF+GrZBFFsIWwCtTU6/Mco8sNiSVhN7LMe8yGtMu3vYJ?=
 =?us-ascii?Q?oG0e+pfh9DKz5pp0c4fZF1+iebJIal1c4gpeof8Q2g/3TKWwaD+NJ9k9qam2?=
 =?us-ascii?Q?9SpQgaYM01Izgn2JfNdqNe3qtwg90anB5lyvDFzINYziDbKN/SqyCKl70Xo?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH4PR07CU001.outbound.protection.outlook.com;PTR:mail-ch4pr07cu00106.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(14060799003)(156008)(82310400026)(35042699022)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UksYP3b4oDVxCbqelWpG9YZWPvxfoEGNQOm+ff+ywnt8jmVcc22RciV/dBPRK1lJpKL5/TJnZ5MTzyvhdCLtmoz5F5NmanUuCrzkDwaf8qyxb2P0rrp0hdD/7Qv+6PAMjumzWTdmbbGBN32nApcqEzToWqAZvDT8KWypd2+MbuTcDHZNhhVbFxgOy9ih8w9+N+tisMy5ygWZKnJFiJeZUQqk1c0gfka7tvhsszUmsZnVhUzEGIE4paLbTtxumh1fmGAg1UYcNd5kKzRgMWj7bVlMAYKX3uOxWzDs/vwy57PC/NnmR6OWgAXuGgbGKe/2p3k2M5wNIWSwGoVI5tY/glv1e4GyohQQfbJNWlMGXrsQnXs1lNI2okM/gHXOfLwd0msR0PgUaRLTRgFP+Q/YvsIy/ln+AqnK2jdMybj6M8TvSnEpJKVnlk6L2qHXYAqm
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:33:43.6478
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bfcb31a-e5ab-4865-8208-08de9f247f72
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000023D2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR08MB972883
X-purgate-ID: tlsNG-720697/1776720827-8276A161-8699A42F/0/0
X-purgate-type: clean
X-purgate-size: 1344
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
	NEURAL_HAM(-0.00)[-0.238];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 44747434363
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This commit enables the HVMOP_altp2m_set_domain_state command on ARM, since
all prerequisite functions have been implemented. This makes it possible
to activate altp2m on a domain.

This is commit 1/1 of the set_domain_state phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.

    This patch replaces the "arm/p2m: Add HVMOP_altp2m_set_domain_state"
    patch from the v4/v5 patch series.
---
 xen/common/altp2m.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/common/altp2m.c b/xen/common/altp2m.c
index d980ebed08ab..951e56a2aba5 100644
--- a/xen/common/altp2m.c
+++ b/xen/common/altp2m.c
@@ -254,17 +254,18 @@ int do_altp2m_op(
         rc = __copy_to_guest(arg, &a, 1) ? -EFAULT : 0;
         break;
 
-#ifdef CONFIG_X86
     case HVMOP_altp2m_set_domain_state:
     {
         struct vcpu *v;
         bool ostate;
 
+#if defined(CONFIG_X86) && defined(CONFIG_HVM)
         if ( nestedhvm_enabled(d) )
         {
             rc = -EINVAL;
             break;
         }
+#endif
 
         rc = domain_pause_except_self(d);
         if ( rc )
@@ -295,6 +296,7 @@ int do_altp2m_op(
         break;
     }
 
+#ifdef CONFIG_X86
     case HVMOP_altp2m_vcpu_enable_notify:
     {
         struct vcpu *v;
-- 
2.34.1


