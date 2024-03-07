Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 895E5874C99
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 11:43:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689754.1075011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riBDh-0000pj-Me; Thu, 07 Mar 2024 10:43:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689754.1075011; Thu, 07 Mar 2024 10:43:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riBDh-0000nJ-Ib; Thu, 07 Mar 2024 10:43:25 +0000
Received: by outflank-mailman (input) for mailman id 689754;
 Thu, 07 Mar 2024 10:43:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v9lb=KN=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1riBDg-0000nD-Ih
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 10:43:24 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:200a::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84a0db5d-dc6f-11ee-afda-a90da7624cb6;
 Thu, 07 Mar 2024 11:43:23 +0100 (CET)
Received: from MN2PR18CA0014.namprd18.prod.outlook.com (2603:10b6:208:23c::19)
 by CH3PR12MB8403.namprd12.prod.outlook.com (2603:10b6:610:133::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Thu, 7 Mar
 2024 10:43:17 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:208:23c:cafe::c7) by MN2PR18CA0014.outlook.office365.com
 (2603:10b6:208:23c::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.26 via Frontend
 Transport; Thu, 7 Mar 2024 10:43:17 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Thu, 7 Mar 2024 10:43:17 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 7 Mar
 2024 04:43:16 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 7 Mar
 2024 04:43:16 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 7 Mar 2024 04:43:15 -0600
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
X-Inumbo-ID: 84a0db5d-dc6f-11ee-afda-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cp3DA5l32izZlCgppM6/6/+UrlMpX1coOQx+aWUxFj88rZb46VMoHD5jFK40suZ3F3FCzE3IWHAIkBsipgz3zezpEyDzSp7jvZXsSKXu1djBuH2MUSd7gnGDbDZ8JIt9jxIy+txSiKHrj1SJiaxmV7eD0rhvNxnuLRd/8bgRVSlmWj843uZddmMOPE1lLGUEAJ7TbP9ecyILkesbd3jTbdwun+PgVgeZ6rgHZzpX9PqyRauTAc3Dg6cBiTHIyLONb6UCbWepzWJxEIH5Klfk4nslO9+lRew6jHD/oJ7BEmUEE/vbkowmjNmKJvMW7rHISV8awDrpmyT/Xuhm5/Ci0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GguB6Fj7X2ib2jvi6DRRf55VTe2TQEPTmcFfApAs/qQ=;
 b=QaszeEq4p0U5Ec2JW/vHTETX58qROaVm5gRQxc/J0+KuCzqu78eVJW/a/mTGNW5Kh/4zJQ+g9NmRnQHZSHFPfHW7bD1QOGodCnTId+eVsryyqg3LvS/SRawP5A5Kae3dI03DsGKy/edYEAFv8MlGBrQdF8sRrjcrl1uIKjSAXppl06C8LuOybeK6JwPoKfnaQs4cvpzWrtzqI/cD8xBHXiKu8EwJbkTDkr9oTOFgW8g4SSpVjTGUcYMXlhApAesK92XPqF8U8/w+/yUvV5R3akxouUl4/c5vkHQL9t/UJpu/aQCavgcOFBDrT5wYSpe9X91ZeTuWA8nvb1AkJb34sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GguB6Fj7X2ib2jvi6DRRf55VTe2TQEPTmcFfApAs/qQ=;
 b=sEWPmnfva5nVY3r7nsCTUQRfKH8cD/2X+crko8/nH93QgSBhMMAxXvbBWHNrTKN/Vi54I6LaJPy+sqE4AOJkGplujZJjx8DoL5zoVsXpMOlLO1X1AMy5CMsxLyDDD+X8vIaLL4qHkd36sACfJzXbBlZvlhAT2FlcUisBFNDcv6w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <5eaf5a24-d9b6-4045-8b90-61897464d7a2@amd.com>
Date: Thu, 7 Mar 2024 11:43:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2] xen/arm: improve handling of load/store
 instruction decoding
Content-Language: en-US
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	=?UTF-8?Q?Alex_Benn_=C3=A9_e?= <alex.bennee@linaro.org>,
	<xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <sstabellini@kernel.org>, <bertrand.marquis@arm.com>
References: <20240306165621.3819343-1-alex.bennee@linaro.org>
 <3cb1b056-59a7-4ffe-856d-e45aac1936a9@amd.com>
 <9z3mh.tiey2z2itr9a@linaro.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <9z3mh.tiey2z2itr9a@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|CH3PR12MB8403:EE_
