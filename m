Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AFF60B57D
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 20:29:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429342.680313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1on2Bw-0004p7-Ah; Mon, 24 Oct 2022 18:28:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429342.680313; Mon, 24 Oct 2022 18:28:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1on2Bw-0004mF-7V; Mon, 24 Oct 2022 18:28:52 +0000
Received: by outflank-mailman (input) for mailman id 429342;
 Mon, 24 Oct 2022 18:28:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZViS=2Z=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1on2Bu-0004m9-Nc
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 18:28:50 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2048.outbound.protection.outlook.com [40.107.96.48])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b376bd83-53c9-11ed-91b5-6bf2151ebd3b;
 Mon, 24 Oct 2022 20:28:49 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DM6PR12MB4561.namprd12.prod.outlook.com (2603:10b6:5:2ac::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Mon, 24 Oct
 2022 18:28:44 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2%7]) with mapi id 15.20.5746.026; Mon, 24 Oct 2022
 18:28:44 +0000
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
X-Inumbo-ID: b376bd83-53c9-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VPNePxQA4cOTUo728MT7/hQl5lVXaD6BNj3yhlusRDe5xoIUCGcHC6qGNuBA3WQ9UrzID2004YdkkxguTfGNh5ApslMXgt4+j3VpTdqNzJdwECe1FyFs5s4SrH54AhYA8JAL4dLelBcJmpL3TfVeXVCMmczDgXqmmuTPDx5btARhmaNs+DpRnDDGHOfBm1Qx2PMiFJ+pUlU/P3nl3ewbCLytPuRZ2bLXx7fuNKHGkMyfe9SaP0m98VbKgIS3F+OMYaBqHUy2QlejStvr9HnUlrj1Njnps36ma4KsUI3Rgq+UtD4+8FRVTLXJPssC3M2nhYB1+fKL77YHUOi9RKjAyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ipa5zbm/riYkk9XDmnfmhMaJUxeYgVAjYPpTlvYMJho=;
 b=Ruchb+rBlrpZeVC1fw5vqTBCeKZ6E4qmsgVcbdN/3RhRhqQMVYyhfR+8FXRLcwTZod/uLm0yhaQH4xW2clU7cOW2G5Po+k/2qMr8bUyyOS9VdaOJYFvDppwS96X198EgtfAyspbWQK35bO9/nt7qxP/T641kt9w5v459toaMphqPfsxyn33z/Opm6nEGMvlrtO90TmWYVg9NbkZyJnkk2kFnqziXkb3dTdiIpU8Y8/5Bhia8TtVmzNMEbX2RQAE49CRUrjLJSeYV+mMm2Y4lh1hTaOxDfCRAW2+E8G0J2QM+Ohd4dVjHDRzaTr34eRXyqkw7EBWIvRfwTgelDM9jRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ipa5zbm/riYkk9XDmnfmhMaJUxeYgVAjYPpTlvYMJho=;
 b=ndIxmnw4FG2a+XEORlejAZAUl8F64Y9QT4v3K9oIZJKZYoqX0JG3bowlnmRFv3byGJatKTLxFOxM4EtWjQ3Bbnsg2HJ8/LwME9F5kSoS7Q0ri7JwgJrdDurXeaq9L/9z2ym7wsXKGIEdTSmxwygLc85X69f84d7mdaJpqMQIdII=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <3c37a51f-5286-ea84-8497-4b1f25014c04@amd.com>
Date: Mon, 24 Oct 2022 19:28:38 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [XEN v2] GICv3: Emulate GICD_IGRPMODR as RAZ / WI
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "stefanos@xilinx.com" <stefanos@xilinx.com>, "julien@xen.org"
 <julien@xen.org>, "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
