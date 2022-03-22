Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDA94E3E1C
	for <lists+xen-devel@lfdr.de>; Tue, 22 Mar 2022 13:07:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293418.498476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWdI2-0002rO-AM; Tue, 22 Mar 2022 12:07:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293418.498476; Tue, 22 Mar 2022 12:07:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWdI2-0002pZ-70; Tue, 22 Mar 2022 12:07:06 +0000
Received: by outflank-mailman (input) for mailman id 293418;
 Tue, 22 Mar 2022 12:07:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ed4I=UB=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nWdI1-0002pT-Ct
 for xen-devel@lists.xenproject.org; Tue, 22 Mar 2022 12:07:05 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on20618.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95574477-a9d8-11ec-a405-831a346695d4;
 Tue, 22 Mar 2022 13:07:03 +0100 (CET)
Received: from BN8PR04CA0003.namprd04.prod.outlook.com (2603:10b6:408:70::16)
 by DM6PR02MB5180.namprd02.prod.outlook.com (2603:10b6:5:4e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.19; Tue, 22 Mar
 2022 12:07:00 +0000
Received: from BN1NAM02FT029.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:70:cafe::38) by BN8PR04CA0003.outlook.office365.com
 (2603:10b6:408:70::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.21 via Frontend
 Transport; Tue, 22 Mar 2022 12:07:00 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (149.199.80.198) by
 BN1NAM02FT029.mail.protection.outlook.com (10.13.2.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5081.14 via Frontend Transport; Tue, 22 Mar 2022 12:07:00 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 22 Mar 2022 12:06:59 +0000
Received: from smtp.xilinx.com (172.21.105.198) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 22 Mar 2022 12:06:59 +0000
Received: from [10.71.116.34] (port=58291)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nWdHu-0003Ck-Su; Tue, 22 Mar 2022 12:06:58 +0000
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
X-Inumbo-ID: 95574477-a9d8-11ec-a405-831a346695d4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N/obHxIqCpteJ7J9dkCIfGKj5fqHFLRTSDR3llYGSsi3Olf5g1adV3PS8OlBIJlyTB0i3tXH50rt9O4tuQ7s+tLHkIJeBDsFaJ3HE3mlw/n93w8Ap2FCNXQqg3nEbX+DAwXErsN6EIADD2QLJKBB43Z04MMjVmOv0tSRE10hNotG0n8/Csy2Rz794Gb8Xx5mSy3eK7N+pLaIYEomfbM9Ekdzc+zFAFMrD7C2Esl8biljPuvBVOzlhegwIKj46Rqciw+kyKkVX+5KFN1+PNDfudr95wzeQ/jYVHi72PtDFA7PuDSghq8SU9FsWn8JrpAtaHzkWx1oZYouVvXKZSHT4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9reWh0nBqe487DWaQDuoaXi6yMWC3UHF40vALmPnpRo=;
 b=K4EUBSAmn01VatkzLe+QPZnZMuHqsyo3SKh7cGb3DgZ2K4j+QSIXeXuL+kHDc5PATajEsXjnV+Y1BJ26debOmqEDuWM79YQ521ddggPurQkco8uFSmQBEX5bE4dbp9XUJ7WyPOTlmpB1+bPpMbkOArffvtvERX+HpP0R/sL3CTs1oeQIMQvtnqver0h4fXuJ7T1ugxQDEE+dvk4ZyMrbtiH52YrorrO1VnnkrCqIL6pZlNwBGrVdaEyvX02xafyBuq4BKiCIRQs28YkQCDKxREB5g8/j7Wjcx96FXlemLnn9jPCpc0qldvxzcJxJ23UYy57bWBL9DutcOBSDW+7Y8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=xen.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9reWh0nBqe487DWaQDuoaXi6yMWC3UHF40vALmPnpRo=;
 b=lG6r/t2NbGASXJAZk7cA7VFR59AtseErfVP82Or4Ec679cPJytOl8k8KPnlV4t5ST6xy97/Rzicir3VGjw8sT4fQpRM0YLgMiKfXQmYOAKAzzDpUCBrE1iKzsGC9AEjobD2Sypx8Ohu6fV5r9epkXtfabaIfm/em5x9MeIIYqfg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch02.xlnx.xilinx.com;
Message-ID: <a6d6aa6f-7dcf-fbed-6400-bb5d028e045e@xilinx.com>
Date: Tue, 22 Mar 2022 12:06:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v11 3/3] xen/arm64: io: Handle data abort due to cache
 maintenance instructions
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder
	<ayan.kumar.halder@xilinx.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <paul@xen.org>, <roger.pau@citrix.com>
References: <20220317140046.64563-1-ayankuma@xilinx.com>
 <20220317140046.64563-4-ayankuma@xilinx.com>
 <3d6a341d-712d-8701-caf2-49301ae1e01b@xen.org>
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
In-Reply-To: <3d6a341d-712d-8701-caf2-49301ae1e01b@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a78ccd6-71b6-4335-bcba-08da0bfc782b
X-MS-TrafficTypeDiagnostic: DM6PR02MB5180:EE_
X-Microsoft-Antispam-PRVS:
	<DM6PR02MB51801849C26A62589DDFAA1CB2179@DM6PR02MB5180.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	S3K3sqxp1lqnKgIE8zcKaqhYU/G4d9Ye6tu2/SVZHLGH0kGeldgFAK+HO7oyJsMDoDEkPwX+JdpmQjmlWSXGLk9kx8s1ZZZ6a9ECgXO4d6AhPMq/n7G4X4Nxn73Ke7Sh6O5rwdpCIWpGli2JtlvGCLHbRjRkP5AhE8FhU4FOPkIhuxC4hRT0OYp9rFkYij5pAg6nYlYmgFVCLKT6U/lbRVK9HbZVkApAvzpT4QxflUfXuDz3gnTzxYcTM9vOb8zVlWFtFe/OjwJsim10siE3XIizYTb3wdDH63G5wuFaKVYwwHpeDhe9/puuF4uF1ELi2kKX3BAM7qUungOQ/67LGbc5ZAc32SHAUvTM1ekwDNeiXC3ZKoBfpyg56I3vmcE//p4sxSbyAtVDRfHVs8PkPYMM3ShAuCx2Bnzp1+rfDgNYVLAoIcOoSQnfgalQ72YbER3/Tfb8m/40LwZsYLNIRsWshIEqX5gwn18p+lHMAx6V0bY1WxWA/vvfUwAwJIPds7vYjYn9Sa+/eYFhjmkgyAH34FQvCgQDyHlRcFrW8p0OZoGB3AdXnp60V6r0GBUipokfrmR7d7QQy4PZAPN1egj/DV4NEfukho0bHjKLntJ7o4ExqGn0G9KenDBQhfdIGp3PH3nIgwCv7Mye12Td5eylZzaEp4W3O+ePuwagZ+8m2+MJRlhhJahHJ85513RgEZRM47uYdYTPyR7YRPX90pL+eGZiBlFstsNz1F2THqw=
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch02.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(356005)(7636003)(5660300002)(70206006)(9786002)(8936002)(54906003)(2906002)(508600001)(31696002)(82310400004)(7416002)(53546011)(47076005)(70586007)(186003)(336012)(426003)(26005)(316002)(36756003)(83380400001)(40460700003)(110136005)(36860700001)(31686004)(4326008)(2616005)(8676002)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 12:07:00.0424
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a78ccd6-71b6-4335-bcba-08da0bfc782b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1NAM02FT029.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5180


On 18/03/2022 18:26, Julien Grall wrote:
> Hi Ayan,
Hi Julien,
>
> On 17/03/2022 14:00, Ayan Kumar Halder wrote:
>> diff --git a/xen/arch/arm/include/asm/mmio.h 
>> b/xen/arch/arm/include/asm/mmio.h
>> index ca259a79c2..79e64d9af8 100644
>> --- a/xen/arch/arm/include/asm/mmio.h
>> +++ b/xen/arch/arm/include/asm/mmio.h
>> @@ -35,6 +35,7 @@ enum instr_decode_state
>>        * instruction.
>>        */
>>       INSTR_LDR_STR_POSTINDEXING,
>> +    INSTR_CACHE,                    /* Cache Maintenance instr */
>>   };
>>     typedef struct
>> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
>> index 6f458ee7fd..26c716b4a5 100644
>> --- a/xen/arch/arm/io.c
>> +++ b/xen/arch/arm/io.c
>> @@ -139,6 +139,17 @@ void try_decode_instruction(const struct 
>> cpu_user_regs *regs,
>>           return;
>>       }
>>   +    /*
>> +     * When the data abort is caused due to cache maintenance, Xen 
>> should check
>> +     * if the address belongs to an emulated MMIO region or not. The 
>> behavior
>> +     * will differ accordingly.
>> +     */
>> +    if ( info->dabt.cache )
>> +    {
>> +        info->dabt_instr.state = INSTR_CACHE;
>> +        return;
>> +    }
>> +
>>       /*
>>        * Armv8 processor does not provide a valid syndrome for 
>> decoding some
>>        * instructions. So in order to process these instructions, Xen 
>> must
>> @@ -177,6 +188,13 @@ enum io_state try_handle_mmio(struct 
>> cpu_user_regs *regs,
>>           return rc;
>>       }
>>   +    /*
>> +     * When the data abort is caused due to cache maintenance and 
>> the address
>> +     * belongs to an emulated region, Xen should ignore this 
>> instruction.
>> +     */
>> +    if ( info->dabt_instr.state == INSTR_CACHE )
>
> Reading the Arm Arm, the ISS should be invalid for cache instructions. 
> So, I think the check at the beginning of try_handle_mmio() would 
> prevent us to reach this check.
>
> Can you check that cache instructions on emulated region will 
> effectively be ignored?

Yes, you are correct.

I tested with the following (dis)assembly snippet :-

0x3001000 is the base address of GIC Distributor base.

     __asm__ __volatile__("ldr x1, =0x3001000");
     40000ca8:   58000301    ldr x1, 40000d08 <main+0x70>
     __asm __volatile__("DC CVAU, x1");
     40000cac:   d50b7b21    dc  cvau, x1

This resulting in hitting the assertion :-

(XEN) Assertion 'unreachable' failed at arch/arm/io.c:178

I dumped the registers as follows, to determine that the fault is caused 
by the instruction at 40000cac.

HSR=0x00000092000147  regs->pc = 0x40000cac info.gpa = 0x3001000


So, my patch needs to be modified as follows:-

@@ -172,7 +173,7 @@ enum io_state try_handle_mmio(struct cpu_user_regs 
*regs,

      ASSERT(info->dabt.ec == HSR_EC_DATA_ABORT_LOWER_EL);

-    if ( !info->dabt.valid )
+    if ( !(info->dabt.valid || (info->dabt_instr.state == INSTR_CACHE)) )
      {
          ASSERT_UNREACHABLE();
          return IO_ABORT;

I will send a v12 patch with this change.

- Ayan

>
> Cheers,
>

