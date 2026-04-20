Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPH3Mo2b5mnCygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1144D4341DE
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287749.1568117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwEX-0006q9-Ea; Mon, 20 Apr 2026 21:32:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287749.1568117; Mon, 20 Apr 2026 21:32:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwEX-0006nz-BZ; Mon, 20 Apr 2026 21:32:45 +0000
Received: by outflank-mailman (input) for mailman id 1287749;
 Mon, 20 Apr 2026 21:32:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEwEV-0006nt-Fo
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:32:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEwEU-00CD1J-PA
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:32:42 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b6b-2eae-0a2a0a5409dd-0a2a450289b2-16
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:32:42 +0200
Received: from [52.101.62.125]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b79-af86-0a2a45020019-34653e7d2fd7-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:32:42 +0200
Received: from BN8PR04CA0046.namprd04.prod.outlook.com (2603:10b6:408:d4::20)
 by BN0PR08MB7535.namprd08.prod.outlook.com (2603:10b6:408:15b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Mon, 20 Apr
 2026 21:32:38 +0000
Received: from BN2PEPF00004FC0.namprd04.prod.outlook.com
 (2603:10b6:408:d4:cafe::ac) by BN8PR04CA0046.outlook.office365.com
 (2603:10b6:408:d4::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:32:38 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 BN2PEPF00004FC0.mail.protection.outlook.com (10.167.243.186) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:32:37 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzzGr5ZTxz1wdM; 
 Mon, 20 Apr 2026 14:32:36 -0700 (PDT)
Received: from SJ0PR08CU001.outbound.protection.outlook.com
 (mail-sj0pr08cu00102.outbound.protection.outlook.com [40.93.1.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:32:36 -0700 (PDT)
Received: from SJ0PR13CA0206.namprd13.prod.outlook.com (2603:10b6:a03:2c3::31)
 by CH3PR08MB10292.namprd08.prod.outlook.com (2603:10b6:610:208::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:32:29 +0000
Received: from SJ1PEPF000026C7.namprd04.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::9f) by SJ0PR13CA0206.outlook.office365.com
 (2603:10b6:a03:2c3::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:32:29 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 SJ1PEPF000026C7.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:32:28 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:32:25 +0200
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
 b=ebXKwuSPcjkn5IOyEjvxW1od2zYbsQ7n1rRycbunXt+6PQ+nlG+f1Wp6EgRUG53b2Uss4XA9d5kJWlvtwEsuas/xTQEYnx2wdqmeMsvk3VPh6PpBOtiujvfOpYm3SH93ckd2e8ibohFSmEfUnVSU/GQZdysOHabTNT92UGnXG1Bgn957D7QLtUGcBIt+wsrKxQk2BD4n1q69CEb4vY3iiIw0kU4XCtG3emVhIFJdAak5LAZQbosmfI/mygulNj1aZ27byfv5h7V/UNd0BroTv3/FbecDx3ccBqJ4GV5IVzGmR5+jEYpfcojJ32fHaiSa09VH9f91pjT7NXjKwwj7YQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RIbbeMLPJ1Oc8O3jfNscoU93ycEkxovMGroMGjaJzMA=;
 b=hTTAO1Ytxlsv+NAOmkaANcNpWuzWjsZEveTzoxfgypRSb56QzVNnb0WLYB/Jdq0AKVq7k+m//TcBdY3zJivMMyaD5n7lAzv2kPoltquUpDcEhJT285jKTyJjsI7AGmwl/ZxXFJqxqSm2Gu2Cbt21NMCJhivri1ngcjNKlYvtbj/eMX48QD0z97rkl3PSWfoVT92OOTawPJYSQr920x3JXglCWCP8DS0WOOGRU35wkPa2xq3k89bubLpFHQHmdRVDRqk2JZT912K1+3HdMz8g/pcsckG2mas+JIh1hn9XLfFxm0egMn4F1jTsxqxk3NEfux77XwlTuB+TIsLtmoBEvA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.1.74) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RIbbeMLPJ1Oc8O3jfNscoU93ycEkxovMGroMGjaJzMA=;
 b=XOe7d+SbjJTnY3xVcYoclCF/DPLPoJLW4FFKjFmSAZSoy9d7D3DxsRFHNGcd5zXipxZGN4NZGnspgWGyerYaGdCN9CFN7qjxaOByQyuMfO63WCgvebZEGU/uATJpmegdipMevsn3bQjy71oMOMr4OuJ0N0tHZhjWgfMFRb0DRwA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.1.74)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.1.74; helo=SJ0PR08CU001.outbound.protection.outlook.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EluVDqLvGbOHOneT3Q2IYyKral+PiF993yvUhKOcf8Hv0o+s2+iAqFRYLJISll+lpobHgqfQHaCsetoixpOjALcbWcfSFo0/jO+9G1fFsA92oiKMh7i1Ha9ruMmwLC7lY14NI3lSAryNMW09jDEu9DRY8XtsZ34+6EHjaDiuVA1sbj9L7+90yIXRUIdVx7GEZ4lxCyFWkRxw1BTtqdpPoowEgPIJZ7YLMx+KLGltNmxGC0lIvJCY3zvnyxQ25xk9hwkzKLGUGiiRw0RIqgUZ4tRXAayb7ZFKDVNKU1QSVuiPTkWDVsh9xxK/byO0XQ/45QalattReRBg5aup+ZHeVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RIbbeMLPJ1Oc8O3jfNscoU93ycEkxovMGroMGjaJzMA=;
 b=Pv31Zdfgw9n6r1whvXvcWjWeRX2tJ/4/sU7fEktJhmCzpToXK9O/wcy5l4XwK/YzHz62IgxbIJofgEQ6jV2wrCH5/vgzQYqjTQeD6IUxs3vt3ptAzHoQkL5u3cGwOamslb8OCTGd9qyMVIIuyDKGiWEszBRvdfmUNwuQh1AX1/eLdH70uKrvd0rGfqzoRuqOb8KqIb5HZyPii/VkU9d/VxVn6bwNl6NmGA8ABF6Zs46uJx/fZ0cYFRQjhM8wwahH2YVbFBFCVvP0RgMie23rbL4YMi8MSgEJZe+c2LsqAoT4FJzs21jSQSrt3eih9z3qBUa6JDrDntFCPBTlDgYkKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RIbbeMLPJ1Oc8O3jfNscoU93ycEkxovMGroMGjaJzMA=;
 b=XOe7d+SbjJTnY3xVcYoclCF/DPLPoJLW4FFKjFmSAZSoy9d7D3DxsRFHNGcd5zXipxZGN4NZGnspgWGyerYaGdCN9CFN7qjxaOByQyuMfO63WCgvebZEGU/uATJpmegdipMevsn3bQjy71oMOMr4OuJ0N0tHZhjWgfMFRb0DRwA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 213.95.148.172)
 smtp.mailfrom=elektrobit.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 213.95.148.172 as permitted sender)
 receiver=protection.outlook.com; client-ip=213.95.148.172;
 helo=denue6es012.ebgroup.elektrobit.com; pr=C
From: Rose Spangler <Rose.Spangler@elektrobit.com>
To: <xen-devel@lists.xenproject.org>
CC: Rose Spangler <Rose.Spangler@elektrobit.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC PATCH v6 01/43] altp2m: Add template common altp2m.c/altp2m.h
Date: Mon, 20 Apr 2026 17:31:24 -0400
Message-ID: <20260420213206.208750-2-Rose.Spangler@elektrobit.com>
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
	SJ1PEPF000026C7:EE_|CH3PR08MB10292:EE_|BN2PEPF00004FC0:EE_|BN0PR08MB7535:EE_
X-MS-Office365-Filtering-Correlation-Id: 85feac3e-3985-4319-d454-08de9f24584a
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?BE8rtEXCWaAApeWCvMorSyKGDw9VgXnc8iwL8MktiVTNVDq8oFwOUTmLSa1N?=
 =?us-ascii?Q?hH8E7C3yrBMMYgYsnly6qrx05LKbse3Z6QTmS8ICpzXiSfD0GSVpx4asYnh/?=
 =?us-ascii?Q?hZxaTDKynZjKoDg7b3DIU1og4hG2WD12k1FjNfit4BktJKZtxrVMlDPfyjzd?=
 =?us-ascii?Q?0o0SaWRctA1vv/XJ/KMmGEnzTgpHMMP2cbYnb+qmGyDsGsugVnFmwwbU2VrS?=
 =?us-ascii?Q?cCYDjBjpVENfKEUE8m+t69M1CooQGp0IwoqMep3uIHKy0Na8+7d7yxZR5/Wq?=
 =?us-ascii?Q?2kAanLrkHct3vK+UXu8vupMFNMC40wni7UM5WZYQsDVY8kmm2k1BazayDQnb?=
 =?us-ascii?Q?Aoesy1O/R1w4++qZtipG5Lyc2FSYC6XwrGi/WKmwQ1CpHrN/YyAv9/JR6SUI?=
 =?us-ascii?Q?1laU4EeSpXWLqaOKstQTVGC2vZtZRlMDCZNClM+zPhxQ/yf3N+Xx4T0hYr/O?=
 =?us-ascii?Q?BpyP4zmgb7eoh9FrGTwEvwM+mcEw9zck9WDpLe0udJh2lVhr6mI1HFlMuk5n?=
 =?us-ascii?Q?IFUDyjYRmncyzOlB++RoV3TYs+O0RPs3F5cNvvH38TEVq5j8etC+8vdm4E7O?=
 =?us-ascii?Q?kGl2Mwlih+scK3Ptd80N5WVMzWG7OnLZioP6rfNZqXPrGsSghsIxdIaiEAGZ?=
 =?us-ascii?Q?sK4uzTLnjRbPo9f1WFBnvKpGHOLGCsSt2+3z85gXbEsoLXX1cTcupgb9kR/+?=
 =?us-ascii?Q?ueWsmZifCM2xHkd+wctpE3pFrj5NDwbjNgtahJcEgTZqkLFIcQAfS29G8ZZq?=
 =?us-ascii?Q?H83x3RDM7870zJqZrrVE0fq+vB5cTfMUANkrJNVLalZ3F/BVpHx3RIlE2T+j?=
 =?us-ascii?Q?Q+fSvr0Kvo3MzSNEvJgVJF6/tudj+61PKD0VYY7hmloQV62feKb5af6Jx7GK?=
 =?us-ascii?Q?JS7oqjp2S1k2GyVncmxTWix0lzwE60wLaCAoNhkXvYcwwQujw3GL7Oum8yFI?=
 =?us-ascii?Q?gbYjT0DJaT6o/hLoi2biLPlpdP/p1m2qaUsypx5LpyeRtsVeu4jSJtoOFYPT?=
 =?us-ascii?Q?GKxRAV0q27EAzQ9CsUUwyY+o8D/3NOJw3BMigLGMV//+16z/cHp1Lm0QlYSX?=
 =?us-ascii?Q?f3eXGnxPP9rDZ3915wO5BQtVLxUhumUfMgB96onOKdZ6roPeMFBYOGrJ5GV6?=
 =?us-ascii?Q?F/COfly0Lo3ZtObir7t/vYmyg9qPXwORXbF6P63rgq9y80Fl+i3XgZhzXa/U?=
 =?us-ascii?Q?P4j85QMNiXcBulcuMG92hA6lwep9fX4EW7RO3ubpQzF3TLNUwBPUW3XmCFom?=
 =?us-ascii?Q?onDvbB8PBGZngdWcPCkx?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 ZrgEm8lPaveONrDiaPSk5FBNmgdmCQlIJ+zy2ZzdRn6Is5i8B2T6J8uSh9Ue0MQApChpwqJ3H8fo7PbCSUvQb7fDxvCPmR/hWCx6UjYlAjsLiYFof/wm7/AOsgMdwbOHmdIT+anSJuKYDxBVfxduRz/ugKMEEeSQtGCscbTLLzzEKv1RPSKq2VG4NyxdsenDj+Dqc5a8duXkL0DaidHGHb1fWq1P0CY3W/RWXS9h8AgdzzEw6mb4NuO6xwgjqaKUY5Z4wvOqQuql546N6tU9LSvkNGViwx8XJZ/c22TxzeOu3qPULMa4H3E/khy7iOQ06zTeqrDdS1OYOJeulN75CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR08MB10292
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.1.74];domain=SJ0PR08CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.1.74];domain=SJ0PR08CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 BN2PEPF00004FC0.namprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b57a37ec-bf20-487b-2338-08de9f2452f3
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|156008|35042699022|36860700016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hs080B2h/SBOFr3cPUgVBy4zHF1lAB6gE6pDf7vITYUn2i1wNHi/+yvLav9b?=
 =?us-ascii?Q?ySKJgbOg2IaZL20jfM+GmLFd8dhmEJP1ZwzRB02PzIOHJi39TcKInJAjlXSA?=
 =?us-ascii?Q?vfRxN6zT18wQEZ9iJ8/nw+ZcrN5DLOZMHA3N92KaA7rxHjzzE1xbORbif1Cf?=
 =?us-ascii?Q?dOcYGsy+62nbbYWyxBbenismKzc1c9hBhu4XOywXTXG+e3A2FSTjnDFCIqqf?=
 =?us-ascii?Q?7fpXtR62JYDu7OOj9RaLPj6xCgLlFwtjf1k1jaMOgsH+OQOMWjrE7RJjpeRW?=
 =?us-ascii?Q?L1XtJdFJAP2Hi4tVbngR5dOd3vbgVdfPBArIxKebPjIKBuFbVdq2f6p8aYBv?=
 =?us-ascii?Q?6NBDTHGl02IBEdXl4yNM2FyKu1/MohxQ+urv06STpUCGsPGbqg8gy/GvVXiJ?=
 =?us-ascii?Q?lkW/6cWdusvhE0NnZzgEUb7vaE37u8D55Xc2N4AvJk3A/hfieXvPKA6wap3z?=
 =?us-ascii?Q?Ts4pauK6d8c5NYeWBbQbrQCMGG1cQaQN+XS/+qvI3YI7YDrwfjnHAcsD7/NZ?=
 =?us-ascii?Q?atvIKLLuP10zGkCx1GtqxTOb0fAheHwn0W86DOPale4cNEZJHWrliFuZeFlP?=
 =?us-ascii?Q?ouF8IBbGfqkgbhHlVSpSIHonpgB707J/KU6nns8ZkpI6CFGDgHaca0l2I8tF?=
 =?us-ascii?Q?3t6hDWHgfbBW26roC7WWeI7wZ+AHu9OXkGS1tU4In0t1R+4MPHSraRtsQAj7?=
 =?us-ascii?Q?zcWol4yQnbDeFYCL3SlxukfVH8J/J721KdcaTjgGTuviS4t9UGQ9QfwwiROi?=
 =?us-ascii?Q?ZgkN7ax/9CIQ1vuVG8Uo8wAPL2xTB29KcAE9yxr0EEkWcAZcWHAGkFzDM9Yt?=
 =?us-ascii?Q?lj9ewXPUVi6rmkvIwSapvwTFyMYL8ka917kR6cmwZT6X2i/t22j4cxvr2L4P?=
 =?us-ascii?Q?Fp2or1q9wu5QnNzr6NQx7RHXDGEomJn0CTBlsH6gMv6v5/rKhh/4ZjHfdFJS?=
 =?us-ascii?Q?s71vvcIfJXOw73ZWvwRe2/3ib5Q2jYna1NzunHqSieTeNiwLnVFg8hAXFg3K?=
 =?us-ascii?Q?MMgt7NBhKP8yyP7XmkVHNkJ7wPcRW6iQIUfiOusjwmFM66fbLdnTf2OKuamJ?=
 =?us-ascii?Q?fEd9mOeoweq819OwfaekvngQhBU+PwkGa6OtLmenTWPjM6stFdQmJ8F/M8sk?=
 =?us-ascii?Q?dYNBAMpqaietlAxcPZAiYBZdqrGsgZB8Fd7zrnqfV8zw34sUWD37WLj7GAKV?=
 =?us-ascii?Q?ICs9DRmuTySb7btHcm4XA7y4sZuvm5Mftn496vg7zlAO4cgBrDR20tb88fQt?=
 =?us-ascii?Q?ofoevZO/XCIyBod2m+hE?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR08CU001.outbound.protection.outlook.com;PTR:mail-sj0pr08cu00102.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(156008)(35042699022)(36860700016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wqiAqRZgnTMuKIj5V1aU5/bjXKuRuBz+ZBcKcABf5rZHGYAEk6xueOTqT+SP7Ve8GPuO7WU98+w6KtzyrDSkEZ7Jq1UJYf86m6vfnnkEYGZWcAhP4r8ELg8HUGuMGhGK9jUeowTzftBtSnSHsmuwsb7vZtp9XkIMmAAUZWZp3Jj/quBJhLizw3oNkFLbYuL2AVB2m3t9IreoPSJwMQHUlVXbLQg9MeDdDyPlDqTCh9i58ZvmgrfH4oWKcz0SQ2df4Gn/6RYzpay/hM2xIJ4PAdMGWk3DOHFHJFzKTGxqD/lxyjHMNc3bHPYqWl9Fgm93RnkRfZGMzl1rDJjjD6xUei2oTvfKzOQxYTTMD5BiClS9osJi6CIB4JXaXXBBq0H2WCD9C5FADo4yFlfQReDch6AJQa+gNz/n3SoUuGLxTuMj4u1Lfq3FCHk8oBw8RVkG
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:32:37.6759
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85feac3e-3985-4319-d454-08de9f24584a
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF00004FC0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR08MB7535
X-purgate-ID: tlsNG-720697/1776720762-89AC2161-FA5047C0/0/0
X-purgate-type: clean
X-purgate-size: 1801
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.355];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 1144D4341DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This commit adds an empty common altp2m.c and altp2m.h file to be added to
in later commits. Creating a commit with just the empty file additions
makes it easier to reorder later commits which add to these files.

