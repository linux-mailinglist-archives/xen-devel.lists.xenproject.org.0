Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BB04CD9AA
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 18:05:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284374.483598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQBLy-0006iW-Mg; Fri, 04 Mar 2022 17:04:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284374.483598; Fri, 04 Mar 2022 17:04:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQBLy-0006gZ-Jg; Fri, 04 Mar 2022 17:04:30 +0000
Received: by outflank-mailman (input) for mailman id 284374;
 Fri, 04 Mar 2022 17:04:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zc/n=TP=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nQBLx-0006gT-3n
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 17:04:29 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on20621.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 256253cb-9bdd-11ec-8539-5f4723681683;
 Fri, 04 Mar 2022 18:04:27 +0100 (CET)
Received: from DM3PR14CA0147.namprd14.prod.outlook.com (2603:10b6:0:53::31) by
 MWHPR02MB2655.namprd02.prod.outlook.com (2603:10b6:300:46::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.17; Fri, 4 Mar 2022 17:04:23 +0000
Received: from DM3NAM02FT059.eop-nam02.prod.protection.outlook.com
 (2603:10b6:0:53:cafe::a7) by DM3PR14CA0147.outlook.office365.com
 (2603:10b6:0:53::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Fri, 4 Mar 2022 17:04:23 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 DM3NAM02FT059.mail.protection.outlook.com (10.13.4.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5038.14 via Frontend Transport; Fri, 4 Mar 2022 17:04:22 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 4 Mar 2022 17:04:21 +0000
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 4 Mar 2022 17:04:21 +0000
Received: from [10.71.116.156] (port=11293)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nQBLp-0001F8-9z; Fri, 04 Mar 2022 17:04:21 +0000
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
X-Inumbo-ID: 256253cb-9bdd-11ec-8539-5f4723681683
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KQDguG16rHoyNN01irundm4pIC22QwPeBgFNOuYtNwoHFHUpyi0fFuUTJA8Lo0Q3yhOcDbEmvmvaaNe56//sbYLfkR3LhnXhNPP/7b1Go6/93dMqgaJqPr6zDBUByj+R0wrvsbSry49WYqG8WUGq6MQyg2xORcUl4mQHOCrkobLp80NbwUXnabVesukZTtMn09ZIwMC1mzZG646hwUFlmof+6KwImlu0dhaCYlbfRkcr7HtvCQTPnqilL13GYm2iXkH6OburxsCFD2QRXQ7tzDGOU2F8Zzug8bLRIBGVNF3LSluBh0akmaxKBXixpwJuD1HMMr3V8NU2P9JJFH4y1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XHIuiIIuEuaYu3UAiE+oJwCm2HBVhopphocB+NXpdtM=;
 b=DSyEQk7FeTNouXglB8GAIVkXyGvvxNBvI9QICmvFG1nowh6ceYiuhGS+QFE5LVCwacXI4isq7J5h/VxWUiDoPz45tICxJUndVcckWZBpTrl04Ag/hZ92E0owKcfb6sST+n4f4TE2z+oeG/VeqmXO1NeP4PUPwD+Hm7qUNfkiX4ObYpiPcCWmT5u3APYOuzxuJeI8hHm3YVAgqHxnDbfmUIESRrrz88MXfL5Bp1cmxtA/Ry/44nJeN2DDQB+Px9b2/ihtTit/vLYtpNnca/8F2hZnAGd+3smWIQ9UySu0rJEdDu20W30pYzwOoGFxTCKQzMKZmhXUOmx4jU82FogCHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XHIuiIIuEuaYu3UAiE+oJwCm2HBVhopphocB+NXpdtM=;
 b=IBm+O4osqByhF7VOmr1Zk3nsN23KbYujtphGJDmMvVpXmgBQ+n2sw55o4QxGkGaQ50fP3lI+DT/KJwJTa1jf6OOBj8Y5CQA8WzgRTXDS/6tedUNnzmtYJUwGHFDUEwOod82uQA2VTtOeHXbJqojSve7/4rKiiuIq2/1jCg7l92w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch01.xlnx.xilinx.com;
Message-ID: <4ad9d776-88b7-30ea-01a7-3f6bfc1a6bde@xilinx.com>
Date: Fri, 4 Mar 2022 17:04:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [XEN v9 3/4] xen/arm64: io: Handle the abort due to access to
 stage1 translation table
To: Stefano Stabellini <sstabellini@kernel.org>, Ayan Kumar Halder
	<ayan.kumar.halder@xilinx.com>
CC: <xen-devel@lists.xenproject.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <paul@xen.org>, <roger.pau@citrix.com>
References: <20220301124022.10168-1-ayankuma@xilinx.com>
 <20220301124022.10168-4-ayankuma@xilinx.com>
 <alpine.DEB.2.22.394.2203031736140.3261@ubuntu-linux-20-04-desktop>
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
In-Reply-To: <alpine.DEB.2.22.394.2203031736140.3261@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23150a7b-7534-428b-36fb-08d9fe0107d2
X-MS-TrafficTypeDiagnostic: MWHPR02MB2655:EE_
X-Microsoft-Antispam-PRVS:
	<MWHPR02MB26555B40E710B2085D92A4A8B2059@MWHPR02MB2655.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KSqMx3ZAhxdBSc2pS6nr+uIFKS6/WWxt6rFUHXHk8MeTG5SSU1CoMQ9LFIw6lfce20k2KMKEx4Wg3XLIrU2z7dG1ZZk6ECo+qnHlqyy5h8YIQYgMUfkMZvY/OdDtyThOpRjvWXuv6tK/L1BIBtNG/d6s2je5e+zf93Ag1hAD7P1+OyQask8Kdf9NJTE7NcRs0GSMAD96C55AT/dzhQ8QOH13HOlFGInG0TCGrCciAJnVBrUFEzIYRACYtTiQI9oBD4gmBi7pca50SdRrAi80CJCzHPWEXr4wEjOIzSenHGqytAm8Rg4+xGvYqRlxwky7abf1FdVdMif+wFl4/RtIglck9CFOz3pzSzl8CUxUdlcudfwSqmtvy2mnlZfVuXHuZkLN4/29xaepX7nT/dsNwLsnW0o29Ic6MVQS9ww0RoVklO2i2hjM/or5461ks2wfRt3+f1pmTi5JKFDaLTeP0yOa2Il63LkGzlv1y1a56YM1F8N91SWlEtXTaynIAl2Cad8/20iMQUWY68QI69dNbSOTKYiEXdiuTJX7heM0Ge0LfgHfaTkPJIeuPmSjU2o7t0WFPIR/Hjs64tIKpuNYmyHn0SHO4j1LOV4L6Xx2WSp0NxOMkC4+gTqboX7mZ0VtlJ9UmEZcCpnSzSRvqLKwCSXLq7bapxzSvh/eyTwytMVJyZ7drbPIIcQ2JbD75jCK2niH7jG427VVKqtz9ddXvBu1dci0mX0hvb4Dm2/m7ci6kwncHCy5uIA+SMadmO1hqmnmO2VlnXPNpdwz84kEwA==
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch01.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(70586007)(70206006)(2906002)(8676002)(36860700001)(54906003)(83380400001)(4326008)(31696002)(5660300002)(47076005)(82310400004)(316002)(110136005)(36756003)(9786002)(7416002)(508600001)(8936002)(53546011)(40460700003)(31686004)(2616005)(426003)(336012)(186003)(26005)(356005)(7636003)(50156003)(43740500002)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 17:04:22.7088
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23150a7b-7534-428b-36fb-08d9fe0107d2
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3NAM02FT059.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2655

Hi Stefano,

On 04/03/2022 01:43, Stefano Stabellini wrote:
> On Tue, 1 Mar 2022, Ayan Kumar Halder wrote:
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
>>   xen/arch/arm/io.c    | 11 +++++++++++
>>   xen/arch/arm/traps.c | 12 +++++++++++-
>>   2 files changed, 22 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
>> index bea69ffb08..ebcb8ed548 100644
>> --- a/xen/arch/arm/io.c
>> +++ b/xen/arch/arm/io.c
>> @@ -128,6 +128,17 @@ void try_decode_instruction(const struct cpu_user_regs *regs,
>>           return;
>>       }
>>   
>> +    /*
>> +     * At this point, we know that the stage1 translation table is in the MMIO
>> +     * region. This is not expected by Xen and thus it forwards the abort to the
>> +     * guest.
>> +     */
>> +    if ( info->dabt.s1ptw )
>> +    {
>> +        info->dabt_instr.state = INSTR_ERROR;
>> +        return;
>> +    }
>> +
>>       /*
>>        * Armv8 processor does not provide a valid syndrome for decoding some
>>        * instructions. So in order to process these instructions, Xen must
>> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
>> index 120c971b0f..e491ca15d7 100644
>> --- a/xen/arch/arm/traps.c
>> +++ b/xen/arch/arm/traps.c
>> @@ -1923,6 +1923,7 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
>>       bool is_data = (hsr.ec == HSR_EC_DATA_ABORT_LOWER_EL);
>>       mmio_info_t info;
>>       enum io_state state;
>> +    bool check_mmio_region = true;
>>   
>>       /*
>>        * If this bit has been set, it means that this stage-2 abort is caused
>> @@ -1987,7 +1988,16 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
>>            */
>>           if ( !is_data || !info.dabt.valid )
>>           {
>> -            if ( check_p2m(is_data, gpa) )
>> +            /*
>> +             * If the translation fault was caused due to access to stage 1
>> +             * translation table, then we try to set the translation table entry
>> +             * for page1 translation table (assuming that it is in the non mmio
>                        ^ stage1
>
> Do you mean to say maybe:
Yes, it should be stage1. Sorry for typo.
>
> If the translation fault was caused by an access to stage 1 translation
> table, then no need to change the stage 2 p2m.
>
> ?

The translation fault was caused due to access to stage1 translation 
table. As per my understanding, the address of stage1 tables is in 
stage2 translation table entries. Thus, Xen needs to modify the 
corresponding stage2 p2m entries.

- Ayan

>
>
>
>> +             * region).
>> +             */
>> +            if ( xabt.s1ptw )
>> +                check_mmio_region = false;
>> +
>> +            if ( check_p2m((is_data && check_mmio_region), gpa) )
>>                   return;
>>   
>>               /*
>> -- 
>> 2.17.1
>>

