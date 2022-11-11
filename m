Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A7362608C
	for <lists+xen-devel@lfdr.de>; Fri, 11 Nov 2022 18:38:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442675.697087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otXyX-0008OY-Fw; Fri, 11 Nov 2022 17:37:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442675.697087; Fri, 11 Nov 2022 17:37:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otXyX-0008Mk-DF; Fri, 11 Nov 2022 17:37:57 +0000
Received: by outflank-mailman (input) for mailman id 442675;
 Fri, 11 Nov 2022 17:37:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LUri=3L=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1otXyV-0008Me-Bh
 for xen-devel@lists.xenproject.org; Fri, 11 Nov 2022 17:37:55 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2048.outbound.protection.outlook.com [40.107.93.48])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9141274c-61e7-11ed-8fd2-01056ac49cbb;
 Fri, 11 Nov 2022 18:37:53 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by SJ2PR12MB8136.namprd12.prod.outlook.com (2603:10b6:a03:4f8::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Fri, 11 Nov
 2022 17:37:50 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::62cc:47ae:a750:8f57]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::62cc:47ae:a750:8f57%4]) with mapi id 15.20.5813.012; Fri, 11 Nov 2022
 17:37:49 +0000
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
X-Inumbo-ID: 9141274c-61e7-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JbEOqGd1niI7ePAOxiTbbesZWP+eky3avIWIeNgf44hYkjJxaV9ewhUKqiR3Mpt0pS8z6+cHTJqeJmA9qL+p22gTc+0VDHYvhmzG/K/muO8p217uC/6MN4ufwvC+hrRVjCHGw7NubQH+xzWemLGvnjenceR/w6NapgqkRGBQlDN3iaLx5mtLod5x3jFfSpKzdk1LKIdhBaYbTwyuEWXC+7Eo7rJsRJtJqro0A9GUXNxBxoS5ZK+bJgpSn2oBX9hiwWgdA006uVoyOrJ6Ih+mLsBKq5jDNr/Krm82KmLPi0kfe5NuCCwBaww1XnoknPBd70LB0g4R4on75J7pnNNgwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HJTSrsiM8tI7h3okmkI3MOEcRpPnaGaRUJzP//EFAps=;
 b=mGY78XAZyrM7sAU5bKVvjumYcmpnc+KUgmNeSimdfvD1QyiAK3mqZJU1l7NHzz55p26XbZP4cYfeP0vDAGJ0AhjB5z81VrVj8eGgc2V5+MXArnpVbN3hAmimhmrtlkNcswadzX/SqaQ/H7HbMN8Rc4/X/qmw/3gvFSSUBD4/bRpduQUxgRENute9t9oJWMSWhVOqERi06r9G49/gcT9lDBiogWIWYmsjDvOQHYj37LYiUpyNWmwwqA5mg+WgeXckf3hnRPiEQF6IkijWoJ+/XP30A7u77Alq91C+v42peRxmZ/Ldzl+AimPc601Yy0rQf0lMu6F8ZRKQHJhlD+ASdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJTSrsiM8tI7h3okmkI3MOEcRpPnaGaRUJzP//EFAps=;
 b=qDCkHr9ZsvO8VWZNdPSE6PCKooLkVdHVBYRcZnlUVleS/Flg3CHNZdAia2jr8AtkarbFVOh6yO8BU4tc+G09o5ngNQSAOQcCU7lA83AfBIbFFHsLNZP/MlqIeSfNQSD7jkgmvjp7Ja4MAve3kt3j46B9YOqvQlVqnFFV6WzG4N4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <96e799be-fc98-3457-2243-c979162e8a79@amd.com>
Date: Fri, 11 Nov 2022 17:37:43 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [XEN v3 11/12] xen/Arm: GICv3: Define macros to read/write 64 bit
To: Xenia Ragiadakou <burzalodowa@gmail.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com, michal.orzel@amd.com,
 jgrall@amazon.com
References: <20221111141739.2872-1-ayan.kumar.halder@amd.com>
 <20221111141739.2872-12-ayan.kumar.halder@amd.com>
 <3ea29174-abb4-0fe9-fde8-28d4d62f2f67@gmail.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <3ea29174-abb4-0fe9-fde8-28d4d62f2f67@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0187.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::31) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|SJ2PR12MB8136:EE_
