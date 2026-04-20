Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFzFDc2b5mnCygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:34:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C46D44342E3
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:34:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287912.1568371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwFg-0001d7-9X; Mon, 20 Apr 2026 21:33:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287912.1568371; Mon, 20 Apr 2026 21:33:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwFf-0001Es-1X; Mon, 20 Apr 2026 21:33:55 +0000
Received: by outflank-mailman (input) for mailman id 1287912;
 Mon, 20 Apr 2026 21:33:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEwFS-0007ki-Uv
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:33:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEwFS-00EgCp-A0
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:33:42 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b1f-e002-0a2a0a5209dd-0a2a45058304-48
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:42 +0200
Received: from [40.93.201.107]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69bb4-aaa8-0a2a45050019-285dc96b9428-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:42 +0200
Received: from SA9PR13CA0177.namprd13.prod.outlook.com (2603:10b6:806:28::32)
 by PH0PR08MB10977.namprd08.prod.outlook.com (2603:10b6:510:386::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.30; Mon, 20 Apr
 2026 21:33:36 +0000
Received: from SN1PEPF00036F43.namprd05.prod.outlook.com
 (2603:10b6:806:28:cafe::d6) by SA9PR13CA0177.outlook.office365.com
 (2603:10b6:806:28::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:35 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 SN1PEPF00036F43.mail.protection.outlook.com (10.167.248.27) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:33:35 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzzHy6KrSz1wdS; 
 Mon, 20 Apr 2026 14:33:34 -0700 (PDT)
Received: from CH4PR07CU001.outbound.protection.outlook.com
 (mail-ch4pr07cu00106.outbound.protection.outlook.com [40.93.20.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:33:34 -0700 (PDT)
Received: from BY1P220CA0022.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::14)
 by SN7PR08MB8567.namprd08.prod.outlook.com (2603:10b6:806:2df::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:33:29 +0000
Received: from SJ1PEPF000026C9.namprd04.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::5c) by BY1P220CA0022.outlook.office365.com
 (2603:10b6:a03:5c3::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:29 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 SJ1PEPF000026C9.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:33:29 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:33:24 +0200
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
 b=Ljlm4EOKSp3cm5SZ/LDxSZnszcH6gQ0HmAyddQCrs9gAom86BBAeFpWO0zfDExQxQy4loLUWDMi7e9PcdMCOgO1a+pifhvT9EUYPcA08W2davzoYxxxZqU8AyUBM7vFhE7TdArd+BxC47suLrH+pv76oeTqrfj5J3Eyox4k87SBkbVjzcy0sKbD8sQulkjNfwf+gmAilex3Ud9Hlyexafo8VRjPfOh5Ho0QFnxz+/VlyQoX9klRAvm1RZ6V6vru5bYmkblEbFRpClUEUyh9y6EjfElnxDbiO371zCgzs12pkpZfhJLVwA5i4XX5mxQwH7Vs4zE+zeDlNfPgQ7CJmXw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DZVQd2YS2Dc072OkbjYDsSwvSmp2EL0f2N2Sbux/YCg=;
 b=i4L21idI0hr2NGqfQmDBrWdKBFLvn1Dh2iTGl6X2ilN/TAsmBZhXTPLXaI6HNsy0n/xA7qjQ+5PTO7gl07TX46px8tL4Sn+MrxpEyQ51gUyNSjILkIJYiXCe7/Q9IGyRLqTsNWa7E0PNPtoCl6SWUTgHaOQkWn8evImfI2/TIPNAelGOklVf1FQwNJwv1DOt5Y3o9TR3aVKmEjh3oaEQEckSYjA1nf+XeizGQk+7i58bIoUU4H5puAOJbVflamb4bGryaoJrjaEb8IB7kMV8frlY0E9igtMc4wgdsN3kXE7YDQF3a06fI47ZwrU/29tTeWj5nKm7aNx8YBICGtPxcQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.20.102) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DZVQd2YS2Dc072OkbjYDsSwvSmp2EL0f2N2Sbux/YCg=;
 b=Iu88YjuAAjpjYXAf3GQqXUfa8Res77rgz/hiFPROKkZwWyXrP4TuHzVefAoNipDLXd61lVKirsdi8A814BHkfFLHfONXREG3oH9nQ9furbPEQGaPzQAW0t5Nj0zWHi4yUZhlhZ7xEPdSf7QnuO7lE+EN6FFeh1SN8eh5zBI3fjU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.20.102)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.20.102 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.20.102; helo=CH4PR07CU001.outbound.protection.outlook.com;
 pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G3kS4OWo3p8fTIR0139thXroFifVHuZqb36sJyOhMyfW8dlsdKhtU6XiM/potRkwd9fkUv9N0nSmVVh7jNiAXnJqOabvF4lkKpo8JP93uQijwtaAfkTkAP320c4nP3PAqgFs++/gPMrcurb8J3yrih8okouTYe8z+9XtxVaOhQQGGW4n5VXjCSOTlSOg3A3vJU2ubs5gEhKKzfWZRXCSYCTizI+CY7Yq0/u9YfnBaO7gH9+uWTiLqkczMjmhT/lAhnq+2z0YU4EI71Id3Gp/QrYvLejeHOpu9zf9hBjqYDpOATRQWF0pBg3RXfhHFQ34G7v3AkG/C4r2YKfHwjtDPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DZVQd2YS2Dc072OkbjYDsSwvSmp2EL0f2N2Sbux/YCg=;
 b=vqDebuhy54vfnb3FugiQZiBdkLg5jIs3OaZaF3Yjj5ACnQhpdV43wqvFRHxCEU1F/pFBuzQAFgHKw2IyoLH/JdoCl3ugDTPZQ1MOpbqlf4XAEZmLp7U5gxasU/pcKiu2nUDzyhVaI/331xTt4jmed0Q+hLY0S3Eet13UgRxIJpOtXtqHPxlvLG4fXSeJlPL5XjrZQuohJyqSvZEZRUs07ISICTr/nPl5cNAftCyTVyNZ/lc14pQ6CWXI50IP1g74NaEU0bxh4xeBwKakx9OuT+N8GoxywwAfilEfoUlaLRfryGJt3FlfRUl7v5D5WbIczyyw3c+rHLQI2KYfNyS2LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DZVQd2YS2Dc072OkbjYDsSwvSmp2EL0f2N2Sbux/YCg=;
 b=Iu88YjuAAjpjYXAf3GQqXUfa8Res77rgz/hiFPROKkZwWyXrP4TuHzVefAoNipDLXd61lVKirsdi8A814BHkfFLHfONXREG3oH9nQ9furbPEQGaPzQAW0t5Nj0zWHi4yUZhlhZ7xEPdSf7QnuO7lE+EN6FFeh1SN8eh5zBI3fjU=
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
Subject: [RFC PATCH v6 37/43] altp2m: Move altp2m_init_by_id to common code
Date: Mon, 20 Apr 2026 17:32:00 -0400
Message-ID: <20260420213206.208750-38-Rose.Spangler@elektrobit.com>
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
	SJ1PEPF000026C9:EE_|SN7PR08MB8567:EE_|SN1PEPF00036F43:EE_|PH0PR08MB10977:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a37290f-1653-4e7c-8514-08de9f247ab5
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?hP7URVA0guEQCAc7FnuLxFh9+3PBy7k7ZVfc2rX9DEyDmvKGDAJt3ZyrvaZp?=
 =?us-ascii?Q?V4woWnp6R+ErPEbPhQ+JuQfMEX17Wayx5svwXkIY3SdOnCgla2z4oK7wVD1I?=
 =?us-ascii?Q?03CMblZnhJwvi32e6Nj4y/yOQ14JZ1YfAHUfAIt6/Cs9excU0nkwhJarkC1C?=
 =?us-ascii?Q?rO2H4tRrveS2dF/Sf1lGc+V9ajAxy8y+tDS3ChmyDL/dAxPdr2g1UJ4Y4DGv?=
 =?us-ascii?Q?sPSwU39yH/ke1y9qgXge5Gb5m/t0C4ubPK/JKe0F4/44AjD2h7x/sxa466VV?=
 =?us-ascii?Q?7B28uKgFFa1RvvW7cvc8TfbrflYpG0WizGG87XNcKT7bC1bd8W8N32TElZpz?=
 =?us-ascii?Q?ZJQcmugpDxM2jX64PscuvQCTYExw8UtQFth7r/JnYEat6UplMOtEFOC4BRnz?=
 =?us-ascii?Q?svQXrF8O0yAEFuIQY6RNE1zL+jix+d0X70p+U0oW908VgiZm36YK+aclzKuP?=
 =?us-ascii?Q?ZAPrvEkzWWAA8qRe4d1g2wfFNBXAh9txEf4kOx2L8bRGHvzWWl45pZLAa9HK?=
 =?us-ascii?Q?cg1Iyf0BvhoOeenzVBL9wN9013IntVJg2asyeehsbageO58vfARU6bjnq4G+?=
 =?us-ascii?Q?RrYlR+Bgwq+PQry+j2dLfWoKMIt4/m+v4FBBifRmbywtLqn3HvnqxUJZNexG?=
 =?us-ascii?Q?VeXPccrR1Gn95OQsTB2y4nDngbomTti7f3YcmgLTvu3B7HoX+7A5qQbwgL61?=
 =?us-ascii?Q?+OELo+nSEGiZ+cTKxe8nq/y4EzfhCMaexpfg0gPGW2C/xf4yJXaM5Mz2U0ax?=
 =?us-ascii?Q?wj4isO58/laLLD/gI5DY1R8FWFOvXliaX/UUQvnlnOLxUdlP2waF8S64U51C?=
 =?us-ascii?Q?c/PP+PN6xQLYZjydq6WeZ4JWHsIzGSeDIOBBKNDMAxnJAqQALGgsRRYHI920?=
 =?us-ascii?Q?ImToeuVNqZA2vEQtfuuowXy8UxEqx5nkLuQdwZlTKvkuGTLOTsID5Whm2bVK?=
 =?us-ascii?Q?8VxnGfQOJANAHG4YDVS6TPc6IZqpz1UiGRBel2janAy2ur7dTGSN/FzLFaq5?=
 =?us-ascii?Q?qoiExsTmd1jIR9sBS5aGJr2QcOyfkM4UCV9LwtN27DAhhNn+nL3OG0/c1trO?=
 =?us-ascii?Q?gdjvzY63qSSZdSeUmb5ArVzCvwnqboOyeUeKKbV+ld1R13Qw4QPKG2vq9GCA?=
 =?us-ascii?Q?dEcsKRs+YtIc71QrUF2glASHlLU3An6sn+dHoEs/g6jwOXFZLk9w5FcT44Tp?=
 =?us-ascii?Q?znF3tb+hnGdjRAyq?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 tD9/qEw+JhmieIDN2pfGL+ETUqDTWh1ZtrjOOEqUNpAIrWyYftOPdJ/IhtcarlggVw1gz495dfo/MBN1y5ZEQb2WAQRqwikBzhiX/ypEZfZ+XfRKYAP+YB163Cq2xtwTNTFLjzPn4euMLrt5/1rifxepU06wqwEaiFaZO2KkLF8QAei+uAb+qD2vaJ5Snpn6QXwlEkPZ6C68loek5Jinn7zq3Q/Uuxfki7RLBdr6S8CJZehX3VzIjbxr4o9VN5Vjl7h0KaZ4vJksRQ74Re5ym+CokhdU+v6HKecmIVAMG94F5NeHujpE+2Mj/4Ke8z959zkfb2kq37YeibShRytH/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR08MB8567
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.20.102];domain=CH4PR07CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.20.102];domain=CH4PR07CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 SN1PEPF00036F43.namprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ee3fa23c-ccd7-4b65-565d-08de9f2476d5
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|35042699022|156008|36860700016|376014|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ObGamVGL998btlbAg7JkzVlvVRx2cq25P7AwURJSPtNx+SWeoAjeUWQbFBf1?=
 =?us-ascii?Q?SbEi90wwVHuwQlaWvQ22o4yWD2o/DAtLQbbFrmP/OxUAJ6etfpYj4qkyBy8Z?=
 =?us-ascii?Q?KOjPVFz3COpaNxl6MsnUh2JSG7Pr0l/5jMPb/lJwDqK6jIJQB8nspVcEerDh?=
 =?us-ascii?Q?g2JP5dS6tqmYOpJyRv/+fKk0zINWFnp2eIUQah9kjotJcaHh0ntHWaweikA6?=
 =?us-ascii?Q?FJ5jQ2yThD5Om8Ias77ci4Pec8FmMCpf0YDGzWhvvEUqBmP+136kjJZ7Jxli?=
 =?us-ascii?Q?nur9eESvKYN4wdRZVxfId3yNTzHJs5kdvB3GeMWNW0ZcYfRHKauZV3zNeMG1?=
 =?us-ascii?Q?dRJEmGk2sgbeCcrZM2PRAqpIL9NmpU3rDedzPNacccp953SrVyOWy4sxHs8p?=
 =?us-ascii?Q?R0mzrWWR7LNW1OQWEg0M57mJatlRdMh3io8g8mfzajRcM4hBWTAS7s4UzbEc?=
 =?us-ascii?Q?QYQjS0I6wPxvXdJV0bX1Vo3xD9iOOjWLfrFdVAnKf81DFNEWQiVgj+REnjJM?=
 =?us-ascii?Q?PH1VLuzFXNzfR9O6do9uajCH+LvfDgs/vkgsEV32ntR7kb/5NoOyI+nKgts2?=
 =?us-ascii?Q?JFGt3dRkc6UtI1DwZ+Q4wyfSdTE1o+pJlBXzynaJ/BysVFa+j50lNc4bkdrY?=
 =?us-ascii?Q?+HqQtF1cHXJgTXmuWTbayYUe9qY/B33PeSSQDUhZfq4jH8I7nRQD6jxnRdia?=
 =?us-ascii?Q?J7dF1rAPDiBjpM4LTMOt3xqw+OO21v7Tlx3o6pXO2JyHfynlTGbwHp71ydl0?=
 =?us-ascii?Q?Tm9/Mnv9fnWSbpGSSk+O4tyMnDJSw5JHQlwqtCmtRdVC06630uSmekMjbh5X?=
 =?us-ascii?Q?wKi/ng/5e3g1u5kQ8SyM5qx7mvu96bhwXlltT6gHHQAswxjPdVGGs1CinKOl?=
 =?us-ascii?Q?ShgVHrP4AnHtpuHbTmBnhLP6/ObPXnXpu+BjtBHp/8QoM1YiPlRFSdzZ2N1c?=
 =?us-ascii?Q?4P//jbcdr0orC6x31Aev31zgIiMThrngyeUcJwVZu5bPyUOrIUTC2Q+Mf3H8?=
 =?us-ascii?Q?db+80hsb+b/JfMDcBLwJ6NiRTkjhcYwCo0MPxYTiD6TtrYupWbUSr1wfV3dG?=
 =?us-ascii?Q?oka+2jmveDdwd8WigZhJAc5HnBXxW2A67vM4qlwvvuc2MHYDARmBSAETQuPR?=
 =?us-ascii?Q?aPnvRSTuQu4vEVjbLjifxW/v7QzyqvGoiQvX933s/bQebpf9RaDMZzH+AFcv?=
 =?us-ascii?Q?tNVVFwnJA+/uNv4R?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH4PR07CU001.outbound.protection.outlook.com;PTR:mail-ch4pr07cu00106.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(35042699022)(156008)(36860700016)(376014)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	js2rb0kEPM0sJ8xRqcFhO9iAKNOeOwUSTFrnPrRurizc/Zah1m5+7uuwqYyKdv5T8pE2VK2b2TpGnnfMcJWa/EoaUCpe4J0MZLCxApY1Y8ENFsgp6yYFqzXNP2I6h6+gCl43D7/1nn+wfmzKDgYhFQGWFVcxJlRIzzHzaelFkuXEq0fMiytne6O/SSR2Dd0ZRGDSJzi3NkSsNfHYQiMIrAMYHQUP9LWip2JI+qqfMdwGzCp/5ETuaVALU3Zy7v0ESdxH4Hk3iMwOIOstWEZB4SWRuI/rv4h685uib+VqC7B7g5DxSt8CcftOmoD48aawmjz0NJZjJDLiCLLxliDVSboLh6zLuVFVqrK3L1mx/dyCoWA5E8fjeqTndY+zfrVMkSf74RZWaWEC0nV/L10OKSO5mH+dmBAsfx0PXXS1+fIDyT33K6SvEVAvFAHaHelg
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:33:35.6551
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a37290f-1653-4e7c-8514-08de9f247ab5
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF00036F43.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR08MB10977
X-purgate-ID: tlsNG-c201ff/1776720822-2AD6F443-89CA8B8F/0/0
X-purgate-type: clean
X-purgate-size: 3657
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
	NEURAL_HAM(-0.00)[-0.270];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: C46D44342E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This commit moves the altp2m_init_by_id function to common code, gated to
