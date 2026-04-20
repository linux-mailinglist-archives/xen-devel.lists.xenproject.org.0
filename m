Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id W5C3AZqb5ml8ywEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5126E43420F
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287764.1568181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwEp-0000KX-Bd; Mon, 20 Apr 2026 21:33:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287764.1568181; Mon, 20 Apr 2026 21:33:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwEp-0000GG-4S; Mon, 20 Apr 2026 21:33:03 +0000
Received: by outflank-mailman (input) for mailman id 1287764;
 Mon, 20 Apr 2026 21:33:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEwEn-0008Pq-3m
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:33:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEwEm-00CCKM-Gw
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:33:00 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b69-bab6-0a2a0a5309dd-0a2a450a8c08-16
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:00 +0200
Received: from [52.101.56.99]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b8a-56b3-0a2a450a0019-346538632a9f-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:00 +0200
Received: from IA1P220CA0016.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:464::10)
 by SJ2PR08MB8837.namprd08.prod.outlook.com (2603:10b6:a03:564::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Mon, 20 Apr
 2026 21:32:50 +0000
Received: from BL6PEPF0001AB4D.namprd04.prod.outlook.com
 (2603:10b6:208:464:cafe::5e) by IA1P220CA0016.outlook.office365.com
 (2603:10b6:208:464::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:32:50 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 BL6PEPF0001AB4D.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:32:49 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzzH454z6z1wdP; 
 Mon, 20 Apr 2026 14:32:48 -0700 (PDT)
Received: from SN1PR07CU001.outbound.protection.outlook.com
 (mail-sn1pr07cu00107.outbound.protection.outlook.com [40.93.14.103])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:32:48 -0700 (PDT)
Received: from SJ0PR13CA0185.namprd13.prod.outlook.com (2603:10b6:a03:2c3::10)
 by SA3PR08MB8827.namprd08.prod.outlook.com (2603:10b6:806:37f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Mon, 20 Apr
 2026 21:32:40 +0000
Received: from SJ1PEPF000026C7.namprd04.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::28) by SJ0PR13CA0185.outlook.office365.com
 (2603:10b6:a03:2c3::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:32:40 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 SJ1PEPF000026C7.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:32:39 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:32:36 +0200
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
 b=GN8IGpfUZKXiGY7c9btOQDr+GoZ9NhAHKxKGZApqy4Z+6Tthj8fq3U7jDU8dakJgTPnIhdW3KBoQ0zcxnhEatHbKICUQDBxdDlswf/kM1kaVvn/sOA/CJphfCq3ggtmM0qBxBNdp2HIHrsr4s0kNhRwE4O7rVk+ZNQA5N3oPRyQ4bR1wJqF/p5/qimckHPnceR0zymOSEsYmxeKHVNNBe1f38rH226E/Iayef8/+FE2JMVfXJzaNDzGvrmDfg5B1uSHHquRBkYQchbR5+GhiVALBaT9MInLtVbQ8P2523VP+clCXrQ3WWkEEl2s5qqqwLyTph74YC9ujVmi44DJEtQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Xr6LLXjzqnGjZ+q/CL1Op56Lgquh9rAvy51mivO1rA=;
 b=HXw4XFvnQA3/7yanLk0roDwMWU8a76QaiblqQCEnw5OP+vRvCe1HGAQv9sFDsWeowUAzkTgDxNxFLR49zjBCIELe64GIzdLUidzvG9Ulo1FTX4a0yTuPdRtcAd/9rP+mmvZ2atVt4BSynqpynLoByV0czsxqfijlFUtkaDB9l1kAIUqr8XLQF0rjoSsqYeK2dlJlNnNNF9c3n7Wmnu30jvKAtsbG+Fzx5E/mUIdmzJ7IfxpjHAW/gGm4GVD5qeYsE0zrR3C4+x4PAmWH/TaRWZTpBvr/K+O+0ehuYX4hIRpkNuRmNBKSiwSA+ZuReK7JygOl3jRUGX097CKA+bP+5Q==
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
 bh=2Xr6LLXjzqnGjZ+q/CL1Op56Lgquh9rAvy51mivO1rA=;
 b=qiO5/zCMqmeA5lbuxL9krbMOEb73xOg7AJaPX1XbKRo60LPPjL2lS1m7AEBxphlkiadTrbkwznHeLVD01cI1dGxROazNdjZ4cM2tvzjsIF/AlXbu5pb/rI9shVst6Zjb2QmWUtxy6LIDX0sKyVp/K9vDcqQ8V2sBvZVKDgkFbZI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.14.103)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.14.103 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.14.103; helo=SN1PR07CU001.outbound.protection.outlook.com;
 pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y6THxcZhbHOnZTXDmfiYtmfXKPFOUElAYwWhBP/7UPTV5n+FjHHwzHqlgPQeojAoUCYXcUQIUxtf2E5K+T/TvIuHJdXM8QEJxQd8q080ZSI6qtkwlHT/86PvEVcrz6UGh4jHxs6djzbYaamcygHGs6dap4CrYED4Bd2AV1TIX+Og/VaPgAXlmwLJK69tHyglL1xme0PEMSW2u/n9nFMsCXTr4jBTQI1GNmBi0SujJ14w05AtGc8MjIgB0NXtwvB1f5GU0/9dsBDQZXEfPRbE0t1BCg8W0MgRKX5RGSSIrBYJ/bh1MgAHmZfKw0ji2d/l9tnW5aMzHN5P16KZiQ8Lig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Xr6LLXjzqnGjZ+q/CL1Op56Lgquh9rAvy51mivO1rA=;
 b=Lm+FvvBi1KkUsChrTLrtvq08TlzmUBhR0mcZ2u5GeQTnn7SIBnRB+8NWqWgzvB1qv8tnjaK3e8fdzJQHbwDBDKQJWhNBrJ7mzjrATpplMcZD0Fby25TvE3eMw8ZMwzqaKF5ragtmY0hStT5hTega3r3oFeC/+dJv4t9h5XOf1oW3nA7u1STVF4/B2RUu0CR5TUOxn+IoW6wwQSO2nGVgQHdTE6f/+te4aEWIPr5dIYBYHtHg6y5AOvygf8jluOSOh1brg3PM2X8yQ7kItEMqGbpa9XkQMnuGB6vdxXqJcZN5KoVBU61rOeqimNZri7uxLykZQWcEkO8cJi2dIPlrXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Xr6LLXjzqnGjZ+q/CL1Op56Lgquh9rAvy51mivO1rA=;
 b=qiO5/zCMqmeA5lbuxL9krbMOEb73xOg7AJaPX1XbKRo60LPPjL2lS1m7AEBxphlkiadTrbkwznHeLVD01cI1dGxROazNdjZ4cM2tvzjsIF/AlXbu5pb/rI9shVst6Zjb2QmWUtxy6LIDX0sKyVp/K9vDcqQ8V2sBvZVKDgkFbZI=
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
	<roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>, Tamas K Lengyel
	<tamas@tklengyel.com>
Subject: [RFC PATCH v6 08/43] altp2m: Rename p2m_*_altp2m functions and move declarations out of p2m.h
Date: Mon, 20 Apr 2026 17:31:31 -0400
Message-ID: <20260420213206.208750-9-Rose.Spangler@elektrobit.com>
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
	SJ1PEPF000026C7:EE_|SA3PR08MB8827:EE_|BL6PEPF0001AB4D:EE_|SJ2PR08MB8837:EE_
X-MS-Office365-Filtering-Correlation-Id: 80cac74d-727e-469d-773a-08de9f245f42
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|36860700016|1800799024|7416014|376014|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?YDXCrlzhw+5E+4mRzkAVrN2MWVlW4Yupi+CYHIbVNMq0ihxZIZL28VOSG49i?=
 =?us-ascii?Q?XvQSOS91sTfg5X+hTNftuPTp0r3XL3SSj9Yx77nB3Wp82QJIK91h539tcwK7?=
 =?us-ascii?Q?8iytmJ4zJVg/RtamGVyFZMUWVcbo1gNROOxixLPpP3z23mmfs4jjWelCxHUm?=
 =?us-ascii?Q?0xm4WWBdfSroa4B1/cbqH6K7OSv71/ZaCr7UJ1beuGBb71QIJz57b69YEGuk?=
 =?us-ascii?Q?fRkufjKywUazvgA/TBjjJh46nuWwEY5LFL2I6RIPbNt/F/rmrbLtt1eS8SE+?=
 =?us-ascii?Q?QcYfjeJUkCzANo3H2LK033GBPSYI9Xu2wyoud2y+g6sjSkQgOyCRKIg5NLCg?=
 =?us-ascii?Q?TgyY5/IR++lFu6/90ImRoN2LBhR8MA8kIC3V9PsO5odQkcwefKsvL4q4ovtF?=
 =?us-ascii?Q?SYBRQwRtfuBo3YpwG9Fx3CQRdcPD0ZdOBKVgwmf1fvm+6Io7UxpGd9EJ0nZM?=
 =?us-ascii?Q?siCQ4x1/P9ZjnGUE5NY+N+nDCqegH5VdNwcNxrpgdamg4BGVDEifyqgUyUBd?=
 =?us-ascii?Q?gFO7cYSJ0QhUEPI6ZzTWv/fBdc7meo+DIhJ8pmiRb82WyDgUuCkU3dESlfHG?=
 =?us-ascii?Q?yVq4NhN924XpSXq0uPrObrlKH+g3t/zHO+ByVvlnaRodqvN1WOMokJSakM22?=
 =?us-ascii?Q?+DPwEYA2V2ILrmRqxoYhsCdq5VgQqw+LwSNQCH6AxtTFZ2ZHIf+Udyv+aiBS?=
 =?us-ascii?Q?u36dnuqlIvgLgc7Ek9K5RPgw12oVO6sRP4UrTXggTnn8jkDweHmjmU1SeX2I?=
 =?us-ascii?Q?kwz+8eXRx21VBvBLVDkp5egNNwcTIWmpIwzRRxuv3NS/qY0MgdAkhyh/efZk?=
 =?us-ascii?Q?6puoMIQX4417jOZyWYiDVgIRqQfT+Qipcqa4mtuBe0VJ3TCHfJj0yFZNem8/?=
 =?us-ascii?Q?6gRVTxUp5nP9ygZ4aUlw6OHfhUo8sGb8vk2Qdv3BX/IfciwM6UJDqOpDaGdn?=
 =?us-ascii?Q?QzlqnM765ntrWiIpkAgSmGFQi8xCUe8Lv6i21WTRoW716Hv5PN/siAUBfoYd?=
 =?us-ascii?Q?S128z4gyAGWJ0R2vy3nQ1nKzQKXdjs4oDu/8W8WnHOIg4mTKKPNIzluRshWV?=
 =?us-ascii?Q?RYcRecYxjWcTnC9HWy8SAh2EIu40ZSlggWiza1pT3n/lBSzbxtIcWYb9l24g?=
 =?us-ascii?Q?XHkL7tX+ehnLGfDDyissu2QxQrKJOyRJCadbYQyqZTNemChLx38ucxCXEBSz?=
 =?us-ascii?Q?xvtveDCQMZhOI1eWpc3Wfl473Swj1C6d7Tz//g=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(7416014)(376014)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 QxOZqGNcb7paGVJxIuWGfCynZUdsUllIrMA55a9MlNESC9eoPdxpiqKvPnJoba0AxHNzZyUMakCItYLoSVct/UIf1DB210QlWribOOSPj/migMq15ewoysuNrlQflbtdyY8gy1dvO9sD0RrbH24pY6oauu92aJBANeV+8J+UCkH+0CHrvmNpWLSfOSq0WPWnt0Vkb76oRwmHWLabiJJjpGcKfMpzpzmDMEp5E49RrGA4VL3soRJB0RPefrYkGyDRYB2IE4RxA5OxaiGRiGV5WuGWgH2fAbMtAC43kbaPw2wzHruBNC2XDdh3xvSrRg2xyzYMhogY6RMOAblaj6xSAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR08MB8827
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.14.103];domain=SN1PR07CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.14.103];domain=SN1PR07CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 BL6PEPF0001AB4D.namprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	719c4f26-f580-4e99-2fe9-08de9f245972
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|7416014|14060799003|35042699022|82310400026|156008|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Prvmx+lx90P58KIkTqTGnmhCtmegLIJkImUoZx8S+SY4ei7iqXxRafkSeiUQ?=
 =?us-ascii?Q?eA3H6obowB2cI7XLNqLFhE0n9bayrw+Xz9jx8sIMmUGfOjp/05ohwPMjVZjZ?=
 =?us-ascii?Q?YlkfGMiTQfTNp9XMuynRHjyHOmJ2XCbsBcCIWQyV8sHdDu/i2/fhE69o3ZHn?=
 =?us-ascii?Q?3dEQZLVjIEoOugjEr03Pr/v45dTLDUJSa1cRKJ3/9cWyHYNB63npXWCmsoXk?=
 =?us-ascii?Q?s2ndrZNfYbKh8MBaxPXgYdrcaeHw+B7WoqbgBM6ADTGQ9IMYQYpgWQRvainw?=
 =?us-ascii?Q?iJ6I8hKZRYHFdR5Pybz2ofETh/1HoukLw/GJnaAs/PQUCRNSrGLGaGwO+DCK?=
 =?us-ascii?Q?goZlnRDscJSJe/OJMrwj8u8MHbB6ftc+1lw3Cl5ofVbRQRI7w7ahFGJ0h/5E?=
 =?us-ascii?Q?dMwF19C9UN5NuHDbBczJ1B/PduBRozmKsqUhrPQH0zUTgImr3V5IPm4m/NGD?=
 =?us-ascii?Q?RqE0xlVa9a+fF2mnYXLi3yCooQxSWNavuwiXvtZwAjL6TJfMxP5rW6nj0dwG?=
 =?us-ascii?Q?gK559xegsfD9ENZQ5ixh712tkucfLiTbFC4xw/qsjOjbcGUczQUMfpPx/fbL?=
 =?us-ascii?Q?NJyFMkfHCI6PM1Dwpr2T1jZCbz4g90f+HIjo+ULXAj3Je2Ws1UeTjVxevmzG?=
 =?us-ascii?Q?9yaCnEi09fttaCKuj9PRLfDfUMf6FgUNdSEwXv68A4ncHdmK0FNWU4XuxZTb?=
 =?us-ascii?Q?j4TMtshID+zWOZHElBmE2K9znNZHOTaAV8mr8MgRUDTv1G0Uo8BvBAEojP5u?=
 =?us-ascii?Q?3rqhAuSE22WaLBDgl+nrL4BfqIg7+U3KxaDdM05D33A8JJD+MUQ7MUFnvcHw?=
 =?us-ascii?Q?FIqhgPu5ojXO+Ky/bOoRT2+XR+h4MwYxfZoP7HNCchLoggjgWV41HDc4WXHQ?=
 =?us-ascii?Q?cILctgAlqo+thPnlQprmCo8nKH10Ompfxhuo0MoEYY29p1nHgmE30EfaXOXi?=
 =?us-ascii?Q?xdPR/A5tvHLXuK0BkjQaalKx7g5/IkVkKBImkw3n6hXUfimdVuC/mrXIbYFN?=
 =?us-ascii?Q?SVXOfoaDGIe+xU4a6jcpWEKtXjTE1VQblsEnCdNwu1BPPDNU2mpqBMZiY7J9?=
 =?us-ascii?Q?b+gn/NOpHTCTWAGwbjYcAoeilpQlvI0614r0Sh5Sy9kSjY12JHPmj+k83ZQ0?=
 =?us-ascii?Q?OkVRJmgvo7QpZMgXtxvP7De5v28dcL6HlQq8ExVy9uttU4sf3M3ommDCsd7f?=
 =?us-ascii?Q?iBbjgNrRXi+h4T7nLwmqtxrkVEIZ0MkKElNfMw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN1PR07CU001.outbound.protection.outlook.com;PTR:mail-sn1pr07cu00107.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(7416014)(14060799003)(35042699022)(82310400026)(156008)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZjekY8MFl0nXFrjGpv9K0LoMduEov5ssr96fU6DEHfseF+iCh0exQjhFqNZ2W06QSYvWk5ninQEl1+c4cYigKoD5v/eWCCD6N0uzi0KX4cPu8TtuLHcsNoOStOO744oZvpIPorK/BFK3k7AhxQ5EDTVZGvtyOGmKiqWnkjcaWmOwAuYMPXOOgYSwefEu30KOxMw4WjkuUgy/M0I2mWbyPYCcnTjQRHRj/Ih5UpRXsdstJiXyxCl2SnVRfk2wCwQZ6YBpb9GmN+vf+ZSvTcE9bU4YaKcE4887HiTXqnkOz4Ny+A3MECXQlY4abfkYf70WFYKsRwwQnx3FeHXmXLSgzEtyaFDpZ6Ijog+OKxJQQP3B6jwe8ATUwmoN6rxfeHVcmKN3mWvzlL8IiSrLnSaHnmVyiSXB2iC16n/DpHsWSg324s4Xb9H+BvY5/pOxvtZb
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:32:49.5644
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80cac74d-727e-469d-773a-08de9f245f42
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB4D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR08MB8837
X-purgate-ID: tlsNG-4011c0/1776720780-4777D8B7-72F31C00/0/0
X-purgate-type: clean
X-purgate-size: 32242
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
	RCPT_COUNT_TWELVE(0.00)[13];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:tamas@tklengyel.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[17];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[elektrobit.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.144];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 5126E43420F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This commit renames altp2m functions with a p2m prefix. These functions
