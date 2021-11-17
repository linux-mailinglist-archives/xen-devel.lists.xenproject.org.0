Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DD8454ADA
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 17:22:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226932.392328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnNgh-0006h4-Rv; Wed, 17 Nov 2021 16:21:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226932.392328; Wed, 17 Nov 2021 16:21:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnNgh-0006f5-OX; Wed, 17 Nov 2021 16:21:31 +0000
Received: by outflank-mailman (input) for mailman id 226932;
 Wed, 17 Nov 2021 16:21:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hiVf=QE=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1mnNgg-0006ez-71
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 16:21:30 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20617.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 699c5811-47c2-11ec-a9d2-d9f7a1cc8784;
 Wed, 17 Nov 2021 17:21:27 +0100 (CET)
Received: from SA9PR11CA0026.namprd11.prod.outlook.com (2603:10b6:806:6e::31)
 by SJ0PR02MB8531.namprd02.prod.outlook.com (2603:10b6:a03:3fc::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.20; Wed, 17 Nov
 2021 16:21:24 +0000
Received: from SN1NAM02FT0045.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:6e:cafe::35) by SA9PR11CA0026.outlook.office365.com
 (2603:10b6:806:6e::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26 via Frontend
 Transport; Wed, 17 Nov 2021 16:21:24 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 SN1NAM02FT0045.mail.protection.outlook.com (10.97.5.234) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.19 via Frontend Transport; Wed, 17 Nov 2021 16:21:23 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 17 Nov 2021 16:21:22 +0000
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 17 Nov 2021 16:21:22 +0000
Received: from [10.71.116.231] (port=51609)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1mnNgX-0000um-K7; Wed, 17 Nov 2021 16:21:21 +0000
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
X-Inumbo-ID: 699c5811-47c2-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hCSztjOibQiFE50cChKSZJNQBfdaQP4191E9D5GRE3VFyhEarEe9DrmnFG+sisqsuhpSpXJ4durWDPh7ntJC/T0oDe60vJSnjDf/dljG2bI4YOjXcms1TxbT/aVhiYxcWM+mcZwQsoeJxa3NX2vdBaC7fESTo5E5z5QwPWSE87m4I0mEYzoD4yoGPjWlAyA2eywZW/jwO0d+k4/2nBjNCxZP6vCPieRCU22O+RAXWVC0AuUAMzButmsp+4rLNkgLYIWQk4xUs9MgdDZROEpQyMY4CZO4+aWJ5qPDu8lmLoZ7Y0qBYoyr0T8Y/dy5epCsgzjkOVQRy2xTF4uDhD+aPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JMdnJ/41Z4FbEgOqflToYOsj2Dp5uOaTg+dKoc4ZMzQ=;
 b=O+E2StvEDOoVbdHFug1iyvg1ZRJbI4/IqoMmMOJ0Ufk9w9pPhIbBfBA6En6SSy3w6V9X9kb0i0SuSsykGiWZDWo58p/MUQhInbaL0/MB9PuuBNffpMF/rY7QyhxucT1tO3UYozgZxYSS+LN7mtTeEHDWCNlrp6ABXvV5WZUajNaEILH6D+wBQ5Fsg9rquFhiUGNjtlOmqMsmdzqyEquRqe2JvaD/KDR5lP/Exkoe1sMBjG03f1XXkUFzT2k3q4G6B3LkBq/VDbZ9I/fxP2KbKM2v5LuWqSBhg+tj6sR0D9itfMvNhIs5NBytgmMwLotAEF5KCO/z8OlezlYhUDOnMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=arm.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JMdnJ/41Z4FbEgOqflToYOsj2Dp5uOaTg+dKoc4ZMzQ=;
 b=Bgn2NS8J3xzr1ZLC3J5RmImPKoUsP0HMNCLbYy6B7yXdrXH2PE9W0aQxqnKRMtSaJR/jdxEH6kIFpKTLYXk8fhHifTpOxF78yMyuKgnDa1Z2EnSVui6f6WJ7BzeYqx9O+OrjzffEi+5/NjPNBlGj2tKsV9ay5KBZjwxPvQ91JP0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch01.xlnx.xilinx.com;
Message-ID: <636b9fe8-4c10-45f5-da95-513c87e5939f@xilinx.com>
Date: Wed, 17 Nov 2021 16:21:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: Xen/ARM - Query about a data abort seen while reading GICD
 registers
To: Bertrand Marquis <Bertrand.Marquis@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@xilinx.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <1489a1b9-aefa-0ddf-8dba-4a566388cc6f@xilinx.com>
 <CED537AF-44AA-41B8-9458-17A5C43FBECC@arm.com>
 <f91fd718-040e-88a3-ca96-30d1efe9a689@xilinx.com>
 <0ACF6308-EDB0-4B98-A029-1C7B23820198@arm.com>
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
In-Reply-To: <0ACF6308-EDB0-4B98-A029-1C7B23820198@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a1d5271-6d4d-480b-b2c5-08d9a9e64c67
X-MS-TrafficTypeDiagnostic: SJ0PR02MB8531:
X-Microsoft-Antispam-PRVS:
	<SJ0PR02MB85314D89DC7CF8E7E9F6397EB29A9@SJ0PR02MB8531.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5XuC5jWDlLOwrD5DffP+YpOEwonoG9Esyv+//Bwt+X1HijZLfFuQb11cFhe2A+pBG1ii9eKFPuTgpcccs40LCvw2BOJqFZHFdtWSs5yanYhUN/D8v402J6s/l65a4onb+c8dtbqFufTJIe6W2OYQ7lywthpheOFnfcTHGRLU0Hekx5HnOkVdPn6zEbPLzm4u8kagajU5I8AumHAKIagovIKkldQ1VnTaGUVhuEHRaHW0vfPVucQBLNNb42SCBWRScjYL/EbUN/Stqj1L0aSFH8hitdHllMfSO4dBvWCiZWxp9aNQnp7nRzhfqAYdpf5H3D5aBQ+0A+vk080pPFjLam0VuhQe9tD+2RIhPzFh8yQ/gkmMWBUuTqZv/Dii+wDZCyGRiDli+XNjVE+hzJdnJ7c7AxLBbmNAPXfkyS3JVntk/8eOP2fls76l5vMRFvUWaJ99tD88fKAkIQOr0vpJy04oHyBLk9sfGVKWFzKmNRVl7R5hfdOEPIjhK3btDeIW6HGDGPOzTqrX0miBL+LHW/F5+AotZl8YQgZGBMFwTUTRFzRoXZeUNQx5J5gYVSMDf54q7Cn8tD501ACV+kiwi0Pymf1EWMk3HwamQBM6B5MZPd7qvx3a1GTXipnauEjNqDicZudp+kDfWcb7Tft2N4QhxPCasPC7bO/INsGXsXmdaGgYne0iMQvhcDIKtE8LAYkJaOpNVzKssh2sWc6VoIihrUCWS8UnUTHzCt9ERAq9hK2xlJtYb0BdwDeJZo43yMbsHyEb52XPSiEL7aDbEwoowgliTYQuFEBe8Y0VOFzBO1BpkyuyxpPikm2PPbjOK9qCJsk1sUv6ReWUk5aIZmNwdZn1SVVq/jOuhp4/nq8=
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch01.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(46966006)(36840700001)(70206006)(8676002)(356005)(53546011)(186003)(70586007)(426003)(82310400003)(8936002)(2906002)(5660300002)(31686004)(966005)(9786002)(508600001)(36756003)(31696002)(7636003)(83380400001)(2616005)(336012)(36906005)(316002)(4326008)(36860700001)(54906003)(26005)(47076005)(110136005)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 16:21:23.6283
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a1d5271-6d4d-480b-b2c5-08d9a9e64c67
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0045.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB8531

Hi Bertrand,

Many thanks for your response.

On 17/11/2021 15:48, Bertrand Marquis wrote:
> Hi Ayan,
> 
>> On 16 Nov 2021, at 16:24, Ayan Kumar Halder <ayan.kumar.halder@xilinx.com> wrote:
>>
>> Hi Bertrand,
>>
>> Thanks for looking into it.
>>
>> On 16/11/2021 15:36, Bertrand Marquis wrote:
>>> Hi Ayan,
>>>> On 16 Nov 2021, at 15:27, Ayan Kumar Halder <ayan.kumar.halder@xilinx.com> wrote:
>>>>
>>>> Hi Xen/Arm experts,
>>>>
>>>> I am facing a very strange issue while running a baremetal application as a DomU guest on arm64 platform.
>>>>
>>>> The baremetal app tries to read the GICD register with post indexing as follows :-
>>>> ldr x1, =0x3001000
>>>> ldr w2, [x1], #4 <<<------ PC = 0x40000ca8
>>> Increment on on load is not supported by the emulation layer.
>>
>> That is surprising. The reason being if I try to read the GICC register (0x3002000) with post indexing then it works fine.
> 
> When the ISV bit is not set, Xen would have to decode the instruction to actually emulate the access and properly modify the registers values as long as providing the “emulated” access value.

This is very interesting. Is this being done for any of the other 
instructions in Xen ?
> There is not such a decoder in Xen right now which means those kind of accesses are not supported for emulated mmio accesses.

I am actually trying to understand where I will need to make the changes 
if I have to add support for the decoder. The reason being this issue is 
being faced by one of our customer application.
Besides changing the instruction to prevent post increment, is there any 
other mitigation ?

The reason being I don't see a way to instruct the compiler to not 
generate the post indexing instructions.
> 
>>
>> Can you point me in source where this limitation is set ?
> 
> In this case the isv field is set to 0 when the exception is received by Xen which means the decoding part of HSR is invalid so Xen is not handling the emulation of the access.
> 
> @julien and Stefano: I have been going around and around the code but I cannot find where the valid bit of hsr_dabt is checked, could you help me here ?

By any chance, are you referring to 
https://github.com/Xilinx/xen/blob/4bd2da58b5b008f77429007a307b658db9c0f636/xen/arch/arm/io.c#L129 
?

Also, post indexing works for some other registers (eg GICC). So, I am 
guessing that the behaviour is specific for GICD or random ?

- Ayan
> 
>>> Could you try with:
>>> add x1, x1, #4
>>> ldr w2, [x1]
>>
>> This worked fine.
> 
> Good :-)
> 
> Bertrand
> 
>>
>> -Ayan
>>> Regards
>>> Bertrand
>>>>
>>>> And then I get :-
>>>> HSR=0x92000005 pc=0x00000040000ca8 gva=0x3001000 gpa=0x00000003001000
>>>>
>>>> This problem occurs only while reading the GICD registers with post indexing. If I read the register with pre-indexing, then I do not see any abort. Alternatively, if I read GICC register with post indexing, I don't see the abort either.
>>>>
>>>>  From the HSR value, I interpret it as
>>>> EC = 100100b # Data abort from lower exception
>>>> IL = 1b # 32 bit instruction trapped
>>>> DFSC = 101 # Translation fault level 1
>>>>
>>>> On debugging, I found that the abort is triggered from
>>>>
>>>> try_handle_mmio()
>>>> { ...
>>>>     /* All the instructions used on emulated MMIO region should be valid */
>>>>     if ( !dabt.valid ) {
>>>>
>>>>         return IO_ABORT;
>>>>     }
>>>> ...
>>>> }
>>>>
>>>>  From the Arm V8 Arm specs, I understand that dabt.valid is ISV, bit[24] in "ISS encoding for an exception from a Data Abort".
>>>>
>>>>
>>>> I saw that the caller is
>>>>
>>>> do_trap_guest_sync() "case HSR_EC_DATA_ABORT_LOWER_EL"
>>>> where dabt.valid is false.
>>>> In the success scenario, dabt.valid is true.
>>>>
>>>> I could not find the caller for do_trap_guest_sync()
>>>>
>>>> So, can anyone help me here
>>>> 1. Who is the caller for do_trap_guest_sync() ?
>>>> 2. Any idea on what the issue is and how I can debug it further ?
>>>>
>>>> Kind regards,
>>>> Ayan
>>>>
> 

