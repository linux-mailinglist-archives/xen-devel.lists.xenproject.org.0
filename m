Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5F96A81FA
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 13:17:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504896.777332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXhsO-0006Yg-S6; Thu, 02 Mar 2023 12:17:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504896.777332; Thu, 02 Mar 2023 12:17:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXhsO-0006WV-PK; Thu, 02 Mar 2023 12:17:36 +0000
Received: by outflank-mailman (input) for mailman id 504896;
 Thu, 02 Mar 2023 12:17:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x2w7=62=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pXhsN-0006WN-Ok
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 12:17:35 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20623.outbound.protection.outlook.com
 [2a01:111:f400:7e88::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34922e54-b8f4-11ed-a550-8520e6686977;
 Thu, 02 Mar 2023 13:17:31 +0100 (CET)
Received: from BN9PR03CA0431.namprd03.prod.outlook.com (2603:10b6:408:113::16)
 by SN7PR12MB7131.namprd12.prod.outlook.com (2603:10b6:806:2a3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Thu, 2 Mar
 2023 12:17:27 +0000
Received: from BN8NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:113:cafe::b8) by BN9PR03CA0431.outlook.office365.com
 (2603:10b6:408:113::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19 via Frontend
 Transport; Thu, 2 Mar 2023 12:17:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT066.mail.protection.outlook.com (10.13.177.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6156.19 via Frontend Transport; Thu, 2 Mar 2023 12:17:25 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 2 Mar
 2023 06:17:24 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 2 Mar
 2023 04:17:24 -0800
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 2 Mar 2023 06:17:23 -0600
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
X-Inumbo-ID: 34922e54-b8f4-11ed-a550-8520e6686977
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h0oZejs5tGnkSmXqtvSDoUg03FeXxZrApSwYnHk4BZd191g1cm1J/wld+VTD701iLuF9apBg9fQQyJsXneFlht5Os/qhzu6lVy2X5uv6PFAfBL8PsOD/bQiHET0mYo1ya2VGkTWiGgOoH6LX5UrU/Gs4KUkKHbLlO4CcDou3jWRWEF8TrBMhtAfq6rlYJ8ezMoXeDTotho5D4IFAFQDvza1RFiqfNKRIFgZk+DzL4JnVrXRPw0CCq5g4X+LVJOpQy4lUJOf7WQTGVVw1hh+c8LhHtGuYvkA+PgvDM5vNEFABVHEIE0xJzgUa0gp1dNio58NUloh1Bp/EEo/E8gneNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7R1xpcylum7C6uLtSxVOkGnQKc8q5CCpaCPLcgQuz+8=;
 b=X2mqqQtKmVRwpHywe/XcoIr5/cgEuQ4RSGR+los12r3oX6CF21378btuCgjrlKxFiM8j8YB4gfNfl0pMgzTQmGwN1XSOAo/IEi0URAeLgCoe6sprnzCYXRMyaM4OqDZPyNdquvqpUN52vXpXaQztdVA6eEa8jQk5hQb0g6Gj2eZJfjJRddyjlKEhRnFRLg2cWcHylO5ipIXdUW39dbRUNELP+3Jf727AxXZKPRec4LQXq7Kpb3nEwGxFCil/Z2Px5ZZkgKnmSWPrbMVFJ7iwMYdoYDQya6t3KvOFbe6lySg8Hr3XwxtOxTmkgApnPRuoZQl2JI5j0pZSL9RWrcP3SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7R1xpcylum7C6uLtSxVOkGnQKc8q5CCpaCPLcgQuz+8=;
 b=dqZomjdMcv48c0sRLpKlkyfwz8livPMQ9ZVMHl18cEd5tPULcEvAKsgm5KdjtiNyckZlA29tz9hXvHnTpXDjSDib6y6/gJmDWoMZ3Iml9wMKjFKmr3b8N52vhoi/9/45fgvVMloWQUnJhNkGKKroMcazAR+ELl6dR2/59gyDzFo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <f480d3c5-e18a-7863-b2a0-9ba95f7e678b@amd.com>
Date: Thu, 2 Mar 2023 13:17:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [ImageBuilder][PATCH 1/2] uboot-script-gen: Add support for
 static heap
Content-Language: en-US
To: jiamei.xie <jiamei.xie@arm.com>, <xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, <sstabellini@kernel.org>
References: <20230302044606.136130-1-jiamei.xie@arm.com>
 <20230302044606.136130-2-jiamei.xie@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230302044606.136130-2-jiamei.xie@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT066:EE_|SN7PR12MB7131:EE_
X-MS-Office365-Filtering-Correlation-Id: ed1447e6-b0a4-4503-5349-08db1b181541
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Zt+sc+iSDPYHiHv0Ik9lxPB0kNDBNNLMRklDzUFvGP0hDeMSK+M1DRZvSWckSaDgHEVMQsbtHC+ds3D4gQ0SfAcUt1t3jkZgrpGTLtf8UqbIhKJ6/641MpMOlPz5l1EBRcr44EOMo4X/2bE9LX9d7dtl7Z85NvBiaA/3QU82AP3cIMIaxDB7mLqpN37rkE7p77iFXO4R51eHyPzYz3lJYAxfoKR42dPnTiy//D1BR6hGVgj8NpolMQlWcosSOrqqr7BDfeeaa1ayX7IWjLhTab2fU+4RdKxzwL4Q5sTf77y12srWCRblpwbYmq4i2DWNfpH2oKBYCbBN2vkORVshcQaDPhaDwb1J29JYZ1aDn5TaTudwfnMa5evQpvRLRZpUGsQQj/fM1th4hQWUYjWQMDvk3Eu6lvzJD4YcunPaXv3nkTZVMdsx5K0oDS//nOCvFSFo10H4Vg0ELeD3m45vrvpNwhawXxXSL20ioGyxfy0XC+OK3cRk8kSjImDU0NNVHbTKmQGISPmkp4OhIKuBPFngCoGvmgvpDax8w49wXlDrl77XfmViOV8+h1MJFO8yoZ0GhABg7xMU44HBt9kJ6KlSVa68mIAMFkLKLMju/wuyx/KOtTX+5HPt3pY5XUICvsqn4oRCbsjwiq4vgzLy+VT1gte0x2NXGRbgRy5y8HKqyLDfnv5x2Bm+TAVRu+Ueyb9EtTXxM/Js8ML9580hwlT9vFLoqAd6rtFqcjBwt37taOfsG3Wox+VKL2Yt2GXekdRsnaBID2hyEEJZSd1YnQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(376002)(346002)(136003)(451199018)(40470700004)(36840700001)(46966006)(31696002)(82310400005)(81166007)(8936002)(86362001)(336012)(36860700001)(16576012)(41300700001)(5660300002)(70586007)(8676002)(4326008)(40480700001)(70206006)(36756003)(2616005)(44832011)(2906002)(110136005)(316002)(47076005)(54906003)(426003)(31686004)(356005)(53546011)(40460700003)(478600001)(26005)(82740400003)(186003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 12:17:25.2512
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed1447e6-b0a4-4503-5349-08db1b181541
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7131

Hi Jiamei,

Patch looks good apart from minor comments down below.

On 02/03/2023 05:46, jiamei.xie wrote:
> 
> 
> From: jiamei Xie <jiamei.xie@arm.com>
> 
> Add a new config parameter to configure static heap.
> STATIC_HEAP="baseaddr1 size1 ... baseaddrN sizeN"
> if specified, indicates the host physical address regions
> [baseaddr, baseaddr + size) to be reserved as static heap.
> 
> For instance, STATIC_HEAP="0x50000000 0x30000000", if specified,
> indicates the host memory region starting from paddr 0x50000000
> with a size of 0x30000000 to be reserved as static heap.
> 
> Signed-off-by: jiamei Xie <jiamei.xie@arm.com>
> ---
>  README.md                |  4 ++++
>  scripts/uboot-script-gen | 20 ++++++++++++++++++++
>  2 files changed, 24 insertions(+)
> 
> diff --git a/README.md b/README.md
> index 814a004..787f413 100644
> --- a/README.md
> +++ b/README.md
> @@ -256,6 +256,10 @@ Where:
> 
>  - NUM_CPUPOOLS specifies the number of boot-time cpupools to create.
> 
> +- STATIC_HEAP="baseaddr1 size1 ... baseaddrN sizeN"
> +  if specified, indicates the host physical address regions
> +  [baseaddr, baseaddr + size) to be reserved as static heap.
As this option impacts Xen and not domUs, please call it XEN_STATIC_HEAP and move
it right after XEN_CMD documentation.

> +
>  Then you can invoke uboot-script-gen as follows:
> 
>  ```
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index f07e334..4775293 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -189,6 +189,21 @@ function add_device_tree_static_mem()
>      dt_set "$path" "xen,static-mem" "hex" "${cells[*]}"
>  }
> 
> +function add_device_tree_static_heap()
> +{
> +    local path=$1
> +    local regions=$2
> +    local cells=()
> +    local val
> +
> +    for val in ${regions[@]}
> +    do
> +        cells+=("$(printf "0x%x 0x%x" $(($val >> 32)) $(($val & ((1 << 32) - 1))))")
Please use split_value function instead of opencoding it.
It will then become:
cells+=("$(split_value $val)")

~Michal

