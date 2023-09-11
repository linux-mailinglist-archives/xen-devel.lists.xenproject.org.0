Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1C679A6CE
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 11:40:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599196.934496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfdOz-0000q7-08; Mon, 11 Sep 2023 09:40:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599196.934496; Mon, 11 Sep 2023 09:40:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfdOy-0000nq-SZ; Mon, 11 Sep 2023 09:40:16 +0000
Received: by outflank-mailman (input) for mailman id 599196;
 Mon, 11 Sep 2023 09:40:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yA6l=E3=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qfdOx-0000nk-7k
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 09:40:15 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34840eef-5087-11ee-8784-cb3800f73035;
 Mon, 11 Sep 2023 11:40:13 +0200 (CEST)
Received: from SJ0P220CA0016.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::23)
 by SN7PR12MB6888.namprd12.prod.outlook.com (2603:10b6:806:260::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.34; Mon, 11 Sep
 2023 09:40:09 +0000
Received: from MWH0EPF000989E8.namprd02.prod.outlook.com
 (2603:10b6:a03:41b:cafe::51) by SJ0P220CA0016.outlook.office365.com
 (2603:10b6:a03:41b::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35 via Frontend
 Transport; Mon, 11 Sep 2023 09:40:08 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E8.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.11 via Frontend Transport; Mon, 11 Sep 2023 09:40:08 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 11 Sep
 2023 04:40:07 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 11 Sep
 2023 04:40:07 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 11 Sep 2023 04:40:06 -0500
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
X-Inumbo-ID: 34840eef-5087-11ee-8784-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MdhPA8zQdbtjciSq5vIW89bSFWkYiIoAbnCI22IMzRIAr5Kflc4nH+W2oTb0EQfHamZNkng6kSnMjwP0HbkimaroVC7s7YE4Isx9NuUP0bRITn8hHWh2rJ6Wt8mCfYYhxd2X8wJh9GAPJTehPTwR9ER90xywizTw/+bxv+8aHzmGgFnHBd4+26PivWLELmtyszV3fg2xaC5YFunh76jdQeJFB5et9J5tmqrnImA6rsngUosnkLPQ907tYHcOJJ0SHBy9daDeSn2TrglKMWdzCfBxSTsgAt6yy+t902wbaVF4Eo5rHmFODx1Z49EYQ/rYNV6P4nrwLROJZO1eV6n/NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SX3ysZbV1q5vdpQg49vT4IgHv3QMOZAiDn/lcfGB3Wc=;
 b=h2HXES8OsBX1SmUPLif2RBd8uP8OFXgoP4pMVKk4tSscZxIMZvbqKGq3E/tczKOAhReXPhX41j3zmKxj5DqQckQqoOmeSTEr/1uDjFlW85Ipn98dYFeUrwsEqDeEOLv/7Vbg6gAvI3n8ppjPLt+QLabswVLxXMPQB4ZRl5VkypHsB/gG5lsbT4mO8rTpJ7M0xN1fSQdf5mZXVCKFan9xsaDsagEv1K1ZXb7aFe6ng1+Ss5iurVDhLwPXWKr8vhx+i6Y2LByvNNwsLTNywT78YJQ6w1kfQC6Ksyl8i4YnIklaKXm4UH18Itthrps5+n3sK1tgHagVHorB+i1SMLiaZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SX3ysZbV1q5vdpQg49vT4IgHv3QMOZAiDn/lcfGB3Wc=;
 b=voQIuSJr4CVNtTS4UqJQv+d7p62iqDF2GmmsqvbsR8nbuAqbsozHVDbzhC+7LA2znyTKAprvpfpj1SmU53sMQqxC6wZvcJvSTC++k47u6XwOGhbu+tbe7RaV3kMEgOjBzsNO6x8jxAcJ0Lye4WMFTAmH8j30Mt5fY+71Q9zNStw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <5212bdc4-9bce-fc5d-8a47-ae5e5fef37e3@amd.com>
Date: Mon, 11 Sep 2023 11:40:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v4 09/10] xen/arm: fix duplicate /reserved-memory node in
 Dom0
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>, <xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230911040442.2541398-1-Penny.Zheng@arm.com>
 <20230911040442.2541398-10-Penny.Zheng@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230911040442.2541398-10-Penny.Zheng@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E8:EE_|SN7PR12MB6888:EE_
X-MS-Office365-Filtering-Correlation-Id: c7274acb-148e-4708-1306-08dbb2ab165e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LBOXWM0y/9i5G3+BUxa3oEi1VYXVYHa6SL+oe3sZr70hCbvWSirzOASATs5jTQJrUJszHNXp92eW85IsuVu2sBuH/xIl+czmVeumrO1A+mNq8j24dtr744U6cWFAVQagj4F/eSmcoseKVPg/jpkUy+CCafEKIAnQPGwhHLm3r613j7g6UFNe7QSk2CUdaHBfnhaERY8wYfVlwvFoBK6soqIekD+S2h3nw/zugpCYRXlqpMS5zH9gu0HhB9y/mX18/P2+h9hZRTXhgr1gi1K98V1NN35rpFdIzKPM8Qbxqf+Rd5SZOp3zYkAk3LsaMiJuXyXyH47y8PFRlT+c9d5C8EBgogCawbxggkwjYzJbvqvCKcVGqbdTSp02tnBQ8zI98M/NhkguuKMF+TgVem1bPG+xJiyJN98kUXwFAnMH62eiSh5FZWjYtnS+nRYjpya/iAwfB8fNyzU+JSw1QjZGApDkK1O/lzcS++aP8gT5HFvcOeQyAzjHDURoX+H0iGDfOvLN53G5Sha9v/mJjhMfmBu1tg5u/+GgUTaOrbuFD37UtulWn5G8mTy15VjTpUk52bI5XHiS86Bo/7/ec08EiEbUkm8PMelniSu1yxtF9Lg3HMHXQJrabVK+5Tz2NKqi7dyUgbM/8FQMd7WnDGn8ak3o60gJwu6cAqom0pG94TNnEcCcBgrmNJixWiMOkZPmACrb55txY9PVggx71TOZ/pa86DN/2O6VLU3fWwMNFItzzRkV+rnKtbubNHJN/up4IF/N8QgZPjKagwTfylPfkYyGuqT/cF6GZTQ29T2oplvUAs6UVrKWJq53NPKDyCS9
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(39860400002)(346002)(136003)(82310400011)(451199024)(186009)(1800799009)(46966006)(36840700001)(40470700004)(8676002)(31686004)(2906002)(4326008)(44832011)(8936002)(41300700001)(5660300002)(54906003)(16576012)(70586007)(70206006)(110136005)(316002)(40460700003)(478600001)(6666004)(53546011)(2616005)(47076005)(26005)(426003)(336012)(83380400001)(36756003)(36860700001)(40480700001)(81166007)(356005)(86362001)(82740400003)(31696002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 09:40:08.6066
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7274acb-148e-4708-1306-08dbb2ab165e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6888

Hi Penny,

On 11/09/2023 06:04, Penny Zheng wrote:
> 
> 
> In case there is a /reserved-memory node already present in the host dtb,
> current Xen codes would create yet another /reserved-memory node specially
s/codes/code/

> for the static shm in Dom0 Device Tree.
> 
> Xen will use write_properties() to copy the reserved memory nodes from host dtb
> to Dom0 FDT, so we want to insert the shm node along with the copying.
> And avoiding duplication, we add a checking before make_resv_memory_node().
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> 
> ---
> v3 -> v4:
> new commit
> ---
>  xen/arch/arm/domain_build.c       | 31 ++++++++++++++++++++++++++++---
>  xen/arch/arm/include/asm/kernel.h |  2 ++
>  2 files changed, 30 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 02d903be78..dad234e4b5 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1401,6 +1401,10 @@ static int __init handle_linux_pci_domain(struct kernel_info *kinfo,
>      return fdt_property_cell(kinfo->fdt, "linux,pci-domain", segment);
>  }
> 
> +static int __init make_shm_memory_node(const struct domain *d,
> +                                       void *fdt,
> +                                       int addrcells, int sizecells,
> +                                       const struct kernel_info *kinfo);
>  static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
>                                     const struct dt_device_node *node)
>  {
> @@ -1549,6 +1553,23 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
>          }
>      }
> 
> +    if ( dt_node_path_is_equal(node, "/reserved-memory") )
> +    {
> +        kinfo->resv_mem = true;
kinfo structure is used to store per-domain parameters and presence of reserved memory in host dtb
does not fit into this. Moreover, there is no need to introduce yet another flag for that given
that in other parts of the code in Xen we use bootinfo.reserved_mem.nr_banks to check if there are
reserved regions.

> +
> +        /* shared memory provided. */
> +        if ( kinfo->shminfo.nr_banks != 0 )
> +        {
> +            uint32_t addrcells = dt_n_addr_cells(node),
> +                     sizecells = dt_n_size_cells(node);
> +
> +            res = make_shm_memory_node(d, kinfo->fdt,
> +                                       addrcells, sizecells, kinfo);
I haven't yet looked at previous patches but does it make sense to request passing both kinfo->fdt and kinfo?
IMO, the latter would be sufficient. This would apply to other functions you modified.

> +            if ( res )
> +                return res;
> +        }
> +    }
> +
>      return 0;
>  }
> 
> @@ -2856,9 +2877,13 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
>                  return res;
>          }
> 
> -        res = make_resv_memory_node(d, kinfo->fdt, addrcells, sizecells, kinfo);
> -        if ( res )
> -            return res;
> +        /* Avoid duplicate /reserved-memory nodes in Device Tree */
> +        if ( !kinfo->resv_mem )
No need for a new flag as mentioned above. Just before this line of code there is a check:
if ( bootinfo.reserved_mem.nr_banks > 0 )
{
    res = make_memory_node(d, kinfo->fdt, addrcells, sizecells,
                            &bootinfo.reserved_mem);
    if ( res )
        return res;
}
so you can just append the following:
else
{
    res = make_resv_memory_node(d, kinfo->fdt, addrcells, sizecells, kinfo);
    if ( res )
        return res;
}
to achieve the same without a need for a new flag.

~Michal

