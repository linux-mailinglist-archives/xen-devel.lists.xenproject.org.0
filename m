Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFwwOutQd2n0dwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 12:32:59 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5225087ADB
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 12:32:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213612.1524067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkKpi-0000hN-HP; Mon, 26 Jan 2026 11:32:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213612.1524067; Mon, 26 Jan 2026 11:32:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkKpi-0000f2-DS; Mon, 26 Jan 2026 11:32:38 +0000
Received: by outflank-mailman (input) for mailman id 1213612;
 Mon, 26 Jan 2026 11:32:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z+2V=77=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vkKpg-0000eu-IU
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 11:32:36 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4fdea1e-faaa-11f0-b15f-2bf370ae4941;
 Mon, 26 Jan 2026 12:32:34 +0100 (CET)
Received: from SJ0PR03CA0073.namprd03.prod.outlook.com (2603:10b6:a03:331::18)
 by CY3PR12MB9556.namprd12.prod.outlook.com (2603:10b6:930:10a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Mon, 26 Jan
 2026 11:32:29 +0000
Received: from SJ5PEPF000001D7.namprd05.prod.outlook.com
 (2603:10b6:a03:331:cafe::15) by SJ0PR03CA0073.outlook.office365.com
 (2603:10b6:a03:331::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Mon,
 26 Jan 2026 11:32:32 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001D7.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Mon, 26 Jan 2026 11:32:28 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 26 Jan
 2026 05:32:27 -0600
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
X-Inumbo-ID: b4fdea1e-faaa-11f0-b15f-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IpfGH4R/5LvDHfCjJBGrHraACQiSkL5887w+V9H/iymVDrB7Hb2b1aeANTbhrdIAvRgKOkaNCXuq6zAPU+L5NAvg90O1Aqj1pMJT0RORVReAi5UB4krz6Wz2KAFHX3w+OVEfteZCW2y7qZM5zUJvky7Jd48FCZ+CoQ1OrJCJm/vADc3Dg2rjI82XCDqAgCdEv+HZALi7GcxmUThapCQ2ybfOOZ2Ymd/CngXfzsaZxDC7pxaEEWw2TCzRBwcFAdE3HEHYDGrwxV9fkn5GWwxkaNyPFIcOzecMM5v5FWx4/waXrmBVAwA01N5zQFarsk7dYvtDWiJHq0uW9rDUxi82BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3WMYdXFpXMQhLLFRCp13w8dCirnyREJJcHw5TFRSLhM=;
 b=rKnORTah3hl+iKftXHvxPahMkK7hahpV11As+dR63kZFYejmXaS9QIAKxgDEmlSstvcCHrM6UP9Oj9s52ojX3Vrdje8g6e1UmICERLHvFJeV3q90LVRYxeuGWM4+HJOfWr2pwbqdO6Oe46ny88JKcoFoNNmz5Ud7Pi4+7+YuE0ueW3wC42Tvn5+lja7c87+Jbgda9hx1xwFS/WMsiEkiNZq0lKIDyfwpKyKoNHg9c1dSlu4xq+fzi4jGBwX9fv0iVW7BeEcs5wDaFVtGDMVdGixW5sJrp/XUHkFgSZX6mdOgMX2sdJmdf/k8U0WiLADsEXXPFqHAtDLVkAY657hrsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3WMYdXFpXMQhLLFRCp13w8dCirnyREJJcHw5TFRSLhM=;
 b=2/sCPj0lWTyyUN9XJvUE5o/g4VO5zVcMpdRsl22P4bYeaZVqG7ZLdLWbBmHqayVu6ReQJaVOO2hAESaAOi4AIkUDHGEbhfZdHAUk2XlGnlwv4Nmc14g8MghuC6KGVXrXMD8BRMg/GFuWnKVqIMF0cqKPBEbNozrmDV0AsP9pIuo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 26 Jan 2026 12:32:21 +0100
Message-ID: <DFYHKN04FJW4.1FQE37XQQ91AY@amd.com>
CC: Jan Beulich <jbeulich@suse.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH 3/4] x86/hvm: Remove cross-vendor checks from MSR
 handlers.
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20260122164943.20691-1-alejandro.garciavallejo@amd.com>
 <20260122164943.20691-4-alejandro.garciavallejo@amd.com>
 <c78bae14-f6ce-4450-bf8f-5a19f8f7b975@citrix.com>
In-Reply-To: <c78bae14-f6ce-4450-bf8f-5a19f8f7b975@citrix.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D7:EE_|CY3PR12MB9556:EE_
X-MS-Office365-Filtering-Correlation-Id: 66c90775-d80d-4b9c-5ae0-08de5cce9669
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R2ZWZmNOc2hQaXpNdnhJQ0pDOGN2ZGkyd0NoYmZXSmFTdERvZjNQeUlXYW9D?=
 =?utf-8?B?S25GdWgvcjYxbDI0ODViSUphejFVd290QUJqd0hDY3VwYzlFSjlGYk5Kek5W?=
 =?utf-8?B?eWdPUG9TMkJYOXNpRGNyRXoyNysvRDI4eDRQajYvckRrN25qb2lEWGNqNTB6?=
 =?utf-8?B?cDdCdGtnbXZLeVpDRm5PNU55UUpnelg2WUlWMHdFWVJua1lKME1NV3M0MnIy?=
 =?utf-8?B?ZXd6RGtMby9ib3VjODNZNHBqUTF2VXcwaXE4ZStaVHZodXlGU2szd1hZdWpB?=
 =?utf-8?B?U2ludWhrRWdqV0QzZjRPZFJnK3VaK3U2YzZxVkUvdi9qOUJ1Q0JxSVpDZm12?=
 =?utf-8?B?aENMVG5vdmw3dmk2dTQ4VVVBUVQvZWdZaGZRdlJSNE5Ua1Z1ZTNNc2lOMjc3?=
 =?utf-8?B?SHp3cEVSK1VVK09aZElQRkNlZW1rQjI2aThDMDhzNUNVek1MUjlXWHo5UlNH?=
 =?utf-8?B?Q25SUG9OQW84VEIxbG5pVkVoaFdxQjNDMjQ3YnlHY3dHUUhXT1NWY3FWVVZv?=
 =?utf-8?B?a0lNL2Z5YUJvQytLcUpKREdCQ1hONlJzcFNlVm05bUFLT0lPdG8yUDJGMzRq?=
 =?utf-8?B?VnZ2MXJmSG5jSUpMM2E0OFhuNTRta25YamNwRVFtbmRhSWd3bzB0U1ZuZ2gz?=
 =?utf-8?B?S0ZDT2N6UVdiakRnTUkvejlrbWllUzBNS2wvNUlqZUIreFI5cWlnM0R4Vjdt?=
 =?utf-8?B?aUJDd0FrTDYrK3FDb3ZtLytPQ2FxdDVncEhkdE5MR2xObkFnMXMyRk1iSE1W?=
 =?utf-8?B?ZFBTbDJmS0dkckJhQjRhNS9zbGE1RDRHbFhqQ3YwbEs4RjRRdUxab3p5V3ly?=
 =?utf-8?B?dW12Vk1XRFc2WkMvN3hqY0MzdzQwUStnVkp1UzdiUyt4dG9YblA0RWgrOHQ3?=
 =?utf-8?B?UWJpa0V0dVI2V2ErMzAwVnRjaXN1RWRhVTBGdE84SUlBdUZOZ3F2dXVCZk1a?=
 =?utf-8?B?cVdWQzBMcmZUelNaOXJkQUJqZzd4WmhEYWp0SDZycWdKS2ZuMERFRjZBZ2g5?=
 =?utf-8?B?WndCVXRDLy91bWdSSG94UHdtTkZZOGpoeko0UVZOcGw1V2R2VFR2dU9hUGtw?=
 =?utf-8?B?R01nRjY2c1l4cXpWdVJ6bzNobFRxS1h6aE1sYlNyYjBlbFh3L3ZmQ1FJaDB6?=
 =?utf-8?B?TmdQMDZ2VDc3WFFNV1dLWDl2SEU0czB2YjFGcUdWOVVRYTM3RFlXalhIR1Fp?=
 =?utf-8?B?UEYyejhGUmtsSXZIbTVzOThDS3d5bDAxUnRHS09uTWRzbVlBeGR1TzNsbCs1?=
 =?utf-8?B?R05SRlpWZ21Dc3o4elQwTGRqWHZUQmhDdUZnU0szZzVYbk1lV3N2dlFDZkhR?=
 =?utf-8?B?NmVpbWw2UmVtNThvcTlWbUo3ZnZMUHVoQkRoN2x3M3hPZmhFWXNzU2Vvblo3?=
 =?utf-8?B?STRpUGlwUy90aGlOY1lPUDhzMzJRTTRobExCMHFnT3A5ZU9FT1dVckFyVmww?=
 =?utf-8?B?cFpDcjJUR29WR3BucU5NbnV4akFvY3BOcjlvVGtOWHRiL0toakg4RDdFdVBx?=
 =?utf-8?B?QVlnODgzQUV6SHFEVmpXUGNacEJzLytsalN4cWtueklDMEI4bE80TGk1L1Za?=
 =?utf-8?B?Si9TM21aS3dyL05PREtuVUFIYkhjRnVzYkZtZjJuLzZocEQrWDd3d2VaZXd5?=
 =?utf-8?B?VmJOVlVzaXhwZGFydXdjNVZ1MEd1OWFBaWlUVERuT2RuVVlobHVUN0RiRUth?=
 =?utf-8?B?c0R1ZXlmRDMyYTcxdWJqV3ZHV0tRU2Rwa1R5TkZTZElreTNrWUh2ZWpmT3Bk?=
 =?utf-8?B?Vjh6MUdSam56TmxucFFFU2FuU0hqbThxM3MrK3EwYy94cVo1cHduV0dFdWt0?=
 =?utf-8?B?UktpWkRST0s0d09xY3ltRDZIVlhQdVUzUVBCTHNyWFlFMWJ2UklqUjM5b3lo?=
 =?utf-8?B?NkF1MHJNTW5KWndtYmxYTGRrT0dIbGViMWRMTTVFTjl2VkJPVVVlb29pdmVu?=
 =?utf-8?B?MTl5NmR6UTdVTCt6b2FBOWcybGNNVkJEd2tZSzExNXRtNldTaUJUNUwwLzcy?=
 =?utf-8?B?K1FLZ0pDNWFqSjdDRS9ZTW5pdVRiOHlEKzNlb3ZaWHVuWHAzb2ZXYWFXVXZO?=
 =?utf-8?B?VDdwdlk3aDBZci9Zc3BwRm55T3FDeExVNEJJTDNFYjVPZHlzcWR1aDRpS0NN?=
 =?utf-8?B?bzQzanVBRUlkZ2ZydHFJdklUY1RCZDJ6QkVnaEFFc1ZZY2RlUXAvdGNXQ1Zp?=
 =?utf-8?B?QWxSRmtmc09VR3lLOWFmY05paFJETVc2N283YWhvdVFyR0ozUkQ2MFhzRE5S?=
 =?utf-8?B?N1lraW5CY08zNDlrcE53Mmhldk9nPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 11:32:28.8609
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66c90775-d80d-4b9c-5ae0-08de5cce9669
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9556
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5225087ADB
X-Rspamd-Action: no action

On Fri Jan 23, 2026 at 7:35 PM CET, Andrew Cooper wrote:
> On 22/01/2026 4:49 pm, Alejandro Vallejo wrote:
>> Not a functional change now that cross-vendor guests are not launchable.
>>
>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>> ---
>>  xen/arch/x86/msr.c | 6 ++----
>>  1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
>> index ad75a2e108..c9cc4f0692 100644
>> --- a/xen/arch/x86/msr.c
>> +++ b/xen/arch/x86/msr.c
>> @@ -169,9 +169,9 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64=
_t *val)
>>          break;
>> =20
>>      case MSR_IA32_PLATFORM_ID:
>> -        if ( !(cp->x86_vendor & X86_VENDOR_INTEL) ||
>> -             !(boot_cpu_data.x86_vendor & X86_VENDOR_INTEL) )
>> +        if ( cp->x86_vendor !=3D X86_VENDOR_INTEL )
>>              goto gp_fault;
>> +
>>          rdmsrl(MSR_IA32_PLATFORM_ID, *val);
>>          break;
>> =20
>> @@ -190,8 +190,6 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64=
_t *val)
>>           * the guest.
>>           */
>>          if ( !(cp->x86_vendor & (X86_VENDOR_INTEL | X86_VENDOR_AMD)) ||
>> -             !(boot_cpu_data.x86_vendor &
>> -               (X86_VENDOR_INTEL | X86_VENDOR_AMD)) ||
>>               rdmsr_safe(MSR_AMD_PATCHLEVEL, val) )
>>              goto gp_fault;
>>          break;
>
> Hmm.=C2=A0 Thinking about it, this would probably be cleaner to get rid o=
f
> the cp->x86_vendor field entirely, and retain the boot_cpu_data side.
>
> Additionally, this would fix a minor problem I'm having cleaning up the
> CPUID code for XSAVE fixes, and provide better cache locality.
>
> ~Andrew

I'll replace it on the new version for consistency. I don't mind.

FYI, I'm planning to replace all occurences of this on a follow-up series w=
ith a
new cpu_vendor() helper (it's a simpler version evolved from the x86_vendor=
_is()
RFC I sent a while ago) to enhance DCE's ability to eliminate code. It is (=
I
hope) just a transient matter until all {x86_,}vendor field checks are repl=
aced
by cpu_vendor().

Cheers,
Alejandro

