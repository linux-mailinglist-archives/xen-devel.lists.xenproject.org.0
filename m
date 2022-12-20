Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A443651DDA
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 10:45:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466836.725792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7ZBO-0005R1-Vh; Tue, 20 Dec 2022 09:45:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466836.725792; Tue, 20 Dec 2022 09:45:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7ZBO-0005Oj-Sz; Tue, 20 Dec 2022 09:45:10 +0000
Received: by outflank-mailman (input) for mailman id 466836;
 Tue, 20 Dec 2022 09:45:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xvy2=4S=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p7ZBN-0005JG-RL
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 09:45:10 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2050.outbound.protection.outlook.com [40.107.243.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd33de92-804a-11ed-8fd4-01056ac49cbb;
 Tue, 20 Dec 2022 10:45:08 +0100 (CET)
Received: from BN9PR03CA0797.namprd03.prod.outlook.com (2603:10b6:408:13f::22)
 by DM6PR12MB4895.namprd12.prod.outlook.com (2603:10b6:5:1bc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 09:45:05 +0000
Received: from BN8NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13f:cafe::4c) by BN9PR03CA0797.outlook.office365.com
 (2603:10b6:408:13f::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.21 via Frontend
 Transport; Tue, 20 Dec 2022 09:45:04 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT031.mail.protection.outlook.com (10.13.177.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.6 via Frontend Transport; Tue, 20 Dec 2022 09:45:04 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 20 Dec
 2022 03:44:59 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 20 Dec
 2022 01:44:38 -0800
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 20 Dec 2022 03:44:37 -0600
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
X-Inumbo-ID: fd33de92-804a-11ed-8fd4-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TC9SwWJQp+N9Es06l+zc5lRtDVSstTs4CZ1n3G52egfN/6gRumvrTItgXdI1b3eNrHU2DdqVCUokx4Fj85w4rZFhjzT5ALBQRL+5zTmbNenEUSkcEFrFjRUKcfpMwvvbqk9UUUGKgVroprbygv1rUy1JAZGdtfY96h3R/gOcnU4Een4RelwAUl2JfnZst8h6YvyriNV9XMy3tkqVn+qJElFvfbDb2DvuGvMks8kHV/RM3BwFQluwrVUt+9cl1ufyLBDpta5lCmI9VhHVKFvXgPSe0qrOKndTs5kTjfwQVncFlxqas65V9/28YoK9yLLU56Ah4nwuHSEl4o+mAqw3ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lrFgEUx0HyVEIJQpnHEeHDP9doH/V5+tumNX/NOf1ZY=;
 b=SLNZxaP6BSkFIeWHV6P6t8duzfbpQGkXQX9VVZ4wF+dgNzF2mnzbpGUkD/no22vjCZbiJUbqmFO8TQv2RGzA6sUM2aK6QweFPZF5WR0st58XtlkHSWcsroQJMeMP1XT/dpiSerVsfyCSQzqqrDe3TnTvSAnfBg4cTD9xzult1JGLw57nUvopGhZxpxTwPkKnlGzduQIfNvEyMyL2Q9adJh9zLSlsYnaF2/uh7N6rum+4/NlzCfhqSDw9xbCtNOb9CZgMFAi2Sokxwwasn7umlXTAepu55djwW+2hHJoAJhPdDU+IXqOSONND5OmzUFB1zn+d4HPAvP16iQhcfMtwBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lrFgEUx0HyVEIJQpnHEeHDP9doH/V5+tumNX/NOf1ZY=;
 b=LyUoE5WVOYtY2MWRQX826DdyN5Cv/GPJ8XiuEPnAP2dYkcX75vVfWzOW5/sA+1eLV30Fkk0qfQc22KXcc17O13dgkGAnjq6TbxBsmsmlJrTSK3/pkhATA2o9oVA1TSn9pTukQaaAeKekx6tVsy/xP7oE+3qeNQPddxRi3QSEFaM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <75635251-5f51-fbe0-28be-a99480541116@amd.com>
Date: Tue, 20 Dec 2022 10:44:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [XEN v3] xen/arm: Probe the entry point address of an uImage
 correctly
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>
References: <20221217193801.19485-1-ayan.kumar.halder@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20221217193801.19485-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT031:EE_|DM6PR12MB4895:EE_
X-MS-Office365-Filtering-Correlation-Id: ad14ebf2-9d76-4f2b-cf1e-08dae26edf0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JDjA+XhL8BIIxeIWdD6Epc3W900YXeSitlEUg9+s77+PUZRZwIrmxppoRO0KSqqTCekeRiN3wOEvjXTBM7IijizgFgmd1yEJzzIXrQJot0E3kpRu26/dqH6BFqpBghvACFxxZpH+I31eB7OGc+NTvtAR86lI59C8WfXST3s7j3LhA3aFcXuveIcgpETbCuT7lnLQjA7pZqL/hSxN983BDKgX0ZEqhfb8LF0wt3hDaarLY6O5XK0H5M4EGyUrFzs4zyyz+S8XYgf1TSPgY3yfRtG7Hr0p9ZxRzAqGfEc7TzIelJNLrWWE9DUbX7iTh7+g7sixE1pECZWJQ7FIVfmTGuKbtiOagkp1BPR+pDfmLwUw7ynIbj6zZp9erGlhf1FNpuxyj5a95DhwYSld+oIokAFsw9fF7XRs0Maa/hCdfYRUJWxx5NJE9XW8eVEl8sL6D2VBO7VOQeihwRQGTmnSj8V9gSbvHA+6bWbKsK1e08QB8zXTGIslbyNLMh8SoNUPhHaFLZqEir6F2mrCG7I912q+YVPMEp3hOtAK7Us73cd/J1oTXHQk7wxnpdaiA4en/UbKV2c/rWLz7bZ9u8q/E/5pZX0cTDKrG30MqIIBKMawzrngxl+NQWv1epPVsu4UKOfiv4yh66/8IuOC6azre5W78zzQQN1422FgQoSlT1u+inXNFatHTMI7ZlWdXlNH4IcF8HNDeZwTw12FtqRkWSJwGCPMHlc7byoESMlAejWLOVa+AKxPnUNo6YBBm8mw4hfew/p7Nq0MIgJExNWpmxWRyxV2Hu5VJVYRiigoDmAtg8MrPdp8NlDu/EmppVpjJJmslcIcjrD2mnSit/9rEQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(39860400002)(396003)(451199015)(46966006)(40470700004)(36840700001)(426003)(8936002)(8676002)(47076005)(4326008)(336012)(40460700003)(356005)(36860700001)(83380400001)(81166007)(44832011)(82310400005)(82740400003)(36756003)(5660300002)(2906002)(41300700001)(53546011)(31686004)(966005)(478600001)(110136005)(316002)(16576012)(86362001)(31696002)(54906003)(2616005)(70586007)(70206006)(26005)(186003)(40480700001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2022 09:45:04.2316
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad14ebf2-9d76-4f2b-cf1e-08dae26edf0c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4895

Hi Ayan,

On 17/12/2022 20:38, Ayan Kumar Halder wrote:
> Currently, kernel_uimage_probe() does not set info->zimage.start. As a
> result, it contains the default value (ie 0). This causes,
> kernel_zimage_place() to treat the binary (contained within uImage) as
> position independent executable. Thus, it loads it at an incorrect address.
> 
> The correct approach would be to read "uimage.ep" and set
> info->zimage.start. This will ensure that the binary is loaded at the
> correct address. Also, it checks that the load address and entry address
> are the same. The reason being we currently support non compressed images
> for uImage header. And as seen in uboot sources(image_decomp(), case
> IH_COMP_NONE), load address and entry address can be the same.
> 
> This behavior is applicable for both arm and arm64 platforms.
> 
> Earlier for arm32 and arm64 platforms, Xen was ignoring the entry point
> address set in the uImage header. With this commit, Xen will use the
> kernel entry point address as specified in the header. This makes the
> behavior of Xen consistent with uboot for uimage headers.
> 
> Users who want to use Xen with statically partitioned domains, can
> provide the fixed non zero load address for the dom0/domU kernel.
> 
> A deviation from uboot behaviour is that we consider load address == 0x0,
> to denote that the image supports position independent execution. This
> is to make the behavior consistent across uImage and zImage.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> 
> Changes from v1 :-
> 1. Added a check to ensure load address and entry address are the same.
> 2. Considered load address == 0x0 as position independent execution.
> 3. Ensured that the uImage header interpretation is consistent across
> arm32 and arm64.
> 
> v2 :-
> 1. Mentioned the change in existing behavior in booting.txt.
> 2. Updated booting.txt with a new section to document "Booting Guests".
> 
>  docs/misc/arm/booting.txt         | 21 +++++++++++++++++++++
>  xen/arch/arm/include/asm/kernel.h |  2 +-
>  xen/arch/arm/kernel.c             | 27 ++++++++++++++++++++++++++-
>  3 files changed, 48 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/misc/arm/booting.txt b/docs/misc/arm/booting.txt
> index 3e0c03e065..01b12b49a5 100644
> --- a/docs/misc/arm/booting.txt
> +++ b/docs/misc/arm/booting.txt
> @@ -23,6 +23,24 @@ The exceptions to this on 32-bit ARM are as follows:
>  
>  There are no exception on 64-bit ARM.
>  
> +Booting Guests
> +--------------
> +
> +Xen supports the legacy image protocol[3], zImage protocol for 32-bit ARM
uImage is not a protocol. It is just a header with no other information \wrt
boot requirements.

> +Linux[1] and Image protocol defined for ARM64[2].
> +
> +Earlier for legacy image protocol, Xen ignored the load address and entry
> +point specified in the header. This has now changed.
> +
> +Now, it loads the image at the load address provided in the header.
> +For now, it supports images where load address is same as entry point.
Would be beneficial to add explanation why load address must be equal to start address.

> +
> +A deviation from uboot is that, Xen treats "load address == 0x0" as
> +position independent execution. Thus, Xen will load such an image at an
> +address it considers appropriate.
> +
> +Users who want to use Xen with statically partitioned domains, can provide
> +the fixed non zero load address for the dom0/domU kernel.

I think this section is missing a note that in case of not PIE, a load/start address
specified by the user in a header must be within the memory region allocated by Xen.

>  
>  Firmware/bootloader requirements
>  --------------------------------
> @@ -39,3 +57,6 @@ Latest version: http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/t
>  
>  [2] linux/Documentation/arm64/booting.rst
>  Latest version: http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/arm64/booting.rst
> +
> +[3] legacy format header
> +Latest version: https://source.denx.de/u-boot/u-boot/-/blob/master/include/image.h#L315
> diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
> index 5bb30c3f2f..4617cdc83b 100644
> --- a/xen/arch/arm/include/asm/kernel.h
> +++ b/xen/arch/arm/include/asm/kernel.h
> @@ -72,7 +72,7 @@ struct kernel_info {
>  #ifdef CONFIG_ARM_64
>              paddr_t text_offset; /* 64-bit Image only */
>  #endif
> -            paddr_t start; /* 32-bit zImage only */
> +            paddr_t start; /* Must be 0 for 64-bit Image */
>          } zimage;
>      };
>  };
> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
> index 23b840ea9e..e9c18993ef 100644
> --- a/xen/arch/arm/kernel.c
> +++ b/xen/arch/arm/kernel.c
> @@ -127,7 +127,7 @@ static paddr_t __init kernel_zimage_place(struct kernel_info *info)
>      paddr_t load_addr;
>  
>  #ifdef CONFIG_ARM_64
> -    if ( info->type == DOMAIN_64BIT )
> +    if ( (info->type == DOMAIN_64BIT) && (info->zimage.start == 0) )
>          return info->mem.bank[0].start + info->zimage.text_offset;
>  #endif
>  
> @@ -223,6 +223,31 @@ static int __init kernel_uimage_probe(struct kernel_info *info,
>      if ( len > size - sizeof(uimage) )
>          return -EINVAL;
>  
> +    info->zimage.start = be32_to_cpu(uimage.ep);
> +
> +    /*
> +     * Currently, we support uImage headers for uncompressed images only.
> +     * Thus, it is valid for the load address and start address to be the
> +     * same. This is consistent with the uboot behavior (Refer
> +     * "case IH_COMP_NONE" in image_decomp().
Please make it clear that you are referring to uboot function.

> +     */
> +    if ( info->zimage.start != be32_to_cpu(uimage.load) )
> +    {
> +        panic("Unable to support mismatching load address and entry address\n");
> +        return -EINVAL;
> +    }
> +
> +    /*
> +     * While uboot considers 0x0 to be a valid load/start address, for Xen
> +     * to mantain parity with zimage, we consider 0x0 to denote position
> +     * independent image. That means Xen is free to load such an image at
> +     * any valid address.
> +     * Thus, we will print an appropriate message.
> +     */
> +    if ( info->zimage.start == 0 )
> +        printk(XENLOG_INFO
> +               "No load address provided. Xen will decide where to load it\n");
> +
>      info->zimage.kernel_addr = addr + sizeof(uimage);
>      info->zimage.len = len;
>  

~Michal


