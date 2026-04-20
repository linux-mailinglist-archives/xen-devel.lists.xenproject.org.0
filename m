Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNf6JJCb5mnCygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 305E04341FA
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287750.1568127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwEa-00074Z-Qa; Mon, 20 Apr 2026 21:32:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287750.1568127; Mon, 20 Apr 2026 21:32:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwEa-00071q-NO; Mon, 20 Apr 2026 21:32:48 +0000
Received: by outflank-mailman (input) for mailman id 1287750;
 Mon, 20 Apr 2026 21:32:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEwEZ-00071J-GV
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:32:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEwEY-00Eg4Z-TC
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:32:46 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b5b-e002-0a2a0a5209dd-0a2a450184ac-24
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:32:46 +0200
Received: from [52.101.43.83]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b7d-c1f2-0a2a45010019-34652b532e3f-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:32:46 +0200
Received: from DM6PR02CA0124.namprd02.prod.outlook.com (2603:10b6:5:1b4::26)
 by SA1PR08MB7648.namprd08.prod.outlook.com (2603:10b6:806:1f7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:32:41 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10b6:5:1b4:cafe::fe) by DM6PR02CA0124.outlook.office365.com
 (2603:10b6:5:1b4::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:32:40 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:32:40 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzzGv527Gz1wdM; 
 Mon, 20 Apr 2026 14:32:39 -0700 (PDT)
Received: from BYAPR08CU003.outbound.protection.outlook.com
 (mail-byapr08cu00300.outbound.protection.outlook.com [40.93.1.104])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:32:39 -0700 (PDT)
Received: from SJ0PR05CA0130.namprd05.prod.outlook.com (2603:10b6:a03:33d::15)
 by CYXPR08MB9264.namprd08.prod.outlook.com (2603:10b6:930:d9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Mon, 20 Apr
 2026 21:32:35 +0000
Received: from SJ1PEPF000026C5.namprd04.prod.outlook.com
 (2603:10b6:a03:33d:cafe::a1) by SJ0PR05CA0130.outlook.office365.com
 (2603:10b6:a03:33d::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:32:35 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 SJ1PEPF000026C5.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:32:35 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:32:32 +0200
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
 b=QdjSeA68MxPOKb1Ita6nVIfnQ3kZC43XRdwWzmtlCotpewe/4FjhnhJh7XeoyLgvKlDEVw7ZAHxfGTZn3XydBJt4oByCvmX/mvPYkSdepoag5219nbpBwKXcmtqEOgDG04GXJ+iUvNm11gtyZ7XprrSyIE1S28MF3uqEspO6s4zSCI3th6ZEtN5RWMYbB58/ZSQNz1v2hYxSMYHHQb828a5xTRcfNB+XbycYuMNOzXUiUjip+lizlqA7MDKOWJVv/lLFPSeNzvSwPTS4KChQqNl7LQvG9mQJtL5MaEIKe0Z9Xx0NhIDMKkCNzx3oZ4gC3QRHuw3v7XSLsZl0vhDCjw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9p9JopnflYJnPfdpu0O1EcjHiZAqSeSW4TS/vKusOYI=;
 b=JgNbQOOH0xIdi5fx+MKboRB+ui+9rZvo76x+Vig/W8/8GW8k1TzoP5cIwWEZnKwREMFGeAHLihZhY/neYbNswirY7TB2gLf6e/XHxzOhDCkQbWUklokeuqmHpgd9OkZVBq46VxwbadoL13oW2Y06xptDK6cKLGx1c/ZGn94syBdH64OdEqaAhqP4+VwL5DerdLv0V46I0zQ78gu25TIhOGi+RmPNn+MWPouufbww2+fQ2ESxYZ2qkQuEHYUV1GuVpTOi9FcVasVDtFI6gyS0XKPUvmH9TzPcjMJfyu1DbZRwYY30FCs4hFf3v3Fbf2H8zZsDYyv8wATUj63etk8S/w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.1.104) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9p9JopnflYJnPfdpu0O1EcjHiZAqSeSW4TS/vKusOYI=;
 b=SDJhjnRTU2iV8yMZrbYFjgT/IufbPdW+nMVqEYOMoR+xJyQbDk1QLgx6HwbtaVVDgakSA+gFnDkic2hyujWobgZtTvcziaaiuLlxS2PZzr1GVJzwM3zkVayt3GhVI6wyTRh8pjFz4d+teX0YGrK2yurBUoO20ZHjiyqXtyDn9wY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.1.104)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.1.104 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.1.104; helo=BYAPR08CU003.outbound.protection.outlook.com;
 pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X1UfyeHo8DrkFwD+fCG3AA/0efN+0LgFSmjaP14pXyw3XRZp8xOX4uTL8ZQdQyKyIJUO68/Tks87Jzm4aBCd+Up8PS5PllUWB6LTXxjV9k2jS6NJuYALHwHMjh+S4fbBlzmLBae89mb/jGMDKJlMG7v/9UR2rnTaxYS+VE+Ep23MKqdcv6DZ38ir45LwWC3XAc6o1hZzg8P3GHJQwnDoeuiYvkWinJMft5M91683udOgynoFQBgsv2TzKFiCIBlZ0Nh6EDacdOeU2MTaLn/N9s3eaB+AN4nsFEs91NVAOeXFMO1NUIdmoiFoL+td20BedE1yTx359dYXG833cJCyCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9p9JopnflYJnPfdpu0O1EcjHiZAqSeSW4TS/vKusOYI=;
 b=ss+x0oIIpF8ialTH1Ey6qw18chedtggedhDAh731GL7V9j3DIdSqa7A2PXs30C406YDn21MfMXFxeeAl/rnPnSgAH1768AtlrxHCN5PVPTXyYvlk3izZ6FfrOUJ4hNgkD+YJQiJOXR2K8LxMzwP+fTAUvILw/7xKniSbuoTTQSe6kO+jKLbCOFLbgdx6nE5ylTPRkemtrZgtH9SiTL1KWeL46J9BhGoDfmOdulvYYAbMcd8FLnxoSl8020QnrBfb2tFgNs1MebrR4Ln0dvDT6KVhQyGH2NyWu9YJIRNTD8woBBwmQ/xaQMLZm3ztF49AgZyevbA6s/g8sb29xkvhxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9p9JopnflYJnPfdpu0O1EcjHiZAqSeSW4TS/vKusOYI=;
 b=SDJhjnRTU2iV8yMZrbYFjgT/IufbPdW+nMVqEYOMoR+xJyQbDk1QLgx6HwbtaVVDgakSA+gFnDkic2hyujWobgZtTvcziaaiuLlxS2PZzr1GVJzwM3zkVayt3GhVI6wyTRh8pjFz4d+teX0YGrK2yurBUoO20ZHjiyqXtyDn9wY=
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
	<teddy.astie@vates.tech>, Anthony PERARD <anthony.perard@vates.tech>, "Michal
 Orzel" <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [RFC PATCH v6 05/43] altp2m: Move altp2m_supported to arch header
Date: Mon, 20 Apr 2026 17:31:28 -0400
Message-ID: <20260420213206.208750-6-Rose.Spangler@elektrobit.com>
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
	SJ1PEPF000026C5:EE_|CYXPR08MB9264:EE_|SA2PEPF000015CB:EE_|SA1PR08MB7648:EE_
X-MS-Office365-Filtering-Correlation-Id: 210e971f-44bf-4afa-497e-08de9f2459d6
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|704160111799003|82310400026|36860700016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?YapjJFlISmGKZSgy66PgR8woel+nzRZbrM7o4nDimuIp1bZ0opNJOk9UxYeY?=
 =?us-ascii?Q?nSTngINNY1cTzI1EjbWeobPK8ZjHZpxcIJz+I1GRfdbs8ndK0UmTzHsmllRw?=
 =?us-ascii?Q?M8wzxZTQRdghjaCoxxAhOGavk5oRyjUdCZ+4BjP73uMTqcS2ac0FDKQQU93k?=
 =?us-ascii?Q?9KPfT7IhBmuUqfZHgcVwr2A0WRMNr4973kiDxSOnZtcd4kcdkYN1z7eHTqcv?=
 =?us-ascii?Q?5gPv/GXOJiiL9oCFf0/HfXV4cboAaX4xtiJwF9XtLl1iDtdMiRD/W4O77r0K?=
 =?us-ascii?Q?7wJ2GyLeqMEaURGGUIKLGiiidOIaKZoN6oHBPyp7olp/LucsDjTkiS6Mx3hr?=
 =?us-ascii?Q?YLSzmykD1ULaMcljBubvK9hs8pGCf8skPBIjR6YeUinO9rCi6dFKY+10ndbs?=
 =?us-ascii?Q?rp3NHeR1MzAQT58qxN9EaRIkv8uIlgeEtD91aYJQu5E2RZa5pl1ciXyI/Tof?=
 =?us-ascii?Q?XOCMe8GwgSMW51h10ZbE3xCwg/4Evazd4ld2Sn2xeb3j5671zhjHDZ+ZiOMO?=
 =?us-ascii?Q?4ThU6B9XImcR6eK7pykSP/vfz/Kll0UQsh/zg07tuxhbO4xEuLQFdXtrBMs7?=
 =?us-ascii?Q?wtv0KKXnLIJxfm3g8GrZji2bKWtF/5Z5ldI0IpXyMSWCrqz1kvs6XpMmctCj?=
 =?us-ascii?Q?MOqCnHKThJxCdXuE9UaM1SBwThdCRVKishPXjv6FnHACw9eYsHUormkezxj8?=
 =?us-ascii?Q?e169VtH0mBwnFI+8pFvNHRdVAp9Xt+FRc5bhraneQJK5+vBLwXoo4Xpjj/61?=
 =?us-ascii?Q?2TZpo34dBJaOCeLn8+GQQ0IGn95Cu3/bNYT8MBXbSLVSmlHrD7sGXh8g2/Ji?=
 =?us-ascii?Q?T3KUoZZeseDspjKhU8Qy1uJ183KECJB/LcqFtDBsuc6UieLuERcDab3E5bEE?=
 =?us-ascii?Q?1vI7LiZsFLdmAbrBBsXDN2bDR2cPLvbzvZOSTPzbskQj4EZO2kdwL04PHH4S?=
 =?us-ascii?Q?chAAoJfB4K6jIsFf7qicSDpXguQ9l/hv/dGoNu7hqduybvOaERWaaPK/KvBr?=
 =?us-ascii?Q?SQXE75QHr62mXIuVrzbTcwBrjJAflX5YrMV0cWxaLbut678jf/O4xYD72mlW?=
 =?us-ascii?Q?pJDtPtv53tyXAWszsuSw/ywhvSIdY6N8ujrg27+OzEv8UVlWFEF3J+NaKrRa?=
 =?us-ascii?Q?uI2lXbtnUMghv1c2CzRi1hYn+AN6V5TREXdw/VLpqBrDYWxx19qoAZQ=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(704160111799003)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 MTGb9X2Evjjt9wW8v4wUkaBy2tlHYcAPQbiax+2aRySG0SKwvPjG22uWr+z8R6+Pm0gFYTA37NipYL8CUib7xgusy9kVVT0zkDm8YhZX5EEZQVY3yFQBSy+5GLeHQosjYfxqKjD+z/YP6WIgJlGuz/ZPpTt1Be6CJhV5GOEeFgvUcR6yaqhNYoaOYrU8J+4uj2h7xxje+/ISx0xyWnifS0BzNhJVS9O8+9hHET8MhBYOFXleKXUsbLAokOAVIVKlbmBbi1xM70LalhZwwJWe17lrE8q9Y6yJ6iCr/dm7xUo+RRQ8WzosbxdWn+0OR27KR3Zt6SyfFVckzb8o4aP1OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR08MB9264
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.1.104];domain=BYAPR08CU003.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.1.104];domain=BYAPR08CU003.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	086e5153-1185-4f2e-24ed-08de9f2456b2
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|704160111799003|36860700016|1800799024|376014|14060799003|35042699022|82310400026|156008|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7Ubvrq5jjoUUN5EGrTaq9fLsnQOyFhQ8Lev7Ay3NMFaxN8+/Zzdagrl/K41E?=
 =?us-ascii?Q?ckO7keMKVU0i1AZf1m086oMDXv1AfWFBojPSp4Lksve+ApvKSDWF/YiB5v4U?=
 =?us-ascii?Q?Cyo5v+VhLsSTQXyEgxKoc3ZzGJFJSS9ck5462kwk7a1/4t3ThKD4i/6aTjce?=
 =?us-ascii?Q?ktovDZQyBu8XYNYP4orCYgsg0EY2udon8p2RXBQYsP4jKBiCj5dGua9ywm7U?=
 =?us-ascii?Q?UtLnrCkFDBhSOUeWO+wYPqXmCSG27U1+KqSyIdF535x0XQ2ZEaTc6cOiaWKO?=
 =?us-ascii?Q?s7lLmntfj43iJ8X8dgaTAVRyK9JHrGRLhY1o/x6gBBD8uD+SyAUBaLhrfRwF?=
 =?us-ascii?Q?WmzKL5zEhXvsLZ2BDxHw7o/dRZOXzfkPWYaesmaVfwj2WSJ8Wxv7kylRRueG?=
 =?us-ascii?Q?OLbosll+c0iM+6k3uTIlTSTLQVTsH8K2lQuH1hgOIfaSVQPCnoE3GEH5Z7Qo?=
 =?us-ascii?Q?EA/sksvU/flbXQ3LEYw06LIFScgK2ViY28FQv5vrCaDLKV5GVFUSe6lHGhU1?=
 =?us-ascii?Q?V4WVQiDlnrBK53rJ3u5l5rtbZBjEBjbcxVJKUxqWlCEPh+DZ81yadkiAFGqK?=
 =?us-ascii?Q?ZuTKKTS4OGkkvvnLPqi4YrHnhq6kbMXz0a90ftW3dd+BtyFngVYGzFhGPZWa?=
 =?us-ascii?Q?E7NJUIa2IxJLkqI+G6qQ8xMc7m+OcjUSsIBnjalavF/g2F+0FFV2bFLBVWZ5?=
 =?us-ascii?Q?y2EbcS9R9ubepHM+aDuOz7f5FrUFLYzFOwZ3qGd7aYj8JkDHgtHu5NFsRiIW?=
 =?us-ascii?Q?+8x0mlqCeZJgI2nlHcg7ncfDMMJCoqslq6jdB2ykfkoaF1FW1jm5YTi6Q+mY?=
 =?us-ascii?Q?EmLAFLMuFzY05Ev0vfcSJmd/b/jO8EZO+Ag2kZc80nXFLS5xkp/SbqBgkY1h?=
 =?us-ascii?Q?598Zln3arW37D1HzBr5zfx5gr3zRcFAxFok7zaVzKtkSO4LobRh6ZzywpjK0?=
 =?us-ascii?Q?vu6F1HKuwmKgt0AdUx3Zhtl42ofyBdozl9yZ/5KyHTzVSjW0fDa1BIUioSrS?=
 =?us-ascii?Q?ET7IqScfEcCf3WnMNTpAE6nWCvbPDCgU8I5odB+NwdmtjxBuXQ9g0wV2t+Ld?=
 =?us-ascii?Q?vG1gz+ADaZkSLWt+U9ShJtSwK9pOo+FA+bgFgFop2bMZWnW5WIGyqxf4R6BF?=
 =?us-ascii?Q?7NhErnQ8em3peqAHSNtwFCnS1z5NwpiEsq6lima8IiAxryZZFNnpTUI=3D?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR08CU003.outbound.protection.outlook.com;PTR:mail-byapr08cu00300.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(704160111799003)(36860700016)(1800799024)(376014)(14060799003)(35042699022)(82310400026)(156008)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	s3gVEyP1N93JiQVVluCAdar2f5QkvGM7uc5t6etxB4W1KckpVlbXN3GG1KS814SL0T0mcjrJdRgYhx7R1GceqIaZGBLwakolucHko7uBTXQbW0o0j3flod2yqfaArOusFf05dllGP5gg29SYrY3D1Fote23m+nFzjYwAwwLu3wjQFiI59Ggmd9dO6PRudju15klxIc7xl5B03+P2WuFiKtnq/xb5VweA7Sz7AniBl/8f2fWgesmbOvhchID0Kxgl6rSk9Hrpxzvwnrjy98RQ+a7WxgIYXnGia3naAGN8vwbMpav+2VXACVPLyWZ+k6VkGxQ11qCj23m/Jpm9SE8s5NJMYJOZIKbb9u7QCkZtO+6tohNt9KKvG2hAeq9Vz/5JprxK1t5YQ/P55BLKXnqAFbBrBchaTJ4K90kWW+iclnTR4k3gLKs+uqR2r3V5e1L6
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:32:40.4503
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 210e971f-44bf-4afa-497e-08de9f2459d6
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR08MB7648
X-purgate-ID: tlsNG-d62444/1776720766-BF07EFF4-D04AEA16/0/0
X-purgate-type: clean
X-purgate-size: 3203
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.348];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 305E04341FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Following from the previous commit, this commit makes altp2m_supported
available through the asm/altp2m.h header.

