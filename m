Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46560620CA4
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 10:48:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439821.693896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osLDf-0007hs-HH; Tue, 08 Nov 2022 09:48:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439821.693896; Tue, 08 Nov 2022 09:48:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osLDf-0007fM-DO; Tue, 08 Nov 2022 09:48:35 +0000
Received: by outflank-mailman (input) for mailman id 439821;
 Tue, 08 Nov 2022 09:48:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nxm+=3I=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1osLDe-0007fG-7G
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 09:48:34 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2057.outbound.protection.outlook.com [40.107.95.57])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 810cd03d-5f4a-11ed-8fd1-01056ac49cbb;
 Tue, 08 Nov 2022 10:48:32 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by MW3PR12MB4556.namprd12.prod.outlook.com (2603:10b6:303:52::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Tue, 8 Nov
 2022 09:48:28 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2%7]) with mapi id 15.20.5791.026; Tue, 8 Nov 2022
 09:48:27 +0000
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
X-Inumbo-ID: 810cd03d-5f4a-11ed-8fd1-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P4WgI+C7toWgZGHeDXO0Yhemqx9kmS75ePyzVrPGzYWSYHZ7osBT4P0s34qJYkY5UQdBQo+wmKUCYz+gKiWbLKwYSU8L0ZNpmukGoxcNDm652NoHcrMng51qLHVA03xBKYh5GzH7VdsxOtLA2g9UhB4qqFMeKjVDlIhIXEqVYY2c7gN7xt0fmU3Th12t0pcC84D5vUXJ1jTqeZ3Yc+WGHTQI5CTNmjW6bHM95LI49V8mq6VbYcMeAZ2bSaLg6pXpJ4GsWNwMjwvVXsO5uR6hyyK8j4DIKJ/7MXQ3UKBEY8Tfv0nYA0JMQ++FOQix5JK0xWfmAJWhm+nRWdWAZdnA/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aZHuaY6YEGRIHh0N1jse2Emh590S4dEyCSej+mYQC6M=;
 b=jqjDmYjaXMK4VEdTGQnDCAowtUhCbQLQAjujJG3nVKdBjNrq40gkcKMIFUc+ZMfAhDWF60ZzktPmHlnczRHRoqRskAqaNlnfR5aUNamzDnVWEOqhGQvcPgDglDBVCxolVbh3gYk7QshuUeLHf0y1MR5YSJ+KMxh+/SHQXS8pfeZ0y3DEYlbPFfTVUjd7V9vAafNkRaLzewpcfWBfX6UG47klqaeiH3hyB5qAuWT/rEH2b8JLZXAB8laE6xB4Lh7SIbDSwoEXa+vJkRzQAv52yVzv1Fa++QnCFjkWFFoXay9xTdNYWnVk9PRcXsS6DedfxkbesREh6sW7alFiAL6n2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZHuaY6YEGRIHh0N1jse2Emh590S4dEyCSej+mYQC6M=;
 b=ylgEIM9WjphiPyzofA+Q55UjrLVbKVQNRc9p586YDEfikhf2/VR3XSO5Mp3Xcmi3xAiYYHk46XLMvcscgX2WL+XFGmyc7ZrgcP38as78lp0oMs4Fen/vzDTgO7qgK0VpPaQO2a7eRpGq0jYmfceKVdPKn3klcNhLbUBFtNk0ms8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <31497aff-5b94-3df8-9c15-7340cf6a46b5@amd.com>
