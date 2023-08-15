Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A56E77C759
	for <lists+xen-devel@lfdr.de>; Tue, 15 Aug 2023 08:03:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583867.914218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVn9Z-000256-KR; Tue, 15 Aug 2023 06:03:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583867.914218; Tue, 15 Aug 2023 06:03:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVn9Z-000228-HK; Tue, 15 Aug 2023 06:03:41 +0000
Received: by outflank-mailman (input) for mailman id 583867;
 Tue, 15 Aug 2023 06:03:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iVak=EA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qVn9Y-000222-22
 for xen-devel@lists.xenproject.org; Tue, 15 Aug 2023 06:03:40 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2075.outbound.protection.outlook.com [40.107.7.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79ac6814-3b31-11ee-8613-37d641c3527e;
 Tue, 15 Aug 2023 08:03:37 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS5PR04MB9924.eurprd04.prod.outlook.com (2603:10a6:20b:67e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 06:03:08 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.025; Tue, 15 Aug 2023
 06:03:08 +0000
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
X-Inumbo-ID: 79ac6814-3b31-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jBVrIs/LnpcoKd1IEpP7pZ+oUgmH3rmChfBl0+Aq2OrH+Cl02vjKIIBxqNUcdMYj8POqXWWr5i9LTFSzxu00V67/3eg3XdUANukDXs2SEnW5Dq0EUunDFmfrTa2w9JGuIJADgYJsJr9U4Q5xek2Nu84U1D00zlXKjgEGhjirOX3FjbF41y8BTH50ncMg9mpfd0AxCIfTdhNu3BqpQB6b9NzAH9kUL6insVKSXLA11p+SkX2tL2kXegLJVMHkRUqS8QHTeTByDx1kopyRkX3S/j4mnzjlmHaBzdghcqnduqlXsFjw0l3jncZTVJHQT2+KkXnl8juEKbwCKZhCPKxzBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/GRX0qUU4uTsh392m0DTImSMXbkGdK6Xq9xTe8sb/fo=;
 b=M8wihcxzSqW1PJo9u6vqLKJJgOIItMVl1P0mzXvtzf+uXE6BE68mOPyuy0w/YQQ5kaYujyk4tpZmgvITuvHNhhsuP9zbIVBTXK7m4g/ZeZgzfqDOUV5nFX2ABgLf9IqavT1Zu4rCDHHOHFERM1PPkmAyh8EqasvG4m8lsNUFGtlah8e4NgpHTpW8k7VNUApv7+jH5gInRuaN1kXY3gtFsGb7dPfgcaCpNRjN8oYkZkFeSFXGmOMRAciaIx+TuO0qj7Su0rvnceLAfYMd+peazvgO+gu/vXNes29ydRibnOE7RHf11hB4dJRE/qZLO3JJ2JQqN8Py/9fVxy7g6zSMFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/GRX0qUU4uTsh392m0DTImSMXbkGdK6Xq9xTe8sb/fo=;
 b=1DYTpin+QJImn0NHN5H2OPk29HyzY31lj+ySFVjgdnq0z1clvyrAuz4UkvFb4KkDEaGF+DHxBuzJ5k/0MgOMtJWf/eJ1XYb8hiUPMhyY8CF037RD7BG61elsN809BrZELCbMkBGmJ41FdD2eTroPq+6ESw6NSdvwD4OKCXZJkeWr3czBgKrj+kRWrdgcZU/lS12bK6/UyleJFc4bfOy6fdphpf2xQKDMSVfXzKq0qVFAdyF1IW3luCOq4toXhMLAxvk2d9XUbQoTQRa1RpYQC/sKpWiIBPmwVrlYMdKAcb0apNcJx+arxbgZm+QnGNJ4DVE8eea6NqgfrRzmFnzMww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <eb9e1a6c-bfe3-7a91-1ef7-2906dfa26469@suse.com>
Date: Tue, 15 Aug 2023 08:03:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v1 3/3] xen/vpci: header: filter PCI capabilities
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230810191312.644235-1-stewart.hildebrand@amd.com>
 <20230810191312.644235-4-stewart.hildebrand@amd.com>
 <29d82586-550b-6e9f-f967-a2855d1c81a2@suse.com>
 <44c214e3-2e0c-0270-c318-c3992610ab1a@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <44c214e3-2e0c-0270-c318-c3992610ab1a@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0118.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS5PR04MB9924:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d5920c7-c86c-4680-131e-08db9d554c66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nzBxvG3VaU6db5kWg1kWi12cSUdIVI/ypy+89Uq707jMadhYQiHos9X9esEnR6aNR7+uN+8lqYs3IvO8XpqgfR4PGyx8HVoDBM3C2a914+ijk2udRgUtC7nLNFzoLbbftU14QSFwsrslaW9ehgEzJibwPUJuEryhtTPyWHz6AqgvpV1G8QISViDyVnryR2ef8EtGcIH24zEUySkn9zvjwTUA8IpGPEjyNllDV1aH2O1HmWM7YTqEBYG1lWUkUhL8sQLBtjspArAwQFddVyeXUz76+QLso5BV0cDY7Oz6pgiOed8NxVbRwawbevRpLAGHSqQysGA9cH6AQIe+i3gqlbOkQVjGytgPJBKw/+GjP2Yyv9WYYtjAw9mDK59c+b82TebVyI97MqdRm5u3Ewpgv5roqdFEcVJ2Lrv9PZVuhp7+gdCjzvXlyzEdzEfRdKlVnvxYb2Ys8oXzt0g42LVhh/WTLYrv4kHk2blxSNQP+RIofHzz97C7TCr3XTswkxzQiLePdodh5oBHxylvZeIvWbk0hY6uylJ7WBKEY2TLJbshZnQRdhG1Q3iU4lonrLvlgPlb/1juL+2R1x0cFJt6K0zC2pBMeUZg98LgvpIDN7zO9XdMPeEG1e2eMUuvNnAe+4DJcncyE2bK8sZOJHnB2w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(376002)(366004)(346002)(39860400002)(186006)(1800799006)(451199021)(31686004)(66899021)(6486002)(6512007)(86362001)(31696002)(36756003)(38100700002)(83380400001)(53546011)(6506007)(26005)(2906002)(478600001)(2616005)(41300700001)(8936002)(66946007)(5660300002)(66476007)(8676002)(66556008)(6916009)(4326008)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUhrODRkRnZUVCtFdGFRZGZRaU93YkxNakhxdlZiR0JVOUZHaEZ6aHJhZnpT?=
 =?utf-8?B?V2hwSXBqWW1mUmNteUM4ZTE3OU9YVnZsQ0hyL2lVbmtFdFJRdGZKQ0ppUnJJ?=
 =?utf-8?B?Q0VGMjZGY0F1YUhmdEU4ZmFOVHk2bk5YTlFuZ2FpZzhjWEg2ZCszRCtPeWJ5?=
 =?utf-8?B?ZmpuOGsyejNwWFlrbElYU3JGR1dqcEtLSXBsUy82d2pZaFh1NXV5cnB3dlZi?=
 =?utf-8?B?T3c0WjVDR09pK28zaXplQkd5aWJaRjZpOVFpR1A0SlY2eGhRZlJIS2YzREpm?=
 =?utf-8?B?MTZjbUpFejZvaHU1Z2xNenJhT2hod0VBcm5DM3lpVFh6WUVCNWlsQUh2bk9r?=
 =?utf-8?B?dElGYkY4TXpTcGJXSkIzZ2Q4QU5leGd3Y2hRbzJySmFtdjhBT29NWXNXSkR5?=
 =?utf-8?B?THk1Q3dnTU13M3RCcFVPbzNtZnIvSlBuMFRGazRNMlpZQnl6enNNVWc1MWVD?=
 =?utf-8?B?NEpwZEE4eGlJUncrYnN1RDZpMEpTRWtrVlY3bTZuRFFKaXNWbEwrQ2hDZ25k?=
 =?utf-8?B?Z09lRmNVUDdvK3EyRHJLd1dIWFJTMVp6VHBPN1RsQzh6VVNKb2RzVkhQZ0RL?=
 =?utf-8?B?TTZYem9vZ1lOUXZad1ZoMU9SSXF2ZUpKV0lYRDdPOEFqcnV4T3NnTFBFeHJ1?=
 =?utf-8?B?cEFoVDhxcjV3T2Y2UkZWeHAwMitYdm9tM0JvV3NtZjJUdUxkb1N3RTdDKzVX?=
 =?utf-8?B?UFdrOVU2QWpXdXorVEt0OXlCaVFUSWoySDhQcjZhTmJtVjdNeFpvdEhFN3FU?=
 =?utf-8?B?WXhOYWsvTVN4RTdoSjEvNmUzSHhTMVZCbVNvOUNPTWtIbW5XVlpZQlU5dHc1?=
 =?utf-8?B?SGcvMUt0ZHgxbDkzOW8yWVlEZVkzQUpiUnVzRVN0T1grMHcyclhiMkEvUHZQ?=
 =?utf-8?B?dDB0SHU1UVhBZWtKNG1PVTl2TlpERlg5UGFCRzVQK01hQ1ZDNWdqSXVSOERO?=
 =?utf-8?B?ajJFeTF3N0tFWVhVK3pOY1Z0ZWIxYjR2REUzemEwWEtZSXdEaHF1MVBGYmtV?=
 =?utf-8?B?THVaUEJXazc0ZlJEZE1iOXY3NUZETmtucjBPSHpWWW9hc1JoQ1pCMllLa1hh?=
 =?utf-8?B?d0VhaTdYdThnSFNJbzRGVldxVHAvR0d5LysvSmx0dXB4djNxN0pVQ3g5Uk41?=
 =?utf-8?B?bnlxY3BVVnJxb2dabmg3Y2o5d1VNQmpwK0JMR3NHRWZLN2I3WURuMUQvQXRZ?=
 =?utf-8?B?UWsxYVE2R2hZNTY3M1gxaFB3UitESElVcUhMV0xGcGx5d3U0YzlWL3lqNTUz?=
 =?utf-8?B?SU1kaTZNb1BRckdKK1o1TFJWZUtmMXd0WFRUWUFqem81N1FJZytSem5NR2dj?=
 =?utf-8?B?anNGMzV3WGUvczRLWU5sSG0vR2hZNEFPck9iVHV2dHFOTlQzZXlGUlRSYjhy?=
 =?utf-8?B?cE1LTU9kYVZOODFTSTZpTGJHTnBzV3lveTQ3anV4NDR2RlBVRjBNSGpNU21H?=
 =?utf-8?B?NXdFSklMR3FUWGZ3TmQxSzc1RFdzRk8vc0g2ZlRlak5WS0o0TzZTakFoTmNp?=
 =?utf-8?B?RnBhOXhVYSt4dU55blBkRU9Gc3BBakMwSHZrQldjODFrNzhyYXBtdjk3VytZ?=
 =?utf-8?B?WnQvWXlPc0N0UktCbDNUR3hVQVFNa003cDNNN2VUaHdCRkdxUjJUMnRZZVJu?=
 =?utf-8?B?OGZVK1NTemhWYmI5TldITnV1RzcrK2paZWFlaXpsQWhUdnBvWXp1STRJTTZ5?=
 =?utf-8?B?aWR5b3lIaXg3SWxPU3Q2aDNjNXRSMEhteW9naDhEakFpRU8wYnVwOFhMWGVi?=
 =?utf-8?B?R29CTWFpYkwwZ2podHJkWkF6ZVorMlJDMjU4R2ZsS2Q5c052SzFuUXZTVGlK?=
 =?utf-8?B?WmdtQ05ZemRYaTI5aVhUQkQvY1pSNjRRK1VSNEdCSVd5ZStweTl2NlhhNXlV?=
 =?utf-8?B?Wm1URDMycmZPcjEvaTlEaG4ydFNvaVZUSHM0eTZncGs4VGMzYS9QSDdWZ1Br?=
 =?utf-8?B?ekQ1MTE2ZkdlRW5oUkhkYk5kQzAvQnFnbWt3Z25yTXFFeGlWYVptbU5nYmJY?=
 =?utf-8?B?RUpGd2Z0UWwwNEJXZWIwUDdRc3NZWGMwbFpldTJwbGlpakZXT0tyelA4QXlz?=
 =?utf-8?B?L0srV2pDTzdsRTRvSThObFprcWdXTGJpMVBURnE5S0dFMWFTcURYMDhRSWxp?=
 =?utf-8?Q?dR0fjgv+wAD+lAoqJTBY7jUST?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d5920c7-c86c-4680-131e-08db9d554c66
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 06:03:08.3956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gnro2hUmW++SAjPoeVY7zxHSMhJ5QSEYVb9AurAvDts3Vpr4kpfdJpD9txx6YG+dNhu3nhYKTzWzbqblXXW8Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9924

On 14.08.2023 23:11, Stewart Hildebrand wrote:
> On 8/14/23 10:58, Jan Beulich wrote:
>> On 10.08.2023 21:12, Stewart Hildebrand wrote:
>>> --- a/xen/drivers/vpci/header.c
>>> +++ b/xen/drivers/vpci/header.c
>>> @@ -513,6 +513,36 @@ static void cf_check rom_write(
>>>          rom->addr = val & PCI_ROM_ADDRESS_MASK;
>>>  }
>>>
>>> +static uint8_t vpci_find_next_cap(pci_sbdf_t sbdf, uint8_t pos)
>>> +{
>>> +    uint8_t id;
>>> +    int ttl;
>>> +
>>> +    if ( pos < 0x40 )
>>> +        pos = pci_conf_read8(sbdf, PCI_CAPABILITY_LIST);
>>> +    else
>>> +        pos = pci_conf_read8(sbdf, pos + PCI_CAP_LIST_NEXT);
>>
>> How about avoiding the if/else by having the caller pass in a useful
>> value, rather than PCI_CAPABILITY_LIST? I.e.
>>
>> #define PCI_CAP_LIST_FIRST (PCI_CAPABILITY_LIST - PCI_CAP_LIST_NEXT)
> 
> OK, yes, I will eliminate the if/else.
> 
>>
>>> +    for ( ttl = 48; ttl > 0; ttl-- )
>>> +    {
>>> +        if ( pos < 0x40 )
>>> +            break;
>>> +
>>> +        pos &= ~3;
>>> +        id = pci_conf_read8(sbdf, pos + PCI_CAP_LIST_ID);
>>> +
>>> +        if ( id == 0xff )
>>> +            break;
>>> +
>>> +        if ( id == PCI_CAP_ID_MSI ||
>>> +             id == PCI_CAP_ID_MSIX )
>>> +            return pos;
>>
>> Can this please start out as switch() right away?
> 
> Yes, certainly.
> 
>>> +        pos = pci_conf_read8(sbdf, pos + PCI_CAP_LIST_NEXT);
>>> +    }
>>> +    return 0;
>>> +}
>>
>> Nit: Blank line please ahead of main function return point.
>>
>> I also notice that the function isn't really vPCI-specific in any way
>> (except for the specific PCI_CAP_ID_* compared against). Would it
>> perhaps make sense to have it be a general utility function, living in
>> xen/drivers/pci/pci.c next to its relatives?
> 
> Yes. The the PCI_CAP_ID_* comparisons were the only reason I initially decided not to use the existing pci_find_next_cap() function, which performs an almost identical task. I just noticed that the existing pci_find_next_cap() doesn't appear to have any callers. Given this, I'd prefer to modify the existing pci_find_next_cap() to suit our needs.

Please modify the function only if it then remains (easily) usable for
its original purpose. Even if right now without callers, it exists for
a reason. (How to deal with the Misra unreachable code aspect in such
cases remains to be decided.)

Jan

