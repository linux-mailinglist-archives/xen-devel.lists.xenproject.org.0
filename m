Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CFD66BE8E
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 14:02:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478622.741902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHP7w-00005k-KF; Mon, 16 Jan 2023 13:02:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478622.741902; Mon, 16 Jan 2023 13:02:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHP7w-0008VM-HQ; Mon, 16 Jan 2023 13:02:16 +0000
Received: by outflank-mailman (input) for mailman id 478622;
 Mon, 16 Jan 2023 13:02:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SJiS=5N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pHP7u-0008VG-3Y
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 13:02:14 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2083.outbound.protection.outlook.com [40.107.21.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe1f786d-959d-11ed-91b6-6bf2151ebd3b;
 Mon, 16 Jan 2023 14:02:12 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB7106.eurprd04.prod.outlook.com (2603:10a6:208:191::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Mon, 16 Jan
 2023 13:02:11 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Mon, 16 Jan 2023
 13:02:11 +0000
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
X-Inumbo-ID: fe1f786d-959d-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CwqPCCa33SVGKelYnh8fHUWgyKdzXEvAeZ+1kBtBofycvGQ6gcNj6PNy/FSYUfUoJ8MHV8ajjpZNDUljbqhMDWQ+JovSBi6oQ1WuxlGfClAMBRQKmJc0DT5HtZFl7MbEQrZTPRk7L2EO7bS0WbOm57ngjrxOyMP2BsYL3KgfRIhh/5HuXxpuzReObnOD+E8no+oOdDghNEbNpYdkLGwiaeCfLZ/F/+ZR6l2vpWYVWFYKc9Zxfzs5tXP9YZXDxbwMwTZDb5PHFpNVFQ2+YFG9dBpA3TOw0yPoKPL/FrLWmYYEaRQjADq+/v7mRQlvbgVix+MkSipn0GsdpiLILv6GCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HPcv3kBseubSGIczE+gyQLRvkyIRxf4QdIzScOTg1hc=;
 b=K3/ROOFoMIE40kXmd0YFQidM2LkEhelIzsUYwyeqfdtZTUUzshBaRo0YasL5Enx2EYH+RvJI6QBVsX59WY5O9NjgVlnuk8WRFOsWhu9jhbxU14yeWq23VLVscDq8d1y3gmHJsb1P/xDJcs9CD5P51rqdPlKE5KMAxoEWqK9lAipUSpfyMIRaEo4JZJhNMtNpq19oidDlotj0VD3Su/lmnM1jZS+hCTP/zyYgRqCDssCFqnd3DZ/TmivW+YAquWcgiZGDj/LO5bibJjxa67+j3KABsXPhaY2307YW32SXcDmGgTpeUHNYNgM4v5jFgQ3aexd7Ag5XqIhpnrs1gEN/9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPcv3kBseubSGIczE+gyQLRvkyIRxf4QdIzScOTg1hc=;
 b=jU+Po0CZCUKq4SUXazJxvt3aUDf2PiiXFbRhMYtuI4gSJ+GEtu1Za0bwE61GCTFg3dnqVohOTnxjTEUHSH+CvHcgRam4KKFnwTUFdh7gHff8pdZDZVKyHfJOxnTkIF+eprAzMLqw0HHuX5aeqnIZvLfiFlaGrCiE7sSWrthEUMW/Y5dRf+BqyMnKbNqA3k9D3tSodNK59KGASKwNCLtFnJUSmflG4TAcyZyeNeDOY4J8ll3JnOZLlUHrV16Bylac60ZJI8ICKMUrVcyLEITQK9r4vGb/8EGx4WyLu+SlvGClK5geSlA78UbpSEP9l4EK8Wnu8jEjv8vCiIZBVxVCzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8ffc0f3c-eee6-ce1c-70c5-a21931026bf5@suse.com>
Date: Mon, 16 Jan 2023 14:02:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 02/17] xen/arm: implement helpers to get and update
 NUMA status
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
Cc: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230110084930.1095203-1-wei.chen@arm.com>
 <20230110084930.1095203-3-wei.chen@arm.com>
 <9e32ffa1-1499-f9cd-7ca8-f9493b1269cb@suse.com>
 <PAXPR08MB7420E482CACC741B1BA976569EFD9@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <5a802657-a6e8-9cc3-fefb-09a7e68d1e5e@suse.com>
 <cb2ba9fe-e29f-c44e-9139-701f894060a8@arm.com>
 <7c5f0dea-4aed-d8f2-363f-758ecce0104f@suse.com>
 <PAXPR08MB7420AE4FCCF31C35D3FA3EB49EC19@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <PAXPR08MB7420AE4FCCF31C35D3FA3EB49EC19@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0148.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB7106:EE_
X-MS-Office365-Filtering-Correlation-Id: 47444e97-94cc-43fc-07ed-08daf7c1e116
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SuCthXXTC58fh67bp/WmMUlc8o4OmRKYoYtO6Jds1UaQ4I9HvRVo7UA1/bh7lS0d0vNnXs2X3IuYMQYsWOEyx6Tu/AcS24yvGDR/8kS/XZ/OUYUGWiXLgkUCPoLMGVeI4FHda0/IaK9AFkkD8aEqSFmO6RSy+pWRbz5kSeKrtXtfFGBel82lwp684UGtikn7mhlrOkhKdhdfQfp+yDDoS8pr2s+/qyVvnIgf++mHIzWq4jxobjaOam0uQV6SHxY8EHHwgKBsyxlrccMXH2ceiNx1FneMEiuXBZV8q8aEdCASkuhiQVzgTe1A459zINOwSDnGuMCysXbGYVli3SQsaGPUE26cGwpd5DSdeST9gdz3s8urP1rnCk6rMQ8A99aYAgCkq+zMsIFfa1jRnsPRVe3R+KPlGPYJCrts19DVfZLijFK3oTW1DGvPHZ69Es67m/5V4XHneACPlze3Iun/mPaFhIml7FbcjAOeh1Wt2aDMfsBvi3nvWc1jLdlLD7/5xRigDVBB+yaE1ObRAuXPOfQk3/QCTU5c7xBg3T2C2pqnZpCed1WXdgVQivgTa2j3WlTmkQzBHWM37L2lZzTkOZNJdyJ7uzLNdD0sYFCbgkqz69JZfM0upg4a94kSrd/NEg1FM9v5A6V15qK69kcU4fJ3J3A/fHAeUPZU7sTvjCoSd+dV0XbNtRZ8c27BJpzZYp7kjRlDpKzbtWZ24FylQJBV8yzFdkyaP8UH8GNkpa4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(136003)(376002)(39860400002)(346002)(451199015)(31696002)(86362001)(36756003)(6512007)(186003)(6916009)(4326008)(8676002)(53546011)(26005)(66556008)(66946007)(2616005)(66476007)(41300700001)(6506007)(316002)(54906003)(6666004)(478600001)(6486002)(15650500001)(38100700002)(7416002)(2906002)(83380400001)(5660300002)(8936002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bW5MWGkyR2lCcU5FS0xMZDY1MVRUSm9YN3NuelNYZGtSRDl0b0EzWWxCVGI0?=
 =?utf-8?B?cVRCanBqQm04bmlQdy80UDZUNVRvT0pOMS9nNjM5dFN4em1pSWpqT21ycXQ4?=
 =?utf-8?B?a2ozcWtnOThRUkZqOWorWHREY2c1RFVCMzIrT0FEWWQrMThkNVVjSUZ2RVhp?=
 =?utf-8?B?VnJvTlgySVNsbEtad05UL0dia1BPV0wzVzZHZHNjOENCQVVMUUQ2eW5FeEp6?=
 =?utf-8?B?YklJRWJSYmJFSk5rZ0laTHB3aUQ0QnBMZ1Y4bDdTRTQ2SGZTbFRwUHNGZ09R?=
 =?utf-8?B?S1NLTkg4UlpldFZsUjQzSUx6SDU4OEplNk9vbjJ2NHpZMnZnWVRGd2h4ZW9J?=
 =?utf-8?B?bnpTcXUwSm1TazJIVFVWRmd1NFcwMEZkdFc0bkI2MHpWSXBNVEdHeFRzQ2pl?=
 =?utf-8?B?NHBLc0RSUmRSc0FlSkZvTkFJejh5NjRQTUV2L3dLbncxQ29RMktqUFloTFBB?=
 =?utf-8?B?b0p1QTZFa2Z1T0tjd3djWWJaWjJ6QzUwZ1dnN2hUUThDSDVFSHFYL0VmTXk4?=
 =?utf-8?B?bkZ2QUFndjAzWGFvVElkQWlJVWJCWmxJQzFySjQyb1RiTVlhNDRKdHBrMXZL?=
 =?utf-8?B?Q3pNNStmd2FwMlk3UW1HWlVkTERudkczK2F4bTQvcldpTDBLM2pLK2Jkanpr?=
 =?utf-8?B?MHkyVVZ5WXI2OWFOUUoydFpGZWVvOFBlMHlGQ3Q3d05CRnNYYUdHbUFtbW5T?=
 =?utf-8?B?RkR2ckpVVHVDR1BocHlDenlidGlHR3pHZGVlUVM5V0xQbHo3cTFxWk5mK0lL?=
 =?utf-8?B?YndqSTVIb2tZSFRJMUR0NERsRk54M1F6VjZHeDZ5NGN4ZC81V09ZVTBxb1Jh?=
 =?utf-8?B?dDRQTFVzUE9USmZmR2N0TG1mWWJBQ2FJMURuemYyM3lGUEIrTEFuZnhRMDNj?=
 =?utf-8?B?NjhpWmRPbVZIcUZuRTZSc0JicUd3WkdlRWl1NFh5ZjBURXNzNzBmM01GUGZO?=
 =?utf-8?B?QjE0czY5TW1pNzBKV25OUmNUaTRLK2poNkFXbVRGOWxOWEFxWmc5MW9RTmc3?=
 =?utf-8?B?TlZMTHQ1aUsrZ2tieVZCREVXam83RWZKRlg4WnRXRzV1MUc1QjltQ3pFbFJ1?=
 =?utf-8?B?VWt1dnZYVmJqRWwrczg1RTdvV1ZhbHlZcGZmWmMybmFTT2wvM3pWT0VzcGFT?=
 =?utf-8?B?a3BBcWhRV3o0ZVU1VDNTQVpsM0E3aGpxVWFtKy84NVJCOEQzV1RZT3NwT1Bn?=
 =?utf-8?B?U202SXMwazlRQ3V5b3U5RGJvY2lNOHUrN0IzSHoyQzB2bldRSlVXVGVuWnJH?=
 =?utf-8?B?QUovV2lHNVBIVU5IakZyOHZTUlFlQ05JNVIrSXQ1RzU2WkwvQ3Q3bWFaUEJT?=
 =?utf-8?B?cnQvWnFyc1A4WVpONUI5dTdzVFVTV1VMNGEreng0Sy9tMDJqYlQ5UXYxQVMv?=
 =?utf-8?B?ZlBhdkZjQkFTMGtrUTBacXY5NGk0Sy8yelVxZkV4bjZjbzdMQSt0RDJ5UEEv?=
 =?utf-8?B?MXZIZWlUUE9wN2NrUlBmNkYvUG9iQy92SzhQL3RJVHd0ZXZkU3dZaDRENTNv?=
 =?utf-8?B?VFRISFY5RTVJRFNubmVLU25CU3l1ZHp0eGxqRnFKbTNaT3A4THI2eVNVTk1F?=
 =?utf-8?B?d3FpWTkwRHRTZHZxTlVqOWhQVGhyTjBCRjlWMWZPSWI4ZTNoVnAyZFhld2VC?=
 =?utf-8?B?b3F3cUN2bTc2TXNYTWlBWVBrZkpCdGZkS0lDdXEyQkd6QzdpWVJzWitqWUJL?=
 =?utf-8?B?SW1VUWJnSWhOWjJzWUdpdHB5TW5uY1hGMEpJdWlOOVJIeDFkbGIvSlpGNlhY?=
 =?utf-8?B?eHJaRGNSa3lBQitERHBuWjJ0YXdvQUZaU2pPM0RoUStnbTQ2SVNXOTdBTzJX?=
 =?utf-8?B?SUlEc3NlazZzSm42Wm8remV2WVRjUlc1SXJPSTU2MG1ONjMxY0hEQlpWSGtR?=
 =?utf-8?B?MmJxM3A4R2xQdzVSdmFpcjhCZXZYbXRLRGpJWUV6WXh1SzVFT3RjMGVvQVZQ?=
 =?utf-8?B?NDZ1ckt3Z3ZBZktpT2JoWUpiMU1YeVEwMUttdmF3OFFmVXNta0czVTFVRGpR?=
 =?utf-8?B?YmFMaGNBZWRIUG9xVkVOUFdwR0ZBY3lRR1NZMit5MitzYmUveThsMGpvTEkz?=
 =?utf-8?B?dHJ2MStGM1l5V2s0aWlQMEhURW5PRlJlbUdBZHRwTXBQa3g4UVphMzdPZk9q?=
 =?utf-8?Q?jpw3LtAzEpttHmCEYM189p6LQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47444e97-94cc-43fc-07ed-08daf7c1e116
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 13:02:10.8881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LiWK3ds5efcmqTs4PBh8c8kjvW7aEsVVlQbEuc+QMvnYui3S8Zu/dBRHZpv8ZueNitziXHj3sFw1zTmhVVxIOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7106

On 16.01.2023 13:01, Wei Chen wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 2023年1月16日 19:15
>>
>> On 16.01.2023 10:20, Wei Chen wrote:
>>> On 2023/1/12 16:08, Jan Beulich wrote:
>>>> On 12.01.2023 07:22, Wei Chen wrote:
>>>>>> -----Original Message-----
>>>>>> From: Jan Beulich <jbeulich@suse.com>
>>>>>> Sent: 2023年1月11日 0:38
>>>>>>
>>>>>> On 10.01.2023 09:49, Wei Chen wrote:
>>>>>>> --- a/xen/arch/arm/include/asm/numa.h
>>>>>>> +++ b/xen/arch/arm/include/asm/numa.h
>>>>>>> @@ -22,6 +22,12 @@ typedef u8 nodeid_t;
>>>>>>>    */
>>>>>>>   #define NR_NODE_MEMBLKS NR_MEM_BANKS
>>>>>>>
>>>>>>> +enum dt_numa_status {
>>>>>>> +    DT_NUMA_INIT,
>>>>>>
>>>>>> I don't see any use of this. I also think the name isn't good, as
>> INIT
>>>>>> can be taken for "initializer" as well as "initialized". Suggesting
>> an
>>>>>> alternative would require knowing what the future plans with this are;
>>>>>> right now ...
>>>>>>
>>>>>
>>>>> static enum dt_numa_status __read_mostly device_tree_numa;
>>>>
>>>> There's no DT_NUMA_INIT here. You _imply_ it having a value of zero.
>>>>
>>>
>>> How about I assign device_tree_numa explicitly like:
>>> ... __read_mostly device_tree_numa = DT_NUMA_UNINIT;
>>
>> Well, yes, this is what I was asking for when mentioning the lack of use
>> of the enumerator. Irrespective of that I remain unhappy with the name,
>> though.
>>
> 
> How about DT_NUMA_DEF or do you have some suggestions for the name?

Yeah, "DEFAULT" is probably the least bad one.

Jan

