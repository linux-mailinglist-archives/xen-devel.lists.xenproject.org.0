Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMgOAWOa5mnCygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:28:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91022434051
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:28:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287521.1568001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEw9n-0004Cx-FB; Mon, 20 Apr 2026 21:27:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287521.1568001; Mon, 20 Apr 2026 21:27:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEw9n-00047s-4G; Mon, 20 Apr 2026 21:27:51 +0000
Received: by outflank-mailman (input) for mailman id 1287521;
 Mon, 20 Apr 2026 21:27:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEw9k-0003fF-VT
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:27:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEw9k-001N7n-B4
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:27:48 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69a50-bab6-0a2a0a5309dd-0a2a4503a45a-8
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:27:48 +0200
Received: from [40.93.201.118]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69a52-672d-0a2a45030019-285dc9764a1b-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:27:48 +0200
Received: from MN0PR02CA0003.namprd02.prod.outlook.com (2603:10b6:208:530::6)
 by DSSPR08MB972959.namprd08.prod.outlook.com (2603:10b6:8:375::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:27:42 +0000
Received: from BL6PEPF0001AB72.namprd02.prod.outlook.com
 (2603:10b6:208:530:cafe::82) by MN0PR02CA0003.outlook.office365.com
 (2603:10b6:208:530::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:27:41 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 BL6PEPF0001AB72.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:27:41 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzz985VvZz1wdR; 
 Mon, 20 Apr 2026 14:27:40 -0700 (PDT)
Received: from DM5PR08CU004.outbound.protection.outlook.com
 (mail-dm5pr08cu00405.outbound.protection.outlook.com [40.93.13.101])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:27:40 -0700 (PDT)
Received: from CH0PR03CA0402.namprd03.prod.outlook.com (2603:10b6:610:11b::23)
 by DM8PR08MB7304.namprd08.prod.outlook.com (2603:10b6:8:11::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9818.32; Mon, 20 Apr 2026 21:27:36 +0000
Received: from CH2PEPF0000009E.namprd02.prod.outlook.com
 (2603:10b6:610:11b:cafe::34) by CH0PR03CA0402.outlook.office365.com
 (2603:10b6:610:11b::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:27:33 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 CH2PEPF0000009E.mail.protection.outlook.com (10.167.244.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:27:32 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:27:29 +0200
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
 b=GiaKOdP7Rh+1SxptvOYJi0BY3N3yj0dpLS2KOih34S8kNq5DQx1ihQXLjis9t0l24wfo17QeXY3MgMlMAOO1t+CNfjW7ANUfsZ8tMrSmGqLzTcRMZ5f7gKbAcerQsQEvFPmfoLD+zZMgyOE7A7sCy7jVDOseJ1UKhflB0UXREKIIl/3xzm17+cglKDinsBU+qnuN7I41x9fQ+luIyVEWRhaaz1ulFHutd+UTqgX4O953wXdQ96+Cm8oNPlGlSy5mw/GNUjPFRzdIY1RdIKJLpQ0/6o+6JWesSIK9l09Q8H+Y0BA6g+YoFuio4y7kJijZzF7bUGYwZxnaFqoSNh+TLQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oIAPv9xmUqmZOQALhD1wFmf2mfwJESnPZqbe9aDV5X0=;
 b=f7GCRVS8dCCMLyaUx6gwhC5HypeIS9dI3B4Ty32W/xGcmQeBvbMyxNB5miIIqCB+fvLy8QbTiAtBnPZs3zVbhno9QEd1dtKQZAAeakd/JOvaG6qwm08KBCdLiUkqnlALzLBHV0S3z6XxLicLlEk3ZnxB+1kbnab79zogaDpIcIm2n8WcUOn6DpKFvQHJTzP3l/BIoOK+3Cge3zGvAkmryvFOi6b4k7O5Eo+LtF2alTezV9s0wDg9HhWcKO32VjBXpzcQlcyRyiucELOjDvytNVX/SX6yrRE/lE1wseIvuX58IsTxOewX/7zfgThZXrOmHyScbiAyaYkeo/Zu92riHg==
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
 bh=oIAPv9xmUqmZOQALhD1wFmf2mfwJESnPZqbe9aDV5X0=;
 b=HjFgnhY66L7JEKAF3G4s0gM3/plr/sMnnenZicIqq0D3HkyJkuB8osQsMhMUDoWbUX85Subp/a0PA8ZO1znHBe3Lzy/cgZ4q0gBXroWJQjGDJDlyxeEtkEZzVF/vHEMF5TgT0A1VnRSVhjoSwVjXWu8egEOrHG99a5HFVEXkMAU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.13.101)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.13.101 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.13.101; helo=DM5PR08CU004.outbound.protection.outlook.com;
 pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ow4F/7lO5VaHfhzHxTG8lJr1L7xJ9w6Fcmr2vUDfkoI8EcjOrjoWeIKyntut9UXNZMcV0aGymggLVXe29pFUNDbezJ1Jl1l4UmmOCUakaYgyYanZ0SYhj0LHn7IF7TnEyYnm/i9qsArFwPWKg2+lcZkrcIXaa81pHgU/k4a4wemx1y+inj3lPqgdog6vitll6kutuXNT7nFcIR290qIrSRiJKQiBvN+xE8ULMLOF0qAxYqIlI1qVj821O0gbqOtjl6r9vt6EFbzhQx22tL/QPgeI5iyQFKZHuvGAlJZ4S56nws0ql/Ucdc5OmxljpQJ1d5fmeuNdqfOVb5dAIQfUtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oIAPv9xmUqmZOQALhD1wFmf2mfwJESnPZqbe9aDV5X0=;
 b=D7dWM80FtLHyjW71hMh5L2JZ1SJPgopyIs0SwbKYAyDCt4lHE4O+66DKdhDEu2KvUhtv30gWBse5Jyhh4iPSeG3/t/DyW+61d2eu6SM1YWRJUBzW+a0KNw3TzGvRntm6uzatXtCqnyXEEqIhv5mxoH18cZJn6MWROSR2eqTuw/NfT9fXpyUWC0y8zp5c2vKlOY6+Hlu3slABwPAXF7H91OduD6cOGLL1v+SxDXRwaqr5rp+3MakBuYAkFi8fk3EQP2GkUTghR+1agAwVgfh9zI7CPYHR6NsOd91jRq/41KsU0ix1L6IHklYe+j1mkOwEv2FJ0QRvZNiiatVLOAGEMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oIAPv9xmUqmZOQALhD1wFmf2mfwJESnPZqbe9aDV5X0=;
 b=HjFgnhY66L7JEKAF3G4s0gM3/plr/sMnnenZicIqq0D3HkyJkuB8osQsMhMUDoWbUX85Subp/a0PA8ZO1znHBe3Lzy/cgZ4q0gBXroWJQjGDJDlyxeEtkEZzVF/vHEMF5TgT0A1VnRSVhjoSwVjXWu8egEOrHG99a5HFVEXkMAU=
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
Subject: [RFC PATCH v6 21/43] arm/p2m: Change func prototype and impl of p2m_{alloc,free}_vmid
Date: Mon, 20 Apr 2026 17:26:26 -0400
Message-ID: <20260420212648.208640-14-Rose.Spangler@elektrobit.com>
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
	CH2PEPF0000009E:EE_|DM8PR08MB7304:EE_|BL6PEPF0001AB72:EE_|DSSPR08MB972959:EE_
X-MS-Office365-Filtering-Correlation-Id: a5fa44b4-3540-4ec7-0a9c-08de9f23a79d
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?+xfzs0iZwfgSeAimDyD15jXph0u/9/yvKo+VATXHO0YTWivt+GQLWuyExIiM?=
 =?us-ascii?Q?9HUWnngTY4arayuiKQUPHzeSkVUoQT2TC5QQVNMx0UFiBzS2rUoniZjwbDGP?=
 =?us-ascii?Q?9xMpdK8vxpHx5iViLKUkYw1jnZ/QUd31AujW06TUfYKdC1Pb19stvepyBbKx?=
 =?us-ascii?Q?WJt4BWM3C5UcZWCoPSHRua8e9QTaxjVXvj/2Iyt5sON15XWwoaJ57RmIbaE3?=
 =?us-ascii?Q?U8RmcllD1SvkAFbbxqnljrLHsSoSmO1wTBx1P8yu0mU5kSqP+q5vS02mYtWk?=
 =?us-ascii?Q?GKFA2SuTdGMu1rtBTlv09Lh+Fg2uOPThTHjZKjKidAyxbC5wGpyaOFV9olbc?=
 =?us-ascii?Q?sXdnzJK9IRW5QL/crXBO29OXruEDqy+TteQvt3/8ddvRMQsNdWEPCkQaaffh?=
 =?us-ascii?Q?nA/P+1Ox/lgNmFjvLes0Adi95I7iEbFk20SamT8lnx7EgKjwdU8XnH7TxyK4?=
 =?us-ascii?Q?QOqV0IFbsnFWcnpyC+c1lxwKrykbeNVbD9I93N6n4BJQC7JKTjWAb0glZnZH?=
 =?us-ascii?Q?w8wdDg89TZbW1yGC3PK1LoQHPdw+vdBWueCZaoCTBClrdlT/AZRxZF5TzVR9?=
 =?us-ascii?Q?Qx2VNCTPzygtU9E99+EUeqJuNBPZPqdEg7nnPhhHiuBQtA4xRaurpEZ6N0fs?=
 =?us-ascii?Q?ktCI70gWZMnBZQuEGLrhaZWh46hOfefH4aS/Z7qIddQTJapAfcqJLvIP9Ffl?=
 =?us-ascii?Q?g+HemwnOl6rIcdNztShtRZQ9VSQ1uLfLpK5zXM4bYTj1Km2BbMp1M+jU552s?=
 =?us-ascii?Q?vAnVE9b3kk+qnv+cWzB7CYeBFuW9nxgd/yzJsKE8qtnJtGvSEDbLdX2yYdGN?=
 =?us-ascii?Q?8Q5eFeB5utekN4uFK3Y5a/AM2kDieVTPatI4d2medZArlo0dckOj32qg061Q?=
 =?us-ascii?Q?2hEQatAutCk13vQ9H+ZTgllSO35B/vE88gWbj4ajypyn/VwDM02uijLiZxHv?=
 =?us-ascii?Q?JlOWYplxag1x9Dy30lOgNAlMevfAjyyjY/QW0jJ3R8ZVlPdumwBh+G8r/UGb?=
 =?us-ascii?Q?X6EQvO5xN50gaQW+NWn7jngvR6krnNsiPQdSuonVhZKs0Cr6p7Wvg9FnYksu?=
 =?us-ascii?Q?MaaUl3TGqQaLuT8T8zVR9QD3O6D3UrIPyzD2l23UDCs1o9uF6RDETdxpJvng?=
 =?us-ascii?Q?STU2v0KV6uY0vElnsGxYzLcT2X+fND4K9leY7AdLs8bI5X++XEc1gpceZ313?=
 =?us-ascii?Q?J3S5vGd734CnpRhkfvlU1ucj8zg8cRH+nNUMsXiHhdN0v+VzVk8Eg/VHPI8?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 D8oM9OBwVWfSySobPO/M3GSJ3l9MvewvghPRw9CEgkReOr0+aotV83tHMKLS2uJIkTbBhd3NvmOdgjVMEdX8RImWaVGjsup6bdxRDXmKIOyo15gBrFNJm0F/4kkuwyRaz/MOFDLmrYLQ1liaSamKYuSgmGMexWxBUPbKq+NTuThgkR00jI2OmL0chZMJgzmdMBnowPxOISX9pcF3vAhSU6nL/0l0ccFZu9Po9WNN9nYxcgbth1JIzi+a3b5mnA02ByvPnRprZ5peCe8Z/OufVAaIaBmhn+f2dHguncCDSdOST0YqcSUn3TPK/7xO7DTSOUn/kj+12vYtAB351xVOsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR08MB7304
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.13.101];domain=DM5PR08CU004.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.13.101];domain=DM5PR08CU004.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 BL6PEPF0001AB72.namprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	be510578-fc88-4eff-fb59-08de9f23a23d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|14060799003|35042699022|82310400026|156008|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wCjs7DRFQ9UUZ3UsFHmeDAvu0m4QrvlR0taUaLeFg7Nin2h5vo1v+m1kw3ka?=
 =?us-ascii?Q?8vQMzkJYFewyLkFp/kHEkv9Euyrgig5JXl2mPvXiAWWoFXqLpKodd6znGXPC?=
 =?us-ascii?Q?E3X3GfZR+Dr3TEpqtuGl4CcUFv4vgMlqmy8cU8YSirC0zlKTumGB+uaINQCN?=
 =?us-ascii?Q?vy0tVw5wCdN7O/YsimPmi/qF97m/yCcBR3ZtHW7FXCiZfn1wsrlyDKnZBOl+?=
 =?us-ascii?Q?DVlnu9j3pw7F5mwL/k+TOgLl6IVP4SlXUq9+xJca2bYOuOYCS6kEGEWiNbtG?=
 =?us-ascii?Q?B/p0AUkO1fh2pZXiOterEw3AqSiTIcyrodGaYsNmUjYyrM6NKRPcW1iS/gg5?=
 =?us-ascii?Q?3Jht4SQr784AVM8gtfWdGOmQA18jZ5HZmHSAeLSpc9WUnTldCcGithIB5Lr8?=
 =?us-ascii?Q?vMzM+de/tTti8+mdQxisB+xDzi/yXqQntaAxyl9FRY5dPIiY4u4Hq44Qlrdk?=
 =?us-ascii?Q?8G+tfNJTxYrX5TXgM5lOqh8ds66qUKL4c0xAEDfQ+6nnOA0cBPhw8HUmBr74?=
 =?us-ascii?Q?Q+BAjQrSFCfCX9JYeWpFr7hImkIHEIE5FfkCv5MccZSqAepqfH6KrIoMVmBa?=
 =?us-ascii?Q?pUZJxo/3rY+eYIqyugvYmJgtp7m4jReJV2fh8bQqPHee1TKuF+rm1epho8IJ?=
 =?us-ascii?Q?79ua9GYMFnvZo76eRlHkLCVD5dQ7zgxBJhFGkV0SJV1/0gSVOy/Xfa0A++qc?=
 =?us-ascii?Q?0QNgzJow5vzwE3+tcVApejwBxcPwV8p9vttoXP7dV8x15pVT+NGjhBhItxU+?=
 =?us-ascii?Q?G5zGRw0qo6NnkpHApx8J9g3jo++I0KmNgZmNPQxymCCyHbfEA7KUW3YQ4Sj9?=
 =?us-ascii?Q?RXpkJVNHMzuKIozoQJfh7PwzqwdwgGKMHOPdFTngsr9cDhvqeqqeKlX6GMC+?=
 =?us-ascii?Q?DXc1XbrWk/SLeo0sYD2z1hqmBUnCKvE1MQKl6tfjt+7qe//G7OUJ/USN1SIb?=
 =?us-ascii?Q?1jKC9NS6ug4BvMsGZweWJ+yVWbezcqH+u8DAg8/W5MhzS3B1+0vPBYnu8Yc2?=
 =?us-ascii?Q?VFsglhZ1nHQehJ3wzfFgERAh6/QAfilKlH/+zH4atdLBWRO7PPOzO3gGi0JD?=
 =?us-ascii?Q?bUpDW8o5KTfIzhfNU0EcazjQ++X2YVNcXZVzf2BgFJA7oGEiwMjuf88rfi9N?=
 =?us-ascii?Q?EflNPpzKBh1VvlRiRx6H8s96T9DwBNSaTVCIYS19HvTLZLpFZKYmqtFHC5gm?=
 =?us-ascii?Q?BQjq2cAFomD9ftIgp3X0bo4YxJUNZRiulmOeIUKzUTXT96WHbZ/yICsM244?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR08CU004.outbound.protection.outlook.com;PTR:mail-dm5pr08cu00405.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(14060799003)(35042699022)(82310400026)(156008)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CYGLJEApKv3lXb6SevOviDlZ6CP8Vv2YqzswogWKNX2ODUfMpdtzhRJISh4X/8yj0mLuMOWIoeZY9dDYTFHBoMsF4evCG1USze/WwH4tVnXz+1jH9WIeMyyoxAAHd35gXBDo26FvS3IbottWai8WCRmhlH4oA+T0nrHSV+1Gisim5DDFFPKbfsmAp1pN3B7DQz6+XChzg6wjj/g5FCB5cFaDPI0CZMkeTilNLjk4q5UL1ROmntwA58Jif/tPkVIhQyhEgRxmCnVKk6Jja92QT4D//+uUW/ealNxayS7si6kRfk8qsp+JmdJVFkp7k671rSNfl672WGOvXRsySv+G5NKhmNNkyrR3pYmVk9zivHe/0czEtSOhAXGFSMLhos2KFoAO1cz50uo6g5zvlzJtwmxQBdDhRTToEAzOcHK9tNIkRIsMQKgQjCEOWgLmg+Pr
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:27:41.4112
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5fa44b4-3540-4ec7-0a9c-08de9f23a79d
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB72.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSSPR08MB972959
X-purgate-ID: tlsNG-33051d/1776720468-28F72938-CC9AE319/0/0
X-purgate-type: clean
X-purgate-size: 3941
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
	NEURAL_HAM(-0.00)[-0.245];
	TAGGED_RCPT(0.00)[xen-devel];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tum.de:email]
X-Rspamd-Queue-Id: 91022434051
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Sergej Proskurin <proskurin@sec.in.tum.de>

This commit changes the prototype and implementation of the functions
"p2m_alloc_vmid" and "p2m_free_vmid". The function "p2m_alloc_vmid" does
not expect the struct domain as argument anymore and returns an
allocated vmid. The function "p2m_free_vmid" takes only the vmid that is
to be freed as argument.

This is commit 10/12 of the altp2m_init/altp2m_teardown routines phase.

Signed-off-by: Sergej Proskurin <proskurin@sec.in.tum.de>
---
v3: Changed function prototypes and implementation of the functions
    "p2m_alloc_vmid" and "p2m_free_vmid".

    Changes in "p2m_alloc_vmid":
    This function does not expect any arguments. Also, in this commit,
    the function "p2m_alloc_vmid" returns either the successfully
    allocated vmid or the value INVALID_VMID. Thus, it is now the
    responsibility of the caller to set the returned vmid in the
    associated fields.

    Changes in "p2m_free_vmid":
    This function expects now only the vmid of type uint8_t.
---
 xen/arch/arm/include/asm/p2m.h |  4 ++--
 xen/arch/arm/mmu/p2m.c         |  8 ++++----
 xen/arch/arm/p2m.c             | 23 ++++++++---------------
 3 files changed, 14 insertions(+), 21 deletions(-)

diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
index 5c6dfe4a9789..62261d41e780 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -195,8 +195,8 @@ static inline bool arch_acquire_resource_check(struct domain *d)
 void p2m_restrict_ipa_bits(unsigned int ipa_bits);
 
 void p2m_vmid_allocator_init(void);
-int p2m_alloc_vmid(struct domain *d);
-void p2m_free_vmid(struct domain *d);
+uint8_t p2m_alloc_vmid(void);
+void p2m_free_vmid(uint8_t vmid);
 
 /* Second stage paging setup, to be called on all CPUs */
 void setup_virt_paging(void);
diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index f546f63f2489..0d37760ef5d5 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -1519,7 +1519,7 @@ void p2m_free_one(struct p2m_domain *p2m)
 
     p2m->root = NULL;
 
-    p2m_free_vmid(p2m->domain);
+    p2m_free_vmid(p2m->vmid);
 
     radix_tree_destroy(&p2m->mem_access_settings, NULL);
 
@@ -1570,9 +1570,9 @@ static int p2m_initialise(struct domain *d, struct p2m_domain *p2m)
      */
     p2m->domain = d;
 
-    rc = p2m_alloc_vmid(d);
-    if ( rc )
-        return rc;
+    p2m->vmid = p2m_alloc_vmid();
+    if ( p2m->vmid == INVALID_VMID )
+        return -EBUSY;
 
     rc = p2m_alloc_table(p2m);
     if ( rc )
diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index 2c43b6033360..3342fafcc8a7 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -282,11 +282,9 @@ void p2m_vmid_allocator_init(void)
     set_bit(INVALID_VMID, vmid_mask);
 }
 
