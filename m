Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3710CB024AF
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 21:37:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1041475.1412267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaJYT-0005we-EX; Fri, 11 Jul 2025 19:37:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1041475.1412267; Fri, 11 Jul 2025 19:37:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaJYT-0005uk-Bb; Fri, 11 Jul 2025 19:37:09 +0000
Received: by outflank-mailman (input) for mailman id 1041475;
 Fri, 11 Jul 2025 19:37:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mu1t=ZY=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uaJYR-0005ue-KN
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 19:37:07 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2407::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c3508f9-5e8e-11f0-a318-13f23c93f187;
 Fri, 11 Jul 2025 21:37:05 +0200 (CEST)
Received: from BN9PR03CA0383.namprd03.prod.outlook.com (2603:10b6:408:f7::28)
 by DM4PR12MB7597.namprd12.prod.outlook.com (2603:10b6:8:10b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Fri, 11 Jul
 2025 19:36:59 +0000
Received: from BL02EPF00021F6C.namprd02.prod.outlook.com
 (2603:10b6:408:f7:cafe::aa) by BN9PR03CA0383.outlook.office365.com
 (2603:10b6:408:f7::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.23 via Frontend Transport; Fri,
 11 Jul 2025 19:36:59 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00021F6C.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Fri, 11 Jul 2025 19:36:58 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Jul
 2025 14:36:58 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Jul
 2025 14:36:58 -0500
Received: from [172.21.62.237] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 11 Jul 2025 14:36:56 -0500
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
X-Inumbo-ID: 6c3508f9-5e8e-11f0-a318-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xbLnButxuu/nnzQDa/hM3S3YzWoEIHmAcgI7OByib77Ib4SAQUsKf3seKNWWLADo7O6qkVzmlw/9CorfGpSxwumj4b9lk1EjlSkLVqJbmsUvE27qLryv1EcWxkmeweKItd6xgCS8GcRcvRYWSbZUzuTgAI3UfQfmmcJiqo42K9qxlsifBX06KzZXkXDxWiWn/IpYTB5IoSCMbpYU9knejPqlmj5TKx72Bf0DMSFi83yEggoMt++mVWb2TgozKK9P/mDcMrM7jsQfFqzKIHAR3v/EquK1OxwcagTZcNSR9TSDB/i4deLbzYodf//am81dDR1J4O29zdegjJS0HvJnXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QOgjnQm//Xb8zEaOrSxQ7E6pLq+k91BGHZZTiN4zLXo=;
 b=Zaeszpq3KNlYlTOX4llYg93fioGMe6ylDilwv2amI3IMIyUMz5gdmDVcgZvx+ta6chgP/iPR/6JAWYWPxUS/bGvRWAyGj5hsv52kVz0ju9qk/ntxO6CPfiOucO1+r31y3qJURibpSHTAoBsFFA5+d9+jfdSS7Wd2IhDhpg9yADQ0WvkTVMO7xrXiQQsM5TPyZrf37AbNAecQE0IaU/jHNuU34VwoTj65fZ8V1/p3i5byF21wcaXF8lttlbqVyZtkknepX0NeU0c0htJw7VC+BjX03f/t9OjhfazcrbA9TosJXhoOqnvpv1osOVEVNBO3KX6ogw0Xif1Dw/uzzS5aEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=valinux.co.jp smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QOgjnQm//Xb8zEaOrSxQ7E6pLq+k91BGHZZTiN4zLXo=;
 b=nioa3In6HIMdN+FmLLs7U4VU/jRwIEG7Row4L42BJvMuleNAXHA2TrKzgfsONwohMvD5Gybn4K0PYuDHegpuACjcGJxn+j6SK/KhJZUmD/7BxRwGbHWh1mTxN11waD4L5F3BsjevwHJeNreFhosVqwVZFw2kPz76hrT6hCcew00=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <72892ede-5269-44eb-9c7e-8f35bd0716fb@amd.com>
Date: Fri, 11 Jul 2025 15:36:56 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] xen/arm: Move make_resv_memory_node()
To: Koichiro Den <den@valinux.co.jp>
CC: <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <20250705142703.2769819-1-den@valinux.co.jp>
 <20250705142703.2769819-4-den@valinux.co.jp>
 <ed706953-f6e3-4911-adfd-0e19290a85af@amd.com>
 <lfhrxqqpwi536wtuwks4j4dtrpcypi26ojv3wnaxfi4qcqslx6@r7xamjwjm3nq>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <lfhrxqqpwi536wtuwks4j4dtrpcypi26ojv3wnaxfi4qcqslx6@r7xamjwjm3nq>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6C:EE_|DM4PR12MB7597:EE_
X-MS-Office365-Filtering-Correlation-Id: 39d4d600-8938-40df-a03b-08ddc0b24d3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TmpUbDQ2K2hwZ1JSdUc3c09RRVdkVFJFWXR4U1daMHJXbGR5blVqcnRaT0dP?=
 =?utf-8?B?K09FZ1FuNXQwemRHRWk1SWNVMzV1K0pYRFJ1TllaRU5QQ1NyYTVrcXlJYmJ2?=
 =?utf-8?B?ZFRHbENiVVVxSjRhOVBMaTBuTlhhQWZBcEl1WldSUHZpUWFaa3RqSlMvKzBB?=
 =?utf-8?B?d0s1WmxkZHhMVjNKNXJzUGQ3OVVoaWZkSGVGVVhDTFVuNTZZdm54Y3JQZ2Jk?=
 =?utf-8?B?RTNqQVVxQ0FaSFF2c1l5bEpnSVFTNW5IaTVRZkdzKzBOelZvZ0ZQZVJOd1FZ?=
 =?utf-8?B?K1ByMXdWZy9UYlp2Q0t4QnFDWCttZTh6Rm41UkNvU2JsOEhoTURzemJ0MmpJ?=
 =?utf-8?B?VVNzNTZLYXFJblI2cldMbWFVZEFlSm1FNmM3U25mT3F4eWUzQ1pPa1hpMjFD?=
 =?utf-8?B?Yng4Z0lrcFlpN1AyaWJid3d2UjRwcnpsQko2L2dXNHBhVThnNHY2a2ovNENR?=
 =?utf-8?B?bng1UnVZYWJYVmJpVXBNOHpzNHRVR0ZPeWFXQmhFU2cxMHlqdzlVOG02dzhR?=
 =?utf-8?B?T3RwOXB1QUFjV2ZEa3k3WEdaWExEY3IyK3d1a3hBcXZiWTl2VXZ1NUg4a1FN?=
 =?utf-8?B?SXRaUVFwdksxNkpsVzZnOXd0V1NjazU3Si9ZOGR4OUlXbnhsZmlVU1U2dkg5?=
 =?utf-8?B?VHhBUnR0b3E2a2JvTUJUUTZYWlRNNnZJaVNRYzFmbXF4ditwd0xKZUIyQUdz?=
 =?utf-8?B?dnY5clRpQ1FNZ3g1OFJ2MEFUQkZNMmlJWGk3eGNWaFlxZWR2SlNPWktJVU9H?=
 =?utf-8?B?cStGMFV4MnBYU3Y2dHhXNVdlUUJLMlRRNExLcnAyb2tSMmYxcWlIWWpWci9B?=
 =?utf-8?B?OCt1NkNFajd2azZaT2hYR1BhaitTRzNKcUNCMWl5OFZTcXlvSlZpUlJjc3BO?=
 =?utf-8?B?UUkzcmdZS3JQUlo1VVBXUjdISE1NU0ZKa2tpcVNNdHk4VzlxQ1N4dmhtWUtK?=
 =?utf-8?B?clVxZmFpZGhPMkVQUmZQdzFJT1paSFRBY2k2Yld4RHNvakFpSUg0bStqK25H?=
 =?utf-8?B?UEw5MVdVSTJsdDVLRGxkNFBHSlljUUtPZzdhRHNOR1RiV3V6SnNDbWd3L2hx?=
 =?utf-8?B?eDZXdmpwWVI0N1JyZVpCSW4xdzVxVFlUbHo0dlFRTm1tNVFHT3lyWHVHeXdN?=
 =?utf-8?B?RXUxdXF1VTF3NDg1d3A4bUJtdllvMTd2M3VlWWdGaTU0dGwzWGVkcitrb2k1?=
 =?utf-8?B?MkNXd1A2OU1BclpvaklWMXVKeEQxdDRvcjBOWC8yZE5XZUJTRWNJOWt2QWw3?=
 =?utf-8?B?bm5XRFpWWVg5cmdKME1qRWNhUXVEL24xczJvbXhNMFFnSTI2WWFNb1hyemR3?=
 =?utf-8?B?RjZaTzFxRlRlRC9xSjhBV2JLRUMwbGRLK0wxbERZak01d25HWC9zWFU1Tjly?=
 =?utf-8?B?VkNOd1kxbVBwdWZrd2FDVUtqMS9mcWV0aXcrTTFEVFpkcVJRbXZBRUdwQktv?=
 =?utf-8?B?YUE0MzBKM2Ric1FOVC9ScHM1czBoTHZMNFd4LytPTWlYUExWUkhSNWNETDA3?=
 =?utf-8?B?cXYrUzNCYit4V2RmQVdLUnFQdHR1cXEvd293VnY5K0xNZlZDMUE5L25ZRk1n?=
 =?utf-8?B?OEtFbk5aR01LQkZEUHpKUVNoMEcxQVVYNThpWlQzamU2d3hIK1Bvd3laV3Uz?=
 =?utf-8?B?eGVRRStQakRWOU1hdXBtZzQ4Z01lc0hSZEp6L2JnMnVwZjZtQlJ0OS9ZZldv?=
 =?utf-8?B?Q3ZybU9jTmZIbkdNN1dURkZqYXpzU0dkVS9aWUdzcHNYOFdQOTAxY04rczBq?=
 =?utf-8?B?cGxGOXl3SkU0YjVCVGs3dnVDQnRtZGtCZWZlWG9SRktYeEJoTkVlUVRoZnUr?=
 =?utf-8?B?S1dFTnoyVC9IbWxyK2dVd2RHZE1tRk1SUVRuS2Jtcmx4cXNBM3Z0OW04Tnlz?=
 =?utf-8?B?YStvRit0OVM2V1k0MzlKbStzMjBlVHdLM0lUcS9BNWRlaUtubWhNRHdYOTJ3?=
 =?utf-8?B?aWlTdVVCWkZOVGpCNE5LNENPaWFDVVpxMjFnZ0lLVmFSVkFiVDR3ZnhxU1lu?=
 =?utf-8?B?L0tuUFZENjVqNXl6RkZRbE5QVFBkd1lQYXFhb3JLdnRPUjRYS3l6VWpFVi95?=
 =?utf-8?Q?oKTpqi?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 19:36:58.8767
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39d4d600-8938-40df-a03b-08ddc0b24d3f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7597

On 7/9/25 03:58, Koichiro Den wrote:
> On Tue, Jul 08, 2025 at 04:12:50PM -0400, Stewart Hildebrand wrote:
>> On 7/5/25 10:27, Koichiro Den wrote:
>>> The /reserved-memory node is inherently not specific to static-shmem.
>>> Move it to a more generic domain build context. While at it, add an
>>> empty kernel_info_get_shm_mem_const() for the CONFIG_STATIC_SHM=n case,
>>> as it can now be invoked in such case.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Koichiro Den <den@valinux.co.jp>
>>> ---
>>>  xen/arch/arm/domain_build.c           | 40 +++++++++++++++++++++++++++
>>>  xen/common/device-tree/static-shmem.c | 40 ---------------------------
>>>  xen/include/xen/fdt-domain-build.h    |  2 ++
>>>  xen/include/xen/static-shmem.h        | 15 ++++------
>>>  4 files changed, 48 insertions(+), 49 deletions(-)
>>
>> make_resv_memory_node() was recently moved from arch/arm to common in:
>>
>> 72c5fa220804 ("device-tree: Move Arm's static-shmem feature to common")
>>
>> Is there any rationale for moving it back?
> 
> I overlooked that commit. So to preserve its intent, and make it usable
> outside of the static-shmem purpose, which is my original intention, I
> think I should place it in xen/common/device-tree/dom0less-build.c. What do
> you think?

Hm, if only considering its current callers, yes, because STATIC_SHM
depends on STATIC_MEMORY depends on DOM0LESS_BOOT. However, whether to
put it in the common domain-build.c or dom0less-build.c would really
depend on how you intend to use it, but I don't see any new calls to
make_resv_memory_node() on the hypervisor side in the remainder of the
series. Given that you do introduce an equivalent call on the toolstack
side, I wonder if that's an oversight on the hypervisor side?

Lastly, in the context of the series, your intent looks to be to add the
pv time region to /reserved-memory, but is that actually necessary?

