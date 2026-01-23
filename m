Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJ7jJHxpc2mivQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 13:28:44 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CA775C91
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 13:28:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1212239.1523497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjGGw-000314-Hx; Fri, 23 Jan 2026 12:28:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1212239.1523497; Fri, 23 Jan 2026 12:28:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjGGw-0002xz-F8; Fri, 23 Jan 2026 12:28:18 +0000
Received: by outflank-mailman (input) for mailman id 1212239;
 Fri, 23 Jan 2026 12:28:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hx8e=74=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vjGGu-0002xr-Vx
 for xen-devel@lists.xenproject.org; Fri, 23 Jan 2026 12:28:16 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc09b0b3-f856-11f0-9ccf-f158ae23cfc8;
 Fri, 23 Jan 2026 13:28:14 +0100 (CET)
Received: from BY5PR16CA0016.namprd16.prod.outlook.com (2603:10b6:a03:1a0::29)
 by BN5PR12MB9509.namprd12.prod.outlook.com (2603:10b6:408:2a8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 12:28:09 +0000
Received: from MWH0EPF000971E3.namprd02.prod.outlook.com
 (2603:10b6:a03:1a0:cafe::50) by BY5PR16CA0016.outlook.office365.com
 (2603:10b6:a03:1a0::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Fri,
 23 Jan 2026 12:28:08 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000971E3.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 12:28:08 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 23 Jan
 2026 06:28:06 -0600
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
X-Inumbo-ID: fc09b0b3-f856-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MTy1xXHBIRFOTSt7DdSGj2bfTQEfaRNDZZGP9JZDSCRCzlW1PQc/o2Iht3/Va6rLvQ/Qo95G0R8IyW+ro4zARk03a5pIaAL1d3O7ADrmDnOQQ1iOG6pv4as6e4iDrrSsWu5+3BbBISEs7NT3m0lbtiptgHC/Rnh3GdnG7vVR+obUVPShxVG/27faLwWUBQAJ0tQObsAzWXLj8E+XlOIM9QTjfsIUbpgzO5iJDiTuGFEjisDAXyFrPuZmcad4cmrk0a2G6QotaNeEZ7YfMIsguZj+BC48w94F7epyEZvQDv0giIGcsbHXcH3RKFpDH9OmI4fze4lCVUWpxPHIPuR4lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1iq5sflv63LWyrg4NiWJJtH93bDCkUumyWiTjyyQf5E=;
 b=uzWCIkfdpwDAdJ2g2O3tVevy//eVmPgjkqwecW2fqzdxt8E9YZqVVVsH0+cudEfKE3dlE/6DE5ZwgQteBDqWo+5IIGLz8jwkUwRuQtbJ4RnYdLadhjKW11rjuW0H4nRXRd5Ugxvtq+I9uYYcnTHQ95+4JkIZ561pQD++Q6lR3GJ9SYQ6UAtKERYI/HixBtHoPjigCxm0zyzr6U2d0HnNDIp3rIeiLJwfT3JESofrhzHwq+S/14XiVNYfH/D3zXybvGJVGgTPci+Ba2Z8qF0dctBs81ukKxlST+ojssTVRLpc8xDSiezpXQU2y1P+MM8K3xYQkemzPGqmidZK4Yj9cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vates.tech smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1iq5sflv63LWyrg4NiWJJtH93bDCkUumyWiTjyyQf5E=;
 b=Sdq1hI1w7EYFQD1oXQ/WfZqsGkKhIQkhrtEPNH44qgshE3NoDO/ewFkRTUfvnGFfHPmjAcrwYx78zJpHej8xUeOpWXJrFJEblMmbnwShbtw00CqD/7atVM/Mrd4k++lX8iX/C2us4YoHDI7t8o55/R/QgzaJB2NHgsB9U1vALYE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 23 Jan 2026 13:28:05 +0100
Message-ID: <DFVYVO938VNU.3UZJRR6S8Q339@amd.com>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH 2/4] x86/hvm: Disable non-FEP cross-vendor handling in
 #UD handler
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Teddy Astie <teddy.astie@vates.tech>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20260122164943.20691-1-alejandro.garciavallejo@amd.com>
 <20260122164943.20691-3-alejandro.garciavallejo@amd.com>
 <fddfdc4a-3199-499a-9fe6-4d78dc2003de@vates.tech>
In-Reply-To: <fddfdc4a-3199-499a-9fe6-4d78dc2003de@vates.tech>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E3:EE_|BN5PR12MB9509:EE_
X-MS-Office365-Filtering-Correlation-Id: f680a850-5da9-41ba-c847-08de5a7add84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a09SK3RVYTdkTjB5S1p4YnA3emYwbWU5eEMrRDE4cUYvMXdYcDFrbVpqbkdr?=
 =?utf-8?B?cFlWWkJFak81WkYzMnpiMTFLWDllTmFXd3c1aUI4emgxOUMwNDM2WFZHeUlz?=
 =?utf-8?B?QThKUmJVeVVVVHI0QktFblNYcFNFWUZaRDN2ejFyQ1VubFhhUVI5WFN1WjQ4?=
 =?utf-8?B?dGt2UytPMUJIeHkrM2NUaWRRMmYzNDRXYmlGaWM4YjAzendxRzM3dHJ4RFZJ?=
 =?utf-8?B?dEJuRUdVaFpTb2pQNWp1L3dlcWxTaDNzRlZ2d2x2Y09YOTdzYlRQNU1UUkxM?=
 =?utf-8?B?SnZabkpjYXp5Z2h5TFBZN1dGQWVISmRGWENWU2R5S2g5c0Ntb1N6NExpT2Q3?=
 =?utf-8?B?VTB1eGorblZ6Y1FZNUpUMmxBRTl1WCs4ZEpQZGgxTURHZ3c2OHhpeHNzOVBi?=
 =?utf-8?B?RFJXY1FXaDA3T1hBNVhaNi9wenNMeFRhNUVLazF0SnEwL3lOQVhVa0c3MWRz?=
 =?utf-8?B?clJuU0I2UjJKV08yaTNldVpOTFNTYW13QytUNGtBN2MvZHI2Z1BHWmpITENC?=
 =?utf-8?B?YmZXN3hDczdpQkJsTThSZFlOVE9FME5lMEQ2L3RyUjRGWVlGQlBPbG0vTW9V?=
 =?utf-8?B?aXp5MEZUa2tVOXF4YjV5bVNUUElIZ3FoT1VEZnFpNmtUdkxRZTRDeWpremtN?=
 =?utf-8?B?ekFTYlhnVFZON2VCbGdWbHQwMnM1L1NjdXZQVTloMFVlMVkxbmZWdEJuY00w?=
 =?utf-8?B?REdpUDJOckY3WXN6dzArU1dtWEJGWUZSSjFpbDNvek43OEFrNVFKR3FQd2Ex?=
 =?utf-8?B?TFZlSjhlenpDUS9ZT3dTZUxYc1gya1ZvSXN0eFdRQXJjSEttQzNjNVUvMzJ2?=
 =?utf-8?B?S2ZxNHppamYyUnMrM0R2ZnpiM1BWQmRPRHRmSFVncUhJS0o1MWdQTEd6WXR0?=
 =?utf-8?B?SFN2OTRxc21HcVBweGFkU1VrTy8xejlXUlZlWlBnMjk4NTROSXpwVHUwUCsy?=
 =?utf-8?B?Z09mcHR0clBYcjBxUHF0bVlXanIyRUVaOWgvVTFZdUUrblV3ZmFtdFpvNVBo?=
 =?utf-8?B?ZzM4K2JNQWh2VWhmODR0Wll1WVdRdCswOE9nRWFReTNSdVc5OVNvbHZ4S0xv?=
 =?utf-8?B?Z1RGUUdqQ0tqemI3M3M4K29uMjZhNlRRZmlveFN0NUN4cmJQZWpVcXIvQW0z?=
 =?utf-8?B?MHhhNHY0SW9rRUpFbkhOMnhQQVRzTjVwaERFK3pGejVsQ0JHSm1ZUTZON2N1?=
 =?utf-8?B?eWJad3ZrbEFVa1FHMFFST1NIMWR6Y3FPa0NwTUZQZytDdGNrTGdKZElEN3Jp?=
 =?utf-8?B?SnFMSXhjbkR0UEVKcE5XckRFZzIyTDZ6eC93QTczSjJHRE5sSGRVWS80NWhl?=
 =?utf-8?B?d0dGKzZMZ1RxR0NmYzVQWE1mTkczdFRpcUlDSzJGSWYvRHh2QTFaL25UWmhG?=
 =?utf-8?B?WVRCdTNRSjNMZ2FtRy8vN0w1azJHQk1pTGtOWUNza1BGdXlBWHlMVjBPVlQ1?=
 =?utf-8?B?RmorSDV2Y21WRE1Cd2lrMWxIMU5TV21sZ2NxVnJNTmJjV0Q3VjdxclBPdkJl?=
 =?utf-8?B?Nnl3akJWN0t3eXhWRjlITFNDdHdSRWcvVm9xR2t5VDRRN3JGYkloMGkycTgz?=
 =?utf-8?B?N0lWcnoxTmZBNTIwc1dFWlBBbjN6RkNWbVdIQzd6cVZQUFdIcEUzNnFkMlMw?=
 =?utf-8?B?WVJJZGRFTUt3UHo0QU00bnlIaWFUSnovZGhGSWxuUDJxdHo2RkhaK1pRbWdC?=
 =?utf-8?B?ZFVTUHIzUzBFRFpYL2ptWFc5Qk1OaUUxeEY1K2VtRVIwajQ1NGhOUG5oSVZX?=
 =?utf-8?B?dGZ4eW1MVE05WlRDL0gxamU4dE9iVjYzTFVXZno1VXQwQjhNaUp3VUJlSm5M?=
 =?utf-8?B?SFB3bFBMdzZYbTlCQ2dMa3lScVRPQ1M2cWlsMWVWNWtLaVI1anZWOXJBZ0w1?=
 =?utf-8?B?SDdaQmVZM0pZcE1UV3JObXNrY2FsTnhqbXdGOTBFeHkwd2VCMGsrRjV0S1BN?=
 =?utf-8?B?VXY4OUgyVm40RW43cXNwZ29GK1hkV0ZIeGxGTGdzTzJWN3NWdzRXT3krd201?=
 =?utf-8?B?STlnTStxN3hCOHRqY0l0VHpOQkpHMXRsNUZucWNqTldKU3ZYeTRFRGRhdzEx?=
 =?utf-8?B?eldDQUhoQ016b3gwbTIxNzR2bTZkek5xU3VHaDNXOWd6VVVUQ1Zua3VMUlUx?=
 =?utf-8?B?RWN2RHliYk5XdktHOUlUV2wwRi9SZGhGdm1kcWlxNHFhM0V0aGNQdFIxdkFl?=
 =?utf-8?B?Vmp4ZlZXL0I2VjJUTzVNMVBmaG1zdUVldGdPYWxCRWRjK0RCbDgyRVVRRGhn?=
 =?utf-8?B?ejNycllMZ08xN0lsV1NPbENpdGpRPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 12:28:08.1397
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f680a850-5da9-41ba-c847-08de5a7add84
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9509
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
	NEURAL_HAM(-0.00)[-0.995];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E1CA775C91
X-Rspamd-Action: no action

On Thu Jan 22, 2026 at 6:28 PM CET, Teddy Astie wrote:
> Le 22/01/2026 =C3=A0 17:52, Alejandro Vallejo a =C3=A9crit=C2=A0:
>> Remove cross-vendor support now that VMs can no longer have a different
>> vendor than the host, leaving FEP as the sole raison-d'=C3=AAtre for #UD
>> interception.
>>=20
>> Not a functional change.
>>=20
>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>> ---
>>   xen/arch/x86/hvm/hvm.c     | 25 ++++---------------------
>>   xen/arch/x86/hvm/svm/svm.c |  4 ++--
>>   xen/arch/x86/hvm/vmx/vmx.c |  4 ++--
>>   3 files changed, 8 insertions(+), 25 deletions(-)
>>=20
>> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
>> index 4d37a93c57..611ff83a60 100644
>> --- a/xen/arch/x86/hvm/hvm.c
>> +++ b/xen/arch/x86/hvm/hvm.c
>> @@ -3832,28 +3832,13 @@ int hvm_descriptor_access_intercept(uint64_t exi=
t_info,
>>       return X86EMUL_OKAY;
>>   }
>>  =20
>> -static bool cf_check is_cross_vendor(
>> -    const struct x86_emulate_state *state, const struct x86_emulate_ctx=
t *ctxt)
>> -{
>> -    switch ( ctxt->opcode )
>> -    {
>> -    case X86EMUL_OPC(0x0f, 0x05): /* syscall */
>> -    case X86EMUL_OPC(0x0f, 0x34): /* sysenter */
>> -    case X86EMUL_OPC(0x0f, 0x35): /* sysexit */
>> -        return true;
>> -    }
>> -
>> -    return false;
>> -}
>> -
>> +#ifdef CONFIG_HVM_FEP
>
> I'm not sure it is wise to put it being ifdef given that we have it in=20
> support.h.

We already abuse code elision in this manner. See domain_soft_reset(). It's
intentional, to avoid polluting the headers.

You'll get a link error anyway (as opposed to a compile time error).

>
> Given that this function now assume we have FEP enabled (since it's only=
=20
> called in that case), I think we should rename it to reflect that, like=
=20
> "hvm_fep_intercept" and drop the non-FEP logic.

I'm not a big fan of renaming the handler, because it'd force future change=
s
where #UD is invoked in more cases than HVM_FEP to rename it back.

But yes to the removal of the non-FEP logic.

Cheers,
Alejandro

