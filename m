Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cA2uBmua5mk1ywEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:28:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB96A4340A6
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:28:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287515.1567987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEw9k-0003aJ-NC; Mon, 20 Apr 2026 21:27:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287515.1567987; Mon, 20 Apr 2026 21:27:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEw9k-0003Wl-AM; Mon, 20 Apr 2026 21:27:48 +0000
Received: by outflank-mailman (input) for mailman id 1287515;
 Mon, 20 Apr 2026 21:27:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEw9i-0002xH-1w
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:27:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEw9h-001N4o-Em
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:27:45 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69a45-2eae-0a2a0a5409dd-0a2a450beb80-12
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:27:45 +0200
Received: from [40.93.201.105]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69a4f-212f-0a2a450b0019-285dc969bbfb-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:27:45 +0200
Received: from IA4P221CA0010.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:559::13)
 by BY1PR08MB10115.namprd08.prod.outlook.com (2603:10b6:a03:5a8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:27:38 +0000
Received: from BL6PEPF0001AB71.namprd02.prod.outlook.com
 (2603:10b6:208:559:cafe::1a) by IA4P221CA0010.outlook.office365.com
 (2603:10b6:208:559::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:27:38 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 BL6PEPF0001AB71.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:27:37 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzz950PmKz1wdP; 
 Mon, 20 Apr 2026 14:27:37 -0700 (PDT)
Received: from SN1PR07CU001.outbound.protection.outlook.com
 (mail-sn1pr07cu00103.outbound.protection.outlook.com [40.93.14.99])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:27:36 -0700 (PDT)
Received: from CH5PR05CA0015.namprd05.prod.outlook.com (2603:10b6:610:1f0::20)
 by PH8PR08MB8582.namprd08.prod.outlook.com (2603:10b6:510:238::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:27:31 +0000
Received: from CH2PEPF00000099.namprd02.prod.outlook.com
 (2603:10b6:610:1f0:cafe::36) by CH5PR05CA0015.outlook.office365.com
 (2603:10b6:610:1f0::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:27:30 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 CH2PEPF00000099.mail.protection.outlook.com (10.167.244.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:27:30 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:27:28 +0200
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
 b=On2uEasPOcoKNFeMIhg/JDgAuiZpjVggZvB2w60k9nmVjT3kiaTw7nHz14hFw3F6EyZy/MBZdQq0HKkU3BJj4fqpBJFHkp91dqmHU/8cic7/W0GnK8t+w5fV0DmC1pGC7TPy1kxwQVdi/xqjQ8rpJwGEdoDZmDwg+th9vrEvursN334ibHIB2UKEBdlqHMvO+DL07JF6qxIKIZ3KvTH3M6yjsHTpRhj/CGxaWWsa1J3uzKx/6hZlhZxyDucSFcBv+OgEu9+hKCPLObBDEEtlbhZ9zfGvswAOYZ9EpXG+FjPzE7+kfFKquajIpbNE05pOG3HHOCpdcA6mLuBDkDaFIA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZHidNjasS/JOgBnj6tsz69bwCge0ojtPt0VVEzO0kMs=;
 b=hWuClcLT3TfdoCs+evStXCNy7l44JBVaLB7J8MXhF9uDVrMVIcpmsMxNtKKgczUTl3divJm/o9Pb5dELnVB1MpFxxvZQt8/uOKtOpLnQQP+FnLSy6VifpLTLjv4fjl18LBX54Vg3OuzXy92u1s4yVrLbBVk2iqLi+TTw9n5qoJMeXsan+fqB2fOu26E9j5atGWyoYXbVnyP0WRkq4kHgQ/nCFq1psghNUobwmNiAU6grWE93bwEIylvbjv2dQ4pbLj0Cee0dnTz4jNI5NQ8xLig227Ya6ciXG6OzJXbVzsUiCW6JeTwtsU+hXwyV31OYTVc30yO3MC3Ec+KLan9ZBA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.14.99) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZHidNjasS/JOgBnj6tsz69bwCge0ojtPt0VVEzO0kMs=;
 b=XMVQX4D3+g2HZWJBRi5G/wlBWhagHFQF4q+tXjdH8j2DZHkUeoIfjTj1+CmWiv8iTeDNV5h+jLZbmNJgRH48QJZ9blsHoChX62DyjEsaqMKWWOrWcjDjxU6Li+uIOQvO3lIzLTI8KHcD7eX8ypdE9M029RGgchr4SnMA1FErCsg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.14.99)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.14.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.14.99; helo=SN1PR07CU001.outbound.protection.outlook.com;
 pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jgYHjqhHga3btf7YyspEXTvORmwvhRxrZ5b/42Yi6mcHpbwv/POKHO8GKD5PO6ZCO1C9SltrSO1X2tcW5R14L1Z2orZqiHXy2fFAqKBF1Tg8Xd7C6kPyrJhhtK8vPMrMYG58S1fdMH3GjN/LOykDD/caq1ce0etC+O8x/OI/qDcxGXm+A1V7XVHIh2iiFyoXSJ1K7bNsyFyfWWHKeGGahpHcZ0lA76LtNC6bccBWlxHW+aX6C8VteaTwGyeIDIYawjBSUCIreG1IsI+AG01z9BilTFjly04qM8fo5Kjp31g8bt4ly2fGzYCvm/iKwC76AUqeAA5z7wc3b388t6hmBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZHidNjasS/JOgBnj6tsz69bwCge0ojtPt0VVEzO0kMs=;
 b=C+/2MEAH/vQrJlNZFPjMjOJ9vXN2IwPZzt+FTKzH3CubDokNZcbrQ2/qcY9gYAxp9rsvCdnsHZVKW8Jl9I2VtBvVbpLXBRXf3P6Bnq3b19QZcPQTY4By6EfkDjxEfZqliTYHS9qkaVrNB3RqU3WGL7Wro17QHbuw0M/9CNq6ZuCFZz0fdFJw34CU/qaZF3m7FGdYal2+Qyerus1ikpwS4094LRbn/khNd6VGfV4wScFv3WxEysYkOxMa8UDIzn9t8793HAuUqrBquCHjEek5MeHegYU1YwVHsT+H8iPSQXxdK9a4tQ1QPNDsqDa3UjFIcoqUhWhmVUSoDgrG1tbkdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZHidNjasS/JOgBnj6tsz69bwCge0ojtPt0VVEzO0kMs=;
 b=XMVQX4D3+g2HZWJBRi5G/wlBWhagHFQF4q+tXjdH8j2DZHkUeoIfjTj1+CmWiv8iTeDNV5h+jLZbmNJgRH48QJZ9blsHoChX62DyjEsaqMKWWOrWcjDjxU6Li+uIOQvO3lIzLTI8KHcD7eX8ypdE9M029RGgchr4SnMA1FErCsg=
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
Subject: [RFC PATCH v6 20/43] arm/p2m: Rename parameter in p2m_alloc_vmid
Date: Mon, 20 Apr 2026 17:26:25 -0400
Message-ID: <20260420212648.208640-13-Rose.Spangler@elektrobit.com>
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
	CH2PEPF00000099:EE_|PH8PR08MB8582:EE_|BL6PEPF0001AB71:EE_|BY1PR08MB10115:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a241d68-4607-4d19-fb71-08de9f23a58a
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?oCutujWzU/ev/yCD8TSqrORAdzC+DgD0JbPCzM72YDG/2VxmruJeVpIBXLAb?=
 =?us-ascii?Q?JR06Fd8F//A0bKZaQ34LYU7cUz2xfPhX+wV33Fs/atG53tuEZeSF76BzWTn3?=
 =?us-ascii?Q?evZONISYAi+uTB70DnQzCarrfa6ZSlFfNbrbqJqt8lx8A7RfL6Zngd94fri5?=
 =?us-ascii?Q?24ppqOGMhKasZbxK5KMUHlOzNq7dqgKKED+t3L4MtOJ81BhouY3B0cTcNShn?=
 =?us-ascii?Q?xTm0eqBpZvBYUe/w61gONQqZTJM2PrisXRzoCvnbr9vCZm6x3PnebyVTQoWR?=
 =?us-ascii?Q?Eeo4yhuoxYDMtn99K4A1595n1NvGw4F3vhXOsrKjf7RkDHpIe3bz2tIkeZTV?=
 =?us-ascii?Q?uveKiKuf5kjGtY6gbJGEngRGZbTCmQ+5vddoMsZ02kpnNnzCfy66FH7/mtzZ?=
 =?us-ascii?Q?aJ1TB3Irn8135SY7iEPSBphnVYlIxh4Mpd4qFin3M3JMLMBLxpHVc8BdKm8t?=
 =?us-ascii?Q?/9t1J+yXsaluzyWoLBthEhfdv4TqNiyq/mqrXLVa1wUnHk8dYNb2mog/EA3N?=
 =?us-ascii?Q?gSqtS/mHeLzCoK/fHbE6/4HIzepJp8k2w9OYjSLraz44zI6XOjcdFh3nT+ow?=
 =?us-ascii?Q?Jl9J2kBeWePsbk+f3gcg6QHt+le82mS1839kWUR3eK4T0CznXhUuGN8tfGiR?=
 =?us-ascii?Q?nGqzowAb7DfzK1ULAhLWPDymykV5t220v9mUF7As9IaS0AZrmrYNf/Bob9aE?=
 =?us-ascii?Q?qN9bm0PoakLzFAcW7x0cG5xvNxdr90f2Af4VnVvF1Vw74+y3OnOlGJQsRm3X?=
 =?us-ascii?Q?cEdQnpbSV+A81g35UI/81bYqXL0j01jPngG8YqTa2P2m1mknQqv+JNvNRlUj?=
 =?us-ascii?Q?alxlRdiOtXF6pDX/Oocn32Mv+Oqj+iQtpxoz4LJZSwLIhTba+BhCIsTBQ4te?=
 =?us-ascii?Q?22CZr6yTvaJ6q63m5h6rdu8nIKo1NeL4X4rmGlzPukA9sE/LMxVB4Ij4XmEO?=
 =?us-ascii?Q?2iTwFUVDcyOXrcyhYWGgwhxb0YfDt+ExnnBlwGgH05Ky0SxbVBdNEEj/93w/?=
 =?us-ascii?Q?D4TkOTocX55SQzsMKegA4TMDURLcjTVirVbaTZH+FJByZE7YEx1C6tjthxix?=
 =?us-ascii?Q?WU2Cy/ExFgMj3glUJNetfuyCzE5sDtpDB5TZxgAJh9ocFJ5h27jwyTSDQ+sw?=
 =?us-ascii?Q?hBj6QrP+bsh2DzB0LTgT5EHHBQvnR5WboR9KiSgmjAvUzyuTvPxZ6vODeu0d?=
 =?us-ascii?Q?5fTWXeHkAfr7k0BraXTvzN5V7gsMkJ80aGt2wV7xgO8RJ0t3jmRSN30IWqK9?=
 =?us-ascii?Q?VowcNk9dr3iL/MnkhkyfQ5V2B1Qj2ezGYDiUXANy3Q=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 XaLtWHR66arFg7rYhcXnEz1+NkJHKKpu+/qxHMfOCP7cTwkxhvM3wKuheJWoeEDrOCFj9e2GluzYyP6RQPIaROQklF7y87qyiZqePeAdQ+PG0hKvXDGaPZo/aF79hW/XW7EpWYhMxABfXW6Bn0t7mEEbwrL8haMc6L0KHvIbSuYQZ2HkIMzZ3A4VyAseGmGurx15yfgH+D0TY0n7bECZ/WTMzoPSVoPwZ40l7xxHjyo98KY6X1y7L4p1kZz72z6v/d+MD0q78KWZCymuQLl/3VyhhjSd9TcK3qAAiTwXR0jP6D+TuWsCmkUDvae4byriQpgiTHba+AGN/9Y82mBqow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR08MB8582
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.14.99];domain=SN1PR07CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.14.99];domain=SN1PR07CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 BL6PEPF0001AB71.namprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	18ae6dae-186a-473f-b558-08de9f23a11b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|14060799003|36860700016|35042699022|156008|82310400026|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mN/xbEjN63fPM44mDacGcP3gmDhWwI7W1b9bgKqZTWVLetgF3wdjlzxiVUKu?=
 =?us-ascii?Q?84f3OO03f1gipnwuggHRzm+WBIhBqoj2z1Gc5gSzmWe+neSASWE9YlpF26Rj?=
 =?us-ascii?Q?6ySU+BXaVACn4xg4EiR+72Afvik50VOeCeEmBRBEtLWUqonHs+W05O2nfBUP?=
 =?us-ascii?Q?U2LdLbkq/HmCXGkSZgnT61dyjhoyyKwWMZ8FoJXxmOwRY7DYiHW8L2yKRvLS?=
 =?us-ascii?Q?zfn2s0rXbZAYGd4caa78q8x13M0dTHtmOoczn0qLRUGOvMc85sGXAkZw3yXC?=
 =?us-ascii?Q?oh1yytjczjGnjLcln7b7t7EKbuFtUuugiThSCT7r4lYJg+DAgtWN8rVTe1QO?=
 =?us-ascii?Q?1D+hCPW6R/hfXao3xYnYRqjtict1gF2XrYXdID/GYwLN8txwKZvaUmJ0aETT?=
 =?us-ascii?Q?NP12pF6DxtNV+8E9mS3XOgP2Fw2sNyeHovHghgBlujDxQb8NNYe1OZrsCiQU?=
 =?us-ascii?Q?j4lIdxEPSSMxM9luBlkLAjx7RjFjz+dFOuCwZFIoj1wokBb4cKfC0Ps3kuai?=
 =?us-ascii?Q?mOdV41DaFW9RCiHAu9SM/YQzhWOwtektDUh6SCQVE7vqspy70dUO3U9l0Qfk?=
 =?us-ascii?Q?T82LsM7kvr45HM9ftF8pLzAlNK9sBFRiRHYrBjppi1le0ju/meCmRgpKr9Df?=
 =?us-ascii?Q?iJ5vv1xy0rzWsSxnx7z+ilImhQalCGJxN9cLhIyTnUopKMOqbaqoR+nCkZAL?=
 =?us-ascii?Q?oXwXfBHsyb+Ax+Pl3JfZctxm1lWAO6i0N5StyblaEi7slNH3KgIgHh1DmKDu?=
 =?us-ascii?Q?XkWn4GSAd3ojxFs9/Kx0gaXy/vzBD9TSrbmtn95bn/upI0yJjndmSZfGmOTS?=
 =?us-ascii?Q?ycaxrwERIrzeTaRKKd2+eQ0IcCtPPd64ubrFeAWVref8lE786k+fKuM49evB?=
 =?us-ascii?Q?K0W7/zX2NE2hil7F95pGMVGc4UG8+KHlj1f48zvk1OFODbJA+OitAyxrPH58?=
 =?us-ascii?Q?gn9KtNbMq/h81qUw+5dHqkX+wvLiNZxJt/VLNGSIKotWXqBrihk7QIouaJ8y?=
 =?us-ascii?Q?ai9bkuJc0yvvZ4Mi4hkifkc/9CwYT5F+qA5fZd/95pCNOSW9qjNekSnQme6Z?=
 =?us-ascii?Q?4rD5hjG2rpXZ4Hxg2nIeCTFxHLl1tPdeIYSRQ9J5WrCmsd6x8RcrdxwTkvop?=
 =?us-ascii?Q?ZV9tZYcw5B6PILtgJTKQg90Poq7+AWWHUvNtneXQos+sYgS3ywI2nMGZO6rn?=
 =?us-ascii?Q?H/QBBLmLjIV9Q/mrpaRCoWRkT3M5gmfQB9wjC8KfV2fuAGdPLIS+1lvkFWlu?=
 =?us-ascii?Q?vBHcntGKCmYmJvrglbiO/OxYW1a2XvvfnqwgEppgLw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN1PR07CU001.outbound.protection.outlook.com;PTR:mail-sn1pr07cu00103.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(376014)(14060799003)(36860700016)(35042699022)(156008)(82310400026)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OJilbvoS+TJ9e7ZCwGJCWEquSlTNmoua9MaW40cXGO88KQyinMaaGSh15iMhqK2/icl94gQYb+r3c4l15+kAm2wLrg4ZrXkg84YMkyd8By5LeM+h1DlsHMbor5KmsjZPfLBKG3d8b45XYsdEDzDB5D8gv59wOUVLrHa9Dmd22GTjfLX0PbmtQgwBdmw0zyCS26F/RMx2ttcF+FqgEjL9Wh+/UH3kiZk2whzX5wsUD+142c1MpfTwIdr7xXh1Y8GmH6ZuJ5OdLEX1iRJJ/nFv8PWuSr/+R00RQWAYfMGnz4n3MwPUpwjGjAR2WkF4/PL7MUmzaf5TGEIgr8Pg8/ZKiH5OogJqgQh3VAvo+6t/2Wnx6uoRvzdvnp1ZtgZ8dv01ayr4e05G5Io5WCeeBs7xBnH/ns7X8ccgFI4X2yYAvfWgG7QQBuVKq7FdPGN5UqTE
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:27:37.9262
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a241d68-4607-4d19-fb71-08de9f23a58a
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB71.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR08MB10115
X-purgate-ID: tlsNG-42698a/1776720465-7DD6FF3B-419190ED/0/0
X-purgate-type: clean
X-purgate-size: 1341
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
	NEURAL_HAM(-0.00)[-0.244];
	TAGGED_RCPT(0.00)[xen-devel];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tum.de:email,elektrobit.com:dkim,elektrobit.com:mid]
