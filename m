Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iK9FBaFqc2l/vgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 13:33:37 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C85575DC0
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 13:33:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1212248.1523506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjGLt-0004Ws-3X; Fri, 23 Jan 2026 12:33:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1212248.1523506; Fri, 23 Jan 2026 12:33:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjGLt-0004Tp-0f; Fri, 23 Jan 2026 12:33:25 +0000
Received: by outflank-mailman (input) for mailman id 1212248;
 Fri, 23 Jan 2026 12:33:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hx8e=74=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vjGLq-0004Tj-Oq
 for xen-devel@lists.xenproject.org; Fri, 23 Jan 2026 12:33:22 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b23277e4-f857-11f0-9ccf-f158ae23cfc8;
 Fri, 23 Jan 2026 13:33:19 +0100 (CET)
Received: from BN9PR03CA0988.namprd03.prod.outlook.com (2603:10b6:408:109::33)
 by DM4PR12MB7504.namprd12.prod.outlook.com (2603:10b6:8:110::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 12:33:10 +0000
Received: from BN1PEPF0000468B.namprd05.prod.outlook.com
 (2603:10b6:408:109:cafe::c) by BN9PR03CA0988.outlook.office365.com
 (2603:10b6:408:109::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Fri,
 23 Jan 2026 12:32:47 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF0000468B.mail.protection.outlook.com (10.167.243.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 12:33:10 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 23 Jan
 2026 06:32:37 -0600
Received: from localhost (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 23 Jan
 2026 04:31:19 -0800
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
X-Inumbo-ID: b23277e4-f857-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tRyF6qdQeUkf5GpW68R+cytkXfCzhRpPp/dG/dprXX4zSrs5BmPXnR4PzsQZuYuiPic9xyBJjRU/YR0nHtQqtyMyBa8YvtnCW4ROAiyvETDheNVx6RVC/f5sHMPvC28MfLtjAvZwWkPCUG8UfqpEd1xGOLApcNH9aINe7dSAoWeU0j19rDxab91qIo56JEoT3RvOwpeeEEi7orAWDh/kmU0xdrrVRQLrKcn4Oc+6fFvN0FDFSGI9zcdAhkQplveN7P/ZNe640SRCZ0R7hLGIzYZmtnkq8+TzIGSc8PZYWC9vImzHYJwooJaI+JW4VxmYm5B8rjXTrom6+o/qXUA44w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sOQxoYRUoqiBrgQ2Q+ai5d2Bt/hVMWmdjg6vA/KIxoU=;
 b=o3edaJaUwDbT4apBvzj915qtB+0vHdpzfXiK0mEs+lujJR74LuRgQ6n/a3SURf3AwLCGg+UAhrjxb+P0fo+vlDHzP7qjmS7cfIeSHeIQORHO+q6sBemq5z4o4pI5zL/ynSDaaLEmLluC4LhiKV4dY1zVQ6wU3WUlKLb9KwgiMyz2+tSNYMS5x4tNrbxKVLWnc90LXOGv7RhQMdwDKZOS6zFprBKzeIgPbqIP6hH4qLQhoryMShLOZ02iDhtM1MaUUfWIJ03ziHvipO2RRg0cquwpp/Y2SaLtzaRN+4+sp3dCK2kj6tTUF5ztHW0c4TgyGjVtM4txNpMZGluqAfgc/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vates.tech smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOQxoYRUoqiBrgQ2Q+ai5d2Bt/hVMWmdjg6vA/KIxoU=;
 b=Z/V6WmnTrW9fDkTUN7ElEVtSPtAAYlg+JIjYNrLOlENMPI/FO5SgqqBsBC5I9GSvLHOUVrZMHiskEmuqFVKV1FszU/Tr2Q6/5ilMu6oX4dyIlkjgyajat2twvKx8ZhfiG3Brr9sBClny5v9Vc+Cpw/j4FcX1KaFXImaB6UabJeM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 23 Jan 2026 13:31:17 +0100
Message-ID: <DFVYY4VLO62T.6F7XW3GTVT8V@amd.com>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH 4/4] x86/svm: Drop emulation of Intel's SYSENTER
 behaviour
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Teddy Astie <teddy.astie@vates.tech>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20260122164943.20691-1-alejandro.garciavallejo@amd.com>
 <20260122164943.20691-5-alejandro.garciavallejo@amd.com>
 <8b0eed14-e35c-46b4-b414-1f0309a27a60@vates.tech>
In-Reply-To: <8b0eed14-e35c-46b4-b414-1f0309a27a60@vates.tech>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468B:EE_|DM4PR12MB7504:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b6b7441-ab0e-4b13-7bc0-08de5a7b919f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NFdWQkNzSmg2engrYzNwOWJxQ2dLalBPbWtWeHJZc0Exdi9objNVMnE5T3Nj?=
 =?utf-8?B?ckNyUENjaFdUNlZVdnNqa21ZZ1VLZFpBa2dZN09yWnBrZDJSSEVveFVsV1k1?=
 =?utf-8?B?RkpoM2RPOEluM1JTWmJZY0NzTFYxbmc4UnA0dHpjV3hrN3dvQ0twRWJUZXJ1?=
 =?utf-8?B?ek45WnBtbXlCbFI4VkNNNk5lVE5yYXVMbHVYc0V2c3FhVnh4MGY2SDRneXl0?=
 =?utf-8?B?Yjh4czJQZGtncmgzbGl4U0FpT2tMNHN1SjREQXVXdGoxd1VFZkNTVkE2eC90?=
 =?utf-8?B?d3FrZ3YxeWF1U0JxSGJYbEdKRmFlTStYb1lVbTlLVmluTXFvUVNCbWszZXRy?=
 =?utf-8?B?Vm0wZUxkdmdjSzFiKzJ2QlRBM2pkQnZxT2oyNWRuUWJSZlZQL05lbjRyZ21U?=
 =?utf-8?B?QTRxRktVb3ZtSmxXWnNTck40RnBXL3YrVVVGZFMvNDFlVHozVUV2VWJHRUVw?=
 =?utf-8?B?YXVJZEhyK2RHdWErRmhyb0M0Ym5UOXlYRUYyL3IzMTZMd3NtKzRXNVlHVE55?=
 =?utf-8?B?OExLaTdqalFvSmNpYXBXMEdHVy9Zc1ZnVmlhV3drc2FrelBvYzlqd3Q1eHVt?=
 =?utf-8?B?bElscUZNRkFENDNaaHUvZzFBVDlXMnd3aGkveFA2aVJZNHIvZW9ZcEVHUkkr?=
 =?utf-8?B?eG93a3ErVVNldFpBRXhydnN6OGh5UzFRRHRSbldZblFwZVViSmU2ZzdoeVpn?=
 =?utf-8?B?Nys5QWVqTlFZMWpFOE0xZFNacXhRUlhTVkc5QTl2OElGWDRkdHVORDFIWWJ4?=
 =?utf-8?B?NS80SUJEb2twWXUreDh4UVNPRGJmbzUyOE8yR3ZqcU9YUytHR2I4UGI5T1FW?=
 =?utf-8?B?Q0ExdXJ4VmVxQUYwWVVxUXlNckZreDJrREIzOWlpUDNnK1l3RC9rYk5BVUhC?=
 =?utf-8?B?MHg0M0xpNUtKOElGMTFPUWVJakVTTDdUeHllbTkwc2ZlYnRwMmpKYkEwWWFW?=
 =?utf-8?B?NzUwMmViSERQeEVsZnZhdjE3T2NkWEwvc3hwckRici9ISWZReHVvOHpON25n?=
 =?utf-8?B?V3ZON2hEUmwxY1k1RFkxQ0syaWpOUzExU0JvYmJ1bFhmV1dZMzNCTHNmUVZt?=
 =?utf-8?B?eGRhTzFEdXZtbGl5ck96R0xuNTJuVkRWd2dpT1ovTUxTQkhvbHhXMkNVZVlB?=
 =?utf-8?B?RW93YThUZGNhZTZjTGtKNUZ3VE9UTHJTYlZBdGpTbkVvbHFKZ3BYV0puMTRx?=
 =?utf-8?B?akZDc0lKcTNhNW83TGMzSXJYaGs4VEJBdXBxckZrSVc4V2phb3B5bzJtQ2pX?=
 =?utf-8?B?YW44L01TV2p3RkhEaWVjMEJqVGpmNTE2M3dhZU03aGluT1hPTmxwRmluNU83?=
 =?utf-8?B?aWRTY3N4K08zUEtEay94U0FNVHA2djFrSkFFNkY2aGdDZ0JBUkxFY3k5S1dC?=
 =?utf-8?B?bzN5amxQSzBnbHdBaG55amxEeTgwcWF5QmNQVEV3ZVdNdVpDL2tDRDEyM1F1?=
 =?utf-8?B?eFpVNDdWditxbXAyUFJuUjV5d0w4Ym9Ud21KMks1a3VQcWdaeWxuRmtrbGhx?=
 =?utf-8?B?WE1KUnQ5OGExL1hNaXh2Y0lhZWNTdXFIWUNhMWFXN3k3MFgxc3N4dUgycnFG?=
 =?utf-8?B?RnF2YkhuOGJuRjNHeFBOV1VveEkrRFlrSFhpeUFMNldaL0VWTjhwaW0rcFhU?=
 =?utf-8?B?cE5ocEZFT0xPY1B5Z2hDSitqTkdLYUp4RWRBS3pDNWFEVlZGcSs3TVUweUd3?=
 =?utf-8?B?V2hFczRCK0NQdlRYQ1JZQnV1RjYwcGhHb1ZTYkR6WlA2enpPVU5FdkFjbWhv?=
 =?utf-8?B?dDVIcnVMNzhZYmxMWE5GZiswTGJpNWFoVEl6blc0WVRGYkF4cGI3UWsxWXl1?=
 =?utf-8?B?emRLckdWcUljM05obWI0L0VFVUE5Q0RrcVdkaHhXckIvdDBDdThWTzVFVkNZ?=
 =?utf-8?B?WTdSNVNJb1RUQTlXYTlxazZuZUY2dWcyM3VibjFUeTZjSzZYY2dYQzJnUW9l?=
 =?utf-8?B?Y0hkbzlqRnM4MHFNbS9WbFI3bHUvSjQyVmk2ZGtMNU5meHhnOENkTDNjN3dE?=
 =?utf-8?B?Z3Y5VDRoWFhINS9EbU1NOTZHRFdZdXFxRjNQSVczTTRVU3JoWlZPMXh6dGpQ?=
 =?utf-8?B?UmQyN2hpNFB5S0x4aTVnd0dhV0QrUG5IajVidHVNM0JMemJMUEhwSWhTQ2VZ?=
 =?utf-8?B?SFZaUXY0Vlp6Wm85WFU4Z2ZUQUtiSEdqMU9Nd1N5cWNxVWE3YlVYVElvKzlq?=
 =?utf-8?B?V0REbHc5RERGbEtVK3N6MDhCNk56UG5wMi9XWE85SHZpaVMzbEl3MmdSb1RY?=
 =?utf-8?B?dCtwRERBZXBsZGM3dlpVUUNLZ1dRPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 12:33:10.3235
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b6b7441-ab0e-4b13-7bc0-08de5a7b919f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7504
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 1C85575DC0
X-Rspamd-Action: no action

On Thu Jan 22, 2026 at 6:52 PM CET, Teddy Astie wrote:
> Le 22/01/2026 =C3=A0 17:51, Alejandro Vallejo a =C3=A9crit=C2=A0:
>> With cross-vendor support gone, it's no longer needed.
>>=20
>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>> ---
>>   xen/arch/x86/hvm/svm/svm.c               | 42 +++++++++++-------------
>>   xen/arch/x86/hvm/svm/vmcb.c              |  3 ++
>>   xen/arch/x86/include/asm/hvm/svm-types.h | 10 ------
>>   3 files changed, 22 insertions(+), 33 deletions(-)
>>=20
>> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
>> index 0658ca990f..e8f19dec04 100644
>> --- a/xen/arch/x86/hvm/svm/svm.c
>> +++ b/xen/arch/x86/hvm/svm/svm.c
>> @@ -401,10 +401,6 @@ static int svm_vmcb_save(struct vcpu *v, struct hvm=
_hw_cpu *c)
>>   {
>>       struct vmcb_struct *vmcb =3D v->arch.hvm.svm.vmcb;
>>  =20
>> -    c->sysenter_cs =3D v->arch.hvm.svm.guest_sysenter_cs;
>> -    c->sysenter_esp =3D v->arch.hvm.svm.guest_sysenter_esp;
>> -    c->sysenter_eip =3D v->arch.hvm.svm.guest_sysenter_eip;
>> -
>>       if ( vmcb->event_inj.v &&
>>            hvm_event_needs_reinjection(vmcb->event_inj.type,
>>                                        vmcb->event_inj.vector) )
>> @@ -468,11 +464,6 @@ static int svm_vmcb_restore(struct vcpu *v, struct =
hvm_hw_cpu *c)
>>       svm_update_guest_cr(v, 0, 0);
>>       svm_update_guest_cr(v, 4, 0);
>>  =20
>> -    /* Load sysenter MSRs into both VMCB save area and VCPU fields. */
>> -    vmcb->sysenter_cs =3D v->arch.hvm.svm.guest_sysenter_cs =3D c->syse=
nter_cs;
>> -    vmcb->sysenter_esp =3D v->arch.hvm.svm.guest_sysenter_esp =3D c->sy=
senter_esp;
>> -    vmcb->sysenter_eip =3D v->arch.hvm.svm.guest_sysenter_eip =3D c->sy=
senter_eip;
>> -
>>       if ( paging_mode_hap(v->domain) )
>>       {
>>           vmcb_set_np(vmcb, true);
>> @@ -501,6 +492,9 @@ static void svm_save_cpu_state(struct vcpu *v, struc=
t hvm_hw_cpu *data)
>>   {
>>       struct vmcb_struct *vmcb =3D v->arch.hvm.svm.vmcb;
>>  =20
>> +    data->sysenter_cs      =3D vmcb->sysenter_cs;
>> +    data->sysenter_esp     =3D vmcb->sysenter_esp;
>> +    data->sysenter_eip     =3D vmcb->sysenter_eip;
>>       data->shadow_gs        =3D vmcb->kerngsbase;
>>       data->msr_lstar        =3D vmcb->lstar;
>>       data->msr_star         =3D vmcb->star;
>> @@ -512,11 +506,14 @@ static void svm_load_cpu_state(struct vcpu *v, str=
uct hvm_hw_cpu *data)
>>   {
>>       struct vmcb_struct *vmcb =3D v->arch.hvm.svm.vmcb;
>>  =20
>> -    vmcb->kerngsbase =3D data->shadow_gs;
>> -    vmcb->lstar      =3D data->msr_lstar;
>> -    vmcb->star       =3D data->msr_star;
>> -    vmcb->cstar      =3D data->msr_cstar;
>> -    vmcb->sfmask     =3D data->msr_syscall_mask;
>> +    vmcb->sysenter_cs  =3D data->sysenter_cs;
>> +    vmcb->sysenter_esp =3D data->sysenter_esp;
>> +    vmcb->sysenter_eip =3D data->sysenter_eip;
>> +    vmcb->kerngsbase   =3D data->shadow_gs;
>> +    vmcb->lstar        =3D data->msr_lstar;
>> +    vmcb->star         =3D data->msr_star;
>> +    vmcb->cstar        =3D data->msr_cstar;
>> +    vmcb->sfmask       =3D data->msr_syscall_mask;
>>       v->arch.hvm.guest_efer =3D data->msr_efer;
>>       svm_update_guest_efer(v);
>>   }
>
> I think we should merge svm_save_cpu_state/svm_vmcb_save into=20
> svm_save_vmcb_ctxt and similarly for svm_load_cpu_state/svm_vmcb_restore=
=20
> into svm_load_vmcb_ctxt to avoid having multiple functions as a part of=
=20
> the same logic.
>
> That could be done in a separate patch (or series).

Maybe. I (subjectively) think it makes sense to keep separate the fields co=
ming
straight from the VMCB from those that have authoritative values elsewhere.

Nothing precludes having that visual separation within a single function th=
ough
it's not like either is huge.

I may append it as a patch at the tail.

>
>> @@ -1720,12 +1717,9 @@ static int cf_check svm_msr_read_intercept(
>>  =20
>>       switch ( msr )
>>       {
>> -        /*
>> -         * Sync not needed while the cross-vendor logic is in unilatera=
l effect.
>>       case MSR_IA32_SYSENTER_CS:
>>       case MSR_IA32_SYSENTER_ESP:
>>       case MSR_IA32_SYSENTER_EIP:
>> -         */
>>       case MSR_STAR:
>>       case MSR_LSTAR:
>>       case MSR_CSTAR:
>> @@ -1740,13 +1734,15 @@ static int cf_check svm_msr_read_intercept(
>>       switch ( msr )
>>       {
>>       case MSR_IA32_SYSENTER_CS:
>> -        *msr_content =3D v->arch.hvm.svm.guest_sysenter_cs;
>> +        *msr_content =3D vmcb->sysenter_cs;
>>           break;
>> +
>>       case MSR_IA32_SYSENTER_ESP:
>> -        *msr_content =3D v->arch.hvm.svm.guest_sysenter_esp;
>> +        *msr_content =3D vmcb->sysenter_esp;
>>           break;
>> +
>>       case MSR_IA32_SYSENTER_EIP:
>> -        *msr_content =3D v->arch.hvm.svm.guest_sysenter_eip;
>> +        *msr_content =3D vmcb->sysenter_eip;
>>           break;
>>  =20
>>       case MSR_STAR:
>> @@ -1940,11 +1936,11 @@ static int cf_check svm_msr_write_intercept(
>>           switch ( msr )
>>           {
>>           case MSR_IA32_SYSENTER_ESP:
>> -            vmcb->sysenter_esp =3D v->arch.hvm.svm.guest_sysenter_esp =
=3D msr_content;
>> +            vmcb->sysenter_esp =3D msr_content;
>>               break;
>>  =20
>>           case MSR_IA32_SYSENTER_EIP:
>> -            vmcb->sysenter_eip =3D v->arch.hvm.svm.guest_sysenter_eip =
=3D msr_content;
>> +            vmcb->sysenter_eip =3D msr_content;
>>               break;
>
>>  =20
>>           case MSR_LSTAR:
>> @@ -1970,7 +1966,7 @@ static int cf_check svm_msr_write_intercept(
>>           break;
>>  =20
>>       case MSR_IA32_SYSENTER_CS:
>> -        vmcb->sysenter_cs =3D v->arch.hvm.svm.guest_sysenter_cs =3D msr=
_content;
>> +        vmcb->sysenter_cs =3D msr_content;
>>           break;
>>  =20
>>       case MSR_STAR:
>> diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
>> index e583ef8548..76fcaf15c2 100644
>> --- a/xen/arch/x86/hvm/svm/vmcb.c
>> +++ b/xen/arch/x86/hvm/svm/vmcb.c
>> @@ -97,6 +97,9 @@ static int construct_vmcb(struct vcpu *v)
>>       svm_disable_intercept_for_msr(v, MSR_LSTAR);
>>       svm_disable_intercept_for_msr(v, MSR_STAR);
>>       svm_disable_intercept_for_msr(v, MSR_SYSCALL_MASK);
>> +    svm_disable_intercept_for_msr(v, MSR_IA32_SYSENTER_CS);
>> +    svm_disable_intercept_for_msr(v, MSR_IA32_SYSENTER_EIP);
>> +    svm_disable_intercept_for_msr(v, MSR_IA32_SYSENTER_ESP);
>>  =20
>>       vmcb->_msrpm_base_pa =3D virt_to_maddr(svm->msrpm);
>>       vmcb->_iopm_base_pa =3D __pa(v->domain->arch.hvm.io_bitmap);
>> diff --git a/xen/arch/x86/include/asm/hvm/svm-types.h b/xen/arch/x86/inc=
lude/asm/hvm/svm-types.h
>> index 051b235d8f..aaee91b4b6 100644
>> --- a/xen/arch/x86/include/asm/hvm/svm-types.h
>> +++ b/xen/arch/x86/include/asm/hvm/svm-types.h
>> @@ -27,16 +27,6 @@ struct svm_vcpu {
>>  =20
>>       /* VMCB has a cached instruction from #PF/#NPF Decode Assist? */
>>       uint8_t cached_insn_len; /* Zero if no cached instruction. */
>> -
>> -    /*
>> -     * Upper four bytes are undefined in the VMCB, therefore we can't u=
se the
>> -     * fields in the VMCB. Write a 64bit value and then read a 64bit va=
lue is
>> -     * fine unless there's a VMRUN/VMEXIT in between which clears the u=
pper
>> -     * four bytes.
>> -     */
>> -    uint64_t guest_sysenter_cs;
>> -    uint64_t guest_sysenter_esp;
>> -    uint64_t guest_sysenter_eip;
>>   };
>>  =20
>>   struct nestedsvm {
>
> Reviewed-by: Teddy Astie <teddy.astie@vates.tech>

Cheers,
Alejandro

