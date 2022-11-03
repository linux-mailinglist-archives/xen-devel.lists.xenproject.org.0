Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 521CD617C4E
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 13:14:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436443.690549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqZ6o-0008M5-Gl; Thu, 03 Nov 2022 12:14:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436443.690549; Thu, 03 Nov 2022 12:14:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqZ6o-0008Jd-DZ; Thu, 03 Nov 2022 12:14:10 +0000
Received: by outflank-mailman (input) for mailman id 436443;
 Thu, 03 Nov 2022 12:14:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aeB9=3D=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oqZ6m-0008JW-DY
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 12:14:08 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02994a70-5b71-11ed-91b5-6bf2151ebd3b;
 Thu, 03 Nov 2022 13:14:06 +0100 (CET)
Received: from MW4PR03CA0342.namprd03.prod.outlook.com (2603:10b6:303:dc::17)
 by PH0PR12MB7077.namprd12.prod.outlook.com (2603:10b6:510:21d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Thu, 3 Nov
 2022 12:14:02 +0000
Received: from CO1NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dc:cafe::6e) by MW4PR03CA0342.outlook.office365.com
 (2603:10b6:303:dc::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Thu, 3 Nov 2022 12:14:02 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT056.mail.protection.outlook.com (10.13.175.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5791.20 via Frontend Transport; Thu, 3 Nov 2022 12:14:01 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 3 Nov
 2022 07:14:01 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 3 Nov
 2022 07:14:00 -0500
Received: from [10.71.192.110] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Thu, 3 Nov 2022 07:13:59 -0500
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
X-Inumbo-ID: 02994a70-5b71-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CEhGHT90qbPJKCah85fCGbbtLnfcRSUclIVppeaObZD6xuaZSCrzkyNHvYwVEBGyFpzU+3k9dY+vxwx0AbIRRVA6eVYgqFy8s/nIbnPx0S9JKrOaxnKLDIA40nmdsmcoqSV/H7Thk+/6pog436OnDmJjn6NLeJLPvoHpJH7AzZpFJZ95g6cqD58auD0pF/+YEfEbgZ1T9cf61XoNpcsy6BDd6f3Id9eEOYCgAbJHWk4D9DDfyqbl5L9KMW91vCTvWOqC0/Wiua8tW+D+1JXjQserYDeHoViXGE8cOnIftckvIe3reRNyEusb0oiIYFL6TPrOpNngin7B3X0YLTkWAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z3VUuimEL0Buz3Hv0OOVcwmdVzCYQYX/wD+fO26Vmuc=;
 b=LXKSc8/f0ssyUQHa+94n/sf0vVf256LQ4C1RIDAEWRGXz6bp+DoB3Lig5A8qQoIOHFuraU9MZKE7f+ovhtxshl8hX+47gLRzZEOtKo5/W3oeJT8d35C72Udrh93ZQKqdOKbNMKHYFviH9L4wuk4UVbWFGxv/Eh0GyozgWR/cCyjFxAspNAGSdErzFHdCLkblf/yJtlsdYZ7xVZ66IaSxGVtxpx3r/BATTSgQQ1AcwJ1c/yDoyY25XUuR7c43Q5g3ridosgwK9ZWDSSzTWjgdN29MUuCwMpUIj6327XSXv3c9nnEJJLyB19/NElN4wwSaMJcWd6f8bDMXscNiI5weag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z3VUuimEL0Buz3Hv0OOVcwmdVzCYQYX/wD+fO26Vmuc=;
 b=FiUi74a40m47J7kwBLlXNzLqrjTBgDM9a9y1T8J5U46yY19tWBlgWC0qCCwPkdJVV+4CulC2nJdyGWnblgebWzWUeWFNMadikAYU/5t/tKf25kgk25Aka8bc65y7BU+yCN+RDiIOTz4xQFgqV6BF67NNzqwqysWytV3nGzJPAWI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <b0e6c9e1-dcab-d60e-e912-1203dcb93e55@amd.com>
Date: Thu, 3 Nov 2022 13:13:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [XEN v2 07/12] xen/Arm: GICv3: Define ICH_LR<n>_EL2 on AArch32
To: Ayan Kumar Halder <ayankuma@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<burzalodowa@gmail.com>
References: <20221031151326.22634-1-ayankuma@amd.com>
 <20221031151326.22634-8-ayankuma@amd.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20221031151326.22634-8-ayankuma@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT056:EE_|PH0PR12MB7077:EE_
X-MS-Office365-Filtering-Correlation-Id: 5524a5b9-db99-448b-35b2-08dabd94e4cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UBx+a0Xi0VAiWP8BfBzdbFa2WFPsNJ6YHbbuu1aVjY8qO3CVnAmD+Ai/bhuNMQJ83nkTNgXGH8D+8CwSUbpZNY6tnbK4wxeyt2pklg9u8iSSDI6L9hA2mhnXx/F35+1BUwMXbzvq9L5cWlTZ8qrXlW0t+/SKFcN/4l3gtlne2GivrEVboxPclaL3JYsxkEtrXS0kWH/qGNwDVBVV0m9uGMWvSqU9yxuxNIDuucT9bpxepbgkVf9PES6abl3I5rShMF91ZMBipDk7K/dwCMqo+QmzWrffSP1WJgOeM1K/G+nl9w1PHGX+VARZ4ibR2cjEc+/0362AXEjEU8SEu7lkYaTCSX1Tr+67HQ6KG05A7Hb52WdFOGz7WzXEuO7xChgqDOEzDUXKRZdhJrjuuP5WiCMvvmaSHzQOf66o24Z46AljAMPTPeaNghS4JUkBN9MDfpU7fb2dmp2+bmIPcu+IZE8U6ZDKDp9TAJR4a24NrpuANbc+KL9xPWspgYqfR3OZUkdiio24UIlDHzzoXqu0/PNwQgKJ2VsAri2IIKDtNZY4XJHNeKTm7nUypQBd0qUubyBSGg0D+KNbneHUfJtsHxcG1LMWQFHaDgRH66Vq3hrgkMfbL8ucVo+C8KAijwJBKFmTI7lDOQX96ytmWpEsENTg1JSym4TuTsr8cb6/7VChI/RXCetGqLz6uMcMvENi2F59JKv761lBhOq+Z/cptqOxNa12HQAYwkvNlDB6PKSod3TsyQeGSK970JQvKOcPMIYvnh32lOqFj9ok5PNm4S03FKl9VmMCJ3lu4iW7N2rQ/ZlHsiQjm8RPPSCx0Ku/oX0peza2SwuwCQyLgowbgQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(39860400002)(376002)(396003)(451199015)(40470700004)(46966006)(36840700001)(356005)(4326008)(40460700003)(2616005)(36756003)(81166007)(86362001)(31696002)(26005)(2906002)(41300700001)(82310400005)(40480700001)(53546011)(8676002)(44832011)(186003)(8936002)(478600001)(110136005)(5660300002)(70586007)(16576012)(316002)(54906003)(36860700001)(82740400003)(70206006)(47076005)(83380400001)(31686004)(336012)(426003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 12:14:01.5803
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5524a5b9-db99-448b-35b2-08dabd94e4cb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7077

Hi Ayan,

On 31/10/2022 16:13, Ayan Kumar Halder wrote:
> 
> 
> Refer "Arm IHI 0069H ID020922", 12.4.6, Interrupt Controller List Registers
> 
> AArch64 System register ICH_LR<n>_EL2 bits [31:0] are architecturally
> mapped to AArch32 System register ICH_LR<n>[31:0].
> AArch64 System register ICH_LR<n>_EL2 bits [63:32] are architecturally
> mapped to AArch32 System register ICH_LRC<n>[31:0].
> 
> Defined ICH_LR<0...15>_EL2 and ICH_LRC<0...15>_EL2 for Aarch32.
> For AArch32, the link register is stored as :-
> (((uint64_t) ICH_LRC<0...15>_EL2) << 32) | ICH_LR<0...15>_EL2
> 
> Also, ICR_LR macros need to be modified as ULL is 64 bits for AArch32 and
> AArch64.
> 
> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
> ---
> 
> Changes from :-
> v1 - 1. Moved the coproc register definitions to asm/cpregs.h.
> 2. Use GENMASK(31, 0) to represent 0xFFFFFFFF
> 3. Use READ_CP32()/WRITE_CP32() instead of READ_SYSREG()/WRITE_SYSREG().
> 4. Multi-line macro definitions should be enclosed within ({ }).
> 
>  xen/arch/arm/gic-v3.c                    | 132 +++++++++++------------
>  xen/arch/arm/include/asm/arm32/sysregs.h |  17 +++
>  xen/arch/arm/include/asm/arm64/sysregs.h |   3 +
>  xen/arch/arm/include/asm/cpregs.h        |  42 ++++++++
>  xen/arch/arm/include/asm/gic_v3_defs.h   |   6 +-
>  5 files changed, 131 insertions(+), 69 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/arm32/sysregs.h b/xen/arch/arm/include/asm/arm32/sysregs.h
> index 6841d5de43..8a9a014bef 100644
> --- a/xen/arch/arm/include/asm/arm32/sysregs.h
> +++ b/xen/arch/arm/include/asm/arm32/sysregs.h
> @@ -62,6 +62,23 @@
>  #define READ_SYSREG(R...)       READ_SYSREG32(R)
>  #define WRITE_SYSREG(V, R...)   WRITE_SYSREG32(V, R)
> 
> +#define ICH_LR_REG(INDEX)        ICH_LR ## INDEX ## _EL2
> +#define ICH_LRC_REG(INDEX)       ICH_LRC ## INDEX ## _EL2
You could align to WRITE_SYSREG32(V, R).

Apart from that it would be good to add some comment before the code you added (ICH_LR_REG)
to separate from the code above and its comment about registers coming in 3 types.
Something like:
/* Wrappers for accessing interrupt controller list registers. */

> +
> +#define READ_SYSREG_LR(INDEX)    ({                         \
Opening ({ should be placed one space after READ_SYSREG_LR(INDEX). It does not need to be aligned.

> +    uint64_t _val;                                          \
val is not really necessary. You could directly return the ((uint64_t) _lrc << 32) | _lr;
Just something to consider, no need to replace.

> +    uint32_t _lrc = READ_CP32(ICH_LRC_REG(INDEX));          \
> +    uint32_t _lr = READ_CP32(ICH_LR_REG(INDEX));            \
> +                                                            \
> +    _val = ((uint64_t) _lrc << 32) | _lr;                   \
> +    _val; })
Here, you did put }) at the same line...

> +
> +#define WRITE_SYSREG_LR(INDEX, V) ({                        \
> +    uint64_t _val = (V);                                    \
> +    WRITE_CP32(_val & GENMASK(31, 0), ICH_LR_REG(INDEX)); \
> +    WRITE_CP32(_val >> 32, ICH_LRC_REG(INDEX));           \
Please, align \

> +});
... and here you did not.

