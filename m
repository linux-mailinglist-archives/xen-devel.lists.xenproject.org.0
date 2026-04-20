Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDidAsKb5ml8ywEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A984342B2
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287892.1568329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwFT-0007f6-4N; Mon, 20 Apr 2026 21:33:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287892.1568329; Mon, 20 Apr 2026 21:33:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwFR-0007NN-U2; Mon, 20 Apr 2026 21:33:41 +0000
Received: by outflank-mailman (input) for mailman id 1287892;
 Mon, 20 Apr 2026 21:33:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEwFN-0006jh-8m
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:33:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEwFM-0054Hn-LV
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:33:36 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b93-5cb7-0a2a0a5109dd-0a2a4504dc78-34
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:36 +0200
Received: from [52.101.62.80]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69baf-1dec-0a2a45040019-34653e5036d1-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:36 +0200
Received: from CH2PR16CA0011.namprd16.prod.outlook.com (2603:10b6:610:50::21)
 by BY3PR08MB7169.namprd08.prod.outlook.com (2603:10b6:a03:36a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Mon, 20 Apr
 2026 21:33:31 +0000
Received: from CH2PEPF00000141.namprd02.prod.outlook.com
 (2603:10b6:610:50:cafe::9e) by CH2PR16CA0011.outlook.office365.com
 (2603:10b6:610:50::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:30 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 CH2PEPF00000141.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:33:30 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzzHs4LnLz1wdN; 
 Mon, 20 Apr 2026 14:33:29 -0700 (PDT)
Received: from DM5PR08CU004.outbound.protection.outlook.com
 (mail-dm5pr08cu00405.outbound.protection.outlook.com [40.93.13.101])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:33:29 -0700 (PDT)
Received: from BY1P220CA0022.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::14)
 by CYXPR08MB9478.namprd08.prod.outlook.com (2603:10b6:930:e0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Mon, 20 Apr
 2026 21:33:21 +0000
Received: from SJ1PEPF000026C9.namprd04.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::f1) by BY1P220CA0022.outlook.office365.com
 (2603:10b6:a03:5c3::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:21 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 SJ1PEPF000026C9.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:33:20 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:33:18 +0200
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
 b=VZ/IFfy3AVMQT5J69G8IdO3rqcWYtkW5osvNRNE9n6nSSeDsJ3uXiZ6cm6YQ6uxERBxYYKUNNdVHRq21sU7e5ziVxTvGtDkCQLQ5yopliRYtw0v1U/t1bUGUFFxXS6gkETvGbYEY2+bGpSwzbF415dvHzAfwaJR5ivyTThs+1rgcqcDW1BHTE9/FnB9OVoeP699yG6gocUb9KecOlQBVDUndYN2o9Rk/ip+W04+hdfMWRnXBgo6W7Cbwma+X4i1BOW6SxmnTe1CSTLlZRqYphgF/+wwIzVCvJXN2WcYLyekON3zBQvXKWxrg+0+AESaq4rjn0Lw11sJEYWoV3mylRw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u057BdoXIkdDPBzf9f3VOEcMsy8wtSGiXp7V2fStTSo=;
 b=kn4B0U8snqaHA+dlRIERnHp2Rn4mvgd20XFU9Ge6MbtQmJueqU5wEJHYRjXSUAuMbsUWelpdepjSlMaqKSMUcvviePzDGkJW3a4V7ckCeThCm+nPYHK508kg8Bz3zNi0rscSbzRmI8key4qCCVTHKgS7TsqGCtvCL8LSPVeA+zqNhxkJo2f7zNsBZNT84L09TY6VEAB2YLAcFXtXVJcv9lzuFkVnWQG8X8fFwIZvLR1/OtWz8mdq3cqOxEe/mPsQE8PjHs0gdbB+JRnVJdgMEACB51O6Y3OYuWcLCJk08R1OVjZux3v+L5EiK3cy4yhOoARlczlb6EhISFvPht9Pwg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.13.101) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u057BdoXIkdDPBzf9f3VOEcMsy8wtSGiXp7V2fStTSo=;
 b=RdVdzd9ONJCqBkuM6lbUiy8AF3RSe7p5Pld2nmwqJKxT12uEf/xI5/YHZTelOTa93htIpRXRJAzts6MlpuI58T8Dth2WZR/X7KQIlBsbWOfffZOtYNa8bXuNniyBvz/Kx8On3ziOiUgb77yY9tPnAjD0yVD7NpwHutCWgeRJhSk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.13.101)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.13.101 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.13.101; helo=DM5PR08CU004.outbound.protection.outlook.com;
 pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZdL0n1c4jXKWI/a1Li9ufiu4B+MKjzXoO2rHUbuR0itwPIN19N6wwK9CMEUnK2sff8KnEIs7FncRZnpOnJ1hKt7LtkwWnkAKR5eYvkwnFBmcvOdgtXikEFmnMWXqgsU4KDSDciM4EYS3EQzqimAVOgQSgy808z8ghcJ9p9TCicLqQatEleEch5bKULaZdfLBZKIgX7vyNhgr3L36wXJCUD99Dt+kwOYnJr9p9WbOpLLKlXXA24gSyZRMNyBxNCQ56k94R1FGNU+F/i/qAXVat26DTyrP1WTcGF/jV1ykmVm9ItT9tzlnI3oRz0LtRzGfrwBKQEL1t3FfUpfThR9LNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u057BdoXIkdDPBzf9f3VOEcMsy8wtSGiXp7V2fStTSo=;
 b=cewLUSbQqc232dKEHvYMmbwSSacMDEeCCSjMo7ulCkRPs828RWJg+PdhjFZpZ/KiKSDDR+bGjXPH1d2xpgllTODsVT9IHmybldPfTvgX/SQg+EYux7Z5fRgIX+2pv7f/jubXpr/Hq8sV5chS6H2eIG+ej5K+SVV2SHDMnn9Nj/FFlTw+WIy7S0yYUO1pDIcztOTvE3oECt6O4BsagTqrRF8YO6g4VBpr7ov4BAwPbH88JI0Iw/0lBUsR64rBnL84No57SLtKS15C40elmcpL3HJnLQUsSz3StVKZLMwQjVahmqJgi0lMK12w+vaNUj8/oXZO6KqRqQVqfEKy0tB6ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u057BdoXIkdDPBzf9f3VOEcMsy8wtSGiXp7V2fStTSo=;
 b=RdVdzd9ONJCqBkuM6lbUiy8AF3RSe7p5Pld2nmwqJKxT12uEf/xI5/YHZTelOTa93htIpRXRJAzts6MlpuI58T8Dth2WZR/X7KQIlBsbWOfffZOtYNa8bXuNniyBvz/Kx8On3ziOiUgb77yY9tPnAjD0yVD7NpwHutCWgeRJhSk=
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
Subject: [RFC PATCH v6 33/43] arm/altp2m: Add altp2m_set_view_visibility{,_locked} support
Date: Mon, 20 Apr 2026 17:31:56 -0400
Message-ID: <20260420213206.208750-34-Rose.Spangler@elektrobit.com>
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
	SJ1PEPF000026C9:EE_|CYXPR08MB9478:EE_|CH2PEPF00000141:EE_|BY3PR08MB7169:EE_
