Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 676A5C51115
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 09:16:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159554.1487857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ60y-0006hv-Mt; Wed, 12 Nov 2025 08:15:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159554.1487857; Wed, 12 Nov 2025 08:15:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ60y-0006fC-JT; Wed, 12 Nov 2025 08:15:40 +0000
Received: by outflank-mailman (input) for mailman id 1159554;
 Wed, 12 Nov 2025 08:15:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=StYb=5U=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vJ60w-0006f6-Tb
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 08:15:39 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0795789-bf9f-11f0-9d18-b5c5bf9af7f9;
 Wed, 12 Nov 2025 09:15:30 +0100 (CET)
Received: from CH2PR14CA0004.namprd14.prod.outlook.com (2603:10b6:610:60::14)
 by IA1PR12MB8224.namprd12.prod.outlook.com (2603:10b6:208:3f9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Wed, 12 Nov
 2025 08:15:26 +0000
Received: from CH1PEPF0000AD75.namprd04.prod.outlook.com
 (2603:10b6:610:60:cafe::d9) by CH2PR14CA0004.outlook.office365.com
 (2603:10b6:610:60::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Wed,
 12 Nov 2025 08:15:26 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD75.mail.protection.outlook.com (10.167.244.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 08:15:26 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 12 Nov
 2025 00:15:25 -0800
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 12 Nov
 2025 02:15:25 -0600
Received: from [10.252.147.171] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 12 Nov 2025 00:15:24 -0800
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
X-Inumbo-ID: c0795789-bf9f-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tqZvjjanhvr1FTsKMgwYcr+cYGgsZOwVR4gWTxVxX0NHvbG5N5n4kV60bqxuQBiVCxZpP8rSkAic8uSv2tzmPvoVsf2RwyqNbmAAuTxKk5Jneap8HqC4M2z1+7hMSr/PyS1fdTtOWapUdQFtkKwuLN8l5GpbmGS/U7DXpQlmMm6ThhWmFgJr9fD+KZjQzOscQ6kUq/1txEoLpKRxUOZlD2tZm0hDDCW9MuHv//Gg0VJruORODPEF16QuiURtvpAd0net8mfsJ5V/++Sm0EdNzv7i3msjecGMG7CKfwXhKl0qxyBg6WreXkGbCFEwCNR/c5gYoi1S0tbTC7jYgSA9ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yLnFpXyUB8/COLBPlJenNeNEFAicpjBvy8JZOhSkedg=;
 b=rUipHGZ/dX71TtTAvtSI1mZDPuvw91g3FYIPl1ByHUIN7ptV2b6IO5bIvovj+JcrniAd8I1nwa3JcfbCtC5iZAHmBxeVWvGLdvourAunAudWq2vd8+OVStlY7h0v+0YnK4ZYqE+5po25NnVscHRxP4jvwA+SiLNihVowFW+9xf9VlKX9rTl+saTr/gCQ2ri4iLDF3eh2pEAu39+O+qlTqTr9oOu7O8nRTeNtP37qm86x/n4HcbOqXnn2xu5WMDPdxvg6tQG2XUr/pH+z6lLS6ieNhdwpKMXgFOHggmJVhrmZo63cXq6gS1SWCecrt9eI2WdKS/GZZOdAIprqaq7EVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yLnFpXyUB8/COLBPlJenNeNEFAicpjBvy8JZOhSkedg=;
 b=iF8aUhfnbncQQ7aL0dAxkOl7Cu6Y4DCH6poccO5tNPUkduLPUT1bPDp1Sx2EV7NuzAI4xllZGIkAacxWq1/gt+wngNeCBCPIgFFGmgp9bYbqgiV4wDv7XkRzUZGtWrDmDf2rQBz+HFovhkwcA+1k+60DFcE5+hFiAADiUXrER3s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <e91c18fe-37f0-4890-a8c0-96ec73470b88@amd.com>
Date: Wed, 12 Nov 2025 09:15:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Use FDT_MAGIC from libfdt instead of local macro
To: Luca Fancellu <Luca.Fancellu@arm.com>, Dmytro Prokopchuk1
	<dmytro_prokopchuk1@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <464fb509cc7f66934689d9e2d3a77bf5fcd45c24.1762931200.git.dmytro_prokopchuk1@epam.com>
 <80431F4E-4512-478F-94B0-1CDDC5E8B6E7@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <80431F4E-4512-478F-94B0-1CDDC5E8B6E7@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD75:EE_|IA1PR12MB8224:EE_
X-MS-Office365-Filtering-Correlation-Id: dd931486-8c9d-454e-cc1e-08de21c3a2a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T2hkd3lWMmNWamV1bzEvaFBEbmNHZENza0FUYXBsTCtmaEZjaHNJUVNySHlV?=
 =?utf-8?B?ZUtzOFhtVGJIZkY0TWNER3hTQkNDVXVYRno5SGxHZGptVWF6MkVmcWQvbUtl?=
 =?utf-8?B?MWNucjN3VU9rQTA3bmhFQi9QakNUaC9tc2hkZnpuTFJXd2cvajYzSDlOS0pZ?=
 =?utf-8?B?U21QTE93alp2WnJwUkFLcmdjaHdBbVVTUkNkMytMV2liTEtiR2E2UWpwRnFu?=
 =?utf-8?B?bkFjZ3pYcHJDTDNvU29DTUpQNVNZUG9haHpqWnpIbmpaVllqa1FuYmFpSHYr?=
 =?utf-8?B?enR3M3Q0THVyaUlZcGJWUldQaUdnVnVPOU0zK3ZTaUo4ZGRkNWIzSmtNemlT?=
 =?utf-8?B?dzZkdkFxaitMSExVTzl4bVhHL3dlTTgyNWloZnJnZmF2aFdiWGFTSVBhN1cx?=
 =?utf-8?B?STJrODNISDdVaXVtdjJvRG94a2FBTGk4elpIUXNtTzZwWW9EeWxYVUUyeTZx?=
 =?utf-8?B?eW9Gb0VMYXFCVUFjbk1MWGJmM2xkVHJReU93OVlRRS9XQ1Zob0FQcnNRN0hQ?=
 =?utf-8?B?UTI5Zml6L3dBeUoxQkxscFRxOHpyNHpRcmQvT3ZsR0M2UTlqMnBNUGlvZE92?=
 =?utf-8?B?bFh0U1Iza3RjQUlZU1dBZUFQTzk5VjA0REo2Vnh6ajhzTTJqb09qaEd4M2xn?=
 =?utf-8?B?alNsc3FGamtpUUcycUNEK1hvNnhJYkJualhtbTgyTStNTmNJYWRjQnQwY21j?=
 =?utf-8?B?b0VVVDk3WE9qV2cvQkFlZ25aVWtldGxxbU0xZHlZRjNKVmZKYmUyZnMvZ2tQ?=
 =?utf-8?B?cUJtVTRwWEhPS2t1MmJKQkducnIvckYybHQ1aVo4VDNNOGRLaVlRMXZTR016?=
 =?utf-8?B?d0RncUFNZUFLaStYeXAvVWplVmNVT3BxQ1JBQWFlQzVUa29VWFhpdTNEcHVV?=
 =?utf-8?B?aHlEOWkvbWF6a2RLT2hSWGoxNmpwSi81VEk3R1dWNnRuNnV0alltZENEN2NC?=
 =?utf-8?B?MEs2LzNxRWVaM3ZZM29jL1JsN0tINkp4RForRHExMWUvc0dQeWxRcHRJOTlE?=
 =?utf-8?B?K2xtdVFMZG1LaFNidGpZOTNmakYrUHpmVnF0WEFhMUQ5czBlZXpSODJsbm9C?=
 =?utf-8?B?N3gvcXJta2k4VHR3cVI2ZHF1a0xQcXV6SnNuS1FCVHh3NkRmMmUxMGhLcmFo?=
 =?utf-8?B?cE8zQ0RzRm4yazhjczNlNXErVWtXWnVKckFwMkppb0QyTzNPVHhLL0haUWZ3?=
 =?utf-8?B?cVV6YlZhY0JjdTZ3c05qTmRzZXUvVTJmdVRNai8rTXVJNUl0bWd6TGdqTlQ5?=
 =?utf-8?B?aFpYN0M3U25pRnpNTk5zb0RjaEtDdi9JNmJKay9tNjBONEJyWUJxdStJY29D?=
 =?utf-8?B?VENOaFVNaXU0ckk4L0Z0dWxkcE1VRHUzcWlLclI2UGV3cmZCb1JWVTNUSHZH?=
 =?utf-8?B?ZDNCci9kYysydlptcDRPblpSNDJjcjN1K2x4VlV2VTVYL0YwTTJDSjdOZldQ?=
 =?utf-8?B?UHJMTTY5ZlJ1Z3pvZmkzd24yZHBFVVJzN1hETE5yeTNkV2psWXVJL1UzRmhL?=
 =?utf-8?B?dkd6NDdxbjNJa1NMU21Qdmw1eXBCSmIwT2NTcGJpcnZmUlRzRmc5bEZCT0Nr?=
 =?utf-8?B?RVpucVFjcCsrWjcvcHZWYjU4RXl2RGlzdTREYURuZExlWThRb0lKY0VRcDlB?=
 =?utf-8?B?Z1J0MkhyOWkyZit3dHVuT05mQVVrTjJEWXhFUTAraVJHRXNVOS9mak53UUFp?=
 =?utf-8?B?bXkxZ0pXMmRZem5QbERhU0VDMWdPM1ZlWi9VMElqeGt6TDdScXBZZ1JRQ1dz?=
 =?utf-8?B?N0VnWmlualpJWjNpVjlzUjlWMGp0eklXSHluN284eDV1dGZzeDJjMVpScjhu?=
 =?utf-8?B?SmsvMTN0WTF1M1N4TEFRZCtVejNqNG1SeXl1aTh1azBYZVJocmhnWWxxWHBS?=
 =?utf-8?B?bThzTDJPdTdXOW91blJaYTNCUHd1NTlRakpIQ1BvMmNTZk1JdkZSeVpWd1lV?=
 =?utf-8?B?NkdzZFcrazZhbHo5M0dxUUZ0RFpBS3lWZUZXQ2tob0REVThGeTFpdWhnNzdF?=
 =?utf-8?B?QXFDc04xQkt0bkdYZEZoVUpSa011TzlsVy93TS9uNnQ0dWYrcm5OUnpzamJj?=
 =?utf-8?B?SFBzSTRPY3BEWmlCNnJRR3Vpc1IvUU12MGxRWkZBM0JFM3NZa3lEVklPWUtM?=
 =?utf-8?Q?HWMs=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 08:15:26.3411
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd931486-8c9d-454e-cc1e-08de21c3a2a0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD75.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8224



On 12/11/2025 08:47, Luca Fancellu wrote:
> Hi Dmytro,
> 
>> On 12 Nov 2025, at 07:08, Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com> wrote:
>>
>> Remove the redundant local 'DTB_MAGIC' definition and replace its usage
>> with the canonical 'FDT_MAGIC' from 'libfdt'.
>>
>> Fixes: 66edeb2e3972 (arm: copy DTB appended to zImage)
NIT: Fixes is for bugs. Redundant macro is not a bug I believe.

~Michal

>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
>> ---
> 
> Looks good to me!
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> 
> while there I noticed we have DTB_MAGIC that seems to be not used in the toolstack
> xen/tools/libs/guest/xg_dom_armzimageloader.c.
> 
> I don’t think that should be addressed in this patch, I just wanted to raise awareness.
> 
> Cheers,
> Luca
> 
> 


