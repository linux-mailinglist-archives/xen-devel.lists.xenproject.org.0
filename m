Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAHPJNub5mnCygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:34:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23935434318
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:34:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287941.1568412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwFr-0003qT-AE; Mon, 20 Apr 2026 21:34:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287941.1568412; Mon, 20 Apr 2026 21:34:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwFq-0003UW-2r; Mon, 20 Apr 2026 21:34:06 +0000
Received: by outflank-mailman (input) for mailman id 1287941;
 Mon, 20 Apr 2026 21:33:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEwFa-0000d5-4h
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:33:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEwFZ-00CCTa-Gg
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:33:49 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b69-bab6-0a2a0a5309dd-0a2a450a8c08-48
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:49 +0200
Received: from [52.101.62.128]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69bbb-56b3-0a2a450a0019-34653e801d3b-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:33:49 +0200
Received: from BYAPR08CA0013.namprd08.prod.outlook.com (2603:10b6:a03:100::26)
 by SA3PR08MB8873.namprd08.prod.outlook.com (2603:10b6:806:382::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:33:41 +0000
Received: from SJ1PEPF000023D0.namprd02.prod.outlook.com
 (2603:10b6:a03:100:cafe::14) by BYAPR08CA0013.outlook.office365.com
 (2603:10b6:a03:100::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:40 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 SJ1PEPF000023D0.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:33:40 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzzJ34rdhz1wdN; 
 Mon, 20 Apr 2026 14:33:39 -0700 (PDT)
Received: from CY3PR08CU001.outbound.protection.outlook.com
 (mail-cy3pr08cu00103.outbound.protection.outlook.com [40.93.6.107])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:33:39 -0700 (PDT)
Received: from BY1P220CA0026.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::17)
 by LV9PR08MB10801.namprd08.prod.outlook.com (2603:10b6:408:2ed::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Mon, 20 Apr
 2026 21:33:33 +0000
Received: from SJ1PEPF000026C9.namprd04.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::f3) by BY1P220CA0026.outlook.office365.com
 (2603:10b6:a03:5c3::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:33:33 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 SJ1PEPF000026C9.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:33:32 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:33:29 +0200
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
 b=CLpCBLD1qECGrCupVE1yKbteMT4bUT66alW5ozmUBIcWoZCikY9MUOn2yN0PkZ+92pGrKlLVVQFGkrkz/O60i4/k/ogG8mz3YhDYQBSeKGqK3hToMz1ls8P68vADnkbXIftl02oQBEoDRT79KC0NHBVYJAUwy9R/TDyIxqxmqVEb77Abh/njqUeU31GMw2chpKrhd7rj36TVCNSVHO8rEIZxZthwSymZC+Z0DqzouTDsyKTlaH11UHkKfF32FnwVvqGcI1vgho9/OfotOgLwsMycxS8qpMn6nHY9qPGFvdJaR4XjQFtbm7BkKOp4lKf1TyXO93MsWUW0CNGJMnZVGA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ASN5ZYxdsnJbb4wpR/egaU8I/r7OxT8I6SsLPMu6BO4=;
 b=BJouAqVicquqoWCYiMYD3zIxec8/3zkqhKoLe+H71Ym2JoecnfUWO+oP2Hkcm1bVYtSIlQHrvrsrnFBd0OE4Xas6a3PvOGl5vOU7ilWg0V90F2vk0sQZLEAgl1G7jYk6M2jK4t+ZqrnHARBh8qXPxDvcL9iKtB49Z9uj4i5EitL/KjB1fLziOa62aRL82KKtreNjR9z2lA1Xu3anDU7PScSE5jwJ31ChEhvRooF5yyDFanZoUr7/z7c0G+NMqFnoLcE4FfaO1h3ch8/HVb32fbVzhSD/xAc1MPYlTYF0IadBs+rpTyxuvqlqoFpZ8iyUVpYPZeatydPInZapknMthA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.6.107) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ASN5ZYxdsnJbb4wpR/egaU8I/r7OxT8I6SsLPMu6BO4=;
 b=FTHiPl3+ccGn+jBT6XxYr4R9R+BmQH08vXOVcHUBxlGGtrl63hPwx/mY3h5D2U6NO7s/asl3hIWtJGdInSRBow2vEpokhqFXME1UNt8DjNrzhcg+6RA68M1tkf0Xrkfyco9yVoQTS7TqToO8uOkL0z9m8HdBIVtPuwZIUta1eeg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.6.107)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.6.107 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.6.107; helo=CY3PR08CU001.outbound.protection.outlook.com;
 pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mGGmhqDc+C13sdDWM1adpVFrCmZNecvUwEBiAe4N4mugtgQtzMKK03myi94tIA4jVr/DdaVIs0f0MrR4+nSREpjE67+i6i0IW7ehuV1fxaNPZ8EGzNAx/poLEgCEjmprvOlA47IjyBqPlJMOCMdGroJnC29rPf31F/sj1RbJK+mEWzET4I9se9yd7CA8mjaKb9SZhwPzqnz0D1Mb6rMnWIOQyC/PKDKNNKU9HgJbEYzdOKvF3I2mCgZ3zdOzDevXcZ9TzWEmf2yI9lN3Skb5Ym598sWWuVVxPmPXrZOQYrfc+05AMgWxR4JhZ57FO/im5l79Fg15xer7q35VvwV2uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ASN5ZYxdsnJbb4wpR/egaU8I/r7OxT8I6SsLPMu6BO4=;
 b=xSpq/8cXq7G+xQ4UWS/Rsbi1AsgCj8wvrtNsy2nLxNIGurYSLIOK3VCoLNxRf2wXYivJPPxLBuS7kEWMXZGGpb15lDdchTbU4eeUpU5cdAzQpb/FH8u+7nVkX24t78wsz30IzO4hcLpVvziOnvU2FpVM17Iw20FcXHOLZj4BrI2X46+BP1qpenqRz3Xgg190KFBUQ3gufhZR0TSMpQtwB6V57bXBFrLl3NkJ4/n3bHpifvdavqt1v6V5w5r3rnCxBvkeNlfNIJGC21sIOSY2mJ+W25zBGGHOzXIUna5hG8darGgEIIlH9h0b7LCiZbYo9Q6+ceO13sjHlPYmFVLD8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ASN5ZYxdsnJbb4wpR/egaU8I/r7OxT8I6SsLPMu6BO4=;
 b=FTHiPl3+ccGn+jBT6XxYr4R9R+BmQH08vXOVcHUBxlGGtrl63hPwx/mY3h5D2U6NO7s/asl3hIWtJGdInSRBow2vEpokhqFXME1UNt8DjNrzhcg+6RA68M1tkf0Xrkfyco9yVoQTS7TqToO8uOkL0z9m8HdBIVtPuwZIUta1eeg=
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
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH v6 40/43] arm/altp2m: Add altp2m_reset_altp2m routine
Date: Mon, 20 Apr 2026 17:32:03 -0400
Message-ID: <20260420213206.208750-41-Rose.Spangler@elektrobit.com>
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
	SJ1PEPF000026C9:EE_|LV9PR08MB10801:EE_|SJ1PEPF000023D0:EE_|SA3PR08MB8873:EE_
