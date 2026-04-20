Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAd8A46b5mnCygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7304341E0
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287752.1568140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwEe-0007LP-DX; Mon, 20 Apr 2026 21:32:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287752.1568140; Mon, 20 Apr 2026 21:32:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwEe-0007If-5I; Mon, 20 Apr 2026 21:32:52 +0000
Received: by outflank-mailman (input) for mailman id 1287752;
 Mon, 20 Apr 2026 21:32:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEwEc-0007GC-Nq
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:32:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEwEc-009kg1-4k
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:32:50 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b21-5cb7-0a2a0a5109dd-0a2a4506a0cc-34
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:32:50 +0200
Received: from [40.93.198.123]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b80-7371-0a2a45060019-285dc67b7ef8-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:32:49 +0200
Received: from SJ0PR13CA0057.namprd13.prod.outlook.com (2603:10b6:a03:2c2::32)
 by MN2PR08MB6318.namprd08.prod.outlook.com (2603:10b6:208:1aa::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:32:45 +0000
Received: from CO1PEPF000066E9.namprd05.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::82) by SJ0PR13CA0057.outlook.office365.com
 (2603:10b6:a03:2c2::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:32:43 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 CO1PEPF000066E9.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:32:42 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzzGy4BbWz1wdM; 
 Mon, 20 Apr 2026 14:32:42 -0700 (PDT)
Received: from CO1PR08CU001.outbound.protection.outlook.com
 (mail-co1pr08cu00104.outbound.protection.outlook.com [40.93.10.100])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:32:42 -0700 (PDT)
Received: from SJ0PR05CA0130.namprd05.prod.outlook.com (2603:10b6:a03:33d::15)
 by SJ0PR08MB8364.namprd08.prod.outlook.com (2603:10b6:a03:4d5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:32:36 +0000
Received: from SJ1PEPF000026C5.namprd04.prod.outlook.com
 (2603:10b6:a03:33d:cafe::2a) by SJ0PR05CA0130.outlook.office365.com
 (2603:10b6:a03:33d::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:32:36 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 SJ1PEPF000026C5.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:32:36 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:32:33 +0200
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
 b=CBku/OO9uCZfYzgquT9ALW8Jvi2QBUxOMb6L8RjFanCvZxlDeyiJlB86FjO9yZs177+UtS++9JCICv816RPNQZZC/Nz/JtaVMyGZlYIE7+xDrEaFuI56e5lft3aev35/Be722lXlr+o5J9nJuCqUGZpHerDEk6XKSnpLWS/S5NmUAR/05S/m+dhGdnlHdQLvEODfqZeajVQxtLzEqzkVH8cnLJ6rRfRhvDRRl4ZzRgOAhLagBNHpFLLW0poUePgkQC8atOXmxuLfc8MrgJOUowe/VybrEj9j21wmGh1mLkcF/YaG6WGBisqMmNSHWMQADXJUgdlrKHFGrTEkE4CMfQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jRLoxsuohqR21r1f42+aEEmWEGpw45nncUOaZm3GjeU=;
 b=c5DkqDZoYTKO5tmso894USC4bJ/pHGtBEm8h1wKAQOfxjTO07WNahOtAOZAR8xOiZ7dpL1N+/5XPWI8Ze2+PT5KQaKpnOTIu45CiSdRWGpbHJYtzwBO1TckR/UKZvp+cyRmuQutq8XdWevpXaL0FwdB4ChcVl6ImhpyH6451GZiGYAyubWeG8UOdgTLrnopmRHLwRADN53eM1bQjWYaFwSZTfEZ2044OFo9SvkQnnJbqpXxaN73/v2wjib+Ilmgs/692noJ1ONsW8kYM5L2R79Quf+cR1Roh0a1T7U9FlT6UrE7/8yxdRlVX0EGx28egz7p9iAmMom4M2NJpjvI6AQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.10.100) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jRLoxsuohqR21r1f42+aEEmWEGpw45nncUOaZm3GjeU=;
 b=R35PpULPeDddnMBIoe7our9YNHU0NcZTmhHHr1RbudNoKQK2Qx5NvdPSAd+NXDVijO2jcZ3DD5D7XT9gzoZegRUplMDfwUVyZ9Sok6rPJSORuz+iJfb9sabQbwgsppZjLGUOcLvpARDEIrIwLKo/Bvdvl+hU4Aw4hBBiO9V3z+A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.10.100)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.10.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.10.100; helo=CO1PR08CU001.outbound.protection.outlook.com;
 pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jAm8tTt5RUhiro3ZwwmjvZTP+sBGxTJbVh4XB+9qYrtaapYcx4oUSDjW4P4ygFEf/FNdrygb7LjJ9PLk2Tajb04WRIFTb8SIHcD7ahx3G4wP0FRVGP/aQu+F/w4j/2ztWCI30mg5nyX1yYYKPbRJZ7YPCsoRkinw2z70KF7eVeD/sjt5z7vY73yNlTW+heiFQ3naEF1nSAsXSPvtquJFSzJ0vm95QFi3K8YYbmAQWrC5d+vSqmQW6/A1TabxRpLzMqohzTOoFsq3zCF8HHZoFU1Q+ADDNs9MfpFlKSBzvoQiqpzH0Tdz2DViVLiFbvAHy+gDMahr5IN5CsxzJnLFUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jRLoxsuohqR21r1f42+aEEmWEGpw45nncUOaZm3GjeU=;
 b=q1yF3KDZwMkseeI5H+kHAV5Gqk9lj7gh4JukVIV0QLzhJ52TFPBC6MXkwJsx+bbF0ldMPFX+MUimPZLXsc/AQEpfksh1FFXgf1VD+jY/brdhPS7dSbxOGfgYHjF9xkl4zukgNwpbcJQ3CC6Ow0d4EYpor0zAQvq/Kl41QJKqsXzA9pFgwMnhkXuxoAHjBFiawJvmZ/FUY6BNZchZVGFeTJaFQMsNZQgFK0AAGj2a+11Nd48JdTSSGWyFTCDZexjHh2REUzEsbphjtJIcsw5NlTjOFD+09yfAJdfEGKaaXXBssrjIjH/QV6QpxUBL+pv9KKHvtBOJVlM2IN6GcnOuKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jRLoxsuohqR21r1f42+aEEmWEGpw45nncUOaZm3GjeU=;
 b=R35PpULPeDddnMBIoe7our9YNHU0NcZTmhHHr1RbudNoKQK2Qx5NvdPSAd+NXDVijO2jcZ3DD5D7XT9gzoZegRUplMDfwUVyZ9Sok6rPJSORuz+iJfb9sabQbwgsppZjLGUOcLvpARDEIrIwLKo/Bvdvl+hU4Aw4hBBiO9V3z+A=
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
 Babchuk" <Volodymyr_Babchuk@epam.com>, Aqib Javaid
	<Aqib.Javaid@elektrobit.com>
Subject: [RFC PATCH v6 06/43] arm/altp2m: Add template arch-specific altp2m.c/altp2m.h
Date: Mon, 20 Apr 2026 17:31:29 -0400
Message-ID: <20260420213206.208750-7-Rose.Spangler@elektrobit.com>
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
	SJ1PEPF000026C5:EE_|SJ0PR08MB8364:EE_|CO1PEPF000066E9:EE_|MN2PR08MB6318:EE_
X-MS-Office365-Filtering-Correlation-Id: 63dc7c5c-3c53-4d20-974d-08de9f245b16
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?YKZal3zC4Tmx5cwbSRzEfHoSJ8pk2YnsGHXJaZ1Y5q58f0bQgqFz+ixTNdFD?=
 =?us-ascii?Q?c7EvHGM9tEn2k7/lRuXRoRF41JcADlh1r8ouW+FDGFl6h92DTcR81YOIa+2E?=
 =?us-ascii?Q?l4rSI/ANrUiyPLcZ1v44hiaBZ+Bn/cUC96W6CMm2M2So9np+B6wV1upqpo/4?=
 =?us-ascii?Q?HYn00csovB3jDu5NqYKEXCJvvRdB+OMKdmBoR79eUoDGdyf1uMl0g6tzUWQ9?=
 =?us-ascii?Q?Mkp72of68pEjf8zrORS16CE+XkQtBHoOmJ309F8d9ttFSnPARV+5hns72v4x?=
 =?us-ascii?Q?S9PpTpfakLVHDbMEHRJDNY74hAjDfLaxbvUmwtmWmDr60fBXHA58dDLtsFq+?=
 =?us-ascii?Q?nLPjnqhq1k6GY/PVI2zY2aL43TYLqkwRWSyIlQ+3YNxJw1usO7I8xOqEwFOQ?=
 =?us-ascii?Q?P1wtewKNPe4LQuXt+gBzafLS4TM+/ImXtwo9GF1Nkt5vRY/YucEL+47Hmb0h?=
 =?us-ascii?Q?QVaWN0foQmGoz0J6kaMr24VD7c8bsdjBFTVJGMbN6AOt4KSYOXmz908ugilq?=
 =?us-ascii?Q?maDEnIr2IOp4FDilPeTuKUzE2q7D9OWWgN3Ghaj2VjARGwLOR19X2i0sSRfu?=
 =?us-ascii?Q?rvQedmmlXNfkVG5paV3Uaghp/yXlyKLH5M/vxn1S9CNsqmeBqfAHzImXYa47?=
 =?us-ascii?Q?7B/+pjQMtncvxKrZUIzHhY0zOY7v67sQJ5z2aYKGOfo4lUqLBPJ46Axfb+52?=
 =?us-ascii?Q?E6uZVjdKPQlw8wgzk8b9WUi8X4tUsUq2xeE16s+/AGbdpCQ7MefOQtzIUFri?=
 =?us-ascii?Q?4vJrZ+4qj5+ZShlGqy8+o0DYkgNgIWSRpXCoG4ZR8x+6ydvD2GiKDgj8s/f5?=
 =?us-ascii?Q?pVAlSdfIlT0QGr7emyF/L6LikBGjnraefkhC/Z3a5L33wKuYCAhrwh8+469u?=
 =?us-ascii?Q?1bNXtVgwEycvkQKvcc4w0jqbG4slgQ4gT5aFk3TrtjfZGkIAUR0ZCZvw6k0d?=
 =?us-ascii?Q?R9ef1hdH3S8MAyKTRKjEVNkh4urTcYhkcNAQl2I7flKh5xdHgy9Af7y2b4ZH?=
 =?us-ascii?Q?SQ4ZJPgrb8iGYVuxZ5lIj/usO/y7/GTsEH66QgURrYemJj+7lCFRq1RpxDXx?=
 =?us-ascii?Q?k+2zZKiLAUvGk+imN3OU/3GzTS06rkVP2xnnF2KSKzdLZVgP8+GmPG58iyF4?=
 =?us-ascii?Q?gMsrSkOdr6P0U/nLR0glHCTPKozCqHzOp83Oq57b5XPEB3xvIuTAQw1EFBAR?=
 =?us-ascii?Q?cYAGC9g7EOGBlUHLLL0VdbqoswFWWF7l9WHEokOWKBbN7yFM2gOcZFjzO7lr?=
 =?us-ascii?Q?yxw6suc/FZMKwa6SM8Ja?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 MycgCjajMjhVkSakchecivUEnVXLyvZs5w/CJF7fYEXodr21CrqpliHE1HODqP09UHLKTFRnOVuZKxSMM+kHfMme3pR8uutuwfMJZVy6p8PFW5VGY5vKHId/D9M+Md59PY5BT5E0Aqfcr4+x+yWPr+ZuG5/Hvm7l/pqxJ+QKzoftnv8GaOu1td617UeF0na4z9DigVyYg73hJ/Iypl+ZSSV5cIHOLeg8jo2r1vw/58TLsGPTd4Emwm7TiCKiBiyR7lgwSmnNLGQF8mzYedZhzOEbi68XtG8TdUIf/8YIU/B6R8LvDbc6LnEtv5aQpITKHH+8PVAPOMXYJ7fI4eweuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR08MB8364
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.10.100];domain=CO1PR08CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.10.100];domain=CO1PR08CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 CO1PEPF000066E9.namprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	170bd0f8-1e92-487a-ea2e-08de9f245745
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|14060799003|36860700016|35042699022|156008|82310400026|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GC6DODuAa5ayRO8wnTHeqtDjNPix+7XbRe4elvYCAckhriE+lJoHBDb7ccRs?=
 =?us-ascii?Q?5bFC5lsEsgVIUepD52hJV8J6Wa/3hVKuLP68FJO7iCBG1fUdwfBlvXhdGKzY?=
 =?us-ascii?Q?935B5KWZYRzvJw4bpkgub/mcqK6uhOESpY/Py4W4jVvUwDb7ORi3OyBwxq/A?=
 =?us-ascii?Q?Ve6zAGucOrnfds+FC/fbsfzembJvT/kFhTHxACi5eSRJD+i7ISZZJ3HH3cmS?=
 =?us-ascii?Q?zlBtsB5LhUGbDP5DMFA4nQ3U2AEcfsN1g2AlMSAOHlNhTuygt9vyHMvmdXlq?=
 =?us-ascii?Q?hzdke0vaxYFGppQeU+m+GGSVpSoLmo3rGwELEKfXpiSZiuFQddRq0Kylp4Nl?=
 =?us-ascii?Q?VQbCOz4xLtELgYJ0riL+iGFsmRWkvXmI8uKm/sIlZ1wQAHSmHD5xF5AuZrk6?=
 =?us-ascii?Q?EiCKqV3245/YKFkuVL3ez3hs9sgUo/V0Kcg0yRQ2l1uh8UT6d37m3BDyh/XS?=
 =?us-ascii?Q?STbM6N9XfxxAz3GJ2GFqSQhDWeHCcaWbpNhhXKyzfebM8/2nlCr90soptoGp?=
 =?us-ascii?Q?oiYu5r6pBTCqYZuGGiO1JcBngCKWnAeibOO7hfqg2vUJ2OfFFUJY+0AQtfu4?=
 =?us-ascii?Q?K+GnLLY3LUWGeHKl+Hi53C1cYVZTzdgwAU7yffAwNR/YCC4SrD2RkoM6i9Bk?=
 =?us-ascii?Q?4aMKGrY4Cz5AJ2xcGb9GuzMGhj9ed3fpY7gAUV1mr1jS6Nv5LfR/8VVD7pAW?=
 =?us-ascii?Q?vm97yA+SexuceAiJ6Os7dQt7ObFrDm9YDb0G7MPeG6zyvU6rpKSBvA7cDakx?=
 =?us-ascii?Q?Jwwb1Ef+kH9EyMkw+LVg7bypZvnOtWSzzc5DM/Gxbg0QDKu6TF23we6PHwwd?=
 =?us-ascii?Q?QwvBw/7DHOk487u3AWqcr9f1BFEaNwdrs8MPnVz6ILC6y1B5C4j9BnkUaIIX?=
 =?us-ascii?Q?DXvZOO5iJymOxfYiujFHQt73nzhJADUlFlfa8mNpy+T+O7Ipr04fboi8PEnd?=
 =?us-ascii?Q?LNy/leHcuKuCqjLTZt9isD/c1TLpqtgUP/EN76SEVqAqs7KDbRZe1FVQy6kk?=
 =?us-ascii?Q?bBSfkEy4UYK3fzdFXEKbzpfCUyJRtAIbM6Db3O5ri24ip1ZHZE44eQDqWFjb?=
 =?us-ascii?Q?yIAPza0gZLktW7eSLNyOELzCk1gTK1e5OrZ2awIcZna/FVuFozhP4p8IGxAp?=
 =?us-ascii?Q?tqPPGkNJpv94QCY5+qBf/WQB9v39vZnnFFR9iDS0IMsjUDZNaDQUslZhv2zU?=
 =?us-ascii?Q?dUY6Aaouzo5xTCilMfkJhiZsgfFzxA8SNcKvndVsL4CN7qIA1VLCFA87JLrd?=
 =?us-ascii?Q?BRn9DnovGw9xI06KjtVI?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR08CU001.outbound.protection.outlook.com;PTR:mail-co1pr08cu00104.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(376014)(14060799003)(36860700016)(35042699022)(156008)(82310400026)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Xm1I5Yn9BfF1DzY92L8Z6JFNBxMCI3KjEmZP6dVKZRmwSKZhbNwpuV/+ph2AKssr1tHRnI/TKTJcEkLQWVwDHG9mDGwQweTSewr+762dAN98Z4RrXYqbMoenE5aWQ1myRsLMdxgByLGFhgWJEmyZKfz7fZ9YjWcHJda2+Ba/2OPe6rE7ZdZMhBh5LqXnQUh0uYQc3Rl0j2c9h8fhiqAkOwMrX1E165noC5EBdNGKMHRiY2VTXTQNCiIsyEB4J/IueuXx+ozNQEC+EkBnMw/iu+RIIn/ZK9AUdR65KXJPevVWq4LOtKACL/TlDvlo92jOF9zFMrrrrb9fSf7a6ItXFaPqFXSGogOH7wd9CUdSUupaqk4LHhOx2aolj6dPijzVxIw44IA+sYEMmvoAXz02/ZPq7cNcKLG+BsnxLN/X3OKllKe41bcurun4z295cwDB
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:32:42.8117
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63dc7c5c-3c53-4d20-974d-08de9f245b16
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000066E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR08MB6318
X-purgate-ID: tlsNG-16d1c6/1776720770-CE369D75-CCC67E82/0/0
X-purgate-type: clean
X-purgate-size: 3218
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:Aqib.Javaid@elektrobit.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.332];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 7E7304341E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Similarly to the earlier common altp2m.c/altp2m.h commit, this commit adds
a template altp2m.c and altp2m.h file for ARM to be added to in later
commits.  Creating a commit with just the template file additions makes it
easier to reorder later commits which add to these files.

