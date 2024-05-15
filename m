Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7798C6998
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 17:24:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722488.1126491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7GTz-00034L-Mm; Wed, 15 May 2024 15:23:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722488.1126491; Wed, 15 May 2024 15:23:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7GTz-00032P-JS; Wed, 15 May 2024 15:23:55 +0000
Received: by outflank-mailman (input) for mailman id 722488;
 Wed, 15 May 2024 15:23:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6wQf=MS=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1s7GTy-00032F-R8
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 15:23:54 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2009::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 226ed3c2-12cf-11ef-b4bb-af5377834399;
 Wed, 15 May 2024 17:23:52 +0200 (CEST)
Received: from BN8PR03CA0035.namprd03.prod.outlook.com (2603:10b6:408:94::48)
 by IA0PR12MB8350.namprd12.prod.outlook.com (2603:10b6:208:40d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.26; Wed, 15 May
 2024 15:23:49 +0000
Received: from BN1PEPF00004684.namprd03.prod.outlook.com
 (2603:10b6:408:94:cafe::86) by BN8PR03CA0035.outlook.office365.com
 (2603:10b6:408:94::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27 via Frontend
 Transport; Wed, 15 May 2024 15:23:49 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004684.mail.protection.outlook.com (10.167.243.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Wed, 15 May 2024 15:23:49 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 15 May
 2024 10:23:48 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 15 May
 2024 10:23:48 -0500
Received: from [172.18.62.51] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 15 May 2024 10:23:47 -0500
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
X-Inumbo-ID: 226ed3c2-12cf-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oJ9AAeVPJuQpISXGpV31MYInpFq4wjJPCjyadebfdJjk76uSrbdUmIMMJlIXHKsJsb8TZ1ym0csngMwljG/Lc+/bizMg6whtduY1PkcHNxH6Vxx7sp8f+oW6+P70dBSa7QhBEzid1PUUNJV3xaiJv/g+rhxv+uWt5l8Kc74rR948xM37JU3xDG0J3LuLRLnA5t5xx15IqE7cqvgCalE+RO1i9vWSXSr5NlepnHk5GsiR7fWv5z2pGRfteDKEezTXRTU3/+rwPOu5G1P7KQjl7E8Mlt8Q4PJVdjc5CeW/vVnIiW60MUjI66B4dWZakgWYNoGbQ3L33TICiwcz8g8RdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UzRJOqZMNHQhajyVvCP+iCeSVE5aHh1KCTZRWHK+bPI=;
 b=S3DG30MLhZeauuuMi7lbvpVaYDZCwVuGJODU3VGfF/iQM95m+9CfQhFQSAXHLIijDZF/pJh83B9xWxvfoQIm1+A2l2SVCQ3awL6s2SCxLiRip+iZmbFJrg4fVY7wbpU6bjbmnIknrCKr4mBzJnTRAyHnwRVCSiva+Wl8Mh0R4SB6ejAjae7r8wl4+Rd5FQvNP/5/wrfplxFW34welByTpwKZFD1qob+iWxTI8BsGI8PIKiStlzew6g0CejuCssiZqHXg+fORo6DnD684Ty0fCkKp6nvFEpAAdowGKYSuLPTFeXnunP8OGRWPWYYG9byuUaNL2jdE5HJaKP9nRvxoBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UzRJOqZMNHQhajyVvCP+iCeSVE5aHh1KCTZRWHK+bPI=;
 b=IPn/IjlsNejTVu2IWYmeTHwV5fhEWOVeE3XvudrZPffI+GX8DNyrs1sN74GK555a+zXRC0TzCUgilNLNv7SkVMOFhjCn7vvjssRsJThCh2oUwHXhfvoAb+2IyMVzA9wUCcc6wf7L0v2LWNw4rOM5ZnMv7MHZpOnhYZ9ifbueH50=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <21878244-b04d-4dfa-a8e2-347e9d40832e@amd.com>
Date: Wed, 15 May 2024 11:23:47 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 5/5] arm/vpci: honor access size when returning an
 error
To: Jan Beulich <jbeulich@suse.com>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	<xen-devel@lists.xenproject.org>
References: <20240514143400.152280-1-stewart.hildebrand@amd.com>
 <20240514143400.152280-6-stewart.hildebrand@amd.com>
 <cf646df7-0e92-4138-8b54-471c72f44cb8@xen.org>
 <735c3e3c-d70a-40f5-aca7-f134bc5b98b1@amd.com>
 <20335f55-4b16-45e5-a8aa-868006b57ca5@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <20335f55-4b16-45e5-a8aa-868006b57ca5@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004684:EE_|IA0PR12MB8350:EE_
X-MS-Office365-Filtering-Correlation-Id: 6842ecd3-4543-4cd3-7cab-08dc74f30534
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|376005|1800799015|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d3Q3UUNYbmxMVy9EUkVaaUJEVTlSanFyZ0hZM2tPTG1FU1VndzFwSGhOeUNy?=
 =?utf-8?B?Y3pIS2ZFdC9TcmViM2IybFlDaDBnUTY5SXFNV0xyYWlyZnBlcWhuVmxpcUNY?=
 =?utf-8?B?ZXAwU2d5b0w0Vy9OdXhObm56SzJzV1VCOFZqMWVGYVNjUk50QmZyRDBkSUZX?=
 =?utf-8?B?cXlrUzF5bjJ2Q2U1Ulliem85L3FJVzhkODlPTDE0WStLN1c1WmpLVWVDTVdX?=
 =?utf-8?B?NjVGclJIM043ZXQ4Rzc3ditWc0hUVlFwd3hXNUtCRmJ4ZGJyb3A1YmZpb3Zv?=
 =?utf-8?B?aUZCOFNsdldPOVExV3Y5ZVErRU9WQ0FoS2tNbHZoSXp6bEZSTWdjNHVLRzgz?=
 =?utf-8?B?UTRpQWhZdUtFb245Q2N0M2U5OEtwUzBjZUhFYTh5aiswcmoyaUVKNk5BTEFo?=
 =?utf-8?B?bzlwUWE4K0RrWlJsdWtLenBBaVZqb1pYY1JjVTNGZEdid0VOVU9OM3ZuK0p6?=
 =?utf-8?B?RVRyK0wwcFFEUkhTeGNBOEttZG1oN3FWYW9JQmN1U0pOOGhLa21ZY3BzYjJP?=
 =?utf-8?B?c2tiSDBoZFpaQUxyTTQycnR0U0ZoZXpvcU8yM01vYjhtTmF2Ky9rL0JYbWZw?=
 =?utf-8?B?SUc4dDR0WGlDekdIS3ltYjNwNVY4Rk1zaFFNQk16VHNpeCtWd1VoUWtGNlp6?=
 =?utf-8?B?S2pINy9mUW8xTjV6TU9TOE5XdWNjb3loaTNYU044b1d4ZHhQRENMVUVqZkFI?=
 =?utf-8?B?Qmp1Z2FUVDBjNDR4MlZYTkNYTDVFY3BXc3FPQnFzckxvZHVVa3RTRG16UVJG?=
 =?utf-8?B?V2IySnJxR21BVGRHc3piaURTdFd2M0lsQzZYUU5WRC8yaXJRVDdVK3E2R0lC?=
 =?utf-8?B?RHVrNVlhSVBwM01IcU1wUGxoK1BKeUZLdVFPNXo0dWtNMGNsK1RDVzNQSU9V?=
 =?utf-8?B?alJ3cTVWQ1Y5QjlxQUxqRWZyckNKb0NjSkY1eGxGNFZUNS8zckdyVUYwQ3ls?=
 =?utf-8?B?VkJCZ0hBdUV6MHUvYXpGbm1TRGxLdGtvLy9CaUp0TUxkV082RUtzTmhDclUy?=
 =?utf-8?B?eEdlRi9RQWVEbzhPR1EvN08rSkRHcnludk1uZXhRdmkzeTZ2azVUSnhocWxO?=
 =?utf-8?B?YVp6U3RieXBTZm52OXRjcU54dmZZek9kWVp2bFptRjdmbzBWaEcxTFRScFhF?=
 =?utf-8?B?dDcwanAxMWc4cHlPeHVCZHBDSytqaWl0bXlTbElOMmt3UnpXNE1SVDd3TW44?=
 =?utf-8?B?YVNNTUR6WktRV0Urc2VWaUhKdCtwbDluZDBUd05xcFAxdnhja3hOeGh4M0VI?=
 =?utf-8?B?NVFiVCt1Vmk0SUVSVkJGRnBrK2prWlRKUC9GRFh4MHZlUlYzdEpESytlZlVU?=
 =?utf-8?B?UC93d1QvTnpYZ3RkRHFmWDh0K25SMXlEZUxmZ3FEUWVSQWxGSnk1M2JrUUxv?=
 =?utf-8?B?MHlmaXQvekhFWlE3eWlNYklFaXNYMjU5b3VnblZIUHZYa01Xa28vU25jdHVK?=
 =?utf-8?B?MDdlek01emRicEpIV0VZZEhvT0h3ZjY2MXBqMHVHN0dVTXA4aVdTUXVWcTQz?=
 =?utf-8?B?UXBmWmowbytMaDNMNDNjOG9UY2hjZkR0U1Fka2wvK1lyTXplNnd0bWpHOWJC?=
 =?utf-8?B?dnhjcmxXS0Q1aldLaFl3dUFyRnd3RFdoZ3dkUm9oOXZLY0lCMHhQaTJUck9W?=
 =?utf-8?B?QUYzZDg1SE5DOUQ2MkFpL3VUVkkzMm5xN3FvRUdVa0kyYXdyakpaT0RxUnNY?=
 =?utf-8?B?QnIxNThpbW1FMERYMExSUERTMGpVUU4zcXljRjEwa0xVSlJXWnRNTCtJR3Bs?=
 =?utf-8?B?ZlJLc3U4bS9POWxhbG4rYjVLdThoNU5YRjI0Rk9vY2psbjEwTzI1c0taU2xs?=
 =?utf-8?B?NnRtRUhzOU44N2EvbHBKRXM4cWkrZkFXYzhGV1hxcFloS2Z6Ri9uMlNHVlNL?=
 =?utf-8?Q?NaVzvz9XC3Xpz?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(376005)(1800799015)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2024 15:23:49.2656
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6842ecd3-4543-4cd3-7cab-08dc74f30534
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004684.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8350

On 5/15/24 02:32, Jan Beulich wrote:
> On 14.05.2024 22:31, Stewart Hildebrand wrote:
>> Here's what the patch ("arm/vpci: honor access size when returning an
>> error") now looks like based on staging:
>>
>> diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
>> index 3bc4bb55082a..31e9e1d20751 100644
>> --- a/xen/arch/arm/vpci.c
>> +++ b/xen/arch/arm/vpci.c
>> @@ -29,6 +29,8 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
>>  {
>>      struct pci_host_bridge *bridge = p;
>>      pci_sbdf_t sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
>> +    const uint8_t access_size = (1U << info->dabt.size) * 8;
> 
> And why exactly uint8_t here, rather than unsigned int? See ./CODING_STYLE.

I'll change to unsigned int.

> 
>> +    const uint64_t invalid = GENMASK_ULL(access_size - 1, 0);
> 
> I'm not entirely convinced of uint64_t here either, but I'd view this as
> more borderline than the uint8_t above. As per ...
> 
>> @@ -39,7 +41,7 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
>>          return 1;
>>      }
>>  
>> -    *r = ~0ul;
>> +    *r = invalid;
> 
> ... the original rhs here, unsigned long (or perhaps register_t) would seem
> more appropriate, but I have no idea whether on Arm32 info->dabt.size can
> end up being 3.

Well, it depends which spec we look at. In the ARMv7 ARM, 3 is reserved.
But in the ARMv8 ARM, in the aarch32 section, 3 appears to be valid...

Anyway, since the value returned in r can only be as wide as register_t
due to the way our mmio handlers are implemented, I'll change to
register_t for now to match the lhs.

