Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IJuOryb5ml8ywEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 894924342A4
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287876.1568321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwFQ-0007Cx-8E; Mon, 20 Apr 2026 21:33:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287876.1568321; Mon, 20 Apr 2026 21:33:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwFP-00070H-HD; Mon, 20 Apr 2026 21:33:39 +0000
Received: by outflank-mailman (input) for mailman id 1287876;
 Mon, 20 Apr 2026 21:33:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEwFJ-000603-P5
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:33:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEwFJ-00CD6F-3z
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:33:33 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69ba5-2eae-0a2a0a5409dd-0a2a4507a6d6-16
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:33 +0200
Received: from [52.101.46.141]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69bab-229c-0a2a45070019-34652e8d5ae9-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:32 +0200
Received: from BN9PR03CA0874.namprd03.prod.outlook.com (2603:10b6:408:13c::9)
 by DS0PR08MB9617.namprd08.prod.outlook.com (2603:10b6:8:1bc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:33:27 +0000
Received: from BN1PEPF00004687.namprd05.prod.outlook.com
 (2603:10b6:408:13c:cafe::15) by BN9PR03CA0874.outlook.office365.com
 (2603:10b6:408:13c::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:27 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 BN1PEPF00004687.mail.protection.outlook.com (10.167.243.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:33:27 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzzHp2JRQz1wdW; 
 Mon, 20 Apr 2026 14:33:26 -0700 (PDT)
Received: from DM2PR04CU003.outbound.protection.outlook.com
 (mail-dm2pr04cu00303.outbound.protection.outlook.com [40.93.13.59])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:33:26 -0700 (PDT)
Received: from BY1P220CA0017.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::6)
 by SA2PR08MB6683.namprd08.prod.outlook.com (2603:10b6:806:111::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Mon, 20 Apr
 2026 21:33:20 +0000
Received: from SJ1PEPF000026C9.namprd04.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::89) by BY1P220CA0017.outlook.office365.com
 (2603:10b6:a03:5c3::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:20 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 SJ1PEPF000026C9.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:33:19 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:33:17 +0200
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
 b=Jx3zq7ojskYhgTb5A00IkEvLoHnrzmF90+52nEYKiqw9H05ZSWfxnDfB8bcjFFgZAzqAbo7fquz8P0nPcMiQdMczIWt/eRFkSxUT9BsZ00e4JM1DSBFW0Um9MHZl9yGPJ8L4NFfi/DvG1eysz25b/JaobT2bRwMf4ZDd5WJpWLX4n9E1O+hXir2rvkj9Skkp5f8bNv0z7kIbZbAVBgeD+tS8fl7P2PefdaAcvz6ZaWAAMmOfbgd8VeB15mm8D5cDBP8a2R15yBjfkApN5SzOTPJoKWmOCAKISBSbrWvuLjd+fPNm/psW+tpRL3OhYbj/YVOJAJBwn2tb+3TkcPhrRg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GH0LWVdYxmiLC0JmFSzNr/w/rCUpu/RM3KGvWGbPMkA=;
 b=LXqs5u1o6ixgRbILiSEPSX+evGnriQoe10H7gHcqSxzkUlcEcHsPNhR4YOaUK3rgjJaskFDhPEIXI1C4+dVt4u5Wtp+YynAMc4dB4ac6iaF9FCACIKERjzIifqp+at0yUJLoaq0tWSni3xIN/p4a5m1gR1aInaR9+eu+eBoB3J7uVFDOODONHpGXpUjLtfT+XMOSdf/CazWp3+clJzxGQu6bzP7RFRFN46EJjH4z3CSXGAKgBdy5hfoukra2KQ1PpBvkKRjN6lssISuwohPHRVadHxn6foYI7TsGH6JqGJialXfvBuoRDPk84JHrxDLc3f2GBKKxIRB+RZuJWKHHMg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.13.59) smtp.rcpttodomain=citrix.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GH0LWVdYxmiLC0JmFSzNr/w/rCUpu/RM3KGvWGbPMkA=;
 b=SYPJDxN8cYcUoWs+g9talSj3U2eG9F7YWhjZ5ZD9T62mENLXp9VzEP7Ttgrv7nbYJvEanrH5e5V5iasJEO7XtovwIQNaPYCuH773BbAR4SK2QngS0P7q/mDngr1twsQzxr7RwADHgeszupBQuR39JEtZjLjb4LZhW4lrohQnX4U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.13.59)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.13.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.13.59; helo=DM2PR04CU003.outbound.protection.outlook.com;
 pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EytrO6GapLKFFO+LCZ3jyrZryPT0zvyBtpOypW5isZlRpnAT5qUJujBWjblIko7LvW8vuNQ7HEnTAPCYEE2CAJAUHfcm7iXgtae2oQMACi634Kh/X+xOGWR4BrCjdYM9QcjFggVdnvdgeMS/shv45OysVfw0NpzdXO+2hTmVsIXqClDuyCFZ5Pga4NfWmYeioX1cq8OJcMYDeRzgK+0udzy+x/uf4FwA5NtYaCCtrzQ6tKlyYXGU7BCdugdOpYw68jtaNtwRLfa3vi/KISx9Aeb9dSRIDfO5vWjRBZt9h2MGTfgyP6wSRUB14oFLfzyCxDBBfly9nXzsS9lXsonN0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GH0LWVdYxmiLC0JmFSzNr/w/rCUpu/RM3KGvWGbPMkA=;
 b=n+8+9He+uRsj/WpP/h0qTxLVFvCuvdPw++g5qRPbgoG4BEW8OH+Qo+U2m78Dbgh7giqtJx+29/Rtv5mRQgu20cY0mtpU3Pw7kj1MT5LI0PxCLQhGsvMfQEPk0sE+cW6LjmP/zGggyxMZ0Do8hH8eFh3juzmT2pFDrUGxcWUTqWq2vX6JvkwQkiEriNA8yFMr/jiiRuISm9391GqeSCsrpMZAsMiYbg25j8rGtQN2Qpvfq0lXdm04po2EBd4X/t2jywJbUa3oeMhi5/xuQrA2EKDpXhLigwoVR2SJWce4SCekv8uBqYTaJuxumourqVss1lRaUIvbGUTloLElDNjXZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GH0LWVdYxmiLC0JmFSzNr/w/rCUpu/RM3KGvWGbPMkA=;
 b=SYPJDxN8cYcUoWs+g9talSj3U2eG9F7YWhjZ5ZD9T62mENLXp9VzEP7Ttgrv7nbYJvEanrH5e5V5iasJEO7XtovwIQNaPYCuH773BbAR4SK2QngS0P7q/mDngr1twsQzxr7RwADHgeszupBQuR39JEtZjLjb4LZhW4lrohQnX4U=
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
Subject: [RFC PATCH v6 32/43] x86/altp2m: Add altp2m_set_view_visibility_locked
Date: Mon, 20 Apr 2026 17:31:55 -0400
Message-ID: <20260420213206.208750-33-Rose.Spangler@elektrobit.com>
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
	SJ1PEPF000026C9:EE_|SA2PR08MB6683:EE_|BN1PEPF00004687:EE_|DS0PR08MB9617:EE_
X-MS-Office365-Filtering-Correlation-Id: cc4cf3b0-e184-4da0-e70b-08de9f2475b9
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?EUtwp3fOnlDOIYQV16wpw+4v4tTwwMvsYg9tViMLK5Ju8v82lXlIwASZbAX3?=
 =?us-ascii?Q?lg9zNCPN2JV3ZhLs42Ol9ei4y2uKWXiDoU+9fz+OaL2WttdTXsNkjb6gCZqo?=
 =?us-ascii?Q?bL+ZYq4PLpGUqfDU3NF/jzUcSlQ15gzDK15jhBNAkYmhHQXmF1IDJCWYzEGo?=
 =?us-ascii?Q?c3NE9vaWc1GfzExxGOugJdsH+zZs1PqfF6olStr/6u/QkdtRTtYHI3Voj3sY?=
 =?us-ascii?Q?SNjwDdkhDl9tdz6LuFvb7tPzEy6UsHvpU6Vt+g2XuJxQOemORnf49YgOzQPB?=
 =?us-ascii?Q?+33ZlcqJHDOQ+ow7khx3QsIYZ2qoQrFz/lJ0Nnqo7USIZaG/uedgCaENLwP3?=
 =?us-ascii?Q?gh3HafaPtvr0oHAO4HEhKKV3kFy1iPgydc6wj1cgKpO34jFE4NnOps5lKkfc?=
 =?us-ascii?Q?rrvyuGkSmOo/kc6Tfv45RXjogUkYBDMpnvZPGSf7QwlX6LxdV4cOEuQB1WAi?=
 =?us-ascii?Q?5XfDqrXCqBVuNUQ0Yscl7g/wf7s9K0D8BRyCsHBYzPLMDnbacWT0nF/bxJQ1?=
 =?us-ascii?Q?e2yxbyFvzl1Ssos7sOGPyMp2SAL2fIUpUorAUUBemAjEwoJ0JEtLbgoB4c32?=
 =?us-ascii?Q?9U6lQ0uacg+L/sXWa2xIqtExqIyVXGnaKt8Zu7v4oXDcQ3tQTNT4cVonPcr0?=
 =?us-ascii?Q?IV2s6h2em3S+DEmR8YZyHtLsHh7gQ1Vb7Gt0DBYFu8+3BDV8jx5vmgs+ZXkt?=
 =?us-ascii?Q?DFKRizy24LbShdlBzdOKQjmTe4ibk1uTbapsL23z89JVHxxEicZ4+o28Sc8n?=
 =?us-ascii?Q?VMYHmG6s8Dsh2Cq2A1RSXbbqOxI4LDjfHRPxXMrcYaIf8CBYCCbOgEp/DUNX?=
 =?us-ascii?Q?V9USt5v07DqpmxDwcnLQH+RQqOWskbfOHJ8IVfJ1OkoYkotdO/HBfV8Z870P?=
 =?us-ascii?Q?4tD6CjDbjviXnwjsIyCuRc6DTxBAMT/IiXMlBY7xppWrgVp+t/40j2+TE7s6?=
 =?us-ascii?Q?oiQ58QVfCsJKHJs0gJMkm1p9Gon0va2sBnGq5sJOKUA2C8VNShejVk2oyY0n?=
 =?us-ascii?Q?i93vwkUyDiSVnk5KYMM23HsKIE1uDeZDMj2zuk3n/Ef6YpTAPAokfbULsmh/?=
 =?us-ascii?Q?Wp2+hs9i38Aibsqc1N+M8abXgE1Zcwb8m8ztd6/dmBkgQYYUN4GdE20FjlPd?=
 =?us-ascii?Q?LUCWFJdPaxX1s0+zrcm6iRH7NDGyTNDMPw=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 irB/aZemqRxvuDaAyO8jlv5sj/HFejFhPTeXG53XxXz/bnr258pnlxZTo7RcfWKRW0tJV571jUGWTUs5aBhAU8fTQVI+smeCMIEZ0F3VSXPKTHsazoTw+RjjFK5gHosNl52kjtrPeon1KTal2AS2orhz0WKIK8xigAqpTgOGq3SUGUzxCxP8ApNIBCA/AG3cVwvC9aXllY1iMaYsIWTez8caWFSThMFEusJTbwYCgTk02EnHPKBiqmeokvKbmej+FWezS5GCSeFDvEjAqUYZK4KVd5Sc3ksFURqSPvh16WZwKoAfcS6x+s3AbfYgB8eja6HqmzCKXBR7j1Q0sUEJ8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR08MB6683
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.13.59];domain=DM2PR04CU003.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.13.59];domain=DM2PR04CU003.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 BN1PEPF00004687.namprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6d674445-3c29-44ec-3925-08de9f247151
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|14060799003|35042699022|82310400026|156008|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1hUhlK069mri6VGhl5V42W7Wgx6CGK+4IuHBN3H4y5pgqbfsN8+CKQY+5soP?=
 =?us-ascii?Q?BzJLjRbG3xTQ1BCghSiBAm0Oy/VpyMcZ+MvU1WIf4zUKMdKBFHdTQf7paJpL?=
 =?us-ascii?Q?xcof6FJy1Xry3sAOHXnRXsYjz/rOz3kuCCD5Q3o0staVFWyCbqrPMepf7RmH?=
 =?us-ascii?Q?wKDriiNT3l0fioWaDsJVXXui4/7Yi5R+zOszldjYGkans0LjI8LgEgjH70RO?=
 =?us-ascii?Q?pFP1oOBe6LqYHI/Ct5+io5H30kkEDY8BChtHPc6Mn6zPDj2FL5vJ0OIKpWh+?=
 =?us-ascii?Q?J/3tlmE/p95XMwurIEBKWkaZWDhV1VJH9lxzjUu3bDTZZqjY6pqeO5B658h/?=
 =?us-ascii?Q?/0TB4eKW3lb+YSQ6RdzSMyDdaCy/WUwU5ZCmUniZgGh9WZLcHrIzeBfxbZgD?=
 =?us-ascii?Q?AfRkbMjm94IsLwkg2AYQ3crd9grsW/yZLLcouPAPXEnoZxgsHsSMIJ3pO+7u?=
 =?us-ascii?Q?ZSrt47JX+DiMR3zTeJV6Jl7tNZI0uk2UcPcug24isadV1b3gW97qd936BvcR?=
 =?us-ascii?Q?ETOc/4P1H33me1x+b0Bqtd2qpF1cDDB83wo553BpG1pG2qxBbfpmMVSGdv44?=
 =?us-ascii?Q?tHZYlTLqh8kEipC+kBZjHzEHmWihi0K2LX913+A1kTn+F7rtbli8D8/iAyLr?=
 =?us-ascii?Q?ZGDV/+UTi0vhS4sro5WZaC+c4FefvuC/oluE2Ij7xXD8u0ZpfNtItWl4rAQg?=
 =?us-ascii?Q?g8fg0PdbBq5q+bssoervtA1r9T+QVqA04+WmbrENq0HP46KBSc6ATM2FYPvU?=
 =?us-ascii?Q?DFUXVySe6Jpaa5RMiv+83bXEwBzUhUgOE9KjWuhkFHFISQqM52o5RbuJHepA?=
 =?us-ascii?Q?KVkeYHhCvw2W1GCDy9qjv4fUKxfK7WRJSJ8DGeM+2QYkfbDQjUCULlC7RnBZ?=
 =?us-ascii?Q?YrorBMHGZuU9iK4is3QdoN5ob0UXIUK8zWsPI9/Qz4nUjFug97k66o+gjA4M?=
 =?us-ascii?Q?/bdk5tKkZ2UNvsyKRf0oOMW+6UQRUuoqG+dNGcR/0HXcOjE7vimqbG4WtQR2?=
 =?us-ascii?Q?W11X7eLGaZzpaCd18VGNXbhY0itzDOxidjpqhlOmtsGV2SmJgw3vx2qPdP4s?=
 =?us-ascii?Q?MHx9nf8YHkjMlJKEl28BcG4w3cVvBGXWObhJ+Gp3Z5gTQnLezZIrED9lmFsz?=
 =?us-ascii?Q?X0A7wjoDomRL0VCVVhIbc4C3Z7EwbCcupg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM2PR04CU003.outbound.protection.outlook.com;PTR:mail-dm2pr04cu00303.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(14060799003)(35042699022)(82310400026)(156008)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Nhp6YUWy2TKi+AEGF4P4Ifj6TEP8P7UBokm6jK6L/9bSEdkYBHICgJnINSVcJnEf8macmbjVPsv8vY4wC5vDcSA0IDYFhNDSBlvuJQXSnT/hCr4Dj16qy3XS9Qfib8k7HLXM+Utb7eirT5VbYbodyDyogWAA7F83ob7FCEBReLqNIF1nRVbV0cARDSBK3yZbYO1pvfRkxVjX5N6MOmtVO7wn+diLI173+INgMI1ltB7NMq7OGAtK+Vvt9+RAMzNiScgK+IN8ui8LUWQOWVZCUMurVjUF5bYoh0pYTB66zrEo1+GHd7uJ+884qAMdm6VB9OaiqDplcgbsjWCXjpY9Wmg0Tdt7tY3AFqbZpkC4H1IxelKBTL7Rb8zmSbQSRHxVgN4c7N+UpbqcPei4t1oV9G6d8V+sbqH3C6ZMNpjjgMZ20JM1IcTGCWKSCXonY2/L
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:33:27.1875
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc4cf3b0-e184-4da0-e70b-08de9f2475b9
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00004687.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR08MB9617
X-purgate-ID: tlsNG-ef75cf/1776720813-16A61C48-57281748/0/0
X-purgate-type: clean
X-purgate-size: 2493
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
	NEURAL_HAM(-0.00)[-0.212];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 894924342A4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This commit splits the altp2m_set_view_visibility into two functions, where
