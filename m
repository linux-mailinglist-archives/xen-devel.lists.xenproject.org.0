Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD20C63A878
	for <lists+xen-devel@lfdr.de>; Mon, 28 Nov 2022 13:33:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.448910.705489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozdJZ-0002py-IY; Mon, 28 Nov 2022 12:32:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 448910.705489; Mon, 28 Nov 2022 12:32:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozdJZ-0002na-Ft; Mon, 28 Nov 2022 12:32:49 +0000
Received: by outflank-mailman (input) for mailman id 448910;
 Mon, 28 Nov 2022 12:32:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xF6c=34=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1ozdJX-0002nU-Op
 for xen-devel@lists.xenproject.org; Mon, 28 Nov 2022 12:32:48 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7e88::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c233ae56-6f18-11ed-91b6-6bf2151ebd3b;
 Mon, 28 Nov 2022 13:32:45 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DS7PR12MB5863.namprd12.prod.outlook.com (2603:10b6:8:7a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Mon, 28 Nov
 2022 12:32:41 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::62cc:47ae:a750:8f57]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::62cc:47ae:a750:8f57%4]) with mapi id 15.20.5857.023; Mon, 28 Nov 2022
 12:32:41 +0000
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
X-Inumbo-ID: c233ae56-6f18-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XfhWh/x1r5V3qgGpLVLFm/8YmJtnmE3wAQFTpJuiyODukpeAIMbYCDWD/5pMTbekWd1Wa+S5j+lPWz6Yv+eqECVb5+EOvs23PN8s8jiEe/haFyLNG1ZGXzJ2C74Jtv2gc42dWPIOFKMFQcSEZE2jfYvIv9XFCWLWRw3j5vaOEG0UDlfax6bnbxR9oTEnYjxIi/zhHuK9r8hpMUgwke4gLJZkEBpePE3FKCx4lhi4egBcwQX/VicDCqogVmGFtthVttljeD9otG3IMPbxLs6X1+twLA+kUeQE/mzlgJ4AGkkGOpPikNNogNEgdRF4rSPxza5dHxl37IgE+0QXRlOowA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BoxEh5LRVcud7DCQK4+ASWl7mfl+zMSuSSEO7THBMhQ=;
 b=SCNLgGa3BtXZX08QrARcsNl119u5ttyHTodMam06Dqk5JMZc0vo2B/lP15KzE3muNpPT+NVBx+fsogBpcIwTpDq6gAIeaOYFUvGJN5topCnd9UPDxldfewD1fFNSm9mwQqkVlvN+yWLnlerwZGVo0C+wgAHY2EZcNLIvGH1O9hhb7sDoH5kLpgULEPhQqzrLq8+Y7vj0A8fc/fE/hdyjeQqfE+Pq/8cIx3rIzOhQVvzPSpt5RnPirV4HEb3/ZR/D3VzTSpFfzudwQw5YaVhMgAGR5+T7KFkwdlQW7ffmHe1gT3K2TV1qtPvwHWluB7md7jmxsYb1tro6xCU42QFP1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BoxEh5LRVcud7DCQK4+ASWl7mfl+zMSuSSEO7THBMhQ=;
 b=gNWNf0q/DMstAgjIy5LZC2VnDDKntdnzHNoIkAWh/Qh6MUJIrRBurG9wkPzcdXTaEuCdI7lCUW4DF/OjwT2jg+VM1DPiHkFO3l4ckvFkcRAfHOMs+ehrzJsc95vSCRRCKVKQpz+9ui5MqCAKeJyhFBa/YXhrdY+THQ/G+0lAIOo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <35b3367b-5651-69a9-9218-82c15bc9c043@amd.com>
Date: Mon, 28 Nov 2022 12:32:34 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [XEN v3 11/12] xen/Arm: GICv3: Define macros to read/write 64 bit
To: Julien Grall <julien@xen.org>, Xenia Ragiadakou <burzalodowa@gmail.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, michal.orzel@amd.com, jgrall@amazon.com
References: <20221111141739.2872-1-ayan.kumar.halder@amd.com>
 <20221111141739.2872-12-ayan.kumar.halder@amd.com>
 <3ea29174-abb4-0fe9-fde8-28d4d62f2f67@gmail.com>
 <96e799be-fc98-3457-2243-c979162e8a79@amd.com>
 <36c7f27d-10c7-b4fd-c775-a247660ec125@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <36c7f27d-10c7-b4fd-c775-a247660ec125@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0204.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::24) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|DS7PR12MB5863:EE_
