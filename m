Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +K/9IrGX5mnCygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:16:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1223433EA2
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:16:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287405.1567821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvyQ-0003gi-JH; Mon, 20 Apr 2026 21:16:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287405.1567821; Mon, 20 Apr 2026 21:16:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvyQ-0003fH-FY; Mon, 20 Apr 2026 21:16:06 +0000
Received: by outflank-mailman (input) for mailman id 1287405;
 Mon, 20 Apr 2026 21:11:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEvuA-0003ai-2E
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:11:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEvu8-0052DR-Ck
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:11:40 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69636-bab6-0a2a0a5309dd-0a2a450895f0-48
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:11:40 +0200
Received: from [52.101.48.91]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e6968a-63b5-0a2a45080019-3465305b33d1-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:11:39 +0200
Received: from SN7PR04CA0070.namprd04.prod.outlook.com (2603:10b6:806:121::15)
 by DS0PR08MB9112.namprd08.prod.outlook.com (2603:10b6:8:1b9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Mon, 20 Apr
 2026 21:11:26 +0000
Received: from SA2PEPF00001507.namprd04.prod.outlook.com
 (2603:10b6:806:121:cafe::ae) by SN7PR04CA0070.outlook.office365.com
 (2603:10b6:806:121::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:11:26 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 SA2PEPF00001507.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:11:25 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzypN6KtNz1wdQ; 
 Mon, 20 Apr 2026 14:11:24 -0700 (PDT)
Received: from SJ0PR08CU001.outbound.protection.outlook.com
 (mail-sj0pr08cu00101.outbound.protection.outlook.com [40.93.1.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:11:24 -0700 (PDT)
Received: from BLAPR05CA0039.namprd05.prod.outlook.com (2603:10b6:208:335::20)
 by PH0PR08MB10955.namprd08.prod.outlook.com (2603:10b6:510:380::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:11:18 +0000
Received: from MN1PEPF0000ECDA.namprd02.prod.outlook.com
 (2603:10b6:208:335:cafe::88) by BLAPR05CA0039.outlook.office365.com
 (2603:10b6:208:335::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:11:17 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 MN1PEPF0000ECDA.mail.protection.outlook.com (10.167.242.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:11:16 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:11:12 +0200
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
 b=o1Owhg7YuZsWV3ZkkDvZFvml6QqpLdVtDSuU/KWjBvb0vOuGG53jrG2s2vR+SoZfvuw9WZ8IojLt4vZDXe4T/c4YPR+tTFn5JiwPL1GtPg0L4aGQ052nw++gZlqVD7CcJdLMgEU+nFCI+1qZ9UroGYFX9y1N5AzHAp5wPheuKi95u+602xqoy4RDyH4gAaOQCMpSCzXD0I+jLrbPzW9ulJ3pBTQrBewGLBYu2v+eFBm/a0yr/pYQOnvwr4fHPZOVhy1o/n5sugc0jB5y7aN5kVN5hmvcwSE0o6eEWLtEf5BSHod4bvLWCQ9vtx6mkF+UxFB5SXsP3yHNBQ84982/ZA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CskA+UpxYzQP++t6ku/Lr+/r6p41tsG9v+zuUgf8Wvs=;
 b=o6aZtKtTcCtQ0fN0e8pVqSjToIpC9w75yVk/gTjL9vSuCBxU6mCQOVWakjdVIVSk6C3/ycbbrrQTDLQWsEGcaL7KEfgxqN/Q2ldfvYHDl+j2dUH6a1bPFVVSLK0JHrD7iIbcpnh5BUnxHeog5pf+GEmiWTz8kF/h5YmoCyVgfVa/FtYeTCFj5uk2AJHp/Xnem96TcJtQUtZmKjvNSsU9VaYCtaaJFyobqcGtJHpD96JvYG1bM9MTNGXJgcjX5d+ic77FruTRDORoiB65wmjImzfPj0lLI7D/Nh1sTaE3AuuwBwYeRgrSGLhgPobJGxlfP4tcC1ZC70fiGuG599X9Cw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.1.73) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CskA+UpxYzQP++t6ku/Lr+/r6p41tsG9v+zuUgf8Wvs=;
 b=ZQ6AlZ4mF4Na67+psydyhzYc36Xvl0NBJ9t7r7nO+Yrc6cINoegCPJCs0+v/DnTiegVY6FaOVPUNfjo9Qags+BUGJfFgQHMsm911nLZFZ1AwQgd8UZSs1mjjHaJtHd+gJ3eTslyZ43TRz1Yk/I68nHiJnTzVwXhuh5y4A54bhO0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.1.73)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.1.73 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.1.73; helo=SJ0PR08CU001.outbound.protection.outlook.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T8A3gczs8jdFTM2+QBEW6bT6/YXvZcxQw/p8xfmA89GD4a/P7KiueNkM2+VdNXa268B9PbP4NFd4aiAYp76ryDfuvTRSpO4brKHIgCP8MVUZStN4m55N8/evuIMntwQeXodnbOIa9vDVp0RbUQWA+53VjGzAyoupoITicXj5Om8IEGwopQfZl3GBn5vZxw9v6XsOy1uRMoYhySPp86IwkFOYekW8Gqgly1NVhk4X3NEPDQcaAFdYSZKTo049xwRPkT8dowhWwM7AAX54eYHxI0xd1o4phSLxaJvV5Vu/06A1yzwZIs0I8taFo5O9pzFgQVqauNu9UCJQ582fF4tU/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CskA+UpxYzQP++t6ku/Lr+/r6p41tsG9v+zuUgf8Wvs=;
 b=h+I2/WKMtxM/lBNlKdSnNGoJotF5W4vy47f56WWtx9z4NB9EkLzAWo8opt3MpPGv75G90YccZayz6mQjUzt1DYQljU6xQEsCV6G5MIsQZG7NDPBYtoOmLGpHQW1VPzf4ap0iDJ1lMv3qFLWW0i+ss3BFxF5IMCd3xsNgZb+pHvZoXqyRXnENkcF80XWQhDiofoNaxHEpf9uMpF4lu0fx8p0gOtW71jl6HSBSjKrMLmZW+Aa2jDXzwU4ra6Rn+gGAhZyTe9DFqSoT/nVFKhn8wN67HpGbLJkiam8ZejJDa7txhw82X6RNkDPX6CH1+YbS2jdynktmsBkf7+2I7/CBIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CskA+UpxYzQP++t6ku/Lr+/r6p41tsG9v+zuUgf8Wvs=;
 b=ZQ6AlZ4mF4Na67+psydyhzYc36Xvl0NBJ9t7r7nO+Yrc6cINoegCPJCs0+v/DnTiegVY6FaOVPUNfjo9Qags+BUGJfFgQHMsm911nLZFZ1AwQgd8UZSs1mjjHaJtHd+gJ3eTslyZ43TRz1Yk/I68nHiJnTzVwXhuh5y4A54bhO0=
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
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Teddy
 Astie" <teddy.astie@vates.tech>, Tamas K Lengyel <tamas@tklengyel.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Rahul Singh <rahul.singh@arm.com>, "Julien
 Grall" <julien.grall@arm.com>
Subject: [RESEND RFC PATCH v6 00/43] altp2m: Move altp2m routines to common code and add ARM support
Date: Mon, 20 Apr 2026 17:11:04 -0400
Message-ID: <20260420211104.208444-1-Rose.Spangler@elektrobit.com>
X-Mailer: git-send-email 2.34.1
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
	MN1PEPF0000ECDA:EE_|PH0PR08MB10955:EE_|SA2PEPF00001507:EE_|DS0PR08MB9112:EE_
X-MS-Office365-Filtering-Correlation-Id: 7321a47b-d8a7-4ff4-3fa4-08de9f2161ff
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|704162111799003|82310400026|36860700016|7416014|376014|1800799024|13003099007|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?MSfwI/iyi5W56jLzzsYRfg3tdYDtTEvJ5RfFWN/Oax3OPrG56wBqfEKHU02g?=
 =?us-ascii?Q?sKwAy7t5Lsd0qU9ti2qCIHqcTyyn4toSHxLOqDFzfTxM6aTEL1fAFA+6Pvic?=
 =?us-ascii?Q?Hae4tHPI0OyJr/14Pb+4MYip7Itod9z6ig3AI8B3B5wY0YVYvLP/yM/6/mrQ?=
 =?us-ascii?Q?aB6WW1yoDMUDRqIgS1GsUQoYq5NOmQQv+LV7sX3fbaZx3yOqjOaR5htSwJOr?=
 =?us-ascii?Q?0Kyb/xfGl0pv31yXpJThf5s6xrVJM2fStdpBuVLDpaeMN/90NsRV+MsLthIN?=
 =?us-ascii?Q?cKxjE15KgR0rPrsQ/g2bOe4g4INcz2lCctNYdRiHd4jov1yp6gIp++OWzeVI?=
 =?us-ascii?Q?pqsdaMp6jlp/KEBv7wAjwjWMxhtH+VQjzhc7wWCkLNMx1v1atzV7JjO2SA0I?=
 =?us-ascii?Q?v4rS55UKPJ++5uSByOa0D/Zlt6CToV47Kcai603lD7ATTHaAr8USV2aopDf1?=
 =?us-ascii?Q?/L9gxGgNp1sb4uxhqE90N2fY+krJRc0WE76IDJzc/7mlbiURNVwvr8BIdnJG?=
 =?us-ascii?Q?G4sAQuX7uYghkTCFFmUrD1/eOqdoWCrwquHVGC1qC0hVQyC4DiDv3072kfVK?=
 =?us-ascii?Q?rt8qZOHTTrL7RFV6YL5Ezv1e1bMdHZXCZ2K7B1edPXvxvu+NLm7Eolr4+Uy3?=
 =?us-ascii?Q?/b7+5LogaiscknUj9i5yxT1aIedPfOQmEtdK8rZzyI2aqdrTpqTtEPv119HA?=
 =?us-ascii?Q?Vm/tQKibB++P4uUN1Jhp+fjVhErbB30rwJwtpvVyXeFwD3fCHga86vzzIZA2?=
 =?us-ascii?Q?B3P/H45f5/aiHJUN8fvA97dPDV5I4GfZEXKiTga0IHne2KwyFZ+LoY6PDOPy?=
 =?us-ascii?Q?K4H8v/uDR4uGwCs1PUrrxbJChOBOtEKti37tbn7K6rAikKrfRNttq5K7H7yv?=
 =?us-ascii?Q?6mksJ52qVYzmRKnx+dB2OXAlCcfTvZZFK///OKX0cLeS2JF08ojvlkURSWJE?=
 =?us-ascii?Q?z0cn3ctgfrLwXLEGEg8zw0SZmIWdbeB2+H6a+Qvnzlf6KZYr4QduzFn/ekCu?=
 =?us-ascii?Q?GoGnFDFQa7H3vFvCZV+uVpExLA9O5/iVViPdLFafN9/tyaUGB6CwcZw2skce?=
 =?us-ascii?Q?LnK6d6vRO7FmAF3l8iLkxQdEhuZ0axtJ1aSMvvzJ+DWO0K3rLI+QNMMBLFoq?=
 =?us-ascii?Q?qDuds2b3R4Jgon6rlQlwU3C5CKotyFkOFZ/sajSizaJr1EjXYVrfPMI=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(704162111799003)(82310400026)(36860700016)(7416014)(376014)(1800799024)(13003099007)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 tOG7eKflMvnOosl1knvaD9HzJ0vAbUePKOL7b9YeIaoF4ii/wPWmV81uq3xi3L2xWxxUqv+F5DtkOvJxQ9YQWI94s34VwXjsW5ni+IPUP5zV2RNn5M42r6SU8toVULRhB8lNh9ITjeAH4Vb0UU9154ED9VNTQDb2VrevSCwBUafBM43pWayoM9kF/fdaowqFCtQfgdYKy5yuHzPef/AAkXMH/Cu4egVO68J1xXNqnSJzkLPu+xeeLTxUW4xH4EBOERVWhKi7XvRueqimxDCbi3NJLsTn0a1G+BQz0URuSR5p31xm1X10t065z5zEIMG72AvBK2Rn15Auvaoat5/UTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR08MB10955
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.1.73];domain=SJ0PR08CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.1.73];domain=SJ0PR08CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 SA2PEPF00001507.namprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	44134fdc-dad6-4e7d-2a4b-08de9f215c82
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|704162111799003|1800799024|376014|7416014|14060799003|35042699022|36860700016|82310400026|156008|13003099007|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4RCrY0ZyGmVWTZM+ssOy3l5G9hiOoxBB9hbVFfVxNRVOACQABWa1oQ8w+SWu?=
 =?us-ascii?Q?YSj/iP2aSAOjQFK+eRd8X2fMakYdPbWIBrfYT/RLyK8QQBXaa1U3ztiuiz6J?=
 =?us-ascii?Q?2I2+rROL2um94qRfbKjcwlwTPQkFBr1hWtI6LTzJsT0KLyXYUNUKN9TEBQOO?=
 =?us-ascii?Q?W1lr+5BqEX6bZQ00KMAIJDFYkS5sRpvm02dI3XUAXNN3iMknsi5Spngk6m4O?=
 =?us-ascii?Q?0GKyKXx9C0ZDoWwiowhKaDgXrJxncMvOMGzgJ1y86xDyfzLmdRWohmv8RyCZ?=
 =?us-ascii?Q?C3XA7EM010VQCtr7uKPzRK6b8DrIIhEPz3YJLt6zkV6BvNPl9S34YdG6Sw5J?=
 =?us-ascii?Q?LCPRl2Lmh6XhTu35B6vUag5D6Neffr0yanYIyvAta+R9I064AJkkOC91N4Pz?=
 =?us-ascii?Q?MK647+OqR+cXNaarNkQwfaAEebufmRSNlm/VzqaUoaZxSPozrD8CK7NVUkMi?=
 =?us-ascii?Q?qJ80T2RQvmiOice/yMMg6UJF8Q0wWonhDujulajyTFbWk9v/vy9xZ5cmFmfB?=
 =?us-ascii?Q?KaS9pN2YRy/Wdn97sVItJ2b6c9k+ijLJaSFNN6zZThsqIY0UywqostWSOa3z?=
 =?us-ascii?Q?pzlb40ZhaXQbzwdPtpS5Qd3UNrbsz14ObRCTdBSIKTenX367b1YpIluIYDbb?=
 =?us-ascii?Q?cZhww8GewBteFqlB6LZrt8j9WWM8BNnGVXs5n9+zy9+VQ+gAhKeId+dnwW9i?=
 =?us-ascii?Q?r5wDFAmw0+CW5jNB52T8r9iMVSPUrWIyMeSI+n3M+babwiFigHU+VXXGUVbH?=
 =?us-ascii?Q?yrev4gpGSC7+/4U6LUQWKV9/sh1kCpO+5P0ard147u8uEtSHcl8y2otB+utR?=
 =?us-ascii?Q?y8THjqgzV4jISnNuGH2Si/e1IZpeILrGBSUECDg1zeM/+WrvajaCFJy0Cl3p?=
 =?us-ascii?Q?w8N4Tc3wzAxUdPlc5VInyl1FqCfo0jrSZU98lSYZWBsFZz4yQlEjCDZrptFy?=
 =?us-ascii?Q?Wmh6jINUGGo69S5eUkB13rHHGyMmujgAeHIG1UC0NEBpqP8Y1YFmB5+EyRPv?=
 =?us-ascii?Q?1PuIaXco+rxoIdkdFBD5qKe23P4GzX6f/v6QtOrbFgiQkKdSZRALiJxWV2cF?=
 =?us-ascii?Q?5rRlOknaaD+lntAGartik4uWtnRMN7tgMZOYktFcIYrBNCrDi6T4EEYDEyqs?=
 =?us-ascii?Q?6dCWEbL93hVqslufI60LkxbzzvQBH7ANTvN2eWiSaaxHCB5B2Bz19ms=3D?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR08CU001.outbound.protection.outlook.com;PTR:mail-sj0pr08cu00101.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(704162111799003)(1800799024)(376014)(7416014)(14060799003)(35042699022)(36860700016)(82310400026)(156008)(13003099007)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	w5Dl3amvpy/karG7QPIgn0SDd3oIgyp8U0DbJgIEOkHT4tgfX40xoNW3gV0XyYrMOHRUOCKjn3bpxG9DhKG7Kc3HOxRXv8EKzoaQZYnIi+Iiz49840ZZUlA9TXaU1BLZHYc9Shzw/AdNpxGwwDU755bU+s2PE/8Y3Vyc/cSMI8ZHl1zGEOHdIiAV/msNGhriIdjK6ls38G3caddwLN++NJSW6UhsgbSKRCXRfwWvKjPrEHDOGcCnKtjpUHILyMjQ5Rba11pxwAkeO4g7ywwirvnU6KRq80DctBj6mSADKl+H+OqVyzZ75PWBuqPVjOrp2TLK4QSRN6HtBF8h9fGTHz3A6xUFbaxOGvIJjxRn8WbTpW6wQk4K/GyG6ueLjAguY/0geTmAn0X4Q9fg5i4Ap40E7cx9dKCB4+0sy4ed/TRJsBPgWnnzOM4Aul7YuCWO
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:11:25.7094
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7321a47b-d8a7-4ff4-3fa4-08de9f2161ff
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00001507.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR08MB9112
X-purgate-ID: tlsNG-c1860d/1776719500-3A577DB1-B783FF80/0/0
X-purgate-type: clean
X-purgate-size: 9546
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[elektrobit.com,quarantine];
	R_DKIM_ALLOW(-0.20)[elektrobit.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:teddy.astie@vates.tech,m:tamas@tklengyel.com,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:dpsmith@apertussolutions.com,m:rahul.singh@arm.com,m:julien.grall@arm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[17];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[elektrobit.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[0.038];
	HAS_XOIP(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url]
X-Rspamd-Queue-Id: E1223433EA2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi all,

For the past few months, myself and Aqib Javid have been working to port
altp2m to ARM with support from Stewart Hildebrand and Stefano Stabellini.
At the recent Spring Xen Summit, Aqib and Stewart gave a presentation which
discussed the motivation behind this, along with an overview of the
rebasing and testing process. While this effort started as a rebase[1] of
the v5 patch series[2] by Sergej Proskurin and Tamas Lengyel, I have been
reworking the branch to make most of the altp2m code common between x86 and
ARM. This should address the major concerns that came up during review of
the original patch series. For a quick overview of altp2m functionality and
scope of the patch series, here's an excerpt from Sergej's cover letter:

> In this patch series, we provide an implementation of the altp2m
> subsystem for ARM. Our implementation is based on the altp2m subsystem for
> x86, providing additional --alternate-- views on the guest's physical
> memory by means of the ARM 2nd stage translation mechanism. The patches
> introduce new HVMOPs and extend the p2m subsystem. [...] To be more
> precise, altp2m allows to create and switch to additional p2m views (i.e.
> gfn to mfn mappings). These views can be manipulated and activated as will
> through the provided HVMOPs. In this way, the active guest instance in
> question can seamlessly proceed execution without noticing that anything
> has changed.

As of right now, I've reworked patch series up through the
HVMOP_altp2m_set_domain_state command and plan to continue implementing the
remaining altp2m features. I've continued the patch series versioning by
labeling my notes as v6, and the patch notes from v1-v5 have been preserved
where applicable. I am hoping for some feedback on the general approach
I've taken with this patch series, and I can incorporate any changes
requested into the actual patch series submission.

This is a pretty big patch series, so I've tried to make it as easy as
possible to follow. I've tried to minimize the number of changes in each
patch; there are quite a lot of patches so if it would be preferred to
combine some patches I can do so. Here is the general approach I used
throughout the patch series to turn x86 altp2m code into common altp2m
code with ARM support:

- Move function(s) from arch/x86/mm/altp2m.c to common/altp2m.c, gating
  declarations/definitions with #ifdef CONFIG_X86
- Add any additional features to ARM code needed to implement these
  functions
- Make any changes necessary to functions to support ARM, and remove #ifdef
  CONFIG_X86

This approach makes it possible to separate out code movement patches from
the actual changes needed to support ARM. Furthermore, each patch in the
patch series still compiles for both x86 and ARM.

Additionally, I've split the patch series into a number of "phases" to make
it easier to understand the context of each patch. Each patch description
indicates which phase it's a part of.
- Preparation (8 commits)
- Common do_altp2m_op (2 commits)
- get_domain_state (1 commit)
- altp2m_{init,teardown} routines (12 commits)
- altp2m_{get,set}_altp2m (4 commits)
  - Needed for altp2m_vcpu_{initialise,destroy}
- altp2m_vcpu_{initialise,destroy} (2 commits)
  - Needed for HVMOP_set_domain_state
- altp2m view visibility (5 commits)
  - Needed for altp2m_init_by_id, altp2m_flush
- altp2m_activate_altp2m (2 commits)
  - Needed for altp2m_init_by_id
- altp2m_init_by_id (2 commits)
  - Needed for HVMOP_altp2m_set_domain_state
- altp2m_reset_altp2m (2 commits)
  - Needed for altp2m_flush
- altp2m_flush (2 commits)
  - Needed for HVMOP_altp2m_set_domain_state
- set_domain_state (1 commit)

The code for this patch series can also be found on GitLab:
https://gitlab.com/xen-project/people/elektrobit/xen/-/tree/altp2m-arm-rework-rfc

Best,
Rose Spangler

[1] Rebase of original patch series:
https://gitlab.com/xen-project/people/elektrobit/xen/-/commits/altp2m-arm-rebase

[2] Original patch series:
v1: https://lore.kernel.org/xen-devel/20160704114605.10086-1-proskurin@sec.in.tum.de/
v2: https://lore.kernel.org/xen-devel/20160801171028.11615-1-proskurin@sec.in.tum.de/
v3: https://lore.kernel.org/xen-devel/20160816221714.22041-1-proskurin@sec.in.tum.de/
v4: https://lore.kernel.org/xen-devel/20170830183258.14612-1-proskurin@sec.in.tum.de/
v5 was never submitted to mailing list, but is available on GitHub:
https://github.com/sergej-proskurin/xen/tree/arm-altp2m-v5

(Resend due to threading issues in first send attempt)

Rose Spangler (38):
  altp2m: Add template common altp2m.c/altp2m.h
  altp2m: Move altp2m_active to common domain struct
  altp2m: Move altp2m_p2m to common domain struct
  x86/altp2m: Rename hvm_altp2m_supported to altp2m_supported
  altp2m: Move altp2m_supported to arch header
  arm/altp2m: Add template arch-specific altp2m.c/altp2m.h
  arm/altp2m: Introduce CONFIG_ALTP2M Kconfig option
  altp2m: Rename p2m_*_altp2m functions and move declarations out of
    p2m.h
  altp2m: Move do_altp2m_op to common code
  altp2m: Add ARM support to do_altp2m_op
  arm/altp2m: Add support for HVMOP_altp2m_get_domain_state
  x86/p2m: Move p2m_{init,free}_one declarations to arch header
  x86/altp2m: Add lock functions accessible from common code
  altp2m: Move altp2m_{init,teardown} to common code
  arm/p2m: Allocate hostp2m with xzalloc
  arm/p2m: Move hostp2m init/teardown to individual functions
  arm/p2m: Invalidate root page table entries and flush TLB in
    p2m_flush_table
  arm/altp2m: Add support for altp2m init/teardown routines
  altp2m: Move altp2m_{get,set}_altp2m to common code
  arm/altp2m: Add altp2m index to arch_vcpu
  altp2m: Add altp2m_set_vcpu_idx
  arm/altp2m: Add support for altp2m_{get,set}_altp2m
  altp2m: Move altp2m_vcpu_{initialise,destroy} to common code
  arm/altp2m: Add support for altp2m_vcpu_{initialise,destroy}
  arm/altp2m: Add altp2m view validity/visibility indicator
  altp2m: Add altp2m_view_is_{valid,visible}
  x86/altp2m: Add altp2m_set_view_visibility_locked
  arm/altp2m: Add altp2m_set_view_visibility{,_locked} support
  arm/altp2m: Add support for HVMOP_altp2m_set_visibility
  x86/altp2m: Add altp2m_activate_altp2m declaration to arch header
  arm/altp2m: Add support for altp2m_activate_altp2m
  altp2m: Move altp2m_init_by_id to common code
  arm/altp2m: Add support for altp2m_init_by_id
  x86/altp2m: Add altp2m_reset_altp2m declaration to arch header
  arm/altp2m: Add altp2m_reset_altp2m routine
  altp2m: Move altp2m_flush to common code
  arm/altp2m: Add support for altp2m_flush
  arm/p2m: Add support for HVMOP_altp2m_set_domain_state

Sergej Proskurin (5):
  arm/p2m: Cosmetic fix - substitute _gfn(ULONG_MAX) for INVALID_GFN
  arm/p2m: Change function prototype of p2m_alloc_table
  arm/p2m: Rename parameter in p2m_alloc_vmid
  arm/p2m: Change func prototype and impl of p2m_{alloc,free}_vmid
  arm/p2m: Introduce p2m_is_{hostp2m,altp2m}

 xen/arch/arm/Kconfig                     |  11 +
 xen/arch/arm/Makefile                    |   1 +
 xen/arch/arm/altp2m.c                    | 122 +++++
 xen/arch/arm/domain.c                    |   2 +-
 xen/arch/arm/hvm.c                       |   9 +
 xen/arch/arm/include/asm/Makefile        |   1 -
 xen/arch/arm/include/asm/altp2m.h        |  84 ++++
 xen/arch/arm/include/asm/domain.h        |  19 +-
 xen/arch/arm/include/asm/p2m.h           |  41 +-
 xen/arch/arm/mm.c                        |   2 +-
 xen/arch/arm/mmu/p2m.c                   | 162 ++++++-
 xen/arch/arm/p2m.c                       |  31 +-
 xen/arch/arm/traps.c                     |   2 +-
 xen/arch/x86/domain.c                    |   3 +-
 xen/arch/x86/hvm/emulate.c               |   1 +
 xen/arch/x86/hvm/hvm.c                   | 413 +----------------
 xen/arch/x86/hvm/monitor.c               |   3 +-
 xen/arch/x86/hvm/vmx/vmx.c               |   9 +-
 xen/arch/x86/include/asm/altp2m.h        | 115 ++++-
 xen/arch/x86/include/asm/domain.h        |   5 -
 xen/arch/x86/include/asm/hvm/hvm.h       |  11 -
 xen/arch/x86/include/asm/p2m.h           | 112 +----
 xen/arch/x86/mm/altp2m.c                 | 242 +++-------
 xen/arch/x86/mm/hap/hap.c                |  17 +-
 xen/arch/x86/mm/mem_access.c             |  22 +-
 xen/arch/x86/mm/mem_sharing.c            |   3 +-
 xen/arch/x86/mm/p2m-basic.c              |   7 +-
 xen/arch/x86/mm/p2m-ept.c                |  13 +-
 xen/arch/x86/mm/p2m-pt.c                 |   1 +
 xen/arch/x86/mm/p2m.c                    |   9 +-
 xen/arch/x86/mm/p2m.h                    |   6 -
 xen/common/Makefile                      |   1 +
 xen/common/altp2m.c                      | 551 +++++++++++++++++++++++
 xen/common/monitor.c                     |   1 +
 xen/common/vm_event.c                    |   2 +-
 xen/drivers/passthrough/arm/ipmmu-vmsa.c |   2 +-
 xen/drivers/passthrough/arm/smmu-v3.c    |   2 +-
 xen/drivers/passthrough/arm/smmu.c       |   2 +-
 xen/include/asm-generic/altp2m.h         |   5 +-
 xen/include/xen/altp2m.h                 |  98 ++++
 xen/include/xen/p2m-common.h             |   2 +-
 xen/include/xen/sched.h                  |   3 +
 42 files changed, 1330 insertions(+), 818 deletions(-)
 create mode 100644 xen/arch/arm/altp2m.c
 create mode 100644 xen/arch/arm/include/asm/altp2m.h
 create mode 100644 xen/common/altp2m.c
 create mode 100644 xen/include/xen/altp2m.h

-- 
2.34.1


