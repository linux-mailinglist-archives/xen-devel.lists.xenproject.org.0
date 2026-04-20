Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DSyHLKb5ml8ywEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09562434289
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287824.1568277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwFE-0004ot-95; Mon, 20 Apr 2026 21:33:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287824.1568277; Mon, 20 Apr 2026 21:33:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwFD-0004Ww-7L; Mon, 20 Apr 2026 21:33:27 +0000
Received: by outflank-mailman (input) for mailman id 1287824;
 Mon, 20 Apr 2026 21:33:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEwF6-0003FU-BN
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:33:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEwF5-00EgCp-OK
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:33:19 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b92-e002-0a2a0a5209dd-0a2a45038228-8
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:19 +0200
Received: from [52.101.46.86]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b9d-672d-0a2a45030019-34652e563b1b-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:19 +0200
Received: from SJ0PR05CA0074.namprd05.prod.outlook.com (2603:10b6:a03:332::19)
 by MN2PR08MB6382.namprd08.prod.outlook.com (2603:10b6:208:1b0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 20 Apr
 2026 21:33:11 +0000
Received: from SJ1PEPF00001CDE.namprd05.prod.outlook.com
 (2603:10b6:a03:332:cafe::c6) by SJ0PR05CA0074.outlook.office365.com
 (2603:10b6:a03:332::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:11 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 SJ1PEPF00001CDE.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:33:11 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzzHV6dCGz1wdS; 
 Mon, 20 Apr 2026 14:33:10 -0700 (PDT)
Received: from BN1PR07CU003.outbound.protection.outlook.com
 (mail-bn1pr07cu00306.outbound.protection.outlook.com [40.93.12.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:33:10 -0700 (PDT)
Received: from BY1P220CA0041.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59e::13)
 by DS0PR08MB9502.namprd08.prod.outlook.com (2603:10b6:8:1a9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Mon, 20 Apr
 2026 21:32:58 +0000
Received: from SJ1PEPF000026C8.namprd04.prod.outlook.com
 (2603:10b6:a03:59e:cafe::26) by BY1P220CA0041.outlook.office365.com
 (2603:10b6:a03:59e::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:32:56 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 SJ1PEPF000026C8.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:32:56 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:32:50 +0200
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
 b=P1ugP5wTF1I++lHRFLT1nDrWAKhPpQlywHiXA2ADegIxozZs2Z4l8ZrCy9DkNzGq/6bIdjhL7Qvt5LIbo/GzjjlAVMnb+jAlGvdOXtmc3rG6ZBbdoXGFt4zCCihUeikpuH6PFlvnbyIzseNgVz005F/dWhV9gLapuHxzn+RSBj1m/uqWsqI9yWgmueXY+ebcFk13+sJ8B5Q6NejHGaARHIvd1y6dVI16u6IS9H966JtAQdB946dpcbsf8/1Pac5qba3owJIzolPBSYUCuiUUU8rfX6nfbaLx1MULJXPO3IiUEfmQyEuWRilM/HAMR57dLSbXZS4IryAn1f4CzSvXZA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yIbI7Z0q3lXJU+nOYvRW36Lh6wKWhfwhF7qmIzuTXnQ=;
 b=xW3gE52Fy1wNzbuPUXQETEVupAjA+j7BtSw4wmZbA49NccGwyYgPDxjHftwSeGg8JhlmKAdwVSKNq2xTVMocSJcsZUeW8Lb8P73yMCDSJOFWf3IeFZ1rP4v6BzKrjJij29/Vu8OnH0ckJUPGK8uOwfV5+YVyFqF3ibAV2cZW8Ztre78+rss1/gW9pMcJ3aqCKyPYZiFjtVXWRC/dC2svIDmbnigpEGMSn6x2yo4yAozSB7tuH5WyROl/H2hTh4WWchdjV58useyEzuZhGJhXgEb8EEctQu6LYgKI6qWf3+Fbiie1qp8K68YIlngJubfNzeivyjuJjRzNx35ciASkvg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.12.6) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yIbI7Z0q3lXJU+nOYvRW36Lh6wKWhfwhF7qmIzuTXnQ=;
 b=IqQU2Xy4RGJOW/2cWL56D1KRboAls7KEstEYqI0lxeIDgWDnxuI/PRcFWTRamxe2pZ75WGYymKdhYREHbFtRLKVzcNcCjJtr68BT7c9UUZyIBF/AXxv3/zpNCOMk3mVC+WyfO+6eToU/EuWFHEBX4RU51ypls47tmMXx3r3Itkk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.12.6)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.12.6 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.12.6; helo=BN1PR07CU003.outbound.protection.outlook.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NjrZ2AYhu0C3EvvjAFZY7XkP3D+gU0c6et5k3ZTAKTKBDI3wAdBacVAoKqXY2z6BjOi8Bjih5RBIP45HyGQkOv1XPeslWBmZ54ddp+byE94e1ivoBio7JTSDuDBLvyvrI4Cv8IfweMNRa70aytz2zszE5s1NEsSZOJ6wIvwDDdLLuievAMuFrw/UrRh79pT958txjz6avCtSWjkJGPFcU/djEbFN3qFBvPJ8ZenZCSKOwgZFX19HymY/tR7R/cmu3T7lnPSFU55lCOWZBEGO/mUjeaqigmMxd4Fwe+4H/CGQyi1o4ZsHTn7F+j/CHgOJ5XYo1N6nY1pPW4Rrt8HooA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yIbI7Z0q3lXJU+nOYvRW36Lh6wKWhfwhF7qmIzuTXnQ=;
 b=xKJ5ywLen3SwY3i+Tszdyobo95F2p5SIYqNufmLw3G0ZiXTq3vJqYVQgGIkwZqze1DG2s4gfrzXPV7v6nSHQSDuVEFfzekb0rfU4S0kTnxn+8RgYHwLZ8tMazejUUIi2FIDZcnj/o9JULv9VICiy54a+s+DfI6xrhe1DvEPVHqLX7990yMiyJ/V/nAw5ZEGcEzI70OcvWkPY4QeX/yMAPoI0qm3TOLOg/XSoLKw9oO0bcYWU4oi1RCusP8cMKG4BWG3xrdhctfv+j3mdkrf3mTP9ZKPiwa2up3kprgQudhYoAmh3DSu6Ggq3KUpBjc1AfyiCx5VUl6uCVHnWLMh+5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yIbI7Z0q3lXJU+nOYvRW36Lh6wKWhfwhF7qmIzuTXnQ=;
 b=IqQU2Xy4RGJOW/2cWL56D1KRboAls7KEstEYqI0lxeIDgWDnxuI/PRcFWTRamxe2pZ75WGYymKdhYREHbFtRLKVzcNcCjJtr68BT7c9UUZyIBF/AXxv3/zpNCOMk3mVC+WyfO+6eToU/EuWFHEBX4RU51ypls47tmMXx3r3Itkk=
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
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH v6 16/43] arm/p2m: Cosmetic fix - substitute _gfn(ULONG_MAX) for INVALID_GFN
Date: Mon, 20 Apr 2026 17:31:39 -0400
Message-ID: <20260420213206.208750-17-Rose.Spangler@elektrobit.com>
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
	SJ1PEPF000026C8:EE_|DS0PR08MB9502:EE_|SJ1PEPF00001CDE:EE_|MN2PR08MB6382:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dab8fd8-aafc-4d97-beba-08de9f246c3f
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?byG3xknpIu7vFLqINkVc9Tr1+dpyo+tM9wHvSOLqgPhbm8A0HKXBUHVa+RV5?=
 =?us-ascii?Q?stAEyMHqWJBbZyfuFu6ang9HOVqT7AHnaaaHJmHB2MMgIwKVJAOHayprhakb?=
 =?us-ascii?Q?B8RtkLUW3HdU3VeI86ZMZsGAy/l0syUi7NakuhE4CaBM3HI9m2vovjhQE4Mq?=
 =?us-ascii?Q?5qTqhyyB7TW4qxr/SA4I2OTFNug8hgvyd1POa1OhBptJPW03F3F1grggC6sm?=
 =?us-ascii?Q?HQSGP9R059McYMZJZiY6G60CW2c7BUbLndBTphXybe7rvihfydXXJbbTPOJU?=
 =?us-ascii?Q?kAdpgPnkksmFTmJ4L9tfyFM7wdRBuiJUW38Ccu2cNUS75dqmfwYD8VZGxq+L?=
 =?us-ascii?Q?aispAXriWvM1TcaEaXVjwx4/vG+e7IFyKs6bD3fb2NLUkVsJ04Gh2zvFfpOx?=
 =?us-ascii?Q?KnMEHLcu6K5RcTTFK/6SO0ECYxgRuFQorZ3afwajA4M8lLNCo1UIvsIfdnjB?=
 =?us-ascii?Q?R/lF+U9HZgUPdaNAyn7UyacCojOnR6PYCpGu+aDRXNiclMA6kz2JQWqcKwZd?=
 =?us-ascii?Q?L/kGAJI3EK/TsWvXYSZkSzqpc1MBgX2E2I6XB8/P8SjVTsYtvsgxEyiw5p1t?=
 =?us-ascii?Q?5+t895pGuQV5xKOL7AcnYJbL5WH7KdXODUIzllYzYoFhCF+WZb5plBRedM0T?=
 =?us-ascii?Q?bNwq2RVLB00OiPSpzqRCqkm/yKVGRz734f6VciZu5xPfYYpnWtD9rS1ob2hR?=
 =?us-ascii?Q?gEhtwJ8cq1mQPs1PnzIbtXB/l9LuMY5eANBWw7UNB3ruCy1WYGb2CqFzMlKL?=
 =?us-ascii?Q?moMOvTtlcySeCMRzVd26UUcBKvCg/54D2gy4ZGpBIJUEMSFhhRCCXMuw0a8W?=
 =?us-ascii?Q?Xh+cpBOhp1ulWdqr2FzQe3ST2JNZY/niLDCzMOk+0FawvP2JmtKB2Jklsp/9?=
 =?us-ascii?Q?swuSLtelX19w0E8AcIIO12KhPrqWcuzjnRu2/9CK5Pqh9XnaJB1R79u8uWvQ?=
 =?us-ascii?Q?9n4su8qrAuJ7fZbXb1/xt+7WcbFRAQMjpW2khgQcsUcjPxbhoMcZwYaKxywP?=
 =?us-ascii?Q?gryY5RWoT99OpCxCTlqxaNJECYSa9na8u+rJw+tJ74YkwhWuZrPAqGhGx1m9?=
 =?us-ascii?Q?kEP8BMIhrtXRxWZJcyTC1Lz2MkzmGw5GeVnpwyz3KD3v1bTyBn8bqk/j4OWU?=
 =?us-ascii?Q?rzVnM6V0aqx2s3MG3faET1k+mEiNFA0c5pTh3n9pOvAACZ8o/AjnQYpLQIaL?=
 =?us-ascii?Q?r2qGfc2HELPAD2q/fszKnpKWkAegVOBiKPnUnHxu5cxo0Ts5WaQJB6utH+t8?=
 =?us-ascii?Q?CxOCjaCmGadeL+o3EO75?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 qH5TwHcfg+IvAXR1lW0v+gy0r4sLehl05UlAc9BASS2Xyd8g40fCWELYduTQxgPr0vQT/KyzX4JmIK7hAt6Twtf2XgUFHjL3b8DW7Gykrhy0sP3PEdaUmju4zJEEDNsmr63qqXB8Y95wLmebLZPOwccMGRwFV9EUh4u0loMJxjLiEyVV1jJXRWCB8eJYQawpjG43XjXGXQ6G1cxCxsLnEuOElXBsChUOsIfVVnO46gkp6w2LjsczzTVTKG5xDP0uJhXiyNYHm7MLMFkQEZg5bc+6b86r1sxtqLWLukjtSSVfKB5Om+3LQI2hpmUQkTEWdJPaLi3hnA5SIafgTFth2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR08MB9502
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.12.6];domain=BN1PR07CU003.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.12.6];domain=BN1PR07CU003.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 SJ1PEPF00001CDE.namprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4a584e27-62bc-485a-2c0c-08de9f246363
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|156008|35042699022|14060799003|82310400026|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?u31U192glPcSoWr0r14UgvBiRi25Rl46Mjpw0v1S60G3+9b4aXy7Dp5YNUEK?=
 =?us-ascii?Q?EOHq7aRa8zfCGyyn8ySntrzO3KqJLn9dORbIqsw/EM2ymURlyLcLhYUsbqS6?=
 =?us-ascii?Q?c4BtZYpcThOqNQ0TbWlrliIMkomJPV6GxzeBXkrQevFceCJP5MQDwSGWiId/?=
 =?us-ascii?Q?jrqO2/Om0kZRkm01QPyYU6vT1wTV5EEaW4cOB47v2aH/Wd/t0rgfttD1aTXF?=
 =?us-ascii?Q?lD3WGm1muUi+kPhSP3OBNU3t4bQT8+KIxkKGVx05bO5/BYrSmHiputxZJEqL?=
 =?us-ascii?Q?eco8S2PnQu2Yt/E9R0jnyp0CTmvaDCF8JBnqhlxiwxNEYdXNXpHhVyUGQ0oF?=
 =?us-ascii?Q?/g8fkt5YtHrdl+IJlmU0bl+m9pcWFcoWKxjpPg+oGvXvR4h4jOa1p2IeQp9s?=
 =?us-ascii?Q?DRcnZ2KtVadsRI7f17fnNXjt4ThFCTsiHU1w0usc1rsrWK6AjtWhJiqVKIsY?=
 =?us-ascii?Q?a+XTmrZkcgSyJA3rfAysX8AAAUS7eqienVQY4bL3NzLqMMka4QAwU2oHHQlW?=
 =?us-ascii?Q?4huLqU4qRHGGUBEA0K9ZYjG2P8hj6oYK66xIbENr2mPOTZ6HC3AY328yTvU6?=
 =?us-ascii?Q?lFGmi7HP9UNH+GZKs+UJ9WcRp9OlGYakVTD9Fh4yMgnGruiXhuJMmDrlvHET?=
 =?us-ascii?Q?ioFHLYgVyQGJTs3+LpSm3pMFdI/0vI3YhXEPhTCKi268BnD7P8IqDXqTIaMA?=
 =?us-ascii?Q?r0z8gpdeESfN48n82qS7kTj2KO6KKWvTeY3MdvcDaJ0NnxiDSzdx0JVaQfXk?=
 =?us-ascii?Q?dIJCsO8t0Ud8seKHMmGPApzJ/lkTFNUBUd5yLSIR+79uOXF/KRMOCpNPihfu?=
 =?us-ascii?Q?9NB+zL1147YMmfdo/31DPKR3OmV2aODj0LLp8OtPcyloX09Al7C15vHwQruS?=
 =?us-ascii?Q?oKBClcAHdJV/zAZYv88TlDqvRvUvweo/urbT5yXB32ujiCswPRrvgY8m67Qk?=
 =?us-ascii?Q?IBWqHACfH0CF7JWBj1KbgykXrCsrvDys02q10VQDiTWQUaI0Vos0P3mHci/V?=
 =?us-ascii?Q?PqVOKkJGhjnhGbqKjEcvwybhwL91+4K4XnJnMRD7sPHyX5L+X6c/JtBHzkkX?=
 =?us-ascii?Q?+1i+2UBq+NPqSBBGS4XtDKus4LJNKrelERX1DbrTku3CXfEXaBvXALot0/Lm?=
 =?us-ascii?Q?PkjoJB8jxjaOiSKPS+bkrFK78q30LYNHkFHXnCQDl7TMwsKZfl404LaedkDc?=
 =?us-ascii?Q?+bZQo7S+YXzY9ZU1RtC6QRKsdWyt4mUaac55eHYkDCddTpUOlu1ZTtMjtCkU?=
 =?us-ascii?Q?lysHzvQAq4r+syTTDvN/?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN1PR07CU003.outbound.protection.outlook.com;PTR:mail-bn1pr07cu00306.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(156008)(35042699022)(14060799003)(82310400026)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	G19aiybS5qTlN6jNTwFEtE/gDynFwRnTfEnU5kVi4vcY/HovihddFd6mP7nTC2tfRfjEkabhijCnFzR1tRIeqF6YuxbsiW5JIMKguoPegAP0+mf9RZMpcmTbwmrDxePK9RTkFkSKE0IU5Sw7wZf9t6ftW+kMpOp/tmYVePhQm91/YgTfaNqpZE8UHsmDNu2Pw+snwEsfpXjuN6XW2k4ftQcfMU4iFp94oK74yCKlAqLLAAKCRcx5Mtl9NevDMHvLch+/xjA1iw0VcCM5dYvq7RYXCoUeMxtu7Wp1AUQrjzcvval82nwpDA7PfA0eKeBt+Q41OaoFyCIuRZdYynS8AqQFeryvw7EDfMGNzmK0hAKuUnI+bfKH0U+UifjxS6k4rijyCOvjQuYtolLufxiqesjDnodLHWFAufb/lFEwlBXuseB5RSN4Uw1UOR+rlXXu
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:33:11.4409
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dab8fd8-aafc-4d97-beba-08de9f246c3f
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00001CDE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR08MB6382
X-purgate-ID: tlsNG-33051d/1776720799-28577938-0AED14B5/0/0
X-purgate-type: clean
X-purgate-size: 999
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:proskurin@sec.in.tum.de,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.347];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 09562434289
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Sergej Proskurin <proskurin@sec.in.tum.de>

In ./xen/arch/arm/p2m.c, we compare the gfn's with INVALID_GFN
throughout the code. Thus it makes sense to use the macro INVALID_GFN
instead of a hard coded value to initialize "p2m->lowest_mapped_gfn".

This is commit 5/12 of the altp2m_init/altp2m_teardown routines phase.

Signed-off-by: Sergej Proskurin <proskurin@sec.in.tum.de>
---
 xen/arch/arm/mmu/p2m.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index 3ecb969a0369..1009f10e5db4 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -1517,7 +1517,7 @@ static int p2m_initialise(struct domain *d, struct p2m_domain *p2m)
 
     p2m->vmid = INVALID_VMID;
     p2m->max_mapped_gfn = _gfn(0);
-    p2m->lowest_mapped_gfn = _gfn(ULONG_MAX);
+    p2m->lowest_mapped_gfn = INVALID_GFN;
 
     p2m->default_access = p2m_access_rwx;
     p2m->mem_access_enabled = false;
-- 
2.34.1


