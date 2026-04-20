Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCAiLLqb5mnCygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B61434296
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287859.1568303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwFL-0006Cb-Ei; Mon, 20 Apr 2026 21:33:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287859.1568303; Mon, 20 Apr 2026 21:33:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwFK-00062Z-Az; Mon, 20 Apr 2026 21:33:34 +0000
Received: by outflank-mailman (input) for mailman id 1287859;
 Mon, 20 Apr 2026 21:33:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEwFF-0005AN-Ly
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:33:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEwFF-00EgCp-0y
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:33:29 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b92-e002-0a2a0a5209dd-0a2a45038228-12
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:29 +0200
Received: from [52.101.201.110]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69ba7-672d-0a2a45030019-3465c96e606a-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:28 +0200
Received: from BY3PR10CA0001.namprd10.prod.outlook.com (2603:10b6:a03:255::6)
 by LV2PR08MB10982.namprd08.prod.outlook.com (2603:10b6:408:34c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:33:22 +0000
Received: from SJ5PEPF000001CF.namprd05.prod.outlook.com
 (2603:10b6:a03:255:cafe::c7) by BY3PR10CA0001.outlook.office365.com
 (2603:10b6:a03:255::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:22 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 SJ5PEPF000001CF.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:33:22 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzzHj3j1Hz1wdS; 
 Mon, 20 Apr 2026 14:33:21 -0700 (PDT)
Received: from SN1PR07CU001.outbound.protection.outlook.com
 (mail-sn1pr07cu00107.outbound.protection.outlook.com [40.93.14.103])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:33:21 -0700 (PDT)
Received: from BY1P220CA0026.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::17)
 by BN8PR08MB6290.namprd08.prod.outlook.com (2603:10b6:408:d6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Mon, 20 Apr
 2026 21:33:18 +0000
Received: from SJ1PEPF000026C9.namprd04.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::b0) by BY1P220CA0026.outlook.office365.com
 (2603:10b6:a03:5c3::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:18 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 SJ1PEPF000026C9.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:33:17 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:33:13 +0200
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
 b=fW5rgLRalDXniPNbEihUK4JOh5AWQthuEfqMxSR+HAp4ijP6sZyGW2OjWKIYMdVXIaZ590RxWflqyTQ8jaNKWopH/Lez1KDSk4QtLQhKVnZXx7ie9b6nyb1bIHm191H3v+dxK3GArjQRatsWpvZVI2sZHL44xWggd9F/2z/SlFDh6Fn0IUXvWqdeFfl7ZltKVRDb+9Wc0pfKGPbQ220oF1ZklSBNenb2uXrwI/Clhc0svLVuK00OBU4KdQFR3tR5L/8K1pYahwG8n3qz9Y6MeZsbPPgHkrV7sw67ayR1hMT7fD8JpdGaz2PzqICZulw0V8lnAimNhsiU0/25BYRVng==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+lzv+re9KLW9t3mTXnO2Av9Vu/LGRGNe05U4kI1kS4=;
 b=oX9XN1ezG9ZrmRxAEbp8Wv9sLawvJawHrUZhHeGy2b3UKh36mFIBbGVMd37fXtKre2B4JsIbhDXdFemDgMfAIeOdZk/6oQnhSVIzABylebNTg333gu+Z0qkolDAq9SqcXfDk0tTXNY6WjfGvxs5Jv7wKs5R7iTpf9hYqCS5x1GbZZ1gXeK513VXU6JK/vrqhNwpYdY/Z0GhqzYaxvhRWtvEIMeYm9Pz7JoPMV6QRH3IqjSiFgr94tsgJ1kl/j1GS6Xlqy62IrAbeCsNkQuB68bddkpYqWqP/ZeM5t5m2GzMDws0v1eGHREiBv7icEHVf4GUfH7vKW7zRfykiWbAVhw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.14.103) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+lzv+re9KLW9t3mTXnO2Av9Vu/LGRGNe05U4kI1kS4=;
 b=i7wJwiTasTdQ3xK977NNQ1qNksIN540kd9nhBODppVL1Un/OsIuxorf0ZKOCtCuWFL+srud1v5LEs9KSVlW1Bzxv19tS9q3wcis59SqrtwDYzilgxNqNy+gmuU8PsNJPMGmeqTj4iBd+ZDsrvtTu3A/mWG1QEKZm6M/eK2UHomQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.14.103)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.14.103 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.14.103; helo=SN1PR07CU001.outbound.protection.outlook.com;
 pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oCWcyenad4h9ix7aAbJT5eBdWqviFeYRmMnsIKg0HuvGrAXdcdx330dNd5xRw6tZ7gnr4D73mYzdJIQFqpqHU0OjJ2nHBSJfUkDD9LdkKVomym2bBZaKkAAhZVKcLqofZKhzZ/8pHJ8W2c9YLTYiq34w25EvEEqolI2otuG8iKuI6U483r3BP9ViD2jIj7OPzf1LFBc8AHfcmZIr/7MuKqoUPUt81L72NX4Z2M7huTo3M9XsX4SmthCP2VBE5ThVfLqiKsRlRwnsQv+KYz9bqSlhrLGjaQ16wRX7xTfHD/5++baohYlo18/0ABfYY3akEcxTCF/ZFMTKL1XF0Y92Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+lzv+re9KLW9t3mTXnO2Av9Vu/LGRGNe05U4kI1kS4=;
 b=Gbd83PjGQD/z0PAcJ2qrO/+trBMhY5fgRcrqrOQfGY7iCAb+04mVEwgmiljbk2qsvRbktXzpwW4mi8n/OHi5W3v0mMPEQ/zGU2HFjJ55cP/b7hMlxZWI9qb6I6UfttE8322kaB3Oq8nL7uNIXVrkAB6Ba1TNGb05ZyfMytqBaVUgx6v2qzuj1cb0UHo3VhBkX56pSClxLJqi9zAoC3mUrFP4n/IB9CS9Lhw4rTHvD5Qgs1vmhLoUUx+9FXFZYTb/VqhnD6gQsK7ydj7y8H9vxYrDdHU6BJr7iR+V1S2jUuucR7Q+6Xx6DIn9i1EynXA1DDpCFVDiRkiI9O9OSspidg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+lzv+re9KLW9t3mTXnO2Av9Vu/LGRGNe05U4kI1kS4=;
 b=i7wJwiTasTdQ3xK977NNQ1qNksIN540kd9nhBODppVL1Un/OsIuxorf0ZKOCtCuWFL+srud1v5LEs9KSVlW1Bzxv19tS9q3wcis59SqrtwDYzilgxNqNy+gmuU8PsNJPMGmeqTj4iBd+ZDsrvtTu3A/mWG1QEKZm6M/eK2UHomQ=
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
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH v6 30/43] arm/altp2m: Add altp2m view validity/visibility indicator
Date: Mon, 20 Apr 2026 17:31:53 -0400
Message-ID: <20260420213206.208750-31-Rose.Spangler@elektrobit.com>
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
	SJ1PEPF000026C9:EE_|BN8PR08MB6290:EE_|SJ5PEPF000001CF:EE_|LV2PR08MB10982:EE_
