Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFD67495FE
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 09:03:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559667.874878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHJ0c-0001nr-5z; Thu, 06 Jul 2023 07:02:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559667.874878; Thu, 06 Jul 2023 07:02:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHJ0c-0001kY-3J; Thu, 06 Jul 2023 07:02:34 +0000
Received: by outflank-mailman (input) for mailman id 559667;
 Thu, 06 Jul 2023 07:02:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdui=CY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qHJ0a-0001kS-Ne
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 07:02:32 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20604.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 128ea40b-1bcb-11ee-8611-37d641c3527e;
 Thu, 06 Jul 2023 09:02:29 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DUZPR04MB9897.eurprd04.prod.outlook.com (2603:10a6:10:4ad::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 07:02:26 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Thu, 6 Jul 2023
 07:02:26 +0000
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
X-Inumbo-ID: 128ea40b-1bcb-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KMq7ACFRx5I5UkB7D2RlExeczLp6Y7HZxFkq1kU8VDHFDmxCtCh7KU4UXn5QfKwmZJ1lQJnqDJTSDaq4tc+LelFy1yZ0mEWINSxarMMNuyP3V2Q+Vpymtn/rtimXpl/3tEvYI1+Ip6IcZndLSil58nG10+4toojE7Lj7HitD64aDr4TS/3mnFRVGi1VOVcvC7azLoK7DGAI2SgyK96d8e+yF3AhD0ntsJyxFiyWH3G64j5zUMHaaUpejPe2Q7sbTFyN2vOfvhJPnpdOxEIgiI0BwmSMKBfd9teUm6jX7kYJm5OzXynKn6sDfh0zxWcXPUIu8ECCiBKn7UBX8UN/JOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BPe3zNBQ4lGBiaCq8dSmkN78oAZohVXDcdQYpgQrZ4E=;
 b=A4CSb1Bph+dD5zlyHmMqed+vn3dhNudT2fns60Fnqg3z0ZHWb/J43Hn3j4qGl/c33vKmyLei16uoHHlk8zmriBWLaYvVko73pBz5wBG0Q1nm86QQeU8WECO2mgxTPkPl/9QEk7Jh64hapHiq2jlZGw8r3B6am7+vEApURj0bG6BiBzjXqXCF4FuvRA1X8Z0JDadAlAGBnf4hE9G8W0qzT7gAyf6gIy2+NDXweTeW9tx0LDrMhXyNnzZ1FmQDkjFWBcoSxJ+Jk/LJIyvSO+xgyu91M2mo0CwsHmly1gy8ASNObKtq9rKDfsFXGlXT5QWEHm9BS4BlWuflqtiVIIFg6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPe3zNBQ4lGBiaCq8dSmkN78oAZohVXDcdQYpgQrZ4E=;
 b=z1O9NlwuacNCfxYX8DhAOuP5BfTj1xS7EnfRZDt2azdyl13lDpR1Bmk5tgeF3leQNWxvGGPCUZUJ7HBjdZshqKDCU64BZqruSuUTfz9aTBKY0l8H8jf7Tlsi8s8BbVhsyf1RIuUa7ue7W8yLlvHYphB2WH/FuhjJ4zbYWA+/zhTwhcYRhhrLPmhWsRylHBuC2gvbpS60Quu/R7a/Oj5nVuQYKlrf1JNCBBU2cRXRKxG/xboMLZd2vtVvnjLBolK7CG3yhv/aclrVl8Z6xz6rC9vM9QQlNbNK1dHhEhpVvaS31nK9ashkAR8/rzJM4Mm97L9A/0Azz5PEKeVAc4H46A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a680ae62-7765-aa51-1edd-9a1a7e39e449@suse.com>
Date: Thu, 6 Jul 2023 09:02:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Detecting whether dom0 is in a VM
Content-Language: en-US
To: zithro <slack@rabbit.lu>
References: <CA+zSX=Y4MwsDSd9oSG1NQyt==YAw9SeRdh=eJxTUhhOx57ihWg@mail.gmail.com>
 <4ee01a0f-063e-ef93-ac24-da387d5b3438@rabbit.lu>
From: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@cloud.com>
In-Reply-To: <4ee01a0f-063e-ef93-ac24-da387d5b3438@rabbit.lu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0020.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::21) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DUZPR04MB9897:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f27cde5-c24d-44a6-dded-08db7deef458
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/DiRLQtgtOkBPjjvu5a4XfanUvtEgyhn+tBFNyU2BUPU7Q9NJh950wuyNYuHMBe72ChhtShZVqyCd1ACv0XNRuG5nN7+i8UO+D1k2pnv7AkKRhZKPiPZQRkfxCJaj46VwdQKAe4Cdx5gjGSfXeMLIzB7RP2DGT1kbCuJMpzfhUrbmHomC1Dyo8QDybs+Kj1tRxlYykGScusZ9ZMWKwBJBa8pKN0U4UyUJsrPKnDGJFQMO/lXm3+kuvb7jBmUTB3+j35Hud1F+vjeWhdqIXVP9B5EOUzd2Gl1+4q7Zily1q8onHiWO/T99xyXiX9dPPWHR0XPsHWJZ6SiYv0ZQDI4/S5qzmQaxe6wGWaCf5PuKFhF9YUryfZmrGk1u5UeVX407rLU72Ng1mlHhnPm8Qzz5zc/eTYLa1EJYlKIEKI6fLLA5ad7s1c/VwJyEezRaGo++f3hl1ElmDZlOIrnYleUOUe/hpq5r96tuKOcelezrSNvCRXpjBBgoooiKA0B2vFWlVLX0Nvmx/Wnf+EdI0PhLn1k/V4rcIkhlDdYTgwYZVPuWdmFFScw9ny39kFX4DDNyyMp0l5qEgswW37fq60eUoo2/y/iCIOjclKArJdHRzCcRf0+1x/k2IF3BfX8pa0l8MiIb/zUNqw0/hEf1Zb1c6hNPHnZTKwGkfyHFFb4BvxZt8UOHIwzmsNjmAkMcJcn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(366004)(136003)(346002)(376002)(451199021)(31686004)(66899021)(6666004)(478600001)(6486002)(2616005)(83380400001)(26005)(36756003)(31696002)(86362001)(2906002)(66946007)(186003)(53546011)(6506007)(966005)(6512007)(38100700002)(66556008)(316002)(4326008)(6916009)(41300700001)(66476007)(8676002)(8936002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGlOMlBza3hCRFZXc3RxQkV0d1dza2tmZGRvc1I4QjNtRmdlZC8yTEtYOGh1?=
 =?utf-8?B?QVVQREpWVEd4djZkY09yeElLdjFaSFRjemw3VUdxd3BtRnV0YkRSMlB5WjJm?=
 =?utf-8?B?Rzd0d1FBaXdFSWJ4S2kyM3d2c05jQVJrc3J5LzUwWTR5OC9pRmlJNTBOYlBm?=
 =?utf-8?B?cHlod05nc3JMQTM3NHBRaVZzb0MxNnp5MFdKUXk2SDlSM0lTUFlOdkpvaHZr?=
 =?utf-8?B?YnVIWTRhamlZTDNDYVpmalZiREJISU4yeDA0MlJZTG1qclY3dFdzNkF5TE9N?=
 =?utf-8?B?M0FUZzY4S0t3MTBxRUhLbVg0Y3BlMTFmMXhyeGhRUnF2S2JlbzhMYnBxZDZy?=
 =?utf-8?B?Z1hQUURxTURydXFJS3FxamlmZ2F1MUVSa2Q5NWgzSHRkRk0zdlNJbjdaUW5a?=
 =?utf-8?B?NHF1TzNqYkFCaGp3TTJwNjBtL3dDa3QzbmtBa0dHTUdyRlNDYW1reFU3bXA4?=
 =?utf-8?B?a0E4OFROZzJuOWhvV0R0ZGlRU0tFRXZFQ25hTDAxM1lSQk1uVmlVbS9seVlF?=
 =?utf-8?B?MlhOSDgxSTV6a1JyZkJpdCtYTFVxcjI0MTRMYWI0ZDNOdVZsaVVENTJUVWgy?=
 =?utf-8?B?MnN4V0VjRk9DdjNsa2FoV3VqUUtacWhxbW96WHpQNS84ZjlZU093Q0RhOTB4?=
 =?utf-8?B?YWdCU2p3Rlc3cjk2N3BZa2NoaWxWcnpoMitQQmZ5YW50aXVFakxPTzIzWjlk?=
 =?utf-8?B?YjlHd0twTnRLMDBmU3FmZm42S0dZNk5VUDRqdlhoZThtTStYTUxHVkh5ODRG?=
 =?utf-8?B?SnVFMjZITjcxWjBWUWlQcXdVL2RLVjAzeUhDVzg5ZlppVlpjeWhIaTVieWJp?=
 =?utf-8?B?VmJ3cHpJQ2hPdXhYdTBYd3FDYUdtZkYvWVVrYXo2dmp3VWJIUG5uSnM0LzlD?=
 =?utf-8?B?QnJZNnZhSlBFRzVRN0xpVHg2d0owR2FtVCtCc1BPcGhrMFlrbGtySFd0cWZl?=
 =?utf-8?B?Q3VmVEI2eUV3YXBJQTNGRE40OThUT1FqK0ZpRjEwQnVBY2xnZnZkVFd6MWhL?=
 =?utf-8?B?SjFYWVJsQ0RoaDRxM1YyRWxQQU9PL0hhcXdzYlU0YlNnNW9wOFYxbkZxaFJU?=
 =?utf-8?B?WFc4NEdyMmdlVCtEZzNYalZlWlk0MC9pZDR0NExCcTV4TXJnQXlSNUxhMzVK?=
 =?utf-8?B?UzFzQTdNZWc3MFBGYzE4d0tqU0NoL1VTZnRUOE9KNjBtZlF3WXNlR3FrUFc1?=
 =?utf-8?B?QXorV1AzMXhRSGxQeDhYTmtGTEx1YWpaMWVzcC9xNFFsQjNEaHFvdThSMmVV?=
 =?utf-8?B?MlBwQk9TblRyaHlhT1krUERsRjBDdkpBN0t3dG0xK1BmVFVGSmt4SDJZbnM2?=
 =?utf-8?B?c2JNRUpxcUpPNHFIYitiNFQ1THhJcXF4K0R6cHZDNmZsaytYK1F3T3RsMEhQ?=
 =?utf-8?B?RmxBdnE1TzJDN1FKaVdIbGVqNkFSbDlJMDVkWXhBV0ZLVlpYd1hTQVBPOFBo?=
 =?utf-8?B?VUJuY3RjVGVwbmNqK0F4ZVpUcGpVd2tMUE84MHlRbUJ3dU5iQ3RDN3Fic0FI?=
 =?utf-8?B?d0pwYmdqZlluYzBkZFBDdTVZZldncWFEZDM2OWVjYWpBUzBlRzNCeUVrRUtL?=
 =?utf-8?B?aW1KNEZFV1llZEliSnV4ZWgzczBNREE2RFZmak52VGViMmY3UlBNeStPWVp0?=
 =?utf-8?B?RDB6RXUxcmhBOGhGUXlLOVNJTXRoOC8yblJFMUZsVlIxdkRneCtqR0tOR2c1?=
 =?utf-8?B?K0ZFdDg1bVBlVzl0OWlweUxTVmJzTE9uV01NZjhEOUU1ZHk2QWJlWEV3RXJj?=
 =?utf-8?B?a0ZsbGJVSEpkZnlQNkdULzRkczc1MVNKdzJudkJhUDZpMFpSK21nSXBJRjJM?=
 =?utf-8?B?bnlRaHFkS1B3clNGSkFrRWI2UTlrWnUrVis1QkgyTHNoYUlWYXpBd053Y0xR?=
 =?utf-8?B?bFlGQTh4cGprbnZZeEVkS0tlWkJrakhLNGdxYnhFd090bW5JU1NUMEVQVm40?=
 =?utf-8?B?L204MUttU1FtcVlVN1dsOGRZcGdEODYyOTBlZktoR3B2Zm11RmxlbkNSNENj?=
 =?utf-8?B?bG1sNE9rMzd3OVdzQ05VdUZtN3hKdHA1aTlNcEZ3MEZSbEVlSHZCdG5CKzBj?=
 =?utf-8?B?MWluQmhiWVgrNks3bXVQYms4azJlWElERWpYUVFDRmszUjVZY1NlemE3YjBr?=
 =?utf-8?Q?dtBpIf9XI7H9gAuXWmQguWLGC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f27cde5-c24d-44a6-dded-08db7deef458
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 07:02:25.9220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eELqaDS6fUU8+TBzy0cxBxQbzsCODNAOPS7ZgAUteIVSd+EfHJOFF50fo/D9Sk7w5Sb9yOg2kC5mor9jJdIelA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9897

On 05.07.2023 18:20, zithro wrote:
> On 05 Jul 2023 17:51, George Dunlap wrote:
>> Hey all,
>>
>> The following systemd issue was brought to my attention:
>>
>> https://github.com/systemd/systemd/issues/28113
>>
>> I think basically, they want `systemd-detect-virt` return the following
>> values:
>>
>> Xen on hardware, from a dom0:  `none`
>> Xen on hardware, from a domU: `xen`
>> Xen in a VM, from a dom0: (ideally the virtualization type, or `vm-other`
>> if not)
>> Xen in a VM, from a domU: `xen`
>>
>> Is there a reliable set of tests which would work across all dom0 guest
>> types / architectures?  If not, can we expose the information somehow?
>>
>>   -George
>>
> 
> Small follow-up, I did some more tests (AMD platforms).
> systemd-detect-virt (sdv) is using "/sys/class/dmi/id/sys_vendor".
> 
> On both "baremetal" dom0s, sdv is reporting the platform manufacturer 
> ("MSI" or "Micro-Star International Co., Ltd." on my systems).
> 
> On a nested dom0, sdv is reporting "xen" :
>    root@xen-nested:~# SYSTEMD_LOG_LEVEL=debug systemd-detect-virt
>    Found cgroup2 on /sys/fs/cgroup/, full unified hierarchy
>    Found container virtualization none.
>    Virtualization Xen found in DMI (/sys/class/dmi/id/sys_vendor)
>    Found VM virtualization xen
>    xen
> 
> PS: my host "xen-nested" is not masking CPUID leaves in cfg file.
> 
> So I'm wondering, isn't that path enough for correct detection ?
> I mean, if "/sys/class/dmi/id/sys_vendor" reports Xen (or KVM, or any 
> other known hypervisor), it's nested, otherwise it's on hardware ?
> 
> Is that really mandatory to use CPUID leaves ?

Let me ask the other way around: In user mode code under a non-nested
vs nested Xen, what would you be able to derive from CPUID? The
"hypervisor" bit is going to be set in both cases. (All assuming you
run on new enough hardware+Xen such that CPUID would be intercepted
even for PV.)

Yet relying on DMI is fragile, too: Along the lines of
https://lists.xen.org/archives/html/xen-devel/2022-01/msg00604.html
basically any value in there could be "inherited" from the host (i.e.
from the layer below, to be precise). The only way to be reasonably
certain is to ask Xen about its view. The raw or host featuresets
should give you this information, in the "mirror" of said respective
CPUID leave's "hypervisor" bit. But of course that still won't tell
you which _kind_ of hypervisor is the immediate next one underneath
Xen.

This then further raises the question of what use it is to know the
kind of the next level hypervisor, when multiple may be stacked on
top of one another ...

Jan

