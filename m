Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAeeGZtOd2n0dwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 12:23:07 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4708797D
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 12:23:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213598.1524057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkKgJ-0007E6-IT; Mon, 26 Jan 2026 11:22:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213598.1524057; Mon, 26 Jan 2026 11:22:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkKgJ-0007CZ-F5; Mon, 26 Jan 2026 11:22:55 +0000
Received: by outflank-mailman (input) for mailman id 1213598;
 Mon, 26 Jan 2026 11:22:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p0Yd=77=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vkKgH-0007CR-Q4
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 11:22:53 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59fb3b99-faa9-11f0-b15f-2bf370ae4941;
 Mon, 26 Jan 2026 12:22:51 +0100 (CET)
Received: from BY3PR04CA0027.namprd04.prod.outlook.com (2603:10b6:a03:217::32)
 by SA1PR12MB5671.namprd12.prod.outlook.com (2603:10b6:806:23b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 11:22:47 +0000
Received: from SJ1PEPF0000231E.namprd03.prod.outlook.com
 (2603:10b6:a03:217:cafe::c5) by BY3PR04CA0027.outlook.office365.com
 (2603:10b6:a03:217::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Mon,
 26 Jan 2026 11:22:49 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF0000231E.mail.protection.outlook.com (10.167.242.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Mon, 26 Jan 2026 11:22:46 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 26 Jan
 2026 05:22:46 -0600
Received: from [10.252.147.171] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 26 Jan 2026 05:22:44 -0600
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
X-Inumbo-ID: 59fb3b99-faa9-11f0-b15f-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VvG0+nqCn/WtkUq0gQDOLSmDozpD+L5Vhiyzemda+cgqNsj4br+ZBkwcxPAlMVrVkhA9G8m3IwBkXrtE0iIYWqkFnAcju4Y5gGcLZy3MbGdtArnAAn+X3gfC/i5WFP3BuR/vxEHN5liFtRvngiMwyMkTiCLoHfidLDjnOvjrjsEdjPvEB+OiN+CnVXuWgRPQbrcw3udXanBgVQlH/oxsztma/4Wyyuh/LlFG5d6HUAJcglnpLxHzU+Tgw0nEzK8JzdnWW3Hp0AETS3Ew2wqldPNXzUVlM4h6+lFTfB5QIlxJgsOQdGMJN/RpPOjWy7dNPqCZO15yl/DdT6ELfsrCig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m6qyioIvU9RUYXuwhlVte9ZxBF1MRC0yQ/DRbt2EtgE=;
 b=VqTzhuSEYHw1vQFt5VQkb0yMp9lb0AKFEK4iJ+qKHPISXA5WZ0TpP/+iCuP8XrIJdB4aN7L3T8S9TWcZIrSTLwpVDD/t5R5TLYZpfNEaUVmO5gLY7aR9R1+TJmco3TekA+L+pqlQ8Qdbw/wiunmCnZBQaKALp61YI6r74U1P+DxAv4uvtzp3tpyPetmtQMJHhIFq9zulN2CEhBfgyvgCG4pd0r2Aes9+Z0jJAYSeHH6g5TSDiY6kh2cbjU3BWPvMgbTotpYXUt52sgC9QtshEcAYTo00YKnLGu/ghqU3t5cDgAoDCA/7CyFF8jWvLlR8zYwDzp+8SQoIfTDSL4fjhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m6qyioIvU9RUYXuwhlVte9ZxBF1MRC0yQ/DRbt2EtgE=;
 b=Ed2Hqw48FdfTOOnBRQ3JGkBXVoD+8dO/jIZuHddTkcphdjB/ulE6hS7fPdw3CHascXl+WHcaFd5juH1FxPpzpENQ2kRj3ZMnSi2ES97gnOxf3T+R+JX7BiJ3aFxfPsav2GvOBzjMgp/EY1wcrhVJlGpw2sqcKaypcyX6N2vHNFY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <216b8a31-a0c1-422b-b459-e831657bf07b@amd.com>
Date: Mon, 26 Jan 2026 12:22:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] build/non-x86: fix symbol lookup in presence of build-id
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Timothy Pearson
	<tpearson@raptorengineering.com>, Mykola Kvach <xakep.amatop@gmail.com>
References: <f05fbf28-86dc-4910-96d5-922f8e7e4e89@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <f05fbf28-86dc-4910-96d5-922f8e7e4e89@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231E:EE_|SA1PR12MB5671:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e10f221-3215-40e6-c84a-08de5ccd3b91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y0JDekdTNy9nR1pVTzJjV2g2akovWldDa0lYVlQ1S3M0ZjdaQWNNakpkSnpL?=
 =?utf-8?B?bjZkaENaU0g1ZlZTQTZ6RHBtLyszbldCc3FNdUVMQTJod0dqaVVmWEtkUHlm?=
 =?utf-8?B?S1JWT3B2dkF2aTZPa1daZUdXbnROSlV0TmpZOHFjNVk3UXBnSHpHeTJFL1dq?=
 =?utf-8?B?S0hHTnpGTnlKUzR1UitrWWNUQjByR1NjR0RTWW1NK04yRG9ydERob2NySFM5?=
 =?utf-8?B?Y0hWbTZuMjFraTg3N25yeGwvdXJndzJCOEpXS0o5bmo0UEVvNmxRK3ZqQjQ2?=
 =?utf-8?B?SUdNZ29jOCtQUXE1TFZKbjc4c0wvYmJ3bnJVbUN6eUVUY0pxQXB0WWdteFNw?=
 =?utf-8?B?Nm5hK01RUHozSDBIV0k1NjZBdjdtUzdpeWZRbFYzODd0QzZYb1F1WnhnQ21K?=
 =?utf-8?B?RnBDMzQ3dTNwbW8vNVplSUZucVU4YisxSjVrWG95ZWxCOGRqdVUzOFFubmdM?=
 =?utf-8?B?U3JnUGF4NUdEQ2s5bW5JL2EvdXgwVExjOEpuYnYybzl5cEpGMnRneFNWYW9O?=
 =?utf-8?B?YWZTK0kyMXYxZmY1bmphb09ySnVRZ2tsdlpBNm1TQmVrc08zRmVMVnN5SGxs?=
 =?utf-8?B?SXhCdUo0ODJYcEtNWVFJK2djZnNnK055SW9Cck5Lc1IwNGFNQjRhQzlXVytN?=
 =?utf-8?B?V1Z0V2pKRXFYMUtqVUx6Si91VXo1T01hYmhiN0hIckxJc01XR3VjQWU0TUps?=
 =?utf-8?B?NC9IT0pXWHhOeEVGclZKSlgyUzU0ZlFCNTVkaWpwN1FLZ3ZXMnVUTWtYUGFG?=
 =?utf-8?B?ZnNjMWdWTjk0c096Y2RTc2diNUpKaC9QODJTNlJaRi8xVGV5RDZzT1U4WTVj?=
 =?utf-8?B?NG1LSUF0SmY1VmQ5aXVLK3NuRWNSWjdMeDd3K0VZY1lva1FlRVlJV1BVVUFB?=
 =?utf-8?B?NXY5UDhKSG5HZDRvOHgyNXJwVGR2WkVOYUxsNGNjS0pYYkdENTN5Wlk3MTBx?=
 =?utf-8?B?K2cvZFdtbk9hWjl2ZnFJaXo5cS9zempyTFU1cDRBdkJvRjNYbzVlenhaZFpW?=
 =?utf-8?B?VHNJdTZSY1M0dFRGZXJ0Y04yUlpFVURQZk5QNFBGaWlnZ2FmV1pJVCtyaDRp?=
 =?utf-8?B?NDZLd3ppYnlTY09vNWZoQkQwaTgzMkY4Z3ByMUVNbkhCT0p6OFdCZ2tFSTc5?=
 =?utf-8?B?bk1CaFFvWkV6YmdVdElobll1eGFXdlJzQ1drNW9sNDdPcU1OUmN5dUlTeDhO?=
 =?utf-8?B?TVNXSVovOHJjZVNwQ3NPT242cGIxdGVVSWdkL2k2MERyUy9uNzl0bDFmY3Nr?=
 =?utf-8?B?bEd6VHlYQnZpRFB2NU4wclp5aW15NWZvQkxHbUdzRlMzT0V4b2xkdlJ2amFn?=
 =?utf-8?B?Qjg4RzRtOWhJZ21maVJieCtDekFsMUJSSXVTelFLRFdTWFA4b2NOTUtTVU4y?=
 =?utf-8?B?bUduQVNEcy9xa2RmUnZsVGc4QWhZV21yR3hlL1lSYkVHWmZtV3UxWTh6UWg2?=
 =?utf-8?B?L3Q1RWl4MXJpOHRtLytkMDF4clRzYmttbFFrVjhESElHN3dON0hzRnlaL2Jl?=
 =?utf-8?B?TGtKNXU4L0ZraEJISUc5bUpMbHZlUkhGUW8zWVd3Y21MR2Z2akdSMWxUc3Zw?=
 =?utf-8?B?OFVVVDFTcExBQm1lWWg5amZtclFtY2pLSFU3KzNDdXlzYldoUm16R2ZPUTNY?=
 =?utf-8?B?ck9VY0JPTU5PaUFnUUlwU0FJMGU0TFkzSUgwTUlEU2Qrdmc4bFl3ZlJ6cWdL?=
 =?utf-8?B?WEdLdWkwRnZDMEg5b2o1cFRmUkNQd1drUWNqWUxqNXRiWWZUYmV3QkRTN0xO?=
 =?utf-8?B?NnAvNnI0UUNYeXpha2pXTi9IdVdGNDk0Z1ByOW5relR6NWJZNTRVMDdmVXZO?=
 =?utf-8?B?NWkzNnJIYjc2SlVKOHdNa21UM20zUzE2QWUrZU5KYjFwYW1QRk1Wb1lVVVFw?=
 =?utf-8?B?Y2NML3MzZDFDZklBb3V6NDRtTmYzKzhNNm1yNVIwdzR0QVV5bXgxRmM5Z2ty?=
 =?utf-8?B?MDdaK2tidFV2S09ZSmgwcGl0aEp2d1lqbzdpWlppeVQxM0pmNkM4Q0JSbVZk?=
 =?utf-8?B?M0Q1WDEwb1FPZy9DQkovNHZjdDdvVjRrQ0oreUhGTFMxUGRNM2pXM2NiMXlH?=
 =?utf-8?B?d3dTaE82dmE2RGxjM1JxSU9sK0d4akMzQXhkMEVhNGVzbWdPREhqcU9wUlNj?=
 =?utf-8?B?ZzZPZHc1YnJ1VWNFZGt1WU9zR0NkSjN2U2xyNjJiZnBNeURvYSt2SmtYOG90?=
 =?utf-8?B?ZDZNVThUaWZVWG9OU3Vxanc1czJUaC9acFdhQ29CUHpVc3dkOXFtMGUra2xo?=
 =?utf-8?B?ckFEVzl0bGZ3d29wVi9SVHlWQWNnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 11:22:46.9817
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e10f221-3215-40e6-c84a-08de5ccd3b91
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5671
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[citrix.com,xen.org,kernel.org,vates.tech,arm.com,epam.com,gmail.com,raptorengineering.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:bertrand.marquis@arm.com,m:volodymyr_babchuk@epam.com,m:oleksii.kurochko@gmail.com,m:tpearson@raptorengineering.com,m:xakep.amatop@gmail.com,m:oleksiikurochko@gmail.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,amd.com:email,amd.com:dkim,amd.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: CA4708797D
X-Rspamd-Action: no action



On 16/01/2026 11:52, Jan Beulich wrote:
> It's not clear why only x86 had $(build_id_linker) applied to all three
> linking passes. Not doing so will alter symbol offsets between the 2nd
> and 3rd passes for, potentially, all of the symbols at higher addresses
> (intermediate alignment padding may mask this effect, though, so it will
> look as if problems appeared randomly).
> 
> Fixes: a353cab905af ("build_id: Provide ld-embedded build-ids")
> Reported-by: Mykola Kvach <xakep.amatop@gmail.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


