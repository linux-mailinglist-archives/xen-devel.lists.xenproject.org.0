Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uG36IPbxjWlw8wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 16:29:58 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E61C012EF0C
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 16:29:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1229297.1535262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqYdJ-0006cQ-BH; Thu, 12 Feb 2026 15:29:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229297.1535262; Thu, 12 Feb 2026 15:29:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqYdJ-0006az-72; Thu, 12 Feb 2026 15:29:33 +0000
Received: by outflank-mailman (input) for mailman id 1229297;
 Thu, 12 Feb 2026 15:29:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zRx/=AQ=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vqYdI-0006at-7o
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 15:29:32 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d6cc0d1-0827-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Feb 2026 16:29:26 +0100 (CET)
Received: from BN9PR03CA0776.namprd03.prod.outlook.com (2603:10b6:408:13a::31)
 by MW6PR12MB7072.namprd12.prod.outlook.com (2603:10b6:303:238::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Thu, 12 Feb
 2026 15:29:19 +0000
Received: from BN3PEPF0000B077.namprd04.prod.outlook.com
 (2603:10b6:408:13a:cafe::9e) by BN9PR03CA0776.outlook.office365.com
 (2603:10b6:408:13a::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.11 via Frontend Transport; Thu,
 12 Feb 2026 15:29:04 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B077.mail.protection.outlook.com (10.167.243.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 15:29:19 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 12 Feb
 2026 09:29:18 -0600
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
X-Inumbo-ID: 9d6cc0d1-0827-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BlKJxYAWr5ed9D7SsyImVkeODMJOIHB6yxRG2OC2wpy9vNr/9fXqoDu/uOuleu1KoJm3q4ZqkWFMNErp5RzwH0qO5yOVzE8wauebAmWBQ0X/czGaK/GmTZs3YsSXv6xqw5H7sW0dmPawV2gKW0YmthwOXhLb4hkiFLd8ClT2zcI/0lLFBu8i2TXz5b/0JtlXm/JRjzLGqy7jdwnjUWgAt2VysuNtRSJ4Uz9zILOgHB0UMc0MtnPBn4VS3aSdgw8x9TUlzC6jX/ssPXOYyHwf5tDeQjIrxBd/vJZdg9D3pkD1zmXuciO3m88eYHCveZ9ANAH0jmcybQUlynihSVIJuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sw5ygoxVKiT+AAE2mVV5SNuh5d1fTHTcz39e3luENq4=;
 b=X6uBbkixlnVaPCeNMY0qM+JREe4u/0CLlUk95U1/e8gPjRh6a/K/uTEa/jy+gEXW5w/NTBv895p6SyFIk9JxfBiLIbhGnSFB16XfTVioRn7kj8kS9tb5VDlf7Nz+NCo+6ejaej1zbBVpvaBvObINYiJGqOmc30RhSwlpwHR8T11qFYeOofX8nj4IEHr2DQ6NUgWKFFQSYPMW/ZFaU8xYtbHRNANI5Up8/z2AEjcFIQ2B2NTPRUAsbnnbdJk8/dkLcvF/OlTNgoDnLX40OBnUwIKM3p4czdK3R/oqHApI7CPg0x+5dn/njzc/bxXYVpIAuIu9J6LYKh7zp5DJQQPw4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sw5ygoxVKiT+AAE2mVV5SNuh5d1fTHTcz39e3luENq4=;
 b=gFza4miggg2wCbKT8XOr97VqSvyiVyppqDF3NbxMGqdRJHzFNoX509i6hyIS0FtAnyzfUSuIkoJp5cUjezIuUhWa1gDpVOL9BEiKFZ8JhCbTTJnMR83K6qk5vlQ7Rm/L0SueQA6f8J7JW0l5J3ef98X3tRYTmoOVWWJxwTNa940=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 12 Feb 2026 16:29:16 +0100
Message-ID: <DGD39B00LVPV.1XCP36GGDSF4U@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 07/12] x86: Have x86_emulate/ implement the
 single-vendor optimisation
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
X-Mailer: aerc 0.20.1
References: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
 <20260206161539.209922-8-alejandro.garciavallejo@amd.com>
 <100f63bf-cc79-43c3-a0f6-147d2dff080d@suse.com>
In-Reply-To: <100f63bf-cc79-43c3-a0f6-147d2dff080d@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B077:EE_|MW6PR12MB7072:EE_
X-MS-Office365-Filtering-Correlation-Id: 900b0578-414d-4fd2-a787-08de6a4b7d8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?amlyRWVNRFlpci84TGlEdnNIWG5UczFPdEJpZ2xROGVOSEo1NGl6YlhpRUN6?=
 =?utf-8?B?QVVLRlQyMU9qWVE4TUdjWkZyRTBXWEExcW5VaW9aTzFjNXVFUnMyUjRORlFF?=
 =?utf-8?B?azcvbHhyV0dzeDNqbXZubEJhMjF5TEdtNlVBUjUwcytFdkJnWlg3elpraEtH?=
 =?utf-8?B?TVVUSHNCR3pGOENtNjVxVmlqVjhWMGh6dWNWUDFvQk40U3NHaUhkMlRPVlNr?=
 =?utf-8?B?blMyaWhoa2dxekF3eGNFNzJXRDIyNGhoMWFjekovcjNBSWtWQnJIbEhrSTBr?=
 =?utf-8?B?b1ovSkRlaUxHcmVOZTJJT2xWUW9PTHZ2TVF4L21zNFRvK0FKZGcvQUN3dXRR?=
 =?utf-8?B?OS9rRVNhOTdGdXVaRUEzdzRSeWFmdWxiTzc2aG9QNXphTEJ3dWFxK1IxcEpB?=
 =?utf-8?B?OWV0dmVNY0hYWStOQ0JzVTdnTVdRR2NSVUF1MWJ5ajZjR2VCelRaVmo1allT?=
 =?utf-8?B?KzlXQmc0UmtrQ1BHN3l6K3NpV1JnRDk2QTJTRmp3U3pMR3pjRjJTVmlnSE5q?=
 =?utf-8?B?Uk5mQmk2QThsT1VBcGxmaURLdTkwQjY5M21WU2JkZFNLb3JnSUw1YmYrYzFV?=
 =?utf-8?B?UEFKWTNPVXRHa2JXK2drTEdDVHFCMnh0OGVsSkJGeDZSOGlZcGFrR0ZwQ3Zr?=
 =?utf-8?B?RDQrcS9qZHQ3akJyNUZ6cGZ1RjBDQ1lCT1NXSWk0dXhnSzVJbG1jd3BPUktj?=
 =?utf-8?B?YTlndE1ycmlGNGs0Y1hlNUdKekQxV0ZmOGNOWEprUWY3U3lPQW5vdTd6dmlM?=
 =?utf-8?B?UlFZd0lyZGNidlZCaTBBclkySjM0M2UvUkVXRGJUOEhuWGIwZ0UwQ1JteDJ2?=
 =?utf-8?B?TWxPL1JXWVpiUmllOWkrMVhwblRzOWtjdmZ3ZGxnbkdYYzliWURZWm80cFZX?=
 =?utf-8?B?Y1lsTEw1THNNNGdGS1F0d0h3ZGZRTXEzV29ETnF4NjV4NVRlcE1PUGNMN1BL?=
 =?utf-8?B?cjNjVGI5SVJreWxuSGFlY2RzcEd0U2JZcTIxd2l5eHB5eFJ6dE5rdzc4NnZU?=
 =?utf-8?B?em5Oa2lUbk9NQzhnSWs2c01la1E0OUg1aEJJaU9PM1JEalZXenM3QWdRSmR3?=
 =?utf-8?B?R2xCSmN5bndpYldRUzhYekFFWnllOWNGc3gxeTlhY1MyNWkybVJXSU4rNEF2?=
 =?utf-8?B?dURFYS85Wk5ZeGYyY21TNnhIb01Eb09Jc0t3Z3JZNWdpK2p5WExBTm90OGxF?=
 =?utf-8?B?UTRMS1dZaTJrMVJQdFRqUWZnMStNaXhmeVllaFc4ODk0b3BBVi9TV1ZTNkdU?=
 =?utf-8?B?U0tlc3FoQjZrQmlXZXlYc0kzVDFEcUhFbDVNUzJKV01uV3JUcjNObXVTRStB?=
 =?utf-8?B?c3czUEljMEEzdS9pR3h5QjVhNCtLOHJWM1BCTzBHSXFoMDI4WHBPWDVXNkJM?=
 =?utf-8?B?ZG5wbllWbUlOcVlkU2NXc084QTNSRXducEpqYm4zZDYza1pBQ09TdHVtek9S?=
 =?utf-8?B?b0VaMWpsaXM3RHFwYTB1ODUyZUVEWFpDWGYzMUllSzRKczZtS3NLaTBTUVNZ?=
 =?utf-8?B?M1kveURFYk5Ib0ZiTjZuMGVOZkhhVGhybU54SzZhQlBYTHV6WkZ5bXE5dnZq?=
 =?utf-8?B?bTVsS2c1WlhzQUlxdEYxM1A1ZkVkM3B3N0lmdWNKK29mVFo3aTYvYnpMcnJG?=
 =?utf-8?B?MDdabXA4TzdmV2FoUWtBTjh4dTdieC84NGc4Mnl0ZUR1QjZNSy8ySCs0ZktQ?=
 =?utf-8?B?VXBlcFJVSlZ1enlSYlQ1M2VqNWdRZmlmWHljM2d2MmxhUU00TTFpdjkyeWdU?=
 =?utf-8?B?SVhwbzNKbWJsU2tWMGpNaWNGWUFzb3JQdGpFRUFYY3VWUE90YVp0WnF1QkY4?=
 =?utf-8?B?WGwwTEMxRXQ0ZjdVYjFNKzNoV0t0L2wrc2owaEpsK0RRa0U5cWQzZXl2Mk9p?=
 =?utf-8?B?bGtvM2NXdkhqbC9oZFByZmsvcWZid1d2NzBHTVhKdEQ3MDBFVTRyOHd0ZTZC?=
 =?utf-8?B?ZGJiSUR4ZU03cHZ1REp1RTZEbThwNGl2R2ZCRSsxd3k4OWwwR2VpZTh4ekVU?=
 =?utf-8?B?cmxXVEhsWU1NYnRxV3VPbm5scTRmQVNybVFKRXpLZDZQelRELzdZaldsZW5K?=
 =?utf-8?B?ZmtDcksvUUViSkV0MVcvNGFEeTNON3pQR0VQWi9Nd0dlMENHcFRybk4xNG4z?=
 =?utf-8?B?a0EyNUx5WG9oYW05SXpNVGlITUVKSnBETDNnM040Q2JDWHFkalVDZVZTRWNC?=
 =?utf-8?B?cnVpbkJXMmttOGlDR1hySHFsVE1WNWRyc2k3ZlQrdmppZ203T3lQb1hMWGpC?=
 =?utf-8?B?aDFqQW1NWTZkbm96VXI3bU9ERTNnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	68g1ex/LTSr/oMJeRY/iBmY9CEzYmUUT3lX9TvsKeOQWpZxuv4sz5mlDEvOc3BnJozCw3y2BMxoThqNz3dnRtC4wN7ixi/fRnkMGgT9N7vQ/4AI2OYXUHcox3aBP6iBJT97HoDQKGqm1F4XYY57Ter5b9jttoEnhV97SNaVNjKZflptsz1/7x0xiaEkT6+VeXEv7vMtXUQPPJfmqnr6khQu8JnHMJinEYtSFgc7zN2WStDPVIUbPRyyyoOt6b5k4k/ipW6A7tQ6xUeamD1VnSSU83bxlnF2brYHcQAgMkShHKttgAznM9xAe+T1GzOCrqt+E2N1Fg0Xs81aZSGyvn6MefyVujmzuetvLcCm+FSGiopazzHre8TUTGwaPvdIYtDvM3E2p9Yy2rbJSRz4lZWz7eiTFfcDZ5HS1duXdX76QZk1cBUn9FjoKAWbWtZLI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 15:29:19.4349
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 900b0578-414d-4fd2-a787-08de6a4b7d8e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B077.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7072
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E61C012EF0C
X-Rspamd-Action: no action

On Thu Feb 12, 2026 at 12:26 PM CET, Jan Beulich wrote:
> On 06.02.2026 17:15, Alejandro Vallejo wrote:
>> Open code the vendor check through the policy as a one-off. The emulator
>> embeds amd_like() in macros and is called in MANY places. Using a
>> local variable (cp->x86_vendor) makes it a lot smaller (300-400 bytes
>> smaller). So treat this as the exception it is and let it use the policy
>> rather than boot_cpu_data.
>
> As elsewhere you mainly discuss benefits for the single-vendor case, is t=
he
> above about the opposite situation? Else why would codegen suffer this mu=
ch
> here?

In single-vendor it doesn't matter. A constant is a constant. It matters in
multivendor. And it matters for 2 reasons.

  1. The x86_emulate() function is HUGE.
  2. The x86_emulate() function has LOTS of amd_like() invocations.

When amd_like() uses the policy it has an advantage over using the global.
Namely, the policy is already cached in a register, so codegen simply has t=
o
pull the vendor from an offset into a register. When we go for a global var=
iable
we need to reach out and pull the variable from its 64bit address (because =
we
compile with model=3Dlarge). It normally evens out with the codegen reducti=
ons
cpu_vendor() encourages you to have, but in here it just doesn't. There's w=
ay
too many accesses to global state and .text suffers.

The fix for this is caching the vendor somewhere else. A "bool amd_like" in=
 a
local variable would shrink code substantially (by having rsp-relative acce=
ss to
the solution of the question amd_like() asks, and by avoiding the masking).=
 This
optimisation is worth doing with or without this patch in place.

Alas, I didn't test that, because this series was sufficiently complicated
as-is.

>
> Using cp also is preferable for test and fuzzing harnesses, which don't
> even know boot_cpu_data.

They don't now, which is why I made the x86emul_cpu() macro. New subsystems
added to a userlevel testing ground could simply have a boot_cpu_data with =
the
desired policy as part of their harness' global state.

>
>> @@ -30,8 +31,15 @@ void BUG(void);
>>  #  define X86EMUL_NO_SIMD
>>  # endif
>> =20
>> +/* intentionally avoid cpu_vendor(), as it produces much worse codegen =
*/
>
> Nit (style): Capital letter wanted at the start.
>
>> +# define x86emul_cpu(cp) ((X86_ENABLED_VENDORS =3D=3D            \
>> +                           ISOLATE_LSB(X86_ENABLED_VENDORS)) \
>> +                               ? X86_ENABLED_VENDORS         \
>> +                               : ((cp)->x86_vendor & X86_ENABLED_VENDOR=
S))
>
> Nit: Indentation. The ? and : want to align with the controlling expressi=
on.

sure.

>
> Further, is this a good name, without "vendor" in it?

x86emul_cpu_vendor() is fine with me too.

>
> And then I'm of two minds here as to the use of the macro parameter: On o=
ne
> hand we can be pretty certain what is passed in won't have side effects.
> Otoh in a hypothetical odd case (seeing that this lives in a header file,
> not local to an isolated piece of code) where there would be one, the
> argument being evaluated unreliably could cause an unpleasant surprise.
> The more ...
>
>>  #else /* !__XEN__ */
>>  # include "x86-emulate.h"
>> +# define x86emul_cpu(cp) ((cp)->x86_vendor)
>
> ... that the same wouldn't be observable in the fuzzing or test harnesses=
.

I can turn this into a static inline to avoid such worries.

Cheers,
Alejandro

