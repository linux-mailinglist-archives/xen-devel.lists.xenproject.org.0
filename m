Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOxPJmXhb2n8RwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 21:11:17 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0CE4B127
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 21:11:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209332.1521381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viI3R-0006tX-Dt; Tue, 20 Jan 2026 20:10:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209332.1521381; Tue, 20 Jan 2026 20:10:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viI3R-0006qY-As; Tue, 20 Jan 2026 20:10:21 +0000
Received: by outflank-mailman (input) for mailman id 1209332;
 Tue, 20 Jan 2026 20:10:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nzue=7Z=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1viI3Q-0006qQ-LX
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 20:10:20 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09c6ac1d-f63c-11f0-b15e-2bf370ae4941;
 Tue, 20 Jan 2026 21:10:18 +0100 (CET)
Received: from IA1P220CA0013.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:464::17)
 by DS2PR12MB9637.namprd12.prod.outlook.com (2603:10b6:8:27b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 20:10:13 +0000
Received: from MN1PEPF0000F0E2.namprd04.prod.outlook.com
 (2603:10b6:208:464:cafe::27) by IA1P220CA0013.outlook.office365.com
 (2603:10b6:208:464::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.13 via Frontend Transport; Tue,
 20 Jan 2026 20:10:13 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E2.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 20:10:12 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 20 Jan
 2026 14:10:12 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 20 Jan
 2026 12:10:12 -0800
Received: from [192.168.244.38] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 20 Jan 2026 14:10:12 -0600
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
X-Inumbo-ID: 09c6ac1d-f63c-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fbWqCUrVUO9VgfMOQ2hU2CeMda8xcBgdJa+t8ba4tttxJWmHDrjhW/K8xmRdvt8j1P0Zn9SqBr8ofARUGKN3Y2yPv2eA8HSDECcXocev70C4Cj7j4hWuafrCJvj2LjgxZAnkhBEcehEijxn92zKvGhtc5TgShll/lbLBnbvTdbNxRU33sHsH9m7yCsBewpRH4BSn1iTtjukSpMadARNeyPd8wfXAjTGZ5ZW+/Q8r+lkgNcHZBuH9YXCe1b3gpAjm2x6DtejXwU4PTmlozbUi8tksaJ5n6LDS9ps4Sl00XwEMpsfrtunoowkOdYlygPbwqq9g8MYkkdUTimmyz1Sa7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aRwN2pwTFxG1BFiT1VepMXbP6XJ/Yt99EVG8jEO6EQw=;
 b=PJ8IhuzWMRTMew0N7OLDp8FEkT+Hz2g0/mH3kNCPp+StgKd9Qqw4OEvJUD0ZRwn2JzoeRiZwQedGb32Uf62xKywRkvQQlp3yJXcYI6OMxR35dmKAVqfulkrFKrFGFxZ5AkMmUvE9Vm2b/hbdL2ZIYPMSRWHlPl/Z5w20OtS9jqyyqZrQUlP2aNNBu+0xzSFsINZ1ZNNTf4LASaB/BDgg8UVeN4XVFUXlY/rJVvZk/HHDQr/6veTH6kgzA1xUJ7T2Cpp6EVulpQVJVawvo25jlr6gvQhgNxd9OwZ+khpb084B+W5QteJN0z4DelYYGxtiPwC2kXWW2QeqKd5Hzhp8GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aRwN2pwTFxG1BFiT1VepMXbP6XJ/Yt99EVG8jEO6EQw=;
 b=NhN/rwcJaxAdpmB0+Vn5WyaLHP6b7bs5xFldTMvQeXd2xpEdkwSjaqJjjDfAKBuBQKKBHiGBvthANVL5uHkNaLe7mWpar0Hv1gO8vOjMsvOv6Vjhb0VUhY3oejWoBZLHyJwXWXTqGVGgmmvQpDA8loQSXreRWKVgXP/8AOxwx+4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <b515af46-87f9-49eb-9d05-08315b25eb96@amd.com>
Date: Tue, 20 Jan 2026 15:10:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Partial revert "x86/xen: fix balloon target
 initialization for PVH dom0"
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>,
	<linux-kernel@vger.kernel.org>
CC: James Dingwall <james@dingwall.me.uk>, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>
References: <20260120140648.25977-1-roger.pau@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20260120140648.25977-1-roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E2:EE_|DS2PR12MB9637:EE_
X-MS-Office365-Filtering-Correlation-Id: 723c8ece-fbeb-4e02-f8db-08de585feb8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MmxNLzNsZVI5TmJjSlJzdWpsajBmUGc5WS9vVWpVL3h5QWE5REl0c3I0Mk5s?=
 =?utf-8?B?ZytLaUJDN1NNbGZIT2JNZ0Z5NTc5UGRIc0hObWxqYXBOa0tGajZwOEh5TVlo?=
 =?utf-8?B?L2w0cTVrc2MyeDF5Rm5EaHRmckNva0IybG5NYytBL1hJUjVEMFY5TkJPbSt0?=
 =?utf-8?B?UDArdHZFelRld0dkeGFFZkV3akRCeTIzL3A4OWs5dmNCY1l0NFFQdGc0d1FN?=
 =?utf-8?B?aXBqVEl0THhPVXpwRlk5YWF2T1FPNG9KaWc5S1k4cExpeHpoajUwY09jT1VD?=
 =?utf-8?B?dzZYMHdwRlVFNDk5UzN0OVQ1OGRhWUhLNVlXcTRhNEF3TkM5RUE3SUoxNDJB?=
 =?utf-8?B?cit3dkY4ODVzRUo3ZXJka0RXMXQ4VHRtZUFXS0VLVlNZbEdxNHM3MTdDUEN6?=
 =?utf-8?B?ZndacmFyNVc2UkJ0dXlMbnNTM1JEajRPU04rbHgxSiswWEJvVjNhT3JnY2Vx?=
 =?utf-8?B?ays1TSt6ZEVYbTloQzJNY2xrcUxWbVZZWE93WmxEMTc5SzhzSGI3bTR6ZjVB?=
 =?utf-8?B?TWRZWURIUFJLb2x4WWRrQkRNUTdreERMbjgwVnRweUxyY2RLMVdpRHRwQ29J?=
 =?utf-8?B?OGFJbEwzbS9IbHQwSWFadDFhNHFyR2MxKy9wOGN5b3hVSUgwY0xFc1RXWkht?=
 =?utf-8?B?K0xsbXd3VHJMUmxHRC9GVlZYaURoQUN1eEVZLzBvMnZ2MGJPaTIwalNSQ1VB?=
 =?utf-8?B?Z0xodVZ6NlFmdWxaa3VvQVQyYzMzZElIWDFuTHRod0RhWCtFSmpLdVhjNWt1?=
 =?utf-8?B?VWc2WE1sZjdRK21NQTlYSklpWmZKRTJiSTZuQWE5TzBGcno2K1RJdklRWjZE?=
 =?utf-8?B?bEhDdEFqOVNoSVFWMjdkckZab09tV1c4WFQ0RXRKdmV6U1h2eEZaR3ZsUFl4?=
 =?utf-8?B?blJyUEVDWDVjWEJpUzlma2V1NE56ZWNCSFphOFJuOUNoYTJtWlc5Mkw4YXhy?=
 =?utf-8?B?a2wrYVU2VUZLaExpLy9NcTFIeDhncVhnREx4NmthcFZWb0ZmVk9VWFhWcnBK?=
 =?utf-8?B?ajdDYTNLSHVaZXpaK1l2aEdXK2V3b0tpbzhYSW1VZlVjU3JiTFplYTJNWVk3?=
 =?utf-8?B?TmxRdkdVb25iKzE4elhvVnJnMlZVcUQvSG5Ebm5wTVk3RC9FZzVVMjVQTkVk?=
 =?utf-8?B?bHZJS1pteThKcW9uUWkxTGRLaHc3VTVuaDFJU2UzelFNeThGNjdKeVRkOVJL?=
 =?utf-8?B?Mkp4VmV3ZWtuWk9wdE84QlBsL0NXVS9EcXAySWcwZjJFQ3FPaXFoNGZRNS9C?=
 =?utf-8?B?cDNXcXVtUml2Rk9uQUNRY3BlZWl3alErRVhVNkJTSUNNdzR4UzZENUVTNi9N?=
 =?utf-8?B?WmFJVHlkUWtLUFptdDM4SDNBTk8xUmJINWFsdnhTQ0k4SkRaR3pxbkJhYlJ2?=
 =?utf-8?B?eTJaekZUYzFsUklmN3FLSnJmL0puT1BEL3Z2dXRESUJqejdHMXJ4NVc5cUdW?=
 =?utf-8?B?a0dxL0tTY1hZR0ZPK05VSDlFa2c4VEZjV1QxSlNEQ1d4QUpoc0tZUThDVTIr?=
 =?utf-8?B?cEpWb3A3dXBJUndFSnFxRzFBQjUwTkh0disxWHp6bjhadXZDUFNWNSsxSmFq?=
 =?utf-8?B?aU42VFlhdmtLYVdqc3Q3dWVUL2g4QWVjcGtFZ3liVmt6VU5zQlRnTVNYdWk4?=
 =?utf-8?B?N01FbWVPS0xwYm1iek5FNjJERnBpN3d2Mi9qNlpzY0g0aW1iTFlGM0YzMzFS?=
 =?utf-8?B?K2VuYnJuS1VSbFBPTDdQUlZlMStYQmRwQzRPUlpJUzlXRUFBa0lwRUVxVXBy?=
 =?utf-8?B?WmV1eXkydVlGTXhMRXpjdEViUU8yWDVSUzZlaVJxMjBaVHFqbi9aWHBjVjV6?=
 =?utf-8?B?NS9RamtqSkRQOU9PZkdrNzkrUkw1Y1A4WHdnKzFOcG9uV2hLZ0VpcTBnSjlB?=
 =?utf-8?B?UkpNcWpGKytBUU91cGJRdXdmWXBqWVl1NjEzNisyZllPc3VORkk3YU9aMW9E?=
 =?utf-8?B?czd3UGxSRHlySEZCWnRwZ2R1T1dCNld4cmQvZFhibE9TRVpZNEJkanRFS25H?=
 =?utf-8?B?Y1kzcjNPcVY3RVluTm5FSDFxbnAweTRFKzlSLzdKNlRHMEtDNVBzcXVVQXk1?=
 =?utf-8?B?bXlQeEpva0dIdWw4YnZvY2xXVmYycVdHZFJCbW9vMHhFeVpWeXd4bW9qUXBp?=
 =?utf-8?B?QXN3V1dhLy95YldGdmxWU2QzclRVWjZxbUwxbkUvaWxBdmtEMGdCaTBWSFRN?=
 =?utf-8?B?UVp1cEpaZkkvSkJiTXArczJTMzZtdnVMNk1EcVBnR2VsVEN4ODN3UTVpRERM?=
 =?utf-8?B?OWZmR1dMeWZHZDR3a1cwYUs1WmpnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 20:10:12.9853
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 723c8ece-fbeb-4e02-f8db-08de585feb8c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9637
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:james@dingwall.me.uk,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,dingwall.me.uk:email]
X-Rspamd-Queue-Id: EC0CE4B127
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-01-20 09:06, Roger Pau Monne wrote:
> This partially reverts commit 87af633689ce16ddb166c80f32b120e50b1295de so
> the current memory target for PV guests is still fetched from
> start_info->nr_pages, which matches exactly what the toolstack sets the
> initial memory target to.
> 
> Using get_num_physpages() is possible on PV also, but needs adjusting to
> take into account the ISA hole and the PFN at 0 not considered usable
> memory depite being populated, and hence would need extra adjustments.
> Instead of carrying those extra adjustments switch back to the previous
> code.  That leaves Linux with a difference in how current memory target is
> obtained for HVM vs PV, but that's better than adding extra logic just for
> PV.
> 
> Also, for HVM the target is not (and has never been) accurately calculated,
> as in that case part of what starts as guest memory is reused by hvmloader
> and possibly other firmware to store ACPI tables and similar firmware
> information, thus the memory is no longer being reported as RAM in the
> memory map.
> 
> Reported-by: James Dingwall <james@dingwall.me.uk>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

