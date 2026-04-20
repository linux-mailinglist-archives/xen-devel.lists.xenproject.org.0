Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIMIM6mb5mnCygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A26043425B
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287797.1568230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwF4-0002ii-2B; Mon, 20 Apr 2026 21:33:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287797.1568230; Mon, 20 Apr 2026 21:33:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwF3-0002Ze-Cf; Mon, 20 Apr 2026 21:33:17 +0000
Received: by outflank-mailman (input) for mailman id 1287797;
 Mon, 20 Apr 2026 21:33:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEwF0-00029M-UB
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:33:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEwF0-0054Hn-AZ
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:33:14 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b34-5cb7-0a2a0a5109dd-0a2a450c9236-42
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:14 +0200
Received: from [40.107.208.128]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b98-62f1-0a2a450c0019-286bd0800b4d-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:13 +0200
Received: from CH2PR08CA0022.namprd08.prod.outlook.com (2603:10b6:610:5a::32)
 by LV8PR08MB8854.namprd08.prod.outlook.com (2603:10b6:408:180::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:33:09 +0000
Received: from CH2PEPF00000142.namprd02.prod.outlook.com
 (2603:10b6:610:5a:cafe::b5) by CH2PR08CA0022.outlook.office365.com
 (2603:10b6:610:5a::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.25 via Frontend Transport; Mon,
 20 Apr 2026 21:33:09 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 CH2PEPF00000142.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:33:08 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzzHS00Vqz1wdS; 
 Mon, 20 Apr 2026 14:33:08 -0700 (PDT)
Received: from CH4PR07CU001.outbound.protection.outlook.com
 (mail-ch4pr07cu00105.outbound.protection.outlook.com [40.93.20.101])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:33:07 -0700 (PDT)
Received: from BY1P220CA0047.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59e::9)
 by CYXPR08MB9590.namprd08.prod.outlook.com (2603:10b6:930:e0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Mon, 20 Apr
 2026 21:33:00 +0000
Received: from SJ1PEPF000026C8.namprd04.prod.outlook.com
 (2603:10b6:a03:59e:cafe::43) by BY1P220CA0047.outlook.office365.com
 (2603:10b6:a03:59e::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:00 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 SJ1PEPF000026C8.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:32:59 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:32:53 +0200
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
 b=a7TZLtiFSR4tDQp767QRWFsD68qN24Y2qH2qa50NKbvXMnI8WOtm83uwds0VUL0gPx3DWVj5lTQXqYP+TgsgwpSBIzIerKImBO8EMR2t6glGCWBDSQen7potghdpqXWXL4jplqmn7jroqfDi2iwiYvrz8uv/uKbNbc3cnKBDXVjoIcab/Wq9ThZ6ZuhmzFsGWRupdhVVGgASjPsJOBbDVxWYWUDZgHBsmmuqgWB/GOPrMhULlwnjiDLNUFG54MPAq4hUCqlpROFEbII5vH3/CszPOG2j0ZY6l49RkpwbJqa6LMglkQx5QnD/IQ0SKTfJRhJimnlPwBa4jVIy9lcEYA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qwOwmfrmWpA5bcreD0lLuuQUt9f7SqfexhLWTcmlGbU=;
 b=lcL9T1TD2c7a0pQBOsgU/QRMrIV4tMPReLffNJGwaGrYwcEZL9VC+GBKeXwND3y6yf420CZA1tN43ho8k/fXq0kOWS05X4wD9tdkw03X4VOv6jRARdad93L4PKiOxPyS1fuJCxfEpRsYI4H9W1N4IH4YDZ5czyzsI5jnQMiv7MPRy9ivHjdaP9FcRx3wWVhc2F1+XoGHLytdv6lLFvMGlZNelwlzC/RgrJLDGoiP/W51HcG3lxBs6L/c0fVIET8XwtcZc3z/i22zrK67+d/omAGKm8tmiV/TUoLR5xu7sjLedu/B60Yj1rnoDYR4d6DP1twS84upFyaLOfjq6zResg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.20.101) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwOwmfrmWpA5bcreD0lLuuQUt9f7SqfexhLWTcmlGbU=;
 b=ksT2aaUTFwGwiQFagv2YTQEUoexL7tiAWUi2IhMTuDFI90b81rHJIYz++452qUTUneXCUPcsb0DfPmtmi8KcehD8kKCjB0ZBaZ3w/X2QTyMHsi9BVBNkttr4ar5m/7rxBH3G24Oq+Z3GVy3OR9bO9ykOu4LzkZ4LMDNpvEFSlYM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.20.101)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.20.101 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.20.101; helo=CH4PR07CU001.outbound.protection.outlook.com;
 pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sa00R3fxZptqfAOJUKi2mVeeMohF0LVTvB+fhbtwn8jcitZUSuT1D1hVYIHI6SRt4+Q/ur56dkzjpeXHzl3kryZcbbOyVZa0+htlL5YXAdkY0IYsTG9WWfgipxkSySF1Tr4nvL1ICxd0VCcANY73vhFbn0NweBGlK6BteRSD7hFkl1XSlMTcWssGJS3OM6pdctMDc+jqvutk6tUT+nvvw1CJbzUNqE+J/m1MKWbtXd/qRABDzGBNZo7dd6xNN4iyZw7UnVDDRt9iP2eogUYu4f/dD2O1yhQtzY+qeuxw9y4HcKXQWpmzwSZhJky07m6cyf0JaMlQCn6wITEIYR9ZiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qwOwmfrmWpA5bcreD0lLuuQUt9f7SqfexhLWTcmlGbU=;
 b=m+F7/Tf2/RApi8vHZRQk8vzsoIugBk5VccgMPPIQM+914ozn+k3pJD9yBFqESK/KYnfIoMRFzfq5UgtfAMb/+NswN7Y+eEG7xbW2NP4jT4kbDMOjl+gMfZfRPrHa6EPo6l8bXBKK8IUg2chsXsKm20GyMNEfmGmhtGlY7P9J3eIbgOfRA81IxvFXxFbpV8KatPKaIgLKb4VDmzJhvLYWQBBe5OFBdMDbGyMApxqtgy/znmKzlSgwRmngA5ru0jMSUY5vfhh+W6Q1xch5fzNCDkG/BvQpiC9LQbavWIl2Z9OGzKjJLV/JOtzD6nUffWtFxDXnvuDZ3hprPpx5yWA2Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwOwmfrmWpA5bcreD0lLuuQUt9f7SqfexhLWTcmlGbU=;
 b=ksT2aaUTFwGwiQFagv2YTQEUoexL7tiAWUi2IhMTuDFI90b81rHJIYz++452qUTUneXCUPcsb0DfPmtmi8KcehD8kKCjB0ZBaZ3w/X2QTyMHsi9BVBNkttr4ar5m/7rxBH3G24Oq+Z3GVy3OR9bO9ykOu4LzkZ4LMDNpvEFSlYM=
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
 Babchuk" <Volodymyr_Babchuk@epam.com>, Sergej Proskurin
	<proskurin@sec.in.tum.de>
Subject: [RFC PATCH v6 18/43] arm/p2m: Invalidate root page table entries and flush TLB in p2m_flush_table
Date: Mon, 20 Apr 2026 17:31:41 -0400
Message-ID: <20260420213206.208750-19-Rose.Spangler@elektrobit.com>
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
	SJ1PEPF000026C8:EE_|CYXPR08MB9590:EE_|CH2PEPF00000142:EE_|LV8PR08MB8854:EE_
X-MS-Office365-Filtering-Correlation-Id: 00101def-7e94-437e-9704-08de9f246abb
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?OBLOtUbcCotZzK/gY2OBUpe69MrzMg85JDJc6iYaZHiSG/yBMBWzpfe1L7Hh?=
 =?us-ascii?Q?GedNrRjkKgJuvGvJfngkp9GxzddSdgwl7JojUOLqziM11H0DZpq6VopjjXmq?=
 =?us-ascii?Q?la+rxbbpnnmesjW3fH3N3e8ziKrVZMpYN42sLzToPXjaiVm5p7ngo0BaJQPd?=
 =?us-ascii?Q?KgBioJlzv9LENsLhb5rYKyGJzBeMpntOSjyaHrLRGfAKPnnbdYvUQXBqJz6R?=
 =?us-ascii?Q?AiL3Ngf0HlP4DlionH3f2ebv0citI3oVRWzEnx17cYcDPsSzSBlZNju3nP9J?=
 =?us-ascii?Q?QA7DWUsnjGjuFZDG+knHsffvEYkdkm9+fvhSlNTWyBI2nlmoPQPcQLqTlunA?=
 =?us-ascii?Q?r9fS4MCjvbjcvdN6/LZpnR2+4WAgQeSbY6/k8F3NSez9nMZxGtMDHxn7RmWY?=
 =?us-ascii?Q?qeDyQqlkobqexpjiog4LDe/q2CQDfkZ3Qm3W8vlLGvFAY+V87SEDRD2vCb3d?=
 =?us-ascii?Q?tq4B36vxr6+X2pfBgU1ZzR9S7oy3Cq/qr07Yb3yWh9wOVnLnmzNvohuJ2Iai?=
 =?us-ascii?Q?+2VzNHhFFCTnCTT6rsK+Z9/JV+NeYIM5t//TRNRp2TxDTI2LDXNvQQ+P6rQQ?=
 =?us-ascii?Q?mJBqfW4lUjBQvkyJkBIo0lnusrbh6xDj+A9aTIR5RCK6Dp1SaKsoBzvuzLBE?=
 =?us-ascii?Q?zNERxDaQzGOuGE/4IJa67UZFOrGeKsAuScZNFABtKDJ3JUHm42voV3GU1Uny?=
 =?us-ascii?Q?gZLX5rE3VxQ6BLMCUbBKSscMR0/Ponn8UPs1YIY286tg+EP2fLVPhodad0WF?=
 =?us-ascii?Q?3UmWkifFymnmPMRbXH8VUFkWfQ4LEyAaL0RnjQ35W0bKbSYbVXicBXkhLIEd?=
 =?us-ascii?Q?kUPQfZw+ofI8SfcR01O12YURzfuoBJZbph/lYshdE/iVRpMrG+514s1FqTIG?=
 =?us-ascii?Q?AtU2dfhUwJzdXp20C2y9XStoL+xlCsnioClwOUO/LgrxV4bwEZ6s9tqxCxtl?=
 =?us-ascii?Q?TaISMq+btCCWIps50Un1MZUorXlSyLZZzXFBvZF27rnjHJa3Cn1C+LFAvehM?=
 =?us-ascii?Q?QflDBIE5u2ELF6HhvRCiXR3wC0N0ZQLzJRBeGlvr6oeKzqXlT3P46PxCWK2+?=
 =?us-ascii?Q?s3lyNrp/AvQk8lM9TJWviGDwkx/WhQh/cBEOI4BODGcLJZY91yly/etw1j19?=
 =?us-ascii?Q?/FstasoaYfm7DKMOMQc5Vn+MsBceAEqSu4Fb7cSaLRmcm5Kp17rNgOz+Ba4B?=
 =?us-ascii?Q?CpiWYrttU2Nk64Uo?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 gBHHavtQvcstx4TgrXKKFWRdT2UgHPLamhW/F1Z6LUMV28sgDFUCldpd2IqscULd/8OhmbtT1D8cyU3VlKLpDPEVhtpLwr7pAq5lxXNK0vUNQcI5ymIm6k7hRzwe8AiqA6ZOT1X+krOgXdovrSfQzseGwv0a3qZuXdH30C63PQvENiD2im7lZoxXVcjgaQWPKXPvwmM5ZzXcJvkqNtKI0B0fVSQs8vmxu2aLXjEKk5LoVpGh3UmRW48g6U2nwXXQeozivcroei5ufD40iIb99o84CE1bv7guFoQe4Or2iWtMZmPYcYCH5+lUgmPN/lNmSt0iIeeaYLPFMu8yIaH2hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR08MB9590
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.20.101];domain=CH4PR07CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.20.101];domain=CH4PR07CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 CH2PEPF00000142.namprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4319dff1-bb28-4b51-c83e-08de9f24656b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|35042699022|156008|36860700016|376014|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?95l3DgwesH9dh/CBLii9oEYNY6UZkudAnrCRTdJa6XO/wILS+Jzbz65qwulV?=
 =?us-ascii?Q?qsylstX8fOHJ0dfT2QY5dOProHk9z9yRxJQTQKPBcNqp2wFuWemTJUWGUfqH?=
 =?us-ascii?Q?rXntqfmFgnW89CtcBU+VoVaUO05ZDpIdvTej8GygubChpuaaL9EcVjCJDhWG?=
 =?us-ascii?Q?0j8fm2KDZbraVDyVWXwmN1QozzCwwi5YvNJzClkOwdPkkMiecVw8pDycQoxf?=
 =?us-ascii?Q?JAat2aHD3VDECIDiX0cyxpKTqmIFQcRy0eTrqKwQWAneAPCjBysMaTHBCDKU?=
 =?us-ascii?Q?cd5jeEaKNuwUdnqdNaJyy1OW3JgEr9BFTJTcQaQ/tlp2Hrf8SUKj9cd6pfmm?=
 =?us-ascii?Q?+mHo7DDcaXbZ4xoqL1wj3bQVb46Pp/yUCZ1qLBIIkoBuutnPloGKSP2sLgyT?=
 =?us-ascii?Q?FsCfPsi6p1S2r+8ueZwkswlXnhYV2AhTQdtWY4WSqK8kteTuzqKk4nZTXTWg?=
 =?us-ascii?Q?eBTPWimQU44F3zNgm6f4ZGSsfX/soH+QQSXFeJILEAr7uEw8f7SKKTjx4oIp?=
 =?us-ascii?Q?lygf+Ll+tMxwmMK4H2J6PqIOAO9evX5KiZzpEYMODt87GnJfi6Uu3ycqEmpe?=
 =?us-ascii?Q?+YdlpaF0u9rujXQh9MdNi+FBcoDha7bLveT4C5Ai4bGnt2ffXpdmoGtJImBD?=
 =?us-ascii?Q?3KJbY2sP3uEa8M1ai/pZMN5bpgwWnPTiXRlDAS5GaIIuLnSDooe/UGMhxOcM?=
 =?us-ascii?Q?2381YhItc6wWhK64k448NZwDErSPmeD2YWtQOL3xspJVmIdRE+sJrKeHdN64?=
 =?us-ascii?Q?lWrsKLsK0Bd9c3lN54DKMLYqi0exCLEZYeWAICtL5TFAb60S6k5BY6yUqDRt?=
 =?us-ascii?Q?TbDtPyvc4yCnyBRH34dReSetlgcH2RsotWA7GzB4uZuO0hMt+r8jbZJZeJ+7?=
 =?us-ascii?Q?pBHYCv4lWbo+fstnIIte35rWxZvJ00wHm2IHDGPCRVmokw/pCNnZlBRNw9o6?=
 =?us-ascii?Q?J52zVSZoQo+hX3LVJTFIsqPUK8+UmYNjTdGZi6j9SPLTQhfQLtPVPJzmKMiB?=
 =?us-ascii?Q?gO5ikKuI9mwTQA0P5YmMb+ENrYRmZD+ES/opafuG/5MYvJTEEJ01M2Pbslag?=
 =?us-ascii?Q?FcCI6pKEVm4I1hSPLvN5O8nz7TTnQildMQ8yH2uk589WAq5yF4XLfoPEqjyq?=
 =?us-ascii?Q?VilmHR4QW9KciJyLv5D0dG5qS0QbaJZzOxcl0qvT9t97h37/ZcmK20w29dN7?=
 =?us-ascii?Q?s0+dgIgZ73BDrEIu?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH4PR07CU001.outbound.protection.outlook.com;PTR:mail-ch4pr07cu00105.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(35042699022)(156008)(36860700016)(376014)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Ej7dFzE95/mxjle91y5ZtkEL1w2ddUa/q0swOMw/TCSYmDnpHXrvAszO7Zc/9MshORWAYj5KByFS9jf+9dOWizThvl68udctGlA2QU8TAVlLbDzCBTaf1Yv28W2aXFU5dsEd2Eoz0VvuaRsk3uphTQpp6/y1+34PMUKzUPwR/F/0+aVh57w/HRfxne5zL/mXfdNvP0hw4oRwQ1aqrkgGhGHPW/7tJ2PXels9OWCp2h6FMPrE413VOI6xsYN5NjEZYExQ74x48Ka8xoJdlh4NrDATSQcr+ldVWZatMVaYmyJTPewExk8C0fYlxryaqZtl5H+2zIp0PMFUlVlsX4hdcy4TXHBHym7p2XQU3QY9Bh35C0sCYt6rHuvytujuL4Ds+3mSUeR1wQZulIdO+kKwbieH8gP3T1savTZ8m+CHdLE3EtcbzfJkikLN1i3ZxZ51
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:33:08.8042
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00101def-7e94-437e-9704-08de9f246abb
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF00000142.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR08MB8854
X-purgate-ID: tlsNG-d25034/1776720794-6EB74CF5-E87EB8AB/0/0
X-purgate-type: clean
X-purgate-size: 4874
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:proskurin@sec.in.tum.de,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.260];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 6A26043425B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This commit invalidates the root page table entries and flushes the TLB
when the table is flushed. The TLB is flushed to ensure that altp2m views
after being reset or torn down. Previously, the code in p2m_flush_table was
only used to free p2m pages during domain teardown. This function will
later be used to teardown/reset altp2m views of a still-running domain, so
the page table entries must be properly invalidated.