the altp2m_set_view_visibility_locked variant has the preconditions that
the altp2m lock is held. This makes it possible to change a view's
visibility in an architecture independent way in code that already holds
the altp2m lock (namely, altp2m_flush).

This is commit 3/5 of the altp2m view validity/visibility phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.
---
 xen/arch/x86/include/asm/altp2m.h |  4 ++++
 xen/arch/x86/mm/altp2m.c          | 14 +++++++++++---
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/altp2m.h b/xen/arch/x86/include/asm/altp2m.h
index 56ae19b24b42..99c4cfa5a68b 100644
--- a/xen/arch/x86/include/asm/altp2m.h
+++ b/xen/arch/x86/include/asm/altp2m.h
@@ -106,6 +106,10 @@ int altp2m_change_gfn(struct domain *d, unsigned int idx, gfn_t old_gfn,
 int altp2m_set_view_visibility(struct domain *d, unsigned int altp2m_idx,
                                uint8_t visible);
 
+/* Set a specific p2m view visibility (with lock already held) */
+int altp2m_set_view_visibility_locked(struct domain *d, unsigned int altp2m_idx,
+                                      uint8_t visible);
+
 /*
  * Looks up altp2m entry. If the entry is not found it looks up the entry in
  * hostp2m.
diff --git a/xen/arch/x86/mm/altp2m.c b/xen/arch/x86/mm/altp2m.c
index 0542e3ef9196..8672b8c061d3 100644
--- a/xen/arch/x86/mm/altp2m.c
+++ b/xen/arch/x86/mm/altp2m.c
@@ -685,9 +685,19 @@ int p2m_get_suppress_ve(struct domain *d, gfn_t gfn, bool *suppress_ve,
 int altp2m_set_view_visibility(struct domain *d, unsigned int altp2m_idx,
                                uint8_t visible)
 {
-    int rc = 0;
+    int rc;
 
     altp2m_lock(d);
+    rc = altp2m_set_view_visibility_locked(d, altp2m_idx, visible);
+    altp2m_unlock(d);
+
+    return rc;
+}
+
+int altp2m_set_view_visibility_locked(struct domain *d, unsigned int altp2m_idx,
+                                      uint8_t visible)
+{
+    int rc = 0;
 
     if ( !altp2m_is_eptp_valid(d, altp2m_idx) )
         rc = -EINVAL;
@@ -698,8 +708,6 @@ int altp2m_set_view_visibility(struct domain *d, unsigned int altp2m_idx,
         d->arch.altp2m_visible_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] =
             mfn_x(INVALID_MFN);
 
-    altp2m_unlock(d);
-
     return rc;
 }
 
-- 
2.34.1


