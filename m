Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBBD702A77
	for <lists+xen-devel@lfdr.de>; Mon, 15 May 2023 12:31:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534699.831988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyVTb-0001hR-14; Mon, 15 May 2023 10:30:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534699.831988; Mon, 15 May 2023 10:30:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyVTa-0001fY-Sv; Mon, 15 May 2023 10:30:46 +0000
Received: by outflank-mailman (input) for mailman id 534699;
 Mon, 15 May 2023 10:30:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uOm1=BE=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pyVTZ-0001fS-4h
 for xen-devel@lists.xenproject.org; Mon, 15 May 2023 10:30:45 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20601.outbound.protection.outlook.com
 [2a01:111:f400:7e83::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a892650-f30b-11ed-b229-6b7b168915f2;
 Mon, 15 May 2023 12:30:42 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by IA1PR12MB7544.namprd12.prod.outlook.com (2603:10b6:208:42c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 10:30:37 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54%2]) with mapi id 15.20.6387.030; Mon, 15 May 2023
 10:30:37 +0000
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
X-Inumbo-ID: 8a892650-f30b-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C9NDm2eAFS3lu3qq5RFmxkKLZYlOkaz40Z+zYZ1JP3b+1AEjaw0EmArrO0Xv0cSDr+U/rF7QMUb2gA0rpCpVG500PCenj2S1cgZBr4JHQ6nYKhIdM+XFS75Ttjoqk4TMH0WCHAeNMxiTSjUieUe+KKrixtYrruQDzfZ1JXk/yAE/qOYo1WcOZ/TWzs2gDyABrUeTnydScH/rJSG6q/Smm4LiJRHlpaZFlOyxRZIrfqJqPVqIdaciRBn/vresuO8M6qajt2wrSbbaKxuUWdjwEWHJOuXFMXlzqth4C5wOKvDNVbead2QLqgTNUh54NlbuPTuXkh3ilu5A9/jFtjtljw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YsdfJAI96B6kTWxhWoWoucYVGS+Uaoxo0yqRgKq7AGg=;
 b=ZVnE0I4Sbddjoay2favYFV7T/mpqMExqwgAC227Mt+SIyNmYq7Hu84bIZJewxWD83oZ+0bzx2DUTXV6ChCeQ1MK7+bFKPy6wid6VYWJKOpuoIeq5L8LsxnWA7ofSjldQ3LMnkxPo3FjJZajqVmB0rYxMbCvT+GSAky9K90QyZP0OqSwnqrYddJ79JG0c8ikwYLXZKhpr0ccb63a3GIz1f6Qn8DcGWgZppVIbjCGzHU0VzpGTnkukkA58r/nRoY27Y/xudLSML/WQF6zkoq7vhwre7n4o2WqdUuc39m/yfAfUrYr1uiZmxl2028xOjVGpZxS5MToAqDaISoHzaE96jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YsdfJAI96B6kTWxhWoWoucYVGS+Uaoxo0yqRgKq7AGg=;
 b=geSNhN6gysHqLxP/lmRTSzBnOQFzb/eEdwrLrj8/uXUD0JEs8+riF++L6V76EAu2vTiFsEdvnI6dvv/fvuDuYRzW+qVFE5OTnJZb93Nq/nei1TQ2lKL4oBGZU9Gcljk1CzbCIV51nMM98NJ9xjx4YH8WrccV4wMx8goe7EGgiMk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <72fa0686-2703-6682-fe06-2fca14ff1986@amd.com>
Date: Mon, 15 May 2023 11:30:30 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [XEN v6 11/12] xen/arm: p2m: Use the pa_range_info table to
 support ARM_32 and ARM_64
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com
References: <20230428175543.11902-1-ayan.kumar.halder@amd.com>
 <20230428175543.11902-12-ayan.kumar.halder@amd.com>
 <63fa927e-72f5-1645-97c0-6986f2fdcabe@xen.org>
 <4681a4d4-68d3-01cd-912c-bca2cdc83266@amd.com>
 <175d5e01-6258-edcc-bddd-05ff9e1eb547@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <175d5e01-6258-edcc-bddd-05ff9e1eb547@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0230.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::19) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|IA1PR12MB7544:EE_