were originally defined in p2m.c, hence the p2m prefix. When they were
moved to altp2m.c in commit ae7584f63678, the function names were kept and
the declarations remained in p2m.h. This commit finishes that move by
renaming these functions to have an altp2m prefix and moving the
declarations to altp2m.h.

Since these functions will either be moved to the common altp2m.c, or
implemented separately for ARM, it doesn't seem to make sense to continue
with this naming convention. Therefore, this commit preemptively renames
the x86 implementations of these functions so they can later be implemented
with altp2m function name prefixes in common code or for ARM.

For convenience, here is the full list of renames:
- p2m_init_altp2m -> altp2m_init
- p2m_teardown_altp2m -> altp2m_teardown
- p2m_flush_altp2m -> altp2m_flush
- p2m_altp2m_get_or_propagate -> altp2m_get_or_propagate
- p2m_altp2m_propagate_change -> altp2m_propagate_change
- p2m_get_altp2m -> altp2m_get_altp2m
- p2m_set_altp2m -> altp2m_set_altp2m
- p2m_reset_altp2m -> altp2m_reset_altp2m
- p2m_activate_altp2m -> altp2m_activate_altp2m
- p2m_init_altp2m_by_id -> altp2m_init_by_id
- p2m_init_next_altp2m -> altp2m_init_next_available
- p2m_destroy_altp2m_by_id -> altp2m_destroy_by_id
- p2m_switch_domain_altp2m_by_id -> altp2m_switch_domain_altp2m_by_id
- p2m_change_altp2m_gfn -> altp2m_change_gfn
- p2m_set_altp2m_view_visibility -> altp2m_set_view_visibility

