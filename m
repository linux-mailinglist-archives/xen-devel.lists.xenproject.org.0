Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E34615E62
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 09:52:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435662.689317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oq9U7-0000d1-JZ; Wed, 02 Nov 2022 08:52:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435662.689317; Wed, 02 Nov 2022 08:52:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oq9U7-0000bB-Eu; Wed, 02 Nov 2022 08:52:31 +0000
Received: by outflank-mailman (input) for mailman id 435662;
 Wed, 02 Nov 2022 08:52:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cd3U=3C=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oq9U5-0000b1-K5
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 08:52:29 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2087.outbound.protection.outlook.com [40.107.101.87])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id abb4a283-5a8b-11ed-91b5-6bf2151ebd3b;
 Wed, 02 Nov 2022 09:52:27 +0100 (CET)
Received: from DM6PR02CA0097.namprd02.prod.outlook.com (2603:10b6:5:1f4::38)
 by SJ0PR12MB5609.namprd12.prod.outlook.com (2603:10b6:a03:42c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Wed, 2 Nov
 2022 08:52:22 +0000
Received: from DM6NAM11FT082.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1f4:cafe::40) by DM6PR02CA0097.outlook.office365.com
 (2603:10b6:5:1f4::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21 via Frontend
 Transport; Wed, 2 Nov 2022 08:52:21 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT082.mail.protection.outlook.com (10.13.173.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5791.20 via Frontend Transport; Wed, 2 Nov 2022 08:52:21 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 2 Nov
 2022 03:52:19 -0500
Received: from [10.71.192.110] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Wed, 2 Nov 2022 03:52:18 -0500
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
X-Inumbo-ID: abb4a283-5a8b-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=esEuTEJp4PkZS3hUvY/RaaVcaUGd3OZJHgebkNeJVqj715FUQHDvyhsB9l8NMj4BXi1ikWlJTsYfCZVHjuUBnfhTb2ealo3GkP6mZvsKjwhI5rDfIlThi7UnPWPh2WoRScHGScePfOIrdi+0UvZ+0/2L/u1gRRSyVdW5C/U163df7rZRX23oExVg9DcA8K6LldEDuVJOvxc8QdTrAYzvvm49Q6akdopuo2JTznV8mE8NELGevQRBSqxVrsxl5Gmb0897lVIO5gG0pc+SvZ/IEsJ737VkpL1sfG2H/vhDhoaddtXcVTgNCTqzS/ORD9nFjO+N5kfHZiP0MkLbY6C2kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X/jLUbXTFMMm9MS2oC3GDrF/cplqLRXe+DAHKVZ9w/U=;
 b=jyeMIiFCWBSEcwFJLgvn6gx+AXI41IiweB2TDDMaznPDs00JsgM3lTIR2JJn54Y5nSZECOGMu0EnrNNLF4awEd2jbyrknW/i2heAoCdJUXWF48F3Sb8dkYRS1C1tbDAVRN+xt9luXtClEGwVJDgbnM4GC7b6yEfcH3bhiq+jeYprit8pZQ7rUK5PaCO5wle7t/rDs2kaVqho8eeeQZlJfGsP8mhaaGr59224JiiA3evvSqKcuETp90eVQQWEZ2VbeGNi7+0dZD54ejKVuwejseuEqBUAK3pTTObtP/KaIKcX5VJEpwIBoxDe3znLh2H9mZ7ZVHKvwkzpukdrhmdbSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X/jLUbXTFMMm9MS2oC3GDrF/cplqLRXe+DAHKVZ9w/U=;
 b=3dbBNZwVMcdBx3NqC+LsinW1pyAwAsxQ8yTyVzziTa2HjRmDb/XBvwDKpk7HMmJOgsIzdM4nlLXuCKOrQqn7OZ1OPr9E5RKiaewHiKug73Hf8S8V92VX1DypqpsLYtuiBNaCUcvFjl5l336sSGoIMSqRM7WiJKB7JHu/vPw1jqs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <a4881436-83f3-c580-ed96-ac6b477e325e@amd.com>
Date: Wed, 2 Nov 2022 09:52:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [XEN v2 03/12] xen/Arm: vreg: Support vreg_reg64_* helpers on
 Aarch32
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<burzalodowa@gmail.com>
References: <20221031151326.22634-1-ayankuma@amd.com>
 <20221031151326.22634-4-ayankuma@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20221031151326.22634-4-ayankuma@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT082:EE_|SJ0PR12MB5609:EE_
X-MS-Office365-Filtering-Correlation-Id: 36c40938-b95f-4e6a-4da9-08dabcaf8df0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mhumzKm6F3uAw4iq2z7T8kTzwwGRuUOREaCtbUVRxT6keERIVSsIy2X/d3fjsHco+SWx/FiJV2PdwKw+ZOqa3zRQlptQ6JTNJA/X2B74aQdFdKz6iSqlKOkbqKcwLpZfx9QYrtZ38l7ew3jT3ITzxp1HfOZBlmTI2aWBp5Bs1BT89SW8dLO3KQyy73JK0DvhuHT6HE4htM+ynA4QltAkIud/sM453EI6Rlexj2nsYDt1ulI9ib9UO41TFxoxP7sl2ptbga1ri8PhbiYOMVo5ZzHliML2Cjuwm+T59ZY0f4BDpwFCXQ7tW3AcYNYfAOZFtkQwBlD6rtTIk5+ZbaW3/FMdqPbxZmsVAw/cyzrFJI5dlFjFqaFvYx+p8yN5te2iHjE9jIxz1fPXpMGpJ2HVb4vO2s8vO7EdH9X7wqj0CqC1BKu/AQ7eXN07tzOEmsSO0MQErbpLADD/TuJtJHRfJR32yd2P0t2M0IIDJch40VtB/wq8tb4qUvzQUQHAKBpa2FQuPpY4CQA/H+I2/ihv+qPCLnGbwcky03Pvb7fGy4uF+UtgJ/JDCI3lC9pjiqKc5poWzV6kfw/SGHi1njMYPll9DK9WU09oYhiyubcRKQgOr6EibUPLk49wLxSVfjckJepCuyjJcLUAMSA6Tgo5jOqVl69gnCBQuZY191q/T48U6XAptFO9/W/98eBwGKUrKFuBfQV7/eXjREaSFyXkx6+7Sj4gMqzPOGp7n7jt4IczSsAxGUaoe12y5cC0uRhAf/VJ/Lo8YBWqsLORz5B947tgr+Mih55pnKbClZSDf8DH6tEk/CovZbL9b1SmBRoDidn61QJYI1EcDA3jDN5IFg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(376002)(39860400002)(136003)(451199015)(46966006)(40470700004)(36840700001)(83380400001)(426003)(336012)(47076005)(31686004)(86362001)(316002)(44832011)(31696002)(40480700001)(2906002)(356005)(82740400003)(36756003)(81166007)(478600001)(40460700003)(53546011)(82310400005)(186003)(26005)(2616005)(36860700001)(8936002)(41300700001)(8676002)(16576012)(54906003)(70206006)(4326008)(70586007)(110136005)(5660300002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2022 08:52:21.2356
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36c40938-b95f-4e6a-4da9-08dabcaf8df0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT082.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5609

Hi Ayan,

On 31/10/2022 16:13, Ayan Kumar Halder wrote:
> 
> 
> In some situations (eg GICR_TYPER), the hypervior may need to emulate
> 64bit registers in aarch32 mode. In such situations, the hypervisor may
> need to read/modify the lower or upper 32 bits of the 64 bit register.
> 
> In aarch32, 'unsigned long' is 32 bits. Thus, we cannot use it for 64 bit
> registers.
> 
> The correct approach is to typecast 'mask' based on the size of register access
> (ie uint32_t or uint64_t) instead of using 'unsigned long' as it will not
> generate the correct mask for the upper 32 bits of a 64 bit register.
> Also, 'val' needs to be typecasted so that it can correctly update the upper/
> lower 32 bits of a 64 bit register.
> 
> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
> ---
> 
> Changes from :-
> v1 - 1. Remove vreg_reg_extract(), vreg_reg_update(), vreg_reg_setbits() and
> vreg_reg_clearbits(). Moved the implementation to  vreg_reg##sz##_*.
> 'mask' and 'val' is now using uint##sz##_t.
> 
>  xen/arch/arm/include/asm/vreg.h | 88 ++++++++-------------------------
>  1 file changed, 20 insertions(+), 68 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/vreg.h b/xen/arch/arm/include/asm/vreg.h
> index f26a70d024..122ea79b65 100644
> --- a/xen/arch/arm/include/asm/vreg.h
> +++ b/xen/arch/arm/include/asm/vreg.h
> @@ -89,107 +89,59 @@ static inline bool vreg_emulate_sysreg(struct cpu_user_regs *regs, union hsr hsr
>   * The check on the size supported by the register has to be done by
>   * the caller of vreg_regN_*.
>   *
> - * vreg_reg_* should never be called directly. Instead use the vreg_regN_*
> - * according to size of the emulated register
> - *
>   * Note that the alignment fault will always be taken in the guest
>   * (see B3.12.7 DDI0406.b).
>   */
> -static inline register_t vreg_reg_extract(unsigned long reg,
> -                                          unsigned int offset,
> -                                          enum dabt_size size)
> -{
> -    reg >>= 8 * offset;
> -    reg &= VREG_REG_MASK(size);
> -
> -    return reg;
> -}
> -
> -static inline void vreg_reg_update(unsigned long *reg, register_t val,
> -                                   unsigned int offset,
> -                                   enum dabt_size size)
> -{
> -    unsigned long mask = VREG_REG_MASK(size);
> -    int shift = offset * 8;
> -
> -    *reg &= ~(mask << shift);
> -    *reg |= ((unsigned long)val & mask) << shift;
> -}
> -
> -static inline void vreg_reg_setbits(unsigned long *reg, register_t bits,
> -                                    unsigned int offset,
> -                                    enum dabt_size size)
> -{
> -    unsigned long mask = VREG_REG_MASK(size);
> -    int shift = offset * 8;
> -
> -    *reg |= ((unsigned long)bits & mask) << shift;
> -}
> -
> -static inline void vreg_reg_clearbits(unsigned long *reg, register_t bits,
> -                                      unsigned int offset,
> -                                      enum dabt_size size)
> -{
> -    unsigned long mask = VREG_REG_MASK(size);
> -    int shift = offset * 8;
> -
> -    *reg &= ~(((unsigned long)bits & mask) << shift);
> -}
> 
>  /* N-bit register helpers */
>  #define VREG_REG_HELPERS(sz, offmask)                                   \
>  static inline register_t vreg_reg##sz##_extract(uint##sz##_t reg,       \
>                                                  const mmio_info_t *info)\
>  {                                                                       \
> -    return vreg_reg_extract(reg, info->gpa & (offmask),                 \
> -                            info->dabt.size);                           \
> +    unsigned int offset = info->gpa & (offmask);                        \
In all the other helpers you are also defining the variables to store shift and mask,
no matter the number of uses. I know that this is a left over from the removed helpers,
but since you are modifying the file you could improve consistency and define them
here as well.

> +                                                                        \
> +    reg >>= 8 * offset;                                                 \
> +    reg &= VREG_REG_MASK(info->dabt.size);                              \
> +                                                                        \
> +    return reg;                                                         \
>  }                                                                       \
>                                                                          \
>  static inline void vreg_reg##sz##_update(uint##sz##_t *reg,             \
>                                           register_t val,                \
>                                           const mmio_info_t *info)       \
>  {                                                                       \
> -    unsigned long tmp = *reg;                                           \
> -                                                                        \
> -    vreg_reg_update(&tmp, val, info->gpa & (offmask),                   \
> -                    info->dabt.size);                                   \
> +    unsigned int offset = info->gpa & (offmask);                        \
> +    uint##sz##_t mask = VREG_REG_MASK(info->dabt.size);                 \
> +    int shift = offset * 8;                                             \
>                                                                          \
> -    *reg = tmp;                                                         \
> +    *reg &= ~(mask << shift);                                           \
> +    *reg |= ((uint##sz##_t)val & mask) << shift;                        \
>  }                                                                       \
>                                                                          \
>  static inline void vreg_reg##sz##_setbits(uint##sz##_t *reg,            \
>                                            register_t bits,              \
>                                            const mmio_info_t *info)      \
>  {                                                                       \
> -    unsigned long tmp = *reg;                                           \
> -                                                                        \
> -    vreg_reg_setbits(&tmp, bits, info->gpa & (offmask),                 \
> -                     info->dabt.size);                                  \
> +    unsigned int offset = info->gpa & (offmask);                        \
> +    uint##sz##_t mask = VREG_REG_MASK(info->dabt.size);                 \
> +    int shift = offset * 8;                                             \
>                                                                          \
> -    *reg = tmp;                                                         \
> +    *reg |= ((uint##sz##_t)bits & mask) << shift;                       \
>  }                                                                       \
>                                                                          \
>  static inline void vreg_reg##sz##_clearbits(uint##sz##_t *reg,          \
>                                              register_t bits,            \
>                                              const mmio_info_t *info)    \
>  {                                                                       \
> -    unsigned long tmp = *reg;                                           \
> +    unsigned int offset = info->gpa & (offmask);                        \
> +    uint##sz##_t mask = VREG_REG_MASK(info->dabt.size);                 \
> +    int shift = offset * 8;                                             \
>                                                                          \
> -    vreg_reg_clearbits(&tmp, bits, info->gpa & (offmask),               \
> -                       info->dabt.size);                                \
> -                                                                        \
> -    *reg = tmp;                                                         \
> +    *reg &= ~(((uint##sz##_t)bits & mask) << shift);                    \
>  }
> 
> -/*
> - * 64 bits registers are only supported on platform with 64-bit long.
> - * This is also allow us to optimize the 32 bit case by using
> - * unsigned long rather than uint64_t
> - */
> -#if BITS_PER_LONG == 64
> -VREG_REG_HELPERS(64, 0x7);
> -#endif
>  VREG_REG_HELPERS(32, 0x3);
> +VREG_REG_HELPERS(64, 0x7);
No need for the movement. 64 should stay as it was before 32 and you should only
remove the guards.

> 
>  #undef VREG_REG_HELPERS
> 
> --
> 2.17.1
> 
> 
Apart from that, the change looks good.

~Michal

