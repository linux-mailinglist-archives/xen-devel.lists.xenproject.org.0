Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F10A5FB36E
	for <lists+xen-devel@lfdr.de>; Tue, 11 Oct 2022 15:28:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.420276.665026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiFJ9-0002qH-Rx; Tue, 11 Oct 2022 13:28:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 420276.665026; Tue, 11 Oct 2022 13:28:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiFJ9-0002o4-Oq; Tue, 11 Oct 2022 13:28:31 +0000
Received: by outflank-mailman (input) for mailman id 420276;
 Tue, 11 Oct 2022 13:28:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lm68=2M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oiFJ8-0002ny-K1
 for xen-devel@lists.xenproject.org; Tue, 11 Oct 2022 13:28:30 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2072.outbound.protection.outlook.com [40.107.247.72])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98079aef-4968-11ed-91b4-6bf2151ebd3b;
 Tue, 11 Oct 2022 15:28:29 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8767.eurprd04.prod.outlook.com (2603:10a6:102:20e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Tue, 11 Oct
 2022 13:28:28 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.034; Tue, 11 Oct 2022
 13:28:28 +0000
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
X-Inumbo-ID: 98079aef-4968-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FpBP5ev52dLnuZfK2I8HhQ1BdYMGmHVayjjR22qTGn6Y13jc0zdB9z9lS4b5N6MexgpV6glO9leN1oLANcWOMjK7+pEtjERd9gRe8CpkS4r5OLm8Il4MyV8zlqEWoEXUYMae5lT1ksEWmc4dAijllroX7i7QK1fFBnlm4fI2wlfQscPUUU61eBLZ5iajoOmX88gfjMcLCXGRaVK9HrlFrqqJu648SMZoD1a4cqktOVwZxXm6se4vLxB8H2xM99rTkhjvuYjnzkKH1guIN/KknkQfg7REXDiLzZrRak3A2UZioaTYgC4B2vm18XyvIFhpQOVDCvnNCuAt5NCFQa+Nyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3KryHIzf/Kz8GVsaPjcvhzBMiBaQ5ofEduiQuZ9eTRY=;
 b=XxtxWfr26x10Ay4R+3/pmWn6j01GrzOVYc4W8qmW8JW36FUNkP1CGP2f2cV5HJvFNuHCPGdbDLJ9uJIP3grZccDm+nk1lOT3wT8Wo3seomTTo/u4dI7r/KPyYO1sf+x4ZEweSeHozN4abVZhmeI4Y2Xm9fs0JUPsKiQ977ddEczLO2+hPoc2bfJJZr6Xo8DggrNsWzaMyuvXdZbVCq23GSfdZrpU7vyIgKfX+7QT60K4WmZKPpsxX9Cid9FrASCvLP44F/FvHBUMm3zt02CKaDtgohqrHPe3KRpDYTsB127l08Gtrtc22aVYR5tWR8trkKSXYOHfV6iLzHHllkzDFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3KryHIzf/Kz8GVsaPjcvhzBMiBaQ5ofEduiQuZ9eTRY=;
 b=UTGgTuXqUi4Qh9pxWTC/Ur3aSRqAIa0WvK6XaYIGPt4zfrkEtQJ7mJ5/lFBHBip+BXXYHNS4gslM4tPR8AeYqv/9HqKFHDNxQMp1B8SgxX47uZqcFMJW2I6UXa09eMBfPY/vhsGkbTquaKYnLFbEQLDNS9ykC894+HVVkiazUkMIujcxC3KGEEeXG2cLsaQf9W2U3nFJXpVqw3Sy3xChISzW+AwYd7OxCsG9r+vTo8Qb+TZpvF9Bz3z+d2gTxUm3bpBJ66HxXMq0gHCkynLw6lhFMyjV22dPgxKRssbGiUEh/9o6I876fjEHR1tl6e98S9ULXu/jYee5iQg0XUpomA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <77349d2b-de72-3e68-362a-493f350eeec4@suse.com>
Date: Tue, 11 Oct 2022 15:28:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH V7 2/2] xen/gnttab: Store frame GFN in struct page_info on
 Arm
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org,
 Henry Wang <Henry.Wang@arm.com>
References: <20220716145658.4175730-1-olekstysh@gmail.com>
 <20220716145658.4175730-2-olekstysh@gmail.com>
 <df56f268-59d8-4b9a-52a6-40bfd0b91414@suse.com>
 <acedd354-9050-5340-ffd8-259aeb95b101@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <acedd354-9050-5340-ffd8-259aeb95b101@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8767:EE_