This commit contains only function renames and code movement, and no
functional change is intended.

This is commit 8/8 of the preparation phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.
---
 xen/arch/arm/altp2m.c             |   2 +-
 xen/arch/x86/hvm/hvm.c            |  30 ++++----
 xen/arch/x86/hvm/monitor.c        |   2 +-
 xen/arch/x86/hvm/vmx/vmx.c        |   6 +-
 xen/arch/x86/include/asm/altp2m.h | 116 +++++++++++++++++++++++++++++-
 xen/arch/x86/include/asm/p2m.h    | 109 ----------------------------
 xen/arch/x86/mm/altp2m.c          |  76 ++++++++++----------
 xen/arch/x86/mm/mem_access.c      |  13 ++--
 xen/arch/x86/mm/p2m-basic.c       |   4 +-
 xen/arch/x86/mm/p2m-ept.c         |   4 +-
 xen/arch/x86/mm/p2m.h             |   3 -
 xen/common/vm_event.c             |   2 +-
 xen/include/xen/p2m-common.h      |   2 +-
 13 files changed, 186 insertions(+), 183 deletions(-)

diff --git a/xen/arch/arm/altp2m.c b/xen/arch/arm/altp2m.c
index 8bd174ea8f37..339f82835caf 100644
--- a/xen/arch/arm/altp2m.c
+++ b/xen/arch/arm/altp2m.c
@@ -8,7 +8,7 @@
 #include <asm/p2m.h>
 
 /* Check to see if vcpu should be switched to a different p2m. */
