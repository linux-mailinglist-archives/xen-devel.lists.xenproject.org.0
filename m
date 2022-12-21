Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8EE652F4E
	for <lists+xen-devel@lfdr.de>; Wed, 21 Dec 2022 11:22:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467761.726804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7wFC-0005Hf-5z; Wed, 21 Dec 2022 10:22:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467761.726804; Wed, 21 Dec 2022 10:22:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7wFC-0005Et-2x; Wed, 21 Dec 2022 10:22:38 +0000
Received: by outflank-mailman (input) for mailman id 467761;
 Wed, 21 Dec 2022 10:22:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GA0H=4T=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p7wFA-000540-AG
 for xen-devel@lists.xenproject.org; Wed, 21 Dec 2022 10:22:36 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2081.outbound.protection.outlook.com [40.107.20.81])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d35dfd0-8119-11ed-8fd4-01056ac49cbb;
 Wed, 21 Dec 2022 11:22:25 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by GV1PR04MB9214.eurprd04.prod.outlook.com (2603:10a6:150:29::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Wed, 21 Dec
 2022 10:22:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Wed, 21 Dec 2022
 10:22:33 +0000
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
X-Inumbo-ID: 5d35dfd0-8119-11ed-8fd4-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D/Kq8Ye79YxPSfLiT1CXLoI56ew7QAPKXRIDbjUCTig0hVZId+hYrk+iW8Qd5p5cheyBN8rUicdSOvg+SJQcj5tZZPOHPZH9UYrI88upSnWN37muuwo4hyDpjXL1SivPEDDQ+MNCRY1zvJNVzb18e9CXoC6MHAKKroC7WGS0z/+FFVazBjTcV0xRwzrcqLZuzhXE2n7tGRHKBYbeztkykfvrXV4A/49dXsSFSX09fhyghAYKoSmrWyq5d9Q8A4GCSnhpt4QVBPhJITrJSsPWjRgQElmwaW43NaUeR3uJJJaSKJyVhQCwdeT4+ILVjftmRg0AKX5gaBtccG5ieYfxmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NN4rqa5f//cyYJR1TPNFGxp+m/dVWPt10wWchdvfObE=;
 b=LWZVXbMyEcTN+XSoJOm6EpCl3JAtXqetNgsOQypw9jCkw7FdfIMzSBgAUYSqscUzQipuQzGjTFczl2+bMOPONx4y0M7C/CG1qZSsqXmYTlGeUPec2UKlQWYSLtYGsE8u6UsUB1yY+SwOFXj2kjEAtv0x8QNqsbzDlCblRkYj+cBQMr6bW5VzGfgG7aksNmqKMwApRUCXaQ8zB4ipYPBjOBe80v6gBWCAK9i91UL4zrl93CySDg8Fp6pK2uZCyakTkvUiJ+4ZJZwuYbfmr4BYDQocfkVwXIZ9nuycQuR9XqS1qLtzj/5/8bGweEqCKkIQmS4JW9ElaK7ldPh9o82w5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NN4rqa5f//cyYJR1TPNFGxp+m/dVWPt10wWchdvfObE=;
 b=hLm+QTmnwHReTWO26zaECrcS5c40N4bKR0XcQKHd8RjoxlBo91IEsleZtc8/z6HkFkdGQNq8WNUdjbqL2HOQe8RmLLhtD5Hzu/YB1qfR1mMOL4ynOth/qysU6J2es0Zv5NwgN2ttYSEgb5fto46qmwA+gyKUfjvXLQvg/nq8dEh52FlBazewLHAd/t+Iu+JFNWGTBJf60rjS1VN65UBZTOHxaDjWC2QsyEosNlc7WLLgifDDmdmbp2iIouPyMyuOpChm4JQ71gdXYP4OO/OYQR3n4JxM6lAgooIY4fMHt21ACxOdtegdhYufjwM+ve0XmtY7AaB5+1BvcJf0Bjw8kA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d2edcb99-7b1f-a9b4-67b4-8818dea9dbe4@suse.com>
Date: Wed, 21 Dec 2022 11:22:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 02/22] x86/setup: move vm_init() before acpi calls
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 David Woodhouse <dwmw2@amazon.com>, Hongyan Xia <hongyxia@amazon.com>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-3-julien@xen.org>
 <92d82899-4e74-8638-4a60-09104ba16c9a@suse.com>
 <3c641a2b-01ef-335f-59e8-b65b2108c9eb@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3c641a2b-01ef-335f-59e8-b65b2108c9eb@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|GV1PR04MB9214:EE_
