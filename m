Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBFNMPOzb2nHMAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:57:23 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 494754813F
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:57:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208987.1521118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viCFq-0005ff-R8; Tue, 20 Jan 2026 13:58:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208987.1521118; Tue, 20 Jan 2026 13:58:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viCFq-0005e4-NW; Tue, 20 Jan 2026 13:58:46 +0000
Received: by outflank-mailman (input) for mailman id 1208987;
 Tue, 20 Jan 2026 13:58:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fwra=7Z=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1viCFp-0005cY-En
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 13:58:45 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ec004e7-f608-11f0-9ccf-f158ae23cfc8;
 Tue, 20 Jan 2026 14:58:39 +0100 (CET)
Received: from MN2PR04CA0019.namprd04.prod.outlook.com (2603:10b6:208:d4::32)
 by DM6PR12MB4155.namprd12.prod.outlook.com (2603:10b6:5:221::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 13:58:34 +0000
Received: from BL6PEPF0002256F.namprd02.prod.outlook.com
 (2603:10b6:208:d4:cafe::96) by MN2PR04CA0019.outlook.office365.com
 (2603:10b6:208:d4::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.10 via Frontend Transport; Tue,
 20 Jan 2026 13:58:26 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0002256F.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 13:58:34 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 20 Jan
 2026 07:58:30 -0600
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
X-Inumbo-ID: 1ec004e7-f608-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qa9gULsltpffN/UhPm1LhSYx5KCRdY96cs2E0O6O5aYMNFq8gJPdg2uwEcP20limVfWHiECLg0ZIHxhEnYdCj7+N4IOYyKc2GZtFuKQNxKOYCvcDo5wdJdiJWWa8FGdTuumEP9CCTvVmdjXeD+Q7A+X9DriwgOXvfWD8XNf9BqQA4HnHzI7wpB/tBgwsTKr+oDXJpY021Ur01TpPVNyaQt+3tRDxPwU6OvaIKofutXP7yewn6uYxPIzVVY73jact7SfpmZUSeQozFIx1nR/w49i1lc6IXRcun8NKXFGp+2zsSpYmJMuT0baM2bdMpXxQoqka8azddG9NBlSrGncOWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DtTJahCmtQW+pKLvp1uMxtrsmJN+a/9CGtZ7z4PWElE=;
 b=nfgVlQtMA+2jL2NsDySpWrnHp4AgeF+o0udSYq1sEkS6O7Vxyg8bDK94ekHBTvS7ttaMrYU5bY+cbuufBtzLN3YC7lJMrkZCl/gU0c7q0OIjAiydemMwXmrPS7Jb1FGHllmYLO6IFLQhZiOI7FCappietKYCnUmbKZcKQ/+OrXiPceVCtzuQw9HUGeV/Wwuy6jKBlmaA+MIe8gjQkHlPIShNlonqVnB+QeTuySy40hC4ZD16mCwnVewsoiaXB5mK8LABAq/u7eXeGDhtIqJJllvyvBSKcaStwIPqH+vfSHvSjMWir8tXM+DFHsAQC/1pZ1qy/B7l80rb4Bu1mZB44w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vates.tech smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DtTJahCmtQW+pKLvp1uMxtrsmJN+a/9CGtZ7z4PWElE=;
 b=xGRwJf4zSk+lipGdqt0+07+ZwiR1kd8VnoG4SzE8FH67EEdqM+9Ehf1Nfb/6WmaAP1wNftJ57gIf+qNI5UwNqlr08R+usZwGXxTJE9O0oV/YpovitmtZBmnl8hzGcqQ2TKi++NzgJqhXV0Vnkip33xxdWqB/io7gAePNm7m4SMc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 20 Jan 2026 14:58:28 +0100
Message-ID: <DFTGX8Y9NI0A.47HH2JUF4NI7@amd.com>
To: Teddy Astie <teddy.astie@vates.tech>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: Re: [PATCH 1/2] x86/svm: Add infrastructure for Bus Lock Threshold
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
X-Mailer: aerc 0.20.1
References: <20260120095353.2778-1-alejandro.garciavallejo@amd.com>
 <20260120095353.2778-2-alejandro.garciavallejo@amd.com>
 <9097240c-a892-41e8-a686-b89d84d0c03f@vates.tech>
In-Reply-To: <9097240c-a892-41e8-a686-b89d84d0c03f@vates.tech>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256F:EE_|DM6PR12MB4155:EE_
X-MS-Office365-Filtering-Correlation-Id: d25b0cbd-b214-4892-6382-08de582c005c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VVVPQ3A1dW9UZFRrelMxWkVFT25FUFVKTCtZajQ5bHJ5Z2tpZkEvQXJPYXRy?=
 =?utf-8?B?WThLbm1ZQUhnb2taaDZrSENqamFOVlVCZW9XTnlyc3lqanRmUW0yakQ5S29X?=
 =?utf-8?B?VGR5T3RDbXRyQ0g4cXlCbTM3anlPNXhlVWlIZXMxVGtEMWpnSkk4d0pVQUpN?=
 =?utf-8?B?elBLL09ZazhvWkd3NTFKeHZPYVFVelZwMXdzWENrY1g2QnJDd0Z6dzQ5WGxn?=
 =?utf-8?B?MWtvcXBsbVBXZTNsUEZ0UGFMS29RZVg5T2J2Qjd5WHN5d28vdFd2NnIzN3h6?=
 =?utf-8?B?Uk9zdU5VcWQrRnlTWUFhYndZNFRaRHdna0pGT0RrZVpmdmY1USthdEJJWWdF?=
 =?utf-8?B?cHFwSmxYanpoMUNPa2s1aC8zam5DRGxKV2Q0V3E3eEw0Ump0aUhtSjdXTGVK?=
 =?utf-8?B?WXVTQjJSWGQ2NFRaVmhOMDNIai9sUGRRUFppYzUyZkdjYVg2a2N3bVYxODFG?=
 =?utf-8?B?ZmVqNHFHRnl5ZzFLOXEvRkRRRWNtVmxTbEJvTGhaemgxdDBWLzQ4bUgxR0lJ?=
 =?utf-8?B?T0RMRkJYYVQ5eXZTbWE2eUhzMk9NbSs1Yi8vbUkvU003dnU2VnU5S0d5bVF5?=
 =?utf-8?B?bDgvRlY5ak94dHBGRUxwZmw2Z1M2b2NwWURmV2E3Unp5MDVRTzhhTWRodDBx?=
 =?utf-8?B?VGY0OGl1NVgrcVJTN0o1azJYN21BUk54elBkZFlwK2FlSHhnOFFWSHppalkw?=
 =?utf-8?B?NmRwbzVWTVJ0QlBtb2pUdmg2bG42eG90NFBQaFExVTI2OURGcnNHSXZXeWNE?=
 =?utf-8?B?RGNXS0E3ejA4Q3MrK0N2Ym80ZkptWG9Kdm1PU2sxaSs0cHpCUmRabWVmK3A1?=
 =?utf-8?B?QTFTWkoxTmJmMkYzY3ZRUWsxejdqUFFNL3NBMmZQRGNoUldYVFVLN2VNOHVa?=
 =?utf-8?B?aDF1NkhTdUhjU0VBR2xZOWtRVVBnYkdZQXU3QWM0VnF5RkVDVDhpUnZUNXpj?=
 =?utf-8?B?K2VQRXI1RTRXY2lsU1owekgrSVBtcUIyTUtxdEJHckQ4VitER2hzU3V3eURP?=
 =?utf-8?B?eWdHa0NrMEhaNjNVY243ZCs4MXBDckVKTWVzVlJLZU13TlpjUStNME5WTTNZ?=
 =?utf-8?B?ZWdYRVBWRGdBYWRwV1lXRnlnL2JyK3dpNEFlNUdkSFgyOWtPN0J3U1hkWHFL?=
 =?utf-8?B?aDBxb2pmUzV1NUFOTmVCcDNMd211dzFyaVdQRDhIU0hoR0hqOHJHbG5JV01X?=
 =?utf-8?B?V3FkSGFXSnFiQ09LaTJkZUw5cHBDOEh3UkNScXlDc1RqUFZFSzNVTkg5Z2pm?=
 =?utf-8?B?TktBNkxNWHljMkk0VTdEeHF4YUE5V0dnejY4cER1QVR1TkxpK084UzgyQ2xH?=
 =?utf-8?B?V2g3eEpRd0Z0bEprZnNpTk5UMXhnVzRPdjB4djhpZTVGNU0zc205UEdsaE9Q?=
 =?utf-8?B?L2pqRVVhV2ZqMDRTbnBXbkMwMkd1RWYydzJJYXFXYkZhNE1Kb3pwbnA0RGN6?=
 =?utf-8?B?NmR3WHVlcUMrUEVVOEcveEp4M1FLWlRBMDNZUElXRjAwL2RUZ1RoNEI3RHE5?=
 =?utf-8?B?TU5Ydmw1Z3VaYXFQZDZCVVpOOTNIanlQN1d4OUtZRDZkdmhiWFZQNUtEWnU1?=
 =?utf-8?B?dVpYYTBKcFZROERuYUtJelRqQlJDQkVseUkzTUdDekxBVnpSZFVidnZWL1FI?=
 =?utf-8?B?ZDE3V1o5QXBJL1V3cjdmQXZVSnhhR1RsYzZSMC94SkVwUHFRZWtJb1NIUmFs?=
 =?utf-8?B?S2xKMGZmd0tTQTBmU01LeVE5RzNEWVlVK0pjN05rSko0cnh3WittMW5sR01y?=
 =?utf-8?B?TGZvckZ3T0E0TnlhT1hCWlJuUE15VXlFelBjK09UL1pIbWVQK1ZGbDlVSFA1?=
 =?utf-8?B?b0hGaW8xMGRjR1h0RGx2Z2FWalhQZ3MrNXFXaC83WDEyM3owMWtrT2w5cGph?=
 =?utf-8?B?Z1h4b1FNM2NYVmFESlVxYkRwU1hmTllxb2svNHBGd090NGNsRGMvc0VuMy9y?=
 =?utf-8?B?NDRUNHNxYXVWQ1A2NHJzc3hpSFlrRGk3Z3dUUURiaWdoUDZwekdKY3UyNlp2?=
 =?utf-8?B?MUozQllmZjdyRlovaHZuZjJYQTgvd0FvMC9EWnZRdkJpNGhQdDZmTThET2ND?=
 =?utf-8?B?a1JhNVp3QktmN09OYys3SnVLL3RQclZLV1BhUHdFZndZVjNtUG04K2V2bTdO?=
 =?utf-8?B?NFZ5SGIzeUFsemY0YncyL0Rzc3NUYlhDT2UwUE1qdE5tclhUYVAxUnlUdTEv?=
 =?utf-8?B?UExGSUhLcnZ5d2laV1BxZ0VkcHVBRnUxN0JocnhZUm5iWlVtU3A4ajBIRzgw?=
 =?utf-8?B?R0p3YUV0Y0Jkd0x0NTRpdUg1STBBPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 13:58:34.0585
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d25b0cbd-b214-4892-6382-08de582c005c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0002256F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4155
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,vates.tech:email];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 494754813F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue Jan 20, 2026 at 2:18 PM CET, Teddy Astie wrote:
> Hello,
>
> Le 20/01/2026 =C3=A0 10:56, Alejandro Vallejo a =C3=A9crit=C2=A0:
>> Add missing scaffolding to enable BusLock Threshold. That is:
>>=20
>>    * Add general_intercepts_3.
>>    * Add missing VMEXIT
>>    * Adjust NPF perf counter base to immediately after the buslock count=
er
>>=20
>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>> ---
>>   xen/arch/x86/hvm/svm/svm.c            |  1 +
>>   xen/arch/x86/hvm/svm/vmcb.h           | 15 +++++++++++++--
>>   xen/arch/x86/include/asm/hvm/svm.h    |  2 ++
>>   xen/arch/x86/include/asm/perfc_defn.h |  2 +-
>>   4 files changed, 17 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
>> index 5d23603fc1..9748df87d8 100644
>> --- a/xen/arch/x86/hvm/svm/svm.c
>> +++ b/xen/arch/x86/hvm/svm/svm.c
>> @@ -2524,6 +2524,7 @@ const struct hvm_function_table * __init start_svm=
(void)
>>       P(cpu_has_tsc_ratio, "TSC Rate MSR");
>>       P(cpu_has_svm_sss, "NPT Supervisor Shadow Stack");
>>       P(cpu_has_svm_spec_ctrl, "MSR_SPEC_CTRL virtualisation");
>> +    P(cpu_has_bus_lock_thresh, "BusLock-Intercept Filter");
>>   #undef P
>>  =20
>>       if ( !printed )
>> diff --git a/xen/arch/x86/hvm/svm/vmcb.h b/xen/arch/x86/hvm/svm/vmcb.h
>> index ba554a9644..85e194f247 100644
>> --- a/xen/arch/x86/hvm/svm/vmcb.h
>> +++ b/xen/arch/x86/hvm/svm/vmcb.h
>> @@ -65,6 +65,11 @@ enum GenericIntercept2bits
>>       GENERAL2_INTERCEPT_RDPRU   =3D 1 << 14,
>>   };
>>  =20
>> +/* general 2 intercepts */
>
> nit, you want to says general 3 intercepts