only compile on x86. This makes it possible to call in the common
HVMOP_altp2m_set_domain_state command implementation.

This commit contains only code movement, and no change in functionality is
intended.

This is commit 1/2 of the altp2m_init_by_id phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.
---
 xen/arch/x86/include/asm/altp2m.h |  3 ---
 xen/arch/x86/mm/altp2m.c          | 18 ------------------
 xen/common/altp2m.c               | 20 ++++++++++++++++++++
 xen/include/xen/altp2m.h          |  5 +++++
 4 files changed, 25 insertions(+), 21 deletions(-)

diff --git a/xen/arch/x86/include/asm/altp2m.h b/xen/arch/x86/include/asm/altp2m.h
index 203dba44e2bf..e7239326c71d 100644
--- a/xen/arch/x86/include/asm/altp2m.h
+++ b/xen/arch/x86/include/asm/altp2m.h
@@ -85,9 +85,6 @@ bool altp2m_switch_vcpu_by_id(struct vcpu *v, unsigned int idx);
 /* Flush all the alternate p2m's for a domain */
 void altp2m_flush(struct domain *d);
 
-/* Make a specific alternate p2m valid */
-int altp2m_init_by_id(struct domain *d, unsigned int idx);
-
 /* Find an available alternate p2m and make it valid */
 int altp2m_init_next_available(struct domain *d, uint16_t *idx,
                                xenmem_access_t hvmmem_default_access);
