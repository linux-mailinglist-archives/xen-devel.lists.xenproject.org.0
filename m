Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMcVNpVYcmkpiwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 18:04:21 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 517256AAFB
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 18:04:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211600.1523109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viy6K-0005Wu-99; Thu, 22 Jan 2026 17:04:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211600.1523109; Thu, 22 Jan 2026 17:04:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viy6K-0005Ux-6H; Thu, 22 Jan 2026 17:04:08 +0000
Received: by outflank-mailman (input) for mailman id 1211600;
 Thu, 22 Jan 2026 17:04:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XQsG=73=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1viy6I-0005Up-FU
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 17:04:06 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59f9ff25-f7b4-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 18:04:03 +0100 (CET)
Received: from BY3PR04CA0002.namprd04.prod.outlook.com (2603:10b6:a03:217::7)
 by CY5PR12MB6598.namprd12.prod.outlook.com (2603:10b6:930:42::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.8; Thu, 22 Jan
 2026 17:03:55 +0000
Received: from BY1PEPF0001AE17.namprd04.prod.outlook.com
 (2603:10b6:a03:217:cafe::81) by BY3PR04CA0002.outlook.office365.com
 (2603:10b6:a03:217::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Thu,
 22 Jan 2026 17:03:37 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE17.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 17:03:51 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 22 Jan
 2026 11:03:51 -0600
Received: from [172.23.120.160] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 22 Jan 2026 11:03:50 -0600
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
X-Inumbo-ID: 59f9ff25-f7b4-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ohvXfhrQC2VdVKxyVNAix/KsOmxd8/ZIwQkpU4pPaV7yXiSwa21rJOYD4RMP9Fm5DFsZ31C8FYb2+nnfNrKcoQquZzg+9OL6nJ9a7pUfWOOUmrimS0e9kCuI5YvjFnyyq6cTxMoGoQu7j4a+RYLlOAiUfvBeGljDKi58gYEQ5GjK0vNbr0iyWBY2XrPhFP+qucgYfetmxwWNPL3ivWU9Hdzj/z7qP0ZOYD4tASJSVJrxaUSNRq7nkfU6p2rMbweAJSI3QcuxxaOG/pVZBfZjFZ0awDkY0oBPuUTaDpxM254t1b17EumEq7cmk9/YdXOB4HmeieI9x5E53CitpaSUcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YXIK/3D4yTLUJgAeKxFe8bdxIid2/wGTCuYP5+LSRUk=;
 b=Fja7NWduJ2Kk8aAzF1ARFmM8F3p+Uif1lshVjAzzUzNZAXPzD7b0KUzJAADqAnofSWtkUIiIOzAV+sHHmYGHDmtfEKzbrjUQsy7yFOlabWXREfgqZJsv1OgQXemmik9sR6+yyLC2wYvcvfX0rUwUuZ1hOf30FhApFRVEsINKCp+NFENRaA8LS68RHBs3Ly32xyG9iJXnVA8INpicbr4+o7oAER3zwLVazO+Gt5b9yrh93nt4M4+BqpLtCBkVfK9KvQ7Xq4Axg10MYKIr6QotkxvyrtyFEALsUXAc/OfcdFQJRiUGF1Kfd61jTO50mDNe4x4CcSg9d8qoDngMxEOp8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YXIK/3D4yTLUJgAeKxFe8bdxIid2/wGTCuYP5+LSRUk=;
 b=sJ/FHh4/whQrtbB5cfmYnbN6fOIcYhJnqBgk09+qbWLHiGEvWe6yf9owH304KOktfvVbxrhgEy7zCLF9142Bqet4vkj5SUcerPYiukj9xJRHFB6zMO4d+qjsAjvdetoUDQNgpPf740wcVWMQvkrri9LIRA1xQibzNeJq6nEwB9s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <1357dda0-bb5d-4f59-a53c-d584099bf65c@amd.com>
Date: Thu, 22 Jan 2026 12:03:47 -0500
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
 <d6e91265-b045-4257-8a41-6cb77a785924@amd.com> <aXERjdPS3KlcD3C-@Mac.lan>
 <a72553d1-3d79-4314-aa41-11a09dc60089@amd.com> <aXJW-9Ken2pbkCsm@Mac.lan>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <aXJW-9Ken2pbkCsm@Mac.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE17:EE_|CY5PR12MB6598:EE_
X-MS-Office365-Filtering-Correlation-Id: cb57eabf-221a-40ca-f1c1-08de59d837da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RnhTVW5LR0RheWpEb0M0UVA4TW1IckJxdzBLQ0k1aU9wVmJmdGJSVHdJZ0ww?=
 =?utf-8?B?b1p5WGN0aFVaclEwY2gxcDhTTDBkTEQrSFN6dEVzUWowdVdMOERjemJPNGxK?=
 =?utf-8?B?bkZyRCtkeTBicEdYeGRsZmJQTlVTdkp3b3pBMGFrUEdDWVV5MVJnMmx3eDZa?=
 =?utf-8?B?YXlOODNrWjdXNkFhQTI4dlNQM1AxTHMwaktCVzQxb0lVWkhnMzBWa09lSDF0?=
 =?utf-8?B?SmJlQlIrU2l6L1ZiTytya0tvb0J6ZG1QY1hjYXlmR1hSRG5ZMzBZNndsandi?=
 =?utf-8?B?dVFpbVNFTHNwbHZvcFh6eWxBTW9pQThSYnN5dExjSFZya01ZKzhuc1NFTEVh?=
 =?utf-8?B?ZHVZeTFhcjdCNDBibllnNm0vQUpvMUlKRmU0Zk5lYWs2NEtuaW4zKzkvSXVq?=
 =?utf-8?B?dnFZVk0wcitkQmwrZFpoL2lCcVp4TW5JTk1JN0Y3ZFJDbVFnWTduTGt6dW5O?=
 =?utf-8?B?NmpmUEYyNU5tTHVtMGNvVGtTOXJ3MzJWRDN1bDhoeGhUUUVleGVhcjhoWFVD?=
 =?utf-8?B?VlBsMkUxZWVVRVFMTi9TNFZTQWtaUXZkWWNaVGtXZUpsb3ZIRVE1dWZZbWhu?=
 =?utf-8?B?ekswWldDZ1lKYlc5czc5Y09MLzV0UGdUN1JKSmlTM3dLSFZsUEpDM1ZYdnVG?=
 =?utf-8?B?UmMrZDBhTTkrcjRoTlZsT3A3VVFCcTN6R0FJTGJwdmxhQjkvcHlGOWRXTXRM?=
 =?utf-8?B?cC9oVnNOaEgxM1ErdWZtOVBMa1ZzeTRkSTlNWkkySDF0SGhhT3oxQzFNTTIz?=
 =?utf-8?B?WVVvSGFIL3hFS3BtWHNPWCtQalZNZnhQUGE1Wm5mM200QkFPTy9IYmkrcUx3?=
 =?utf-8?B?QUdlYnFpb3RaOUxLMHZuTHRLbmxnQ1A4YUR3WDl4UDR1UWU0VG9JTVFEbmJy?=
 =?utf-8?B?bVU4U3VoTFFaUG5Td1IzSGtobU9ockZQZVNoNytpbXZmVldkV0FVK1ZFVHlu?=
 =?utf-8?B?cjZWS0pIR0JTa3I2dDBtY2d3YURNc0M2NGd3S21NSDFrRWNhRkRJOWRYbEFk?=
 =?utf-8?B?aW05WnNaa0V3Zzl6SHZ6LzJXeXROZCtYS3F4Q1BZaEZYOU80S0V5RWM0MHlx?=
 =?utf-8?B?K21YRWc5N09DS2ZkS3RSbUpDRnpIYURsS3J4MlNmRzh3ZHdmcVoxVjQ3Ry9r?=
 =?utf-8?B?Wmo3RCtpaklIN0F0ZDg3c0NabWZpd1pYYUp6Zzd2aU9TVllKb3FvUEtXRWdF?=
 =?utf-8?B?d2hJUjViMDVwMUFLdVBUTnJwUXkvek1xdEY4NnF6bFBsQUVxM0VFb3NOTGtY?=
 =?utf-8?B?QjA5S21zWWcvb0hmZ1U2bUpsa0ZCdzdVWkhiYWprYXA2dVY4TFRoV2hBTmVL?=
 =?utf-8?B?QVo5RE1DTXBQZTFyaWxRYzZmcDlUVHN4aHJyTitKb20wMjB3NXd2NHhETlhq?=
 =?utf-8?B?V1RmUmttVW9QVXN6MWV4OHFvOTZrZ3JBYi92YmF3d3JRVVh5RVp1R2FacE01?=
 =?utf-8?B?NDJSK3Flb1ZPemkyaU4vOUZGYzVXKzF6c3FVNU1zY1cwYUpvKzhLL1M0bmNl?=
 =?utf-8?B?bmg5eWVaSVZiTTRxMlNvdFJ0SzdkR1U0dGcrZW4zNnRsODNwMWR0ZU4wYnlD?=
 =?utf-8?B?Q2Ntb2pEZTRCMnFFWmtFakllL0tMZ2lGcWFTQkV3bU9Vc2t1eG1WOGJ6MDlj?=
 =?utf-8?B?cHJ5L1ExalpoTHN6Ti9BYWd3STlEQTZHL013N0Z4VGlTaDAweEF4VDdRdEFL?=
 =?utf-8?B?Y3NIaVBVdnBLeUtrUW5lU0swbGhnelFYT3RvS0dUSHYwNXdtdCtpWHdTbTRL?=
 =?utf-8?B?Z21Tb1NVMUJFTlRodzJxK3RNY2tOYm5iczdwSTF1dXlBZ0VWRUpoWTJTcUdt?=
 =?utf-8?B?cytjb1pZZzltT05hN0FMNmVFUjFtdi9MSm93cFVpUmcyOVdmazRFYlkrQnEw?=
 =?utf-8?B?U2k5alIrcTF3WUNPWldtZHJMa2VXeTFkdzR4OW5qY0pSRXJ1TlBlS28wZEh1?=
 =?utf-8?B?b0paK0JNenMrOTFIdmQ4clkzaHJpSzlsZnJ3RkVoNDlNZ1JQKzZTajM2UHly?=
 =?utf-8?B?VFk2WUVRY0hqSFNKc09QUVlCMkVlSW80VW44LzFqNjZQdE4rMGM1cFhKaVdE?=
 =?utf-8?B?TjlhZW5rWGhobG9ORGdEZ2hhbHZNeEorbUR1T2FUTEZTVjV0OHhBL1VPeU1a?=
 =?utf-8?B?ODh5enRsRnBkK2dUL2VCcmxuM0E3aE4yNnN4aTRqeHI5eDNDWkdEQ2dHTDEr?=
 =?utf-8?B?V2Y0SFUzb0lyQ25wUUpGOGZFMEhMT3ZmZlZoNUpyT0dUY2R6NUVoOVJVZStT?=
 =?utf-8?B?dmYydmpramdqMjNRTVVaOGRhTllBPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 17:03:51.7012
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb57eabf-221a-40ca-f1c1-08de59d837da
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE17.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6598
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:mid,amd.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:james@dingwall.me.uk,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 517256AAFB
X-Rspamd-Action: no action

On 2026-01-22 11:57, Roger Pau Monné wrote:
> On Thu, Jan 22, 2026 at 09:40:01AM -0500, Jason Andryuk wrote:
>> On 2026-01-21 12:49, Roger Pau Monné wrote:
>>> I haven't tested it yet to see whether that's OK to do on PV, I would
>>> think PV and PVH would be the same here, since the setting of the
>>> xenstore target value is based in the return of
>>> XENMEM_current_reservation for both.
>>
>> On a system with 32GB and dom0=pvh dom0_mem=7G:
>>
>> [    0.295201] xen:balloon: current_pages: 1835007 get_num_physpages 8220126
>> xen_released_pages 6385120
>> [    0.295201] ------------[ cut here ]------------
>> [    0.295201] Released pages underflow current target
>>
>> 8220126 - 6385120 = 1835006
>>
>> And also for PV:
>>
>> [    1.406923] xen:balloon: current_pages: 1835008 get_num_physpages 8220127
>> xen_released_pages 6385120
>> [    1.406928] ------------[ cut here ]------------
>> [    1.406931] Released pages underflow current target
>>
>>
>> So we don't want to subtract xen_released_pages for dom0.  Is
>> xen_released_pages expected to be non-zero for a domU?
> 
> Oh, yes.  In fact I think the patch here is wrong for PV dom0, as it
> shouldn't subtract xen_released_pages from xen_start_info->nr_pages.
> I will need to send v2.

To be clear, the numbers and warning are from the follow on 
current_reservation patch.

Regards,
Jason