X-MS-Office365-Filtering-Correlation-Id: 15c18219-52ba-4382-286c-08de9f24778d
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?uO31j7QrqPDesW1KwpMvauoMy2lKh1DCAR+b3l490bJvyWZ0Kyw99OeZL4Ao?=
 =?us-ascii?Q?vAHAbpSsk0rLfH74xQG4RyEHyxpbKcjdZWQ0SZ7S3yl/ao5gajeJ0XZ/cTew?=
 =?us-ascii?Q?vxY+dpcDKjf6WURN/nrhJZHojQdBE9Bxzs88lwWRn2ghlTDRC0ESyqCmC5sq?=
 =?us-ascii?Q?dCzaADUw7/8j5NnDW3rstPQ+/9zpe//w/S4cMG8ew//b0wO3x0vjCCz4uSQT?=
 =?us-ascii?Q?As2V2nfyG59j6OWXGji8dQR27U736oN8J5TO77JMECiEBjkEFc4/qLJP+Ke7?=
 =?us-ascii?Q?ADCslzgsJhn8rxwfum/Rkw4m+az6Xz30srdJqWQnKhN5aKN7hzeC1y5kBkVL?=
 =?us-ascii?Q?rwHoR9G3pRhJiH+6iqLwWBPmLCFvZ334I6y9hvn5WaXBcWvchlUQws8/zs+c?=
 =?us-ascii?Q?f7FqjPSbB3UOr8JHSUB1NXFs9+XQeioGn5Q3vHgOncxA1cbM3nl1NVd38XBH?=
 =?us-ascii?Q?cHArM9a5Ftp9Lok4AU/92y2BCWglgaILLfvZn3Z6oBLAIa5X5ubvm2IAnzk1?=
 =?us-ascii?Q?W7GC+BacdtFJ6RqGG4+JccmY9IKOZ9K20i8ykgOEjHIOFoXfzElXwlHYlhJG?=
 =?us-ascii?Q?/Qve0/yP1yMQgtoQ4qVV6fYtk2fOctbZDs1emtqzYUjNNiZz8+uC1ZdDAexj?=
 =?us-ascii?Q?oWU9HjxoPKb+4ueNiZxuOV1rzcoiSkPZyOeD9I1FMPwCcM8CkUIbQLpcDTmI?=
 =?us-ascii?Q?t5CN2I7GZwpmBqUCnMHSJXykRv545xHPg+VWQHKWEnlA/B9csR0JV3yN8kqn?=
 =?us-ascii?Q?FtvFgGcoXGJyvmLIoaFVsVYaYn41NCmiPCSV1Go2UO3VZMDdQAf9za1UEXVa?=
 =?us-ascii?Q?z9E+arHi7MaYhIBwClKGtoLGSDUZPrjr+FuTwxgvVfm6jrQAJny3FXoqUiGT?=
 =?us-ascii?Q?vsmEgzoBd3wG9HCZuszfgUHUm6YXtmGzY8cnqmTqyr1zt46JtlJUjPa1TZMI?=
 =?us-ascii?Q?PwQbItzsDMbmgnQxyLPnVS45V2VtA5nskwgLJCbvnIK3PRFw+a6/4uQVAWzR?=
 =?us-ascii?Q?GPz9xBdTnXLeq+8Y6PP8cqr3yoxfvuiVkYYt6cIRbn31JjE9XVkL7pWwrGJ+?=
 =?us-ascii?Q?ZkNEaMUW1Gkk2HujqAMfL4UgbRaR6xbBWh2iFKxPUt5B0DncmV7AT2uLRJwY?=
 =?us-ascii?Q?ZDxmTSLwqGACzpZBkMsqxLRuxrRaMvCpGQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 FgoRnI25d4tgbef+TNYe9HLYFfswcY9aPshaLMb9lUfpeEo9CTWfKLicA6B7kxLRivBIftyHuGzSeyyjVmf4Qun9ETzcLtHVi681KbeD4Uu1AWC+/ou7IcpRQF1iN78wyIKGMEOlkS4kLsuFy3tZ0q/1Yz3qy4jSCrtigIkbJgbollRKzKLev8Yk5UmYE3EMwAAkL9pjF9n4In9OIC4u8cxYH1fiaZejv/e9Z0YXoVehGEArC4kcAC/1DCjHVq5JRdBN4liUuys4Q84LaoolcVkV8//SUDHwibjIH17aQSzi5zp0ZMiFaVJ3ovT+SbqD2thC/Z8K0W50gmCZ8pdbAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR08MB9478
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.13.101];domain=DM5PR08CU004.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.13.101];domain=DM5PR08CU004.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 CH2PEPF00000141.namprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	66a0528d-976b-449b-f959-08de9f2471df
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|35042699022|156008|36860700016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/T2NNud2DddsKUK+Wua63UEEP0ZC3PUmWnq+3tHK7t7l38SnctApjJklqndH?=
 =?us-ascii?Q?S8f8TEdrJQ1dlftBeIWkRolStgGgqHyqHF62TSt3g0b2KAgNZ7e0Du/cJ0nl?=
 =?us-ascii?Q?0bI4C/tUMhdN1S9092Gwue3UvQ1pboFUpfycOJTk313yuMAZF1uKqzWow7cc?=
 =?us-ascii?Q?VPF2s5UNywEfdVX7XOf/L9TXJooNB8iLG7pcRSDsscha8IRuTbMkRKW0XHMZ?=
 =?us-ascii?Q?oJFEx9sRr+L6efhV/TJzYPKUPtDCh4c1tVZ+3zd9DKwkULp4JGSKrxRhlKKC?=
 =?us-ascii?Q?xf3lQRO0zGkBs6B6GpEVIgsLayT5I4ZSZbiMgdJOhWBpbm/8XbaQrGL3WYkg?=
 =?us-ascii?Q?PajtcNlJdXj6WWcxffQirFyaIcsHQ0mg8VeZJfpoXgiiRaSpOmk2Hq0Ny/ap?=
 =?us-ascii?Q?KCrbO2B0jQnnumA1c2SouWMMp8WLcoMDyFBUeh4hzzORUwX1OYshamfPqA84?=
 =?us-ascii?Q?dXJnGiM0AosOd2C5v5fzT2txbxlfykISVcYM2S6XB2sZdvadFZ9FA0Aj7F90?=
 =?us-ascii?Q?hV4+QcEDAL2zm68eLknyOHJGQYy0hcSvMHvlDKdwq2IvZlRWWxXzeqPpqyCy?=
 =?us-ascii?Q?MVkALxOOhV2gTZqHfjscgxVtwPJvFJFvbwAfArvrGZVIyZngKBOUpQY0IGZx?=
 =?us-ascii?Q?HJCVqV5ReTkSGPBR5w69ga0UD2oQzaFvvQUCsD0N7Zj7ZtMWBjvhStdqAQdJ?=
 =?us-ascii?Q?+pdESLEC0YBzp8C5h7oYPycdLI8gMZBaypkD7e0eOLX+bB6bD5HvASTGJRT+?=
 =?us-ascii?Q?A/eZxos/JYeXaUYWCS/xEMNYAPICzzH84PloEbfpQlU2j6ShkNOa24v9OBUM?=
 =?us-ascii?Q?C/OCc16zqyY3KaPBSNd1Fp/BW+zpDtrN/kfuSSK29rsa61OCx9rP9xE/UGvD?=
 =?us-ascii?Q?YbhtjkZjsH65augK/oTi+pGpreryDyk4B6+zegpryCDtlpZxEXj0t9MycWiP?=
 =?us-ascii?Q?sCQ+2se7HB9TdUbSAsZae7sfLujzu63PDxC9GcragK8JyZrnd+JoU0d7wNYK?=
 =?us-ascii?Q?pU5LLoPJP7vfGrlJSEG8LRC0wOtP9HScjz1KDvBlZfq8mJ125V2EUmQFgG68?=
 =?us-ascii?Q?Ju+qA4uzJVASk7o7XXcohLOYjPPFBE1blIz3pXQEk5V3rXtarxcIIv0sbpJi?=
 =?us-ascii?Q?8jlcXNAGuDh2LQjbjIDfyHsBY0NiLS29Jw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR08CU004.outbound.protection.outlook.com;PTR:mail-dm5pr08cu00405.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(35042699022)(156008)(36860700016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/jAHSWtmgzWwbxa79b/cFx4AN141F195DYsXHOt5Jx71bEA2LSytGJes56RkjaqVe7Pko6Y1uJk6pYZDlmbxtpprU8vufGk8/tDsee7m+ItX6k9NuE3O5d/HAPb2yGBtaikWaiGjRDFyKeWoLsSYHadkmSTs3tNo5lRsXH9qJt8jySwWk7w4MEb513yaOT2Of1SntUETimsWjJvbpWc3amuhVCmSNjFcVWvLkG5OZPlFiyhwdkI+FSMeWYhlujyxiz44snv9MdOq9mHTQWsvisTDzlrm3YKmBhmjuBUwBgQzeliWhw14q3w4qgoIcimoqIf2X0aDYjyR5zHXsYZKGq0UZqENZjRUv5QvUrXfMr4l7PKTC3BAB7KKjBz+PhhHE0VsMk2Q9cT8p7kISz9jkrbFzIDRu2gvcXRGeKwGYCroRSRedkgdsTREgLJBEkse
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:33:30.3131
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15c18219-52ba-4382-286c-08de9f24778d
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF00000141.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR08MB7169
X-purgate-ID: tlsNG-ebf023/1776720816-31C4F3FF-D5594AB2/0/0
X-purgate-type: clean
X-purgate-size: 2531
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
	NEURAL_HAM(-0.00)[-0.160];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 83A984342B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This commit adds the altp2m_set_view_visibility and
altp2m_set_view_visibility_locked functions on ARM. This makes it possible
to set the altp2m view visibility in common altp2m routines (namely,
altp2m_flush).

This is commit 4/5 of the altp2m view validity/visibility phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.
---
 xen/arch/arm/altp2m.c             | 30 ++++++++++++++++++++++++++++++
 xen/arch/arm/include/asm/altp2m.h |  8 ++++++++
 2 files changed, 38 insertions(+)

diff --git a/xen/arch/arm/altp2m.c b/xen/arch/arm/altp2m.c
index 0e19e197e826..aa48c17e11a3 100644
--- a/xen/arch/arm/altp2m.c
+++ b/xen/arch/arm/altp2m.c
@@ -37,6 +37,36 @@ bool altp2m_view_is_visible(struct domain *d, unsigned int idx)
     return d->arch.altp2m_state[array_index_nospec(idx, d->nr_altp2m)] == ALTP2M_VISIBLE;
 }
 