> +
>  /* MVFR2 is not defined on ARMv7 */
>  #define MVFR2_MAYBE_UNDEFINED
> 
> diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
> index 54670084c3..353f0eea29 100644
> --- a/xen/arch/arm/include/asm/arm64/sysregs.h
> +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
> @@ -471,6 +471,9 @@
> 
>  #define READ_SYSREG(name)     READ_SYSREG64(name)
>  #define WRITE_SYSREG(v, name) WRITE_SYSREG64(v, name)
Here, I would separate the below macros by adding the comment similar to the one I showed above.
Or at least add a blank line.

> +#define ICH_LR_REG(index)          ICH_LR ## index ## _EL2
> +#define WRITE_SYSREG_LR(index, v)  WRITE_SYSREG(v, ICH_LR_REG(index))
> +#define READ_SYSREG_LR(index)      READ_SYSREG(ICH_LR_REG(index))
I find it a bit odd that the macro param 'index' is written in lower case and for arm32 in upper case.

> 
>  #endif /* _ASM_ARM_ARM64_SYSREGS_H */
> 
> diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
> index 6daf2b1a30..4421dd49ac 100644
> --- a/xen/arch/arm/include/asm/cpregs.h
> +++ b/xen/arch/arm/include/asm/cpregs.h
> @@ -362,6 +362,48 @@
>  #define MVFR0_EL1               MVFR0
>  #define MVFR1_EL1               MVFR1
>  #define MVFR2_EL1               MVFR2
> +
You could align everything below to MVFR2.
Also maybe you could add some comment stating that the below relates to GIC system registers?

