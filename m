Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CEF57805D
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 13:03:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369619.601074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDOWT-0004lO-Vj; Mon, 18 Jul 2022 11:02:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369619.601074; Mon, 18 Jul 2022 11:02:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDOWT-0004if-SQ; Mon, 18 Jul 2022 11:02:45 +0000
Received: by outflank-mailman (input) for mailman id 369619;
 Mon, 18 Jul 2022 11:02:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pu44=XX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oDOWS-0004iZ-H4
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 11:02:44 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20083.outbound.protection.outlook.com [40.107.2.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25a7fd36-0689-11ed-bd2d-47488cf2e6aa;
 Mon, 18 Jul 2022 13:02:43 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by VI1PR04MB4142.eurprd04.prod.outlook.com (2603:10a6:803:3f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Mon, 18 Jul
 2022 11:02:41 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e%6]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 11:02:41 +0000
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
X-Inumbo-ID: 25a7fd36-0689-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WAOQSZWkb8QyRzT9pAEGz/SUnmD1sMrS5anhoG4gTxRFV7++da3h/HfxZd4+PJzzlxYA5F3BETgcJLpW1pxsrg28HQPP9bMI1kCrvCnlOtaI7TrmJjZFhhSGrHbOFYv7E1z45AG2ZPI2oLm7z65Z92wf44FFteSSGF2nMjteMXmJNNim3ydL9z/XN2E1kSPbQVzPDy+Raj2E6wBK6/9CRww9EqUA8KTiK8Xc6JwL758IojXMnqiTsuWua4J/Fk9nhfVbTGL925CvE8vrMt/Z9xv6ylFD2Vn8j77jDA5iPtcuV1mwVQCyrO7LWHBbV6ZQi22GPJy4ISoIDj9clk5RaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=prpM2/QYpOwMABF52SWFejvfpSMK3zlK4l5+vQVVYRQ=;
 b=kxuhJiuQLQmZtzrMw1An0M93zzvdEu7pQcZLLLunLC6r4PQ1LurQgspj35lk0d0v8BwUf/rYSRA1mdZVY+Sie/xUFLAytmHN05g7rU+2LW6XRMLcnSPzJv801QTLcezy4Z5QTV6MH62kgTSBlQqz55gAUOQ+pr+mqqLEsZ0dubqqKm0/c0xZRL4uDgrClKrDIlvYjJJ5s3eFFo6HZSL0ZgcG8rHHJCO6fH39kndRz4Tgpa/lzkSNUAiUU5p4at7jiJx0vfKiHt7Oq305oowbYMi7MixIHQ5o/hKYUUhYW3HHzpUUZwP67H7U8Vrm2799YMn8vUXbxjoUFxVK53Y0Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=prpM2/QYpOwMABF52SWFejvfpSMK3zlK4l5+vQVVYRQ=;
 b=26MgPyYMvx69ST1f/bPTA/ZRENhe6bsCkLaa1CtT4MBzMV/c2bBAVFmF1ntLjpnek4JNmyLHSaWW4R7ARsJ50a+C8+4tDMS3X45AhaAxnd+hC4/kAwPcsI5xc9GwyRlAsE5Uo8gg46nPTixfG9QvRXVv4V0A206OQEKNUGchWfQ1Mj0Gt5jttVsejjx/uuWMkcav4g47TnV/U6ylHAPxjx0pxHI6rm1VtKHSt7On5ZD5XukYbx2VPhxippMhHYf4d+DJxA6sl5k4IcJ+Qgv5ugfY6K/wO3NC4JroF36lMWpKBZuJUwVQ0FKE5vS8bv90EZNXrfo1Xp4/jgYm95L77Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <097e8634-0c5b-35ac-6ad6-5b83d9b29f64@suse.com>
Date: Mon, 18 Jul 2022 13:02:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 3/3] xen/heap: pass order to free_heap_pages() in heap
 init
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Hongyan Xia <hongyxia@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20220715170312.13931-1-julien@xen.org>
 <20220715170312.13931-4-julien@xen.org>
 <0242a659-fcf9-74cc-102c-df775123b7ac@suse.com>
 <b8b84df4-4101-a78f-1cf1-1662500ee2c0@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b8b84df4-4101-a78f-1cf1-1662500ee2c0@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0091.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::11) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6f05cff-7300-4c64-725d-08da68ad08eb
