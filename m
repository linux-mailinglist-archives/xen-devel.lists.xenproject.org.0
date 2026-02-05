Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLCXBALPhGk45QMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 18:10:26 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E260F5B03
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 18:10:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1222282.1530276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo2rj-0003oO-Qk; Thu, 05 Feb 2026 17:10:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222282.1530276; Thu, 05 Feb 2026 17:10:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo2rj-0003lU-N7; Thu, 05 Feb 2026 17:10:03 +0000
Received: by outflank-mailman (input) for mailman id 1222282;
 Thu, 05 Feb 2026 17:10:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eiMP=AJ=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vo2rh-0003It-Ge
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 17:10:01 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e0c27d5-02b5-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Feb 2026 18:09:56 +0100 (CET)
Received: from BLAPR03CA0146.namprd03.prod.outlook.com (2603:10b6:208:32e::31)
 by CH8PR12MB9741.namprd12.prod.outlook.com (2603:10b6:610:27a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.15; Thu, 5 Feb
 2026 17:09:50 +0000
Received: from BN3PEPF0000B372.namprd21.prod.outlook.com
 (2603:10b6:208:32e:cafe::ad) by BLAPR03CA0146.outlook.office365.com
 (2603:10b6:208:32e::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Thu,
 5 Feb 2026 17:09:41 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B372.mail.protection.outlook.com (10.167.243.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.0 via Frontend Transport; Thu, 5 Feb 2026 17:09:49 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 5 Feb
 2026 11:09:47 -0600
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
X-Inumbo-ID: 7e0c27d5-02b5-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rEWs45gzZRNRlwD0QyJpaUTOMobc4HSmq/MW04+YIjtx6eYlrGJQiPrUx+arc8P0b41hmfsNkewvyWueU4249g7f3Md03F1GSXFGDYtL1ertKDkagwC3nS45fC/znpkott2c7CS9GTewwg8QktnB4d9lsQgEFiSKrbhryUrSojxsh1SygOZhk+VYY23WMZsFNAhJ/X25wL5OK3KjeqFx7UPiq+47vSw/kiImrWTakKF0AZU6j+z6Wv6W5b53DCgOsKtCpQ7PtSVAiEtoRUdC1NyWCBBfr3Q6Oma+dLZSeaj/xUkgBHb3OUBbUk8+xiAC3svLMIYdkCVGeuvWEYZxMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wav6Z2ioA7k2G+/mHojpKLayWyPe4WxqQKYqIs0jsWQ=;
 b=fOlbwhDoC+XApz5O702GIlEv4iKhwEh13rMcJz/zqSsDDIy/2Cz2UqTds0r072wz4TulMoXnfT71YODLiUNXwNu5CUfet3ZYzvkm/Mh/CusRVucz5+WOSGK9iYUDHEGfqP7n/Nrtfc8BXtjVQY0AI0PWRH4VsdFw8ibo1d/QimDwMFANx9qqt3/iSEZz4zt8+NzsGRdesyjDjyssXqQ+6ZzIZsWt9LvVt/zx698HX+LYHLxY5dCss1AoCnKkObhEoq9Lrs0eTcYiO5xt+OVWSQ0QjzoIYbxvCPVBOBF7bPTnF7JJVrHGvITuVQfYXw23i+JY7Tn6bFaUFVl919cvGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wav6Z2ioA7k2G+/mHojpKLayWyPe4WxqQKYqIs0jsWQ=;
 b=5e+94Ak9RAIs61eCw4JSkHBxH9G8/kcNRixORQ9qwPa48C6LtVHTCBmHOUEJE9Ejl1iEPaFBiEudief7/gOqwfvlhixXwuBOaC47crJCjCE6slF7UhuKMzhPV96PivELhf3kecNfvK96a0U8iprtQ59RcgHhecNCg21nkZiPoV4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v2 0/4] x86: Drop cross-vendor support
Date: Thu, 5 Feb 2026 18:09:18 +0100
Message-ID: <20260205170923.38425-1-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B372:EE_|CH8PR12MB9741:EE_
X-MS-Office365-Filtering-Correlation-Id: b9fff9e1-8052-415d-9835-08de64d95ed4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CaP5o+v6r9T+XhnMqPmOCuvIm7ocaqd97CSwsdQOoNjvu2qyabiKnWWCnujV?=
 =?us-ascii?Q?zwOjiPSwP40bv5MW6IBwaJZNycgjLqdOXKha/Aqd8SKpPkqeC5/myVjXAkzz?=
 =?us-ascii?Q?WXPruXizih5GVGQR7YaYf7HzppspNNh6YAgk4H1kNgOadmBP30dGqXcPNgZK?=
 =?us-ascii?Q?epYldGq4P0Vr3X4Enu7Egi1USQqz5FIYJ0aXfTdLJShpWtJX5ijChltCer8F?=
 =?us-ascii?Q?3O2EwJ2fMlxNpz3kkfkg4rejUcLcHqXpkwRUWTjx4qr3iClrPuIzqWIvax+A?=
 =?us-ascii?Q?kFS8H9fSY9rqLaj6mryUuh819DJQHDsZMiDzx7p+8P+UJGCkDzfwNuGFyDYK?=
 =?us-ascii?Q?7+bIP4Hfxky1laiMO+CSILGx6ZGk9r0a9jDYuE2UgOLNUHVLsbFep5lL81KX?=
 =?us-ascii?Q?5BSNF1MHwOJ7tTzdC8kD3jIxXQI0PH5oaunhZcZICRF4eSAdL+8K4gSOYLPP?=
 =?us-ascii?Q?lfIu6F5BzgqKP6PC1ldJ8MZOThts43LorcuCOkEQSnjHLgTrb8y4nDni1blD?=
 =?us-ascii?Q?YzfnRHMLy/PKUHKM80qATnK1iizgd41nhdgVlcbYgM3MZk/4FAK9LTuSvHzM?=
 =?us-ascii?Q?ym0XEwU3BXwayy4CgVcMKog3OqexJkySbq7grCGRk95lAwqREK5wWOpgbazs?=
 =?us-ascii?Q?C7GCYb+hCIeKQZCh/Kwn8gc46xc0CNEPNGZtoFF+3J2qcVXUoSI1sQ3pRIPJ?=
 =?us-ascii?Q?glO0xfQznECa2ZiFd1lbQQmLQDXKLWKtQwxQZj9WEw1LencqRN+Og1ONHRAL?=
 =?us-ascii?Q?QyQOcEW2CYjrTd3YeIvaV7ZkdS0AJDCtUTDZvXYvbrYesSABpFQcHXoUzK9s?=
 =?us-ascii?Q?0c3kwwQvDswFzv8z1C8+jWUMD77h49Xo92xd1D0ees2PuYVBA3+iCTteXQkp?=
 =?us-ascii?Q?AD7zL/V9CoGq581g81w555KvQNOYBv1xs0di99virYRQ0wQtyAO3/yoDFKjg?=
 =?us-ascii?Q?k938PV6iRtOVZoMhhdZXpRXDzJIKDRB/NQXGdw2YFsrDgi9v3veT3boo0jRk?=
 =?us-ascii?Q?mjQ7NupnDMLMHrASS4CWXaWJmdzIBV6o0bIVz3qGpk5NvRqnah9uas8044sV?=
 =?us-ascii?Q?XUTvIG+AIA89U8X9Y2GepwXUJZl5Mcr2s/JvAhiV9s6BRLGfG4NWTT6rt0sD?=
 =?us-ascii?Q?JBDCXEY/aXWDtL3X/2h0qL2skDtgsGRqHOGBAB3ryJMmoK74zeH9X7c5NbDP?=
 =?us-ascii?Q?W2bDWaQoafXltdd2LbBZfvtnbIFrYa0Qvie7NUVNhio8SMuEopj1W6f7IOMv?=
 =?us-ascii?Q?FcRAI76U+vDNJq2pNdc9+Te7OExg5O0EfBVya6PI6Vz9sy50zoty0eJQQny9?=
 =?us-ascii?Q?KocgsZUA11RgpZztgr/S0cqbndiQbu94d5d5qaRaHy8R3EVCn38rqWhoH1Hx?=
 =?us-ascii?Q?IUBO9MNBT3QF9YvWenkLjjz146thQmlg8YeHh9X8iVrUJHqCVDrn2e0tjwRg?=
 =?us-ascii?Q?PrYbA/xdG9qxbjnyaqw2GAb5HsABXWKNUnVu+iIkPRZ4e4mwpyyQ0yIQ8mIh?=
 =?us-ascii?Q?USr4hvBiEMU/Fc9+p80MQ5xoRtlbudTlyQq5qQwV/qbrNDu9U0vKCrbqiKYi?=
 =?us-ascii?Q?qTScQLBrNFBbm6vtWlNQZVNXMrWPVPLjOJleCU6T26VhENOF4dbRe8fWK75M?=
 =?us-ascii?Q?fieaVW+3ByIteaUQO/GNAciBp7UaJFXgJnmLTUCifusY?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dO28t8M9V8E1CYc69p+Y+HlmOe+WF+tDfgPWPStXid/h9hRvDOgXE6GpGyzbo4TYKpeiEZdE1pkhvYFSllRKcluy1Lqgrb4H7QFKiUSJB2kbJX2XpH/h9BIj4Ga45GIgqG1/KKIp0YeB4l5nYvOafajMnIlemLN09JBJVAjHbcAQtS79Rei+cUY3SdDs1jk5i/dVs+edXOxliWeR2tfs3Ba7hc+tLqE1cf0CdZiD8pSwtgds88aGcYXDnp/SICbQ6ulGf3mqlRLPDx6n/agb5h34hSvxJyZhHieVGTnGYfJsRpyDdG9E/HGZVbaYNm6KwVqVSN7zyjVOV/PA3Czy5eCaD+2A8BEU1idLB6F8NOW7G4YIrEM4gvXh7fKOIdNOCXpRqs5m3H4IC3TEHwTwkuc03IO7P6OWvU8WMPBOrDJZbfnaKGUSZtTvDTBIihHN
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 17:09:49.4431
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9fff9e1-8052-415d-9835-08de64d95ed4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B372.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9741
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,xenproject.org,suse.com,citrix.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[changelog.md:url,gitlab.com:url,amd.com:mid,amd.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7E260F5B03
X-Rspamd-Action: no action

Hi,

I got rid of the HVM_FEP condition on the #UD handler.

v1: https://lore.kernel.org/xen-devel/20260122164943.20691-1-alejandro.garciavallejo@amd.com/
pipeline: https://gitlab.com/xen-project/people/agvallejo/xen/-/pipelines/2308391515

Original cover letter:

As discussed in a prior RFC (https://lore.kernel.org/xen-devel/dc68b9ce-38aa-4949-b3e7-a7c0a7ee9a25@citrix.com/)
this series drops cross-vendor support. It includes the policy check that
was there and adds this on top:

  * Eliminates #UD handler when HVM_FEP is disabled.
  * Removes the cross-vendor checks from MSR handlers.
  * Eliminate Intel-behaviour hacks for SYSENTER on AMD handlers and drop
    intercept for SYSENTER.

Open question unrelated to the series: Does it make sense to conditionalise the
MSR handlers for non intercepted MSRs on HVM_FEP?

Cheers,
Alejandro

Alejandro Vallejo (4):
  x86: Reject CPU policies with vendors other than the host's
  x86/hvm: Disable cross-vendor handling in #UD handler
  x86/hvm: Remove cross-vendor checks from MSR handlers.
  x86/svm: Drop emulation of Intel's SYSENTER behaviour on AMD systems

 CHANGELOG.md                             |  5 ++
 xen/arch/x86/hvm/hvm.c                   | 77 +++++++++---------------
 xen/arch/x86/hvm/svm/svm.c               | 45 ++++++--------
 xen/arch/x86/hvm/svm/vmcb.c              |  3 +
 xen/arch/x86/hvm/vmx/vmx.c               |  3 +-
 xen/arch/x86/include/asm/hvm/svm-types.h | 10 ---
 xen/arch/x86/msr.c                       |  8 +--
 xen/lib/x86/policy.c                     |  3 +-
 8 files changed, 64 insertions(+), 90 deletions(-)


base-commit: 3d11d55e19b749697ea7c3799c264b83f5a57a80
-- 
2.43.0


