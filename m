Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DzfEuSX5mnCygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:17:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAF7433EB7
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:17:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287427.1567839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvzT-0004i8-9V; Mon, 20 Apr 2026 21:17:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287427.1567839; Mon, 20 Apr 2026 21:17:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvzT-0004f5-52; Mon, 20 Apr 2026 21:17:11 +0000
Received: by outflank-mailman (input) for mailman id 1287427;
 Mon, 20 Apr 2026 21:17:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEvzR-0004ej-7w
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:17:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEvzQ-001Ojx-Kr
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:17:08 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e697d2-5cb7-0a2a0a5109dd-0a2a4508e948-6
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:17:08 +0200
Received: from [52.101.52.115]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e697d3-63b5-0a2a45080019-34653473f6b2-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:17:08 +0200
Received: from IA4P221CA0011.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:559::14)
 by CO6PR08MB7771.namprd08.prod.outlook.com (2603:10b6:303:146::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Mon, 20 Apr
 2026 21:17:00 +0000
Received: from BL6PEPF0002256E.namprd02.prod.outlook.com
 (2603:10b6:208:559:cafe::77) by IA4P221CA0011.outlook.office365.com
 (2603:10b6:208:559::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:17:00 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 BL6PEPF0002256E.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:16:59 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzywq0D59z1wdP; 
 Mon, 20 Apr 2026 14:16:59 -0700 (PDT)
Received: from DM2PR04CU003.outbound.protection.outlook.com
 (mail-dm2pr04cu00300.outbound.protection.outlook.com [40.93.13.56])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:16:58 -0700 (PDT)
Received: from CH0P223CA0024.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::12)
 by DM6PR08MB6427.namprd08.prod.outlook.com (2603:10b6:5:1e2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:16:50 +0000
Received: from DS3PEPF0000C380.namprd04.prod.outlook.com
 (2603:10b6:610:116:cafe::73) by CH0P223CA0024.outlook.office365.com
 (2603:10b6:610:116::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:16:50 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 DS3PEPF0000C380.mail.protection.outlook.com (10.167.23.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:16:49 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:16:46 +0200
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
 b=vLQz09pz+NyPanAdtgFij9TJzvBzdy0+P/vwjYQOrLV/kFPAHQpF2IT/gEhTruz9xIvC8s8a/mnhCtitECQ5Zu1yyGeM6B64JiL0VSWYVndqp5LUYDfeQHYV7hDQC0MMdwJqG9Ineyva2Th+ep2KGNY07UbQJ3V/W8Z3Bd/14+ixijAIU8hUsQk4LAL3WTNn5swf4U+VWlKjAolPPSOjmK1Ux2wnsmWvaUt/sEe7SRkaoqYrOqYj37e6Zct6VvqKDmL4YxnFC5nGouj5R4GkaP9yHQV75pXIMouBehFRHs+sWp7TgSCtX1vHqKpqU3Oh4Ikc1nOVwODdpPc3c3Qzgg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZmKInt9aDaXWoQsf+7PgzNCnu/gQkWKtbvxoqa67GlM=;
 b=ufgH+CXcoF0yWIq3DM9h9IWBMbMUpq7izr7kDXcQk4jae6/K4fFxOK2uXz+xvY5qifftQpAlLMD7LSNuQhFWyFeDUFR0ManguOER11F9d/26WGV3KNR0MFoYeQiT2zMwnuNc981yVQQSjxxi2SAl+jt2aL5a998IsdG8YVRoYklKVr8fOnJvqXKBj+XtLzMVxXhgd4vuceOdse8fdTI8ah6WUPg3Tp4gsU1GkSuSRlTaqQO/JFhdOdCqUgJDQjAeAaQ2ZNN3AcF6Vp6xz5whl3wQ2Ghg5MqX2kmwRWyN1RKMVrt4RyUiU7Hpd94YLVkkWRAg5unLePpMjsil79aQyw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.13.56) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZmKInt9aDaXWoQsf+7PgzNCnu/gQkWKtbvxoqa67GlM=;
 b=ZrrjsmH0/qMv+jCvuokVKIY1vfjuElv4IKGECdYIv9R1KE/DdmX1fDSt0CVEiao7VIisW+Pp+UHQriL2t2QrUj9MvX9fIOHn2kdobzvXHhmcEOopLzGkSkgZWo9riQuKhbAD5/lKuJdh6DoJUuDZ6FjUcejC3AAyGIQdfZjVutI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.13.56)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.13.56 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.13.56; helo=DM2PR04CU003.outbound.protection.outlook.com;
 pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lKIWARuCbhk8wvtUrtNczTDXmg8QuCy8FdVrz57grR1Ry5l9RXVkd9Ll9Fu49FUcyxWSwoD6d66KBplrQTOGuZ5383VsHA5oErVmYK115RJsUCY0g0Oju8DJpzs/ZS4pWqqsVDbo+bVd5ExR2KDuP5Se+O/gEbcnmZXFWPLF7NrJIdnBUCXdT9JDUvegXLU3nDs/wOFNDt0k3H8Qn6rLvWtAhwlUDDZVby1n+1Q3dkaJPGTR0yLUU3A8DYdSqjdWAxiiAahnbsuCS/oHCX6pzXW0c2quh4RFaGubtNwlK4KwTO8zjLrW4oPV+gB8/+2lzpJHvvwuUqKzPUjZYvpr5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZmKInt9aDaXWoQsf+7PgzNCnu/gQkWKtbvxoqa67GlM=;
 b=bhPIghia8KevM83yyJXl8AjBr/f/ULB5XfhUDoriKO+FuCUSc/U0HD0Hn5N5j+eYrYxO1DxIVkVudB95vYKcgim0ziSolWDNzInJY+9eOQaBr3vRv9kKYx/3p0t8xAmmDfKbi/yprFREqDJcTpH3ISHCDma0oKv/LMSy3Hhxo6sVeQwI373P8HgDCQYUhq/CyMrGdsKYMLS4Fj28marwRTR9Bv1wbeAFZv7tyKo+W6tusN4QijAxY8epFbrUgNgL8a1u0u6q2j2R5J+p+T+rqDjJKuh3Z48tZvaqnbM/lQVDIpjQMB6oAhjmipH1uSlJEsn7hGCfJlznMqndRcMAIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZmKInt9aDaXWoQsf+7PgzNCnu/gQkWKtbvxoqa67GlM=;
 b=ZrrjsmH0/qMv+jCvuokVKIY1vfjuElv4IKGECdYIv9R1KE/DdmX1fDSt0CVEiao7VIisW+Pp+UHQriL2t2QrUj9MvX9fIOHn2kdobzvXHhmcEOopLzGkSkgZWo9riQuKhbAD5/lKuJdh6DoJUuDZ6FjUcejC3AAyGIQdfZjVutI=
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
 Stabellini" <sstabellini@kernel.org>, Tamas K Lengyel <tamas@tklengyel.com>
Subject: [RFC PATCH v6 02/43] altp2m: Move altp2m_active to common domain struct
Date: Mon, 20 Apr 2026 17:16:37 -0400
Message-ID: <20260420211637.208503-1-Rose.Spangler@elektrobit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420211104.208444-1-Rose.Spangler@elektrobit.com>
References: <20260420211104.208444-1-Rose.Spangler@elektrobit.com>
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
	DS3PEPF0000C380:EE_|DM6PR08MB6427:EE_|BL6PEPF0002256E:EE_|CO6PR08MB7771:EE_
X-MS-Office365-Filtering-Correlation-Id: c2abedaa-3679-4253-044c-08de9f22294e
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|704162011799003|36860700016|1800799024|7416014|376014|82310400026|13003099007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?pEa8Wb6AONkw9QreZy8l6bCSiRwux4cPULYgbCUip+M0JUlmBhF9Zeike9KC?=
 =?us-ascii?Q?eAQPiJBroxIs8/BeeNSWU1zZXy/desFf+FzQzlMEzd8LPjZwFrF+yKT8XGqf?=
 =?us-ascii?Q?mNPq4Hm+Jq0Aij4VtTLdzTANdwFodXNg4R1zMaP6ytdQvEaoHRoiQxpB0GQm?=
 =?us-ascii?Q?QrOVWxmM3buoElZ05iv3OSqpenZQseM25/X3WJ/qTLKlCCuYy1Dm+FplW+R7?=
 =?us-ascii?Q?QEn0ATZLDpTxFlsSs3G7EjscgcPNvZkjS3DYp4AxoY+g99b/Hr1cC5s7UZML?=
 =?us-ascii?Q?Vs6cqEavrR13/HrvJVH4qtBSQO3Tf28kFo87FfXIcIwiQZegA8aQ/tA6l0O9?=
 =?us-ascii?Q?KEaILhRMmJMjILP1I5rZCIcb6iV5KuRLd4ssGKPKQVff8Zty4lzh9+0OTgXa?=
 =?us-ascii?Q?k/bLN1z8rur0kaw/t4y5kpcdqkyeln7hFEv0i9fNfmV9vXWLy0xBh44/SWp/?=
 =?us-ascii?Q?8hcQPdrKex/BTLM1dl8Ye3EvbHdSSVr311Jt5sx9cQWTu46zDZxJ5HudLt3g?=
 =?us-ascii?Q?/j/PR32ULmApHKFtioC7s5OuFivy+pW9xVRTwetVSJ+V4geQOuV25y78FxAk?=
 =?us-ascii?Q?fHKL7Gvgoz/FZ0iFUNenOvwSNXNeAHUwEC4ZDbSbS9wJMbrZJzJ7vCrub1Ak?=
 =?us-ascii?Q?dTLRjVHkiqlZdUyRa9yZUU6NYHPR980WKqXoG+wsA23enD/PiVRCU4yKPI73?=
 =?us-ascii?Q?xKYEVSzbQ3wzba/VBAXem3gEPYVgyc6AxGL1bVPmbcq25coe450/O0qj3yeO?=
 =?us-ascii?Q?DyFIpULNnLMLordYf9/XH2jnmQKhtO1/+2FocDoYbMY0NUecrpiU/8Uj58eP?=
 =?us-ascii?Q?AfA7Wb2SPuASzSo5iPGExtywpFhZZtgnQlS72+YvDZzRiI1GiPRZJr3Z+fX6?=
 =?us-ascii?Q?fEhOgvLhXAOK0ohlheZep1p8N5Lv69kvMWALoZfR4iEXSyFlFn4rIqogSI4W?=
 =?us-ascii?Q?wFEpiYPbYKqP+dUm00+i184Z2jNWdZnWGjr2Xs/8+U12ZboosPfQsCvtCOG4?=
 =?us-ascii?Q?MM6rw452obWFgDSFFwRM2grDKc5ie8M6Ry0Rq/Ou+5lU95Hg8Wp0P3XzWRwA?=
 =?us-ascii?Q?ep1Lzt9DRkMe0G/8Mkv6dDnQ3+o2QUU0C+b7/c5kB2fKjWAK2WdCWHuq+HmV?=
 =?us-ascii?Q?i67NYlgt9KaP1+gbPpgdAqXfIeLceBl6xg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(704162011799003)(36860700016)(1800799024)(7416014)(376014)(82310400026)(13003099007)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 Yf7W7J+NiaMUSzHGE7oy95cHoYYvo9MRhchp9I9t6aAaWQuvagW2qiIzLndtprhHJic/p1pbU60upEt3TVbX9fHs3UvfY0NUvFqlY6e1VxFDivlbQXc3K3lL77UaMkMOYgMWe0jVC/wgOROHYP3uaujiz4mNjVtlLHZKcw/q6q+z7cK/TDvE7y7A79cBEy6a+z5ry9wPp18HCCy/L6n0tFTizMpbUaZiKzmFibRiPO25PG+wLnZ6hhDJz5/R4irMeKL6302QH/2iQpnQJ72ILwku30de/l1nd2hYazRMK66K/lee9wSwITWolqNptFoJFPnw9Pm7BiMHyfmjbVkZcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR08MB6427
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.13.56];domain=DM2PR04CU003.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.13.56];domain=DM2PR04CU003.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 BL6PEPF0002256E.namprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f794ac8f-77eb-4c74-03d2-08de9f2222f9
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|704162011799003|36860700016|1800799024|376014|7416014|14060799003|35042699022|82310400026|156008|13003099007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ByFgasog3piOtg/wqBB9d2Gfj1ZM4z/3KQGvC2OpsGEMgPc3Py7F1OIbXsZy?=
 =?us-ascii?Q?+Q2arSH4IQkG2uIcoUAbQEVa9H8gBH35MFoh+BOuLOdRc5qwJGd5uOcTPLIz?=
 =?us-ascii?Q?A4/FrWCVsSaoae34J+nQiMaNKFuaD5k6Ai9XmOHVakzpaGjp2ENVJnL7YXzd?=
 =?us-ascii?Q?tAYNX5GrDJG1frYVE7N8Hgu2Yj4vxhDX75MAt2H6/RWu17MwG5TzIcPaCHhi?=
 =?us-ascii?Q?XgcQeHkIUnhBOfPqS21yNBM5qDbRa7FEf83hnwFuGhU/PgOZ7I4M3ipgynwk?=
 =?us-ascii?Q?jhk6psEC3Z0S6RIn72gFDhshnZDnWpKOJtZOOSD4e+0TBkn8AaMKzwgYPKBh?=
 =?us-ascii?Q?mHlUH37Ij4Knxhbq++sksDgUByDUbxosmb/wKOEMHoIp1Rt0urT1nYhdduaV?=
 =?us-ascii?Q?y2g2E8cPpmgoH5oZ+tM45TcORQt3eVTRu00D0GjMGFq96TdQr+6CRtySJpeY?=
 =?us-ascii?Q?QV6xe71tB1UMRdScV7h/XSBvul2DyhHUmTP0GDExuZfg1smcMDtOaxdX4+pw?=
 =?us-ascii?Q?yQ/cos/M5CS3Jf+FMuGlrR0eTUFKpNsRJKV/Px/BHOhVFkLy6VeFhVTPrlEw?=
 =?us-ascii?Q?p2nfxM8jaO5WDVST3wvTjI+Kph1pZ6iH0075h8tntrYhry81HCtE+LENav7U?=
 =?us-ascii?Q?G/wW2OJq/QPCku2CcP/g9vLUmd7ncqmEgh+K4iw9S+xdFIsD9sCiJhS9lQMe?=
 =?us-ascii?Q?2b0OkSt47Y9JhmgxsAZvzNRBxAHEfjedMHvlqQR2sk0Zm0TOfwEdUa1ui1lR?=
 =?us-ascii?Q?qy0VvXDnOwnPscVvpmFWlzgg2uaVesUeqbkuD81A9z0rPVY1sAmns8t+9/li?=
 =?us-ascii?Q?dX9z3qPJFTeNDh8toOWjuBRz0Vw4hAL6AokCBB4+1JusR+4u6S7Re7W65dK1?=
 =?us-ascii?Q?l1mt1RfpEvXiSJsN+xeZyAyGiphC8xWWBPioYTZ+9ewX03HTHI1iUvCv/3bG?=
 =?us-ascii?Q?nv8XPoEoFxGwPfFE7c5MIEEd6/nvxkEFk5CPPfR6yDW4XT9u4n7Xc3UJQZT4?=
 =?us-ascii?Q?dBXECCrsp+G6FMFD7e3hKStJJruXS4nN8pHtAvstP0tFuywNs49bJm7ov0Ig?=
 =?us-ascii?Q?CcFUZE+sSkjvEwPN2qoM64jSLmsWKjvo0F8r1RutrzvJlIPm85qPkOuKL6R+?=
 =?us-ascii?Q?oqbULBktRFF26ok9inVpoCecJwnBzdyeng=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM2PR04CU003.outbound.protection.outlook.com;PTR:mail-dm2pr04cu00300.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(704162011799003)(36860700016)(1800799024)(376014)(7416014)(14060799003)(35042699022)(82310400026)(156008)(13003099007)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZGnHesQTMak874m5yD+kvevsHbLvRsxZhIwOmSnkNxNyQii/+xAwvr4cSbI2IFTSEqnroZ6d9xQf7m5OhJXLVwPZbXw2lyOX+xJZgpAOQH3N8VAMLms5fsthHvpMBoex0LL2OhTj5oLsa84V+hiqTto521Dx4KR0E321oPXJ5RBPni5sM6gB32+XTuCVexVAUMlR2HzH7BDN7s4wb6oUUA3H86On2/x7lvbK1lUXo6mq19edEVCYhw8OhykL9ZtKv42PEbj7etMv27L8xy/UYH3ym1xeTWXHMuGtL+cKWgWpcVvki41lOIr5Ms7c/WgDA3TsUS4GHFRV6+gsCGT0lT2eKBnXOlfq1iy67+mmtQN5jkZMcPgr0LyNW3IMyQHyVuz5B+ihYw3u2/56YCwS1AlsISI0c2yl9nTuVNHvfn1cWZYAsUWh2pTpD+K3l1Y0
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:16:59.9803
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2abedaa-3679-4253-044c-08de9f22294e
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0002256E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR08MB7771
X-purgate-ID: tlsNG-c1860d/1776719828-C2368DB1-EB01C23D/0/0
X-purgate-type: clean
X-purgate-size: 10620
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
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:tamas@tklengyel.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[elektrobit.com:+];
	NEURAL_SPAM(0.00)[0.826];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[17];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gnu.org:url]
