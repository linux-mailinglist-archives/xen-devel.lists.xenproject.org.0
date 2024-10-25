Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8089B072F
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2024 17:08:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.826088.1240438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4Lv7-00009b-EM; Fri, 25 Oct 2024 15:08:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826088.1240438; Fri, 25 Oct 2024 15:08:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4Lv7-00006l-B7; Fri, 25 Oct 2024 15:08:09 +0000
Received: by outflank-mailman (input) for mailman id 826088;
 Fri, 25 Oct 2024 15:08:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4jrJ=RV=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1t4Lv6-00006f-2o
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2024 15:08:08 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20606.outbound.protection.outlook.com
 [2a01:111:f403:2405::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef4cb145-92e2-11ef-99a3-01e77a169b0f;
 Fri, 25 Oct 2024 17:08:05 +0200 (CEST)
Received: from BYAPR06CA0008.namprd06.prod.outlook.com (2603:10b6:a03:d4::21)
 by CH2PR12MB4248.namprd12.prod.outlook.com (2603:10b6:610:7a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18; Fri, 25 Oct
 2024 15:08:02 +0000
Received: from SJ1PEPF00001CE6.namprd03.prod.outlook.com
 (2603:10b6:a03:d4:cafe::8b) by BYAPR06CA0008.outlook.office365.com
 (2603:10b6:a03:d4::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20 via Frontend
 Transport; Fri, 25 Oct 2024 15:08:01 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE6.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Fri, 25 Oct 2024 15:08:01 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Oct
 2024 10:08:00 -0500
Received: from [172.26.85.121] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 25 Oct 2024 10:08:00 -0500
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
X-Inumbo-ID: ef4cb145-92e2-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WNF60j2RHTHTHQLfxDCzw3wv9svu8MhaJZfCiAc9PyvDPQrzCgeItf0+pahX5Lv68Ph0PBR5LGaHIUmHXpEBF18/chVZaRHbUI/+ewVAnXaU06gcZlw1CEolKHvfFjizX+KaFnomXoX8oUO66lc0ddhUTtpvDX3dUJrTwYgPSXAiXGTalziPuN+1frqKExhPVOSEptYOhpvEZzF3z/wk8zs6Nfp+xlJ5gsnSYEWThkL7ii1rImc56HyPM1uMqhF/FsDbnJM525zCCUQUSnfa2O6nEKAPHmO9WXHzPZ6afGNLqZCHYQ+NotowFRRhmvoc+2Pvl1zkaTDRF67HdeVZmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gsg1F5FUPyMvuqzWVQbppaLA03wDnVHaxRyCpDWAQao=;
 b=bymshTaqwk0m0FSbW98ksC/orkcfOq+VJzfTZxlob/37NGnH8Eh/nz1pCmr7LjqKKIRYwA7f3CEqrW2c6pbGqHy/kDwtyKxyicxkTllpgcae1fhWc2AbvsuN0JBIi2MIR+O3vUO75FZeKOQfaUfzlbNqssAHb85QQMA/B3CbjuP3LRffKfZZfs+4+8hi2AeERvDWLr5sZBgm4gMzMwLHJ8oAUwQfENUi3udwuHUlztFsDBsxbewG0DfX8REQPUUNdapyuUi1HW02FaoxuwGLixYU0MZchBGHbBpCYMEFPJsktQc7xBzi0nWMwrw2/IcdEioKnZPGfLxOacHDPWjRww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gsg1F5FUPyMvuqzWVQbppaLA03wDnVHaxRyCpDWAQao=;
 b=H407FbvCL9BNIoNzfM33WvcFlXvIr93OPRElAxBgpjSO+h2Auf3AhqRg/YMxR7P4wf7NS1YLGyp2JE/YuwHZsjwkgtRzaU4aoWdp0KtJVJdRZigR5EIvI1m0Q3NPdDgjuLvCeS1qzycjW0uuhGLFbnjOBDjYOrIZrqzXafGhrWk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <0a0b476e-4dff-4a65-babf-74851df32617@amd.com>
Date: Fri, 25 Oct 2024 11:08:00 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] x86/ucode: Rename the apply_microcode() hook to
 load()
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
References: <20241024132205.987042-1-andrew.cooper3@citrix.com>
 <20241024132205.987042-5-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241024132205.987042-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE6:EE_|CH2PR12MB4248:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d7a779d-c9d8-4bed-0811-08dcf506d1cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K2F4NlVsQVkzdjBTYmowdVB5VXc3QTdPQjhCTjkwOWNXTTVudXpIZHU0THM5?=
 =?utf-8?B?V2w1am5EZEtiVWJtZVRZdXRUSW1nLy9YeUt0S09nMUh1NVNNdDZUVVMzVmJU?=
 =?utf-8?B?YTh5SDI0SWcvQ3NUZlBlMHJTOU1yK1NMaXhEbzJ5WjBTcldaRU9walhUYlFm?=
 =?utf-8?B?Q2tUQ0hqZzZpOWQ2WXZDb1NFYWhyU0w0d0JML1MwWmhPQ2ZmeXlRdTF3RmhH?=
 =?utf-8?B?TjVxajVhVzN5Y0hxME1sZ3ZpNXM3MFkzVmZJbVRUeUQwQkswL1VFc25QemhB?=
 =?utf-8?B?SnJyTlRyU0hDenE0cWJyY2IyeHllWDNOVDB6a2h3TlB2YlVzZ0FlQ3FHNWJW?=
 =?utf-8?B?TFl6bUwrcld0TnJTVDZ5VlJydkpURFBvOXlaN2lYeHA5UUVwZFUwZDBldG90?=
 =?utf-8?B?Mm84WTRiTUpsNzRwanFZSXZITWtmdVRkQ1VNYnhVSTZ3TzVTMlRRV09GeTZl?=
 =?utf-8?B?dEN6cDAyM1cxYUwwRlVTUUNyNWhVZjd6ZnJSc0lHTzFsbGhaZGZEbFljT25v?=
 =?utf-8?B?M3NReU1ma3ZGa2VGSVNVWjZHT2lrYnVmN0RpMnlMMEYwNFpWOGUzVkJLSDdJ?=
 =?utf-8?B?RlRPbWZ4cFNGVHVCaCs0Q3Zzb2pnZ2JvYlQ2V1FKcjk5dkpYd3V2dGUxZG5P?=
 =?utf-8?B?dmxJTzdjSlNCNEE4WDRDVnNOSUUzdnFFTzFYM2pYWlh5NnZyUkJSd3ZEMitL?=
 =?utf-8?B?WkNOOXBLdVVWdCtMS1BrZ2R2TjRQZzN1SXBYYnlNKzA1eEhCeHhqeWw5dzB2?=
 =?utf-8?B?NHVFY0RHWWNkMkdzK2dMc2VGaTc5U1c0WGJJWXZmeFJJckU1WG1XMkt3Mmdl?=
 =?utf-8?B?bncyS09rbHVGN3AvWk5Mdi9Ycmp5OW5qdHA1aFRKTCsxUmw5KzVqOEpxVzNL?=
 =?utf-8?B?bnM2WXl5QzlXWlgyOTVuOFRxM3hsMlY0alZDbHJ5Q2tEM01LVkJqV0M3L1Vw?=
 =?utf-8?B?SUZCRmU3Mnc5NnZJODkwSVlDWGJQajZoS1lHSVZodHRQcDNwcGVhK3RKa0J3?=
 =?utf-8?B?M2w0cjk5QTQxOGc3bE96d0xodGltWnVrbTd5dWJuVUdkT21nSXBJUkJFcGlt?=
 =?utf-8?B?cTBORUdZZDR0UjBKT0xBVlBMcHNuN2xITXVXTHBZbnpFY1lQUE5WRUoxSjhL?=
 =?utf-8?B?bWc5OVEwOUZRVXBKcElQWFBVaGlVVVZTTjc4czhVYzA2WDNhbEVBZVRkU0hH?=
 =?utf-8?B?ejRWeUF3K1dNZmM5VmZReVhNMTQ1a01IREFKcTU1bzY2dVAxblhoaUFyclJR?=
 =?utf-8?B?MEZtaDk5RHR0MWd2MFN2MnhUNU9TVTkrMkJlQjZSNFFDY3NUL1UrNFg3TFF6?=
 =?utf-8?B?blpBcUtYN0RlL2c2bWFsOFZyU00rMWJmWmgvaUlCb0pUTDVZNStUdnRtN0o1?=
 =?utf-8?B?N2NZVXFWLzZoajMxOGNGWjBUbHVuK0lzSDlveUZhVGZuOTZMeFlYWmdmaWFG?=
 =?utf-8?B?b3NqTDF4aGFjNGsxNTcvNkx0Q0F6QVhjVjhSeSs4czgzV2F2a285WDB0S2U5?=
 =?utf-8?B?WTV4OUhxVXBRYkx0UXhkMm5XQ0F1RHRNTVo0KzV0V0w3b2JsMWN2b1NYbnVv?=
 =?utf-8?B?bmhTbXo3QWNIYTNEYks0OGVxNStJM2xFTWJmWTlZYkxFMDFubmRjTFJ5WGky?=
 =?utf-8?B?SVY2NzdRMmNnTG5jSEpHTFk4bUZ1NHJGWHdLVzduaXo4UjZxK05qWEl5TEtX?=
 =?utf-8?B?LzhKcDFPL0xXNG5rNHRuT2FIWmcyUzdRTjBVV05OcllrbktLWWNsT0x6dCtT?=
 =?utf-8?B?dFBKcDd1aGI4bi9oR1AxYWJ6NzIxdXRmbWtodkdzams2ZXdiblFKSCt5TEh3?=
 =?utf-8?B?ekl5eDVtbWp6MVZIYzdUbm1NeUo2aURzRENmaFpvc2pNTXVteHdVM3BoU2xz?=
 =?utf-8?B?VnF5VlpZcmFWR29tallUaHRrYWlhQi8yL3BtSWhsMDVMYmc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 15:08:01.6820
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d7a779d-c9d8-4bed-0811-08dcf506d1cf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4248

On 2024-10-24 09:22, Andrew Cooper wrote:
> The microcode suffix is redundant, and "microcode loading" is the more common
> term

Missing your S-o-B.

With that:

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

