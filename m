Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHe2LgXtcWk/ZwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 10:25:25 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 216D4647CF
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 10:25:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210563.1522210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viqvp-0004oH-OQ; Thu, 22 Jan 2026 09:24:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210563.1522210; Thu, 22 Jan 2026 09:24:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viqvp-0004li-LZ; Thu, 22 Jan 2026 09:24:49 +0000
Received: by outflank-mailman (input) for mailman id 1210563;
 Thu, 22 Jan 2026 09:24:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I1tn=73=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1viqvn-0004la-W6
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 09:24:48 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2fd0cfd1-f774-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 10:24:45 +0100 (CET)
Received: from DS7PR03CA0125.namprd03.prod.outlook.com (2603:10b6:5:3b4::10)
 by MN2PR12MB4487.namprd12.prod.outlook.com (2603:10b6:208:264::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 09:24:37 +0000
Received: from CY4PEPF0000FCBE.namprd03.prod.outlook.com
 (2603:10b6:5:3b4:cafe::12) by DS7PR03CA0125.outlook.office365.com
 (2603:10b6:5:3b4::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Thu,
 22 Jan 2026 09:24:26 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000FCBE.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 09:24:37 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 22 Jan
 2026 03:24:35 -0600
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
X-Inumbo-ID: 2fd0cfd1-f774-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PnKNF3C7Zjqh2EZc5k67a/RLjGvBz52E8kiXRNtxG33ANUo4QupJPes+oEAUJn1Klg/g/0zxcOEm+CcUZbme48n0XDNSbaQVZaWFOoXn9EwsSNzfkBXTHJX7x7QrnLuSSsdaAQ35XUXYxiGgeR47u11jfdAGkiIrEj2tqJl8j0+UaPXDJbADvRBAFmIXidIzl2e22XFFiQETnsG7erpCo2cSlfuvIU8sRq3ys25U/OxM9vmoB0/6yXklBrTyu5D+T/rasS1T1ReC0iGUsuK8RDP4MSHaOyG5yx9ADUrw1MEOOyHuxZrT9wHKPIxkfzYJMq5D29y1VxLOW2gHvi9mGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G/oFnyNESESwLZyDcTFYh20C3cx2/Zljso7Pp2lKN9A=;
 b=roxdxz/N7979wNKhIjVF9vO7DWXGmcqFydx/nOiCdIdxbMVMwd4rHdttmFCHxeCgm0h9xgdiuJQVjEF4dqOCVw0R6sTs7v8PUmozCNOdx0pQe0Ar+88w0U7ZsEAPKexSG6EF2j3m4M0l+Pt1jb3jLxMUvuB6a44ZF5yb3x8FMB/wKs8RYV3gIPx6OiJWnJUftywrj14V7RYdhSDg3mT2tiyNGwZwMEQkAEhUXAiFRmANflpDjPHMUY4KEru92OfaZom1uIfRvwK46LkWLhOVQoCtm3Crprtu4krn0wQGBYTFPO4HkXRPPGg9GcJJ2t/Z4XroPw6aXGup/Jo8qTOKBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G/oFnyNESESwLZyDcTFYh20C3cx2/Zljso7Pp2lKN9A=;
 b=050BU1b78oeO/gAjhDVLdKrJ3Ivs9HHdw/oMHZHmvThW0zVj9V6KSN4b7XlR/h0F4XQtYgKYgWAF3+A2qphTN6WrlY1gCh17/aj8WKUnzuNvb47O2VdH1O/t3YJg9T26aGJsNZ7o2LgY0xcqqfi9d3JnZatLZE5pBhuIPrCnL0k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 22 Jan 2026 10:24:32 +0100
Message-ID: <DFV0CLR7D1GE.1BY8A2Z2931GY@amd.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>
Subject: Re: [PATCH v2 3/3] CHANGELOG: Note the new SVM bus-lock intercept
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
X-Mailer: aerc 0.20.1
References: <20260121142857.39069-1-alejandro.garciavallejo@amd.com>
 <20260121142857.39069-4-alejandro.garciavallejo@amd.com>
 <cd1e05cf-d81c-4e19-a410-d229b68485a3@citrix.com>
In-Reply-To: <cd1e05cf-d81c-4e19-a410-d229b68485a3@citrix.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBE:EE_|MN2PR12MB4487:EE_
X-MS-Office365-Filtering-Correlation-Id: 62fa6c00-ca81-4510-6a8e-08de59981028
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MjVIVy9qSzNYQXRBNEkrUFhrUCtodEU2amh6VUxNcm9jTlB0blo2SVFlZ2pS?=
 =?utf-8?B?eDhiQ2RrZ2JzZDlsM2tMc00zdzBVRUltR2R0cEhHaENYenJRTWpFY3hIMEdM?=
 =?utf-8?B?TXJlamhSNlUvdm5qSWRsYmFaUm0zTzdGSXBVKzRZbVRKRmxxTXlnZG9ZKzAz?=
 =?utf-8?B?SEhmSVdZbGFzWGxaRi9mSHpOd1FsOFdxTTFKZ2RZUXJIK1lhaWRmUjBlZlNM?=
 =?utf-8?B?MnhaQW16UUhXRC9SRFlPTjY5RmRrUmFLcDVlWTdJTnZLd2pVZmhDQzMzczFZ?=
 =?utf-8?B?UVNUOGRmVmVuL01xclhuYUEzRkN5QURSdUlyMGYxcGhwcmlrbEZFY01yUFVk?=
 =?utf-8?B?MUhUSUpNVlhSb0hiemhITFQ4aFk2OXdIZldGYmFIYjMwaFlENEpSRkVkQXlE?=
 =?utf-8?B?RmhmNU42MFFuUGEwZVEvUWJ3NjVwcHROOFgvOHplK0VXZ1d0clJRQWFVbDFa?=
 =?utf-8?B?bG12elRQdHhxVjFPVzgxWG1PanM4Z1prNzFJSWN4aDh1enhTeWtGY1V4Ym90?=
 =?utf-8?B?bEJmeXpJb2RLWlBXSlh1aTNJWHlPSGxWdzVwTEdzU0diM3dyb0R6VHVROXZB?=
 =?utf-8?B?YmcveDNhc0hwVVFyeDBTWU1sa2RNNEg3by9FUzlaRFpwSTBkNXk0NTU0WFN0?=
 =?utf-8?B?VlpqNjZQWmtyOVdENXAzbDgzRFVYLzRaUUdsWGRYVTNrM2FscUxCVUdSSUNv?=
 =?utf-8?B?Y1JtS1VIOVFsYWU1V1kxM0dQdUFkd041YW1JWStYanlXTDJhM09LMGZ0aVB5?=
 =?utf-8?B?M1RVeHBQRDV5WkM1OGZETTFQeHhwQmljWkpmeGdRTU5rOXo0S3hQbTdzYXp2?=
 =?utf-8?B?T1BjVzk3MVpZcDAxMTIzWk1YbzFjMndXbDRPbndJK2dOUStkUDBMNjhHTWIy?=
 =?utf-8?B?cXdocUoyT2FRV1VLVldvcUlQYWZiYUJFbkxNdVJVSDZBR052LzVPajNiNFBx?=
 =?utf-8?B?V3M0V2lPNFBxSkVJZlQ3V1J6QVM2bC91WVZxQm5pMFNOa21MOTF4WUEwNFhr?=
 =?utf-8?B?T1NhUzhjbU42RWU0MVdUcThOSTF2enluVExOUjRWZkRXdFlwY1NuRGE2dEtx?=
 =?utf-8?B?Y2phTVlPdnU2VzFJaVlsSWZWMnRuVmd2a1BkbU5PUU5DOS82YS9XTGFsNVZh?=
 =?utf-8?B?Q0dzVG42WmdLcFQwelJVYjV3aGhUUUVZMGc0NTQzcFNTdVpuOEpKUkgxZXA1?=
 =?utf-8?B?QVE4SFRpajlSZDNXUE9oU2FVUm44Q0FnMVlwWEVXMUJYMEVNVFEyM0ZQeUNq?=
 =?utf-8?B?MmZ0Vno2N0ZoRVRUVVhhSFhCaUJwSWpkODFoUzZDZ3E3YUh6ZmZ6aE5CZTZ5?=
 =?utf-8?B?Z3F1NVY5c3djcjFTWWxKUUpVYkdKOTF4YXN2cXIvK2lTYytHcitZbWJjU2do?=
 =?utf-8?B?andZdHRtdzg1c25vZmZYdEdmUEpneWdLeUFsU0dqcWY2SGU1NWtPY2VkdjZK?=
 =?utf-8?B?RUkrc1k0N0YybzI3VGJ3ZHpJZWlQeDdyRzFMZStLekZySmV1MVpHdnBuSUlF?=
 =?utf-8?B?ZXROa2VtcldYa28wbzFnNDBuNDZTY1pHbDRyV25McWN4UG9UU096b1prY1RF?=
 =?utf-8?B?eVhrV2drWXZ5U1FiM0NOSVVtY0tSOVlwMEo0Vkc0RU1HcmRiMDFka29MZFdH?=
 =?utf-8?B?MkZKL3hpZXdxcHBLL2tBSDZ0SWZLbGNscnZpSHVoTEovbkY5TkNYc3VGR2pO?=
 =?utf-8?B?Rklvdm1odWlMSEtKMmdIeEdsZWIwS1hGYUNBeDc0QXhKcFA1Tk5rMk5LSFNF?=
 =?utf-8?B?MlB2SmZRSXJ1Z0QwVjNaanppVHVRZ0JtVms3cFhUSFEzY01uNHlvZ0VIWjly?=
 =?utf-8?B?NVpZRXhEdUxjU0xKY3ppQW5ocTJYTmU4YXRCUWM2eGE3K2M1MnRna2MwK01Z?=
 =?utf-8?B?UE5GdXpRQ3piWEJyQldyRkJvN1l2bTNRaWdZczhmb0dLSUdjaFNTeklTZXNF?=
 =?utf-8?B?T1N6OW1vcGxYNDhaa2dxWExqRWZWUkZxT1Jvb0pDdHRMTkhvVHNsZ3l0ZlNm?=
 =?utf-8?B?M1JJbTdQOEhlVjF2T29rWGU2SXNiVGJsQmkwVWczKzdDUXRQSkd6L1RWcDVw?=
 =?utf-8?B?a3RuZ2J1ZDhUbEZXeG5XRmI3U3VKd0ExbkFFRDZEOWRQNW5FT0trSmdkdk0w?=
 =?utf-8?B?bjlZaDZab3ArSFRzT0JJQ1kyTmVKazhzZTE1UVdVRmdCV3JJMUNXbHVJWlcy?=
 =?utf-8?B?S3c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 09:24:37.3302
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62fa6c00-ca81-4510-6a8e-08de59981028
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCBE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4487
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid];
	DKIM_TRACE(0.00)[amd.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 216D4647CF
X-Rspamd-Action: no action

On Wed Jan 21, 2026 at 7:36 PM CET, Andrew Cooper wrote:
> On 21/01/2026 2:28 pm, Alejandro Vallejo wrote:
>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>> ---
>>  CHANGELOG.md | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>> index 53d92a2597..07c1745f22 100644
>> --- a/CHANGELOG.md
>> +++ b/CHANGELOG.md
>> @@ -9,6 +9,9 @@ The format is based on [Keep a Changelog](https://keepac=
hangelog.com/en/1.0.0/)
>>  ### Changed
>> =20
>>  ### Added
>> + - On x86:
>> +     - AMD bus-lock detect, used by Xen to mitigate (by rate-limiting) =
the
>> +       system wide impact of an HVM guest misusing atomic instructions.
>> =20
>
> A little too much copy&paste from the SPR section.=C2=A0 This wants
> unindenting by one level.
>
> Also, this text most importantly needs to identify which hardware the
> feature exists in.=C2=A0 I've reworked it to:
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 53d92a259731..9c3bf0411ccc 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -9,6 +9,10 @@ The format is based on [Keep a
> Changelog](https://keepachangelog.com/en/1.0.0/)
> =C2=A0### Changed
> =C2=A0
> =C2=A0### Added
> + - On x86:
> +=C2=A0=C2=A0 - Support for Bus Lock Threshold on AMD Zen5 and later CPUs=
, used by
> Xen to
> +=C2=A0=C2=A0=C2=A0=C2=A0 mitigate (by rate-limiting) the system wide imp=
act of an HVM guest
> +=C2=A0=C2=A0=C2=A0=C2=A0 misusing atomic instructions.
> =C2=A0
> =C2=A0### Removed
> =C2=A0 - On x86:
>
>
> The internet suggests that it's Zen5 rather than Zen4.
>
> Also I personally put the CHANGELOG update in the commit which finally
> implements the feature, rather than doing it after the fact.=C2=A0 This i=
s
> more helpful when git blame-ing CHANGELOG to find things.
>
> ~Andrew

Sure, fixing up the prior patch sounds good to me.

Cheers,
Alejandro