X-MS-Office365-Filtering-Correlation-Id: 36464852-9bae-492f-0b58-08de9f24728f
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?qxYMTUrccBdq6ifl8vi8mmtK0pJNmJm/HpU72VeVl6zC6ypzMWpuOm3oFmRU?=
 =?us-ascii?Q?PT08KHlnZI3+YAzHyzlc/fD/pCTa/AIqynYb1oh12BS8bPS8g6NUe0QXwsG8?=
 =?us-ascii?Q?waDSH1apq2tp4FrgxXmtO1W90XUQmCwPFVUomqh1imoD3eIrq/NeL9KpsOs7?=
 =?us-ascii?Q?X1xJpcgiqBKa5+K7D1HvINs+2am1u1LhiuKFYjVdKytkoeR3zqqlJt8EV628?=
 =?us-ascii?Q?MxEwqL78gCQZwzqPHk2E0D+jSMWEAN19+zz/NT3TCAJfls1eO7HVfdZcGBXH?=
 =?us-ascii?Q?S4pqqX8P7WLadc2hi+TwEpTe2PLPeqjo1y6FlKKdb+/U+pzMf2PsaGDx07MA?=
 =?us-ascii?Q?hfI4AOcLH/7u8PMq6nTSlneCA0OYPQSUELvzxuRMqxvPJX6iK3DFeX5HX0fN?=
 =?us-ascii?Q?Qmy0+uX6oG5vtrF+iuindG+DCMiBSUnpINrxyevITFW4iksRnDn6KA/4RkU/?=
 =?us-ascii?Q?l4QZW8+T43mZRiI5nS+1a7WfbwhfrbXDVIWVRFSTZnjHXTDbWSy/7XFDt77R?=
 =?us-ascii?Q?+ccv5E5P85rSudkmkgULmEoHJfPbxgZi64IQxW9Y+SNSwpgrHkKLRafMM8n2?=
 =?us-ascii?Q?4I+j+jU+trBGntBWY9aq0axENDLUlWHStfoGfkF3QxOROXYaZGN+FihZ+jhP?=
 =?us-ascii?Q?4MIs56mPryo/U8fMExRBwKMJIfBi30TTjz4CwgTgykKqyZDNMvZqfISCjHTz?=
 =?us-ascii?Q?erbikyN74o7SPZNSV0A+xOty+heTcMtw57Rf6JAnRj8YK8A3Oax6z/B2kQvg?=
 =?us-ascii?Q?cVi+0IshTCmJKCeNUbU+wY/2G10fZhT4+QGhGpVrB4PYNeH1cQhQJidk3y1H?=
 =?us-ascii?Q?CR5ga6gzLXQN+h9vyEZjeuPJpNBj/MmvBZ0LYzf95mOveQYOjIArz0VXl8Qc?=
 =?us-ascii?Q?6aJOXpmXPtl1rQT+7te7gGWrgZip3s2pTLQprft9GfEK9smbdzfC/wiopB4m?=
 =?us-ascii?Q?a91rl45gABTV3nk8+NA7eFaNSDd2Cy/dI5ROPCeFxmqOxADR2Vr/ZASfXan2?=
 =?us-ascii?Q?5R/RfIzbcfL/LpZPRIWE3LoWBtah4NuxPg3K6bcyXTuY71tyKW0pJS54NZmq?=
 =?us-ascii?Q?7PrfYI5iBF3uMSuspPyyG8V6WfMzIgP6YWRcdEKoI5GOTTbwqNmca3RW/Lr6?=
 =?us-ascii?Q?fHu9ETurbYBjNknPvNTfXrl7etW2eHPE8h1CQY6LkhXEDqWOhsI4WxeO3kmu?=
 =?us-ascii?Q?AylfuWd44yljIOc5?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 p3PiiLqLvpe/1tfa3szwMu4ZT9oKQwa5i6QYBhH0Np4lXDWhEreT/AY+Ich5CGWD6nfrW7+1V1yhe1JdTmnWQtHOnqbTXM9wvmcm9jceLumNYlxDRVvOM9yYRFMza4QqzhO4hhKw03DdH8b5FClEugmEyJv5U52ea0dOOAu9stgeg5mQybYxVUp/N65WQ9gVMOeg1mdbwnYCwm0mrV4arWemSRK8QxD0loT3+gae8UCLmL9AaZUNip24/32KADWFLrzMX1DUfuEQ5lZValPzD6xSBxIA7j1TeKdXMOWsc0ZmWgFlkaasO2sYwTJKpc6ydeddOTNLCrRpx8PCVj8T5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR08MB6290
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.14.103];domain=SN1PR07CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.14.103];domain=SN1PR07CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 SJ5PEPF000001CF.namprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e02d9890-b95e-4369-3916-08de9f247021
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|156008|376014|82310400026|1800799024|14060799003|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?C0R6pwBX45q/Z5yEPxINh7c60oxXXkfnheXMPywxBWNnesG8bSQxPA3hfcW0?=
 =?us-ascii?Q?N261xRMvx3sEajESONKDU1XaRPN71xw+/XcQ85lTgxNsqKLalm2cZS5Op+Gr?=
 =?us-ascii?Q?GSd7OsDeBeqXOJJz2PKeGFn8Q6yUCqust8F5Nl6QR7MuvWzyvLmybs/xSJxo?=
 =?us-ascii?Q?MaFh180Yyf0Yvo4CHupsILZshnRPjj8jXNEoWYE3d4pu+kLkyceJTI8+tlMl?=
 =?us-ascii?Q?9pKcBEXRwnmKvo0k3hA1URAJtTH6FB/JB85To9JqRDNz9xa9iXsbsjCVHLff?=
 =?us-ascii?Q?c8RfiKqe/OPB9G6cJ46MLoco3L8BHOHavQWqY8whHHoB6WAi7kOnQyAVPDg1?=
 =?us-ascii?Q?J4vXA3aP3oBkQ+ctMuyWtL456E5EhyIKhPqIHtEbEr/EPLMoOcAaoqiXJsbP?=
 =?us-ascii?Q?z9ELEd4z/40/7BXENacK6czUUrPsaj8mx5nA69Nd3hbZ4X6H3j86Hg2jyshf?=
 =?us-ascii?Q?7mUASE5KvIWAFy0KsYbKVVHqlLwALropWv21UJTYo0ArFEYF3EJgeqOBwwhK?=
 =?us-ascii?Q?wKxVzad1RZLV4NGQaUaVokuSOo8tC/seSGzKg9G4p+Hst7K1JLRc3L11998z?=
 =?us-ascii?Q?g/dSUYu1GSJLZ9jslALsML+WG+GkQCw4bcpG1NBzlAB1YVBMNS5cvt8dA5Oj?=
 =?us-ascii?Q?VCGJr5cb6SHB+cxa8dxFP2b++K3P9oUKjFbQIyZovliWBJGarIKjzOrYS8B5?=
 =?us-ascii?Q?yEngK1N8/EiR0Ya1zxleIfgotahjArcSKon5/FkO5TDDbvMLIBmsSVbL/Mp+?=
 =?us-ascii?Q?qk5JVDA29WE8FCSNffHQoQxnPVM/OFo/f8z76iTXmONhRNQVCKqi7CkKBd9K?=
 =?us-ascii?Q?lG50Zqu7sPXq1Ie+LFgSwzr0iY0L4sWsoYRoMkmCH7swX8SNcp2AIQAx0xE6?=
 =?us-ascii?Q?iTfQNT+hGJ/LIBBZgnQH3NsLExEF5/6kBkFjBvTTQwTE/3MhSZsMhp59XNNX?=
 =?us-ascii?Q?Dw4Nrrq16Nv/qNe8SMdkLoEmvkndMSfZiqLKiQEKP+fNEPNaGMil95Hlv0K9?=
 =?us-ascii?Q?jbMSRaSBP9Wz6wWTX6637eJBuZxchTpUADSq+sx9I3C6hH/f4kdy3s5Ld0cK?=
 =?us-ascii?Q?oH+dgwA3UQdmClrlT0Kn09rM1IKEkipppKRjD3OdzzsMOwXetMeU19ibKUKW?=
 =?us-ascii?Q?TI35vxrbzgVyL79PEqw3GorC0N9NnfFcSaVEiWoJoH6zuqRQ0QvvHov5kaSc?=
 =?us-ascii?Q?o0OKiN/WxhvLgm32?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN1PR07CU001.outbound.protection.outlook.com;PTR:mail-sn1pr07cu00107.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(35042699022)(156008)(376014)(82310400026)(1800799024)(14060799003)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	85Hp4dXszp5nQQK7ICLbcOKUzA6ZnOWHvI0AaqKQiukGoyt0M462px05vjr+frD69c7FsbHJ9NRN6Q/DNhkuFNdpJuQ7myu0anbMZjOQh4iPj8MpUbkbTwJsPxYdt/eJ9q6PzA77WG8sI1zWPwsk6CAJSjP5b59j5mPyS/T9z7IZ7p6RKa81sxlTR6kiVZ1BAAYarI029gnP+wHuzqPFlVSCP5Tq1o9WiW1YxhKIpkPVwmF3r+malwzDRPI1kl2n0rVj1V7VifU/WzmQM4I7zJngrt7gSXDCMKgDqPGZttF+FTraZTwG3UUHmJyz9rgcOlcf9fSDbdBIMAOTu6Aq9GrqZUL6F7U66FBfSsMLDXzxnZeCXllDX2s4qIFXT+BzUXH2Es1e/oEPJvXZYRRsxcixlGF+rxkCyPwQ5il2PukQiku6Igz88thk4kxygLVI
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:33:22.0113
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36464852-9bae-492f-0b58-08de9f24728f
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001CF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR08MB10982
X-purgate-ID: tlsNG-33051d/1776720808-A197D938-0C4ABDD8/0/0
X-purgate-type: clean
X-purgate-size: 5462
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.274];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: B5B61434296
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This commit adds the altp2m_view_state enum, which indicates whether an
altp2m view is invalid, visible, or invisible. The altp2m_state array is
comprised of altp2m_view_state values, where each entry corresponds to the
altp2m view with the same entry. This is analogous to the altp2m_eptp and
altp2m_visible_eptp arrays on x86.