X-MS-Office365-Filtering-Correlation-Id: 31089fa5-a750-48ea-a4a6-08db552f6c23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qDnxTLMMzgMth4monGXRki1Bb2c3+H61lfI5rBzPsEgPPt+EyWlp2gswoESJWQfVar9jOsg/6te0NLv+uHOP29f5B34eOedooty2JeuPiJlvYya7araHu1eAD3M3mmQcjClTwVa8/qAITC3JLyTB0KiKp1gO01As9cyzZQGukrTx/Jvkcvumm4MfpI8BbMf8GUCRoZhn9gOxe6m+YQi+bsPqnMcYhXq6PgyeFavWPBDQD7AltOasC8DtMjYC3zwN5mlIMYGcu3RkWGty0lYkju8aBEX+p20r8nfTBVmeKt6zHr1Qjx2+An/AJ1Pwq7HrM0pePmc5/dc8Ko7yJVKHI4XbotaSIyFUod9C0Lg/Y1EnsDUfrd/r6dRB5tiLRgwS5lHodoGC9ZAY8HO+ROZS7nx2GZL5onnbLryNohsWBqf9XUbZmI9y8A0zBrFYPsKxsldc7IdmELct+ydmDmpytGw7rLPLFyTqpgtBjQveaxiBD6G2qs3rnziVlUv+VhXlIoEbwQBmxJcbGKo2Rrk8uKd6YDc0++H01bOBzjV7W3epfp45XUCcxCJPn1/9XVpD8cWerh22pm6ksSQfX9+OrTPgld3x6HNB4GI2mqyqp3HUNxag3ngywVqlMtA+zarj3OXtpf4ZO1dHIWOMWh6Qsg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199021)(7416002)(5660300002)(8936002)(8676002)(83380400001)(2616005)(2906002)(30864003)(186003)(36756003)(38100700002)(31696002)(53546011)(26005)(6512007)(6506007)(6666004)(478600001)(4326008)(66476007)(66946007)(66556008)(110136005)(316002)(6486002)(31686004)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3F0aUlmbWhzRmtleWZFOGtqRUFJMzl2b29rWGltTTJubTBXZUFkUjhjOWE3?=
 =?utf-8?B?QjUrN2hmcHhKVng5TkFWWE5vZThmZWQ5QU44czhMMHNiaE1yWS92RTNTUEdR?=
 =?utf-8?B?ZkI0VGNHUGVOLzErd0ZPQ3FrVzROb3JXOGtydWtvSmJjY0VTcm1ObHNSTmJw?=
 =?utf-8?B?OG81SUZtQytLMm8rZUxvTGJEb2RFdFg5dXJoL3U1OEVsYXZ6YWhVRTR0ZXNI?=
 =?utf-8?B?RkJHT3d2eUNPSmExM1hZa0htd2FaMDZEelhQL0hHMUhJcmtnak5JYkhCSUlH?=
 =?utf-8?B?VzZ6WU5qTTlNSmh6SVB0dlB0QXlLWXY4aGFlbVdGRGUvc3QrT3AzYjR3eEUw?=
 =?utf-8?B?cTBISGZzNkgwUVdwVVg3K0dqa3VTaXBGY2NXczBIYXpzL2tHR0JUV1lVWXhp?=
 =?utf-8?B?ZDdCMDFYeWdwSlNvWXd4bUxsWHEwT1ZqaEQwbGVtSE52QTYvbklLSytBN3ZJ?=
 =?utf-8?B?bExkNzBiNEdiMCtZb0xLZVhMUnplZnZNMFdQcEg4ODlXcnNscDdMYlpST2px?=
 =?utf-8?B?S2Q2UnAxWmViL3RFM09mamNBWGpBdlhuQmIwWm42NktFQmhaeVBXeU15RUNk?=
 =?utf-8?B?UEd4YXpMK1hBcDZJblV3QjljckRzZUhvbEgydjRVYzhUM2l3Sm9ONDFSMFpB?=
 =?utf-8?B?SVk5RGZOUi9YVGtTZ1BHU0NjM0tqWUc3TDNRQi9oUjB3eC9tOTZPcHIvQTJJ?=
 =?utf-8?B?aXovdTVob3NjTGpRbnp6K3N1cmZqaHVoQ1NCb214OVdSSXJjWEh5dTdZWnJG?=
 =?utf-8?B?akJxcGNIbXAvK2VDdkk3eWRaRUpJUHBqWCtTbVp3dk5QMjlpcnQ2UzI1OHBE?=
 =?utf-8?B?ek9leTlZYWVRRjcrWGxnY3JpNEN0QnhZR1U3TDE3Rmg3ZVNtak5zc2RZRWt2?=
 =?utf-8?B?b0RaY1BGYTdVRVhNNHlQWHVBcTJmQXdlMWdFa3doaEhpUjZhbEN0Qnd5cWFx?=
 =?utf-8?B?cndYY0pCM1ZYYW9WajRSWHJQV1pobnJNMzY1a3BvYzkybC9sNWhpbUdmL0xy?=
 =?utf-8?B?Q2RhcVo4MklDOWZiQTZCQ3NvZHJnYnB6d29nQVJLSFBiNG5FbWJUQ3BJdEIx?=
 =?utf-8?B?V0lOQ1p1WDRFS3pIUzY5bTdacXhwZTZxd0VaU3BURDRDLzJvYkdmWDFpUzJh?=
 =?utf-8?B?QzJPVmRvRHFSSmxraDNybFBNVHFrSTU0Z1JsYUVOaVJFY24zTG1DNmMrT29m?=
 =?utf-8?B?d2dBZVVsR01ySzJWVlBzMHFrUWR5VWZIMFJIcXpCSGllYmVzRXlnWmUycTVu?=
 =?utf-8?B?VExmckdWZGw2SitMUkRDR2VBSkJQem1oN2dKWS9RYmNxc0hPYTYrWmlsOW4x?=
 =?utf-8?B?UTFidVk5NWVVRlhOZWdGTW03bmc3UE5JOWFYM2x1Y0FZOVhrTjNvZ2NlUWRs?=
 =?utf-8?B?MndDcmpxTmV4dFlFeXlsQnlBRGEvOG5XUENTY1ZlM0tZV1kxVmdKRTNyckMy?=
 =?utf-8?B?SFc1YjdJNUFadmM5dUVEQkltMEk5SWRQM2ZoZFJhZis4WHBJTkZSZzU4RjRI?=
 =?utf-8?B?OTV3aGxEK2xOWTh5Z3M2R2hpaUE1TzJLS0p1WEJVMis5WkFmTWNENDJDeHcy?=
 =?utf-8?B?cnN3d3cxam5IR3ZpOVh3L0h1Y2RrWklFVWhFZWY5WWRxakNqc0t5MGw0NWwv?=
 =?utf-8?B?RWV4NDVBN1J0VVRqaHg5RDY2dElwOWtPRkNCb1F1empBNGR0aHAwODRjRWJC?=
 =?utf-8?B?NlNJTE1zbERwUEhrcnJPalU4aE8wNElKZ0xDeERaaHU0KzdHL29DWnVRbGJr?=
 =?utf-8?B?UGYyMGpjVThQUWUzM0lJem1qNDFRWXlYcUdMS0ZBeUdZc3FQV0VXRENmL3Z1?=
 =?utf-8?B?MUQzYUQwc2dUS1NsVThTZE9jZnNIUC95V3kza0VlLzd3NXVFSWVWUmM2Z2xF?=
 =?utf-8?B?cEZpS25PbnJnYUx1eVN5a0YvaW5oaHo0anhhWVlQM1F2ZjVPeCtmK3hkTU41?=
 =?utf-8?B?R1pHdGliNGozc1NhbXNBeU8yenNibFdJUGVnU282MmxpYnRDc0g1RW44U1hu?=
 =?utf-8?B?SDAzb1pMY3F6Yi9SWEpCTVZKTnM5YzNqcnVxNEliN2daYTNDVFE0SHhBbUVO?=
 =?utf-8?B?VmFPVFpoK0ZQSTMzek41WHZweEV0N0hVS2NEUTlzMCtISVNHSmwyU2loczF5?=
 =?utf-8?Q?Al5QProeHhLQvrv4fVyMzRWic?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31089fa5-a750-48ea-a4a6-08db552f6c23
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 10:30:37.1746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RNVQj6lHh3zFA5wQ2/DL7uTgk8zlPDsCY38cUNqhbYBSGI2Vr2aYN6vPLp2IHXlDfrXNJS6LPoRY434GpInVWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7544


