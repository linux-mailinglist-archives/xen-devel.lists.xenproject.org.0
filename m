Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id werrKtwdQmoE0gkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 09:25:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 107B16D6F8A
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 09:25:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b="BhZr/lcF";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1347282.1605153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we6MN-0007Rl-6N; Mon, 29 Jun 2026 07:24:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347282.1605153; Mon, 29 Jun 2026 07:24:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we6MN-0007Oz-35; Mon, 29 Jun 2026 07:24:51 +0000
Received: by outflank-mailman (input) for mailman id 1347282;
 Mon, 29 Jun 2026 07:24:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1we6ML-0007Ot-68
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 07:24:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1we6MK-00DA6J-1A
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 09:24:48 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a421dbd-bab6-0a2a0a5309dd-0a2a450399f8-12
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 09:24:47 +0200
Received: from [40.93.201.4]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a421dbd-ec1a-0a2a45030019-285dc904381e-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 09:24:47 +0200
Received: from CH2PR10CA0012.namprd10.prod.outlook.com (2603:10b6:610:4c::22)
 by DM6PR12MB4059.namprd12.prod.outlook.com (2603:10b6:5:215::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 07:24:42 +0000
Received: from CH1PEPF0000A347.namprd04.prod.outlook.com
 (2603:10b6:610:4c:cafe::8) by CH2PR10CA0012.outlook.office365.com
 (2603:10b6:610:4c::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 07:24:42 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH1PEPF0000A347.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 07:24:42 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 02:24:41 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 02:24:41 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 29 Jun 2026 02:24:39 -0500
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AB/4fma5bY4GT+wjbI+TpbYhnsh44a49wkKe8qM6+2MY/1CyDzUuSImiTnbodx+z8vVZlNu/tjvsKliZXqkUB76XamfYiJXy+es1QqCMiGiMHuulwyCwFS4BLfDXkDpHPpi6lJRolNDfV/QD2BPUCXMbpMdqbL0s2PWavVQF/H87sDTWtCoFTOwJhBB1yfoWrWTOO4/UkY2OnwBNcozqA+fhk8GoeAkcegkArJL4I9fOsKLeR8q+2TIr08Tykqtx0SOFTMRrUY0JLVNHau+BkU84ye1XUy6rImCWekfiGJos9elDGjsRK6iHl9WAtbJzHaQmmK0/qkTLA0F6m+S9iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zsyqnMUve6R6UWtESNOGpPCscc8nQ/+wQMmDEYqn+TI=;
 b=Xjuhcf2tn4ejbWUPu99kilA56QXtbEt3tFaNOUramMguREoKrAG77hmyBZsM1TWG38rVX9B0qk+8l72ZdORS3qvo7Grdxn+74+Nm7MfbSgP5tLJzXmznFE8lGOgdEzpreHBUy6hH6cS6wkxE8LlGhbB98vnpLJehPYBN+to+yC+1oknzuoIHx9SYcG+qdLxYMAnvICbYhuThRdfXtfCJDbJqYVseoMcgLMLbmOQP2AdYPUsAZTyEMN3A8rueuMijRxLjcA4gXXgWu86DwFrHxCvcMnqJMuxR+3HXeN1cO7KdDWnmekqV9WBklEQ7JQJqfDrr5UAQG2IA1YvktSFuKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zsyqnMUve6R6UWtESNOGpPCscc8nQ/+wQMmDEYqn+TI=;
 b=BhZr/lcFNyl+kvrQjA8/A8I23hby9k4TdQnoWC7wQzs/OVAjIbBx8dEEKVvtQwbF4CiKEeDQMZaeIDiq7P3q9Cn3FX8ehGzOF7zDHS2EAHF6weLmZPsCbuZfzqfPRisdLdKlgro35W9ZYhNszEr1xE9G3j3Tv8U2/xhSjYKeff8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <e35aea76-79c2-4d3e-b10f-0a9d7eddaaf7@amd.com>
Date: Mon, 29 Jun 2026 09:24:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/25] xen/Kconfig: introduce HAS_STATIC_MEMORY
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Romain Caritey <Romain.Caritey@microchip.com>, Baptiste Le Duc
	<baptiste.le-duc@vates.tech>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
 <ae555155a60327e3aebb70fcaeade33349910a69.1782487661.git.oleksii.kurochko@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <ae555155a60327e3aebb70fcaeade33349910a69.1782487661.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A347:EE_|DM6PR12MB4059:EE_
X-MS-Office365-Filtering-Correlation-Id: 717cc99c-9b7b-45b4-ff58-08ded5af7ca8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|7416014|376014|23010399003|1800799024|18002099003|22082099003|11063799006|56012099006|3023799007|4143699003;
X-Microsoft-Antispam-Message-Info:
	Z446vfDILk2k6J4lpEy0PXg7eV7odKLojhZEepR4x1reGS8QF8ljoF+Ph3FvltKeQd4VrO2rffgi+PL4nI5gJRI9hvETY22BykPjq7rT8AHtA2pdpIF4ZMSd8r2dxWY19/Hm4vwuSAQoMGB2fvBJs+o07u/H6CKIWNbzx7BMvueeKEKlhkTv+sacGLqpKXhLiF5qDvwa5o6K1ZG8bfD7TOUzAX0rT+r/XG8D1TIC1n1eFOWksUMpCTrr24h9mXD3MSRNfWfYfYAp4Zv3Vwez3/H/cu4gt+wHqFZXu/X9dCOCkihFr94J8pzqobpuGwW6wDqkbDOjLugL6XDUs9OUOSeT76Ewau+o6YKF0irTikJIDyzYpCNMzmum/uiIoyvOgp6nCWpNyqLJIuRYWfdKY79XXsimthT0X1MI/uCsc5psrhczjQjxRa7ViWsTHGMaikH5wDNdvJy8xIWz5bsyHjtHbA+eGJjV7pZ/Ao0dneP13rbpJSP2jvXoZdkblIv8mN32h/Jj/k3SefzhrVR1lihCExIsvl7AurQbREe7Fi7l6tgPjtt987Io5VTh+CtQrGp+3WDd/+ssijQBe55pkl11JYZapmTGKHee8LQFRhsyrPXXyXIi7VgwLrRkP7Sk9JlVXrId6O1g9r0ZAZ+eSg4UgnFoC3ofbYvbKxi/maf+FPU4AAoLTCWwy6IK0mKaVHOaNr7IAOycsejydQClnA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006)(3023799007)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0cB36yhHsXUp+RrjqOzXWG7O6BOZbNEHV3tugelX93XwLCKTb9V9je8acUYTnR/5yU7lYh1JE/X6hVTWIbnya22yRSWVtqBygsnmmXOwrp3zDR6H+kHdihZVULoj6Pf70cFUpAFFgI8xuJJOVY8tZ5/pXbnjMRh6JFyIk1u8sP4zih8IZVr7jrF3XyYw3wVzjrsz5szJhd62r+PoZl2HAKFgOuGGeWCg6Er6vueG/XKiaqURJquGt74QxBw5UVj7sV0TwOsrsOI6LqfVqaJkPmEnon9ohlfdE+A5obWt3PIwBp+aJdk6fqxE/rewys+E4uT0FwXqGmXUmdD3FHalvpA1HyvgnAQZ03yhV47Crm7EZPORu1Akki9dyHSUnKnYHp4WqKSWt4zBIChc/aNweMq+tC0OJusp5sgA+Ko86yoqFJdFhWstyyHhbkr6pPDT
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 07:24:42.0298
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 717cc99c-9b7b-45b4-ff58-08ded5af7ca8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A347.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4059
X-purgate-ID: tlsNG-33051d/1782717887-BD3815D1-0C8D8C4C/10/73395122804
X-purgate-type: spam
X-purgate-size: 549
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 107B16D6F8A



On 26-Jun-26 17:46, Oleksii Kurochko wrote:
> Introduce HAS_STATIC_MEMORY so that STATIC_MEMORY can be enabled or
> disabled on a per-architecture basis. ARM selects the new flag; RISC-V
> does not, so CONFIG_STATIC_MEMORY is unavailable on RISC-V and
> randconfig builds no longer require an explicit STATIC_MEMORY=n override
> to avoid a compilation error.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