X-MS-Office365-Filtering-Correlation-Id: e883f459-aa9c-4f67-78e1-08dad13ca3fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0L5XDJJHHM0Zm0rT9+gMzzpDjmSJLz4mL3CX1J5hBCMrLfdczAv1srzk/mKJbdtFcrMVSkxtNlnDBK5Qvv+1Qvaau0Inn01ppzmiOvEBs2MypDo21rTgwobIog/s6Cj9XCrNJTMwPk4I/JNWMhFqu/JnoMeFMsL2wkQJBSTXWGfmd3FdbjgC+a5d79/X1N/JIpkImty4WGrQfFgt7ckWTQb7F0zXuXsyzkR6xUEvtDBBybAq36p/hLgTdTrpA/singsdVGI7WdOb96SFkKd/iQIMBEFSV80DXev4GosHvFow6cMjZhfYJdzyjHzVLF6wSHRdIFmVtmwi48m7+g2jO5MlkCN70gR0+FDeTB6j/Cefi2hitE+OWEdAIfq6BCgf5mCc/8XS5i5DENqRl0Sl0Py9iiuzJK/c0+KEuiyn0zo8GVYtgXdEgo6p3xBJXeMFyYdf7LSOVsqQCfJNwtZJHkdjiNcPKweTzd+4aSF0zOjn7Fva9acjlW1it+lFUBCOFEOpFxZNxQYbseTlqKjQATDrFUkKWiWmKfLyMJW8xN5MdnOMNlWDDLMaeDIqZiMjVlj9/WcKR+yA8yikoCd3jFnjgTZNCDmPlPHZRQn6KqRGTUXM78EdMQhW9Nk/RqVLYZFsyrHA3EGV4DmzdaRJrs8WNAuUFSIeafAvhh0FG7V0oiGONTh6WKn7QUe1a/nxH0pAgS4OvCeBEdNTztrpkuPrSidxa4qmFsuRj5IeXds=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(39860400002)(376002)(136003)(346002)(451199015)(31696002)(6506007)(186003)(66946007)(53546011)(6512007)(41300700001)(8676002)(26005)(66556008)(8936002)(4326008)(66476007)(316002)(2616005)(478600001)(6486002)(6666004)(110136005)(38100700002)(31686004)(2906002)(83380400001)(5660300002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWNLckJoMGdPSDJkVm1xU1E1cTMvN1llblpSYXQ1R0RQRlZHUEZSbW1aYU9h?=
 =?utf-8?B?bm95ajRGN1BnVXBxQ015RnFsR2QzdTdHMk1NQXU2R2U1QWFPSHFESW1hbnJM?=
 =?utf-8?B?NFVPckZQZmF0TGM5anZVYnlvd25SVVNJOW1OUm9qVW9uSDJvazltSHByaVk5?=
 =?utf-8?B?M1hYOHJpSFhwT0JISGRNak1mVHNGbHNnemxyN2pIbU5oYmdVQVdqT1Y0bG45?=
 =?utf-8?B?MDhvZW12Ykk1MDk2VFNJaGJpMTdqcC9VZlE2eXg5VjltRUs0d1k5b0I1RXZ0?=
 =?utf-8?B?TURDN21ZYmZFUlZPTUptb1NSMmNjRkw1ZXdrMXloV2RTRDdkWlQ5dFlQTktI?=
 =?utf-8?B?QWZYU1o3Mk4rVU42a1BObkRKbjdFbndPUTdaL3dIUXY4eng1OERnTHFsOEZG?=
 =?utf-8?B?ZEFZTU54U2JZTWs0c3FwcWpETGRoZjRyWnVraXgyM3psRUExdWFnd3JBcFZI?=
 =?utf-8?B?SzlSTERSK1RlTlcxUExFOXhObU5SSk5wc2JhOVNCKzZsRld5ZTlMMzQ5UGdr?=
 =?utf-8?B?WE1rN1VaVERoRHV3MnNtNDhjR3hNMmFZbVIvYXRtV2lncFViTC85OTJjZ28w?=
 =?utf-8?B?aVJEV2ZIdUR0N0kxSEJLdG11UmlBK3hBY055NVNOYnIzdGpLMVhuNDUrd1g4?=
 =?utf-8?B?Mk1ranpZNkNRNGtaVTZRSGEvVzJ0ZThORlpDbEhNYXVDMUVDQ1c0VEJHc2U4?=
 =?utf-8?B?Z3pNbXdBTVp5M2ZjRHRzYXVnNlkwMC9BN1VoMm03MXlmWDZudW9wYmloN3lV?=
 =?utf-8?B?V3dCbVVoUmlwd3lQRHZqYUxkRFpTRC9WemMyYUJWdFhhY2pNVVl4TzFHTXV2?=
 =?utf-8?B?c2FxOVBtNjlZRHVMMWlRallOVFVOQlhOTWU3SFROakZwN1p0VjExQzNYbUNq?=
 =?utf-8?B?eFZEc09FRyszZzZaeURQVEZjUkR4a0U3YmNXQS9UaytYU3M2TS8ySERxeHJh?=
 =?utf-8?B?NXdsL1E2VkpiN0RZZXB1YlhHN2JEb1ZkVFJuc3pDb0NQd1RrTVpoQUZNVkZF?=
 =?utf-8?B?NTFud21jKzdTV1N5MGhWY0o5Z3NERXc2RFpWZ3huR0tSTGs0cTgrOVFyZTdV?=
 =?utf-8?B?TDE0UDFrS3d0aVVsTVhkV2dCNWpzemZXMEFrd0ovUTVqc2FWeitVTkhPTDNr?=
 =?utf-8?B?N0QwM2dxSXZ1T0orVGNta2w5cTZJMmVrRDZ1Q2IwbWI5YjdaTWxRTXE5N1RM?=
 =?utf-8?B?Q3JRRXU1SDZyeHBUZkxnWktldWc1a3JJcTU5ckFIMzQ4N3JrQkM1WFEraWJZ?=
 =?utf-8?B?UFVZcnVZSmNCNkxIK1AzNXQxdU1ieHR0aDZHd1h0TWZDTXRwUHM0UVNJdUt1?=
 =?utf-8?B?Y2owNVhzM2dLL0pocjdPM1htM2NOTlNCdTVWZ1J3MVdzOHd3MUNNNndrT2pS?=
 =?utf-8?B?emlhZEF1VDBSUkRZdXlNVktsUEZqOGw2VXJBQlBpUGlHWDdHM0lIbDZnMHRi?=
 =?utf-8?B?S25paUFGdUJyNXQ1TUNYa1NXaWV2SG1DVmd1citUc3FETnJwUmluOWE2OGV5?=
 =?utf-8?B?eWNZaG9jQ2V3YU5FaU40VHd1U2pnYk5yMzZ4VjF3L21KRitQWEs5aldBMzcz?=
 =?utf-8?B?dklKV29sUEZjb3ZqVEc2MTBKdXByMWgvZ2h4ZWNYMnNyL3lFMGg1N1VuM3VV?=
 =?utf-8?B?cjM1aDRXQU5tYzByUWlkVEhybGNmZHh5QWFSUmZ0aTJDNlJDeEUwR3kxb01P?=
 =?utf-8?B?ajEwZmRMM1Aza3Z0OEN5cC9WVDMyVnJYVjBqWTVQVnQ4WDZUMk1HclhRL0Vu?=
 =?utf-8?B?UEZiVWNzWnVnWit0ZHF5VThEMnlWcDI3UVl5Z2lrUTh6NEZZbmRQdDAxU2Vk?=
 =?utf-8?B?NldsMG9yV3UzaE4xU2E1enFhblNIKzJhT2N3Mml2NXVsYTd0SUEvSUJERE1K?=
 =?utf-8?B?V2ZUUEZHLyt2RmpYSForWkJpSFluTTZqejEwbU8yejk3TVdwMlovdzdzWEpZ?=
 =?utf-8?B?LzJDZEp3OUhVN3dxTnFpRXNkTDBTMVYxcU5DM1h3cGdYTXgxblFXczdVMVdk?=
 =?utf-8?B?ZFROUDVSSkFDa2hTN21PY0JmVGtHcVRlUXh6dHVDcWVaYk83Q1R2NHVvK2Nh?=
 =?utf-8?B?SXhlVmoySGVVWkl0TUxVRS9kTm8zM2JOcEQ3M0duUFpDb1ZyNnd5a3dDa0to?=
 =?utf-8?Q?I5sYIYk8H/1KbK3ZaQLMGilk+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e883f459-aa9c-4f67-78e1-08dad13ca3fc
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 12:32:40.9571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7CL17WdpJsH/Cy8oA5wilkjkDIlU3Q4YVKHnsCD+ZU09zeois6TLQ/TxL8uqL9XcXHkCISzLQZSpN5ELM46L9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5863


On 11/11/2022 17:53, Julien Grall wrote:
> Hi,

Hi Julien,

I need a clarification.

>
> On 11/11/2022 17:37, Ayan Kumar Halder wrote:
>>
>> On 11/11/2022 16:17, Xenia Ragiadakou wrote:
>>> Hi Ayan,
>> Hi Xenia,
>>>
>>> On 11/11/22 16:17, Ayan Kumar Halder wrote:
>>>> On AArch32, ldrd/strd instructions are not atomic when used to 
>>>> access MMIO.
>>>> Furthermore, ldrd/strd instructions are not decoded by Arm when 
>>>> running as
>>>> a guest to access emulated MMIO region.
>>>> Thus, we have defined 
>>>> readq_relaxed_non_atomic()/writeq_relaxed_non_atomic()
>>>> which in turn calls readl_relaxed()/writel_relaxed() for the lower 
>>>> and upper
>>>> 32 bits.
>>>> As GICv3 registers (GICD_IROUTER, GICR_TYPER) can be accessed in a 
>>>> non atomic
>>>> fashion, so we have used {read/write}q_relaxed_non_atomic() on Arm32.
>>>>
>>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>>> ---
>>>>
>>>> Changes from :-
>>>> v1 - 1. Use ldrd/strd for readq_relaxed()/writeq_relaxed().
>>>> 2. No need to use le64_to_cpu() as the returned byte order is 
>>>> already in cpu
>>>> endianess.
>>>>
>>>> v2 - 1. Replace {read/write}q_relaxed with 
>>>> {read/write}q_relaxed_non_atomic().
>>>>
>>>>   xen/arch/arm/gic-v3.c               | 12 ++++++++++++
>>>>   xen/arch/arm/include/asm/arm32/io.h |  9 +++++++++
>>>>   2 files changed, 21 insertions(+)
>>>>
>>>> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
>>>> index 6457e7033c..a5bc549765 100644
>>>> --- a/xen/arch/arm/gic-v3.c
>>>> +++ b/xen/arch/arm/gic-v3.c
>>>> @@ -651,7 +651,11 @@ static void __init gicv3_dist_init(void)
>>>>       affinity &= ~GICD_IROUTER_SPI_MODE_ANY;
>>>>         for ( i = NR_GIC_LOCAL_IRQS; i < nr_lines; i++ )
>>>> +#ifdef CONFIG_ARM_32
>>>> +        writeq_relaxed_non_atomic(affinity, GICD + GICD_IROUTER + 
>>>> i * 8);
>>>> +#else
>>>>           writeq_relaxed(affinity, GICD + GICD_IROUTER + i * 8);
>>>> +#endif
>
> I would have been OK if there was one place needed a #ifdef. But 2 is 
> a bit too much.
>
> Please provide a wrapper writeq_relaxed_non_atomic() for arm64. The 
> implementation would call writeq(). The same stands for...

For arm64, why shouldn't we invoke {read/write}q_relaxed() for 
{read/write}q_relaxed_non_atomic() ?

As I understand, this will be less expensive than invoking 
readq()/writeq() (as it will introduce memory barriers).

Also, the original code was invoking {read/write}q_relaxed() for arm64.

Please let me know if I am missing something ?

- Ayan

>
>>>>   }
>>>>     static int gicv3_enable_redist(void)
>>>> @@ -745,7 +749,11 @@ static int __init gicv3_populate_rdist(void)
>>>>           }
>>>>             do {
>>>> +#ifdef CONFIG_ARM_32
>>>> +            typer = readq_relaxed_non_atomic(ptr + GICR_TYPER);
>>>> +#else
>>>>               typer = readq_relaxed(ptr + GICR_TYPER);
>>>> +#endif
>
> ... here.
>
>>>>                 if ( (typer >> 32) == aff )
>>>>               {
>>>> @@ -1265,7 +1273,11 @@ static void gicv3_irq_set_affinity(struct 
>>>> irq_desc *desc, const cpumask_t *mask)
>>>>       affinity &= ~GICD_IROUTER_SPI_MODE_ANY;
>>>>         if ( desc->irq >= NR_GIC_LOCAL_IRQS )
>>>> +#ifdef CONFIG_ARM_32
>>>> +        writeq_relaxed_non_atomic(affinity, (GICD + GICD_IROUTER + 
>>>> desc->irq * 8));
>>>> +#else
>>>>           writeq_relaxed(affinity, (GICD + GICD_IROUTER + desc->irq 
>>>> * 8));
>>>> +#endif
>>>>         spin_unlock(&gicv3.lock);
>>>>   }
>>>> diff --git a/xen/arch/arm/include/asm/arm32/io.h 
>>>> b/xen/arch/arm/include/asm/arm32/io.h
>>>> index 73a879e9fb..4ddfbea5c2 100644
>>>> --- a/xen/arch/arm/include/asm/arm32/io.h
>>>> +++ b/xen/arch/arm/include/asm/arm32/io.h
>>>> @@ -80,17 +80,26 @@ static inline u32 __raw_readl(const volatile 
>>>> void __iomem *addr)
>>>>                                           __raw_readw(c)); __r; })
>>>>   #define readl_relaxed(c) ({ u32 __r = le32_to_cpu((__force __le32) \
>>>>                                           __raw_readl(c)); __r; })
>>>> +#define readq_relaxed_non_atomic(c) \
>>>> +                         ({ u64 __r = (((u64)readl_relaxed((c) + 
>>>> 4)) << 32) | \
>>>> + readl_relaxed(c); __r; })
>>>
>>> As Julien pointed out, the expression c will be evaluated twice and 
>>> if it produces side effects they will be performed twice.
>>> To prevent this, you can either assign the expression to a local 
>>> variable and pass this one to readl_relaxed() 
>>
>> Just to make sure I understand you correctly, you are suggesting this :-
>>
>> #define readq_relaxed_non_atomic(c) \
>>
>>                          ({ void _iomem *__addr = (c); \
>>
>>                              u64 __r = (((u64)readl_relaxed(__addr + 
>> 4)) << 32) | \
>>
>> readl_relaxed(__addr); __r; })
>>
>> #define writeq_relaxed_non_atomic(v,c) \
>>
>>                         (( u64 __v = (v); \
>>
>>                            void _iomem *__addr = (c); \
>>
>>                            writel_relaxed((u32)__v, __addr); \
>>
>>                            writel_relaxed((u32)((__v) >> 32), (__addr 
>> + 4); })
>
>
>>
>> Is this correct understanding ?
>>
>>> or use a static inline function instead of a macro, for implementing 
>>> readq_relaxed_non_atomic().
>>> The latter is the MISRA C recommended (not strictly required) 
>>> approach according to Dir 4.9 "A function should be used in 
>>> preference to a function-like macro where
>>>  they are interchangeable".
>>
>> I have mixed opinion about this.
>>
>> On one hand, there will be a performance penalty when invoking a 
>> function (compared to macro).
>
> Most of the compilers are nowadays clever enough to inline small 
> functions. But we can force the compiler with the attribute 
> always_inline.
>
>>
>> On the other hand {readq/writeq}_relaxed_non_atomic() are called 
>> during init (gicv3 initialization, setting up the interrupt 
>> handlers), so the impact will not be bad.
>>
>> I am fine with whatever you and any maintainer suggest.
>
> Project wide, we are trying to use "static inline" whenever it is 
> possible because it adds a bit more type-safety (the error you made 
> wouldn't have happened) and the code is clearer (no slash).
>
> So my preference is to use static line.
>
> Cheers,
>

