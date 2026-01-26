Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFt7MdyWd2n0iwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 17:31:24 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E71A98AB17
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 17:31:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213806.1524257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkPUE-00032K-41; Mon, 26 Jan 2026 16:30:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213806.1524257; Mon, 26 Jan 2026 16:30:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkPUE-00030Z-0Q; Mon, 26 Jan 2026 16:30:46 +0000
Received: by outflank-mailman (input) for mailman id 1213806;
 Mon, 26 Jan 2026 16:30:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z+2V=77=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vkPUD-00030P-Dh
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 16:30:45 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b391012-fad4-11f0-b15f-2bf370ae4941;
 Mon, 26 Jan 2026 17:30:43 +0100 (CET)
Received: from BL1P222CA0022.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::27)
 by DS0PR12MB6416.namprd12.prod.outlook.com (2603:10b6:8:cb::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.16; Mon, 26 Jan 2026 16:30:30 +0000
Received: from BL6PEPF0001AB52.namprd02.prod.outlook.com
 (2603:10b6:208:2c7:cafe::e5) by BL1P222CA0022.outlook.office365.com
 (2603:10b6:208:2c7::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Mon,
 26 Jan 2026 16:30:21 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB52.mail.protection.outlook.com (10.167.241.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Mon, 26 Jan 2026 16:30:30 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 26 Jan
 2026 10:30:27 -0600
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
X-Inumbo-ID: 5b391012-fad4-11f0-b15f-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wo+j8jhvG43Jix7zXiVzzj9jx/Lee0Mq5jM/lc9SvQ01JUHWmLhQUfx54ufKCjBm0XGjuKE8T2CCr0Gwv9P/Pv86UOUveOdVG6UJ/umDSnF4t7s5PpKiSOAUZwRS/xHbXWmroGgd7Z/UUzYKvA1RI7xMLPuzrfYIr48+gHEeUpLYK/Gzu5tYbU9QqDQ0ujgz67wW0zXEIjuZGiydqJjf2QS903hx32nez6bR7dFhNGa6LTsUcFGfy7pSsPwjhPDsbqFK++NFOB0gp7E4zz82UhMY8D64G8skq5ZhuCr2UjflnKViOKfWY4AOdqJ2gCVoO6zwH7j9jSDNQbS/EggUKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=00WL0zzqjSejKtA1awLrUpFxlkYuhaUrlCET7Cm5m2M=;
 b=c3HK97NiLj5WKTD8noruRMD0fj7LSK/lWXUjZHJI1PFthYNlMEZ9yhJjYlEwe90PQYO5U6dms+pmICQK6SNvt/JGHprZT+oopi+W29sI3jglhws7OcqAgzLQnahseqnUE5jBiC9GHW2/ns156jbIDs0qCDK5T738fO1jdDroysPmVhkCYh6pIHAOcDkzGtapmW2dnNaXuHeG/zkZTR2LOwnuW3hVXs1hoFNPoe/wYNL08Zmk8N1zanqkC+6rGpXcC8aJOzkveN6RMtLL9m/CYcuK9J9h0nSKuUPLmycdyMe/+Lnzxs3gKUp6j/RMGiF0j2hDfgcZEt2dzPBFOc8b5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vates.tech smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=00WL0zzqjSejKtA1awLrUpFxlkYuhaUrlCET7Cm5m2M=;
 b=KtRa+pQdpbwlPlV4WXz4wMDVxF+R2QxTPjrT8Ip5Cl1xFUNNM4iLw4y9rx6Jbpi+iFmH/ycQ2DovGlxeMFcuThli0/i06dzDWrKDVbt44quneIcC0cE/bniGSktlMmIFKTF/QzTX4WkfeiEMPomdkpt77N9X0wh82Ag6vFXO6Kc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 26 Jan 2026 17:30:25 +0100
Message-ID: <DFYNWV2K9N6K.2KH55IAUWZMZB@amd.com>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	=?utf-8?q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Xen-devel
	<xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH] xen: Move NX handling to a dedicated place
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Julian Vetter <julian.vetter@vates.tech>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20260115151658.3725784-1-julian.vetter@vates.tech>
In-Reply-To: <20260115151658.3725784-1-julian.vetter@vates.tech>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB52:EE_|DS0PR12MB6416:EE_
X-MS-Office365-Filtering-Correlation-Id: a83ce993-2f6c-4e52-ae03-08de5cf83894
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|30052699003|82310400026|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b2tlUHc5VXAzd2xLaCtiVmNxbHlTRmVnYllDZzdVVGZEdnJpcTVqcUpnUHRC?=
 =?utf-8?B?OFdGd3kvWE1PS2p2NCtzckVxc2oyNjVLaW4vV2VVVmRESWNNL2U3ZW5FYjZH?=
 =?utf-8?B?QTlHRm5Ca3M0bUJPVkJmMllrNDB5SjJqR0E4SDNCaFZFazVVdzArNGYwQlZl?=
 =?utf-8?B?R3g3STZreXZTSUtUUHdBSGJ0d09SNUV0Z09tVkVQa1czMmNicWgyRk5ORXVr?=
 =?utf-8?B?ZW9PbTJkM1ZHazFQaXlGQTg4ampieGlTME1rU2lRUmM5Q3k2YUsrM0sycjZm?=
 =?utf-8?B?MFl0amN3YjQwVU1SbTk1TEszVDBrZE1rd1dGaGFhRnJMa1VwZUZGRjYxWGlq?=
 =?utf-8?B?WFQyU25VMnk1a2I0clRGdUxyNzlITXQrcEYrUE5yd0tvSlovc052ZTZRUUNV?=
 =?utf-8?B?WEwwTmlOZVZKSys2U2JCcGNOc09pQnBMQVdKbk5jaVhGUjd3Vng3NTllZFkx?=
 =?utf-8?B?UlhuMzU5aW10dkp4YTNlMmJUNmJPK3ZNeHFhbVloSWZDczk3VDBGS09FUXdq?=
 =?utf-8?B?L3lRcGRDQ3VFWWlla2hqa1RnNk9kaURJNlE3c2pmYi9BSmFtSlU3bXFKWmtp?=
 =?utf-8?B?MEljU3lJbC85UFVnK3lNZG5DVTFKZmtHRnBZanNzbFk3SkRDM01lZVRlVE5w?=
 =?utf-8?B?dy9QWTJEZzN5dzNubENtRXo2RGFjejFCL2JFc0IvWlJ3a2FDMGVTZFpIdHVu?=
 =?utf-8?B?eGEyUXJUanRuVTBwTlk0Tm1OZjhNckh0ZGdTN3FvRFlLTDFBVkRLR1hDaXVI?=
 =?utf-8?B?WUpXcDBVUGpSUit0NGRTamZUeXFDS2RRRm9pelRxMkJRN2ZNV0hzT0N0YXlw?=
 =?utf-8?B?eUkzRW5qZStQVnpJaDN5a1AwME1uUXNtRkdodDhaUUt5OERBNFFIdGx0WXZz?=
 =?utf-8?B?NmxkcXRLR29lOVg2dXZldU5BL0RINTJReG9GSWExVkdWN0QzL0tUcVp5VlUx?=
 =?utf-8?B?UFZKbThpaGhmdXJhYlIrZXBlTnBiYzd0VW1QbUVoeHRZTmZDR2FHWmJOejVD?=
 =?utf-8?B?UjVmTVRDVXVkTTBaRkZyV0NpOWoyaitkTGVwSmEwQk9qS0lvQmU2a1FNblM1?=
 =?utf-8?B?MUt2QUJpY3I4RjFOVXNnT3l4SlRqQXJmNEx5L1JOQXNHMkszOGNNQ2g1T29P?=
 =?utf-8?B?a0o5UC9OTTkxb1Qvc0VMdDl0T0dpZFc1Q281djJidWhvWTVST1Bvd25WNUJk?=
 =?utf-8?B?OEhJakNsNnhpY0RJeXNHM0JibCtpc29MZTRESzJwZWFKWG9hWVRSL3BaQjA0?=
 =?utf-8?B?NTUrUnlKcWJsZ1hiRmdPeGRvZS9kQlVZZklueEF5dERaVmtPc05hNm56MFNZ?=
 =?utf-8?B?RnJFNGF5bDJNQ2dqUm04cEsvK2VVdTJjS2svQ0VrbjViMnYrbUhXMWpQZnRU?=
 =?utf-8?B?a1R5d0xMTVllTVJ6M2U1cTlDNGdJUGNlNUNCRXZxQjZnclpuTmJQR1ZubmhU?=
 =?utf-8?B?bVZnbytUOFQ2akRjbjhwajMranlJUHQ1RzBtY0prUUtoOVdGNklSdWZQYTRa?=
 =?utf-8?B?MTFvaTc0VC9MbGR2WUtlQWs2K1pZR2tCUGZCZkh1M2lSSXFjcDBvcEF4RWc2?=
 =?utf-8?B?c3hxZDh0bGdvZ1FSOElhelRYNHZPT0VFOTc4Z1EyYWluQnQ5bjUyUEJweFFX?=
 =?utf-8?B?UXMwVlhDa2psN3RXaDBzeEJSUmppOHhlYzBLcG9RTm41SWRPK1pFVVI5UHRI?=
 =?utf-8?B?S1RMS0R4YnRteWVPUWJ1Q0crT1R2Z2l6UmdHaWhza2I3MFNwbzZrSlYxNHpr?=
 =?utf-8?B?V2FXcElMZFpVWkJOd3hVdmIwMmMxWVZtRU84a0d0MjM3bFVMWlU4MDNTK2pw?=
 =?utf-8?B?MTEvajhKaElkVmp5SGV1R2VkTjI5SlM4K1NUMlNnQWsvT3ZEMTY4a3pRU0RE?=
 =?utf-8?B?eVNjSXBQMFd6OW16cjI1OHFFQkV4c0FPKzArZUUvTjcxUVdQbEZ0M2MwL3lN?=
 =?utf-8?B?NU1XYlZOZDloeUk1NmEzY01FeCt5N29KNVZadnJYSHVPUXd6d0Z3MkdpUEIy?=
 =?utf-8?B?bXJqSStKKzFnYnJGeUIxenZjTUxUN0htcTVSL09WWUE4WllvMXVuZzhKVHhW?=
 =?utf-8?B?MzhxUkhLRE1PTkcyTWN0NTRPcW9rWStMUDVZblV4NGdLOHBvaFp5TTY1Skxj?=
 =?utf-8?B?b2Ruc0FTRzAreHJKOVJ1ekZkVkVERTdjVFdIbkN2aFRJVFRFb3d4OU9JOWMv?=
 =?utf-8?B?a3V4K1ZpQXkvbThPdnIrN1IyUnI3L3l5ZEg2eTBtK1BnZVl4VkV4WWJ6MVZO?=
 =?utf-8?B?UTJPbDVTZldMV2J3MzM2UDZ3M0pRPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(30052699003)(82310400026)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 16:30:30.3657
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a83ce993-2f6c-4e52-ae03-08de5cf83894
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB52.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6416
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:xen-devel-bounces@lists.xenproject.org,m:julian.vetter@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E71A98AB17
X-Rspamd-Action: no action

On Thu Jan 15, 2026 at 4:17 PM CET, Julian Vetter wrote:
> Currently the CONFIG_REQUIRE_NX prevents booting XEN, if NX is disabled
> in the BIOS. AMD doesn't have a software-accessible MSR to re-enable it,
> so there is nothing we can do. The system is going to die anyway. But on
> Intel NX might just be hidden via IA32_MISC_ENABLE.XD_DISABLE. But the
> function to re-enable it is called after the check + panic in
> efi_arch_cpu. So, this patch removes the early check and moves the
> entire NX handling into a dedicated place.

Let me prefix this with I haven't looked at the discussion at large. Howeve=
r,
I'm guessing the BIOS is merely hiding NX and not precluding its use (I don=
't
think there's a way to do that). I also imagine it's not an AMD BIOS and ra=
ther
an OEM BIOS?

If so, commit message and comments need to reflect that.

Also, this might be a good time to reverse a mistake here on the polarity o=
f
this option. It should've been CONFIG_OPT_NX, where having the option set a=
llows
machines without NX to run and having it disabled mandates NX to be set.

That makes the option strictly additive and compatible with allyesconfig.

My .02, anyway

Cheers,
Alejandro

>
> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
> ---
>  xen/arch/x86/boot/head.S         | 56 --------------------------------
>  xen/arch/x86/boot/trampoline.S   |  5 ++-
>  xen/arch/x86/cpu/intel.c         |  4 ---
>  xen/arch/x86/efi/efi-boot.h      | 12 -------
>  xen/arch/x86/include/asm/setup.h |  2 ++
>  xen/arch/x86/setup.c             | 46 ++++++++++++++++++++++++++
>  6 files changed, 50 insertions(+), 75 deletions(-)
>
> diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
> index 77bb7a9e21..7fb7fb1351 100644
> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -133,7 +133,6 @@ multiboot2_header:
>  .Lbad_ldr_nbs: .asciz "ERR: Bootloader shutdown EFI x64 boot services!"
>  .Lbad_efi_msg: .asciz "ERR: EFI IA-32 platforms are not supported!"
>  .Lbag_alg_msg: .asciz "ERR: Xen must be loaded at a 2Mb boundary!"
> -.Lno_nx_msg:   .asciz "ERR: Not an NX-capable CPU!"
> =20
>          .section .init.data, "aw", @progbits
>          .subsection 1 /* Put data here after the page tables (in x86_64.=
S). */
> @@ -165,11 +164,6 @@ early_error: /* Here to improve the disassembly. */
>  .Lnot_aligned:
>          mov     $sym_offs(.Lbag_alg_msg), %ecx
>          jmp     .Lget_vtb
> -#ifdef CONFIG_REQUIRE_NX
> -.Lno_nx:
> -        mov     $sym_offs(.Lno_nx_msg), %ecx
> -        jmp     .Lget_vtb
> -#endif
>  .Lmb2_no_bs:
>          /*
>           * Ditto. Additionally, here there is a chance that Xen was star=
ted
> @@ -547,56 +541,6 @@ trampoline_setup:
>          bt      $cpufeat_bit(X86_FEATURE_LM),%edx
>          jnc     .Lbad_cpu
> =20
> -        /*
> -         * Check for NX
> -         *   - If Xen was compiled requiring it simply assert it's
> -         *     supported. The trampoline already has the right constant.
> -         *   - Otherwise, update the trampoline EFER mask accordingly.
> -         */
> -        bt      $cpufeat_bit(X86_FEATURE_NX), %edx
> -        jc     .Lgot_nx
> -
> -        /*
> -         * NX appears to be unsupported, but it might be hidden.
> -         *
> -         * The feature is part of the AMD64 spec, but the very first Int=
el
> -         * 64bit CPUs lacked the feature, and thereafter there was a
> -         * firmware knob to disable the feature. Undo the disable if
> -         * possible.
> -         *
> -         * All 64bit Intel CPUs support this MSR. If virtualised, expect
> -         * the hypervisor to either emulate the MSR or give us NX.
> -         */
> -        xor     %eax, %eax
> -        cpuid
> -        cmp     $X86_VENDOR_INTEL_EBX, %ebx
> -        jnz     .Lno_nx
> -        cmp     $X86_VENDOR_INTEL_EDX, %edx
> -        jnz     .Lno_nx
> -        cmp     $X86_VENDOR_INTEL_ECX, %ecx
> -        jnz     .Lno_nx
> -
> -        /* Clear the XD_DISABLE bit */
> -        mov     $MSR_IA32_MISC_ENABLE, %ecx
> -        rdmsr
> -        btr     $2, %edx
> -        jnc     .Lno_nx
> -        wrmsr
> -        orb     $MSR_IA32_MISC_ENABLE_XD_DISABLE >> 32, 4 + sym_esi(tram=
poline_misc_enable_off)
> -
> -        /* Check again for NX */
> -        mov     $0x80000001, %eax
> -        cpuid
> -        bt      $cpufeat_bit(X86_FEATURE_NX), %edx
> -        jnc     .Lno_nx
> -
> -.Lgot_nx:
> -#ifndef CONFIG_REQUIRE_NX
> -        /* Adjust EFER given that NX is present */
> -        orb     $EFER_NXE >> 8, 1 + sym_esi(trampoline_efer)
> -.Lno_nx:
> -#endif
> -
>          /* Stash TSC to calculate a good approximation of time-since-boo=
t */
>          rdtsc
>          mov     %eax,     sym_esi(boot_tsc_stamp)
> diff --git a/xen/arch/x86/boot/trampoline.S b/xen/arch/x86/boot/trampolin=
e.S
> index a92e399fbe..8e8d50cbdf 100644
> --- a/xen/arch/x86/boot/trampoline.S
> +++ b/xen/arch/x86/boot/trampoline.S
> @@ -144,10 +144,9 @@ gdt_48:
>  GLOBAL(trampoline_misc_enable_off)
>          .quad   0
> =20
> -/* EFER OR-mask for boot paths.  SCE conditional on PV support, NX added=
 when available. */
> +/* EFER OR-mask for boot paths.  SCE conditional on PV support. */
>  GLOBAL(trampoline_efer)
> -        .long   EFER_LME | (EFER_SCE * IS_ENABLED(CONFIG_PV)) | \
> -                (EFER_NXE * IS_ENABLED(CONFIG_REQUIRE_NX))
> +        .long   EFER_LME | (EFER_SCE * IS_ENABLED(CONFIG_PV))
> =20
>  GLOBAL(trampoline_xen_phys_start)
>          .long   0
> diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
> index b76797cb9a..e8cf51e853 100644
> --- a/xen/arch/x86/cpu/intel.c
> +++ b/xen/arch/x86/cpu/intel.c
> @@ -351,10 +351,6 @@ static void cf_check early_init_intel(struct cpuinfo=
_x86 *c)
>  	if (c->x86 =3D=3D 15 && c->x86_cache_alignment =3D=3D 64)
>  		c->x86_cache_alignment =3D 128;
> =20
> -	if (c =3D=3D &boot_cpu_data &&
> -	    bootsym(trampoline_misc_enable_off) & MSR_IA32_MISC_ENABLE_XD_DISAB=
LE)
> -		printk(KERN_INFO "re-enabled NX (Execute Disable) protection\n");
> -
>  	intel_unlock_cpuid_leaves(c);
> =20
>  	/* CPUID workaround for Intel 0F33/0F34 CPU */
> diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
> index 0194720003..8dfd549f12 100644
> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -748,18 +748,6 @@ static void __init efi_arch_cpu(void)
>      if ( (eax >> 16) =3D=3D 0x8000 && eax > 0x80000000U )
>      {
>          caps[FEATURESET_e1d] =3D cpuid_edx(0x80000001U);
> -
> -        /*
> -         * This check purposefully doesn't use cpu_has_nx because
> -         * cpu_has_nx bypasses the boot_cpu_data read if Xen was compile=
d
> -         * with CONFIG_REQUIRE_NX
> -         */
> -        if ( IS_ENABLED(CONFIG_REQUIRE_NX) &&
> -             !boot_cpu_has(X86_FEATURE_NX) )
> -            blexit(L"This build of Xen requires NX support");
> -
> -        if ( cpu_has_nx )
> -            trampoline_efer |=3D EFER_NXE;
>      }
>  }
> =20
> diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/=
setup.h
> index b01e83a8ed..16f53725ca 100644
> --- a/xen/arch/x86/include/asm/setup.h
> +++ b/xen/arch/x86/include/asm/setup.h
> @@ -70,4 +70,6 @@ extern bool opt_dom0_msr_relaxed;
> =20
>  #define max_init_domid (0)
> =20
> +void nx_init(void);
> +
>  #endif
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 27c63d1d97..608720b717 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1119,6 +1119,50 @@ static struct domain *__init create_dom0(struct bo=
ot_info *bi)
>      return d;
>  }
> =20
> +void __init nx_init(void)
> +{
> +    uint64_t misc_enable;
> +    uint32_t eax, ebx, ecx, edx;
> +
> +    if ( !boot_cpu_has(X86_FEATURE_NX) )
> +    {
> +        /* Intel: try to unhide NX by clearing XD_DISABLE */
> +        cpuid(0, &eax, &ebx, &ecx, &edx);
> +        if ( ebx =3D=3D X86_VENDOR_INTEL_EBX &&
> +             ecx =3D=3D X86_VENDOR_INTEL_ECX &&
> +             edx =3D=3D X86_VENDOR_INTEL_EDX )
> +        {
> +            rdmsrl(MSR_IA32_MISC_ENABLE, misc_enable);
> +            if ( misc_enable & MSR_IA32_MISC_ENABLE_XD_DISABLE )
> +            {
> +                misc_enable &=3D ~MSR_IA32_MISC_ENABLE_XD_DISABLE;
> +                wrmsrl(MSR_IA32_MISC_ENABLE, misc_enable);
> +
> +                /* Re-read CPUID after having cleared XD_DISABLE */
> +                boot_cpu_data.x86_capability[FEATURESET_e1d] =3D cpuid_e=
dx(0x80000001U);
> +
> +                /* Adjust misc_enable_off for secondary startup and wake=
up code */
> +                bootsym(trampoline_misc_enable_off) |=3D MSR_IA32_MISC_E=
NABLE_XD_DISABLE;
> +                printk(KERN_INFO "re-enabled NX (Execute Disable) protec=
tion\n");
> +            }
> +        }
> +        /* AMD: nothing we can do - NX must be enabled in BIOS */
> +    }
> +
> +    /* Enable EFER.NXE only if NX is available */
> +    if ( boot_cpu_has(X86_FEATURE_NX) )
> +    {
> +        if ( !(read_efer() & EFER_NXE) )
> +            write_efer(read_efer() | EFER_NXE);
> +
> +        /* Adjust trampoline_efer for secondary startup and wakeup code =
*/
> +        bootsym(trampoline_efer) |=3D EFER_NXE;
> +    }
> +
> +    if ( IS_ENABLED(CONFIG_REQUIRE_NX) && !boot_cpu_has(X86_FEATURE_NX) =
)
> +        panic("This build of Xen requires NX support\n");
> +}
> +
>  /* How much of the directmap is prebuilt at compile time. */
>  #define PREBUILT_MAP_LIMIT (1 << L2_PAGETABLE_SHIFT)
> =20
> @@ -1159,6 +1203,8 @@ void asmlinkage __init noreturn __start_xen(void)
>      rdmsrl(MSR_EFER, this_cpu(efer));
>      asm volatile ( "mov %%cr4,%0" : "=3Dr" (info->cr4) );
> =20
> +    nx_init();
> +
>      /* Enable NMIs.  Our loader (e.g. Tboot) may have left them disabled=
. */
>      enable_nmis();
> =20


