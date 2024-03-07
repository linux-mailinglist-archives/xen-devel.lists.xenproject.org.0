Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 248558749E3
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 09:41:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689674.1074895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ri9Ir-0001d0-J3; Thu, 07 Mar 2024 08:40:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689674.1074895; Thu, 07 Mar 2024 08:40:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ri9Ir-0001aN-Fm; Thu, 07 Mar 2024 08:40:37 +0000
Received: by outflank-mailman (input) for mailman id 689674;
 Thu, 07 Mar 2024 08:40:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v9lb=KN=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ri9Iq-0001aD-AS
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 08:40:36 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2405::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d31fcfe-dc5e-11ee-afda-a90da7624cb6;
 Thu, 07 Mar 2024 09:40:34 +0100 (CET)
Received: from CH0PR03CA0417.namprd03.prod.outlook.com (2603:10b6:610:11b::6)
 by DS7PR12MB8274.namprd12.prod.outlook.com (2603:10b6:8:da::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.26; Thu, 7 Mar
 2024 08:40:30 +0000
Received: from CH1PEPF0000A347.namprd04.prod.outlook.com
 (2603:10b6:610:11b:cafe::b0) by CH0PR03CA0417.outlook.office365.com
 (2603:10b6:610:11b::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39 via Frontend
 Transport; Thu, 7 Mar 2024 08:40:30 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A347.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Thu, 7 Mar 2024 08:40:30 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 7 Mar
 2024 02:40:29 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 7 Mar
 2024 02:40:29 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 7 Mar 2024 02:40:28 -0600
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
X-Inumbo-ID: 5d31fcfe-dc5e-11ee-afda-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q8lvsILVBXB3cHShi4eZ8xH762Xy5bExIKOsxYL2oIK2IR3SwwjPFe846xx36nfgQR5bR3q+uNITZWOZRG62hXRcj3RkChzaP0VbJ2OPkSksPTwgkHtSfChZwWnneiQmmUkLsoWzVaxAOYS1l4mGW9rMVDYYiLyvIMZARYvk7THEUW64pfC05qWfewu2vToV8UwIjmMpfvQTa3l4Gd9YX0lWkkDRanBKTkiPt6UjwOjIyhij6epllslkKWI1KpeyQDe8pp1Kt7pMUe3SoCT/R/MK/Xl5njSuIjpnuDGt8uci9zC2iq5d1In0HKt0A9z0wkoympMqEb3ac+8bh+mt5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w1nMzjLtwMORyPPhkWOuHDn8NKVpR+bJSH8OQwqLg9Q=;
 b=lOUXweC3ZmC/4gtNW7mbFn9KKjufZ7J7K2bcEITIl8wXuwgrvcTUrFizQFYRirA4feooo41H6X6vwwiSdqkwkAoWyirb9kzmHTun5zw3pX92LjS6CPWcT7EikK7iUXPmNl2kLR9CjNCdF6R3TKEo2oHHV/QCIWHjS58d/vgcY4mUWY7t8PtP7b4jjbgFnOJ57w/7a0wM/w5aXUCdzCwxFfHwm6ZsvqFbqbe/e/bd3AYAhv9mQCGA9pPzmGIhUYi+bm2JIh3pjjiWEFUzV7NVELWWMVTaC8aFeC2iuVb+WZeyuwon8gcoiw1f8o4Q2pxkBiYZgmoO6K7TYLnCMl390Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w1nMzjLtwMORyPPhkWOuHDn8NKVpR+bJSH8OQwqLg9Q=;
 b=sHIhmXj27HRzV/CA4j3OOVai8GhW5kHtX0FNbrpLqg3Et2glBLAh5ozLixq6nXXhxBv3epxLnzm60d1W8t9nxgVsuQ2T/cmam4/A6mJsBdGtVEvJ7uEBRVxt+IETaS6GJDYd4XzJaxykffx3ouShT388UPBGqf1DL+594bNvaOU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <3cb1b056-59a7-4ffe-856d-e45aac1936a9@amd.com>
Date: Thu, 7 Mar 2024 09:40:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2] xen/arm: improve handling of load/store
 instruction decoding
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
	<xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <sstabellini@kernel.org>, <bertrand.marquis@arm.com>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
References: <20240306165621.3819343-1-alex.bennee@linaro.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240306165621.3819343-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A347:EE_|DS7PR12MB8274:EE_
X-MS-Office365-Filtering-Correlation-Id: 14931be4-006c-4c79-ef34-08dc3e823f1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XelT6DKEcX58PG3CHNPqQh9OBa9Ljt2TGG7mJ+SJn55jOUd8vckVajWjE4N2qGhENRctQPmGPOdO/XBulZW62VV4fKRExR73DdK60vHU2hCev6on8/yW8WXEdkduGXmlOsU60YKmDvDwEJNtrV9iufFPGgKWozXAnzpOXXvOlxg74AXiK1r7+1vHqLJi1TA1QnpgeX/rdHJT/VBZOSQi50G40l47HNgpavEt6Pmf6AUx9DiChkuzpDzbm9KOKHCKdBMw5Ja1DNFhzFP5NVHecUIR1j2oExoJW+3FP/EyZJFcdF4fsNJaJfpFhwENIGZCS2M4S5HeUoCmwztYMyPZMFfoDtvyqWOfFxU2+rR/r+Gr7klNB+gaLEjwonhSQl84VouhyycRKTdGl7AfBuIu03lm+lAhH5BpC159V4/ciWmawWH6G6SO/G/WCcrkCqvhhAvQNyLW9b7K9zWie44B3taRRiM7a7uJAKtef8SQaCZgeKtGGIXGIZe8L2s/27onPjuBHozuqzIXSU5npFexoJU7Zft0ZkLIiRlWsEHpI/neSFAuBiBVTrFYEMVMkI6dQfyIFxV6DeOA8JO/yAkAsRwL0fQdR3NwQthw+rXhlFMifIcCX56uwwX0sIlBrZKs3PAvXuUg/HX0HUM4CBPuH0BssPNSKtTRasf4jpoYtOFHljhtz8XgJYitwDkAfNTJDtA3vX+O0EhHpTZD6xvAIxahZo1CPK+ocpMs1dgqRzM2DzQk0xgYVaHx4coJlclF
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 08:40:30.4805
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14931be4-006c-4c79-ef34-08dc3e823f1e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A347.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8274

Hi Alex,

NIT: RFC tag is no longer needed.

On 06/03/2024 17:56, Alex Bennée wrote:
> 
> 
> While debugging VirtIO on Arm we ran into a warning due to memory
> being memcpy'd across MMIO space. While the bug was in the mappings
> the warning was a little confusing:
> 
>   (XEN) d47v2 Rn should not be equal to Rt except for r31
>   (XEN) d47v2 unhandled Arm instruction 0x3d800000
>   (XEN) d47v2 Unable to decode instruction
> 
> The Rn == Rt warning is only applicable to single register load/stores
> so add some verification steps before to weed out unexpected accesses.
> 
> While at it update the Arm ARM references to the latest version of the
> documentation.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Move the CC line after --- so that it's not included in the final commit msg.

> 
> ---
> v2
>   - use single line comments where applicable
>   - update Arm ARM references
>   - use #defines for magic numbers
> ---
>  xen/arch/arm/decode.c | 35 ++++++++++++++++++++------
>  xen/arch/arm/decode.h | 57 ++++++++++++++++++++++++++++++++++++++-----
>  2 files changed, 79 insertions(+), 13 deletions(-)
> 
> diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
> index 2537dbebc1..73a88e4701 100644
> --- a/xen/arch/arm/decode.c
> +++ b/xen/arch/arm/decode.c
> @@ -87,15 +87,36 @@ static int decode_arm64(register_t pc, mmio_info_t *info)
>          return 1;
>      }
> 
> +    /* Check this is a load/store of some sort */
> +    if ( (opcode.top_level.op1 & TL_LDST_OP1_MASK) != TL_LDST_OP1_VALUE )
> +    {
> +        gprintk(XENLOG_ERR, "Not a load/store instruction op1=%u\n",
> +                opcode.top_level.op1);
> +        goto bad_loadstore;
> +    }
> +
> +    /* We are only expecting single register load/stores */
> +    if ( (opcode.ld_st.op0 & LS_SREG_OP0_MASK) != LS_SREG_OP0_VALUE )
> +    {
> +        gprintk(XENLOG_ERR, "Not single register load/store op0=%u\n",
NIT: missing 'a' between Not and single

> +                opcode.ld_st.op0);
> +        goto bad_loadstore;
> +    }
> +
>      /*
> -     * Refer Arm v8 ARM DDI 0487G.b, Page - C6-1107
> -     * "Shared decode for all encodings" (under ldr immediate)
> -     * If n == t && n != 31, then the return value is implementation defined
> -     * (can be WBSUPPRESS, UNKNOWN, UNDEFINED or NOP). Thus, we do not support
> -     * this. This holds true for ldrb/ldrh immediate as well.
> +     * Refer Arm v8 ARM DDI 0487J.a, Page - K1-12586
> +     *
> +     * STR (immediate) CONSTRAINED UNPREDICTABLE behaviour
> +     *
> +     * "If the instruction encoding specifies pre-indexed addressing or
> +     * post-indexed addressing, and n == t && n != 31, then one of the
> +     * following behaviors must occur:" UNDEFINED, NOP or UNKNOWN
> +     *
> +     * Execution @ EL0/EL1 when HCR_EL2.TIDCP is 1 traps to EL2 with
> +     * EC = 0.
>       *
> -     * Also refer, Page - C6-1384, the above described behaviour is same for
> -     * str immediate. This holds true for strb/strh immediate as well
> +     * This also hold true for LDR (immediate), Page K1-12581 and
> +     * the RB/RH variants of both.
>       */
>      if ( (opcode.ldr_str.rn == opcode.ldr_str.rt) && (opcode.ldr_str.rn != 31) )
>      {
> diff --git a/xen/arch/arm/decode.h b/xen/arch/arm/decode.h
> index 13db8ac968..188114a71e 100644
> --- a/xen/arch/arm/decode.h
> +++ b/xen/arch/arm/decode.h
> @@ -24,17 +24,54 @@
>  #include <asm/processor.h>
> 
>  /*
> - * Refer to the ARMv8 ARM (DDI 0487G.b), Section C4.1.4 Loads and Stores
> - * Page 318 specifies the following bit pattern for
> - * "load/store register (immediate post-indexed)".
> + * Refer to the ARMv8 ARM (DDI 0487J.a)
>   *
> - * 31 30 29  27 26 25  23   21 20              11   9         4       0
> + * Section C A64 Instruct Set Encoding
This line is not needed

> + *
> + * C4.1 A64 instruction set encoding:
NIT: I would put a comma after section number i.e. C4.1, A64 ...
The same would apply in other places.

> + *
> + *   31  30  29 28  25 24                                             0
>   * ___________________________________________________________________
> - * |size|1 1 1 |V |0 0 |opc |0 |      imm9     |0 1 |  Rn     |  Rt   |
> - * |____|______|__|____|____|__|_______________|____|_________|_______|
> + * |op0 | x  x |  op1 |                                               |
> + * |____|______|______|_______________________________________________|
> + *
> + * op0 = 0 is reserved
I'm not sure how to read it. It is reserved provided op1 is also 0.

> + * op1 = x1x0 for Loads and Stores
> + *
> + * Section C4.1.88 Loads and Stores
Missing colon at the end?

> + *
> + *  31    28 27   26   25  24 23 22 21      16 15  12 11 10 9        0
> + * ___________________________________________________________________
> + * |  op0   | 1 | op1 | 0 | op2 |  |    op3   |      | op4 |          |
> + * |________|___|_____|___|_____|__|__________|______|_____|__________|
> + *
> + * Page C4-653 Load/store register (immediate post-indexed)
> + *
> + * 31 30 29  27 26 25 24 23 22 21 20           12 11 10 9    5 4     0
> + * ___________________________________________________________________
> + * |size|1 1 1 |V | 0 0 | opc |0 |      imm9     | 0 1 |  Rn  |  Rt   |
> + * |____|______|__|_____|_____|__|_______________|_____|______|_______|
>   */
>  union instr {
>      uint32_t value;
> +    struct {
> +        unsigned int ign2:25;
Here, your numeration of ignore fields is in descending order (starting from lsb) but ..,

> +        unsigned int op1:4;     /* instruction class */
> +        unsigned int ign1:2;
> +        unsigned int op0:1;     /* value = 1b */
Why op0 = 0b1 ? This structure represents the generic bit layout (the emulation deals with single ldr/str).
I would drop this comment.

> +    } top_level;
> +    struct {
> +        unsigned int ign1:10;
here in ascending. Let's be consistent (fixed fields are in ascending order). 

> +        unsigned int op4:2;
> +        unsigned int ign2:4;
> +        unsigned int op3:6;
> +        unsigned int ign3:1;
> +        unsigned int op2:2;
> +        unsigned int fixed1:1; /* value = 0b */
> +        unsigned int op1:1;
> +        unsigned int fixed2:1; /* value = 1b */
> +        unsigned int op0:4;
> +    } ld_st;
>      struct {
>          unsigned int rt:5;     /* Rt register */
>          unsigned int rn:5;     /* Rn register */
> @@ -49,6 +86,14 @@ union instr {
>      } ldr_str;
>  };
> 
> +/* Top level load/store encoding */
> +#define TL_LDST_OP1_MASK        0b0101
> +#define TL_LDST_OP1_VALUE       0b0100
> +
> +/* Load/store single reg encoding */
> +#define LS_SREG_OP0_MASK        0b0011
> +#define LS_SREG_OP0_VALUE       0b0011
> +
>  #define POST_INDEX_FIXED_MASK   0x3B200C00
>  #define POST_INDEX_FIXED_VALUE  0x38000400
> 
> --
> 2.39.2
> 
> 

~Michal

