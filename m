Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 403CD40376F
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 12:03:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181689.328924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNuQK-0000HF-BK; Wed, 08 Sep 2021 10:03:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181689.328924; Wed, 08 Sep 2021 10:03:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNuQK-0000Ee-7m; Wed, 08 Sep 2021 10:03:20 +0000
Received: by outflank-mailman (input) for mailman id 181689;
 Wed, 08 Sep 2021 10:03:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NNqu=N6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNuQI-0000EY-Bu
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 10:03:18 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fc76c11f-108b-11ec-b149-12813bfff9fa;
 Wed, 08 Sep 2021 10:03:17 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2054.outbound.protection.outlook.com [104.47.8.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-6-Vcc3AT0SMDaAsVXbK_HbKg-1;
 Wed, 08 Sep 2021 12:03:15 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2445.eurprd04.prod.outlook.com (2603:10a6:800:55::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Wed, 8 Sep
 2021 10:03:13 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Wed, 8 Sep 2021
 10:03:13 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P250CA0006.EURP250.PROD.OUTLOOK.COM (2603:10a6:102:57::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Wed, 8 Sep 2021 10:03:12 +0000
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
X-Inumbo-ID: fc76c11f-108b-11ec-b149-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631095396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U4+CNeQJy/jr2vUjG+fVEAweTSeM8l6WQo+Ob8voX2E=;
	b=BCnS/sJ8Nk7cHbGSubSoAnQRiXbcCEcds17esOeiyiT+5hO58zMCDYdQM9kS8Mm7S7jBGF
	3OQZL3T55Di6PqVcEtkuZQ/ldj0Esz24d4SENu+LZWD907RMyMgjKS/b5q9thqxgs/DP10
	TNWXguYnNBWnNTGcu/CsziNFP/DsdQI=
X-MC-Unique: Vcc3AT0SMDaAsVXbK_HbKg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZdWt6YQtvw/0XHTi4ZGH5s2Xq5undt7XLvvO/C6kNxDGBSeiMR1blqr/pPvOsECVGk8erBt6+9hVZJuEvDl11bzsBYyxaR0Wai+8zhQpncop6oH0zg77Y1AftoR9FY2/x1my6VILoXGri7Tt3Afxe0s1cW159GwYGzIiOAltDwDJ/YprT9UbaXWB0X5J5TmSClMUUkeBKCLK9t7K6oxMTlFXucOJT+2ZpB78B6hiCCex3M2pBAHZi2wMbqKRv2Sb3v6kogae+Z7kkHC9rl8M/z6GcwEyX6UJvSLXrZgSmZ6EKffmw3VbBzCLYk158oK2e4Hn7wqaOuoXt3TEryi5vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=U4+CNeQJy/jr2vUjG+fVEAweTSeM8l6WQo+Ob8voX2E=;
 b=ATC657B0Ld5qd3kG2jULmvSeGjSihW2k+MdI/U588suRfNPb5RU3ZAfmyvtlFSXP5bCJ692ea90Jd/GutDGUEKy3yfbi68cUtzv6Q5YK69VHrJW7Xh83wu8oZ53Zg/WEqkzsL2y+yLgFvE5GTKgG8ch5aJK19B+I6Dm8V1DL604lzysaqEFDdzysl/sEIHOLg5CKVTuO7v9CWLOYSoORo2TiIjAf9fwGd0X2XozWRY0AKi86Jm3u7nWlQTdfBRX3uNUrmMt9cPDKEwYit7sme4DxOaQds4rJVCKcdy1TR5/bk7OFiptKaZXxmKnKMVkz34yyVWYiLQHNT8ZBJ7OJfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 5/9] vpci/header: Implement guest BAR register handlers
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20210903100831.177748-1-andr2000@gmail.com>
 <20210903100831.177748-6-andr2000@gmail.com>
 <1848521d-4179-f5ee-e3af-f4e6738f60e6@suse.com>
 <eda075b5-eafd-2367-2f1e-7f6b9730beb0@epam.com>
 <2e0c2ff5-7228-a439-c8a6-50f7a022e77b@suse.com>
 <24624eca-766d-6841-dc90-43371f5a39ba@epam.com>
 <983f79a9-d72d-0704-9b04-950f858fbd7e@suse.com>
 <be31cb44-fda1-0413-dae9-412affd6e3f7@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <80de7569-522d-656a-e9e2-9e741511963d@suse.com>
Date: Wed, 8 Sep 2021 12:03:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <be31cb44-fda1-0413-dae9-412affd6e3f7@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P250CA0006.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:102:57::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc32e481-8487-4579-7252-08d972afdeee
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2445:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB244577376877BBEAFC0C492AB3D49@VI1PR0401MB2445.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sQ9FiJwfSC8bHu5C0Md487CHI0IQFldMmpP0zzZ1x1nTlJkD09GPgDEJ1Ldx8B5b6jJICTIoWgv5xV4mR+KUB3Zq0cI7YKw3eMkyaGe41t7bPKXsmiShefqraD+0GoOSkQ5DbWL9YjMOHWbMzByp6djhhEulL117f39bJtfcOg/yKs0Vls3fjYTHHQ8JvvmZ3yJbQwTZKiR2riTRr6+q7IUXj7g8APxnSxFCi17A3aPoZ9M1gtUkWbaU6X9sU8BdcuPJhuUcFqzeYm4JxjnFARL/wwM21vbXyuvhOFgBzDKIG1mXXuiDHm130U1FtZbSUnniG8nesYlB8UIPGZpkYWOkuFXoGsbPpERo6NyUhLmKuKhN0bbh8C/S20KVkCmm0t+ye/Y9PX95dofB6JXtVbgIRHpC/itZBbd0nzIYXe3yU7mFNJGRKRxmgDYqeU7dZ0WIsr+Pv7+gdUwi1UMZsvC/nSXK40Y5rPrTrz2OBuaBsFRjH5zep9NVLmrCLtZGlYD7e6lKxW4bn3afG1xUGUNLsOBn/w6btQfFmWS9VarV6otvAJ53bm/pXJWmMKxKuZzpzJB6xfdFK312459iXZKDWUb3tx0S9VUv2Xnh6Hv4I/h9dHVITML6vYlVo9dpUgQZlOQkaWCZzndXjALnEWecERzWw9k+HDSAxGK6dhBMBKyqIQMlbQ8SojTeUL1UkbPGr36pCofzUN/9qOeLH1WGQELWFNZVb5Btga8YdRRRgu0iUzxe5bpI5N95seng
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39860400002)(136003)(376002)(346002)(396003)(86362001)(83380400001)(4326008)(5660300002)(956004)(2616005)(478600001)(2906002)(26005)(36756003)(8676002)(31696002)(53546011)(8936002)(31686004)(66946007)(66556008)(66476007)(7416002)(110136005)(38100700002)(16576012)(6486002)(54906003)(316002)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGZNQVAwVGxwcGk4VFZpSmMzRmhxMlV3ZXFuU1pNaTBQOUZCdjJPb0syOVZS?=
 =?utf-8?B?ZFBxaFVCQmRNQXpVTDdOUFFSLy9rL3FEbjJYbTE4TytnUVNZbXA5UGRNYUVU?=
 =?utf-8?B?c1NGOG91T1dPaEhaL2JMTC9jcGVDY3ZVTDBmZC95bWhuQXJhUkNqZnRwdzNE?=
 =?utf-8?B?bHRrRWNrL1NCTS9VbHlCM09FU1VTZndvTVVWbTdZY0V5QzdRQkdaRG5RWWQz?=
 =?utf-8?B?VzRhU0Q1N0tLbm9sd1BteXJmWjFldkRyYjlmRTJmK3ZsNXBwY1VuL0ZNNmxL?=
 =?utf-8?B?djRxaG1PSnozVDRPL0xHL1dRRS9mR1VXMEVuczAzeVhHRFg1bHBNQzBHbUZx?=
 =?utf-8?B?alRFOERpSXJPZ1lTdFN3UnM0NDFkMm5JMHdmUzBad3UzU0lDY04wYjNtOU9n?=
 =?utf-8?B?V2syb1NXeVkyZ0hrUVdxTk1SS0VQVkpzOHN4eWdOSThYL2loOVhxbkladWI0?=
 =?utf-8?B?R1lKQkd2QXhwcWtLRThoMTVtTU5CSGNmbTk2Z0VJOUx6dytoakNlWWtRdmdw?=
 =?utf-8?B?V2pqZE1QbEQrcFB6RkpkcVJpUWRLMXNDbm00cWdHVVdndGVWZFJXb2k1UnhP?=
 =?utf-8?B?c0cwOVhsNVhjcjF0QUl2OEdOem52dEtpRzR4NGVpOXJCR3pHZ2RMMkl1NVgy?=
 =?utf-8?B?MkdBcEZnanpJUXV1dDRvMzdubUR2YXBzeXRraE1INGlIcCs3aUVtS1VSVzdw?=
 =?utf-8?B?QldLRE93bmF5UTBuSVlPcm8wZDNzNUpXRW5GYnJmVUZVVzJFVjZnUm1jTGY0?=
 =?utf-8?B?VVBlWlZLVExsSGtBZmpoR3hPMGNZMW0zOXdQejV3MHNXLzNGRk5NSENuRUlX?=
 =?utf-8?B?aVJFeEhoSmg3eG5ta01YRUl4cHNFcFZic2o5aGV0cUIyaHluWURhU0RBeW5X?=
 =?utf-8?B?ZXNBTk9CTlRCeSs5a3pyOVlHU2w3RWZTTVZIalRnQVZ2c0cvNVc0L09LTGNN?=
 =?utf-8?B?ck9sWVBwMWEzay9WZlJuYndyQ2NIZkR2MkJMYVdwM21BMmkrUnlTZzdXY2xs?=
 =?utf-8?B?YnJ3bGtLL1JIbnZ1NmVLaFV3K3B3V1FVUXlzdnBmRzlGdzZPUmdWVC94ekIx?=
 =?utf-8?B?K1BZb3IzOGswUys3ZFZJT0YwL1drdEl1WGRNZ2ZvYy9zN1NBbmpvcnRUaVEy?=
 =?utf-8?B?cDYwRUViWWI2Y0hpRngxWEdubzRwUFpXblB5MDc0UzE4QmdRdjRSOGo3UFdC?=
 =?utf-8?B?R3lNdndxTE9jRktBNFhHVkR2WXN2bmVuL2I5TUVRTXNLM090em5SSTZqTlc2?=
 =?utf-8?B?V2pxM2p1S1NrRS9kMXlac0ljaWVUd1AvMG42RFJPcWc4dFBldk1rOWVmdUQ1?=
 =?utf-8?B?aHhvYzkzNUo4QzJwWVlWalVUdWYrYVF2TzdCYldjdS95QUp0WnpFT0dUNTIr?=
 =?utf-8?B?L0RkVlRvSE5ZVkdHd2NFTERRVnpYdUdreGR5TkpwUkpBVzJqY2JXMFI5L3FJ?=
 =?utf-8?B?WjVvNkp0eFFpalRsSG1hTHIzTTNqS0l6S0lJT0hYQTBhSzU2TUNCd2tYUll0?=
 =?utf-8?B?RUZPR2dySVcyMXYwQnZCcmo0K3JTbTZWTXRFVmcrMER1cW52YjZSTXJUNmZ2?=
 =?utf-8?B?SU5VQTdCWFpnUjlXTVNGU1YxUWRoSzRJV0M0WFFEVFpYdFRCZUFpRk1wSHBT?=
 =?utf-8?B?cmdxdW1RZjR1b2U1YlF3TmoyRGpldU05WEtyYS9uVVA5NWpWdTJoeGF3VzVp?=
 =?utf-8?B?bUpUQXZOMVJJWmxYd2FEaGtPT1QyODBEeWRBUzYrQXFkd2sxQXFOYTFmZTBM?=
 =?utf-8?Q?lCN387pjh1IT/3oh9Ux6TIEuTzhvxMvaBVU1/Fm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc32e481-8487-4579-7252-08d972afdeee
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 10:03:13.5947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t3DwaNHHUgiHaX1/e/PvoowUtG6f1Z64r1YsIl9Va7/p94UpJIeVuic8tPJrzGAT+VMDHq4d6EnJWNTRlQ7qEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2445

On 08.09.2021 11:43, Oleksandr Andrushchenko wrote:
> 
> On 08.09.21 12:27, Jan Beulich wrote:
>> On 07.09.2021 19:39, Oleksandr Andrushchenko wrote:
>>> On 07.09.21 19:30, Jan Beulich wrote:
>>>> On 07.09.2021 15:33, Oleksandr Andrushchenko wrote:
>>>>> On 06.09.21 17:31, Jan Beulich wrote:
>>>>>> On 03.09.2021 12:08, Oleksandr Andrushchenko wrote:
>>>>>>> --- a/xen/drivers/vpci/header.c
>>>>>>> +++ b/xen/drivers/vpci/header.c
>>>>>>> @@ -400,12 +400,72 @@ static void bar_write(const struct pci_dev *pdev, unsigned int reg,
>>>>>>>     static void guest_bar_write(const struct pci_dev *pdev, unsigned int reg,
>>>>>>>                                 uint32_t val, void *data)
>>>>>>>     {
>>>>>>> +    struct vpci_bar *bar = data;
>>>>>>> +    bool hi = false;
>>>>>>> +
>>>>>>> +    if ( bar->type == VPCI_BAR_MEM64_HI )
>>>>>>> +    {
>>>>>>> +        ASSERT(reg > PCI_BASE_ADDRESS_0);
>>>>>>> +        bar--;
>>>>>>> +        hi = true;
>>>>>>> +    }
>>>>>>> +    else
>>>>>>> +        val &= PCI_BASE_ADDRESS_MEM_MASK;
>>>>>>> +    bar->guest_addr &= ~(0xffffffffull << (hi ? 32 : 0));
>>>>>>> +    bar->guest_addr |= (uint64_t)val << (hi ? 32 : 0);
>>>>>> What you store here is not the address that's going to be used,
>>>>>>     as
>>>>>> you don't mask off the low bits (to account for the BAR's size).
>>>>>> When a BAR gets written with all ones, all writable bits get these
>>>>>> ones stored. The address of the BAR, aiui, really changes to
>>>>>> (typically) close below 4Gb (in the case of a 32-bit BAR), which
>>>>>> is why memory / I/O decoding should be off while sizing BARs.
>>>>>> Therefore you shouldn't look for the specific "all writable bits
>>>>>> are ones" pattern (or worse, as you presently do, the "all bits
>>>>>> outside of the type specifier are ones" one) on the read path.
>>>>>> Instead mask the value appropriately here, and simply return back
>>>>>> the stored value from the read path.
> 
> But in case of BAR sizing I need to actually return BAR size.
> So, the comparison is the way to tell if the guest wants to read
> actual (configured) BAR value or it tries to determine BAR's size.
> This is why I compare and use the result as the answer to what needs
> to be supplied to the guest. So, if I don't compare with 0xffffffff for the
> hi part and 0xfffffff0 for the low then how do I know when to return
> configured BAR or return the size?

Well, but that's the common misunderstanding that I've been trying
to point out: There's no difference between these two forms of
reads. The BARs are simply registers with some r/o bits. There's
no hidden 2nd register recording what was last written. When you
write 0xffffffff, all you do is set all writable bits to 1. When
you read back from the register, you will find all r/o bits
unchanged (which in particular means all lower address bits are
zero, thus allowing you to determine the size).

When the spec says to write 0xffffffff for sizing purposes, OSes
should follow that, yes. This doesn't preclude them to use other
forms of writes for whichever purpose. Hence you do not want to
special case sizing, but instead you want to emulate correctly
all forms of writes, including subsequent reads to uniformly
return the intended / expected values.

Just to give an example (perhaps a little contrived): To size a
64-bit BAR, in principle you'd first need to write 0xffffffff to
both halves. But there's nothing wrong with doing this in a
different order: Act on the low half alone first, and then act
on the high half. The acting on the high half could even be
skipped if the low half sizing produced at least bit 31 set. Now
if you were to special case seeing ffffffff:fffffff? as the
last written pair of values, you'd break that (imo legitimate)
alternative process of sizing.

Jan