This commit can be squashed into the first commit which actually adds
something to altp2m.c/altp2m.h for the actual submission if that would be
preferred.

This is commit 1/8 of the preparation phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.
---
 xen/common/Makefile      |  1 +
 xen/common/altp2m.c      | 12 ++++++++++++
 xen/include/xen/altp2m.h |  5 +++++
 3 files changed, 18 insertions(+)
 create mode 100644 xen/common/altp2m.c
 create mode 100644 xen/include/xen/altp2m.h

diff --git a/xen/common/Makefile b/xen/common/Makefile
index 6018e256147f..dbe0094006df 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -1,3 +1,4 @@
+obj-$(CONFIG_ALTP2M) += altp2m.o
 obj-$(CONFIG_ARGO) += argo.o
 obj-y += bitmap.o
 obj-bin-$(CONFIG_SELF_TESTS) += bitops.init.o
diff --git a/xen/common/altp2m.c b/xen/common/altp2m.c
new file mode 100644
index 000000000000..1a4e102324d4
--- /dev/null
+++ b/xen/common/altp2m.c
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include <xen/altp2m.h>
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
diff --git a/xen/include/xen/altp2m.h b/xen/include/xen/altp2m.h
new file mode 100644
index 000000000000..520328fd3fa8
--- /dev/null
+++ b/xen/include/xen/altp2m.h
@@ -0,0 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __XEN_ALTP2M_H__
+#define __XEN_ALTP2M_H__
+
+#endif /* __XEN_ALTP2M_H__ */
-- 
2.34.1


