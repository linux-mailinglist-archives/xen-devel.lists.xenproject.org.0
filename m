Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IG1nKa6b5mnCygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FA8434273
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287809.1568246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwF7-0003KY-3f; Mon, 20 Apr 2026 21:33:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287809.1568246; Mon, 20 Apr 2026 21:33:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwF6-0003Aw-CW; Mon, 20 Apr 2026 21:33:20 +0000
Received: by outflank-mailman (input) for mailman id 1287809;
 Mon, 20 Apr 2026 21:33:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEwF3-0002aX-5a
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:33:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEwF2-00CCKM-HP
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:33:16 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b8d-bab6-0a2a0a5309dd-0a2a4509a2f2-30
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:16 +0200
Received: from [40.93.198.137]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b9a-2497-0a2a45090019-285dc689dbe7-4
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:16 +0200
Received: from CH2PR17CA0001.namprd17.prod.outlook.com (2603:10b6:610:53::11)
 by DS0PR08MB9466.namprd08.prod.outlook.com (2603:10b6:8:1b7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:33:09 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:53:cafe::21) by CH2PR17CA0001.outlook.office365.com
 (2603:10b6:610:53::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:08 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 CH2PEPF00000140.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:33:08 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzzHR4bQxz1wdX; 
 Mon, 20 Apr 2026 14:33:07 -0700 (PDT)
Received: from BYAPR08CU003.outbound.protection.outlook.com
 (mail-byapr08cu00301.outbound.protection.outlook.com [40.93.1.105])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:33:07 -0700 (PDT)
Received: from BY1P220CA0047.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59e::9)
 by MN2PR08MB6319.namprd08.prod.outlook.com (2603:10b6:208:1a6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:32:55 +0000
Received: from SJ1PEPF000026C8.namprd04.prod.outlook.com
 (2603:10b6:a03:59e:cafe::c4) by BY1P220CA0047.outlook.office365.com
 (2603:10b6:a03:59e::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:32:55 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 SJ1PEPF000026C8.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:32:54 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:32:49 +0200
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
 b=bqmjO7vZunCjYPdE/6ii+SWbSZ0A+QIDRX1AaX4eF01pfegrAsSG4K3nXzEqGO8T3/s4VzyWGvQ0jq2exheL4eQQewCeAUV/+j2Ki/TLoy9I3tbDkZz2qHft8Tpv/lDHQT3vmEAR/YBPti6iKsRbbbevAjeMq/UdXP+papACH8ArNwJnHR+jrj2LRZ021Udg98QuJW4WFf2+ggXrGwraTHLkJKiIurCBQwVMCPWYfabxIqZQvGwXJkHQtknkhF5V17zaUYhAjSMh9fJu1wpnAFjY/WNKr5JEoDtQn9ADjWI2CtQG2Eay/I5Bpge7IfFKDi5oC1qubvR1lHQ7fwtaAg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lnQuy/T8mDWKqAQXnoELf5ceU1mbzwKchncHWAqAvgo=;
 b=Vajh/DKz2YSJyTJxskoKurnELk8keUkGZMFdEUcR3iASNsB8roPDeV8FSmRTl+cKGPGpMOTBm24rT3ba8MOVwSljeAb3Y8ieUufnl5KjwenFfKqcQnCYagr7HaGaRouh/92EU/VZU6mRHgpBmgbyS+99UQOKjO86q1jBS626Xc85CpCcjPpWvs/3Prv6ZelrJL4Pg4KSmOwbMNe6K2jQ67X6gKoMKDXmfUcTd1mowi3sPZVPVE13UptMEDYSRSLMqsTUWWnmL/4A2xSdrNoo+5va3VseVdA7a7W/KTylJozBDtauxxeoZ7VtGv+7vfc4xSc7bRa2ocN1ujhEivmcBw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.1.105) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lnQuy/T8mDWKqAQXnoELf5ceU1mbzwKchncHWAqAvgo=;
 b=WlBs5XTYT+ztCvLuc5Eew4FL+t/kLsCVBYD6OIH+YD0SlpjKckJavApzs2toV9kBArDVQtOzoA+iVBnn/5D566tmP2hgX3shC766qaUDDUyF/AELRzUsnwb7vzGoVdpal5eP2xrP12zMk+1PSqjd6C8vs4sIKOtWqjk4+9GA/bs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.1.105)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.1.105 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.1.105; helo=BYAPR08CU003.outbound.protection.outlook.com;
 pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RyMDUJcOODqsmLmZDMpi79UOykH/1csOpMDoY/6fOnTm8wLG9II1Z/eONRZbDvbXmHY0GqCcN/tL2l8nSP5DkGTbiRdSrGyQqCl9bC+/7pfS9WD+GFXT2UBo9hToXGZj4LyylEi7U/BrEDArILMzKLeSaSMvjp3zAJFokboMakiNnDajjCVOX2iVFvQ3VJ5QiCTUcdwBVDBkbO7ql62ctKVbQHY2l5+JrTw2endzLBSUgoFNa82cGMlUpRuFNbrRNRFeUplRWi8mISz6kGvqU77U/s1NBwn2DmmHIIUqoKhlh/wv3beyfePyuLHvBCfVRqXgDzzghkG/3Wb9HWTdWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lnQuy/T8mDWKqAQXnoELf5ceU1mbzwKchncHWAqAvgo=;
 b=I4a/Oy79bmDcO2T6INLFNucPvLq7YbLTYDheGkVUR+eatBZQAsVI/CCJ5d5W0y+rEfnj6iSK6TJ34pJiFQ7SGS3MqgmqVh81qStDHfO6ayhLSyRrqh+Wtpz9oxiOdYj9uBK4zfuWWM6/AcQOV5qldxPqpBCDwdrRpyrqUUpE5OxX6Zq3jJ1kmzoY4VS8RDgX+6uYE1be2MZf15lQn01DXM2br/MsnsnyClFZoyV46xvpAkajf/t4qVFp8eagfdDUm7s/BbZ6ElgOQS5GZf4uCOPockjNhaIw3/5IbMZYpbxvFYHigG9FKVC9kguqAYb29O/21UNbIQbZbj2ySxwh3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lnQuy/T8mDWKqAQXnoELf5ceU1mbzwKchncHWAqAvgo=;
 b=WlBs5XTYT+ztCvLuc5Eew4FL+t/kLsCVBYD6OIH+YD0SlpjKckJavApzs2toV9kBArDVQtOzoA+iVBnn/5D566tmP2hgX3shC766qaUDDUyF/AELRzUsnwb7vzGoVdpal5eP2xrP12zMk+1PSqjd6C8vs4sIKOtWqjk4+9GA/bs=
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
 Babchuk" <Volodymyr_Babchuk@epam.com>, Rahul Singh <rahul.singh@arm.com>