This is commit 5/8 of the preparation phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.
---
 xen/arch/x86/domain.c              |  1 +
 xen/arch/x86/include/asm/altp2m.h  | 11 +++++++++++
 xen/arch/x86/include/asm/hvm/hvm.h | 11 -----------
 xen/include/asm-generic/altp2m.h   |  7 +++++++
 4 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 512b18d4010f..e4f1cbf3b51e 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -39,6 +39,7 @@
 #include <xen/softirq.h>
 #include <xen/wait.h>
 
+#include <asm/altp2m.h>
 #include <asm/amd.h>
 #include <asm/cpu-policy.h>
 #include <asm/cpuidle.h>
diff --git a/xen/arch/x86/include/asm/altp2m.h b/xen/arch/x86/include/asm/altp2m.h
index ad5ded833a75..07e760f60659 100644
--- a/xen/arch/x86/include/asm/altp2m.h
+++ b/xen/arch/x86/include/asm/altp2m.h
@@ -28,6 +28,12 @@ static inline bool altp2m_is_eptp_valid(const struct domain *d,
         mfn_x(INVALID_MFN);
 }
 
+/* returns true if hardware supports alternate p2m's */
+static inline bool altp2m_supported(void)
+{
+    return hvm_funcs.caps.altp2m;
+}
+
 static inline uint16_t altp2m_vcpu_idx(const struct vcpu *v)
 {
     return vcpu_altp2m(v).p2midx;
@@ -58,6 +64,11 @@ static inline bool altp2m_is_eptp_valid(const struct domain *d,
     return false;
 }
 
+static inline bool altp2m_supported(void)
+{
+    return false;
+}
+
 /* Only declaration is needed. DCE will optimise it out when linking. */
 uint16_t altp2m_vcpu_idx(const struct vcpu *v);
 void altp2m_vcpu_initialise(struct vcpu *v);
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 6406bb687718..e6d8042831dc 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -701,12 +701,6 @@ static inline bool hvm_hap_supported(void)
     return hvm_funcs.caps.hap;
 }
 
