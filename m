Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JWADmOa5mk1ywEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:28:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A5F434052
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:28:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287492.1567902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEw9W-000168-6e; Mon, 20 Apr 2026 21:27:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287492.1567902; Mon, 20 Apr 2026 21:27:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEw9W-00012v-35; Mon, 20 Apr 2026 21:27:34 +0000
Received: by outflank-mailman (input) for mailman id 1287492;
 Mon, 20 Apr 2026 21:27:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEw9U-0000r4-05
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:27:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEw9T-00CBiW-DH
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:27:31 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e699f1-e002-0a2a0a5209dd-0a2a4502af8e-48
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:27:31 +0200
Received: from [52.101.57.83]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69a41-af86-0a2a45020019-346539535aeb-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:27:31 +0200
Received: from PH7P221CA0047.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:33c::19)
 by MWHPR08MB9906.namprd08.prod.outlook.com (2603:10b6:303:280::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Mon, 20 Apr
 2026 21:27:25 +0000
Received: from CY4PEPF0000EDD6.namprd03.prod.outlook.com
 (2603:10b6:510:33c:cafe::43) by PH7P221CA0047.outlook.office365.com
 (2603:10b6:510:33c::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:27:24 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 CY4PEPF0000EDD6.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:27:24 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzz8q588pz1wdP; 
 Mon, 20 Apr 2026 14:27:23 -0700 (PDT)
Received: from BL0PR07CU001.outbound.protection.outlook.com
 (mail-bl0pr07cu00103.outbound.protection.outlook.com [40.93.4.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:27:23 -0700 (PDT)
Received: from CH0PR04CA0012.namprd04.prod.outlook.com (2603:10b6:610:76::17)
 by BY5PR08MB6295.namprd08.prod.outlook.com (2603:10b6:a03:1e2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Mon, 20 Apr
 2026 21:27:16 +0000
Received: from CH2PEPF0000009A.namprd02.prod.outlook.com
 (2603:10b6:610:76:cafe::38) by CH0PR04CA0012.outlook.office365.com
 (2603:10b6:610:76::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:27:16 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 CH2PEPF0000009A.mail.protection.outlook.com (10.167.244.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:27:15 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:27:12 +0200
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
 b=IGcvlCg/6bmwvTYkvkrXICCkUsnzcj0Iq7bxNOhb+yC7YH3eSWqbJiN+tDg/dr2QJ7OHE/KdW5OYALdA0frM4ZxtrPJsfSEtTukXVzTjppbz5kEfJG/uR9xVt5JCpOuVzRyq117HucpeUPyg3AJReazCiTfDmQYEc2F3qGwerpJOvFP4Gl5IcihLr3TSJ/Y4/IA4UXjRjWI8X40YwHFhJV3J9KEJo6B5Yncus3k4SoOG1u5/0BmHOELuqHh7uQNvSIDgup4SxPxj1hQD+HBOu7uu2LbaziijVwlX07rXbv9h18ryKhUPnez5K58yuGHOGDZDYjKPhggf5hAN5F7RFg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=920CLmPnDOg9eeLN7pE/1x+mVKc67Ab1k7o15fr+MnY=;
 b=PAJVAGPXvGbciP4AZZNubJAINwgT18VIyRXc9FLzS3wZ4W2C7OtdPRgEGTX+o3w9COgM3XKULTRf/1PZjD1WuUKGINP0m3dZpCSpUnSzBdYbTi4ZNJCYdpLXmPoluOFjU9h0JZXWI+KYgUzIes/2dly1QHOIbCaz2svxn9vc5LRhKgyc4tWCV7BZLHJE/odJxTTY/7QMeyewRAdcyp77uuz03MPbnwMo/IEUXJ9Nv6vnAI6bGYSzPef4o6fTv7mTvcvUf5tIyOkcf+5zxockO9czAnxj+JQUYgTdG4U9nZaprairjqcPAzrDMrZzXBVXksqamME+4/eIRQSyOVVz/w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.4.3) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=elektrobit.com;
 dkim=pass (signature was verified) header.d=elektrobit.com; arc=pass (0 oda=1
 ltdi=1 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=920CLmPnDOg9eeLN7pE/1x+mVKc67Ab1k7o15fr+MnY=;
 b=asgekL/vHE8bB8+3mx+qF+1u4/qITR4i3iVqY0crkZY44OSRIgTRJXxlaePQohboZ0tYB1iSHlgji7SLMHV9idkOg9dc0EUWEaiIYLERz5J6ddt0xieUGcqKGxuo/5IKaogipge7xJ4Dw93v6Yo000JUlVr2IqJ4WGkg2UFgulc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.4.3)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.4.3 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.4.3; helo=BL0PR07CU001.outbound.protection.outlook.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l0dD9CwtMig8TKBIs51+Kbx+Y4T9jJ+1Vdgl9fhIPu7Cf6pBsxmNfMYaDMXcex4xFii/MpAHyXyWcQyZFNs/oA/Tjjf62vuHL/x6y/kiucC1DxJQI1NyZgo3vbJfT3ZfGBgX05ZvKrfvLNg++tnHq9QAh/2icBdDTUMisy0T6iAOXaUKQyCjObKo1TYY3WYcQDWa6Kl+fLAPsgVfsuxmU89+7TcWAir2TGHi127Mhjew4cDdXThbwTXJx0fcNwTNl3sqHqJpt46P/V2Bkr9IqHCQRkn0ec6/JCETuzihnCb6VrEV+K4HvY4Y/eccqc3J84mHEBjLQHPEXjib0pqFWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=920CLmPnDOg9eeLN7pE/1x+mVKc67Ab1k7o15fr+MnY=;
 b=LT4wrDwLre0VqyLc8K3NRA0sjpcWmtCwgMLh+8lsCgJFWy2TDPian5b2X8/gJVHs9AWeFQbQExQRv+o6eogiL5udPdwgL2nGTwI/D1OsDJ6Hbn2HPgT1sjI0NhwBlGUu3iPCJ7GqGvnFEEgkCcjEilVI0sbmSTL9WqugmJYiBOe+5cjZZQNYFtOk+isI5HvhdCu+8pQmnvV0vRhH77Twu5yo3IFDJsXycr4vzr5uOcmmkQJ4nu1chdNQFiOiXegY1ValxkTO6XnNvGaljdsvLdp/VtbefXPlXS0PjYtxwv8qYbHbO5NZEC9XF95ezzaDTBkbYwAvs1u9T90bxc4qFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=920CLmPnDOg9eeLN7pE/1x+mVKc67Ab1k7o15fr+MnY=;
 b=asgekL/vHE8bB8+3mx+qF+1u4/qITR4i3iVqY0crkZY44OSRIgTRJXxlaePQohboZ0tYB1iSHlgji7SLMHV9idkOg9dc0EUWEaiIYLERz5J6ddt0xieUGcqKGxuo/5IKaogipge7xJ4Dw93v6Yo000JUlVr2IqJ4WGkg2UFgulc=
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
	<roger.pau@citrix.com>, Sergej Proskurin <proskurin@sec.in.tum.de>
Subject: [RFC PATCH v6 10/43] altp2m: Add ARM support to do_altp2m_op
Date: Mon, 20 Apr 2026 17:26:15 -0400
Message-ID: <20260420212648.208640-3-Rose.Spangler@elektrobit.com>
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
	CH2PEPF0000009A:EE_|BY5PR08MB6295:EE_|CY4PEPF0000EDD6:EE_|MWHPR08MB9906:EE_
X-MS-Office365-Filtering-Correlation-Id: 201c0ff5-9827-4898-a539-08de9f239d51
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|704161411799003|1800799024|7416014|36860700016|376014|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?nvNWTIkJBkFtnTdwvHIpB/S2k+ib9Z8DwBdNl1QjrX5RYsPKcyMM4ZEC4xHb?=
 =?us-ascii?Q?Kzv9lUa+nHGu7kuO0pr2zRTCrx1sc0w7+x6mRQj7SjD/ljdFcecNXXZ5DJYF?=
 =?us-ascii?Q?Ug5FRtJJQb1Gh7rvRjokM+fS9pTbkl/aK5x4zyBtbIlGxqXw/3bwtbcrb7NH?=
 =?us-ascii?Q?o0G6rLNXvMY7P/arhJk837E2B7x5WoC9K3QvgrGUktw65nHpKwKGpOp9tayD?=
 =?us-ascii?Q?3XYdKPghXFMvzBieEAymdPNGT9L8kyxrcHKlMaAvHQsxPEHfsL1Qs17jqIIx?=
 =?us-ascii?Q?OSdlLpuUoPNLnXF5dvOz+eYd+ebejMC4/rYVpMEPLxEJcXaZAFhMycV57iiA?=
 =?us-ascii?Q?Bw5En72IZL0VcY/N8fev38f71QVM1gjrEcw9hk8jC3tCf24wbpqkIkK3eVqg?=
 =?us-ascii?Q?786Zmi4jMfAkl8moF1fuMSSYdJPPyHCyy3g0Zg8PNWbw6xQ57dvR9DPo1tr5?=
 =?us-ascii?Q?2CUsni9J9LdOSVM2XdfB+e0udlS14GbWrmo84REPhYudpOzGYJ8XJGhyKj1W?=
 =?us-ascii?Q?5z99TPjrFXl2IMK6CwNUTJIdcsHRBY1ptpNFAK1TB4N/XoON9jPQSDUIX7sd?=
 =?us-ascii?Q?x/wyi54JlAnanVtbjuVACwcJ+237ImiyxJsAYb8jVqR0jYUybNC3FRGpPdaV?=
 =?us-ascii?Q?IM8jXlrddgLCkX8ejKPBXI+GuTFkbQwG7/QY/tpRLKAhKPEluAhTjfrJ5lws?=
 =?us-ascii?Q?OdM/RdP0mYNqM3sqc/sJH7LGJwgWMWD7AA58bC2/xV1zih3DbFHY3UDSY37x?=
 =?us-ascii?Q?y4FAsBwL1ZDn3azBPD3xds+B9l9XX9FgM4njhRmmmvdPsGe54Tz6HQLOw+yQ?=
 =?us-ascii?Q?oAFS5UAbZlK9UTnT8Z+TadEVpFn2ZZ9WhnJ6fk0lhJePnzf4SswjZVXBVRJx?=
 =?us-ascii?Q?8J0N4P8uc7uWlPheUyoP3ITAA6Y2CFUeFq0pk8kvzuAv2M03nW66oMuJsQWo?=
 =?us-ascii?Q?YOcbwY9lG9mojMOe9UKmb1FKHVxfzxgL4udDvIE0fI5cPISKBXjtnkM6nIQW?=
 =?us-ascii?Q?0coYkvQTzj4OVwF2UtX1YXq0hPDOIU6S0p1u4LLFCdtrhepgPJE6LtWE/nat?=
 =?us-ascii?Q?6I1JHFVMcL2KH5vaHEVt0HbGmJH4/bV/hnap67RFZs+xhZgYtXooYdO6Syta?=
 =?us-ascii?Q?uMsbjVluPchropsIX6vy2aOdb1RLbSOWnYaPiDE9OCxAfIVJ1uj5aXM=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(704161411799003)(1800799024)(7416014)(36860700016)(376014)(82310400026)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 fOaCT0WYAh9QzSj61BjyRU6Aw0tiGeOgQdnYuWLFj0wDV/8ZN1HwzPDQyGdCSm0qvJFghptG2XZW2frBXEDxim/fK/MV+hvqF2oZRH6pS6+rpFaS416JNFpfPfw7+3S/sGVmFQ8L0yu/yhpMZE42Rlg/eCJ6uqlukNuqHFwxp5JfX3Yvq5CBuo361mkblfXWHoK1Ia/KQ08hTndpubjY/6WS7yUe5yqXU7PHX/bl408gXN6FKUNpLp6jqvmBsu3SuwrAhZ7sE3Na/25roZzYENjfnrJA026bVcM5gakqx1U5CTY+PxgNLDoYZ9QPv1fiU+17Bo1eGrUDvqxuvDO2+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR08MB6295
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.4.3];domain=BL0PR07CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.4.3];domain=BL0PR07CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 CY4PEPF0000EDD6.namprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9defe3ae-dd21-4a90-4591-08de9f23981b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|704161411799003|376014|82310400026|35042699022|14060799003|36860700016|7416014|156008|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Y0v4+zm+hr2s0qeE9BmiTArgDnggeumZnlPECyd6TcwENkBni0bFQsuEL/G3?=
 =?us-ascii?Q?nwtMcXYsZfVS98pE68jxuo29mo6/hhKCL4QZ0zPuP6Hla/P7pasaVorQLBLH?=
 =?us-ascii?Q?JqpatKuXUE9XuRQf9ezc5v8ratlX/JZpjeEBOhhisguey8PzsZL1TLFZ2EWR?=
 =?us-ascii?Q?nBVTALB8f1Fx4oaEZ44CWuU0XI3Z5IoJAcb+tIFPXodGs6YOBUFLrjf03jZl?=
 =?us-ascii?Q?mA//4XIhfT/LB4IliI4RsYhOSnsG69gkPggr3N3sGUJFlAw6TClh+w3Eqf+y?=
 =?us-ascii?Q?A9OOqyALGQ2XgjzUvLv+rESGBbG96ysAio9ZUlpuQDMDcg2e5IVScrpF7Kma?=
 =?us-ascii?Q?YgJ0XoEGSsw3IcDpcfvusl+h9xQzaOksS9eWJI+n7nVlyOVsZyNHLuKSZFSo?=
 =?us-ascii?Q?x4Hs+hGe18lIz1X5R8SUnbR/koSn1+uWkHBQhGmnz8rkGLn5QACPNkOAbXvh?=
 =?us-ascii?Q?kormSbxr42crBRkvC8N/5oZRQHUUo93MylQNVcz1kAPuMqr7XhbaNSO88PDg?=
 =?us-ascii?Q?653tvBCH/LtdWNgU96U0DsSq89w4RcPfX0fsdSl6fg5K9o/X3Qb12T9fIIW9?=
 =?us-ascii?Q?TIad4JebdJvuyJLOpimuPdCly2u1ctawStXSeXnx+hJ+jEFW4bxvaVWiuiY0?=
 =?us-ascii?Q?HFvyyjZ6ybIsB7Pnqp1nmk7P9gbqL8J0RpPAwGneBe2k5hCfuzT5xobKpona?=
 =?us-ascii?Q?tFZ5vJsXzWSC6KvuhoKsfZcQG0acFYN1wqGuAYF65ELFqPO8oebDAOR9kMS5?=
 =?us-ascii?Q?XcRbr1vang+I+l22ufwbN97kuinVrtatDXnv6v5fiwBrno2Wnu0FpQb0sC1e?=
 =?us-ascii?Q?85s+m3eAWM5g28pV0DiSdBNtDnNK73QXqNFVmIKRW5POk57u86TxGnwIgBEF?=
 =?us-ascii?Q?ZJV49qhJH3+95RsLCiVM27ibBrU7GpNBPg1O460WdFuy9gcTXIJDbKPjstuU?=
 =?us-ascii?Q?CvS6szkRx70lGVDnPoHJhzvIJ/3rtUvfmhbnfnvZgfFctsObeezSyondlqU8?=
 =?us-ascii?Q?GbzU+x/m9huv2uclMaZCo7gyD7BXPy71Agyg3BMvq2NRPdOgPMisHspHB5Hj?=
 =?us-ascii?Q?JkUuiqReXcAGBmSDnfOd+yG8UugBwMBQVLF2csuHwqFeqXim0d175Ak0ZjP6?=
 =?us-ascii?Q?oPTz8JIuxMO/jlquGlduoJIAj+y8m7J/IZy514CbFkXHuXdWDOd48Ik=3D?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR07CU001.outbound.protection.outlook.com;PTR:mail-bl0pr07cu00103.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(704161411799003)(376014)(82310400026)(35042699022)(14060799003)(36860700016)(7416014)(156008)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2o8OXGtqE0GEM+fq0SAxupZ1zAybyGXWR+pd0QNvDe/reRh5U4c0NqpL6z2yZo9cQCQSwz+bbxXKHSrD2QWukmpa64o9axTJ8/0kZbLaHgFOut9VLzEJXYONkVgSZHofGmksRPKeNDmjOvbmhKt/UIyvJz+x++dIWAe60jaIt6HCZ3pEtTYFS0Vd23ejoatEy/H9/RDjp1TyJpreQZsupIVkN5iDrhzxAPlUjcxo7fKSijvF1B5xNZ3IXFB8pN5B4jGFdWXTEpEnBCFL+M83TkqRvx1D4mK9YptTb5CbQLR65c+Q4Iz5bPsEB/yZgduI5TVZJ/EL0luz9wfYXWSjgzLHo/6+eGPJpGjTgCIOgztFw1gwiTPy4glQrgOK2q73M+aSVLGuH/vesLinHjuqQb0eSN0R1bqjKYMPPAstBuCyRade/0SSIHd3u7suHa+1
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:27:24.2422
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 201c0ff5-9827-4898-a539-08de9f239d51
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000EDD6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR08MB9906
X-purgate-ID: tlsNG-720697/1776720451-8A6C4161-4207A49B/0/0
X-purgate-type: clean
X-purgate-size: 4450
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
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:proskurin@sec.in.tum.de,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[17];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[elektrobit.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.245];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tum.de:email]
X-Rspamd-Queue-Id: C3A5F434052
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This commit makes the minimum required changes necessary for do_altp2m_op
to compile on ARM. All altp2m commands in the switch statement are gated by
CONFIG_X86, with a default case of returning EOPNOTSUPP. This allows future
commits to move the #ifdef CONFIG_X86 down as support for ARM is added.

Additionally, a call to do_altp2m_op is added in the ARM HVMOP code.

This is commit 2/2 of the common do_altp2m_op phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
Signed-off-by: Sergej Proskurin <proskurin@sec.in.tum.de>
---
v6: Replaced patches 2 and 3 from v4/v5 patch set with this patch.

    Made HVM_PARAM_ALTP2M read-only, following the change to the x86
    implementation in commit 0291089f6ea8. The DOMCTL to enable altp2m on
    ARM is implemented in a later commit in this patch series.
---
 xen/arch/arm/hvm.c  |  9 +++++++++
 xen/common/altp2m.c | 29 ++++++++++++++---------------
 2 files changed, 23 insertions(+), 15 deletions(-)

diff --git a/xen/arch/arm/hvm.c b/xen/arch/arm/hvm.c
index 86e49bf47403..7c778795a280 100644
--- a/xen/arch/arm/hvm.c
+++ b/xen/arch/arm/hvm.c
@@ -5,6 +5,7 @@
  * Arch-specific hardware virtual machine abstractions.
  */
 
+#include <xen/altp2m.h>
 #include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/errno.h>
@@ -23,6 +24,10 @@ static int hvm_allow_set_param(const struct domain *d, unsigned int param)
 {
     switch ( param )
     {
+        /* The following parameters are read-only. */
+    case HVM_PARAM_ALTP2M:
+        return -EEXIST;
+
         /*
          * The following parameters are intended for toolstack usage only.
          * They may not be set by the domain.
@@ -123,6 +128,10 @@ long do_hvm_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) arg)
             rc = -EINVAL;
         break;
 
+    case HVMOP_altp2m:
+        rc = do_altp2m_op(arg);
+        break;
+
     default:
     {
         gdprintk(XENLOG_DEBUG, "HVMOP op=%lu: not implemented\n", op);
diff --git a/xen/common/altp2m.c b/xen/common/altp2m.c
index a43b3a3e34b3..6481fae1ed12 100644
--- a/xen/common/altp2m.c
+++ b/xen/common/altp2m.c
@@ -9,8 +9,10 @@
 
 #include <xsm/xsm.h>
 
-#ifdef CONFIG_X86
+#if defined(CONFIG_X86) && defined(CONFIG_HVM)
 #include <asm/hvm/nestedhvm.h>
+#endif
+
 /*
  * altp2m operations are envisioned as being used in several different
  * modes:
@@ -18,13 +20,13 @@
  * - external: All control and decisions are made by an external agent
  *   running domain 0.
  *
- * - internal: altp2m operations are used exclusively by an in-guest
- *   agent to protect itself from the guest kernel and in-guest
- *   attackers.
+ * - internal (x86 only): altp2m operations are used exclusively by an
+ *   in-guest agent to protect itself from the guest kernel and
+ *   in-guest attackers.
  *
- * - coordinated: An in-guest agent handles #VE and VMFUNCs locally,
- *   but makes requests of an agent running outside the domain for
- *   bigger changes (such as modifying altp2m entires).
+ * - coordinated (x86 only): An in-guest agent handles #VE and VMFUNCs
+ *   locally, but makes requests of an agent running outside the
+ *   domain for bigger changes (such as modifying altp2m entires).
  *
  * This corresponds to the three values for HVM_PARAM_ALTP2M
  * (external, mixed, limited). All three models have advantages and
@@ -97,7 +99,7 @@ int do_altp2m_op(
 
     if ( (a.cmd != HVMOP_altp2m_get_domain_state) &&
          (a.cmd != HVMOP_altp2m_set_domain_state) &&
-         !d->altp2m_active )
+         !altp2m_active(d) )
     {
         rc = -EOPNOTSUPP;
         goto out;
@@ -122,6 +124,7 @@ int do_altp2m_op(
 
     switch ( a.cmd )
     {
+#ifdef CONFIG_X86
     case HVMOP_altp2m_get_domain_state:
         a.u.domain_state.state = altp2m_active(d);
         rc = __copy_to_guest(arg, &a, 1) ? -EFAULT : 0;
@@ -394,9 +397,12 @@ int do_altp2m_op(
             rc = altp2m_set_view_visibility(d, idx, a.u.set_visibility.visible);
         break;
     }
+#endif /* CONFIG_X86 */
 
     default:
+#ifdef CONFIG_X86
         ASSERT_UNREACHABLE();
+#endif
         rc = -EOPNOTSUPP;
         break;
     }
@@ -406,13 +412,6 @@ int do_altp2m_op(
 
     return rc;
 }
-#else
-int do_altp2m_op(
-    XEN_GUEST_HANDLE_PARAM(void) arg)
-{
-    return -EOPNOTSUPP;
-}
-#endif
 
 /*
  * Local variables:
-- 
2.34.1