I do. Well spotted

>
>> +enum GenericIntercept3bits
>> +{
>> +    GENERAL3_INTERCEPT_BUS_LOCK_THRESH =3D 1 << 5,
>> +};
>>  =20
>>   /* control register intercepts */
>>   enum CRInterceptBits
>> @@ -289,6 +294,7 @@ enum VMEXIT_EXITCODE
>>       VMEXIT_MWAIT_CONDITIONAL=3D 140, /* 0x8c */
>>       VMEXIT_XSETBV           =3D 141, /* 0x8d */
>>       VMEXIT_RDPRU            =3D 142, /* 0x8e */
>> +    VMEXIT_BUSLOCK          =3D 165, /* 0xa5 */
>>       /* Remember to also update VMEXIT_NPF_PERFC! */
>>       VMEXIT_NPF              =3D 1024, /* 0x400, nested paging fault */
>>       /* Remember to also update SVM_PERF_EXIT_REASON_SIZE! */
>> @@ -405,7 +411,8 @@ struct vmcb_struct {
>>       u32 _exception_intercepts;  /* offset 0x08 - cleanbit 0 */
>>       u32 _general1_intercepts;   /* offset 0x0C - cleanbit 0 */
>>       u32 _general2_intercepts;   /* offset 0x10 - cleanbit 0 */
>> -    u32 res01[10];
>> +    u32 _general3_intercepts;   /* offset 0x14 - cleanbit 0 */
>> +    u32 res01[9];
>>       u16 _pause_filter_thresh;   /* offset 0x3C - cleanbit 0 */
>>       u16 _pause_filter_count;    /* offset 0x3E - cleanbit 0 */
>>       u64 _iopm_base_pa;          /* offset 0x40 - cleanbit 1 */
>> @@ -489,7 +496,10 @@ struct vmcb_struct {
>>       u64 nextrip;                /* offset 0xC8 */
>>       u8  guest_ins_len;          /* offset 0xD0 */
>>       u8  guest_ins[15];          /* offset 0xD1 */
>> -    u64 res10a[100];            /* offset 0xE0 pad to save area */
>> +    u64 res10a[8];              /* offset 0xE0 */
>> +    u16 bus_lock_thresh;        /* offset 0x120 */
>> +    u16 res10b[3];              /* offset 0x122 */
>> +    u64 res10c[91];             /* offset 0x128 pad to save area */
>>  =20
>>       union {
>>           struct segment_register sreg[6];
>> @@ -583,6 +593,7 @@ VMCB_ACCESSORS(dr_intercepts, intercepts)
>>   VMCB_ACCESSORS(exception_intercepts, intercepts)
>>   VMCB_ACCESSORS(general1_intercepts, intercepts)
>>   VMCB_ACCESSORS(general2_intercepts, intercepts)
>> +VMCB_ACCESSORS(general3_intercepts, intercepts)
>>   VMCB_ACCESSORS(pause_filter_count, intercepts)
>>   VMCB_ACCESSORS(pause_filter_thresh, intercepts)
>>   VMCB_ACCESSORS(tsc_offset, intercepts)
>> diff --git a/xen/arch/x86/include/asm/hvm/svm.h b/xen/arch/x86/include/a=
sm/hvm/svm.h
>> index a6d7e4aed3..14fe4abf96 100644
>> --- a/xen/arch/x86/include/asm/hvm/svm.h
>> +++ b/xen/arch/x86/include/asm/hvm/svm.h
>> @@ -37,6 +37,7 @@ extern u32 svm_feature_flags;
>>   #define SVM_FEATURE_VGIF          16 /* Virtual GIF */
>>   #define SVM_FEATURE_SSS           19 /* NPT Supervisor Shadow Stacks *=
/
>>   #define SVM_FEATURE_SPEC_CTRL     20 /* MSR_SPEC_CTRL virtualisation *=
/
>> +#define SVM_FEATURE_BUS_LOCK_THRESH 29 /* Bus Lock Threshold */
>>  =20
>>   static inline bool cpu_has_svm_feature(unsigned int feat)
>>   {
>> @@ -56,6 +57,7 @@ static inline bool cpu_has_svm_feature(unsigned int fe=
at)
>>   #define cpu_has_svm_vloadsave cpu_has_svm_feature(SVM_FEATURE_VLOADSAV=
E)
>>   #define cpu_has_svm_sss       cpu_has_svm_feature(SVM_FEATURE_SSS)
>>   #define cpu_has_svm_spec_ctrl cpu_has_svm_feature(SVM_FEATURE_SPEC_CTR=
L)
>> +#define cpu_has_bus_lock_thresh cpu_has_svm_feature(SVM_FEATURE_BUS_LOC=
K_THRESH)
>>  =20
>>   #define MSR_INTERCEPT_NONE    0
>>   #define MSR_INTERCEPT_READ    1
>> diff --git a/xen/arch/x86/include/asm/perfc_defn.h b/xen/arch/x86/includ=
e/asm/perfc_defn.h
>> index d6127cb91e..ac7439b992 100644
>> --- a/xen/arch/x86/include/asm/perfc_defn.h
>> +++ b/xen/arch/x86/include/asm/perfc_defn.h
>> @@ -7,7 +7,7 @@ PERFCOUNTER_ARRAY(exceptions,           "exceptions", 32=
)
>>   #ifdef CONFIG_HVM
>>  =20
>>   #define VMX_PERF_EXIT_REASON_SIZE 76
>> -#define VMEXIT_NPF_PERFC 143
>> +#define VMEXIT_NPF_PERFC 166
>>   #define SVM_PERF_EXIT_REASON_SIZE (VMEXIT_NPF_PERFC + 1)
>>   PERFCOUNTER_ARRAY(vmexits,              "vmexits",
>>                     MAX(VMX_PERF_EXIT_REASON_SIZE, SVM_PERF_EXIT_REASON_=
SIZE))
>
> With that changed, Reviewed-by: Teddy Astie <teddy.astie@vates.tech>

Cheers,
Alejandro

