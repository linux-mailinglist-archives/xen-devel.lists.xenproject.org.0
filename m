Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A7BCCC9CC
	for <lists+xen-devel@lfdr.de>; Thu, 18 Dec 2025 17:03:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1189879.1510608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWGSs-0004Yi-7d; Thu, 18 Dec 2025 16:02:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1189879.1510608; Thu, 18 Dec 2025 16:02:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWGSs-0004XK-2i; Thu, 18 Dec 2025 16:02:54 +0000
Received: by outflank-mailman (input) for mailman id 1189879;
 Thu, 18 Dec 2025 16:02:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XN7D=6Y=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1vWGSr-0004Wy-4A
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 16:02:53 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0033518d-dc2b-11f0-9cce-f158ae23cfc8;
 Thu, 18 Dec 2025 17:02:50 +0100 (CET)
Received: from SA1P222CA0011.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:22c::13)
 by LV2PR12MB5798.namprd12.prod.outlook.com (2603:10b6:408:17a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.12; Thu, 18 Dec
 2025 16:02:40 +0000
Received: from SA2PEPF00003F63.namprd04.prod.outlook.com
 (2603:10b6:806:22c:cafe::a0) by SA1P222CA0011.outlook.office365.com
 (2603:10b6:806:22c::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Thu,
 18 Dec 2025 16:02:36 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF00003F63.mail.protection.outlook.com (10.167.248.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 16:02:39 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Dec
 2025 10:02:39 -0600
Received: from [172.29.241.99] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 18 Dec 2025 10:02:38 -0600
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
X-Inumbo-ID: 0033518d-dc2b-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VveY/Qt5ZOfcXMURSju+OOrgclo0hVs3mChcZTxePXczu1CkxdS42cx+xmnZ4LKfolmD9JdLtzIbVtm/YkcFH2GHnvj71TVReevTOnUFYXZ6Nx62w4JtzlYtOg6VdqtExqUJ0NbnUexLZRWgC/GGt4Pd1vQe0FMLnwTcKOjGQX0ZZvmWdCoJLINZWyGqd6yp4uM2XqZV8TQbIvp5W4odE2n+1fJ/CiY2Rv0zH/pEhIbCeG62M3NNcuxbSxwgPsAuhggXbWa3UDAwizC5WJf9Yhx78aVYYNyrt/P0QEzJ8wB5AgU+jHLJgE5dkxAwI0IyOrRp8JgKgxRIRO/bBFxNRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ATrvPXP9//m7IKl0otWR4YqwSwtzB4Mq1gbZJcufMc0=;
 b=DKi2XTEaehWzLNeFPHtd/ivZfTpvoY559ELiRpomoNOXUgTHeIW2puQ0U2mJJ19M7oz217B/I2neYk50DJKGbSkpYO+uPHkZ/7S0FhP803AWIgaDCeC4nwkEUqRCvKPHsyHxab5YXXXUWZaczkMbsmS4gJj03Idf5nVW7HSurb62zNgUcOt7ZO4/1ZYtbHbG2NhFtblr11JF0WJA6hP+PrpQw1l7b6eUH+t1cgqIAiOpIJUcY2vAb5QM0Fqc2EC5Qaw1N2glV/A3wNoxyWZrDhDTtembF3hUq4mcTmoKmOUkdDC8K0aFQOWTBeQ+SZHtSb6TYfhvoiI3GVgJQ8LRmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ATrvPXP9//m7IKl0otWR4YqwSwtzB4Mq1gbZJcufMc0=;
 b=XmyD/mv7fntPAENSJANQHp01ZS/HBftE2oUgjzUkeC0W5/UPYmLny6BVYUV/v/nG6wRwXc2KBrYIGu/x2nDYukl8M65wz/vwouGbXrKDSrojnr5jLgweoVH/BlioGagjGtarIB6yh1FzBI19yHqnYHH8dxSctznYSUBf7eUakJ8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <4db98b05-5277-4ca4-a6bb-0054490a0280@amd.com>
Date: Thu, 18 Dec 2025 11:02:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] vPCI: make vpci_add_register() an out-of-line function
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <70e156e1-c51f-40a7-83b4-2d228a102367@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <70e156e1-c51f-40a7-83b4-2d228a102367@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F63:EE_|LV2PR12MB5798:EE_
X-MS-Office365-Filtering-Correlation-Id: 152e645c-fa53-42c8-b71f-08de3e4edec2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U3k3NnlCTFhyQ0o1MEdiRkRNWkhJeDA3cVFnbWhzNjJvYnJmWmpTSXVRVS85?=
 =?utf-8?B?RlAveVM3T2dSVHpMQmxWQjVxbmFza2RDOGc3aTFNY05LMlMrYUpzb0JYQWJt?=
 =?utf-8?B?NVpZSEw5WkJzbjJXck0zazdDYitkT1pjQ1l5a3VIRldyMkpZeUhDa0lGaHFh?=
 =?utf-8?B?OG95WVRKdC9rdzRucm94ZnRCcy9mNVQyZVNrQ2lZSlVyNnRic2o1RHZQeVlu?=
 =?utf-8?B?VkMvUytndWxIWHF2ZCt0cUhuOVFGZFl5V2VYVytaS2xzWXQ3STNkbmJoa3ZC?=
 =?utf-8?B?ell2M2gwT3ZNNy9COW1ISmQ4Sm5XREEwR0NDeTI3Vms2Vy9FNFRoTkhyRmEr?=
 =?utf-8?B?NCswOFE1Zzc3bEVxUGZ2ZTdFZnJPemY5cHRCbm40dzV0Wmg5U3lwd3BNdm1v?=
 =?utf-8?B?WnEwVmZxS2I0SEVDeVBLWjkxaXNSNEhvdGpxdUpoSE9LNlBIYnp3algwQzhu?=
 =?utf-8?B?NVB3NzVpUkdieC9uVk83MWsvOHhJNUNUdEQ2a1hkeUQ3dDdDNWhpY1NRQ0x1?=
 =?utf-8?B?QjZ1MEVDelJoQ3FsQ25hV3d0eUVTWEtONkpETDEvRktaYmxvRDR3TVJxVHp6?=
 =?utf-8?B?L0dqZllNNnpJN0FNYkVXWHFWM2YwL2lCbmZCUk5TMFZBcWRkT1diRlNUdWZL?=
 =?utf-8?B?VURVaU9RMFRVcWJVYUhJS1I0UW00a2Y5ZGNCVlZIOEV6QjNEbVhlSlIvSzc4?=
 =?utf-8?B?QUlaR3N5TkNkbkJRRGJwUlFzOWx0NnlVUHA3bDR5U3kwUWUxSi8yKzZhL25y?=
 =?utf-8?B?RGxRaHJLOVdZYVNFUzcyZ3ZxdFZ4dUJkZ050bXV0VWhxdG1yRC9wRGhJc05C?=
 =?utf-8?B?bVo5MDg2cmppSjVYbkdnemFpbVZ5cGgzblNmNzRhdHJMSXVrVDBGWWZqRWhk?=
 =?utf-8?B?cStJc1pEancxYy9NWnUxZjRGSlpoSmJWWE83blJoU1hZdDNMZEJQcHJ6VUZS?=
 =?utf-8?B?MjlLMzVncnhNU2NRalNhSTVrMUhxWndDNHBQWEEwT3oyczNwaVpYSXZLQzdO?=
 =?utf-8?B?eVI0ZDF5QjVhMlhid3ZONG45b3NCTHE0UXJiSW5vU1lrUHNKeXA4aWZMSVR3?=
 =?utf-8?B?ZFN0aHZ4a1hDOEtiUDlFOEhYWjk5ZkxhbENBTnhROGJiRlhVRlhlQlJ3STBD?=
 =?utf-8?B?VWNralk1RmV4ckptWUN2LzBKWHB5LzhNbVNGMUdtQ2kvMlJOdWNSd3pIcjRN?=
 =?utf-8?B?b1lGMlF4dU80ZjdiSTZGZERwRDFiQ1BsTVA2QUZHMGZFWHJJQ1ByK2dYdHpC?=
 =?utf-8?B?ZHY2aWxkbm45TENWSm9IMjZlY29wVUZJT1psbDFzMlIxZTVQQmF2aUVvNVRk?=
 =?utf-8?B?SFdMVEtOdmdSTFhaSSt4MnpKV1dZL2o4M0NPRDZVRXJiUTV5dlRBRlNSZVpG?=
 =?utf-8?B?dCtJeG5qR2tXS0I1Zm5kaDA0OStLMlpybjJsSWVsSUxkK2V0Q09jcGdYNGhC?=
 =?utf-8?B?dDJHcnlNZldOVTEvUUY0RG5nUnhjVFk3bnZnczF3VFhoU1QwSkxyei81Ukt4?=
 =?utf-8?B?UmdwVS9hZ1dweG9xVi83WnU5ZXFjWS9JZmNqaENuc3VBaVk2YVQ3YnJDQXlR?=
 =?utf-8?B?QkRPQUI1Uy95cnYrMldtdWFCTEhyTWtDbVc4bWw2VGhjSDZXMEV5RXM0L1h1?=
 =?utf-8?B?dWc4U2Nkdm9jYUxzL01YaUgxUVU4dFZEeU5oNVhSM05zQ2lobHMrN1lyWEcr?=
 =?utf-8?B?Qm5RemlEU1E0ZmhuR3lWUG55TVNxY3FuK0ozazZGU0xoemo5Z1loZTZuTnVi?=
 =?utf-8?B?cndVSDhURmZyc2tqOCtjZ3htclBqWXZ2SDNiMGJoSjlCdjM5RnlvSGVlZHpU?=
 =?utf-8?B?dmg2Z3M2Y2J4QVVEZG1uZVM3dm9FbHFrQStOUktkRFBWeTNvdDNvNTVHUnBX?=
 =?utf-8?B?NnA0L2JseGhHR2VrNG1mc2dEaG5icm53d0VPTTBjYzA1dzBRWWdDTzBxMkx6?=
 =?utf-8?B?a0ZEeHhBdVl3R3ZDL0I1MkwwSXZxc2N0YTViQUpkRzZYRU00dGU0S0FHKzJ1?=
 =?utf-8?B?Z2YySUVwa3cvS2N4dmhpOHFGc1VONVg5d3hoOWtPamUwOS9DNXhnVjJ4a1NV?=
 =?utf-8?B?bXhqRzJsbGNSbk1zOGlUekFhMTIvYldGL2RpYlVoQUpCVjRpelEzOEJOc24v?=
 =?utf-8?Q?xDN4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 16:02:39.8207
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 152e645c-fa53-42c8-b71f-08de3e4edec2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F63.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5798

On 12/18/25 05:45, Jan Beulich wrote:
> Calling a function with 10 arguments is inefficient on many architectures:
> x86-64 allows for up to 6 register parameters, Arm64 for up to 8.
> Everything else needs passing on the stack, i.e. forcing the compiler to
> emit stack manipulation insns at every call site.
> 
> Shrinks generated code on x86 (with gcc15) by over 250 bytes. The gains on
> Arm64 are a little less.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

> ---
> Why is it, btw, that the declarations live in xen/vpci.h? These functions
> aren't supposed to be called from outside xen/drivers/vpci/, are they? In
> which case their decls may better live in a private header?

You have a good point, they could very well live in a private header IMO.

