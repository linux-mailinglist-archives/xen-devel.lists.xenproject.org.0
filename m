Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C08564E3E9C
	for <lists+xen-devel@lfdr.de>; Tue, 22 Mar 2022 13:39:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293434.498510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWdmi-0006xx-7b; Tue, 22 Mar 2022 12:38:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293434.498510; Tue, 22 Mar 2022 12:38:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWdmi-0006uq-3i; Tue, 22 Mar 2022 12:38:48 +0000
Received: by outflank-mailman (input) for mailman id 293434;
 Tue, 22 Mar 2022 12:38:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ed4I=UB=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nWdmf-0006uk-SC
 for xen-devel@lists.xenproject.org; Tue, 22 Mar 2022 12:38:46 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7eae::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01b9c8d7-a9dd-11ec-8fbc-03012f2f19d4;
 Tue, 22 Mar 2022 13:38:43 +0100 (CET)
Received: from SA9PR13CA0114.namprd13.prod.outlook.com (2603:10b6:806:24::29)
 by BL0PR02MB4946.namprd02.prod.outlook.com (2603:10b6:208:28::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.18; Tue, 22 Mar
 2022 12:38:39 +0000
Received: from SN1NAM02FT0048.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:24:cafe::58) by SA9PR13CA0114.outlook.office365.com
 (2603:10b6:806:24::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.8 via Frontend
 Transport; Tue, 22 Mar 2022 12:38:39 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 SN1NAM02FT0048.mail.protection.outlook.com (10.97.4.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5081.14 via Frontend Transport; Tue, 22 Mar 2022 12:38:38 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 22 Mar 2022 12:38:37 +0000
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 22 Mar 2022 12:38:37 +0000
Received: from [10.71.116.34] (port=59603)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nWdmW-0002VS-BG; Tue, 22 Mar 2022 12:38:36 +0000
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
X-Inumbo-ID: 01b9c8d7-a9dd-11ec-8fbc-03012f2f19d4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O+rZDg3MzcqjAdgiBRNuxS37K75U+erLa9thaRImzAbWmULenquW6rH/mIY4PnmEBqxAHWF//tzVP7iswm6E1RspPWvgHfmF03leRhuFZn84t8AZ0gRXLBKgbzbKLu/4/sddarK0ONc1vNocCWFh9vFhvHyQ5cJiBqKfCwe9WidV7Wl5ZJS74bMCebgXs4hZHT6qmsTTEH7WOt8mPgC0JfUYZBxrDe4gBcHJsrOIWmvvGP50+QSe0uMxob8Eq5hVYdS2Rl0fmjk23nIGawo2wx1NBFUQPL3ccl5gCEwxZQfv+Ytet2q1zvaG1dlQs6Dyu5B4WpeTB9mj8g7bYVugPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P8wG/Vl/qyGUk8DmqyojureUN+2ILdmPNHrKtT4MShc=;
 b=AxjDAJM9lt1twLsfiPgT5Gpocc/aaoG+OvRNKjpCncQ5xJZmLsYk9m9EPpZcDXDkqmrniHTNDoy92qIlzDLDfGoBiXl4fo2GoQzJ1lgb+N+6d6B9YQj4YtotwLBxIsJ+UbDDUUrU9+Ri050pFubc0lZ2+4c+l/gZV4fd0ufMO6hFjp0Yr/XdYDU+s0JoSK0/MFN8Rj6NAiAQLM2gJKnRJu0EcYv1yaLnlLNWWkTGbNjkpmkm6iuNKmeFBL66/cNbDetk4iVmp1eeUxhnKP6hjdRqUUU92RH5TpjT6NLaxBXrcofiMaQ00zr+pQ8N/z32Fay7g5D9SVmol7O+w96IzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=xen.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P8wG/Vl/qyGUk8DmqyojureUN+2ILdmPNHrKtT4MShc=;
 b=Z2a4Kp77/RnVIUTchphZcr4AUE83LDHmUqSXyqYF9otWoiHASmNO59KOyNabkvvyLxxaIzDwtLylDDt7BW5tahNMEbtyu6TiHfnHINF9Jnh49a1yoVV4LItO0t67YMjQ3mEI2/i0Og+klLApNb8RmY0aPNDhtSp6mlmYTzI7XxM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch01.xlnx.xilinx.com;
Message-ID: <9bcab961-8ae1-9e9a-c6da-682aecf2a138@xilinx.com>
Date: Tue, 22 Mar 2022 12:38:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v11 3/3] xen/arm64: io: Handle data abort due to cache
 maintenance instructions
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>, Julien Grall
	<julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <paul@xen.org>, <roger.pau@citrix.com>
References: <20220317140046.64563-1-ayankuma@xilinx.com>
 <20220317140046.64563-4-ayankuma@xilinx.com>
 <3d6a341d-712d-8701-caf2-49301ae1e01b@xen.org>
 <a6d6aa6f-7dcf-fbed-6400-bb5d028e045e@xilinx.com>
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
In-Reply-To: <a6d6aa6f-7dcf-fbed-6400-bb5d028e045e@xilinx.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d84c02da-a850-4129-6d8e-08da0c00e3e7
X-MS-TrafficTypeDiagnostic: BL0PR02MB4946:EE_
X-Microsoft-Antispam-PRVS:
	<BL0PR02MB494663D5ACBCC671A4805BBBB2179@BL0PR02MB4946.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M8YB5UGmfFUpcm2X5NTGeCJK3LiQCSEQlBZ8aJODW3bjjuoZ+9fUlgZUt4Y8JM33cYtQf9ZKL4EfWHi9VpKbUH2JZ87DJNZZvIroJtXpJ9k78GaQ7aQUtuIgrCNAowAZEwHkUSgOoGQwAFQuhyXIi9zv0zhOMteFZNX4Ym8uu+kt4pb33F3z7sBCO+GXb4lsUpla/P+6npuUGYu7r/LNW7wi+tyqeoHGPnzrMhbfoBlyVqdYPB7iLxUdqRGBu5MLehlXMmF0vVgVSXOXDSPn9Owh50AixMRFYrtBZUmVno/O2t2ASDM5QXCtYwo4LBZWjUoU8xRFjRRQGbB8DW08hnxK6u3R60JYv4fRtwXbvrYkT0rnb8cakxp4dWbMMQ/M94LpufOKRJcomEuTMZBU5y2A1NpEqQvlasz2AeldtaTlFPNVcLb4cZmDvO0QPWZGGCVlFkTh94xV7DWt+Xb4pe0Hz14ZhcRYj1CMk8Abn/QKx2cjqDfot2TTKh76lK6I3WCzyUOrYvWVt3lJ+Lkdcpx98SrSueEPg6f9xwzSz2DJGYi8ZyPPZIxBQGvng/5Ef69rNkVlUv8OKViGM1uKKN8NgYuYedVNy7XyJRVlgB1o8Uk7U5ZYzX9XhGiyHCIWrFJoW3k/yCbM9XqvpwvXIkY1TohjQVuEBOoKfUTktunFD+pF2P5VbtfCrnJRR3Ng6VNQcMQNGZGQyUYd9a9+XpeAr3BPN6I73+fotfnHC5Q=
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch01.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(26005)(2616005)(186003)(426003)(2906002)(8936002)(83380400001)(9786002)(40460700003)(31696002)(5660300002)(7416002)(82310400004)(47076005)(336012)(53546011)(508600001)(316002)(31686004)(36756003)(356005)(7636003)(54906003)(4326008)(110136005)(70206006)(36860700001)(8676002)(70586007)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 12:38:38.6662
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d84c02da-a850-4129-6d8e-08da0c00e3e7
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0048.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4946


On 22/03/2022 12:06, Ayan Kumar Halder wrote:
>
> On 18/03/2022 18:26, Julien Grall wrote:
>> Hi Ayan,
> Hi Julien,
>>
>> On 17/03/2022 14:00, Ayan Kumar Halder wrote:
>>> diff --git a/xen/arch/arm/include/asm/mmio.h 
>>> b/xen/arch/arm/include/asm/mmio.h
>>> index ca259a79c2..79e64d9af8 100644
>>> --- a/xen/arch/arm/include/asm/mmio.h
>>> +++ b/xen/arch/arm/include/asm/mmio.h
>>> @@ -35,6 +35,7 @@ enum instr_decode_state
>>>        * instruction.
>>>        */
>>>       INSTR_LDR_STR_POSTINDEXING,
>>> +    INSTR_CACHE,                    /* Cache Maintenance instr */
>>>   };
>>>     typedef struct
>>> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
>>> index 6f458ee7fd..26c716b4a5 100644
>>> --- a/xen/arch/arm/io.c
>>> +++ b/xen/arch/arm/io.c
>>> @@ -139,6 +139,17 @@ void try_decode_instruction(const struct 
>>> cpu_user_regs *regs,
>>>           return;
>>>       }
>>>   +    /*
>>> +     * When the data abort is caused due to cache maintenance, Xen 
>>> should check
>>> +     * if the address belongs to an emulated MMIO region or not. 
>>> The behavior
>>> +     * will differ accordingly.
>>> +     */
>>> +    if ( info->dabt.cache )
>>> +    {
>>> +        info->dabt_instr.state = INSTR_CACHE;
>>> +        return;
>>> +    }
>>> +
>>>       /*
>>>        * Armv8 processor does not provide a valid syndrome for 
>>> decoding some
>>>        * instructions. So in order to process these instructions, 
>>> Xen must
>>> @@ -177,6 +188,13 @@ enum io_state try_handle_mmio(struct 
>>> cpu_user_regs *regs,
>>>           return rc;
>>>       }
>>>   +    /*
>>> +     * When the data abort is caused due to cache maintenance and 
>>> the address
>>> +     * belongs to an emulated region, Xen should ignore this 
>>> instruction.
>>> +     */
>>> +    if ( info->dabt_instr.state == INSTR_CACHE )
>>
>> Reading the Arm Arm, the ISS should be invalid for cache 
>> instructions. So, I think the check at the beginning of 
>> try_handle_mmio() would prevent us to reach this check.
>>
>> Can you check that cache instructions on emulated region will 
>> effectively be ignored?
>
> Yes, you are correct.
>
> I tested with the following (dis)assembly snippet :-
>
> 0x3001000 is the base address of GIC Distributor base.
>
>     __asm__ __volatile__("ldr x1, =0x3001000");
>     40000ca8:   58000301    ldr x1, 40000d08 <main+0x70>
>     __asm __volatile__("DC CVAU, x1");
>     40000cac:   d50b7b21    dc  cvau, x1
>
> This resulting in hitting the assertion :-
>
> (XEN) Assertion 'unreachable' failed at arch/arm/io.c:178
>
> I dumped the registers as follows, to determine that the fault is 
> caused by the instruction at 40000cac.
>
> HSR=0x00000092000147  regs->pc = 0x40000cac info.gpa = 0x3001000
>
>
> So, my patch needs to be modified as follows:-
>
> @@ -172,7 +173,7 @@ enum io_state try_handle_mmio(struct cpu_user_regs 
> *regs,
>
>      ASSERT(info->dabt.ec == HSR_EC_DATA_ABORT_LOWER_EL);
>
> -    if ( !info->dabt.valid )
> +    if ( !(info->dabt.valid || (info->dabt_instr.state == 
> INSTR_CACHE)) )

Actually this is not needed.

The following change is sufficient :-

@@ -146,7 +146,9 @@ void try_decode_instruction(const struct 
cpu_user_regs *regs,
       */
      if ( info->dabt.cache )
      {
          info->dabt_instr.state = INSTR_CACHE;
+        info->dabt.valid = 1;
          return;
      }

"info->dabt.valid == 1" means the instruction is valid or decoded 
successfully (this holds true for INSTR_CACHE as well).


