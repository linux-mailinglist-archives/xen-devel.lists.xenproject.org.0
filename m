Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EM7ZLik4xmm7HgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 08:56:25 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D64340AAB
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 08:56:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1265112.1556185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w622x-0001F9-LT; Fri, 27 Mar 2026 07:55:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1265112.1556185; Fri, 27 Mar 2026 07:55:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w622x-0001CE-IN; Fri, 27 Mar 2026 07:55:59 +0000
Received: by outflank-mailman (input) for mailman id 1265112;
 Fri, 27 Mar 2026 07:55:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <penny.zheng@amd.com>) id 1w622w-0001C8-DM
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 07:55:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w622v-00CCSO-Ex
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 08:55:57 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <penny.zheng@amd.com>)
 id 69c637f7-bab6-0a2a0a5309dd-0a2a4503c00e-28
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 08:55:57 +0100
Received: from [40.93.198.29]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <penny.zheng@amd.com>)
 id 69c6380b-1947-0a2a45030019-285dc61d397b-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 08:55:56 +0100
Received: from DM6PR12CA0014.namprd12.prod.outlook.com (2603:10b6:5:1c0::27)
 by DS4PR12MB9706.namprd12.prod.outlook.com (2603:10b6:8:277::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.10; Fri, 27 Mar
 2026 07:55:51 +0000
Received: from DS3PEPF000099DD.namprd04.prod.outlook.com
 (2603:10b6:5:1c0:cafe::85) by DM6PR12CA0014.outlook.office365.com
 (2603:10b6:5:1c0::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.23 via Frontend Transport; Fri,
 27 Mar 2026 07:55:51 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF000099DD.mail.protection.outlook.com (10.167.17.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Fri, 27 Mar 2026 07:55:51 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 27 Mar 2026 02:55:47 -0500
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
 b=pQhS1qfTjXprGLDvwRFogGr7m8DgcynhSvmahPqYgh7Lf4yA8tVoQDMLM1CczYCL144x5hRHX3MnoO7OA71k7NU9PWQsh9Ctpg2gw6WGdS/72NzxRJcfX6Ge4conxQ9A07LWd5aiibZxtY/EG/5902+IkLrzaIBguoh4ImvI0usHcNVRzPWvQ2GbusYtVT0ElDhnZE6kJ+xAgJV0vZvbn4Qi+b37V+oUJa9/oQwHGp++VpymZMDnScnZaRKN8fQnbOtKOV2QNuhTh7meKTcECmO2mI2m0JXkWFKUeSJRy6ugD2O6ZhG8LsJgOVwFviHasPzzVewfpkM3wNCDC47cyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sgxa1hhL2v18xuShfJSpsCGyXr9KnhiEWhnZC3mWhts=;
 b=DgeMjA/5nzeSXm0CQq/XtZaZAY+4jQGJWf9OX1pJMUWC3newDDpvzy2TTAFom2Ld06+6CbBKLg328DFPKrqKx6qi/sMAv0qT2kNZnReU8IIpdTYi64ennbeFpblVkXq9gPsTZlBkp6C6szf+Gj4ambOeeRcHC/gyHJ7p5zaUiENFEkaCDZn971mgltQee0dzjkaNbf4raLu9z4a6/Bp4H0cqwfUMXEfZWD9Z4h3pR2kNR1mT9ZiVDjW51ueRo9YJVWTonn9omWKBhxxqW+sUkGzUWIUjttJSaCsvN4XrwvMGxmJSW/63BERvdtse5Timz/ibnXL2AdGeB8sz3nOWVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sgxa1hhL2v18xuShfJSpsCGyXr9KnhiEWhnZC3mWhts=;
 b=Gn6lE5cUYxr2Rxn92MnKcG2qxdcxo0ml1PmVokd0aydCDfDMMMm7yv5uhVjhudB944RIMxFWqz/oHgZzLMSJvKUyWEGSoNSXmopX09JbC3SabAk4j7mR3aNVCKTFxweaj8FbJaa98ZmqPqQT/qpISvQzx4kF33iWMcMLVnLv5Eo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>, <alejandro.garciavallejo@amd.com>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v1 0/3] Remove mfn_to_gfn() on ARM
Date: Fri, 27 Mar 2026 15:50:22 +0800
Message-ID: <20260327075025.3008606-1-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DD:EE_|DS4PR12MB9706:EE_
X-MS-Office365-Filtering-Correlation-Id: 105536bf-725f-426c-0084-08de8bd643d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	olz5uyNv6olPoSQb6Y3fVIHkm3Am/kanJFBVo4jjep7sAIkeyQOw7335g9IRZiF0tEPI1jGceHIRClA9DdBA2yCyIp+zMU+iS1klE+pnLj173muRQr/YPk+C5Yf4UzXDxSXN4q4nnQv9vFBa14iyF9mIaC7Uuu2Lp+YoOd6ihDAqC/iN8DiVJ5tZ36iHvKZVAkVZD8K8MjZiR2i45AsZeBPG38H8co7k+Xrofw/nhsk3thkmfG01uq8ejyDGlwrcfw3Lzvs64L70Gsjx71QCsHdzkVpYGAAlGYn4hx/y7O0uBPwmwRZ4F4Tj48ZnYMZkFwzE8kmiLl/NZZB+nOpCWHpXHilPjtCQpTSM3WchVd+CmDJSfqvxgQ3+ekwM7mIzKvjFvVUJU/ZWY2T8vAFj33hc7/OzDaiNrwaEZ9IiACiAsrElcCSfH02IO1A6o9EJ7Z7FpcxhWoJIwGYdEmuSDOvw24ecvZWGzPgipEKO1bFkJWjUzY+jLtzK0u4OvvvetvCCdo/zmdyRzC3PcbayTN9TFsJyEe3s4cf23FwVYYxZh4uNOwKpZVyb1Geuw1qpCTwx/51+rMY19WnfoBOJukwetoaYxSZ9bblKTNzocbGZGD3FxKqnz5sK/Bmc6/QKliGTauzlNEQCXk/Pdij9yMaNo5srK/omy3CH+oDi3D6n6SDmq6wkh8LETmpevl/i710jVjzpbyUMnh2jYqvM69yXd8fdRAhWZ6yq/Lvi4kX8YbubHy9zpEKINPsJzkNmxmZcp6hDhQwb6BssookV5w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LxZdhiyKXOwiqw/Alxs30CHAofz/KWmXebYcPGxMwvr7zgasfWoN8vOyK1QGVIl25LdG08Ihi6RYkiNOj/nQzcyK0MaFwshrEqQxYIErxayQy0aMNpgW/y7uBgiDwfhqEeVTuqv122LEjg4+KsmH9Eng2OqO5wxiVmAttmIiOxf3RAfXlfniCXURQ/GWKFjQNF1hUcuhGQizaJGe5X+oyvUzGKfJL3tkIYAhDQ7Cxnheq7DBa5woMtKc4SDakH0KbbFVm55YLd93jTzu42TO+mJBKzhimdnm9aFmVESFzpD6n/P7A+iNgH6mM3egwcSFaP7vKQyBIuEoO1mJ5k9B77XUlxg7E2wXRI/s/ra9xYGl06PEl3BwqHrdWJ2ODRwtx7KOgnQ3IRmxeG68EvqRUP4oOo7bUbyeCHWpfb/Lr8Mk+SRS7UZISdCAEaaAgZYT
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 07:55:51.0058
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 105536bf-725f-426c-0084-08de8bd643d9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9706
X-purgate-ID: tlsNG-33051d/1774598157-4846E72C-1019620C/0/0
X-purgate-type: clean
X-purgate-size: 1517
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[Penny.Zheng@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,m:ray.huang@amd.com,m:Penny.Zheng@amd.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[Penny.Zheng@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 69D64340AAB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On ARM, mfn_to_gfn() is defined as an identity macro that unconditionally
returns the MFN as the GFN. This is incorrect for any non-direct-mapped domain.

It only has two call sites: getdomaininfo() and memory_exchange().
It causes getdomaininfo() to report the wrong shared_info_frame on ARM,
breaking any toolstack or test that relies on it. While as steal_page() is not
supported on arm, the error does not propagate to memory_exchange().

This series fixes the problem in the following steps:

- Generalize the existing per-page GFN storage in type_info so it is
  usable beyond xenheap pages.
- Introduce a shared_info_to_gfn() macro so getdomaininfo() switches to
  use page_get_xenheap_gfn() on ARM and still mfn_to_gfn() on x86
- Fix memory_exchange() to use page_set_gfn()/page_get_gfn(), which generalize
  the existing page_set_xenheap_gfn()/page_get_xenheap_gfn() from xenheap
  pages, instead of mfn_to_gfn() on ARM for stolen pages.

With all the above modification, we could remove the now-unused mfn_to_gfn()
macro on ARM.

Penny Zheng (3):
  xen/arm: generalize per-page GFN storage beyond xenheap pages
  xen: introduce shared_info_to_gfn()
  xen/arm: fix mfn_to_gfn() usage in memory_exchange()

 xen/arch/arm/include/asm/mm.h  | 40 +++++++++++++++++++++++-----------
 xen/arch/x86/include/asm/p2m.h |  3 +++
 xen/common/domctl.c            |  3 +--
 xen/common/memory.c            | 11 ++++++++++
 4 files changed, 42 insertions(+), 15 deletions(-)

-- 
2.34.1