X-MS-TrafficTypeDiagnostic: VI1PR04MB4142:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gWHeTVN7rkklK/Z9OfIZ5s0hhcJUCjGuRp9FPHJJ9KNYikyxP/kM1vac/NgcJW6KrBFUJleTvO+YRdkld+DLobiUSuC3Fo8i/iNiLpYXHG8xPyrpvkG1xMs+5suIUDtxm53tRHWEcQOUtVLVk6toigwJboswtQekmojUpySqaXhy2C2TtPIuQKm+G5xsQDUfv7nQMdRLvqoDdjkxoocJDbpQ91WYEC7csUIKRcMWdhCeHCUcSHdgRx7zoVrC+t9i1Yhm1nLga+DFd84tSfOwK1fRX1q08pGsq56dCWU9g/NTtYam2fqSsNAQryOVR+LOIUB2O4fII1LTVklX4azRoTBI7Wp3P5So3lhifiog88wNLscxc/RdTuhXPXUgMBgJJuTGK9HyXbbO7ynMXkjuwnVobInLy5QM8y9Q31vPvmGnJV9PDepR2wjXfdkuZ7MiOZfZA7qeApI0tSlwtyHIrF0CoDcvF9csxKrzt+KBVZH5vcc/O7tcrB3OOsf5uUsMHzyE7m/RqoBKZ62xRABTUlypM2zz+o8fifRin47iagAw4Yb1YsNW4ULxyXsu0BNUjxBDlY6DR5RMPiRuW958x/67Iv2mqIidq9NUBDKpIeV6qEFAgLW0ScXjCVgxvRB68GWf3F2V7NtEHek8058xaxn9MneV/SLr62L9qJTeKvVmfBPHY5NkptJYripbYYdaGqZc5JIl+U54UNlQ14YXsHTmQZGkWvmjNfQ9PWfeJR29SA6aEXPHV3QSIIK0EdjDtjcbMwKdXYjb08PJdoI32SE440TYA+zUbYQdymSNegm6gi5zXVciG8EYEw8I92Yc5pVAhPh+pLHvqEcTuOJqYrcQguzA+eg+Al/JrKo3weA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(39850400004)(366004)(376002)(396003)(346002)(41300700001)(316002)(6512007)(54906003)(6486002)(6916009)(6506007)(26005)(31686004)(36756003)(2906002)(66556008)(5660300002)(38100700002)(66946007)(8676002)(4326008)(66476007)(83380400001)(186003)(478600001)(53546011)(2616005)(31696002)(8936002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXRkSHVYclR0SXRoVkg5Yk1OVXR2ck5WMmFsVmUwbWZlTXRyMnJNblA2aGxl?=
 =?utf-8?B?bDViMzA1QkJuOGJDcVJsSy9XL1kvTHJwQmFaNlJEL3RXWmVITEFZTUFZYUNK?=
 =?utf-8?B?alpPbjgzaFFSbGh5M3MvQUdNNFNiZ1dPaTZNSitnbnZMbTdBczVvWkUxWFpC?=
 =?utf-8?B?OUJkN1hnTDBzaHpHeGFEUW9HajNUVm9iTDk1OTJadExDNmUrRUMvQ0lYLy93?=
 =?utf-8?B?RUV1RlN0L1ZYWlBFYzdmaHE4RlFwS2pRMWdSQjE5NEtrMHJUMXlyMDZZQXU5?=
 =?utf-8?B?Zlc3emVVQm85dS9vUUgxQ2hvWG5EM3ZybUJyTjY1Ymprc1ErdHNSTHc4cUxT?=
 =?utf-8?B?QytTUEthTVNkalNqTUp0aCtrR0VrQklQWkZoREtrbW5SdFdSVjVWdjZmRWdi?=
 =?utf-8?B?dCsvaUV1NksvNGUrMWhiUjFONFVJNFczWU5jb0sxSkJsRUdEVkZGampaQVpH?=
 =?utf-8?B?NDQvK2VYNFl5Q1plYVNuYWRJUnpCZGVFSFFielBLMEJmVlhwMlZtMjJrNVcr?=
 =?utf-8?B?S1NtUTZ4R2JlKzVnWEltRW5xakRGNjlGcW5OOS8yTFlubmZleFk0MURtejhL?=
 =?utf-8?B?ejloZ0d1cHNpK0lRTkc5REU3MFpZem1RVXNTc1IxcFFzY2h6bWVqM3VvVkNX?=
 =?utf-8?B?aXlYbHNNZ0ZPZzlkT0FEYS82djNXbkVUVHRPZWYvQTNTdjYveFpmWXk1c3lw?=
 =?utf-8?B?NGdtdXdGYTZDQTZqZWkyU2c4ZnZGNDFsSFhzWmh4d1hsM242WFF3NHl0eFZG?=
 =?utf-8?B?TUFkMXMvaVFQMHJTWFFPejJSVlRFOENrMXdXeEJxTVpheXFQMXh0ejVhb1Fk?=
 =?utf-8?B?Y2ViZk52UDhNOUJxZ2lraGhWN3BhRUJhYXZ2am9QTDhxaDQycCtaZ0ZFOHlq?=
 =?utf-8?B?WFNjSWE2WVlEZm8wdXIvYUxyaHliSm5iK005cE1EbDVQeDBHYkVoU3VkOEMx?=
 =?utf-8?B?Vy9FTTA4Z296R2RPeTNjaXhjaVlnOVhNTDhmV2NsMmZVUFU2ZzRlRVpCeFlR?=
 =?utf-8?B?dDdzUkVrY1p0VnVOaVVldEo2dmpITkNGZkZpUWZFZTA4WktYK0xvYkZWZU0z?=
 =?utf-8?B?TWpKMENUbFdsNFZMaHpOTkFxa1NPQ3pnU2dEU3Z6YzZkOU5jU2daczVBTnl1?=
 =?utf-8?B?Tk50ZHo4SmNFL0Q1Y2YwY1pRenh2a2J6NGJINFJ4dUltYWxIQ2lTbEM0aWR6?=
 =?utf-8?B?UW1xZ1h0a1hlTm52VDRka1JuWldQRk5vSE9OZmdTWEZ5VHkzdW1pUnhxUTdm?=
 =?utf-8?B?Q1lVRXNDZHFQUjBNbWlJQlQ5WmtIK3Nvb2tGZUxoeW0vRkM3azMweWo0Yk95?=
 =?utf-8?B?N1U0Szh2YzA5bXo3L1N1WVJnVnVCS0QrdjV4T080N3BsYXY2Uzd2eVpDanBV?=
 =?utf-8?B?SHpib0kxM1RBTXNlTWlYMFFuaWVvdUdtYmpKeVBYS0VlSVZQUFJUNkRGZVFz?=
 =?utf-8?B?eTk2RDI3Z21kNWx6dEMySndHTnkvSWNnSFRaVEZHZHlIMnMvY1BtaVRFQ3Yr?=
 =?utf-8?B?ZGNndFp0aWhlZCsvOEx4NXgyZGloWStpWW5KSW5wWTYyNGdsUFQxSEhEMTNu?=
 =?utf-8?B?UzFPRmZvck1QVk5SL2RqZ2NQOC9qcUliOE1mUnJyVlVxK21FNVNpcmhWZVhZ?=
 =?utf-8?B?TTZyZmQ3Nkw2VlNCWjJnaEFNVTRpWGNwSzBhK3BPWGRiZCtoSFY4K0VHWXIy?=
 =?utf-8?B?eWFWK3RydVFFMWVDVjYvN1RybTlXTFVJZGxmZnBiNm5LR2NmL3BlRVorVkpp?=
 =?utf-8?B?QzVQQkw4UjdTdkgyaGk1OWNEdjNyWFJqSTFzWDRPOThLdjIrY3dYeWFtc2Uw?=
 =?utf-8?B?WEQ4cHMzU0htMGVjUk5udGVtSzFVTUtiSDlRMjc3TDcrODBJdGxiNzhrMVRq?=
 =?utf-8?B?aHBrSWxCUnJJUk9EclNDMEtDNEp4VHdTeWNFT2ZVQmpEcUVCLzJvcDl3c3pu?=
 =?utf-8?B?ME1oTTJmRlhFRlFZclA1cHppUk40YWNKWVZMQW1KQmZKUHZsTEtvTjlvaFdV?=
 =?utf-8?B?TURSTkRMam1QMzFYbXhjUkpQTzNNcmJINTh0MXBIS3BuRHNSSllMQjFIbmlW?=
 =?utf-8?B?Mm40dWdyckVIekplaldROHpRdmZtNjNFMzFLZlp5b1dsMmZoTHlITmwyYXVH?=
 =?utf-8?Q?uHwNW1A7Nh4Gp9njyUOv6UVoz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6f05cff-7300-4c64-725d-08da68ad08eb
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 11:02:41.5719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HG9Z9AhDb5vxA9Cn16RF0KH/KTL4rd5AJ2/2+SZfKfzRPhWkl/jTzh2r5ruGsm/LVeFWd+blv8o/FrcTnol8qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4142

On 18.07.2022 12:24, Julien Grall wrote:
> Hi Jan,
> 
> On 18/07/2022 10:43, Jan Beulich wrote:
>> On 15.07.2022 19:03, Julien Grall wrote:
>>> @@ -1806,8 +1806,22 @@ static void _init_heap_pages(const struct page_info *pg,
>>>   
>>>       while ( s < e )
>>>       {
>>> -        free_heap_pages(mfn_to_page(_mfn(s)), 0, need_scrub);
>>> -        s += 1UL;
>>> +        /*
>>> +         * For s == 0, we simply use the largest increment by checking the
>>> +         * MSB of the region size. For s != 0, we also need to ensure that the
>>> +         * chunk is properly sized to end at power-of-two alignment. We do this
>>> +         * by checking the LSB of the start address and use its index as
>>> +         * the increment. Both cases need to be guarded by MAX_ORDER.
>>
>> s/guarded/bounded/ ?
>>
>>> +         * Note that the value of ffsl() and flsl() starts from 1 so we need
>>> +         * to decrement it by 1.
>>> +         */
>>> +        int inc_order = min(MAX_ORDER, flsl(e - s) - 1);
>>
>> unsigned int, since ...
> 
> MAX_ORDER, flsl(), ffsl() are both returning signed value. So inc_order 
> should be 'int' to avoid any compilation issue.
> 
>>
>>> +        if ( s )
>>> +            inc_order = min(inc_order, ffsl(s) - 1);
>>> +        free_heap_pages(mfn_to_page(_mfn(s)), inc_order, need_scrub);
>>
>> ... that's what the function parameter says, and the value also can go
>> negative?
> 
> AFAICT, none of the values are negative. But per above, if we use min() 
> then the local variable should be 'int'. The two possible alternatives are:
>    1) Use min_t()
>    2) Update MAX_ORDER, flsl(), ffsl() to return an unsigned value
> 
> The ideal would be #2 but it will require at least an extra patch and 
> effort. If we use #1, then they use may become stale if we implement #2.

I'm not sure #2 is a good option - we'd deviate from conventions used
elsewhere on what flsl() and ffsl() return. And constants would imo
best remain suffix-less unless a suffix is very relevant to have (for
MAX_ORDER, which isn't at risk of being subject to ~ or -, it may be
warranted).

3)
        unsigned int inc_order = min(MAX_ORDER, flsl(e - s) - 1);

        if ( s )
            inc_order = min(inc_order, ffsl(s) - 1U);

No compilation issues to expect here, afaict.

> So I would prefer to keep min(). That said, I would be open to use 
> min_t() if you strongly prefer it.

I consider max_t() / min_t() dangerous, so I'd like to limit their use
to cases where no good alternatives exist.

Jan