This addition is necessary to tell whether an altp2m is valid, in addition
to whether it is visible. Since all altp2m views are allocated up-front
during p2m initialization, there must be an additional mechanism to
determine whether an altp2m view is valid. Since the implementation of
HVMOP_altp2m_set_visibility also needs an additional mechanism to determine
whether a view is visible, it makes sense to combine altp2m view validity
and visibility into a single mechanism. Therefore, the altp2m_state array
is used to track both view validitity and visibility.

This is commit 1/5 of the altp2m view validity/visibility phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.

    In the v4/v5 patch series, view validity was determined by simply
    checking if the altp2m p2m_domain pointer is NULL. This isn't possible
    in the v6 patch series, since altp2m views are allocated up-front
    during altp2m_init.

    Since the altp2m_view_state enum definition has to be available in
    asm/domain.h, this commit removes the sched.h dependency from altp2m.h.
    Unfortunately, this means that it's not possible to have static inline
    functions in altp2m.h which need a complete definition of arch_domain
    and arch_vcpu. If there would be a better place to put the
    altp2m_view_state definition, feedback would be appreciated.
---
 xen/arch/arm/altp2m.c             | 13 +++++++++++++
 xen/arch/arm/include/asm/altp2m.h | 23 +++++++++++++----------
 xen/arch/arm/include/asm/domain.h |  4 ++++
 xen/arch/arm/mmu/p2m.c            | 14 +++++++++++++-
 4 files changed, 43 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/altp2m.c b/xen/arch/arm/altp2m.c