Subject: [RFC PATCH v6 15/43] arm/p2m: Allocate hostp2m with xzalloc
Date: Mon, 20 Apr 2026 17:31:38 -0400
Message-ID: <20260420213206.208750-16-Rose.Spangler@elektrobit.com>
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
	SJ1PEPF000026C8:EE_|MN2PR08MB6319:EE_|CH2PEPF00000140:EE_|DS0PR08MB9466:EE_
X-MS-Office365-Filtering-Correlation-Id: d92189a4-97ed-4be0-92ad-08de9f246a82
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|56012099003|22082099003|18002099003|11006099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?ORCWejIsWrNq16YE9IRDHBqtySMkMgNUF5VxkPVUwXpkc+rplZeqXu4TAf6s?=
 =?us-ascii?Q?UMl0NlqT4unK1JJt5H/uXTBTg8W3FRDwCO60QYlCLnZfh2VH7kdZRfb5Tl/U?=
 =?us-ascii?Q?575wNNBKklR4vic2ksKlJv3/MCejvP7wwu76sycU4W82PHeOnkhcAnSIqjWw?=
 =?us-ascii?Q?1CnPAdDuKpXMyDVVA3IT4PZ+5MKgz4wg69P/cn/1EwZQHGv2oYiLtwTZ227W?=
 =?us-ascii?Q?1CAc/oplTk7lnHF5VfJnJTso1JKNVnbFlYI3I6nC5kGTBtWwimt+tRvOJBaP?=
 =?us-ascii?Q?rnYxf+doO0KenT9vHDl4uZu2tK3E9BCAO2dxY0CdGT+J0E2I/ynP4Swf4Ahl?=
 =?us-ascii?Q?7HSW+IMYAwrZf6LzryTQhO7mfabR2ZKf5rq4dMRi5gSF4+j9Os0VN6DhFZ3A?=
 =?us-ascii?Q?jMdv2vmFIhUC1IdBPadCjWAF0xb75b8Zyy4QGzzzJcJWOVBrLBZMJapKtlB/?=
 =?us-ascii?Q?dQcHRZ+QpqDq/7mMr613JQc42+vd1pMDY5F1sgkF058QIi3arL9fSQmDH/4J?=
 =?us-ascii?Q?cwIPYvXKBSKFaZnXQ+4BMC56u4BovyrbrOKq1zntX21KwLeu4Gx20IyzFfbR?=
 =?us-ascii?Q?zxyeyzOUMWOHe634eVMhmsg3W1uU4G0OAFpXYziyahQZcfYJ8OejAyhlUI/0?=
 =?us-ascii?Q?PtFT39X9TwL+4qbDX/VboPEOGS/F19ftaATjsg+H3Ajpeqoxbh9txoqDD3t4?=
 =?us-ascii?Q?iPhWRZcrJs1Z7jB2r/nsFV7LP5viG1C83TKyNsRpWOd1ZdWDE9QWaPq48RSP?=
 =?us-ascii?Q?J85/PVDOIdTP4afuv1ejYFkt8Iyf5t/TAlJA/406BUwB600/ibqKbpSFUZqv?=
 =?us-ascii?Q?Kxju85sojP6z0bRCgUbFGeBBm2e1rFfypWrCeEv7YDUAJdCHeJGA6+6Q+0ng?=
 =?us-ascii?Q?y/BQRaX/G6hbJxVOZ3yx+atFRsE5VnGyNhnyvx4Z6H01ruBywp/8htH5u6Be?=
 =?us-ascii?Q?s8a1mD6gz2XJn6TohY94u6GtNH9c94YlG0+8qJ6Z9BoLl4zxuqwvLmD7zpDW?=
 =?us-ascii?Q?ZLzPGdKCKtN698lwEMUscLCIKu8ekDDenuo19WNZQEaOXt97X7d1fubIJbza?=
 =?us-ascii?Q?2BqIw6Hdkpb87viw1+OSSekimPxzBhCMEtcNExu1A1RM8KIDnldYUEHPiqdu?=
 =?us-ascii?Q?KnVXzEW78lfev0rwInHRP0Y8E4/LV5sf/b1H1WZT9kqs6wNrs+zZnU6zlLfG?=
 =?us-ascii?Q?j51PJD26Cu9oDVF2LyMuaLCOjD8cUEz31//Xej8wzLjLmDsencKEW3MmBcTv?=
 =?us-ascii?Q?pMER5n3JTgxFas9yZ0ncakQTolKsL5FEbMxB8KSSm5elmU7oUVuIZAKAg0Iu?=
 =?us-ascii?Q?2Do1PjbYBR2DFyEY+RVJcH4W0XcBAUe9t/xbaJUAk0r/NQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(56012099003)(22082099003)(18002099003)(11006099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 Gxthn6BOF0XGeg3v1dvERdHsQDKmRHI8FupAWnTJQM++Emu885gOKA9bsMGaUH68sFskgtBlRO+i9l/v6hUc/vBC/eX+G3qN4sh+KLqTCTavTgWl5Jg7lF6pqAum8g+RDansmHaMhSGmBCwTfhoI9O/9qwWCOmazjD3NBgVvu9k4Dp1O4Pd7put0qRRbI8d9jOSo9suFnQTCJ3OotqEObucppeVgR+mYlwR+7aSTxDi6tF26qrVgGHEpo5SYWGgHTb9pLGlpjESTh8BC41e9/mpI0DIht9h6+BXsC5Z+wiAMxg4hrLaQ2zpHXhuGZaeXabRQjRkwLWmPbqGBUrXjFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR08MB6319
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.1.105];domain=BYAPR08CU003.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.1.105];domain=BYAPR08CU003.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8ba51a4e-795e-41b5-0c3f-08de9f246259
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|14060799003|35042699022|82310400026|156008|11006099003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AvhKhmn8Cz4/HY8OIsf7mUfdd0/SWBNNwrm1CA6lmKK3IXuVJtKXFiBWOW2p?=
 =?us-ascii?Q?Js+zYUy9HQxI39wtj3JhJkoDggrUqYTCkqju0KkoM0sA48HBpH/3JCyA5nrd?=
 =?us-ascii?Q?ngYOO2xnAvHIf6yJD2W9jn827sLvEcM83yCnCCgTvyY2IHM0Nlt4EP/IqvW6?=
 =?us-ascii?Q?pqk+PGPdw14Mp9qmgXdsIVoljw/1Ge+Jh8KX7jsBDLh3P0zgnGogT/Gs5heR?=
 =?us-ascii?Q?M54WlKsXBX2SRsVRn0jJbhuv6VgKySEykphr9Dk5YmD9wOYRo43J/5ikPWdF?=
 =?us-ascii?Q?moSUyvqDrOgzaeztQqtQAAZaNZs58Zh0nycpAKCSZpq3pLTmmlLRARs/qmfI?=
 =?us-ascii?Q?Wql8Sj2YL4PTLKxjCDaB7v6gRSmndHPrzOHSQK5WxRNsmXuHBPYwuirmN5sS?=
 =?us-ascii?Q?Ix3F90NpnHE5snflv6/NvO3ET7UKNqNaegARNSmzAn4yjz0o0giSg8pzJonx?=
 =?us-ascii?Q?9AKrTYWf/SvDtF82kDoW5/z9Uc+aRFQGCsJGd/Kho3Q3x4NoKxfzLRW+O2v1?=
 =?us-ascii?Q?s3xefC/9JPSXrgcTvdlN+qCUYzspcy+v9QUE2TytMfdJvyOM8nWT1/GKkkcK?=
 =?us-ascii?Q?zrqYKErBgAHIxKScnW26C/SkBNlBsb5LZpkVLv9UO2SaiEA3NEgVNNLKDarf?=
 =?us-ascii?Q?8wnjGZuBA42TVkA50Rvf+SKCWguGVoNQeT22DgNPIt2Yt1mCCoF0cXTngtf5?=
 =?us-ascii?Q?eND/3eizTEsXIhKdavzQjM3z+tNY+dELN2/SfjzCYSWCum3GoxKpt2eiB2Ac?=
 =?us-ascii?Q?MtDoFgvOyMhxpbTwrxqkxsF5jxk7TcK0MYOKBFpjdbJc837iTAiTP93PAsX3?=
 =?us-ascii?Q?QLVkMZR00D9MaVjml4jfwJu1HfzykOL8wE+7kzPi514Wym2izFlLXR/PG0gU?=
 =?us-ascii?Q?YBBSfVgQEbQEG4zeQ3YKThVCYN+4XZLtjVGnZO//yE1pWGAZ+6tAzLYwJ6FM?=
 =?us-ascii?Q?PdcIFOsG5x5D6Wm7MaOenn0eDV5TYaEEyC6WTKyD2GMIlIw9fOTJ7jI9q3Vy?=
 =?us-ascii?Q?tPI6Z5kFX/X3WlowmLblVZfmBjVqsEURb4DfYu4YniO/8nyeGaCI+GtAOAXk?=
 =?us-ascii?Q?WkHbXJTvqizW7S3WCLfjeVqBRwdO/77jLjUSbwyHXyadrFV6l7mcR3NMTs4q?=
 =?us-ascii?Q?XFQYgkycwLkQ0zugD05j1NUPAj3GPxo5ZpIAvj12CoqRrqBLpEAgILzKKWfL?=
 =?us-ascii?Q?ATsGIb4yRR0t5vP1XAnTl9wg+B0Z+KAVNVLZCce3TP7LYSKwhrWLuAHUa5zm?=
 =?us-ascii?Q?VXW21TJRe2aHFludo4v6JjPGkZXOWWMN+gikIQ4dZMq1wfgEsVScfl7k4w8I?=
 =?us-ascii?Q?fLDMYicw7LEbhKoKHl5jhHGdzZRbEYKxkwCsQ90QUxEImA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR08CU003.outbound.protection.outlook.com;PTR:mail-byapr08cu00301.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(14060799003)(35042699022)(82310400026)(156008)(11006099003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	We0n7kf4vpuWmcMuhnIplB4lhjmFZi8kulX/NM2scKTnyCVywmkdcfW5ASVzkW5QeNRg3ZI3KJ68jVOUx/+xHk0hZNQcW8yI3nYppeUF1SHNjlI7bPCa9/tSATXS9WFJ06rtA2OlOKf3d0Ihkt9UVHolBjmIRUr1zNq5cVFtJ4QQw9sFzChXGxy1l+mKhGVjzX0k6Ch0EABOgBFHf9UDOD/kZoAgVWKTLKwZUm3RkhXyNct0y29xXm5y3ODn+aH0nnjl+13KaoFUNMEPKhW224d5yjoJerJa6fyYZaksucm++Azo+zin1QqbxzqW0YDN9SZYvRHPdI3rbcS+Un38oL5iM4MWlHKWykkD+5TEyjT3nxCJMAyBgAWL0PIYqQcO6ViqQVRLdxewmlegMKQt015g0pe0gz0VjCrN7VbX1wfvDK7W5wb0qr3zdktuHQaG
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:33:08.4622
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d92189a4-97ed-4be0-92ad-08de9f246a82
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR08MB9466
X-purgate-ID: tlsNG-bad1c0/1776720796-92772A53-59463CAE/0/0
X-purgate-type: clean
X-purgate-size: 7264
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:rahul.singh@arm.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.271];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 19FA8434273
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This commit replaces the concrete p2m_domain member in arch_domain with a
pointer to p2m_domain, which is allocated with xzalloc during p2m
initialization.