> +#define ___CP32(a,b,c,d,e)        a,b,c,d,e
> +#define __LR0_EL2(x)              ___CP32(p15,4,c12,c12,x)
> +#define __LR8_EL2(x)              ___CP32(p15,4,c12,c13,x)
> +
> +#define __LRC0_EL2(x)             ___CP32(p15,4,c12,c14,x)
> +#define __LRC8_EL2(x)             ___CP32(p15,4,c12,c15,x)
> +
> +#define ICH_LR0_EL2               __LR0_EL2(0)
> +#define ICH_LR1_EL2               __LR0_EL2(1)
> +#define ICH_LR2_EL2               __LR0_EL2(2)
> +#define ICH_LR3_EL2               __LR0_EL2(3)
> +#define ICH_LR4_EL2               __LR0_EL2(4)
> +#define ICH_LR5_EL2               __LR0_EL2(5)
> +#define ICH_LR6_EL2               __LR0_EL2(6)
> +#define ICH_LR7_EL2               __LR0_EL2(7)
> +#define ICH_LR8_EL2               __LR8_EL2(0)
> +#define ICH_LR9_EL2               __LR8_EL2(1)
> +#define ICH_LR10_EL2              __LR8_EL2(2)
> +#define ICH_LR11_EL2              __LR8_EL2(3)
> +#define ICH_LR12_EL2              __LR8_EL2(4)
> +#define ICH_LR13_EL2              __LR8_EL2(5)
> +#define ICH_LR14_EL2              __LR8_EL2(6)
> +#define ICH_LR15_EL2              __LR8_EL2(7)
> +
> +#define ICH_LRC0_EL2               __LRC0_EL2(0)
> +#define ICH_LRC1_EL2               __LRC0_EL2(1)
> +#define ICH_LRC2_EL2               __LRC0_EL2(2)
> +#define ICH_LRC3_EL2               __LRC0_EL2(3)
> +#define ICH_LRC4_EL2               __LRC0_EL2(4)
> +#define ICH_LRC5_EL2               __LRC0_EL2(5)
> +#define ICH_LRC6_EL2               __LRC0_EL2(6)
> +#define ICH_LRC7_EL2               __LRC0_EL2(7)
> +#define ICH_LRC8_EL2               __LRC8_EL2(0)
> +#define ICH_LRC9_EL2               __LRC8_EL2(1)
> +#define ICH_LRC10_EL2              __LRC8_EL2(2)
> +#define ICH_LRC11_EL2              __LRC8_EL2(3)
> +#define ICH_LRC12_EL2              __LRC8_EL2(4)
> +#define ICH_LRC13_EL2              __LRC8_EL2(5)
> +#define ICH_LRC14_EL2              __LRC8_EL2(6)
> +#define ICH_LRC15_EL2              __LRC8_EL2(7)
> +
>  #endif
> 
>  #endif
> diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/asm/gic_v3_defs.h
> index 48a1bc401e..87115f8b25 100644
> --- a/xen/arch/arm/include/asm/gic_v3_defs.h
> +++ b/xen/arch/arm/include/asm/gic_v3_defs.h
> @@ -185,9 +185,9 @@
>  #define ICH_LR_HW_SHIFT              61
>  #define ICH_LR_GRP_MASK              0x1
>  #define ICH_LR_GRP_SHIFT             60
> -#define ICH_LR_MAINTENANCE_IRQ       (1UL<<41)
> -#define ICH_LR_GRP1                  (1UL<<60)
> -#define ICH_LR_HW                    (1UL<<61)
> +#define ICH_LR_MAINTENANCE_IRQ       (1ULL<<41)
> +#define ICH_LR_GRP1                  (1ULL<<60)
> +#define ICH_LR_HW                    (1ULL<<61)
You could take the opportunity to add spaces between << to adhere to similar uses in this file.

> 
>  #define ICH_VTR_NRLRGS               0x3f
>  #define ICH_VTR_PRIBITS_MASK         0x7
> --
> 2.17.1
> 
> 

~Michal