X-MS-Office365-Filtering-Correlation-Id: e40d252b-c549-44b3-f771-08dae33d4628
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E/DJvSPRZTHocszBBRkzgNgQrwDhU+D8KOYLi8gqMsmA/B9T2/JoLXr7xLUHtKrMFg+cETaigXi1Gp4Wg6a6GmL6KinXQuYj1rsc7FyLULUJkzf65RlEexUi/7RQW3l7y1JAlC2N+5DHVXNYL+myGLY6N9LW7QIz/m+E9e7D+vFa8yJLjplmW3MAraArxT//xXF21B2NrraWIZej/83d+7D32mY8ZIYLOxyUVZaj3kzaCmhZ02stlPevWEGdV6AmFPVMNWpAHm8KrUQFa1BN3AvSw9wSVNuRI6IPXtgiWjW0ADnAFxA/3t3Y+px4PFjaCehUspLhLvqxGWz2eSwJ4QdfmVtt1I7YUFcFwVpbsknTv5r/r+TIjT6t5Dy5NN+ecg0XmvIC0JCKUON7K3WJ3PaYulLrqHLO0iQ7zpMq2iSrSZ0eSzc6/Zh/S4R6Faqgkcw2wFz7zcvbJAucR7FOXmyVyU9y3nL298DtiJkApu+beOwqi5yaDHKnlGrgIpg8jZhSSqNdXcrq4ZtFFW0IbcOGpzFTwUQ0383gaP7clMLvjP5shtflA1H0wmVGaZQbZ0pubPTRu6AlgilboQGiT3gN5UFmKDEhq17PCMoBByYKZDUVOweoDdYI2kgyEgQPK4B0D+3X0UfKVkVrVHSZRDYiu2LcECJmZYvjUGNW1QuHh5Mb0qnz9R5tk3PXhbp1kCp6Whrk7ssZnvy5n+WiPy7Ex7KIAZK10n8l+vDbeDQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(366004)(396003)(39860400002)(136003)(346002)(451199015)(6486002)(53546011)(6506007)(478600001)(186003)(26005)(31686004)(31696002)(86362001)(6512007)(2616005)(316002)(66946007)(6916009)(66556008)(54906003)(4326008)(8676002)(8936002)(66476007)(36756003)(38100700002)(7416002)(41300700001)(2906002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGpmSGdHVkZRYmhkR084aEtDWXJvMVZQVCtTV1JXZmR4UnRuNEp6S3hERTk2?=
 =?utf-8?B?ck9xSUttU081Z0xsTE1jd3hiN0F1WGJPYU5KTzcxcjJQNmhrYWpaR1ZtY3Mr?=
 =?utf-8?B?eEdpRUliTVY4UThHUTFNVTNvMWZjV0Zyb2NhN2NhQWlBYTRkeTlFUDJvU0Zw?=
 =?utf-8?B?TGtCd29pNmNjTURneGRsWXVETW5hakFNZlhUTmJlSGl1cmNScXNpTktiWGtj?=
 =?utf-8?B?OXR3ejJvSVV2ZEJwYml1TXdjbnN6bE9rT0d2RUFYRU1hT3FCM3ExUktCNHZC?=
 =?utf-8?B?ZFRtaVU5L21uck9VZlBETXljMnhna0J5Sk51VnRPZUlQRlYzeWZSTDM4dFZL?=
 =?utf-8?B?ZW5IRjdLR2ZFNm1jVVdyUDQwMXk1THNrS28ra3RDQUo3RUV1SXN2cGVXRWpO?=
 =?utf-8?B?WXJjSDVvd2luUU1idTJ4TmRUUzRGaXRXQ1k3eURScktQY0x1NjVtc2xmb1FP?=
 =?utf-8?B?T1hSYkJNSlFvQU1pNXhUZnpCdzZiMXR1ZGZFdko2TlRBY2VTMmMzSFNYejQ4?=
 =?utf-8?B?cWhCa2hKTnlJMzdxbWdienI4MXdNUmxNUDBRcDJ5a3dTUTB3S3Jxc1l4aXd1?=
 =?utf-8?B?T1JLZ2RwQ2d1Q0RFUG9wM1E5QW5yU2NNTVpTemNlQmdNZTJrUnJOTGIrcU9G?=
 =?utf-8?B?WkZLWmFPQmpUckkrMEJvbXhGbUtUdTNjTFR2aU1XNituVjVwN0hPTTlRRG1I?=
 =?utf-8?B?ZEtUcFZiYk9ZU3d2SnkyblEweUZzZmFGeEp0WXd0RGtFc0tlMW5DcjhGakFu?=
 =?utf-8?B?OEhoRVNDNEtaWGFUaVE2ZTF0MXdLMFJVU29ac0JZaU5qdDM4K29RMFRsUlJN?=
 =?utf-8?B?eG5naStUNmE1RWpLUUcwYXhQTUdpbmFLa3VZTXVURW5SejNtajZvSWF1QVRi?=
 =?utf-8?B?V2JqMzViSEdscU9QMHBEVnoxSFgvckRtSHFzdk0rT1JxRC9udzJSQjJHSklt?=
 =?utf-8?B?enBPcUtuNStaYTZPVitEcnQ4S2R5NW8xMmNSVWwzdWFrUXlOR1Q5SDZ3dWNW?=
 =?utf-8?B?cEM1NTJrYWNuNDNDYW1nYWRzRkVYVVBHcysyQ3k0V0dlQW41b2NoS2NLODdP?=
 =?utf-8?B?c3REUndIU3BNbHdQcWMwWk5OSVAvcGwwdmgxTHNYWVBaM1FEZnk3T3Q5Ui9o?=
 =?utf-8?B?Z3pjbndJSkpvT3oxczlxOVJsOGpIeDhGR1VCTGFuWXVCSUFVZUhraW9jWGVS?=
 =?utf-8?B?NVpZSjdrZFN6aWRUU2JPSy9vQkx3d0ptQURraWNuZ3grLytwY2VNMWJtMzNJ?=
 =?utf-8?B?enBJVkxvWHZuVE1GdllJT1B5ZWx4dVFNUFBMT0s0TSt1S0JWWnUwcDFSM2pB?=
 =?utf-8?B?L1cvNWMvbHlGeXdtTnRBRE9yKy9WbjBhWXlVSkZWSVRHYTlkUHFoOEliTkQ3?=
 =?utf-8?B?eVNCdGRlUC9lS2VuTldlUVlWRUNoU3AzMVB2OTEyNElaY0ZHSU9tOXVVWVp5?=
 =?utf-8?B?OTE4d2NkdEd2c1pjcDVDUCtqa3pMQnhKeDVuREhmdXFwY2gxUlRUcHRQWTJJ?=
 =?utf-8?B?ZGJCK3ZjeTREMm00Lzl2b1lSS2hRanFrVG15ZmFKcEQwQVhYWVROT3JKT3g3?=
 =?utf-8?B?MklVM3FMNThKVGEyYUlvck1aUjkxMUc4NDZiaS9jZ2g2Lzc2L25USElPUUt5?=
 =?utf-8?B?Si9GQ0FzeFFZM25uSHEyRnJMUVh3TjRXbUU4NFMvWFVvamhNNWcrZHRoUTJr?=
 =?utf-8?B?QmtIdmxmenBDZ0gzV05qSjZ1dUNOSmdvckRkbWdrbjJZS001MXNsSXRxMUcz?=
 =?utf-8?B?RVJ4NGFyTXE5TlptSVY2emw4SGVxR0JEOXdVeUsvV0pSMVBITnJFWHEraTlH?=
 =?utf-8?B?NzdpSjE2UG81QzFCcUJiamlhd0FHYVpvQS9kOUlnSTltbHp1enk4VkZtc0ph?=
 =?utf-8?B?Q3NLVFJxd0llcG1sOGlzYmJaSVcvaUdnL1pSaGhLcjRHVU9JMXhvQkZHdldO?=
 =?utf-8?B?U0JYNEhvUElibC84RDBBQ0ZSYnFwa29hQVp3bHBoZTgzalBSUSt0ZDUwL1VN?=
 =?utf-8?B?QTNCb1RMaWxqMlNieU1ESjVXVEt2T3EyU3dLa2J2VHRCMVNsamk2OXg5Yytx?=
 =?utf-8?B?Tmo1TVVOTk1YTlhtUkFpVXpBa2VLcmhFLzJFTjdMcXExRnU3SlU4eU01NGRF?=
 =?utf-8?Q?ADtoYex5qvlhUHBI/o/H/tasQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e40d252b-c549-44b3-f771-08dae33d4628
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2022 10:22:33.9071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zrbwjI0GYKWeajTQTDQWxpIe34yzEXcMvKTMsOj5cyPHVMYfYhQ6UNEc8RENDHkU7xuOyyXc9mkhH7l7K4VHKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9214

