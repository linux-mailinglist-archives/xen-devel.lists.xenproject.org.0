Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCYKDWOa5mnCygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:28:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8351243404E
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:28:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287495.1567928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEw9c-0001oW-84; Mon, 20 Apr 2026 21:27:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287495.1567928; Mon, 20 Apr 2026 21:27:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEw9c-0001mC-3N; Mon, 20 Apr 2026 21:27:40 +0000
Received: by outflank-mailman (input) for mailman id 1287495;
 Mon, 20 Apr 2026 21:27:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEw9a-0001jD-0f
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:27:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEw9Z-001Myj-DL
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:27:37 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69a18-bab6-0a2a0a5309dd-0a2a4508a9bc-14
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:27:37 +0200
Received: from [52.101.61.89]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69a47-63b5-0a2a45080019-34653d5982ce-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:27:37 +0200
Received: from PH3PEPF0000409D.namprd05.prod.outlook.com (2603:10b6:518:1::50)
 by LV8PR08MB8984.namprd08.prod.outlook.com (2603:10b6:408:201::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:27:29 +0000
Received: from CY4PEPF0000EDD5.namprd03.prod.outlook.com
 (2a01:111:f403:f912::1) by PH3PEPF0000409D.outlook.office365.com
 (2603:1036:903:49::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:27:26 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 CY4PEPF0000EDD5.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:27:25 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzz8s261Rz1wdS; 
 Mon, 20 Apr 2026 14:27:25 -0700 (PDT)
Received: from CO1PR08CU001.outbound.protection.outlook.com
 (mail-co1pr08cu00102.outbound.protection.outlook.com [40.93.10.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:27:24 -0700 (PDT)
Received: from CH0PR03CA0440.namprd03.prod.outlook.com (2603:10b6:610:10e::29)
 by CH0PR08MB7507.namprd08.prod.outlook.com (2603:10b6:610:fb::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:27:12 +0000
Received: from CH2PEPF0000009C.namprd02.prod.outlook.com
 (2603:10b6:610:10e:cafe::a) by CH0PR03CA0440.outlook.office365.com
 (2603:10b6:610:10e::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:27:12 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 CH2PEPF0000009C.mail.protection.outlook.com (10.167.244.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:27:11 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:27:07 +0200
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
 b=W26W3GYhj2qYfNwN4swFOSnHx/7P4xrEIkXBNYWaLZ40bJARECS/rXDdatyFzr6nTjuE35/iqiOFfMQHAnEK2bOBBq3ih77I/QvIzhV/WW05XZ5iCvjSJWOVtKuMLNnscDdRusqSQlDRnL/wyT6mlycfEX8DHkI34VNm7ef9M4Ja0I6NTI4E4luq9F0RE9s3UnU4vF0UishhmXsCYgE9MR//Tj55XLcSCoKYPH2HXdiu2zrD3oIzkwPx1l2aFWGMbxqm5BEYBEO0I0vZI+KvY4ycnYNzeLvXQtMQh1A5kZXopqUhXfQyfFeRKjaNT4jbLobiicQCPQe2YjKKSqnuug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Xr6LLXjzqnGjZ+q/CL1Op56Lgquh9rAvy51mivO1rA=;
 b=r4WqpY/+IYs2ndMKtKEcIQ1sI2R6mw9psxptUisqmiUodQktpXQ+rIMepbaJJSjq/xGcUQQ7EK3TuyFFQI3vlewJewHIpcne8ayDvWg2Qv2oU+OT2XRJ729wIflrMZXflaUCCFsAf117KNx9rYxaBYnmuhXJ8zONVZvUDO7bzfwNqLtx4Zn/sba2bHcNNzEYK0HZvJpShqP1y2G83ZrrIzoDgh1bFQ0xotO/zhlWj/OOgDF5K6pkCewPJT0zkDXo2URFkfx5QPpAbB6/uYV3kKgs1rBCb3NRlISJJISEw9QQbVnRYFYZNOxFwTfgzX7nQ+ycCQYsoKOXpZBK6ro06g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.10.98) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Xr6LLXjzqnGjZ+q/CL1Op56Lgquh9rAvy51mivO1rA=;
 b=vl1p3s6POUok87PxtukKGCMP/R7pYIWdInlrTSVFGN1X+ti+ZjRggVs+KYlzs7X1MDNQtkVDG7ueyZkYCN7Wb2DNPLjIzYbtaNDclYzu18z9Cc4q4wX6tQDA92uTdgn9VuDErTI39rsONa2lhwVRAJUMVzKVbDtIsgHj6qmgDMA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.10.98)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.10.98 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.10.98; helo=CO1PR08CU001.outbound.protection.outlook.com;
 pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ld1WOyt4LtAmq/BzdtR2wYYGaJbQ1DF5LRB3zRDCxaiD+DLq9gXT2c/oJEnhhllxzj4V6te3dhSLlG8l+kpzR7iKqSMjiukrib/BS9iW+kzF372KoLMpEaPfgPzDa3rH0/GtIeeNAnVK9KDU0ypKBectSJ36XRiF0+rIGj+D4BOHiySKMemCsecIGHzerAI0DD+XN7YTgUUeJyORrR7JXy4Sm3ViYLcPiX1reyasdoZOaOK+f3bwoT/VVP7Ev3LblQ5ba9EvtaGUWTLdGwjlCVFxogX0aBpjSOV2JCqdTiWFy+c/B/776BSEkQ+2xodEdmXacGuB2zqJM6blMzmu9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Xr6LLXjzqnGjZ+q/CL1Op56Lgquh9rAvy51mivO1rA=;
 b=LVZya4VhhGeNoYoIXW5lIAUkOf0KFF1ny525LIWSO/Wo4lx+Y4nVdyZvSpTu8pAaRE2Y6Ib/ej8HHGtbPzwFYu5ESViiiPa9le86SeC2tJv3M2ILqry5Th5SDQnmA5l8XtUQljY8fK2jnWXxBvTjWNamtr0BCACdWYZPe6L7oaTWo0G+JmOytpc1PcscbZ5QtTItzfQTl9Cz3rmwF85VbbFR2CB7PlkzsKwZLt6jmNn2ba8zbD5v3yLCHs5DyQTrf9KEwFSon58Zte34zsDgVNIMIeqoGD+z3H3SKdqMWIKtIPaih2ZBhkaIFxwlpYmW2D2GrVHREm5y1W5p37aoJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Xr6LLXjzqnGjZ+q/CL1Op56Lgquh9rAvy51mivO1rA=;
 b=vl1p3s6POUok87PxtukKGCMP/R7pYIWdInlrTSVFGN1X+ti+ZjRggVs+KYlzs7X1MDNQtkVDG7ueyZkYCN7Wb2DNPLjIzYbtaNDclYzu18z9Cc4q4wX6tQDA92uTdgn9VuDErTI39rsONa2lhwVRAJUMVzKVbDtIsgHj6qmgDMA=
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
Date: Mon, 20 Apr 2026 17:26:13 -0400
Message-ID: <20260420212648.208640-1-Rose.Spangler@elektrobit.com>
X-Mailer: git-send-email 2.34.1
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
	CH2PEPF0000009C:EE_|CH0PR08MB7507:EE_|CY4PEPF0000EDD5:EE_|LV8PR08MB8984:EE_
X-MS-Office365-Filtering-Correlation-Id: e4079c5c-9814-40b0-3381-08de9f239e43
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|82310400026|7416014|36860700016|376014|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?4vMQ4/9v42XfpiBKW27eIvb6A6YCSvYm76UaZlKFS6Q7NLxV82eRqfnxvHDz?=
 =?us-ascii?Q?tNX7TLsQgGqrmI8HelwftIkWWbI4MDIrX5uT+/4nbHtW6GUE9smPgof56T6u?=
 =?us-ascii?Q?tkqnSHwXLsJI/DtUnu747a9oBNr3MX8zZ5AEnKizNYB1Bj7YexkfLnxYvU2D?=
 =?us-ascii?Q?zxhuD+f6csx/16hLC8rk0icW817ODWKU8v2dklPdR+Avd+m82JI6H+LZzkIE?=
 =?us-ascii?Q?xelGJ3N0NRqinqoLi5iTY6VrW5Rb801snMFkm2Ft1jZmDHRri40oJMryeg59?=
 =?us-ascii?Q?QCctES+8sUfiF/p/rRnT99pVsc+z68XLaFp6XUQN3H8aJfAKLpKM8g4odvDl?=
 =?us-ascii?Q?dW+dpabs4rUWJ9gy0LHaqUroBMaCVlmm4aU0g5iOUETF3LxC3OcteRhjJ9LD?=
 =?us-ascii?Q?c6lr7OO4umeDxHGI3mEMv+FeAe6y2kdYWN8Lk/rJ2MthDq2a4tEfQhJKP3TF?=
 =?us-ascii?Q?PvgjyBGHio6QgV7beXmikass2aykWBsEmMy+eANg6kq4At87pRasmLm1taMg?=
 =?us-ascii?Q?wO0LtD8PhJOlUZkQD6ks0zEu/ZUHoqwtGCvEWj1ClgmFy3Xl4gH9Xp3xaE7r?=
 =?us-ascii?Q?TVPbPUPJLiAVIexGQp81EPDJtbePZzCknoJyX80OYtW/fvTZUMvtzGLNeJxd?=
 =?us-ascii?Q?SBECGhMa+WapTuhNPj9xuIMCUv+aX6AhRTzPMvydZkv1mzRxpg1LtdOoKxJ+?=
 =?us-ascii?Q?RPHHN7aW0YXlFJPJ2LTvqPn2etYxOFMffBklJ19ogDjK9fDb7Xo8XSGYQkkO?=
 =?us-ascii?Q?vaSmIexLJoPKfOW/OUmO2aT68nKcH+qu1UEr6REwtDTZ2uHEICl6chPkqKN9?=
 =?us-ascii?Q?Ebsh0dn0fT1mDxwmX7WK1Y59vAxODMWzgb1of/FFxm7qOMh3eahw+49hsv3Q?=
 =?us-ascii?Q?QacgDQh6MF/D8bJfbJeHRs/CQyX70rX4nDJLSOk1Os6QjMxcLOhVhnlgXA4E?=
 =?us-ascii?Q?OccWutcppnaNarOvqjPDGlmddiT7KsW3cDmHZUsBp0oL9UpoL/vAC4Ze/Rv7?=
 =?us-ascii?Q?x9Is83/YEmq8MVivIfk6IGF9RG7w59JIl6sJ0jS7dC/wM0+1Vzn0qhIni1sL?=
 =?us-ascii?Q?G6i05IZ556dtIWvkLwyq9gd31UE/amR8ez0pPL7yIs6wGcSgWzu/Gpm0biIL?=
 =?us-ascii?Q?y9Potv16ULmxZVqZosszr+cjaFrk+Ps1YYX0TNLk2gsnJwwG58urBf1Rq4Sk?=
 =?us-ascii?Q?tW3F/jpaIwLpw/+mTUXiXe3iq6fK2CD/K25IGA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(36860700016)(376014)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 TIkWMbx+8px+2HSN0tFXdkA63JZ5DqqYRPerCPdpBYeEd4C1s5qdfzVh8OV358bNm66qB3m1/ljZGXY495h9iUoQ947IYyZPtOFFYLiRTwOXb4r0W9Sz7/U+w8h5j2xkaX8KEFPzLKe3A2cqw0EGl9Rc48PrQMcpsD8j3e27HaOp3ehXYP5pshUmU1SR7wq5cnRFCi5bpwVeHN3Zx2cYnKja2kCN6K+MjtVT3yzsMAhc2SBOr7Jn8P9ca6Z7P9ByMcrzr8fE/aaV367W+059cXqqXjk3wtPLNZn95Z2RN2re646mZnloaXnHMrugcKAqbCTnyyC+7RqnEMP30FCcOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR08MB7507
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.10.98];domain=CO1PR08CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.10.98];domain=CO1PR08CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 CY4PEPF0000EDD5.namprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e0b7b851-7a0c-456f-6822-08de9f2395d1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|35042699022|156008|36860700016|7416014|376014|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?M4W2l1CFF3+M9dfkKZrqhnPm1dI09MTDPUM9Fv/f+zMWUPEE8qnJ5dM+xImz?=
 =?us-ascii?Q?FvBJh0iM++fErk8QheR5KwwOeSnQkZXOUjq8udYrB1NM3Uy8ldz8/zFfCJUq?=
 =?us-ascii?Q?uovTxiBdmsQuVSNveDvtn2jPcK/CD8YL5OuaVxBmPAj5ODHnqaHND47DS3h1?=
 =?us-ascii?Q?2dAx6qM83W27YYEsn02LNd+S4K1qPu+l1oxVRWVFFXxqDmGjtY+nJL8W4Frn?=
 =?us-ascii?Q?qKuOLtL+j7Odir4tjAx+Qg2EJkGuCVRHRREl+FglIrPHj8mdEldRpysSNbu1?=
 =?us-ascii?Q?Gm7/kKrtk3LupSCPhZRF52LwakLw5ifIvHrQdYq3H8b5h5IcIb2OkGO28mhl?=
 =?us-ascii?Q?FyIM8gJVdh+tuGZZsDjroP7PlIg0tpJSA2JbrmahZOhzF0cSHe4eazZcdN3m?=
 =?us-ascii?Q?PakUAPRNhEpIP6v5ciP/alJYVK/AE7Ax7bog0t8VnnAPj5pzbT99Qd6QM1An?=
 =?us-ascii?Q?Q494wz5NwxEqbk1Np23JVZKLWCAzadN4jLY8vwmy1wL3hJxCFGVfvPs6MIMX?=
 =?us-ascii?Q?6FYPeisipo5Ne4VLgNCIEo7z7xGP56ZksD8XKywEAGPLWxThBtwKrMS+MStT?=
 =?us-ascii?Q?IlWBD8Y7hmjUwGUpifFd54/yzf1/pckrZvTypgP6I6f0Ck0ngVjskbjxTiMv?=
 =?us-ascii?Q?Fn8w1Kdi0U3jOVKM9NjONrLWCTW9V463yLO6dUmypoEr/0GAG8BsyrrV8/Rs?=
 =?us-ascii?Q?8PvPdPqKTGTymhSD53XhD878ISSOXOg43mp7QB/FdoMtClEvNanVvLnHy7la?=
 =?us-ascii?Q?62t8WrHf7omQ+dYgiAgN6j78MxTNn1pgPbu6GTGfSJmbiM/GhcHemnRdLTPd?=
 =?us-ascii?Q?fjBKPnj9zF2r/cE2KxBibsVKB186oB/hgDxbL6WOlfLUm/fCLa1Lau47fZHr?=
 =?us-ascii?Q?XWC10OcmlzVy5ckN9CMk8O2PviWsOlAfFI1mejWTLJnqUsu516KEgUNNLTq0?=
 =?us-ascii?Q?ZwdPg/1x2HHscytR5IlbfHRixSj3k/dRATmDM3lqcr6/eOr3KGCFRtQ+Xak9?=
 =?us-ascii?Q?UtRNvbWucUZALhwMVYZ+wcXgaRO/CN/7CAM3mNxVSD5zOtPYqelBrOALJC+e?=
 =?us-ascii?Q?GX1F9cHroZPRzPLahVICzwILuMJ73bBelDuWoYF7x1R1G17Lu5eMLUrmqWNV?=
 =?us-ascii?Q?KfnMJip7z/DZBZZ1X/rmKLJmm1tHzCuNASomih6vfTakMFUv88lOMTdCyPg6?=
 =?us-ascii?Q?S2PfFtiL06q6Vnak+ajw9cWxQmFY6O604tzD/w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR08CU001.outbound.protection.outlook.com;PTR:mail-co1pr08cu00102.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(35042699022)(156008)(36860700016)(7416014)(376014)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+Pt5qoZv1jQUjeMl3ulkZW0CulHOunDLfuioTnwq6v/9iYN7/DhjtEIjGAem2o9IlUySvRP3cV2oPBYyzcGoRpiEZNgizaMmLq/4Y/a2ccw1pLEpW7EsbmqjHJxlWqmVrcFFKCq9cR05c7dCknnt5ldENSsvwLtRQSCGkVWDcouypQwz4O6gB4w/SAgB/XXxxpRGYocJsQjQbn+PlUprYWxBU+hVrgqtEFRUwYEQuqs4anPjoB2BnFUq1qXzdbz45N8k8rkSZC9ljAY7xDukdFbBdeyNsClL+hk6pse2pBsqQF3jk6C1L7AxFL+7RKSiMo7xO3rBV++vsqZrcVLyF/W/gtsW6o+Vwbu23jt6HpO2P53DYhfoKQGf83lBfWGeyNCcFTubq3kWAvq2hLCeSkyoAND8WvUrXmvhwl4GlJpP+QAOEl1L4Yww1v3nhT+5
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:27:25.8202
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4079c5c-9814-40b0-3381-08de9f239e43
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000EDD5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR08MB8984
X-purgate-ID: tlsNG-c1860d/1776720457-C0766DB1-F25C9B5D/0/0
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
	NEURAL_HAM(-0.00)[-0.142];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 8351243404E
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


