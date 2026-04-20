Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGztGNOb5mnCygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:34:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6204342F4
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:34:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287924.1568386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwFl-0002jJ-Vb; Mon, 20 Apr 2026 21:34:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287924.1568386; Mon, 20 Apr 2026 21:34:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwFk-0002GI-9b; Mon, 20 Apr 2026 21:34:00 +0000
Received: by outflank-mailman (input) for mailman id 1287924;
 Mon, 20 Apr 2026 21:33:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEwFW-0008Rr-OD
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:33:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEwFW-00EgH4-44
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:33:46 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69bb5-e002-0a2a0a5209dd-0a2a4508b40e-4
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:46 +0200
Received: from [40.93.198.89]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69bb7-63b5-0a2a45080019-285dc6597c53-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:45 +0200
Received: from SJ0PR13CA0237.namprd13.prod.outlook.com (2603:10b6:a03:2c1::32)
 by CH0PR08MB8613.namprd08.prod.outlook.com (2603:10b6:610:183::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:33:38 +0000
Received: from MWH0EPF000A672E.namprd04.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::3f) by SJ0PR13CA0237.outlook.office365.com
 (2603:10b6:a03:2c1::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:36 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 MWH0EPF000A672E.mail.protection.outlook.com (10.167.249.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:33:36 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzzJ00jxGz1wdZ; 
 Mon, 20 Apr 2026 14:33:36 -0700 (PDT)
Received: from BYAPR08CU003.outbound.protection.outlook.com
 (mail-byapr08cu00306.outbound.protection.outlook.com [40.93.1.110])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:33:35 -0700 (PDT)
Received: from BY1P220CA0022.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::14)
 by SN4PR0801MB7744.namprd08.prod.outlook.com (2603:10b6:806:203::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.31; Mon, 20 Apr
 2026 21:33:32 +0000
Received: from SJ1PEPF000026C9.namprd04.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::77) by BY1P220CA0022.outlook.office365.com
 (2603:10b6:a03:5c3::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:31 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 SJ1PEPF000026C9.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:33:31 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:33:27 +0200
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
 b=qy7UIJL/oN9FpqFvzzZX+5OdMbiJFhvoafWRadBDZTleAPIPY3HIfHAKDepSmpxwZMFGjOPb9/94NDEUX+lEElIZdBS0Mz4KfHafrDt27XCu8YSDIzp0YrAxlbbmJZgHT9M5NLty5YG3REnS7oxcEePWnxaMLaLEMbJBJqCe56jRuvuXRy4bwUbERNrk79WkepqrTUVeqFcpYXN0I8lbwBhKOXY85le7fqYd/X4EVC9wS4U7c7vhgawDAMV8oIjUAqfgzpqxw156yO11Ax1vjnSTWiLW2h4tLiZmf7yDYGbcHAgL3qnp4TzLOMDB5myCFABsXPYI9arkOlpqYBMPSw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+XnwEw2LkEZsqrQt7TCPVOkF1Np7ZHiylY2Nnd/lA20=;
 b=YosoNoBUx/1PByQi96zDzHPdjtE0qhu3dOB+G6wGpHNoPWo2qCIAbKNn06h+53cxl1pmx4cAWd+dK9V4edtimHeyMcOA+nO4E3juynjRHD3H0scF8Snj2xqxLwJfv+nhPWm9+YalcGbuabQPOvPFOonposDTQFOZvONb5a3S5no6AXLaX3go7H76yiEfKgJg0U/DBE5DjkRhVM8h7dI4ZAWFj6xwhOHAbUOPc8/4pB8PIpeV8zLE8+3VEd6lUZykiEZBGfZ3czdIAFkooHcb+vU1gzyUtMIdVHiXS7Qs+y1HDR2s1d7WA4w8I62c6DS0lO9+nboZBwqpajhwNoh8Cw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.1.110) smtp.rcpttodomain=citrix.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+XnwEw2LkEZsqrQt7TCPVOkF1Np7ZHiylY2Nnd/lA20=;
 b=qy4OxXo/yi1hnlY7uxDjofXtPsTmYct5+syZRTbfhkQX0DKC3b+fiih7p72pj5579ZSgRDQ6xIpahCPm5AejfOjQ99oMDqGlcDcS7OEcKtA1k0DI4Sz3QOgzXNyPB4Mo32C/e9wTyHEXgbsS15OGhNeV3fMLpmDAsqrbyLs+Lvw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.1.110)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.1.110 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.1.110; helo=BYAPR08CU003.outbound.protection.outlook.com;
 pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CTALkUp0W1HYpm/ttqRs3aAkLj/U7l9l6Ho1hmYAK6Z2t6r84G6g8/I4u9tQIzr0gKWny/L6sI/nE3mjNkMHuSE8SqWdkftJTw4zZMJSx0J0LnvDdaWYZhwTyddXihrqueyXLZoWkxJG6r5lNZsdbh1PTszn61bWmazaO9ECQ6kHdv/6dzbn0dxPhmQaRZcOAdqFKc31p5zIVRAeN2kAybuoxaJRje1iX4Vr1XhmBuQHOKNX1MqWICkcdGix6RdsbqKDV5/8UIBq2qGepLKYj66NgK/61WRrA/sJp3iGOi/LPsp9wNOW15l/4CEzI2i+Fof7UwWnyAqfhsvq5iS/ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+XnwEw2LkEZsqrQt7TCPVOkF1Np7ZHiylY2Nnd/lA20=;
 b=jG5/hAnuJK7rRtpZFBzH3MbvyLJzgmcmPOF9/M4jFlVOsi5dUWbrjMsFnbUontAd0XMCpl1XCP6V/+ZaQri2aKEtbtJap6xeb8LcGlA6RQeFXwJ5l+O261Iq0Ark4kv4S7d8mz8mAmv4FfUMKPfmqU8weycri1BRlugVKd8QtiOeA8hd9rBwTfsIy5gG1rwXLgBjluHuP8dOTQnclNQYXF2HcyQ5rbRDJTAKUMWCi3vGNh8GDNYibej6kZ/LbyWmBXEXPFhz6EJDKK8teFAZvN66HaRYW79ynrnlPPGA71pLo/Bk0ZHP/ILS6h4dZt2dbn7Q2VvGhAeLYn2iNhgqWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+XnwEw2LkEZsqrQt7TCPVOkF1Np7ZHiylY2Nnd/lA20=;
 b=qy4OxXo/yi1hnlY7uxDjofXtPsTmYct5+syZRTbfhkQX0DKC3b+fiih7p72pj5579ZSgRDQ6xIpahCPm5AejfOjQ99oMDqGlcDcS7OEcKtA1k0DI4Sz3QOgzXNyPB4Mo32C/e9wTyHEXgbsS15OGhNeV3fMLpmDAsqrbyLs+Lvw=
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
Subject: [RFC PATCH v6 39/43] x86/altp2m: Add altp2m_reset_altp2m declaration to arch header
Date: Mon, 20 Apr 2026 17:32:02 -0400
Message-ID: <20260420213206.208750-40-Rose.Spangler@elektrobit.com>
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
	SJ1PEPF000026C9:EE_|SN4PR0801MB7744:EE_|MWH0EPF000A672E:EE_|CH0PR08MB8613:EE_
