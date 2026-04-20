Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMO2Oqib5mnCygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC77434254
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287808.1568239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwF6-0003AA-0l; Mon, 20 Apr 2026 21:33:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287808.1568239; Mon, 20 Apr 2026 21:33:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwF5-00030o-IQ; Mon, 20 Apr 2026 21:33:19 +0000
Received: by outflank-mailman (input) for mailman id 1287808;
 Mon, 20 Apr 2026 21:33:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEwF2-0002YZ-T8
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:33:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEwF2-00CD6F-9X
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:33:16 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b8e-2eae-0a2a0a5409dd-0a2a45028f2e-12
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:16 +0200
Received: from [52.101.193.103]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b9a-af86-0a2a45020019-3465c167f58a-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:16 +0200
Received: from CH2PR16CA0009.namprd16.prod.outlook.com (2603:10b6:610:50::19)
 by SJ0PR08MB6541.namprd08.prod.outlook.com (2603:10b6:a03:2d4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.31; Mon, 20 Apr
 2026 21:33:11 +0000
Received: from CH2PEPF00000141.namprd02.prod.outlook.com
 (2603:10b6:610:50:cafe::97) by CH2PR16CA0009.outlook.office365.com
 (2603:10b6:610:50::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:11 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 CH2PEPF00000141.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:33:10 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzzHV173pz1wdM; 
 Mon, 20 Apr 2026 14:33:10 -0700 (PDT)
Received: from SJ0PR08CU001.outbound.protection.outlook.com
 (mail-sj0pr08cu00106.outbound.protection.outlook.com [40.93.1.78])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:33:09 -0700 (PDT)
Received: from BY1P220CA0041.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59e::13)
 by SA2PR08MB6636.namprd08.prod.outlook.com (2603:10b6:806:117::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Mon, 20 Apr
 2026 21:33:05 +0000
Received: from SJ1PEPF000026C8.namprd04.prod.outlook.com
 (2603:10b6:a03:59e:cafe::bf) by BY1P220CA0041.outlook.office365.com
 (2603:10b6:a03:59e::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:04 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 SJ1PEPF000026C8.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:33:04 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:32:59 +0200
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
 b=cgwoN8Tg3wUIWSINg0VhM7x1RpaoYgeQieY/FEADdO4YstX8uGamwQG0RhkYtxUZawrgoQk/+2HQ1uNrauP1qK1GeUrHMbKBcIe18xkW0YjQ6Ax0X8HYdjqOExOu+frwIOhcJNk/ihLd05JZM2JE9WNf8B/Sc1KbXZ3hKmzacLTFHv/Eew/YUqey66/1ME6IBqFvYkItp32lW3RghxvIQ/ljioUWMfVkAz1iQ+BkZx/OdxCPsvhI0QyPj8rftFqDBTUPJjWDhwVRmih5YuzHWR7/b+QEkRNdp6GTHexSeRvYfNbs4CvqRb9kqOaRM/RHmm+zmoTZp01YaUn0RD2mhA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JXO5psDHXrr2lWhpVfZGIS9NlsT4Gk+n8+O5j94oxLM=;
 b=ydpv2oTCLuTMyRUxeqVO6iUKbz++DJRyfnePpaFUkhUt89ysMsIvSJLsrd12Mt8kCdEVV5psZ7PY0T4UXLX632FeTzyqWAUJyMTrVx7oc7ujWoa37rdzqQS6vo9HRG0gH4SKL6xSItqeBXraY6DgSOmGxKM6sEDVzZjoDDcWQfyxdD1et+4G9LXDTiHBxEHLLzMkcKrXkaIw9H+Yi2P1RCKBuUhpFVIzyv7RQinYqnahgzJrv8Tp47ea7FmSwBbEIMTwoQpvBwVYz6hlpSK8WRKkNk+xybNE6tKb2DVTDcG8DKjzMNNNr6sJE37dR19HPMH9qs/ljmU38+/TlpW/xg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.1.78) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXO5psDHXrr2lWhpVfZGIS9NlsT4Gk+n8+O5j94oxLM=;
 b=Xz18lriGP71qwg6B+PXBlYbSHSFe3eQw+vVN6FyY/T8GddY15PB2IdEmRUtumwI8mN8ZE0kmGar4b5y5jloPEEkKVRQWloTrYKLDA0e/Buyk9WafgZCaI4x2bQ/EwSbNtzbEmYXgD01or4CcH3MbPrRmKsIVGsPWMjmg5nVoh5g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.1.78)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.1.78 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.1.78; helo=SJ0PR08CU001.outbound.protection.outlook.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EyTwRyCbfyqSEktAEResMYyw/Si+idXUGjf0qIlXhx9i6ZM4j6GumJ0hdWoR3baeDHgrDJeL95qdFPtHO3/DUzU/IAwRBaPq0AoDGresgohtk1+rjlzZKT+ioWEAuTjbKbur/kq/IZG4ml+91A0OI9O56BjwzGBMHjRUpEOt0ZSsQYZwypT9Wdx81IFL6AoIWjeK9s4mgf4WCGbi9+4Ukm+uYr6pS6CK04+5Nbjan/e6fG87jQVtcIMWXZfF4Mprduj0fcsYCt9Bkr74e+Ms0/zFw2A/OIYXxUY/3rbRrRdV8GO3HJwQTBECfmAiGE35wyu3N2RaXMRalJKEumv8eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JXO5psDHXrr2lWhpVfZGIS9NlsT4Gk+n8+O5j94oxLM=;
 b=XbVHF/1t89PPV7s/f13APAFMVD26cPjHnKdY2FXag08u1VL8k0GkImXkkZxsruadFT4qMh82oXf/CXyhBS3Dbjwf8W8IiTyKtL5P9DVhNJ+CO9buelJ0i58lr7Sy1muiiUEwXL+3jCQIC18upR/yiggoFdLonl2ie+fwox22+4ppSFCK0etWHY5/kqhwz+AYw8FH/FkgzIDTKV2SNZwFZkH9RYtSEcBc1lApPsa4yNyRg+Mt4+Dz4nAuaZ9k9nQT2uvJUU1jKsjtg2HI5hGhUMEy7AS/JjZHmgG12Gndty1bL6/n00mKmeSI8z+xk2GVaBYmN7xOm1sbvKpiWUTkMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXO5psDHXrr2lWhpVfZGIS9NlsT4Gk+n8+O5j94oxLM=;
 b=Xz18lriGP71qwg6B+PXBlYbSHSFe3eQw+vVN6FyY/T8GddY15PB2IdEmRUtumwI8mN8ZE0kmGar4b5y5jloPEEkKVRQWloTrYKLDA0e/Buyk9WafgZCaI4x2bQ/EwSbNtzbEmYXgD01or4CcH3MbPrRmKsIVGsPWMjmg5nVoh5g=
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
Subject: [RFC PATCH v6 22/43] arm/p2m: Introduce p2m_is_{hostp2m,altp2m}
Date: Mon, 20 Apr 2026 17:31:45 -0400
Message-ID: <20260420213206.208750-23-Rose.Spangler@elektrobit.com>
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
	SJ1PEPF000026C8:EE_|SA2PR08MB6636:EE_|CH2PEPF00000141:EE_|SJ0PR08MB6541:EE_
X-MS-Office365-Filtering-Correlation-Id: a6ebd96d-aeb3-451e-35d2-08de9f246bf2
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|704161811799003|36860700016|1800799024|376014|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?za3NdQVRA7Efo0xB/d9YMo4DWECqOfNaz9zCRASgQqHFRseAlqvvnzif1Jgt?=
 =?us-ascii?Q?JUHRhJXD2CL/BftHu2AzA8nOCQR1eLtOpTUJPCijbrC1qTMlBjzDnLiaxv8Y?=
 =?us-ascii?Q?wZMYYzElfjDxlcGQhoe/8MghlGLPDijCy0DyJ/S58X2l3xcRv0tGk16ON2m6?=
 =?us-ascii?Q?TMWL/voxEpZKHp58fp/PDzzjmfUpfsw0aCu5xVqrGMLITRkR6r8Ajvn7PSuQ?=
 =?us-ascii?Q?vJ4ecm2fSCw/JjD5wbkDpraZlXQkv3u2fjdcyhc2gc2LqD4x+zaweqXb75Sm?=
 =?us-ascii?Q?DnAD09Q0saeAsdCjBsjpRo8MDqLbvGocX4O0nEDULpbGGmcUbToLuCnPuWU3?=
 =?us-ascii?Q?sWk17yqlCPslPUTjMD4ulWc8kxDhMaJrZd+M664rttOeXayppBsH/ifuxP7c?=
 =?us-ascii?Q?pTgUae9L4/gSSShaivohGkgUuGcn7ctEGd2VmNo36oGoQSoBdWegrOlrVzvY?=
 =?us-ascii?Q?3FY4kWmeUmZ5svC/kyJ6xM52OqpA6SlGTp3IABZB5P7O7a/gShpSJBnFp6ny?=
 =?us-ascii?Q?qji4DiqfH+YWBI3/v+MV1rAK/XbY1yuEXda4qW5O/hoinM1EUfPpeM95d1OD?=
 =?us-ascii?Q?9pPgguPZjl3SN+j/29vmsuyptpRk35LAe+lZm9QvzJPP7c9RULFfhW+kDOZF?=
 =?us-ascii?Q?yDAHnTg7LaNAJIO/xgRN5efOQV5vzt+FTnQoVqnDFzqEAdHHv9uiPMKCuu6Y?=
 =?us-ascii?Q?1CVsqMeRI9t3pqWh6J54cPIQVBLt3jCXG8sNoGq84dL6pn1jhNcz1sEpf+5B?=
 =?us-ascii?Q?STf3wBMUcBFgcQv9Bt8TIvggB2jubly2KaU2uEhLU6R3TKABtVz5lTM6hMIJ?=
 =?us-ascii?Q?hYo55JXFWIg2tlDakB+FVeDMGEbayhDj5Pko38HwvPw07WSo67QSyyIbGWXD?=
 =?us-ascii?Q?9WL6ZZVsyy5aLOZLpZPv9aPfvUiC+S3F7JR/eMnLjdbsrqoVjA+gvN1rFpr5?=
 =?us-ascii?Q?mEqJmdiqQyNGJIKB9c6XNFi9lsmve0s4HsP0pnSrGDvoefeiAhlV/vhuKPoy?=
 =?us-ascii?Q?bK6QsE1VcVb10XG8s7p8bo11Gmx9ULziyTcyei5mr8bhCX8688lTkchwhHEn?=
 =?us-ascii?Q?+YX59J8hdUvoDe/ZT0Ran1FFt63y9IQlTyDsdXuNnDcjeXjF2ZeLVDgAzMM/?=
 =?us-ascii?Q?TRBXCrEGKZOOli660PqyFJeHQnlY3mV076C57yP2nkT2XTm0/jFEvIDCwsGV?=
 =?us-ascii?Q?TkjCaHqX081DjOZ6?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(704161811799003)(36860700016)(1800799024)(376014)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 m77iLZgQGkoC6WIehslYUERslLXId42bcMZMHPJ/2EvwM3op8N2QQIJ56Yas2y1x2wDxgTYIIk7WbJ6jVU8n8FJznKE/PaX6bTkqKjA6buWynIUFCNbZF4p0SibDXseBBALYhwe8aMPv0yHtSBXTI4VQDqNOLR34yKOvUC6SNuLFq7ke1Gi+paTAUzzAI+tqyK3ws1hn0BGfEtseaFPD328y0r5RIJdLAoYC9baTvUvyC1l6T/6Ry/02W0St2raeUz3QAlVkt8t4k/bWiGh2MRF+e1CIs9OOEhJMzzX1QKzM/DlrNjot3KyPzFDVXhhHThUsgldlX6i4HJOjwWTb9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR08MB6636
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.1.78];domain=SJ0PR08CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.1.78];domain=SJ0PR08CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 CH2PEPF00000141.namprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dfe16a1b-b374-48a6-049b-08de9f246831
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|704161811799003|36860700016|376014|1800799024|82310400026|14060799003|35042699022|156008|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?L1z3KtL3NcefO0PgPb/96RxTZnpiQV7CGp8BLCRLGzN06jglsNOp9DKKxDL4?=
 =?us-ascii?Q?0qalGv6ve3KCILjeHsBcU7xQ3X5Y1uyljZSkQ5D9RKL06a2GwqHykU4sD4Cr?=
 =?us-ascii?Q?anltmAY05ApUIl6VD4c8adBeXge71cmd4V1wpV0TZFbWE4/jyMY+Nif37zSr?=
 =?us-ascii?Q?MbAyes746HKbtMozPWxOEvWI17pJliTcCXLpwLZJVW/V6ReZ7zpWZ+0Nh8Al?=
 =?us-ascii?Q?RL88tk+QETnbv4pF9JEPhYmEtpnrayXPgGjNyfxAmvoSnqsE+0w8FDmWuw0D?=
 =?us-ascii?Q?Mq+/a7PA5yvd0W4ZCzVZMLnICq/mK+/7cj42tQ3Yy9Zh9v5F/PNSn4xpe1OX?=
 =?us-ascii?Q?xjn3y7ZO8XGU+iZAEbqd/94mxFP37FMpDvyfaSHwVQlkoKQ8shXUvVI+60a1?=
 =?us-ascii?Q?dk3+g+sBOTJ/WIwlw1E/3gv7M55Gz84Yc3lE0Nfph+aGWiHK81XFswhSu0lG?=
 =?us-ascii?Q?XGisbZ9hKUNcajU+PdJYTXSLzu95rdL2Hocs5Tzhdjv1iJJgArDVFwcan9Zp?=
 =?us-ascii?Q?vncFlFrnoWPqUNjMEtOXkBb0VeMYv8tUWOcHpQdVB5K+/zHzD8Da05TyKGKM?=
 =?us-ascii?Q?MJQp22tMPtwWF8uxP4EtRsStCh8zdsb4VJw8p8HT2YVKdgoFTlhijHU8m5iR?=
 =?us-ascii?Q?3qvy6mCL4EhvlXO/cU4ko3rzt17dobj432JVOnEcEE97aYrrhi6zCQ4P7jYE?=
 =?us-ascii?Q?rv5tSJ39OGVGmOcnai5cL9VvvnY9Wz9eMp+1HgF6gwqBmJev9MOylPr05ZHT?=
 =?us-ascii?Q?f6PB1zTgkh1C4dmnQSBNlhS9Vy4ItShGcScDS06fLHm5ZZTossWPrxAQa73G?=
 =?us-ascii?Q?YfBb012lZ4YBy08bvG8QM5nurNDnPHORq84pgG5SKdIdDp55uA9Mob6N3ziN?=
 =?us-ascii?Q?IeE6Xa5t0Q/0Z7m0Mng+zqlf1llfjw2xEqEFJOJSaw83+j19vkgMBCnY721B?=
 =?us-ascii?Q?ULMFpXcxjOMBgnvDlOzPOFXgOSAG7VLOneWWG/OIpXI8dBciiAvRemG5Nklh?=
 =?us-ascii?Q?lZNdMrY2GFwFdd3OKN9UF9SGUtLXDCEg5TKLt5tPggsWbeN3+t3B4WaY4gXj?=
 =?us-ascii?Q?clyWPxqIR+XQNvpt2deJS+DMJkZxqfaILjpV3ANgNASiwCbC2t1gxdiGYxG3?=
 =?us-ascii?Q?tAb0/WGUWyMwTtLdoILW0XWjrvTJpbXGqSqJNgFlo56F7MBqzs5crT/RELPP?=
 =?us-ascii?Q?5SYzBejzAnXOqxJg?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR08CU001.outbound.protection.outlook.com;PTR:mail-sj0pr08cu00106.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(704161811799003)(36860700016)(376014)(1800799024)(82310400026)(14060799003)(35042699022)(156008)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3zKjeuTBo5ThjLRAR4VX8MiSoHzlUKvbdA67uPmxOQWgAHJQH6nGtPhMiZ6HeMS0G8l15t1SpO60pHPhf9I2554hE39awFKnkUMAY433l8H7gGNJhw/B5KX8PMovQ3mxV0Yi5hMGITEg2o768T4X8xplCawY5/f9fcM2hJmLBtYUuQrEYARs2l22269jzIFbuvZGfK+dADqaUZUMAzqf6VtfC34JgLEdNOqnRWQEik2h22S5MLTlMBoGEokliTz1mJonIq5A/kvFPr0/2NRbFPS1Y33P+WucY1qnoGgK64+X6FdJkJSS5zI8QmluiEHoZiLS1E/b3jlZjV9LuTpH9HYuc7Zd1tPqDxkU4itABuQQLoUhUG0pSWulI10/7FMuCyPklrZPYScrpnWMRnulVohaA+vDBN6q78585pwc2USyKNP85p31so8ilQVqJd0Q
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:33:10.8475
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6ebd96d-aeb3-451e-35d2-08de9f246bf2
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF00000141.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR08MB6541
X-purgate-ID: tlsNG-720697/1776720796-886D4161-1FEE0194/0/0
X-purgate-type: clean
X-purgate-size: 1730
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:proskurin@sec.in.tum.de,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.311];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 7BC77434254
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Sergej Proskurin <proskurin@sec.in.tum.de>