References: <20221020104146.29841-1-ayankuma@amd.com>
 <AE2C68A9-4276-444C-B227-F079D330EB8A@arm.com>
 <ba43677f-903b-f30c-76e4-1668cdab2cc2@amd.com>
 <F8CD5734-B62A-403E-B888-AA24053A9F03@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <F8CD5734-B62A-403E-B888-AA24053A9F03@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0661.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::15) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|DM6PR12MB4561:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b9da197-6563-4bed-66e3-08dab5ed955c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nC9MF5cmRdGVUD46hWuzvUxvAO7gu8uxx5YGiWs5FcslFIkLSL1V4XVygBu9oPMHQrvCrGRMslZDtjVM8nNGEWPXw2nquRk14Wpy7JQ7RewEngh1PftO7lVbJp/N2H7UMqhevSaEA6hejbksf2Y9nBMHVpmVkg/k//gRhnRMvrRbJcWTTsWdssjCJ04UcFNM9H1PO2rHDOV8v3WZVZBu/DuoPfntz3MnjwXUOTduQKExZf6/Mig5gpmFGHNAteMqLihY3tD1xCTXFNkNdInj30UWvAsGCfveXY+A41EM6UKTHQSK4m6fmglH+YV0QHhrxyT/v2FRFpdlNoYiM5K6Mz+aL31n5equsLDnc5Ge2e/duRS4IctZTs2+KVUps6ruNLfO1TZPcWSJFJ+bCA75KIk5gtHnjyhKIvqCgn37eyOcEh0AnXMqYAkMLdrVp+pJzHA4jnsoyEtvt1H7TGCRkju6nYNTBiSnEvnzU/YgKskjY1YxmxrsBI3NAYHTGoRUmqBaKnOxIZ8Z4ACVhGWCvPyrucG3BFiRk0Np/JTI0DSi/rL5Q2t4jahKKs/TFAm9a69jlMcqnIM/NVrXybJ4wPZvBZ5nz7kgCOy5liPD+1EfDsc8Pr/I7g+D0KwAOvIG3oB1AryCc+T7rpFiC86/1xwa3avzXiNcPsYwDGUfZW6kGqmK3epWrsjQYgglw/xgnxhBg1lawXz8fptxWrMfTyTHt8QAcTiLkrzXda3Zrc21fm8X9+mZfaPdFxuaFLZbJjFgeCY5FG9y6/FenBhH0xM6W3rvakJr0mIoW3aWEG2JD4G7gph9MUqqGXnzEujf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(346002)(376002)(366004)(39860400002)(451199015)(2906002)(6512007)(8936002)(53546011)(6916009)(5660300002)(2616005)(26005)(54906003)(41300700001)(316002)(36756003)(6666004)(186003)(31686004)(6486002)(966005)(31696002)(83380400001)(478600001)(6506007)(66946007)(66556008)(66476007)(4326008)(38100700002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDdFZElnMWI4eFZNSTRlYnNaVnUzTTBreGVtR3pBeXhCald1M2UvanpUVTBr?=
 =?utf-8?B?cG5tY1dlbnFQR1NhWlRySVFtSFdCWk9hYlhGSHlSV09aeFM3akp3YzZ5eVdF?=
 =?utf-8?B?dUdTQVBBekNyQnpESlJReUtOOHl1akxSLzV2TlpLS0tNK3VZVnU1SUFrOHE4?=
 =?utf-8?B?SGwwdzQvNWVMQVZEREZTWG9hVWRxSENuQlFhMU81a1RRdGUxMmpZNDdZeGJr?=
 =?utf-8?B?Q2RZbHRRbnBuckNsb2RRTkhVRU1pNzdKbUlWbDRRZWE5R3VKMFphcXhRMEQ4?=
 =?utf-8?B?QlBSN1BmdmlHU1JMM1JjdmFTVWVDWWFlL0RpVzQyLzJ5Vm0zZWxnbUh5NGIy?=
 =?utf-8?B?a0ZPWDdoUE94U0ZxSWRXelJKWG96bGdQNmhjUFlLa2NCcDg3bnBIVTBBOXlO?=
 =?utf-8?B?cU9KbVRjU0tZNzlBMGR5cXYzblZkM0pML0dqNmxLN0lvdC9XaWVCb0NHYjFX?=
 =?utf-8?B?UmUrUEJWWDMvb3ZDaVdIUFJIR2lqbm12NmtzWVc5RG9ZcUhnZFpqWk11VW9I?=
 =?utf-8?B?YWpSeWRCYkZEbHNlNjBOTzJrZDQxQ2I0SnZpcko0b1lUbXQ3S1JMZ0hYbE9S?=
 =?utf-8?B?U1hOd2piNWV3cXRpWDhyZWMveUtYWHFuVUtOZE9Jb0JRMmljYjhkQ2ZYQnly?=
 =?utf-8?B?bklQMWJKMUtLVlo0L2hhWUJHZ1JKVW9VZE01NkdCYUZEdVR4WDhPdUozRy83?=
 =?utf-8?B?K1VkYkZGSWRHU2tORFdjcHU3a3pMZERwZWpGcjNQT2h2dkEyck11YWlWdFdR?=
 =?utf-8?B?dndXWVYvdS9pVllrVFppMStwaVc3K0JsSUtoSTJ4ZFB3d3hiR0pXcmNkcHlF?=
 =?utf-8?B?SUFRZTdqR29KblhOT3ZKUGQ1ZXplN2s3TVdvY011bFZrYVFtVHJZcDc4dE45?=
 =?utf-8?B?TDhzOXhYZFdyUU9NU2pvNDBSOEdKY3YxY3h1cEdMZTg2YXBQQS9oV1N5K240?=
 =?utf-8?B?elBJaGc1Zm5rSXFpVXZzRSt6MFdkc21Wb09UczkxUWFJd0toSWFjKzdrMG4v?=
 =?utf-8?B?ckQ4cXBCR2gyL3k5Y21LbXA0RDZReUpkMzJPWi94emVNK1Vrb1R6SEVhTTZo?=
 =?utf-8?B?R0ZHTnUrNmx1Z0owaDAwc2pJdUNyTXhWMUhEWGFneUNDb29tSnYxcis1aXFN?=
 =?utf-8?B?cTErdnlTYStPaXRZR012NmdhQXBuTHdlZCthQmtJd2szV0owdmpKeFZHczh6?=
 =?utf-8?B?Y0piaUJHaTN6MVpGVEtiWEdQWkUxRDB1bWx3cmFzcmtoTkw3QmdJenlMdm9B?=
 =?utf-8?B?R3A5Q0JVOXV3REMvTUFGMlBZS3oyVUQ2SGlTMGJXOERBTmFvZGE2UThIN2d1?=
 =?utf-8?B?d0RJRURSb3M2eXo2RVlvaW9PRTRwQ3pWTFFLTkRONENwUHBnZEdJbkZjdnB0?=
 =?utf-8?B?VVhqSDNPZG5MMHYwN1JSeVkvUU1JdGw0REVsc2N4dHNodjJaK3JzNlhMR3RM?=
 =?utf-8?B?VmJLa1d0R0d1bnB6ZVNVdUZQVVdtR3FRTkxpWmlicGlycUFhVi9McEN6cnVH?=
 =?utf-8?B?UHkvOGJDQWJWemliVjJzYWZrZCtCNVFabXdkUis3YW0zUTFVa2xRVzhsVDZy?=
 =?utf-8?B?Z3NwVENqS0NMUGNiNXNmTDNsNHhIYUxTVGp3MHRhRHd6OUZwOVVUa0F5L1BJ?=
 =?utf-8?B?aG5EUlRGYlNPWDhkZ3VWRjJRaUYwYWhoQWVCVTRKZDFJbS8zTnN0SXpiNTRQ?=
 =?utf-8?B?NSs4ZDdKbmZMTWFpYmJEWVFLQVVja1Y5Qzd6RzRqNlZvRE9KMFNGc1VPQ0Q4?=
 =?utf-8?B?OTlGWUhIZy9MYjFNU0hjeVpXVkJ0cko2bGpCamhBZE9pZnltMUYyNHhrNzVE?=
 =?utf-8?B?YXVFWGtSNVVTbzNBSWFkRWZmczVsQzc1eFlLOGZQTVNBd0xmNXFvRXVxdHQv?=
 =?utf-8?B?dGVQNjdBcWY2ckE5RkVDTjBtT2JyWGw0TlVjSUs1ZitKaUF6VURYa0RDRzhw?=
 =?utf-8?B?NnZkdEpsWDhieWRJUEZza0poejlQNjljc1J2SWRaWXlsUjluNnBBYkZYd2py?=
 =?utf-8?B?Tmp1YWl0bk55VUpPN2tDb0xpc3VDb1NoOStzZm9qa01KaE1YMTV3TkVoQk5v?=
 =?utf-8?B?SjYzYW1rMXlaVFVZVWRiZ2FNNVhsR1VmWmRMcnlzMG90eG1sR0FkdDVrMVdj?=
 =?utf-8?Q?Un0MtHxB9BA8q4dszPHao+XTX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b9da197-6563-4bed-66e3-08dab5ed955c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 18:28:44.6583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z/3Hz7PeEpJL8w3JdR3h+gXq/BNwQho11rXSpdFTsWM7pD2ZreSgZwWx6Fw9SOKpSvEte4gOGs2Jc+ZIxv460Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4561