X-MS-Office365-Filtering-Correlation-Id: 37e1d83d-3e81-4037-4744-08dac40b7409
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E62z506K3Cswl/s2XIk0JeMoCQifIYoF9cmujzpr89wsPGCJFENftx6sEronC2XLtO89kv2XAUBU6xljM7JG3o0CJ8b/ya49df9E0GdygxV1UT6+cRvA/MPaphAE54YYLwiWX3fnV/MA13Bt8zqsbxAhXxI6hZ4YDrVOlDCTJUUMBgb6qgIOBeSE6akN5wZlR1+aQgFTNpRk+mhyV9SZFxK49HZmHg6uJCIeS0ZE9RjpX8ESLLSg445JgR15Jc7VZI4gb46ZsVQcgsMAfWAXsMXPS3YDVFuGSKbiPk50MwqORHr6XDpYt61D8hrzewDpZ+ThmCsFByqGO/Q7mo9II1rDECVFPH1LPu8JTCnqHgJHOUXa3W2avCbxT/qRY7zsw64jh3ojs6M2FoZez4/SCT0mdSRBOUi6CL2TN2LFjT24QnEqcTSIpUX16/S/ZRnN3xKRwFE2GRPeGG82yKH5zcU4S7ONEjmqQrrUl9hjd0wwj9Saa9oCG3ncpYpNlDbNBO1tYHmzXGq05Ew+CbzKiinrNx8anKP8gTpo9274Cz/v5EXn3dRos5qpTgg8F69RiwIUPLSRLArJbvIk13ibeD8MuUglVCaaHDU4XC0SWqudNKpIgFYb2Q2yrNtGJz+hSGwIEATn0w6KUe6t2PBpm91sI6CZDQbAPAafWjwnlOGrjaJhQlNyPS1UrL6SBZCnumxmNZ24xXvZFtX+Y8VyKBUG1rRSke3sBVGvsBZg6UGQ4NBh1dB1SBIGwcW2rjpY7AbLdLS930yBw69jeItIOfU4cRpmUZ8pbOkfarGwG04=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(366004)(39860400002)(136003)(376002)(451199015)(2616005)(36756003)(31686004)(31696002)(83380400001)(6512007)(2906002)(38100700002)(186003)(53546011)(6506007)(6666004)(26005)(66556008)(4326008)(8676002)(66946007)(316002)(66476007)(110136005)(41300700001)(8936002)(478600001)(6486002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWZMSXFkb3JMaXgvR1FsT1lleTlnUEZSTXJJVHRnOGw3TkxOaUFBZWx6aXdR?=
 =?utf-8?B?WVJDdytPNUd3RUVPZnBkRjliTE9PeTlidnRWSG5LaWZWQk54SHN1YVdRRzFJ?=
 =?utf-8?B?VGM4RzB0NjN5MjFvNnRCZmRsSWs0dEJnRE9IVCtSMnR2SkxZTFZja1hDZVJn?=
 =?utf-8?B?eUE2bmtQWEJaU2hYSTlQSmw5ajhqSm9MaDcwT2Jhek84eDlJZTI2ZlZYN1p4?=
 =?utf-8?B?eWU4MVAyZmJHQWRKZm5hbVhPVUpYUGZQTUZvWVVFWmtoV2pCUFVMbUxvT1pU?=
 =?utf-8?B?cllrQVpCNVZiUkJrTWQ5cFJvY3BjcGFiN3d3aXkrQTc1QjZFSGs4U2NXeGRr?=
 =?utf-8?B?NHh3TEFVM0N3RmR2WmhEaENjaDM1WE5jV0pXNjYvdWpXZmRGK2pyRDFodjh1?=
 =?utf-8?B?Q0VueU44Z1ltZ0dVYmNneTdZQkswQndXdWxGNnBMRXl0NnNmcTlTYVJmWk5p?=
 =?utf-8?B?emkrQ3ZPeDczMTR3WnA3WFNLSXpBZ1FGbkF4eGtYbmE2SVF1a1g0R3BrNE9P?=
 =?utf-8?B?a3lSY3AzVDBSN3ZCUmE3OXc5dFR2MTJiT2xiWUF3Nys4d2Y0NDRqM1VGUUJX?=
 =?utf-8?B?THFySkd1aC9hZlc5SkxFZTV4RmZESHRyU0dUOFJiMjJGUERFV21PQnNLd1Zm?=
 =?utf-8?B?Z1lZdzJMZERIdHY5SDVVK1hKYUFkcGpMWlhGRzlCVHkxVmdNalRDdnJOeWxv?=
 =?utf-8?B?T2ZHQThtc1d4UGhMUEZHUFFQby9CdG8yQzBjMHlia1ZEbGx1SlcrL0lPZEdW?=
 =?utf-8?B?R25STWpETXlHM0Z2K1pRdUYvcndGTnNZa2ErbUN0WjFONTM5M0dPN04zMHVX?=
 =?utf-8?B?STk5V0E4YU5WM0ZQWnQ3RDk5RENmOFhWNUw3SUt2WUdrbWYzak1RQkNLcGN1?=
 =?utf-8?B?OC9uY1pYUmhaeHNFV1V5Rk01Kzk1Q2hIZlhkNk1kRGhWUkJwMW44b0U5UGVy?=
 =?utf-8?B?NDNzajRvQ1A5WmQ4VGRpeTc4bHk5N1VVb0kvUmRkQ1Bva2ZrN0Y2ajQxYjVs?=
 =?utf-8?B?OWNYUXl1endNcFlSRVgzcHZkcVRxNUM4eDNtcFhodGxwbHNEY1hOSmlUOFVX?=
 =?utf-8?B?RmY4OGZrMXczcVdWUllYVHFwQ1RLVk50am5vY0E3WUI3dVZEblFPYUI0N3lh?=
 =?utf-8?B?QkJhTExBOC9WZFNNUTQ0OXFUNDVNR1pFQ3VoYVJEci90ekNJdnIxek9vZDlO?=
 =?utf-8?B?OEVybFp5czNQd1B1aHI5WWFLTTFMd0JKazRXWGUyMFJVYXhCS0FZUnpzeFNI?=
 =?utf-8?B?dktiQW1hNjBjNURIUldjS2Z6QTJxaTBIclVHekliSG8vMjZHVllFWmNobXFX?=
 =?utf-8?B?d2NWV2JEM1JYcGJpc0VScVNRZmRUNWJtajJ6eFRROHEzSk1xRHowTnZhNWpl?=
 =?utf-8?B?Ui82aFRiQ2dqclM1T2FZUWVBaXJ5UHZQd05qNUNWVmN3WjVjRUlQYmFMVGth?=
 =?utf-8?B?VGVGb2dLak9NcmxCazJLNG1UQStYZFZPazY1bVJubms4TUFlQURnT0l0R2pS?=
 =?utf-8?B?MDZYWm51WWhKdW8zaHNOVXd4SGtZMjdDS0szdnlUaFRXYjBtalc3NTY1b1BJ?=
 =?utf-8?B?cThYQzI5NEFPZlVLRkNESjBiYjNFYmdsZzlNQU1kbW4yV2dDY0NQK2svVmZB?=
 =?utf-8?B?KzFPRXBLZVJFYWZ4OWJtTXNmb3k1TTZpVHFidmo2RTBDVEJlSEdvbXFCZEdL?=
 =?utf-8?B?bmIyK1RkbFZFSUtZL3JhV1ozQTNtV3k1aXpXR3lDVHAyTDVNZDhrWUJ3ZEhH?=
 =?utf-8?B?UzJtbisybkcrVkZsbGJEZjJ3UVB4YlQvcVJ6bEswMnpmUnRkYzFkZHBES3p3?=
 =?utf-8?B?K0w3eU1kb3VRZzI0YU5VRnpMV2JPbDhhNnYvUU9UTjF4NGZuNlpWdzBUcmh4?=
 =?utf-8?B?R2dKQ2Yydit5QmhvMmcyRjZuU0pFM2U3VWNxVkNWV2swMWhDSDVJZmlqVWty?=
 =?utf-8?B?d283TTEzc3kzN0lwWDFScUtkb0VPdUs0M2lFQ3piYy9zSTd4VzA0U0JucXQ4?=
 =?utf-8?B?ZFNxZHYra0QzcTlxc2pRZnlqcERjbG1neTdHOE85a3pWZEI1c202RFZ0Q0FE?=
 =?utf-8?B?RGZIU3llRm82ZUQ4azk2dEltMmQ1RS9KdTVtTWlLM2NQeUx1eVpYNVRsV2Rs?=
 =?utf-8?Q?0jOeBtPgVfWoSPHDzhQHyl87e?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37e1d83d-3e81-4037-4744-08dac40b7409
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 17:37:49.9139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IiXdWGkoOERy9d0LGmMLsCRaPLiQTlhgettkwoaNVVUou+uBDNbyK6troZdf3W3NzlKqcsj/fgB5eyvEmJaIww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8136


On 11/11/2022 16:17, Xenia Ragiadakou wrote:
> Hi Ayan,
Hi Xenia,
>
> On 11/11/22 16:17, Ayan Kumar Halder wrote:
>> On AArch32, ldrd/strd instructions are not atomic when used to access 
>> MMIO.
>> Furthermore, ldrd/strd instructions are not decoded by Arm when 
>> running as
>> a guest to access emulated MMIO region.
>> Thus, we have defined 
>> readq_relaxed_non_atomic()/writeq_relaxed_non_atomic()
>> which in turn calls readl_relaxed()/writel_relaxed() for the lower 
>> and upper
>> 32 bits.
>> As GICv3 registers (GICD_IROUTER, GICR_TYPER) can be accessed in a 
>> non atomic
>> fashion, so we have used {read/write}q_relaxed_non_atomic() on Arm32.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>>
>> Changes from :-
>> v1 - 1. Use ldrd/strd for readq_relaxed()/writeq_relaxed().
>> 2. No need to use le64_to_cpu() as the returned byte order is already 
>> in cpu
>> endianess.
>>
>> v2 - 1. Replace {read/write}q_relaxed with 
>> {read/write}q_relaxed_non_atomic().
>>
>>   xen/arch/arm/gic-v3.c               | 12 ++++++++++++
>>   xen/arch/arm/include/asm/arm32/io.h |  9 +++++++++
>>   2 files changed, 21 insertions(+)
>>
>> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
>> index 6457e7033c..a5bc549765 100644
>> --- a/xen/arch/arm/gic-v3.c
>> +++ b/xen/arch/arm/gic-v3.c
>> @@ -651,7 +651,11 @@ static void __init gicv3_dist_init(void)
>>       affinity &= ~GICD_IROUTER_SPI_MODE_ANY;
>>         for ( i = NR_GIC_LOCAL_IRQS; i < nr_lines; i++ )
>> +#ifdef CONFIG_ARM_32
>> +        writeq_relaxed_non_atomic(affinity, GICD + GICD_IROUTER + i 
>> * 8);
>> +#else
>>           writeq_relaxed(affinity, GICD + GICD_IROUTER + i * 8);
>> +#endif
>>   }
>>     static int gicv3_enable_redist(void)
>> @@ -745,7 +749,11 @@ static int __init gicv3_populate_rdist(void)
>>           }
>>             do {
>> +#ifdef CONFIG_ARM_32
>> +            typer = readq_relaxed_non_atomic(ptr + GICR_TYPER);
>> +#else
>>               typer = readq_relaxed(ptr + GICR_TYPER);
>> +#endif
>>                 if ( (typer >> 32) == aff )
>>               {
>> @@ -1265,7 +1273,11 @@ static void gicv3_irq_set_affinity(struct 
>> irq_desc *desc, const cpumask_t *mask)
>>       affinity &= ~GICD_IROUTER_SPI_MODE_ANY;
>>         if ( desc->irq >= NR_GIC_LOCAL_IRQS )
>> +#ifdef CONFIG_ARM_32
>> +        writeq_relaxed_non_atomic(affinity, (GICD + GICD_IROUTER + 
>> desc->irq * 8));
>> +#else
>>           writeq_relaxed(affinity, (GICD + GICD_IROUTER + desc->irq * 
>> 8));
>> +#endif
>>         spin_unlock(&gicv3.lock);
>>   }
>> diff --git a/xen/arch/arm/include/asm/arm32/io.h 
>> b/xen/arch/arm/include/asm/arm32/io.h
>> index 73a879e9fb..4ddfbea5c2 100644
>> --- a/xen/arch/arm/include/asm/arm32/io.h
>> +++ b/xen/arch/arm/include/asm/arm32/io.h
>> @@ -80,17 +80,26 @@ static inline u32 __raw_readl(const volatile void 
>> __iomem *addr)
>>                                           __raw_readw(c)); __r; })
>>   #define readl_relaxed(c) ({ u32 __r = le32_to_cpu((__force __le32) \
>>                                           __raw_readl(c)); __r; })
>> +#define readq_relaxed_non_atomic(c) \
>> +                         ({ u64 __r = (((u64)readl_relaxed((c) + 4)) 
>> << 32) | \
>> +                                             readl_relaxed(c); __r; })
>
> As Julien pointed out, the expression c will be evaluated twice and if 
> it produces side effects they will be performed twice.
> To prevent this, you can either assign the expression to a local 
> variable and pass this one to readl_relaxed() 

