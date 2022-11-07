Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1608D61F3B0
	for <lists+xen-devel@lfdr.de>; Mon,  7 Nov 2022 13:50:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439379.693420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1os1ZN-0004qQ-7u; Mon, 07 Nov 2022 12:49:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439379.693420; Mon, 07 Nov 2022 12:49:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1os1ZN-0004nn-55; Mon, 07 Nov 2022 12:49:41 +0000
Received: by outflank-mailman (input) for mailman id 439379;
 Mon, 07 Nov 2022 12:49:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GEsR=3H=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1os1ZL-0004nh-8K
 for xen-devel@lists.xenproject.org; Mon, 07 Nov 2022 12:49:39 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2069.outbound.protection.outlook.com [40.107.102.69])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a21d80be-5e9a-11ed-8fd1-01056ac49cbb;
 Mon, 07 Nov 2022 13:49:36 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by CY5PR12MB6527.namprd12.prod.outlook.com (2603:10b6:930:30::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Mon, 7 Nov
 2022 12:49:32 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2%7]) with mapi id 15.20.5791.026; Mon, 7 Nov 2022
 12:49:32 +0000
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
X-Inumbo-ID: a21d80be-5e9a-11ed-8fd1-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VG2JKDT6DIwxYUEHxUD91w0ZaGAmITDo29Hiw09NbIrj07ikA2vbbDufPeWDbs/fhc3NqF5ZWkTE3yX2UuwLHQX4JthxMKwOv4MT9WDwLpRNwlhcM3fF34i2y3kJ6nU6CBGC54v4IQYScPQTrmDECTkO1+WgEYtyKdg8gWeMvOAwqCOuUUoRZiOZ2JUAk9rAGeQ0EDRPC7MNW061WIv9leYjnWZx9FyXgoha0CaxjoWH28ix2qHlhDghJfyL4vlW1+vQzaNWRYR3BMPERHPUA4XoVM2JOJn1Mk4nMEfElNRgbqH0MTpJGL7fw5a8So5vHo9pbGcwCvCEyi72ldMpuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UITH3pPH1dVUoCM8Kj/tElqVfTF+vparNAHDqJ+glHk=;
 b=i4F4bCcjy1x2/IVOLwgHUgKJgixGMx5E8dWXC8Q3eFGxaClMlas6KCr/Ju3kNDcn8nD+vgY3LZE2xIDHhVHN7UWtX+4mJo22/409NDx21QwZjfwu1/rM7IL9vmDN2Us7wgUOIdW1VpyxAqjPUirwT0hrjXB1dpa2Q+/bwD5bNNpRKVMRvQNnhGd5xWPCmz9waOLKYqpHMdk0u0gR5FHbRPrmNwpqAFZoXpK1SLyda8hwz+Vj67ijW86Ry5FZnUgPtQ0AkpKsHMqH7PEcrdzkPqXHCYhk1OZ/xUCwG4x5J8I3VtQwHatc6CLfD6JNTIxYigKJ3U9NFqdexKGzPyi+lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UITH3pPH1dVUoCM8Kj/tElqVfTF+vparNAHDqJ+glHk=;
 b=YmSM+Cp3QJEv/sz5wUnYxOlsW3QylvIs+kyY1Lx3P6s4yU+33ut7N4rYQ9sCsqfonZafEepEjwo/tpDc3rpEUW8p2P+6q98GeDSy7OfpHyrWomcI9I+fH+sLYFg+Q8DAlWUSJ6ehlRS/20PrXTOAxtOFyFMy4KIhgQlJM0Vxpzc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <36e84512-9b44-303e-2834-5aafe9c6cc15@amd.com>