+int altp2m_set_view_visibility(struct domain *d, unsigned int altp2m_idx,
+                               uint8_t visible)
+{
+    int rc;
+
+    altp2m_lock(d);
+    rc = altp2m_set_view_visibility_locked(d, altp2m_idx, visible);
+    altp2m_unlock(d);
+
+    return rc;
+}
+
+int altp2m_set_view_visibility_locked(struct domain *d, unsigned int altp2m_idx,
+                                      uint8_t visible)
+{
+    int rc = 0;
+
+    if ( altp2m_idx >= d->nr_altp2m || !altp2m_view_is_valid(d, altp2m_idx) )
+        rc = -EINVAL;
+    else if ( visible )
+        d->arch.altp2m_state[array_index_nospec(altp2m_idx, d->nr_altp2m)] =
+            ALTP2M_VISIBLE;
+    else
+        d->arch.altp2m_state[array_index_nospec(altp2m_idx, d->nr_altp2m)] =
+            ALTP2M_INVISIBLE;
+
+    return rc;
+}
+
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/altp2m.h b/xen/arch/arm/include/asm/altp2m.h
index fbe66ad5536d..f8d0dd799a4a 100644
--- a/xen/arch/arm/include/asm/altp2m.h
+++ b/xen/arch/arm/include/asm/altp2m.h
@@ -40,6 +40,14 @@ enum altp2m_view_state {
     ALTP2M_INVISIBLE,
 };
 
+/* Set a specific p2m view visibility */
+int altp2m_set_view_visibility(struct domain *d, unsigned int altp2m_idx,
+                               uint8_t visible);
+
+/* Set a specific p2m view visibility (with lock already held) */
+int altp2m_set_view_visibility_locked(struct domain *d, unsigned int altp2m_idx,
+                                      uint8_t visible);
+
 #else /* CONFIG_ALTP2M */
 
 static inline bool altp2m_supported(void)
-- 
2.34.1


