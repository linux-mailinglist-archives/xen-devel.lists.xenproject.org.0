Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6314D0131
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 15:28:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286106.485474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nREL0-0002dW-Ev; Mon, 07 Mar 2022 14:27:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286106.485474; Mon, 07 Mar 2022 14:27:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nREL0-0002aa-AO; Mon, 07 Mar 2022 14:27:50 +0000
Received: by outflank-mailman (input) for mailman id 286106;
 Mon, 07 Mar 2022 14:27:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bwGU=TS=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nREKz-0002aU-8l
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 14:27:49 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20609.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2576f89-9e22-11ec-8539-5f4723681683;
 Mon, 07 Mar 2022 15:27:46 +0100 (CET)
Received: from BN9PR03CA0251.namprd03.prod.outlook.com (2603:10b6:408:ff::16)
 by BL0PR02MB6482.namprd02.prod.outlook.com (2603:10b6:208:1ce::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Mon, 7 Mar
 2022 14:27:43 +0000
Received: from BN1NAM02FT036.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:ff:cafe::54) by BN9PR03CA0251.outlook.office365.com
 (2603:10b6:408:ff::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Mon, 7 Mar 2022 14:27:43 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 BN1NAM02FT036.mail.protection.outlook.com (10.13.2.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5038.14 via Frontend Transport; Mon, 7 Mar 2022 14:27:43 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 7 Mar 2022 14:27:41 +0000
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 7 Mar 2022 14:27:41 +0000
Received: from [10.71.117.199] (port=49369)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nREKq-00086H-QO; Mon, 07 Mar 2022 14:27:41 +0000
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
X-Inumbo-ID: c2576f89-9e22-11ec-8539-5f4723681683
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KysS6YMTdHV2xCDwd5c8HdRYUu2n3UvVpOBE+sV0zWIOwd/1KEiKn5BAjaJ1wvZfwwLYUt7Alu7TWt4Pb6O5qLXX7ScUxckQT/9nsSb7ih7gyWhpqrMRd1zhCZqNjQ3RVRJHmqJQz/Yo+zxV2bnCPwcV1sk0k2gjXiQIPu0UJD57OVPFbVEQQApLfDlGjRCz7+kr2Kv1tRj3pvTGAqqtyDV7VRdjEV271i6BWrss/LqW7FAKmgf/AP9USyAx0oMkJoBuTj3xGg63XLIeeuuOghQRPWknq32BFMABex+Bk6j+d4ZevPpT+yBz3d0uVmNlQ7Sl8/g2unMYHqxw/+WA0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GxiLODk+6owjnI69lut48gI8D4WNfPzmaL06TYvTt+s=;
 b=QICyoy3phf9uPvVkGcM9Kl7vUj4pBkOvLJjy17skay5iE8Yza29J1GUmv4tuNKRBH6OeGasioRxUQOgZxIAPms2uqaDL95M2iUP/HbOSkYLVlSsYNpGPCkd3yhSUZtRPRxN4nCEseHzRfY/kLwGAXHQMtmAWxuRY+iql755Qe6Wq636Bu5z2gXia4lhZymCJMGraRUr5GEf+HCDuE03iqMerZP2KIm7/jojlaEVc8ipuwkD3nX3NpwgcGsMAH72acRao9n892lmxgVkiVPzVgeTrBPlfVtViYAc2UoPXhR6VRSXsTBk8Uy6A8vM5gzP21LeHJ/J83uFFYHh0nvHVXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=xen.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GxiLODk+6owjnI69lut48gI8D4WNfPzmaL06TYvTt+s=;
 b=aQyu+Vm+bGXqjPJ3eHR9Tww1/5THhEXP47IcyDRakQxh7lhpes+DkmF52vEyKRsAGJP3cm7OgmiNigLcexWk1auTDdchssZZpBObhgkUl+gLLcVlRCjrXhR4U6c2BeaeyEy1kqeIddZtdlt0iIys/7FaR2jc9XuKbkTJSs9OMcg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch01.xlnx.xilinx.com;
Message-ID: <5d5b0fc1-6f47-dfc0-dca3-5d60483a6eae@xilinx.com>
Date: Mon, 7 Mar 2022 14:27:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.2
Subject: Re: [XEN v9 3/4] xen/arm64: io: Handle the abort due to access to
 stage1 translation table
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder
	<ayan.kumar.halder@xilinx.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <paul@xen.org>, <roger.pau@citrix.com>
References: <20220301124022.10168-1-ayankuma@xilinx.com>
 <20220301124022.10168-4-ayankuma@xilinx.com>
 <68acfbf0-f2c1-c52e-93a3-632f1286d90f@xen.org>
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
In-Reply-To: <68acfbf0-f2c1-c52e-93a3-632f1286d90f@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef52b3c6-7a87-4053-0629-08da0046a4b3
X-MS-TrafficTypeDiagnostic: BL0PR02MB6482:EE_
X-Microsoft-Antispam-PRVS:
	<BL0PR02MB64824B15DBE0038B947AF4DBB2089@BL0PR02MB6482.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sDmrUfVbTC95O8mAk25l18JRMqtssDN408KkgOLNfpZUb81Zy3M+ow6HdcwoNEKGo25b1osk2VetkP8/a98fGKYvo9CLid/cqY+y0Ay6mkwlPxFTV8tRDWVWHpAqDUrwiKyS8fojAtYY5bJmoupIt0bn4KzpKTI8Yzog1athVJ3vpBWr8WN/BjJ6st5RW67Me+A6iT19rSXXiFft1BXotidLE+hfCf8xZdbSGz5eSft1VPr/tuiNjVDuJ+yFhF5GhM0gcIu9VHHmex4B4JBOxbBIsEE2cEJZcaiETEJnBZTZS/oWvgkc5RdhMdcaOrFxurC0Raucp0UJRJsskmSElqZ35r1f8y8v1o2oWEbqnh9qvdkQeqtV19x0iLDK0RtYBxd7wddcHT4JmJOjd2LDyK1M6RHZSDtIcq0rlr5Io9TLQ/RLGguRgtxc7J+hF11xsvfIcjqjW4ZSkuo0ls4brBJvnnAOgHcULvIbae+1eqG7Am6umCsjLSt2m6kaFpvSk85AeMA5VJNFIZ8DBZcrF4K23P9Dn4JRNDDEaT/uB5sw1XYWs9uiiH9XCNhoUBu4ctfOWXVamMDZfHC1TDnC/skN8v/3IZU8nm7AS2YnrqToGVmp4dWZ1Nr4x8pd0fjjakyhtqWTaCq/0/iOeBL8ITEcYuIR8oP6KH/82xM5Ldr9A5ipsZeU09N07+InoHuUZWpxXmQPkga98F0eoxCcr39pJ/LVZvPmecoqzsINFKI=
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch01.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(70206006)(316002)(54906003)(8676002)(4326008)(82310400004)(31696002)(110136005)(9786002)(8936002)(356005)(7636003)(2906002)(5660300002)(2616005)(7416002)(336012)(426003)(70586007)(186003)(26005)(508600001)(53546011)(36860700001)(83380400001)(47076005)(36756003)(31686004)(50156003)(43740500002)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 14:27:43.5534
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef52b3c6-7a87-4053-0629-08da0046a4b3
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1NAM02FT036.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB6482

Hi Julien,

One clarification.

On 04/03/2022 10:39, Julien Grall wrote:
> Hi Ayan,
>
> On 01/03/2022 12:40, Ayan Kumar Halder wrote:
>> If the abort was caused due to access to stage1 translation table, Xen
>> will assume that the stage1 translation table is in the non MMIO region.
>> It will try to resolve the translation fault. If it succeeds, it will
>> return to the guest to retry the instruction. If not, then it means
>> that the table is in MMIO region which is not expected by Xen. Thus,
>> Xen will forward the abort to the guest.
>>
>> Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
>> ---
>>
>> Changelog :-
>>
>> v1..v8 - NA
>>
>> v9 - 1. Extracted this change from "[XEN v8 2/2] xen/arm64: io: Support
>> instructions (for which ISS is not..." into a separate patch of its own.
>> The reason being this is an existing bug in the codebase.
>>
>>   xen/arch/arm/io.c    | 11 +++++++++++
>>   xen/arch/arm/traps.c | 12 +++++++++++-
>>   2 files changed, 22 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
>> index bea69ffb08..ebcb8ed548 100644
>> --- a/xen/arch/arm/io.c
>> +++ b/xen/arch/arm/io.c
>> @@ -128,6 +128,17 @@ void try_decode_instruction(const struct 
>> cpu_user_regs *regs,
>>           return;
>>       }
>>   +    /*
>> +     * At this point, we know that the stage1 translation table is 
>> in the MMIO
>> +     * region. This is not expected by Xen and thus it forwards the 
>> abort to the
>
> We don't know that. We only know that there are no corresponding valid 
> mapping in the P2M. So the address may be part of an emulated MMIO 
> region or invalid.
>
> For both cases, we will want to send an abort.
>
> Furthermore, I would say "emulated MMIO region" rather than MMIO 
> region because the P2M can also contain MMIO mapping (we usually call 
> then "direct MMIO").

Can I say MMIO region (to indicate both emulated and direct) ? The 
reason being the assumption that stage1 page tables cannot be in the 
MMIO region. And thus, when check_p2m() is invoked, we do not invoke 
try_map_mmio(gaddr_to_gfn(gpa).

See this snippet :-

             if ( xabt.s1ptw )
                 check_mmio_region = false;

             if ( check_p2m((is_data && check_mmio_region), gpa) )
                 return;

- Ayan

>
> Cheers,
>