-/* returns true if hardware supports alternate p2m's */
-static inline bool altp2m_supported(void)
-{
-    return IS_ENABLED(CONFIG_ALTP2M) && hvm_funcs.caps.altp2m;
-}
-
 /* Returns true if we have the minimum hardware requirements for nested virt */
 static inline bool hvm_nested_virt_supported(void)
 {
@@ -876,11 +870,6 @@ static inline bool hvm_hap_supported(void)
     return false;
 }
 
-static inline bool altp2m_supported(void)
-{
-    return false;
-}
-
 static inline bool hvm_nested_virt_supported(void)
 {
     return false;
diff --git a/xen/include/asm-generic/altp2m.h b/xen/include/asm-generic/altp2m.h
index ecee6942f4e8..a3cdbdae9953 100644
--- a/xen/include/asm-generic/altp2m.h
+++ b/xen/include/asm-generic/altp2m.h
@@ -6,6 +6,13 @@
 
 struct vcpu;
 
+/* returns true if hardware supports alternate p2m's */
+static inline bool altp2m_supported(void)
+{
+    /* Not implemented on GENERIC. */
+    return false;
+}
+
 /* Alternate p2m VCPU */
 static inline unsigned int altp2m_vcpu_idx(const struct vcpu *v)
 {
-- 
2.34.1