Additionally, the p2m_invalidate_root function is split into
p2m_invalidate_root and p2m_invalidate_root_locked. The p2m_flush_table
function already holds the lock, so it calls p2m_invalidate_root_locked
directly, as opposed to the existing callers which don't already hold the
lock.

This is commit 7/12 of the altp2m_init/altp2m_teardown routines phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
Signed-off-by: Sergej Proskurin <proskurin@sec.in.tum.de>
---
v3: Added a "p2m_flush_tlb" call in "p2m_flush_table". On altp2m reset
    in function "altp2m_reset", it is important to flush the TLBs after
    clearing the root table pages and before clearing the intermediate
    altp2m page tables to prevent illegal access to stalled TLB entries on
    currently active VCPUs.

v4: Replaced the former use of clear_and_clean_page in p2m_flush_table
    by a routine that invalidates every p2m entry atomically. This
    avoids inconsistencies on CPUs that continue to use the views that
    are to be flushed (e.g., see altp2m_reset).

v6: Introduced this patch. While the code in this patch is mostly new, it
    is the same in spirit as the p2m_flush_table additions in the original
    patch series, so the relevant comments have been reproduced above.

    In the v4/v5 versions of this patch series, this patch was a part of
    the previous patch. It has been split out to minimize the number of
    functionality changes in the previous patch.

    Additionally, the original patch series used a routine here which was
    nearly identical to p2m_invalidate_root, which was implemented a few
    years after the patch series. Therefore, the existing
    p2m_invalidate_root implementation is used here instead.

    Also, since the original patch series p2m_teardown (and by extension
    p2m_flush_table, as it was extracted from p2m_teardown) was made
    preemptible. As a consequence of this, introducing a call to
    p2m_invalidate_root here also means that p2m_invalidate_root and
    p2m_tlb_flush_sync is called each time p2m_flush_table is called, even
    if a previous call to p2m_flush_table was preempted. This might cause
    some additional overhead, as p2m_flush_table will iterate over the root
    page tables and flush the TLB before it can return to freeing p2m
    pages. I'm not sure if there's a better way of handling this, or if
    the overhead here is negligible/acceptable.

    I'm not sure how IOMMU interacts with altp2m here. I haven't looked
    into it extensively, so I would appreciate some feedback here. I've
    just copied over the iommu_use_hap_pt conditional from
    p2m_domain_creation_finished, but this is probably not the right
    behavior since we probably still need to invalidate the altp2m view
    page tables on flush somehow. Is the issue with invalidating root page
    tables when using IOMMU only relevant for the hostp2m, or is it also
    relevant for the altp2m views?