On 24/10/2022 14:22, Bertrand Marquis wrote:
> Hi Ayan,
Hi Bertrand,
>
>> On 24 Oct 2022, at 14:11, Ayan Kumar Halder <ayankuma@amd.com> wrote:
>>
>>
>> On 24/10/2022 11:06, Bertrand Marquis wrote:
>>> Hi Ayan,
>> Hi Bertrand,
>>>> On 20 Oct 2022, at 11:41, Ayan Kumar Halder <ayankuma@amd.com> wrote:
>>>>
>>>> Refer GIC v3 specification (Arm IHI 0069H ID020922), IGRPMODR (similar to
>>>> IGROUPR) is relevant only when the guests run in secure/non-secure mode.
>>> This sentence is a bit misleading as guests are always running in either secure or non-secure.
>> Oh, my understanding from the comment "We do not implement security extensions for guests" is that Xen does not allow guests to run in secure mode.
>>
>> Also, does Xen itself ever run in secure mode ? I thought it was no.
>>
>>  From https://wiki.xenproject.org/wiki/Xen_ARM_with_Virtualization_Extensions
>>
>> "The primary requirement is that the hypervisor must be launched in Non-Secure Hypervisor mode only."
> For a long time there was no EL2 in secure mode so that was not even possible.
> This has been introduced in the past year but nobody ever tested that apart from the work on R82 and R52.
>
> So for now, Xen must be launched in non secure mode, any other setup is unsupported (might work though).
>
>>> We should just say that we do not want guest to change the group of interrupts so we do as if all guests are running in non-secure.
>>>
>>>> As Xen does not implement security extensions for guests, so the registers
>>>> are emulated as read as zero/write ignore.
>>> I would rephrase this as “Xen does support to run in secure mode so emulate all registers as the hardware does in non-secure.”
>> Do you mean ?
>>
>> " Xen does *not* support *guests* to run in secure mode so emulate all registers as the hardware does in non-secure."
> A guest is always running in the same mode as Xen.
>
> There is a question for guest running in secure mode when (if) Xen will run in secure mode: what rights can we give to guest ?
>  From the theory point of view, it does not make sense for a guest to play with the groups I think, as interrupt management is to be done by Xen.
>
> So I think it makes sense to say that those hardware registers are not accessible to Xen guests as Xen will have to be the one programming interrupt to be fired in secure or non secure world.

