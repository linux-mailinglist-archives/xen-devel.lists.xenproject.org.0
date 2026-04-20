Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LOMEsqb5ml8ywEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:34:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 912964342D4
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:34:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287901.1568354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwFb-0000eQ-AR; Mon, 20 Apr 2026 21:33:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287901.1568354; Mon, 20 Apr 2026 21:33:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwFZ-0000Ep-Jv; Mon, 20 Apr 2026 21:33:49 +0000
Received: by outflank-mailman (input) for mailman id 1287901;
 Mon, 20 Apr 2026 21:33:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEwFP-00077I-Ib
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:33:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEwFO-00CDCY-Ua
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:33:38 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b8e-2eae-0a2a0a5409dd-0a2a45028f2e-36
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:38 +0200
Received: from [52.101.85.111]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69bb1-af86-0a2a45020019-3465556f403e-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:38 +0200
Received: from BN9PR03CA0384.namprd03.prod.outlook.com (2603:10b6:408:f7::29)
 by LV2PR08MB10983.namprd08.prod.outlook.com (2603:10b6:408:34f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.31; Mon, 20 Apr
 2026 21:33:33 +0000
Received: from BN1PEPF0000468C.namprd05.prod.outlook.com
 (2603:10b6:408:f7:cafe::53) by BN9PR03CA0384.outlook.office365.com
 (2603:10b6:408:f7::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:33 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 BN1PEPF0000468C.mail.protection.outlook.com (10.167.243.137) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:33:33 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzzHw3S7bz1wdM; 
 Mon, 20 Apr 2026 14:33:32 -0700 (PDT)
Received: from BYAPR08CU003.outbound.protection.outlook.com
 (mail-byapr08cu00306.outbound.protection.outlook.com [40.93.1.110])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:33:32 -0700 (PDT)
Received: from BY1P220CA0026.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::17)
 by LV3PR08MB9194.namprd08.prod.outlook.com (2603:10b6:408:21f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Mon, 20 Apr
 2026 21:33:28 +0000
Received: from SJ1PEPF000026C9.namprd04.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::89) by BY1P220CA0026.outlook.office365.com
 (2603:10b6:a03:5c3::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:28 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 SJ1PEPF000026C9.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:33:28 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:33:23 +0200
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
 b=JJB+zpvg33Is5t+iVLLZsvNHr1WK4sNhpdBNE8wTZLFMJpy2M6wrtruiw9/c1Zrk8U4lw+WQixui3SzSk2ABMPolKsU3hFDyVG7bsztwtU99J086emY7/U6Qde6oihBwzbF1tyO7RchDdh6mRj1YMTrGwGRhoJDSdstC8vuLK7TL1ECOfi67X4NKWkhqM1BB1tANE1AW/xQwPuLdN/fAOg6xQQ8j5Ucx2rJWt3JmnNp9lyZZcZqGBLUNQcaSgW7ywB62FYGWWyIqJmG0r17ZULppdXvq+Zb6lZQhzPe30mQoFcJeZufVgiKg5aOkVgyDGcSq6e5Jk36noWj63hipUw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cnj600JVTUzVmDZRZYm/XxhEOfEfbLwT6rVorqjJHgk=;
 b=j5QLLsH29Ygz9Ofz+5c3Q8Ndx3wJRU6nNcx/HUG9Ll9YgNHPCHtQNMgal3aRogjfr6RXm4hjSPbulE0LD7MSwFm2lF6mCLwyTNvh846+YK/Nb6Irq/2+pEo2ws0vFP1JdeG2VWPMSJJw2V9CuGbP6XlvqCIov5zwYDPF7n/AWJJDisN+aoV2N5rpblcHZ68q1XMSGtNe9hiwpIcldCqNKNJfHa4G3bVDW8Yb+89jFjNOlAX5NN89+9IvbeFbI1/IDo6qRsMozR0RiqC5vSZxrySslTi+Svxh4vZFMkPyN2OQQSXUT8L2VfCiFBYhfzZ1bq2rxMfqTq8+ra2zU7S4nA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.1.110) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cnj600JVTUzVmDZRZYm/XxhEOfEfbLwT6rVorqjJHgk=;
 b=p4NOPhWWsiNKaIDAn+U2JJsdEM8tOV/+vQN9rNudlMNjagrc5l2qXS5bo+65WGaZQiNNzWuevsrjaOuSFJl/TQotXkc9GHCi385oU5btAaSdMFlqJ5I8gQd6Chmxm0ykMFvazuA56K+1pVp4HMIdUgW90ZpRDjlJqcsdCv2iRiM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.1.110)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.1.110 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.1.110; helo=BYAPR08CU003.outbound.protection.outlook.com;
 pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gAoq5k4IBmF04J6fsmGSwpLrXgn0LUf2YbnY121YLg5KhpemshZUgB4DhNBtNHP/ZZUpirVAf8dXsQFBDxm+irIfKMsjLDXwt94CBtG/mlxOj5zzt9Qg8Nh5TONBpU4T99s98IU1Iy5C6wOMVvYGs/+lNNhbUMYaQGHCWFgIcveLh8Xs2U+k9+D6/Uk1et7dzLyQKV6RrzfvcEYj6fVUnat2rVUxrylnpqBrrst5pB7IjEIE0mbD1yQe3iJd12ZVoEzxYeoMDQQ1j1XXvJWjZDfKm5ntz9Fj/GtO8zKlcz121O9GtmtZ6k4ynYP6CY0EB0s6Oxywv9oLI5n8a3vP5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cnj600JVTUzVmDZRZYm/XxhEOfEfbLwT6rVorqjJHgk=;
 b=Hltv94F6HbC+oIj8bafCHTNeznL0zCEyugnz2jb5rhOi+2iqqhzCUCS9ENt6XiIjgzohpWAXEMj/tJIHyjvl9cUgJA4XHSHlEkzo+Rl05Nh4tc3lr/zJ89pBGoG0+2Z4gvqRQNH70KwCmEPnAdKwam5YYtVaPM8sf/3u2ic3WpWkwHopiCaCdKepw5FTXSqyFBOv5Bp+yv1VoxtR1dpTIzR2mOQHu6AGc8N4itl6icXoCqehD+gwkr2Wf6FdGWtc+geJdX8g0y32wS3gb5r/0WlW7E8g77ExnSsbIurYFhu4RHQ7bCycTwQGmkFCUJ+f57Ky9xV4OA7BqxJZ7s+Ilw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cnj600JVTUzVmDZRZYm/XxhEOfEfbLwT6rVorqjJHgk=;
 b=p4NOPhWWsiNKaIDAn+U2JJsdEM8tOV/+vQN9rNudlMNjagrc5l2qXS5bo+65WGaZQiNNzWuevsrjaOuSFJl/TQotXkc9GHCi385oU5btAaSdMFlqJ5I8gQd6Chmxm0ykMFvazuA56K+1pVp4HMIdUgW90ZpRDjlJqcsdCv2iRiM=
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
Subject: [RFC PATCH v6 36/43] arm/altp2m: Add support for altp2m_activate_altp2m
Date: Mon, 20 Apr 2026 17:31:59 -0400
Message-ID: <20260420213206.208750-37-Rose.Spangler@elektrobit.com>
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
	SJ1PEPF000026C9:EE_|LV3PR08MB9194:EE_|BN1PEPF0000468C:EE_|LV2PR08MB10983:EE_