X-MS-Office365-Filtering-Correlation-Id: cf24d18c-5d95-462b-b2d2-08de9f247d63
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|704162011799003|376014|1800799024|82310400026|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?s6vliefx3GpQZCqeZuOM+iXFqwD7ukgMMeP5hK752tHrdzdGWYeBn4Dq9CXe?=
 =?us-ascii?Q?snTZdV/m7pGlg5uK8nGouYvAkpewt5WfiAVDkLczhLcK9QmGueUtHX0zeCoW?=
 =?us-ascii?Q?y7gGKb4kofw6Z7WiyLC6lWkXae3rg8afVEXLJKnkySY+cb6pDAtGuSOEnJc0?=
 =?us-ascii?Q?waOz9HiZc9eVVvdpU+GOXXxTnQaE1S/39JgqSoP1wcKzrI1LMyxM2JwHpp3V?=
 =?us-ascii?Q?tTznaZGM1Dovmi935AtSI9q/NmFYsH45JeqqDlGTzqEaH8yO9gL6sAAN47qv?=
 =?us-ascii?Q?VZK4rrQrTGDAQT9GVRJhZ2HdjTahqZ8RWQogdFLFuzeVLsL3G4/Uq1qVCqDF?=
 =?us-ascii?Q?bEa1L570btGziTrbQGUFXAKSzGQXbWEo1rlTOV9/HEwMG+u9ToRPTWKtKezA?=
 =?us-ascii?Q?RzZuc0dtqSNKhSVupf7tJeWNhvp+d27IrCc9tkCfD/43DuFaqw3X+znrq+Qx?=
 =?us-ascii?Q?45xHSTHp4bsdylgLm2FBT8V10007L6RAN9UJ0MTERElr/2Q6RfdUYx17ArBo?=
 =?us-ascii?Q?n3r1AxHOIbeNjqULXbBgaGiVq+nP9RdskEYUEWcIACrbNr8Q8VQlu/oakrJn?=
 =?us-ascii?Q?OUb/NGlE3AtyljVYH7IX+W02dkuGOxV3sqtevLRFobIWt0zONxcVRgmgYDwi?=
 =?us-ascii?Q?kvhl6O9eOE4O15obw9Gbj90e2ulgFajePuHgpvhkeZ1pQK2B7Uih0VJcienI?=
 =?us-ascii?Q?/TFoBOHeRzqyFsrqyGiXpVTjbzfOMnxhIuTH1izpcJRZE3QHaoWoZMv8KT//?=
 =?us-ascii?Q?LbEesRWzadjqKlWJ0hWyQUQGo8CVK2V5o3CaoglmzSK3lAdxZ3czzFIKMbt1?=
 =?us-ascii?Q?COH3cV8ciNusjgZ3JfLJpLlV8axnvq7Rv17VarwLaUyitEoo5ts/Q5dV/T7i?=
 =?us-ascii?Q?9inE3Sjp2AgjuVslx5VxypEAUSCAWuZPxwqOkmkibR8kC+ldgMs+2k903Vd3?=
 =?us-ascii?Q?KCiDa5cQyxH15VTYDE3HvmGHSSH1YLWQOagyhBAVR49qlmJtE8JH9d7MoBY1?=
 =?us-ascii?Q?S5tU9JhxIICkrL8iHzYpLdUkcNtqLgiA0Bq/Ttlash9hsjVfDSz3QfYD1TTS?=
 =?us-ascii?Q?tka8uIH3vKz8HyHtSKEgXEhjR9ERdXm7DE/eLqs0Jn4/RiCD4Uc=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(704162011799003)(376014)(1800799024)(82310400026)(36860700016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 IxRRx6+wrYJ9V2waQwMuNc5bE5bOaDoYwo3uz4jQJFF42sU967oju/3OAdkfzApRzxRhrkiXjQt2js97syHWNC1GbDNKZOBmq2rQPud9bADEnoknd/8uAwKDCXArgvvA7ax5reHlWHC2W8482QwuWK/podGPZohWrfH2hZLJxdF+ZxxUGGTC11K0gkL1kmjDkoeeg8HjxJCi6kiRn+Z4Q4VNdhWZBzWAdMIdG4t+hho9mBuRJ1P1PPy9D98dzyjrhFF3oRbjcKlB4Vku7Ipn/vOj1O9FVCETne5Mc51WheStyblEAUYEukOeCDtpKW2plpCKiSFWYsBUkVS1hFhW5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR08MB10801
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.6.107];domain=CY3PR08CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.6.107];domain=CY3PR08CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 SJ1PEPF000023D0.namprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	901b3b4f-562a-4792-3597-08de9f2478f3
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|704162011799003|14060799003|35042699022|1800799024|36860700016|82310400026|376014|156008|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PpKD3+MlMGAA8XtGrCVh1Hz5VEtQOLwfx++A/XBPHvrcitHFdQhNY7fEZr4r?=
 =?us-ascii?Q?Z797vF1dOV2xN0d7mcZ5wPyw0ZJ8Sp2QIWlfqM3XkGKBhPJVmiSTMiEYad3z?=
 =?us-ascii?Q?8GvBVtHjNtUQUROeIbFgIS/k1DExd7ZJuLttXa7MHA7xYqB1MaUH2vypKRCc?=
 =?us-ascii?Q?sGc2UHvT956KIBQhNPG1uGE+lvSzPN2QGXPBy0CJ/4OwFug9erGL3GYPmUg0?=
 =?us-ascii?Q?7beKEJYweKGyUA1BTrym0M8SFe5Dv7AZ/NqGCjh5umK3F1c9sjdSSXSqs8n/?=
 =?us-ascii?Q?lBfo2iWt1HNcfkUUEpaPLevfqoG88fELN7Gn3AldtsVykOVjaXZLu7LZlVqk?=
 =?us-ascii?Q?oNZ903wUx5V1/y24xYhK470YjLTnsgAojh2pZZ+sNtbIZ9QFmfpu2mc/52/a?=
 =?us-ascii?Q?BBmRCx20ZfyQEMpqQGfSngXI12HG/qo98JKWDomsM0nBH/FwIwJHDHE+xeSt?=
 =?us-ascii?Q?yVY40y/wUytAgG1vrpKj8zq8+gH+cGGnISTrXWUYabJdUYE9Zw7OkwzWzVcc?=
 =?us-ascii?Q?6tx8IoFdauXZXHQsxhN3bA/yg0LV1HbtvR82r4GQfKav1v/TAaUV0BlMHwKf?=
 =?us-ascii?Q?qMN84j4I+EZ8W2Iu4j5+9uTpHI3X4yLgM0/IY1oDMvzaRhwb4WFoGldj6uZs?=
 =?us-ascii?Q?JaTbqTi94Z46ZXvomI3AfLDnRZpE4MUtSDl6KUmK7qOiTWoUSKEj3ZOrAqmw?=
 =?us-ascii?Q?Pwzphj50NEo5XHWhh6xrV0ryoC2i2244VgUg/oF6sNSq2cIhPxtALsLDhVbO?=
 =?us-ascii?Q?UZtucXiLJ01K74LXRJo+VXSUvuNiJDYri8H4ppw0AiqIuserMiggKtAuzeAw?=
 =?us-ascii?Q?ty04zv4PWaU4IV6wGa7Z/CwMXX00mMsvjRpcppLRN7XZ/S4XVLcVkBXLqX9M?=
 =?us-ascii?Q?10z97xn4A2+TlooEEXZOd7nCheXWX/RbGLKpPNYOlewLQRdn6yr4K1uCTjC2?=
 =?us-ascii?Q?D090l+tQgtJidcG9TjBv/IZ1Z1GJ5lKcgkbsgMySr4jmEpBAdwNYbNrJkja0?=
 =?us-ascii?Q?FoTUWahU3fq4N2bv0Kx0RB75MDKHHZZ7xsKJhFXArzcMBaiiYv7ZzXxxzm3K?=
 =?us-ascii?Q?MMZX8hSwlqk3+Jp1Rr0jNxDQo4UmNnaoIT5hgMbev+SSVfKcPHA=3D?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY3PR08CU001.outbound.protection.outlook.com;PTR:mail-cy3pr08cu00103.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(704162011799003)(14060799003)(35042699022)(1800799024)(36860700016)(82310400026)(376014)(156008)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dwZyBiBD99JqkrBkyJmkBFFJ0eo0gfn7CN6N9/KHPdkbz0ffDmbwQQPK6lgbl7q6iAab1BKobnxorc2OZt3hFkWlK14t/jCaH5c57eUnrpI7vwlgPH0giBoamf0ARFkpQa10gRoD3Qy9tyrxpvCJhk2Qc4IeJnVzZldz271BcSmBUSydQ9EzK+JvjMaCx6qZO76oHBmp3daZLRd/mSC2oMlkWDZRBbr/LxcmaKawm6dM1aIhgAPIgtnf3w0aA69nZhpg4GH0Zg21OtvloFEIMH/r8QgnCxfDH+ey3DLHaiUyhAz1UmwtNh/B7eQnfiyCrRseUwPrtedICz7eUGvoYlFYmKDINLg/pvhJLx76iojPhVmR9MvURY5jGFyZUvU+0yIy1TP5QWJ+H7aGfu5rFbXKxuAGbW2mEO7ES9o8NpTYQpDjM8kjsENJ8Bfj3ZyU
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:33:40.1651
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf24d18c-5d95-462b-b2d2-08de9f247d63
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000023D0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR08MB8873
X-purgate-ID: tlsNG-4011c0/1776720829-45B6F8B7-073EC061/0/0
X-purgate-type: clean
X-purgate-size: 3083
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.233];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 23935434318
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This commit adds the altp2m_reset_altp2m routine on ARM. This will later be
used as part of the altp2m_flush routine.