-void p2m_altp2m_check(struct vcpu *v, uint16_t idx)
+void altp2m_check(struct vcpu *v, uint16_t idx)
 {
     /* Not yet implemented */
     BUG();
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index bc35efdf2c02..5b6e91adce17 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1885,15 +1885,15 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
 
     if ( altp2m_active(currd) )
     {
-        p2m = p2m_get_altp2m(curr);
+        p2m = altp2m_get_altp2m(curr);
 
         /*
          * Get the altp2m entry if present; or if not, propagate from
          * the host p2m.  NB that this returns with gfn locked in the
          * altp2m.
          */
-        if ( p2m_altp2m_get_or_propagate(p2m, gfn, &mfn, &p2mt,
-                                         &p2ma, &page_order) )
+        if ( altp2m_get_or_propagate(p2m, gfn, &mfn, &p2mt, &p2ma,
+                                     &page_order) )
         {
             /* Entry was copied from host -- retry fault */
             rc = 1;
@@ -2036,7 +2036,7 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
             paging_mark_pfn_dirty(currd, _pfn(gfn));
             /*
              * If p2m is really an altp2m, unlock it before changing the type,
-             * as p2m_altp2m_propagate_change() needs to acquire the
+             * as altp2m_propagate_change() needs to acquire the
              * altp2m_list lock.
              */
             if ( p2m != hostp2m )
@@ -4663,7 +4663,7 @@ static int do_altp2m_op(
 
         /* If the alternate p2m state has changed, handle appropriately */
         if ( d->altp2m_active != ostate &&
-             (ostate || !(rc = p2m_init_altp2m_by_id(d, 0))) )
+             (ostate || !(rc = altp2m_init_by_id(d, 0))) )
         {
             for_each_vcpu( d, v )
             {
@@ -4674,7 +4674,7 @@ static int do_altp2m_op(
             }
 
             if ( ostate )
-                p2m_flush_altp2m(d);
+                altp2m_flush(d);
         }
         else if ( rc )
             d->altp2m_active = false;
@@ -4729,17 +4729,18 @@ static int do_altp2m_op(
     }
 
     case HVMOP_altp2m_create_p2m:
-        if ( !(rc = p2m_init_next_altp2m(d, &a.u.view.view,
-                                         a.u.view.hvmmem_default_access)) )
+        rc = altp2m_init_next_available(d, &a.u.view.view,
+                                        a.u.view.hvmmem_default_access);
+        if ( !rc )
             rc = __copy_to_guest(arg, &a, 1) ? -EFAULT : 0;
         break;
 
     case HVMOP_altp2m_destroy_p2m:
-        rc = p2m_destroy_altp2m_by_id(d, a.u.view.view);
+        rc = altp2m_destroy_by_id(d, a.u.view.view);
         break;
 
     case HVMOP_altp2m_switch_p2m:
-        rc = p2m_switch_domain_altp2m_by_id(d, a.u.view.view);
+        rc = altp2m_switch_domain_altp2m_by_id(d, a.u.view.view);
         break;
 
     case HVMOP_altp2m_set_suppress_ve:
@@ -4871,9 +4872,9 @@ static int do_altp2m_op(
         if ( a.u.change_gfn.pad1 || a.u.change_gfn.pad2 )
             rc = -EINVAL;
         else
-            rc = p2m_change_altp2m_gfn(d, a.u.change_gfn.view,
-                    _gfn(a.u.change_gfn.old_gfn),
-                    _gfn(a.u.change_gfn.new_gfn));
+            rc = altp2m_change_gfn(d, a.u.change_gfn.view,
+                                   _gfn(a.u.change_gfn.old_gfn),
+                                   _gfn(a.u.change_gfn.new_gfn));
         break;
 
     case HVMOP_altp2m_get_p2m_idx:
@@ -4906,8 +4907,7 @@ static int do_altp2m_op(
         else if ( !altp2m_active(d) )
             rc = -EOPNOTSUPP;
         else
-            rc = p2m_set_altp2m_view_visibility(d, idx,
-                                                a.u.set_visibility.visible);
+            rc = altp2m_set_view_visibility(d, idx, a.u.set_visibility.visible);
         break;
     }
 
diff --git a/xen/arch/x86/hvm/monitor.c b/xen/arch/x86/hvm/monitor.c
index 84c1c2234ca9..78137220b22a 100644
--- a/xen/arch/x86/hvm/monitor.c
+++ b/xen/arch/x86/hvm/monitor.c
@@ -182,7 +182,7 @@ int hvm_monitor_debug(unsigned long rip, enum hvm_monitor_debug_type type,
 #ifdef CONFIG_ALTP2M
         if ( curr->arch.hvm.fast_single_step.enabled )
         {
-            p2m_altp2m_check(curr, curr->arch.hvm.fast_single_step.p2midx);
+            altp2m_check(curr, curr->arch.hvm.fast_single_step.p2midx);
             curr->arch.hvm.single_step = false;
             curr->arch.hvm.fast_single_step.enabled = false;
             curr->arch.hvm.fast_single_step.p2midx = 0;
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 0909929c00e0..f2cf95ee500e 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2452,7 +2452,7 @@ static void cf_check vmx_vcpu_update_eptp(struct vcpu *v)
     struct ept_data *ept;
 
     if ( altp2m_active(d) )
-        p2m = p2m_get_altp2m(v);
+        p2m = altp2m_get_altp2m(v);
     if ( !p2m )
         p2m = p2m_get_hostp2m(d);
 
@@ -2521,7 +2521,7 @@ static int cf_check vmx_vcpu_emulate_vmfunc(const struct cpu_user_regs *regs)
 
     if ( !cpu_has_vmx_vmfunc && altp2m_active(curr->domain) &&
          regs->eax == 0 &&
-         p2m_switch_vcpu_altp2m_by_id(curr, regs->ecx) )
+         altp2m_switch_vcpu_by_id(curr, regs->ecx) )
         rc = X86EMUL_OKAY;
 
     return rc;
@@ -4277,7 +4277,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
             }
         }
 
-        p2m_set_altp2m(v, idx);
+        altp2m_set_altp2m(v, idx);
     }
 
     if ( vm_event_is_enabled(v) &&
diff --git a/xen/arch/x86/include/asm/altp2m.h b/xen/arch/x86/include/asm/altp2m.h
index 07e760f60659..9c58a396448d 100644
--- a/xen/arch/x86/include/asm/altp2m.h
+++ b/xen/arch/x86/include/asm/altp2m.h
@@ -7,12 +7,33 @@
 #ifndef __ASM_X86_ALTP2M_H
 #define __ASM_X86_ALTP2M_H
 
-#ifdef CONFIG_ALTP2M
 
 #include <xen/types.h>
 #include <xen/sched.h>         /* for struct vcpu, struct domain */
+
+#include <asm/p2m.h>
 #include <asm/hvm/vcpu.h>      /* for vcpu_altp2m */
 
+/*
+ * Common alternate p2m declarations that need to be visible
+ * regardless of CONFIG_ALTP2M
+ */
+
+/* Alternate p2m paging */
+bool altp2m_get_or_propagate(struct p2m_domain *ap2m, unsigned long gfn_l,
+                             mfn_t *mfn, p2m_type_t *p2mt, p2m_access_t *p2ma,
+                             unsigned int *page_order);
+
+/* Propagate a host p2m change to all alternate p2m's */
+int altp2m_propagate_change(struct domain *d, gfn_t gfn, mfn_t mfn,
+                            unsigned int page_order, p2m_type_t p2mt,
+                            p2m_access_t p2ma);
+
+#ifdef CONFIG_ALTP2M
+
+#define AP2MGET_prepopulate true
+#define AP2MGET_query false
+
 static inline bool altp2m_is_eptp_valid(const struct domain *d,
                                         unsigned int idx)
 {
@@ -39,6 +60,85 @@ static inline uint16_t altp2m_vcpu_idx(const struct vcpu *v)
     return vcpu_altp2m(v).p2midx;
 }
 
+/*
+ * Alternate p2m: shadow p2m tables used for alternate memory views
+ */
+
+/* get current alternate p2m table */
+static inline struct p2m_domain *altp2m_get_altp2m(struct vcpu *v)
+{
+    unsigned int index = vcpu_altp2m(v).p2midx;
+
+    if ( index == INVALID_ALTP2M )
+        return NULL;
+
+    BUG_ON(index >= v->domain->nr_altp2m);
+
+    return v->domain->altp2m_p2m[index];
+}
+
+/* set current alternate p2m table */
+static inline bool altp2m_set_altp2m(struct vcpu *v, unsigned int idx)
+{
+    struct p2m_domain *orig;
+
+    BUG_ON(idx >= v->domain->nr_altp2m);
+
+    if ( idx == vcpu_altp2m(v).p2midx )
+        return false;
+
+    orig = altp2m_get_altp2m(v);
+    BUG_ON(!orig);
+    atomic_dec(&orig->active_vcpus);
+
+    vcpu_altp2m(v).p2midx = idx;
+    atomic_inc(&v->domain->altp2m_p2m[idx]->active_vcpus);
+
+    return true;
+}
+
+/* Initialize altp2m views */
+int altp2m_init(struct domain *d);
+
+/* Free altp2m views */
+void altp2m_teardown(struct domain *d);
+
+/* Switch alternate p2m for a single vcpu */
+bool altp2m_switch_vcpu_by_id(struct vcpu *v, unsigned int idx);
+
+/* Flush all the alternate p2m's for a domain */
+void altp2m_flush(struct domain *d);
+
+/* Make a specific alternate p2m valid */
+int altp2m_init_by_id(struct domain *d, unsigned int idx);
+
+/* Find an available alternate p2m and make it valid */
+int altp2m_init_next_available(struct domain *d, uint16_t *idx,
+                               xenmem_access_t hvmmem_default_access);
+
+/* Make a specific alternate p2m invalid */
+int altp2m_destroy_by_id(struct domain *d, unsigned int idx);
+
+/* Switch alternate p2m for entire domain */
+int altp2m_switch_domain_altp2m_by_id(struct domain *d, unsigned int idx);
+
+/* Change a gfn->mfn mapping */
+int altp2m_change_gfn(struct domain *d, unsigned int idx, gfn_t old_gfn,
+                      gfn_t new_gfn);
+
+/* Set a specific p2m view visibility */
+int altp2m_set_view_visibility(struct domain *d, unsigned int altp2m_idx,
+                               uint8_t visible);
+
+/*
+ * Looks up altp2m entry. If the entry is not found it looks up the entry in
+ * hostp2m.
+ * The prepopulate param is used to set the found entry in altp2m.
+ */
+int altp2m_get_effective_entry(struct p2m_domain *ap2m, gfn_t gfn, mfn_t *mfn,
+                               p2m_type_t *t, p2m_access_t *a,
+                               bool prepopulate);
+
 /* Alternate p2m VCPU */
 void altp2m_vcpu_initialise(struct vcpu *v);
 void altp2m_vcpu_destroy(struct vcpu *v);
@@ -69,7 +169,21 @@ static inline bool altp2m_supported(void)
     return false;
 }
 
+static inline int _altp2m_get_effective_entry(struct p2m_domain *ap2m,
+                                             gfn_t gfn, mfn_t *mfn,
+                                             p2m_type_t *t, p2m_access_t *a)
+{
+    ASSERT_UNREACHABLE();
+    return -EOPNOTSUPP;
+}
+#define altp2m_get_effective_entry(ap2m, gfn, mfn, t, a, prepopulate) \
+        _altp2m_get_effective_entry(ap2m, gfn, mfn, t, a)
+
 /* Only declaration is needed. DCE will optimise it out when linking. */
+int altp2m_init(struct domain *d);
+void altp2m_teardown(struct domain *d);
+struct p2m_domain *altp2m_get_altp2m(struct vcpu *v);
+bool altp2m_set_altp2m(struct vcpu *v, unsigned int idx);
 uint16_t altp2m_vcpu_idx(const struct vcpu *v);
 void altp2m_vcpu_initialise(struct vcpu *v);
 void altp2m_vcpu_destroy(struct vcpu *v);
diff --git a/xen/arch/x86/include/asm/p2m.h b/xen/arch/x86/include/asm/p2m.h
index ec871717a9e4..5110b3e77807 100644
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -582,30 +582,6 @@ static inline gfn_t mfn_to_gfn(const struct domain *d, mfn_t mfn)
         return _gfn(mfn_x(mfn));
 }
 
-#ifdef CONFIG_ALTP2M
-#define AP2MGET_prepopulate true
-#define AP2MGET_query false
-
-/*
- * Looks up altp2m entry. If the entry is not found it looks up the entry in
- * hostp2m.
- * The prepopulate param is used to set the found entry in altp2m.
- */
-int altp2m_get_effective_entry(struct p2m_domain *ap2m, gfn_t gfn, mfn_t *mfn,
-                               p2m_type_t *t, p2m_access_t *a,
-                               bool prepopulate);
-#else
-static inline int _altp2m_get_effective_entry(struct p2m_domain *ap2m,
-                                             gfn_t gfn, mfn_t *mfn,
-                                             p2m_type_t *t, p2m_access_t *a)
-{
-    ASSERT_UNREACHABLE();
-    return -EOPNOTSUPP;
-}
-#define altp2m_get_effective_entry(ap2m, gfn, mfn, t, a, prepopulate) \
-        _altp2m_get_effective_entry(ap2m, gfn, mfn, t, a)
-#endif
-
 /* Init the datastructures for later use by the p2m code */
 int p2m_init(struct domain *d);
 
@@ -885,91 +861,6 @@ void shadow_p2m_init(struct p2m_domain *p2m);
 void cf_check nestedp2m_write_p2m_entry_post(
     struct p2m_domain *p2m, unsigned int oflags);
 
-#ifdef CONFIG_ALTP2M
-
-/*
- * Alternate p2m: shadow p2m tables used for alternate memory views
- */
-
-/* get current alternate p2m table */
-static inline struct p2m_domain *p2m_get_altp2m(struct vcpu *v)
-{
-    unsigned int index = vcpu_altp2m(v).p2midx;
-
-    if ( index == INVALID_ALTP2M )
-        return NULL;
-
-    BUG_ON(index >= v->domain->nr_altp2m);
-
-    return v->domain->altp2m_p2m[index];
-}
-
-/* set current alternate p2m table */
-static inline bool p2m_set_altp2m(struct vcpu *v, unsigned int idx)
-{
-    struct p2m_domain *orig;
-
-    BUG_ON(idx >= v->domain->nr_altp2m);
-
-    if ( idx == vcpu_altp2m(v).p2midx )
-        return false;
-
-    orig = p2m_get_altp2m(v);
-    BUG_ON(!orig);
-    atomic_dec(&orig->active_vcpus);
-
-    vcpu_altp2m(v).p2midx = idx;
-    atomic_inc(&v->domain->altp2m_p2m[idx]->active_vcpus);
-
-    return true;
-}
-
-/* Switch alternate p2m for a single vcpu */
-bool p2m_switch_vcpu_altp2m_by_id(struct vcpu *v, unsigned int idx);
-
-/* Flush all the alternate p2m's for a domain */
-void p2m_flush_altp2m(struct domain *d);
-
-/* Make a specific alternate p2m valid */
-int p2m_init_altp2m_by_id(struct domain *d, unsigned int idx);
-
-/* Find an available alternate p2m and make it valid */
-int p2m_init_next_altp2m(struct domain *d, uint16_t *idx,
-                         xenmem_access_t hvmmem_default_access);
-
-/* Make a specific alternate p2m invalid */
-int p2m_destroy_altp2m_by_id(struct domain *d, unsigned int idx);
-
-/* Switch alternate p2m for entire domain */
-int p2m_switch_domain_altp2m_by_id(struct domain *d, unsigned int idx);
-
-/* Change a gfn->mfn mapping */
-int p2m_change_altp2m_gfn(struct domain *d, unsigned int idx,
-                          gfn_t old_gfn, gfn_t new_gfn);
-
-/* Set a specific p2m view visibility */
-int p2m_set_altp2m_view_visibility(struct domain *d, unsigned int altp2m_idx,
-                                   uint8_t visible);
-
-#else /* !CONFIG_ALTP2M */
-struct p2m_domain *p2m_get_altp2m(struct vcpu *v);
-bool p2m_set_altp2m(struct vcpu *v, unsigned int idx);
-#endif /* CONFIG_ALTP2M */
-
-/*
- * Common alternate p2m declarations that need to be visible
- * regardless of CONFIG_ALTP2M
- */
-
-/* Alternate p2m paging */
-bool p2m_altp2m_get_or_propagate(struct p2m_domain *ap2m, unsigned long gfn_l,
-                                 mfn_t *mfn, p2m_type_t *p2mt,
-                                 p2m_access_t *p2ma, unsigned int *page_order);
-                                 
-/* Propagate a host p2m change to all alternate p2m's */
-int p2m_altp2m_propagate_change(struct domain *d, gfn_t gfn,
-                                mfn_t mfn, unsigned int page_order,
-                                p2m_type_t p2mt, p2m_access_t p2ma);
 #endif /* CONFIG_HVM */
 
 /* p2m access to IOMMU flags */
diff --git a/xen/arch/x86/mm/altp2m.c b/xen/arch/x86/mm/altp2m.c
index 8dd3c0f96be0..2dc84b76b8c1 100644
--- a/xen/arch/x86/mm/altp2m.c
+++ b/xen/arch/x86/mm/altp2m.c
@@ -24,7 +24,7 @@ altp2m_vcpu_initialise(struct vcpu *v)
         vcpu_pause(v);
 
     vcpu_altp2m(v).p2midx = 0;
-    atomic_inc(&p2m_get_altp2m(v)->active_vcpus);
+    atomic_inc(&altp2m_get_altp2m(v)->active_vcpus);
 
     altp2m_vcpu_update_p2m(v);
 
@@ -43,7 +43,7 @@ altp2m_vcpu_destroy(struct vcpu *v)
     if ( v != current )
         vcpu_pause(v);
 
-    if ( (p2m = p2m_get_altp2m(v)) )
+    if ( (p2m = altp2m_get_altp2m(v)) )
         atomic_dec(&p2m->active_vcpus);
 
     altp2m_vcpu_disable_ve(v);
@@ -123,7 +123,7 @@ void altp2m_vcpu_disable_ve(struct vcpu *v)
     }
 }
 
