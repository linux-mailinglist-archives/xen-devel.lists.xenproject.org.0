Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLYgNK6b5mnCygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAA0434274
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287817.1568267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwFC-0004Ob-Ck; Mon, 20 Apr 2026 21:33:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287817.1568267; Mon, 20 Apr 2026 21:33:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwFB-0004AS-FQ; Mon, 20 Apr 2026 21:33:25 +0000
Received: by outflank-mailman (input) for mailman id 1287817;
 Mon, 20 Apr 2026 21:33:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEwF4-00030Q-Tq
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:33:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEwF4-0054Hn-9c
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:33:18 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b93-5cb7-0a2a0a5109dd-0a2a4504dc78-12
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:18 +0200
Received: from [52.101.62.107]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b9c-1dec-0a2a45040019-34653e6b23f9-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:17 +0200
Received: from SN7PR04CA0051.namprd04.prod.outlook.com (2603:10b6:806:120::26)
 by PH0PR08MB10954.namprd08.prod.outlook.com (2603:10b6:510:383::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:33:12 +0000
Received: from SA2PEPF00003F63.namprd04.prod.outlook.com
 (2603:10b6:806:120:cafe::e5) by SN7PR04CA0051.outlook.office365.com
 (2603:10b6:806:120::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:12 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 SA2PEPF00003F63.mail.protection.outlook.com (10.167.248.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:33:12 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzzHW33vXz1wdZ; 
 Mon, 20 Apr 2026 14:33:11 -0700 (PDT)
Received: from DM5PR08CU004.outbound.protection.outlook.com
 (mail-dm5pr08cu00404.outbound.protection.outlook.com [40.93.13.100])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:33:10 -0700 (PDT)
Received: from BY1P220CA0047.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59e::9)
 by CYXPR08MB9432.namprd08.prod.outlook.com (2603:10b6:930:e5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:33:08 +0000
Received: from SJ1PEPF000026C8.namprd04.prod.outlook.com
 (2603:10b6:a03:59e:cafe::82) by BY1P220CA0047.outlook.office365.com
 (2603:10b6:a03:59e::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:08 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 SJ1PEPF000026C8.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:33:07 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:33:05 +0200
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
 b=gA66qJ1qr9aYoIM5IssLJzzsSas8fVxu/c5AmC9I/YQn2Q9A1tr7XY3Vu9A/GxyMFlTdUNT368It7QXpYvVxV2vLtEhdalnM0OWNm2EcGyzsG885yh4LEbxszsRq3SXWbGQAnBFud/0YzXBwkV/WPNNlB5eVQQ2KJD5eJf8Ikcf9H7aIu260IZNwgyPsAcAXsNMWRCpJfolfr+4Efb3vlKRGoOXxJO8IKR0TOmgWLJIJoLUa5XP6NpdHVLOdVg1Oww8ON4xQRuRkMWZy8THvUQ0m3i0nWPwmP86R6+RrByZid7YGKwL4/l4yhlWJtTShpe0mzctqDGffF6Q3c0a9uQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YyF2sek1Gl4M2bt+N59A0D5zPi4VE0N2VV6Dzby1vi0=;
 b=wnCGf150i/7w01QvMem5/ix7wTNuRrQIApEfiJsyjYayp/r8O+YX9gxMRIFzsuvjVeTcWvJeDsFQjzCxDM4rN/fFxqnegCkP9bSsgKjDEUHfMVcMvgb23fEs+rVUVOJvWF1T39B9pcFdljVJG+A2/hlJWzIWEWZXdSHUJuz7JYhOztZnfN9I+DU6y0pe8Jx80Kmh04RtEYKjqQDSCNTkHQyrWuU0HwPxYa/WC4lapALRL6Kbd6gooT7Tveo+6kkQDODOUfRF400lfQqiBiS8opE/LbjrriEt1mRfHMGdxzOkm1bIEbihfBJkMNmkS/hickeZO5AheGwVa1ibTVXCqQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.13.100) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YyF2sek1Gl4M2bt+N59A0D5zPi4VE0N2VV6Dzby1vi0=;
 b=THCmPKYmR4mNKVFXzs4CHRnXw/CU0va6qOrv1kWN9MLrxMFnJCKgknBzQpkhA9AeEuajOUIija31UZ6jgFSnb+ueBtv/vegZvIFL9TiE4veiGk7zWp9wygHEV6eBrosVQK6Cd5ZziVYMm/PYQyUSbbcmMa6829BCxXsL6t2CMm4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.13.100)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.13.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.13.100; helo=DM5PR08CU004.outbound.protection.outlook.com;
 pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LqwhXpYbI7+4tnBowhn+W0TszIQV4DVijXufMJHC9f4cEOoZRejEayA1hyqJ9xxtClmS9i/D3b2zr21GrHhbFEFjSrsq8ONsTsdC7gawMGUStRN/W+4QP9eWDzkeL/X+ioJgigO7L74ubzyBDktnp7cp0gEqG/EisUGPDAfMQw9DTHufLSSLDpntbXYBLbNdSUsSc4Cr6G66PQ5Oeb50U6GveIa6GpeUM8cPC0A+F8TBV8KvjQee+PCrl31i3MsgCLgPlD/L9S76Y23TCqgl66PJFcTEZ56Vs3OsIlAN5wHnBs9c7vCl/s2eS+l/zDZ15r0agSwEEwGaKDPzWqOunQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YyF2sek1Gl4M2bt+N59A0D5zPi4VE0N2VV6Dzby1vi0=;
 b=uo7owkK779+Jyq+s+nDeOMw8B71wLx8mxtvS0gVL61YwX28YXWfSc5iYCMmVKWHyq2vX63onBSvZtA4nx+MOAsSAZ9GdHFXxUCXkfi4IbTGgJbuS0izEunYx7mo0cLA/W/x5DYn+DYdPVBdgmmbdIBvlFiNhV6hzJaEc/v16VG9dtMLP0nifSFiMga0vKD2XFF0gOLmdZa8pwE72hvohZC86FxMyuBmhsXDmE9udO4w/D7f9SsRvSwZwyVlsQgTZS/LuL65zgaBjIVM6t3I6oNuZeT815tiV/BNv1866JOikXfjfqtAblAOmq4cK9D86+jvR5pmxYEfiRYImfHoBjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YyF2sek1Gl4M2bt+N59A0D5zPi4VE0N2VV6Dzby1vi0=;
 b=THCmPKYmR4mNKVFXzs4CHRnXw/CU0va6qOrv1kWN9MLrxMFnJCKgknBzQpkhA9AeEuajOUIija31UZ6jgFSnb+ueBtv/vegZvIFL9TiE4veiGk7zWp9wygHEV6eBrosVQK6Cd5ZziVYMm/PYQyUSbbcmMa6829BCxXsL6t2CMm4=
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
 Babchuk" <Volodymyr_Babchuk@epam.com>, Sergej Proskurin
	<proskurin@sec.in.tum.de>
Subject: [RFC PATCH v6 25/43] arm/altp2m: Add altp2m index to arch_vcpu
Date: Mon, 20 Apr 2026 17:31:48 -0400
Message-ID: <20260420213206.208750-26-Rose.Spangler@elektrobit.com>
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
	SJ1PEPF000026C8:EE_|CYXPR08MB9432:EE_|SA2PEPF00003F63:EE_|PH0PR08MB10954:EE_
X-MS-Office365-Filtering-Correlation-Id: 558191f2-997b-4489-a2f6-08de9f246cbc
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?7Ghb1HU84mtv2uHW7K9PpWSE9hUaeEg9Z5RP4QbbjZ8ZKMwVEqLO7m8oLEOZ?=
 =?us-ascii?Q?MLUCvdNpSV4pykqo0cqw3ykDgUE6DcpizpjCXxNFE/PnYVPFdNuezQpL9UjJ?=
 =?us-ascii?Q?zOXET97q8Ys+RsoVE8otbU5Ig72LVWVnoQErwRceltAyqTp1pP3ykArC1kdb?=
 =?us-ascii?Q?zC0vyPPlirexpEQY/LxbjQHZdkh7LzEY8YSde1Pju536ohB20VKPUEQ47D8g?=
 =?us-ascii?Q?4Or+zWp7cB8kl2ivCx2fxPVNllsme++Xreiu22XGC8XYEUszOQG+MnY2IB3r?=
 =?us-ascii?Q?q6OiWzhzWYIhhJB0kW6Ybt/YEfFSjviRbCeOEv6LAexiXxHdSjJOSSRMRZkz?=
 =?us-ascii?Q?ojIxKGSclFati+lgPuCDHmv04aZBrbu/ut900oBVrwUUkftNMppxNuauUMFH?=
 =?us-ascii?Q?9fgRFIcy1WOiXtT6OhxPDcBpX2ORx2hHo8Jxb2htToB3xaUBnD/jVA9YNSCh?=
 =?us-ascii?Q?f9TQhkEeypsc7rcVyEm3oP1MwnkLyMXZUeB/uIxbMYs58wYpd+BgetIjgY/L?=
 =?us-ascii?Q?ZuSMNr8LrY46frKIH1Mg9dzWpvRQ2qJJOYCjtavwrPt5m1cWPxNQkW411gTY?=
 =?us-ascii?Q?WVuoOu964hd2gBWkDCOi+OolkwLtnaX8vSKruFIhGKdwTcdpEK1p/Q8a8s5S?=
 =?us-ascii?Q?U2zjCKtbB7kCtt1JF5EISBUfS/mn+q0EGw2/q1oFp5F2HM3qFwLOYx9abP+y?=
 =?us-ascii?Q?92Lso/2jvZl5pssAYORElkUtU5argSOLOeyIT7dXn/kqgLDxq1MUfEqGrvYS?=
 =?us-ascii?Q?5TMquytUwaEV8DVa3jVkr/GeYgf5kaHqZQOTyHnFxIytErxVpHfArzQSF6yO?=
 =?us-ascii?Q?nC2aH420ZoqFzBy1BtK9a2sC+C/ToULbNx/y5gvfNwAAXNl08yxk+4LggRJW?=
 =?us-ascii?Q?76IJ5aL5GfDnLTkM82gI4sfYg92+BblmwRDiZlmccmApib2qGkoPEHlwUoTk?=
 =?us-ascii?Q?69icvkiazn4m+Sm/WA8p3fheC61t7v4zct+xdGHa0c6OlxmZ9G4/Pk5CBf4c?=
 =?us-ascii?Q?CQHUOBmhmGX7vr16LDK1G1NgN8cgwBQv6iSJfHSvwxwqb6HFBRHSC+u1/z/S?=
 =?us-ascii?Q?B+cUDJLQ94n/Z5iOhysUyuYgkQXa7Dih4DhsJsPOIUKxcfrfg3olQ0EJXb0N?=
 =?us-ascii?Q?Fsau9Ms1VbVXZrbq/hC3MQb6DvI61cgFu/rA+DUpycD2g61oD7l701XGqXqV?=
 =?us-ascii?Q?wrdx8g1ytBHQrNMt?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 j7gEgFlDKiCBoTWJzwZ8nQTHvzGIdeI6kpJPS80llnwAvS/icOnuBYKFNlh2vDUecsfIVCTPX4tUAd5vgueFw4vO05nAx4jE9tAhrNJdE1OqvKRjddPxOFt6W/bRSpWMVZWpbRno0OEqtCB15k8ug3ZEwcO/M34woMfj8dcERry0CmclpJZQJIc/6ixwRoaysMy27cJ8uFLa9J2B7uA6IQiYvdXKI9aCdBC6/IWkJZJOb7vWWcfWKMBcZULif+vrU2H2MtZB78N5YfztUMNqY2j0i02XTEajax4g7+rEv0gy6UL4xOjGR77toch1EOInFxykwqsWiW0A98BCq1tDBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR08MB9432
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.13.100];domain=DM5PR08CU004.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.13.100];domain=DM5PR08CU004.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 SA2PEPF00003F63.namprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6a518397-6404-4f65-65a3-08de9f246a21
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|35042699022|156008|36860700016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZAXdAa8Uiw9Qy0AH0NcwNiO7SNiVbdRav7pirYgZk2V+EM0nNBkw+c4jeNGH?=
 =?us-ascii?Q?07JlNVPMnqufeGwXwEB0uguilwTqKfFw32Xi6eVm3a0zddAdESjlO5KP3A7r?=
 =?us-ascii?Q?2o99ekmMVUJj5jdGFXwef9bi3jMcDTp9djofYcfjpVdzY8xHHb0frj3QYS/D?=
 =?us-ascii?Q?24i9NC+mTTufNBSYwBWoKVg1p0yUnvgaJuEO40PLG6BNdVhwbbQJcqMpKlhM?=
 =?us-ascii?Q?QgeSuSun5SC5MIaUKJTQSRCk8vSTsUmCvq8xsz3GnDvhbqAr2HrqruucT+KX?=
 =?us-ascii?Q?KNwN4Uo4Eyw+ab+7MgrNJQpdw/JfUsaFi/zYY0o06UB6AC8eGoIBatOqimR7?=
 =?us-ascii?Q?7iPSUpp0KoYWJNXZys5yBxwxT9/+EQwD7fbhsPFCEMaMjWuINuRjttSMCPDT?=
 =?us-ascii?Q?1HY+JiHqMfuM6c0o6wvWL0SButOaRUu9dme8IuedPXZrXI2gus7c7bECSOCn?=
 =?us-ascii?Q?kRGlpkg1qJmcKjeFpb8VbVeDSN5LuWSCwH7xD0x00/sdjMyDOuJVbDs5Z4gY?=
 =?us-ascii?Q?3ZABgLPJ0hwJwN0SseMtfAWUmwp/wRkRPdtqnFwYzjmcgEB7F/YQ+3c8kjf6?=
 =?us-ascii?Q?c5jB9KZ3scvyW5cC3K5nVIlt5efswurR+hyI82JGC1IFuKzc9YyhxLeCMV45?=
 =?us-ascii?Q?KnSTV9x9E4qCpxR06cZy0/nclxIKOgN+dua6xXro/nwm5WNlIhNqYWxrQOCB?=
 =?us-ascii?Q?GVa9iqXa8VV593er3LXzmMh0lwsNqUeLRpwJ4QiK8bT+lqQaHu8r3n2Z9mo7?=
 =?us-ascii?Q?OW71IqBjsEkOu55LhmylhCEqwG0BfgEsvjyxmm+UliZNn5kBhrCbW28dEL65?=
 =?us-ascii?Q?x+vK+9KQyd9xwsbQy7yFnZJ1QNfe+0Hfvmshmom2f1PL6wuwIEJ1uax3EMjS?=
 =?us-ascii?Q?uIPVR103mS3/qWXKKXtiKrJUnkNZ/95G9+HYPniQEKlrqXo1DV/fJsaMwiuH?=
 =?us-ascii?Q?ahu5aWZii2OFw32F0FLZoR14n3xnLKOtVTuGsp8OyFU25kwf835OGeoHOKiz?=
 =?us-ascii?Q?JI8IQseJ71VuxjnGa7p87Z2Mreu2eGnfutuWWUXJpyvmKyoxEcTxRKnapl8P?=
 =?us-ascii?Q?PwrX0n3J4Wtccg1/0wK+anpW92jJh6REPOg3nuMAwCwbKKVU3WjSXUH6U6C6?=
 =?us-ascii?Q?M/KHn17p6pmaWlLy0/5gi0oWW4EWKlHkLDr74V7Zuw4GuvaAnNGSQOs2Avxx?=
 =?us-ascii?Q?lJBO4BZX58lIkNZm?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR08CU004.outbound.protection.outlook.com;PTR:mail-dm5pr08cu00404.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(35042699022)(156008)(36860700016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6Q+0lxUSrYdC1w0ZC9H5r/Y807GB/iwhObWzzKFzu17Pgu2WWS2KrsUwPGv1fmqXkCnXZPkTPnOCeWfD6M3+kM4Pvs+Vg2cLQNhlbxCT6kVq35qgqcbIkhGKfl7IefkfCktIOHbUWwSHQYjRWtXjZkgACYCYEGYbgDS+oF3JEQ4s6TUOuWhqDJtBmkyDWU94mbETxaJLLaeSrTRe5BiG+6H8xHLdIoRk9KRfse5GmtgYvyCCQmL/2OvQok0F+8UCDBL1BlIi12Ib7zTQzLUyvcoWPM73xvjr2blnpN+4ge0XcOtNhiXP7HAoqocSZq/Og8A+YLoLGUw1GAg1HYhB5K5ZviJX4Arkx53p+YRC4CvK6rDP3MKP4YLWldstNh43rvvkFelehWGlhQZMnxmVqecZ0b76ypq8NZ+ZTvctRdWMWe0nj5onVgA1QJR0F1Sv
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:33:12.1554
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 558191f2-997b-4489-a2f6-08de9f246cbc
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00003F63.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR08MB10954
X-purgate-ID: tlsNG-ebf023/1776720798-2AB633FF-B9597DD7/0/0
X-purgate-type: clean
X-purgate-size: 1874
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:proskurin@sec.in.tum.de,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.298];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 6EAA0434274
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This commit adds ap2m_idx to the VCPU struct on ARM. This makes it possible
to track the current altp2m view being used by a VCPU.

