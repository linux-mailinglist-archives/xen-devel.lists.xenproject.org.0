Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +N2nNo2b5mnCygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B534341DF
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287751.1568136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwEe-0007JC-7n; Mon, 20 Apr 2026 21:32:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287751.1568136; Mon, 20 Apr 2026 21:32:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwEd-0007HB-Uq; Mon, 20 Apr 2026 21:32:51 +0000
Received: by outflank-mailman (input) for mailman id 1287751;
 Mon, 20 Apr 2026 21:32:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEwEc-0007Fm-BI
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:32:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEwEb-00CD1J-O7
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:32:49 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b6b-2eae-0a2a0a5409dd-0a2a450289b2-26
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:32:49 +0200
Received: from [40.93.195.106]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b80-af86-0a2a45020019-285dc36a4869-4
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:32:49 +0200
Received: from BL1P221CA0040.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:5b5::15)
 by LV3PR08MB10562.namprd08.prod.outlook.com (2603:10b6:408:280::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:32:43 +0000
Received: from BN2PEPF00004FBE.namprd04.prod.outlook.com
 (2603:10b6:208:5b5:cafe::b2) by BL1P221CA0040.outlook.office365.com
 (2603:10b6:208:5b5::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:32:41 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 BN2PEPF00004FBE.mail.protection.outlook.com (10.167.243.184) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:32:41 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzzGw2lKzz1wdP; 
 Mon, 20 Apr 2026 14:32:40 -0700 (PDT)
Received: from BL0PR07CU001.outbound.protection.outlook.com
 (mail-bl0pr07cu00107.outbound.protection.outlook.com [40.93.4.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:32:40 -0700 (PDT)
Received: from SJ0PR05CA0148.namprd05.prod.outlook.com (2603:10b6:a03:33d::33)
 by BY1PR08MB8648.namprd08.prod.outlook.com (2603:10b6:a03:52c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Mon, 20 Apr
 2026 21:32:34 +0000
Received: from SJ1PEPF000026C5.namprd04.prod.outlook.com
 (2603:10b6:a03:33d:cafe::e) by SJ0PR05CA0148.outlook.office365.com
 (2603:10b6:a03:33d::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:32:34 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 SJ1PEPF000026C5.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:32:34 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:32:30 +0200
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
 b=rlbQ49LaJI6rkxKrc2sEJbiXaFzTCLpuOqr+GQtf5oVDFrTQhQTBYqpE9MrbfrbzmgIvQSH51OGkPOJ+1W/bwF3rOMaIagAWSQ5l2OLYXWOzM263yfY4XWCKfhIy2uwKCDIUr0EbzMS5yyGenE7Y+EexRNmBR1M8cQFiwn/4G6/Gw/zT+TXQhx8NkiuJgJ3pFjwNJIJkS18RDbkSVFAghUB47oxfvdzprDGKZevCWJypa6bo5oLC6g/t8Tmpyf3X5/B0MS9TKlGeM76TkJZ3pCo4y+Sqqj00VFdqRBhmnLe95FjShKEpwWT/Dn9h9e+VtGU8d88cllrRj9w8hCoXzA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HCpfUimCCQkOtqeuUzULZSjqPkZv/1OumHTvfODlnj8=;
 b=rlpxTKSP8g2kUSUm9s9gWhjpSncW22WR+cdmNu6OzJa4tqg9t1tiyTjY/L5G9+XLitTyvbw/p/PM94GH+h62GQl1LU9YHYsiM79BriyBZRA2rABp2SxxbiHzBEVqVZN6Ju6CvqpzhaYpZ6/TGlyFzLapuyAznIW9Z1xDjCiwLz2CZZyR//CuIDgR/Qaimm0988jBZpghBnNslbNCM932PEOn//zjRc/eU7yKDYHPbBIZVtvHqYm8/oj53bKpIaXYnQjlfSw+ZZpPc/YP4W2PA3mT4BKKHO/nVyL/e7EVbyZXj2tkXd4O1clp95DsqjlNuXpGEpnIrK37I8JAZRJPCg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.4.7) smtp.rcpttodomain=citrix.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HCpfUimCCQkOtqeuUzULZSjqPkZv/1OumHTvfODlnj8=;
 b=jeu0OhaoCf+q0bPqxLVpXaxi6HaMGWyowygsgrWZXaFp63l4FP/0WfV7jJk9G8xQS7Q5+N0LG5iSTmhCemlgX+R6m9k2j13/Cx5/Jqkq0Nr8c16BgJe9BkFxoSDmXwb+T0OUXuaHTNHKIdivaBITiG/JNWigxvzeEN5wnjX9GqE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.4.7)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.4.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.4.7; helo=BL0PR07CU001.outbound.protection.outlook.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wt01L8HO9pSI/wszbQ9PN1DPynGos8sTvg8NIWObebQRB+b3qPN0AmZnNRd6oDtJiTCQeRqo1yFCKGJEIqr/9QhM06FFqIwrfMW4JjmHXYHVOfvQyMhjitLtWdQfsRm484HwTTncQuCpo1VI6pKHdzAYH/RlTArWjzSSwCLXsb10eCd+shFmOAXjYNPL9x1682t4psBO/3Y4UMr8ay8qGL/LZYIfEX05b0cF8RYAhcJK98YGVQrJf+EZ6CGv8XIMx7JDYzONg/aKeTM+uZ+XNF+02T/Zv14REv3KCxThkuGlWZCvtYXcldWAL9oDeQbLgb6zUOFdPvcjZ8VzarijfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HCpfUimCCQkOtqeuUzULZSjqPkZv/1OumHTvfODlnj8=;
 b=ixi9DsRK715nH4YVMvb54YugxVKb1eY39tHFhm2fr9F7sQUry6xJ/Mp9bl0zDGJysbOpzjfCarLb68OWgSzTVUDt20yY4Ldqp6lFwxFEN0XB5qMSzo8Wxy1hnbtq4ccy57fkjglEo339HWH7dfLd6+1GRNrDhnpygvDL1oyu082wsD+NbnsMZlJNWg4OSrQkkx0bU7xGd0uo8vnJJTr3ZBMPZDclrB9er0FydUjgFvR5xlikYSbi5AhB2oarMLf8KPSAcPECdQ5YH98xEfHJh4QDy1NyI/dO1iwExqdOIuNYcmqHB+MMtxV91pxWYQSoE3LzXUsxmMFqfV8R6iLw2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HCpfUimCCQkOtqeuUzULZSjqPkZv/1OumHTvfODlnj8=;
 b=jeu0OhaoCf+q0bPqxLVpXaxi6HaMGWyowygsgrWZXaFp63l4FP/0WfV7jJk9G8xQS7Q5+N0LG5iSTmhCemlgX+R6m9k2j13/Cx5/Jqkq0Nr8c16BgJe9BkFxoSDmXwb+T0OUXuaHTNHKIdivaBITiG/JNWigxvzeEN5wnjX9GqE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 213.95.148.172)
 smtp.mailfrom=elektrobit.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 213.95.148.172 as permitted sender)
 receiver=protection.outlook.com; client-ip=213.95.148.172;
 helo=denue6es012.ebgroup.elektrobit.com; pr=C
From: Rose Spangler <Rose.Spangler@elektrobit.com>
To: <xen-devel@lists.xenproject.org>
CC: Rose Spangler <Rose.Spangler@elektrobit.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Teddy Astie
	<teddy.astie@vates.tech>
Subject: [RFC PATCH v6 04/43] x86/altp2m: Rename hvm_altp2m_supported to altp2m_supported
Date: Mon, 20 Apr 2026 17:31:27 -0400
Message-ID: <20260420213206.208750-5-Rose.Spangler@elektrobit.com>
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
	SJ1PEPF000026C5:EE_|BY1PR08MB8648:EE_|BN2PEPF00004FBE:EE_|LV3PR08MB10562:EE_
X-MS-Office365-Filtering-Correlation-Id: 9553204c-2db9-4b80-569a-08de9f245a4a
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|704161311799003|82310400026|36860700016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?8M3rLOVpK7O0IptY1TqlQZwHn1PJi/9JX0xizO+TyQ44h1BkprxEybksccce?=
 =?us-ascii?Q?95DUBbr9AID5SZcBKXl/04D/nxg1nAzmMrfj/YImFDEY+rmpYFPLEKezn6sQ?=
 =?us-ascii?Q?aaiIySnidovQzEHWPWWmcEXaqRS6uBRxUpAo10bSgUUEED52ZvBNWLw/34fR?=
 =?us-ascii?Q?BOi/RhFiTM6cU+Ta1mvyWnUFxTeLEAqMYgmk9A6+SA3q4eyr6zJWHKkmQagJ?=
 =?us-ascii?Q?K2LSJGqDYQDjVVpwjbqAJWXe1pKeWD+Rx+9LzGweWAJDPZ5f6ZgtHNDGdrrk?=
 =?us-ascii?Q?DxOggOVexNCzCEFY80kmRBmKsJd0trS1Msf7lyt8WTEe5uRQvBuyacrhZ9Sb?=
 =?us-ascii?Q?6SScMZ4mOqwzg6/nl4/bDpEQ+bjQQxb/OwnZA4TyY8ikpUv5zA3QcKFVyElU?=
 =?us-ascii?Q?JhDPwGFBzNrkL8ATRCOuoqk80AoWZDFfeQiKKj8iYQE2/ni1GSl6yNhnXk/m?=
 =?us-ascii?Q?PRTYyOwfPEUq1fYtSeNoLChYRoEo+XEJhygJqP01DDw0A2tivzv2oUPWbpnM?=
 =?us-ascii?Q?p/MHu44/tqEIAZntefxZ8XzpFkIvYQJgeZyBJdi6ZKJRW/8qlhIUQn3AOhhl?=
 =?us-ascii?Q?904dsNDebdaYIUZL0xhwAMEyB7OoxZiHiuHXNhF/6ZC5DspUSxTZ59BVMcQU?=
 =?us-ascii?Q?jjY2ygL/rKXNq92e11VrzOB21l077ppGrUbu0nk0Jy9oqBZzMBBwhGN3ATPR?=
 =?us-ascii?Q?PfqnQ7GxtJFgvmiwEJgJP0yBl6n9sfuPoJW1PU3e2AvV8m/ZEsQktJ2Buk6h?=
 =?us-ascii?Q?yqLyJo5ms4nN3L7h0lX6pklJAzWrlrbXK1AOQilZ+a93O5t3Z4G0sKli0F4Z?=
 =?us-ascii?Q?cPxCrr5OWHswQfqWZkNFB2Ph3pDRP4N7Ql3TcW/A05TgZUwjSyG5ve8+fhVp?=
 =?us-ascii?Q?y7qZnWel2ascY7RmjrI6y1gEW33l72fs76nb8EWVEWx0ImA0qniECFjmda5X?=
 =?us-ascii?Q?BEUNoXoNKLRID5QwY3puQKMQARe/ywGg0SXpUCi8RipTIKD22tyc7HKqL7ca?=
 =?us-ascii?Q?WVtS7KpUpvDpnnnJfJQ36KOIaaoyrxnuV4u7Qe1ZwV7ZrMzXd29Y4uXpEx5v?=
 =?us-ascii?Q?RSIGoITs90nlTLKmuWpJ9r3HGorNF/FUo/JYdjV9L/nCZqv76GdzYeYPWMBo?=
 =?us-ascii?Q?2VnlYCLv3sRB69UfKhTI4W4vTVh6947/uwmnDHsHme9ffQQcvMxRHhqXcOQr?=
 =?us-ascii?Q?b7mBef5tmQuUXDvTEpTo49z5h1rMugJa0fj5LNm3eg/eOVe6iHlb+ka535Y?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(704161311799003)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 Gq9OKQaEsJfEbY/UJBAGGxzhXztRrX12uy6oh14k9wZCH2hli+gEqrrUnw0TTWxDYbtewsLkOxfUdh0eI26VmpH8yMQ014ZhHf3t9wfozEaeVMSr6KaDCZYZ8FEF9kx/yFu3P2ceRs9ppv2R8q3wquFCV1jRwCiriogtmwWiYEpK/KcRYYxB5nFhvJcwIbdH0JL+7vOubrTE4D7Akytd8czld6qwH/Du17dLUx4+w1AXMEAwDbby1r056Z4Z6j15GX62RgJHRh+wjwwIx9pg74Bvs1C5N2EroqPzmanvfGlLPGaKEVJv24otuKz5/LriLax7ZkkiRgpNegoaLLosGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR08MB8648
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.4.7];domain=BL0PR07CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.4.7];domain=BL0PR07CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 BN2PEPF00004FBE.namprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ccea4e16-5152-426a-4fe8-08de9f245632
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|704161311799003|156008|376014|36860700016|1800799024|35042699022|82310400026|14060799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gRR7I+ABSdZi35XFXcIpBxxFcpeZTRZPy4LD+7zup0pbVCqHs9ly0mwZ338e?=
 =?us-ascii?Q?OLxlZSfOu/dIa5HnfjS92g6hrNGotvudP3Azhz9dBt0mUCc3+KxMVI4M2n5s?=
 =?us-ascii?Q?wBTs3fy5qcPbadrjaJ9Vz9vTHRbQXipUZMoWFunFm5sRnoXZK9wVBvqPNXnN?=
 =?us-ascii?Q?KoR99wVSWE3+Xexty4B8I1HCI7PIVzLWVlcMsJYS75sNFBWRSXcvkJ9u81I7?=
 =?us-ascii?Q?LW+AZBVWcefHspOYiMla5VbajPotq4VZlLGX4ye23z6HT8fIOUmkpsLdhP37?=
 =?us-ascii?Q?5ksoxr9HieIsanyCG/LTOA/U7r38zpN0LxY+QEug814+oS5iyBD7F6L7Osly?=
 =?us-ascii?Q?EkoE4j4lAE6clPmhJl2JBYRSgoBidW2j5IovKiLZFzdIoSimuY/DiZUAcmrK?=
 =?us-ascii?Q?hol8nfSPZlMvai+znf6xNpHmXx2Zy2HOzd6p/KCLcPzADVgeEM8ldGhLG/Lv?=
 =?us-ascii?Q?DOzybVJkFMpvdXvXpEoMXe0v8sFHRK9sP4aPd0STQ+ZFuka39cuwFm9c+fRF?=
 =?us-ascii?Q?iDhXYpipjRQy9nObwIYsdFN3RkmT+HQQUCCp2tZJ36hEw6wLV6129B8MwCpc?=
 =?us-ascii?Q?aHi+Mn4ZqVsbXdI/AxmE+KXwnoW8PqPkGUgDIp2zehgITk//BWPeELX0Fhn8?=
 =?us-ascii?Q?Ro8wSe1iw/N9lFhnCyDjJbISgC7bEYX3vbWnIfDaCmBJ1w6qB0Xfmd5RKCwR?=
 =?us-ascii?Q?DlLSvSZmEue2HXtiPRN+5kVf4pEpiqfc2h2YYoxEnIv+mRI+/l2nYcet/5Ws?=
 =?us-ascii?Q?OYAomSA9TCJQn0WFl9IVU9HisRTFv1egj7dM0Y2cix4Pk2mjeM6jBl1fG2p0?=
 =?us-ascii?Q?Ln5wl8XqzSZ8J8Np7Qel/7avJ7WmMawD2bie8LffKJhSWvOwCrbJPBaQIWX9?=
 =?us-ascii?Q?cIPZpxjMGJA5CDSc0j+V2jYdUGrG6i+iNrn3Z9sCatFBmqYmtqIuV5yK7jz4?=
 =?us-ascii?Q?Z1VY8828VK9yF4zK+ieORPANcezTgxqc1bmzdC099zpz4yc7Zj80RrdU4tGD?=
 =?us-ascii?Q?FOM57pf2pXkjVc8890e8P/xJmMdFWo8mh+PCD6Pgsug6pNrZ6N2o+L3AefP2?=
 =?us-ascii?Q?d+GA+elurRTCeUDr+KXYB/vnGKtW808ZyTdzHeZ6NzWIvUtKfoleGNdU2pO4?=
 =?us-ascii?Q?TAT89z9XYX54qVy9f4pCxZO49pWOoAVx9Z9UHaiNDGRmyZ+0l161tynxFdlc?=
 =?us-ascii?Q?fhkA+skCtCx0oVoAdKozUpTgsqNqtSnJOI21TxOfMenZYqI22NaQAeXyeiU?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR07CU001.outbound.protection.outlook.com;PTR:mail-bl0pr07cu00107.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(704161311799003)(156008)(376014)(36860700016)(1800799024)(35042699022)(82310400026)(14060799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nO2vQnDj+g67qkhl/vnsVjDzGEh4mUtED4k6uTv2NSfQlaLYZA8sUy3daxzJ2p6+U5517okDGSwxEcwlYpWbsV5ZYCyO4Rhaj25tnDK3kXnkcoIDTWOLKjgLtIPzR/O1dRpZycQA1FrIAP4Ume2J7CaOQIsihsxZ2W9IB2NzrM0xdNiMTt0FOqBVsghIVZOxX8+NLrfCNweC9yTRqgtLf0CVFyrfb6e6YcdU3etxVkvS65CouF3CYZrrPB9hrrbgYMb7ghhZZy9S0BvS9sjqo31a22Fll2DWqBYbp6Dtc8o8pRJoPSatkbfxsTgd2b3uixhFQK+DA0npfzN49ix0z6GI1ikD+IvSiZRUpaYSbma1Yapve9jlprMs7oMV3Yhub7kXanlSKsPDP/Cpqg/0OqlyP5215w24uMZPQcPajdUyz4dDVElrsgtLwi8ulxPn
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:32:41.2309
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9553204c-2db9-4b80-569a-08de9f245a4a
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF00004FBE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR08MB10562
X-purgate-ID: tlsNG-720697/1776720769-8336C161-4E52AD19/0/0
X-purgate-type: clean
X-purgate-size: 5417
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
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWELVE(0.00)[17];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[elektrobit.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.234];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 76B534341DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Using a generic name for altp2m_supported makes it possible to indicate
whether altp2m is supported on other architectures as well. Even if other
architectures always support altp2m at a hardware level (like ARM), altp2m
might not be supported due to CONFIG_ALTP2M being disabled. Therefore, the
altp2m_supported function can be implemented on all architectures to
indicate if the hardware supports altp2m *and* if CONFIG_ALTP2M is enabled.

This is commit 4/8 of the preparation phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.
---
 xen/arch/x86/domain.c              | 2 +-
 xen/arch/x86/hvm/hvm.c             | 6 +++---
 xen/arch/x86/include/asm/hvm/hvm.h | 4 ++--
 xen/arch/x86/mm/hap/hap.c          | 6 +++---
 xen/arch/x86/mm/p2m-basic.c        | 4 ++--
 xen/arch/x86/mm/p2m-ept.c          | 2 +-
 6 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 1d458f1372e5..512b18d4010f 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -698,7 +698,7 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
 
     if ( altp2m_mode )
     {
-        if ( !hvm_altp2m_supported() )
+        if ( !altp2m_supported() )
         {
             dprintk(XENLOG_INFO, "altp2m is not supported\n");
             return -EINVAL;
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 86c12c0d1ef4..bc35efdf2c02 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1692,7 +1692,7 @@ void hvm_vcpu_destroy(struct vcpu *v)
 
     ioreq_server_remove_vcpu_all(v->domain, v);
 
-    if ( hvm_altp2m_supported() )
+    if ( altp2m_supported() )
         altp2m_vcpu_destroy(v);
 
     nestedhvm_vcpu_destroy(v);
@@ -4566,7 +4566,7 @@ static int do_altp2m_op(
     int rc = 0;
     uint64_t mode;
 
-    if ( !hvm_altp2m_supported() )
+    if ( !altp2m_supported() )
         return -EOPNOTSUPP;
 
     if ( copy_from_guest(&a, arg, 1) )
@@ -4965,7 +4965,7 @@ static int compat_altp2m_op(
         struct xen_hvm_altp2m_op *altp2m_op;
     } nat;
 
-    if ( !hvm_altp2m_supported() )
+    if ( !altp2m_supported() )
         return -EOPNOTSUPP;
 
     if ( copy_from_guest(&a, arg, 1) )
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index e7c1364802f8..6406bb687718 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -702,7 +702,7 @@ static inline bool hvm_hap_supported(void)
 }
 
 /* returns true if hardware supports alternate p2m's */
-static inline bool hvm_altp2m_supported(void)
+static inline bool altp2m_supported(void)
 {
     return IS_ENABLED(CONFIG_ALTP2M) && hvm_funcs.caps.altp2m;
 }
@@ -876,7 +876,7 @@ static inline bool hvm_hap_supported(void)
     return false;
 }
 
-static inline bool hvm_altp2m_supported(void)
+static inline bool altp2m_supported(void)
 {
     return false;
 }
diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index 6918a00a2a25..563eba3c0d36 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -501,7 +501,7 @@ int hap_enable(struct domain *d, u32 mode)
     }
 
 #ifdef CONFIG_ALTP2M
-    if ( hvm_altp2m_supported() )
+    if ( altp2m_supported() )
     {
         /* Init alternate p2m data */
         if ( (d->arch.altp2m_eptp = alloc_xenheap_page()) == NULL )
@@ -546,7 +546,7 @@ void hap_final_teardown(struct domain *d)
     unsigned int i;
 
 #ifdef CONFIG_ALTP2M
-    if ( hvm_altp2m_supported() )
+    if ( altp2m_supported() )
         for ( i = 0; i < d->nr_altp2m; i++ )
             p2m_teardown(d->altp2m_p2m[i], true, NULL);
 #endif
@@ -590,7 +590,7 @@ void hap_teardown(struct domain *d, bool *preempted)
 
 #ifdef CONFIG_ALTP2M
     /* Leave the root pt in case we get further attempts to modify the p2m. */
-    if ( hvm_altp2m_supported() )
+    if ( altp2m_supported() )
     {
         if ( altp2m_active(d) )
             for_each_vcpu ( d, v )
diff --git a/xen/arch/x86/mm/p2m-basic.c b/xen/arch/x86/mm/p2m-basic.c
index e126fda26760..ce14066fedaf 100644
--- a/xen/arch/x86/mm/p2m-basic.c
+++ b/xen/arch/x86/mm/p2m-basic.c
@@ -128,7 +128,7 @@ int p2m_init(struct domain *d)
         return rc;
     }
 
-    rc = hvm_altp2m_supported() ? p2m_init_altp2m(d) : 0;
+    rc = altp2m_supported() ? p2m_init_altp2m(d) : 0;
     if ( rc )
     {
         p2m_teardown_hostp2m(d);
@@ -197,7 +197,7 @@ void p2m_final_teardown(struct domain *d)
 {
     if ( is_hvm_domain(d) )
     {
-        if ( hvm_altp2m_supported() )
+        if ( altp2m_supported() )
             p2m_teardown_altp2m(d);
         /*
          * We must tear down nestedp2m unconditionally because
diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index ddb4c7606be1..84159198f3a0 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -995,7 +995,7 @@ out:
     if ( is_epte_present(&old_entry) )
         ept_free_entry(p2m, &old_entry, target);
 
-    if ( hvm_altp2m_supported() && entry_written && p2m_is_hostp2m(p2m) )
+    if ( altp2m_supported() && entry_written && p2m_is_hostp2m(p2m) )
     {
         ret = p2m_altp2m_propagate_change(d, _gfn(gfn), mfn, order, p2mt, p2ma);
         if ( !rc )
-- 
2.34.1


