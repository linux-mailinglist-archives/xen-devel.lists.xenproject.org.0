Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCUsG7Cb5mnCygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C189B434281
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287815.1568260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwFA-0004AC-VH; Mon, 20 Apr 2026 21:33:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287815.1568260; Mon, 20 Apr 2026 21:33:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwFA-0003pq-5Q; Mon, 20 Apr 2026 21:33:24 +0000
Received: by outflank-mailman (input) for mailman id 1287815;
 Mon, 20 Apr 2026 21:33:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEwF4-0002nY-7r
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:33:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEwF3-00CCPQ-Jr
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:33:17 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b69-bab6-0a2a0a5309dd-0a2a450a8c08-22
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:17 +0200
Received: from [40.93.195.118]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b9b-56b3-0a2a450a0019-285dc3762b40-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:17 +0200
Received: from CH2PR19CA0016.namprd19.prod.outlook.com (2603:10b6:610:4d::26)
 by BLAPR08MB6900.namprd08.prod.outlook.com (2603:10b6:208:325::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Mon, 20 Apr
 2026 21:33:09 +0000
Received: from CH2PEPF0000013C.namprd02.prod.outlook.com
 (2603:10b6:610:4d:cafe::60) by CH2PR19CA0016.outlook.office365.com
 (2603:10b6:610:4d::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:09 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 CH2PEPF0000013C.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:33:09 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzzHS3TXLz1wdM; 
 Mon, 20 Apr 2026 14:33:08 -0700 (PDT)
Received: from DM2PR0701CU001.outbound.protection.outlook.com
 (mail-dm2pr0701cu00106.outbound.protection.outlook.com [40.93.13.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:33:08 -0700 (PDT)
Received: from BY1P220CA0043.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59e::11)
 by CO1PR08MB6628.namprd08.prod.outlook.com (2603:10b6:303:6c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Mon, 20 Apr
 2026 21:32:59 +0000
Received: from SJ1PEPF000026C8.namprd04.prod.outlook.com
 (2603:10b6:a03:59e:cafe::63) by BY1P220CA0043.outlook.office365.com
 (2603:10b6:a03:59e::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:32:59 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 SJ1PEPF000026C8.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:32:58 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:32:52 +0200
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
 b=TuPwySnfOoO4heED+i/mLY5dtiFa/ZLLKZie4YKCSKxi2CtXj5GGZFVedj0NVnVF0H1PHnrB8mLzAX1EGtYXcamWMsv5D4DE/ewkYiuGBRthoKeQ/NtsTE58LbBKAqLe5Ac/704OEWNA2BCNrLgNT9OHsAlJ4ptter2Z9bbM2XKNdaSzQ2S3MsyZhAxaHPp3GeMPDi8vMVMLtzc5pFwoKaGdVQ3pI2GSe7twnAQO/JaRvEBSSuSg9/4959lW7wloiyateOAq6Mp4HSjMlj5cusdHJQKUd38AnDEqT5CzF560Hn66cQ8otiEEY6HS2HzNw1VsPSIDOm9GEFYGMk0CSg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OAj59kWKN8biXOebnwdzq5ky5bvMG5PNKC5Jot+tZ8s=;
 b=iXCrCnYxqRv09iCxWYW/+h4xN6Mwg10tkZIMCQsRS6pQtHexY35B7RwrZ9iPLBV04tF2bkxSlRP8K2A5C0f9+zSgcqRM+BaZk90Vw+uRAd1bS0wMyax8mEYnk01DNyGXY7RbuAfKZI3APvFcuaX4ZVqBqA0rpY3HJ35VlA6bCsMnkHDwFB4uA+Jzfd6yzrNK10+LYN/u7iTrYQKAZq0ZYmGRxjSxSD5mBXTLLG3UCYRFSDhNPEs8obQHONO5gxNAqkbY9vcSSMjQh0VbuJ+hzu00PtYxaEUKBBhGjquzwvwSFZamE4Nwf5kNVRrmVh9uhy1+VgzeaI1oZMBtcJhdsQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.13.70) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OAj59kWKN8biXOebnwdzq5ky5bvMG5PNKC5Jot+tZ8s=;
 b=Snryt4baAJEKFGBDB8msfIEyGexDg9xmKxd6g8EvgN0PQ/8QwreW4qBt5FSeF2dbQYkfS1Uwq5Qhbh8eSAhv2A7PipxT3uf9O1plhrVB0xiH2sX76pAEEMkoINohWfSGKzL8+xnCNtWES/3p9ufWYjXQfPBJfdud55HEyIMigXU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.13.70)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.13.70 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.13.70; helo=DM2PR0701CU001.outbound.protection.outlook.com;
 pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wm7cXzJuOF0Oh/JlK1CKxUBdqr04KB4G87cSIM9sOK/D5c2a4VDR17tXIC9SuyPwc0V3iMGBeS7XCx8GHPHF+gUAXbVKFe3Vtwkn45Fi35bcRauRkmGulfosTN48AYgTyKzs4qhXV24RNLXPxpLjPEUtclR5IQwKyIBLleCJVNwezKsi8SVhCaKukaHspeu3mbh2UDCOua3Z65IjJJ6JAo14nSGM/97nF7vC662WOaKMfwijP8V99HzLJc6N9DtSmwiP+8WNk5o9sYc6ohCh0q1KOMvVMmye+rf+RLKjCQ2vOtF3PLiWataN6iA6anP5VR3Y1ljj8n8ldETDEAuAwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OAj59kWKN8biXOebnwdzq5ky5bvMG5PNKC5Jot+tZ8s=;
 b=RhpZUDjzAPlcaSPuCCMf/etJTtstyBFPmFFH/Hc3qSE2pclZw4D0lw54Ou8tsK8HGpQf0CYfsUdWtQiQSpmdByjAxmOTBF82npNwa8ThLPG3iGYTtErjUb16H1wKwah2ZKDnHiE2ognLqwO32unDY77IJGhKWmdQ50bb7yJjYuKz9v3ksrn25hqShASQ0DAphet8jxJCWzaavYiV9a2Fadh7ri8spWX2LzE/mShBJlOEgSu/ePU4Auduv8cG+bWyFcS9aBGsPVNdzOoe4AwvAQvg0BwhR97WqbPr+zwF8o9p/JxtrzGM0BQBpVBO6AmaTBaUBjAUKEPAKqDrGUoo6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OAj59kWKN8biXOebnwdzq5ky5bvMG5PNKC5Jot+tZ8s=;
 b=Snryt4baAJEKFGBDB8msfIEyGexDg9xmKxd6g8EvgN0PQ/8QwreW4qBt5FSeF2dbQYkfS1Uwq5Qhbh8eSAhv2A7PipxT3uf9O1plhrVB0xiH2sX76pAEEMkoINohWfSGKzL8+xnCNtWES/3p9ufWYjXQfPBJfdud55HEyIMigXU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 213.95.148.172)
 smtp.mailfrom=elektrobit.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 213.95.148.172 as permitted sender)
 receiver=protection.outlook.com; client-ip=213.95.148.172;
 helo=denue6es012.ebgroup.elektrobit.com; pr=C
From: Rose Spangler <Rose.Spangler@elektrobit.com>
To: <xen-devel@lists.xenproject.org>
CC: Rose Spangler <Rose.Spangler@elektrobit.com>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Sergej Proskurin <proskurin@sec.in.tum.de>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien.grall@arm.com>
Subject: [RFC PATCH v6 17/43] arm/p2m: Move hostp2m init/teardown to individual functions
Date: Mon, 20 Apr 2026 17:31:40 -0400
Message-ID: <20260420213206.208750-18-Rose.Spangler@elektrobit.com>
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
	SJ1PEPF000026C8:EE_|CO1PR08MB6628:EE_|CH2PEPF0000013C:EE_|BLAPR08MB6900:EE_
X-MS-Office365-Filtering-Correlation-Id: f49ddc1c-3c46-49a9-59fc-08de9f246af9
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?y7lpXzXuajQnio6x5+mtvOJw1oXtwzx7gqXo7MFXNlfLW0EfY3KkL+Z3NmdA?=
 =?us-ascii?Q?+1+kySujE+4WA8FiepyAkGLAqp9NwRpXUF5bY5ZkYyb1qQ9KCCSfP81h205+?=
 =?us-ascii?Q?UXfVvOGzwK5tAaYLtaCO+16Yyy60nruyr3yw8KAS/ojckisfKI3sfkOYmmiN?=
 =?us-ascii?Q?HQ7huvdTXkyEewvkZieTwS/5HzHaRnhZUdSQKakSReBh/9RF2uwr1fuFe9UY?=
 =?us-ascii?Q?6P/mt2B+W1Sy2kKFBa1DFBrFUVMto41pW5iNjYgOXzxo1vdRz37GsVz6Nbek?=
 =?us-ascii?Q?VGZ8CK3qGhTdxrxCMrT5Ie3zUA+WfXI3Q7isEpX7mC9S+iqDxPySl90H6Nb9?=
 =?us-ascii?Q?s5/jEmgsHsetMT0JQIznGU19bSucgi+MtKZvaDzuqeqHqBlNM7MgK7HFZbkt?=
 =?us-ascii?Q?anfC21Q0bD0Mi9XO4O8YO81iT2cQ/RnsrEQ9Jz4zVy2p7bR/pDu1qsXUOyyF?=
 =?us-ascii?Q?ZZCxRERG94VcL7sTiiIMndjYwuhPgZXI9GLlMZUW4kNXov9dI3yjaVw39tJJ?=
 =?us-ascii?Q?UZMOs+MHKQpMtqXZL2o+T7p6Hdk1Ge7Y7ruJtExfcmTCIEYm7khEc1P7pLtb?=
 =?us-ascii?Q?t4Lasc5AwSs1HgWeJx8kchyDcDuzGzthvKXFjZus1wgClfLYKOZFQ3LACHB9?=
 =?us-ascii?Q?SJxsNzaCvxwgzF+cSlXCC9Fxeqc66yenD6238VhD3+zG+dBVYJ5ocGwANOd1?=
 =?us-ascii?Q?w/VYnEyAEAxAKQ91cQa+UNk67F7GM9mxlqP9ISszC4mgUosNs8YQJeoHt5U2?=
 =?us-ascii?Q?9T/SVOaS368HL+jsUbCbAylMh5xoAz75zp00Lmno4P5ouizmWw9CL9bURGVV?=
 =?us-ascii?Q?uYKZ7+7McgJ4HJ4BnkhqgxRbC74pVhIVTvZze+rY50anDmn9WWGOK7RvF4HZ?=
 =?us-ascii?Q?wiXDpy5QFjSbhuR4RXmciKbI40VoNlcEo3wW4BT+lgkl1HAeCzWsXrt/J9pw?=
 =?us-ascii?Q?ug7otWLZnwaLLLx/IqNqUjSEXohnMjXlOOxF3gWEQVuAPhonEAWHhIzU7ET0?=
 =?us-ascii?Q?XvojxqhaCXn1cOTtxgk3+zfZrfb+Ck+pt+8WS9fUmkw6bZnJw2B5HSvl/mH4?=
 =?us-ascii?Q?we64JAyiC3YQ1vTf9dNJ8n6YK9/RAkn6P2r44UqdP50nSU7dGwPf9B31Ler8?=
 =?us-ascii?Q?V3KZh0lCJ6drBE2RbmvxR95c/vNEiFfKearAALrklMRDq0kSBbsJWWsuK7lh?=
 =?us-ascii?Q?ZnwqNoVrj/FcSWTsCkm59dM5FCeL45E3fox1wA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 VMCl7034Do0CTQSQ9Ss8TWwYP0sTxfaFneruF2wSfMqJEi5CcfMDEp81qalRsC9SdngguAyTExBDuIKC153zMegjggIOMLiEbH7G6YyQ9ACSzWoiuHzfXS38jpYxtU0IXw7lssLxEEsCBeCP/3nPIMc3tOWPOdYAgGStSFBs++av9z2p7EinAtORhCz1x6RQed4wKAmR6QVjpOGcJGtTDz8U035s5U4/q0RGR+tRwV+d+yMqmce8CV0Iq23HuSogmwP6w2Pbb+0h/bRm+isDN2fFSP+QLwAiofpFBELYk5OyAHeSofVbqUy5NVF7FftRFB+Pdu0f15Iolk2rDn2DaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR08MB6628
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.13.70];domain=DM2PR0701CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.13.70];domain=DM2PR0701CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 CH2PEPF0000013C.namprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	82ab3a35-1ed4-4d48-55b6-08de9f2464b8
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|35042699022|156008|36860700016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hpB9Q/n0VqWgTKsKBI8wJJpyxvQjzpKVClG+8w+JNW9vW2FF5PwUexm9FOFG?=
 =?us-ascii?Q?e91WbnT5b5cCmpf/hfplWi60kKG5Z2fWuHIoEJpA1qRVzwvXSwyWXCGjC3u4?=
 =?us-ascii?Q?g0kBbT882oySRGVwjb+OaIC4znVeD7LQHFIzPzp9i1kX2FNHOoJXDMGa8cJU?=
 =?us-ascii?Q?hFcBO3ImTA7qXayXVq7CxWasLmgUWYsFnmpe4PmXx8zlC+YqDi5wxHAA5NTm?=
 =?us-ascii?Q?oj5M+Emeib+XZk6kjo4ARSiL5GvLjMnCXpDEpw33ucrqDHGu+fmc4Kp+udnc?=
 =?us-ascii?Q?i/WopKJrX8t2DypGSiBulzaKypEz1CfpJuN5ONbuJ4HhZOjRpiNMRGdiQubL?=
 =?us-ascii?Q?74Rkv+w07ifizg83aMDyjCcPgNsjb6Y+S8gOExYmIE2F7wI2iD8JNOsn+NPl?=
 =?us-ascii?Q?QyM6Uu2P6GAB0IkX51HJAla1UQS/2CMJQddpKzxyJbGMC5g7JyoKpU/zNMt+?=
 =?us-ascii?Q?GUmUjo+lYBhYLEwNKm6DXEYCalysPIWNRVYWoTbEjGE7kj3a72tr814VCBu3?=
 =?us-ascii?Q?bPdLSY7ri2SJ7tPwO2dXAlweeYtfTis6SQMN9LtzCBlX4SvhN8hzSm4amJj6?=
 =?us-ascii?Q?T34rISdgvKoiHa4PMtaPFVGJ+1Tkiz2nRQ4SAvpZu+7KhC3tTJDvTlq6cqd/?=
 =?us-ascii?Q?26xGX16vgpCOCZ1mp6yTjjJXlULUxUwstcJdKNjpd8qBMyRy7nDOJDP1yD8B?=
 =?us-ascii?Q?eFyvb3/tmBodbNFotcHgy6z4yiJRwVzSag+MTZq2EyZi9HDRRD8+i239bltE?=
 =?us-ascii?Q?h/NCRbKD6Db8vcNpt8HhrG+WeVlbKxbI5pmZAvUMaipWdMLyCqTmh+58g0p2?=
 =?us-ascii?Q?KqF73qzKitigBXg/2RBNkWVzU9ZuHUYAS1vh16bb/BwwdneNmoHP0CvzADLd?=
 =?us-ascii?Q?FW1Li3SVJ/UtvHshKCJB1mTz6tRW5dnkal9arDCSMa8aBkTnfpLp30Zw0htG?=
 =?us-ascii?Q?+V8+e8rLfI0ikVDLXqcTXJFwPJPwOWx09ixJzWOgB1m4N7PwTsIcLgJwjJVf?=
 =?us-ascii?Q?XV9J3A/WNGZyvdUwxAKT41IsVg/ggQFVxS2buNdlkhMvINtyKMjPfVIc9KZ0?=
 =?us-ascii?Q?e/TtyomOZiHUccw/Gupi1sMxqjMUDg7W/B1k4pkYc1yDFuMujDnqWVLaBI2g?=
 =?us-ascii?Q?EK0zNjb9HxS6OKUZNKOgso5akHd4yDu20tfRxkA637pzpAo7Rjgpjk51lmCj?=
 =?us-ascii?Q?+EHXbAGWDFZUMCW1YsxjTxGPDCtFgRd1Hsvscw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM2PR0701CU001.outbound.protection.outlook.com;PTR:mail-dm2pr0701cu00106.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(35042699022)(156008)(36860700016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZGBQ3CiD4S7jBPBcrE2PlEsoH4GXHS78CwX4r10ql3Yt5FgorPc/IV2iClEVHsdugjQe1Pvkff98s4tYwex7W+uQQWtQl99a3wMugeGLYU1BshUZSkqaIiq8qBntxdjSOR36tmUdZ9JzqXywITzhm1zd7jVK/grYBO6fQgxId3QACwVOXL0z/Ej4JdWcQGnSpX2Rsi/cwDKTYTOouarazSn1O3B5gdAu6g0O7j+TCpmz0RBiW/b/w39OVelBLWlTn87Y+AcBNH1ub+/4lJphwa58TI0GS7UYgY0TCcYfKR1F15dVW2PgNFBBgH3sqfWnNaFKZ9GwSlcqCCq4thXzC2azX+fVnPb34ab++5hr7l7CDr5zTQObSVx1nrTuKc10xfYKq2JXr21QSOm2+JI/zrL4LW51u8D4eMUjyTEwsJs4kAx3Ux61bo0OeELk9pka
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:33:09.2141
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f49ddc1c-3c46-49a9-59fc-08de9f246af9
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF0000013C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR08MB6900
X-purgate-ID: tlsNG-4011c0/1776720797-81B878B7-ADDE490D/0/0
X-purgate-type: clean
X-purgate-size: 10132
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:proskurin@sec.in.tum.de,m:sstabellini@kernel.org,m:julien.grall@arm.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.236];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: C189B434281
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This commit pulls out generic init/teardown functionality out of "p2m_init"
and "p2m_teardown" into "p2m_init_one", "p2m_teardown_one", "p2m_free_one",
and "p2m_flush_table" functions. This allows our future implementation to
reuse existing code for the initialization/teardown of altp2m views.