X-MS-Office365-Filtering-Correlation-Id: 31f97ce3-678f-4cbd-33e5-08daab8c7b75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kuZcdMuX1289I+e3P1Rw/iYPIp1BS0tN45EpaFS6hN+ekduAk2j6FtmYYdCHnx1gtIJ2tOmc8zjk51fL2OfSnnY8f2cPdKR4/UZ94OV00KfSmMocuTqwt4ta4UTRCv2yRYXi+Tyt0JafOXCwy6baibR64p7cmieLmgb4WJgiRmB/ZRRhJRd222zzzMFunv/HlIAfcrCTENx7t7YtV6ClkxymQnhlVci7N3aC3e0QLjZZ9WpzeaUc/0Ctn2jiRDz1XzJQyoOlNs8eA0ZC9ik8KB+D3TVdaMezNF52KL7CUBFnGTc+nQ6i0F/lj+bBARxsv6ilCSJbED42Ws697LX9+SLBOTZqtRxQPKx7C5PTM+yofk0QSw9aMTcdLKa/A0Ad4AySMs78czqQy68WN1WvKqzeaZjQfQZjIYPU8IgMTvh9+g/SIvGG24OZ0F1+9M34QORvQjrvo7rqUPaYPJ6XXe3yYwv27iw6HlHTQGbKZroc1Xh7sbLA4Kmm7arRpwtU8uqm+kYn752u7KsTStcCDD4JD8ndFtte3g442dojHMsdJRyJ7DHSm/YANlhw8tI+sa8tsOWIFH3ujstxoMDtyRacwbnz6dZK273NgBeMFAzx1RNjFQw6Y4kIMMZYMbZqRnE/2mDIYi9vz2TWTuzAj1PaPfpvAofemJ/0NzwdAO9PFQwzk3Y9DTjTOoo/3BiiEiG31qXpX3aKxI1Ng+IraOiVL8trCxwUJTZpdJqEJ0YR4li926HRHJomY71GpyVwjavTQfhTPfpaYGuDuC1kED0Mysk+AmdryVKunIMC0lE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(396003)(376002)(136003)(366004)(346002)(451199015)(54906003)(31696002)(8936002)(41300700001)(478600001)(36756003)(7416002)(316002)(4326008)(5660300002)(66476007)(86362001)(66556008)(8676002)(66946007)(6486002)(110136005)(186003)(38100700002)(26005)(53546011)(6512007)(6506007)(2616005)(83380400001)(2906002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0lVRlY5QU41Qk04MkN3SnZwNmY2QkR3UkF2czZ0R0YvdklpYnRMZk9pMnov?=
 =?utf-8?B?QlZtRm0wdW5teE5ZYlMxLzlTbllicXoxMjhqY0xsdEg0UURCTVJRYkVtNUhn?=
 =?utf-8?B?b0Q3eEQzZjVBYlNvcjk1Q0I2V3RZK0E0RFpCRVBLSFk3MXV2UzZFMExwTFJh?=
 =?utf-8?B?QUxKY2krcGFYbnUwRUxyblg4NDZHVWQvUDJDM05QL3JqUGlvNUFobkZ4WS9J?=
 =?utf-8?B?eXNOM0U4TDBWMkNWUG9QRHdZZStiYUJEZDJoYXBEbXZNYTV1cWdRdml2Uktq?=
 =?utf-8?B?eWNMQnVGTFQwV29PN3ZSWi8rSGxReG5WeVRZbGV6U0JrSkZLUDJ4SDJ5bk1h?=
 =?utf-8?B?RnpMNzhQZkRaRTIzenlRT21OR2dSY01uZXJiTFIyWnFUYXoxUzY1aTZGenND?=
 =?utf-8?B?TXhEZkVaWWVEeEJQdHlMdElFOU5HUEVXbFRSMTY3Ykw0ZExkM3Myc2lkbVJw?=
 =?utf-8?B?T0ZvWWhoQTdmMzF3Q3E3c21YY1ZVS2EvTHJFa2xiWkdpd0ZFbU1uYUVzU1Rz?=
 =?utf-8?B?Q0xLM0p5R3J1emJTc1AwdytnVC9RNDRDTzR5UEhKZXlrUE1OT0lUNkluUUNy?=
 =?utf-8?B?VVFPL1hhZ1RzYmxUbWZGTWhBc0d3Q1RZbW10ZDYwY2hzR2ZUalN4RE1aT3Zh?=
 =?utf-8?B?dnNKVDY0ZlhpTlUvMUdvYkdMMVdndHFlVU9tdTVDbXo4N0xPSU53S2JIaEtB?=
 =?utf-8?B?d3hGalROZUY3UkxFUXc4L3JidlhLeitTVVFzUUV3N2hmQ2JFNHVzSDZadlZP?=
 =?utf-8?B?NXEyR3YwUnRDdmNVMEZrMjBzQnJ6OTJ4Y0NtRm9qNWZWMTI0cU9kS0UvT0dL?=
 =?utf-8?B?YWhmSkJxWGJScFA1SHJFUi9KdWNGOU1Nb0RNNmdqZVdIQzFlMVVBeU9IbUMv?=
 =?utf-8?B?R1M4R1RqYzZoUUV1cUk4Um5pK2RiQ0hRU051dFFSbWxJcCtXVU5iV3RNeEJT?=
 =?utf-8?B?OEJCSjZMbXNqNXZWQTJKQytVdkE0UDJvaHZBN3JaWVRJMWpseFJhS2tqVGFp?=
 =?utf-8?B?V2pNU0R3MHd4ZFlUM3VOM05UWGp6dXBHQWF2OUJMQVlPc3JPZlVIZVFPc21h?=
 =?utf-8?B?RjhvS0U2UVNNWnZBNDFYK2tLT1VMeml1RldlNlljQmhoVDRsMm0yVzlXL2Jk?=
 =?utf-8?B?LzJ5c0NrUFlLK0xIMUZIVTVNZEtZb3g3RG1xeXpKbTBTdmFVOFpTVExoaWhn?=
 =?utf-8?B?STdVVHZ3MHJSc3pDZ0NJd1dTU0lFSFFZVnZFSW5PNkVZSnVKc2x4U1czZzFp?=
 =?utf-8?B?VGFqZEhmeHo1L05nWXo3NVpGTTVNZ2tqVDdscTA3a01ZYUtFQVgzM1NZeTJG?=
 =?utf-8?B?TDFyRjNmNUp3Q3BwdGZIRGVGMGZlMDVyTXUzYVphWEptcm5qb3U2bDhXZ25w?=
 =?utf-8?B?RHQxZjlJSWZ3emluUngxME1wa0tQbTlFYmxuTEpFcStBemI0VDFuR2lZR1pB?=
 =?utf-8?B?R3hwdUptbG5QUGRLcG83LzlsTXpwTmJGbU1Jd1VzOE9xeGV4OTBjU3NlYmlV?=
 =?utf-8?B?VXZvaVVXMTgzZnZpQW1DaWhONXFPUG1LVmUxaWdkaDFlOFJLOGtJM3pibExX?=
 =?utf-8?B?SkJuUjJtM2IwTWNvYUR0RndCYmRmK2h1VXFsb1VXaFloNWE2bG5GdlNPUWJp?=
 =?utf-8?B?OHRXVVphSlVGMTNJUjRiMVJRREhoQlB0d0U5L01uNjB0SElYQ0hjZnZNTWk5?=
 =?utf-8?B?UllxTGU3b3RsbXUwNTlBYVJnWXhaSmxpTVZlWVBxRGhkMUkwODJGaXhkdTVw?=
 =?utf-8?B?bTlGc0tReHJQekFsbEVNVUpjNlA0TGhxMjZQRW1sUDlMMkpxTmdTRUpHM05l?=
 =?utf-8?B?T0NqeWpOdG1Za0dGcEY3K2lLdzVGWGtLanZWd3NtbmZQNVZvdjk1akEvTk1m?=
 =?utf-8?B?ZXEzazlUL085THVaRVcxRUx1SmhQNThoeCtVL1JKb0h5V2tVRG1ESlhhZVNQ?=
 =?utf-8?B?NmhKTmVsbXNiYTZhTFA5TkFqcExkZzdvaWEyZm1HRnh2MjBBK2psenlkaU52?=
 =?utf-8?B?K1p6T0x3TUh4VHlyRWUvZkpWeXgzMDh5bk5aVDJzQks1TDZrWjlqN3hDcXZ1?=
 =?utf-8?B?d2pCamJ4LzNwcVk3dTkvUEp1MDMvcU45UlkyK2lJeDVhN2RVQjhQVklWSGl5?=
 =?utf-8?Q?TVgnRQfnv+VjYoYlp3Vvbnf/D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31f97ce3-678f-4cbd-33e5-08daab8c7b75
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2022 13:28:28.2646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jKCyIt1yLwMLfeGXVrpWCEVF7kmwruKc0AuqQBxNmGnn64DQSTp1aPFDjzuhV8WrRFAk+umkzcREBvELggMl1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8767

On 11.10.2022 15:01, Julien Grall wrote:
> Hi Jan,
> 
> On 11/10/2022 12:59, Jan Beulich wrote:
>> On 16.07.2022 16:56, Oleksandr Tyshchenko wrote:
>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>
>>> Rework Arm implementation to store grant table frame GFN
>>> in struct page_info directly instead of keeping it in
>>> standalone status/shared arrays. This patch is based on
>>> the assumption that a grant table page is a xenheap page.
>>>
>>> To cover 64-bit/40-bit IPA on Arm64/Arm32 we need the space
>>> to hold 52-bit/28-bit + extra bit value respectively. In order
>>> to not grow the size of struct page_info borrow the required
>>> amount of bits from type_info's count portion which current
>>> context won't suffer (currently only 1 bit is used on Arm).
>>
>> I'm afraid this isn't true: There's no requirement for a guest to pass
>> all different GFNs to VCPUOP_register_vcpu_info, yet map_vcpu_info()
>> tries to obtain a reference for every vCPU. 
> 
> AFAIU, this would be a reference of the **count_info** not **type_info** 
> (which BTW will never be incremented on Arm because we have no type 
> support).

I should have said "obtain a writable type reference".

> The commit message is only referring to the 'type_info's count'. So...
> 
>> With my adding of GFN
>> (really gaddr) based registration of the runstate area (already
>> looking towards 4.18) the maximum possible count is to further grow.
> 
> ... I am not sure which problem you are referring too.

Wow - a mere stub (but not inline) function to make the build happy.
Then why is the description talking about one bit that's needed on
Arm?

Jan

