Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJbPNaSb5ml8ywEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E82434234
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287787.1568208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwEz-0001mL-BJ; Mon, 20 Apr 2026 21:33:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287787.1568208; Mon, 20 Apr 2026 21:33:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwEz-0001iv-4v; Mon, 20 Apr 2026 21:33:13 +0000
Received: by outflank-mailman (input) for mailman id 1287787;
 Mon, 20 Apr 2026 21:33:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEwEx-0001ae-7x
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:33:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEwEw-00CD6F-L0
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:33:10 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b96-2eae-0a2a0a5409dd-0a2a4501cbc2-0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:10 +0200
Received: from [40.93.201.139]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b94-c1f2-0a2a45010019-285dc98b06b9-4
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:10 +0200
Received: from SJ0PR05CA0155.namprd05.prod.outlook.com (2603:10b6:a03:339::10)
 by DM3PR08MB9588.namprd08.prod.outlook.com (2603:10b6:0:41::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:33:01 +0000
Received: from SJ1PEPF00001CE0.namprd05.prod.outlook.com
 (2603:10b6:a03:339:cafe::2f) by SJ0PR05CA0155.outlook.office365.com
 (2603:10b6:a03:339::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:01 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 SJ1PEPF00001CE0.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:33:01 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzzHJ6jZPz1wdM; 
 Mon, 20 Apr 2026 14:33:00 -0700 (PDT)
Received: from CH4PR07CU001.outbound.protection.outlook.com
 (mail-ch4pr07cu00107.outbound.protection.outlook.com [40.93.20.103])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:33:00 -0700 (PDT)
Received: from BY1P220CA0039.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59e::7)
 by DM4PR08MB8193.namprd08.prod.outlook.com (2603:10b6:8:44::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9818.33; Mon, 20 Apr 2026 21:32:53 +0000
Received: from SJ1PEPF000026C8.namprd04.prod.outlook.com
 (2603:10b6:a03:59e:cafe::cd) by BY1P220CA0039.outlook.office365.com
 (2603:10b6:a03:59e::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:32:52 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 SJ1PEPF000026C8.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:32:52 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:32:46 +0200
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
 b=PpRXqFT0PWiDZdzF3n3tJGSHvgM2sNeKXJqnHbiwmiI97RZEZ5utXB+24AyFyp9O6gzDIsqMbBknYUHG48GwgJbH1RLNSdHcBoYPqBSzIZFx/NkuY+muT/611mJZsmalfvuMdWolo4rOYrTm1WXI13Snp2JglEY1QqY/nmFdJZHI/Nb86k10+Jg2EXicS7q42EQw8G94SlO1dWYtNc9ezrzgnTkm8Zh0O5Qoour/aVsneY1KsK1auSDkBB98uOoA0Te8VyNHJbQda3ON4IjiDn/stxCw5/LUDDy3etn6LRuQ6QtMSCVvxE/6fhPy8KbQjRLIjtoGS+CjnIpuC2wiqg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ct7OYHDuserQjrdnXDT2Q3J5e72VZGG2o8HBBgpiIsc=;
 b=DjDwBAX6qYyb7ZFI5SOBuj9C/6tm43CgzniR+lUZJxJQ0omMzdLnWCeFuyeIQuBe7NqJpCfOZ5dIepfpwOOYkyr+e92lROgqhz1BnuGZKesZ9HYjtPbXjNRhguh4Idf3flBv70rDCig3F9tNNlcHeyCb533Yec3ZP3exRKKBa+HM9SxremGzTRLa8gusBV2FHRaCwkNtvFs9qYzRqm978CGCd/W8a98u/NIAhDKrI8n88eR8awFgtgawq9VTBIBsmVI/iRwRM8FP9Kum0lewlic8u3Yi3nvyzy8cNv36/zmNkK6h5dZAuMtwidLakTMqO2fLEAQ4lmTH0EaB3IV4MA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.20.103) smtp.rcpttodomain=citrix.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ct7OYHDuserQjrdnXDT2Q3J5e72VZGG2o8HBBgpiIsc=;
 b=yup9cAILf0EpH+wtp1z5sA7aIKNNcykenfh2egbPAUzo60O53UcUxcxfZJ+JOm60VD7YxEZC9FSvKCYIcdBX7jOeQU33EtenmVB7t99gaxIwq0HGAf+r/pVqZlcBXxYlZ6EqS/9jmaUG0yyxernG8Uyg17ZJfp/CNAF0x/hI37U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.20.103)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.20.103 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.20.103; helo=CH4PR07CU001.outbound.protection.outlook.com;
 pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ao0kGYvOXIJejNDVU1prdCUB3I5/aItO563BqCOQ/8SiypJoEMDCvqLvpGMkEF5vXZsdxLcgzESlnOj7uuyt0WBL/9UWjsukJr7wGrhSBqRisO35V2flMm+0Rg4Is7luF5grYutjTlIXzxcenNsHEUJASIf/EsvqrlhIpW3uXVMo/Ik05v9z8MBwegzZ8hnNbBT+411MRojkL5O0fWyiuCw+okZ4POzkcHO73PhX5oSPHss8fUIvkG+HgJCb9HqjsepgHGEBDM83OOge4sQGU3jyHJe+9kPK8/S8I4xDUsmNFxLVSHwVPipVihG3yRHGTgQCmZ2LvSDPyKOQi0+/Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ct7OYHDuserQjrdnXDT2Q3J5e72VZGG2o8HBBgpiIsc=;
 b=ZCrnSsdcOxFcJrJ8FEwtHtjjvRUagKLCj4aYqESIolT7oktvveoYIAzP/CGzCZIwyjrTcnXqlCdAlqqoQ2ojqcp6F6xZPC+1O2qwbGrf5pA+/K7ohdwbKMWv0zeMVrYVtCkfL5Sag7sqsZq8NaWz5vHpwGg8d3HjKkuhvdSjNP2kRTJkyUC2dCjo/bdOa/LAzTv/niTqjThZF7XkVRUBXlwpWypZ58MWsKr20vGZVyIWVvRmKOO2lf48cEKTWLWlyJaes4dT3CxMf2a44abGKhQJwuaC4BRISYpa4We7tM5wz31OcIzetRHkuNEc9ssAJOYjVkbQWhjzAxEhtFrfkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ct7OYHDuserQjrdnXDT2Q3J5e72VZGG2o8HBBgpiIsc=;
 b=yup9cAILf0EpH+wtp1z5sA7aIKNNcykenfh2egbPAUzo60O53UcUxcxfZJ+JOm60VD7YxEZC9FSvKCYIcdBX7jOeQU33EtenmVB7t99gaxIwq0HGAf+r/pVqZlcBXxYlZ6EqS/9jmaUG0yyxernG8Uyg17ZJfp/CNAF0x/hI37U=
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
	<teddy.astie@vates.tech>
Subject: [RFC PATCH v6 13/43] x86/altp2m: Add lock functions accessible from common code
Date: Mon, 20 Apr 2026 17:31:36 -0400
Message-ID: <20260420213206.208750-14-Rose.Spangler@elektrobit.com>
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
	SJ1PEPF000026C8:EE_|DM4PR08MB8193:EE_|SJ1PEPF00001CE0:EE_|DM3PR08MB9588:EE_
X-MS-Office365-Filtering-Correlation-Id: ab5465d7-e51c-437d-14c8-08de9f246640
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|704162011799003|36860700016|1800799024|376014|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?CbHWsaeuMjFyn7TYzylfMC0nfq4sYifiC44WqsOF1tTkic+bICpe6P9toXMr?=
 =?us-ascii?Q?UFxSjmk0zo02wozZl7J4wmoutxcdUYpfNe2bNhdTjg6eZmurSNRIbJCG4rC4?=
 =?us-ascii?Q?Wb78J3xrVU5l8cTP4IbBV5AiCsgEozVq/B4pVJalTvRGlJsJFdTQVqffPO5V?=
 =?us-ascii?Q?GSA7eofEUtOXsyZ5xF5Fh+o9CNzXvpRV2l9C5lBqbP4xeTu+W4krCVyHw1IU?=
 =?us-ascii?Q?beH6QitvaQpVZ0Tal/qQQud7aj+lISiIp8tT6JNJA6mrjcnaP5DDfS5S0wmH?=
 =?us-ascii?Q?o4TQzf/g7QtTUE/LxbvRJuc9rVXia/owBEe+xRyCve0vkSCap6rZrCJHGPA5?=
 =?us-ascii?Q?N5LRvr7KXujlcIRQvpM9sKrX0+VAyFqA8/0jqFFJV+DV1lMv81bU4xrurDvW?=
 =?us-ascii?Q?VNmhrmCRHJPMeA7Qen3QS1thl715OzLnFjGHO+8ifmNTXoLmmdwsKLQm0vL2?=
 =?us-ascii?Q?jJqRb8HlZLyiIi5ykJHCZaLXGzHrsc1cT73jyW9NAnWUdiJbxWkw2URnu4rQ?=
 =?us-ascii?Q?FCYAkXFh5u6FGQebXlGs4/Wt3/9y7FTC6iGPg5aCZ2/5lf0Vuqs1XPTNXVEg?=
 =?us-ascii?Q?veeS4klYDpFgl8vcz9jU/iKOizuu1Wd6qRO3Q9d+nehQ7jSjAZC2rnqWXYJu?=
 =?us-ascii?Q?UO3R+St5mz+vXYfOW1KexaeKyPJBmInOHbZZSgg2V120yrXyPrTj/6vN71Hp?=
 =?us-ascii?Q?jC4fHNYYlnrESkBbqtIEW0SJpC1vAmF7eGEhPcdpsyo7YT6wNH+sb/J5LWnb?=
 =?us-ascii?Q?1p7XaApZbvMoOAu8b4crydkKwaig+qFy07tOt2eJKP9krZIfF7F12h2C/CQw?=
 =?us-ascii?Q?ZEn/QifzJT+K+h1UjFD2QBYrelqkqMWeRtltr+8qZYRljBzqbGVsCvjOxrC+?=
 =?us-ascii?Q?cZthntl5As8v5MLEq/UolHvMD1KLS2IGYvW3STig8iqyvT84KrAdgfMFmCwA?=
 =?us-ascii?Q?qHH1zfJDeIw4ZfsUJSrY7JxXUYrQH9xsWRs4P6CNixtnLUwCM4sX9YALJ2X5?=
 =?us-ascii?Q?z7wBtXeMashJA7nX6NgdHgfS8uSOY113gWXMM7UZ2Dp+R6LXI3kwLehBsVgW?=
 =?us-ascii?Q?wPXExJNaQoM+vB22+B0ejrgNxAy+Wq+MdPsbJsqI1JdLgkGtbJXCtogxyLwG?=
 =?us-ascii?Q?uCax9+HfAgsJGzoCTEXCBIKEHAs0QuJo+w=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(704162011799003)(36860700016)(1800799024)(376014)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 ehTvV/AKzwi6ZAZvy4LHynaagPHX4EXFbb8XA8NHSd0OOk2gEl++reI/41RUC6LT+8RN1z6T6GDyZpWSVsx3Y4M3Ur1HuFUA8y/UWqvTBaAra8mYgb8+N3uDjVXJnl09cABW756WUPzjeMBpDavil5Uz9qLXtB0qXLXPMy77bCM8coFAsjAzimmtUT63NzSzwT7ARxdqM+KhtqsrxLruzrmZIk/oVExfyMZaV+NB40jroVZOKyfYoF2qqFmFtUe2Duv93hty+50Uqaa1uuqPKSqhqVHO4Ufjgj67Qj7tPT0KmJpRvrPsasLYWjpV2WZP9Er263UiTvLsI3LgGGWBeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR08MB8193
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.20.103];domain=CH4PR07CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.20.103];domain=CH4PR07CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 SJ1PEPF00001CE0.namprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a087eb88-432b-494a-ea89-08de9f246114
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|704162011799003|36860700016|14060799003|82310400026|376014|35042699022|156008|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Y7L5L1uEN7da83eylS4hP+hz2iyE9JQUD5zm5OJnz2DfMJUoDQYCu4gl8eAW?=
 =?us-ascii?Q?/MS9MIZplo1dt7Hxj0TWc0rfQL0FT2gaVqB6BDMcsnuOUN7/RmzFVcDXfUOS?=
 =?us-ascii?Q?ziDBrclDQgjakHMltSaSGC0zJqp9Pj2uaWG16Lu4VnDW8Bk8GC5XsAj1yvB5?=
 =?us-ascii?Q?b7ziVRNoj0VGpIDIb7B/BTq3Rs0N8znc2kfSp/zU/ybr11vKAyM7Ee2v6LOl?=
 =?us-ascii?Q?ivj96V/Ik5e03PVklYVOE+yW9f6XVs+bXY0U7H9fU/8VMc5RTc36jK1L1Rj5?=
 =?us-ascii?Q?nssKPFDltw01g5SiQmx3Qrnl8T9afwqAsYZNc/KUIXRj86gvtb/lxDcRSwZw?=
 =?us-ascii?Q?sHbXunOnCHXagfaJkn6xTOu3KoJavP7HnpP5/m4IqgRcJ8+Qfp//iAaCmCqk?=
 =?us-ascii?Q?E+zAWlu22s3JAVArJIxlKtcZ0ztjyerOJj9kBoHAGyXnFl4RPhrdHQ+3cvJE?=
 =?us-ascii?Q?VP0XZU96k3tuwtAM1PWdhiTmvl2ovWmyiqyhjaPmbtxZ/egwQE2QuB3atuRW?=
 =?us-ascii?Q?0r7VwhyLrc8LptcgJS30PyXH/uCVFTwQp11lmRBRrhAYpKEIAR2NGNUtd1hg?=
 =?us-ascii?Q?QN21LNH5aLgjYkzZXaSas+/0zSwtHNKWBgZicd5fLAWoKTfuKBnhJo0GpwiB?=
 =?us-ascii?Q?b8W0yv/cq1joMyWp92VIvv6z9UhJLkbyF8MQk9uT4WJhicydCo+meNlFtzgO?=
 =?us-ascii?Q?ZkULfOGljRM4khKzmChreFIAMmVCLvqerNxHQdErVAjOebl0edWDwbdinv7H?=
 =?us-ascii?Q?ROzOFbfJRBVq4+CFRod2pUuCm4Q1DtTnRc6X/6Zz5vO84XZZ3RCQtT5pCiVt?=
 =?us-ascii?Q?d7KEePGCCkLiy2cdMQvzttAi8cmRTv3n1jHhAjI8yYIMVnQ9QOjiLB4bC5Vy?=
 =?us-ascii?Q?xCBVW3YajX7RBHs0C7NrSu+iZqeTWl9bppNZFIuJUEYyZH+XXQGtZcHUW0QI?=
 =?us-ascii?Q?W6KZ/4UTOQ/auIC6Y235z2VvjcqU0nhuSrbUC+jQW//x1/xBW04PBD/Qw8iY?=
 =?us-ascii?Q?ynOSq584ihc73gDsDWTS/EqFNRVT4Co94e50RAYh8hvzeBznJbdM37lPo+5G?=
 =?us-ascii?Q?rwF79bjCp8A3O7ccGGSr/OIYW6N2fQsf+zZMuMkvoJ4aUqqak5GWrV0wVzG+?=
 =?us-ascii?Q?gMJFItdccfYD55OaU+zcsiXSj9CGrPUNog=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH4PR07CU001.outbound.protection.outlook.com;PTR:mail-ch4pr07cu00107.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(704162011799003)(36860700016)(14060799003)(82310400026)(376014)(35042699022)(156008)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Jx5Ffm19SI+vyxU1BNRtqCnpOeoKQcy9sD9oLma7K7LBYo+TzAO/Sk65rryYAkHfUJjpmpDI6VzkFjGk8HDsla9WdLtBXC15qKhtz3tMZ5KZub1JyuKKQSh++JWpReLR+4nsk8qG8I/UtDg/b+T7g0OhzCnV1bEe0fKNwDi76JUNUQYcjHMG2zFsweetYZ3R35CEwDEVdC6F9reJxRANGySq3RvLXvqyiWEkWTxGewTjV+TNU12qOrSjov5waWNZe/KJgewBPlzrkVuUgyhKzdYRKulWr0GibmQfoV9D/H6QpcAUz0t4S1y2RG2Wo3cFeTmzt1iPM/3lJZb9GD2Ppkd5ZfXXSjqJwBmjhBwvLVGqKeHn0myWy7R12GI7Wf098MPJ1oX2ZzQlkinkZG+bHQTJHDCiknf1uR6An2rlBDC8OXdxhHXZSkMLZJerU3q4
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:33:01.3929
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab5465d7-e51c-437d-14c8-08de9f246640
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00001CE0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR08MB9588
X-purgate-ID: tlsNG-d62444/1776720790-BEC7CFF4-766920CD/0/0
X-purgate-type: clean
X-purgate-size: 6429
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[elektrobit.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[elektrobit.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWELVE(0.00)[17];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[elektrobit.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.232];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 63E82434234
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This commit adds three altp2m_lock functions which wrap the corresponding
altp2m_list_lock functions present in "mm-locks.h". The "mm-locks.h" file
is only accessible in x86 code. In order to make altp2m common across
architectures, it must be possible to acquire the altp2m lock without
including an x86-specific header file.

These functions cannot be static inline like their "mm-locks.h"
counterparts, since "mm-locks.h" is only included in source files, not
header files. Therefore, these functions might introduce a slight function
call overhead over their "mm-locks.h" counterparts. However, the altp2m
lock is mostly used in init/teardown routines and HVMOP implementations.
For these cases, the altp2m_list_lock functions have been switched out for
the altp2m_lock functions so they can be later migrated to common code. The
only other function using the altp2m lock is altp2m_get_or_propagate, which
is in the hot path of the page fault handler, so the altp2m_list_lock calls
have not been replaced for that function.

This is commit 2/12 of the altp2m_init/altp2m_teardown routines phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.

    This seems like the solution which makes the most sense here, but it
    would be nicer if it could be static inline. I'm also not sure if the
    "mm-locks.h" functions are really supposed to be exposed outside of
    their translation unit like this, so feedback on this is appreciated.
---
 xen/arch/x86/include/asm/altp2m.h |  4 +++
 xen/arch/x86/mm/altp2m.c          | 42 ++++++++++++++++++++-----------
 2 files changed, 31 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/include/asm/altp2m.h b/xen/arch/x86/include/asm/altp2m.h
index 9c58a396448d..7cff40beb7c6 100644
--- a/xen/arch/x86/include/asm/altp2m.h
+++ b/xen/arch/x86/include/asm/altp2m.h
@@ -156,6 +156,10 @@ int p2m_set_suppress_ve_multi(struct domain *d,
 int p2m_get_suppress_ve(struct domain *d, gfn_t gfn, bool *suppress_ve,
                         unsigned int altp2m_idx);
 
+void altp2m_lock_init(struct domain *d);
+void altp2m_lock(struct domain *d);
+void altp2m_unlock(struct domain *d);
+
 #else
 
 static inline bool altp2m_is_eptp_valid(const struct domain *d,
diff --git a/xen/arch/x86/mm/altp2m.c b/xen/arch/x86/mm/altp2m.c
index 2dc84b76b8c1..371bf3f0b8d4 100644
--- a/xen/arch/x86/mm/altp2m.c
+++ b/xen/arch/x86/mm/altp2m.c
@@ -129,7 +129,7 @@ int altp2m_init(struct domain *d)
     struct p2m_domain *p2m;
     struct p2m_domain *hostp2m = p2m_get_hostp2m(d);
 
-    mm_lock_init(&d->arch.altp2m_list_lock);
+    altp2m_lock_init(d);
     d->altp2m_p2m = xvzalloc_array(struct p2m_domain *, d->nr_altp2m);
 
     if ( !d->altp2m_p2m )
@@ -221,7 +221,7 @@ bool altp2m_switch_vcpu_by_id(struct vcpu *v, unsigned int idx)
     if ( idx >= d->nr_altp2m )
         return rc;
 
-    altp2m_list_lock(d);
+    altp2m_lock(d);
 
     if ( d->arch.altp2m_eptp[idx] != mfn_x(INVALID_MFN) )
     {
@@ -230,7 +230,7 @@ bool altp2m_switch_vcpu_by_id(struct vcpu *v, unsigned int idx)
         rc = 1;
     }
 
-    altp2m_list_unlock(d);
+    altp2m_unlock(d);
     return rc;
 }
 
@@ -348,7 +348,7 @@ void altp2m_flush(struct domain *d)
 {
     unsigned int i;
 
-    altp2m_list_lock(d);
+    altp2m_lock(d);
 
     for ( i = 0; i < d->nr_altp2m; i++ )
     {
@@ -357,7 +357,7 @@ void altp2m_flush(struct domain *d)
         d->arch.altp2m_visible_eptp[i] = mfn_x(INVALID_MFN);
     }
 
-    altp2m_list_unlock(d);
+    altp2m_unlock(d);
 }
 
 static int altp2m_activate_altp2m(struct domain *d, unsigned int idx,
@@ -409,13 +409,13 @@ int altp2m_init_by_id(struct domain *d, unsigned int idx)
     if ( idx >= d->nr_altp2m )
         return rc;
 
-    altp2m_list_lock(d);
+    altp2m_lock(d);
 
     if ( d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] ==
          mfn_x(INVALID_MFN) )
         rc = altp2m_activate_altp2m(d, idx, hostp2m->default_access);
 
-    altp2m_list_unlock(d);
+    altp2m_unlock(d);
     return rc;
 }
 
@@ -431,7 +431,7 @@ int altp2m_init_next_available(struct domain *d, uint16_t *idx,
          !xenmem_access_to_p2m_access(hostp2m, hvmmem_default_access, &a) )
         return rc;
 
-    altp2m_list_lock(d);
+    altp2m_lock(d);
 
     for ( i = 0; i < d->nr_altp2m; i++ )
     {
@@ -446,7 +446,7 @@ int altp2m_init_next_available(struct domain *d, uint16_t *idx,
         break;
     }
 
-    altp2m_list_unlock(d);
+    altp2m_unlock(d);
     return rc;
 }
 
@@ -463,7 +463,7 @@ int altp2m_destroy_by_id(struct domain *d, unsigned int idx)
         return rc;
 
     rc = -EBUSY;
-    altp2m_list_lock(d);
+    altp2m_lock(d);
 
     if ( d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] !=
          mfn_x(INVALID_MFN) )
@@ -481,7 +481,7 @@ int altp2m_destroy_by_id(struct domain *d, unsigned int idx)
         }
     }
 
