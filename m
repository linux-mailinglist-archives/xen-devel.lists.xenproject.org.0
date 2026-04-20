Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Cd1KlSY5mnCygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:19:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46744433ED0
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:19:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287443.1567865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEw1L-0005yf-89; Mon, 20 Apr 2026 21:19:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287443.1567865; Mon, 20 Apr 2026 21:19:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEw1L-0005xD-4A; Mon, 20 Apr 2026 21:19:07 +0000
Received: by outflank-mailman (input) for mailman id 1287443;
 Mon, 20 Apr 2026 21:19:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEw1J-0005vJ-6v
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:19:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEw1I-009ir9-JS
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:19:04 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e6983c-2eae-0a2a0a5409dd-0a2a4506a764-10
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:19:04 +0200
Received: from [52.101.85.80]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69846-7371-0a2a45060019-34655550d7cb-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:19:04 +0200
Received: from SA0PR11CA0181.namprd11.prod.outlook.com (2603:10b6:806:1bc::6)
 by CO1PR08MB7676.namprd08.prod.outlook.com (2603:10b6:303:15b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Mon, 20 Apr
 2026 21:18:57 +0000
Received: from SA2PEPF00003AE5.namprd02.prod.outlook.com
 (2603:10b6:806:1bc:cafe::5b) by SA0PR11CA0181.outlook.office365.com
 (2603:10b6:806:1bc::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:18:57 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 SA2PEPF00003AE5.mail.protection.outlook.com (10.167.248.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:18:56 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzyz4050Wz1wdQ; 
 Mon, 20 Apr 2026 14:18:56 -0700 (PDT)
Received: from BL2PR08CU001.outbound.protection.outlook.com
 (mail-bl2pr08cu00102.outbound.protection.outlook.com [40.93.4.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:18:55 -0700 (PDT)
Received: from CH0P223CA0015.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::33)
 by CYXPR08MB9211.namprd08.prod.outlook.com (2603:10b6:930:e7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:18:48 +0000
Received: from DS3PEPF0000C380.namprd04.prod.outlook.com
 (2603:10b6:610:116:cafe::46) by CH0P223CA0015.outlook.office365.com
 (2603:10b6:610:116::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:18:47 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 DS3PEPF0000C380.mail.protection.outlook.com (10.167.23.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:18:47 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:18:45 +0200
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
 b=Sii/IVxUXMTV1k49uMtS48KeA4w+9HhRxhgQd9XRFSmi2PPotlcHF4u7L2xEOCD1N+agHlIBJ9uGM7v7bu0z7uz94vqKYIpevP/NeaoqkBSBkl2sPSaP7wrZ5cgMLtuHlcBKQXA3N00nSDUWS45EqZPnnd6+1uVGCyTbU3MrLWJfDyE4sutv0juZmWldWdtRKMRe4PzJjLnUVXAzj5zzSbx/U+wZDZPjZUYHYvq82pGJBwDnUotN/Y3oylDJw8vSgyq2EwOoqwBYKhcA0uXPM9NpurJzMo4a3wJp1oEKkHfEC1jyK9SMu6tqWyTCnbP/JpyHCF01xHkmDL90M7bUog==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jRLoxsuohqR21r1f42+aEEmWEGpw45nncUOaZm3GjeU=;
 b=NaFB0ba08gifUaHQU+JUAQGz081+UikN6BjY4O4mFROtlEtHTLAPOCg9iOV1Zi2rPFEhzeWZENuvxrstJ9fc1IMFxcXu3AkldQ77+he0xq5CoG/OgJAtE+cM0r1DrDb/sy/4uVZIxojqXvji8SNTKg4vXwrhLv0kR7wkvdUCSUb9TISYYbDDXPtaKfm0qIAKmr8JR1CCazV8qGU349ekZuCKFWiJPpkkA2dFd1V2SB+WG/axt6VaZWoif15EGYrF8gIduvEQ6576Ba/T3coqBlJrDg9dJp2zRIIlJm+NxOI2IA+RVxsa8dR9zVGwpUscgOKmjE5jCuFPcYE0tew16w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.4.10) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jRLoxsuohqR21r1f42+aEEmWEGpw45nncUOaZm3GjeU=;
 b=ChUuAdw4vp6m0/XRQ+xEY/kOcNhD9O/EkcIjc+1TlKFuf968i6j1WetoTlSu/kq4ydMW2g8sz+vo0FIWOo0eawhNRHjEOnwOJuQqBQIi6gINN21jfkr42mtb/RpOaUO0vFIm+LWi4uOux+ok8VNlsmJCgP7Vnj9NmTCP73GFThc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.4.10)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.4.10 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.4.10; helo=BL2PR08CU001.outbound.protection.outlook.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SBG0StmCAGR3YsdIb2+XbOcI+ed97BpzQk012Z424lQNHEEdMdcUli8fYZasRhymTiqyeafHOkHQYFgCaRPadj4ozsE7NCSmEdW8pSQxEQtIn2s2bU9utkhGnCkyK1oZNj8Ptcc1PczZb6IsY1j3X/+mh+5LUp1FntRfiarH0Nd/BJ4JigWBDNc4GFzFri+iHvxopbRqipg+pYRiAar3jWAnK3j5He+US9UkFgGRtWGPDBzDlahfPXh9ugJDgfBj8CS8/+clXYuhldoN9xsKwWQ5MYXPIDIlOfsBJzCWLu5aTM8GUb+4Gf8rDHZgY1Dt0qRl3yT0/7psD2DICzOGrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jRLoxsuohqR21r1f42+aEEmWEGpw45nncUOaZm3GjeU=;
 b=ytqHZY9qtJ9M2EEqBDeBgzJpsq+zVZS1NMJxTER3T0QPvG/6n5VxCgnaileKzI3SS1TS85ZIKhMCyoksGao2JSDG6GRCau8NHXKYY9sH1WIuTN+vEqOlQb8YC+2GOUMfB3OHFPgyoisJtNf/aDj6/rpQY0P+pEgH+c3xhPqwGZ0faQ7m/CZE5REMquRZmB6DNkMBDusruxZ1RcrgsNbQgIj7fnv12tlzJ5ElRs0sCZj1TIFdZj98IIxokAIqBeczJP0hyuzzYE77NSPzIyQ3L6hcu95s7zmWN3YM+bg+1/aA3TCcYLPu1/2Rl/5dlSifc2kTok7lhbL+5dsvBJ7fHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jRLoxsuohqR21r1f42+aEEmWEGpw45nncUOaZm3GjeU=;
 b=ChUuAdw4vp6m0/XRQ+xEY/kOcNhD9O/EkcIjc+1TlKFuf968i6j1WetoTlSu/kq4ydMW2g8sz+vo0FIWOo0eawhNRHjEOnwOJuQqBQIi6gINN21jfkr42mtb/RpOaUO0vFIm+LWi4uOux+ok8VNlsmJCgP7Vnj9NmTCP73GFThc=
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
 Babchuk" <Volodymyr_Babchuk@epam.com>, Aqib Javaid
	<Aqib.Javaid@elektrobit.com>
Subject: [RFC PATCH v6 06/43] arm/altp2m: Add template arch-specific altp2m.c/altp2m.h
Date: Mon, 20 Apr 2026 17:18:30 -0400
Message-ID: <20260420211831.208600-4-Rose.Spangler@elektrobit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420211831.208600-1-Rose.Spangler@elektrobit.com>
References: <20260420211104.208444-1-Rose.Spangler@elektrobit.com>
 <20260420211831.208600-1-Rose.Spangler@elektrobit.com>
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
	DS3PEPF0000C380:EE_|CYXPR08MB9211:EE_|SA2PEPF00003AE5:EE_|CO1PR08MB7676:EE_
X-MS-Office365-Filtering-Correlation-Id: ea45ce5e-ae5d-4c0e-5d84-08de9f226ede
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?EuTMwFlv2AumOzZ//tmi1+zTpOBpO9k7tqwuUCBt7LnQXphO2kXM2hSdHNBJ?=
 =?us-ascii?Q?Ya/v+AnmYQfa7UTjYvxRw+9z21VePzCQlKmHN6daKLehagR44A3Xi+USZV15?=
 =?us-ascii?Q?nt+S2lU8VsDxGk+PlMfk1+9IWCDL4kplzqNgkv7ENIRMEuD5pR5RCh5ah5iy?=
 =?us-ascii?Q?upcVSKCl6G/p2Smv35REz/Yh0QDT9vzXtY26CWSkqAC+LtBaxGZoUBlUC7aX?=
 =?us-ascii?Q?+PYtqQUzJzZm94wWtC6IZZF+hgPbLoV+KhwjmRHRWgyP0Uf6F/zVfRkpYWj5?=
 =?us-ascii?Q?Jsaq8yL3OUHarg8PvurvQ44vDdmISP9Ytcon1L9EdXUFZcujkys34BHGNiIn?=
 =?us-ascii?Q?QX6FCp02pbtOs4lOtCgX2iwEa90NMSxnG1Ap2atRLdX+qyblZ60MSklDQqcQ?=
 =?us-ascii?Q?rurZHlHxCJl70PdsWH9Xhmt+KvEw67EQkOd2R1KDQkmWRcBK55++2mU49hGV?=
 =?us-ascii?Q?yswo8OcFBHA1yZhogxIHAiToCRljXU0Q8OxhdDKu307NjH35jRUeYRjH0JQE?=
 =?us-ascii?Q?kl8LaqDg1LCEfcrwUfzsVxA50OsRfHpQVOItRo58cTvZOiqGTAYOVG8tHC+g?=
 =?us-ascii?Q?G8wJS4vny9/wl4iz5XD1pF4zIRZYdO7zRzxVxLla6P9WcSSV6ZcpRwcZsP5j?=
 =?us-ascii?Q?P/NIKuJQQDbZJLW5aCP+Z0B44bIhOhl1wxs8MoPz8kG7TDS5PCqmbnVd9+Yq?=
 =?us-ascii?Q?NFZF1UqhYoW59SD9evI4MTNSldkYmljpXT8CMZoakSELjkjuBLb0dpdixLo5?=
 =?us-ascii?Q?DdkDrWlz8W5Z4i0ha+AEbNUDmLZAllZPT0OUCQI7e/1DlwnkvwVGSXymRXfK?=
 =?us-ascii?Q?8dqBRPDjKrvrQoBgqDKCrUV5dF4bpyHP2Gj6z20Xhg3pFfzSqxYEWqLL6/lA?=
 =?us-ascii?Q?wgXX3ZF/zQBaFkFziqUF6ZWLdbT9mDQJlnHrHxEM2svxoeVthavglf7mSJit?=
 =?us-ascii?Q?iuim6f7zUgT7NGkQvrhaM928gh+HYtlNN6fO2lEAbdDiqyZCBEEz5+niQKrm?=
 =?us-ascii?Q?G9DHffJA822Cxgu9vuh98i0BBfQHXd6r9BhaeVhyV0Pkvv8y48vc418Qpwvb?=
 =?us-ascii?Q?blnpasJYciD/B0hYDLzckBMpLs0XvmIPMpVKVrY7ZNulV3RSaGxytMQqafdq?=
 =?us-ascii?Q?k7sF8KW9GbcOC9ysjmFX6mBSODj3Pm13niwKVSHa8esQBFsNCTyIOwLiNqW+?=
 =?us-ascii?Q?PCVXD8i8CWA72fUpasxNQEg/TGMKrY+lJs+Cl8s3zNhaFly27UjoNG9ucPFH?=
 =?us-ascii?Q?QkMvMP8PnQvdYlC58EX+?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 M//TOup4wnYy4+oUrapPZtP4ksf7q3cfNFMM2P3Rh7TFCi7xBBRQ2wysu1ffD7Qk54wW2y9vQyC+yprq20aAK+tUPuouVRvyHuoHpvF6XHbF+BgAbQcQC3ghjLVMBauk9jynL488zcpZ+43pA+/LyaMNqETlAft+mIMW7r8SoaX4nih9BAl67eGrSE3vfLeoRGayr3nodQ5wGBxqJLLq+2McIoJnN2haIBusFTc+hxOx8CydBKM8dm3PXV+8dgawjpSSSixqtAB01RWG1ErQJ2O8qBEvl8ZzTjGEJcE+BCBETQhmW2TfkvpQ1KuaBO2otsIm1JuFHmo2ykHOnh1qeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR08MB9211
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.4.10];domain=BL2PR08CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.4.10];domain=BL2PR08CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 SA2PEPF00003AE5.namprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8bbe9914-94e0-4274-1a9b-08de9f22695d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|14060799003|156008|82310400026|35042699022|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cO/Wrs+BSzJX6lQLR4/MbpT+A9t+J76hrSlowOe2bqpb93m8hb++gfxtoUfU?=
 =?us-ascii?Q?hig4aCfnLPtpFy1rC4pxG9IyVuCWyTzTTg+/9hmt5/2eWP165QqNWxfJgir1?=
 =?us-ascii?Q?mJa3efVzYI2eyt/+tuX/5FaZVCZqeI4BXsbaSeBHtqSA/yKnnjbuklN9ZG7b?=
 =?us-ascii?Q?aaUxzTJTvvG/ymwU/x36NKv2Ts4ZYUDIYopq2LUVwhOZ4/w5ZQNsPw4hD33p?=
 =?us-ascii?Q?doC/fYoPhuKUI/KNJW08IKQ0qxemu+0kZxHBxsh072vWCTN8lUqg6+2PQxmP?=
 =?us-ascii?Q?RM94/ng+AGAHVS90ndN+fjkl42r1KASzDlXLOMRF6I/5Rl4RU4i6RHU4RwV/?=
 =?us-ascii?Q?M2NsZ4GqRaLSFHSmI8965QxJKkk19dTI6j8yvUFzpdia4tkIcjirimkxof+G?=
 =?us-ascii?Q?6+r3LrzeRgixvE+hykmv9tBllEhWlHmnjlExXppCNLpnnsYgpI2sC+ymdnq3?=
 =?us-ascii?Q?UFqYE5dV6NQBcvefKoxmW/rAEvk90Ao8gPuvJHNrG00WIlMFCrOHKXwK0Jvp?=
 =?us-ascii?Q?h3+ttSWwXkCuYynf8VZ+Mhr5SoeYqVF1MSux6DjfQ3a5AeQB9/Qv6UFKzcbm?=
 =?us-ascii?Q?0F/sVyqquk2vBwJfSVzFaeAWw+2pyuk2jLRXKrLdEoRuuIVANiqxllr7Gg6d?=
 =?us-ascii?Q?WhtU4vAUJwURZLJacW/pZYIPlgA/3WStPCB86oG918IKLDacE8jMhVUbq1t0?=
 =?us-ascii?Q?m2fr3EyDPm+d6w1ATtHD1SgPgNV0UalqBNrrRSd+oGwf+L0ThCotd7zk5/zG?=
 =?us-ascii?Q?1gEgeS7G3irBsF9JCtN1q7yQgIquyo8EB40flj8GfgLgag6LLdcvKzKYHIKE?=
 =?us-ascii?Q?Jo9qJy5ZTvH4Mq8HyuJYLtJkiH222W6fq196jhbAzV8wWkxVaiaZnpjbqNZB?=
 =?us-ascii?Q?0YQ8GTWYhXAVfqrwpsewkmuPI49gC+hjCPspbyj7o8cKg4wokL8erZ7f5Iz4?=
 =?us-ascii?Q?WBslL44QUsL9YhI2rNToiinYWnqXSDHjwCcM71ZMwrzfYnk+7NG/jrYFkjoD?=
 =?us-ascii?Q?gMOimvEIIUQ3y0btibnDaN/rU38+6vkcuEhM176uolO+3EbdU0AjnOSZ0PZX?=
 =?us-ascii?Q?uQPYdWEUJqiXIsZvO0aPRFfbQ1JQZ5jn5iH/eBed3WhXKnM0nqDYvUb6WPsD?=
 =?us-ascii?Q?CsjpFYn6JUE0Rm/Mlef0FgRxF38scBWtD6CA3+pudVH8hEcBOtt9I1s3nXhA?=
 =?us-ascii?Q?4UjGaLoU4nuTMStvMStDCFtvh6y+CTbxB3KACiqvkYmBSo6siyhTs0WtN/TY?=
 =?us-ascii?Q?tP6JG420dB8OmAx2vE9C?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL2PR08CU001.outbound.protection.outlook.com;PTR:mail-bl2pr08cu00102.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(14060799003)(156008)(82310400026)(35042699022)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sviIq+Ub8DE3421+n1v2Mqm6OnD2RCSnTAjNP2Tc2RN6LqiUiQbZk3pVBTodcwHqpn50WAkBajPtb3lE4Fz4go+/N68+bpOyjiqsT4r2OkGWAqY0osln+djsgy1g+TQKXBXP59VsO6w4JboqMTrx5fgKXyN8VcuvxBapmKnK5vdJEqCh3knOfTP/wzQYWLzZIVL1u2Y1Y9QJqRW8LKATh0TKjfAKw6Ln3wT8fYABpGKjsDIN82afuQfYdd5sDV5MrS2m1ZLN451LLrvxveEJpHQH6oz0+02x5HUjSs+vaImB9FvL71XhZH//BVf+TyedKR10hO45ZcR9ryRXdYxfjJNKUAbC6U/+qm40r3xgCJpS1CPcQqI419lbDLa4YZoCakEjtOE8YSt4svFSo9UT/oXId2y4+BRoxikCr4Xt+zK8oqcncR9wse1laGhy75Br
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:18:56.7437
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea45ce5e-ae5d-4c0e-5d84-08de9f226ede
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00003AE5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR08MB7676
X-purgate-ID: tlsNG-16d1c6/1776719944-91D83D75-C4E09421/0/0
X-purgate-type: clean
X-purgate-size: 3218
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:Aqib.Javaid@elektrobit.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.329];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 46744433ED0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Similarly to the earlier common altp2m.c/altp2m.h commit, this commit adds
a template altp2m.c and altp2m.h file for ARM to be added to in later
commits.  Creating a commit with just the template file additions makes it
easier to reorder later commits which add to these files.

This commit can be squashed into the first commit which actually adds
something to altp2m.c/altp2m.h for the actual submission if that would be
preferred.

This is commit 6/8 of the preparation phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
Signed-off-by: Aqib Javaid <Aqib.Javaid@elektrobit.com>
---
v6: Introduced this patch.
---
 xen/arch/arm/Makefile             |  1 +
 xen/arch/arm/altp2m.c             | 16 +++++++++++++
 xen/arch/arm/include/asm/Makefile |  1 -
 xen/arch/arm/include/asm/altp2m.h | 37 +++++++++++++++++++++++++++++++
 4 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/arm/altp2m.c
 create mode 100644 xen/arch/arm/include/asm/altp2m.h

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 69200b27280d..d995d4ff7aa1 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_TEE) += tee/
 obj-$(CONFIG_HAS_VPCI) += vpci.o
 
 obj-$(CONFIG_HAS_ALTERNATIVE) += alternative.o
+obj-$(CONFIG_ALTP2M) += altp2m.o
 obj-y += cpuerrata.o
 obj-y += cpufeature.o
 obj-y += decode.o
diff --git a/xen/arch/arm/altp2m.c b/xen/arch/arm/altp2m.c
new file mode 100644
index 000000000000..2bd1ff4df223
--- /dev/null
+++ b/xen/arch/arm/altp2m.c
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * altp2m.c: Alternate p2m
+ *
+ * Copyright (c) 2016 Sergej Proskurin <proskurin@sec.in.tum.de>
+ */
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
diff --git a/xen/arch/arm/include/asm/Makefile b/xen/arch/arm/include/asm/Makefile
index 4565baca6a4d..fef4dd42b6cb 100644
--- a/xen/arch/arm/include/asm/Makefile
+++ b/xen/arch/arm/include/asm/Makefile
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-generic-y += altp2m.h
 generic-y += device.h
 generic-y += hardirq.h
 generic-y += iocap.h
diff --git a/xen/arch/arm/include/asm/altp2m.h b/xen/arch/arm/include/asm/altp2m.h
new file mode 100644
index 000000000000..ca836bae7330
--- /dev/null
+++ b/xen/arch/arm/include/asm/altp2m.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * altp2m.h: Alternate p2m
+ *
+ * Copyright (c) 2014, Intel Corporation.
+ * Copyright (c) 2016, Sergej Proskurin <proskurin@sec.in.tum.de>.
+ */
+
+#ifndef __ASM_ARM_ALTP2M_H
+#define __ASM_ARM_ALTP2M_H
+
+#include <xen/sched.h>
+
+static inline bool altp2m_supported(void)
+{
+    /* Not implemented yet */
+    return false;
+}
+
+/* Alternate p2m VCPU */
+static inline uint16_t altp2m_vcpu_idx(const struct vcpu *v)
+{
+    /* Not implemented yet */
+    BUG();
+    return 0;
+}
+
+#endif /* __ASM_ARM_ALTP2M_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.34.1


