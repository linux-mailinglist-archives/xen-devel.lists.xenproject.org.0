Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE8C49B268
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 11:57:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260056.449058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJVZ-0004uk-Ng; Tue, 25 Jan 2022 10:57:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260056.449058; Tue, 25 Jan 2022 10:57:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJVZ-0004s9-KA; Tue, 25 Jan 2022 10:57:05 +0000
Received: by outflank-mailman (input) for mailman id 260056;
 Tue, 25 Jan 2022 10:57:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B39K=SJ=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nCJVX-0004s3-RN
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 10:57:04 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7eab::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 856ef957-7dcd-11ec-bc18-3156f6d857e4;
 Tue, 25 Jan 2022 11:57:00 +0100 (CET)
Received: from DM5PR07CA0050.namprd07.prod.outlook.com (2603:10b6:4:ad::15) by
 PH0PR02MB8520.namprd02.prod.outlook.com (2603:10b6:510:10d::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4909.10; Tue, 25 Jan 2022 10:56:57 +0000
Received: from DM3NAM02FT027.eop-nam02.prod.protection.outlook.com
 (2603:10b6:4:ad:cafe::8a) by DM5PR07CA0050.outlook.office365.com
 (2603:10b6:4:ad::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10 via Frontend
 Transport; Tue, 25 Jan 2022 10:56:56 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (149.199.80.198) by
 DM3NAM02FT027.mail.protection.outlook.com (10.13.5.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4909.8 via Frontend Transport; Tue, 25 Jan 2022 10:56:56 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 25 Jan 2022 10:56:55 +0000
Received: from smtp.xilinx.com (172.21.105.198) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 25 Jan 2022 10:56:55 +0000
Received: from [10.71.118.123] (port=51814)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nCJVN-00054N-Vs; Tue, 25 Jan 2022 10:56:54 +0000
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
X-Inumbo-ID: 856ef957-7dcd-11ec-bc18-3156f6d857e4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RbTincjohojwxS6r+PX5GBvrNQKmnesizKbK9jY8q7jDWHUNl6MgANcoy0YK0odKGi6gWAP3PQVGaQ2ze2avjuFBEN66QCVPCsdBJ/hEmjKUF2zF44UvrWTYsEFfkRUsGT/mWvJ61hiyiYVJrOWLGnswHx3RpTUVIglN5QXVasbw1rX5WrUB9C61pqXGr0JOp3qmUTnv9bwFh5MGzRdCcullSPTgDIW4mp2S3LrZdxvxuNpXjGwEKoB9A4d5vTCzR2A7YnmS4eHnP0E3tJTIhu8RmbbNQUsTous5qhi0FWLmVDHfitWfBwP5j/KD8wvy0Y4vgilLndBhr4MPgKre6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=icF+imYJpg5Gvlb+9QtQvCSbOGEJRz5Z67Vwa0rdAwg=;
 b=P0c1koHZfHGNH8tg7t/g7LKRRZS9B9eMy4KiTMET3PU0KC2j1m7Bf035JtqM68rh66N2L9yGRMKA+NAdw7SPCnY8j5r7kjuNETVtZvnpXGb6Cp9HfZiFkWKuAVHHIqPoRk8a/yqhPm08rpMpIhnRZTfKJiRm/3/0JWfZd7JFRZ/x/FimGsZ6v0rVEsua0BVfaqYyYU6M02jwuUyVUjKqQJdH0WB41qQdr5FLmW4QK9+VfmKZXDunmEvYmG0Hhe4BZ5Y8dit0BhmS4dC5c0NgWzJbR5d6EweMDo8Kv0Yti3iGuSpIzSYJRT3PwkZWxzOyQnV06DD25ywz4GYdpIZzsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=suse.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=icF+imYJpg5Gvlb+9QtQvCSbOGEJRz5Z67Vwa0rdAwg=;
 b=FQMPaesUdCVF8nprWVN/tN3XXKfxgMtTOLFoIDzOZ87jf44CfDpvJCMCCTZM0rzXGl4GLds+aX5qp4hSr1lTc767HtTqfFr8h/9bQU4XD3OFpsAAiLOeGXhiY99VRN8yZLadfxuaQBPVQKCVIYKXfQUMcY/sd1EUq6Qe3O78CrU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch02.xlnx.xilinx.com;
Message-ID: <dd186204-250a-bc40-29cc-242a613e340b@xilinx.com>
Date: Tue, 25 Jan 2022 10:56:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [XEN v3] xen/arm64: io: Decode ldr/str post-indexing instructions
To: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>
CC: Andre Przywara <andre.przywara@arm.com>, <xen-devel@lists.xenproject.org>,
	<stefanos@xilinx.com>, <julien@xen.org>, <Volodymyr_Babchuk@epam.com>,
	<bertrand.marquis@arm.com>, <wei.chen@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@xilinx.com>
References: <20220120215527.28138-1-ayankuma@xilinx.com>
 <20220122013046.6a786d3f@slackpad.fritz.box>
 <18e715ae-111d-58e6-55f9-a48a521e99b3@xilinx.com>
 <20220124143601.3e2ac6ac@donnerap.cambridge.arm.com>
 <bae9a35f-be42-2ebe-5ce0-30e08001ae97@xilinx.com>
 <alpine.DEB.2.22.394.2201240941310.27308@ubuntu-linux-20-04-desktop>
 <e6c217ba-2723-45ca-bb60-1c181359d261@suse.com>
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
In-Reply-To: <e6c217ba-2723-45ca-bb60-1c181359d261@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3ffac53-4e46-4d40-f887-08d9dff16794
X-MS-TrafficTypeDiagnostic: PH0PR02MB8520:EE_
X-Microsoft-Antispam-PRVS:
	<PH0PR02MB8520F0CB7337ED9AA53D333AB25F9@PH0PR02MB8520.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WVFFEZ2y3iFIcQk8Dn/cOQNVfw/FM94pvBtaFsidh9cYyouSoncBJcgycwAnORrRJIWWJxHvLfmyFbWU/cMyhfo55Bh7JE4SztW/082INoj6qkusQem7xp4CsrTMbwxaKhahCh88ClI02LOineyNcI3dJyqBrKEyX5QALie7Fbut3JrWvWOK6hdsKvj4yqw7t2uVKQS+14EtZnRnxP6VQz5PMlM6RHKwaEI5PZyF1BG1eyVSANs99qlpKE/yx7bqPr/krICujGPfNLOBvty302Z9IpPNU4cAJ6yrZdFuU61hxs5C0VP6bivBeNvyeZLJh+pZr3c+DXCy9n9TdQYDOMw4zFspsOH7gPBPeCRzKt7CjPhxMbBlM0sSfXN4PR7u30jNrtL8nweiLQywxcMf+D0Z9tLPH3Ykpe6UU0+BPdoT74nWzE0hp+TDDaDKEbjlugvektB2ZCyq0lEJhoTW47wf5Ar4ZgrJaytb1bcTpQJ7YejgKImrjif9GggZXDDB1aIjLN9UHN/T5n/cTezgRkKqCo20LWOBlKMvs7vMyAz5p0g+ke/YZWuQ6LgrRW5pkeZKYSv+cuOHI2wZLW3EMsnTpnAjWWjjkW8NDjZCrZblV7gWcw076rhzd1m7aXVHUYpj6SHMCARVN8Zb4SrXooXWlmkqP/Mgh1GubLKFtLcxkRlWBc18rZMkPgQ0+nBDnzlzHPI/+pryfvJdbgaoMqXxGbPm/9hHEBAF4eV5EZ1dt+QaPbuUqFocr+wLCr2uBIt6mC3O39yqPmHwzuz2+RwH514yuZVzpMrVs/nS8X7mIYextLBnbAPoz95LmbeEZL8EX37O05jaWduCscPAgQ==
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch02.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700004)(107886003)(26005)(9786002)(316002)(8936002)(356005)(426003)(53546011)(36756003)(47076005)(2616005)(82310400004)(40460700003)(36860700001)(31696002)(336012)(70206006)(2906002)(508600001)(110136005)(54906003)(83380400001)(5660300002)(4326008)(186003)(7636003)(70586007)(31686004)(8676002)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 10:56:56.5377
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3ffac53-4e46-4d40-f887-08d9dff16794
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3NAM02FT027.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB8520

Hi Jan/All,

On 25/01/2022 08:55, Jan Beulich wrote:
> On 24.01.2022 19:41, Stefano Stabellini wrote:
>> On Mon, 24 Jan 2022, Ayan Kumar Halder wrote:
>>> As for the patch, I will mention this issue (as a comment in the code) where
>>> we are loading the instruction from PC. Stefano/Julien/Bertrand/Volodymyr:-
>>> Does it look fine with you ?
>> As this issue could happen on any architecture (the guest could change
>> the instruction from another vcpu while the other is trapping in Xen)
>> and given that we do quite a bit of emulation on x86 I asked Jan on IRC
>> how do we handle this kind of things on x86 today. He had a good answer:
>> "By not making any assumptions on what we're going to find."
>>
>> In other words, don't assume you are going to find a store or a load
>> instruction at the memory location pointed by the PC. You could find
>> total garbage (because it was changed in between). Make sure to check
>> everything is as expected before taking any actions.
>>
>> And I think you are already doing that in decode_loadstore_postindexing.
>>
>> These are the fields:
>>
>> + * 31 30 29  27 26 25  23   21 20              11   9         4       0
>> + * ___________________________________________________________________
>> + * |size|1 1 1 |V |0 0 |opc |0 |      imm9     |0 1 |  Rn     |  Rt   |
>> + * |____|______|__|____|____|__|_______________|____|_________|_______|
>> + */
>> +union ldr_str_instr_class {
>> +    uint32_t value;
>> +    struct ldr_str {
>> +        unsigned int rt:5;     /* Rt register */
>> +        unsigned int rn:5;     /* Rn register */
>> +        unsigned int fixed1:2; /* value == 01b */
>> +        signed int imm9:9;            /* imm9 */
>> +        unsigned int fixed2:1; /* value == 0b */
>> +        unsigned int opc:2;    /* opc */
>> +        unsigned int fixed3:2; /* value == 00b */
>> +        unsigned int v:1;      /* vector */
>> +        unsigned int fixed4:3; /* value == 111b */
>> +        unsigned int size:2;   /* size */
>> +    } code;
>> +};
>>
>>
>> This patch already checks for:
>> - the fixed values
>> - v
>> - opc
>> - some special rt and rn values
>>
>> Considering that:
>> - size is fine either way
>> - as rt and rn are 5 bits wide, all values are acceptable (x0->x31)
>>
>> It doesn't look like we are missing anything, unless imm9 is restricted
>> to some ranges only.
> Beyond decoding there's at least one further assumption one may
> mistakenly make: The address may not be suitably aligned and it may
> not reference MMIO (or, should that matter, not the specific region
> of MMIO that other trap-provided info my hint at).

As I see, Xen will read/write to the MMIO address provided either by 
gva_to_ipa_pa() or HPFAR_EL2.

However, (you are correct), that the address pointed by Rn might not 
point to the same address (assuming that the instruction was changed 
after being loaded in I cache). In any case, Xen will simply increment 
(or decrement) Rn. The guest will find this new value of Rn (and that 
should be fine it was the guest who had changed the instruction).

In any case, I don't see Xen doing something erroneous.

I will send out a v4 patch addressing the issues pointed by Stefano and 
Andre (commit message).

- Ayan

>
> Jan
>