X-MS-Office365-Filtering-Correlation-Id: 51c387a7-23ea-462f-bd5f-08de9f247b08
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|704162011799003|36860700016|1800799024|376014|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?2sPogMVMPSPUsJHrSh7XpbJ4/jqd92+FIPgwwlWwauy8VvC5aGqBvwCoZqrv?=
 =?us-ascii?Q?yDjf706pvs+yG72nWeCTOkBuM9uDz8PvxngY0PKzQiDwTrFfhQt+dFpgR7OY?=
 =?us-ascii?Q?Q0T9lVaJTk3eno+EOdNLNc646l+u2TdxrkKFWj1r3iGBn/isJ3WJ/8popzPf?=
 =?us-ascii?Q?1Mla0LR5dF9A6nmUY5Vrz7ei3ZD8KrA8EInrqBqRei2mb5Vlhh1zJ/ABTLzf?=
 =?us-ascii?Q?y1kVdeT9BhUvlzy9gzQomFVk3HLMDdmrun62IDOHtEnefuqCUA2lnsUwmUMx?=
 =?us-ascii?Q?AnoCfHM23Of949V8WDbE/iHBeuL+lwxDZZ4iM6Dys/hglw95PlX5wWdkDvOO?=
 =?us-ascii?Q?GalvvNAaS+ZITZYQssAi6S6ewmM6enldNoqKU3U2J4NlQ016HhuCSLKoAcYz?=
 =?us-ascii?Q?wmGyEl1ZS2ZTDawYF1W9PT245H4PXLh6dKNqbpQZt2uEmLrgPHnazjTKfiNK?=
 =?us-ascii?Q?wjQ7W8yFBWhEIN7Ltmoj0MIEl+qFLCoWW6K4X7nzRlkn8Pi+++A8y2fi4V/b?=
 =?us-ascii?Q?hHgaKwo0YyzDWOdalaqWKsCylpo71zUmuDQmBovp2MVe+mnihStJZ4jOxKRW?=
 =?us-ascii?Q?8twlCHur3X9/j2fcDACv9qg5oRf9BZs/aF8p0W3qmQ7vnC5yWkqwgD12y8d9?=
 =?us-ascii?Q?o5hQRugJNzNqrFVO9xTymuXsJQCkkMGcdHdPJKLOqKyJNlMcNnmRlc3KaTgh?=
 =?us-ascii?Q?QY6PVP+TSxj9JyEosGQfT226vp6boZvZn4HTZxJ6r6ei3ixZ3t3Ba3envp1P?=
 =?us-ascii?Q?4qVnG2j6xyBd9+nyx+ZrYImOvguqLVMQe9g19CaEYdqnCE4iqVrKkeIzTobE?=
 =?us-ascii?Q?8njHin354ihYZRNJDVKRRZvIZjYOUV/q7tNgOQPPuqCkrTqxd3PTk+9knfDQ?=
 =?us-ascii?Q?RhiT/whrhJvISnDBmIGdZmmJreyaLiy38DcpN2PmPbYAIBshLt/otZGrcm41?=
 =?us-ascii?Q?a0Q9tH8se6N87vVjUJmyPgj6p6AfCN5HW/Z9iblJ8Q/fOSUBbKQnq4OTznOK?=
 =?us-ascii?Q?pgWWHvS5M2ebWjmsUC/RhCZ12Irao0qhe6beiEczgEEDhDmRTMHC31EwGL0S?=
 =?us-ascii?Q?lYTzfqOlJZ0RggOzmNc4rH69UiowLTVhI2n4eLbjrC+L/z3hu69u/GuJ/4hf?=
 =?us-ascii?Q?oWCbrAJIe7hNObNIkqKDQSYWEDNxtcWauw=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(704162011799003)(36860700016)(1800799024)(376014)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 ibjRNCsaVZPLxim+jwQAEC7p2KfBsnqlcyiOXbecBaQGfj5P20tR8JOD8aZ5alA0GIQdOjDcEUfx2/vzAQvlxC9IO62VaO8ENH7EVIG30JuNhNzdUYMB1iKbf2neVDO1luwX+4x2fTpDbo4ju3k+Sr2qhR5F4ZmOOxjcRMfR/I1/8ldLQ5mk5Hg7ziDY5PaRT3DnOabqANhmWjoSKalb0AaR95W7zsFcZOY6Z/Rpyc04epSSmmTh6Ka+zftPN+iitSCh6wYCrD3nh8Lo+zs2Df0I7hl1VRcaBU5Wnyw8BOGGTzRG5hyQg83WaoZ+znjo7g9L+V7MGjiaoXdcRHLLGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0801MB7744
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.1.110];domain=BYAPR08CU003.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.1.110];domain=BYAPR08CU003.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 MWH0EPF000A672E.namprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	976af3c1-c846-43cf-6d77-08de9f247806
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|704162011799003|82310400026|14060799003|35042699022|156008|36860700016|376014|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FdnjhJkfiVR2wZIHyfzOlbdNabjPJY4Bw2fh9lU9BsmVPIs6WZzfFo6xvqSM?=
 =?us-ascii?Q?K3evjX0FPmckCkUGEQnb854AZh04RwI6trj+7yFVsp+1vt6Kj9Q3vwrO4JL1?=
 =?us-ascii?Q?BQG63zxdz+CWM9dGN2J2iR50v8SRiXCAsgYbznvTDELfcDE9DthQ+lmuh6FR?=
 =?us-ascii?Q?ReMJjsa5S2jcr28UlvcqYxES2RqWrcoyCsV069+u6B+1405BYI9DXcFWD7Tb?=
 =?us-ascii?Q?fr19W1CNZnDVu8EdcMWALTb49BIaJZ5be9PGn1FSsaQNE/CG03MsNEe3MOxu?=
 =?us-ascii?Q?FU79yY7EuIVQ+2GVFvW/gIBW0AmKp55lD5KSge2iCMfo6BhQQ+G5dJz5hnbz?=
 =?us-ascii?Q?FbKm5xG8ob/J8uWJWRnTiG77+utkXQXPN5ne/4Hh7NhAP3PSJYNkSoyD8M/1?=
 =?us-ascii?Q?LOVtr0gYGjGnNQygGZKXYo28hXaLGHrSHvZxMlFjFC0HZIZZrANOxms7J27s?=
 =?us-ascii?Q?ua66g5H/CMw3w2wQi8qI9HV0Zy1atfq0j3Lm+KiBHhLy0LzV7TrLAKnFprs6?=
 =?us-ascii?Q?yO/6veunonTpvdESGieS/8OEcUXkYehap0B9rJZkoX6y1LdnVfdsZXnmYC9c?=
 =?us-ascii?Q?C0FCnEzDAstVGbAEKaA1odvj69sgAKW4W6Ox0tJ65dw29a1x/Jo4SZgsvAai?=
 =?us-ascii?Q?mwagRskBaSaK5wCU7ZDWaeRsCJPS47XIKkV6T0ixQ32afHVCnSfvqan0bDtg?=
 =?us-ascii?Q?a5tw4nT9RKjaDUSSl1cUn3FHCpSvj/+mQENIHMi+3IDXYknaX0ZiLb+5GiBI?=
 =?us-ascii?Q?RH5xMXYVIlQcrFYGtD/JH60ENrMqyXqyXY8c2w2sNOghrRi1fCkmh13gJyqv?=
 =?us-ascii?Q?lFHCxMEzvcxd4sP4UVlg7qtEsSEZQB+sPVTRyAJEge9IBqOEyXKAoZjWB/Vp?=
 =?us-ascii?Q?QQAJXTPJcTKloxy5P6DOSJY5vOfM6h0HxE06A/zFtPxjy7VKW2oSAim6F6zx?=
 =?us-ascii?Q?vRQA7awhDB1poe5D7seVGnc1JnYV0z/Y/HL4dFs+lPYfPvBjQGV2mBvq9crE?=
 =?us-ascii?Q?Xhn5YTdFEs8V7FXpEkIa3JAA3fkJtZFxA+mZ8F08AumxR+vsStentk9UWANG?=
 =?us-ascii?Q?6CIrxmb3l9p8bRodUhLhmNTEDvYvxFzhQcfYJ7JCxb0Dnd2jx+GCCINimTgm?=
 =?us-ascii?Q?SCPE1r42uwhXQnrEoW+RCCKcDxLjTO89ZA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR08CU003.outbound.protection.outlook.com;PTR:mail-byapr08cu00306.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(704162011799003)(82310400026)(14060799003)(35042699022)(156008)(36860700016)(376014)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iZyVvjaEa4NT7vLxP5WRAvyzQAMgIIwQdvYCK6Qzq8x1i0ac/oewITB0TA/LitktWnLBtEy5XSz47adkwNsxPtvD5cx4FcVvG5/XFV3rNu4CyWPSahESXNhCY/cJ/hqgrfSPdzPI1GQg/VYSwRx8ZsaoXXzMfwnoBYVA6R/le6wrbqr2jLHrPEchLdC6yjBukiNciQ6gKRLr0ss5tC0uanjt1Rqmx4p5DlcxD3kZSq/BGwoYsD2kWX35/b+K91113B0/cdRYCfVGsrnlhbrUJpJpF+jeF6RCILCniCnufRR1AdRa0xJ0xssGIfCtJ56CTZDCvql4qXlvHmwi2mUW0AfI98ne8f02QSRXexTBOeSIIJji4pGp8FAuTNMiWFNS4bWg+1582Bgtuqc/2w/445WJsHAEz+iPtZcfnEawLoJqJop97TTS1X2rT4ktw4/Z
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:33:36.3595
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51c387a7-23ea-462f-bd5f-08de9f247b08
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000A672E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR08MB8613
X-purgate-ID: tlsNG-c1860d/1776720825-C3D7BDB1-4353C520/0/0
X-purgate-type: clean
X-purgate-size: 2107
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
	NEURAL_HAM(-0.00)[-0.225];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: AA6204342F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This commit makes altp2m_reset_altp2m non-static and adds a declaration to
