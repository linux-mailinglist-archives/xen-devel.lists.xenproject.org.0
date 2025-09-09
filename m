Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D11ECB4FD2F
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 15:33:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1116832.1463095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvyTW-0002l1-0o; Tue, 09 Sep 2025 13:33:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1116832.1463095; Tue, 09 Sep 2025 13:33:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvyTV-0002hr-U9; Tue, 09 Sep 2025 13:33:33 +0000
Received: by outflank-mailman (input) for mailman id 1116832;
 Tue, 09 Sep 2025 13:33:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FOFH=3U=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uvyTU-0002hE-Em
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 13:33:32 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061d.outbound.protection.outlook.com
 [2a01:111:f403:200a::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 929866f9-8d81-11f0-9d13-b5c5bf9af7f9;
 Tue, 09 Sep 2025 15:33:31 +0200 (CEST)
Received: from SN7P222CA0016.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:124::16)
 by IA1PR12MB8079.namprd12.prod.outlook.com (2603:10b6:208:3fb::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 13:33:25 +0000
Received: from SN1PEPF0002529E.namprd05.prod.outlook.com
 (2603:10b6:806:124:cafe::a8) by SN7P222CA0016.outlook.office365.com
 (2603:10b6:806:124::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.23 via Frontend Transport; Tue,
 9 Sep 2025 13:33:23 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002529E.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Tue, 9 Sep 2025 13:33:23 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 9 Sep
 2025 06:32:22 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 9 Sep
 2025 08:31:12 -0500
Received: from [192.168.29.198] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 9 Sep 2025 06:31:11 -0700
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
X-Inumbo-ID: 929866f9-8d81-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e0zjae1l2BA3qh+VcpRkQ92Q0WrIHsPNHwJcDn3R5siqkz/Y0JnFpMzyPrZxzpTdv6kVlL3vzs9vFy7QpxGlNKK5poL7JK4Z0hOUWJpXqHgODwtCxSOUaY6Gec8Zo521Q/veDQqTGgUnAHk7hg4y2CWkD7I+BvOFg6017zydHLV5cbiz0vraiz6qfVqItad8uzp+WcpAhS2YadxwfrjabcJ9v92tfKnipHmnyKgo0Pd56V5qMNb5d5yvh4fJSuTi67gccqgQtEM/VbCIHUH/9KOy3g5BgMU2p9bohd+lHuHwd30bKOhCsFJn1PNIk8waDS0vHwcgsF32COEjrWo+Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DtLJLBmdDdGL28ifw2udY+Oia7vhLHnRXYJaPTwSAnI=;
 b=hmdguGs11btJb+66GVokjgmu0I/ig+SRGa9t36OGk8Rnvil+S/WkdvzvNRVOw2rhrFb2myxPguWYK3g+FVb6Rh5ixM9XiSnp57Zl8snr6WZfBS5i9u3wJ+oahBpEkQXIWV//uuE2n6d964FQvWvxUVurdGmRDUPejnRZfMEyO71x/woD4J5P/X/FDy6p+Bh3ntGRIlAyHm0RCnk+Dc/3crvLQ0TbMMXahcVUq05EzMFvX17jmtHAZKvWyvSs/EWyaPQNTvPZhBIIoNIWNEczrMLDDf38dBK/QDbM6bkfaJqACBC/8gwpex/I7EefYH0EV1v+sKcyGnm/5l4vFIkJ0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DtLJLBmdDdGL28ifw2udY+Oia7vhLHnRXYJaPTwSAnI=;
 b=Ddg7CL19oRyB3tEDGN04pW6NKYMVpznt0X2BFf0ZaR1XCOcBIQwsmy0srHZJREhALW8TDZUFQz/yOM7uUad/SlmjuYuiOY+kJM9fqAzY0c2FWkBM1FrMARod8T0zJNqt4Rta9PyUhQMeNsPQ2vyd9KtIeqpOw80h+PHt5GTIzOo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <593b0524-879c-4cca-afb9-516af613c5af@amd.com>
Date: Tue, 9 Sep 2025 09:31:12 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/IO-APIC: drop setup_ioapic_ids_from_mpc()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	"consulting@bugseng.com" <consulting@bugseng.com>
References: <e2e54b68-1521-4bf6-9cb9-5703ed2a69fc@suse.com>
 <034dd6dd-4e3f-4353-9a11-7a0ebda9a664@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <034dd6dd-4e3f-4353-9a11-7a0ebda9a664@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529E:EE_|IA1PR12MB8079:EE_
X-MS-Office365-Filtering-Correlation-Id: 295d7fdc-9a19-4c5e-4023-08ddefa5733b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V093U3daOGNWdDM4dVNzaWZaV3p4bUlRbFdaeFU2OWdvdWFXczVNMWlCQnQv?=
 =?utf-8?B?ZnlTRVJ0Y1pXT1ZFL1gxZUt5S0lIMm5tVnMwcVNOaE9iM2thVFl1QXV0WWlt?=
 =?utf-8?B?eHI5ZllzK0E0MlhUOHpJZmd6cGtVK0RtVUxmNlN0ZTgxK0x1aTNpbkQ3blcr?=
 =?utf-8?B?aGZTeHYyWHNxVmY5MmJRL3JMZ1dXcU5jSGh2QTBYeEVyam84VzZNVGFKOW0r?=
 =?utf-8?B?bTFZYzJMZThza01mNWFUS3JXVXNqbHhxVWRDY0RSd3ljMnZvSnJOTjB3Q3M5?=
 =?utf-8?B?NHd0L2Z0NDhKQ3B5bGdaTUswaDBNMkZlVnBRWnJiQUJQby9BS3RyTlZvaUZu?=
 =?utf-8?B?V3lxajFZekVqVExNU1kzMG9YelM4eEhaTEJ6WW9GaWljSmlTbm82Z1RwV2V6?=
 =?utf-8?B?ZDMwMUxmNXUrK3gxTGNUck1CbjRjQ2RuOW56bGJaTHpOakl5U1dMZnFEbVpT?=
 =?utf-8?B?Vjg2cmdmY3NGYVp5eFFLbnRIdzhLRmhDMENDWjVNVFFIS0FRTTQreHlscUFp?=
 =?utf-8?B?QjhuTHBjWGIwazNWTGMwK3U2NUM1eldzQ1VJL1NaOW9wQ2dWbzROZFN3cXh4?=
 =?utf-8?B?NGZWOERaQmJOS3B4bzd5bkFqVGdLYjduaHA5Nmttb08zbGhJWXNoV1hUVUtz?=
 =?utf-8?B?ZHp1Rk40dEsyOHFSZWZiWnlNZ3BPaGp6K3JuZ1hoMlg5OWI1bzdqZ0hFZTBM?=
 =?utf-8?B?cW5QT2hSblBkc1VacWJFbFN5ZjFzU09TRHpzM1FjWHk1U2lRVTNZbDVHaDZG?=
 =?utf-8?B?c1d2dGxJSThuQ0ZsOVF0SG44UlAyVTg5T2dlcTBOWVBaNks3bnlMbDVvRmtH?=
 =?utf-8?B?RmRLYXI2Z1hrU251SDhxdGFHc3RrWjEzUTRlbm5lT0l5NU84K3h0K0wwNks5?=
 =?utf-8?B?RnVkS3FSV2NINmM2THFjbW1KM2hrOWY2YVdXMC8vQ002NWNudzJIS2p2UXdG?=
 =?utf-8?B?ZjN2VXZmaThBeDRWNUpQaHg2aFNzZDZsN01lOCs1Unp4UEdpS3dXZzV2VGNI?=
 =?utf-8?B?dUw0K0NONGt4cUZ2Y2VkZ0p5TWVRL1RQdFdGekpSS2cxZGJRM3M2Ykl1NUlN?=
 =?utf-8?B?Z2hIWkdVRE82QW9CWmVRamkzRHpWVlAzZkErdUpCUklFRzNESURRWTQwSjZm?=
 =?utf-8?B?cWRJNlllbi83SUQ0dkcyUElvcUlISlJVWGxCYTYreUNhT1NiN3p1Znhqa2ZO?=
 =?utf-8?B?dVVzNjJqWXZNVld0SFZ4T3ZYZXhlWnlUblZ1SDZQM2I4VWQ2VUFyVlY0Z1ZN?=
 =?utf-8?B?VXZINFRiWkRwckhYa2s4L0wrUy9hVCtYWkZsZVRHOWtnUWZkRnVYdkVxRWFt?=
 =?utf-8?B?Qkk0UG9QaUdQRFNuVEVOSGNxRVdvOW5Dd3JTekM4Rm94UFBwdnNpdm13NHlk?=
 =?utf-8?B?eTlIL0hjWExPVDliaTJNTlpiamc5UHJjTXp3RXlvVWNDeXBldm92b0ZtTXhG?=
 =?utf-8?B?NlM4eXJFbFQwMHB5QXFwVERETlBoUlNnMzdha3hObHgxbHVNV2lOV1NmYW05?=
 =?utf-8?B?bGYzcGlxMkdTWTVSZENVOU5Fbmd0eEwrd2lOZ2RBdWdhRG40M3Z6aWNVOW0v?=
 =?utf-8?B?L09kaVBhU0FsUERMbDVBaDNiRm1ZSlBhVys1TFlBQXMzaXBJRE9XZTJRSDZp?=
 =?utf-8?B?akZhcThRenU2Nlp6bkpaMVJvT1dQYXlScXM2ZlkrdW9NMVBBTTlScWhvbG1x?=
 =?utf-8?B?TzFMM0tuS0F6SzdMejRkNG5Bd3p3RDlwOGh3Mi9vOURla0RBaDFxNkVNYUJu?=
 =?utf-8?B?QVNpVnBHNjJvdXdSdm95dUpkTlIvT01hblpkNzhuV1IrM1ZXcmMvRUx0SVc0?=
 =?utf-8?B?eThsRVZaK0M3dlU1djRMamtIL2JDVDR1QWRSUTRHOXdmMUVMcGVVQnhWMGkv?=
 =?utf-8?B?Y2JPK0JNYVRwV2VYRGl2N2RXQ3IxaGhPb1oxRXJOK0lBK0dTc1BKRFdtVnpV?=
 =?utf-8?B?c21hWnhiUzF5Y2ZkVUp0a3RyWjZHUTlSK1FUU3lTOEVwbERCbTdKdWIxMFhS?=
 =?utf-8?B?VmJlS2dkUy8zSkFOeEJUV0FTR09QS2xqLzV4QzRNSGhMamhPMW9BZE14UWdp?=
 =?utf-8?Q?KB/K8d?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 13:33:23.7778
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 295d7fdc-9a19-4c5e-4023-08ddefa5733b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8079

On 2025-09-03 03:55, Jan Beulich wrote:
> Along the lines of what b89f8f054f96 ("x86/apic: Drop sync_Arb_IDs()")
> said, the function is dead logic as well: All 64-bit capable Intel systems
> have (at least) xAPIC (if not x2APIC).
> 
> Even if Eclair can't know it, such code is violating Misra rule 2.2 (dead
> code; we didn't accept that yet, but - where possible - we probably would
> better follow it). Depending on one's reading, this code may actually be a
> violation of rule 2.1 (unreachable), which we did accept:
> 
> "Code is unreachable if, ..., there is no combination of program inputs
>   that can cause it to be executed."
> 
> Otoh it's "only" __init code.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

