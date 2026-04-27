Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFouD+cq72n98gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 11:22:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9361246FD25
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 11:22:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1294737.1571434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHIA0-000111-8w; Mon, 27 Apr 2026 09:21:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1294737.1571434; Mon, 27 Apr 2026 09:21:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHIA0-0000yZ-5x; Mon, 27 Apr 2026 09:21:48 +0000
Received: by outflank-mailman (input) for mailman id 1294737;
 Mon, 27 Apr 2026 09:21:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wHI9y-0000yT-Ds
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 09:21:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHI9w-00BlPq-UO
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 11:21:44 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69ef2aa6-5cb7-0a2a0a5109dd-0a2a450ad65e-10
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 11:21:44 +0200
Received: from [52.101.201.64]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69ef2aa6-56b3-0a2a450a0019-3465c9406e3b-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 11:21:43 +0200
Received: from MN0PR02CA0004.namprd02.prod.outlook.com (2603:10b6:208:530::11)
 by MW4PR12MB6730.namprd12.prod.outlook.com (2603:10b6:303:1ec::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Mon, 27 Apr
 2026 09:21:38 +0000
Received: from MN1PEPF0000F0E0.namprd04.prod.outlook.com
 (2603:10b6:208:530:cafe::bb) by MN0PR02CA0004.outlook.office365.com
 (2603:10b6:208:530::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Mon,
 27 Apr 2026 09:21:37 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 MN1PEPF0000F0E0.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Mon, 27 Apr 2026 09:21:37 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 27 Apr
 2026 04:21:37 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 27 Apr 2026 04:21:35 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XAcI4fRGtXgxyYTrpAcpMHaALa969/iT1CA3lScCiXD39zXWBB/bc/+w46mx6HVdCb7UIbSnUraZFjnszAK12FZ4GDMIpJ77B7Y2iKHtspLDq5N+8Xa+U5e3uu+rmv/XB8yKi6ip/LByTJFW2SxYGNUeZ46yotqKXP7Kx70Dq6IBxbJp4wayUqB87fjf85DNTdXNpB4rvsQToujBZeenihJULMpxogfercGuKGUAv4JWCYh3C8HZCAW4EqkvDoJDY+lFY6VMUJce4BQurM4o0GnV9fkcBbZnDArFYNhSNaHZc4ICOnvmJs4MPVgTpljDwBWB6aTHmJdMFMe3xy4I1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rDRa2YENjPiUPVFKF9FwQEopV3rjTG+wNc0PT4Bgb1U=;
 b=myFEwoLCygfLIawrUOiDlrdFphHbhXwC1y0Kxl+FqZCDM5TK0MIuYzP9LY/2szQK2jzoyRna5WME6KS6Ni7MomHaztQSyaxfYdAtaXgCFuYAvQ8Z9FDAgR5Ryqfbg7Yzx01+0sZiOQMTfgKX2qFCbC7N3fabGVNjqaJvhBfFktGK9axmF+tOrxUVG/IfhSgSoCGZJdEoQDSw8SJtCxlrf6tMPDyKFLY3mxlOvgLR5hRVNJY5PMBitE6Mb3qfENmU7wcAsm5VrND+bU/3eZeI4M9+1C8KaIyhce23Wr7YwVwpSFL0JoVTNHaUyoj/OrWrUu5zIDdDlHFVF5DQ/j6ONw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rDRa2YENjPiUPVFKF9FwQEopV3rjTG+wNc0PT4Bgb1U=;
 b=bSzgRwt+EBoGn6IigJc5dsJPi+bFPZxn71aZ6iCfeRLz2IlczjPZ5/RRSROWAdU/HeVRyl95GeoUs6xNAhXi3w0Fa8pFMJxRjOPJYlac07cQi5ZMSZCXTI0c0mE9oSXf5FHy9J5jBUPjcopty0GMoeyXt+CqKv4vf7UqAvJarIM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <71ae72eb-3424-4d41-afb7-9f1462e84aaf@amd.com>
Date: Mon, 27 Apr 2026 11:21:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] xen: introduce CONFIG_HAS_DOMAIN_TYPE
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Romain Caritey <Romain.Caritey@microchip.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1776957840.git.oleksii.kurochko@gmail.com>
 <fa2e255e53fe3aef2075ba8457be5fd4ba9156d1.1776957840.git.oleksii.kurochko@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <fa2e255e53fe3aef2075ba8457be5fd4ba9156d1.1776957840.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E0:EE_|MW4PR12MB6730:EE_
X-MS-Office365-Filtering-Correlation-Id: b8c5cb0a-74c7-48c6-58bd-08dea43e6228
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	t3lugM+UK3uwOXdLoAdM3vi+OB5mDx07AXk3YIgFafhgjvOQO6S0TJcLBVubrD013hWMhFjnDI/qqx4aQt3TRfVJ93lm3lTGU3+vtXqx9fmb87Jh3iCdqkXne02tys55pWnHJEntX/u4W/9vqDCzmrePyJiRm3/eEFtziPLTPMDkLOiQy6klzHBHyTVz5MKu2msVBCTWNlOIzNb8wTpKoHBWDtb0EBh4erQ9B8R2tTgRvwp/QJSFt/akqvlNkG/1gc0HWiEqX0HO7q5PihPjQPWl27D6HwQ5XKrc/+Q+TocmssreH+u2m54LVKTrfDr1+LpqmVyrkk8l31mcMHELzwgMc6cZqcS2slBKlsUTNFPsk/aqKgr+09VPeOGyOQ8t12VwxSSJfHcDXvksrs6M7xVL04Ma5lOQ8uw47IGGjAFMCwhRxlmEhigZoLoWwR/Q4yq85b9yG2RLZBrb8jyg1LIB3yt+0nfQ2qO7blrL9frF8irTQ3aXN7JKFu2EIzVDXr7kSgA62B6Lc1Q7rsyRBAVqORYiNRILtrvmuTLvIIXcsvAbbNc5g5uuXpkceXDuskUM1RaboIAkmInm+B7TeXBJqFCSVovqHeh2bSCV7HYj2F569sXhhkIA92TJ13a19k6zRc8IWDP1TM1kamdhUj68fkAxqTNaoM0MNzC8ZyovuwcCx7HTV5Xx6RI3MHPlZKyRrj91QeU9lN9QqObrzC3urX7d/rz6Vkxk1CJALwa6P186lhPINc1aXi2YzdCy8b3GmFZ7M++4Whl0O+E3lQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	P/KOPCUG9dYLl5q7rIE5O+XXMgbMw6pDAR4OTRIXFVm9EodTVDraJgwxSqEvN8ddpvUOWNj6QjeTr1uRXOZMREU8qYmOV8ZlBlkm0AVI3YLVaJ55JoArhEXUe3FQAlThkBuAYBddF73uVCOY8HM+RrrBtotzM+PWFGTo5Yv0pVSSG2ekbg2wXk3QTruBoJXwwYTgsNwJ8ab6m2YNQe0biGLhFckby44GJY0z9yu3iDexwK8NmevRIu5+qjCVpwlO5Pajh82F39BC1cPdAu0W7oMK4W6nbGMEvW7hn+ZdtJTDxTIcqsMcdx4OOgAJBjzA3vPWvCbgLjhz7BQ7rxtSUpahrPx7A+eax6IdVoWCYFpEJ4SWxPckRUOC6ZpGs7Z0dzVb80ZMcbVvAKK0GsUQ8T8TdxImXmrCBjru+1gINYamtve4kRbxC6NHTDou3GEh
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 09:21:37.4479
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8c5cb0a-74c7-48c6-58bd-08dea43e6228
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6730
X-purgate-ID: tlsNG-4011c0/1777281704-453638B7-31460ADA/10/73395122804
X-purgate-type: spam
X-purgate-size: 873
X-Rspamd-Queue-Id: 9361246FD25
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns]



On 24-Apr-26 3:36 PM, Oleksii Kurochko wrote:
> As domain type is part of common code now there is no any reason
NIT: remove "any" after "no"

> to have architecture-specific set_domain_type() functions so
> it is dropped.
> 
> Change the guard around access of kinfo->type to CONFIG_HAS_DOMAIN_TYPE
> for consistency. Also, drop and add some parentheses to be aligned
> with the similar if() below.
> 
> x86 with CONFIG_64BIT=y shouldn't use is_{32,64}bit_domain() as
> x86 doesn't have support of CONFIG_HAS_DOMAIN_TYPE. Since x86_32 Xen no
> longer builds, the fallback is currently only relevant for arm32.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
You don't seem to remove enum domain_type type from struct arch_domain which is
now unused. With that removed:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