Date: Mon, 7 Nov 2022 12:49:26 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [XEN v2] xen/Arm: Enforce alignment check for atomic read/write
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, michal.orzel@amd.com
References: <20221104162355.23369-1-ayan.kumar.halder@amd.com>
 <062c9507-7744-0742-effb-76d2f1222a27@xen.org>
 <33a2d125-b7f2-3637-9dab-6b7d616fd4ff@amd.com>
 <b17653b6-e4e7-8f5b-647e-37f2d71f9a3a@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <b17653b6-e4e7-8f5b-647e-37f2d71f9a3a@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0276.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::11) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|CY5PR12MB6527:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e77b61d-1dc1-4fec-e87b-08dac0be8440
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p1bF+TqR2ENJr/Uor5OGhk6zSJXRfDMNhBAGUpVQvBDYLum6gQmerUwqMoZFP0xNJxc0g4tCjtMqcwEFQS7x0bgUIseS1GzLGrB+1dpcYKX88gFZTNGY543rwh7XuEKnIl1yLmfkbhT0PplkQCkimBv7R91Fz9Jbzn73X1cRkyEIi1hGiPMDtoK6YhLjQCy4cSRnkI3wPdWawW4zvlZz+cwqi+aZoCBk/XY/xWPJXz/M+VPdSpWTKfz3eVLm6Q/NjNioQOhpPLmarlhgXrj3pnGA9+98Y8CS7A2IHnEdkbLBifwcbW3MQUY7aCrD1Rf3HyPimYFEbRDJ1xJtQ3DXa3QU7hmc2GslAWiOHCHo6D16wlAKV9NY02DM38+Abz1jwji9X0UKCDXQPfxIOP+dF+BGkHvFKs8yfMcTMlnu21rTBch9bV0bi2UwS2ZCDWS++/FpTlvPz3D+9LeGX8lN0dcFO1x00VJ1XI9humAOWNgMrV4dbqTk+70eo4/vUlsZI2X+wRbwdJnt6Vu9kCZiq1/YDqeizTnxKTGDsu0lXOl/Sx6MCyuwlbNp+Xuck+7JSCRkuOKdqXcCYDdol4NH0FLtIIGKbeq3w3RkEbOjVUupUOlWl+pxI7cGd9tILpxquQpHM1f4TEFZfYeh7oYyeCvSF/TXsemwGo1c/3YgZ+fQWAj9E/sbFD8mTT5kl4ASyklrwbGXzceke887TJ7bKTAOqdxdkhORj3VpqpEv+3DL5Fk/tnc9pjSkT9Vym5b7aRIp8StwG1GlDAHF+z2v5yAkHFoE8uxaJS2bhR1m1W8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(366004)(136003)(39860400002)(396003)(451199015)(6506007)(6666004)(53546011)(26005)(6512007)(186003)(2616005)(38100700002)(83380400001)(2906002)(8936002)(110136005)(6486002)(478600001)(316002)(4326008)(41300700001)(8676002)(5660300002)(66476007)(66946007)(66556008)(31696002)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OTJ3Z3REVnlQeEp3K0U2NHovUVpIdE9YamhlVmhkelRxR29wR1NkN3dmUTVW?=
 =?utf-8?B?U0RNckw2VXY0WnB0Z2N0RHpiUUw5Z3oxbzg1OExzR3RsVEpPZS9YMzVzaS9H?=
 =?utf-8?B?dHhkRGlpOEJhRTc5UXhqTmpDMUI3MGdTTmtwKy80c2E1ME1abThkTW5jL1M4?=
 =?utf-8?B?SjJ0SG9XbXVSZGJCcis4Ui9PZERpOGJRbm1IeXQ0VVZuUnZuTTJPVnNoZUVB?=
 =?utf-8?B?MWtrUWh2YUxFQ1pXWGxGakJ6ck5KeFVwbFNPZ21hZVJUMW5CN2NnUE01d05l?=
 =?utf-8?B?Q2M0Z1plRUM5eUo1VHRkMklmWTk4Z2ZXRDltUG5kNU9GNnJKeXlENlJCcll2?=
 =?utf-8?B?eXZmbDlSSmNUeEFsWGRzM3ZFSThBMUU3SzNJNWpJODh0Z0RybnFwMFo2S1Bi?=
 =?utf-8?B?TVVPdEo2WmErMGlPOExvRFZzOG1CVVcvRm1RMmR6ek9XTWpCMzQ4VUtILytL?=
 =?utf-8?B?KzZ4VDlwenhsS21ZK2lKbWptWmljN0lSd25Ca2d6ajQwb2RjWUlMdDVrMVlr?=
 =?utf-8?B?bGNia1lXS1Rld2wxM1dxdDZYTkUrd1BLUVpPTlorUHp2eXNjTXpFZjQ5WDg1?=
 =?utf-8?B?ODlaTXpobDZYRENFT1Bya0VmdHBIbitpQXFzT2RZYlJGQlNEVW1jZXpwZEVN?=
 =?utf-8?B?MGJmbXN5UGwvR3ByNmtac0FsTUZiU0k2d1hUTjMwVm9Icjc1N25weGk4U295?=
 =?utf-8?B?ajhuUVhEbHV2VmJMOHhBZE9jVnl6U2l2YUpBazJJVnFXZ3ZYT0NVckVxVHlp?=
 =?utf-8?B?V001QW1oRlhOL1phaFVkVHpBdHFEd2pyVy9HVGsyYU1qMUpoU094ZGc1NC9h?=
 =?utf-8?B?em5GNW52UFVMV0tNOXF2aWNCQjAzek1XUTJIUFhKMGMvUTcrdjB6VDg1MVBs?=
 =?utf-8?B?RVdhdFppMmNCSEdpMHA0aW1EY3dPcSthakd6U1ZOSmUxOU1FRWxVbFhWMFR1?=
 =?utf-8?B?T29qWkc3cmJYeXl2dmVsUlhuRVZmSit2Y0FrMTRZMSsveVRqWW85cjZiellz?=
 =?utf-8?B?eXhPYStZSExVVzBFaFlMNTgzTjBQM2JIajNkR1dnTXhwM2lOVHdDZU1iU1Iv?=
 =?utf-8?B?SGw5bGgvZG1jZGpIb05zRFVZdnc1RTJSclE2bGZEZ2JGSHBBVktRRXpJUytQ?=
 =?utf-8?B?NXNHc3NOYWoyVDAyZG5xdFhxWGtLSngvM0J5VFk5cWY2L2VaSXVwZ0I1NlVs?=
 =?utf-8?B?aGF2ZWlRTHZXMFJUcEh3VVBQRVRRYnFkSVdBUWMvSHlsTUJFV3FqK2lZcXpS?=
 =?utf-8?B?ZmlVUC84MnN3VVZmeG9COGt3Y1YyRUhaSnh1SE9NcWFwd3N1R056YXBDaHpx?=
 =?utf-8?B?amREd0FSRVBFM3M4OElOYSs2WmVnQU4xcGZLMGM0QnVTNjI2NEpEelpVbXdD?=
 =?utf-8?B?cTR4Q0F6RTVtVkNkUXdBOThpSUxKQkdKb0xDRnJ6STd0TGJqc1R1SlIyWFFs?=
 =?utf-8?B?NER1aExhTUpJTnFyL2NLdG55K3N0dDFZL29tMUpXQ2RIMGdoU0lBYitvVUVD?=
 =?utf-8?B?NEJxNHpxWW92aEl0MUhNdmxnVXdtZkVwRWh6SDZlWUNlalZGRGhlcXlTaGtX?=
 =?utf-8?B?cDgxY3RMTUJISmxYZC9DNXFudXdHZ0hQeTRsQkN2Wm5uM3FzNVpKWlU5T0ZN?=
 =?utf-8?B?eC9PL056Mk1SeVhBWVdCY3FqK2tjOGFhVEluOUUxQUxPenUrL2V4Qy94d2p1?=
 =?utf-8?B?Q1RVdE9kcThVdVhtYy9CalpHbjIxODJ5UVVSU0lISlNrcDMxa3VWYWZhQ2Fh?=
 =?utf-8?B?WW11LzRkMjRGajh6TFB6WVFPempNUDNidVV4SWdwSmRGams4R3lQMUxQbGdv?=
 =?utf-8?B?YWFnYVkvdVJWZXZlbzNZU25HZ21oNFgxeElLU2RWY0hudzNVMXk2NHcwR0hF?=
 =?utf-8?B?UlM4U3B3VGJ5L1RmMzJSZS95cXd2Nk9qZG9sZEg2bHV6QW9Vc1VQU0pKMU1o?=
 =?utf-8?B?bE5kbkFaZkxQQ1dhSTR6bnc5ZGl3L21DUnJWK1hDQkJFODVkWlRHUE5XZmk5?=
 =?utf-8?B?NlMwT2xhRVRhQVZxd2NNNVBXdFVCdEJyT3NCMUxGWmFMdDJEQkFsbnhMS0FV?=
 =?utf-8?B?dzQ3SjJuTk1zdUFFRGhKVUJVeTh0TGZFSlVTVktta1FtcjRUSlN5MEhibVE1?=
 =?utf-8?Q?HzZYIsM26V+ikBhQc9CE33S9a?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e77b61d-1dc1-4fec-e87b-08dac0be8440
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 12:49:32.3699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: szSp2wtex63f5Ow3zxb+KgEmf1fDIzEiRb3H3pF0Qxgs7vzj7Tef1Dm/j8DFy/IFpKOd5mkXOL2VPjw2Ug/AOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6527