---
 xen/arch/arm/mmu/p2m.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index 1d598c66450b..51753bb2c34d 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -1271,17 +1271,20 @@ void p2m_clear_root_pages(struct p2m_domain *p2m)
  * p2m_invalid_root() should not be called when the P2M is shared with
  * the IOMMU because it will cause IOMMU fault.
  */
-static void p2m_invalidate_root(struct p2m_domain *p2m)
+static void p2m_invalidate_root_locked(struct p2m_domain *p2m)
 {
     unsigned int i;
 
     ASSERT(!iommu_use_hap_pt(p2m->domain));
 
-    p2m_write_lock(p2m);
-
     for ( i = 0; i < P2M_ROOT_PAGES; i++ )
         p2m_invalidate_table(p2m, page_to_mfn(p2m->root + i));
+}
 
+static void p2m_invalidate_root(struct p2m_domain *p2m)
+{
+    p2m_write_lock(p2m);
+    p2m_invalidate_root_locked(p2m);
     p2m_write_unlock(p2m);
 }
 
@@ -1449,6 +1452,13 @@ int p2m_flush_table(struct p2m_domain *p2m)
     unsigned long count = 0;
     struct page_info *pg;
 
+    /* TODO: How does IOMMU interact with altp2m? */
+    if ( !iommu_use_hap_pt(p2m->domain) )
+    {
+        p2m_invalidate_root_locked(p2m);
+        p2m_tlb_flush_sync(p2m);
+    }
+
     while ( (pg = page_list_remove_head(&p2m->pages)) )
     {
         p2m_free_page(p2m->domain, pg);
-- 
2.34.1


