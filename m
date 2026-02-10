Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEZZOcNpi2k1UQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 18:24:19 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB7D11DE30
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 18:24:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226763.1533252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vprSz-0002Jm-K7; Tue, 10 Feb 2026 17:24:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226763.1533252; Tue, 10 Feb 2026 17:24:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vprSz-0002IL-Gq; Tue, 10 Feb 2026 17:24:01 +0000
Received: by outflank-mailman (input) for mailman id 1226763;
 Tue, 10 Feb 2026 17:24:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iBUt=AO=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vprSy-0002Hq-2m
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 17:24:00 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47743608-06a5-11f1-b162-2bf370ae4941;
 Tue, 10 Feb 2026 18:23:57 +0100 (CET)
Received: from PH8P221CA0041.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:346::13)
 by IA0PR12MB8648.namprd12.prod.outlook.com (2603:10b6:208:486::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 17:23:53 +0000
Received: from CY4PEPF0000EDD2.namprd03.prod.outlook.com
 (2603:10b6:510:346:cafe::e1) by PH8P221CA0041.outlook.office365.com
 (2603:10b6:510:346::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Tue,
 10 Feb 2026 17:23:53 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EDD2.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Tue, 10 Feb 2026 17:23:52 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 10 Feb
 2026 11:23:50 -0600
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
X-Inumbo-ID: 47743608-06a5-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iW7Aqw0NDV1qYK/ajsumP72m5KoCK53KJtQ8o6rbsaieSwHTz438lE7J34b5wRdeCfSle7pT9GP2Yinjzl7+G6JbSnj7eOphturXAc6cUdtEO4Em2qbSWRmFwcFCXk4/Idpyrv5fS2k5kFK+iHSVGGcFK02XrzC7Fwkotgxo8I2tma6A1EuMCzxUMH2Rw0hZLJxfpSrMA3f+nowMBv8X23j741BfmCSv1I/7XY+2tWxP6AusI+jy2tprdpvZMwsliKMBj6fzOwbWUcB570UNe7XMjtB/FnfX+zSNUXh/kLzq7t2G8d9t6/vBGW8W0RylxW599Rtf6ba8/PTO5ExgOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yzLf1HJy025YObr3l5sYuEY4ZZwt/s7E8Ls4LQGV/i8=;
 b=fQSIsqXjrr91+oOiIy0gM/e9WhkMIcRdjA5iWArOWQevtqTyEaqknav0gQBDJ1u6otIEeu+M/KnpW4P/YlfjRHMVE+2HOf6yh5rkIFUaMxqzfLztlsHvYmOITrn731PflCcu7O4yskEHj9oRArAjkTmfYXrYMQuiR/p2Kb0PkWb1m3d7PjZ9aJzMiws92lPQihTgp4aQfWbqYkIT0CUKearGN6+kz4YVkhcpbONIXyLDePwagXI4l+DXRr1oncwCwTKeadorLYcO8636uAVzVWP0xiwLza2o76tbgmKOvFlG6Zr4fIAd9qq0aSXV91YEgBrNRQQP210NDQUveIaM+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yzLf1HJy025YObr3l5sYuEY4ZZwt/s7E8Ls4LQGV/i8=;
 b=XHLXA7y0AWiwDu6nSwS8DSMspPL3/X0JSTkyDBTqKZ/GxMxXC9M9q68fYzPDTSObiKkWvbxn0UIWDdXx33zmqJL0ezNCoX3AxsPphn+erwk/Gz93jRxDWwom4qZsZlTukiXL43pS/HObEstTwpDBA1lp4cry4pzCpX8iWTjF04w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 10 Feb 2026 18:23:48 +0100
Message-ID: <DGBGFWPXJZ0A.W820CAYMCWV9@amd.com>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH] x86/domctl: Conditionalise x86 domctl using DCE rather
 than ifdef
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
	<xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20260210151008.217830-1-alejandro.garciavallejo@amd.com>
In-Reply-To: <20260210151008.217830-1-alejandro.garciavallejo@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD2:EE_|IA0PR12MB8648:EE_
X-MS-Office365-Filtering-Correlation-Id: 307f544f-baa4-40ef-cc3d-08de68c92980
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UnlIVGgyUFhscnVITGtCeWZncmpWTm55cnhGcUQrZmpKTGlXNEMvcmcycnFS?=
 =?utf-8?B?aExGVVNHYTdLZzV0aVZUOXVFSC9WTTVWZ2htR1ovNitqUmJ5aGZmYkZhZGk2?=
 =?utf-8?B?Y2ZncS9uSEplTzVvS0hrZHcxRVErMHpvYUEvQWpJbFB1M3lMdWpINDl2VzdX?=
 =?utf-8?B?ZkpXRzRJL0hCS29OWmtGeEZvSTVQUnFRdDZjTlhvUjJnbEMxV0F0WUp2WjJx?=
 =?utf-8?B?NkhMb0RiWEpYYlFNTXJvNXhHN1JBVUcweUhNc290NjludGl0SWNKVDlHVTJT?=
 =?utf-8?B?cE9WbVFuSG9PL2N2WXJ0U0pORU9uNDdjbzN2SnIrSk1oajl5L1pQZWo3ZmZH?=
 =?utf-8?B?YU1sR1lWcUUvQ3o1YzJNVjNEeE42RHRJUTNEMG12dkROMTlyS2szNlIvbk9y?=
 =?utf-8?B?cTk4bmNYL0FVenVXM3dhRUZTeWw2bERpMmZ2NW05dmFpR0EwZ1lmMWQ5aGU0?=
 =?utf-8?B?Smk1OGh2dGdkZ3Q4M3YvZmlHcUNKYVNjRi9hNE9mNU90emRweVZKT2EzMGFh?=
 =?utf-8?B?enJQVzFhbTJIQzZwL29rS0grSU90Q1RWYkJRa0ZjRjJBeXZHa1Rqb041dVJK?=
 =?utf-8?B?MnhIRnpLUmNMRUlURmhCQlMzcmhMUlVBbjh6aUU1bzFnYW1JUXlmMXNFK0tK?=
 =?utf-8?B?Mk9UNll3Z1hld2dQNmFxV0k4MmVBR095YUNScHlOSUM4VTJzdEpNMVdLVnZR?=
 =?utf-8?B?a0ZvSnV1MmVQWHBFUDg3ZW1OQm9mUnJ2dVpTRU94bFhjUkJJeXhwOWIvTnBL?=
 =?utf-8?B?ZWdjSW1PeWY1MHlmcndDcUFVa0xQeTNDTWcxd3VSZlZnSUtNOU9JbW41ckZo?=
 =?utf-8?B?VEtRcUFCUnd0RjFTNFpocGsrVUQyeVk3ajh6azBNSTdtK2RYekJ6ZDNGdENO?=
 =?utf-8?B?a3ByRThCdktjYnpVMFE1UVVYUnFWVmJ1R041bjByZUE0dzhCbUx4WGxxZEpU?=
 =?utf-8?B?VVJzcFdiSWdtaUt4dkF0WGo3OU53V21VYlJlUUlzM0pzWHVCSnlrcmVoS3lX?=
 =?utf-8?B?YlVjSzBITHdWd3ZpdUZsMXNwd2FPTUlORk1BdndaY3c3V3RTSURJUUphK1Fu?=
 =?utf-8?B?L1BkeGpOR0dxa3dlSVdHVjFKZnNYUHR5NmdLSmVwTXZnTFYrUGlPU0VOZDZ5?=
 =?utf-8?B?UmVFRmlnUGlwbWdJeXJieXVmTUd0ckhudUFMNXIvQktJR3AxWEI4Y3daSEh5?=
 =?utf-8?B?Mk5BZm1Gc2VZZnZQQ1pLYlJuY1FDYUZLUkYzV2RaWUgzMStUdllKT21nS1hO?=
 =?utf-8?B?TzNySGZjb25qMk1wbzFsMThzbUhKeVJxU0FYODBlQXp1Y3lXS2hXWXNuOFVl?=
 =?utf-8?B?Q0pGU21NUHdSNHNTTTBEY2ZEbVhwaExJZFVpcEdQTndUZTBNcmtEMUhrbmlt?=
 =?utf-8?B?NCtXQ2NPMHF5bkVaVWRDMFloSms4RHZXNlF4K2RkMFM0QWx1NHlYUm9RV25a?=
 =?utf-8?B?eDJHVUVHQnp0Z1dvcDJjZkdXQXRuZ0RCTU1SYnhzMFpDWlV6YlI4ZUI0UUUv?=
 =?utf-8?B?NDl3QVFPWnhtaHZTaS9oUENnaTZxOUw3bWZWV1RENHdscVhZTjhtc3Z5V1BQ?=
 =?utf-8?B?OGQ1RkNSRlpGU003amVGcy9YdEY5ZmZtQUFIQkppRlU5WDBQTjlZeGpVc0lk?=
 =?utf-8?B?b0ZqYVNKSlpiUG8zdE16aE5mNUQraVB0anlMdW96VUFRMUpzUUNXamhjUlNZ?=
 =?utf-8?B?VGRqQy9qMUY4M2FJc3E0WjdJTkIrNXU0WmNaazh0SGFvQlZLK2REWXdpNldp?=
 =?utf-8?B?dVdmcjhZSVM4SEt2b0Z3V0tCTTRBZDFwRlRjaTgxUU1LbXZ0K2R2bWhhbFJ1?=
 =?utf-8?B?MlpXc0xHdFNxNDRtRzRQUS96aFp5WEtHZUNPN3FOdnlGSHNycGRWL2FnZWlQ?=
 =?utf-8?B?a3VtR0x1a2ttOXlrM3poejJHOVJVR2dDTzJIOG9iOG10ZmE1V0JqSFVMYXV3?=
 =?utf-8?B?dTFlb3lrUkxoUzBheHJhQ0J0MkFOZ1BFUzJpdElzRGZkQzFBeVMwb2xkZ2t1?=
 =?utf-8?B?RkZjOFhCdTludVNpZU4yS1B2T2pkWXFkLzI0Zk1LWFVIVHZHQ3NrTU5YR0J1?=
 =?utf-8?B?enVDdCtPNFkzUHc5SU13QS96Q1ZwYUZmNjVWNW9vM25zdEN3cE9PYkZ5dm5F?=
 =?utf-8?B?STNsREVuZG9JUGZnUk1GeTB3VVhublJYdG41SzNSM1grR0c4Y05yTVNrQ1RG?=
 =?utf-8?B?K0NiMjhleFoyTmo1RGxqb002ZzlIZERvaElPVXJ4QWlleVdMN3k2aWZTTUJM?=
 =?utf-8?B?Z202RkI4cTRkb2M1SC9JdEhPNmhRPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	E2+z54T9uAQnMpNXtmcS3aJUpfllsHbNsceTVRcnjq00bs7V/ydK9svRcl/gHxryQ7LskRwxZvXahrOIzG1IxylDdnZT8Tr3xKeqz/6HO7wkQeRu1ZgtzBE9qc/4YocBlS3kdL3fzyNKdW+zXf04Ayb0WY1tr2lK0Rndo/cznHrj5oK4F1vTUjVP8HkEGA553NlczZx/ZNmreLaM23P5c82bdOIHVz5gfij0A8OvooVln8HqNEzVKJspDBKuyOzJPDuV2T9/oo2bO90O37VRpBg/PjgvBVihipBm9GRMvPZEMpYK9z/a+vx2qPRk1UupbWvxEJv44dVvC+Uvr3v6oBGcqHRJ/RKRPGk3PnbiB3ko8KMXC1WwxrUoAMdWBzTFD5I9GffCN+gDEF9+ORXO8Q2jjxXMiXjDnwTleylbMHmKnpExkabDa039JMEEsT4f
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 17:23:52.6339
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 307f544f-baa4-40ef-cc3d-08de68c92980
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8648
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5AB7D11DE30
X-Rspamd-Action: no action

On Tue Feb 10, 2026 at 4:10 PM CET, Alejandro Vallejo wrote:
> Make them uniformly return EOPNOTSUPP when their dependent features
> are absent. Otherwise the compiler loses context and they might return
> ENOSYS instead.
>
> debug_op, mem_sharing_op and psr_alloc change behaviour and return
> EOPNOTSUPP when compiled out, rather than ENOSYS.
>
> While at it, remove the public headers from mem_sharing.h (forward
> declarations are fine) and add a missing xen/sched.h include (for
> complete struct domain definition).
>
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> ---
>  xen/arch/x86/domctl.c                  | 27 +++++++++++++++-----------
>  xen/arch/x86/include/asm/mem_sharing.h | 11 +++++++----
>  2 files changed, 23 insertions(+), 15 deletions(-)
>
> diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
> index d9521808dc..7066a18735 100644
> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c

[snip]

>      case XEN_DOMCTL_psr_alloc:
> +        ret =3D -EOPNOTSUPP;
> +        if ( IS_ENABLED(CONFIG_X86_PSR) )

This was supposed to be !IS_ENABLED(), obviously.

Cheers,
Alejandro