X-MS-Office365-Filtering-Correlation-Id: af66887a-2855-4782-e58f-08de9f247970
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|704162011799003|82310400026|36860700016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?Uh2alZfI8cvY69ZRMp1rHjI9gRX1WaTVRGxZeB7MfyVGUqhQawb1mQMLW/dB?=
 =?us-ascii?Q?+WeqCV1FQsBBb+UAAeAi5ct3Icll+0OTgFq/7r+/aZspRrAxmPRIweHhWymg?=
 =?us-ascii?Q?/euLExSWYpxBsKti40DOoySJSkXT4Ytu6TqwOuze4P/leGWYWwYJm9INygrb?=
 =?us-ascii?Q?AGvZJtcYXSNy9n0SCEyHMfxmbMQALJuCRaIYRGTTIA80UrS29uCNf3DIilFP?=
 =?us-ascii?Q?CX+hb+KCHi75gklep7lz3UHYNOoaqc3TqETmUNe1wZLF+vYP2anDj8c89lLd?=
 =?us-ascii?Q?/4qB1w8vFn72IBHRJr17AV6mWyTeibz7azfv20egypcUV0o96zN5GcTyVUfh?=
 =?us-ascii?Q?dvajhWTlxXDVqNWl1ybwslBygBHXfNIVEPAc3c4YusM1BC/QBjfRafMZcyDP?=
 =?us-ascii?Q?9pNbS4PbI69LQ+qE9Ki9BwUgdgTe9T4NVnAP13sxaGitt1H6bdz6wyZu5rfP?=
 =?us-ascii?Q?zVFd0rQLjNqofWC/nLDIXNHc6+5PsTXT85ci7Sf5kEBSOP2Fj+nPgN4O3uUx?=
 =?us-ascii?Q?4VQheZ1xQu2i7x27kr32Ee6bdDD5Hae3Y4SQFSjn0FLtIPSQOQvBPqVf9A7I?=
 =?us-ascii?Q?hSZebGKaRgBeEYbDqkTLli5s6SZtD0ucp8jK5cPxtY00a/LKPlcUBRuFIBN7?=
 =?us-ascii?Q?Ct5FPIbHtdxVMzviwbNRY+y1BkzoUnAA8UPXd4PyAX/mQidJQMeFyHd3fr+B?=
 =?us-ascii?Q?56omWv7MFhJ/Q0LGzHnlUwbwrryfF0//U6feIH863nIJYqrIJ9ejEIDR8YP7?=
 =?us-ascii?Q?7GRfRdhoO4gfZGU7bUYbSi5k8q7vnmagVXHKdINCWd5J47UNdVS0k3qc2Vdp?=
 =?us-ascii?Q?44yembUdUsi56iivuYjLASMUcgwVSiAwF3ZD4x5V4IF44PsGp3dNop9pKq1G?=
 =?us-ascii?Q?/ypI9Zge5gi+Q1Ak6+TxDULMZeOG1UXpN2PdKWkutzgfk3DgmrQFBVfUdZEJ?=
 =?us-ascii?Q?HFigu/LYhzisNkoRyIqcaoByO2QioSokfU95USGxFvHxncYX8tbx4jInFrws?=
 =?us-ascii?Q?YG//SlKlQnU9OXJQWcamnPVNhTZ6Orx71e7OV2YaMYdMHymSr9YOaP+Fa2Sb?=
 =?us-ascii?Q?Q51bheCl31Fxb7cNlMxWwDbcfbR4FuuX3etzl/q3UfAd2dD0RwSld6eJ4g86?=
 =?us-ascii?Q?R0B/Dia8N7sjQFflJe8Q4FTacR6fsnN89g=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(704162011799003)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 oM0N2lnKFcIFmgc6J4Uw3Cpnbg/mLsvjjUGL15U7MwGZYGzDY6JN8QXyuGfSYjDHIj31paAyq7/tyov4naj90+z85U/nIT16OWjFLu/AJ8Th7N0NCbcX2Mijs5138+MPhRXFq4QAmZ4Kamne2y7fl85tgIu1CmWK19kaEuIvxm7qh8nDfHuh+T1F68kxoMbk2NXHl/NzYwZpxcFjmRRG3h1kQAiJtpRl0rSw8lyF7c+e7s1/QG5NQFPgs2o9Z9Afi7XSL6Aem/onp1JWX7Vt4IKoN/ERPIRM/mKQzZds0l4cikYBJVrYaxV36VkQKnmDlmbYiiT05GTainCw+zG1yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR08MB9194
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.1.110];domain=BYAPR08CU003.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.1.110];domain=BYAPR08CU003.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 BN1PEPF0000468C.namprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a30719ed-e8e8-437e-8cd8-08de9f247630
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|704162011799003|82310400026|14060799003|156008|35042699022|36860700016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UaOWSU4C7gtwiy6SYLuHejsLGVBMfrgtLOgRL1QL3plnvxesoD1dVxrIC2ow?=
 =?us-ascii?Q?uPQDgq89tvFFIHbPVVkGV6JK1JsmEJ33OYGhBGQ1+3SLF9VlADZA0VaVOS1q?=
 =?us-ascii?Q?gbL3YgMC+z6/izaP0588i/k/vgoY+8kv2FOq5FvxS8H5XispyB+v3NcbBY3H?=
 =?us-ascii?Q?6SFuL1WUXvMvUwPyR3mJgR1e9cWj0yMh7auAb4mGBxZ9u47B16dkv3oTAOGV?=
 =?us-ascii?Q?EjZGcqpPUdOGgKueNsj6ggCR6cr3d7OKZoKxrN6sV4u/sMSSdFxgwkvfyx0b?=
 =?us-ascii?Q?X0Bny37KB+NDS7o8XXuuiXP9l7KuSl2eNpOA5yQmJd9Qa97crZbw0BHEHW0b?=
 =?us-ascii?Q?XkK+n8uLMx9qiQelsLBuGoFyXYYKP8irTNF+WR7S1N+BjV+/PzVnNvMFNEXO?=
 =?us-ascii?Q?HoRkHQ7Hvk76dR7+uYupBoBh/4FUPS/O8QiTM9FBTMnSDbdPH0sdtptflI20?=
 =?us-ascii?Q?xxFTYXiOHHlluXr2oxps/e/4r+uCLsZLrCu7cTMN/z+c0AVkg/QE5UpAAMw3?=
 =?us-ascii?Q?mmmW+rXa0nx3pTrpQURRsbPjtaXMPSlYiP+jL/js6lCQrZTibJXF6T+hE2Z6?=
 =?us-ascii?Q?rNM6UW3ZirJFRkesCyXwPqd510UFKiLY2XHz+C8Nzc6HyzriYqnuqKOhM1H4?=
 =?us-ascii?Q?fXkbTbWsQls8zTwfArJ4t2swVAVOZ0m1u3c4QHop4tIvqdr6oBzn+IzskLYj?=
 =?us-ascii?Q?s5Aaex7oTZ4zMh45MU1CobyQsjg1ZFedhNPyUyAJNjNCvQYTF585jSCV0NRt?=
 =?us-ascii?Q?XxcG6uapy0tLLoH79t2ZtEXV8ntBlQVME1vxAqxzXf422mb6vficfR0BRzqm?=
 =?us-ascii?Q?F6BcrQmx9bz+CfWMf9ys2u7Qg9SM9JrOQjO0z0gJiju09fq511CRLA5U8iu+?=
 =?us-ascii?Q?heTVv9keNbjHHadPy3usBrHmk2H4qxDJ1WHNPbd1t8CeHPn69Vrgol2Gn0G+?=
 =?us-ascii?Q?PBOX/d1gJUg9gXfZJZDDtabDodUZaks4CpBB54QPbcRYxIG4U6EryoiQzJTD?=
 =?us-ascii?Q?vUTASNXg2kZfSLijDyxoISn5M4chpH7ICy5X0IxjNjgv8aghXDBa/iuSLq7A?=
 =?us-ascii?Q?qytC9c72F4TDytF6XI1M8StJhUTI20cAk30CwfsGhGEVROclpQr8S0KyEqBK?=
 =?us-ascii?Q?fJjk3cerEJiyEaSCFufTLAVxpHI7kYWd0A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR08CU003.outbound.protection.outlook.com;PTR:mail-byapr08cu00306.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(704162011799003)(82310400026)(14060799003)(156008)(35042699022)(36860700016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bf0ohAt3Rm0RoME2wmygY4/sAg1U4b/ak/eQexf2qA7bw5oP0Gj2MMpTYguV7xOIFY2TqYJjuqkjQovz61i0akbe9SRv+C2SPuxR8wOxL2djbIV1ZhwCYoeSW+Rh/4srsT0AImwiDfaYe8ci2JtmgB4HTaMdn0k06RiL6Kgrnwf7ql8d3EDMz5YypAi7t6ODG/1dUcCzbiFrLaRdVaSR140SbwUPLb3nSsSgIaHxnqChP7HY38ShUfMDrJog5WfksgCF2L13KTwd6CCP/2WoZ6dDtL0oDUjFOAyskzqlCE2vbH+wwyPO2latl2A6GdnSrw7ZVbkEFokPsnR3uLDfD/lmqGhX8EnReEMzt+EmZOWGZX2J/J6i2+4YFiiQ7HEMVxbHUn0MLS0uS4EvdO2lSBzsbhRUyssQ9KaE1k8ynjB6b+lVEsBy/tj7hYkWVukO
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:33:33.3646
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af66887a-2855-4782-e58f-08de9f247970
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF0000468C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR08MB10983
X-purgate-ID: tlsNG-720697/1776720818-884D5161-1D4C7D6B/0/0
X-purgate-type: clean
X-purgate-size: 3042
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
	NEURAL_HAM(-0.00)[-0.239];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 912964342D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This commit adds the altp2m_activate_altp2m function on ARM. This makes it
possible to activate altp2m views in common altp2m routines (namely,
altp2m_init_by_id).

This is commit 2/2 of the altp2m_activate_altp2m phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.

    While the ARM version of this function is very similar to the x86
    version of this function, I still think it makes sense to have this
    implemented on both architectures instead of using a common
    implementation. A significant portion of the function would need to be
    #ifdef CONFIG_X86/#else CONFIG_ARM gated (like p2m->min_mapped_gfn vs.
    p2m->lowest_mapped_gfn on ARM, for example). This would become even
    more of an issue if other architectures implement altp2m in the future,
    so I think it's best to keep these architecture specific.