index 339f82835caf..e741648ff5a1 100644
--- a/xen/arch/arm/altp2m.c
+++ b/xen/arch/arm/altp2m.c
@@ -5,6 +5,8 @@
  * Copyright (c) 2016 Sergej Proskurin <proskurin@sec.in.tum.de>
  */
 
+#include <xen/sched.h>
+
 #include <asm/p2m.h>
 
 /* Check to see if vcpu should be switched to a different p2m. */
@@ -14,6 +16,17 @@ void altp2m_check(struct vcpu *v, uint16_t idx)
     BUG();
 }
 
+/* Alternate p2m VCPU */
+uint16_t altp2m_vcpu_idx(const struct vcpu *v)
+{
+    return v->arch.ap2m_idx;
+}
+
+void altp2m_set_vcpu_idx(struct vcpu *v, unsigned int idx)
+{
+    v->arch.ap2m_idx = idx;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/altp2m.h b/xen/arch/arm/include/asm/altp2m.h
index f001e022a213..05beb7f698a7 100644
--- a/xen/arch/arm/include/asm/altp2m.h
+++ b/xen/arch/arm/include/asm/altp2m.h
@@ -9,7 +9,10 @@
 #ifndef __ASM_ARM_ALTP2M_H
 #define __ASM_ARM_ALTP2M_H
 
-#include <xen/sched.h>
+#include <xen/mem_access.h>
+
+struct domain;
+struct vcpu;
 
 #ifdef CONFIG_ALTP2M
 
@@ -24,15 +27,15 @@ static inline bool altp2m_supported(void)
 #define altp2m_unlock(d)    spin_unlock(&(d)->arch.altp2m_lock)
 
 /* Alternate p2m VCPU */
-static inline uint16_t altp2m_vcpu_idx(const struct vcpu *v)
-{
-    return v->arch.ap2m_idx;
-}
-
-static inline void altp2m_set_vcpu_idx(struct vcpu *v, unsigned int idx)
-{
-    v->arch.ap2m_idx = idx;
-}
+uint16_t altp2m_vcpu_idx(const struct vcpu *v);
+void altp2m_set_vcpu_idx(struct vcpu *v, unsigned int idx);
+
+/* The current state of an altp2m view */
+enum altp2m_view_state {
+    ALTP2M_INVALID,
+    ALTP2M_VISIBLE,
+    ALTP2M_INVISIBLE,
+};
 
 #else /* CONFIG_ALTP2M */
 
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index 4d497a21b648..28533b08db1f 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -3,6 +3,7 @@
 
 #include <xen/cache.h>
 #include <xen/timer.h>
+#include <asm/altp2m.h>
 #include <asm/page.h>
 #include <asm/p2m.h>
 #include <asm/suspend.h>
@@ -135,6 +136,9 @@ struct arch_domain
      * concurrently.
      */
     spinlock_t altp2m_lock;
+
+    /* Validity/visibility of altp2m views */
+    enum altp2m_view_state *altp2m_state;
 #endif
 }  __cacheline_aligned;
 
diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index 04d17e787259..7c23995f8074 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -1494,6 +1494,8 @@ int p2m_teardown(struct domain *d)
 
     d->altp2m_active = false;
 
+    FREE_XENHEAP_PAGE(d->arch.altp2m_state);
+
     for ( i = 0; i < d->nr_altp2m; i++ )
     {
         rc = p2m_teardown_one(d->altp2m_p2m[i]);
@@ -1617,7 +1619,7 @@ struct p2m_domain *p2m_init_one(struct domain *d)
 static int p2m_init_altp2m(struct domain *d)
 {
 #ifdef CONFIG_ALTP2M
-    int rc;
+    int rc, i;
 
     rc = altp2m_init(d);
     if ( rc )
@@ -1626,6 +1628,16 @@ static int p2m_init_altp2m(struct domain *d)
         return rc;
     }
 
+    if ( (d->arch.altp2m_state = alloc_xenheap_page()) == NULL )
+    {
+        return -ENOMEM;
+    }
+
+    for ( i = 0; i < d->nr_altp2m; i++ )
+    {
+        d->arch.altp2m_state[i] = ALTP2M_INVALID;
+    }
+
     d->altp2m_active = false;
 #endif
 
-- 
2.34.1


