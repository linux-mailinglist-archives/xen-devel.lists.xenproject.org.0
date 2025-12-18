Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38019CCBD81
	for <lists+xen-devel@lfdr.de>; Thu, 18 Dec 2025 13:51:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1189547.1510308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWDTI-0001Ou-Je; Thu, 18 Dec 2025 12:51:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1189547.1510308; Thu, 18 Dec 2025 12:51:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWDTI-0001NN-Gg; Thu, 18 Dec 2025 12:51:08 +0000
Received: by outflank-mailman (input) for mailman id 1189547;
 Thu, 18 Dec 2025 12:51:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KG2Y=6Y=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vWDTG-0001ND-K7
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 12:51:06 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36039ca4-dc10-11f0-b15b-2bf370ae4941;
 Thu, 18 Dec 2025 13:51:04 +0100 (CET)
Received: from SJ0PR03CA0077.namprd03.prod.outlook.com (2603:10b6:a03:331::22)
 by LV3PR12MB9258.namprd12.prod.outlook.com (2603:10b6:408:1bb::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 12:50:54 +0000
Received: from SJ5PEPF000001F1.namprd05.prod.outlook.com
 (2603:10b6:a03:331:cafe::2f) by SJ0PR03CA0077.outlook.office365.com
 (2603:10b6:a03:331::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Thu,
 18 Dec 2025 12:50:52 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001F1.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 12:50:51 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Dec
 2025 06:50:51 -0600
Received: from [10.252.147.171] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 18 Dec 2025 04:50:49 -0800
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
X-Inumbo-ID: 36039ca4-dc10-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p7MJhvof3IlmnHFoU+wf97rlWOs4kwaCS+s6YUaTQi5DjJKCgh0uvKOL2BJCE1OlXITkdFI4futOEA5CDOJ9dy0VrZDBAf4P72zoiwm9BC+yAyPkTIeqHAHtMGKzJA4wM8LPQNA7Q5zyBui35/XAyjiTk+V9CpfMMSYQNEgWljBg41rwF7khWsRhRsBxXZ9v+RvoNxsjG41XBF52B0MA4qqfQWtDbLXPnxKCnfhaXt9oNjrESAtlGw88NnHOh1E0owze9NEb4YzZW/Nul10W2z9lDgd3JTmJ/AWr7vUYmLdTOShyMKv5pjEH/hs8qYRVhIO4A9en2WLAf1hJ1aPOWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gQz3QSUX2/UoZuzfBtpPoxx5Wtc2heciyCuAKC2cvRs=;
 b=m5P+U2xirJMvNScLwiXoyVoToioVt1VuvDKtzlDFCfh3rcaYuNIt5N9ek7vWkGPm+MBiqaWl3nZK6flq2rSUCwZqcU2+w1ZLLgL8l0XGuqgor+516065LsFPQzo22SNxlZmBO4tA0vCjZaNrSi36SusVTYzjfovw2zyiuGYJqyf2lGWMZ0hHbg5Q+SGWpXe6IboFntDrl9lrrAl5zGWJGqZguUTn4KtOHdY94bBJz2OkezyWTaZxesiQ6RK2QpZlYfXIvgPvyxiJpMUczz1EwjZtwVEGfqYHsMHNdUIegNN/pQwECjfgGbs5rWH5MRXg06GCZrprIv4i7E5WMG4efQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQz3QSUX2/UoZuzfBtpPoxx5Wtc2heciyCuAKC2cvRs=;
 b=SCosbqFmDUutBAcl6SB114Nx97tNEHd2+0TsSso2jhGFUiY+IsZf/tsKXoVMKRd0MLsQNuZfDffU9cY5+DKZ+HxKTE7uJYSW7zodA4WRu5UUULMItLVzSbECRM8q7lKA3SQg3U14JdTAwAmv4X5klja/t+X3VI7wrL1IxFIPRrc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <c09e86a1-df0f-438c-8295-1fe211baf687@amd.com>
Date: Thu, 18 Dec 2025 13:50:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3] xen/dom0less: Calculate guest DTB size based on
 MAX_VIRT_CPUS
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Grygorii
 Strashko <grygorii_strashko@epam.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Harry Ramsey <harry.ramsey@arm.com>
References: <20251217081248.2807849-1-oleksandr_tyshchenko@epam.com>
 <alpine.DEB.2.22.394.2512171605420.21522@ubuntu-linux-20-04-desktop>
 <a23716aa-cae1-4636-b027-2344e2b08f10@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <a23716aa-cae1-4636-b027-2344e2b08f10@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F1:EE_|LV3PR12MB9258:EE_
X-MS-Office365-Filtering-Correlation-Id: 411180ac-0ba8-4744-03a1-08de3e34137a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NzBsL01LOVZSVWV5aGNaejQyVGIrY2RmbDJlOFhVREJIM053RWFHOFlzbG4y?=
 =?utf-8?B?OUtnYlJvSzh1c0JjY3U0MUVUZ1BJNDI3bUdtbnNTTEZTTGkzbTNVR1JDR3FI?=
 =?utf-8?B?dVVhL0pqQlBBMWprYXJBVG9hbVlsQmNQaHJ5Y2tyajQ1dmZWb0ZsbXdwaXNa?=
 =?utf-8?B?NXVyZ0QralF0LzJWbE90NjhUd01tSmxjM3dDNC9GTERFaks4V2k4TjVXNEQ1?=
 =?utf-8?B?ZkxxNDRZQVB5T2Z3R3NMWGYrN1ZDNk1tbTNUMWFOMEZWWHZhZHJnZFN3M1lX?=
 =?utf-8?B?V0xrVms0Yk1wUnIyb2FGRU94NFlhdHFaN0lpUUVUaEk4azk1d3ZuT2l5SE5K?=
 =?utf-8?B?bDRMeEpBU2U2ME9TSUNlZzRBMHdHZ1NJMVh2eUw4YldWM3YrK3l3UGNyMkl6?=
 =?utf-8?B?azVEZ0xzQWovVlhDbkZLMFZ4UkhzZkkvdkZkb3g3a1Nnd0lLbEJ4S09RSjJh?=
 =?utf-8?B?Y3RzU2w2VnV1K1FWbWRCUno0ZUp2aFB3NW9hcWU0aitvbEZYY1Q0eGRNcFpW?=
 =?utf-8?B?WkxZN0NQQ3hWOTltdzZqaTUrc0VFYWp5bzVXZXZMNVVwMEpRbDcyY1RmYnBh?=
 =?utf-8?B?dEdKQUpZWVRjV0dkZDU1a1hldnRLUkdwYXgzUWhaTHptWE9TOEFic1BJRVV3?=
 =?utf-8?B?dUpPdjRDVFkvdk9xYkx6MTA2U1NwL1ZNQTJhM2lMRmpQTG90bklRZGZOS3Ew?=
 =?utf-8?B?WG1RenJJU1V5TnJJTjcvRmtCd3l0M01VY2ZUR1FjMTBqZUY0eDlHcGw5ZW5N?=
 =?utf-8?B?MnllWXU0K0loUkNCblRHWXQwRmIwL0JtdTAvVktMV1llRGxCU0FxTWljS1Zk?=
 =?utf-8?B?eXV2bFRRNWU3RE5KcmZHekxiTlJtUkZpMU1pRHQ1Wm05RitnWkoxRFl0ajFl?=
 =?utf-8?B?Y3ZRS1doalV5QmlhVFg0Qk1MRURDTzhqYlcyOVp3TDBQZDFJa215TTJjS2Nu?=
 =?utf-8?B?dk9UUUpUb3dpQTZaUFM1SU8wU1FsMXpZQndFMnhLMVIzZHpVSi81d2YzVTF1?=
 =?utf-8?B?azdpYTBNK2V1bitQMDYxKzMyWk04K1VDRkFkR0dpVUJqdURQLzJEc0E4R2I0?=
 =?utf-8?B?cGN5aEFDZ2hGRFd4bHdkajZaNnBISDRJZWIwbTQwWU5GQzV0NUxFZE12VVRs?=
 =?utf-8?B?ZGFIZXBEVk5TL2tsbHRhNU5UMHF3VzEzRFJQdGQ4cXdzTUxBbS9CRGdIUXJm?=
 =?utf-8?B?NUJpcjR0NlFnTW9IekZvc0RGak9Tay9XNERiR1piK2ZNY1pwd3Y0RkR4Zy9U?=
 =?utf-8?B?NUJueUplSUJJeEZMUEhrTzJKOXo3WS9tQkcyRy9YY0QzN3VucXlrbGhCMFpj?=
 =?utf-8?B?dTVSSXNMc3JZcjBEbGRLRFF4KzdxUzNLbXBzN3BzNVh6MHRXRzVCNUpRbWhG?=
 =?utf-8?B?Ky9ZbHRReWlkNmV6TXJRNnZzS1kxSzZVZFgzdzdrR1YrWmxnSzRSZEM5Wk9Q?=
 =?utf-8?B?QUJGRXhCVVFUTW16dFFUc1BtZ1M4b1RRemQ3bHllZThwb1gxMzZJNmpsQWJL?=
 =?utf-8?B?c1RESlNFSWlrWU42UjFGZmMxWisrNUNpdGRzTTBrSHVDcXhuSWZpck5KT3RB?=
 =?utf-8?B?Wms2Mkw1aExOUUNYVGIxL1BYQ21oS1Vvb29mOEMybTM3cVc0MmVRU0FGVkdN?=
 =?utf-8?B?dGE2aXNaQ0FHZ0pWSi82NjNoNE1xZU43MTdzYi9md29QaWpDRkorR1dyS05a?=
 =?utf-8?B?N1ZmYUVseEc5SmJUMjdZWVNWTGV6eG51ZlJCWkdnTldJcVZqNUJMZUZ2WVJl?=
 =?utf-8?B?d2Z1d1hjeUx6R2lLRHdqMFBSSjhTNXIzZXFSUUhvV1hYM1VLeC80cXdFVW1Y?=
 =?utf-8?B?QXR1MVJPd0xpUk9pdjVtVnliOXp5b0U5Sm52Y2thRFRDOW9TZkR3QWRMcWtO?=
 =?utf-8?B?NFFvVm51RmNVYi9QUGJjaVlnT3IwWVlSajk0YmVwU2FXd1pwZ3FKSzNWMlZ1?=
 =?utf-8?B?NFNSKzVxbk5USGlVZkV1Uk8vTE9aaHJPQkRBQ0pnd2NZV3FCRTAvZkthZTBM?=
 =?utf-8?B?NVZlMjZJblFGcE40L2d2ckZIa2RETElBeDNuZkw0MmNKNFVWcDhaTTc4THVj?=
 =?utf-8?B?SFRqVkJTMWE2a09udzEzVmZxaUJhcnE3ZVg3U2tKdmJ2bUJ6THlyenl3WDZQ?=
 =?utf-8?Q?QYIw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 12:50:51.7841
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 411180ac-0ba8-4744-03a1-08de3e34137a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9258



On 18/12/2025 08:44, Oleksandr Tyshchenko wrote:
> 
> 
> On 18.12.25 02:05, Stefano Stabellini wrote:
> 
> Hello Stefano
> 
>> On Wed, 17 Dec 2025, Oleksandr Tyshchenko wrote:
>>> Creating a dom0less guest with a high vCPU count (e.g., >32) fails
>>> because the fixed 4KiB device tree buffer (DOMU_DTB_SIZE) overflows
>>> during creation.
>>>
>>> The FDT nodes for each vCPU are the primary consumer of space,
>>> and the previous fixed-size buffer was insufficient.
>>>
>>> This patch replaces the fixed size with a formula that calculates
>>> the required buffer size based on a fixed baseline plus a scalable
>>> portion for each potential vCPU up to the MAX_VIRT_CPUS limit.
>>>
>>> Please note, the change to DOMU_DTB_SIZE formula would result in
>>> a smaller buffer size of 3072 bytes compared to the original 4096 bytes
>>> on Arm32 platforms where MAX_VIRT_CPUS is 8.
>>
>> I am OK with this patch I would only ask to retain the minimum size of
>> 4KB due to the possible presence of passthrough device nodes.
> 
> I think there might be cases when even 4KB would not be enough to cover 
> the whole dtb with passthrough device nodes. But the existing code 
> should already handle that, so if a partial device tree is provided, 
> then it will be accounted separately:
> 
>       /* Account for domU passthrough DT size */
>       if ( kinfo->dtb )
>           fdt_size += kinfo->dtb->size;
I agree with Oleksandr:
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


