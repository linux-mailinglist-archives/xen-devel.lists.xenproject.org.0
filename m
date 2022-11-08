Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8640E620A2A
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 08:27:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439749.693800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osJ08-0002xE-5f; Tue, 08 Nov 2022 07:26:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439749.693800; Tue, 08 Nov 2022 07:26:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osJ08-0002uc-28; Tue, 08 Nov 2022 07:26:28 +0000
Received: by outflank-mailman (input) for mailman id 439749;
 Tue, 08 Nov 2022 07:26:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V9g1=3I=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1osJ05-0002uW-Sl
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 07:26:26 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2084.outbound.protection.outlook.com [40.107.223.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a37c574c-5f36-11ed-8fd1-01056ac49cbb;
 Tue, 08 Nov 2022 08:26:20 +0100 (CET)
Received: from MW4PR04CA0087.namprd04.prod.outlook.com (2603:10b6:303:6b::32)
 by IA1PR12MB6602.namprd12.prod.outlook.com (2603:10b6:208:3a2::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Tue, 8 Nov
 2022 07:26:19 +0000
Received: from CO1NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6b:cafe::a8) by MW4PR04CA0087.outlook.office365.com
 (2603:10b6:303:6b::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26 via Frontend
 Transport; Tue, 8 Nov 2022 07:26:18 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT059.mail.protection.outlook.com (10.13.174.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5791.20 via Frontend Transport; Tue, 8 Nov 2022 07:26:17 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 8 Nov
 2022 01:26:15 -0600
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Tue, 8 Nov 2022 01:26:14 -0600
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
X-Inumbo-ID: a37c574c-5f36-11ed-8fd1-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l5Rr0k7uaNUzTc4N0RJx4WU31UmLdNhv+0f8JVY0PvQXS6r5xgRyzTJ442hKeDF/eH4mFw73cP4aoL5ooyVqHAXzuAor+uRd2YiKRP0uHGuTjeiDelUDgY9D08SE60ali+CJJYEwmmUnVCXo7wzstXrLCcbJjYUUrSFeVbfBVSu2LncEtqCbM28yYc3cA3PrE6cvBvUTc8Bo+V2b8eoAkMI57pHeT+EBE8yzbtYET8rMDiiAhUQsPDIgWIBd4ZPxe59fk8V25iqAt4EqRuQWCffRTRqUu1U4jcBng+W7BPDB7C4thNMzJ+3awignxB7NWf1y74/euzCaF8/lejKOYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ig6oVucpi1bLI4BiICYng/j57OErh4ZehuY3cKdoo4=;
 b=RE7UWcwvrXD/VoFax0q/433QLsHos25jVm4VATL1pAlog7c8dTJhJsgNAvjKxWQLGraR++bzKI5EYkL6TLgGXyhcj123Iz3RGSiB7w1Hml+BdOzITHJts3nGPxQAUlv4D0yjzX8kWLrKngjAGY4xu9m00KI0CUC4Y2UzzZa5e7zP9ex4oe5PfeisiSbiTThhVj+rIc8G57fgHnbVrlyGiPy8ssUPH5mP4fX7DcC8Lr0Jc3ghGxk6zv5eHYK4Q/ZYBPGnTkMM994ADZ5/nlj4a0+Wq20FNyyu4FEliVni8hQKwNqMErC3OUTSXm5TZfhmZ5BTJIyTOaONbcD+qzIK6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ig6oVucpi1bLI4BiICYng/j57OErh4ZehuY3cKdoo4=;
 b=a15RdkIg7YmdrUiBgm77D7eyuSQlD3qtbu3j5cX87sBK2gu6PA272DPxquzQqMtNxo5HgYIg3Z4RQEctGB+hxZIuxQ8EmChctC2xVPKRe3DgwZl1E25IPrXQu7+ckGpIox9DLU/V43PUNYiDttSLRzc7Ggh41urQh3UXncBkYzQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <3720a691-3303-a673-58b6-95da9a4341d2@amd.com>
Date: Tue, 8 Nov 2022 08:26:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [XEN v2] xen/Arm: Enforce alignment check for atomic read/write
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder <ayankuma@amd.com>, "Ayan
 Kumar Halder" <ayan.kumar.halder@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>
References: <20221104162355.23369-1-ayan.kumar.halder@amd.com>
 <062c9507-7744-0742-effb-76d2f1222a27@xen.org>
 <33a2d125-b7f2-3637-9dab-6b7d616fd4ff@amd.com>
 <b17653b6-e4e7-8f5b-647e-37f2d71f9a3a@xen.org>
 <36e84512-9b44-303e-2834-5aafe9c6cc15@amd.com>
 <74b1c6af-d6de-2728-9d59-2d561a521793@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <74b1c6af-d6de-2728-9d59-2d561a521793@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT059:EE_|IA1PR12MB6602:EE_
X-MS-Office365-Filtering-Correlation-Id: fe3e7535-a883-4b6a-5491-08dac15a86d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UHVGCOswoHnLYC0a6UqV9dD9Codn86UoXNz0Vb1bF7ybIKWaEY6GXFT+DeXUYFRZsVrLdMEXoJCIYO5pOBLKOKKvgWq30bmJT6V5OGsku/Bu+Cile+xexli0jGZ0zXapEqy4hod1KoAZGvCOKdJYtqI4avQqE41c16Ltozbm14FKovbBpRRW9uDg48iUhHpUHoRjMGsj35XgsTagNZtrRjnlD3rRo08LghoUxlxst65YrXabsRCxzCDXR0dkL2dtmFSOMA8CMEuMbBS2j8NYnbLuOx4XxE6UAN3apt5+cs4RgUsS+N/MDvKs+aA60/MkHXXM0L9+Ih/2p8hQ8mhE8Rg79jUOppUhd/EwUAjQkYEEXUeqoDgo7Jcb27qwXkawRPBwBC8zt3zIpwwaAz69aBDnZMjR63bDDrJsQFiuR3Sik6YPfZ8u8hETESqeSiJePCEApC0k5SGmwTIm6w7H/rmL0lvD3Xo3PrhpXMDhPLx0+YRyc78fD56+WLWl1QRuFU5YWIawsAdta09OPd+32DA/j86DVgFEIbMFQeE2e/v5wCb/SPb8A5kTTjXmyRQswJqK5PnsUSnGwIA5pslKwYFLLe9QM+ECU98Mye4dBneU9gtgsVDdE+k7/oLajtOGVvAGVdBXouS5hwaCkpTUK6EMu2hjQf8QtzirV3QdkmHiCjIYhXcCDHma/wN9YgiaKnlXS0icfuT2/NaFVQ4/fTijc1WruvYeqQHYudSFSJDr7vCt8x5T8cfelfOycL8odYNVuBnSF9ExDwfruC8nQ5Qd8iA189T6SnIMLDpJFV3do2qp6BOrsTBXA7aa1xDq0zolMpuMsrdkd3WkNeDzFA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(346002)(396003)(136003)(451199015)(36840700001)(46966006)(40470700004)(40460700003)(4326008)(41300700001)(40480700001)(8676002)(8936002)(5660300002)(478600001)(70206006)(2616005)(54906003)(36860700001)(110136005)(316002)(16576012)(81166007)(356005)(83380400001)(70586007)(82740400003)(86362001)(31696002)(186003)(336012)(426003)(26005)(53546011)(47076005)(31686004)(2906002)(82310400005)(36756003)(44832011)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 07:26:17.7645
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe3e7535-a883-4b6a-5491-08dac15a86d0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6602

Hi Julien,

On 07/11/2022 19:06, Julien Grall wrote:
> 
> 
> Hi Ayan,
> 
> On 07/11/2022 12:49, Ayan Kumar Halder wrote:
>>
>> On 07/11/2022 10:44, Julien Grall wrote:
>>> Hi Ayan,
>> Hi Julien,
>>>
>>> On 07/11/2022 10:36, Ayan Kumar Halder wrote:
>>>>
>>>> On 06/11/2022 17:54, Julien Grall wrote:
>>>>> Hi Ayan,
>>>>
>>>> Hi Julien,
>>>>
>>>> I need some clarification.
>>>>
>>>>>
>>>>> To me the title and the explaination below suggests...
>>>>>
>>>>> On 04/11/2022 16:23, Ayan Kumar Halder wrote:
>>>>>> From: Ayan Kumar Halder <ayankuma@amd.com>
>>>>>>
>>>>>> Refer ARM DDI 0487I.a ID081822, B2.2.1
>>>>>> "Requirements for single-copy atomicity
>>>>>>
>>>>>> - A read that is generated by a load instruction that loads a single
>>>>>> general-purpose register and is aligned to the size of the read in the
>>>>>> instruction is single-copy atomic.
>>>>>>
>>>>>> -A write that is generated by a store instruction that stores a single
>>>>>> general-purpose register and is aligned to the size of the write in
>>>>>> the
>>>>>> instruction is single-copy atomic"
>>>>>>
>>>>>> On AArch32, the alignment check is enabled at boot time by setting
>>>>>> HSCTLR.A bit.
>>>>>> ("HSCTLR, Hyp System Control Register").
>>>>>> However in AArch64, alignment check is not enabled at boot time.
>>>>>
>>>>> ... you want to enable the alignment check on AArch64 always.
>>>>
>>>> I want to enable alignment check *only* for atomic access.
>>>>
>>>> May be I should remove this line --> "However in AArch64, alignment
>>>> check is not enabled at boot time.".
>>>>
>>>>> However, this is not possible to do because memcpy() is using
>>>>> unaligned access.
>>>> This is a non atomic access. So the commit does not apply here.
>>>
>>> Right, but your commit message refers to the alignment check on arm32.
>>> You wrote too much for someone to wonder but not enough to explain why
>>> we can't enable the alignment check on arm64.
>>>
>>>>>
>>>>> I think the commit message/title should clarify that the check is
>>>>> *only* done during debug build. IOW, there are no enforcement in
>>>>> producation build.
>>>>
>>>> AFAICS read_atomic()/write_atomic() is enabled during non debug
>>>> builds (ie CONFIG_DEBUG=n) as well.
>>>
>>> My point was that ASSERT() is a NOP in production build. So you
>>> effectively the enforcement happens only in debug build.
>>>
>>> IOW, unless you test exhaustively with a debug build, you may never
>>> notice that the access was not atomic.
>>
>> This makes sense.
>>
>> Does the following commit message look better ?
>>
>> xen/Arm: Enforce alignment check for atomic read/write
> 
> title:
> 
> xen/arm: Enforce alignment check in debug build for {read, write}_atomic
> 
>>
>> Refer ARM DDI 0487I.a ID081822, B2.2.1
>> "Requirements for single-copy atomicity
>>
>> - A read that is generated by a load instruction that loads a single
>> general-purpose register and is aligned to the size of the read in the
>> instruction is single-copy atomic.
>>
>> -A write that is generated by a store instruction that stores a single
>> general-purpose register and is aligned to the size of the write in the
>> instruction is single-copy atomic"
>>
>> Thus, one needs to check for alignment when performing atomic operations.
>> However, as ASSERT() are disabled in production builds, so one needs to
> 
> This seems to be a bit out of context because you don't really explain
> that ASSERT() would be used. Also...
> 
>> run the debug builds to catch any unaligned access during atomic
>> operations.
>> Enforcing alignment checks during production build has quite a high
>> overhead.
>>
>> On AArch32, the alignment check is enabled at boot time by setting
>> HSCTLR.A bit.
>> ("HSCTLR, Hyp System Control Register").
>> However, on AArch64, memcpy()/memset() may be used on 64bit unaligned
>> addresses.
>> Thus, one does not wish to enable alignment check at boot time.
> 
> ... to me this paragraph should be first because this explained why we
> can't check in production. So how about the following commit message:
> 
> "
> xen/arm: Enforce alignment check in debug build for {read, write}_atomic
> 
> Xen provides helper to atomically read/write memory (see {read,
> write}_atomic()). Those helpers can only work if the address is aligned
> to the size of the access (see B2.2.1 ARM DDI 08476I.a).
> 
> On Arm32, the alignment is already enforced by the processor because
> HSCTLR.A bit is set (it enforce alignment for every access). For Arm64,
> this bit is not set because memcpy()/memset() can use unaligned access
> for performance reason (the implementation is taken from the Cortex
> library).
> 
> To avoid any overhead in production build, the alignment will only be
> checked using an ASSERT. Note that it might be possible to do it in
> production build using the acquire/exclusive version of load/store. But
> this is left to a follow-up (if wanted).
> "
This reads very well.

> 
> While trying to find a justification for the debug version. I was
> wondering whether we could actually use the acquire or exclusive
> version. I am not entirely sure about the overhead.
> 
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>
>> I think I can keep R-b as there is no code change ?
> 
> My signed-off-by will need to be added for the commit message I proposed
> above. So I would like Bertrand/Michal to confirm they are happy with it
> (I don't usually add my reviewed-by/acked-by for patch where my
> signed-off-by is added).
> 
You can keep my Rb and Bertrand or Stefano can ack it, so that we can avoid
acking a patch by one of the authors.

> Cheers,
> 
> --
> Julien Grall

~Michal