This is commit 2/2 of the altp2m_reset_altp2m phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.

    I'm not sure if duplicating the altp2m_reset_type enum is really the
    best way to handle this. The distinction isn't even relevant on ARM
    since the logdirty ranges don't need to be freed. However, the function
    prototype has to be the same in order to call it on both x86 and ARM.
    Ideally the altp2m_reset_type enum would be part of a header that
    asm/altp2m.h includes on both architectures. The main xen/altp2m.h
    header can't fill this role since it includes asm/altp2m.h, so it would
    be a circular include. Introducing *another* header file to just hold
    altp2m_reset_type also isn't great, so I chose to just duplicate the
    enum. Any better ideas here would be appreciated.
---
 xen/arch/arm/altp2m.c             | 20 ++++++++++++++++++++
 xen/arch/arm/include/asm/altp2m.h |  8 ++++++++
 2 files changed, 28 insertions(+)

diff --git a/xen/arch/arm/altp2m.c b/xen/arch/arm/altp2m.c
index aa56b3ca79b5..bf2d9095830f 100644
--- a/xen/arch/arm/altp2m.c
+++ b/xen/arch/arm/altp2m.c
@@ -7,6 +7,7 @@
 
 #include <xen/sched.h>
 
+#include <asm/altp2m.h>
 #include <asm/p2m.h>
 
 /* Check to see if vcpu should be switched to a different p2m. */