X-Rspamd-Queue-Id: 4FAF7433EB7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This commit moves altp2m_active from arch_domain on x86 to the common
domain struct. Similarly to nr_altp2m, this is not an arch-specific value.
Moving it to common code allows the common altp2m routines introduced later
in this patch series to operate on altp2m_active without needing an
altp2m_active member on arch_domain for each architecture supporting
altp2m.

This is commit 2/8 of the preparation phase.

This commit is a refactor, and no change in functionality is intended.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.
---
 xen/arch/x86/hvm/emulate.c        |  1 +
 xen/arch/x86/hvm/hvm.c            | 11 ++++++-----
 xen/arch/x86/hvm/monitor.c        |  1 +
 xen/arch/x86/hvm/vmx/vmx.c        |  1 +
 xen/arch/x86/include/asm/altp2m.h | 11 -----------
 xen/arch/x86/include/asm/domain.h |  2 --
 xen/arch/x86/mm/altp2m.c          |  1 +
 xen/arch/x86/mm/hap/hap.c         |  5 +++--
 xen/arch/x86/mm/mem_access.c      |  1 +
 xen/arch/x86/mm/mem_sharing.c     |  1 +
 xen/arch/x86/mm/p2m-ept.c         |  1 +
 xen/arch/x86/mm/p2m-pt.c          |  1 +
 xen/arch/x86/mm/p2m.c             |  1 +
 xen/common/monitor.c              |  1 +
 xen/include/asm-generic/altp2m.h  |  8 --------
 xen/include/xen/altp2m.h          | 19 +++++++++++++++++++
 xen/include/xen/sched.h           |  2 ++
 17 files changed, 40 insertions(+), 28 deletions(-)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index f3aae158e9f8..9a9b89a232e6 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -9,6 +9,7 @@
  *    Keir Fraser <keir@xen.org>
  */
 