---
 xen/arch/arm/altp2m.c             | 26 +++++++++++++++++++++++++-
 xen/arch/arm/include/asm/altp2m.h |  4 ++++
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/altp2m.c b/xen/arch/arm/altp2m.c
index aa48c17e11a3..aa56b3ca79b5 100644
--- a/xen/arch/arm/altp2m.c
+++ b/xen/arch/arm/altp2m.c
@@ -37,6 +37,31 @@ bool altp2m_view_is_visible(struct domain *d, unsigned int idx)
     return d->arch.altp2m_state[array_index_nospec(idx, d->nr_altp2m)] == ALTP2M_VISIBLE;
 }
 
+int altp2m_activate_altp2m(struct domain *d, unsigned int idx,
+                           p2m_access_t hvmmem_default_access)
+{
+    struct p2m_domain *hostp2m, *p2m;
+
+    ASSERT(idx < d->nr_altp2m);
+
+    p2m = d->altp2m_p2m[array_index_nospec(idx, d->nr_altp2m)];
+    hostp2m = p2m_get_hostp2m(d);
+
+    p2m_write_lock(p2m);
+
+    p2m->default_access = hvmmem_default_access;
+    p2m->domain = hostp2m->domain;
+
+    p2m->lowest_mapped_gfn = INVALID_GFN;
+    p2m->max_mapped_gfn = _gfn(0);
+
+    d->arch.altp2m_state[idx] = ALTP2M_VISIBLE;
+
+    p2m_write_unlock(p2m);
+
+    return 0;
+}
+
 int altp2m_set_view_visibility(struct domain *d, unsigned int altp2m_idx,
                                uint8_t visible)
 {
@@ -66,7 +91,6 @@ int altp2m_set_view_visibility_locked(struct domain *d, unsigned int altp2m_idx,
     return rc;
 }
 
-
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/altp2m.h b/xen/arch/arm/include/asm/altp2m.h
index f8d0dd799a4a..192240f48c33 100644
--- a/xen/arch/arm/include/asm/altp2m.h
+++ b/xen/arch/arm/include/asm/altp2m.h
@@ -48,6 +48,10 @@ int altp2m_set_view_visibility(struct domain *d, unsigned int altp2m_idx,
 int altp2m_set_view_visibility_locked(struct domain *d, unsigned int altp2m_idx,
                                       uint8_t visible);
 
+/* Activate an altp2m view */
+int altp2m_activate_altp2m(struct domain *d, unsigned int idx,
+                           p2m_access_t hvmmem_default_access);
+
 #else /* CONFIG_ALTP2M */
 
 static inline bool altp2m_supported(void)
-- 
2.34.1


