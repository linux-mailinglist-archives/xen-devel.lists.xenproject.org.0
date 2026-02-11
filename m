Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHQeAfq9jGmisgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 18:35:54 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 619FD126A75
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 18:35:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1228125.1534489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqE7m-000641-6B; Wed, 11 Feb 2026 17:35:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1228125.1534489; Wed, 11 Feb 2026 17:35:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqE7m-00061o-3W; Wed, 11 Feb 2026 17:35:38 +0000
Received: by outflank-mailman (input) for mailman id 1228125;
 Wed, 11 Feb 2026 17:35:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gWxp=AP=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vqE7k-00061G-Tl
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 17:35:36 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11221ab1-0770-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Feb 2026 18:35:34 +0100 (CET)
Received: from BN9PR03CA0750.namprd03.prod.outlook.com (2603:10b6:408:110::35)
 by BY5PR12MB4098.namprd12.prod.outlook.com (2603:10b6:a03:205::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 17:35:26 +0000
Received: from BN1PEPF0000468A.namprd05.prod.outlook.com
 (2603:10b6:408:110:cafe::61) by BN9PR03CA0750.outlook.office365.com
 (2603:10b6:408:110::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.9 via Frontend Transport; Wed,
 11 Feb 2026 17:35:19 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF0000468A.mail.protection.outlook.com (10.167.243.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Wed, 11 Feb 2026 17:35:26 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 11 Feb
 2026 11:35:24 -0600
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
X-Inumbo-ID: 11221ab1-0770-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oqO/W0FyJLKsciwW5IwXjaMZUBhUa5+aWWJXQaVyeyUx988S5HovybMbQUHCCv4b87thZIHnjgwYEYCbYxGWWk/YoNCxRRC0QBT8EnLooNIltClVdrIRIh//SZ+I4UPBmWNhxvbS2zGO4/bZGf1ZWDFWVLtsJWSacI9oBgLhLClFkZY1FPjpVl9EnUQCXvwYY3CJrUsRuzDT4v9BGqlTafCck8DcrfCrPWlMwgrm78QX+tcX5uaqhQBVW9AYsIAqE/XvvOG4FWziDxe2tIFYQ2qXMGPtzmjcTRpUuo7glq8uxjVZsPwAVfGyr42kPj0G4tK2OnctPOxepknYb/uRjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQg2kVAQ/UBnCswUHj3GLICgMNPTRKpRChp8eE7X0z0=;
 b=l0/UPcesh+Kg1CTglzZMVIUgFoJW/mCmQhTSO+dxagiHdr8FxXhg2pzXm2G6y0HNKlgoydB7kWMjeP3WNtvWRCuLA4/YP5PAPNXZTFYy3NwhgiDpXUGEVZ1Sf2Xfjb+187itqX/YJS2H2iwiC3VIICKHK7yc2/Hd2jFjQ4Xo7RWdDZKfSe+9Z/5dWkItEp12Ad17jBN3THKjnuApa+qQtow3TcIhOLlN2tol3bGhPrGqv5iVuBfEUDjgelYSuBrpAeppCR1OxTsTuSdmLbkCd2xWT/tbLDOLalA31a0q51FnF58VwWITpRg/yRVLAzwIm9Jf/w9BVkHsP43H0Cpq3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQg2kVAQ/UBnCswUHj3GLICgMNPTRKpRChp8eE7X0z0=;
 b=EmnfRVFLJrEuJCJlNh8c6xQN/N1fAtXk8eCYwO6As9U/6ztaU3Vl8qJNkpg7/HBUUr9Wh9hXa0VMQS0S9908t3OqX095Z2j4wk2Q2P25jaq+Hc34OuWwjrhe87I2rFC24PvSucvV05lLwWRCmH5PC9tPNqQ4jsZJXX5KifdP8hk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 11 Feb 2026 18:35:18 +0100
Message-ID: <DGCBB98OUVTU.1771D50B4INHI@amd.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 03/12] x86: Add cpu_vendor() as a wrapper for the host's
 CPU vendor
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
 <20260206161539.209922-4-alejandro.garciavallejo@amd.com>
 <7eeb369d-04a9-4c17-983c-078e45b4679d@suse.com>
In-Reply-To: <7eeb369d-04a9-4c17-983c-078e45b4679d@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468A:EE_|BY5PR12MB4098:EE_
X-MS-Office365-Filtering-Correlation-Id: 14c946f9-3354-4ad6-f827-08de6993f132
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?enR1Tlh1NUxsSis4dE5Hc0IrOTVrWTFyRms1UDQ3UCt5TXpPY1NpczRiTzFX?=
 =?utf-8?B?aDFJT0c3T1k1ZlhUSmp1MkVlcDRRTlIwUTRUc2YyVWJuMXI3bU1oU08rZ0VT?=
 =?utf-8?B?RHprRWc0bVJUS2VnNFJGbGlaWElRNVk4QUsxN0JCM2NUWTFML1lhc2htazFO?=
 =?utf-8?B?MGVzUGZ2V3M4cGFLZkpyTTJTc2JpQ00vNnEvbHh3Tzh2S2NmNzVLQXFaM0xZ?=
 =?utf-8?B?N0RkWEs3czhCYjN2VC80cllRZGhyM3RMNmFFNnVkUHFNMFM5N3o2MkQ1Ujc0?=
 =?utf-8?B?RTRiOGthSHRscWdTNG9ZeVoxb3gyRFVydUNmNEthdXIxNUZGekZqNDhYYUNy?=
 =?utf-8?B?dGFYRTFhdjNFZklpRzN1KzMvWjlpNHhkdlh0b3gvSFFCZ0xROVZUandDTTlO?=
 =?utf-8?B?ZDJtVlZHbVV4bm5kbXo2bE1UMTVObk9KbXFQNUJzYkNiUGZKNFRvUDBUMjZz?=
 =?utf-8?B?VzlMVWFFL1kxRHJLN3VHSEJqd2lnY0pIdG0xY0w2cWs4aUY3UE52NEtaSUxM?=
 =?utf-8?B?RlZkZG1KK1pHdkloeUlsYzdBUFRxMU4wQjV4K054VjYrM2lJZXFtWEJZdmU3?=
 =?utf-8?B?SzJib3dlYTRzUjJzSzNncDNzSkRwNFIxOWJZajQ3Q1FQTmdpa1NoNDBRVjRn?=
 =?utf-8?B?VzU2ME1TejFraWVJZnArOGg2MFlPb3ZBZXY1a251SXdBYnVacEJzdUx1U2Jv?=
 =?utf-8?B?dXQ1MW10eGxaamZFaGdNSzdxdzEzNldiN3h0WG9JNlZXdnN4RzY0ZTBTaFNz?=
 =?utf-8?B?aHU5anh3MkFDODVlTWlmMU9uc2dBS3pmVTJUcU1tamQvQzdRQjB2THlUZU9F?=
 =?utf-8?B?KzJOYTkxZmpZc1ZmeDduK05xQ3BxcXJMek9KNWtrVmIwcHRRVmY3NlUvY0xQ?=
 =?utf-8?B?VzdXQ08yNWpwbjRHTW5aOE5UM2Z3VUtidlY2QzNPODdYTGhBOW9JR3ZSTXE2?=
 =?utf-8?B?NGRxenQ2MEJ1KzBIOUtiMWFQdlUvZ0p4RXlLZ084THZNajRZRnlUdWx3UVIv?=
 =?utf-8?B?enFGSkplZHZIb1RVQTlydXoyVVRJWk9lVTArdG85cEJHU08rNGxva0R6RlRh?=
 =?utf-8?B?NU9tbTNQM3R2bG1tcFIrRmJTQWp3S1UwY2kxN2U5czR6RExHUGJFRmxSdGxG?=
 =?utf-8?B?SzFlNHUwNEZ0QmRmMzZTZWl1MEp1dENXMTBrNGs2bXhhQnA3YWdUYy9oODFT?=
 =?utf-8?B?a1MyWWhPR0d1WUNldGxKUXVaaHFSMGIrTGRXSHpXK2FuZXUvT0ZtSUJ6KzV4?=
 =?utf-8?B?SCtYWExSeE1UVU45aFlUYklkU0FUNHFabTdyNWdSUkFxcDlId0NsZUhTV3J4?=
 =?utf-8?B?VkFLUFJzMUJ5K0hweHFPUEJXZEdMTHZwRWZQN3AzTjNudmwzQyt3cjJ5NzRB?=
 =?utf-8?B?Q093WjQ4bVIwQklWclpVclA5ZVFVeU15QUVJRDgvVnpyVktzblBqVS9BUnNI?=
 =?utf-8?B?MjhCY1QrL3JEUG96a1l6eGFvUGV1Wis1cmJsclN1VXFTL0w3M2IxdDZkZ25L?=
 =?utf-8?B?dW5Hb1oybVcxUDhhckQ4SVhYeGhmYmw2TWtJT3RSSC8vblBqT0t2KzhqUGZz?=
 =?utf-8?B?UXBVY0VKUzR2NkNuSkhQclc2MzA2WEptZkxESVE3cWJEZ3FPY2psd2xTZ2g1?=
 =?utf-8?B?STRYZW1pQ25TVVdJRVZZNE11NytPTEcvK2ZlZDliUzNOdmE3MEJsODdrUzJQ?=
 =?utf-8?B?dHdpNjJMNisybkZzNGlUVGtxZ3ZPWmV3a2RQVHQ4RHJXb1d5Zm9iZEVMTkY1?=
 =?utf-8?B?cGFUUjFHMHZiUk9VcHZKRFZRSCtEVEYydm1pelBvV3FaMzdlbWx1SlV2bW9L?=
 =?utf-8?B?TGdUNGFsREREZVExRGwySFA4a0ZjS2JsQmRuRWtIcFpaZGlzbHdBSURwWVNn?=
 =?utf-8?B?aHN5TGVDRVZKZjZVNFFvSmhBYllkQ3JtVWxsTEhFWGJYYy9rMTFXeFg4K3hK?=
 =?utf-8?B?aWhpc1NBMmRTcFJWampkcWFTMHlZNVFhNzBNRUJST1lJWUgvbHF0bXRDRE51?=
 =?utf-8?B?VENGb2FPdERyUUdGbFExdll2aE95Z0VoMitqamRKK2h6Y005Qm1pZkwxS1V2?=
 =?utf-8?B?TVVJU3lsVkdCQnFUT3JPeHVTK2lSTmIwTHFGbkJGZkFadFMwSjhrNndnZDFI?=
 =?utf-8?B?Ny9Uc0UrRUozVXlienFvRUtRcHBHYXZ4WlhlbW5HdktQWGxhVytxQWI1MFVw?=
 =?utf-8?B?VzdlQ3ozQ1c3U1FlSkdJYzZpNCthQzZHWFRNM0ZHK0VmbW83Ti83RDlTNUIx?=
 =?utf-8?B?d1FLTkJFR3A5eXFiSFllL1FGWER3PT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	60+g9tzT2chkD9t3UUPuxZLaqelDCqgbo7Qj1HaY+OEggt6LoUqZ6+bCTxPAftAGnEimU2IQRLlMObCSGhg8zb/YJp+wuG2a7bIwwAseexiC6w/6jZuxYtu5s7zST5raeFihFcWP/CnknHhcKNxpqkziPpY0tVLMAZxdC+4dChQU/ySFaPpsdRq17e+WGn6a6XUh8c4FIrcLvP+vLXi+Tfxafi5fQy0ppr1ZWPQOtHYJ09jk3NRafWDH6lLTdRCLri2omEgAOfT4fvf5MQaWgBCys87f+D32dsLto+PYkbSNXoy+y9Bs+wjgWGNLrpG2Zy1HZ7rq0hJUksl4BoAUpcE88D6sJ0eFHFtq3buatd7OVINYtXRGZT/uGw5IZtrCAGEUhiX9O6sUgXzNvNf4NNJOZaE5aEssrVt1MtdPB7Su6LE9UziGhjBIRejLwldP
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 17:35:26.0367
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14c946f9-3354-4ad6-f827-08de6993f132
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4098
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
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
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 619FD126A75
X-Rspamd-Action: no action

On Wed Feb 11, 2026 at 5:04 PM CET, Jan Beulich wrote:
> On 06.02.2026 17:15, Alejandro Vallejo wrote:
>> --- a/xen/arch/x86/cpu/common.c
>> +++ b/xen/arch/x86/cpu/common.c
>> @@ -328,7 +328,11 @@ void __init early_cpu_init(bool verbose)
>>  	*(u32 *)&c->x86_vendor_id[4] =3D edx;
>> =20
>>  	c->x86_vendor =3D x86_cpuid_lookup_vendor(ebx, ecx, edx);
>> -	switch (c->x86_vendor) {
>> +	if ( c->x86_vendor !=3D cpu_vendor() )
>
> When we introduce new functions to Linux-style files, nowadays we take
> the liberty and make them Xen-style right away. In entirely Linux-
> style functions the style should remain consistently Linux'es, though.
>

Seeing how I added the tabs I did intend to do that.

Muscle memory and all. Will correct on the next one.

>> +		panic("CPU vendor not compiled-in: %s",
>> +		      x86_cpuid_vendor_to_str(c->x86_vendor));
>
> This will be somewhat awkward when c->x86_vendor is UNKNOWN.

Which only happens on virtualised or imaginary CPUs. In either case you kno=
w
what you're running on and the information is not particularly useful. The
important part is the "this hypervisor cannot run on your vendor. Enable it
there".

>
> There'll also be a degenerate case, but I'll comment on that on the
> earlier patch causing that.
>
>> --- a/xen/arch/x86/include/asm/cpufeature.h
>> +++ b/xen/arch/x86/include/asm/cpufeature.h
>> @@ -14,6 +14,7 @@
>>  #include <asm/cpu-policy.h>
>>  #include <asm/cpuid.h>
>>  #include <xen/lib/x86/cpu-policy.h>
>> +#include <asm/x86-vendors.h>
>
> Nit: Can the asm/-s please all stay together?

Sure, I didn't notice the xen/ because of the lack of a blank line.

>
> Jan


