Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDB0CzUFimluFQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:03:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C234011247A
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:02:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225672.1532229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpTil-00029E-6b; Mon, 09 Feb 2026 16:02:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225672.1532229; Mon, 09 Feb 2026 16:02:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpTil-00026h-3T; Mon, 09 Feb 2026 16:02:43 +0000
Received: by outflank-mailman (input) for mailman id 1225672;
 Mon, 09 Feb 2026 16:02:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EeIc=AN=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vpTij-00026U-GQ
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 16:02:41 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be99829c-05d0-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Feb 2026 17:02:34 +0100 (CET)
Received: from BL1PR13CA0191.namprd13.prod.outlook.com (2603:10b6:208:2be::16)
 by IA1PR12MB6042.namprd12.prod.outlook.com (2603:10b6:208:3d6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 16:02:30 +0000
Received: from BL02EPF00029927.namprd02.prod.outlook.com
 (2603:10b6:208:2be:cafe::6a) by BL1PR13CA0191.outlook.office365.com
 (2603:10b6:208:2be::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.17 via Frontend Transport; Mon,
 9 Feb 2026 16:02:32 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF00029927.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 16:02:30 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 9 Feb
 2026 10:02:28 -0600
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
X-Inumbo-ID: be99829c-05d0-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MbiUSahR/cbZt0iZKLITNpm/wqbGnBoV3wXyTthQ8uronsReoyXvLZnSSWv5F+nAgtsbOBwIC0GtsitBlZumq7CZXCIprukjHuJzif9qUbKqGY2I4WwYwvA1N5S048/486FMozijzjAzkwmyOkV05g9P+pQNaLCIENwoGD5d7esmR3txha84+q2yu/JSBa7ijcEOy75MD/+aUrHz4BgLmVuTt1BGk3jYzaIdUTLS5ZE5YiiuzW5Zo/666t/WE/UHMyFLvyOCkpWO/z7buJrRerhFrEScxNYZD3VI+aLJbOnydxiybxNHNtWW/IiwHqiCW1XWw9bMAzIiLGMzS0y92Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ByCoykMzK4VS3lzYyWHsKf3tRgRTFBivPsHAMyIL+H4=;
 b=B3uL6KGwF7ej87FJG678k9Y5u1LzDTkP4tYfxtniUbOuoPKRS5tvzlHUlc20HtnDt4d/oF8Qb3N4eKNXiKV1Lf8pmhFwe1mxsLusEM2uWKMTvc5SDzCHo/J8hmZnS1GZiVXp3Yxu68Dp/o1LNaQ4SbPcecG4/L1Sfwd9Yct0auOIzi9Pv94E1uQhbuNdicMR5qgjothL0Hnut+Rt/wmutyXZmnmO6Qky3WZfqNgHoO6rh1PODMIvWwMSRZQCRvOms1NOqSyfynqXe308EWvuUIy1IV0VGiLjCo4Jt2FHbBScnQaYkcf4xzwurfHWFVv7eZ/ijC2gPLg5vyu7FneRaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ByCoykMzK4VS3lzYyWHsKf3tRgRTFBivPsHAMyIL+H4=;
 b=KQwhxRNBZILuWwjeozTThFotnQmkZgK9omq5KF9kPHM0YK2nqV4l3HKU4Psa6008lHDTq6XxXAda+dOlj0jBR10cGKxTsmjS0DhsB/5fbJWvHxJM6mnGZ5jbyGcE0Jp1/B7wFnWOVGTNZ/PA5BRatYImwXZvVaqPok+V3270wR0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 9 Feb 2026 17:02:26 +0100
Message-ID: <DGAK325RDOQA.3QQFQYK6R0KWP@amd.com>
Subject: Re: [PATCH] x86/hvm: short-circuit HVM shadow guest creation
 earlier
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel-bounces@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20260209144049.86535-1-roger.pau@citrix.com>
In-Reply-To: <20260209144049.86535-1-roger.pau@citrix.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029927:EE_|IA1PR12MB6042:EE_
X-MS-Office365-Filtering-Correlation-Id: 71cf577b-4d1a-4aec-52e7-08de67f4a0eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QkNaUFhyaEs3aXNSNnJSRXdyZjRFSXR2aER6NjNlakIzenVUQVdCcVBuc1Av?=
 =?utf-8?B?TUdSMjg4RzZMYThnNDNZanFodjA0aVhsUlNCZ1l2a0NtejRZN00xaHFGTnRX?=
 =?utf-8?B?MmtJVmhPNEd4Y1VBSld2ZTlkc3ErYVNyMHFMaXdDcXd1OS9qak1kZnI3YUh1?=
 =?utf-8?B?MGFqL3BjMytOYTA4UDRmWUZpcnlLWTJRTmg3VzdxVGJGZWlNekNKbnBlak80?=
 =?utf-8?B?WVhaRTNIRU1nc1VUQjBEeXlXOE9yalBBM05MdkpmTWZhU3EvUU1xNjlPMHVL?=
 =?utf-8?B?eFowNnVtUitsSDhqcjBJZTBnd3dKOHBXUUczOGpRSVhIMEVXSzlRb1l2RVVR?=
 =?utf-8?B?a2ZRTzJibGRHK2xTYVZTR3BGVGZTNFNWNUVqTXpCUjR6MXBDNUxoUjVxUHQ0?=
 =?utf-8?B?Rjdla0RTbVlIWnNOQklHUVBlVjZWaU5KZGVMRFNGT1BUUGdVU0IzRC9Pb25i?=
 =?utf-8?B?ek9QdENIbjF5TTVuaXJXc3d5RzNOQ0lEdUkxZFE2SlI3YjZnNFp6YkxqQnBB?=
 =?utf-8?B?cnp4VGdVVzNjWGVneURlVjVaRVFvc20wc1c2VzN2OFhHYWFkSzM5d2RsSVVv?=
 =?utf-8?B?RUR5Mk5LM1hVSGo1MVNkdndubERweE9pOWI4VW5ZeGN2K3JKZmZVS3pIcG5G?=
 =?utf-8?B?aTVlN255WERiK3NVcHVhbGYwQVNpVGVKZmxVVExiTmdGK2NHS0VRYkJYODUv?=
 =?utf-8?B?NmhDNlZ4ek95OTdPQ1RsaDlUeGZ4NnVad1E1RDdURnVYYm1HMWIxVkJ4ZzJQ?=
 =?utf-8?B?ZUIxR0pOanAzTnd1a0tMTjNjNVhUcS9ZT1NVSkYxLzFQQzlSaWZySlpWblg3?=
 =?utf-8?B?RG1jQ2E0YUUyZ3NZZnk3VFlBdDZMZThkNVNpUktEcktBYWdkeEhYSldiQUtq?=
 =?utf-8?B?RHlRT2RxeE5tYVkyYWYzV2tsaGJ6REl1S0lLRGw4TlFtYW5kM3Y4ai9DaC94?=
 =?utf-8?B?TExOLzRSWVhSYmdKNWpLblJjQ1dVc1pXdGdhRGNSRDNQdnozei8xcHZXMVVv?=
 =?utf-8?B?d3NVWndrWjYvVHJ2OWRLdm9tRUZ6RHZ6T1oybktFWEJKSzRZMEtkZnJZenBo?=
 =?utf-8?B?SDZCWGpkK2ZRMjdhS3VTODR2c0plY3RROVdaZlhCU0c0VldEdGh2amNYRmtT?=
 =?utf-8?B?QkkxbkczTnBDMGptOGppK1BJcmJGRm16RTNzMXZoS2VmUnhZanQvM0xaOWI3?=
 =?utf-8?B?Z1NDL29IRDU3Q0preHBBZnp5ZTBCTHQ0dlMwb1daUUh5Q1JsVmdwWmpOWjZR?=
 =?utf-8?B?emN4SVBtS0pvL2JzNTg2c1RxWkMwcnpqYnNIeEFNeVVGM1hMQytWZThtaFBK?=
 =?utf-8?B?MFNpYnl3ODZmN2E0c2k3T3czdmtUL0k0bHBOdHRmZTlIRGQrS2YydTRPYVg3?=
 =?utf-8?B?VkZ6QUV1SHJEOG1kQU41WWl5ZTVhNjhJbkZyQ2phaHVvVmttdDVuTUdWY29l?=
 =?utf-8?B?SVhXVHNLa0QwM0t4SytrQklFdnJJam52Q3lNamNzWWcvMHl3YkFDaEI3KzFF?=
 =?utf-8?B?K09NYUhwRGlKcFkzVWxqTkJ0N3liMHNFa1lDRG9JS0VGUUZvS1NLRW0wN2ZD?=
 =?utf-8?B?SFJ3UTFibmU1ZEdnaTE3ZVlRZ2NLdGNrNkpYL0dYUlZyblNJUkUzcWJidXll?=
 =?utf-8?B?RjdIMW1XQzlGMnFrOFozNTluNHRLaVBIT1JZb3hobkRKbUU4NVgxNlZDSUpo?=
 =?utf-8?B?R3lLeFlvVnFIYitiR3BDVnZwejA4NTJ5QS9BWWRJOGd0aGV6eGExZmZNSlVF?=
 =?utf-8?B?RUV1bjIzcFNlc0hPek9zS012Ni90MUhRMldHbkR5UEJBSnlXWGN6Y2RhbmVn?=
 =?utf-8?B?RXFoR2krVSt2VDgyS0hLcVhKQ2tRZ28zNFZNV2UwRlFiNG04ZGw4b3N2cmhQ?=
 =?utf-8?B?OGpxcm5kekw3Q29XVGlDSnFyZW13Mk42QkVBY2N3SWNodzBsU1N2d3lRekV6?=
 =?utf-8?B?RFpWajF4OXFZa3dadVNuUXhhU29LNWlscjEraFJlbitpa0M0VG1BMEZLZHQ3?=
 =?utf-8?B?QXJ6NDNtSEk5VFNxOEM3eWt4WDNiU21jVXZ6Nm5yd0VVczlFRVFabU4vcUI4?=
 =?utf-8?B?a3ptbUJhNTdpWDlHMHhqVUk4dTRINVI1UWtYZjNxanBmTmFSb2pKRjI5aTBH?=
 =?utf-8?B?V2tNVXhJbTFaNUh6ckFnNTFQZ2J6cStLU1lzMzIvK2QwdXBjOVVxYkJSVWpw?=
 =?utf-8?B?Q0dJREJnb3Ayc0hoalRPWGhFS05HaDUvNFMxREtsNkxucWxheW9DdTAvS1Z4?=
 =?utf-8?B?MmVsUDdRMXJTNEtiV2h3QWtLSE9BPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tZz0Rm3FdDOUoRSYIJ6N2uYD4preNhPZ+ro9vN/nYfS1hJvcHdYbqwZDrXzcU2pCKyouJDPuYPrjkmukG13XEFRm/NIo/PFQTBelunPfse0TBs8MR4c/+ACq2ThL9Y+yrRH9n1h7n9L3jdVTGswVg0QBWQdnfzZI1xmNVfSNIqTt5e742Evmg4wqPY1NiWv0Hqo8n6zoq9ja6EFheRVKYTeSiIMya3k1ZlVbhPMFZx2ZijKDnCTo9rKbywsXD1v5tLQsBm5JJ9zcysEGJW02Ued3IxR5jsOxoFr/Ah7N/mK5SHheuHRC+nj++sk+939DR/8iHdxeBMEDx+NgMKOr2W00JHDy3Xo2qOSLs7p0GSCiScd5pUIc7/8kCiIRpuCLP8MYIlh9ZUaA8UNr055kYVN8Kzahxrp4TocX2NjrB3abdCu8lMqWgu1hoCCUhz4f
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 16:02:30.2201
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71cf577b-4d1a-4aec-52e7-08de67f4a0eb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029927.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6042
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:mid,amd.com:dkim];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:xen-devel-bounces@lists.xenproject.org,s:lists@lfdr.de];
	RSPAMD_URIBL_FAIL(0.00)[citrix.com:query timed out];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
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
X-Rspamd-Queue-Id: C234011247A
X-Rspamd-Action: no action

On Mon Feb 9, 2026 at 3:40 PM CET, Roger Pau Monne wrote:
> If shadow paging has been compiled out short circuit the creation of HVM
> guests that attempt to use shadow paging at arch_sanitise_domain_config()=
.
> There's no need to further build the domain when creation is doomed to fa=
il
> later on.
>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
>  xen/arch/x86/domain.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index 8b2f33f1a06c..8eb1509782ef 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -627,6 +627,12 @@ int arch_sanitise_domain_config(struct xen_domctl_cr=
eatedomain *config)
>          return -EINVAL;
>      }
> =20
> +    if ( hvm && !hap && !IS_ENABLED(CONFIG_SHADOW_PAGING) )
> +    {
> +        dprintk(XENLOG_INFO, "Shadow paging requested but not available\=
n");

nit: s/requested/required/, maybe?

Also, with this in place can't we get rid of the panic in create_dom0() tha=
t
checks an identical condition?

Cheers,
Alejandro