In the following commits, the altp2m_init and altp2m_teardown routines from
x86 are be moved to common code. These routines (respectively) allocate and
free the p2m_domain structs for altp2m views.

While it would be possible to have special code paths for
allocating/freeing altp2m views while keeping the hostp2m as an concrete
member, this results in code duplication and increases complexity without
any clear benefit. Therefore, switching the hostp2m to be allocated
separately from arch_domain (similarly to x86) makes it possible to use the
same functions for both allocation/teardown/freeing of the hostp2m and
altp2m views.

This is commit 4/12 of the altp2m_init/altp2m_teardown routines phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.
---
 xen/arch/arm/domain.c                    |  2 +-
 xen/arch/arm/include/asm/domain.h        |  2 +-
 xen/arch/arm/include/asm/p2m.h           |  2 +-
 xen/arch/arm/mm.c                        |  2 +-
 xen/arch/arm/mmu/p2m.c                   | 27 +++++++++++++++++++++---
 xen/arch/arm/traps.c                     |  2 +-
 xen/drivers/passthrough/arm/ipmmu-vmsa.c |  2 +-
 xen/drivers/passthrough/arm/smmu-v3.c    |  2 +-
 xen/drivers/passthrough/arm/smmu.c       |  2 +-
 9 files changed, 32 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 26380a807cad..be824a5ba18d 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -1099,7 +1099,7 @@ int domain_relinquish_resources(struct domain *d)
          * We are about to free the intermediate page-tables, so clear the
          * root to prevent any walk to use them.
          */
