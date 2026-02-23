Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNJBOe4VnGkq/gMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 09:55:10 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D56A1173552
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 09:55:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1238518.1540125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuRiX-0001Wi-Fe; Mon, 23 Feb 2026 08:55:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1238518.1540125; Mon, 23 Feb 2026 08:55:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuRiX-0001Uq-Ct; Mon, 23 Feb 2026 08:55:01 +0000
Received: by outflank-mailman (input) for mailman id 1238518;
 Mon, 23 Feb 2026 08:55:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r2fJ=A3=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vuRiV-0001Ui-VY
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 08:54:59 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 537254d2-1095-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Feb 2026 09:54:57 +0100 (CET)
Received: from MN2PR18CA0010.namprd18.prod.outlook.com (2603:10b6:208:23c::15)
 by SJ5PPF8AECCE022.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::99c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 23 Feb
 2026 08:54:52 +0000
Received: from BL6PEPF0001AB4A.namprd04.prod.outlook.com
 (2603:10b6:208:23c:cafe::f2) by MN2PR18CA0010.outlook.office365.com
 (2603:10b6:208:23c::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 08:54:53 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB4A.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 08:54:51 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 23 Feb
 2026 02:54:51 -0600
Received: from [10.71.194.215] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 23 Feb 2026 02:54:49 -0600
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
X-Inumbo-ID: 537254d2-1095-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R9b/YBdmsIokr8ha17uSdJDqXDGExUbJ9SdivALEF7q5Smg9ijj0ZOEPW/JN+P/1uzkXHc2qzQcTtr+U1b8Y6r4tlyWzjowyMT25EVePVN5bFOygL/Arlo/7wvIzvKI2yszfVOnpbInZrkLKQUsWSP5j6bvrpJ6EbZv7Zd2whRb7qDBJ5NKbiyBFD+7T3Wtf3x9wAupqbm4ddejiND2o9tQ0+4h2rf+pCprK8vqDyA2YJ7D2gJLPax+1bLJVsC00hAoZCW/OyEtJhberB+xT3R/pFa87v+YlGZ4uulcrTpLOk9M7KAfyrcoxDqO/HPo8Q2DgSvNKLRVoAlOMD1cIrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t/8C0ujbKN5s4EGu8j0zpuA6fUlJMTVb3Y6+8pPnCiU=;
 b=oATT0EpjKcELEVNY3HD7bGboMgN9v/zAt2A4BS/AuVxd2bdCE30/8aBJwb7/VNEq2OgsBIRCVLgcpmyQf7hPDWNm/eyq+jvotcf5fCAFx/+zunegKUBltJSRyDgPNmvRNcqHA9seyeD1uNs/fyIjUBCLjldf3ezMDy7JTDyUV4k1ln6BKog6I1+6iDOYjeucz1lVREo9kMEvqkD8RuuiG05n9iP5n5zEMcXs0S3x3JceZbj0pfUo4DN/HQotIkxYrSuTOODW5lC/nk+fE7EV7ZO9EB6FN6FCNNUzBN5cXZLCX5dc49Hd54e+/vujnzNHFwnxfFtOJe2V3gRIdP0TWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t/8C0ujbKN5s4EGu8j0zpuA6fUlJMTVb3Y6+8pPnCiU=;
 b=HqB/9EtBaR9qN9O2KQPlC4Wdw+qizGluvqlAyy57H8C1zPZaKSiaxVamfG/l4GdfMrG+EjyArhLhYkG9goH85va2YettmFmfqhwmUDOATKU2dJT+hQ+o9l7GeOXd6dpY4k+ahuDq/lc8G/gG5Nlm9p5DDqV/0ZGULSBbaJX0LUM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <d8edd8d2-e01b-4750-9f79-be2a976c0d87@amd.com>
Date: Mon, 23 Feb 2026 09:54:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] arm: Use __func__ in acpi_boot_table_init()
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, "consulting @ bugseng . com"
	<consulting@bugseng.com>, Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <20260220214653.3497384-1-andrew.cooper3@citrix.com>
 <20260220214653.3497384-2-andrew.cooper3@citrix.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260220214653.3497384-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4A:EE_|SJ5PPF8AECCE022:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b6a2726-8b29-4e7a-c2bf-08de72b93517
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cGVFVThGMnRYM3N6cFhYbzNFRy9qWm03S2hvMkhyNkplUHdkb3JwSkhsVVlm?=
 =?utf-8?B?ZjcwSDJJU3MwWlUwMFQ5bnZrTGY3dFFTVVp3bWp0b29JNWdHT21nL3lXR2ZE?=
 =?utf-8?B?K1N2K2xGT2s0aExod2ExSGdRRFpkMndidDFzOWsydEtiT0VZWTFoR0Zkc200?=
 =?utf-8?B?N1NISzRBQUJSQyt5WWJUMDBOMTZwOEMydGdDRFlGQ3RqaEEvUkpaWlNIUGZa?=
 =?utf-8?B?ZUx4OFArcGk3ZTh5VU1vRC9WWmZVMGxSc3NITlNKdzIvL2EvaTlkcWlhYzVl?=
 =?utf-8?B?OURHQzhPODBWcEZxdHA2ck9WeXpiaWNXNm91V3BwTm1UTE5ZV01WcCtkVDVH?=
 =?utf-8?B?WXVnYnNzRWJOU1dtS0s3ZVhUd1A2ZzlQSzZ1RUp0M3RodDdpQXBFcnV6WEh3?=
 =?utf-8?B?czM0TUxZVHU0dC9rZmJtN1lpOE56Q1Vkc2dTQnRhTWxwOXgvQkFlTEZoSWVr?=
 =?utf-8?B?cE1aZnJpc3htME0zSFY4cVNRdHR0ZzlINEpJSGxJM3hkOVBvTlRWMGd2RlFo?=
 =?utf-8?B?dlc5bG1rRkQ3QW43aXVRVHZLQVp3Slo3K3d1ZWNjY0lua3hwS0NMUjhmRXlq?=
 =?utf-8?B?NWx6YXpJVFI3ekJOcWZaUEVRTnBkQ3ovUjNRcXpyRlBqSVhZcjZNMU1YWm04?=
 =?utf-8?B?ME9lZjZJcWR0SXJ0dTN2cGhER0IwYUI5K0tieWVJRU5HL2tvRlRweUROUm1n?=
 =?utf-8?B?SDA5L0ZsdFYwWnkrSHFOT1BmK0U2QUdRWjlpMWx0Nk4zeGlrQTVweFhLWkYw?=
 =?utf-8?B?UWRQRlFwdHNWcjM1Vlk5VmxwcmVEUko5VUFqeVBIdFlaNFFTSkI4Zkxha1hk?=
 =?utf-8?B?c1ZHeUlEdy9yYXFTMEhKaXBJR3BCRjJLWkdnMHV0OXpmWHdMeWR1aUN1Qy9V?=
 =?utf-8?B?M090cXEwKzlVWW9lNW1Mdzh0YnFvNEhQbWhmdTJNcTlQT05zVWN3bHRSM0to?=
 =?utf-8?B?a09TOFowaGxoTjF4dlVveXZpejUxV1ZwbXdoUTd2Y0J2SWdUNXZoVWdCYjU4?=
 =?utf-8?B?UENNTkhMRCtaNzdSaE5Jdlc3UlpMbkVzWXZMb3pmQXIxeTJmd1NvbzZ3YldG?=
 =?utf-8?B?Z24veEhhbnRKRC9sck44SEZWSGN0bmxlTFZlNTA2T0VCblNVMU8ralBVNDN6?=
 =?utf-8?B?NkFXR1o2M2JQbndGSVk1bVV6V3dYRThHeFBnZ3NkeWZpcFplS3dYSEdBL3NJ?=
 =?utf-8?B?d0FTZm05SlhHdGZFbU1xTmUvbDgvQ01OTkhBUzBtdERwZ0trcG5jQTdleTlt?=
 =?utf-8?B?cXVHUE93NVJFOXpqYllSWXJqV1NjZGFkMUFBdC9NTkRudnZON3c2bHpaUmV4?=
 =?utf-8?B?M0o0VDFvenRjcGNVY2x1b0JuTUtmcE1od082OFRlZjBENnpXcVBDOWhUSTFa?=
 =?utf-8?B?V09mY3lHL01YWmpZN2Rtbjd1VmRFdzA3TDBKWDcwT1dtbVZIRmZKZVkwWmpu?=
 =?utf-8?B?VWJKbm4vWFEwUXNuc2VRZ3M1N1dvRXAydnZFVlBsSGVNN3E0YkgremRhRTN1?=
 =?utf-8?B?SUxLblFMdzhPbnRaTmRBOWVJUk9sQWVZQ2M2UjgrdjZPVk9iVUxOeFJ6M1Uv?=
 =?utf-8?B?U2ZrTDVRYVRqV3BSR1pUTmwzZVNyQnJQajNVMGR2OUE4b2FaNkNiRlgwaXEw?=
 =?utf-8?B?SkVTRmswNGVjNk9DUDN0QVZldGZDc3ZPbXNvajFXMWZHdE1sNHdibjdSMUd0?=
 =?utf-8?B?dHNVeVBmeHpwWXQ0ZW1ua0JZd0llQnNDemN0WjZUWUFoc0ZnUlBVKzZIbGxG?=
 =?utf-8?B?ckx1cmN0WTJFdmJMeHBoK3EzSEVzTHBxZytVNWxkUWVuclJjdUxIL3dJUlNW?=
 =?utf-8?B?SkFUd2w0NUMzNFB1WDJaOHZJcXZacWpidkNOS3dweUlYY0o2TXZJYlZpeHZI?=
 =?utf-8?B?WVhyVmZXOXp4UWZxRVlwQnZ0ZjdOYnhadGZYeVR6Y2N4T3N6VUZEUnR6RlVk?=
 =?utf-8?B?Vkg4S1pNcDdibHlkb2c3YnNGa2dhNHZOc1BkVFlsZlB6dFVXS3pnY3g2eFFp?=
 =?utf-8?B?U0VKWjMzVTczV2dkbjZsTnFvWFU1QWlQbG9zZlFEQmlZNDFsWlFvODc2b0ph?=
 =?utf-8?B?VjFjQUgySXBTb0V0NkR1L3pYZEFEZDFCcC9mTTNURXRYUGVlZFBKVTZUYThZ?=
 =?utf-8?B?OUN6Ymh0VWVOdHZ6WklOOW82ZFBDZmUxUW1vclQxUnI2MisreHhsbEw4SlBL?=
 =?utf-8?B?QkthaHVvRlhZMUcwV29mL2xGWUdhSXJhbTBuZEpHbGJwdXBVRkdsekl3UUdK?=
 =?utf-8?B?WnRhSTFvbXNZREVrWGhUZGpQRTl3PT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AoUjZEPuaeQOvB5uijPidAnaf7fLxXc+qpJv/hpm3MeR2Tm4ASuqyH/+DGx1+En6zkmriPYVUo/HBcIBOPJl/G2x++rdMRsyi6YQYzyNBNOOSPnKarYJRPAtTJqIPWz0LOzRyuZrJ13ri/AlufkuVBh7LB1tRusdbnPRylOZfS7qP8+VwIULZ5IS4C/6i0pRyvwt7zuEOlgG2kOSp4gXJk6OPJSVWqnqQbelm3NylfT4dRi/Ij58L7dVOeOgiR67pWZ/yiDt19uNboCNoDaBLSneLyZ3nNyoS0CH0qmnUC8hX7dhUCohAgsrJPJQJ0lYkbLClPTClaQR5+8pi+r1f2ewaFd6mLnyyreTQRwAeafgIt+sBbbDK5YPUIkSXlLX4ug+3bDOGKz3KKl3kBYgrjlrFS3d+bCFv2f7/Jif0g90GMNW2c5pN3gcYdJz2FUa
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 08:54:51.8018
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b6a2726-8b29-4e7a-c2bf-08de72b93517
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8AECCE022
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Volodymyr_Babchuk@epam.com,m:bertrand.marquis@arm.com,m:consulting@bugseng.com,m:nicola.vetrini@bugseng.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[amd.com:+];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: D56A1173552
X-Rspamd-Action: no action



On 20/02/2026 22:46, Andrew Cooper wrote:
> Elcair rejects __FUNCTION__ as nonstandard syntax and a R1.1 violation.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


