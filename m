Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mB0qIOOd5mmyywEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:42:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B09D043451E
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:42:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288174.1568496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwOI-0006oW-UF; Mon, 20 Apr 2026 21:42:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288174.1568496; Mon, 20 Apr 2026 21:42:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwOI-0006mP-Qg; Mon, 20 Apr 2026 21:42:50 +0000
Received: by outflank-mailman (input) for mailman id 1288174;
 Mon, 20 Apr 2026 21:42:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEwOG-0006iS-W6
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:42:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEwOG-001R8R-Ck
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:42:48 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69db4-e002-0a2a0a5209dd-0a2a450488ce-26
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:42:48 +0200
Received: from [40.107.209.106]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b7c-1dec-0a2a45040019-286bd16a1f90-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:32:46 +0200
Received: from SA9P223CA0011.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::16)
 by SA2PR08MB6748.namprd08.prod.outlook.com (2603:10b6:806:111::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Mon, 20 Apr
 2026 21:32:39 +0000
Received: from SA2PEPF000015C9.namprd03.prod.outlook.com
 (2603:10b6:806:26:cafe::41) by SA9P223CA0011.outlook.office365.com
 (2603:10b6:806:26::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:32:38 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 SA2PEPF000015C9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:32:38 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzzGs2yP0z1wdS; 
 Mon, 20 Apr 2026 14:32:37 -0700 (PDT)
Received: from BL0PR07CU001.outbound.protection.outlook.com
 (mail-bl0pr07cu00101.outbound.protection.outlook.com [40.93.4.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:32:36 -0700 (PDT)
Received: from SJ0PR13CA0198.namprd13.prod.outlook.com (2603:10b6:a03:2c3::23)
 by SJ0PR08MB7797.namprd08.prod.outlook.com (2603:10b6:a03:3d4::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:32:28 +0000
Received: from SJ1PEPF000026C7.namprd04.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::ba) by SJ0PR13CA0198.outlook.office365.com
 (2603:10b6:a03:2c3::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:32:28 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 SJ1PEPF000026C7.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:32:27 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:32:22 +0200
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
 b=S0CUyokS/xup9EC3UoKjwcLduZHR71qcmQO1KYA6FRHV6ANu6IzTTl7EMGmlgP+uym4e7HNBRB51szvQolk6VCrKyO99pC4t8aGhAKrVDr2dZkpCxUctJdoMnbZ374ToXRjZNWLcKXiCHUcdl8AC2dtjmoyhsFGqcFJbvx3SNFWXboRECUI6CChZh+PyqWF2v1akdzbS0WZqi9MyrNldi2pGpPT6sbHE0f6IGcaNdRLKcynoY1wcq4Tq6xTdOtvnMplMf13OIa0qHkqzQDRLf0H4DBA6l4omztesffe3URbXfDYg0BFNcggXhec42nqa+HrVakueijDXdDbWq1aXLQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CskA+UpxYzQP++t6ku/Lr+/r6p41tsG9v+zuUgf8Wvs=;
 b=QBmk0vtu/6ZYS6FjSO4G4gaba86Rpnw3rwBN3FpZKd42Ues6avWItTLuk6n/Z41e8BshwuqaRsdxmrRq3hCbjDxfmkzCQCw+0ZA4CnfiHR4tKhPnsKTc61NinWYI+uxsgKW+pTJnWbijaqWRRyUorqP31p0IQd7UvVDz8BaeNsdDOlNRTHoeKBkySgYx7K+MfibgcVRR+fAedZn0zsrqCX8iKbNW/fUNGXgpwsLZKx2jhTm+jNXa/CY2RatjHSxSCHWv8K2iuVmTvMpCl7MyAWS1hX2HybBN4QpRKDxJIPujexlim6hueEABYxSbJdaFebvSyZaXb11Belck3YFCZA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.4.1) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=elektrobit.com;
 dkim=pass (signature was verified) header.d=elektrobit.com; arc=pass (0 oda=1
 ltdi=1 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CskA+UpxYzQP++t6ku/Lr+/r6p41tsG9v+zuUgf8Wvs=;
 b=NyQCtB3HICycM7Zj2Wu1WOxeGipv5efmhmhDvoNOG3H2oZlVt+7jSLyMVb/F02m7SUEj9/hi2ovH9w2OFERQ09EeQ4jIe5gpjb8cbN6dtoOvgWO+3SwgugiF9MHYcwKpWcxUHUZsgDzowMYd7Bum6cVN8wijSSK0v8PQN4A24Mo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.4.1)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.4.1 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.4.1; helo=BL0PR07CU001.outbound.protection.outlook.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FpJzjqtms+hhoq2lyI+oKtgr6olceyto2dGDrv3dj775ur/P9Kp0FAd9yjUDThzUU+tuHPLBTFPgEnb3TAh3gxwiARzHO01h7HMLSpI57jRZGifXKV0O41i8QKxo6ZuOZUpUMuZO0l0q0hFGf7IM1goo8chLIQiSW3gkFo2iyNFzPpIsvXHvdLfQFqIkJdfKkKtFEiAfEpbl7pX4Lg7O0U91Vt5f8AjlTNRoCLomN6V+qmStioM5GBKKECQefBtEt1kjJhpAXuyLrurFN2V9/Ch8tWjDJ/R3PIhQzQaFmqa1yzyHy6ymm8bCOJxlDsYbflpRtnDT7DpsxVmaywhCOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CskA+UpxYzQP++t6ku/Lr+/r6p41tsG9v+zuUgf8Wvs=;
 b=wJvjxgfh1HqY8NYHDNisGqUg/GiOH7epBE3bBX4H6j3+VVaGONfIgH0mLnK+IrZ4bzMwGfSpdeQa/inP4hkJ0StW3P8Im8015G1o9ZSjjK2jzWeXnZSBRZ/WXSKl6dIfu8VW4s69Z4XQt/FU53/PqNHSN0oQ9EIe8Jq8SLeFD9wG9T6NFxJy0aUviGhlUmwENFJLf1MEjhoRownydAzu5ZnNTY3noGrTss+RSmxm4uS49ZRJZblQ9KVG+PHJtl88hx7vhedrlYIb5LW6DADJwHmXMZ3MLDvRCYhcPfb2iKUHvcKM2+/3cCelwDfmufWQjgpWZImyPy7EY4NXO8gV7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CskA+UpxYzQP++t6ku/Lr+/r6p41tsG9v+zuUgf8Wvs=;
 b=NyQCtB3HICycM7Zj2Wu1WOxeGipv5efmhmhDvoNOG3H2oZlVt+7jSLyMVb/F02m7SUEj9/hi2ovH9w2OFERQ09EeQ4jIe5gpjb8cbN6dtoOvgWO+3SwgugiF9MHYcwKpWcxUHUZsgDzowMYd7Bum6cVN8wijSSK0v8PQN4A24Mo=
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
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Teddy
 Astie" <teddy.astie@vates.tech>, Tamas K Lengyel <tamas@tklengyel.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Rahul Singh <rahul.singh@arm.com>, "Julien
 Grall" <julien.grall@arm.com>
Subject: [RESEND-2 RFC PATCH v6 00/43] altp2m: Move altp2m routines to common code and add ARM support
Date: Mon, 20 Apr 2026 17:31:23 -0400
Message-ID: <20260420213206.208750-1-Rose.Spangler@elektrobit.com>
X-Mailer: git-send-email 2.34.1
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
	SJ1PEPF000026C7:EE_|SJ0PR08MB7797:EE_|SA2PEPF000015C9:EE_|SA2PR08MB6748:EE_
X-MS-Office365-Filtering-Correlation-Id: e474e0b6-aa80-428e-254f-08de9f24587c
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|704162111799003|36860700016|1800799024|7416014|376014|82310400026|13003099007|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?aFW/LYPDMSYhpPLTIQc09I2b0VwucJTxEndQV12/gIYsoVaBJpW+E4rmeMJy?=
 =?us-ascii?Q?nCAt9lU9TO+slkzSt29hGruuMcOTsOk8CJLmwI80QNoEz95cKztn+VBiOMJ3?=
 =?us-ascii?Q?7Pevxy1qtvkpljRVg9awc7UWVsZNDw41BuXnCYslEx7gvAJYs3ki//7zC4Tg?=
 =?us-ascii?Q?w7yxK4Xfo7ANH/w4IFUxloE8749PhEmzz6lWrxwkEVHTTdv9L7jcmlIWSIjp?=
 =?us-ascii?Q?eb1zPkuzmE1balD/BWJ+JpRNdUxSsrPvbRl8Yys7EtDsEBXSDNpduzguxOoY?=
 =?us-ascii?Q?2YmwFmGEayzD3IJ7LXI1qfba3pm8bPXXaZo4PHO/f60kfdx87iRsu/ioBBMx?=
 =?us-ascii?Q?pqoI29pwGtgYoWqRQz5a8sUog6fEoKOtWL3qe0uSzr81rS3N9Xt/vYcMGoNK?=
 =?us-ascii?Q?PWTrRmWBRef6toS7fIPrjisjVQOkVMvSe40zmWsF6jiWYQj5rtRD3CxwhAKB?=
 =?us-ascii?Q?wEQwfOOkp3t18CAY7cBAg0ssoLfggaaCIS1Cd0j2xm+kR04GCb3eQAfWcxoc?=
 =?us-ascii?Q?2lLAZ+9dFNfu3PRlzc0wCA3/pfsjQUEGiHI7NwSPAnLOBVRzgpJc1RbOqj71?=
 =?us-ascii?Q?njYWaxfE3xtmXWdKT/uAGC6ZsZ2ez1xiUiqA7JxQbVMIlNfF+yPd66vuvKfX?=
 =?us-ascii?Q?PAD1dEW7gWW8qrnFE7UwrUDWIC53qLYL1sBeR5mPlMNEbN2MmdXLIquAj38X?=
 =?us-ascii?Q?YHCVMH8BcFYlLVw18VGz+sh624SIEnR8d+QNHGSt6xPMNlkVUSzt7/mObHRS?=
 =?us-ascii?Q?o0HXmaLpEMfLQSWJInS3vYvJ0/DpdFz5AeqtJG0ep5AqMk6u8U7j5NM9Y0zl?=
 =?us-ascii?Q?96E0vsecbZi41vVivsYv2mlWzu8N+15cVhfXF7l3bHyARoTiH/J7S1t+tdmd?=
 =?us-ascii?Q?lu9J/L/FFUUX+4GkN9s//vdi10fX26DKMcK7YmDHs7MeVrqgZcsKfEfffGtR?=
 =?us-ascii?Q?n3NRE5oMfY8vdh6HKk9f4VONTxcbizB/q/yFOI+9PkDwOuOFg52Kk6q9HVqA?=
 =?us-ascii?Q?f0hHAVI3dTMMjUyLKhP/YB2MyNrF2G4VkT8MPNFn2BEoIXks4qziH2VHQPpM?=
 =?us-ascii?Q?opOD9WiHjG9NyKSfmcKMnm31tfqfeVpY509mUz89RapC4sKktw8qtdi901J3?=
 =?us-ascii?Q?ISf7fkAXqBtN0mv5u5awfkPNDstfnC58U0z41l/NfeBJ08XARUNiunk=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(704162111799003)(36860700016)(1800799024)(7416014)(376014)(82310400026)(13003099007)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 UA+pltSXPuvY84rQ8UEvjk7KbmBljPoX7ygQu/VM32tYHLOoM9pHQInYpN3rYega32X0542tgS7f2/5Rj5dcWWWdLnpZoAufoplCu87QMt0w3TvvI0u2fjO1GyrUJhkx6UEGZyUL6lj1G058WKwYnQxBVcbTc0+1Ua+XqQ4ozPup7d3Kxb6lRK5rbfqhX42qVlpq/NrSphdvThg7vxOVmB5qP6/5AisNwm1OoKw90ToLhDgOr4Dz4ZUqpBiILWTX5cRSArnc9vJGeLeGDlyNfsjbzuiJ5m/2QXfWehZBI6dLWZqokb7cgvyL6STBvxPZgL7IgbisbqdEk1AUjavQag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR08MB7797
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.4.1];domain=BL0PR07CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.4.1];domain=BL0PR07CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 SA2PEPF000015C9.namprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	05c18579-e12e-4551-2c90-08de9f245213
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|704162111799003|156008|1800799024|7416014|14060799003|82310400026|36860700016|35042699022|376014|13003099007|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gtMuaKq7UmcVlhVGzQbNrQC3GxFqtyDVP0tf4Uf7t8iqR51x6MnawWb+8EEd?=
 =?us-ascii?Q?7A+zaJ57DtZN1WVRXilTLBVCGHelmQnBgqHYVmXnh4LkKe8uO0DzgCvwidcP?=
 =?us-ascii?Q?96EyKF8PEQ3umnivpfM076lOtabkIU1W4RY/ad0ppAiPm9fR4jJsbX/bximG?=
 =?us-ascii?Q?91Bq5R/uV0KQICEiSCImDM6mDMMMYOXFT+7WNO4OrjdBVM1puFrKMEVkQNca?=
 =?us-ascii?Q?iJELKqLbx7la2mTiNpbMAisoK389Rcxg7NycmJdXuqzmXYV3p0FbGHElNIWD?=
 =?us-ascii?Q?6amNQWRDPyGrkMFYEoBk28sXfnUzbVEb471HfqAoc7Kz1VoM0gM7Gy66ZLRG?=
 =?us-ascii?Q?giItJv6mnnVkJC/Po4pE1nvKeXAB1ghNDKn6tWVqI/eDSE9Fo7IyQT8COg5z?=
 =?us-ascii?Q?KJ8EDUqqdEOo4qJ5piJPexrzXU+EVEcD69QMFzG1rzOQ5y2dmyS/lbkllJJG?=
 =?us-ascii?Q?2USrs8KVRO+u9NLzXmbR7qOjuf/WK0YMXZiC+Si2qt8PEVVQt+VBGuHbi2pY?=
 =?us-ascii?Q?F2hrLWyCzq9qLf2gas+xIe8LURRMfcyF9mhY1wscALjFfY4keYGwW8YO22Go?=
 =?us-ascii?Q?/GhOyyjKVs8JrwTmyxFRMtDZNvvWpzU4QL12KldNOKmibgdoRRsswB28ZdAR?=
 =?us-ascii?Q?Jt0+mI/ktNLAf6MPuKiEX6wlYFeIhsvIHeApONoKp0jhTRY3ECo3PYObengV?=
 =?us-ascii?Q?QBTHunKouzEIFXBvh5IKTmcq+vyZ6+Y3i8JnDtxK3FYrPr6DEv9k4ddcL5SO?=
 =?us-ascii?Q?B7YhKrt4n9vcnQSCSfONggiIL5zGXimBu7e9JGdCpJC8DsQrwHCntpGpFN0G?=
 =?us-ascii?Q?i0MqNJ35DKTgpr30D2ehg9nhUknLWMtjZrEOK2u6MyUIElJNIdvk6tm9KlTP?=
 =?us-ascii?Q?M+MrXttZRJI2qpyW/VBq81xd22fPHJvTLP/ZQfIDqtzMJwb4n6dOkP4e7uzg?=
 =?us-ascii?Q?wk7hL532nfgd3kf2FLam0I3NRG9JZ2DvegXWyQmE3Elv6liT0XcnmCMrEpH4?=
 =?us-ascii?Q?obX3ulMs13aYS6wmg2frzl7GOuS8YQz3ACAnbrmfBS6mdR53GdBe0E5GJxgR?=
 =?us-ascii?Q?gjXbIh+Z76gdAt5t4w+Vdxro4iWVX25sOV2pj/ACbQPSauC0gO6wp5pgdE2D?=
 =?us-ascii?Q?FhWVZ01NNNQzVzKePN7ed6LngKgO2pa4pk8iB2oTIN0efTue/vUdjcw=3D?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR07CU001.outbound.protection.outlook.com;PTR:mail-bl0pr07cu00101.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(704162111799003)(156008)(1800799024)(7416014)(14060799003)(82310400026)(36860700016)(35042699022)(376014)(13003099007)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	47ytyXz1UpSD9cJKZSwqVR1ukiEfNtrEWgFnlPS+tgw7cdh0/8/i4lwN/b+KXh2Eyi1p8Mq2rP2TY1Kv9f8ViXWRC3tO62keEOTdlhSah3b5Ox5D+uptykc56hXLbqh3zs2/lg0+xGhHBmQhKhgDUnJVYEmmAFJfzxylBFSvOtB4+fMuha2IwIJGgjrjUKhAFAicby1yZ4rk/gBj5Fgjb/5KS/XQ3463WmCsW5kuWWtVmk4dri1wOIdrMKwy0iSnOY3DhIh2RTYabqF/Vxeu216JO1OIzD/H2RztIGZzrnpO6VogDl/oVFn/AAdLVaji1e80nDDNDn3yjxg2uxYBHoJ1ZNq2hs9VRMYv6R/QnfziwyYUUrd2S/icMQjVWPJ3K9Stiw8svZx4zE1aydYkPtQZfzl6PIuxUXa0ztFxxyebGtDBNuGgk2vq8TUu4ccV
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:32:38.1818
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e474e0b6-aa80-428e-254f-08de9f24587c
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF000015C9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR08MB6748
X-purgate-ID: tlsNG-ebf023/1776720767-4BB6B3FF-3A0F23C8/0/0
X-purgate-type: clean
X-purgate-size: 9546
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[elektrobit.com,quarantine];
	R_DKIM_ALLOW(-0.20)[elektrobit.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:teddy.astie@vates.tech,m:tamas@tklengyel.com,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:dpsmith@apertussolutions.com,m:rahul.singh@arm.com,m:julien.grall@arm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[17];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[elektrobit.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[0.038];
	HAS_XOIP(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: B09D043451E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi all,

For the past few months, myself and Aqib Javid have been working to port
altp2m to ARM with support from Stewart Hildebrand and Stefano Stabellini.
At the recent Spring Xen Summit, Aqib and Stewart gave a presentation which
discussed the motivation behind this, along with an overview of the
rebasing and testing process. While this effort started as a rebase[1] of
the v5 patch series[2] by Sergej Proskurin and Tamas Lengyel, I have been
reworking the branch to make most of the altp2m code common between x86 and
ARM. This should address the major concerns that came up during review of
the original patch series. For a quick overview of altp2m functionality and
scope of the patch series, here's an excerpt from Sergej's cover letter:

> In this patch series, we provide an implementation of the altp2m
> subsystem for ARM. Our implementation is based on the altp2m subsystem for
> x86, providing additional --alternate-- views on the guest's physical
> memory by means of the ARM 2nd stage translation mechanism. The patches
> introduce new HVMOPs and extend the p2m subsystem. [...] To be more
> precise, altp2m allows to create and switch to additional p2m views (i.e.
> gfn to mfn mappings). These views can be manipulated and activated as will
> through the provided HVMOPs. In this way, the active guest instance in
> question can seamlessly proceed execution without noticing that anything
> has changed.

As of right now, I've reworked patch series up through the
HVMOP_altp2m_set_domain_state command and plan to continue implementing the
remaining altp2m features. I've continued the patch series versioning by
labeling my notes as v6, and the patch notes from v1-v5 have been preserved
where applicable. I am hoping for some feedback on the general approach
I've taken with this patch series, and I can incorporate any changes
requested into the actual patch series submission.

This is a pretty big patch series, so I've tried to make it as easy as
possible to follow. I've tried to minimize the number of changes in each
patch; there are quite a lot of patches so if it would be preferred to
combine some patches I can do so. Here is the general approach I used
throughout the patch series to turn x86 altp2m code into common altp2m
code with ARM support:

- Move function(s) from arch/x86/mm/altp2m.c to common/altp2m.c, gating
  declarations/definitions with #ifdef CONFIG_X86
- Add any additional features to ARM code needed to implement these
  functions
- Make any changes necessary to functions to support ARM, and remove #ifdef
  CONFIG_X86

This approach makes it possible to separate out code movement patches from
the actual changes needed to support ARM. Furthermore, each patch in the
patch series still compiles for both x86 and ARM.

Additionally, I've split the patch series into a number of "phases" to make
it easier to understand the context of each patch. Each patch description
indicates which phase it's a part of.
- Preparation (8 commits)
- Common do_altp2m_op (2 commits)
- get_domain_state (1 commit)
- altp2m_{init,teardown} routines (12 commits)
- altp2m_{get,set}_altp2m (4 commits)
  - Needed for altp2m_vcpu_{initialise,destroy}
- altp2m_vcpu_{initialise,destroy} (2 commits)
  - Needed for HVMOP_set_domain_state
- altp2m view visibility (5 commits)
  - Needed for altp2m_init_by_id, altp2m_flush
- altp2m_activate_altp2m (2 commits)
  - Needed for altp2m_init_by_id
- altp2m_init_by_id (2 commits)
  - Needed for HVMOP_altp2m_set_domain_state
- altp2m_reset_altp2m (2 commits)
  - Needed for altp2m_flush
- altp2m_flush (2 commits)
  - Needed for HVMOP_altp2m_set_domain_state
- set_domain_state (1 commit)

The code for this patch series can also be found on GitLab:
https://gitlab.com/xen-project/people/elektrobit/xen/-/tree/altp2m-arm-rework-rfc

Best,
Rose Spangler

[1] Rebase of original patch series:
https://gitlab.com/xen-project/people/elektrobit/xen/-/commits/altp2m-arm-rebase

[2] Original patch series:
v1: https://lore.kernel.org/xen-devel/20160704114605.10086-1-proskurin@sec.in.tum.de/
v2: https://lore.kernel.org/xen-devel/20160801171028.11615-1-proskurin@sec.in.tum.de/
v3: https://lore.kernel.org/xen-devel/20160816221714.22041-1-proskurin@sec.in.tum.de/
v4: https://lore.kernel.org/xen-devel/20170830183258.14612-1-proskurin@sec.in.tum.de/
v5 was never submitted to mailing list, but is available on GitHub:
https://github.com/sergej-proskurin/xen/tree/arm-altp2m-v5

(Resend due to threading issues in first send attempt)

Rose Spangler (38):
  altp2m: Add template common altp2m.c/altp2m.h
  altp2m: Move altp2m_active to common domain struct
  altp2m: Move altp2m_p2m to common domain struct
  x86/altp2m: Rename hvm_altp2m_supported to altp2m_supported
  altp2m: Move altp2m_supported to arch header
  arm/altp2m: Add template arch-specific altp2m.c/altp2m.h
  arm/altp2m: Introduce CONFIG_ALTP2M Kconfig option
  altp2m: Rename p2m_*_altp2m functions and move declarations out of
    p2m.h
  altp2m: Move do_altp2m_op to common code
  altp2m: Add ARM support to do_altp2m_op
  arm/altp2m: Add support for HVMOP_altp2m_get_domain_state
  x86/p2m: Move p2m_{init,free}_one declarations to arch header
  x86/altp2m: Add lock functions accessible from common code
  altp2m: Move altp2m_{init,teardown} to common code
  arm/p2m: Allocate hostp2m with xzalloc
  arm/p2m: Move hostp2m init/teardown to individual functions
  arm/p2m: Invalidate root page table entries and flush TLB in
    p2m_flush_table
  arm/altp2m: Add support for altp2m init/teardown routines
  altp2m: Move altp2m_{get,set}_altp2m to common code
  arm/altp2m: Add altp2m index to arch_vcpu
  altp2m: Add altp2m_set_vcpu_idx
  arm/altp2m: Add support for altp2m_{get,set}_altp2m
  altp2m: Move altp2m_vcpu_{initialise,destroy} to common code
  arm/altp2m: Add support for altp2m_vcpu_{initialise,destroy}
  arm/altp2m: Add altp2m view validity/visibility indicator
  altp2m: Add altp2m_view_is_{valid,visible}
  x86/altp2m: Add altp2m_set_view_visibility_locked
  arm/altp2m: Add altp2m_set_view_visibility{,_locked} support
  arm/altp2m: Add support for HVMOP_altp2m_set_visibility
  x86/altp2m: Add altp2m_activate_altp2m declaration to arch header
  arm/altp2m: Add support for altp2m_activate_altp2m
  altp2m: Move altp2m_init_by_id to common code
  arm/altp2m: Add support for altp2m_init_by_id
  x86/altp2m: Add altp2m_reset_altp2m declaration to arch header
  arm/altp2m: Add altp2m_reset_altp2m routine
  altp2m: Move altp2m_flush to common code
  arm/altp2m: Add support for altp2m_flush
  arm/p2m: Add support for HVMOP_altp2m_set_domain_state

Sergej Proskurin (5):
  arm/p2m: Cosmetic fix - substitute _gfn(ULONG_MAX) for INVALID_GFN
  arm/p2m: Change function prototype of p2m_alloc_table
  arm/p2m: Rename parameter in p2m_alloc_vmid
  arm/p2m: Change func prototype and impl of p2m_{alloc,free}_vmid
  arm/p2m: Introduce p2m_is_{hostp2m,altp2m}

 xen/arch/arm/Kconfig                     |  11 +
 xen/arch/arm/Makefile                    |   1 +
 xen/arch/arm/altp2m.c                    | 122 +++++
 xen/arch/arm/domain.c                    |   2 +-
 xen/arch/arm/hvm.c                       |   9 +
 xen/arch/arm/include/asm/Makefile        |   1 -
 xen/arch/arm/include/asm/altp2m.h        |  84 ++++
 xen/arch/arm/include/asm/domain.h        |  19 +-
 xen/arch/arm/include/asm/p2m.h           |  41 +-
 xen/arch/arm/mm.c                        |   2 +-
 xen/arch/arm/mmu/p2m.c                   | 162 ++++++-
 xen/arch/arm/p2m.c                       |  31 +-
 xen/arch/arm/traps.c                     |   2 +-
 xen/arch/x86/domain.c                    |   3 +-
 xen/arch/x86/hvm/emulate.c               |   1 +
 xen/arch/x86/hvm/hvm.c                   | 413 +----------------
 xen/arch/x86/hvm/monitor.c               |   3 +-
 xen/arch/x86/hvm/vmx/vmx.c               |   9 +-
 xen/arch/x86/include/asm/altp2m.h        | 115 ++++-
 xen/arch/x86/include/asm/domain.h        |   5 -
 xen/arch/x86/include/asm/hvm/hvm.h       |  11 -
 xen/arch/x86/include/asm/p2m.h           | 112 +----
 xen/arch/x86/mm/altp2m.c                 | 242 +++-------
 xen/arch/x86/mm/hap/hap.c                |  17 +-
 xen/arch/x86/mm/mem_access.c             |  22 +-
 xen/arch/x86/mm/mem_sharing.c            |   3 +-
 xen/arch/x86/mm/p2m-basic.c              |   7 +-
 xen/arch/x86/mm/p2m-ept.c                |  13 +-
 xen/arch/x86/mm/p2m-pt.c                 |   1 +
 xen/arch/x86/mm/p2m.c                    |   9 +-
 xen/arch/x86/mm/p2m.h                    |   6 -
 xen/common/Makefile                      |   1 +
 xen/common/altp2m.c                      | 551 +++++++++++++++++++++++
 xen/common/monitor.c                     |   1 +
 xen/common/vm_event.c                    |   2 +-
 xen/drivers/passthrough/arm/ipmmu-vmsa.c |   2 +-
 xen/drivers/passthrough/arm/smmu-v3.c    |   2 +-
 xen/drivers/passthrough/arm/smmu.c       |   2 +-
 xen/include/asm-generic/altp2m.h         |   5 +-
 xen/include/xen/altp2m.h                 |  98 ++++
 xen/include/xen/p2m-common.h             |   2 +-
 xen/include/xen/sched.h                  |   3 +
 42 files changed, 1330 insertions(+), 818 deletions(-)
 create mode 100644 xen/arch/arm/altp2m.c
 create mode 100644 xen/arch/arm/include/asm/altp2m.h
 create mode 100644 xen/common/altp2m.c
 create mode 100644 xen/include/xen/altp2m.h

-- 
2.34.1