On 21.12.2022 11:18, Julien Grall wrote:
> On 20/12/2022 15:08, Jan Beulich wrote:
>> On 16.12.2022 12:48, Julien Grall wrote:
>>> --- a/xen/common/vmap.c
>>> +++ b/xen/common/vmap.c
>>> @@ -34,9 +34,20 @@ void __init vm_init_type(enum vmap_region type, void *start, void *end)
>>>   
>>>       for ( i = 0, va = (unsigned long)vm_bitmap(type); i < nr; ++i, va += PAGE_SIZE )
>>>       {
>>> -        struct page_info *pg = alloc_domheap_page(NULL, 0);
>>> +        mfn_t mfn;
>>> +        int rc;
>>>   
>>> -        map_pages_to_xen(va, page_to_mfn(pg), 1, PAGE_HYPERVISOR);
>>> +        if ( system_state == SYS_STATE_early_boot )
>>> +            mfn = alloc_boot_pages(1, 1);
>>> +        else
>>> +        {
>>> +            struct page_info *pg = alloc_domheap_page(NULL, 0);
>>> +
>>> +            BUG_ON(!pg);
>>> +            mfn = page_to_mfn(pg);
>>> +        }
>>> +        rc = map_pages_to_xen(va, mfn, 1, PAGE_HYPERVISOR);
>>> +        BUG_ON(rc);
>>
>> The adding of a return value check is unrelated and not overly useful:
>>
>>>           clear_page((void *)va);
>>
>> This will fault anyway if the mapping attempt failed.
> 
> Not always. At least on Arm, map_pages_to_xen() could fail if the VA was 
> mapped to another physical address.

Oh, okay.

> This seems unlikely, yet I think that relying on clear_page() to always 
> fail when map_pages_to_xen() return an error is bogus.

Fair enough, but then please at least call out the change (and the reason)
in the description. Even better might be to make this a separate change,
but I wouldn't insist (quite likely I wouldn't have made this a separate
change either).

Jan

