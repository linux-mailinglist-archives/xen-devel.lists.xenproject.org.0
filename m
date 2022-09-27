Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D1E5EC7B2
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 17:29:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412771.656211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odCW2-0000K0-Be; Tue, 27 Sep 2022 15:28:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412771.656211; Tue, 27 Sep 2022 15:28:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odCW2-0000GX-8a; Tue, 27 Sep 2022 15:28:58 +0000
Received: by outflank-mailman (input) for mailman id 412771;
 Tue, 27 Sep 2022 15:28:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kd8q=Z6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1odCW1-0000GR-35
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 15:28:57 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2042.outbound.protection.outlook.com [40.107.21.42])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 196af4ad-3e79-11ed-9648-05401a9f4f97;
 Tue, 27 Sep 2022 17:28:56 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7339.eurprd04.prod.outlook.com (2603:10a6:102:8b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.15; Tue, 27 Sep
 2022 15:28:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5654.026; Tue, 27 Sep 2022
 15:28:53 +0000
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
X-Inumbo-ID: 196af4ad-3e79-11ed-9648-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UjjF/Iq7LreQgAwbyj9W8kTaVLzwqL6GWdmJfrfHSHmWEExqw3uYN5OGj5mTlOi7JyaWXtxl8qQzDKz3ZinlSpe6EyvonSb2Elok0PVhXXaBhGb8zpDSDRDMUwRnAAoOnsjt+FDwLJxsly6xzhsmCIqnnZMMXjkBsSDQWXGCEHf4sJCPWlJCYMp4A9U8V6SuJv93qEz2tEbFAXKcx17T0SVv7PyYeLKILmstX0rAHgzcN/oNh59kYdsp9wTFCHM0rtTbCbaRVkFCUBr+fl2ACF3mSJzAmKtzqLBIJgU9AyDKHQ3U6yxpitgklxeEQB7QnS6AmL4YUq8aJmm4xtLnjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=53kokOxlv3mhNzEXo4N2e7qjZ7GtvDibULuNMsr4bFs=;
 b=QRkQjqdFfDKiPcBEpKblWJVT2vWwlaKWvwGJQY3m19gkcYNxt5/Ef53qPG3rFAgY4FvKMGil7lNJ/G8NluGHN+xD0Y5sCnd6MNJEzM1M7ZI2u2fN9cFujvixVf5JuidR8PfmAqyx/FZ78McGXuAXn44VYdk1S7Hex+dRvLSTbJ206vYy9e8q+inDFr+WAHOPvIjeyePPyeoPuHY/itBazD3b3AXe5ywAZFJ8Td2XJc3CVe3GosbS4r+hpqZvZncKMJ9V1aQP5PWOfMRd2gNTMOnfO16lbaLLZ5i/kdk6yybXYUdUcSGbMqIWv0LsJ7hPjfEtbiJWr7be0GL0ouwMcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=53kokOxlv3mhNzEXo4N2e7qjZ7GtvDibULuNMsr4bFs=;
 b=RFQB+EMAWxBy0xkD95icquL/r3ZxqJ2fu+nIVzTTJ4bTD7B3TcHxG17bTg8btNBUYHPeeTz/d+6UmMifwWlRUOQWY6ssRynRxBOMiPb51eKt66cz9LrmYAvzhl8NhWS8o9cqAWCI3GWZXa3IW/UldRxjJSs9vfg+EQ4oeJXLcQ+ejOVNFzokvPkakKrcqGknY7c0jK49r+8NvBFqE59NwCYNXbBLfavz+TUVuMew1bnZwRyxsC/xkuYLnGBeUAuXHmOSuvof2LeDYRqizoH+AeVaN3EPYSaf7ABic1C8Y9R5mH9uwBRpPyunb/Cm6K2Q16syrA61O7uiaooQ9Q+wRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d1271ee7-fe40-4264-3333-926efb65197c@suse.com>
Date: Tue, 27 Sep 2022 17:28:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 12/12] xen/arm: add cache coloring support for Xen
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, julien@xen.org,
 stefano.stabellini@amd.com, wl@xen.org, marco.solieri@unimore.it,
 andrea.bastoni@minervasys.tech, lucmiccio@gmail.com,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
 <20220826125111.152261-13-carlo.nonato@minervasys.tech>
 <93471d92-bc61-56fd-5b52-413303d35da1@suse.com>
 <CAG+AhRVRQ9ey9NzsDo4Np+z0V=sX-uGYL_zLhJ9Z9zFb3v+Hkg@mail.gmail.com>
 <8ba1ede9-cd8c-01ec-939c-e0915d7c18b4@suse.com>
 <CAG+AhRU4wn0B+Q-RJn3GS2MGvnagK+gEJ4woWkvA-JrHdJ_RTw@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAG+AhRU4wn0B+Q-RJn3GS2MGvnagK+gEJ4woWkvA-JrHdJ_RTw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0028.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7339:EE_
