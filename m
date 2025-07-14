Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65181B04035
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jul 2025 15:39:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1042831.1412894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubJO9-0007gu-14; Mon, 14 Jul 2025 13:38:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1042831.1412894; Mon, 14 Jul 2025 13:38:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubJO8-0007eD-U1; Mon, 14 Jul 2025 13:38:36 +0000
Received: by outflank-mailman (input) for mailman id 1042831;
 Mon, 14 Jul 2025 13:38:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jbYV=Z3=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ubJO6-0007e7-QD
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 13:38:34 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20626.outbound.protection.outlook.com
 [2a01:111:f403:2416::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc9e4b0f-60b7-11f0-b894-0df219b8e170;
 Mon, 14 Jul 2025 15:38:19 +0200 (CEST)
Received: from MN2PR15CA0004.namprd15.prod.outlook.com (2603:10b6:208:1b4::17)
 by DS7PR12MB8289.namprd12.prod.outlook.com (2603:10b6:8:d8::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8922.33; Mon, 14 Jul 2025 13:38:13 +0000
Received: from BN3PEPF0000B071.namprd04.prod.outlook.com
 (2603:10b6:208:1b4:cafe::9c) by MN2PR15CA0004.outlook.office365.com
 (2603:10b6:208:1b4::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.30 via Frontend Transport; Mon,
 14 Jul 2025 13:38:12 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B071.mail.protection.outlook.com (10.167.243.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Mon, 14 Jul 2025 13:38:12 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Jul
 2025 08:38:11 -0500
Received: from [172.19.134.125] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 14 Jul 2025 08:38:10 -0500
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
X-Inumbo-ID: cc9e4b0f-60b7-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sBKGDvyOaimIXUg1FD65nd4ib/CLPvjgwCS9JFpfoZ7cggcz947VOpt1z0Smb1joQQ4kEfszJJNdONC3f0HbK+568PFBU6MrXX4bPbkZmSTEIY1bZdrREpi7EkeNeM+c2unfeCPd0Q7wmOdoqypXurMV7jTuyff78OnhAU+EKlLBMX8okY3VtnKbpJRWuj2TTurbM1qUQZRtLrnpaZGhLuN28QOmSxNyMXQIwBZunFFFTMNDt9jpFNPGDbIrsluyonj7wHk4PmlArgPqYQ5DvGvSqIeMWuL4NP1HTi1NcrzLkXmr2/+JmAFWHLOz8vNNJfMEM6OFnUY9UdBe08c9cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EiOa0RXYk6hL1L0l/E/YibeHnKTP/uVHCkscMF7expc=;
 b=QG6LdL6o/W6rKqMJmjC+NjXTrmjej8qX/qbbVP57GOfEMON8I8fgQ7NG1b3/z31l1aj6pgYCiDsVJaoPcgS9UIEckMkf6gyWuQd66zTd07uCTze2ttFqSCljqmKhYwyJYp6G5E0LbZQec2EX/asYk/UYKS2wUKRUESwUc9sD9TEBGPSGoEQ4c2zDRhV1rzzGenHfd4GuRfGfTHjH7jyR781pD//b3qn4dGghPxMfRlx2J9C6z9habGRr1oelxe11tkWSTy9Yc71As8cyvYe2kolm8DnVCehBzuKo8eedRMqq99425NRkSy0fT3154/Gj1LWPc5kDuCS9ZvHceRJcOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EiOa0RXYk6hL1L0l/E/YibeHnKTP/uVHCkscMF7expc=;
 b=X1Q8zqpzBAp1g57WZL2DESmz8f/YwhrgVDCj/p/2oiJ0VpRwaYEETvbYCMoLoYit02igRGxG1pYCOhW5De9hxLmL2mP5zZE38O/moT8lVt254sJLaJk8JD4XqkcgZRQQq87Vcf5LNH/W7/R4F1rFzNZrALhyjaQspli+0cnZ52c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <cd0faf06-de59-45ec-9b26-124dbb34e38b@amd.com>
Date: Mon, 14 Jul 2025 09:38:13 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm: fix arm_iommu_map_page after f9f6b22ab
To: Julien Grall <julien@xen.org>, Stefano Stabellini
	<stefano.stabellini@amd.com>, <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Rahul Singh" <rahul.singh@arm.com>, <stewart.hildebrand@amd.com>
References: <alpine.DEB.2.22.394.2507101724180.605088@ubuntu-linux-20-04-desktop>
 <d62f045d-86ae-4ef8-bee5-225b8fa6594d@xen.org>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <d62f045d-86ae-4ef8-bee5-225b8fa6594d@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B071:EE_|DS7PR12MB8289:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d74aec4-6be8-41e6-f5f1-08ddc2dbad9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Vzl0SDNpWlVSbzFsWWUweDdJL3Y0OW1HeVlXQlNwMmZBZjl0WFBWaDh2TTZo?=
 =?utf-8?B?ZVZ6Zk1hditWV2ZqcXZWRFpCcEpMd3Jha05OdTFKdEJJMUdiTEZVWnNTN2h0?=
 =?utf-8?B?WERacU5HTy9BV1pwWTZJMURmUnBLWXJEK29VelNTd25XUGJobitDV1ZQUFlU?=
 =?utf-8?B?RHppaGZqUEtDU0ZYcEFuTFJqMEIrZjBnb211ZXpTQmFDQjVKVFR6QjdBZTBJ?=
 =?utf-8?B?L2k4K2V0QjEvMlVJZmhyeEVzQ3U1V214NUgrOUMyMmlrMlk2QUJ4d0JaOFJN?=
 =?utf-8?B?bEFuV0t6WVBmVCtrcC9pZ2oxbjFhT0FLVkZaQVczcGVvaExEM2Ewd3BWSDQy?=
 =?utf-8?B?WFhwY3hWKzhNSXRNeFJTSG5uKzhiRmFEeVpiUXRORVVyQjgwazNhZGZuNHAr?=
 =?utf-8?B?eHFpVE5hdEt5Vnp1ZXJHSmU1SjBmR0o3bS83M1Z0TjlxellneHJJb2pDdDBw?=
 =?utf-8?B?dGd1NFpRcGJUcG9kWEhCbEIrWUxCRjYwNTRVQ1I1bER5cFMzeS9hVUMxKzEv?=
 =?utf-8?B?b2VtUHY2eEhLcTRCYUxuOWduVUI2NWpjWmw0dE45dnRmMGdlK21GaEdwcW1Z?=
 =?utf-8?B?UDJ1RHZvdGo2ejNXdmxBV21Ndk1nSGVxVUlHK0hvNGU4RGVMcCt2dUd4Zm9O?=
 =?utf-8?B?ZjI0R0ZZdXZ5dVhFYURRYXFKRS9LWFVIZmd2Zk1DMFpSSzlmR0pmVzEvYTNX?=
 =?utf-8?B?a3M2YjBsYkFROG82SlAwOFM1b09YR1hkazdTekR1ZUlwSjVaVGJFY09HV0pF?=
 =?utf-8?B?blJNSjZZUE16YWhEcmwycWpEU0lIU1ZVdGRaVjhacE4wOGQxVE4xajZCcGo2?=
 =?utf-8?B?cm1SdnpOa3hDclNMU0ZaM2tYZzh5ek5jclMyd2RDclVYbDF5aFdhdS91MTZq?=
 =?utf-8?B?cDlxaE1Lb0NHSms5ZHNnRDdseXJhdnBDVDhMMkFPRjFBQlpYWk5TaVJIWDJy?=
 =?utf-8?B?QW95Q3hTU2pZTks2YUlxZkRlMERmT3dBSzhCR2ZFZ3BWY0VQMi9KK2YyNUpx?=
 =?utf-8?B?U1BzZ1pGL3QyNm9IbXJPUXhydGVqREJVNFd5QmNiaEVWQzhwaFlZVGhqNWd5?=
 =?utf-8?B?bnc1WVpYTnNpb05xN2lHTDlDOVJ5UTcveWlkU3JXdDZIc01EcjlCekhZQTlD?=
 =?utf-8?B?M1dJUm1KemJVODZabWp2S05VNFFtWTBUZW9RQzBEUjhXV1A2ZGhFekthNVpt?=
 =?utf-8?B?eWxHWWs2c1Ircm55QWN3bnBhK2N2ak4xdWhtcks5RGFiTHBESmxQNTdidVZR?=
 =?utf-8?B?OHYrcjczSUMrUzdYZXBMN0l4L1M0azRmQ2gyUHBZVlFDZ3NKNnBHbjF6K0pl?=
 =?utf-8?B?QkFNNGJWa1RYM0lHUjZXR1Bhak5LOTVMUndKK0NwZS81ekhXQTJyZXVaZHU0?=
 =?utf-8?B?STUzM3ZnWGlXQmhoZXY2b0pVZTN6TTY1Mnd1YlhnQzFYYVBUc0Q4cUpRclR4?=
 =?utf-8?B?RndJS1JnNU02eXhuOTROMDFIZUdKZ3kxdGUydXNRb1FXbE0yQnNyTXNud1Bw?=
 =?utf-8?B?WU5NMlRuZUdON0pnblJkeXNYVXBUb3c2RkZPZGRDZ0FuYzNrd0tkbXFkMVlG?=
 =?utf-8?B?S1hXendYRjUzVk8zd08wRXBNYUhTTnVQRzRYVFpPYmduUXFLVkkxUWVKbXJU?=
 =?utf-8?B?V0ZFYlBGdElyNzhjU3Fsd2ZPTEZaSkpuLy9tNzdjSEhtdjh4cXlOTnlEa2JY?=
 =?utf-8?B?K2o0MGRPYU1nb0NPeGVCZzN2dW03d1F2K21xUEVjcXlScGdtZE15eU1DamJN?=
 =?utf-8?B?cG84NEZPSnBFNzhHRjZrQi90OXcxMHhpempqbFY1NVRiWVpuSjhlT3NaL0h2?=
 =?utf-8?B?anFTaldJUXpLb0xsbFVUdW81cm1idTI0ZlZ1Z0JNbE9ta2dpVytvQXpxcXZw?=
 =?utf-8?B?bUM0Vjhjb1k3OFd1S3BmdkZLNEVvbG03bzJteHNtaVFqSmR6U1p2WWNsMUFU?=
 =?utf-8?B?enZNMnVad2l4SGxQVHZXZVhaWkdlRW1hV24rR09qN0VZelVTdE91MGhpOHM5?=
 =?utf-8?B?cTFRV1h2YXVRPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 13:38:12.2621
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d74aec4-6be8-41e6-f5f1-08ddc2dbad9f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B071.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8289

On 2025-07-12 06:08, Julien Grall wrote:
> Hi Stefano,
> 
> On 11/07/2025 01:25, Stefano Stabellini wrote:
>> Up until f9f6b22ab "xen/arm: Map ITS doorbell register to IOMMU page
> 
> Everywhere in this commit message, we are using 12 characters commit ID.
> 
>> tables" the only caller of iommu_map on ARM was grant_table.c which has
>> a specific usage model and restrictions as described by the in-code
>> comment in arm_iommu_map_page.
>>
>> f9f6b22ab introduced a second caller to iommu_map on ARM:
>> vgic_v3_its_init_virtual. This specific statement in the
>> f9f6b22ab commit message is wrong:
>>
>> "Note that the 1:1 check in arm_iommu_map_page remains for now, as
>> virtual ITSes are currently only created for hwdom where the doorbell
>> mapping is always 1:1."
>>
>> Leading to crashes any time the hardware domain is not direct-mapped
>> (e.g. cache coloring and non-Dom0 hardware domain):
>>
>> (XEN) Xen BUG at drivers/passthrough/arm/iommu_helpers.c:49
> 
> Are you using the last staging? Asking because line 49 is a blank line:
> 
> https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/drivers/ 
> passthrough/arm/ 
> iommu_helpers.c;h=5cb19874819357b5cd58638864b56c505d07b37a;hb=HEAD#l49

This is my fault.  I added some debugging code and shifted the line 
numbers in my original reporting.  47 is the correct line:
BUG_ON(!is_domain_direct_mapped(d));

Regards,
Jason

