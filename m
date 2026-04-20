Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eO1gFsqd5mmyywEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:42:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C724344F2
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:42:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288159.1568478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwNp-0005gM-Ao; Mon, 20 Apr 2026 21:42:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288159.1568478; Mon, 20 Apr 2026 21:42:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwNp-0005es-7U; Mon, 20 Apr 2026 21:42:21 +0000
Received: by outflank-mailman (input) for mailman id 1288159;
 Mon, 20 Apr 2026 21:42:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEwNn-0005dM-G4
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:42:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEwNm-001R8R-TB
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:42:18 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69db4-e002-0a2a0a5209dd-0a2a450488ce-2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:42:18 +0200
Received: from [52.101.201.91]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b9b-1dec-0a2a45040019-3465c95b1a9a-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:17 +0200
Received: from PH7P222CA0027.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:33a::10)
 by SA6PR08MB10332.namprd08.prod.outlook.com (2603:10b6:806:435::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Mon, 20 Apr
 2026 21:33:13 +0000
Received: from SA2PEPF00003F66.namprd04.prod.outlook.com
 (2603:10b6:510:33a:cafe::c3) by PH7P222CA0027.outlook.office365.com
 (2603:10b6:510:33a::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:12 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 SA2PEPF00003F66.mail.protection.outlook.com (10.167.248.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:33:12 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzzHW5CKzz1wdM; 
 Mon, 20 Apr 2026 14:33:11 -0700 (PDT)
Received: from SJ0PR08CU001.outbound.protection.outlook.com
 (mail-sj0pr08cu00106.outbound.protection.outlook.com [40.93.1.78])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:33:11 -0700 (PDT)
Received: from BY1P220CA0039.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59e::7)
 by DM4PR08MB8334.namprd08.prod.outlook.com (2603:10b6:8:4e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Mon, 20 Apr
 2026 21:33:01 +0000
Received: from SJ1PEPF000026C8.namprd04.prod.outlook.com
 (2603:10b6:a03:59e:cafe::5a) by BY1P220CA0039.outlook.office365.com
 (2603:10b6:a03:59e::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:01 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 SJ1PEPF000026C8.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:33:00 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:32:55 +0200
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
 b=Q9GGR2iMHFupJ2wGN87cZMI6peSj96A5TKavGIJtSiQY949kuX5U1+eiyj7es+r3Jvpd/XuoifO5dG6VzujEQoZs0klmXhr4s9YcqI0CJa/4StWwT4u/yONr/XdXWYCMPGyvJdwa0yPFbz84ty9sFaPlmIS08Sq7Nnkbn4Mi9bsWcE4VOfLjupZzr+WF0r6RIVGdEoO1PX7sXghhm2iowchBAmlO5go3JUwvuFaXlBBlt+2OBYdh8oXn32DmUDloeWFkQKIZQhTThfNv1gXo4TghEcVOA5QZi7YbZtJSEPQUVM/sedgc9Pj7t7vmFrINz4xh6gA7r8FTKU5N0xfCZA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P5BPH7sP6wJ6lFk7/PYOh+kdZ73MBQ4NzGe07wqGO8g=;
 b=fczuNj1r8/3hU3Mu4wGR68bARppeC58rxZXSn9gC54JQ/sHlZ7GxLGhOenz3w3uTfjBX/rh8AjiSjKt3YOha02fzcrXeUAPAsVosIJ99MT1ofRtpPM351h9G4YI7Pz9Gw0zwnkkovlzzbVG5y/aIpdoZWFSYtQkle7LDOqXvoyXYsN4W4RRRV41f05DBVVcJ+q14LsdMSCg2cLDy6JSXrlJJoT7N55sNEafrlqnHj5BDRiZrvvZwuSff5PKfP9nqvQrZhlC96Y73ywJe9eAGRJKFDc+5KohjtHdi27nv4ioI26m863/LaO7A8t2XJQDda2+Tq00LktrweBWY4IKtJw==
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
 bh=P5BPH7sP6wJ6lFk7/PYOh+kdZ73MBQ4NzGe07wqGO8g=;
 b=vrC9i3rF2yHDkJFU6gPPOeaz0X75QZAtd8zUAX/gc0bl+prAB4yEtjS8TF1i+obSox0KXOn+6wfumHHB6mpBMMhoNEaoprvdb0TH4hVFUZ+2aAD2Mj09va5WWkC2pzLd53oHy9jOUZp0actJn3iogxmLhqoiuRxFoiYQd8cRVDc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.1.78)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.1.78 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.1.78; helo=SJ0PR08CU001.outbound.protection.outlook.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=INHQHzFBus8fJcIy+9wDMaO8kXxp6QDPkg90YHfbwKWwYNykPmG4cX0VJSvWiP6G8H6yE+7/5OUTrM0AHJzwu5JFzCRYC9jaTwqNPXP8gfVSfekab5+8XpeTjZb4k2gAGxTvSzG36fSp5osZ90hbAMGn8KYfBhNcaGenwgP1cMaQLGAn9PGJelG0HU4Xk14v8sfrHjjtybIYZbM05Rjn3eelHBKErRLLXeX3g3m55mqe36MRk/Ru07BzzvKwAAtJgng2Vpl13LXxOgfz95k4EwjBADgpqKm3ADSiyeg1eeONcySBH3GLZiGJ0lQpJ9TFfoT2x6b9daURXkQmsi5EUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P5BPH7sP6wJ6lFk7/PYOh+kdZ73MBQ4NzGe07wqGO8g=;
 b=YvftqaE+yBLYVKbhoRfpAdpJkE+F0zAF1dAWSM3ggXfmjoVLlgO8dpCjz/ouDaCUV1wJeKIsyG+dOB3d8PthmHQqhkii8DnYmAcanvP39fTwePF+olcHREadf3FcFAJff31GK63l9iCSYt7lQmZPEbqNUKY/WBQ67GbajSFozx+s4txQHwKaN3TVui+omo5Ze3QxB6IHuV4NhwJmSLYLmNSqqgUwzOex7cAyOfvnp7X0IhR873LYnjkOkif1fbTx4sXRkYiigl3wxDe7VtCyGzK4GNZtheJZH+gHKp1REQYIO7agZibbuitvQ46h6JwXH9lG1nr+eFxjJ2ne3qk/1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5BPH7sP6wJ6lFk7/PYOh+kdZ73MBQ4NzGe07wqGO8g=;
 b=vrC9i3rF2yHDkJFU6gPPOeaz0X75QZAtd8zUAX/gc0bl+prAB4yEtjS8TF1i+obSox0KXOn+6wfumHHB6mpBMMhoNEaoprvdb0TH4hVFUZ+2aAD2Mj09va5WWkC2pzLd53oHy9jOUZp0actJn3iogxmLhqoiuRxFoiYQd8cRVDc=
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
 Babchuk <Volodymyr_Babchuk@epam.com>, Julien Grall <julien.grall@arm.com>
Subject: [RFC PATCH v6 19/43] arm/p2m: Change function prototype of p2m_alloc_table
Date: Mon, 20 Apr 2026 17:31:42 -0400
Message-ID: <20260420213206.208750-20-Rose.Spangler@elektrobit.com>
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
	SJ1PEPF000026C8:EE_|DM4PR08MB8334:EE_|SA2PEPF00003F66:EE_|SA6PR08MB10332:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b190bcd-d176-453d-8c40-08de9f246cea
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?EfxR0ne5QgkZ/z5KX/JxXkKXtjt1B6sw9bYnKC8HSfu/5AXSF9n85ETwyXv1?=
 =?us-ascii?Q?PQj7CDlkAh+W7nx6hT/A5lRSNTPiX6JptYwnZvDAVN8qOWzvv5ukL/G+RY05?=
 =?us-ascii?Q?VPWKNatCZZYtnaHi5xXLh64RIG35AVwO4q44LBEUEpo78sdFPHoyzuWJjstR?=
 =?us-ascii?Q?YEErF2NUvX/gZeTVcA0TW4250NjXpfxn3b4iM+o4sk3fa6u8je3PikrvHGbB?=
 =?us-ascii?Q?TqqkO5KUOPyDCFX+Wxwd4VoTP7YULpyLHtqbKv05B8e1Mj69ld3oWozPl5Gq?=
 =?us-ascii?Q?n0bebvqXTTNROmvQfEBeXgSrjiwQyz+u3r6dsgNdSkUiH1AisNacLUJTNw9t?=
 =?us-ascii?Q?QUjJ0BVF2R4V+UOhu95r/tiPNBLT50Z06JJTD31QLqtLUBnGZJq6vGiDSEX4?=
 =?us-ascii?Q?42AwOATbmaoGBAX5IT09ux4PgFS1M393HfL+mEh2imbhgS2TKL0kRHzEJyxF?=
 =?us-ascii?Q?YtjIgnxWudNjIxNYyBCocHooIhoLm+gX6bC2m7WuBwUsA4QM8tFE/HiQs9fV?=
 =?us-ascii?Q?PYHUor/2kuEyvxSDDmazTa7R4kBMhF7HWgs/V3YhpmyeTjJPwDBcAvpXSv56?=
 =?us-ascii?Q?/ZolF6QHPKhjiqvZ/2QgwW/SDtpJJXJzOpsa5zxmdei7uNTIiIeIN6xxmaC4?=
 =?us-ascii?Q?CYqXL2tCmjQB/3qdgl4RqYA75waxMLGCsF52PcXU+Dv1sl536tHdV6Z7oIPy?=
 =?us-ascii?Q?usb9pge28W3zjsLvHDFZaVXOWraDriBV9NbCDMKfsICXmlZ95w4nwUdliES0?=
 =?us-ascii?Q?cIBwLjhi3NULn6zE3e6wlhatflvz/G1R6XsyTiKFSvujr6srmYVtB3xSZxbH?=
 =?us-ascii?Q?AjEKPfuZNTdzqAjsLEC6CZhkZsxGP/IJrm/Gzd3WJpGs5mTNMI6pYWwip2zF?=
 =?us-ascii?Q?tKMFAfpy03vpkL1X0gjy4hTUMn+sPlkg8cUuFAeLfzJ2aLlrONrfk7fwxYV7?=
 =?us-ascii?Q?MQgcYQ7s6sD8snClRa3GIXpNIOueRYjA0gcL9T0BnHflmsXuDxbmxhFzWLS9?=
 =?us-ascii?Q?P+PPPNPzKTGbhxI9Tzw2N5PEh7dIksN5NXb6aSIfCyPHU8wZLcK60dBNmmQH?=
 =?us-ascii?Q?FNd4MlHyRg7f3j2cXJw4ix+itHmcOd9qfx7sMq0naArkZBr4uTSItJKeEk7B?=
 =?us-ascii?Q?yXagJbKRxeD3TWQ9191VSg8xDgSNlwTgU60WNdTXBUG+26ehCJyPZcbEnRiS?=
 =?us-ascii?Q?0d+pLwHEMt5BK5w6?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 TvyhFok86wBk6XDQxer6ElThbwfEMkUP4/uT7xnlvw2A7LJHnnQpULdzV3PvNh5ej8inf30//Js3aaoHO9zpcAo0wTMyfJZ/HlVz9V1FjTsCNts72EVUBqcq2fh4HufHZAWErvBPn3KHb5bXPPC34C7B0uZDHl036JLsISpnArYu1OyfOtJQBMfvLLwGTKPd3UW8gEF6vtFwW5bMojOlI8fbYn/7LgGAzbEcLBGjGmSWjEXrHFu/aIBJ7UabUnXDYjg4FkGL2NUaHsjwmx6Y4V4UkmQK5nDrrzoCk0AR5Y2cZP6rLIL6Lagp8HIFzwpjpQ/CXrhHn6aLiy+swHArJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR08MB8334
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.1.78];domain=SJ0PR08CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.1.78];domain=SJ0PR08CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 SA2PEPF00003F66.namprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4ac4f3e7-76ac-4414-4cdc-08de9f246607
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|14060799003|36860700016|35042699022|156008|82310400026|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3z5apNUBMCggOxwaU04D4Xg4AT1lTqHiJtF/YZbISoe00mAKOmJywQu6FJzp?=
 =?us-ascii?Q?3iBlWuuIu339mTGk/XIW3rpHJfZyvIJDE2bJpQ5nPnO17185NCPj9RBWkPip?=
 =?us-ascii?Q?OLn6NQsKs391GRoRoK3pZuukySX39B9xcFT3RcqFh+rU5k68mwVbn8cJSLci?=
 =?us-ascii?Q?sKUskgtaTbTJKJu76wkc4NZ1MDa+gY0ZnxILRIIBNNk1SV49vazqb8qqGT2d?=
 =?us-ascii?Q?4R13e5urbs6ujW4EnRIZeV+mHImzwp8laid6IlED9GCP4gRYR6RfYc0GS8+y?=
 =?us-ascii?Q?c3e0/dEs0ZAIQ8JuLYr0ZtckgPIHlAOKLKj3UyBUP7rPf4WUhOyitg2BZUnc?=
 =?us-ascii?Q?T1ntOfBggAGqI9LrdYdeQhM90nIBB7Mc5ixo9juhCgRZ0X01MntdgWRzx8qf?=
 =?us-ascii?Q?PWhKExfgMVPsl03+2XQQiPgo+p/zy8o8QeHhgbGvxKNSGLA+wNs29E/sVhG9?=
 =?us-ascii?Q?2tF2PT9dELrhdhxenUeVAeX9muOaZOeeVuVeQkBDoutcxpL4DO9ZqPlfdEDX?=
 =?us-ascii?Q?ohVmKyTTqzvUb/6tYMGJsIl9YiWjZkVbas2Dpw5LsYLXLt0pFb7fi/EfKRS7?=
 =?us-ascii?Q?xtSDE+b0fZEPWpt5/6gplGzdaPCp+M5PvQio9bL7H4MvDb3Tnfawo1Nszmpb?=
 =?us-ascii?Q?8NqPmplL4A1DVTlUcTEnU91TzPVcKo5tgOSuzYjXJCw4pkhWiTHMSNGYJgPP?=
 =?us-ascii?Q?U6cQ5S0yySoWcS8FHhdCJhyfMI6NJ5JtdlBkhHuPT7+wCInwBCJu1JAbrJC9?=
 =?us-ascii?Q?LXC8LSH2HT7aXxoKU5saY6Se51s3SEJl97SrNNxhI8mQToXff5YV9RKGqNWu?=
 =?us-ascii?Q?MhkNRzEcAEdG7taY2uPbWZ9428UUdxKSW2Qx7BIaF3U4Xy52PwEaKAFxsc2c?=
 =?us-ascii?Q?cv6rarwukhllg7sHeklcTPQfgkUs3zH6vypM7j8Mg2hv4JVHkkbbzgs3TDcT?=
 =?us-ascii?Q?TF2tttf7dy9f/AEI2dS7YTAL7XZ8n2xKo6NKR2S3pB1XDAE+Ln9214IjnaDT?=
 =?us-ascii?Q?Ics9N2wxGC34drXoPMaaYOMv0SjlPGWCRf4kw9nGsRiy29tG4sMNWrfyH1p/?=
 =?us-ascii?Q?bj4mDnVzyanqOYzEId9pHA5t9CwuybTqhsmhbz+b1NVW7rbO7kLlHtD5JI4S?=
 =?us-ascii?Q?0VXVLvKuo/I0VKjzxNkJvqx1pWaYi8aEj6wuiuJEKszNAbmGQhlpgWehYXdf?=
 =?us-ascii?Q?ZYCtRDhALF7jF1Iu?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR08CU001.outbound.protection.outlook.com;PTR:mail-sj0pr08cu00106.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(376014)(14060799003)(36860700016)(35042699022)(156008)(82310400026)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3EhjpJEHMQnct9dyhsV5u6R1QwxylZ6yIouDcbYOinsikcZnu2UXbeLdOYDNU7DhW8h9rOQ04Q4vvEXJZUyZguKz5XUAl4qFoVNPB2dVMoZpYLoFaGPtL8AOZRNjRKbV0v6qxvl/r01d9uq2U4SPUdCRrzDy03o1O8RywoU80CZEuGGOo3Qqh+Ykuw3hQI/4nESw9AJCzBkhodFWTXh9+5zCD7eaHsFcZw9j0wE6LHAR9RGDL40jIzKRbXBx4Bftmj011iEPKyWtJ0cG/51r7kuX9J3HFqurjbBaN5MHjPL9NZ/rMlRFDn/EncXoSBUBpIeg3LVdZLU2louK9scxLCs6JknHpkvkWwA+30ZtYQwg8WW2wyVsYFs7nUsxpljGw2Cp3z6DUDmFmAZExHE5ObprMTq/rAJdYvpT/4wQYNS8v+E9mOYuo+NZCBgJIH+G
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:33:12.4667
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b190bcd-d176-453d-8c40-08de9f246cea
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00003F66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR08MB10332
X-purgate-ID: tlsNG-ebf023/1776720797-4B7693FF-7995FDB3/0/0
X-purgate-type: clean
X-purgate-size: 1589
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:proskurin@sec.in.tum.de,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:julien.grall@arm.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[elektrobit.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[17];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.290];
	TAGGED_RCPT(0.00)[xen-devel];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,tum.de:email]