@@ -37,6 +38,25 @@ bool altp2m_view_is_visible(struct domain *d, unsigned int idx)
     return d->arch.altp2m_state[array_index_nospec(idx, d->nr_altp2m)] == ALTP2M_VISIBLE;
 }
 
+void altp2m_reset_altp2m(struct domain *d, unsigned int idx,
+                         enum altp2m_reset_type reset_type)
+{
+    struct p2m_domain *p2m;
+
+    ASSERT(idx < d->nr_altp2m);
+    p2m = d->altp2m_p2m[array_index_nospec(idx, d->nr_altp2m)];
+
+    p2m_write_lock(p2m);
+
+    while ( p2m_flush_table(p2m) == -ERESTART )
+        continue; /* No preemption support here */
+
+    p2m->lowest_mapped_gfn = INVALID_GFN;
+    p2m->max_mapped_gfn = _gfn(0);
+
+    p2m_write_unlock(p2m);
+}
+
 int altp2m_activate_altp2m(struct domain *d, unsigned int idx,
                            p2m_access_t hvmmem_default_access)
 {
diff --git a/xen/arch/arm/include/asm/altp2m.h b/xen/arch/arm/include/asm/altp2m.h
index 192240f48c33..14961736a238 100644
--- a/xen/arch/arm/include/asm/altp2m.h
+++ b/xen/arch/arm/include/asm/altp2m.h
@@ -52,6 +52,14 @@ int altp2m_set_view_visibility_locked(struct domain *d, unsigned int altp2m_idx,
 int altp2m_activate_altp2m(struct domain *d, unsigned int idx,
                            p2m_access_t hvmmem_default_access);
 
+/* Reset an altp2m view */
+enum altp2m_reset_type {
+    ALTP2M_RESET,
+    ALTP2M_DEACTIVATE
+};
+void altp2m_reset_altp2m(struct domain *d, unsigned int idx,
+                         enum altp2m_reset_type reset_type);
+
 #else /* CONFIG_ALTP2M */
 
 static inline bool altp2m_supported(void)
-- 
2.34.1


