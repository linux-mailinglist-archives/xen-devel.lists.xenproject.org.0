Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DfsJkALcWmPcQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 18:22:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF515A74A
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 18:22:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210048.1521890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vibtz-0002jM-SS; Wed, 21 Jan 2026 17:21:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210048.1521890; Wed, 21 Jan 2026 17:21:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vibtz-0002gk-Pq; Wed, 21 Jan 2026 17:21:55 +0000
Received: by outflank-mailman (input) for mailman id 1210048;
 Wed, 21 Jan 2026 17:21:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rso8=72=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vibty-0002gc-2R
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 17:21:54 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aaa4120f-f6ed-11f0-9ccf-f158ae23cfc8;
 Wed, 21 Jan 2026 18:21:49 +0100 (CET)
Received: from SA9PR13CA0163.namprd13.prod.outlook.com (2603:10b6:806:28::18)
 by MN2PR12MB4334.namprd12.prod.outlook.com (2603:10b6:208:1d1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Wed, 21 Jan
 2026 17:21:40 +0000
Received: from SA2PEPF00003F64.namprd04.prod.outlook.com
 (2603:10b6:806:28:cafe::d) by SA9PR13CA0163.outlook.office365.com
 (2603:10b6:806:28::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.5 via Frontend Transport; Wed,
 21 Jan 2026 17:21:40 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003F64.mail.protection.outlook.com (10.167.248.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 17:21:40 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 21 Jan
 2026 11:21:39 -0600
Received: from [172.23.120.160] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 21 Jan 2026 09:21:39 -0800
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
X-Inumbo-ID: aaa4120f-f6ed-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iEBLTQdLaZzI0i1ut6Fx4yJ9s7Tk88mZHKX9kXeXizDcHMFsF8R26SvsS3153g3M2ngVO5QuBNmQQZOuyUVBi6S0W9Av12F8jQVOzcNftOtvP2siuAfAYJM+sq3mbNWAJU61hXZd3WejnzxOKbWSBPcXdygrBWFoPmyMEQTr3stnifljDCAk0KZTEOjXxs6bwUWUXyXtugWKud+iSTsS9llyyYS9v2hH1DA7njjFu+coE6+fDfSC9GB5druKKTHgiNgOWzS7qVdATntHrAGrJ7b1cwhVN1TKQOkgmV20RbfxXSbnLdivR0ZaUihVGWH5mDetWJRUJqgxsfg2xeqMEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K2PBgN1DZxFQMsLGYC42x1npEsrXcOCJE54+BbmokI4=;
 b=F8VO/MhqnP6SZZO+yNzl89PgqSCxgqwEv6NDTw6WA+TLIV3aGiSF4TljaliSSYE/TLh2ZzrMei2WgzLg/SypxWJczSUITAs5v/HbThXpBDcEehEmITdkcvOHPfwUraAnvB4Z/JWQUrfpCt1c3aDpSobf6NjrXt+AHu8YlY125jTrpOr9KTRg1OHDkRps5GDFm1ylfKs4ArEvswMvahi5gS6ZDyDoHxA8rvqpzHxdYCj4ZxTw5d7XLOScUJ6fKqoYHT4NI3GRAkgHMl5iHhK/8JCpGieHlYnTOT3RlV+fmwoKxvpeYhErjJ0WODlFlbqLewis1rHKeHNmnUXOo5aZUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2PBgN1DZxFQMsLGYC42x1npEsrXcOCJE54+BbmokI4=;
 b=dGK8EDgO2xcHfW4qdrl9odzpLGO3ZFWlOzg3fq/KQeOEZObzOL1C4szHyW95v00eCm5TEob9rR36j9OwnZLzR1DHA4FVqD2T7lQEr6Y2wh2wWgoi2BSDMie3iidajyucFgtIclOqz9G0t96gUtEujcWCcL/hUIcqBzEQiUsvwWQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Content-Type: multipart/mixed;
	boundary="------------3R2aBtpkKtA2sevLQ5GxD4pB"
Message-ID: <d6e91265-b045-4257-8a41-6cb77a785924@amd.com>
Date: Wed, 21 Jan 2026 12:21:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Partial revert "x86/xen: fix balloon target
 initialization for PVH dom0"
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>, James
 Dingwall <james@dingwall.me.uk>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>
References: <20260120140648.25977-1-roger.pau@citrix.com>
 <b515af46-87f9-49eb-9d05-08315b25eb96@amd.com> <aXC1sFjIRUEB7qOW@Mac.lan>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <aXC1sFjIRUEB7qOW@Mac.lan>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F64:EE_|MN2PR12MB4334:EE_
X-MS-Office365-Filtering-Correlation-Id: b75fe344-7d49-4cd6-58d4-08de59118a4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|4013099003|4053099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NGRJSHVPQ0Q1MHN5MVpXdENUMWl1dXhSRE5DTWthaGgwdkVGQnIxcnpmdkJQ?=
 =?utf-8?B?OXJpNW9pVUVNYlRYQjlnWmQ0cGRoMWVRNXBQeVBFWE9lZk1mMDV6eDVuQktz?=
 =?utf-8?B?Q25OVnJRM3A4ZEtUV2dwMkxRM1A1RnhnUTVPR0RoT2FwRFlkYktBV1o0dHZM?=
 =?utf-8?B?WmQ3WHBld1E3KzJxTmJHVWlsZWRUS2JVVFltM1U1dWM3QnNWd2xnMTlKWjNu?=
 =?utf-8?B?SkI4V0QzVFZIZllzcVl1Y3ZEa3pNei9QWFVhbGxrakZlZW5jdGZxdFZxRjFp?=
 =?utf-8?B?Y1IxTDlkRDR3VStxTDEyTFZ1LzVzaW83a3FjWHkyZkVmTk9vRXMzWnlsZmFC?=
 =?utf-8?B?MVJJR2pVYTJnbkEyTUpMVEJta29vN1F3dTc4WjVPZStvdmtKMjBoL2Z5TGFZ?=
 =?utf-8?B?MnlYZEI0bDczVDl5T2JEQjZzMitNTWxHbDNNL2w4OVJwK3B4UWFoMU9obExU?=
 =?utf-8?B?VDY5cWN2dnY4cGdsdXUzVnRMMWJxdlpoMzJTUE40b3hPM0ZyMjZpMWdEeVQv?=
 =?utf-8?B?NlpjSEEyNG1GbFNWVVJ4L0RScUtIcTI3QzZrbFZQcDNWWGo2VWxUWWtlOHVu?=
 =?utf-8?B?OGNnelFRZHRGU2ZiWnlURmt1bk4ydmVFTmdQNFNmSHdpSkkrb1ByWnE4eXlE?=
 =?utf-8?B?bW8rb1NFVHlmWkJoRG41dmlyNHJpdWZJZVNiNDRsNmIxMU5Cenc1SjBLSXhy?=
 =?utf-8?B?emxnREQzVnB2bTFIZUpUek81eWdleTA4Nzg2bmlHSFZhL29xR2Q4NENCSVZH?=
 =?utf-8?B?OERsNis2Z3ZuY3VoQ2NhbnhoVDJoSzNKZ2Z0aUlVaXRWaU9SNEJNY2dWZXFh?=
 =?utf-8?B?dFRtd1R4cEd0aVd5SHlmM0dJWTk0TkQ5NnZSaDZrU2xVQnNkbWlySE02ZDcr?=
 =?utf-8?B?cG1WSDFrYnJid1lpaDVQMTVTQXNoejV3MGJRbFkyOFVqQk9sUGpNN3BRZWRj?=
 =?utf-8?B?QWVleXVjM3pxYm1jcTZjNkVJajA1anJFZ0RpQklLMmowQldtVDlkckZKZ2NP?=
 =?utf-8?B?dkFBVXVKZHY1MFdOVFBJQldLR2VVbXY1by9UNmttQWFMUXBSMU1xZFBvdGRP?=
 =?utf-8?B?RjM4bWJLS1hZcko2ejZ2Z3pXSXRmKzFmNFhzTFNGVzRHYURkMmt4OXRTa2J1?=
 =?utf-8?B?eGY4VVlMK2NIYW1Ub0lGQ0JrNDlQR09lUVIwKzY1d29LcnVGZUpMbUNvdm1Z?=
 =?utf-8?B?NWEwU21LcDhWVzNGbEdxK0pUZUdBVHFSdHdTTXZVcmR3anBwa1hRV29PWkxZ?=
 =?utf-8?B?VEJvbUg3WVVDSnNCc2RCRXEzWDdHR20vc3FZRm15N3Y4Q0dxbnEwV2xvQWJF?=
 =?utf-8?B?N25QMmh5NmdnNlgvVGxUakF1Vm5jNHQ1RnVYUmFqODZNL3MzVDdZL1Uya1dX?=
 =?utf-8?B?WFV5cEI2b3JBcTRPOGRZUUFoRVFSVG9YT0luUk1yMmpMcVBGR2VZaHMyVGkr?=
 =?utf-8?B?Nm1FOHU0MGVxNjZkQks1NFhpMnFsNjgrT256bFRBSXBRVTJ3T0d4dVFHMXJD?=
 =?utf-8?B?VHJ1dTA1Q09LU1NmUEQrM3EvbzBsRzVhOEtTZnZUKzYwMG1kSjVsbmduU2s0?=
 =?utf-8?B?SmY2SGdaZXh2ZDVqZmlIQ1ZWRWZITGFSQmxWNVhVaGZQRThmYkZCWVVuYzE0?=
 =?utf-8?B?cWZ5Uk8yOVhTaXdxL0JJaVQzb2c0T2dMQjdGeTNycnZTYW84a01HM2l1Q0gz?=
 =?utf-8?B?SUl1RGdKNGlvd0lUdDhHUGNJYzh6bjgvNFZPOTNVeWFqemFtdTlxUjkyY0VE?=
 =?utf-8?B?aXBYWWNGRDMxTlpPMkNnVEJGNk5VRkNYeWpiQnlKL1R4ejgyYy9Ubm43cGQ3?=
 =?utf-8?B?ckRORjBhNStaVzlxb3hBRFZ5V1F5K0R5eEpnS1RKeHFYNE5QYTA4U0VBRXJo?=
 =?utf-8?B?MWNMcVdGbjZSMnpCbkoyN2pJN0tHUHBWdHlSdlp6VG41YkJaTUVsN2dUTk94?=
 =?utf-8?B?UFdiRW14WkVkS1ZGRFJXMllsYmc4VEl0VFJxSjNlK1F5OS9oTkNkUG41SERM?=
 =?utf-8?B?R1hFOFlySEZCSUxVNGtjTmV6UWE1a0NBM0gvN3RuT09xMTBxOXpsdHcyOXFN?=
 =?utf-8?B?QlZiMitwTVJiWE9oS1J3U3ZnbWgyU1hZelNCMis4Y1lKTmJOZzAxNmxvdGRl?=
 =?utf-8?B?emF2M0k5TGFpYmkyM0Z2dndHdWFzaUxpSE1IemFtRDM1amdURytaQnNmQXdX?=
 =?utf-8?B?VzNzUnZRN2ZXMEJ5MmUxTkdxOENkNXYwczV6R2dabkhQVForMWJENXZpV2hW?=
 =?utf-8?B?MzhaMGhRc20rWG5mTTY4RkZiVUdnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(4013099003)(4053099003)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 17:21:40.2334
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b75fe344-7d49-4cd6-58d4-08de59118a4f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4334
X-Spamd-Result: default: False [-1.09 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain,text/x-patch];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:james@dingwall.me.uk,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+,2:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,amd.com:email,amd.com:dkim,amd.com:mid,citrix.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: DDF515A74A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--------------3R2aBtpkKtA2sevLQ5GxD4pB
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2026-01-21 06:17, Roger Pau Monné wrote:
> On Tue, Jan 20, 2026 at 03:10:06PM -0500, Jason Andryuk wrote:
>> On 2026-01-20 09:06, Roger Pau Monne wrote:
>>> This partially reverts commit 87af633689ce16ddb166c80f32b120e50b1295de so
>>> the current memory target for PV guests is still fetched from
>>> start_info->nr_pages, which matches exactly what the toolstack sets the
>>> initial memory target to.
>>>
>>> Using get_num_physpages() is possible on PV also, but needs adjusting to
>>> take into account the ISA hole and the PFN at 0 not considered usable
>>> memory depite being populated, and hence would need extra adjustments.
>>> Instead of carrying those extra adjustments switch back to the previous
>>> code.  That leaves Linux with a difference in how current memory target is
>>> obtained for HVM vs PV, but that's better than adding extra logic just for
>>> PV.
>>>
>>> Also, for HVM the target is not (and has never been) accurately calculated,
>>> as in that case part of what starts as guest memory is reused by hvmloader
>>> and possibly other firmware to store ACPI tables and similar firmware
>>> information, thus the memory is no longer being reported as RAM in the
>>> memory map.
>>>
>>> Reported-by: James Dingwall <james@dingwall.me.uk>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> Thanks.
> 
> I've been considering what we discussed and as a separate follow up we
> might want to attempt to switch to using `XENMEM_current_reservation`
> for dom0?  It might make the accounting in PVH dom0 better, as that's
> what the toolstack uses to set the xenstore target when initializing
> dom0 values.

Yes, I thought that could be a follow on.  I've attached what I have 
tested, but it is based on a branch pre-dating xen_released_pages. 
xenmem_current_reservation with PVH dom0 seemed good without the 
xen_released_pages adjustment, but I don't know what that would be for a 
PVH dom0.

Regards,
Jason
--------------3R2aBtpkKtA2sevLQ5GxD4pB
Content-Type: text/x-patch; charset="UTF-8";
	name="0001-xen-balloon-Initialize-dom0-with-XENMEM_current_rese.patch"
Content-Disposition: attachment;
	filename*0="0001-xen-balloon-Initialize-dom0-with-XENMEM_current_rese.pa";
	filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSA4YjYyOGFkMGViZTUyYzMwZTMxMjk4ZTg2OGYyZjUxODdmMmY1MmRhIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBKYXNvbiBBbmRyeXVrIDxqYXNvbi5hbmRyeXVrQGFt
ZC5jb20+CkRhdGU6IEZyaSwgNyBOb3YgMjAyNSAxNjo0NDo1MyAtMDUwMApTdWJqZWN0OiBb
UEFUQ0hdIHhlbi9iYWxsb29uOiBJbml0aWFsaXplIGRvbTAgd2l0aCBYRU5NRU1fY3VycmVu
dF9yZXNlcnZhdGlvbgoKVGhlIGJhbGxvb24gZHJpdmVyIGJhc2VzIGl0cyBhY3Rpb24gb2Zm
IHRoZSBtZW1vcnkvdGFyZ2V0IGFuZAptZW1vcnkvc3RhdGljLW1heCB4ZW5zdG9yZSBrZXlz
LiAgVGhlc2UgYXJlIHNldCBieSB0aGUgdG9vbHN0YWNrIGFuZAptYXRjaCB0aGUgZG9tYWlu
J3MgaHlwZXJ2aXNvciBhbGxvY2F0ZWQgcGFnZXMgLSBkb21haW5fdG90X3BhZ2VzKCkuCgpI
b3dldmVyLCBQVkggYW5kIEhWTSBkb21haW5zIHF1ZXJ5IGdldF9udW1fcGh5c3BhZ2VzKCkg
Zm9yIHRoZSBpbml0aWFsCmJhbGxvb24gZHJpdmVyIGN1cnJlbnQgYW5kIHRhcmdldCBwYWdl
cy4gIGdldF9udW1fcGh5c3BhZ2VzKCkgaXMgZGlmZmVyZW50CmZyb20gZG9tX3RvdGFpbl9w
YWdlcygpLCBhbmQgaGFzIGJlZW4gb2JzZXJ2ZWQgd2F5IG9mZiBpbiBhIFBWSCBkb20wLgpI
ZXJlIGEgUFZIIGRvbTAgaXMgYXNzaWduZWQgOTE3NTAzIHBhZ2VzICgzLjVHQiksIGJ1dApn
ZXRfbnVtX3BoeXNwYWdlcygpIGlzIDczMTI0NTU6CnhlbjpiYWxsb29uOiBwYWdlcyBjdXJy
IDczMTI0NTUgdGFyZ2V0IDczMTI0NTUKeGVuOmJhbGxvb246IGN1cnJlbnRfcmVzZXJ2YXRp
b24gOTE3NTAzCgpXaGlsZSBYZW4gdHJ1bmNhdGVkIHRoZSBQVkggZG9tMCBtZW1vcnkgbWFw
J3MgUkFNLCBMaW51eCB1bmRvZXMgdGhhdApvcGVyYXRpb24gYW5kIHJlc3RvcmVzIFJBTSBy
ZWdpb25zIGluIHB2aF9yZXNlcnZlX2V4dHJhX21lbW9yeSgpLgoKVXNlIFhFTk1FTV9jdXJy
ZW50X3JldmVyYXRpb24gdG8gaW5pdGlhbGl6ZSB0aGUgYmFsbG9vbiBkcml2ZXIgY3VycmVu
dAphbmQgdGFyZ2V0IHBhZ2VzLiAgVGhpcyBpcyB0aGUgaHlwZXJ2aXNvciB2YWx1ZSwgYW5k
IG1hdGNoZXMgd2hhdCB0aGUKdG9vbHN0YWNrIHdyaXRlcy4gIFRoaXMgYXZvaWRzIGFueSBi
YWxsb29uaW5nIGZyb20gdGhlIGluaXRhbAphbGxvY2F0aW9uLiAgV2hpbGUgZG9tVXMgYXJl
IGFmZmVjdGVkLCB0aGUgaW1wbGljYXRpb25zIG9mIHRoZSBjaGFuZ2UKYXJlIHVuY2xlYXIg
LSBvbmx5IG1ha2UgdGhlIGNoYW5nZSBmb3IgZG9tMC4KClNpZ25lZC1vZmYtYnk6IEphc29u
IEFuZHJ5dWsgPGphc29uLmFuZHJ5dWtAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL3hlbi9iYWxs
b29uLmMgICAgICAgICAgfCA5ICsrKysrKy0tLQogZHJpdmVycy94ZW4vbWVtLXJlc2VydmF0
aW9uLmMgIHwgOCArKysrKysrKwogaW5jbHVkZS94ZW4vaW50ZXJmYWNlL21lbW9yeS5oIHwg
NSArKysrKwogaW5jbHVkZS94ZW4vbWVtLXJlc2VydmF0aW9uLmggIHwgMiArKwogNCBmaWxl
cyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMveGVuL2JhbGxvb24uYyBiL2RyaXZlcnMveGVuL2JhbGxvb24uYwppbmRl
eCA1MjgzOTUxMzNiNGYuLmZhNmNiZTZjZTJjYSAxMDA2NDQKLS0tIGEvZHJpdmVycy94ZW4v
YmFsbG9vbi5jCisrKyBiL2RyaXZlcnMveGVuL2JhbGxvb24uYwpAQCAtNzEzLDEwICs3MTMs
MTMgQEAgc3RhdGljIGludCBfX2luaXQgYmFsbG9vbl9pbml0KHZvaWQpCiAKICNpZmRlZiBD
T05GSUdfWEVOX1BWCiAJYmFsbG9vbl9zdGF0cy5jdXJyZW50X3BhZ2VzID0geGVuX3B2X2Rv
bWFpbigpCi0JCT8gbWluKHhlbl9zdGFydF9pbmZvLT5ucl9wYWdlcyAtIHhlbl9yZWxlYXNl
ZF9wYWdlcywgbWF4X3BmbikKLQkJOiBnZXRfbnVtX3BoeXNwYWdlcygpOworCQk/IG1pbih4
ZW5fc3RhcnRfaW5mby0+bnJfcGFnZXMgLSB4ZW5fcmVsZWFzZWRfcGFnZXMsIG1heF9wZm4p
IDoKKwkJeGVuX2luaXRpYWxfZG9tYWluKCkgPyB4ZW5tZW1fY3VycmVudF9yZXNlcnZhdGlv
bigpIDoKKwkJCQkgICAgICAgZ2V0X251bV9waHlzcGFnZXMoKTsKICNlbHNlCi0JYmFsbG9v
bl9zdGF0cy5jdXJyZW50X3BhZ2VzID0gZ2V0X251bV9waHlzcGFnZXMoKTsKKwliYWxsb29u
X3N0YXRzLmN1cnJlbnRfcGFnZXMgPQorCQl4ZW5faW5pdGlhbF9kb21haW4oKSA/IHhlbm1l
bV9jdXJyZW50X3Jlc2VydmF0aW9uKCkgOgorCQkJCSAgICAgICBnZXRfbnVtX3BoeXNwYWdl
cygpOwogI2VuZGlmCiAJYmFsbG9vbl9zdGF0cy50YXJnZXRfcGFnZXMgID0gYmFsbG9vbl9z
dGF0cy5jdXJyZW50X3BhZ2VzOwogCWJhbGxvb25fc3RhdHMuYmFsbG9vbl9sb3cgICA9IDA7
CmRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi9tZW0tcmVzZXJ2YXRpb24uYyBiL2RyaXZlcnMv
eGVuL21lbS1yZXNlcnZhdGlvbi5jCmluZGV4IDI0NjQ4ODM2ZTBkNC4uNDBjNWM0MGQzNGZl
IDEwMDY0NAotLS0gYS9kcml2ZXJzL3hlbi9tZW0tcmVzZXJ2YXRpb24uYworKysgYi9kcml2
ZXJzL3hlbi9tZW0tcmVzZXJ2YXRpb24uYwpAQCAtMTEzLDMgKzExMywxMSBAQCBpbnQgeGVu
bWVtX3Jlc2VydmF0aW9uX2RlY3JlYXNlKGludCBjb3VudCwgeGVuX3Bmbl90ICpmcmFtZXMp
CiAJcmV0dXJuIEhZUEVSVklTT1JfbWVtb3J5X29wKFhFTk1FTV9kZWNyZWFzZV9yZXNlcnZh
dGlvbiwgJnJlc2VydmF0aW9uKTsKIH0KIEVYUE9SVF9TWU1CT0xfR1BMKHhlbm1lbV9yZXNl
cnZhdGlvbl9kZWNyZWFzZSk7CisKK2xvbmcgeGVubWVtX2N1cnJlbnRfcmVzZXJ2YXRpb24o
dm9pZCkKK3sKKwlzdHJ1Y3QgeGVuX21lbW9yeV9kb21haW4gZG9tYWluID0geyAuZG9taWQg
PSBET01JRF9TRUxGIH07CisKKwlyZXR1cm4gSFlQRVJWSVNPUl9tZW1vcnlfb3AoWEVOTUVN
X2N1cnJlbnRfcmVzZXJ2YXRpb24sICZkb21haW4pOworfQorRVhQT1JUX1NZTUJPTF9HUEwo
eGVubWVtX2N1cnJlbnRfcmVzZXJ2YXRpb24pOwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS94ZW4v
aW50ZXJmYWNlL21lbW9yeS5oIGIvaW5jbHVkZS94ZW4vaW50ZXJmYWNlL21lbW9yeS5oCmlu
ZGV4IDFhMzcxYTgyNWM1NS4uNzI2MTlhNzVmZWQyIDEwMDY0NAotLS0gYS9pbmNsdWRlL3hl
bi9pbnRlcmZhY2UvbWVtb3J5LmgKKysrIGIvaW5jbHVkZS94ZW4vaW50ZXJmYWNlL21lbW9y
eS5oCkBAIC0xMDQsNiArMTA0LDExIEBAIERFRklORV9HVUVTVF9IQU5ETEVfU1RSVUNUKHhl
bl9tZW1vcnlfZXhjaGFuZ2UpOwogICovCiAjZGVmaW5lIFhFTk1FTV9tYXhpbXVtX3JhbV9w
YWdlICAgICAyCiAKK3N0cnVjdCB4ZW5fbWVtb3J5X2RvbWFpbiB7CisgICAgLyogW0lOXSBE
b21haW4gaW5mb3JtYXRpb24gaXMgYmVpbmcgcXVlcmllZCBmb3IuICovCisgICAgZG9taWRf
dCBkb21pZDsKK307CisKIC8qCiAgKiBSZXR1cm5zIHRoZSBjdXJyZW50IG9yIG1heGltdW0g
bWVtb3J5IHJlc2VydmF0aW9uLCBpbiBwYWdlcywgb2YgdGhlCiAgKiBzcGVjaWZpZWQgZG9t
YWluIChtYXkgYmUgRE9NSURfU0VMRikuIFJldHVybnMgLXZlIGVycmNvZGUgb24gZmFpbHVy
ZS4KZGlmZiAtLWdpdCBhL2luY2x1ZGUveGVuL21lbS1yZXNlcnZhdGlvbi5oIGIvaW5jbHVk
ZS94ZW4vbWVtLXJlc2VydmF0aW9uLmgKaW5kZXggYTJhYjUxNmZjZDJjLi5lODZmMGRjZDdi
N2YgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUveGVuL21lbS1yZXNlcnZhdGlvbi5oCisrKyBiL2lu
Y2x1ZGUveGVuL21lbS1yZXNlcnZhdGlvbi5oCkBAIC01Nyw0ICs1Nyw2IEBAIGludCB4ZW5t
ZW1fcmVzZXJ2YXRpb25faW5jcmVhc2UoaW50IGNvdW50LCB4ZW5fcGZuX3QgKmZyYW1lcyk7
CiAKIGludCB4ZW5tZW1fcmVzZXJ2YXRpb25fZGVjcmVhc2UoaW50IGNvdW50LCB4ZW5fcGZu
X3QgKmZyYW1lcyk7CiAKK2xvbmcgeGVubWVtX2N1cnJlbnRfcmVzZXJ2YXRpb24odm9pZCk7
CisKICNlbmRpZgotLSAKMi41Mi4wCgo=

--------------3R2aBtpkKtA2sevLQ5GxD4pB--