This commit adds a p2m class to the struct p2m_domain to distinguish
between the host's original p2m and alternate p2m's. The need for this
functionality will be shown in the following commits.

This is commit 11/12 of the altp2m_init/altp2m_teardown routines phase.

Signed-off-by: Sergej Proskurin <proskurin@sec.in.tum.de>
---
v4: Change return type of p2m_is_(hostp2m|altp2m) from bool_t to bool.
---
 xen/arch/arm/include/asm/p2m.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
index 62261d41e780..8ae0cd7ff589 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -32,6 +32,11 @@ struct domain;
 
 extern void memory_type_changed(struct domain *d);
 
+typedef enum {
+    p2m_host,
+    p2m_alternate,
+} p2m_class_t;
+
 /* Per-p2m-table state */
 struct p2m_domain {
     /*
@@ -111,6 +116,9 @@ struct p2m_domain {
 
     /* Keeping track on which CPU this p2m was used and for which vCPU */
     uint8_t last_vcpu_ran[NR_CPUS];
+
+    /* Choose between: host/alternate. */
+    p2m_class_t p2m_class;
 };
 
 /*
@@ -424,6 +432,16 @@ static inline int get_page_and_type(struct page_info *page,
 /* get host p2m table */
 #define p2m_get_hostp2m(d) ((d)->arch.p2m)
 
+static inline bool p2m_is_hostp2m(const struct p2m_domain *p2m)
+{
+    return p2m->p2m_class == p2m_host;
+}
+
+static inline bool p2m_is_altp2m(const struct p2m_domain *p2m)
+{
+    return p2m->p2m_class == p2m_alternate;
+}
+
 static inline bool p2m_vm_event_sanity_check(struct domain *d)
 {
     return true;
-- 
2.34.1