On failure, the p2m_init_one function returns a null pointer. This means
p2m_init_one doesn't return an error code, which prevents it from
propagating the exact error from p2m_initialise (specifically, ENOMEM if
allocation fails and EBUSY if the VMID pool is exhausted). However,
returning a p2m_domain pointer simplifies usage for callers of
p2m_init_one, as they can receive an allocated and initialized p2m_domain
without needing to handle allocation separately. Therefore, the main
p2m_init function will now return ENOMEM instead of EBUSY when the VMID
pool is exhausted.

This is commit 6/12 of the altp2m_init/altp2m_teardown routines phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
Signed-off-by: Sergej Proskurin <proskurin@sec.in.tum.de>
---
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien.grall@arm.com>
---
v2: Added the function p2m_flush_table to the previous version.

v3: Removed struct vttbr.

    Moved define INVALID_VTTBR to p2m.h.

    Exported function prototypes of "p2m_flush_table", "p2m_init_one",
    and "p2m_teardown_one" in p2m.h.

    Extended the function "p2m_flush_table" by additionally resetting
    the fields lowest_mapped_gfn and max_mapped_gfn.

    Added a "p2m_flush_tlb" call in "p2m_flush_table". On altp2m reset
    in function "altp2m_reset", it is important to flush the TLBs after
    clearing the root table pages and before clearing the intermediate
    altp2m page tables to prevent illegal access to stalled TLB entries
    on currently active VCPUs.

    Added a check checking whether p2m->root is NULL in p2m_flush_table.

    Renamed the function "p2m_free_one" to "p2m_teardown_one".

    Removed resetting p2m->vttbr in "p2m_teardown_one", as it the p2m
    will be destroyed afterwards.

    Moved call to "p2m_alloc_table" back to "p2m_init_one".

    Moved the introduction of the type p2m_class_t out of this patch.

    Moved the backpointer to the struct domain out of the struct
    p2m_domain.

