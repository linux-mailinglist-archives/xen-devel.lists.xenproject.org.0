Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLobCGWa5mnCygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:28:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0062434080
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:28:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287497.1567938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEw9d-00025V-NF; Mon, 20 Apr 2026 21:27:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287497.1567938; Mon, 20 Apr 2026 21:27:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEw9d-000221-GI; Mon, 20 Apr 2026 21:27:41 +0000
Received: by outflank-mailman (input) for mailman id 1287497;
 Mon, 20 Apr 2026 21:27:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEw9a-0001ki-WF
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:27:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEw9a-009jup-D9
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:27:38 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e699b8-5cb7-0a2a0a5109dd-0a2a4501a8ec-40
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:27:38 +0200
Received: from [40.93.198.87]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69a48-c1f2-0a2a45010019-285dc657fa23-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:27:38 +0200
Received: from CYXPR03CA0033.namprd03.prod.outlook.com (2603:10b6:930:d2::10)
 by PH0PR08MB9861.namprd08.prod.outlook.com (2603:10b6:510:333::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:27:31 +0000
Received: from CY4PEPF0000EDD6.namprd03.prod.outlook.com
 (2603:10b6:930:d2:cafe::2d) by CYXPR03CA0033.outlook.office365.com
 (2603:10b6:930:d2::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:27:30 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 CY4PEPF0000EDD6.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:27:30 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzz8y1MtRz1wdR; 
 Mon, 20 Apr 2026 14:27:30 -0700 (PDT)
Received: from CH4PR07CU001.outbound.protection.outlook.com
 (mail-ch4pr07cu00104.outbound.protection.outlook.com [40.93.20.100])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:27:29 -0700 (PDT)
Received: from CH5PR05CA0017.namprd05.prod.outlook.com (2603:10b6:610:1f0::7)
 by BL4PR08MB10598.namprd08.prod.outlook.com (2603:10b6:208:591::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:27:26 +0000
Received: from CH2PEPF00000099.namprd02.prod.outlook.com
 (2603:10b6:610:1f0:cafe::c7) by CH5PR05CA0017.outlook.office365.com
 (2603:10b6:610:1f0::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:27:25 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 CH2PEPF00000099.mail.protection.outlook.com (10.167.244.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:27:25 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:27:21 +0200
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
 b=MXt+DkTE064C1EJ9Gd99C9A4x4KZ8Xr15whbS89sjXE1NDFDUjN6bTVAmZoYaFE8goYccAeNhLHBFwmY/fC3zgrV0MmgBvwSB6prwdsdnDPaS6RdyYMp3Y5F+L2f9E1XaYZZTIeoZmK61ONbWJ+DWKeH65m2nnS+6MJPn/+8o79wuybdkeYrTQSHr9WuUCmLV2dfD52bIEoT99wjQ79qsUNaOMd8ng2R3aI00qKDMeBdt/fx1rrBAMbJgkENe3TmvqXQm4B199uQdQjmNheEb46KytLuV+/ectoSkISQpdYS7eZyW19jMCMW4nk1rjQJMhqoFu2g2x5XzwdGSmbg5g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yIbI7Z0q3lXJU+nOYvRW36Lh6wKWhfwhF7qmIzuTXnQ=;
 b=EDeAPXGMnkKoLchdQwvasDjQUYWrwn+PYy56y8c05aXQbuQ4r9dKz6D3c5UIQs+gcJhPau0U8e6TrbeOcW2Mk/faeJBb7L+f85DGlw70+P/mWl2i7hocEVFFlzFIGr9YLLIJm8KIF4GDoXmMvXynLoWDTWrGwqBcWAJqtv5PFdEVHLWdpd0gKH+earet4MCKShZGGchTuTIjy44dKIG6IyFoUvbzOoL7jurNBsQhaCVgdhU681N6UH9o/JrCiV2xzXISVBT+lpzV8pxDLwifgdVDZFHn+ounecO7RFUExHvGIbeS+riX15r54ndOeCl0QsbPTyEeDtrg2GgJHtwgTQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.20.100) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yIbI7Z0q3lXJU+nOYvRW36Lh6wKWhfwhF7qmIzuTXnQ=;
 b=ab4jTs6bKH+CeLpBl4CEYtLc1JdhOiEVhSFGe3hBySKmdGOHp8231kY+JzTWhIQ4JtR67b+jBn3BGG+EpWZ4GDKBC+3mdKcmiAak+uCXHzNr1Br886FOv+8JlRrsPikA+IYnmSUSFinlOAl0bEirZUIeTeDTCHhhuiBrEVzk+UA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.20.100)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.20.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.20.100; helo=CH4PR07CU001.outbound.protection.outlook.com;
 pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G0RWTjbRDhjlxt9xFFxEEikIGUEzAU0XNbUHJy1+TQwkK9KltA8zhtTbsDc1DXlmv1zsZK6FhJBvPUXvRofrC+wOMepK2Dg3lRTUY4fslAc58PsWrefs7mQFCKjsbmidBksq8fpq7QuSwtxd9vqbJvLGs5tsE8BmXaqXNc4taexviU4j/h6K12EvpiSnAA0BDJlqYZQTlk6eg6N+1MaLbMuh6D/fO4o+5KugUk4o8BUDvCENXkOpII6EfSZsor/bUL8YLZLA+cZEaafOWBMxpxgV9ElW8EO9TFGjONIYIQlV4B5L+h0JY5BsuRTcCQt1vEncPtmuJVjCcZhWki5H+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yIbI7Z0q3lXJU+nOYvRW36Lh6wKWhfwhF7qmIzuTXnQ=;
 b=msBeSfZVvAUw/prWOtedLZPadEuHEV/+79q0N6klBKWeMNS15g7j4Aq19ByzPgSEx49lwiB83wb5WpmfvcKY2P2pBVQ8UZpYVyhx4hVPYPbnJwgZHW6mMafHbhdgAFt76LS1ukQWNgIozL2FPbvaoZtaFXlEfZch4fZ9BU8biIIlH1UojPuar3ffJbItXasAt32BLrUrN62oJaJ7t8tBC+Yxiok7wMZNlwdbdQFqWCGecEweXPPv12Y8fFbk0jR4gM2Ap7Y5HaR+j/qAKFx5/HuO3HD+VxK+q8zH3Tbpu1hYUrtwVaFoeFdyZ8Z9c5dyoLQwOoWDrPKktBqjQdQbCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yIbI7Z0q3lXJU+nOYvRW36Lh6wKWhfwhF7qmIzuTXnQ=;
 b=ab4jTs6bKH+CeLpBl4CEYtLc1JdhOiEVhSFGe3hBySKmdGOHp8231kY+JzTWhIQ4JtR67b+jBn3BGG+EpWZ4GDKBC+3mdKcmiAak+uCXHzNr1Br886FOv+8JlRrsPikA+IYnmSUSFinlOAl0bEirZUIeTeDTCHhhuiBrEVzk+UA=
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
Subject: [RFC PATCH v6 16/43] arm/p2m: Cosmetic fix - substitute _gfn(ULONG_MAX) for INVALID_GFN
Date: Mon, 20 Apr 2026 17:26:21 -0400
Message-ID: <20260420212648.208640-9-Rose.Spangler@elektrobit.com>
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
	CH2PEPF00000099:EE_|BL4PR08MB10598:EE_|CY4PEPF0000EDD6:EE_|PH0PR08MB9861:EE_
X-MS-Office365-Filtering-Correlation-Id: 325ae214-868e-43c3-f237-08de9f23a110
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?l9ox6rGeTdQkeFWB3PQyHIWdzbSEQv43pr6ljcoCfuUMamZdB9zBLxAO5F47?=
 =?us-ascii?Q?og2Pa3MeuT6Fq7nuVujMpjEPN8UKRHj/uzu3XWwK1uNgZ2XEmuTr9HXpCVs8?=
 =?us-ascii?Q?vEFBK3gYoHZrR+sfHkV4wzK4TLkPcq/FIfXl0h77ilD5fdwlxeTY9LI+pRjB?=
 =?us-ascii?Q?hgG5sUpKzJuNQzXm17YWQ24AcFKgtZr1qKmx5xvihUsZ/+EIVfrFePpN62FI?=
 =?us-ascii?Q?M7Z+37DTmRxT0jgbX6nrgaELwvA9a1ntqUn8Tzqo3j3TAkQlgTRravwBAdtY?=
 =?us-ascii?Q?fjloUecNaDBpc83b22Mtr0ieku2SGjEco0BwyPRTJnA0ZlAiesO62T7KasTk?=
 =?us-ascii?Q?IWgyoAIL0LSNHE6fLTCZwlL6uKFiWucaWI8fzzENd8K7jucVIjlmF/xZ8LMZ?=
 =?us-ascii?Q?LJ4Zz8Dq4wKLOYGAZhtD8tNPisHOJnt/S2NzaxR7fQK2LxSeqqioqeo1lXP8?=
 =?us-ascii?Q?IlPHTGwk2LygVM0VPL6807qptdQ4IevZNf3oH0H36rjKMc8pUogdJrjlXVE3?=
 =?us-ascii?Q?9o8B4kUTF9L356CQBRISEuxYGAU0xPZUUAGFVx0ED3XAA6kAA/SPtKC/WXwC?=
 =?us-ascii?Q?L33jLWBV79J5QNpaRf0fPfU79PhIFBt0sQukNhRwHPz7sBVgqOsV2IW0XTPO?=
 =?us-ascii?Q?F/nWeTf5aROxa73DGPsuYbLSXAZ8w+qqIic5cUJEzRlux8WAika5nTDgYjhR?=
 =?us-ascii?Q?FGLZt/8mDjvNsuiBCTkp/pkkW/Hmh6Pu5xKtSCZwg8U1N0Oc0yLXa9itdkyS?=
 =?us-ascii?Q?iH06w5BkUP4RxSlbUCx+Ocw8WqZVua3T7MPY5SMleqo7V+bewo3jk9eYH1LW?=
 =?us-ascii?Q?Pkb6j1TjjJzwRFMsirq1CyhySz5jrbgwRd2Rg82kgsKw9fQ66iWhds4dBaYD?=
 =?us-ascii?Q?c2fPde6HZ3Oomoes2Xg2i0zJUcFBq6lw00T8H4p5Gid0Wyh/mzgCpHyvEkB0?=
 =?us-ascii?Q?bGz479aCOeTyMfrmwkH5O3tZBueSJ4cnPBDkFFVVW0J3sYQIJTvwuU+txSsU?=
 =?us-ascii?Q?PuZ8H0xmzFX6pFMQIGdPkLwnyD0dBUw3AtH0e0Ml6ysaAD5TeMpKal5KsyCH?=
 =?us-ascii?Q?0qzrKNi8ozCkTRDTCT3vGpcxPYh+PtD7fumVvmxrYstyd638VkbdSNnsT8Fn?=
 =?us-ascii?Q?QSgWRSW55h2RIgheMB6zNms7aeYJ8hXkE9WRED1znFLFtQZLWOFEXseSRrqh?=
 =?us-ascii?Q?llsu6SHNso70ck3aZiPffmTT8apZ9NESJH0AFHDY5eeuRTdeyr1qlB1V131E?=
 =?us-ascii?Q?ZdlGB+5dxa/KdbhEtGhb?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 nxb3aPT42He1WIh5FoIf1xSh/ScNQ6QHEJeTw4BobFuUIbQUUxtH8gUL++tRvLWW+pk4XQsf5Tt283aCUMcgAT7zCVniTIvSdbgB9fSn49/ybuXLPZHDH8AVgvhyM2HGKBhUFafhRaNbDdF8+v5CKvHV2wVLqYJFkgSoHAARKjZC5dPgpjbQbAsZThBX+1SgXBkXD9Y4GTNMX3Wn4NBze47HWmVPdWDGFH/I4kg9fzTKFfJIGDFiLVvJfMm+xKjcmsPfZ/qbqld2MnQuJeeCmvR6Ggf0GrWHIMtcN4+YLMaM5TwOEtrEqHW3w1r6Stx/NS6AA+1jrPRtj55cw4WzhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR08MB10598
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.20.100];domain=CH4PR07CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.20.100];domain=CH4PR07CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 CY4PEPF0000EDD6.namprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	abae5b14-50e9-4750-96a6-08de9f239e25
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|35042699022|156008|36860700016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Dtu1G1ibHWhnmG/loE9H9CrSCrej8CGC3xulJwmIW5BhtUg3tbM2cDrNHdVg?=
 =?us-ascii?Q?ds9ybjM19ixfCfBjEFcYSQeZ/aItSl0hBZrBR79F54C4DeAIxishIigtIJq+?=
 =?us-ascii?Q?+97y+rfsSBHt9IFhqloZoXPIqOpPsdXpoJSG3EqlO17XvAaAJ4qEDqYtPXtH?=
 =?us-ascii?Q?D8TfkcI/ESi8d8dgWraple5EdSyKVbr6ZlWwy2tIdekGLoARkOX45HA4YZjA?=
 =?us-ascii?Q?Ax/ZevteD5giRHyi4wQJHyuwKpwdSnyicmklNjkJyL/vIYkW4GnOHigAipHM?=
 =?us-ascii?Q?2SEBxp+8vSAmoLg+4ouTtFotBXyUh+LiJcRaT1Z5VzifuOtshDBrq9wU1rjy?=
 =?us-ascii?Q?gTXCsViorYMC5VAdgN+voPFtTUTDBw6FRnSJ0b8Utoneap96SHtfV83X8HB0?=
 =?us-ascii?Q?AHhi0bY0p9DCHmY5FYPKMprWHz+8kSJd/CPNu+wWGW6Ye5i82msVU7elai1V?=
 =?us-ascii?Q?CyQxMxiIyQeO2PSsYlxtYnjKJUwlMXWuhhmbu5cIDnmtEw8vHzCTmrqtUXmL?=
 =?us-ascii?Q?hOtN8J+Qx3LJTLoswkFDNUHfDa2QAAPz115ACHwetid0x9Bn44nzWgG8UCKc?=
 =?us-ascii?Q?ewRL+07RwAyQ6jCBzNxdmn7NquHWHT6/iJRsrIujAMIXrlwSsW9nN+iTASJb?=
 =?us-ascii?Q?xvlr4oJNliUw8iYYEE+NzaQv9uAHsUSwoFKn37XZ7foHeBU+Drs1yHXaYiV7?=
 =?us-ascii?Q?pA1u60euXJDIQLMF1L8KzgORV5vsR7eA0uXRHHeApfS0wIBy3sscIpVw+pHy?=
 =?us-ascii?Q?oNeteZZ3nJErafOY27eLH7yNex98p3+mvu2fAThB+WIc5mCsUjGd7SImRUsu?=
 =?us-ascii?Q?myYfL72bWiA9wBdsVbDsaXgVLC3j5Ck5Nd1xb9WBIy54YnLRBekUorgkuJXz?=
 =?us-ascii?Q?14sr5V4jnj7uQpO3iYFNzxIyyRM/t7S6xayUXHfmXpvz2n2GQ0KuZJj4+JKC?=
 =?us-ascii?Q?g+I8WeoFIPKEQw9Eq+rJX+cJqm0JuIz+dvmQk8lqn/Y/CRlzxkhBT8uMRM1k?=
 =?us-ascii?Q?XZ/QSDDVOed6AUkjPwWrTenC2buPSr2vAoPU84hDTUOdsIh5hNoLRAnDS7Bx?=
 =?us-ascii?Q?qeuE5vsof4E9Wb51cvOS6GFSZV9mTeDO/HRx/uwnhAjKLaLEMnOKw+CIGSOS?=
 =?us-ascii?Q?vMBaRdcHsLgj7NvIBrEH1ELtMpInrAN9yXMp0Xw6I5SWOA4e73Dpzm3NSxTr?=
 =?us-ascii?Q?OcXawdyx8ARlyZLjL4y8dqr7203M4zYK1gqFyWu+RKl14I6FXOP6B4HsYPXq?=
 =?us-ascii?Q?r1hoRqP5Wduj+d7XU2Ol?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH4PR07CU001.outbound.protection.outlook.com;PTR:mail-ch4pr07cu00104.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(35042699022)(156008)(36860700016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	u+CJe+WNqqT5WxTzlNIvjK0f8D8w+0o/r32CIycAdJUhMPPErv6qHGVhCmhfHFDEJ+qlLlhIzRHWuB/Fx+3IINOtOcbzEfV03AR7l+F4Bp3iPxLlXRCwFl/mZHCzCZaUnUUMJTs5HHwfm8eSsegxhnuN5VWb7gJ/ywkdKfKYepz8rYpA537OOGAbndJOiHoA+yQuyNU1VawGKGgo+1DCuZpFBpRL74cjerrvPrVmvmG+GRTeeGZ2t27vwxVqNFyKmimdVbnvwotwNFRMUaCoWBDVOHI2fZ2+vc5G6jQ2k+yixZeDoEObEYm4SoWDr+Zk6V8F2xCKqBCANwhwR1u80FrMqqu9Fr0AMNvNo6PLz5L+6/nahYxVWNjr3LEvbC5A+KJtghmqK1fVOc9LwTG44rTwELVKlQDUtZzxN5nPDVUeoliijmrnGr21wFIBT3wJ
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:27:30.5226
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 325ae214-868e-43c3-f237-08de9f23a110
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000EDD6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR08MB9861
X-purgate-ID: tlsNG-d62444/1776720458-B4A11FF4-6ADA3E45/0/0
X-purgate-type: clean
X-purgate-size: 999
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:proskurin@sec.in.tum.de,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[elektrobit.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[17];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.355];
	TAGGED_RCPT(0.00)[xen-devel];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tum.de:email]
X-Rspamd-Queue-Id: B0062434080
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Sergej Proskurin <proskurin@sec.in.tum.de>

In ./xen/arch/arm/p2m.c, we compare the gfn's with INVALID_GFN
throughout the code. Thus it makes sense to use the macro INVALID_GFN
instead of a hard coded value to initialize "p2m->lowest_mapped_gfn".

This is commit 5/12 of the altp2m_init/altp2m_teardown routines phase.

Signed-off-by: Sergej Proskurin <proskurin@sec.in.tum.de>
---
 xen/arch/arm/mmu/p2m.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index 3ecb969a0369..1009f10e5db4 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -1517,7 +1517,7 @@ static int p2m_initialise(struct domain *d, struct p2m_domain *p2m)
 
     p2m->vmid = INVALID_VMID;
     p2m->max_mapped_gfn = _gfn(0);
-    p2m->lowest_mapped_gfn = _gfn(ULONG_MAX);
+    p2m->lowest_mapped_gfn = INVALID_GFN;
 
     p2m->default_access = p2m_access_rwx;
     p2m->mem_access_enabled = false;
-- 
2.34.1