+#include <xen/altp2m.h>
 #include <xen/init.h>
 #include <xen/iocap.h>
 #include <xen/ioreq.h>
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 4a81afce02e7..86c12c0d1ef4 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -7,6 +7,7 @@
  * Copyright (c) 2008, Citrix Systems, Inc.
  */
 
+#include <xen/altp2m.h>
 #include <xen/console.h>
 #include <xen/cpu.h>
 #include <xen/domain.h>
@@ -4612,7 +4613,7 @@ static int do_altp2m_op(
 
     if ( (a.cmd != HVMOP_altp2m_get_domain_state) &&
          (a.cmd != HVMOP_altp2m_set_domain_state) &&
-         !d->arch.altp2m_active )
+         !d->altp2m_active )
     {
         rc = -EOPNOTSUPP;
         goto out;
@@ -4657,11 +4658,11 @@ static int do_altp2m_op(
         if ( rc )
             break;
 
-        ostate = d->arch.altp2m_active;
-        d->arch.altp2m_active = !!a.u.domain_state.state;
+        ostate = d->altp2m_active;
+        d->altp2m_active = !!a.u.domain_state.state;
 
         /* If the alternate p2m state has changed, handle appropriately */
-        if ( d->arch.altp2m_active != ostate &&
+        if ( d->altp2m_active != ostate &&
              (ostate || !(rc = p2m_init_altp2m_by_id(d, 0))) )
         {
             for_each_vcpu( d, v )
@@ -4676,7 +4677,7 @@ static int do_altp2m_op(
                 p2m_flush_altp2m(d);
         }
         else if ( rc )
-            d->arch.altp2m_active = false;
+            d->altp2m_active = false;
 
         domain_unpause_except_self(d);
         break;
diff --git a/xen/arch/x86/hvm/monitor.c b/xen/arch/x86/hvm/monitor.c
index d22a2e464460..84c1c2234ca9 100644
--- a/xen/arch/x86/hvm/monitor.c
+++ b/xen/arch/x86/hvm/monitor.c
@@ -22,6 +22,7 @@
  * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <xen/altp2m.h>
 #include <xen/vm_event.h>
 #include <xen/mem_access.h>
 #include <xen/monitor.h>
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 269ca5643346..ff895f7f9437 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2004, Intel Corporation.
  */
 
+#include <xen/altp2m.h>
 #include <xen/domain_page.h>
 #include <xen/guest_access.h>
 #include <xen/hypercall.h>
diff --git a/xen/arch/x86/include/asm/altp2m.h b/xen/arch/x86/include/asm/altp2m.h
index 9c1ac3cc2676..ad5ded833a75 100644
--- a/xen/arch/x86/include/asm/altp2m.h
+++ b/xen/arch/x86/include/asm/altp2m.h
@@ -28,12 +28,6 @@ static inline bool altp2m_is_eptp_valid(const struct domain *d,
         mfn_x(INVALID_MFN);
 }
 
-/* Alternate p2m HVM on/off per domain */
-static inline bool altp2m_active(const struct domain *d)
-{
-    return d->arch.altp2m_active;
-}
-
 static inline uint16_t altp2m_vcpu_idx(const struct vcpu *v)
 {
     return vcpu_altp2m(v).p2midx;
@@ -64,11 +58,6 @@ static inline bool altp2m_is_eptp_valid(const struct domain *d,
     return false;
 }
 
-static inline bool altp2m_active(const struct domain *d)
-{
-    return false;
-}
-
 /* Only declaration is needed. DCE will optimise it out when linking. */
 uint16_t altp2m_vcpu_idx(const struct vcpu *v);
 void altp2m_vcpu_initialise(struct vcpu *v);
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 385a6666dafa..0cf0c0d92087 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -368,8 +368,6 @@ struct arch_domain
     mm_lock_t nested_p2m_lock;
 
 #ifdef CONFIG_ALTP2M
-    /* altp2m: allow multiple copies of host p2m */
-    bool altp2m_active;
     struct p2m_domain **altp2m_p2m;
     mm_lock_t altp2m_list_lock;
     uint64_t *altp2m_eptp;
diff --git a/xen/arch/x86/mm/altp2m.c b/xen/arch/x86/mm/altp2m.c
index 0bc9b9ad2f52..08db8f37c1b1 100644
--- a/xen/arch/x86/mm/altp2m.c
+++ b/xen/arch/x86/mm/altp2m.c
@@ -8,6 +8,7 @@
 #include <asm/p2m.h>
 #include <asm/altp2m.h>
 #include <public/hvm/hvm_op.h>
+#include <xen/altp2m.h>
 #include <xen/event.h>
 #include <xen/xvmalloc.h>
 #include "mm-locks.h"
diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index 5ccb80bda5d3..3d563b3bc2d1 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -7,6 +7,7 @@
  * Parts of this code are Copyright (c) 2007 by XenSource Inc.
  */
 
+#include <xen/altp2m.h>
 #include <xen/types.h>
 #include <xen/mm.h>
 #include <xen/trace.h>
@@ -528,7 +529,7 @@ int hap_enable(struct domain *d, u32 mode)
                goto out;
         }
 
-        d->arch.altp2m_active = false;
+        d->altp2m_active = false;
     }
 #endif /* CONFIG_ALTP2M */
 
@@ -595,7 +596,7 @@ void hap_teardown(struct domain *d, bool *preempted)
             for_each_vcpu ( d, v )
                 altp2m_vcpu_disable_ve(v);
 
-        d->arch.altp2m_active = false;
+        d->altp2m_active = false;
 
         FREE_XENHEAP_PAGE(d->arch.altp2m_eptp);
         FREE_XENHEAP_PAGE(d->arch.altp2m_visible_eptp);
diff --git a/xen/arch/x86/mm/mem_access.c b/xen/arch/x86/mm/mem_access.c
index e55e53f44c78..a9d6b081a523 100644
--- a/xen/arch/x86/mm/mem_access.c
+++ b/xen/arch/x86/mm/mem_access.c
@@ -9,6 +9,7 @@
  * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
  */
 
+#include <xen/altp2m.h>
 #include <xen/guest_access.h> /* copy_from_guest() */
 #include <xen/mem_access.h>
 #include <xen/nospec.h>
diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 5c7a0ff30e8b..8319733b1bb6 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -8,6 +8,7 @@
  * Copyright (c) 2009 Citrix Systems, Inc. (Grzegorz Milos)
  */
 
+#include <xen/altp2m.h>
 #include <xen/types.h>
 #include <xen/domain_page.h>
 #include <xen/event.h>
diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index dfdbfa0afec8..ed850723f5fd 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2007, Intel Corporation.
  */
 
+#include <xen/altp2m.h>
 #include <xen/domain_page.h>
 #include <xen/sched.h>
 #include <public/hvm/dm_op.h>
diff --git a/xen/arch/x86/mm/p2m-pt.c b/xen/arch/x86/mm/p2m-pt.c
index 5a6ce2f8bc2e..17f38aac14d5 100644
--- a/xen/arch/x86/mm/p2m-pt.c
+++ b/xen/arch/x86/mm/p2m-pt.c
@@ -12,6 +12,7 @@
  * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
  */
 
+#include <xen/altp2m.h>
 #include <xen/vm_event.h>
 #include <xen/event.h>
 #include <xen/trace.h>
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index fddecdf978ec..41517765c5ec 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -11,6 +11,7 @@
  * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
  */
 
+#include <xen/altp2m.h>
 #include <xen/iommu.h>
 #include <xen/mem_access.h>
 #include <xen/vm_event.h>
diff --git a/xen/common/monitor.c b/xen/common/monitor.c
index d5c9ff1cbf8c..e758a3fea9f1 100644
--- a/xen/common/monitor.c
+++ b/xen/common/monitor.c
@@ -19,6 +19,7 @@
  * License along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <xen/altp2m.h>
 #include <xen/event.h>
 #include <xen/monitor.h>
 #include <xen/sched.h>
diff --git a/xen/include/asm-generic/altp2m.h b/xen/include/asm-generic/altp2m.h
index 39865a842ab3..ecee6942f4e8 100644
--- a/xen/include/asm-generic/altp2m.h
+++ b/xen/include/asm-generic/altp2m.h
@@ -4,16 +4,8 @@
 
 #include <xen/bug.h>
 
-struct domain;
 struct vcpu;
 
-/* Alternate p2m on/off per domain */
-static inline bool altp2m_active(const struct domain *d)
-{
-    /* Not implemented on GENERIC. */
-    return false;
-}
-
 /* Alternate p2m VCPU */
 static inline unsigned int altp2m_vcpu_idx(const struct vcpu *v)
 {
diff --git a/xen/include/xen/altp2m.h b/xen/include/xen/altp2m.h
index 520328fd3fa8..b3b21124dd7e 100644
--- a/xen/include/xen/altp2m.h
+++ b/xen/include/xen/altp2m.h
@@ -2,4 +2,23 @@
 #ifndef __XEN_ALTP2M_H__
 #define __XEN_ALTP2M_H__
 
+#include <xen/sched.h>
+
+#ifdef CONFIG_ALTP2M
+
+/* Alternate p2m HVM on/off per domain */
+static inline bool altp2m_active(const struct domain *d)
+{
+    return d->altp2m_active;
+}
+
+#else /* CONFIG_ALTP2M */
+
+static inline bool altp2m_active(const struct domain *d)
+{
+    return false;
+}
+
+#endif /* CONFIG_ALTP2M */
+
 #endif /* __XEN_ALTP2M_H__ */
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 212c7d765c3e..458f2f260dd7 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -623,6 +623,8 @@ struct domain
     } monitor;
 
 #ifdef CONFIG_ALTP2M
+    /* altp2m: allow multiple copies of host p2m */
+    bool altp2m_active;
     unsigned int nr_altp2m;    /* Number of altp2m tables. */
 #endif
 
-- 
2.34.1