Date: Tue, 8 Nov 2022 09:48:21 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [XEN v2] xen/Arm: Enforce alignment check for atomic read/write
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
Cc: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "stefanos@xilinx.com" <stefanos@xilinx.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
References: <20221104162355.23369-1-ayan.kumar.halder@amd.com>
 <062c9507-7744-0742-effb-76d2f1222a27@xen.org>
 <33a2d125-b7f2-3637-9dab-6b7d616fd4ff@amd.com>
 <b17653b6-e4e7-8f5b-647e-37f2d71f9a3a@xen.org>
 <36e84512-9b44-303e-2834-5aafe9c6cc15@amd.com>
 <74b1c6af-d6de-2728-9d59-2d561a521793@xen.org>
 <3720a691-3303-a673-58b6-95da9a4341d2@amd.com>
 <211D65B7-2CCD-4BDD-A9A3-FF4DF9D562AC@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <211D65B7-2CCD-4BDD-A9A3-FF4DF9D562AC@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0273.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::21) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|MW3PR12MB4556:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ceff707-425a-4f96-1b02-08dac16e62cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eDBvQJuxzF1slrimXlzIA0aW4/sFiI1j0K41N4WhJe8C9refoAw2y4/qb0fracVwrp8PBEgQTst0FjzzuK/CVzONtD/UeRADLNTqFjLPsT66nSVY+v5wp56BydALRb6eJXvZMsF7Tt3dxl2/i6KWqkXZA2PixaJJMOz46kfJnQQ73gLkm1ICGFQBN0Q/Vv7QFGKEzqyUo8ZR3xmp7HITRDxQlGebu8bueEdlQALGIB+xHeT9Kod5gn9sPzNzqRb6B4MkUHBPzZ2+dYjdR5rR9OxZQ0AejyKa1R0Uv1FQCqzeUGlZZlLjXZoRlN/PIUc99IQaOlqQxrzKAURzdqDVJZSq78IbQ3xO3E3kjVk8wwHS55rwiwo5E0/v6mYC8DUi6sAox7wM2LENXUHXKZ0gCwSZmYYxTLCZfvIiWZHNeZquxlyOBFmoEKMw/qw44qqJ+I8PWNQLNY6k1dWeZnFFEoG5aJmi3VUdITqd0tNwAZETjb0CX92/Slui++Yr6TFjhbnYROv6JZ/MsH+FlqpSWGf/w2SuPhPhNe20wjo1tH0ug+Nsq+9tyySASUb4iTTu+ZIBijyISu/x7ON57iUEGWzM9LufBVT4MSzObwQI4m+c9mgxnhZgZ41LhIb2SS7cDFqGPF+BBwY3wNSnGZdw8tM9xau1QIJ4OdgiSbTjmpxFAV7odjfxG9JvDu1xbiMCLi/R9uW/BNNY/akfbLl8Ga34+aI63UaavwleSE7CMajO92IXvN87UxPTotlA6RuaPisloLEN9TTcspSMYr3mgNt6VvRC7bXd5Q29BQKjAKA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(451199015)(41300700001)(83380400001)(8936002)(6636002)(186003)(316002)(54906003)(110136005)(36756003)(8676002)(66556008)(2616005)(66476007)(38100700002)(66946007)(4326008)(5660300002)(2906002)(31696002)(6506007)(31686004)(6666004)(53546011)(478600001)(6486002)(26005)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Lzg3MFZwM2V5bjA2cjdRNzcxbFYza2ZjaXcvdzRvVXV4dlpMa3F2MzVRMFJD?=
 =?utf-8?B?cHVCUm11a2lteVZ5QU44ckVPMjZwSG1sR1g0QTA0Mjdud2dIbXNtU2VVN3lu?=
 =?utf-8?B?eHlDcGdLZUkrUytmNVBKUDV1eWpHUUhjRTJ3Zm52bXhuenBGaFpUbTJmcDNE?=
 =?utf-8?B?Y0RxU2RWYTB0cU1xR3BPR0FTb1hOMEd1aXM1UjN4clNSeS9pRUE0c3gxbG1n?=
 =?utf-8?B?WVhPZXBNNkoxOEpMUWJ5c1ZwTUM5U0dIcGlISnlSNWlIM2txSm1qOGQ5Z2NL?=
 =?utf-8?B?UFJrOFdpL2g0QzMrSmV0b3k3cElKcXpIZEoxdEdOaTZFNmlKY0FqK1A2ZUE0?=
 =?utf-8?B?Q0t4VUpIUWplT1dNbkx5MUptL3FDNXVKTDhJei80ckZBemt0MU9UVTQ2L0c1?=
 =?utf-8?B?c3dXRVhYM1ZWc2tXVWpsZjVMOGFhSXRjYThmeVRmUHltNnlJS1JERENTNG90?=
 =?utf-8?B?MEVVbktGK2NWL0hZUGwvcmpwZllKby96RGhqUEhjVXNneWJIYzJGSWxQeU1k?=
 =?utf-8?B?MU0yOWJtQnMzaDZjS2U3cUxTYVRYTTg1cEtsZTNVS1V2YnBrWk5qcjJoM3JF?=
 =?utf-8?B?L1pobU1UUGZ6TGYwMkZBaTY1VGZmUjRNRUEyZ1A4eTFrRTB4R0ZOdm1HaEt3?=
 =?utf-8?B?TG1NTjJqVURKRUdpVVFCQjI2K2V4OWt3MVkycDNnTWdFL2VoL2ZoaGpuUnFO?=
 =?utf-8?B?WlBFWWhVeUVRL3JOTjU4bXJRZkNtTXV0M2Z1cUZ6dlA2L21LUnQwd0FFeDJp?=
 =?utf-8?B?dEFrZWtSeW0zYThKaEZwMnhRN2ZyUjcvZ3RDSm8rTUJrMHpLdFdwSXRKUEFS?=
 =?utf-8?B?M1MyZnRBNkQrZno1Z1JjUHpKZXY3anVXcURlTVRSVi9XeEt5emwxTEpER3do?=
 =?utf-8?B?TWszbGVsZEZjTHhWRmJBNW1DdkVPUjdaRi9qUVNIN2c3YVpBUVFlaWZOUDFs?=
 =?utf-8?B?T0NwYi9tVDlYUG1Ua0RIY0pmNXhGL0FhNzJieWVnMTIxZEpOdi9NaG14VXlP?=
 =?utf-8?B?Y1JRUDRXZ2pGQXhacVRRWDhMOGdjNms4aEpXUU0xOXJMQlIvSmVJZkl5Z2tx?=
 =?utf-8?B?MmpQWWxFQktNUldIN2tISXFEVEZmZmlheXE0N0ducmtmWjc2UTNyTlVXQUVm?=
 =?utf-8?B?dkhrTVgxN083RGJsYUlrVC9GZHBOK21zTVcxbU1zbk41TW5nN3ZlQm1FOXha?=
 =?utf-8?B?aXlYVWxvNm1NWHVTZ2VHZVFDSDZJeU1aUXR1VXBSQ002VGltUHhhd2lHQ283?=
 =?utf-8?B?Q1I2a21uclp2NGxTbXJVSjc4YWp2ZmQ0VFpRVjhkMmkzS3p5ZVVCY1lySzFp?=
 =?utf-8?B?WmVaYm9OSjZvK1FTbEp2bDJUeVIxbWVlOHFWanlaVjBSSnpRWkFQNWJlLzBu?=
 =?utf-8?B?bW1hYTBpWFFWMVg5ZzBxd0lBRkk3a1JZdFJPbDZsd0IwYkozT040ZDcxNU81?=
 =?utf-8?B?Q3FkWjYxVU1KZjh1ZkZhT29KcGFuVzh3TGVQQ3hLQ1pNaHYvTHdMNFIyM04w?=
 =?utf-8?B?NElkN0h2bGJMaVZESDZSOWx4bDR2VURoQmd5Z0ZnS0NvZGhUcGdGUTBUd0x3?=
 =?utf-8?B?WmtpT2l3R0RlWXB6bWR0UDV4eUZrOXhnV1BQTEJSd04xbEdnNUEzVE03bkdH?=
 =?utf-8?B?SXl3aXNmWXlicUZJT0liQVRJWDJCai9VTXBET2dsN1BLSkZFdUQ4TjV6Nmw4?=
 =?utf-8?B?TVBnWURCRkZLRTd4eGhNKzM5R1E3b3JLU0Uzek5wZzdheEhkUVUvclFwOTFO?=
 =?utf-8?B?eFRsdERUb1gwZGxMTU9CQnVmWlhsbEhIQkkycVFzTlFQUnFJNHd3cHVQSDdC?=
 =?utf-8?B?MVM4ZXdDRmc2ZVFaaXJpOHpyMVRJZ0ZROHZENURYc1o5QTBtYlBZVVZhSzdD?=
 =?utf-8?B?eFRSOFhsVTJzeG5BV3R6amgxWjFQTjUvNi9qTFE2T0piUUhKUG80K0psa3dm?=
 =?utf-8?B?RkdQc1pvdC9jWmVvN1AwMXhtYmlnU1FQWXZOb1JQUTVMZ3U4OHdhZk01YmNW?=
 =?utf-8?B?c0VNTnpmOUcwTEZvY25CR3UwcGJDcmVaZWdVUkZrRHc3NnBRMDdIaFRlQ1JU?=
 =?utf-8?B?bmlGNCtuOFJhVHY2bFlQZlJSUWY1RHdsclZpZXpzTVl6WkVKNVNPWThsc0d0?=
 =?utf-8?Q?OUGYeGacn/DixRJKmWnLeUlGA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ceff707-425a-4f96-1b02-08dac16e62cf
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 09:48:27.6993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 893IS4QRqDwUtVVvO9gIndpaeDkAfSXbfhosJarWK6cbjZ4iLSGzhqIjroUqb982K6fbJzYewS4THTRT+FyEIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4556