This is commit 2/4 of the altp2m_{get,set}_altp2m phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
Signed-off-by: Sergej Proskurin <proskurin@sec.in.tum.de>
---
v6: This patch was originally part of the "arm/p2m: Add
    HVMOP_altp2m_set_domain_state" patch from the v4/v5 patch series.
    It has been extracted into its own commit to make the patch series
    easier to follow. If it would be preferred, this commit can be squashed
    into another commit.

    Added support for the CONFIG_ALTP2M option.
---
 xen/arch/arm/include/asm/altp2m.h | 4 +---
 xen/arch/arm/include/asm/domain.h | 5 +++++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/include/asm/altp2m.h b/xen/arch/arm/include/asm/altp2m.h
index 5a217f48b103..bc695018e62c 100644
--- a/xen/arch/arm/include/asm/altp2m.h
+++ b/xen/arch/arm/include/asm/altp2m.h
@@ -26,9 +26,7 @@ static inline bool altp2m_supported(void)
 /* Alternate p2m VCPU */
 static inline uint16_t altp2m_vcpu_idx(const struct vcpu *v)
 {
-    /* Not implemented yet */
-    BUG();
-    return 0;
+    return v->arch.ap2m_idx;
 }
 
 #else /* CONFIG_ALTP2M */
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index 9e69d62086cd..4d497a21b648 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -249,6 +249,11 @@ struct arch_vcpu
     struct vtimer virt_timer;
     bool   vtimer_initialized;
 
+#if CONFIG_ALTP2M
+    /* Alternate p2m index */
+    uint16_t ap2m_idx;
+#endif
+
     /*
      * The full P2M may require some cleaning (e.g when emulation
      * set/way). As the action can take a long time, it requires
-- 
2.34.1


