Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKo0EP9Wd2nMeAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 12:58:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9790B87EA5
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 12:58:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213655.1524107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkLEq-0005bA-5U; Mon, 26 Jan 2026 11:58:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213655.1524107; Mon, 26 Jan 2026 11:58:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkLEq-0005YH-2d; Mon, 26 Jan 2026 11:58:36 +0000
Received: by outflank-mailman (input) for mailman id 1213655;
 Mon, 26 Jan 2026 11:58:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z+2V=77=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vkLEo-0005Y5-Lr
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 11:58:34 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54f571ca-faae-11f0-9ccf-f158ae23cfc8;
 Mon, 26 Jan 2026 12:58:31 +0100 (CET)
Received: from BN9PR03CA0695.namprd03.prod.outlook.com (2603:10b6:408:ef::10)
 by BY5PR12MB4067.namprd12.prod.outlook.com (2603:10b6:a03:212::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Mon, 26 Jan
 2026 11:58:25 +0000
Received: from BN1PEPF00004687.namprd05.prod.outlook.com
 (2603:10b6:408:ef:cafe::f8) by BN9PR03CA0695.outlook.office365.com
 (2603:10b6:408:ef::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Mon,
 26 Jan 2026 11:58:31 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004687.mail.protection.outlook.com (10.167.243.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Mon, 26 Jan 2026 11:58:24 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 26 Jan
 2026 05:58:23 -0600
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
X-Inumbo-ID: 54f571ca-faae-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yxZdf57qaaX3JPeBhS9RI5f6yDZIj0tYW/lD6juDGfcfQ+NwtxJGOqC4DPoNGuP2hKvGHPQ52eI1cK2XwWT+dpYLp03vEs9QhvkRtkWza4YnuT7eP2+AurjSUPm1DvnEMaJAVPPuXCC7jWLFB1DODTTGIM1sLrq0H8Le2WmDAqMCfOvqYIGuLF8H1fIC5lwsv7w+BEB1L4j4X3opuFhiO1SUI1SHl8ZXE9xpo38UCzs5Y9MknKHzForskMPgZ6kkqFY3UDcW/aWMtAIPKmSqm77wBTMef0DKGoH0DRhutddED50Y2X4A/w4hn9dRTjdUHIVqM0btyXpDLYefQoVR4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TUevsuTDbf9FYnKh0Wzu+PHkbCV5IiIcboPq0OF6msU=;
 b=VOna4eQqArOvF4//HgJ8Sl2pRfZki3iLUVUlWMfhc6JHNQuQn13wceKxzrG9nVbyP1pnFRIdlB0CWGm4DxmQMsgHR1C16q37FM1iqDQDLo5v3ekLmGlwe7VgwQivCTjjMl2Ti9tkFtYM7BdJVHAqQABc8rHCbUjzTHvhtAgqFj7H9r2NwPGcRZJDBDfBRFnmgSsE0f1v4wA22yzolyVLkmUcRllYxnm6iA+saoPFDKkkA6zU9AirHFRqxWvOGIPK0l/kucYeXC0CRr/EUaT2hINSO93YZpRRkzipOgKLax/kKN5D2XBTjTePIJGHPz22c3zz0Ld6oTVZSLeeweu2Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TUevsuTDbf9FYnKh0Wzu+PHkbCV5IiIcboPq0OF6msU=;
 b=3UgHAjSHpzv1UaCnuMe2+SXmaApK5Els9tLyImbgIlu7B0SDPKMZFV7bCdedo8JyRbFTq9k/vrdqmHwMIrcP7ZKgrv3A3SeM2nibq/R2m0aWq8PdK+8GyLefn1En3cgQoB5zcIG57nOEDoE7wEaVtpkOO0hjjUVMucsgCWHZfjA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 26 Jan 2026 12:58:21 +0100
Message-ID: <DFYI4JNKI9P7.1JLEHL09S23AU@amd.com>
CC: Jan Beulich <jbeulich@suse.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH 2/4] x86/hvm: Disable non-FEP cross-vendor handling in
 #UD handler
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20260122164943.20691-1-alejandro.garciavallejo@amd.com>
 <20260122164943.20691-3-alejandro.garciavallejo@amd.com>
 <a7778440-ef82-4c4d-b89a-86d8af3ad89a@citrix.com>
In-Reply-To: <a7778440-ef82-4c4d-b89a-86d8af3ad89a@citrix.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004687:EE_|BY5PR12MB4067:EE_
X-MS-Office365-Filtering-Correlation-Id: 9161785f-7a4d-473d-fe6f-08de5cd235ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026|18082099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZjBaTVByakw0QmNjNStmWU5DMmFFNUFuNXgzQlVHd0pMcFNPTHRML0YxSjBv?=
 =?utf-8?B?VEtWS3dpaVQ4SVRYeEVOdEZTT2RaSmY5MjJRNHlrVWs0ZmtzQ3NWZWJVZU13?=
 =?utf-8?B?RklXZTJNeHRHUkVZRlNidkljMGQ2eGw3Q3JyOEN1QjR4MDhSTjNRd1VyV1BX?=
 =?utf-8?B?aFJWUzdNaFJhVmdFWHhDRlhYT1pzUEhwbHd5bXU2WndKaHorOXdWZEU2NUk5?=
 =?utf-8?B?NXlmWU5PbjFMc1B2TTllRzlxM3kza3RYSXN2dXBOeEZuSytrNk5ZYUdrZFpy?=
 =?utf-8?B?VWRTY2NJTk1pZStPaWdIb3hhemp3ZlRaOUVxTEVuczlLZSt6aWVuaXdvZ2dI?=
 =?utf-8?B?YllENFFERjJFYTJSL2dzYzJ5MFEzWUVVakMrZUVJWVF5aGRWVzZaUXA5OUhs?=
 =?utf-8?B?U1ZIK2NseU1KQnNFTlczbVRvY1plZ0hMbE9xVjFMSzBkMEpSaXRiRyt0enZD?=
 =?utf-8?B?cHlPcTZrcDVhd2UzWXExV21nTVVvTGE4UFh1VlZOWkYxSGpuVTV6ZUNpWW1K?=
 =?utf-8?B?QWJXWFNxRThFL0tlYjVPYVAwNFZFMWUxS2RUYlhtbWlpTTZzS1JyTkNSNDdG?=
 =?utf-8?B?RkE3eFhWcytNZngvK3FqN3ZuaXVIZkd1SkxFbW1FTmV5UXpTRHJMRmlDeGt4?=
 =?utf-8?B?SFFmVlVlRWYwclBWaHF5SXJHcDJTN0owcDNkdnRlcGtJRm80d2hLZ1RvU0lS?=
 =?utf-8?B?R3BGL2xkYk1QZlNZMVlKN3RGaXV4WnpkOWRvTzVyWVR2UDhQbm1JcGFHSE1h?=
 =?utf-8?B?bTRtZ25uSVo0cjI4NmJHTGttcDh4Y1JjU0VuU0JuSHhteG5GRndFUHp5SUlv?=
 =?utf-8?B?N3IzcndSbXlJRE5YYlh0cUJ3Q0ZZa21qS3dvcFVWdWtRbVF6WWRITnpXZ002?=
 =?utf-8?B?MFBEMnp2WFVZSlE5NzdubWJRQUlNbkp5ZytmWnY5RWNiTXZKR1JXclk1aW4w?=
 =?utf-8?B?L0JRUlBBNFZyd2d4TUs3enBzMDJKTlZKaFNIY3UySC83RDhXSXZGSWFnR3lL?=
 =?utf-8?B?OWZjb3pSaUlFTmUvTVB0L3ZHdHYyVjZPT21YVHFhdXZNeUV0NXl4bTlHNFRF?=
 =?utf-8?B?dnJtYy9RNVdoSWc4bHIrK1BoWTNBbWkvcGRVaXpMd3pzemdIM2pSRVF4V2Ey?=
 =?utf-8?B?b0t1bnBTTkxScWNLNFROZEdjQ1d5b2ZxTWlFbEgxQ21rK0R2UzZJUWoxd0VL?=
 =?utf-8?B?S2VxeW02MUNjN3ppUStwbWFnYVBlVWtZWlViR0MzWTMyRWZ2WmUxbUFoNnBv?=
 =?utf-8?B?c0RMRURiL0ZrWWYrYXhtUVAwTHczYzdKNkcvdUNieExWQm9POVN4MngxMGd6?=
 =?utf-8?B?M3BWSFZwbWNrbkZSem01Q0pISDd0dlI3Z2Q4and6a3JuMjdabzRQSVZRSXk3?=
 =?utf-8?B?cStWVytEaitwSURidlN1N1F4RlZNenBrdlFZNGkzS3VRMnIwVStHT2RGTHVl?=
 =?utf-8?B?RllaZytjVWZSa3pJU3FaRVN5N0NCc2dNNkZRZ3BndlptUVlsaEVNWmFNRXZP?=
 =?utf-8?B?WDRZOVpvajF5WFRWRmpIdWJDOWZ6Tm1oTWtZM0hwYzI3SWZjUHFCU2w1MFBF?=
 =?utf-8?B?a0IvMkpXcjJSaXpNMXNxM00vOERuMTRJK3AyZ1QvOFNiMENkSjkwb0NXOHVq?=
 =?utf-8?B?YWtIL21hV0xOUzRJN01ET3ZXK2tLWXNzRUpqOHZxUmU0VWh4VVhEZ0FVS2U5?=
 =?utf-8?B?bEd1cXlwSVI2dVlxNm41MjJVUVZlVDVVcE5jUjAxMW05b05HNm9CUG9CZEJr?=
 =?utf-8?B?NG1KWDE4dmxGdVpFczlQZG41TVcrdFplekI5T0E3V05IUFRzUkl6bmFna2JZ?=
 =?utf-8?B?c0ZFblpzZkVOQm5ienp5V3ZtL3ZLOVI2OG82emErNFNGQVYwam1sekt0WEcz?=
 =?utf-8?B?d3FNbkgvbkVOcitBdHVkeVo0ckhETmxPQ0luU1l4d1hkamhHTUlnQWYyZXYy?=
 =?utf-8?B?d0JKYXJ4QUxSTmYwSmVETkFoS0FsRTVLSnhOczZ3eVNwdklNOG0zZkw0MHhh?=
 =?utf-8?B?aUhvbE5JakpvV0NiSno0NWdBUUwvUEUzcnRDOUhxTWZ6VHNpcWhvSVExZGtX?=
 =?utf-8?B?VWtZQUVxejZkRkJnSUZKU0JxYUhncm1pT05BMkQ3YnYwRnFtbkFSN1BVWDg4?=
 =?utf-8?B?Ky9WSTVtMFBQWm9wbzRYTHExMTVGQ0xUY3hlY0NldTdkZ1hXYm5RVW40b0dt?=
 =?utf-8?B?WmV2amVOUkt5REpuQ0hlVTc1ckx3R0gvRUdWNlVOSllFUFk0VzVSQnI2aGVV?=
 =?utf-8?B?dDJnODMwZHJrWHA5WUpFQ0JQR0RRPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(18082099003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 11:58:24.8149
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9161785f-7a4d-473d-fe6f-08de5cd235ca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004687.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4067
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9790B87EA5
X-Rspamd-Action: no action

On Fri Jan 23, 2026 at 7:40 PM CET, Andrew Cooper wrote:
> On 22/01/2026 4:49 pm, Alejandro Vallejo wrote:
>> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
>> index 40e4c71244..34e988ee61 100644
>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>> @@ -797,8 +797,7 @@ static void cf_check vmx_cpuid_policy_changed(struct=
 vcpu *v)
>>      const struct cpu_policy *cp =3D v->domain->arch.cpu_policy;
>>      int rc =3D 0;
>> =20
>> -    if ( opt_hvm_fep ||
>> -         (v->domain->arch.cpuid->x86_vendor !=3D boot_cpu_data.x86_vend=
or) )
>> +    if ( opt_hvm_fep )
>>          v->arch.hvm.vmx.exception_bitmap |=3D (1U << X86_EXC_UD);
>>      else
>>          v->arch.hvm.vmx.exception_bitmap &=3D ~(1U << X86_EXC_UD);
>> @@ -4576,6 +4575,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user=
_regs *regs)
>>              /* Already handled above. */
>>              break;
>>          case X86_EXC_UD:
>> +            BUG_ON(!IS_ENABLED(CONFIG_HVM_FEP));
>>              TRACE(TRC_HVM_TRAP, vector);
>>              hvm_ud_intercept(regs);
>>              break;
>
> Again, nested virt makes this more complicated than to simply believe it
> doesn't happen.

How so? nested vmexits go on a separate function (nvmx_n2_vmexit_handler())=
,
which is purposefully dispatched earlier. This switch is strictly for non-n=
ested
exits or it would be all sorts of wrong for other reasons.

Either (non-nested) #UD does happen, in which case I want to know how. Or
it doesn't, in which case we have dead code. Both cannot be simultaneously
true. The #UD handler is (after the should_emulate fixup) just doing FEP an=
d
re-injecting otherwise. Whether there is an "otherwise" is relevant for the
refactor and Teddy's rightful request.

>
> Also, more often than I'd like, I enable #UD interception for other
> reasons, and I'd prefer that that doesn't get any harder than it does
> right now.

It's equally simple with hvm_fep=3D1 in the cmdline for an unmodified Xen (=
to
get the tracepoint). With a modified Xen it's a BUG_ON() removal, or runnin=
g
with HVM_FEP, which affects security but not performance (so it's ok for on=
e-off
tests). I could also conditionalise it to #ifndef CONFIG_DEBUG, as the
overwhelming majority of the time you'll run your tests in debug mode.

Do any of those options sound fine? Shipping a dead function to users/custo=
mers
because it's occasionally useful during development sounds like bad policy =
to
me.

>
> In an ideal world I'd have already upstreamed the logic to decompose
> double/triple faults...

Sorry, I'm afraid I don't follow what this ties in with. Is this why you fi=
nd
#UD interception helpful?

Cheers,
Alejandro