On 08/11/2022 08:34, Bertrand Marquis wrote:
> Hi,
Hi Julien/Bertrand/Michal,
>
>> On 8 Nov 2022, at 07:26, Michal Orzel <michal.orzel@amd.com> wrote:
>>
>> Hi Julien,
>>
>> On 07/11/2022 19:06, Julien Grall wrote:
>>>
>>> Hi Ayan,
>>>
>>> On 07/11/2022 12:49, Ayan Kumar Halder wrote:
>>>> On 07/11/2022 10:44, Julien Grall wrote:
>>>>> Hi Ayan,
>>>> Hi Julien,
>>>>> On 07/11/2022 10:36, Ayan Kumar Halder wrote:
>>>>>> On 06/11/2022 17:54, Julien Grall wrote:
>>>>>>> Hi Ayan,
>>>>>> Hi Julien,
>>>>>>
>>>>>> I need some clarification.
>>>>>>
>>>>>>> To me the title and the explaination below suggests...
>>>>>>>
>>>>>>> On 04/11/2022 16:23, Ayan Kumar Halder wrote:
>>>>>>>> From: Ayan Kumar Halder <ayankuma@amd.com>
>>>>>>>>
>>>>>>>> Refer ARM DDI 0487I.a ID081822, B2.2.1
>>>>>>>> "Requirements for single-copy atomicity
>>>>>>>>
>>>>>>>> - A read that is generated by a load instruction that loads a single
>>>>>>>> general-purpose register and is aligned to the size of the read in the
>>>>>>>> instruction is single-copy atomic.
>>>>>>>>
>>>>>>>> -A write that is generated by a store instruction that stores a single
>>>>>>>> general-purpose register and is aligned to the size of the write in
>>>>>>>> the
>>>>>>>> instruction is single-copy atomic"
>>>>>>>>
>>>>>>>> On AArch32, the alignment check is enabled at boot time by setting
>>>>>>>> HSCTLR.A bit.
>>>>>>>> ("HSCTLR, Hyp System Control Register").
>>>>>>>> However in AArch64, alignment check is not enabled at boot time.
>>>>>>> ... you want to enable the alignment check on AArch64 always.
>>>>>> I want to enable alignment check *only* for atomic access.
>>>>>>
>>>>>> May be I should remove this line --> "However in AArch64, alignment
>>>>>> check is not enabled at boot time.".
>>>>>>
>>>>>>> However, this is not possible to do because memcpy() is using
>>>>>>> unaligned access.
>>>>>> This is a non atomic access. So the commit does not apply here.
>>>>> Right, but your commit message refers to the alignment check on arm32.
>>>>> You wrote too much for someone to wonder but not enough to explain why
>>>>> we can't enable the alignment check on arm64.
>>>>>
>>>>>>> I think the commit message/title should clarify that the check is
>>>>>>> *only* done during debug build. IOW, there are no enforcement in
>>>>>>> producation build.
>>>>>> AFAICS read_atomic()/write_atomic() is enabled during non debug
>>>>>> builds (ie CONFIG_DEBUG=n) as well.
>>>>> My point was that ASSERT() is a NOP in production build. So you
>>>>> effectively the enforcement happens only in debug build.
>>>>>
>>>>> IOW, unless you test exhaustively with a debug build, you may never
>>>>> notice that the access was not atomic.
>>>> This makes sense.
>>>>
>>>> Does the following commit message look better ?
>>>>
>>>> xen/Arm: Enforce alignment check for atomic read/write
>>> title:
>>>
>>> xen/arm: Enforce alignment check in debug build for {read, write}_atomic
>>>
>>>> Refer ARM DDI 0487I.a ID081822, B2.2.1
>>>> "Requirements for single-copy atomicity
>>>>
>>>> - A read that is generated by a load instruction that loads a single
>>>> general-purpose register and is aligned to the size of the read in the
>>>> instruction is single-copy atomic.
>>>>
>>>> -A write that is generated by a store instruction that stores a single
>>>> general-purpose register and is aligned to the size of the write in the
>>>> instruction is single-copy atomic"
>>>>
>>>> Thus, one needs to check for alignment when performing atomic operations.
>>>> However, as ASSERT() are disabled in production builds, so one needs to
>>> This seems to be a bit out of context because you don't really explain
>>> that ASSERT() would be used. Also...
>>>
>>>> run the debug builds to catch any unaligned access during atomic
>>>> operations.
>>>> Enforcing alignment checks during production build has quite a high
>>>> overhead.
>>>>
>>>> On AArch32, the alignment check is enabled at boot time by setting
>>>> HSCTLR.A bit.
>>>> ("HSCTLR, Hyp System Control Register").
>>>> However, on AArch64, memcpy()/memset() may be used on 64bit unaligned
>>>> addresses.
>>>> Thus, one does not wish to enable alignment check at boot time.
>>> ... to me this paragraph should be first because this explained why we
>>> can't check in production. So how about the following commit message:
>>>
>>> "
>>> xen/arm: Enforce alignment check in debug build for {read, write}_atomic
>>>
>>> Xen provides helper to atomically read/write memory (see {read,
>>> write}_atomic()). Those helpers can only work if the address is aligned
>>> to the size of the access (see B2.2.1 ARM DDI 08476I.a).
>>>
>>> On Arm32, the alignment is already enforced by the processor because
>>> HSCTLR.A bit is set (it enforce alignment for every access). For Arm64,
>>> this bit is not set because memcpy()/memset() can use unaligned access
>>> for performance reason (the implementation is taken from the Cortex
>>> library).
>>>
>>> To avoid any overhead in production build, the alignment will only be
>>> checked using an ASSERT. Note that it might be possible to do it in
>>> production build using the acquire/exclusive version of load/store. But
>>> this is left to a follow-up (if wanted).
>>> "
>> This reads very well.
>>
>>> While trying to find a justification for the debug version. I was
>>> wondering whether we could actually use the acquire or exclusive
>>> version. I am not entirely sure about the overhead.
>>>
>>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>>>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>>>
>>>> I think I can keep R-b as there is no code change ?
>>> My signed-off-by will need to be added for the commit message I proposed
>>> above. So I would like Bertrand/Michal to confirm they are happy with it
>>> (I don't usually add my reviewed-by/acked-by for patch where my
>>> signed-off-by is added).
>>>
>> You can keep my Rb and Bertrand or Stefano can ack it, so that we can avoid
>> acking a patch by one of the authors.
> I will check and ack the v3 once out.

Many thanks for this.

I have sent out "[XEN v3] xen/arm: Enforce alignment check in debug 
build for {read, write}_atomic"

- Ayan

>
> Cheers
> Bertrand
>
>>> Cheers,
>>>
>>> --
>>> Julien Grall
>> ~Michal