v4: Replaced the former use of clear_and_clean_page in p2m_flush_table
    by a routine that invalidates every p2m entry atomically. This
    avoids inconsistencies on CPUs that continue to use the views that
    are to be flushed (e.g., see altp2m_reset).

    Removed unnecessary initializations in the functions "p2m_init_one"
    and "p2m_teardown_one".

    Removed the define INVALID_VTTBR as it is not used any more.

    Cosmetic fixes.

v6: Reworked to accommodate the hostp2m being allocated separately from
    arch_domain.

    Split p2m_teardown_one into p2m_teardown_one and p2m_free_one, with
    both having the same semantics as their x86 counterparts.

    The previous version of this patch also added code to p2m_flush_table.
    This has been split out into a separate commit to minimize the number
    of actual changes in this commit.

    Updated to account for the introduction of p2m_final_teardown.  The
    code which previously was used to reclaim resources from the hostp2m
    during p2m_final_teardown was extracted into p2m_free_one. Now,
    p2m_final_teardown will call p2m_free_one on the hostp2m instead. The
    check for whether the p2m was actually initialized was moved into
    p2m_free_one. This means there is a slight behavior change where
    p2m_teardown_allocation will always be called, even if the p2m_domain
    was never initialized. I'm not sure if this is really a big deal (it
    does require the lock to be obtained, but this shouldn't be an issue at
    final teardown?), but if it is then I can duplicate the check from
    p2m_free_one to the top of p2m_final_teardown, which would replicate
    the previous behavior.

    For the sake of making the p2m_init_one function simple to use (and
    match the x86 function prototype), it returns a null pointer on error
    rather than an error code. While on x86 an error from p2m_init_one is
    always due to an ENOMEM return code (from xzalloc, zalloc_cpumask_var),
    on ARM p2m_initialise (called by p2m_init_one) can actually return
    EBUSY if the VMID pool is exhausted. Therefore, in this error case the
    null pointer return value of p2m_init_one obscures the true error code
    (EBUSY). Callers of p2m_init_one always return ENOMEM when p2m_init_one
    returns a null pointer, so this error will be propagated up as ENOMEM
    rather than EBUSY. The alternative to this would be to have callers
    pass a null **p2m_domain to p2m_init_one while still returning an
    integer return code. In order to preserve a common altp2m_init routine,
    this change would also have to be made on x86 (where there wouldn't be
    any real benefit, the return code is truly only ever ENOMEM).
    Therefore, it seems like an acceptable tradeoff to me to obscure the
    error in this case, but if other folks think we should handle this
    differently than I can revisit this.

    The p2m_teardown_allocation call and p2m_init_one return code changes
    mentioned above should be the only actual behavior changes in this
    patch, otherwise it should be just code movement.