X-MS-Office365-Filtering-Correlation-Id: 19b09ebe-2ef6-4a98-898f-08dc3e9365e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YIDeGHO8AUZ8CZbEgUaNRMK+1b1DZXIU1dFtf0mZXo2Va/zLQUuLYD82DYMO4UIGqwK5HMlnYZjHDydtXMdUwMa9ICrCe0UwXWBe1pTkt0OOtjZO61RVi3PhL3fXlh7OcIB7JhP85UemwGWtyM6ewQ2fpJHA53jpcuFZV9xEOLoFuc3Q9S2sonPAp95rSK0p7FwLSilckDq5PffsP7NOVVeK+IBoQKDKL85ZVDVrSPhqzrMTYkTYQxP/TyU470vDmiO5WeBBDUNwGk05Piv5SKmsu3VpMEWoWLx2c1JgPjMIlZkBmKgIrU9wykDZoFdusoGjtQ+rsozAVeTFZA70laHBIKIGugIIbczZcnnhpAm2odaBPrmXzqkVNPmCeZVaiPTAlJJO3PETYAnb0k1XmlrLMRcTY52LPe1/eYPFPlJMV1u6099LAyHnah3xOwoMKZ6RqdLdps6IBT/uoMpeiVQ3Cdn/i2prMxmu1IujiQHD8EhEYg9B8vwjpVzlA1e4q5ufMe9T7AVz6iPSpZ0CkK5b1gxhlVtW2DMRnPmEhETt7d/75pcnfY29zcPiClx27Gu+7BbgxciUyg8NU8PhT+8wcO32rN8aJYF8efGH+zhX06vdcUXeB1sNPhgMz12uAAy1tZiltprkFcGu5olkt/vxB2ewuXrZAtDpA0lWWuOe0QPi5HknplnhOKo8yuTIz9Vt+Rk26AbLyMHOs3kgqAqZtFX6viRyOaeisuG6E1XPeOvcvSRTPipNPthqyr1c
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 10:43:17.0021
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19b09ebe-2ef6-4a98-898f-08dc3e9365e6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8403