On 07/11/2022 10:44, Julien Grall wrote:
> Hi Ayan,
Hi Julien,
>
> On 07/11/2022 10:36, Ayan Kumar Halder wrote:
>>
>> On 06/11/2022 17:54, Julien Grall wrote:
>>> Hi Ayan,
>>
>> Hi Julien,
>>
>> I need some clarification.
>>
>>>
>>> To me the title and the explaination below suggests...
>>>
>>> On 04/11/2022 16:23, Ayan Kumar Halder wrote:
>>>> From: Ayan Kumar Halder <ayankuma@amd.com>
>>>>
>>>> Refer ARM DDI 0487I.a ID081822, B2.2.1
>>>> "Requirements for single-copy atomicity
>>>>
>>>> - A read that is generated by a load instruction that loads a single
>>>> general-purpose register and is aligned to the size of the read in the
>>>> instruction is single-copy atomic.
>>>>
>>>> -A write that is generated by a store instruction that stores a single
>>>> general-purpose register and is aligned to the size of the write in 
>>>> the
>>>> instruction is single-copy atomic"
>>>>
>>>> On AArch32, the alignment check is enabled at boot time by setting 
>>>> HSCTLR.A bit.
>>>> ("HSCTLR, Hyp System Control Register").
>>>> However in AArch64, alignment check is not enabled at boot time.
>>>
>>> ... you want to enable the alignment check on AArch64 always. 
>>
>> I want to enable alignment check *only* for atomic access.
>>
>> May be I should remove this line --> "However in AArch64, alignment 
>> check is not enabled at boot time.".
>>
>>> However, this is not possible to do because memcpy() is using 
>>> unaligned access.
>> This is a non atomic access. So the commit does not apply here.
>
> Right, but your commit message refers to the alignment check on arm32. 
> You wrote too much for someone to wonder but not enough to explain why 
> we can't enable the alignment check on arm64.
>
>>>
>>> I think the commit message/title should clarify that the check is 
>>> *only* done during debug build. IOW, there are no enforcement in 
>>> producation build.
>>
>> AFAICS read_atomic()/write_atomic() is enabled during non debug 
>> builds (ie CONFIG_DEBUG=n) as well.
>
> My point was that ASSERT() is a NOP in production build. So you 
> effectively the enforcement happens only in debug build.
>
> IOW, unless you test exhaustively with a debug build, you may never 
> notice that the access was not atomic.

This makes sense.

Does the following commit message look better ?

xen/Arm: Enforce alignment check for atomic read/write

Refer ARM DDI 0487I.a ID081822, B2.2.1
"Requirements for single-copy atomicity

- A read that is generated by a load instruction that loads a single
general-purpose register and is aligned to the size of the read in the
instruction is single-copy atomic.

-A write that is generated by a store instruction that stores a single
general-purpose register and is aligned to the size of the write in the
instruction is single-copy atomic"

Thus, one needs to check for alignment when performing atomic operations.
However, as ASSERT() are disabled in production builds, so one needs to
run the debug builds to catch any unaligned access during atomic operations.
Enforcing alignment checks during production build has quite a high 
overhead.

On AArch32, the alignment check is enabled at boot time by setting 
HSCTLR.A bit.
("HSCTLR, Hyp System Control Register").
However, on AArch64, memcpy()/memset() may be used on 64bit unaligned 
addresses.
Thus, one does not wish to enable alignment check at boot time.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

I think I can keep R-b as there is no code change ?

- Ayan

>
> Cheers,
>