Many thanks for the explanation. It makes sense.

I have sent out "[XEN v3 01/13] GICv3: Emulate GICD_IGRPMODR as RAZ / 
WI" with the updated commit message.

- Ayan

>
> Cheers
> Bertrand
>
>> - Ayan
>>
>>> On a side note, the question might come at some point if we support to run from secure mode on hardware supporting it, it could be that dom0 or Xen itself would need to modify those.
>>>
>>> The code is ok, just the commit message would need a bit of rework I think.
>>>
>>> Cheers
>>> Bertrand
>>>
>>>> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
>>>> ---
>>>>
>>>> Observed the issue while running Zephyr on R52.
>>>> Also, found that KVM has similar behaviour.
>>>>
>>>> Changes from:-
>>>> v1 - Moved the definitions of GICD_IGRPMODR, GICD_IGRPMODRN to gic_v3
>>>> specific header.
>>>>
>>>> xen/arch/arm/include/asm/gic_v3_defs.h | 2 ++
>>>> xen/arch/arm/vgic-v3.c                 | 4 ++++
>>>> 2 files changed, 6 insertions(+)
>>>>
>>>> diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/asm/gic_v3_defs.h
>>>> index 34ed5f857d..728e28d5e5 100644
>>>> --- a/xen/arch/arm/include/asm/gic_v3_defs.h
>>>> +++ b/xen/arch/arm/include/asm/gic_v3_defs.h
>>>> @@ -30,6 +30,8 @@
>>>> #define GICD_CLRSPI_NSR              (0x048)
>>>> #define GICD_SETSPI_SR               (0x050)
>>>> #define GICD_CLRSPI_SR               (0x058)
>>>> +#define GICD_IGRPMODR                (0xD00)
>>>> +#define GICD_IGRPMODRN               (0xD7C)
>>>> #define GICD_IROUTER                 (0x6000)
>>>> #define GICD_IROUTER32               (0x6100)
>>>> #define GICD_IROUTER1019             (0x7FD8)
>>>> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
>>>> index 7fb99a9ff2..0c23f6df9d 100644
>>>> --- a/xen/arch/arm/vgic-v3.c
>>>> +++ b/xen/arch/arm/vgic-v3.c
>>>> @@ -685,6 +685,7 @@ static int __vgic_v3_distr_common_mmio_read(const char *name, struct vcpu *v,
>>>>      switch ( reg )
>>>>      {
>>>>      case VRANGE32(GICD_IGROUPR, GICD_IGROUPRN):
>>>> +    case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
>>>>          /* We do not implement security extensions for guests, read zero */
>>>>          if ( dabt.size != DABT_WORD ) goto bad_width;
>>>>          goto read_as_zero;
>>>> @@ -781,6 +782,7 @@ static int __vgic_v3_distr_common_mmio_write(const char *name, struct vcpu *v,
>>>>      switch ( reg )
>>>>      {
>>>>      case VRANGE32(GICD_IGROUPR, GICD_IGROUPRN):
>>>> +    case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
>>>>          /* We do not implement security extensions for guests, write ignore */
>>>>          goto write_ignore_32;
>>>>
>>>> @@ -1192,6 +1194,7 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v, mmio_info_t *info,
>>>>      case VRANGE32(GICD_ICACTIVER, GICD_ICACTIVERN):
>>>>      case VRANGE32(GICD_IPRIORITYR, GICD_IPRIORITYRN):
>>>>      case VRANGE32(GICD_ICFGR, GICD_ICFGRN):
>>>> +    case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
>>>>          /*
>>>>           * Above all register are common with GICR and GICD
>>>>           * Manage in common
>>>> @@ -1379,6 +1382,7 @@ static int vgic_v3_distr_mmio_write(struct vcpu *v, mmio_info_t *info,
>>>>      case VRANGE32(GICD_ICACTIVER, GICD_ICACTIVERN):
>>>>      case VRANGE32(GICD_IPRIORITYR, GICD_IPRIORITYRN):
>>>>      case VRANGE32(GICD_ICFGR, GICD_ICFGRN):
>>>> +    case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
>>>>          /* Above registers are common with GICR and GICD
>>>>           * Manage in common */
>>>>          return __vgic_v3_distr_common_mmio_write("vGICD", v, info,
>>>> -- 
>>>> 2.17.1
>>>>