On 15/05/2023 10:25, Julien Grall wrote:
> Hi Ayan,
Hi Julien,
>
> On 11/05/2023 12:45, Ayan Kumar Halder wrote:
>>
>> On 03/05/2023 13:20, Julien Grall wrote:
>>> Hi,
>>
>> Hi Julien,
>>
>> I have some clarification.
>>
>>>
>>> On 28/04/2023 18:55, Ayan Kumar Halder wrote:
>>>> Restructure the code so that one can use pa_range_info[] table for 
>>>> both
>>>> ARM_32 as well as ARM_64.
>>>>
>>>> Also, removed the hardcoding for P2M_ROOT_ORDER and P2M_ROOT_LEVEL as
>>>> p2m_root_order can be obtained from the pa_range_info[].root_order and
>>>> p2m_root_level can be obtained from pa_range_info[].sl0.
>>>>
>>>> Refer ARM DDI 0406C.d ID040418, B3-1345,
>>>> "Use of concatenated first-level translation tables
>>>>
>>>> ...However, a 40-bit input address range with a translation 
>>>> granularity of 4KB
>>>> requires a total of 28 bits of address resolution. Therefore, a 
>>>> stage 2
>>>> translation that supports a 40-bit input address range requires two 
>>>> concatenated
>>>> first-level translation tables,..."
>>>>
>>>> Thus, root-order is 1 for 40-bit IPA on ARM_32.
>>>>
>>>> Refer ARM DDI 0406C.d ID040418, B3-1348,
>>>>
>>>> "Determining the required first lookup level for stage 2 translations
>>>>
>>>> For a stage 2 translation, the output address range from the stage 1
>>>> translations determines the required input address range for the 
>>>> stage 2
>>>> translation. The permitted values of VTCR.SL0 are:
>>>>
>>>> 0b00 Stage 2 translation lookup must start at the second level.
>>>> 0b01 Stage 2 translation lookup must start at the first level.
>>>>
>>>> VTCR.T0SZ must indicate the required input address range. The size 
>>>> of the input
>>>> address region is 2^(32-T0SZ) bytes."
>>>>
>>>> Thus VTCR.SL0 = 1 (maximum value) and VTCR.T0SZ = -8 when the size 
>>>> of input
>>>> address region is 2^40 bytes.
>>>>
>>>> Thus, pa_range_info[].t0sz = 1 (VTCR.S) | 8 (VTCR.T0SZ) ie 11000b 
>>>> which is 24.
>>>>
>>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>>> ---
>>>> Changes from -
>>>>
>>>> v3 - 1. New patch introduced in v4.
>>>> 2. Restructure the code such that pa_range_info[] is used both by 
>>>> ARM_32 as
>>>> well as ARM_64.
>>>>
>>>> v4 - 1. Removed the hardcoded definitions of P2M_ROOT_ORDER and 
>>>> P2M_ROOT_LEVEL.
>>>> The reason being root_order will not be always 1 (See the next patch).
>>>> 2. Updated the commit message to explain t0sz, sl0 and root_order 
>>>> values for
>>>> 32-bit IPA on Arm32.
>>>> 3. Some sanity fixes.
>>>>
>>>> v5 - pa_range_info is indexed by system_cpuinfo.mm64.pa_range. ie
>>>> when PARange is 0, the PA size is 32, 1 -> 36 and so on. So 
>>>> pa_range_info[] has
>>>> been updated accordingly.
>>>> For ARM_32 pa_range_info[0] = 0 and pa_range_info[1] = 0 as we do 
>>>> not support
>>>> 32-bit, 36-bit physical address range yet.
>>>>
>>>>   xen/arch/arm/include/asm/p2m.h |  8 +-------
>>>>   xen/arch/arm/p2m.c             | 32 ++++++++++++++++++--------------
>>>>   2 files changed, 19 insertions(+), 21 deletions(-)
>>>>
>>>> diff --git a/xen/arch/arm/include/asm/p2m.h 
>>>> b/xen/arch/arm/include/asm/p2m.h
>>>> index f67e9ddc72..4ddd4643d7 100644
>>>> --- a/xen/arch/arm/include/asm/p2m.h
>>>> +++ b/xen/arch/arm/include/asm/p2m.h
>>>> @@ -14,16 +14,10 @@
>>>>   /* Holds the bit size of IPAs in p2m tables.  */
>>>>   extern unsigned int p2m_ipa_bits;
>>>>   -#ifdef CONFIG_ARM_64
>>>>   extern unsigned int p2m_root_order;
>>>>   extern unsigned int p2m_root_level;
>>>> -#define P2M_ROOT_ORDER    p2m_root_order
>>>> +#define P2M_ROOT_ORDER p2m_root_order
>>>
>>> This looks like a spurious change.
>>>
>>>>   #define P2M_ROOT_LEVEL p2m_root_level
>>>> -#else
>>>> -/* First level P2M is always 2 consecutive pages */
>>>> -#define P2M_ROOT_ORDER    1
>>>> -#define P2M_ROOT_LEVEL 1
>>>> -#endif
>>>>     struct domain;
>>>>   diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
>>>> index 418997843d..1fe3cccf46 100644
>>>> --- a/xen/arch/arm/p2m.c
>>>> +++ b/xen/arch/arm/p2m.c
>>>> @@ -19,9 +19,9 @@
>>>>     #define INVALID_VMID 0 /* VMID 0 is reserved */
>>>>   -#ifdef CONFIG_ARM_64
>>>>   unsigned int __read_mostly p2m_root_order;
>>>>   unsigned int __read_mostly p2m_root_level;
>>>> +#ifdef CONFIG_ARM_64
>>>>   static unsigned int __read_mostly max_vmid = MAX_VMID_8_BIT;
>>>>   /* VMID is by default 8 bit width on AArch64 */
>>>>   #define MAX_VMID       max_vmid
>>>> @@ -2247,16 +2247,6 @@ void __init setup_virt_paging(void)
>>>>       /* Setup Stage 2 address translation */
>>>>       register_t val = 
>>>> VTCR_RES1|VTCR_SH0_IS|VTCR_ORGN0_WBWA|VTCR_IRGN0_WBWA;
>>>>   -#ifdef CONFIG_ARM_32
>>>> -    if ( p2m_ipa_bits < 40 )
>>>> -        panic("P2M: Not able to support %u-bit IPA at the moment\n",
>>>> -              p2m_ipa_bits);
>>>> -
>>>> -    printk("P2M: 40-bit IPA\n");
>>>> -    p2m_ipa_bits = 40;
>>>> -    val |= VTCR_T0SZ(0x18); /* 40 bit IPA */
>>>> -    val |= VTCR_SL0(0x1); /* P2M starts at first level */
>>>> -#else /* CONFIG_ARM_64 */
>>>>       static const struct {
>>>>           unsigned int pabits; /* Physical Address Size */
>>>>           unsigned int t0sz;   /* Desired T0SZ, minimum in comment */
>>>> @@ -2265,19 +2255,26 @@ void __init setup_virt_paging(void)
>>>>       } pa_range_info[] __initconst = {
>>>>           /* T0SZ minimum and SL0 maximum from ARM DDI 0487H.a 
>>>> Table D5-6 */
>>>>           /*      PA size, t0sz(min), root-order, sl0(max) */
>>>> +        [2] = { 40,      24/*24*/,  1,          1 },
>>>
>>> I don't like the fact that the index are not ordered anymore and...
>>>
>>>> +#ifdef CONFIG_ARM_64
>>>>           [0] = { 32,      32/*32*/,  0,          1 },
>>>>           [1] = { 36,      28/*28*/,  0,          1 },
>>>> -        [2] = { 40,      24/*24*/,  1,          1 },
>>>>           [3] = { 42,      22/*22*/,  3,          1 },
>>>>           [4] = { 44,      20/*20*/,  0,          2 },
>>>>           [5] = { 48,      16/*16*/,  0,          2 },
>>>>           [6] = { 52,      12/*12*/,  4,          2 },
>>>>           [7] = { 0 }  /* Invalid */
>>>> +#else
>>>> +        [0] = { 0 },  /* Invalid */
>>>> +        [1] = { 0 },  /* Invalid */
>>>> +        [3] = { 0 }  /* Invalid */
>>>> +#endif
>>>
>>> ... it is not clear to me why we are adding 3 extra entries. I think 
>>> it would be better if we do:
>>>
>>> #ifdef CONFIG_ARM_64
>>>    [0] ...
>>>    [1] ...
>>> #endif
>>>    [2] ...
>>> #ifdef CONFIG_ARM_64
>>>    [3] ...
>>>    [4] ...
>>>    ...
>>> #endif
>>>
>>>>       };
>>>>         unsigned int i;
>>>>       unsigned int pa_range = 0x10; /* Larger than any possible 
>>>> value */
>>>>   +#ifdef CONFIG_ARM_64
>>>>       /*
>>>>        * Restrict "p2m_ipa_bits" if needed. As P2M table is always 
>>>> configured
>>>>        * with IPA bits == PA bits, compare against "pabits".
>>>> @@ -2291,6 +2288,9 @@ void __init setup_virt_paging(void)
>>>>        */
>>>>       if ( system_cpuinfo.mm64.vmid_bits == 
>>>> MM64_VMID_16_BITS_SUPPORT )
>>>>           max_vmid = MAX_VMID_16_BIT;
>>>> +#else
>>>> +    p2m_ipa_bits = PADDR_BITS;
>>>> +#endif
>>> Why do we need to reset p2m_ipa_bits for Arm?
>>
>> Ah, this is a mistake. I will remove this.
>>
>>>
>>>>         /* Choose suitable "pa_range" according to the resulted 
>>>> "p2m_ipa_bits". */
>>>>       for ( i = 0; i < ARRAY_SIZE(pa_range_info); i++ )
>>>> @@ -2306,24 +2306,28 @@ void __init setup_virt_paging(void)
>>>>       if ( pa_range >= ARRAY_SIZE(pa_range_info) || 
>>>> !pa_range_info[pa_range].pabits )
>>>>           panic("Unknown encoding of ID_AA64MMFR0_EL1.PARange 
>>>> %x\n", pa_range);
>>>>   +#ifdef CONFIG_ARM_64
>>>>       val |= VTCR_PS(pa_range);
>>>>       val |= VTCR_TG0_4K;
>>>>         /* Set the VS bit only if 16 bit VMID is supported. */
>>>>       if ( MAX_VMID == MAX_VMID_16_BIT )
>>>>           val |= VTCR_VS;
>>>> +
>>>> +    p2m_ipa_bits = 64 - pa_range_info[pa_range].t0sz;
>>>> +#endif
>>>> +
>>>>       val |= VTCR_SL0(pa_range_info[pa_range].sl0);
>>>>       val |= VTCR_T0SZ(pa_range_info[pa_range].t0sz);
>>>>         p2m_root_order = pa_range_info[pa_range].root_order;
>>>>       p2m_root_level = 2 - pa_range_info[pa_range].sl0;
>>>> -    p2m_ipa_bits = 64 - pa_range_info[pa_range].t0sz;
>>>
>>> I think this line should stay for 32-bit as well because we 
>>> p2m_ipa_bits should be based on the PA range we selected (see the 
>>> loop 'Choose suitable "pa_range"...').
>>
>> This isn't true for ARM_32.
>
> You are correct that the line is not correct for Arm32. But my point 
> was more for that fact you don't update p2m_ipa_bits based on the PA 
> range selected.
>
>>
>> ReferARM DDI 0406C.d ID040418, B3-1348, "Determining the required 
>> first lookup level for stage 2 translations"
>>
>> "...The size of this input address region is 2(32-TxSZ) bytes, ..."
>>
>> So for
>>
>> #ifdef CONFIG_ARM_32
>>
>> p2m_ipa_bits = 32 - pa_range_info[pa_range].t0sz;
>>
>> #endif
>>
>> This will be a problem for 40-bit PA as T0SZ = 24.
>>
>> So p2m_ipa_bits = 32 - 24 = 8 (which is incorrect).
>>
>>
>> To get around this issue, there are two possible solutions :-
>>
>> 1. For ARM_32,  do not modify p2m_ipa_bits. Thus p2m_ipa_bits will be 
>> using its initialized value (ie PADDR_BITS).
>
> AFAICT, this approach would be incorrect because we wouldn't take into 
> account any restriction from the SMMU susbystem (it may support less 
> than what the processor support).

By the restriction from SMMU subsystem, I think you mean 
p2m_restrict_ipa_bits().

As I can see, p2m_restrict_ipa_bits() gets invoked much later than 
setup_virt_paging().

So p2m_ipa_bits will take into account SMMU restrictions. Thus, this 
approach should be correct.

Am I missing something ?

- Ayan

>
>>
>> 2. T0SZ should be signed int for ARM_32 (so that it can hold -8) and 
>> unsigned int for ARM_64.
>>
>> ie
>>
>>      static const struct {
>>          unsigned int pabits; /* Physical Address Size */
>> #ifdef CONFIG_ARM_64
>>          unsigned int t0sz:5;   /* Desired T0SZ, minimum in comment */
>> #else
>>          signed int t0sz:5;   /* Desired T0SZ, minimum in comment */
>> #endif
>>          unsigned int root_order; /* Page order of the root of the 
>> p2m */
>>          unsigned int sl0;    /* Desired SL0, maximum in comment */
>>      } pa_range_info[] __initconst = {
>> ....
>>
>>
>> I will prefer option 1 for the sake of less if..defs.
> I don't think the two options are equivalent. So my first priority is 
> correctness, then if we have still multiple possibility, we can 
> discuss which one look the nicest to read.
>
> To avoid the #ifdef in the struct, we could possibly use a series of 
> cast. It might be slightly better because a reader will be less 
> confused on the type change.
>
> Cheers,
>

