Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2223C66BC96
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 12:15:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478571.741826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHNS0-00029Y-SA; Mon, 16 Jan 2023 11:14:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478571.741826; Mon, 16 Jan 2023 11:14:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHNS0-00027N-Ow; Mon, 16 Jan 2023 11:14:52 +0000
Received: by outflank-mailman (input) for mailman id 478571;
 Mon, 16 Jan 2023 11:14:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SJiS=5N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pHNRz-00027F-CU
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 11:14:51 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2053.outbound.protection.outlook.com [40.107.7.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fde9c002-958e-11ed-91b6-6bf2151ebd3b;
 Mon, 16 Jan 2023 12:14:50 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Mon, 16 Jan
 2023 11:14:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Mon, 16 Jan 2023
 11:14:48 +0000
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
X-Inumbo-ID: fde9c002-958e-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M3c3Tl76cMDB3nz4p7F5UO0NzmxjhvLU+qghavBHzpILyxAIjgXUl5WmJYoRSOBBzlwm9fDArxBYSE0G/VOD6Y5bfjyFzoFUWBmg3mrdwEtLWe4hYAhUbhGfhMvym6A/IVueFFJpAOqC6gaDt6m8SSpV9vTYydHFVKtZJzvgt0MRhi8kaTwlS1baLZbjtsLTib3I96IO0scv/6xfRhgf3xvyWMGY9mD/WFMUr/ikToYWEnn5V5FkfyAJEoSpH3YebFoyS7Ybwr9NUFBIADH9n0akzntAiOQkVwy3K1+GdxMFvsE6mLqSgleUV+U0pXFFCY4wzTWiNaa2fMT02HdvTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GEhwphNCYfyS6Z7ABBAnU5IV5efcZTpY+saNniqbPX8=;
 b=epxfjgky1KbzlzdVBDUn5+qsMF5B4lm+39g5JnD0zSR70VCGZQ1R+1a9G8ou4V+lQbhvepdAtIde/LO42mLylnDGj3racaFXvlN3992uekcTW8D16FqtdSc8BwXA2LEIYP92iTC0yPrBZvQfkOAQkGZd9fha9GQKohCInnfkKVzre4cprkXbRn3Jo+AESvN7IwI7RR97Jv3OnC+IxZGkw2Fx9TtJkK5ReEueioxGvKbqhSIAZN4MsqaFt1zp7sE1YDCboe8f2Nqyeg/WsUpoNnDoWdGfDX7rL+FNWWouDHqPAVc/ONtvVTCrMEeHb2Ob/B9BAwWDukCcYnLPGEKMMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GEhwphNCYfyS6Z7ABBAnU5IV5efcZTpY+saNniqbPX8=;
 b=E2vWpyvhfb5bGEAa/3gxxNi4kBFeN7rwr+/vHwUs54UX3k3ie62iAvEJ08qKjidhP5kVu0aHXR4F4wz0+b9tTIlBbR3d2I4uyQqPM2HBiOiO+PXaPhfP3pEKVUMZqd0uKHppCXpcfkqCkwZicM+WOVVfcjgOZsBDH2tBLG7z338R6NcOLYmglR9gHKpkf7X938zgLalL8vICMTB2ytuhrQGWPWTyXDhWLZE5qPAYLXndbPBoIxpYFU5wJpsYcoUnaD8nMDgzgdmlhlQCT5QG4r1tKEY/o6Vjh+yTivRdyxTI+0gVDLPHmKL1iIkxsiQTppyyZos6Auv6cNR2HZkRkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7c5f0dea-4aed-d8f2-363f-758ecce0104f@suse.com>
Date: Mon, 16 Jan 2023 12:14:45 +0100
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
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cb2ba9fe-e29f-c44e-9139-701f894060a8@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB6900:EE_
X-MS-Office365-Filtering-Correlation-Id: b7b54ee8-f809-4db7-8d55-08daf7b2e0c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OmdOB1tblR5MulVc7IEdj8iDn8wvmy+bApXMNbvnUnlJkAbGBb7DjS7W00Apwd8BNTNr62CvGoap3Jc/qv0bmUEAZiLkBdmq8ole/bSaCD1vXYEyIJzy0PP8OPaVUmkBPqoj1yQh06wHkESrtc7CyYK79/Win9jr0xhnAHOZYn8M43PBcLnJn2pR92j8fyQjVTU4q8qsWR9XrRIY4PZkKuvUsgn13pC0mC0Q0Dvwr33beb5Dolf6T0j+Ju5AA/3CqN27vHn/IlUJ129nsu2s5CJ4qkpW2eCF6xZlY01ihJiG+24loSl/xQ5JZnkcdkBBJ+5apomV6mtVg3xG7brKJN3cXbTJAYGfWnKQagiB8tJIAH68QJmj86app19roiXgXVcTvwMg5Rk29VUmMQr35REz1GymOxG74slZR2ZGAtk4fjlGxePwObCbSevssSkWAGAUUSNYjHOXJN3dlFscbVAl9vnJiFc9q+MHLMQPMODfOBol2kAezmRrNy+Q3P2lrj+i3Bj7s5HHfwEIz1XEV06SQnfHjERnpoEWthly1als+S7qdedoW7It+hMzxHceuvlKJxkM5EXqSOT2z5KEw8nK8n0L0wz1upCoHNcMW04nQD/aBrpQBoVPN7wD9UbUt1XljLtMzvEOooZQSpU9W8kgbIJO7Dy+jeapSAiF84b1HoziWju6okHk2cp2XX+fg2keAnx9qZ12aMAw+kFXgoiW21cQ71RUSjQNdR6MO4Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(376002)(136003)(396003)(346002)(39850400004)(451199015)(2616005)(6916009)(66476007)(8676002)(4326008)(26005)(6512007)(186003)(66946007)(66556008)(31686004)(478600001)(54906003)(41300700001)(8936002)(7416002)(5660300002)(2906002)(6666004)(15650500001)(83380400001)(53546011)(316002)(6506007)(38100700002)(86362001)(31696002)(6486002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGNFbXVBMXRrNWRvLzBML3ZUa21MblJ6UWErWXg2d2JTNkFFRWthenJoa0Uz?=
 =?utf-8?B?WHFiKzY4a01yWEFVUEp5d3U5TC84RXFDU1gwSFdXK1JURTgyWTBTeDcrMnFn?=
 =?utf-8?B?Tnk0d2Y3QjhDekV5OTlXUkd0QUZFczMvemJieWFmV3JLNUN6QVpJRkpGWHNI?=
 =?utf-8?B?VkFQMTA1OGdzbGlhcUQ3cmxoWTU2UE81cW00dENUTnA4RHI0UFZwU08xdXNF?=
 =?utf-8?B?eURyNlRrSEJ4KzcvWnNPM1pXTWFPTEJHd0lyOTkwYTIraEhBa2FZazZmQ3cv?=
 =?utf-8?B?b1Z5Yng5czBqZ2lydEpOUS9IOUhRd0hXRW4yYzEvWHNad3A4WG03T1N6TUVS?=
 =?utf-8?B?OHNaWUNLWXJzekJUNHlSbnltN0tJUVVJdW5EbVdsbDUyR2w0dDNjZ0VmM3ha?=
 =?utf-8?B?ZlU3cHZrTEdQMDhUQ05MdUVuUUpkbHdZV0JQUm1kMWNyODkvQ0JrUnVzYlBa?=
 =?utf-8?B?aW5lby9pUkRtSXVQZUtTQXN6SFBrTWJxMjNxVndzY1hraWREZkF4NFZna1lD?=
 =?utf-8?B?TzROMWFlSjJYMkc0K0NQS0Z3Y1lyMlNEcWlSOHNNWkZjR2ZZZGpSY2FvYkI0?=
 =?utf-8?B?RUxzNHJ3TkRuK21pam1CNHZuTmF3YW9vdTVSa3dvNEpXeWJuT2VaYWN1MW9i?=
 =?utf-8?B?aXQ4cnZPekpPa1A4T3VQdXZjL3Bia0plRWUxMWFIc1hvb0pqRDlzL0dsQWFj?=
 =?utf-8?B?RVhiUTJ5K1lmQS92bmJ5QzlZT29tdGlrV2VwZnQvNkV2RHBQQTNQd0gvY0ZP?=
 =?utf-8?B?YXBqOG1EbElNUVhucmIxV3JsdzAySks2cmszTlB5RGtIak1jaDg3U3hFbUN0?=
 =?utf-8?B?Qk0reG1WbDFpbmdnQmZxV3dZWWpaTVNtV3QyQVIyZEpuOXU1MmxNMXpPSEtG?=
 =?utf-8?B?TnhYVnpPZmZQenRWOTI0bHlDY1IveW4rdU9yVTNzOEtUZDVzaEpyZTlmbHVD?=
 =?utf-8?B?aUhFb0tLVnFhd2VjUWYveTJrRkpjOHJUOG5rUFIweVg5L3UvSkZxZWR2NTZP?=
 =?utf-8?B?TnF5MHE0YW53MVYvZU9KdE5oa0huVXczaE01MEhVbXdDTEl0bEhsYkdRakdn?=
 =?utf-8?B?TjRaNHNhVWUzU2QwTUFjUUZNSEtsei83bEZza29tQXZyQ0NuMzlKZWkycXdp?=
 =?utf-8?B?Rlo3YnZVMEpEZWU1dmJoUjdyMmp5N3lKUE43bXVCVGZQTFZCRDVRdjIxaDJH?=
 =?utf-8?B?aHVnOTJpZ3JreklhR3hTeXIwOFI3WXRWM1NndWRPWVVCMnphL0VKK3l4MUZo?=
 =?utf-8?B?aHpzV3RTQUR2elJGWkoyMitKYm9wYmlVVzJqRzhOR2phb2hteFltYkRKZDV3?=
 =?utf-8?B?Qk1PbzBhNzk2RlpHbHRzbldaY24wS1Q2TzJySXN1YWFCRGRzNkdHcDJ3bEJ5?=
 =?utf-8?B?TXRIbU9meWNuR2RyUkljS29YNXN2SU1meFVKVmxwZmMrQW9uYnNmaFhtRlA0?=
 =?utf-8?B?TGcza3dvNEdqREZwS2RDeC9XQjRmRGpyOGZMVmhlcE52Nk9mYjdPcUhHeUFp?=
 =?utf-8?B?TERnalFCbWo2SHp3QURmNk8zaHk3VXJ0RXJ2dFA5ZEpCUU11N1hFNnNpZlJT?=
 =?utf-8?B?S1JCVVFTQVhSYnYxNnd6NmdKeFNROVNDMFBiN2lWQjVYUHlMS2gzQTZSSzJ0?=
 =?utf-8?B?U01MZ2UvVGRrV0xzZ3VlTlNsL1UrbFcxdXVVVURLbFBFVUwrRGUwcmRmRUNi?=
 =?utf-8?B?ZmJPM2lRazA2OG51eWhMa1FtcEZvWjdiVXY2MGN2UVRoYmF4RUQwN1pEdlJj?=
 =?utf-8?B?T0JoVGpxNTg3VE5XWXlKYzFSVTF6ZkM2VG1EQ2FtYXpOdExyNXhaMlkzdVRh?=
 =?utf-8?B?YjBsa2FUZE9tK05VSmhSTEhUQTdYdVI1TEpLallINlNqN2J1cE1rSkZMTUp1?=
 =?utf-8?B?S29mRi9CYmFObitJakVhU1M3N3dUVXFrdkNJWnp3VWczcUg2My9pejRHSmo1?=
 =?utf-8?B?d0J4VzVRc0MyalFlUGdiNkpIVVpOcm9UOHB5OFlaMkZtQkc4V0tkcHo0KzZP?=
 =?utf-8?B?bHlvdFpOcnQvVW1uSzdsTzBnOExuV3JOOGU1SUtiTE5hRCtqcFd0eTAxMytI?=
 =?utf-8?B?RUxXeG1LTFVsNnF6NlpjdGFOZ0ZTbW9BVDlmeFc4Q3pGZHhzbWRMMjNVbGFP?=
 =?utf-8?Q?2jV7ujTXJYA1ZuBDowcli27Je?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7b54ee8-f809-4db7-8d55-08daf7b2e0c2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 11:14:48.2963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e5xCsm/Cmq7xJpIKwGEZEslNMMbn1Op0ebnXaWQ4emFPBQCT1Ll4uVF7RZq38W1ND+NdsWYBwFZC/xWwqBvCaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6900

On 16.01.2023 10:20, Wei Chen wrote:
> Hi Jan,
> 
> On 2023/1/12 16:08, Jan Beulich wrote:
>> On 12.01.2023 07:22, Wei Chen wrote:
>>>> -----Original Message-----
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: 2023年1月11日 0:38
>>>>
>>>> On 10.01.2023 09:49, Wei Chen wrote:
>>>>> --- a/xen/arch/arm/include/asm/numa.h
>>>>> +++ b/xen/arch/arm/include/asm/numa.h
>>>>> @@ -22,6 +22,12 @@ typedef u8 nodeid_t;
>>>>>    */
>>>>>   #define NR_NODE_MEMBLKS NR_MEM_BANKS
>>>>>
>>>>> +enum dt_numa_status {
>>>>> +    DT_NUMA_INIT,
>>>>
>>>> I don't see any use of this. I also think the name isn't good, as INIT
>>>> can be taken for "initializer" as well as "initialized". Suggesting an
>>>> alternative would require knowing what the future plans with this are;
>>>> right now ...
>>>>
>>>
>>> static enum dt_numa_status __read_mostly device_tree_numa;
>>
>> There's no DT_NUMA_INIT here. You _imply_ it having a value of zero.
>>
> 
> How about I assign device_tree_numa explicitly like:
> ... __read_mostly device_tree_numa = DT_NUMA_UNINIT;

Well, yes, this is what I was asking for when mentioning the lack of use
of the enumerator. Irrespective of that I remain unhappy with the name,
though.

Jan