X-Rspamd-Queue-Id: 97C724344F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Sergej Proskurin <proskurin@sec.in.tum.de>

The function "p2m_alloc_table" should be able to allocate 2nd stage
translation tables not only for the host's p2m but also for alternate
p2m's.

This commit is a refactor and contains no functional changes.

This is commit 8/12 of the altp2m_init/altp2m_teardown routines phase.

Signed-off-by: Sergej Proskurin <proskurin@sec.in.tum.de>
Acked-by: Julien Grall <julien.grall@arm.com>
---
v2: Removed altp2m table initialization from "p2m_table_init".

v3: Removed initialization of the field d->arch.altp2m_active in
    "p2m_table_init" to avoid altp2m initialization throughout different
    files.

    Merged the function "p2m_alloc_table" and "p2m_table_init".
---
 xen/arch/arm/mmu/p2m.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index 51753bb2c34d..f546f63f2489 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -1426,10 +1426,8 @@ static struct page_info *p2m_allocate_root(void)
     return page;
 }
 
-static int p2m_alloc_table(struct domain *d)
+static int p2m_alloc_table(struct p2m_domain *p2m)
 {
-    struct p2m_domain *p2m = p2m_get_hostp2m(d);
-
     p2m->root = p2m_allocate_root();
     if ( !p2m->root )
         return -ENOMEM;
@@ -1576,7 +1574,7 @@ static int p2m_initialise(struct domain *d, struct p2m_domain *p2m)
     if ( rc )
         return rc;
 
-    rc = p2m_alloc_table(d);
+    rc = p2m_alloc_table(p2m);
     if ( rc )
         return rc;
 
-- 
2.34.1