diff --git a/xen/arch/x86/mm/altp2m.c b/xen/arch/x86/mm/altp2m.c
index 40c6ea72a621..edbaf54c3761 100644
--- a/xen/arch/x86/mm/altp2m.c
+++ b/xen/arch/x86/mm/altp2m.c
@@ -315,24 +315,6 @@ int altp2m_activate_altp2m(struct domain *d, unsigned int idx,
     return rc;
  }
 
-int altp2m_init_by_id(struct domain *d, unsigned int idx)
-{
-    int rc = -EINVAL;
-    struct p2m_domain *hostp2m = p2m_get_hostp2m(d);
-
-    if ( idx >= d->nr_altp2m )
-        return rc;
-
-    altp2m_lock(d);
-
-    if ( d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] ==
-         mfn_x(INVALID_MFN) )
-        rc = altp2m_activate_altp2m(d, idx, hostp2m->default_access);
-
-    altp2m_unlock(d);
-    return rc;
-}
-
 int altp2m_init_next_available(struct domain *d, uint16_t *idx,
                                xenmem_access_t hvmmem_default_access)
 {
diff --git a/xen/common/altp2m.c b/xen/common/altp2m.c
index c234bb3774f4..9f5f98e1e8a5 100644
--- a/xen/common/altp2m.c
+++ b/xen/common/altp2m.c
@@ -106,6 +106,26 @@ void altp2m_vcpu_destroy(struct vcpu *v)
         vcpu_unpause(v);
 }
 