This commit can be squashed into the first commit which actually adds
something to altp2m.c/altp2m.h for the actual submission if that would be
preferred.

This is commit 6/8 of the preparation phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
Signed-off-by: Aqib Javaid <Aqib.Javaid@elektrobit.com>
---
v6: Introduced this patch.
---
 xen/arch/arm/Makefile             |  1 +
 xen/arch/arm/altp2m.c             | 16 +++++++++++++
 xen/arch/arm/include/asm/Makefile |  1 -
 xen/arch/arm/include/asm/altp2m.h | 37 +++++++++++++++++++++++++++++++
 4 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/arm/altp2m.c
 create mode 100644 xen/arch/arm/include/asm/altp2m.h

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 69200b27280d..d995d4ff7aa1 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_TEE) += tee/
 obj-$(CONFIG_HAS_VPCI) += vpci.o
 
 obj-$(CONFIG_HAS_ALTERNATIVE) += alternative.o
+obj-$(CONFIG_ALTP2M) += altp2m.o
 obj-y += cpuerrata.o
 obj-y += cpufeature.o
 obj-y += decode.o
diff --git a/xen/arch/arm/altp2m.c b/xen/arch/arm/altp2m.c
new file mode 100644
index 000000000000..2bd1ff4df223
--- /dev/null
+++ b/xen/arch/arm/altp2m.c
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * altp2m.c: Alternate p2m
+ *
+ * Copyright (c) 2016 Sergej Proskurin <proskurin@sec.in.tum.de>
+ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/include/asm/Makefile b/xen/arch/arm/include/asm/Makefile
index 4565baca6a4d..fef4dd42b6cb 100644
--- a/xen/arch/arm/include/asm/Makefile
+++ b/xen/arch/arm/include/asm/Makefile
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-generic-y += altp2m.h
 generic-y += device.h
 generic-y += hardirq.h
 generic-y += iocap.h
diff --git a/xen/arch/arm/include/asm/altp2m.h b/xen/arch/arm/include/asm/altp2m.h
new file mode 100644
index 000000000000..ca836bae7330
--- /dev/null
+++ b/xen/arch/arm/include/asm/altp2m.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * altp2m.h: Alternate p2m
+ *
+ * Copyright (c) 2014, Intel Corporation.
+ * Copyright (c) 2016, Sergej Proskurin <proskurin@sec.in.tum.de>.
+ */
+
+#ifndef __ASM_ARM_ALTP2M_H
+#define __ASM_ARM_ALTP2M_H
+
+#include <xen/sched.h>
+
+static inline bool altp2m_supported(void)
+{
+    /* Not implemented yet */
+    return false;
+}
+
+/* Alternate p2m VCPU */
+static inline uint16_t altp2m_vcpu_idx(const struct vcpu *v)
+{
+    /* Not implemented yet */
+    BUG();
+    return 0;
+}
+
+#endif /* __ASM_ARM_ALTP2M_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.34.1


