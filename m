Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE86B3114C
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 10:12:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089692.1447194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upMsz-0008L4-Q3; Fri, 22 Aug 2025 08:12:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089692.1447194; Fri, 22 Aug 2025 08:12:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upMsz-0008IN-Mr; Fri, 22 Aug 2025 08:12:33 +0000
Received: by outflank-mailman (input) for mailman id 1089692;
 Fri, 22 Aug 2025 08:12:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cd3U=3C=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1upMsy-0008IH-Ow
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 08:12:32 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20605.outbound.protection.outlook.com
 [2a01:111:f403:2413::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be137579-7f2f-11f0-a32b-13f23c93f187;
 Fri, 22 Aug 2025 10:12:28 +0200 (CEST)
Received: from MW4PR04CA0173.namprd04.prod.outlook.com (2603:10b6:303:85::28)
 by DS0PR12MB7925.namprd12.prod.outlook.com (2603:10b6:8:14b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Fri, 22 Aug
 2025 08:12:23 +0000
Received: from MWH0EPF000971E5.namprd02.prod.outlook.com
 (2603:10b6:303:85:cafe::ea) by MW4PR04CA0173.outlook.office365.com
 (2603:10b6:303:85::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.18 via Frontend Transport; Fri,
 22 Aug 2025 08:12:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E5.mail.protection.outlook.com (10.167.243.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Fri, 22 Aug 2025 08:12:23 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 22 Aug
 2025 03:12:22 -0500
Received: from [10.252.147.171] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 22 Aug 2025 03:12:20 -0500
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
X-Inumbo-ID: be137579-7f2f-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ga7xeHUAPX/4KOox0LimwoxCJZ8N2TbxZj2lpQZ7ytry020wdHqxcXN7A6JBomEAwseRpasI+60AYmrygeEdAHJ+Cc197JOpN0KKl4ozh1ZPjaaokhkYHp0zA2hLbm1Z98Lp+PAB0oV952joYnYCKFsWk4mMsuF2Hrs1ij/rvJksU3rng2EJVmB4VPD8WZLJK2SLpwJuP5oPRmfWmfHRpYb1EJWpuEwavW6i8d9qX4ArvdRh4H2tSQxD1lO5YA8h0EnQg743OS2WcQnxOZ4Lic08pEN676dan3vFUrYHQjoE2IKeqExOxo0fUqghSZqfaKUnMKtz5unWySrWod/gNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQw5ZiP/6KXo+yB5VlhXRjgkmQYBUqSOxz+sZjqK76s=;
 b=uYNFFKSPEe6XeFMYn9bipWvbu7Uj+WgN8wCjtjBLK94DSCeNn77T4hjMuCagfmJmKffNnVhgCnug8K0M3JCan2rMqYcITgG3y22jGTN5ZQKfjTi4UBCnnOeen5fdJ5YyD1YsU1zjW+2c2Owf2Moo3T/kgSXNOcDil/tg7llSko8iGl/W/dvAjakt1yNfE4BwKHcDPbCDOhdUozcILN7l1fMwMh3kprCzNsrx76N3OXOmHJRx7VcXFC9awxe9NP0vFW/pSZpF8HduJEwoOCsNRvado3GnPX8mXz8zfe0beWz+2SNAa2xb2d/AGGqnAPfZxthp6HUYsGPxtX/YjZFl7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQw5ZiP/6KXo+yB5VlhXRjgkmQYBUqSOxz+sZjqK76s=;
 b=eBm6HWCZLk2rsXABucUDJVvs9uenJbdCDQY4QuKOLz9kDZvyQNhmGmbPHq0sG8sQTs2OO8Z4nUIS/BZ9wDIU8SW5mOpUg/pCbmXmnpY5K9M5KOfzKF7/h6i7lBoO1m4I9siF+Frnj0w7IjDwuYp+KYYfT3qb2dC9BmjtkGsQPrU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <cff3e94c-4476-4103-ae7e-19656703e755@amd.com>
Date: Fri, 22 Aug 2025 10:12:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: smmuv3: Add cache maintenance for non-coherent
 SMMU queues
To: Dmytro Firsov <Dmytro_Firsov@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<rahul.singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <24567cc1630b1577c33939ff71d67fb2ebe5572f.1754491424.git.dmytro_firsov@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <24567cc1630b1577c33939ff71d67fb2ebe5572f.1754491424.git.dmytro_firsov@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E5:EE_|DS0PR12MB7925:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f8e10de-93b9-4b42-2c8a-08dde1539f8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZUhHVW1kRE9yZE1rMUtQcDU1VGZ1Vk5lY2dXbEZiQ2hzV1ZhZU1WZ2JKazNN?=
 =?utf-8?B?ZzM1dzQ3MUh0L21uU0NXYkF4U2o0QnA2bThJUXJBTXgzK2hGaXpjQ3ZQWG9X?=
 =?utf-8?B?N3daUVVsMEtGbzd5Sit3azN4OVF3aWV4MUdzMnhOVFpGeXBkTGx1NXJneEgx?=
 =?utf-8?B?Z1dDelNRTWkrU3h2eWNsVHhPQkx5ZE5lV2xVRHdsaTRJNE5jRXZ3R1ludWNs?=
 =?utf-8?B?NDVKUi8zODZpMUFpY1ZjWGhhL0tKVGw5VDNORFo4UEY1NU5hdjlRdHJJWlBD?=
 =?utf-8?B?ZFozbkhFeGFnOE1hYWtEUGNac3ozSzlMa3NZSmt4MDNWWjhKbStFRUpKekc0?=
 =?utf-8?B?NTFxOTVxK2IveWp6NThGZUNRdTNMMDdGOFNkWnI0YUVBemE5Y1FVMmlleFE1?=
 =?utf-8?B?dDNoTHhsTGNKRGIzeFBSY3Z6a2I1WDBFeHJwVWorbUV0eWsveDdEVFZSM2dp?=
 =?utf-8?B?Nmd5Q1gxTWduNDVud3AyenJNeUdsOEdSMGFMeUpPVWJUQ1BuR0ZUMDF0RzZk?=
 =?utf-8?B?WnZSWGMzTjJJZUlGK2tjOXZTbUhCbzRmVWFVaXhPbTNRb01PWnB1eHhBWHNS?=
 =?utf-8?B?dkJmNTYwTVpucEIvVzFpV0paSjFXUUxXUGQwMDljRm5jVWRYUHJKcFpsb29Z?=
 =?utf-8?B?K3lmVWlZTUprUTZ3UzFkb3JPQkNxYlRxL01JY09LSlVwMHlMZnd0aTZzRTFS?=
 =?utf-8?B?ZFNhczVUcU9oK0d4Rmkra3g5SnphQ1dEUTRsUjF1NjkvSUtiYWhxQzdyUlgy?=
 =?utf-8?B?ejFzbnZNOExrTDlkdGJFYVhwUFhUdnRLeGNXKzJPWFQrLzVndlRmNndNMjNt?=
 =?utf-8?B?aDdTS0ttQXYvY1lsM09ZUWZnWm1KNitxUDZ0VllhRWJKbFVRb1NvY2w0eHNh?=
 =?utf-8?B?TGQrUUF2MllSR2NXNEM3ZmR2RTNudkMrdnpwSS95YzE5SkYvZ0FnRkdMLzZ0?=
 =?utf-8?B?aXFocnJpdVNRR1JXNTc5SUdBN2d5Y08vRHdsS0RScGl5TFBMbXZxTkhOYzYv?=
 =?utf-8?B?dDhiK3ZUazBXN0wvT1IvNHQ5eDVtT0x4TDhubThacHB1ZEVvajJ3TS9Ydmg5?=
 =?utf-8?B?WUtjejkwZkdBM1N5cDY0R1oyZ2JWcjlKM2ZQWisyZ3BEK1d2aU4yRUU2Y3VT?=
 =?utf-8?B?WG1obFAvRnZYYkoyQXgrUGMvNUtuZW05WXdnZ3JMY3B0eFhrVE5kbnB2bjAx?=
 =?utf-8?B?RzE5aTIzTjdmNzhaMXk3clRSMHVjcDZCd1NtM2VwUDFmaXJOL3JGbjRMeENV?=
 =?utf-8?B?TVM0VVJGU2p1cGdYMlhWTGVKaGtGVVFua2M3SWgrTm1nc090Q29jZGloSnEx?=
 =?utf-8?B?S3c0VGxyR1RRUGNYYlk0M0Vtc3ZOd2V0eEVzVCtWYlJJMHBDQjlpeks2ZnZU?=
 =?utf-8?B?NDlZZmVHN21zZlRtQThlTGp1QzJGWU45Mm53VytnL0J2eTNsbWlKTnBuQWR6?=
 =?utf-8?B?T1p6VkN4VTY2MlVJcjlZaTNPMlY3QU02em9QREszRVI2UVZTV3RqMkJqeGZU?=
 =?utf-8?B?Q3FuanpURzZXLzhVM2hNWTV1bk1ta1prUUxuSTJtVW1QMUNVYzVVVDNNN0pU?=
 =?utf-8?B?TXhpNnNqZmx3Tm44emtFeEFReWpoSm1xMXg0QzBJNVU3NTh4ZUJFL3hMdm4z?=
 =?utf-8?B?dWE3alU4MlpmYUxnTUQ4enhPTnhNWVUwY0QvWlVseGVKblRSYVpEbWFoRTY0?=
 =?utf-8?B?ei9mMk9hbWpJUlYxNk5OZVRIN3FBRWtvMmtiNk4vZmNyc3NhYWtLNERMTTNi?=
 =?utf-8?B?QnFSYXRIMUJHbFB2QjVZYSsvMHUyUVJuWERSNTE5QmJjMU5BcjJGSnFVQU53?=
 =?utf-8?B?dWVNcHN5NG1mMGNiWW1SZzNLTUx5U1JhSlg1MnRzOERLQlUydm80TWJvNjVw?=
 =?utf-8?B?am5Ob0lRWTUwTmNLY1FOT3dGdVpvU2xEK0IyY2NNRVVXY0dTRHV3aDQ2TFdO?=
 =?utf-8?B?WWRTM2pKSk9UalNFTml3a2hlTDMzOTdrc0VnMlcvSmE3Ti9MYk5JVEVTUXBE?=
 =?utf-8?B?SitPbmNKYm5jWFNYeDNQeUZsSTNGa1N5T0E5bU5MZVoyanp2WVdTVzAyc2dt?=
 =?utf-8?Q?z9Bk4S?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 08:12:23.0502
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f8e10de-93b9-4b42-2c8a-08dde1539f8d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7925



On 06/08/2025 16:58, Dmytro Firsov wrote:
> According to the Arm SMMUv3 spec (ARM IHI 0070), a system may have
> SMMU(s) that is/are non-coherent to the PE (processing element). In such
> cases, memory accesses from the PE should be either non-cached or be
> augmented with manual cache maintenance. SMMU cache coherency is reported
> by bit 4 (COHACC) of the SMMU_IDR0 register and is already present in the
> Xen driver. However, the current implementation is not aware of cache
> maintenance for memory that is shared between the PE and non-coherent
> SMMUs. It contains dmam_alloc_coherent() function, that is added during
> Linux driver porting. But it is actually a wrapper for _xzalloc(), that
> returns normal writeback memory (which is OK for coherent SMMUs).
> 
> During Xen bring-up on a system with non-coherent SMMUs, the driver did
> not work properly - the SMMU was not functional and halted initialization
> at the very beginning due to a timeout while waiting for CMD_SYNC
> completion:
> 
>   (XEN) SMMUv3: /soc/iommu@fa000000: CMD_SYNC timeout
>   (XEN) SMMUv3: /soc/iommu@fa000000: CMD_SYNC timeout
> 
> To properly handle such scenarios, add the non_coherent flag to the
> arm_smmu_queue struct. It is initialized using features reported by the
> SMMU HW and will be used for triggering cache clean/invalidate operations.
> This flag is not queue-specific (it is applicable to the whole SMMU), but
> adding it to arm_smmu_queue allows us to not change function signatures
> and simplify the patch (smmu->features, which contains the required flag,
> are not available in code parts that require cache maintenance).
There are already a few places advertising the SMMU coherency:
1) smmu->features
2) d->iommu->features
3) platform_features

All of them are better places than queue struct (that as you pointed out is not
specific to coherency). I'd suggest maybe to use 3) and removing ro_after_init
if you don't have access to 1) and 2). All in all, providing yet another place
for coherency flag seems a bit too much.

> 
> Signed-off-by: Dmytro Firsov <dmytro_firsov@epam.com>
> ---
>  xen/drivers/passthrough/arm/smmu-v3.c | 27 +++++++++++++++++++++++----
>  xen/drivers/passthrough/arm/smmu-v3.h |  7 +++++++
>  2 files changed, 30 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
> index 5e9e3e048e..bf153227db 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -346,10 +346,14 @@ static void queue_write(__le64 *dst, u64 *src, size_t n_dwords)
>  
>  static int queue_insert_raw(struct arm_smmu_queue *q, u64 *ent)
>  {
> +	__le64 *q_addr = Q_ENT(q, q->llq.prod);
> +
>  	if (queue_full(&q->llq))
>  		return -ENOSPC;
>  
> -	queue_write(Q_ENT(q, q->llq.prod), ent, q->ent_dwords);
> +	queue_write(q_addr, ent, q->ent_dwords);
> +	if (q->non_coherent)
> +		clean_dcache_va_range(q_addr, q->ent_dwords * sizeof(*q_addr));
I think it would be better to move the cache operation to queue_{write,read} to
avoid having to repeat them at each occurence of the helpers.

~Michal


