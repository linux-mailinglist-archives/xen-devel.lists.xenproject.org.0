Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 015C0457485
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 17:56:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228133.394679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo7BE-0007Jk-KK; Fri, 19 Nov 2021 16:56:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228133.394679; Fri, 19 Nov 2021 16:56:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo7BE-0007HY-GQ; Fri, 19 Nov 2021 16:56:04 +0000
Received: by outflank-mailman (input) for mailman id 228133;
 Fri, 19 Nov 2021 16:56:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hxJH=QG=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1mo7BD-0007HS-BA
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 16:56:03 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20617.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92a0c133-4959-11ec-9787-a32c541c8605;
 Fri, 19 Nov 2021 17:56:01 +0100 (CET)
Received: from SA0PR11CA0158.namprd11.prod.outlook.com (2603:10b6:806:1bb::13)
 by MW2PR02MB3819.namprd02.prod.outlook.com (2603:10b6:907:3::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Fri, 19 Nov
 2021 16:55:58 +0000
Received: from SN1NAM02FT0033.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:1bb:cafe::2a) by SA0PR11CA0158.outlook.office365.com
 (2603:10b6:806:1bb::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26 via Frontend
 Transport; Fri, 19 Nov 2021 16:55:57 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (149.199.80.198) by
 SN1NAM02FT0033.mail.protection.outlook.com (10.97.5.40) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Fri, 19 Nov 2021 16:55:57 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 19 Nov 2021 16:55:56 +0000
Received: from smtp.xilinx.com (172.21.105.198) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 19 Nov 2021 16:55:56 +0000
Received: from [10.71.118.226] (port=57873)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1mo7B3-0001uI-GI; Fri, 19 Nov 2021 16:55:55 +0000
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
X-Inumbo-ID: 92a0c133-4959-11ec-9787-a32c541c8605
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P7YyjZghvNMT6KgPcNStKmTGQd5fALLkpzI9zFJNyTUWYK83svohI3Vu3GrEF771aXtkOVD0R+N0pcLtKh7uD8yFts9ZqfUgzx3V/1LVbTquPK0rf5AB3EahRq2e8ZggG9fRGgP3RI+0X+FUZCdrmRL5vUsRqFbPnAleOnvcTYjd7dadYjGdHjtIpdQkoL7EQyd64nGjQqDe6WQEXsJRGcq5b6I3/lIb8jGi/M7Uy4gBFrEtl951QY5C5E50e3pJ3aQwLcLxlGdWDDFX6GKQpze/+0Ew0OjHO6NRZauKlLNMvSMg//j1O87uyU+/+Xx2fwo37Ngxt22i32f9Pl8p+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lPpJDle/FwP5aRVgESenpKYXejXjigrkBQrmbDvAqSI=;
 b=mCuNd7e7jbqJmAMC4kn9q60t63F7bq0kp5Aga6Dqv0GYUVb2ZOMepd/46RNxh8WGfWFthRxAjnMvaV73CdSY4YGrgYTA46gXbJJD8jqySeDvWbItyiTYU0Wm9Te0ukgk+Tj7J09wzk8IVym2wafM67gkjmPK8c/JmO2Bygvj/NtMgjXtogkPrFkYd6J0qBML3fQo3SzL2ABCwlBnf30D78n/T4tFJEYP/1TGwqeXms0cHA2kF+PpaL5FiomVQRVTWXlkTRQKXAs+ClozK4I68CAARZQSNY2zkE0ss0Uc9B/uYEqMYWymjJcMNk6zvhed0HQ+WqSC0XfMsjXq0yocBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lPpJDle/FwP5aRVgESenpKYXejXjigrkBQrmbDvAqSI=;
 b=qwnTItRHGevoPrJxjqP9QZSUwxcIXm60us4wx6wH2bML/m5H4NXf0TMCwWsVroykySbIRqYneLVF38Fm8mqK+FquatFbtfn4nGP2Wz0IzrAYHLaFMAv9Bjx6Ped4uT86IvkdxoXmfA2EnGrddbcKthzLz7gxGSAIXtvj8zm0p2Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch02.xlnx.xilinx.com;
Message-ID: <a336f337-c068-cf18-e949-57d8061f72b8@xilinx.com>
Date: Fri, 19 Nov 2021 16:55:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: Xen/ARM - Query about a data abort seen while reading GICD
 registers
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@xilinx.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
References: <1489a1b9-aefa-0ddf-8dba-4a566388cc6f@xilinx.com>
 <CED537AF-44AA-41B8-9458-17A5C43FBECC@arm.com>
 <f91fd718-040e-88a3-ca96-30d1efe9a689@xilinx.com>
 <0ACF6308-EDB0-4B98-A029-1C7B23820198@arm.com>
 <636b9fe8-4c10-45f5-da95-513c87e5939f@xilinx.com>
 <BA07700B-D025-492D-A376-513408927F68@arm.com>
 <c7bda1d6-355e-3240-1d09-59d7c13c4262@xen.org>
 <alpine.DEB.2.22.394.2111171701390.1412361@ubuntu-linux-20-04-desktop>
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
In-Reply-To: <alpine.DEB.2.22.394.2111171701390.1412361@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05a25e78-74cf-4010-4c9a-08d9ab7d754c
X-MS-TrafficTypeDiagnostic: MW2PR02MB3819:
X-Microsoft-Antispam-PRVS:
	<MW2PR02MB3819D7E24F2CC185CD534C50B29C9@MW2PR02MB3819.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tb6IpNrcEHEd0rc847/AuM9m33meWedRGDJp5eYl30g3tVBR75lx9dyMaP6EFtMRNp6norWHKR+GsoLf+eBasRHJBDooZ7fZJeUcN0aFKUrVXzG2giqv3mldec+DYjLVaaagJ8v9Bc46Fi5ZcgznXcSVzfZPTj4AH29INhYEw5dGMOfWLFJ/oAW7BoM43sq62P+tSNXKiTUmRxqo+LBBGcz4gjeRcmtRZbrNihuRl7ZcT4HYSz0Y3BHcYW3m4jr/K/+9kcxCksRei7IVR18gbK/IjLSACX2RXBqObQsuyHeGi61pPdGQhDMik54rdWFBdvsfUWCpSHlEu1MasUpiYVbSpfsZmHU03N+ES1Axh5j9bQBF5n9JOORwVZ7Gs3WaVaIyS8FwmZKnjn3W+Ceahqr7/CY9quhKiNI7i9Woi7xSiqk57SXy+SIDGH3spPQsfoduQ3+Zj4XnMJbm2kujenvsFfMUv+amBk5Ulgikmx4dckEod7LaKYXO3yuf+CvFDQeIFUN6IDj6fPI9xqDm6oF1ngW9VXxO1Y7ZsUm5Gj3EL3LtdLIcbZTYXZjJxKEz/jrEd9DUf9Zhd79//kU/FXyinZhkIUTzYsO5eoAzYIbDYOkb8+xwmGMRgDTR6kNdbgvhpTbwkZROCk7v4lCOq4JO+tzfUHxLWqsHzuavBiRce5sDFxhcrYngl/Zb+yGcZCSXu3XlLxrlGzPEEESyYRXBvJDy2Hk7ioM3068WQpunUI1WN5pmvfxI5htrkp9p4gWPCYFZVLLbO+2yrEO/kBbDo+40kqxKse39askuwt9GpWw7uO7O2//pzYf+8di65ChQgJ1ZH+twVZqZjyRRAg==
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch02.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(36840700001)(46966006)(36906005)(426003)(82310400003)(336012)(4326008)(8676002)(31686004)(8936002)(26005)(186003)(316002)(9786002)(966005)(36860700001)(70206006)(31696002)(36756003)(356005)(7636003)(5660300002)(2616005)(508600001)(70586007)(83380400001)(53546011)(2906002)(47076005)(54906003)(110136005)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 16:55:57.4133
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05a25e78-74cf-4010-4c9a-08d9ab7d754c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0033.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR02MB3819

Hi Stefano/Julien/Bertrand,

Thanks a lot for your inputs.

On 18/11/2021 01:11, Stefano Stabellini wrote:
> On Wed, 17 Nov 2021, Julien Grall wrote:
>> I will combine my answers for this thread in one single e-mail.
>>
>> On 17/11/2021 16:35, Bertrand Marquis wrote:
>>>> On 17 Nov 2021, at 16:21, Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
>>>> wrote:
>>>>
>>>> Hi Bertrand,
>>>>
>>>> Many thanks for your response.
>>>>
>>>> On 17/11/2021 15:48, Bertrand Marquis wrote:
>>>>> Hi Ayan,
>>>>>> On 16 Nov 2021, at 16:24, Ayan Kumar Halder
>>>>>> <ayan.kumar.halder@xilinx.com> wrote:
>>>>>>
>>>>>> Hi Bertrand,
>>>>>>
>>>>>> Thanks for looking into it.
>>>>>>
>>>>>> On 16/11/2021 15:36, Bertrand Marquis wrote:
>>>>>>> Hi Ayan,
>>>>>>>> On 16 Nov 2021, at 15:27, Ayan Kumar Halder
>>>>>>>> <ayan.kumar.halder@xilinx.com> wrote:
>>>>>>>>
>>>>>>>> Hi Xen/Arm experts,
>>>>>>>>
>>>>>>>> I am facing a very strange issue while running a baremetal
>>>>>>>> application as a DomU guest on arm64 platform.
>>>>>>>>
>>>>>>>> The baremetal app tries to read the GICD register with post
>>>>>>>> indexing as follows :-
>>>>>>>> ldr x1, =0x3001000
>>>>>>>> ldr w2, [x1], #4 <<<------ PC = 0x40000ca8
>>>>>>> Increment on on load is not supported by the emulation layer.
>>>>>>
>>>>>> That is surprising. The reason being if I try to read the GICC
>>>>>> register (0x3002000) with post indexing then it works fine.
>>>>> When the ISV bit is not set, Xen would have to decode the instruction to
>>>>> actually emulate the access and properly modify the registers values as
>>>>> long as providing the “emulated” access value.
>>>>
>>>> This is very interesting. Is this being done for any of the other
>>>> instructions in Xen ?
>>>
>>> No Xen is not trying to decode any instructions.
>>
>> We actually decode some instructions (see arch/arm/decode.c). This was
>> necessary because early revision of Cortex-A15 would not properly fill
>> syndrome for Thumb instructions.
>>
>> decode_instruction() could be extended to handle the specific instruction if
>> needed.
>>
>>> If you look at Linux source code, this is the kind of stuff that the kernel
>>> is delegating to user application (qemu) to do as it can be quite complex.
>>>
>>>>> There is not such a decoder in Xen right now which means those kind of
>>>>> accesses are not supported for emulated mmio accesses.
>>>>
>>>> I am actually trying to understand where I will need to make the changes
>>>> if I have to add support for the decoder. The reason being this issue is
>>>> being faced by one of our customer application.
>>>> Besides changing the instruction to prevent post increment, is there any
>>>> other mitigation ?
>>>
>>> Not that I know of.
>>
>> Decoding the instruction is the only solution if you don't want to update the
>> baremetal app.
>>
>>>>
>>>> The reason being I don't see a way to instruct the compiler to not
>>>> generate the post indexing instructions.
>> In general, it is not safe to let the compiler decide for you how to access
>> the MMIO registers as it can do all sort of optimization behind your back.
>> That's why...
>>
>>>
>>> You can define io access functions instead of letting the compiler generate
>>> the read/write functions.
>>> Look at arch/arm64/include/asm-arm/io.h in linux for example.
>>
>> ... Linux provides io{read, write} helpers.
>>
>> @Ayan, is the code written in assembly or C? If the latter, how is it written?
> 
> I chatted with Ayan this morning and he will try to contact the original
> author and get a proper answer, but I am pretty sure that it is written
> in C. What makes it worse is that I believe the issue only started to
> appear recently due to updating compiler (hence new compiler
> optimizations.) Which means that this issue might become more common in
> the future in other environments too :-(
> 
> I believe this is the code (source [1]):
> 
>      XScuGic_WriteReg(BaseAddress, XSCUGIC_DIST_EN_OFFSET, 0UL);
> 
> which expands to:
> 
>      #define XScuGic_WriteReg(BaseAddress, RegOffset, Data) \
>      	(Xil_Out32(((BaseAddress) + (RegOffset)), ((u32)(Data))))
> 
> Which is:
> 
>      static INLINE void Xil_Out32(UINTPTR Addr, u32 Value)
>      {
>      	/* write 32 bit value to specified address */
>      #ifndef ENABLE_SAFETY
>      	volatile u32 *LocalAddr = (volatile u32 *)Addr;
>      	*LocalAddr = Value;
>      #else
>      	XStl_RegUpdate(Addr, Value);
>      #endif
>      }
> 
> [1] https://github.com/Xilinx/embeddedsw/tree/master/XilinxProcessorIPLib/drivers/scugic/examples/xscugic_low_level_example.c
> 
> 
> So it seems to be a pretty standard volatile write in a static inline
> function.
> 
> 
>> That said, the ldr writeback instructions should be safe to use. It happens
>> that we never had OS using them before.
> 
> Yeah I agree... My two cents is that if we can find a way to decode the
> instruction without a huge amount of code then it would be worth doing
> it.
> 
I have submitted a patch to decode the ldr/str post-indexing instructions.
"[RFC PATCH] Added the logic to decode 32 bit ldr/str post-indexing 
instructions"

Please have a look and let me know your thoughts.
- Ayan

