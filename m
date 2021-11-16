Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D770F453759
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 17:25:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226439.391347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn1Ge-0003OY-1g; Tue, 16 Nov 2021 16:25:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226439.391347; Tue, 16 Nov 2021 16:25:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn1Gd-0003Mm-Ul; Tue, 16 Nov 2021 16:25:07 +0000
Received: by outflank-mailman (input) for mailman id 226439;
 Tue, 16 Nov 2021 16:25:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TA58=QD=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1mn1Gc-0003Mg-SW
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 16:25:06 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20616.outbound.protection.outlook.com
 [2a01:111:f400:7eab::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0f40664-46f9-11ec-9787-a32c541c8605;
 Tue, 16 Nov 2021 17:25:05 +0100 (CET)
Received: from SN2PR01CA0001.prod.exchangelabs.com (2603:10b6:804:2::11) by
 SN6PR02MB4560.namprd02.prod.outlook.com (2603:10b6:805:b0::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.26; Tue, 16 Nov 2021 16:25:01 +0000
Received: from SN1NAM02FT0037.eop-nam02.prod.protection.outlook.com
 (2603:10b6:804:2:cafe::55) by SN2PR01CA0001.outlook.office365.com
 (2603:10b6:804:2::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Tue, 16 Nov 2021 16:25:01 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 SN1NAM02FT0037.mail.protection.outlook.com (10.97.4.243) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.19 via Frontend Transport; Tue, 16 Nov 2021 16:25:01 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 16 Nov 2021 16:24:59 +0000
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 16 Nov 2021 16:24:59 +0000
Received: from [10.71.118.222] (port=14959)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1mn1GU-0001Yl-Uh; Tue, 16 Nov 2021 16:24:59 +0000
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
X-Inumbo-ID: c0f40664-46f9-11ec-9787-a32c541c8605
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oQft9rkaip23hTwR8zPyk0S8SGzLM7DOTabsgmFu/nrL8IsOowz62JSE4+iad3i5vByAW1kk9vbSBZcwowtCy/qj+XL7/MJ8/NtUvrq/wZsCmU9NVrhJtY+UDTCBIAWdNyw256n8NobQU6/C9ytqSE5EUwhUrny3M+6Dwi2oQv606X21ftltkTpQUSWcJYQp669UDCcz4JTdVp1BokXbd6NCLg2RHzVh9nygjlQCtUaB3p6YOxnROXsyIq5Hu0wvhPCruM3IHA9g8LXX05NixUeM3dH1HABpfMJm779PwSUvX08hLCrM3T9njseTZJTa4SC5nKcA3E+67h95VxqNmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jfvvNpiAyBPJ3kM7RPfPC41lPRykZLvt3wo9b24Cc7s=;
 b=ZEQ+KhL0eGxQaLAmsmfGXQ7Rf2B5A4lBRJ6S5ga3eROQDufC2mZ5Kzl8VMpJ6s/ogQMipq3qx7f+kbOUPHNTFlbClq5AuU4EDqG5rw9/YpoDZfuk1q9DuzqdbuU/qTplkuqpB09ZpLiFz/83oaWCRpYuIn/wSDNNoFNNANx5vBC9j/ppldlxbn4c0HuG5hzYWJPFsyVbQEBI/zWKXJFu3dp5/ajPjwo30XnKA6/zU3ZkVu5eAVHX5880Jehe7bXCqFvhfrXSMtcgCUt4kXMo6b/hT6ehVJxNOWBOZ7aU+8OZWQV7AosmyIIgsfziu6q0PuITzfaQqvOEaws3MrwtOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=arm.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jfvvNpiAyBPJ3kM7RPfPC41lPRykZLvt3wo9b24Cc7s=;
 b=j2b9NNo4byn4ExPUnzLsUjihEbXJY2ZXdR/qAFk2tofoaBKDmR2/810Ln1WxNv/oqLRO3RyG3gHoXA1+fLNtS6IYzebrZMb2EpCSIFbfQe0PX4G2XPgzShmCvzWbychjE5yafpJ8sAVu2G+yJLwErsE+NhTS+yGJFiNSFu8fskk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch01.xlnx.xilinx.com;
Message-ID: <f91fd718-040e-88a3-ca96-30d1efe9a689@xilinx.com>
Date: Tue, 16 Nov 2021 16:24:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: Xen/ARM - Query about a data abort seen while reading GICD
 registers
To: Bertrand Marquis <Bertrand.Marquis@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@xilinx.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1489a1b9-aefa-0ddf-8dba-4a566388cc6f@xilinx.com>
 <CED537AF-44AA-41B8-9458-17A5C43FBECC@arm.com>
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
In-Reply-To: <CED537AF-44AA-41B8-9458-17A5C43FBECC@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3fc01640-c5fc-4a7d-d396-08d9a91da3d9
X-MS-TrafficTypeDiagnostic: SN6PR02MB4560:
X-Microsoft-Antispam-PRVS:
	<SN6PR02MB456005C7B7F9735BB7D6FA26B2999@SN6PR02MB4560.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QZldE0RwkNStmSUMxmkXslxJXoeqyx2gPzwqpdmrov8U+4dqa7qIf8fOqSxWXnUpP8V38XMAX0Syy9lP3UGStEm0X9PH14ilLe/6buQfunZ11FBdss7QB9Kf1xOY4liP0EGvy1uuVJAPvPexFqRWqz1lbxu3bZgvKs+Yigc/oONl8zmkXVXbINaadMgVzUkW4ytPMi9jrMKVCdNK2fQO0VQmNjQZEgLvNdadRmbdlsUJvBGzB/LGsJSA27Z0sXGhgAzJgfnbNrfUOQjq0Ri02J2cVNRGDyD9OICACV/54Q6LUDXiHj+G56iIT6uZjtSXCzTWYGiCV9d0x45R/lxhgtQPNdsI2bFygqk+MvRZgxrNyGs/lfFu74jJoSZZAKGqHczV8FZvu4HaqqMxn/irLXrB0QbJEAJklH7RL1j6vaBFgmRrdeuzPLfIH0lNJX1+lRETUr53Bis9PiUv/J/uy5kJ+gh9H75gu3kJAieg1jwAJdcWOhfEyGDagB5yjoRueEdAEUCDDnj0Gw+ASg328JFNMwDSRXu6TCG3oN2UuHXSexxkzcaIDyrKY0Dz+OtgC6hae5kSO9k9+jJ8QJKy0RCWnW05xqK8z4bUSiaNTk62QeAqLBYgOXwdcdrmAPlsdVjDFFInjnK1dwqjh2DuyBMuubJsuyy4s8noV6xQTPxfnfJjTWXKv3MDOK6V1Uk9da6vqFsigCwiVl5oFBemU0jA6i0ezRiSsVqF+cOCY/OUPK9t/3yB7iazcMWLCwy0DhsCvUXpn6N6CKcUwMROJA==
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch01.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(36840700001)(46966006)(31696002)(36860700001)(336012)(53546011)(36756003)(2906002)(186003)(8676002)(426003)(9786002)(4326008)(5660300002)(47076005)(8936002)(26005)(2616005)(70586007)(508600001)(110136005)(31686004)(70206006)(7636003)(356005)(36906005)(82310400003)(316002)(83380400001)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 16:25:01.4964
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fc01640-c5fc-4a7d-d396-08d9a91da3d9
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0037.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4560

Hi Bertrand,

Thanks for looking into it.

On 16/11/2021 15:36, Bertrand Marquis wrote:
> Hi Ayan,
> 
>> On 16 Nov 2021, at 15:27, Ayan Kumar Halder <ayan.kumar.halder@xilinx.com> wrote:
>>
>> Hi Xen/Arm experts,
>>
>> I am facing a very strange issue while running a baremetal application as a DomU guest on arm64 platform.
>>
>> The baremetal app tries to read the GICD register with post indexing as follows :-
>> ldr x1, =0x3001000
>> ldr w2, [x1], #4 <<<------ PC = 0x40000ca8
> 
> Increment on on load is not supported by the emulation layer.

That is surprising. The reason being if I try to read the GICC register 
(0x3002000) with post indexing then it works fine.

Can you point me in source where this limitation is set ?
> 
> Could you try with:
> add x1, x1, #4
> ldr w2, [x1]

This worked fine.

-Ayan
> 
> Regards
> Bertrand
> 
>>
>> And then I get :-
>> HSR=0x92000005 pc=0x00000040000ca8 gva=0x3001000 gpa=0x00000003001000
>>
>> This problem occurs only while reading the GICD registers with post indexing. If I read the register with pre-indexing, then I do not see any abort. Alternatively, if I read GICC register with post indexing, I don't see the abort either.
>>
>>  From the HSR value, I interpret it as
>> EC = 100100b # Data abort from lower exception
>> IL = 1b # 32 bit instruction trapped
>> DFSC = 101 # Translation fault level 1
>>
>> On debugging, I found that the abort is triggered from
>>
>> try_handle_mmio()
>> { ...
>>     /* All the instructions used on emulated MMIO region should be valid */
>>     if ( !dabt.valid ) {
>>
>>         return IO_ABORT;
>>     }
>> ...
>> }
>>
>>  From the Arm V8 Arm specs, I understand that dabt.valid is ISV, bit[24] in "ISS encoding for an exception from a Data Abort".
>>
>>
>> I saw that the caller is
>>
>> do_trap_guest_sync() "case HSR_EC_DATA_ABORT_LOWER_EL"
>> where dabt.valid is false.
>> In the success scenario, dabt.valid is true.
>>
>> I could not find the caller for do_trap_guest_sync()
>>
>> So, can anyone help me here
>> 1. Who is the caller for do_trap_guest_sync() ?
>> 2. Any idea on what the issue is and how I can debug it further ?
>>
>> Kind regards,
>> Ayan
>>
> 

