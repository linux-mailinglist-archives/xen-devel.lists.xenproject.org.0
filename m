Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CEE7424E9
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 13:22:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556789.869554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEpiM-0006J1-1j; Thu, 29 Jun 2023 11:21:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556789.869554; Thu, 29 Jun 2023 11:21:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEpiL-0006Gk-UT; Thu, 29 Jun 2023 11:21:29 +0000
Received: by outflank-mailman (input) for mailman id 556789;
 Thu, 29 Jun 2023 11:21:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1sCV=CR=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qEpiK-0006Ge-TC
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 11:21:29 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7eab::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15fe6ef1-166f-11ee-b237-6b7b168915f2;
 Thu, 29 Jun 2023 13:21:27 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by CY5PR12MB6383.namprd12.prod.outlook.com (2603:10b6:930:3d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 29 Jun
 2023 11:21:23 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54%2]) with mapi id 15.20.6521.026; Thu, 29 Jun 2023
 11:21:22 +0000
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
X-Inumbo-ID: 15fe6ef1-166f-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YG2r7rPRXpfhQvN+lxo7W9J+DSYOaaNoFiP9bih2RJVlABmxMiDYsfVids6dzvsYXPdGh3wXasl6Bx4G7rPp1pzelP7baTmcOx2BzQ76it4JwLL614MXiYrbZKOhAPKQQN1SFlIvapaVyPZPgkm/CTJ72e6XZRsAYk4+gsXgTU/g3tFnGBTiYDUsht65Wht8SouAj7CGvU4HqfTJVQOgArqhXUUWc77aj51PD2UGdH2h1w+v8sPD3HqSogXpUvVdooXDJ6+jnGsLHumfHeEJnJwMl0Z6TfjnnF3/wzaz8/l7FswUYVDV1C4P9tY+0wfvUzBkq4CSyA0BKNJiJus5eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GsjzOeJiRqQ92ChuPXbigZZj4Xo8diLgL2Vh+27YSsk=;
 b=ZhaZnT0j7FgbjpDzor8OOpUvWPzLvFO6QFLP7+SgGtS6B30+FCi2tBjkVsSOIH4qjKGNzI3q9aZHm5kXpE7N/mqz6wRNoKenVvxTi7OwEg4kYw+M91xzNI0SLiyPF171NqIYE7OYCVC0CF9bzdcX08uG+ttShnVr4NZKlKHjl0XSk0r4FS/qcuQwwM9uZFNIe7cs33rVhMgsQ2ds8hF0TVNMfKe9Fvl7Kj3G6e3GIHBL01dH3GzGJryg72r7yKWgNHl6myRM9SCi3RJt23RI0zDZILSfb8KjhWgoBlRy70L7Dl2TgZB39ZBHOT9E7OD8koAbkHUY73GZZwwqeRLmsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GsjzOeJiRqQ92ChuPXbigZZj4Xo8diLgL2Vh+27YSsk=;
 b=KRx9AxwuNakXXMBFvbmP9qyb2+AlbryODeWQmM6DG28WqD7GIEyDtZOEXXCBYZjYrt+RPU3qG6miyAokO7tPYbzmi74D6iGn8LCUKE+cF3UXwFaOEn0aXFVxSnKioY5LHlOYqQ7FHh2fyCFZKT8zFLeYm8qzzRQ8ucXtbCuIugM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <301e2e02-f2ab-5538-d426-52a02a7f35b5@amd.com>
Date: Thu, 29 Jun 2023 12:21:16 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 24/52] xen/mpu: build up start-of-day Xen MPU memory
 region map
