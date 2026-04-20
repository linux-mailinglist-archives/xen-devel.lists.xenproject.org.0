Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gqGgB2Ka5mk1ywEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:28:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 532A0434046
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:28:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287514.1567983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEw9k-0003XE-5T; Mon, 20 Apr 2026 21:27:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287514.1567983; Mon, 20 Apr 2026 21:27:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEw9j-0003RY-T5; Mon, 20 Apr 2026 21:27:47 +0000
Received: by outflank-mailman (input) for mailman id 1287514;
 Mon, 20 Apr 2026 21:27:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEw9h-0002sc-R5
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:27:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEw9h-00CBiW-7P
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:27:45 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69a45-e002-0a2a0a5209dd-0a2a450280e4-6
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:27:45 +0200
Received: from [52.101.56.91]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69a50-af86-0a2a45020019-3465385b8e59-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:27:44 +0200
Received: from MN2PR10CA0007.namprd10.prod.outlook.com (2603:10b6:208:120::20)
 by IA3PR08MB10336.namprd08.prod.outlook.com (2603:10b6:208:514::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:27:40 +0000
Received: from BL6PEPF0001AB58.namprd02.prod.outlook.com
 (2603:10b6:208:120:cafe::14) by MN2PR10CA0007.outlook.office365.com
 (2603:10b6:208:120::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:27:39 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 BL6PEPF0001AB58.mail.protection.outlook.com (10.167.241.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:27:39 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzz9641zVz1wdR; 
 Mon, 20 Apr 2026 14:27:38 -0700 (PDT)
Received: from SN1PR07CU001.outbound.protection.outlook.com
 (mail-sn1pr07cu00107.outbound.protection.outlook.com [40.93.14.103])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:27:38 -0700 (PDT)
Received: from CH5PR05CA0024.namprd05.prod.outlook.com (2603:10b6:610:1f0::29)
 by IA3PR08MB10566.namprd08.prod.outlook.com (2603:10b6:208:514::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Mon, 20 Apr
 2026 21:27:29 +0000
Received: from CH2PEPF00000099.namprd02.prod.outlook.com
 (2603:10b6:610:1f0:cafe::af) by CH5PR05CA0024.outlook.office365.com
 (2603:10b6:610:1f0::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:27:29 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 CH2PEPF00000099.mail.protection.outlook.com (10.167.244.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:27:29 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:27:26 +0200
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
 b=ivfOIDUOdp+LyHfIJ8t4kMSbRk0wGIT21Lls5ORM553oUdjApND0jgJx8glVIj76+Ok7sbwhvyqwflecHb0B+IT1yUZgMhLUJF6em/emOmSzhsMJhNolAQha2GQUiTx6DFRuPYdjp65dFDEVqYguUg7rPqcRRwabRMX1R5Pc1sMZ3iw14jygb7lc/sZTX6JDpN4Fkb7Zf3UJttiQQg/g5wblFoF6RZVod/gvooAoVpNQFD5YozibG3iUq6Jc3t2OXhau+t+3NIQp0yjeHihcOzKAQzM09wIqSeKo6kw9Kr+CzcbuYuUL+eiQxyjKkdJHCf5o3cqtG7D5mD4zND/ZfQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P5BPH7sP6wJ6lFk7/PYOh+kdZ73MBQ4NzGe07wqGO8g=;
 b=f0zBtlGuGq1vqwSfqy61GVuC3gHjqnBRZS0EWoZ5bs/T4FLC/0PR7akIEpeZ57XnG457QY0k0R0dnnCbPirUzrCLsoOY4+YsE8lrSPMid/p6hiv/fVp5wzOPYEtM26lfVw/MuEyNyG3a+Du+uqyxfWyvR+PdjglRm7USI6oZLF5lKWfOhbY3HwfITU6h/DuD8i34TlbdpndbxtJnegEoZM9QHQoDVA7vAX0Q3TnHDOS/3fqp/qC4bgBZrji6Z/Rg9NeAJk2f+8yYobIzbYcYQ30weB+Yc8wduVDzZBsbh6N9L/470Ee4PWWhv/Lg8Rmk6T469rPluWA2D71eDqqOXQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.14.103) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5BPH7sP6wJ6lFk7/PYOh+kdZ73MBQ4NzGe07wqGO8g=;
 b=DkgdJ1TSPE9IzRTY3Z2f0kbT67ZtilWmT6BxhfYy7Zui6PR2sZG9AELdoT078e4jrJGvXcnq5BjGl4a0U52/AqP0kswFUUQHa2dVmElLf8srV3u1cu/zoJBR0LssOYiIAFWl0Deqng4md4OEg6jB7Rb2l4uTFlxuHAqYI1Xnw6c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.14.103)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.14.103 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.14.103; helo=SN1PR07CU001.outbound.protection.outlook.com;
 pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yUbX/jSvCfjzga1niCnm5GjTMD5yEz5/AOuchf73f14TrX2muboQqaDir3Yu+KOJFBs/VW2v2fqQENoWT36SgcdwmkCYTbBPjf9SypLndekdTM68EmhyoT6RMErbh2YKBIsUl8wLvM4hU1dSP2zHfpM6/Nk+6kytEiIOeKFcwBI5jFwyXVbYG0WZxNnNlnb8cUt3f7sDk/LwHKif6o7ITT/Y5RzuBVOkt3MHUPmon5XegPeRCaz+/5q8QTCoLYogLeTwY3rQWmU9eg7+5/Ay/7ZhGb+Cd0ZS2JO+rOnHzJPce7tv3MfQQXpGVX21Tt94B93somUlwYVlR92F0HuzVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P5BPH7sP6wJ6lFk7/PYOh+kdZ73MBQ4NzGe07wqGO8g=;
 b=DcoRnEpsKD5Iw/qVeoNFPxtv2tzcQ7Twajrbu1sWE0LHhHdQdGguARdtLK78HMFIjq97C8NGy5iin4brhGvBEsEpJQ8uLpDhZeGLrTJJIjYCppNuNrMuJF6g1rWOAjOSHqeSitYEbF4YrBJ+UbY1zk5lV6jciS+/eefg62LHjNNbys6FwMRTQa6vFNlO2BzIZxYH37crAs+WOTYJ4oviXCktnmDFqlPWcDRCsRzPmyDwVARug1H6hqncBuBF4zhQvTCyI75b8+SOKy0umSaWv1zpH8bLQ+OQtKw3y3hm+Jbf2CLk5DqCh/p+SAsUVXXjBeb/0Q53y4m+DZj2SBz7sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5BPH7sP6wJ6lFk7/PYOh+kdZ73MBQ4NzGe07wqGO8g=;
 b=DkgdJ1TSPE9IzRTY3Z2f0kbT67ZtilWmT6BxhfYy7Zui6PR2sZG9AELdoT078e4jrJGvXcnq5BjGl4a0U52/AqP0kswFUUQHa2dVmElLf8srV3u1cu/zoJBR0LssOYiIAFWl0Deqng4md4OEg6jB7Rb2l4uTFlxuHAqYI1Xnw6c=
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
Date: Mon, 20 Apr 2026 17:26:24 -0400
Message-ID: <20260420212648.208640-12-Rose.Spangler@elektrobit.com>
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
	CH2PEPF00000099:EE_|IA3PR08MB10566:EE_|BL6PEPF0001AB58:EE_|IA3PR08MB10336:EE_
X-MS-Office365-Filtering-Correlation-Id: 8baa4ee8-8569-4bbf-218d-08de9f23a66a
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?szvFDjhOIISQl4Sg64JDdUBIEN/vyxAmSIX9dVdgrojq+PYhmb+KvSCAx2Oa?=
 =?us-ascii?Q?BCt7a4M2AUKuJrOdPDJCHBGNrlrRyvrolgMvAAPo3NiaFYd52KeXLT9srtKc?=
 =?us-ascii?Q?IW/4APPSdzdNQ/1gcjMWitiZAYtfVvKaCCGm8/J6GFQ3hF4Sa2emqRZGNG3B?=
 =?us-ascii?Q?H3kKMTodqLiJyxeScUdLp96PUDfNUyc3+j5PkxV7NZdfIyHNAZR/SA5kY22y?=
 =?us-ascii?Q?U0nbpqm2N29dCe02746lQubYYItMCuxyGZUCQVPS6r5dLSQkAPziltgY157E?=
 =?us-ascii?Q?fMEe3YhQGt6japaRt9y6SRwk0uTV1FXZmbRAWUzhD20kFMvLtqwK+rvTHvZx?=
 =?us-ascii?Q?g7+wAjUP7/8ZNJBI0kNWn1iuLiBoPREb+BJQPUdxucTX2V90ed5u2WsSGBQv?=
 =?us-ascii?Q?35YK0tp+Tz0fcSk2oqjFTBX2cs6A761fg918Pg50Ovvn2mfE7ZsbAFfWTUi+?=
 =?us-ascii?Q?krS91R9zGLy8Rju6oTjOT1gq7rslO7kMiE7kEbRFcG3hBDVvRTBeOziyzw99?=
 =?us-ascii?Q?LxZ8/7//JXBY+pOZNlWcuAOeGW72wzXxJTh4hTRpcxQ3mrXUL+hPjauxYkFH?=
 =?us-ascii?Q?eyPHJPFIKvVDcrzPIqsYeuOhTkyiLEJGDflOMAmMh3gUQfwnC4tJpe6Kt02L?=
 =?us-ascii?Q?UxS+9HWtIdouh6zP1LGMaEO5FT8xYPY8J3aaNiMyL/6nDEKZpYwXD6IWg4Hl?=
 =?us-ascii?Q?7Sr3+ByIFhVJNZSnri3ki2Kvap8Zu2WS6uoHqllc4E2BBR0WSZEX6lTOwykU?=
 =?us-ascii?Q?ZYlZfjTXs4xGGzVSjO48ZOUVpgd75hEoAzepBCjgSm36jHqwdNeBTTSH3kij?=
 =?us-ascii?Q?l+BlyfiIU9qSpjPPcnKETS7rjyoO9KUK1gdRRwLFRx6ZcV0Z7zuc1dEgeRwD?=
 =?us-ascii?Q?QQevbgjwu+hDSVLEV1PfMtzajTyOTMOLVJfFePIVLMIaCHdd5T4bFBDZ7cda?=
 =?us-ascii?Q?5mVBIQFHxwj+2+qzHCevvaemXb70vv/IAbVMjZnOMJo4oeiT1+MgAyngL8YM?=
 =?us-ascii?Q?S3ua0JEdI6Gf298qmtF93nWgcg5/twhe0l0rigxmi0/5GdpibROXwkWig+NP?=
 =?us-ascii?Q?nbxKvWiN4Gs56JAW0mzG/hqiK8bUaa39Erfjr4JHG/6Yyc8GgjOEU+2kjsxw?=
 =?us-ascii?Q?7Q7AsRUK42hFTr4f71+H848TEoBHcxVWKWekAMliqMlw/tiEAoAMstx2H92Y?=
 =?us-ascii?Q?6WfzlGt7/nlHkvqW?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 RMvZnrV0yagMbHlsjQTso52c+ZhQc8Y0xCWHYxiYZzDcHcrfqfDCB+MBC6IEjDLU6wNPNaf4vT0PT1gfyVSzgQRFVqKAiYhyTCti4VpcL1iOynEEpBAs7Nr9gOPilk4OFGU3keR6n4FpfPoy2QBVr85gmjd/s9Ex+p7DVSAoLMEzl7qzVSqVVYOdkWgFBblK2LrHZougaHQyl7fQiomPLsBOWc2GpuGfCbUaRKtRey3wbqTwuspYMB5SLjZ7jYahdowLqo0kznzJjuroVHnqxyLom4LwAwma2r4ObOljGT7qXNYiMHZbp4bs4SHIEFrwNLzs7CHRkbhteuM7VqQZoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR08MB10566
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.14.103];domain=SN1PR07CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.14.103];domain=SN1PR07CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 BL6PEPF0001AB58.namprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ac14f798-65ea-4162-f5da-08de9f23a071
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|156008|82310400026|14060799003|35042699022|376014|36860700016|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OJjf698G6RW1Rw+j3xqP7EWlUBm2cP0GQMZUeAdqH8RVos7nXgUVQi9ntKuw?=
 =?us-ascii?Q?+6ldQ8E6TvDMEpyp3pwdFpXf2RR9rGfloxjOUa2Y9FDVFM5o/8fAZruFoVFO?=
 =?us-ascii?Q?fGhhRP3vg2QX2fh1iTLx5k8Q8EXW6fJt+3iFOXRqfuonEwWsnHsY/HjSTLZU?=
 =?us-ascii?Q?EtYaivtqX+UVQtC0kJ6/ldA1Wn4Ef6sYoTiWg0CwhQv3AhnFCSCWzE4XSxJS?=
 =?us-ascii?Q?N5RHJcN1cvcKuQXQKE9IwldCWKn+FUITXoKlRS8amUCvMxg5HstGZ3u6axyC?=
 =?us-ascii?Q?c0L2LCgSu+4h9UmumDpSVHcMSslz6o7bkvXFdIUX7Cx7qd9Unt6divkSjR7u?=
 =?us-ascii?Q?De2li0xtkCz7n5ywYP1l4neIxM5RZIgC5Zua073k8I3B9q9oFRYUg7x7d0Wc?=
 =?us-ascii?Q?o7CjC7VIRxkwqTHm6A+oFyt7bjPemE778Nc+H8AeoCJjjf1G6Ze2CZjc+Tyq?=
 =?us-ascii?Q?daPwWxKwWpiJtAR8VyyVT1q6TPsv7Z28FHFBp/Z5UMyRPJgx4Z7VDUCan9Oq?=
 =?us-ascii?Q?x201d4+s/J8TGGhar5CJooLi5XjPCVWY437thVvYClP5uNgpVgHTU4fOJUWq?=
 =?us-ascii?Q?+QZLtuhfgAw6XoDvrcmSldUK7POhPm3Vzl6TRV0ZO7Ue9N4nj/9IU9q5IqwP?=
 =?us-ascii?Q?AL0kQLfJ5uIc5asROo115Kv6ZCYbIlgL2dQWNjSYAp1+Q7ugbUcWgcgxMSMz?=
 =?us-ascii?Q?7G8dCHEIulvk+6u+1bY6xG8eh9IU8dJpHZsShnY2Bf1Sov8sigsNjEK6V+7D?=
 =?us-ascii?Q?To/05pWv99kvynSG98fZTmd3g4o8fT40QaJIuOzGf+D2lp6gKqptOcb0Md2R?=
 =?us-ascii?Q?NJCxmYLnTm0jFOF+5kyF6jkVgpfvcti4WqjbtMlu+kx6gFKi4oXIqRIDOLFB?=
 =?us-ascii?Q?b05FfYzS+Dho6oIFMqnt4ny+CtwO/0XbXVJAcm3jI/Hhm5uBjt4NjSs48Cgr?=
 =?us-ascii?Q?YcgbTVtMjjk/cxULFyft1DWk8/vXkuDB/yTwcxA4uiwly6jaMDXTawJg4lkx?=
 =?us-ascii?Q?4lBQ8Ym1dHM2ydwUBim3HsfwsIGj4l9hqW7cuYz0wS5TmfP3L+q3Dp0AWz8v?=
 =?us-ascii?Q?0/OJF0DXFeavLFcYz4V8Wbl/7/x65JaKEoack7svtZc+GF29+FiUIGMcNKnT?=
 =?us-ascii?Q?mLugyVjP0nvsU6DCcjloG4mgUVSO4eZje+vsrxyHOF5+dtzNfgG8P5LdrOZ8?=
 =?us-ascii?Q?PrOAjBnOy7/x97MC?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN1PR07CU001.outbound.protection.outlook.com;PTR:mail-sn1pr07cu00107.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(156008)(82310400026)(14060799003)(35042699022)(376014)(36860700016)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	riy/kOz6frt4iKZ0TUo54SssfbLJOjpiWCcFOmxCS63vDLNLHxMimnW040OgMnogp9LSQn/xNcCPzpVa+6KnevryM8ZiujurqwgfEvMsNYO42yZPLZQW8qUHzTkp0K74X2q0XZ993qrexYdM1xO3MGsuV2rAk8vPjer215HknteRKtNJ1Lb89MM1avXP3aojEdAkAOG6U55yx3NBCg7WofReRv4UXRHUXAgY/tzzKPWZzhiMhOoKO/jKOPCFlu/lMLQWpDBwMK38TWE/igpYBQoexLxsoVnvbUCGdC+aq16K9jvtaXVxeITGeS9uLsxPCP9GFNv8BSYlqkLUwZrIimzKVHSY6hqyhG3N+yzApnFwZF4SpADCthtO3WDVSSAFoxQvplGLvXDgI/qI1df3mEOpgxRplVjBa1rE7gUOKqf4u8zfdJLuBqYrAWNxB3nZ
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:27:39.3790
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8baa4ee8-8569-4bbf-218d-08de9f23a66a
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB58.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR08MB10336
X-purgate-ID: tlsNG-720697/1776720465-83F66161-3FDD5E90/0/0
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
	NEURAL_HAM(-0.00)[-0.305];
	TAGGED_RCPT(0.00)[xen-devel];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tum.de:email]
X-Rspamd-Queue-Id: 532A0434046
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


