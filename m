Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YO6HGo7UeWm6zwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 10:19:10 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 915809EBA5
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 10:19:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215306.1525513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl1gu-0001rd-Op; Wed, 28 Jan 2026 09:18:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215306.1525513; Wed, 28 Jan 2026 09:18:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl1gu-0001pQ-LQ; Wed, 28 Jan 2026 09:18:24 +0000
Received: by outflank-mailman (input) for mailman id 1215306;
 Wed, 28 Jan 2026 09:18:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pnMD=AB=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vl1gt-0001pK-BE
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 09:18:23 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48f3f6d3-fc2a-11f0-9ccf-f158ae23cfc8;
 Wed, 28 Jan 2026 10:18:20 +0100 (CET)
Received: from PH7P220CA0047.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32b::6)
 by SA1PR12MB7269.namprd12.prod.outlook.com (2603:10b6:806:2be::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Wed, 28 Jan
 2026 09:18:13 +0000
Received: from SN1PEPF0002BA4F.namprd03.prod.outlook.com
 (2603:10b6:510:32b:cafe::df) by PH7P220CA0047.outlook.office365.com
 (2603:10b6:510:32b::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.8 via Frontend Transport; Wed,
 28 Jan 2026 09:18:12 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002BA4F.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Wed, 28 Jan 2026 09:18:12 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 28 Jan
 2026 03:18:09 -0600
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
X-Inumbo-ID: 48f3f6d3-fc2a-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vg0ejhCWpUyiNltvTPcSEnZ0Zh7uRbpMv/2l1+rro7gXjiwvDNoyQbtyeKQcEk3zCANvgzxHLFXx16JD4TNfHIwX5BIhczQiE61vqZGgXg4Y7krxHQcf+bIijtP6nngKzijD83LM5wVVzQtZ5DqAdk3KGmQRsf8KnjSFEb8TWXnyPRnGHm2dBPFk1QMcAfuDwzgxgpqxJx3ZKqP1mdn/faTJz5tR+otT2PIBcIO12z9k3mloYNy7hXvYohBS/GIGCH7qSQyxGBT5pvjnEI5cZpd1s9C4ZJBrSCaISqhZSvvuPlEg4XHdEBEeksXguImjoYJ0wXrWhxfjDdegCe/58A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vWZVMK3R4Wim4A9uV1L1iUBS1DPXx4MwCMiLvSRu8D4=;
 b=JfuIQoH7GDs7FL3CrWqRLCO6XgiOEiI9ShA7AssvniZ7bvLh3at0e3CmtYmzPHG41REISvC/EQet1xxImN0SWNX4kbPQBT5DQiugao8LDHWaV5yR+MK1NUAFq3txWRj2GNB/P47l2RG2s86BBJPdPCB1VW/4Mv7gJ3Xdx6d5d4bF2hamQ/qachg41i9y1COGXUYj7EMfwY4H+4J4Xhz3Ws3r4+m9deN6vqR6LaetcCUWRo0KGChI5Pk3u5xv/+dkWJW6VZUIpbzwshKudLSke/sXTmBFkJl43f3kniunhjZyBMHl/z4O6T7pKnOkxzJ9jYlOf8ln05XCjE9ygvKQyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vWZVMK3R4Wim4A9uV1L1iUBS1DPXx4MwCMiLvSRu8D4=;
 b=s17YANnR2hfnI4JtnHoqNYldpXCF1yph53tY4zOKVtqsBRDu0EqR9tEGVD9Izcf0wTk+Z+aeb7Png23uJlWw0IprIBh8i6i0J7l8yK7prxUB4/TD5WsGva32XwnwiYsc5Jb+ziBZd4JeNJHUJvuOCUBi5oMHaZyMEugt12ggBeQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 28 Jan 2026 10:18:03 +0100
Message-ID: <DG03YWKDDNUC.1622RXX7ZJUW8@amd.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [RFC PATCH] CODING_STYLE: Establish a policy with regards to
 copyright notices
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
X-Mailer: aerc 0.20.1
References: <20260127182403.141459-1-alejandro.garciavallejo@amd.com>
 <aXnEdQxyevj-wMuv@Mac.lan>
In-Reply-To: <aXnEdQxyevj-wMuv@Mac.lan>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4F:EE_|SA1PR12MB7269:EE_
X-MS-Office365-Filtering-Correlation-Id: f69489f6-5968-4606-6aaf-08de5e4e2969
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y3ViK01heTN1d2RDNWx0WkRCeVZXTitoOG5jUmdCMmVlRk9rTjF2QXFzNUJw?=
 =?utf-8?B?c1Z5T2syNExqcXJZU0tGOWgzTFpuVVBLTjBSNmtYV3B0bjh3bWlCSFo2WStG?=
 =?utf-8?B?dHlhMUl6U21DZ3k4UGpaSGNtZXA1VURoWFdveVNSKzllNDc5dWFNVTZldWhB?=
 =?utf-8?B?eVFBNkYvQ2ZOMEp1Tkx1SEIzaTlQdmdLbnIvMTJRaExWeXFjbmJaZFlkU0d3?=
 =?utf-8?B?c0JCeG5sMGZxUmtwUWx6Z0hhSmtqUkp2YzBhVk8ybzExTUJvZFRoNVNVVlBB?=
 =?utf-8?B?ekZhN3ZIcS8wblhoWmdOUzgzYUlrR0ZpNVlXcld5L3RUUk90NzlXd2tBc0ZI?=
 =?utf-8?B?SnU4Z1ZwQmMxdFgxcVord3dUcTFlTC9DSWVFNXZoREdubTNpa2V6TzlCNFJ3?=
 =?utf-8?B?dEozM09lRnFiUTZBbzlmOTV2QTFBWk41b3gzZ1dVNHpiVHN6UHAzNkJlbkNC?=
 =?utf-8?B?TG1zR1F0T0NiRTBnam82djU0aFl1SkMzZ0RBM2hpZERqYUduck1RcENWZXdw?=
 =?utf-8?B?eGMwZXNKZEx4Nzg5NHJyMFNrUFZqZkFEeVZIRm8xMHFaTE1iN25aVzc4MEhD?=
 =?utf-8?B?ZmJHVVlKVHBsd2oxRVF6UVBWbzl1N3lydHV6UUltWE1zbGxrMWVaL2NQZFF6?=
 =?utf-8?B?R2M3RE8wNkhtdzVQMDlta1pRWEFZeWxxdVM5RlQ1Q2JNRC9JbENzR3NaR05V?=
 =?utf-8?B?RVRFRFVraEtlbkQ4NUc3b1cyaWRtYkJSNjBDbER3M2NBRER4dnBJbVpETG1C?=
 =?utf-8?B?VVJiYzl6WGZubUhHeWhYQTg0NzJlZjhFRllBenVub005Wnk1ekk3UXU5UmRl?=
 =?utf-8?B?dFdQWUw1ak5iRkpkMnV4VFRERWgwU21wL1lWbWJieGhNUGZ5TEljSVdjZnY0?=
 =?utf-8?B?QjZ1T3lGRUtUVmN4aXd3OUVXUjJuT01jS2twTGEwdWhuaHl6QVEzWUpOdVlF?=
 =?utf-8?B?djhLK09vWVpaUkpSRU1wZUtiWWZtUWhVeWpPSFFIODg5aGVnckdJLzlxZG9t?=
 =?utf-8?B?YzYrTlZ4R25wMXZtS3dqb3J3RzExby9VUU5WczJGZ0hCek9QUDE1Wnc4SlFG?=
 =?utf-8?B?d1ZocUk0SWQ0dDJXaWFBNXVFWllScFhRbzBpM0txYXFDamI5MnZrRzhsNWNv?=
 =?utf-8?B?dk5kRFJSUml6by92WGhXTWI0UVZNMThldmZpbGdOUDR1aENkeEJNckR5NFlP?=
 =?utf-8?B?ZG91cDI2dUZ6VW5uUHF3eXhhSHEyN0F6YzdZa2J1WEhrTlArUnNPQnRXZmJP?=
 =?utf-8?B?UXVQcGRKTWh6SEZya2dKZDh6R2tXSXJJamt3TCtKVzlraVE5R0ZyZnY4cE5X?=
 =?utf-8?B?MEJSTjkxa2NyZXFQek50MGkzMkg4SUV3eTlaekRveVF4Q2xDRndhNlc3TEFE?=
 =?utf-8?B?UDVNaHk3ZFFvWGlFZTZLTzlEbWdoSkdCODl5U0pMOGNyRGRyYTRVS1hPT3lO?=
 =?utf-8?B?UGdGTVNkd0hkUnBIS3Z4R2lMQVd6ZVNEdXFRWXdhZVNidFB4c2lSMWdmT0JZ?=
 =?utf-8?B?ZkN4UFVSWGp2MmRiU3FpdTFTOVNFTHMvcFMxUE9LQWZuTnV2cmNra0VZVC94?=
 =?utf-8?B?SjBUMS9rNTRwS3RFRW94dWg3bmEzV09CbWEwc1lkTlhvdzJQcysxZERTV0ht?=
 =?utf-8?B?TysvTHZ5dWRVY2tjMGN4RmpPTW9OaXJWQUZJSXJONnJWbUV4L2xRMkUzTXRo?=
 =?utf-8?B?NUY2ajkzWW1EV1B4S3NKS09ONmx0WFZnem4wd1NmWXpKM1k0UXBRRGg0d1N4?=
 =?utf-8?B?cFhrWWptWnkydVI4L0NtdW91Z2VuL1J1Y0pHWEJoUWN0ZjNPaVVqa3REMm1H?=
 =?utf-8?B?T0d3Mml3YkhlOHp3M0lSRzNYdHQrN3V2Nmg3RGtXcHA4VFVtWXdlREZTKyt3?=
 =?utf-8?B?WWVoL0hzTTFWRTR3L21ZbnhWMjRSRzdxYWpEMHdYU2tzSnh6d0k1TTZFWncv?=
 =?utf-8?B?MGd1end0dnN1TE02cTRqeEVVRUpKRXkwbmx1WU9PM3d0aWg2T0ZONWZQbHVR?=
 =?utf-8?B?WDVRbnk1WVdXcTdoOGN1SVV5ejdRZW44aDBZUDBFQW1yRDllSE84OUZST1JH?=
 =?utf-8?B?TURnczlURDNVMUNBUFd4V2dEYjFGQmRoZE91MkdBcTdNODc4blZZc1pnVm4z?=
 =?utf-8?B?c3ZoZmxlZnBqYUdJWUtkcnd3RHk5Z09QTS84cXdCL3lpUGFkN2tqekJXNFBU?=
 =?utf-8?Q?QL3Kxj8EV5A/Af3AYrRBIRE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 09:18:12.7624
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f69489f6-5968-4606-6aaf-08de5e4e2969
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7269
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
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[llvm.org:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 915809EBA5
X-Rspamd-Action: no action

Hi,

On Wed Jan 28, 2026 at 9:10 AM CET, Roger Pau Monn=C3=A9 wrote:
> On Tue, Jan 27, 2026 at 07:24:01PM +0100, Alejandro Vallejo wrote:
>> This patch modifies CODING_STYLE to severely discourage use of copyright
>> notices when their presence is not legally mandatory.
>>=20
>> Copyright notices are redundant on commit, misleading from the time the =
file
>> receives contributions from anyone not represented by such notice, and a=
ctively
>> harmful for attribution by the time the original code is long gone. They=
 are
>> plain wrong when added on code motion.... the list goes on.
>>=20
>> All attribution worth keeping is version-controlled through Signed-off-b=
y,
>> Co-authored and the like, DCO and the cumulative contents of git history=
.
>> License banners have already been superseded by the contents of licenses=
/ and
>> SPDX tags.
>>=20
>> Other FOSS projects have already moved away from explicit copyright noti=
ces
>> where possible, and severely discourage their use when not.
>>=20
>> Apache and LLVM take active issue with copyrighted contributions and Chr=
omium
>> takes issues with copyrighted contributions not attributed to the projec=
t. Some
>> Linux subsystem maintainers already frown upon copyright notices too, ev=
en if
>> it hasn't reached the point of being a mandated requirement yet.
>>=20
>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>> ---
>> The actual changes are almost verbatim from the LLVM guideline, but it's=
 not
>> exact. Wording can be adjusted as needed. I care about the core of the p=
roposal.
>> Saying "please, drop the notice" on contributions where it's clearly not=
 a
>> legal requirement, or have the contributor state that it is a legal requ=
irement
>> and why. For fairness sake for all contributors to the project.
>>=20
>> I'd prefer taking the Apache approach for new contributions, but I want
>> some discussions to happen first.
>>=20
>> Thoughts?
>>=20
>> Relevant examples:
>>=20
>>   - LLVM: They banned copyright notices, unless part of a vendored
>>     components.
>>     - Links:
>>       - https://llvm.org/docs/DeveloperPolicy.html#embedded-copyright-or=
-contributed-by-statements
>>     - Relevant quote:
>>         The LLVM project does not accept contributions that include
>>         in-source copyright notices except where such notices are
>>         part of a larger external project being added as a vendored
>>         dependency.
>>=20
>>   - Apache: They banned optional copyright notices and relegated
>>             mandatory notices to a NOTICES file that also contains an
>>             Apache copyright notice. See links.
>>     - Links:
>>        - https://www.apache.org/legal/src-headers.html
>>        - https://infra.apache.org/licensing-howto.html#mod-notice
>>     - Relevant quote:
>>         If the source file is submitted with a copyright notice included
>>         in it, the copyright owner (or owner's agent) must either:
>>           * remove such notices, or
>>           * move them to the NOTICE file associated with each applicable
>>             project release, or
>>           * provide written permission for the ASF to make such removal
>>             or relocation of the notices.
>>=20
>>   - btrfs: They are highly discouraged.
>>     - Links:
>>       - https://lore.kernel.org/20220909101521.GS32411@twin.jikos.cz/
>>       - https://lwn.net/ml/linux-fsdevel/20221026074145.2be5ca09@gandalf=
.local.home/
>>       - https://archive.kernel.org/oldwiki/btrfs.wiki.kernel.org/index.p=
hp/Developer's_FAQ.html#Copyright_notices_in_files.2C_SPDX
>>       - https://lwn.net/Articles/912355/
>>     - Relevant quote:
>>       Let's say it's OK for substantial amount of code. What if somebody
>>       moves existing code that he did not write to a new file and adds
>>       a copyright notice? We got stuck there, both sides have different
>>       answer. I see it at minimum as unfair to the original code authors
>>       if not completely wrong because it could appear as "stealing"
>>       ownership.
>>=20
>> There's more cases of other projects taking similar stances.
>> ---
>>  CODING_STYLE | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>>=20
>> diff --git a/CODING_STYLE b/CODING_STYLE
>> index aae5a47ac2..97f80245ed 100644
>> --- a/CODING_STYLE
>> +++ b/CODING_STYLE
>> @@ -24,6 +24,24 @@ license, e.g.:
>> =20
>>  See LICENSES/ for a list of licenses and SPDX tags currently used.
>> =20
>> +Copyright notices
>> +-----------------
>> +
>> +Copyright for the code in the Xen Project is held by the respective
>> +contributors. Because you (or your company) retain ownership of the cod=
e you
>> +contribute, you know it may only be used under the terms of the open so=
urce
>> +license you contributed it under: the license for your contributions ca=
nnot be
>> +changed in the future without your approval.
>
> The usage of such direct language here, by using you to refer to the
> reader / contributor, set a different tone from the rest of the
> document.  Maybe something like:
>
> "Copyright for the code in the Xen Project is held by the respective
> contributors.  The author of the code is the owner of it as stated in
> the DCO.  The project cannot retroactively change the copyright of
> contributions, unless explicitly accepted by all authors of the
> code."

Ack for the tone. The particulars of the wording might need tweaking even i=
n
this version to constraint the scope of "contribution", "the code", and so =
on.

But yes, the difference in tone is a direct consequence of the paragraph be=
ing a
semi-verbatim copy of the LLVM policy. My intention was less about consiste=
ncy
with the existing style guide and more about bringing the point accross.

>
>> +The Xen Project does not accept contributions that include in-source co=
pyright
>> +notices except in the following cases:
>> +  * where a committed file already contains it.
>
> IMO we should also prevent expanding the existing list of copyright
> owners in the headers, and hence don't accept expanding the copyright
> notice of existing files in any way.  I don't think contributors to
> Xen have been expanding those headers in a long time, but would be
> good to have it written down.

Jan made the same appreciation. I agree.

>
>> +  * where a committed file is renamed.
>> +  * where such notices are on files from an external project being impo=
rted.
>
> "where such notices are on files imported from an external project."
>
> Seems easier to read to me, but I'm not a native speaker.

I agree too.

-----------------

I have the same question for you I asked Jan elsewhere.

There's 1 question in 2 forms I'd like to have an answer to from a core
maintainers.

Would you be willing to ack a change along these lines?
  1. to a Copyright Notice policy within CODING_STYLE.
  2. to the relegation of existing notices to a NOTICES file in the style o=
f
     Apache. Apache in particular mandates the file not be touched unless
     absolutely required for legal reasons.

(1) can be done without (2) if (2) proves to be "risky" in whatever legal w=
ay
it could possibly be risky.

This is httpd's NOTICES file as of today.

	Apache HTTP Server
	Copyright 2026 The Apache Software Foundation.

	This product includes software developed at
	The Apache Software Foundation (https://www.apache.org/).

	Portions of this software were developed at the National Center
	for Supercomputing Applications (NCSA) at the University of
	Illinois at Urbana-Champaign.

	This software contains code derived from the RSA Data Security
	Inc. MD5 Message-Digest Algorithm, including various
	modifications by Spyglass Inc., Carnegie Mellon University, and
	Bell Communications Research, Inc (Bellcore).

	This software contains code derived from the PCRE library pcreposix.c
	source code, written by Philip Hazel, Copyright 1997-2004
	by the University of Cambridge, England.

Cheers,
Alejandro