To: Julien Grall <julien@xen.org>, Penny Zheng <Penny.Zheng@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-25-Penny.Zheng@arm.com>
 <778688ab-8fd4-2b06-e644-b5a013bb56f7@amd.com>
 <39a5a729-0099-67e4-bf4a-c65ae99a4619@xen.org>
 <37e2856b-038e-6a3a-a6ff-c518dfeda552@amd.com>
 <f849b3cc-f9c1-131a-f6c1-5be27911ec6e@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <f849b3cc-f9c1-131a-f6c1-5be27911ec6e@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0123.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::10) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|CY5PR12MB6383:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c691cdb-8ad5-438d-bd96-08db7892f802
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iQ3HQxmnVYiH9W/L9vO0NiaJ4cckbdGKOmuhdhUX+6ZErIoxZSYcBkIWTRvC6CUOEHCjeNNttJmcWPmLQ/Q9YCn5nR4skkkqSmpslwrU4jHUQ8cmtdsKfyTS8kknKG/K90qyjXF9JwZT6beGJ5SAG1TmaVQj6qUjp7H1zsgA4JaFNj3oBLjIkqsJmFFNv+1uDtHyQFgeKTOnJR9wdx8KMMdDfpYaE7MikDE2fSMqD35tACThMuP7IA61u+5fOCiuo4vG3+8Uy0aO0rklYU+xLYxRmfr9ORF/sTVk89hG4ObddPJ1lU7wkoaPV80gCUnufqv1jTCb22r4IthmXhmfpKZzyVZDMB1wrFA2TEsAEBFW+j94a0LvuNWNRECPFgHD/dXZs+0Ze22LrcQIyS1FTqQOpjCdkeWvaRP/s2DTHfzxnj6wAA9I4IetYV86lpIqTEkc0wcjSDT3mpRhvUfz8aucadAdid7Z6T7RsL/lHeL0YQvRgoeMR9UichNV1eBVw3ssr9RsLSV4vOTLdpmDEcEWMDtrtp79QyVomQwb7iCCD0r7FugrgBNqUFRA7TXF0NUhsIhkTGmJBzqitJYcNaz6b43Mv0jnfyFrg1J7fcfjJCYfcjqbIOJyD7RlFKamZtOhM6loFnGXuX09hGdtPEGfZ5ik2MbY3nufW8eru+WiOyeaoNXzmEUFABBtpx3l
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(376002)(346002)(366004)(39860400002)(451199021)(6512007)(110136005)(966005)(6486002)(478600001)(54906003)(186003)(26005)(2616005)(6666004)(83380400001)(53546011)(2906002)(6506007)(41300700001)(36756003)(38100700002)(5660300002)(31696002)(66946007)(4326008)(66556008)(316002)(8936002)(66476007)(8676002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXJlYi92eUhMaU9MYk5XbzUzZE41bVh3MjNQZktmQ0pPcDBHQ3dIcnlUc0Mx?=
 =?utf-8?B?TStrdVVVLzNFUzJUeTkwNmFoTFlLTFpJU3RWaG1UcnJBRlU0VlhiMC9RV2c3?=
 =?utf-8?B?KzhzcStYendEd1BmM1dCWWRWZEZ6R3ZFb0xEb3dSWCtFc084MmFiU2xOSG80?=
 =?utf-8?B?bU9RV1dHRWEwS1VlazYyN2N4VEdsL0FPdDh1elg1RHNlVVZQbTF2UWs5bWd3?=
 =?utf-8?B?dExDQ1Q5QnV2dlVMVHlKOEFzdFhyUjgwbU1NTjV0cEtMU1E0dlpod3o3aERa?=
 =?utf-8?B?dHRXRUJKRXA2azdYb3hGNkZKby82blQ4WXRDbzJVaDM2OUxEcVFwTzBBWUJ3?=
 =?utf-8?B?enEyME5DSzdvMlp2ZXlMa2JLaVhHSFlKQUlaWHBvRTIwSHRBUWs3SVNvb1dL?=
 =?utf-8?B?dUJaVUpYS3dHUkJ2cHoyTVMvaFQ2SGNGTE8ya05YcGJGU3N6anJqbWZwdUhr?=
 =?utf-8?B?R29zNE4wZzF3Q0R6dDdsMlYzS3ZjMHpLaGJpaUFtOFJ5SUE5clJ0QUlFT2Rk?=
 =?utf-8?B?RzhDajJvSDZTQWZ0SllreU55WTlQTkZiYWlKZG5rdG5nbzQ0cjUxUEdxNDNo?=
 =?utf-8?B?RzVOVG92OTRVTE03Zm52aGV0V3ZuRGdqOEpLR2ZhekVwRGpvK0tYV055Zjli?=
 =?utf-8?B?VDZ1c3YwSDZKR1h6YjRKVVNiTjlJMUtZWVRCZG01UkV6cGlQaUpnZkVkN1Jo?=
 =?utf-8?B?TTYvUzIxaUNyK2VkYmFTd3VFVXUwN3JNalZGdkNJWkUrdTNDanlSTnl6RlJG?=
 =?utf-8?B?VzJBa2c4amphVCtQeVFvMENKYnljQTJ0MVFFR2d3WTVHMmJ1eG5Qc1NHck9u?=
 =?utf-8?B?OUwrd2ZRVEhTblY4S2hkUERXZ09JSkFlVjk2L3o3RlVIOHd4N01mbWFzbEIv?=
 =?utf-8?B?Mzk1dE5qWlN3ZHc4Z09ObmpSTW5OK2NlaC9nM2xQc0svazNORTN1a3VZNVBI?=
 =?utf-8?B?TDJkQjZFUXZCcDhRYzM5ZXF1OFl5M0k4Ky8vdlU2RC9CamFaQzZBdzVOTmRn?=
 =?utf-8?B?d0ZkdCtLSERjZlFLazRrK2RuRHFraW1raWVPQWRkZ2VhdE5hbG90a2JvWmtO?=
 =?utf-8?B?aGc5S3ZIY2ZwdUhDb0RQT0J6S054OXRJdUdva0hxcDB5NzF6ektqblRQbWJi?=
 =?utf-8?B?T0RzYWxpc05sWVN2dytSdXhLeEhyNyt5Q2hzelhTWDkvd2Z2SlBCanUwZnRE?=
 =?utf-8?B?c3QxUHBMWjY5K05rWTlOMnBIaVRIZXZNUVJja2ZPU3hid3lnZ3NBQzNobFhn?=
 =?utf-8?B?ZXQvR2xOWnlqY2VRWVZubXBaSlVUQXJkenNmZERhUk03SHZRaWNoMnlhSExv?=
 =?utf-8?B?RldWTm9CT2VXVDdxVlVlUkphUk1nZVJjd0hlcEZmWVhBSFBhM29LVTljV1pE?=
 =?utf-8?B?dVVZb0xxRDFCVUI4WmJ2UGdFSGVraWhtYm45dWlNSFFGSkJhcjZqTDdnNFE1?=
 =?utf-8?B?WlZPd3RQK2RCYVhFZUZLK0RRa3lTdU5xTnArR29UQkswSjRUL1NDOVdRMHd4?=
 =?utf-8?B?bk5aVENBMXZDTGJ4c05pV1lWc04vL3JYSW9lUXN6cVdXekdCUGxOemFGRFpt?=
 =?utf-8?B?REdrdUp3MDhyYmtqckM1cFVaWng2UVJPZEF4TkpCREFxY0RIcU1jUjZMdjZG?=
 =?utf-8?B?VVFiWW1wdFptYmF2S3ZkOUZaMFkzMlR0RmRWQVJUMlRlN3AreG9LUThiWUN6?=
 =?utf-8?B?aERST3p3RTFCY3Bwd3FRazdHb1RnS3NFOUZPRW9JdStQaE0wa0s5NVZPWHFo?=
 =?utf-8?B?K2JFTUF1ZkovbzhzZzd2UUhRdDIyYTRvWFNKNVJQcnY1Z3g1OWo1RjRydzVh?=
 =?utf-8?B?dG5tN25RWWk0cWMxQUtvdTd4YkNsWWJCMk0wcjZlOGlOZzlJcWZwaE9BVU9i?=
 =?utf-8?B?WDhkUDcyRmxCOVNibjNpYzdoSlJ5U0pjSFc4U2ptQXdTOHNQN1N4cDRyRlB2?=
 =?utf-8?B?K2tvVW9sVlUrS2gzQXJ6MVdML016Tk1qejNZNEp3Qit4U2dneUQwNmhqQ2Ix?=
 =?utf-8?B?cXNtbVYvVFdsQXhKWnFsa1lNNW1Id3lqb2loOEpIR2FBaXoxQUpZU0FVV1cv?=
 =?utf-8?B?dnlYWG9YWEhzYmlxMVhia0o4bnRmK25ReFpUSzhpZ3NtQitKakl0Y3FSYmJo?=
 =?utf-8?Q?1JposQUTm284iKIjWgqbushqy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c691cdb-8ad5-438d-bd96-08db7892f802
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 11:21:22.6564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V00dtqYafQZ64ThfHh6r9456e3DIzCg/epct58b4rFtpNB1Xi7rPGwR0x42IdfNCgDXBg3E8jUfQNJaAlhsiIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6383


On 28/06/2023 14:42, Julien Grall wrote:
> Hi Ayan,
Hi Julien,
>
> On 28/06/2023 14:22, Ayan Kumar Halder wrote:
>>
>> On 28/06/2023 12:17, Julien Grall wrote:
>>> Hi,
>> Hi Julien,
>>>
>>> On 28/06/2023 11:55, Ayan Kumar Halder wrote:
>>>> On 26/06/2023 04:34, Penny Zheng wrote:
>>>>> CAUTION: This message has originated from an External Source. 
>>>>> Please use proper judgment and caution when opening attachments, 
>>>>> clicking links, or responding to this email.
>>>>>
>>>>>
>>>>> The start-of-day Xen MPU memory region layout shall be like
>>>>> as follows:
>>>>>
>>>>> xen_mpumap[0] : Xen text
>>>>> xen_mpumap[1] : Xen read-only data
>>>>> xen_mpumap[2] : Xen read-only after init data
>>>>> xen_mpumap[3] : Xen read-write data
>>>>> xen_mpumap[4] : Xen BSS
>>>>> xen_mpumap[5] : Xen init text
>>>>> xen_mpumap[6] : Xen init data
>>>>>
>>>>> The layout shall be compliant with what we describe in xen.lds.S,
>>>>> or the codes need adjustment.
>>>>>
>>>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>>>> ---
>>>>> v3:
>>>>> - cache maintanence for safety when modifying MPU memory mapping 
>>>>> table
>>>>> - Hardcode index for all data/text sections
>>>>> - To make sure that alternative instructions are included, use 
>>>>> "_einitext"
>>>>> as the start of the "Init data" section.
>>>>> ---
>>>> < snip>
>>>>> +/*
>>>>> + * Static start-of-day Xen EL2 MPU memory region layout:
>>>>> + *
>>>>> + *     xen_mpumap[0] : Xen text
>>>>> + *     xen_mpumap[1] : Xen read-only data
>>>>> + *     xen_mpumap[2] : Xen read-only after init data
>>>>> + *     xen_mpumap[3] : Xen read-write data
>>>>> + *     xen_mpumap[4] : Xen BSS
>>>>> + *     xen_mpumap[5] : Xen init text
>>>>> + *     xen_mpumap[6] : Xen init data
>>>>> + *
>>>>> + * Clobbers x0 - x6
>>>>> + *
>>>>> + * It shall be compliant with what describes in xen.lds.S, or the 
>>>>> below
>>>>> + * codes need adjustment.
>>>>> + */
>>>>> +ENTRY(prepare_early_mappings)
>>>>> +    /* x0: region sel */
>>>>> +    mov   x0, xzr
>>>>> +    /* Xen text section. */
>>>>> +    load_paddr x1, _stext
>>>>> +    load_paddr x2, _etext
>>>>> +    prepare_xen_region x0, x1, x2, x3, x4, x5, x6, 
>>>>> attr_prbar=REGION_TEXT_PRBAR
>>>>> +
>>>>> +    add   x0, x0, #1
>>>>> +    /* Xen read-only data section. */
>>>>> +    load_paddr x1, _srodata
>>>>> +    load_paddr x2, _erodata
>>>>> +    prepare_xen_region x0, x1, x2, x3, x4, x5, x6, 
>>>>> attr_prbar=REGION_RO_PRBAR
>>>>> +
>>>>> +    add   x0, x0, #1
>>>>> +    /* Xen read-only after init data section. */
>>>>> +    load_paddr x1, __ro_after_init_start
>>>>> +    load_paddr x2, __ro_after_init_end
>>>>> +    prepare_xen_region x0, x1, x2, x3, x4, x5, x6
>>>>> +
>>>>> +    add   x0, x0, #1
>>>>> +    /* Xen read-write data section. */
>>>>> +    load_paddr x1, __ro_after_init_end
>>>>> +    load_paddr x2, __init_begin
>>>>> +    prepare_xen_region x0, x1, x2, x3, x4, x5, x6
>>>>> +
>>>>> +    add   x0, x0, #1
>>>>> +    /* Xen BSS section. */
>>>>> +    load_paddr x1, __bss_start
>>>>> +    load_paddr x2, __bss_end
>>>>> +    prepare_xen_region x0, x1, x2, x3, x4, x5, x6
>>>>> +
>>>>> +    add   x0, x0, #1
>>>>> +    /* Xen init text section. */
>>>>> +    load_paddr x1, _sinittext
>>>>> +    load_paddr x2, _einittext
>>>>> +    prepare_xen_region x0, x1, x2, x3, x4, x5, x6, 
>>>>> attr_prbar=REGION_TEXT_PRBAR
>>>>> +
>>>>> +    add   x0, x0, #1
>>>>> +    /* Xen init data section. */
>>>>> +    /*
>>>>> +     * Even though we are not using alternative instructions in 
>>>>> MPU yet,
>>>>> +     * we want to use "_einitext" for the start of the "Init 
>>>>> data" section
>>>>> +     * to make sure they are included.
>>>>> +     */
>>>>> +    load_paddr x1, _einittext
>>>>> +    roundup_section x1
>>>>> +    load_paddr x2, __init_end
>>>>> +    prepare_xen_region x0, x1, x2, x3, x4, x5, x6
>>>>> +
>>>>> +    /* Ensure any MPU memory mapping table updates made above 
>>>>> have occurred. */
>>>>> +    dsb   nshst
>>>>> +    ret
>>>>> +ENDPROC(prepare_early_mappings)
>>>>
>>>> Any reason why this is in assembly ?
>>>
>>> I am not Penny. But from my understanding, in your approach, you 
>>> will require to disable to switch the disable the MPU for using the 
>>> new sections. While I agree...
>>>
>>>>
>>>> We have implemented it in C 
>>>> https://github.com/Xilinx/xen/blob/d1258f1cefe406a3f91237b8106746c089864651/xen/arch/arm_mpu/mm_mpu.c#L941 
>>>> , so that it can be common between R82 and R52.
>>>
>>> ... this means you can share the code. It also means:
>>>   * You can't protect Xen properly from the start
>>
>> Yes, I see what you mean. Refer 
>> https://github.com/Xilinx/xen/blob/d1258f1cefe406a3f91237b8106746c089864651/xen/arch/arm_mpu/arm32/mpu_v8r.S#L82C7-L82C15 
>> ,
>>
>> I am mapping CONFIG_XEN_START_ADDRESS + 2 MB. But, probably you mean 
>> individual sections should be properly mapped from the beginning.
>>
>>>   * You need to flush the cache (not great for performance)
>>>   * You need to be more cautious as the MPU will be disabled for a 
>>> short period of time.
>>
>> Yes, MPU is disabled when set_boot_mpumap() is invoked. But is this 
>> really a security issue ?
>
> My second point is not about security, it is about been compliant with 
> the Arm Arm. To quote what you wrote:
>
> " To avoid unexpected unaligment access fault during MPU disabled, 
> set_boot_mpumap shall be written in assembly code."
>
> What's the guarantee that the compiler will not generate any 
> instructions that could generate an alignment fault?

I thought by writing in assembly, we tell the compiler what instructions 
to generate. For eg

ENTRY(set_boot_mpumap)
     push {r4}
     mov   r2, #0               /* table index */
1:  ldr   r3, [r1], #4         /* r3: prbar */
     ldr   r4, [r1], #12        /* r4: prlar */
     write_pr r2, r3, r4
     add   r2, r2, #1           /* table index ++ */
     cmp   r2, r0
     blt  1b
     pop {r4}
     ret
ENDPROC(set_boot_mpumap)

I ask the compiler to use ldr (and not ldrb) instructions.

May be I am missing something very obvious here.

However, I might be misunderstanding the comment here. It was originally 
written by Penny.

@Penny, Can you explain "To avoid unexpected unaligment access fault 
during MPU disabled, set_boot_mpumap shall be written in assembly code." 
in a bit more detail, please ?

>
> Furthermore, from my understanding, at least on Armv8-A, there are 
> caching problem because you will need to save some registers (for the 
> call to set_boot_mpumap()) on the stack with cache disabled. This 
> means the cache will be bypassed. But you may then restore the 
> registers with the cache enabled (the compiler could decide that it is 
> not necessary to read the stack before hand). So you could read the 
> wrong data if there is a stale cacheline.

Yes, this makes some sense. So will the following make it correct :-

1. Execute 'dmb' before invoking enable_mpu(). This will ensure that the 
registers are strictly restored in set_boot_mpumap() before the HSCTLR 
is read.

We do have 'dsb sy' before modifying HSCTLR (ie enabling cache), but may 
be we want to be stricter.

2. Invalidate the D cache after "mcr   CP32(r0, HSCTLR)" and then dsb 
(to ensure d cache is invalidated), isb (flush the instruction cache as 
MPU is enabled), ret.

- Ayan

>
> So overall, I think you want to tightly control the section where the 
> MPU is off. This means writing the logic in assembly rather than C.
>
>>
>> I mean only a single core is running and it is executing Xen. The MPU 
>> is turned off for few cycles.
>>
>>>
>>> In fact looking at your switch code in setup_protection_regions(), I 
>>> am not convinced you can disable the MPU in C and then call 
>>> set_boot_mpumap(). I think the enable/disable would need to be moved 
>>> in the assembly function. There are potentially more issues.
>>
>> disable_mpu(), enable_mpu() are written in assembly. See 
>> https://github.com/Xilinx/xen/blob/d1258f1cefe406a3f91237b8106746c089864651/xen/arch/arm_mpu/arm32/mpu_v8r.S#L128
>
> Right, but then you return to C world to then call set_boot_mpumap(). 
> So you have still some part in C even if it is small.
>
> Cheers,
>

