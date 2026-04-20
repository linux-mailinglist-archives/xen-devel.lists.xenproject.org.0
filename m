Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4G+0N3Ga5mnCygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:28:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EED4340CB
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:28:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287560.1568041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwA1-0006kb-8Y; Mon, 20 Apr 2026 21:28:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287560.1568041; Mon, 20 Apr 2026 21:28:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwA0-0006VK-EU; Mon, 20 Apr 2026 21:28:04 +0000
Received: by outflank-mailman (input) for mailman id 1287560;
 Mon, 20 Apr 2026 21:27:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEw9t-0005Lv-ME
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:27:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEw9t-001N4o-2I
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:27:57 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69a1b-2eae-0a2a0a5409dd-0a2a450cb340-14
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:27:57 +0200
Received: from [52.101.85.93]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69a5b-62f1-0a2a450c0019-3465555d8597-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:27:56 +0200
Received: from CH5PR03CA0017.namprd03.prod.outlook.com (2603:10b6:610:1f1::12)
 by DS0PR08MB9565.namprd08.prod.outlook.com (2603:10b6:8:1ba::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:27:45 +0000
Received: from CH1PEPF0000A348.namprd04.prod.outlook.com
 (2603:10b6:610:1f1:cafe::28) by CH5PR03CA0017.outlook.office365.com
 (2603:10b6:610:1f1::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:27:44 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 CH1PEPF0000A348.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:27:44 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzz9C55GSz1wdR; 
 Mon, 20 Apr 2026 14:27:43 -0700 (PDT)
Received: from BL0PR07CU001.outbound.protection.outlook.com
 (mail-bl0pr07cu00105.outbound.protection.outlook.com [40.93.4.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:27:43 -0700 (PDT)
Received: from CH0PR03CA0403.namprd03.prod.outlook.com (2603:10b6:610:11b::13)
 by CH0PR08MB7491.namprd08.prod.outlook.com (2603:10b6:610:fb::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Mon, 20 Apr
 2026 21:27:37 +0000
Received: from CH2PEPF0000009E.namprd02.prod.outlook.com
 (2603:10b6:610:11b:cafe::8b) by CH0PR03CA0403.outlook.office365.com
 (2603:10b6:610:11b::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:27:37 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 CH2PEPF0000009E.mail.protection.outlook.com (10.167.244.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:27:37 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:27:32 +0200
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
 b=PjBLFM4jGrqmmHfj/MqRqt8kKt906o3F79e3dJ2dnC+qclJPbyQseFa48QXPCZRjZdnKuCP+kDfCZASnmgb0mfxGSFpx8VRGGu1uMFR4pmXUwFyLOWL+TF9kHVlD+pOlAWs+kloRHqTEyGiFJxd27zSkoCALdM6MgaCG1Qkrq9AcTGu46vpVjTjFUY4cM4h0WtCL7+fMlgWeVK9t2tGVyHnA466tyBMpI4m82cebh8fXxai4CtqusxMBtJBLeu8ajqRfqNtFVrNoZAw2sHRRzSXsFveNpK3K35h7WsfytWEXmDC3hHkzPKN7afKCId6qBIkhu6FbKetUug7dvLigeQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bo2v4ugtYXSGdSqYmYudyzdTq4r/l5sKQLamsKzHkjU=;
 b=FNHoTAjnYko+14eNhKInCEO51FvFgZuIr+MUy2ZYB39tNh5jwQeCx3H5ErqYrjqGDhg0QzyIyIOl+qh2gv44xDc8ksHlFYEO+ZUrqPij5RBshnrVpNxC2SjXsv9m9etUlHBVQXRhOepoaU33tmiyxVTWpyAuik0Q1iKYOEc4Be1LIR7G3N7mYX9K50bKrjuBsoww/eP7nn4XsL6v+V3wty59F2cQF1PQWukC1JS7OOLO1sui30kyWx1e3X5WlGmsHqwaUXBIy3NieI32GAzIVv2Qu2C6lU7Ws+yuO1VVpH8vU0yyeduutDgKC0BJTIuwctOBxdjaZpa7Qn0vBsym1w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.4.5) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=elektrobit.com;
 dkim=pass (signature was verified) header.d=elektrobit.com; arc=pass (0 oda=1
 ltdi=1 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bo2v4ugtYXSGdSqYmYudyzdTq4r/l5sKQLamsKzHkjU=;
 b=CIXptReV+0HXf76uk894wmgPsCshjDcIJMBj+t+Tc//GIl0X3Pof96qX8+FnSLz2rsBrpMj/z3rEYyzZIqtU6+P6tteZDeFBoGbhXfB/mPoVsGAdgdHnxW3QHoUQWOBSrjkkYian7r4o7rX3vygkhT8TdskxDYJY+Hjk9SvkFW4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.4.5)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.4.5 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.4.5; helo=BL0PR07CU001.outbound.protection.outlook.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NunYwEPT1lAfAtkZRABb3MxGgi6u6ju/KwZR4zQ+njumou4u35o77X6QzwGuZYC2ACTJebYGDsp1QSoknoGI0LfihFHVtXnsZOMD5Hw5v8cgxSR7Tt7vwrqywipQmr/zJ2g+j+UMXbedfb4Io1i0mhWZlYd2oKWoOh8JHlMtJM09oxSJTVVaHkQMMM1a3DxqQNYmDBJ0E2X2VVvRKCbh508WHcCy3P0sgyKQ+X7BxLPZCQM4Q33ejKjD9ueiIxvIhlVJyqkYxA84tJmlcb96W5UK+GPOzfp2VcWOsI46ZtoO3i4aP/pfrhiOLoNAqsXPYei4tfAifKsjT3kdTn8A6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bo2v4ugtYXSGdSqYmYudyzdTq4r/l5sKQLamsKzHkjU=;
 b=qOzERM45VayvvhuFQqq9y2vqqpAXasq2w6xngwOWuQffaNTymbxRV9wwn4YqlIWi2DId1ry+CxgxWyDrehkUx57a9lyNw+pyzteqnkKCER50LKv3AT/x7zpSrSH02ah/KpZ20aTN9aG2VNeleutdmDUYzMsSdID/HAEsYteH/IHAB3vPHzrFUHRl2EoKrszJQx5RaYVmWNpgTHOs5ATlTeDd580SNv6xsMGo0xHyBrcsAZCbONofFR5pweJ8UC9BSrBpudI9ZQmNTFO4piMCJTbvD1NVXRSslDA6xi0sGzw6DGdV2eLd0RnauDCD/4DNsPOhipVURAPvmIYwxnwgfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bo2v4ugtYXSGdSqYmYudyzdTq4r/l5sKQLamsKzHkjU=;
 b=CIXptReV+0HXf76uk894wmgPsCshjDcIJMBj+t+Tc//GIl0X3Pof96qX8+FnSLz2rsBrpMj/z3rEYyzZIqtU6+P6tteZDeFBoGbhXfB/mPoVsGAdgdHnxW3QHoUQWOBSrjkkYian7r4o7rX3vygkhT8TdskxDYJY+Hjk9SvkFW4=
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
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Sergej Proskurin <proskurin@sec.in.tum.de>, "Aqib
 Javaid" <Aqib.Javaid@elektrobit.com>
Subject: [RFC PATCH v6 23/43] arm/altp2m: Add support for altp2m init/teardown routines
Date: Mon, 20 Apr 2026 17:26:28 -0400
Message-ID: <20260420212648.208640-16-Rose.Spangler@elektrobit.com>
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
	CH2PEPF0000009E:EE_|CH0PR08MB7491:EE_|CH1PEPF0000A348:EE_|DS0PR08MB9565:EE_
X-MS-Office365-Filtering-Correlation-Id: ac698512-317e-4966-d2b4-08de9f23a970
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|82310400026|36860700016|7416014|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?r3ai/RmtL/lmzrhqxdGsu4jLGuf1z/GiJs638E9evhAa00Od7fXhO8YWiNeA?=
 =?us-ascii?Q?PJKiVc6lDCArJScBv/L5Br+hKwr7+XOV5Wk0Bx4bsr8IMHE8Ibj46gk6CVdD?=
 =?us-ascii?Q?/YLVbrb8iT6NB4dLOr399xSXt5aKkFM5erhfpIb/1HJV2eNAA4XTDYK0/RJx?=
 =?us-ascii?Q?1oqavkJX/kiTbkx/MwDRH/5QfNP2qpaqwePRyi6mY9QiYZY2qCL4aZXdtGVA?=
 =?us-ascii?Q?S07A8OogGqHZKd8QXo0fHTHacAOh1S4a3cOpLrPWqA+weoV+KdBGMK7iagYd?=
 =?us-ascii?Q?HxWku+vShVF8fW8y+BoGthBQAxVHn/RTAGpNBE78UlwkoS93f3CTjrfra98A?=
 =?us-ascii?Q?Klf4sR24vSNTMooz0FhZu/1UfdfK9UfWWaD/7zM3pNS8/64mJKcKSSdlqXSV?=
 =?us-ascii?Q?27GcFtr2hT/meu78JNOQKL0lYhcqEPwgKm3CFg/OiAL4NpIGhveK5Udfizg8?=
 =?us-ascii?Q?3dwJmrTAeBajurObGzi30y+dWdMLYuHuIp/Fx1hy/ZyHzuiyU+rkszLJa3E1?=
 =?us-ascii?Q?01obF4ilSAxBKTTm4YjIkaxuToH63Kfgt3oOEjvEPD9fWOQtg48TDUvVmW4q?=
 =?us-ascii?Q?JV0M9tyXMcso5vwJHu6MGN2DB+7yIe6GtgvKgZCMCIXlp+APRlNfasfJLdF1?=
 =?us-ascii?Q?fUYdApNg4RWd8DhwknpWo6CLlRm0UUMpToY9JeZroXOyPK1fZ3v4CmNtdZSk?=
 =?us-ascii?Q?QleZA4bfpX+/vXDdwTyvCmcNB84RktwAsdQsjQWOdANDcZmUXp0SqIUYa0e/?=
 =?us-ascii?Q?tOGIr9Zyl2yS1Ipk34SY1SnTU+7xqT0zSHVXPVnyLDNAf8ej9FniUIMlN93E?=
 =?us-ascii?Q?214CNtGluz2YlSNiQxhBxpLFLuRiszclW8+GeJ3P1fqpMJDwhTb7nmcEaDMS?=
 =?us-ascii?Q?z6RWi1+gfV5Vk8L8N2mpf4vQvRkXKgNijbF7YfRZL162Z5YShkIBO74QF2MM?=
 =?us-ascii?Q?F8d37YrPvY5P1zMlIMsX335rc7PH2bxNWuX6w+m/VJ02aO47qX6Is1iPXfCp?=
 =?us-ascii?Q?UlEnMNBolf796IIn3GdQmtgoFxRH33cJIaGuJwjACNeLMDV2X/bfLHtzdMyC?=
 =?us-ascii?Q?DJcYfc8EQcFBwj47T8Kx19VBbH8nC/pl+F/U7dERQgpbB/gKOIJRSYJ8RfFh?=
 =?us-ascii?Q?LG4H+zKhOQjIl9fp5M6bAHtsGOVj6r6dCdOZQ9kUe5WT9nnB6wTLnkgN5heh?=
 =?us-ascii?Q?BtsXWahGO1lXCNLzGhECdS3VWOLRFXVvL/g+m0T0SIADwBRdsMcnjiWgU68?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 q2gnCGy/wfxdHSvj8ixF2Mo1DoT5URzSERJ5MmEG+KTxfRhr83hXMD1iGFgI93LRzV68dAJviJV1m0KGRz+a1OnxBAFS5TTp2ru3pKxvvmK4+/FXdpYsN7GgPkgrRjDhWiIev7i3F2E4dlnKQL4UFVD94NpYyWp86FNrG0tR2HNCVNis7IDRWBXBvyaRRe8k0OvwiFkSux6N3/MXie4Bl4/bb3+zCUZ7c2ZoT1l0+WaaVzh/OLHK94x/CgW5QQIzOK+9Cxvsj10xzh0qH4bQiz+GLdp6rQ+Xlouo4yZub4Zdr6XQhh5J43JdBGmu2SxQPi8pG7UMyoA0MbENE5sYaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR08MB7491
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.4.5];domain=BL0PR07CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.4.5];domain=BL0PR07CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 CH1PEPF0000A348.namprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1ceeffea-77f0-494c-24e1-08de9f23a54a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|35042699022|376014|36860700016|14060799003|156008|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YMwve2Y858zdozLJ2PNhVaW1okxU2N1a4dwWGtZw/Eic+aGHrbpaNBm3bkYM?=
 =?us-ascii?Q?BLTYnVEj36zZipoAy4jNjH13yUhWPFed+XWKYZbflG20nM3jWqUmxxxJxTWK?=
 =?us-ascii?Q?ZXsDXBSYkYuQIBcnQjnvLGhb/g28SqGpP9QcECDeSZqhqOahDlvSt0Tcpn5i?=
 =?us-ascii?Q?kch8Owy2l53r3qWigZ1G5L1v8DzVikxJF8mQgTgSZ9u1NCpkq9M4EgPXngAb?=
 =?us-ascii?Q?N5skvundvHKpX1ewdksQeb+0JS41TYOmrptS75fLB/rtQ3Jhy3Le2Hp12oQU?=
 =?us-ascii?Q?eEjuE2ZaVBE/i+oHjkfkGzsfXwb75uQqBvqw0JSRN/yYI/6IAJEsfcsHGoqg?=
 =?us-ascii?Q?vkIeKsXIQ+mpUeATmluYl/3smwDt6trTLhGY5wnMNMddULEEB5OSRPoizg2K?=
 =?us-ascii?Q?fMInbFGVpvUCmtpm2eUxeikDDLLC4it89OpRlllFf2cGpLlgo7FJ8rIvgIeV?=
 =?us-ascii?Q?mXKs6tkAa3alkDHCf4goU03fIREAANb5+Puu8ZmRyUnqHx/j9NNxyUg/RWp6?=
 =?us-ascii?Q?0WK9yKKit9giP7XppXyf15CxlXbMEKbAm7gtT+F8I3qI0lm1AOZA27kcexkj?=
 =?us-ascii?Q?zfWQLFyBr9/nNjK9xDTvT5vHOy8olqNcX441N4gJkRie/QKmuDbNp8TGHuJP?=
 =?us-ascii?Q?aRSoSaKzNNrULAYgA+bycc+FpRmMqCgVS8AR9MbHu3xKWxtxIuHVGthARG4L?=
 =?us-ascii?Q?VbeIKEeJ7sCLZHu6jyU2Hynq0Ir/09puPzx4ogcFVOxHjMQieq4ThGRZcw/j?=
 =?us-ascii?Q?89ZF+6FvbvYYBSlHDnn9VXNRaDbvyeW9bUml48P9abTGkyoike6VmvKsrDYz?=
 =?us-ascii?Q?S1lCEgL24BMYAnnUqoPYMTADUmyFSHPqxUOyvdsNJ/oRFyr6zowjzzVGqZhj?=
 =?us-ascii?Q?SYmwJXF0THdthxdadry4DfRMOPLW1F3LPCtVjnvmZCe/FoQE+7yfQov0ymOt?=
 =?us-ascii?Q?JLkPLaEd6xw+1VjnxpKQ7toXXRz4gkYlz8Z5Zxdj9DFVlrUa9iwWWqUjkTTc?=
 =?us-ascii?Q?F5gTUReFqzk83wkTm+GXpDv7Q/4pWrDXkCUn2okd/P8WdlIur9EVGCb1wulf?=
 =?us-ascii?Q?YXVpqTQTAGBLX7toT1nIWsYVS7Ha9A16G+mL6LH//khWGsfzyBk0xoYLhIld?=
 =?us-ascii?Q?0m7edEU14REMZ1cKh2BZtmPIKc5r5YrNJUhQBkSVk+2QHi0DVc6KNx82BK5Z?=
 =?us-ascii?Q?WmbXyVzQx49NKwmPaTHDcwV4Ki8o8HuL6bV/OU9vOkuGdeEOD19L5lqTf7Q?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR07CU001.outbound.protection.outlook.com;PTR:mail-bl0pr07cu00105.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(35042699022)(376014)(36860700016)(14060799003)(156008)(82310400026)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4kOxaOL98lHbEV5pOudnNkAMwnWJxFFz3jGVAIiRzFfzxvq4rH7w3rrRd1pw+IALzigEvhoVTyQB01gS+erLnpbY+rYcUEvf+LJGIAKS+Gdw1cfJxx0ARDUNls9mk4ZFJayct5QjqTDYiYkxc1ukxxbZCYelE8UULdEzmIn4YDwEWyIJdEXHfsIDkOKgQb7oV+Invjum+Y1SsG9KyHKIXnD2jfU5xlTifN5JNIlPbOb0UfNwdZQRUDESsSwpb5XGXiF6n0RFS9nez8KNsNgpFG4zxkPkrr2gQiYG6F418T3+T+Ig2/uP/HshLigiGPAeEExrCjxOdwJvN5TRx6CUFVHUFobqUSIu1W8gy00cS6QwffCcSs7M5EAXeQk6Nd34NH7qopPNxaOdKKEbx255Bl+wrih9ZqzhfhmzuiQg31xFcCP7P091ciMenywfxQAC
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:27:44.4777
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac698512-317e-4966-d2b4-08de9f23a970
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000A348.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR08MB9565
X-purgate-ID: tlsNG-d25034/1776720477-6D360CF5-A81DA81B/0/0
X-purgate-type: clean
X-purgate-size: 7788
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
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:proskurin@sec.in.tum.de,m:Aqib.Javaid@elektrobit.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[17];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[elektrobit.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.273];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tum.de:email,elektrobit.com:email,elektrobit.com:dkim,elektrobit.com:mid]
X-Rspamd-Queue-Id: 53EED4340CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The p2m initialization now invokes initialization routines responsible for
the allocation and initialization of altp2m structures. The same applies to
teardown routines.

This commit adds the prerequisites for the common altp2m_init and
altp2m_teardown functions to work on ARM; No further changes were necessary
other than removing the CONFIG_X86 gating.

This is commit 12/12 of the altp2m_init/altp2m_teardown routines phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
Signed-off-by: Sergej Proskurin <proskurin@sec.in.tum.de>
Signed-off-by: Aqib Javaid <Aqib.Javaid@elektrobit.com>
---
v2: Shared code between host/altp2m init/teardown functions.
    Added conditional init/teardown of altp2m.
    Altp2m related functions are moved to altp2m.c

v3: Removed locking the altp2m_lock in altp2m_teardown. Locking this
    lock at this point is unnecessary.

    Removed re-setting altp2m_vttbr, altp2m_p2m, and altp2m_active
    values in the function "altp2m_teardown". Re-setting these values is
    unnecessary as the entire domain will be destroyed right afterwards.

    Removed check for "altp2m_enabled" in "p2m_init" as altp2m has not yet
    been enabled by libxl at this point.

    Removed check for "altp2m_enabled" before tearing down altp2m within
    the function "p2m_teardown" so that altp2m gets destroyed even if
    the HVM_PARAM_ALTP2M gets reset before "p2m_teardown" is called.

    Added initialization of the field d->arch.altp2m_active in
    "altp2m_init".

    Removed check for already initialized vmid's in "altp2m_init_one",
    as "altp2m_init_one" is now called always with an uninitialized p2m.

    Removed the array altp2m_vttbr[] in struct arch_domain.

v4: Removed initialization of altp2m_p2m[] to NULL in altp2m_init, as
    the "struct arch_domain" is already initialized to zero.

    We moved the definition of the macro MAX_ALTP2M to a common place in
    a separate commit.

v6: Reworked to use common altp2m init and teardown routines.

    Added altp2m_lock_init macro for use in altp2m_init.

    Split altp2m initialization in p2m_init into a separate function,
    p2m_init_altp2m, to more easily gate code behind CONFIG_ALTP2M.

    Pulled in addition of active_vcpus from a later patch in the patch
    series.

    Split teardown and free of altp2m views into p2m_teardown and
    p2m_teardown_final (part of altp2m_teardown), respectively.
---
 xen/arch/arm/include/asm/altp2m.h |  4 +++
 xen/arch/arm/include/asm/domain.h |  8 ++++++
 xen/arch/arm/include/asm/p2m.h    |  5 ++++
 xen/arch/arm/mmu/p2m.c            | 44 ++++++++++++++++++++++++++++++-
 xen/common/altp2m.c               |  2 --
 xen/include/xen/altp2m.h          |  2 --
 6 files changed, 60 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/include/asm/altp2m.h b/xen/arch/arm/include/asm/altp2m.h
index 698c35427e75..5a217f48b103 100644
--- a/xen/arch/arm/include/asm/altp2m.h
+++ b/xen/arch/arm/include/asm/altp2m.h
@@ -19,6 +19,10 @@ static inline bool altp2m_supported(void)
     return true;
 }
 
+#define altp2m_lock_init(d) spin_lock_init(&(d)->arch.altp2m_lock)
+#define altp2m_lock(d)      spin_lock(&(d)->arch.altp2m_lock)
+#define altp2m_unlock(d)    spin_unlock(&(d)->arch.altp2m_lock)
+
 /* Alternate p2m VCPU */
 static inline uint16_t altp2m_vcpu_idx(const struct vcpu *v)
 {
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index 576dbdec20af..9e69d62086cd 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -128,6 +128,14 @@ struct arch_domain
 #endif
 
     struct resume_info resume_ctx;
+
+#ifdef CONFIG_ALTP2M
+    /*
+     * Lock that protects critical altp2m operations that must not be performed
+     * concurrently.
+     */
+    spinlock_t altp2m_lock;
+#endif
 }  __cacheline_aligned;
 
 struct arch_vcpu
diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
index 8ae0cd7ff589..db715c4f8bfc 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -9,6 +9,8 @@
 #include <asm/current.h>
 #include <asm/hsr.h>
 
+#include <asm/atomic.h>
+
 #define paddr_bits PADDR_BITS
 
 /* Holds the bit size of IPAs in p2m tables.  */
@@ -117,6 +119,9 @@ struct p2m_domain {
     /* Keeping track on which CPU this p2m was used and for which vCPU */
     uint8_t last_vcpu_ran[NR_CPUS];
 
+    /* Alternate p2m: count of vcpu's currently using this p2m. */
+    atomic_t active_vcpus;
+
     /* Choose between: host/alternate. */
     p2m_class_t p2m_class;
 };
diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index 0d37760ef5d5..04d17e787259 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -1,4 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
+#include <xen/altp2m.h>
 #include <xen/cpu.h>
 #include <xen/domain_page.h>
 #include <xen/ioreq.h>
@@ -7,6 +8,7 @@
 #include <xen/softirq.h>
 #include <xen/xmalloc.h>
 
+#include <asm/altp2m.h>
 #include <asm/alternative.h>
 #include <asm/event.h>
 #include <asm/flushtlb.h>
@@ -1486,6 +1488,20 @@ int p2m_teardown(struct domain *d)
 {
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
 
+#ifdef CONFIG_ALTP2M
+    unsigned int i;
+    int rc;
+
+    d->altp2m_active = false;
+
+    for ( i = 0; i < d->nr_altp2m; i++ )
+    {
+        rc = p2m_teardown_one(d->altp2m_p2m[i]);
+        if ( rc )
+            return rc;
+    }
+#endif
+
     return p2m_teardown_one(p2m);
 }
 
@@ -1499,6 +1515,9 @@ void p2m_final_teardown(struct domain *d)
      * where relinquish_p2m_mapping() has been called.
      */
 
+    if ( altp2m_supported() )
+        altp2m_teardown(d);
+
     while ( p2m_teardown_allocation(d) == -ERESTART )
         continue; /* No preemption support here */
     ASSERT(page_list_empty(&d->arch.paging.p2m_freelist));
@@ -1595,6 +1614,24 @@ struct p2m_domain *p2m_init_one(struct domain *d)
     return NULL;
 }
 
+static int p2m_init_altp2m(struct domain *d)
+{
+#ifdef CONFIG_ALTP2M
+    int rc;
+
+    rc = altp2m_init(d);
+    if ( rc )
+    {
+        p2m_free_one(p2m_get_hostp2m(d));
+        return rc;
+    }
+
+    d->altp2m_active = false;
+#endif
+
+    return 0;
+}
+
 static int p2m_init_hostp2m(struct domain *d)
 {
     struct p2m_domain *p2m = p2m_init_one(d);
@@ -1608,10 +1645,15 @@ static int p2m_init_hostp2m(struct domain *d)
 
 int p2m_init(struct domain *d)
 {
+    int rc;
     spin_lock_init(&d->arch.paging.lock);
     INIT_PAGE_LIST_HEAD(&d->arch.paging.p2m_freelist);
 
-    return p2m_init_hostp2m(d);
+    rc = p2m_init_hostp2m(d);
+    if ( rc )
+        return rc;
+
+    return p2m_init_altp2m(d);
 }
 
 /*
diff --git a/xen/common/altp2m.c b/xen/common/altp2m.c
index cda653b713f0..989d8bdcb923 100644
--- a/xen/common/altp2m.c
+++ b/xen/common/altp2m.c
@@ -15,7 +15,6 @@
 #include <asm/hvm/nestedhvm.h>
 #endif
 
-#if CONFIG_X86
 int altp2m_init(struct domain *d)
 {
     unsigned int i;
@@ -60,7 +59,6 @@ void altp2m_teardown(struct domain *d)
 
     XVFREE(d->altp2m_p2m);
 }
-#endif /* CONFIG_X86 */
 
 /*
  * altp2m operations are envisioned as being used in several different
diff --git a/xen/include/xen/altp2m.h b/xen/include/xen/altp2m.h
index 85ef22c2b29e..238c7a935586 100644
--- a/xen/include/xen/altp2m.h
+++ b/xen/include/xen/altp2m.h
@@ -13,13 +13,11 @@
  * regardless of CONFIG_ALTP2M
  */
 
-#ifdef CONFIG_X86
 /* Initialize altp2m views */
 int altp2m_init(struct domain *d);
 
 /* Free altp2m views */
 void altp2m_teardown(struct domain *d);
-#endif
 
 #ifdef CONFIG_ALTP2M
 
-- 
2.34.1