-int p2m_init_altp2m(struct domain *d)
+int altp2m_init(struct domain *d)
 {
     unsigned int i;
     struct p2m_domain *p2m;
@@ -140,7 +140,7 @@ int p2m_init_altp2m(struct domain *d)
         d->altp2m_p2m[i] = p2m = p2m_init_one(d);
         if ( p2m == NULL )
         {
-            p2m_teardown_altp2m(d);
+            altp2m_teardown(d);
             return -ENOMEM;
         }
         p2m->p2m_class = p2m_alternate;
@@ -151,7 +151,7 @@ int p2m_init_altp2m(struct domain *d)
     return 0;
 }
 
-void p2m_teardown_altp2m(struct domain *d)
+void altp2m_teardown(struct domain *d)
 {
     unsigned int i;
     struct p2m_domain *p2m;
@@ -207,13 +207,13 @@ int altp2m_get_effective_entry(struct p2m_domain *ap2m, gfn_t gfn, mfn_t *mfn,
     return 0;
 }
 
-void p2m_altp2m_check(struct vcpu *v, uint16_t idx)
+void altp2m_check(struct vcpu *v, uint16_t idx)
 {
     if ( altp2m_active(v->domain) )
-        p2m_switch_vcpu_altp2m_by_id(v, idx);
+        altp2m_switch_vcpu_by_id(v, idx);
 }
 
-bool p2m_switch_vcpu_altp2m_by_id(struct vcpu *v, unsigned int idx)
+bool altp2m_switch_vcpu_by_id(struct vcpu *v, unsigned int idx)
 {
     struct domain *d = v->domain;
     bool rc = false;
@@ -225,7 +225,7 @@ bool p2m_switch_vcpu_altp2m_by_id(struct vcpu *v, unsigned int idx)
 
     if ( d->arch.altp2m_eptp[idx] != mfn_x(INVALID_MFN) )
     {
-        if ( p2m_set_altp2m(v, idx) )
+        if ( altp2m_set_altp2m(v, idx) )
             altp2m_vcpu_update_p2m(v);
         rc = 1;
     }
@@ -246,9 +246,9 @@ bool p2m_switch_vcpu_altp2m_by_id(struct vcpu *v, unsigned int idx)
  * the host's entry to the altp2m (retaining page order), and indicate
  * that the caller should re-try the faulting instruction.
  */
-bool p2m_altp2m_get_or_propagate(struct p2m_domain *ap2m, unsigned long gfn_l,
-                                 mfn_t *mfn, p2m_type_t *p2mt,
-                                 p2m_access_t *p2ma, unsigned int *page_order)
+bool altp2m_get_or_propagate(struct p2m_domain *ap2m, unsigned long gfn_l,
+                             mfn_t *mfn, p2m_type_t *p2mt, p2m_access_t *p2ma,
+                             unsigned int *page_order)
 {
     p2m_type_t ap2mt;
     p2m_access_t ap2ma;
@@ -319,8 +319,8 @@ enum altp2m_reset_type {
     ALTP2M_DEACTIVATE
 };
 
-static void p2m_reset_altp2m(struct domain *d, unsigned int idx,
-                             enum altp2m_reset_type reset_type)
+static void altp2m_reset_altp2m(struct domain *d, unsigned int idx,
+                                enum altp2m_reset_type reset_type)
 {
     struct p2m_domain *p2m;
 
@@ -344,7 +344,7 @@ static void p2m_reset_altp2m(struct domain *d, unsigned int idx,
     p2m_unlock(p2m);
 }
 
-void p2m_flush_altp2m(struct domain *d)
+void altp2m_flush(struct domain *d)
 {
     unsigned int i;
 
@@ -352,7 +352,7 @@ void p2m_flush_altp2m(struct domain *d)
 
     for ( i = 0; i < d->nr_altp2m; i++ )
     {
-        p2m_reset_altp2m(d, i, ALTP2M_DEACTIVATE);
+        altp2m_reset_altp2m(d, i, ALTP2M_DEACTIVATE);
         d->arch.altp2m_eptp[i] = mfn_x(INVALID_MFN);
         d->arch.altp2m_visible_eptp[i] = mfn_x(INVALID_MFN);
     }
@@ -360,8 +360,8 @@ void p2m_flush_altp2m(struct domain *d)
     altp2m_list_unlock(d);
 }
 
-static int p2m_activate_altp2m(struct domain *d, unsigned int idx,
-                               p2m_access_t hvmmem_default_access)
+static int altp2m_activate_altp2m(struct domain *d, unsigned int idx,
+                                  p2m_access_t hvmmem_default_access)
 {
     struct p2m_domain *hostp2m, *p2m;
     int rc;
@@ -399,9 +399,9 @@ static int p2m_activate_altp2m(struct domain *d, unsigned int idx,
     p2m_unlock(p2m);
 
     return rc;
-}
+ }
 
-int p2m_init_altp2m_by_id(struct domain *d, unsigned int idx)
+int altp2m_init_by_id(struct domain *d, unsigned int idx)
 {
     int rc = -EINVAL;
     struct p2m_domain *hostp2m = p2m_get_hostp2m(d);
@@ -413,14 +413,14 @@ int p2m_init_altp2m_by_id(struct domain *d, unsigned int idx)
 
     if ( d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] ==
          mfn_x(INVALID_MFN) )
-        rc = p2m_activate_altp2m(d, idx, hostp2m->default_access);
+        rc = altp2m_activate_altp2m(d, idx, hostp2m->default_access);
 
     altp2m_list_unlock(d);
     return rc;
 }
 
-int p2m_init_next_altp2m(struct domain *d, uint16_t *idx,
-                         xenmem_access_t hvmmem_default_access)
+int altp2m_init_next_available(struct domain *d, uint16_t *idx,
+                               xenmem_access_t hvmmem_default_access)
 {
     int rc = -EINVAL;
     unsigned int i;
@@ -438,7 +438,7 @@ int p2m_init_next_altp2m(struct domain *d, uint16_t *idx,
         if ( d->arch.altp2m_eptp[i] != mfn_x(INVALID_MFN) )
             continue;
 
-        rc = p2m_activate_altp2m(d, i, a);
+        rc = altp2m_activate_altp2m(d, i, a);
 
         if ( !rc )
             *idx = i;
@@ -450,7 +450,7 @@ int p2m_init_next_altp2m(struct domain *d, uint16_t *idx,
     return rc;
 }
 
-int p2m_destroy_altp2m_by_id(struct domain *d, unsigned int idx)
+int altp2m_destroy_by_id(struct domain *d, unsigned int idx)
 {
     struct p2m_domain *p2m;
     int rc = -EBUSY;
@@ -472,7 +472,7 @@ int p2m_destroy_altp2m_by_id(struct domain *d, unsigned int idx)
 
         if ( !_atomic_read(p2m->active_vcpus) )
         {
-            p2m_reset_altp2m(d, idx, ALTP2M_DEACTIVATE);
+            altp2m_reset_altp2m(d, idx, ALTP2M_DEACTIVATE);
             d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] =
                 mfn_x(INVALID_MFN);
             d->arch.altp2m_visible_eptp[array_index_nospec(idx, MAX_EPTP)] =
@@ -488,7 +488,7 @@ int p2m_destroy_altp2m_by_id(struct domain *d, unsigned int idx)
     return rc;
 }
 
-int p2m_switch_domain_altp2m_by_id(struct domain *d, unsigned int idx)
+int altp2m_switch_domain_altp2m_by_id(struct domain *d, unsigned int idx)
 {
     struct vcpu *v;
     int rc = -EINVAL;
@@ -506,7 +506,7 @@ int p2m_switch_domain_altp2m_by_id(struct domain *d, unsigned int idx)
     if ( d->arch.altp2m_visible_eptp[idx] != mfn_x(INVALID_MFN) )
     {
         for_each_vcpu( d, v )
-            if ( p2m_set_altp2m(v, idx) )
+            if ( altp2m_set_altp2m(v, idx) )
                 altp2m_vcpu_update_p2m(v);
 
         rc = 0;
@@ -519,8 +519,8 @@ int p2m_switch_domain_altp2m_by_id(struct domain *d, unsigned int idx)
     return rc;
 }
 
-int p2m_change_altp2m_gfn(struct domain *d, unsigned int idx,
-                          gfn_t old_gfn, gfn_t new_gfn)
+int altp2m_change_gfn(struct domain *d, unsigned int idx, gfn_t old_gfn,
+                      gfn_t new_gfn)
 {
     struct p2m_domain *hp2m, *ap2m;
     p2m_access_t a;
@@ -571,11 +571,11 @@ int p2m_change_altp2m_gfn(struct domain *d, unsigned int idx,
     p2m_unlock(ap2m);
     p2m_unlock(hp2m);
     return rc;
-}
+ }
 
-int p2m_altp2m_propagate_change(struct domain *d, gfn_t gfn,
-                                mfn_t mfn, unsigned int page_order,
-                                p2m_type_t p2mt, p2m_access_t p2ma)
+int altp2m_propagate_change(struct domain *d, gfn_t gfn, mfn_t mfn,
+                            unsigned int page_order, p2m_type_t p2mt,
+                            p2m_access_t p2ma)
 {
     struct p2m_domain *p2m;
     unsigned int i;
@@ -605,7 +605,7 @@ int p2m_altp2m_propagate_change(struct domain *d, gfn_t gfn,
         {
             if ( !reset_count++ )
             {
-                p2m_reset_altp2m(d, i, ALTP2M_RESET);
+                altp2m_reset_altp2m(d, i, ALTP2M_RESET);
                 last_reset_idx = i;
             }
             else
@@ -617,7 +617,7 @@ int p2m_altp2m_propagate_change(struct domain *d, gfn_t gfn,
                          d->arch.altp2m_eptp[i] == mfn_x(INVALID_MFN) )
                         continue;
 
-                    p2m_reset_altp2m(d, i, ALTP2M_RESET);
+                    altp2m_reset_altp2m(d, i, ALTP2M_RESET);
                 }
 
                 ret = 0;
@@ -768,8 +768,8 @@ int p2m_get_suppress_ve(struct domain *d, gfn_t gfn, bool *suppress_ve,
     return rc;
 }
 
-int p2m_set_altp2m_view_visibility(struct domain *d, unsigned int altp2m_idx,
-                                   uint8_t visible)
+int altp2m_set_view_visibility(struct domain *d, unsigned int altp2m_idx,
+                               uint8_t visible)
 {
     int rc = 0;
 
diff --git a/xen/arch/x86/mm/mem_access.c b/xen/arch/x86/mm/mem_access.c
index e5548e64d8d0..0492356d99ad 100644
--- a/xen/arch/x86/mm/mem_access.c
+++ b/xen/arch/x86/mm/mem_access.c
@@ -81,7 +81,7 @@ bool p2m_mem_access_emulate_check(struct vcpu *v,
     struct p2m_domain *p2m = NULL;
 
     if ( altp2m_active(d) )
-        p2m = p2m_get_altp2m(v);
+        p2m = altp2m_get_altp2m(v);
     if ( !p2m )
         p2m = p2m_get_hostp2m(d);
 
@@ -145,7 +145,7 @@ bool p2m_mem_access_check(paddr_t gpa, unsigned long gla,
     int rc;
 
     if ( altp2m_active(d) )
-        p2m = p2m_get_altp2m(v);
+        p2m = altp2m_get_altp2m(v);
     if ( !p2m )
         p2m = p2m_get_hostp2m(d);
 
@@ -252,9 +252,10 @@ bool p2m_mem_access_check(paddr_t gpa, unsigned long gla,
     return (p2ma != p2m_access_n2rwx);
 }
 
-static int p2m_set_altp2m_mem_access(struct domain *d, struct p2m_domain *hp2m,
-                                     struct p2m_domain *ap2m, p2m_access_t a,
-                                     gfn_t gfn)
+static int altp2m_set_altp2m_mem_access(struct domain *d,
+                                        struct p2m_domain *hp2m,
+                                        struct p2m_domain *ap2m, p2m_access_t a,
+                                        gfn_t gfn)
 {
     mfn_t mfn;
     p2m_type_t t;
@@ -281,7 +282,7 @@ static int set_mem_access(struct domain *d, struct p2m_domain *p2m,
 
     if ( ap2m )
     {
-        rc = p2m_set_altp2m_mem_access(d, p2m, ap2m, a, gfn);
+        rc = altp2m_set_altp2m_mem_access(d, p2m, ap2m, a, gfn);
         /* If the corresponding mfn is invalid we will want to just skip it */
         if ( rc == -ESRCH )
             rc = 0;
diff --git a/xen/arch/x86/mm/p2m-basic.c b/xen/arch/x86/mm/p2m-basic.c
index ce14066fedaf..433e7d08b78f 100644
--- a/xen/arch/x86/mm/p2m-basic.c
+++ b/xen/arch/x86/mm/p2m-basic.c
@@ -128,7 +128,7 @@ int p2m_init(struct domain *d)
         return rc;
     }
 
-    rc = altp2m_supported() ? p2m_init_altp2m(d) : 0;
+    rc = altp2m_supported() ? altp2m_init(d) : 0;
     if ( rc )
     {
         p2m_teardown_hostp2m(d);
@@ -198,7 +198,7 @@ void p2m_final_teardown(struct domain *d)
     if ( is_hvm_domain(d) )
     {
         if ( altp2m_supported() )
-            p2m_teardown_altp2m(d);
+            altp2m_teardown(d);
         /*
          * We must tear down nestedp2m unconditionally because
          * we initialise it unconditionally.
diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index 84159198f3a0..a6f61a9dd3d7 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -773,7 +773,7 @@ bool ept_handle_misconfig(uint64_t gpa)
     int rc;
 
     if ( altp2m_active(curr->domain) )
-        p2m = p2m_get_altp2m(curr);
+        p2m = altp2m_get_altp2m(curr);
 
     p2m_lock(p2m);
 
@@ -997,7 +997,7 @@ out:
 
     if ( altp2m_supported() && entry_written && p2m_is_hostp2m(p2m) )
     {
-        ret = p2m_altp2m_propagate_change(d, _gfn(gfn), mfn, order, p2mt, p2ma);
+        ret = altp2m_propagate_change(d, _gfn(gfn), mfn, order, p2mt, p2ma);
         if ( !rc )
             rc = ret;
     }
diff --git a/xen/arch/x86/mm/p2m.h b/xen/arch/x86/mm/p2m.h
index 635f5a7f45cd..64218878067e 100644
--- a/xen/arch/x86/mm/p2m.h
+++ b/xen/arch/x86/mm/p2m.h
@@ -19,9 +19,6 @@ static inline int p2m_init_logdirty(struct p2m_domain *p2m) { return 0; }
 static inline void p2m_free_logdirty(struct p2m_domain *p2m) {}
 #endif
 
-int p2m_init_altp2m(struct domain *d);
-void p2m_teardown_altp2m(struct domain *d);
-
 void p2m_flush_table_locked(struct p2m_domain *p2m);
 int __must_check p2m_remove_entry(struct p2m_domain *p2m, gfn_t gfn, mfn_t mfn,
                                   unsigned int page_order);
diff --git a/xen/common/vm_event.c b/xen/common/vm_event.c
index cf0258223f50..77e0c8a0b240 100644
--- a/xen/common/vm_event.c
+++ b/xen/common/vm_event.c
@@ -433,7 +433,7 @@ static int vm_event_resume(struct domain *d, struct vm_event_domain *ved)
             /* Check for altp2m switch */
             if ( IS_ENABLED(CONFIG_ALTP2M) &&
                  rsp.flags & VM_EVENT_FLAG_ALTERNATE_P2M )
-                p2m_altp2m_check(v, rsp.altp2m_idx);
+                altp2m_check(v, rsp.altp2m_idx);
 
             if ( rsp.flags & VM_EVENT_FLAG_SET_REGISTERS )
                 vm_event_set_registers(v, &rsp);
diff --git a/xen/include/xen/p2m-common.h b/xen/include/xen/p2m-common.h
index f0bd9a6b9896..6da330acca1f 100644
--- a/xen/include/xen/p2m-common.h
+++ b/xen/include/xen/p2m-common.h
@@ -25,7 +25,7 @@ int unmap_mmio_regions(struct domain *d,
                        mfn_t mfn);
 
 /* Check to see if vcpu should be switched to a different p2m. */
-void p2m_altp2m_check(struct vcpu *v, uint16_t idx);
+void altp2m_check(struct vcpu *v, uint16_t idx);
 
 /*
  * Populate-on-Demand
-- 
2.34.1


