Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YB6MGKEDemku1gEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 13:40:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA88BA15D9
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 13:40:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215623.1525764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl4oy-0006bW-KX; Wed, 28 Jan 2026 12:38:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215623.1525764; Wed, 28 Jan 2026 12:38:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl4oy-0006Z3-Gv; Wed, 28 Jan 2026 12:38:56 +0000
Received: by outflank-mailman (input) for mailman id 1215623;
 Wed, 28 Jan 2026 12:38:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pnMD=AB=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vl4ow-0006Yx-Ez
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 12:38:54 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49bfb2d3-fc46-11f0-9ccf-f158ae23cfc8;
 Wed, 28 Jan 2026 13:38:47 +0100 (CET)
Received: from BN9P222CA0005.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::10)
 by SJ1PR12MB6316.namprd12.prod.outlook.com (2603:10b6:a03:455::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 12:38:40 +0000
Received: from BN1PEPF00004688.namprd05.prod.outlook.com
 (2603:10b6:408:10c:cafe::79) by BN9P222CA0005.outlook.office365.com
 (2603:10b6:408:10c::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.8 via Frontend Transport; Wed,
 28 Jan 2026 12:38:38 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004688.mail.protection.outlook.com (10.167.243.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Wed, 28 Jan 2026 12:38:39 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 28 Jan
 2026 06:38:37 -0600
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
X-Inumbo-ID: 49bfb2d3-fc46-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wilsxGdxVzlE4GkH8j3qQmuHxbKDTTAAGK7yhrQkIXtm/HCgE/sNYUunmNQakgBBMMQW2qNYzgBy8Uf9HrfrsACw8746B81vRVTxV6DeALNzW8o5G5vzgcxw6vs6O1IALzb5khjSiK6cfPnoekR49ypIiQ1S0hI4A0b5xVTBP+E+TzTJhvjKUt7f9A5I43Dp/RLYPt5TQbmM0xYueFMA9guQl++Jd3PSlnRt9tMHMimWTEgoXEgcngn3JScn3zaHmFWPSyb2s9hCGzBHaUO90/hiPYAhQY2DS8XFweEXOzdUav1QtnS3ZMnNGttQOWDIHMWCB+Hc6RNf+jrbevBNMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YYgszTUoITTBF5Lcaekyh/Egk6dXZ+86YDrnZLCaIB8=;
 b=c8ZHHdxPhguL+qREg1tLV/ChP+60Mko8dgoAcGVUndRTqC7iNJOHchG9JRddIXLbH+f1swW7B5qt9Wy4FgJ3y7CVenr9ex0/tFUJy3m5jpoIUkdw/jRmRku327Tz35cBSK/ZX9NdCdVOMIwGW/IwSjFmmsEUcBcrWFB2lshmGD5miACMv+/7bx2kSVE8OlQ0KpdJmLDqNjMZA5Ugvq5qu5VD0DAsZhxCuFH0zVgFbEqLvx/mQc9qLcwsjlcLDQ5HMYHvBYRnevOOE7eH3qq2TUZtTIPgeXNijdOwYc3VWpjETip7Rnqmh3rAnmWRF3RjIMXdmFHePLwf/46b4BoWFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=amd.com; dmarc=temperror action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YYgszTUoITTBF5Lcaekyh/Egk6dXZ+86YDrnZLCaIB8=;
 b=gcg4RHafzxuv1i5JzGYs8Zr7QNdk4e+tGODnc+C6HJGPj+bgAawDuLZ2rkOOnwR9wJdNRqT6wMiwyPqPwbk+jWfoohz5cBiy0M31ZHklkTZsPOA79+/gMnr+4cuev+vWtdFzvz1b/1mdQOfpiZ0uwj79vRaBgBFc+/v7VjV9riU=
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 28 Jan 2026 13:38:34 +0100
Message-ID: <DG088FKL52MK.3417MA419BHR2@amd.com>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH 2/4] x86/hvm: Disable non-FEP cross-vendor handling in
 #UD handler
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
	<xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20260122164943.20691-1-alejandro.garciavallejo@amd.com>
 <20260122164943.20691-3-alejandro.garciavallejo@amd.com>
In-Reply-To: <20260122164943.20691-3-alejandro.garciavallejo@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004688:EE_|SJ1PR12MB6316:EE_
X-MS-Office365-Filtering-Correlation-Id: c4e0ee40-666d-49c9-655e-08de5e6a29db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a08rNklIQlVjQ1k1SUhQREpFTVNobDB0RmZJL0lMcEJnNFZTRExVc3dKak9v?=
 =?utf-8?B?WWVyc3JqcmJXOXBHbWEwVVlBWUFSV3FzN2tCdTdudmpNWThwRTNhQ1JPc1Ew?=
 =?utf-8?B?eWtkYWJtc09WTnRsYmlkZ1EzcEg3ci9qV0RBT1RWbEpoU0txbDNNRm5aWjlm?=
 =?utf-8?B?T3d1TlR5OWRzNXA3WjJvSmt6YUFGSGRiWnFJR2tDZEYvSTE2ZnJxekNiWGVE?=
 =?utf-8?B?NDJxYzlCSENlb2hod0YyR0d2TE5YdFdmKzNZMXlsQ3dwcE5jMFlaYm1mVFcv?=
 =?utf-8?B?cGVZdlNEak1zK2g1cjRqM0d0ZHJqT0graFRURjEwY2JzOGNLeEY0bWF1bjhz?=
 =?utf-8?B?UnhiZTJwSmhseU5abmV6cEVyclVCZWtWVmI2bFpPR21WNGM3ZGJrMmYyV1VI?=
 =?utf-8?B?K2tuQys5NDZMelFpMXB6ZkJ6UWxHR3p0OTFpendlbFk1akRQY1dzaHp6VzJy?=
 =?utf-8?B?dE56cllTYTJESWNRSWtYVXVLdTZEODE3VE9iTWZlbnU2emorMjcrK3RGd296?=
 =?utf-8?B?dTVzYXNwb1g3ZnhVamR6a0tDZW5Xc200UlpLSVhuZzhBTkNmdnVUY2lheHlv?=
 =?utf-8?B?SUtWZjlrTElrbUI0V2VzMlRwR3VKU1Bzb1ZsdmFuQzUxR2k2SnhQRTRhNUMx?=
 =?utf-8?B?aEpLMXlQM0VicjBhZUF5dFUyZXdqNjlDWC9HelZLMzVtWXdGWEl1ejZFTW82?=
 =?utf-8?B?bWFHVUlkNEd2REU3b2luSVdIU1FzWVZNYjBFaDJKT2tKTGpLTXNvQm1RWDZq?=
 =?utf-8?B?M2NLS1dYVHJpWFJySjJrUzhHTVllQS8yL2N4dzhjZ0RSYVFEb2FCTWNMY2ky?=
 =?utf-8?B?aFJLM1JYMjRYWmtReWxuak8yVFJ3SVlUWW9Bc2xkT2RTRDV3SDFTaUwxSE42?=
 =?utf-8?B?Nk1XQm9NVCtOb0J1SUFkWXlZMXV1cE1DVXN1cHRIWHhlTEpMa01RR0xqZHp0?=
 =?utf-8?B?TGtqZ0J5ajdMZkt1U3VVMXI3UXdGMUJUbHBDVjVmUG5FenBBWW0zSXJ5NGRX?=
 =?utf-8?B?V2paa0ZTRnFESWFKaUJpZ05QU3Y4S3VVOTFxOUFJd1VEMjNUcTRoTWZReXFR?=
 =?utf-8?B?MFNsalQzcTJwby84cFRpbERVcEdlS2UrZ2hyZDVLS1RCajZVUm44NEhzem56?=
 =?utf-8?B?NjlxWTR1Q2Npckg5TFlGbjk4YjZHbDFveWh3VHVROFlPbU1qK0l3dGdqNS8r?=
 =?utf-8?B?VVB1MjRoTmt5cjNPdnZPaTVobFFBM2NrYWhqR0lObGtGUEd4SjZCTjBwVmxS?=
 =?utf-8?B?djBNTkVBQlpGcjVtSXZGV0VQNU1CYUExYjFuVG05elhOalVXZ3F3bWNoSGJy?=
 =?utf-8?B?d3JBa0ZiVGVBRklrZklJWGVjUUxKUkhMM1RLSmdtRklXcFFkRFRKckF3a0tP?=
 =?utf-8?B?eHhnVTJ3RHMrU3pFb0ZySzNXMVZCMTJRbGRKOHFHSHNKcUxUUzVQL0lWM3NU?=
 =?utf-8?B?bFE0SURlaSs2V2gxWVlVVVUrazdlNXdDcmF2aktFSmJwaGRWOHVrRnJzMEJY?=
 =?utf-8?B?S0JEN0FXanhTK3YrWTV5aTdTRVFzSzFkTm1TMXNjY3RzbFB6OG12dU1uSjIv?=
 =?utf-8?B?Yzg2ZG9oV1pIT0FSdkYvdUpSUll3cnZtZVRGaWtTZE9hUXYwWjltYkNaSnVq?=
 =?utf-8?B?ZWxnZ3dyeER3YXlJVUw3ai9wR2dLR2RDTWlQeDFvN3liYUxTMUw2WUZ4ZXlx?=
 =?utf-8?B?c1YrUDNQaU9hT3krQWZLNGd4SmNnbmtaa0NWUmxXSUpSclhUd0tieDlGSU1M?=
 =?utf-8?B?ckorcnpITE1kS2VTRkJLbC8vSU9QdW9yWG9HdlJZR0E2aXIyNjdSUDkzbVZW?=
 =?utf-8?B?TStibHFOTHN3WVp1eDFWR1VTK3luRm9XQXk1STYvM3M3dll1ampVWkN2ZHEx?=
 =?utf-8?B?QmtoTkx5VDVGZ2tNRzNjQlNPcWdQTzQrQWZjUUoxaERtMWJPNjZ2emdJYVBi?=
 =?utf-8?B?WE8wUFhMM05yR0VUV2YwbDhKTFNmOU0zTEVCMDRxZlV5L3FHOXI2dUZ0Vytp?=
 =?utf-8?B?aE5TQVpmWjJGYzFzNkJscFRvcGpEWnRqM0pWT080NEhEL1hXdlFVRU1MR3Vn?=
 =?utf-8?B?dmZYMENoNkkweHlCeUttUk9NaXE3eGo2c2hFVURZZzhKWVRJNlFSb25XV1BO?=
 =?utf-8?B?by8vaFltaGJ4SklXK1dKbHRYV3BKZEN2RDNTV1YyL3ZaenA3WTV3WU0xY3Yy?=
 =?utf-8?B?Q3QrcUZYWm81L0tkSDNtdVBVRTFJSEs3OHB2V2VyL2g1VkVkZjhzYklpWG9q?=
 =?utf-8?B?K00wTW1ZaDNFNEJwbG9TeVFzcDl3PT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 12:38:39.4401
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4e0ee40-666d-49c9-655e-08de5e6a29db
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004688.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6316
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
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
X-Rspamd-Queue-Id: AA88BA15D9
X-Rspamd-Action: no action

On Thu Jan 22, 2026 at 5:49 PM CET, Alejandro Vallejo wrote:
> Remove cross-vendor support now that VMs can no longer have a different
> vendor than the host, leaving FEP as the sole raison-d'=C3=AAtre for #UD
> interception.
>
> Not a functional change.
>
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> ---
>  xen/arch/x86/hvm/hvm.c     | 25 ++++---------------------
>  xen/arch/x86/hvm/svm/svm.c |  4 ++--
>  xen/arch/x86/hvm/vmx/vmx.c |  4 ++--
>  3 files changed, 8 insertions(+), 25 deletions(-)
>
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 4d37a93c57..611ff83a60 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -3832,28 +3832,13 @@ int hvm_descriptor_access_intercept(uint64_t exit=
_info,
>      return X86EMUL_OKAY;
>  }
> =20
> -static bool cf_check is_cross_vendor(
> -    const struct x86_emulate_state *state, const struct x86_emulate_ctxt=
 *ctxt)
> -{
> -    switch ( ctxt->opcode )
> -    {
> -    case X86EMUL_OPC(0x0f, 0x05): /* syscall */
> -    case X86EMUL_OPC(0x0f, 0x34): /* sysenter */
> -    case X86EMUL_OPC(0x0f, 0x35): /* sysexit */
> -        return true;
> -    }
> -
> -    return false;
> -}
> -
> +#ifdef CONFIG_HVM_FEP
>  void hvm_ud_intercept(struct cpu_user_regs *regs)
>  {
>      struct vcpu *cur =3D current;
> -    bool should_emulate =3D
> -        cur->domain->arch.cpuid->x86_vendor !=3D boot_cpu_data.x86_vendo=
r;
>      struct hvm_emulate_ctxt ctxt;
> =20
> -    hvm_emulate_init_once(&ctxt, opt_hvm_fep ? NULL : is_cross_vendor, r=
egs);
> +    hvm_emulate_init_once(&ctxt, NULL, regs);
> =20
>      if ( opt_hvm_fep )
>      {
> @@ -3878,12 +3863,9 @@ void hvm_ud_intercept(struct cpu_user_regs *regs)
>                  regs->rip =3D (uint32_t)regs->rip;
> =20
>              add_taint(TAINT_HVM_FEP);
> -
> -            should_emulate =3D true;
>          }
>      }
> -
> -    if ( !should_emulate )
> +    else

review to self. This is buggy. It allows instruction emulation when HVM_FEP=
 is
enabled, but the FEP is absent in the particular instruction that caused th=
e
exception.

#UD should be re-injected when the instruction doesn't have the prefix.

Cheers,
Alejandro