-        p2m_clear_root_pages(&d->arch.p2m);
+        p2m_clear_root_pages(d->arch.p2m);
 
     PROGRESS(p2m):
         ret = p2m_teardown(d);
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index ffe5d0d9f0a6..576dbdec20af 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -72,7 +72,7 @@ struct arch_domain
 #endif
 
     /* Virtual MMU */
-    struct p2m_domain p2m;
+    struct p2m_domain *p2m;
 
     struct hvm_domain hvm;
 
diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
index 010ce8c9ebbd..23df91ea13e9 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -410,7 +410,7 @@ static inline int get_page_and_type(struct page_info *page,
 }
 
 /* get host p2m table */
-#define p2m_get_hostp2m(d) (&(d)->arch.p2m)
+#define p2m_get_hostp2m(d) ((d)->arch.p2m)
 
 static inline bool p2m_vm_event_sanity_check(struct domain *d)
 {
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 6df8b616e464..46f9363ea851 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -116,7 +116,7 @@ bool page_is_offlinable(mfn_t mfn)
 
 unsigned long domain_get_maximum_gpfn(struct domain *d)
 {
-    return gfn_x(d->arch.p2m.max_mapped_gfn);
+    return gfn_x(d->arch.p2m->max_mapped_gfn);
 }
 
 void share_xen_page_with_guest(struct page_info *page, struct domain *d,
diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index 51abf3504fcf..3ecb969a0369 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -5,6 +5,7 @@
 #include <xen/lib.h>
 #include <xen/sched.h>
 #include <xen/softirq.h>
+#include <xen/xmalloc.h>
 
 #include <asm/alternative.h>
 #include <asm/event.h>
@@ -1475,7 +1476,7 @@ void p2m_final_teardown(struct domain *d)
 
     /* p2m not actually initialized */
     if ( !p2m->domain )
-        return;
+        goto free_p2m;
 
     /*
      * No need to call relinquish_p2m_mapping() here because
@@ -1499,11 +1500,13 @@ void p2m_final_teardown(struct domain *d)
     radix_tree_destroy(&p2m->mem_access_settings, NULL);
 
     p2m->domain = NULL;
+
+free_p2m:
+    xfree(p2m);
 }
 
-int p2m_init(struct domain *d)
+static int p2m_initialise(struct domain *d, struct p2m_domain *p2m)
 {
-    struct p2m_domain *p2m = p2m_get_hostp2m(d);
     int rc;
     unsigned int cpu;
 
@@ -1556,6 +1559,24 @@ int p2m_init(struct domain *d)
     return 0;
 }
 
+int p2m_init(struct domain *d)
+{
+    struct p2m_domain *p2m = xzalloc(struct p2m_domain);
+    int rc;
+
+    if ( !p2m )
+        return -ENOMEM;
+
+    rc = p2m_initialise(d, p2m);
+
+    if ( !rc )
+        d->arch.p2m = p2m;
+    else
+        xfree(p2m);
+
+    return rc;
+}
+
 /*
  * The function will go through the p2m and remove page reference when it
  * is required. The mapping will be removed from the p2m.
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 0c01f37ad6b4..637d27659b20 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -984,7 +984,7 @@ void vcpu_show_registers(struct vcpu *v)
 #endif
 
 #ifdef CONFIG_MMU
-    ctxt.vttbr_el2 = v->domain->arch.p2m.vttbr;
+    ctxt.vttbr_el2 = v->domain->arch.p2m->vttbr;
 #endif
 
     _show_registers(&v->arch.cpu_info->guest_cpu_user_regs, &ctxt, 1, v);
diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
index fa9ab9cb1330..d246c5e59005 100644
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -565,7 +565,7 @@ static int ipmmu_domain_init_context(struct ipmmu_vmsa_domain *domain)
      * Use P2M table for this Xen domain.
      */
     ASSERT(domain->d != NULL);
-    ttbr = page_to_maddr(domain->d->arch.p2m.root);
+    ttbr = page_to_maddr(domain->d->arch.p2m->root);
 
     dev_info(domain->mmu->root->dev, "%pd: Set IPMMU context %u (pgd 0x%"PRIx64")\n",
              domain->d, domain->context_id, ttbr);
diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index bf153227dbd9..a7fbe58cba77 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -1205,7 +1205,7 @@ static int arm_smmu_domain_finalise_s2(struct arm_smmu_domain *smmu_domain,
 	vtcr->tsz = 64 - p2m_ipa_bits;
 	vtcr->sl = 2 - P2M_ROOT_LEVEL;
 
-	arm_lpae_s2_cfg.vttbr  = page_to_maddr(smmu_domain->d->arch.p2m.root);
+	arm_lpae_s2_cfg.vttbr  = page_to_maddr(smmu_domain->d->arch.p2m->root);
 
 	vmid = arm_smmu_bitmap_alloc(smmu->vmid_map, smmu->vmid_bits);
 	if (vmid < 0)
diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index d63c9015510e..0975be2562bb 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -1247,7 +1247,7 @@ static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain)
 	/* TTBR0 */
 	/* Xen: The page table is shared with the P2M code */
 	ASSERT(smmu_domain->cfg.domain != NULL);
-	p2maddr = page_to_maddr(smmu_domain->cfg.domain->arch.p2m.root);
+	p2maddr = page_to_maddr(smmu_domain->cfg.domain->arch.p2m->root);
 
 	dev_notice(smmu->dev, "d%u: p2maddr 0x%"PRIpaddr"\n",
 		   smmu_domain->cfg.domain->domain_id, p2maddr);
-- 
2.34.1