X-MS-Office365-Filtering-Correlation-Id: 20f02266-666b-48fc-d1ff-08daa09cfc43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JRuKZtwyanOqM2y3IkuEzie1tXk4lEI2puHNwQl0cgk4mQoYubjZ2HDztzdotw7I5miquw4vDXZAVlsYrY2IvozpWGO9VzCcZCNq+sGpGPirCbZ6epmBIompc8anlmT8Uw8d49um8AD7cDoGe0f/yc+1mRgzdwquIWXAkOKNNQgUyhW/M6Fm74xRSKah7oKBHVGVUYlsR8Ci6MPOlwvrv83pPWdbxsVPWRmSoiKj9UgsIAtf7E5toHBKmJCEf9DfOditSXzBzTGv2e1c0PrFMnTlFqY0eOH/wUek6IOc14/CYeXayXzLqe5J7fH9rrxjtSIZEPpfT3MHOp0bVPpd9DncjxoCbHI9kApD2wCTANLlqvlHZ9fLlI3AqH5zdN90Wz/Pri4hfiJw/zjqCWJdQXMXn9M3HLNn+o06Uyf4w+onvh4LVmtFqTy+t2nJae5MU3+NnKF4RwLt2LXn4+TPJRtT9PkJRK1oUVwcCKJ4X+T3eAyFwmn0dL3DGMYxEcNPal2zqq7MzoKHFPt+2+bAf/1LP2URcp8jnLpDZoRYqBhZcHmpoOOAP/p2UJKvhb5Aigy8dmspC26JZIjJccuhnPw2FCV8Rua5tvCZbYWpb5h8bU8+Enp1n8vsRwOavjFWNHxLlDbphmDl7+nUtmWeTWkbGdJdnQnnqEpcxuDa3QWpxiM1izxT8z07gBeQOp1EL/Wp4WunnmyTNtSZTyUwo1zCBBq2DfkEUZoopXB2YBESPSk8+8cctVru2VKziif3Jvxgm8Vv54/V3SBvmyjNoh6gnrB0A2pSIPha0P2iziY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(396003)(366004)(39860400002)(346002)(451199015)(8936002)(316002)(6916009)(36756003)(2616005)(31696002)(86362001)(4326008)(41300700001)(8676002)(66946007)(66556008)(66476007)(5660300002)(6486002)(478600001)(2906002)(38100700002)(6506007)(26005)(53546011)(6512007)(7416002)(31686004)(186003)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHltT0w1ZWk2bnhodjBXS2cxRDB6T0MzVkNCdDE1S25xenV3U0xNQ2dNNHJI?=
 =?utf-8?B?WUlzVG9PRzBhOHpGU2FWSUw1bzdlOFV1WUt1ZytQZVV3Q1MydUMwVUIxeUda?=
 =?utf-8?B?aUFtWVVPTDY5eWpBWHFEUXNaUEhqQ3gveXluUEJ5Z1JOclI3VzRvdkN1MTlY?=
 =?utf-8?B?bXI2OUZDN1JYVXJ6V3puQ1Z6dVV3NUZEbVBSbXRpWmx3UlN2UGlDVnBCZHln?=
 =?utf-8?B?aXRoN1VIRFlPSElGanRQdmJmc3dOVkNPWnVidmxvRWdFK0tTRzJmYmZjOWFQ?=
 =?utf-8?B?UXlvZ3RXNWR4ZFpnLy9YbVU3QWlGb0dpSHo4MWpJSm9FN1l3MXZYYVFSb1Zr?=
 =?utf-8?B?NWYzOCttbWY5Rk9LQVRvdEFSSXNIWDBQWjBSemFGSldTYUpwRURuREQyK1Va?=
 =?utf-8?B?cWFCUVdVdnNZWTBXQWIxVDI2TFdmMUZXZkVaWnBvc3RWQzR2WDN0eFBzQjVj?=
 =?utf-8?B?dzlZU1Vyck1tbWUwakFUUzB4SWUxWkFRY2xHTkxUVlZIZWd1ZlFzcWNadUxO?=
 =?utf-8?B?bm9ld3Y4K0JlZ21hQkVHVWNSUlpIYk4zeUxCVkZHeHk3NEtFbE83cllNNy95?=
 =?utf-8?B?T3VLQjlXU2t6Vkt1MFJjMFpXUmVMUGd1RFBrNzBZNDBtVUJEaEFBVldtanJJ?=
 =?utf-8?B?Y015YjVhV1Ryc0tuT3VtRzRlWlRPcGU0U2pZZSs4WEpPSFZ0Nmpoc1RSa2hU?=
 =?utf-8?B?Nk0vZEFBMXZERURaSFBDV0h3blJnb1diQnFJWWUwMEh2WGdZbHlyTlF0ckJL?=
 =?utf-8?B?OVpDeEdKeVN4TmtkQTl6MUJEWHp1bHJvZGdMWGh0UFpkVitiUjF5SUhySFpM?=
 =?utf-8?B?QTJRaDVmQk9FTFd3VTkrN2RWS1QrRzRaKzlqelM1dStzS3pQZWxIVWt3NENB?=
 =?utf-8?B?TVpSTG1mVEE0eWo3UGhpdWsxY0ljVWVENlcvVWhOTFZGQ1dmL09FTjlHaHNn?=
 =?utf-8?B?UXlObmxlYW9hd2ZkcmNycEVHTmszMGxxY0pYWUdJWGM5VGMvOG0rdWdmQ2FH?=
 =?utf-8?B?MDcwU205aHJabXZnT3Nya1NidjIyQTBON0RHUW4yU3d3NTVCbkN6NFBKdlJk?=
 =?utf-8?B?S09CSDErK2d2WmF1azZKc3c2M0xOWHk0MUVHRSthL3ZXZldjNG1jL0ZqekUw?=
 =?utf-8?B?NUZRN2NMMmdMMlAwR2Fidk11RHpEbENQUHZ2NC9UeEM2cVVIVzkzei9HeGtF?=
 =?utf-8?B?YUFvUFI1VW5weHBnN0ZVekpvdGFVaGd5dHJ2MTRwOEtTWW1VRzlDdlU0em1Q?=
 =?utf-8?B?YVFkMjRUcjVKb3hQKzZ0Z1FraUd4Snp1ZkkzQ3FhZmVKSjBmWG9GZzloalQr?=
 =?utf-8?B?WnhzblNOM3hVamJSM2NNcm1IVkJWY2QrcW56aWIxRm4rTjdKTmtwTUw5aXps?=
 =?utf-8?B?Ti9WNGJyY3NJRGtUTGF1cGhSOTA1VkRnWmdaSEYrb2R3bWxhVkQwQlp1ODJW?=
 =?utf-8?B?aXZRdTNtTkdUWmZVR0cwNlhYbTdQaGZTaU1FVmo1b2dtVktQVkxCcFNraGkz?=
 =?utf-8?B?UmNla0J2VWJVUVNoMjl0WGJuR3IwOWs0bWZwTXpwYVJLdDFEVElheEt0ckZJ?=
 =?utf-8?B?b2RwdVRzL2RwNktGSGpTNUxEZ0xaNnJHVGQ2WkxLWEJEM1Z3dU9IM3NKbG5r?=
 =?utf-8?B?Tk50VGJHOFpVekFtQTdESE5obWVUMUFWQm8yZGVWbVRLK0pIRUhTQjhjWlJI?=
 =?utf-8?B?WVpiMXdXdk5Nb0hyK3BTZ2JsUXpSZTM5enR3NE5kekUyaDVYTGJFelo2aHVk?=
 =?utf-8?B?aStNaXVQT09mQkdNTlJTWDJGWmtpOFZBa1FMSU1OcGkzbHhkUGF6TEtQODli?=
 =?utf-8?B?cmpxZmdaakc1V3VwYUpyWXVXQis3aEVqbXJOZEFuSmsweDRYaGU2VzVoSERD?=
 =?utf-8?B?OHRDSmRPaWlUc0k0YTBTa3lYZ1Qya0ZjNURIcTdPb3l0UVNLbEZMbHNES0Fn?=
 =?utf-8?B?V2sxUFNmaWIxR3lKK3ozc3dnWEkxWUpYaWt6ZTlueVF1MCtMME9rK1kwK0ZT?=
 =?utf-8?B?REF2V2tobnlwRXo1ZjRVazZFWFprMzVkcC91dEowL0o1QkNmNjlxdnNrZVRU?=
 =?utf-8?B?blY4YWxHV0Z0YzhxemIxSTNPSDJGUjEycUdhV01rZm9Cc3JyK3YxdDZlMWF1?=
 =?utf-8?Q?n5vYJDy+xXiclWhIciAsP1S9G?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20f02266-666b-48fc-d1ff-08daa09cfc43
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 15:28:53.5710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gegTpDsOb06B3glB4CXcrd/1XA70+frG2b+DCDuz+L7nshDX3pBlznuHwmkE9KIX6rRPSwOSDV31BeVFD2UOIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7339

