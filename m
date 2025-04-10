Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FF8A84EDA
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 22:56:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946307.1344246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2ywI-0002il-KH; Thu, 10 Apr 2025 20:55:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946307.1344246; Thu, 10 Apr 2025 20:55:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2ywI-0002gh-Hi; Thu, 10 Apr 2025 20:55:58 +0000
Received: by outflank-mailman (input) for mailman id 946307;
 Thu, 10 Apr 2025 20:55:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z2Tv=W4=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u2ywH-0002gb-7m
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 20:55:57 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061a.outbound.protection.outlook.com
 [2a01:111:f403:2414::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31539a06-164e-11f0-9eac-5ba50f476ded;
 Thu, 10 Apr 2025 22:55:55 +0200 (CEST)
Received: from DM6PR08CA0010.namprd08.prod.outlook.com (2603:10b6:5:80::23) by
 DM4PR12MB6302.namprd12.prod.outlook.com (2603:10b6:8:a4::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.21; Thu, 10 Apr 2025 20:55:48 +0000
Received: from CH3PEPF00000017.namprd21.prod.outlook.com
 (2603:10b6:5:80:cafe::b4) by DM6PR08CA0010.outlook.office365.com
 (2603:10b6:5:80::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.26 via Frontend Transport; Thu,
 10 Apr 2025 20:55:48 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH3PEPF00000017.mail.protection.outlook.com (10.167.244.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.0 via Frontend Transport; Thu, 10 Apr 2025 20:55:48 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Apr
 2025 15:55:47 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Apr
 2025 15:55:47 -0500
Received: from [172.25.231.87] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 10 Apr 2025 15:55:46 -0500
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
X-Inumbo-ID: 31539a06-164e-11f0-9eac-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ifxrQouetNkvCcou5K4SBo7+5/Yo2JsXnamziFZOan+lZDROMrBzAHi5HYdPXX8Wuj3LMdWi1QecstQx5ToTPPBCk2yaTQLFkL/uOSob9Vgv/Zg2IW/oopplu2sH9crHwWpEZPmyBIJd4/lPKoljSC3Zk0IJtk3CN2CRkwCmrcf6TdudxCXDbUbX4+f0nQs6cujI/x/Q4X1LjQbKIKvF79Bam2vQwlEYRyn5KgoBKGFdd3Fyl8k/9oafDyF8D5nVBT05rT1eGlwbE0wrzuYTPv3pklWKlQaADdS6kI+SEGjI0tF3UclRnJWqlGqAs9UkjeCC/kxrGRLh73EHyWggNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BYHQvq1hyGnCKt+p7ZvcOzIMDdF4s+K35zHZIvIAVgk=;
 b=oe6W3H8Q16EkbnE7D171/9kIV53f8TB4rainwofzBwGN5aTxh+7xBgxoqCyTdaU47OwSMAOGlzK21/wSBYfM1MCH/O5dlYG7aWiqDXaTaKV0vfwPLYn1o3mvJ9G0zQsllNyI1lCl+tjOtUvTMSSqUruMquEGAiqA5+GFQSIiPIigVdqzWa1agYkeBO5qxxQdXLpRBJLRlXrG1nkzQyk2iCqH1mQLStSHN1koPaIt0N37pkh8Ub3MAnRoaOWWEdd8HtTZ44sPrCFkMGKOb19XdT6cnuflGxnIKNDwXJEHRo9njDVUBD9hfjDNjcz1ny0BnraUfY4XoriTCnOkZox4qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BYHQvq1hyGnCKt+p7ZvcOzIMDdF4s+K35zHZIvIAVgk=;
 b=szYA83kHZlnNsMKHnZqJFBljm5QsAUsKFA861dAadMiPkKAOLluca+Hd0UyNZSfKjk+FATD2TXAAjNR+s2Z4k5jubYDX/vU6NcLxYGFx2tdHI+rdsVFxmrOf488umGhbNCb/TRlRp4B9OqdJ0bUeN8Y2PJGPBUO/sbujzxYH14w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <dbec0b5d-e15b-4a7b-8b11-126c8345052c@amd.com>
Date: Thu, 10 Apr 2025 16:55:48 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] xen/x86: allow overlaps with non-RAM regions
To: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	<Xenia.Ragiadakou@amd.com>, <Alejandro.GarciaVallejo@amd.com>,
	<xen-devel@lists.xenproject.org>
References: <alpine.DEB.2.22.394.2504031755440.3529306@ubuntu-linux-20-04-desktop>
 <e8ca1efb-384f-4c60-94b2-95528301a156@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <e8ca1efb-384f-4c60-94b2-95528301a156@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000017:EE_|DM4PR12MB6302:EE_
X-MS-Office365-Filtering-Correlation-Id: 06c3967d-220b-4226-142d-08dd78721218
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dUY3b2dLZy9ObW5iajN4SkxUenVzN2dSNFh0eWMwSTZFaGtlYVpVL3IzNDlY?=
 =?utf-8?B?NDUyTjViaENiS2dGK0dxQTY4LzVFZFJkeEFaWjYwWXNIWUM3QWlYUksyQzhh?=
 =?utf-8?B?UWpYc0dhNm1xeXVucDNmb3g3TzF5K01WL3FoSjlmWitoR0xaZHNiZ2hLQ1Vm?=
 =?utf-8?B?ZTRyLzlNRk5YY3h3TTJwQVhsNythUmpCNkFjOTB5eFJtbnQwY0hmQWxaeGtu?=
 =?utf-8?B?ZlNKU3BLWnpwbTRXV0l1dEdSVmJYMjlsTUJUbVNLaVFaSmlHL0s1TUpoNUJ0?=
 =?utf-8?B?cFhUU0kxZDN5bmNiTm1DOEtwVlN6cnNVMjdWWWNyQ1pyMzlEZzFZNVp4Rmxh?=
 =?utf-8?B?RENLNGFYZXUzR3N1NlQ5bXR6a3A0dFB1aEZkMGdGZVp0L081Q21ueW4xYThM?=
 =?utf-8?B?SmVCNi9wZFRsbDlGY1BUdmpsT2Y0ZVdid3J0VmNvRFVFclloMnNCWXpjSURz?=
 =?utf-8?B?OFJWYmUrZW95ZE56SU1tdmEvZFNkUG9oZjRhRHRVdjR3YnJlMmc1RXdGRGMv?=
 =?utf-8?B?TEtZQ1FVTlJzNFREYzNmeXd6MlJDbVo0OXhUbk9ZZ3hLaHlWM2JuYW9VYWdS?=
 =?utf-8?B?d284SjByQjROZTZIVHJUMXpXVVNuSmdVKzhYQ1FLT0pnMjFIcVNYRzhNemdB?=
 =?utf-8?B?K2MwQW02NmF3N3M0SXNXeDBBL3F3RjlVZWNUSENhS1R0UFlLV1VPT25IUEEz?=
 =?utf-8?B?S3F6TVBQZkFyUWRiZmxsN3F6QU1mRXRhenQxVysrRUxvS04xQTdGaTlkVWhv?=
 =?utf-8?B?UldPbFZTYnVMeStJbVVIT0loaVVxOUxPc2p6YXdHWmhLdUkwL3Z0OURra1RG?=
 =?utf-8?B?OGdIcFNxcld5bm1ZQ0x4b2kyenJSamJvV2luRVRiOEcxQkJyQ3JvbFFWdmE5?=
 =?utf-8?B?M2hzRVk0emNiU2ZvcndIaEd6NnoxU1NQUE9NYjRiNkVtOXpuSVdMMXpJUURo?=
 =?utf-8?B?MGd1Wi9mMHpmWStaZE4rT1FNMjloTi9NNUt6Y3Q5TjdFVzh0OE9JUmJhRnFk?=
 =?utf-8?B?QTZZR2ZmcjNraG9jQTVscDZSbXNjNFZtdkpMcDlTc3FUQ294Y3dPMjZhVlV0?=
 =?utf-8?B?WFpQL2haTnA3dnJ1ZHVSNE5EVzVBem1nUURLK08vUm80M0FNOUx0MURFenBl?=
 =?utf-8?B?WitxQTBKeWZRT0xDbUZTOWQ4RXJFZlJPNGdSSmo5R1pERWc2ZHpXQVM2MmJG?=
 =?utf-8?B?ZEdJQjkwZFQ1SmJ4RzVPeGRTaHJ6OGY2eElldnRnb1crUWZUOHgwN2c2SGVv?=
 =?utf-8?B?SnhkVDNsSW43WXR2Zlp0Z08ydTkxY0UvT2lLTFRtRzdjcjMyMGhHQnRmRW9P?=
 =?utf-8?B?bm1EWXBsdkl4ZlM1TWY5ak1Cb2I1SkMzdHJQbFFYUUdVT0NVSUpnOGZrQmR5?=
 =?utf-8?B?aEI0dkhIRCtva0orNEh4N2NVOGlTNXQrTkFPd3JPTlR1SE9qVlFvMzVRWTMv?=
 =?utf-8?B?cjdFNFJEcGduNjhjRyszUkJJWHBKZ3k1S05zRDNQNDB5TmR2TUNYM3M4LytO?=
 =?utf-8?B?Ni9NZzZFRUdlaU16b3ZmVEJYblRvQkJpS2JtcC91eDdPT3VaUS85MzRGRVg1?=
 =?utf-8?B?S09rQXBMNU1NZjB6bFBZN0pEQXFEQW5zZnA3dTM3dXUvcHZ2ak1CZXBWdDdL?=
 =?utf-8?B?SGNwbmdodEJXRGJaT0I1eTQ0eDM5ZzU1WjZQSGtPSktPa1BNT1piUHM4cnQ2?=
 =?utf-8?B?TXFmT2J4RVRVYVlrQzdFMHFhTk5VRG1UcHg0aXlFd0EwMUw5WXVMMFpuaU1p?=
 =?utf-8?B?MDFkYmc1c3ErZFJOeUV6Z3hXNFErck5uN0hhZElPMHg5eDNkc1V1QWhFZkRK?=
 =?utf-8?B?RTkrSUxrZ1kzMUhUdjdnNWxiYmU2dFk2dVBJbDN0ZHo0ZEZxYnc1Rld2NVFQ?=
 =?utf-8?B?UHc5RFZyTTM4bTNYKzdWdWxCNU56YVBwc0UrMHBpdzRTY3RmdXdHQm5tSjNN?=
 =?utf-8?B?eFpReDdtVFZkSjVyamFOMS8xaXZUZ3RHaVVFOUZpWmJZeDlVUXRyVlJCSmdG?=
 =?utf-8?Q?rfjnz9weRQxKxGNX9iYkteDI5GGhHQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 20:55:48.0999
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06c3967d-220b-4226-142d-08dd78721218
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000017.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6302

On 2025-04-04 04:07, Jan Beulich wrote:
> On 04.04.2025 03:01, Stefano Stabellini wrote:
>> On one Sapphire AMD x86 board, I see this:
>>
>>
>> (XEN) [0000003943ca6ff2]  [00000000f0000000, 00000000f7ffffff] (reserved)
>> (XEN) [00000039460886d9]  [00000000fd000000, 00000000ffffffff] (reserved)
>> [...]
>> (XEN) [    4.612235] 0000:02:00.0: not mapping BAR [fea00, fea03] invalid position
> 
> I, too, see something like this on an SPR system. That's a firmware issue,
> which hence first of all should be dealt with at the firmware side.
> 
>> Linux boots fine on this platform but Linux as Dom0 on Xen does not.
>> This is because the pci_check_bar->is_memory_hole check fails due to the
>> MMIO region overlapping with the EFI reserved region.
> 
> And then what's the actual, observable problem? On my system I haven't
> noticed anything going wrong yet, albeit the affected device is also left
> without a driver.

The nvme drive (0000:02:00.0 with the invalid position above) fails to 
work and no root drive is available.

> Also aiui you strictly mean PVH Dom0 here?

I think we only looked at PVH Dom0.

Regards,
Jason