the asm/altp2m.h header. This makes it possible to call this function in
common altp2m routines. The altp2m_reset_type enum (which is the type of
one of the parameters of altp2m_reset) is also moved to the asm/altp2m.h
header.

This is commit 1/2 of the altp2m_reset_altp2m phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.
---
 xen/arch/x86/include/asm/altp2m.h | 8 ++++++++
 xen/arch/x86/mm/altp2m.c          | 9 ++-------
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/include/asm/altp2m.h b/xen/arch/x86/include/asm/altp2m.h
index e7239326c71d..02b5e1a11220 100644
--- a/xen/arch/x86/include/asm/altp2m.h
+++ b/xen/arch/x86/include/asm/altp2m.h
@@ -92,6 +92,14 @@ int altp2m_init_next_available(struct domain *d, uint16_t *idx,
 /* Make a specific alternate p2m invalid */
 int altp2m_destroy_by_id(struct domain *d, unsigned int idx);
 
+/* Reset an altp2m view */
+enum altp2m_reset_type {
+    ALTP2M_RESET,
+    ALTP2M_DEACTIVATE
+};
+void altp2m_reset_altp2m(struct domain *d, unsigned int idx,
+                         enum altp2m_reset_type reset_type);
+
 /* Activate an altp2m view */
 int altp2m_activate_altp2m(struct domain *d, unsigned int idx,
                            p2m_access_t hvmmem_default_access);
diff --git a/xen/arch/x86/mm/altp2m.c b/xen/arch/x86/mm/altp2m.c
index edbaf54c3761..18f8a71f1682 100644
--- a/xen/arch/x86/mm/altp2m.c
+++ b/xen/arch/x86/mm/altp2m.c
@@ -228,13 +228,8 @@ bool altp2m_get_or_propagate(struct p2m_domain *ap2m, unsigned long gfn_l,
     return true;
 }
 
-enum altp2m_reset_type {
-    ALTP2M_RESET,
-    ALTP2M_DEACTIVATE
-};
-
-static void altp2m_reset_altp2m(struct domain *d, unsigned int idx,
-                                enum altp2m_reset_type reset_type)
+void altp2m_reset_altp2m(struct domain *d, unsigned int idx,
+                         enum altp2m_reset_type reset_type)
 {
     struct p2m_domain *p2m;
 
-- 
2.34.1