X-Rspamd-Queue-Id: EB96A4340A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Sergej Proskurin <proskurin@sec.in.tum.de>

This commit does not change or introduce any additional functionality
but rather is a part of the following commit that alters the
functionality of the function "p2m_alloc_vmid".

This is commit 9/12 of the altp2m_init/altp2m_teardown routines phase.

Signed-off-by: Sergej Proskurin <proskurin@sec.in.tum.de>
---
 xen/arch/arm/p2m.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index fb03978a19af..2c43b6033360 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -286,24 +286,24 @@ int p2m_alloc_vmid(struct domain *d)
 {
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
 
-    int rc, nr;
+    int rc, vmid;
 
     spin_lock(&vmid_alloc_lock);
 
-    nr = find_first_zero_bit(vmid_mask, MAX_VMID);
+    vmid = find_first_zero_bit(vmid_mask, MAX_VMID);
 
-    ASSERT(nr != INVALID_VMID);
+    ASSERT(vmid != INVALID_VMID);
 
-    if ( nr == MAX_VMID )
+    if ( vmid == MAX_VMID )
     {
         rc = -EBUSY;
         printk(XENLOG_ERR "p2m.c: dom%d: VMID pool exhausted\n", d->domain_id);
         goto out;
     }
 
-    set_bit(nr, vmid_mask);
+    set_bit(vmid, vmid_mask);
 
-    p2m->vmid = nr;
+    p2m->vmid = vmid;
 
     rc = 0;
 
-- 
2.34.1