-    altp2m_list_unlock(d);
+    altp2m_unlock(d);
 
     domain_unpause_except_self(d);
 
@@ -501,7 +501,7 @@ int altp2m_switch_domain_altp2m_by_id(struct domain *d, unsigned int idx)
         return rc;
 
     rc = -EINVAL;
-    altp2m_list_lock(d);
+    altp2m_lock(d);
 
     if ( d->arch.altp2m_visible_eptp[idx] != mfn_x(INVALID_MFN) )
     {
@@ -512,7 +512,7 @@ int altp2m_switch_domain_altp2m_by_id(struct domain *d, unsigned int idx)
         rc = 0;
     }
 
-    altp2m_list_unlock(d);
+    altp2m_unlock(d);
 
     domain_unpause_except_self(d);
 
@@ -773,7 +773,7 @@ int altp2m_set_view_visibility(struct domain *d, unsigned int altp2m_idx,
 {
     int rc = 0;
 
-    altp2m_list_lock(d);
+    altp2m_lock(d);
 
     if ( !altp2m_is_eptp_valid(d, altp2m_idx) )
         rc = -EINVAL;
@@ -784,11 +784,23 @@ int altp2m_set_view_visibility(struct domain *d, unsigned int altp2m_idx,
         d->arch.altp2m_visible_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] =
             mfn_x(INVALID_MFN);
 
-    altp2m_list_unlock(d);
+    altp2m_unlock(d);
 
     return rc;
 }
 
+void altp2m_lock_init(struct domain *d) {
+    mm_lock_init(&d->arch.altp2m_list_lock);
+}
+
+void altp2m_lock(struct domain *d) {
+    altp2m_list_lock(d);
+}
+
+void altp2m_unlock(struct domain *d) {
+    altp2m_list_unlock(d);
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.34.1


