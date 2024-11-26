Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DB59D9029
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 02:52:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843290.1258928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFkkR-0005bS-HE; Tue, 26 Nov 2024 01:52:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843290.1258928; Tue, 26 Nov 2024 01:52:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFkkR-0005Z5-Dw; Tue, 26 Nov 2024 01:52:15 +0000
Received: by outflank-mailman (input) for mailman id 843290;
 Tue, 26 Nov 2024 01:52:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lzfN=SV=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tFkkP-0005Yz-QY
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 01:52:13 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2009::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b7187fd-ab99-11ef-a0cd-8be0dac302b0;
 Tue, 26 Nov 2024 02:52:09 +0100 (CET)
Received: from MN2PR16CA0005.namprd16.prod.outlook.com (2603:10b6:208:134::18)
 by DS7PR12MB8202.namprd12.prod.outlook.com (2603:10b6:8:e1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Tue, 26 Nov
 2024 01:52:04 +0000
Received: from BL02EPF0001A0FE.namprd03.prod.outlook.com
 (2603:10b6:208:134:cafe::53) by MN2PR16CA0005.outlook.office365.com
 (2603:10b6:208:134::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8158.22 via Frontend Transport; Tue,
 26 Nov 2024 01:52:03 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FE.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8207.12 via Frontend Transport; Tue, 26 Nov 2024 01:52:03 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Nov
 2024 19:51:33 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Nov
 2024 19:51:06 -0600
Received: from [172.23.96.146] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 25 Nov 2024 19:51:05 -0600
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
X-Inumbo-ID: 0b7187fd-ab99-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjAwOTo6NjBlIiwiaGVsbyI6Ik5BTTEwLUJONy1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjBiNzE4N2ZkLWFiOTktMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNTg1OTI5LjQ3MTkxMSwic2VuZGVyIjoiamFzb24uYW5kcnl1a0BhbWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OJLbkHSgZgQiM9mjY7ii0B1cdQ6nmOETBcB9OWLW/J5oxOoNxpbB25y0aSq+hDDMJzL8Xsq+SZJkFJBDsLIu0wM0Div9wKs9J9uL7p5Vw+FRBShkUCWjwVFm7NEqOdjbgdzN+trxPQ1Bazm+75V45lP1QemliiUVVk8y1EhXW18c4o8BI2+Xj24gqNR5yVtLYkxOC1GPPKFbcJCE4M5GeHcoVeh1+YdP3HoIXxCJwSwQEFTJjJwSgl1ow/X3PYLUSWA42Hu16EqsH6JELGNzlZEPD7s21ulH24AwD4TDMM0zWqhFzV/aZ4EC5LnyTPjVi+ovDbppPoL1x71q9WOM1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HLbhG34pzc+kefPeUCZBVWGMfUzEB4dTthSOXG3NOyw=;
 b=RVpL5APmO/MH6S6239g+urHRMDzIYo9dQBVDqAfQduGte7tcFkYWSqik013aHbNutaOhM21n72p5YXTpvuGowW3DhKO4NmfgtDru5jYQsF+dUQ4L4hB0utu9kFvsLQc79nTBfGVaMYsm3L9G5KWL1Hk9tN0kFnlpaQNQsVbXQFQA6/arDq1fjXFHgSojnxhlpfpgwY0MasAYPMLgu0P8lKc/qfiWFtN15bIzhsk1gn0ivvXf1+jlJfnA/vdPkuWH00Wmdf1f+ocAsvBMOUAiPXG98H/HBYR8QB9ZBdkaSxNzwSeIBiaYPvIZaBHaTaNzQy+Dt2X+sVdtwKGnektuAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HLbhG34pzc+kefPeUCZBVWGMfUzEB4dTthSOXG3NOyw=;
 b=arPXu2pOS6S0YoFWk2biHX9E56wnFK1O6oo8CkC0QpTJz76LPgKoYqNPYfeK6FkkFUihDAJz1noNqbmtjVGjf1M06HdqA48Gn/yhwz2IUhCYHTkCWtDPMLZEALQOQQkiIocxbTMni20U8C8/2fdAsuz75Fe/E8+9C5K3METeZIY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <d68f1b2c-06b1-4065-b81a-82463e060d8c@amd.com>
Date: Mon, 25 Nov 2024 19:09:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/15] x86/hyperlaunch: add capabilities to boot domain
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-16-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241123182044.30687-16-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FE:EE_|DS7PR12MB8202:EE_
X-MS-Office365-Filtering-Correlation-Id: 116da5f6-1d56-413f-2ac2-08dd0dbced10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M0hOSEc3VVFDbUxXbEZobUl6U2hZM0dUcDdlMjV1RlJMdk0wOU5lOHhXTkRB?=
 =?utf-8?B?Q251MmxjdzlLdEh1OFQ3Q09WZEpqTEhDSm1YWXlzTzd0dlkrSXNHWEt0cktT?=
 =?utf-8?B?eUFad1RDN3o1aEljK2taZDUvaXphZmExU1RjL0szQ2hpSkdLWU56Rnl6a09z?=
 =?utf-8?B?OC93aXRXRk5sNUtnOUsrbUpTejhLSDNiSXk3dlBXK2tHT0NMR2R0MjhsbTA0?=
 =?utf-8?B?dGgvZzVtdERjWFlVSjJDU1RhTWU5Nk94TFlwZ0FmRGhqL3czWmRCOVU2em15?=
 =?utf-8?B?bHJYalhDYUlBTlB4bWduRkFBWG1FelFUbjZNZ1lRaFV5bGdlUkZqVzF5R3hz?=
 =?utf-8?B?YWVnTEZSeHdSMUhqTzQzSGJvY282UFUvMC9YNGlTU1RCeEZJSHhnZjMzenZR?=
 =?utf-8?B?Z3Vrc2ZqZ2hhT0NwcUV5RVhnRHFVaWZCRTJCcy9iaExVT3NnUHZJS3hPb2pq?=
 =?utf-8?B?SDdFNzhjcGlzUlY2NGp0bmVSY09hdUZ3ajNWZkczbmNGbm1KN1F2S2ZKNUM1?=
 =?utf-8?B?bndLeExxQXNFQ3lLWjVERXJwWkppc0JNL3VRMFV1c0ZpOXlrM2ExMkpKeENJ?=
 =?utf-8?B?cUxSWHZVeng2eHBFS084WlZXS3FoMzUwSGtWZjBGTGMzOE1sRVBRU3NJMjhi?=
 =?utf-8?B?S09ZMW4rRG1TdlM2UDlmQnY5R20xOUZicWdqVVlrMjMxaEVoOUUxMmIzZUtH?=
 =?utf-8?B?UWpYWVRxSmJPajl2dVNaMzc5MWlWOGF1M0MwQm8wS21TNk14Wng3U0lKWVdU?=
 =?utf-8?B?R1VRajI0Vk5EMW1MeHVBS0pNUkthZy9Gd0pNZlVDRlJwNXlhUlhvQkpoa1RB?=
 =?utf-8?B?VXl1U3h1Sy9WVG8vaE50UEhtRlNmZzRqRjVPUVl0SW5KcUhTWU9MQUl0Qmwv?=
 =?utf-8?B?QXBaaFpGMlBFRkpwc1pvWW9tOC9zSm05aUJ3MzBLeDBKZlpkM0dWdnVwRTVn?=
 =?utf-8?B?OUxZaVVQOVJYUCtyZ2pldTAvOGVnZmVQQ0drbTZONUpuWU5wMDBRcDlWQUtE?=
 =?utf-8?B?bk95L2RZN1MwVE1FOFRuNjhhVVdwMzVaenR0K3ArT1phS1JQd21BdC9pM29m?=
 =?utf-8?B?d0RqT1BxREU0OU1hRUxhMGdyaDlmSVpUemgrTWhpd0NqOWdvbDl2MFljNFZu?=
 =?utf-8?B?UVpQeFZ1bzZ2WUMwYVhvMjU0b0JpaHcrWHZheXZyNU5ZTTU5QzRrSWdpV2o0?=
 =?utf-8?B?OUhzVHdVaFh2WGxuWlAvajNUMGwxN1htYjh5ZzdGTUMycVhVdGVOL09TTlVj?=
 =?utf-8?B?RjFFSnlPR01PR2FHdGNJSTdBSnQycEZZL3NlWnpBejBJNEZxdU1CSktvQng3?=
 =?utf-8?B?YUw0Q0haMGUvYkMzOXA1R2pKSEhPWjBraGZRdGd5SitTcmlGckpadEd3NlhZ?=
 =?utf-8?B?TWJmRjM4UVdzc3BnUmphRFZPWWxWSzZqdlYzUjBlV0E3bmRWeU93VzQyNTJx?=
 =?utf-8?B?S2xCVVp0a2N0Sk9XS3RITkcxZUREem9ubTV3V1dwbFBkVXpJMG1NTk1IKzAw?=
 =?utf-8?B?Vmp4ejhIVWpobThXVWI0VjkzTWVuTTE4NGQzVFd3ZVg0RWZGcTh2U1JtTWtV?=
 =?utf-8?B?NXFDcGlicGFDNUM1YjR2TUZBT05mK0RVODA2T0dYemE1RjU3RFIyaFlBS3Er?=
 =?utf-8?B?SEprNGliZnkycEFFM2hrMGFOaEZTUGVkM2MxcFhEdFAvc0h6aGV6U3c5MTli?=
 =?utf-8?B?ZlE4NUNWalkxTk1EWnNiU3N0blhndUpyUVV5aitOcDdlQ1dLd1ZpWEZJcCtQ?=
 =?utf-8?B?aXBpb1RlTWl2SW1GdFNPZmYrc1RyQUxIYnVXVy9kZjF3ekp5MVFkUVJVT2VG?=
 =?utf-8?B?eHBPT2J3RExYM2xleGJubU5ndVpId05uQ3dCSVQ5UUdlZVF3RnR3dVd2R1Yv?=
 =?utf-8?B?UE5DZDFnaGdBNEFvYzVOd3VHbG5IWDBET2RYTHlGUGNmRTBpdGRncFkrMHN1?=
 =?utf-8?Q?kNMzstbXvMose7MObyMFiumXCZoFMV8I?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 01:52:03.7969
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 116da5f6-1d56-413f-2ac2-08dd0dbced10
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8202

On 2024-11-23 13:20, Daniel P. Smith wrote:
> Introduce the ability to assign capabilities to a domain via its definition in
> device tree. The first capability enabled to select is the control domain
> capability. The capability property is a bitfield in both the device tree and
> `struct boot_domain`.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>   xen/arch/x86/domain_builder/core.c    |  2 +-
>   xen/arch/x86/domain_builder/fdt.c     | 13 +++++++++++++
>   xen/arch/x86/include/asm/bootdomain.h |  4 ++++
>   xen/arch/x86/setup.c                  |  6 +++++-
>   4 files changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/domain_builder/core.c b/xen/arch/x86/domain_builder/core.c
> index 95cab06e6159..eaa019472724 100644
> --- a/xen/arch/x86/domain_builder/core.c
> +++ b/xen/arch/x86/domain_builder/core.c
> @@ -93,9 +93,9 @@ void __init builder_init(struct boot_info *bi)
>           i = first_boot_module_index(bi, BOOTMOD_UNKNOWN);
>           bi->mods[i].type = BOOTMOD_KERNEL;
>           bi->domains[0].kernel = &bi->mods[i];
> +        bi->domains[0].capabilities |= BUILD_CAPS_CONTROL;
>           bi->nr_domains = 1;
>       }
> -

This will get cleaned up earlier.

With that:

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