+#ifdef CONFIG_X86
+int altp2m_init_by_id(struct domain *d, unsigned int idx)
+{
+    int rc = -EINVAL;
+    struct p2m_domain *hostp2m = p2m_get_hostp2m(d);
+
+    if ( idx >= d->nr_altp2m )
+        return rc;
+
+    altp2m_lock(d);
+
+    if ( d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] ==
+         mfn_x(INVALID_MFN) )
+        rc = altp2m_activate_altp2m(d, idx, hostp2m->default_access);
+
+    altp2m_unlock(d);
+    return rc;
+}
+#endif
+
 /*
  * altp2m operations are envisioned as being used in several different
  * modes:
diff --git a/xen/include/xen/altp2m.h b/xen/include/xen/altp2m.h
index 37c875a52327..cd96c3b4792a 100644
--- a/xen/include/xen/altp2m.h
+++ b/xen/include/xen/altp2m.h
@@ -71,6 +71,11 @@ static inline bool altp2m_set_altp2m(struct vcpu *v, unsigned int idx)
 
 int do_altp2m_op(XEN_GUEST_HANDLE_PARAM(void) arg);
 
+#ifdef CONFIG_X86
+/* Make a specific alternate p2m valid */
+int altp2m_init_by_id(struct domain *d, unsigned int idx);
+#endif
+
 #else /* CONFIG_ALTP2M */
 
 static inline bool altp2m_active(const struct domain *d)
-- 
2.34.1