-int p2m_alloc_vmid(struct domain *d)
+uint8_t p2m_alloc_vmid(void)
 {
-    struct p2m_domain *p2m = p2m_get_hostp2m(d);
-
-    int rc, vmid;
+    uint8_t vmid;
 
     spin_lock(&vmid_alloc_lock);
 
@@ -296,28 +294,23 @@ int p2m_alloc_vmid(struct domain *d)
 
     if ( vmid == MAX_VMID )
     {
-        rc = -EBUSY;
-        printk(XENLOG_ERR "p2m.c: dom%d: VMID pool exhausted\n", d->domain_id);
+        vmid = INVALID_VMID;
+        printk(XENLOG_ERR "p2m.c: VMID pool exhausted\n");
         goto out;
     }
 
     set_bit(vmid, vmid_mask);
 
-    p2m->vmid = vmid;
-
-    rc = 0;
-
 out:
     spin_unlock(&vmid_alloc_lock);
-    return rc;
+    return vmid;
 }
 
-void p2m_free_vmid(struct domain *d)
+void p2m_free_vmid(uint8_t vmid)
 {
-    struct p2m_domain *p2m = p2m_get_hostp2m(d);
     spin_lock(&vmid_alloc_lock);
-    if ( p2m->vmid != INVALID_VMID )
-        clear_bit(p2m->vmid, vmid_mask);
+    if ( vmid != INVALID_VMID )
+        clear_bit(vmid, vmid_mask);
 
     spin_unlock(&vmid_alloc_lock);
 }
-- 
2.34.1