---
 xen/arch/arm/include/asm/p2m.h | 12 ++++++
 xen/arch/arm/mmu/p2m.c         | 77 +++++++++++++++++++++++-----------
 2 files changed, 65 insertions(+), 24 deletions(-)

diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
index 23df91ea13e9..5c6dfe4a9789 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -216,6 +216,18 @@ int p2m_init(struct domain *d);
 int p2m_teardown(struct domain *d);
 void p2m_final_teardown(struct domain *d);
 
+/* Flushes the page table held by the p2m. */
+int p2m_flush_table(struct p2m_domain *p2m);
+
+/* Initialize the p2m structure. */
+struct p2m_domain *p2m_init_one(struct domain *d);
+
+/* Release resources held by the p2m structure. */
+int p2m_teardown_one(struct p2m_domain *p2m);
+
+/* Free the p2m structure allocation. */
+void p2m_free_one(struct p2m_domain *p2m);
+
 /*
  * Remove mapping refcount on each mapping page in the p2m
  *
diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index 1009f10e5db4..1d598c66450b 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -1444,14 +1444,10 @@ static int p2m_alloc_table(struct domain *d)
     return 0;
 }
 
-int p2m_teardown(struct domain *d)
+int p2m_flush_table(struct p2m_domain *p2m)
 {
-    struct p2m_domain *p2m = p2m_get_hostp2m(d);
     unsigned long count = 0;
     struct page_info *pg;
-    int rc = 0;
-
-    p2m_write_lock(p2m);
 
     while ( (pg = page_list_remove_head(&p2m->pages)) )
     {
@@ -1460,23 +1456,34 @@ int p2m_teardown(struct domain *d)
         /* Arbitrarily preempt every 512 iterations */
         if ( !(count % 512) && hypercall_preempt_check() )
         {
-            rc = -ERESTART;
-            break;
+            return -ERESTART;
         }
     }
 