Just to make sure I understand you correctly, you are suggesting this :-

#define readq_relaxed_non_atomic(c) \

                         ({ void _iomem *__addr = (c); \

                             u64 __r = (((u64)readl_relaxed(__addr + 4)) 
<< 32) | \

readl_relaxed(__addr); __r; })

#define writeq_relaxed_non_atomic(v,c) \

                        (( u64 __v = (v); \

                           void _iomem *__addr = (c); \

                           writel_relaxed((u32)__v, __addr); \

                           writel_relaxed((u32)((__v) >> 32), (__addr + 
4); })

Is this correct understanding ?

> or use a static inline function instead of a macro, for implementing 
> readq_relaxed_non_atomic().
> The latter is the MISRA C recommended (not strictly required) approach 
> according to Dir 4.9 "A function should be used in preference to a 
> function-like macro where
>  they are interchangeable".

I have mixed opinion about this.

On one hand, there will be a performance penalty when invoking a 
function (compared to macro).

On the other hand {readq/writeq}_relaxed_non_atomic() are called during 
init (gicv3 initialization, setting up the interrupt handlers), so the 
impact will not be bad.

I am fine with whatever you and any maintainer suggest.

Also now I realize that I had missed another point raised by Julien (a 
code comment explaining why ldrd/strd cannot be used) :(.

I will address this in my next version

> ...
>
>>     #define writeb_relaxed(v,c) __raw_writeb(v,c)
>>   #define writew_relaxed(v,c)     __raw_writew((__force u16) 
>> cpu_to_le16(v),c)
>>   #define writel_relaxed(v,c)     __raw_writel((__force u32) 
>> cpu_to_le32(v),c)
>> +#define writeq_relaxed_non_atomic(v,c) \
>> +                                ({ writel_relaxed((u32)v, c); \
>> +                                   writel_relaxed((u32)((v) >> 32), 
>> (c) + 4); })
>
> ... same here.
Ack
>
>>     #define readb(c)                ({ u8 __v = readb_relaxed(c); 
>> __iormb(); __v; })
>>   #define readw(c)                ({ u16 __v = readw_relaxed(c); 
>> __iormb(); __v; })
>>   #define readl(c)                ({ u32 __v = readl_relaxed(c); 
>> __iormb(); __v; })
>> +#define readq(c)                ({ u64 __v = 
>> readq_relaxed_non_atomic(c); \
>> +                                             __iormb(); __v; })
>
> I think that, here also, the macro identifier needs to inform that the 
> access is non-atomic.
I will remove this as we will be using readq_relaxed_non_atomic() in the 
code.
> ...
>
>>     #define writeb(v,c)             ({ __iowmb(); 
>> writeb_relaxed(v,c); })
>>   #define writew(v,c)             ({ __iowmb(); writew_relaxed(v,c); })
>>   #define writel(v,c)             ({ __iowmb(); writel_relaxed(v,c); })
>> +#define writeq(v,c)             ({ __iowmb(); 
>> writeq_relaxed_non_atomic(v,c); })
>
> ... same here.

I will remove this as we will be using writeq_relaxed_non_atomic()  in 
the code.

- Ayan

>
>>     #endif /* _ARM_ARM32_IO_H */
>