On 07/03/2024 11:02, Manos Pitsidianakis wrote:
> 
> 
> Hi Michal, Alex,
> 
> I'm responding to Michel but also giving my own review comments here.
> 
> On Thu, 07 Mar 2024 10:40, Michal Orzel <michal.orzel@amd.com> wrote:
>> Hi Alex,
>>
>> NIT: RFC tag is no longer needed.
>>
>> On 06/03/2024 17:56, Alex Bennée wrote:
>>>
>>>
>>> While debugging VirtIO on Arm we ran into a warning due to memory
>>> being memcpy'd across MMIO space. While the bug was in the mappings
>>> the warning was a little confusing:
>>>
>>>   (XEN) d47v2 Rn should not be equal to Rt except for r31
>>>   (XEN) d47v2 unhandled Arm instruction 0x3d800000
>>>   (XEN) d47v2 Unable to decode instruction
>>>
>>> The Rn == Rt warning is only applicable to single register load/stores
>>> so add some verification steps before to weed out unexpected accesses.
>>>
>>> While at it update the Arm ARM references to the latest version of the
>>> documentation.
>>>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
>> Move the CC line after --- so that it's not included in the final commit msg.
>>
>>>
>>> ---
>>> v2
>>>   - use single line comments where applicable
>>>   - update Arm ARM references
>>>   - use #defines for magic numbers
>>> ---
>>>  xen/arch/arm/decode.c | 35 ++++++++++++++++++++------
>>>  xen/arch/arm/decode.h | 57 ++++++++++++++++++++++++++++++++++++++-----
>>>  2 files changed, 79 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
>>> index 2537dbebc1..73a88e4701 100644
>>> --- a/xen/arch/arm/decode.c
>>> +++ b/xen/arch/arm/decode.c
>>> @@ -87,15 +87,36 @@ static int decode_arm64(register_t pc, mmio_info_t *info)
>>>          return 1;
>>>      }
>>>
>>> +    /* Check this is a load/store of some sort */
>>> +    if ( (opcode.top_level.op1 & TL_LDST_OP1_MASK) != TL_LDST_OP1_VALUE )
>>> +    {
>>> +        gprintk(XENLOG_ERR, "Not a load/store instruction op1=%u\n",
>>> +                opcode.top_level.op1);
>>> +        goto bad_loadstore;
>>> +    }
>>> +
>>> +    /* We are only expecting single register load/stores */
>>> +    if ( (opcode.ld_st.op0 & LS_SREG_OP0_MASK) != LS_SREG_OP0_VALUE )
>>> +    {
>>> +        gprintk(XENLOG_ERR, "Not single register load/store op0=%u\n",
>> NIT: missing 'a' between Not and single
>>
>>> +                opcode.ld_st.op0);
>>> +        goto bad_loadstore;
>>> +    }
>>> +
>>>      /*
>>> -     * Refer Arm v8 ARM DDI 0487G.b, Page - C6-1107
>>> -     * "Shared decode for all encodings" (under ldr immediate)
>>> -     * If n == t && n != 31, then the return value is implementation defined
>>> -     * (can be WBSUPPRESS, UNKNOWN, UNDEFINED or NOP). Thus, we do not support
>>> -     * this. This holds true for ldrb/ldrh immediate as well.
>>> +     * Refer Arm v8 ARM DDI 0487J.a, Page - K1-12586
>>> +     *
>>> +     * STR (immediate) CONSTRAINED UNPREDICTABLE behaviour
>>> +     *
>>> +     * "If the instruction encoding specifies pre-indexed addressing or
>>> +     * post-indexed addressing, and n == t && n != 31, then one of the
>>> +     * following behaviors must occur:" UNDEFINED, NOP or UNKNOWN
>>> +     *
>>> +     * Execution @ EL0/EL1 when HCR_EL2.TIDCP is 1 traps to EL2 with
>>> +     * EC = 0.
>>>       *
>>> -     * Also refer, Page - C6-1384, the above described behaviour is same for
>>> -     * str immediate. This holds true for strb/strh immediate as well
>>> +     * This also hold true for LDR (immediate), Page K1-12581 and
>>> +     * the RB/RH variants of both.
>>>       */
>>>      if ( (opcode.ldr_str.rn == opcode.ldr_str.rt) && (opcode.ldr_str.rn != 31) )
>>>      {
>>> diff --git a/xen/arch/arm/decode.h b/xen/arch/arm/decode.h
>>> index 13db8ac968..188114a71e 100644
>>> --- a/xen/arch/arm/decode.h
>>> +++ b/xen/arch/arm/decode.h
>>> @@ -24,17 +24,54 @@
>>>  #include <asm/processor.h>
>>>
>>>  /*
>>> - * Refer to the ARMv8 ARM (DDI 0487G.b), Section C4.1.4 Loads and Stores
>>> - * Page 318 specifies the following bit pattern for
>>> - * "load/store register (immediate post-indexed)".
>>> + * Refer to the ARMv8 ARM (DDI 0487J.a)
>>>   *
>>> - * 31 30 29  27 26 25  23   21 20              11   9         4       0
>>> + * Section C A64 Instruct Set Encoding
>> This line is not needed
> 
> I think it is needed for context (it answers the question "what is
> C4.1?" in the following line.
> 
>>> + *
>>> + * C4.1 A64 instruction set encoding:
>> NIT: I would put a comma after section number i.e. C4.1, A64 ...
>> The same would apply in other places.
> 
> Style manuals use either space (like here), a period (.) or colon (:),
> never a comma.
Since it's a NIT, I'm not going to object. I just care about readability, we do not
need to adhere to any "style manuals".

> 
>>
>>> + *
>>> + *   31  30  29 28  25 24                                             0
>>>   * ___________________________________________________________________
>>> - * |size|1 1 1 |V |0 0 |opc |0 |      imm9     |0 1 |  Rn     |  Rt   |
>>> - * |____|______|__|____|____|__|_______________|____|_________|_______|
>>> + * |op0 | x  x |  op1 |                                               |
>>> + * |____|______|______|_______________________________________________|
>>> + *
>>> + * op0 = 0 is reserved
>> I'm not sure how to read it. It is reserved provided op1 is also 0.
> 
> Yes, it should say something like:
> 
>> Decode field values op0 = 0, op1 = 0 are reserved.
>> Values op0 = 1, op1 = x1x0 correspond to Loads and Stores
> 
>>> + * op1 = x1x0 for Loads and Stores
>>> + *
>>> + * Section C4.1.88 Loads and Stores
>> Missing colon at the end?
> 
> It's a heading so a colon would not be appropriate.
In this case why was it added before in:
"C4.1 A64 instruction set encoding:"

> 
>>
>>> + *
>>> + *  31    28 27   26   25  24 23 22 21      16 15  12 11 10 9        0
>>> + * ___________________________________________________________________
>>> + * |  op0   | 1 | op1 | 0 | op2 |  |    op3   |      | op4 |          |
>>> + * |________|___|_____|___|_____|__|__________|______|_____|__________|
>>> + *
> 
> Maybe we should add the op{0,1,2,3,4} values for consistency?
> 
>> Values op0=xx11, op1=0, op2=0x, op3=0xxxxx, op4=01 correspond to
>> Load/store register (immediate post-indexed)
I think this should stay neutral in case we add a new emulation in a future.

> 
>>> + * Page C4-653 Load/store register (immediate post-indexed)
>>> + *
>>> + * 31 30 29  27 26 25 24 23 22 21 20           12 11 10 9    5 4     0
>>> + * ___________________________________________________________________
>>> + * |size|1 1 1 |V | 0 0 | opc |0 |      imm9     | 0 1 |  Rn  |  Rt   |
>>> + * |____|______|__|_____|_____|__|_______________|_____|______|_______|
>>>   */
>>>  union instr {
>>>      uint32_t value;
>>> +    struct {
>>> +        unsigned int ign2:25;
>> Here, your numeration of ignore fields is in descending order (starting from lsb) but ..,
>>
>>> +        unsigned int op1:4;     /* instruction class */
>>> +        unsigned int ign1:2;
>>> +        unsigned int op0:1;     /* value = 1b */
>> Why op0 = 0b1 ? This structure represents the generic bit layout (the emulation deals with single ldr/str).
>> I would drop this comment.
> 
> It is a reserved bit which can never be 0.
Where did you take this information from?
As I wrote above, I don't think we should bind this union to a single use case we currently have.
The struct top_level should represent the generic encoding of A64 instruction.

~Michal