+    return 0;
+}
+
+int p2m_teardown_one(struct p2m_domain *p2m)
+{
+    int rc;
+
+    p2m_write_lock(p2m);
+    rc = p2m_flush_table(p2m);
     p2m_write_unlock(p2m);
 
     return rc;
 }
 
-void p2m_final_teardown(struct domain *d)
+int p2m_teardown(struct domain *d)
 {
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
 
-    /* p2m not actually initialized */
-    if ( !p2m->domain )
-        goto free_p2m;
+    return p2m_teardown_one(p2m);
+}
+
+void p2m_final_teardown(struct domain *d)
+{
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
 
     /*
      * No need to call relinquish_p2m_mapping() here because
@@ -1484,18 +1491,27 @@ void p2m_final_teardown(struct domain *d)
      * where relinquish_p2m_mapping() has been called.
      */
 
-    ASSERT(page_list_empty(&p2m->pages));
-
     while ( p2m_teardown_allocation(d) == -ERESTART )
         continue; /* No preemption support here */
     ASSERT(page_list_empty(&d->arch.paging.p2m_freelist));
 
+    p2m_free_one(p2m);
+}
+
+void p2m_free_one(struct p2m_domain *p2m)
+{
+    /* p2m not actually initialized */
+    if ( !p2m->domain )
+        goto free_p2m;
+
+    ASSERT(page_list_empty(&p2m->pages));
+
     if ( p2m->root )
         free_domheap_pages(p2m->root, P2M_ROOT_ORDER);
 
     p2m->root = NULL;
 
-    p2m_free_vmid(d);
+    p2m_free_vmid(p2m->domain);
 
     radix_tree_destroy(&p2m->mem_access_settings, NULL);
 
@@ -1511,9 +1527,7 @@ static int p2m_initialise(struct domain *d, struct p2m_domain *p2m)
     unsigned int cpu;
 
     rwlock_init(&p2m->lock);
-    spin_lock_init(&d->arch.paging.lock);
     INIT_PAGE_LIST_HEAD(&p2m->pages);
-    INIT_PAGE_LIST_HEAD(&d->arch.paging.p2m_freelist);
 
     p2m->vmid = INVALID_VMID;
     p2m->max_mapped_gfn = _gfn(0);
@@ -1559,22 +1573,37 @@ static int p2m_initialise(struct domain *d, struct p2m_domain *p2m)
     return 0;
 }
 
-int p2m_init(struct domain *d)
+struct p2m_domain *p2m_init_one(struct domain *d)
 {
     struct p2m_domain *p2m = xzalloc(struct p2m_domain);
-    int rc;
+
+    if ( !p2m )
+        return NULL;
+
+    if ( !p2m_initialise(d, p2m) )
+        return p2m;
+
+    xfree(p2m);
+    return NULL;
+}
+
+static int p2m_init_hostp2m(struct domain *d)
+{
+    struct p2m_domain *p2m = p2m_init_one(d);
 
     if ( !p2m )
         return -ENOMEM;
 
-    rc = p2m_initialise(d, p2m);
+    d->arch.p2m = p2m;
+    return 0;
+}
 
-    if ( !rc )
-        d->arch.p2m = p2m;
-    else
-        xfree(p2m);
+int p2m_init(struct domain *d)
+{
+    spin_lock_init(&d->arch.paging.lock);
+    INIT_PAGE_LIST_HEAD(&d->arch.paging.p2m_freelist);
 
-    return rc;
+    return p2m_init_hostp2m(d);
 }
 
 /*
-- 
2.34.1