On 27.09.2022 16:31, Carlo Nonato wrote:
> On Mon, Sep 19, 2022 at 10:38 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 16.09.2022 18:07, Carlo Nonato wrote:
>>> On Thu, Sep 15, 2022 at 3:25 PM Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 26.08.2022 14:51, Carlo Nonato wrote:
>>>>> @@ -218,6 +221,28 @@ void *__vmap(const mfn_t *mfn, unsigned int granularity,
>>>>>      return va;
>>>>>  }
>>>>>
>>>>> +#ifdef CONFIG_CACHE_COLORING
>>>>> +void * __vmap_colored(const mfn_t *mfn, unsigned int nr, unsigned int align,
>>>>> +                      unsigned int flags, enum vmap_region type)
>>>>> +{
>>>>> +    void *va = vm_alloc(nr, align, type);
>>>>> +    unsigned long cur = (unsigned long)va;
>>>>> +    paddr_t pa = mfn_to_maddr(*mfn);
>>>>> +
>>>>> +    for ( ; va && nr-- ; cur += PAGE_SIZE )
>>>>> +    {
>>>>> +        pa = next_xen_colored(pa);
>>>>
>>>> This may alter the address, yet the caller expects that the original
>>>> address be mapped. I must be missing something?
>>>
>>> If the original address color is assigned to Xen, then next_xen_colored()
>>> simply returns that address. If this isn't the case, then you're right: the
>>> address changes to the correct, colored, one. The caller should expect
>>> this behavior since this is the colored version of vmap, the one that takes
>>> into account the Xen coloring configuration.
>>
>> That's (to me at least) very surprising behavior, and hence needs
>> properly calling out in a code comment at the least.
>>
>> Personally I'm not convinced of having a function with this behavior,
>> and instead I think the normal vmap() should do. As long as you're
>> only allowing for order-0 allocations, that shouldn't be an issue
>> anyway.
> 
> You mean creating an array of colored mfns (I mean with a colored machine
> address) and passing it to vmap()? Am I understanding you correctly?

Yes.

> This is the only way I can see to use the original vmap() and respect
> the coloring configuration at the same time. But isn't it a waste of time
> and space to create this array?

Well, that's the price to pay for non-contiguous vmap-s. If the added
function really is just an optimization, I guess this might be acceptable
if actually stated that way in the description. I intentionally say
"might", because I think there's too heavy an implications here (the
caller having done the allocation(s) in a way that matches the function's
behavior).

Jan

