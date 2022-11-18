Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 277F062F56F
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 13:59:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445731.701062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow0xl-0002FV-EU; Fri, 18 Nov 2022 12:59:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445731.701062; Fri, 18 Nov 2022 12:59:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow0xl-0002CO-Bj; Fri, 18 Nov 2022 12:59:21 +0000
Received: by outflank-mailman (input) for mailman id 445731;
 Fri, 18 Nov 2022 12:59:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jn0n=3S=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ow0xk-0002CI-4v
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 12:59:20 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20621.outbound.protection.outlook.com
 [2a01:111:f400:fe59::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf60853b-6740-11ed-91b6-6bf2151ebd3b;
 Fri, 18 Nov 2022 13:59:18 +0100 (CET)
Received: from BN9PR03CA0074.namprd03.prod.outlook.com (2603:10b6:408:fc::19)
 by IA1PR12MB6233.namprd12.prod.outlook.com (2603:10b6:208:3e7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Fri, 18 Nov
 2022 12:59:14 +0000
Received: from BN8NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fc:cafe::51) by BN9PR03CA0074.outlook.office365.com
 (2603:10b6:408:fc::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9 via Frontend
 Transport; Fri, 18 Nov 2022 12:59:14 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT068.mail.protection.outlook.com (10.13.177.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Fri, 18 Nov 2022 12:59:14 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 18 Nov
 2022 06:59:13 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 18 Nov
 2022 04:58:16 -0800
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 18 Nov 2022 06:58:14 -0600
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
X-Inumbo-ID: cf60853b-6740-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JyM3+vhgjqgTaUd8xsFypVdBmUfiF4VuOhCYEoEW/UIzVi3F8oyxgd1G0uBKnSmcJ0jwov0LCD9sebAEnFcol3oWUSxyDgT8c1b0u6KRoX1Rp+8v5vDiIcUHHQOpfBI2VMPkxcwGPZs0nXN7Hd0uvuwtajsD3hzE6yP58JTiFPd+sjn+huQi1NiotPIMmxZI3XE9qIXUK6l/AYmvYpLVakBAB2wfAFGpV/cSWllOWyvp5UxVQv3xxI+ZVGPeLxmaPtkHrNzmlqvR7p29IaPxCncKxtZICAfPtam7CGRDyB0DHOaKtPeE1veaF6GeQtiZmxx27/VYKMjaACJgRTc3VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+9Gwi04Kd3N+fiPfOQAsJErAbjp8tegdtG/SBTivV+A=;
 b=noGQHnSX6Ts8O3sZpOb5l920NE48THM2Oin6kHUo4EHAsB82gIN0jfvv+zMNEbsM8s56iBx9nPZ+vkiYzxgj7frduYf1MZlPdGRsMZ3FsPnWgJO2Xd5npm7n/cFAFbAvby26IphIKeYUT2kjlJqZaIq3FYfnPrwmHY4pl8mjIshGyYj2kBSYvWxNboUr8be5d6YBF7glYprQPGD9tJ+fGQiSoceUvWgPywJkOGoDqIYjk25Sjfjglrx1MimorQLmOwMBd+LBmTLMnNFJkhYLjWYm80HwFmTe1Hxb0I/x2OAcJ+cZeNtrYp69hrVqLRiOIXKy2M5QQhn/NN5vbVKK7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9Gwi04Kd3N+fiPfOQAsJErAbjp8tegdtG/SBTivV+A=;
 b=S5BzpKNnjracQXafwWcqqehRA6mOGvrEAVfr1c4MHprNQGkZhJoSDxlr5AVuNkOuGeSfMXGCZYFkODpeMLTEMogVeyr+Nj/6KExGgPsvb2VvQqwiza2t4xknbTNsjXTZA1ewfCkuot3nz8usabwYWOw8yfzlOCh0Bxqp5zZMzEw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <1ae42d38-51e5-2dad-1e15-872022c234ad@amd.com>
Date: Fri, 18 Nov 2022 13:58:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [XEN v3 10/12] xen/Arm: GICv3: Use ULL instead of UL for 64bits
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<jgrall@amazon.com>, <burzalodowa@gmail.com>
References: <20221111141739.2872-1-ayan.kumar.halder@amd.com>
 <20221111141739.2872-11-ayan.kumar.halder@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20221111141739.2872-11-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT068:EE_|IA1PR12MB6233:EE_
X-MS-Office365-Filtering-Correlation-Id: e0e8761b-96a0-4cf6-8f38-08dac964b1b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SRKnR+xQdQ+wIeGQ2/VzCPbjyPzbY2z7lr8jn4Q34KcSUpUmFBkDs+iK8uZxvpU/0SHZ4mHI+Udpifgh86NU4bjV38CeiYpuiv4XvWtFIVJCl76i5RDUAhAdOMkajVsrZ6UW7vbjOwI9qsmfhdr8/BWtKlojKg9RCTxDfdRAuR7ng399QJ3Nkt2MqSRbJCZbA/vqhwl00sX2QcmoVjs/WmWUDwjmkV6FwOz/zdAgYy8CGiw6MtrIqvPNPNLEf2iveRuPjlXuHmlq61FAwsRoKyPbUgBWa7Rsrr3/8u3WOEE92UFknhbg0dLwVFwDeLiLVU5mCdH/rUAZEremqLPpVTkzywVYGFpFTHVTkM+9QhbV6O7jNcrcYYrHxB0UxRH5GqRQvksBlNztp1IKzQRZTBXFVPm9br3nEXBhAv3yE3RWOm7VV+6H2MP32I68WmWOOQ/X8BXQ5RwDCZ+9y9af8Jsq9FHE3m4AYfZarwNB5D7X4l77xCM1mMRvYKCmVK2UqCl6Ns9rhzCdXoXoN5XRrNTNKnHVApybcxxTMA1fxUM/nSjR1JHBQC2aVR1xd3eCYdK3G8Ce+M5RrPAAqA9UFA1l4Fc7eWxRUYnGdnHz5Wfz5vSkJKi8DPKJLfmH/lcb3a2HqI1SBcJb3OJ0j32TGLuRidBVKmICvvNmyhCjk1kGoUsqAb79kNuvfwlI5cAxvFvz74wGeT5wbY/KaiFQ591OggpNubG2QW9o8pTK1UBsWFSqda8wRrZKTzgJGCnoUNfxoAQLUPbqHiZBryNNaw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(136003)(396003)(376002)(451199015)(36840700001)(40470700004)(46966006)(478600001)(31686004)(82740400003)(36860700001)(81166007)(41300700001)(356005)(83380400001)(426003)(47076005)(2906002)(82310400005)(336012)(26005)(36756003)(31696002)(186003)(44832011)(54906003)(53546011)(110136005)(316002)(2616005)(8936002)(16576012)(86362001)(40460700003)(70206006)(70586007)(40480700001)(5660300002)(8676002)(4326008)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 12:59:14.0409
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0e8761b-96a0-4cf6-8f38-08dac964b1b4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6233

Hi Ayan,

On 11/11/2022 15:17, Ayan Kumar Halder wrote:
> "unsigned long long" is defined as 64 bits on AArch64 and AArch32
> Thus, one should this instead of "unsigned long" which is 32 bits
> on AArch32.
> 
> Also use 'PRIx64' instead of 'lx' or 'llx' to print uint64_t.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> 
> Changed from :-
> v1 - 1. Replace PRIu64 with PRIx64 so that the values are printed in hex as
> desired.
> 2. Use ULL in GITS_BASER_RO_MASK as MMIO registers are always unsigned.
> 
> v2 - 1. Removed changes to ITS and LPI as they are not supported for AArch32.
> 
>  xen/arch/arm/gic-v3.c                  | 4 ++--
>  xen/arch/arm/include/asm/gic_v3_defs.h | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index 4722bb4daf..6457e7033c 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -417,12 +417,12 @@ static void gicv3_dump_state(const struct vcpu *v)
>      if ( v == current )
>      {
>          for ( i = 0; i < gicv3_info.nr_lrs; i++ )
> -            printk("   HW_LR[%d]=%llx\n", i, gicv3_ich_read_lr(i));
> +            printk("   HW_LR[%d]=%" PRIx64 "\n", i, gicv3_ich_read_lr(i));
>      }
>      else
>      {
>          for ( i = 0; i < gicv3_info.nr_lrs; i++ )
> -            printk("   VCPU_LR[%d]=%llx\n", i, v->arch.gic.v3.lr[i]);
> +            printk("   VCPU_LR[%d]=%" PRIx64 "\n", i, v->arch.gic.v3.lr[i]);
You changed these specifiers to be llx in patch no.7 so such a change (using PRIx64) should
be done in that patch. Generally there is no need for a patch to fix something that you
introduced earlier in the series. It should be done in one step. Having said that...

>      }
>  }
>  
> diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/asm/gic_v3_defs.h
> index 743ebb20fd..227533868f 100644
> --- a/xen/arch/arm/include/asm/gic_v3_defs.h
> +++ b/xen/arch/arm/include/asm/gic_v3_defs.h
> @@ -195,7 +195,7 @@
>  
>  #define ICH_SGI_IRQMODE_SHIFT        40
>  #define ICH_SGI_IRQMODE_MASK         0x1
> -#define ICH_SGI_TARGET_OTHERS        1UL
> +#define ICH_SGI_TARGET_OTHERS        1ULL
>  #define ICH_SGI_TARGET_LIST          0
>  #define ICH_SGI_IRQ_SHIFT            24
>  #define ICH_SGI_IRQ_MASK             0xf

adding a patch for just this macro is not very useful and you could take the opportunity
to modify it in any of your patches.

~Michal

