Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFCE5EDD8A
	for <lists+xen-devel@lfdr.de>; Wed, 28 Sep 2022 15:16:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413335.656914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odWul-0001Kt-C8; Wed, 28 Sep 2022 13:15:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413335.656914; Wed, 28 Sep 2022 13:15:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odWul-0001I5-8X; Wed, 28 Sep 2022 13:15:51 +0000
Received: by outflank-mailman (input) for mailman id 413335;
 Wed, 28 Sep 2022 13:15:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RNMk=Z7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1odWuj-0001HE-T8
 for xen-devel@lists.xenproject.org; Wed, 28 Sep 2022 13:15:50 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80080.outbound.protection.outlook.com [40.107.8.80])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab0335f1-3f2f-11ed-9374-c1cf23e5d27e;
 Wed, 28 Sep 2022 15:15:48 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB7084.eurprd04.prod.outlook.com (2603:10a6:10:12e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Wed, 28 Sep
 2022 13:15:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.017; Wed, 28 Sep 2022
 13:15:47 +0000
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
X-Inumbo-ID: ab0335f1-3f2f-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y0GFl4VqZr7DfmBRjBwzB6+L71p/hd/KnwKIoHGHWbdiWCvk4khyPekg7nLcvXUdvMDPx1bSkGHCVV9ojR7qlSGMaBqbPs3D2H1jrimy7TzMc4ueuGTYRq/R7DLinKNuMs9NvU1xZJuXXKB/PJaQS1pWU01m8fWk5E8m8XahduErUV5h36h3Xfr1eaDaPhQbYiX2xX8JJoCrX10CQPAEhoPGYkoQoIxkjnHE7WqtDc7IRM9Vk752cuh0+Wg1DN1ScIyD18JnkK3JIoCH+TsLTECgX/vaxPsGSHh6CMxpsYhFJtSmmUe0QeSiU4cOlwgtbHtnsFNT40XBobLUJUwOAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AZ9fy1MLmK7l6yRaSi2cGiNMcgrW14jSAOoPB9Z719M=;
 b=ItcdoAH1Ff78Z/TAc8tRk/WB+he4Kr1/vMFyapZARnKLTYa9lxvXM/DS5aFwIxgUMH784MTae59iyBpM77FoqRrwdOXqisOTqT6wBk9Dm2EIEwsOTn7Om9VI73hrMXtrUnYSOJosOU6HOLtH7CybET5bEFWaJoFWkSwBj0Wcr9XHz/cPXnsaowJrLKBNI6D2LdTBWCoxUVLO36oNzGrsZmZqlLGHS8jyRCgpJuDRZDuKCrlK6K2BDzh7Y2xtPIPDay6xBwrs+eRpDexzv78UxNo1BApv6zKtBNXipzxOb8hOADrHFoqRaXlfKvjCTvOsfDEb8BHNLw2F3pYJ7tROMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZ9fy1MLmK7l6yRaSi2cGiNMcgrW14jSAOoPB9Z719M=;
 b=s3n5EEgE9zGOmY3I89WS9R0c3va6xeLzuJ8rWPDhwqsKab3cng7gu5ub+k886eQtZX/CmjvbSAP1z/nY9i2EwMOMZ6diJ16KmzQk+hMY0pTBJdj9PQkHn5ozt99GSVo2HfBrNOaIJhpDOYgClquzq0qFxsbYMFx/7JMf/5X1v+vQR1H/IK9FaL542KT/q6HN7t2945DHAU6Z2MXXio+vgH9yLLL9uLUYgclIvEQkjMknXH0J4VWzG7S4b8OWrISKrgkM3grpY5zFJ8S1BblW/EcD0jj5N44EhNdwwcnIcSBUcHYUlnFSkc1s4gpGf3hcC1WJNJ9cgvjRVGk00SrINQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b7b3f70b-df1b-a833-73a6-740f26587847@suse.com>
Date: Wed, 28 Sep 2022 15:15:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2] x86/ept: limit calls to memory_type_changed()
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 xen-devel@lists.xenproject.org
References: <20220927153937.39389-1-roger.pau@citrix.com>
 <ff79be48-8146-0b33-bdb9-ad9f33083559@suse.com>
 <YzQdEQbXhV2XDEKG@MacBook-Air-de-Roger.local>
 <357195b5-bfb5-7f0d-8295-3076a6762f12@suse.com>
 <YzRHQMxpT2v82Et/@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YzRHQMxpT2v82Et/@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0511.eurprd06.prod.outlook.com
 (2603:10a6:20b:49d::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB7084:EE_
X-MS-Office365-Filtering-Correlation-Id: ba2f9c77-b702-45c3-255c-08daa1538e58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yScfhCg1I0pyx0OTL7H4L9TeMs9uUn4o09RabD315CykHk/m1Ev0Q/Sv0ZgmiKLhsdHq/MbommfWYA2ui9SxKXwaTvS9kBskjBmSr/nELQLN56BGQwxVatPUZjhCRkY9FE0KoyTDTBxoCdad46WUJx9+KtRoEDTC/fdEN1swlmld1tTpza5YazA+uzZWEch1e0lmKmt1+/BIfEWRwcvG1UClrYcT9RkSq2Z7ZhLPtAklygMno8K99TCmY1p3aIYqegsfvankUxHRzVOP8I+WMNqZXoDpnE9pd+CgRqWNS1hsoRDzDP/fpctoigT2gPDF7tZbuyqF9YWKgmbgQHiqjxqFHS+94MOTxIocSsA/ucJZFCfRWQrQh2wVKYwDiNJQwskRmMRAJ+ggzJ6+9Pvk0MiyrHOA7hd0drjzCNftzNzkXi3qnDvr60FqF9qBR63ANzApQTyoFsubDt9+jDw4AHv9ObMYw/L5LC4X35K+Q8aKFpxbeO7ULX/N+70iEpjKZPyJvCjuN49pgmPfHogmUdqqaEXYAwKPxwK3GpHDsGeAqLgWfZ68O8UbfDUiq6Ie3pcZX9sNNz7M6cxjyerTD8nOpjYk/xx7PHHEUz6hQTxFPp5mJj9R/UVuHJ1EGlk/ynGDj3efqotzIiKNY9ICiwPOgXyHrlWqirdV0ZwgJoz0JSNlHr15K4DeNM4eSC/zvH4lruZt3CnRd0r9CiKKhMbB44B+plswItGIPAUjw0EPRwWEvMxmeNOKQMMEsqE5hv/OA8K9HsOFmqpCKgP2q36sPDZw4t6t76H4m+0ct9Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(396003)(376002)(136003)(39860400002)(366004)(451199015)(31686004)(186003)(6506007)(41300700001)(26005)(2906002)(8936002)(38100700002)(2616005)(316002)(6486002)(7416002)(6512007)(66556008)(478600001)(36756003)(66476007)(8676002)(4326008)(53546011)(66946007)(5660300002)(6916009)(31696002)(54906003)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bDNLU3F1MGlpeXZrOTBMZU5wakoyMVRjbkV5ZWxUM1V3aFlCZFlPa2tUUVd6?=
 =?utf-8?B?aGNpUGxQQ1NYZU0vbjRqWENqLzU2dll5VUR2aGNveDFWSHR1d24vdFc4b2NH?=
 =?utf-8?B?UjZyWElQUytIaWY3QkorSStXaERNamFsSHp6VGh2Ui9kZVFNcDZUMGRtcndt?=
 =?utf-8?B?SHdwU0xDeDhBbW1RM004MjVKMHB2RHJWZUJjaFFzbm12YnZOM01ubjBkbWRI?=
 =?utf-8?B?NHNlR1FBVkhleHF1QjRqbnBPeTlucjdHQllOcHE0R3JVdWVNdEY1ZytQcmJ5?=
 =?utf-8?B?a21zK1VwanFRbmZ6M0NJRXlxV2owVHdJeGpITC83RU01WVhpUUQ4bHh0NW5v?=
 =?utf-8?B?ZWRjSjVqQythYkkzSHNuVzJEeE0xY3VmdWMvRkw0aEN2VEo5V0M5NlJNKzRZ?=
 =?utf-8?B?SmVXMWhZaUs3VDdjaEdLMGxFaHAwUU1sWE5JZVpqelByQU95VUp3RWdGYzdi?=
 =?utf-8?B?VFd6eXUwSHh2K1VyRStkdEphTWZTZnErcVhGbUZIL3hpRHkvZDVaWGcrSFZG?=
 =?utf-8?B?T2ZJaDQ5Tmk2WWpFUUw2WUtheG1yaXp4K3Z0VmFWMlg2N3ppTXpPRmx4V1I0?=
 =?utf-8?B?NnRaM0tMK2dNeUNsTVVUY082d2pMc003eTVyK2sxdmhkUEY5UmIvbmI4UStK?=
 =?utf-8?B?R1pDMmZ1QTZvd3VONGNQUlhIMDkwNUZvQXcwck1PckFaMmRrazd1dWI2ZUo3?=
 =?utf-8?B?VDczcUpieTBVcTVZV09RQmtWVEZYRjR5UWsyQVBPcjJpdmFvWkZOTmtrZE5k?=
 =?utf-8?B?NERQaUpIRzlZMXBBWHQ3RlgyUHJUUzQ0c3hsSW41aGttTkRVVTQrVDdnV3lS?=
 =?utf-8?B?K0lkdGJRd0M3T1dlTWtZWm9WNThaeEZzc3VtK1VPV2xydmhDb0xqTkJJZlJN?=
 =?utf-8?B?M3RHQzhva2oyYnp2T3ZXZ21oQTYzc095bXFaei80VSsram9xVXlkQ3hhd0J3?=
 =?utf-8?B?QjJndzVYRlBTR05qcjZWRTB5bGs5TkhDMzRmeU9SS1VHSDg2WFlLMWVEQ2Zk?=
 =?utf-8?B?VmdHWm9XYkxaV1hidDZMNHl2bTV2SnhDQ0FtZU8zaTlwbjZaRCtyTEUvOS9a?=
 =?utf-8?B?cXAyV3N3c1MvR0NGbFh4V0xUUldEU1BaallaWk52c1RRaGZ1QnJYZVdja05i?=
 =?utf-8?B?L2J3SnJqYzk1a0dMTTVOZVphWWxrVVV1ZElOeVhNRWVNdlMwc3FlM0pvZ3dr?=
 =?utf-8?B?WDFnWG9pdmlkSDRyRGlWM2xaam9aWlJFMUdnMDJxa2locEtYdDFRM202VDF6?=
 =?utf-8?B?MHhyMGRrUWluYzNuS1FtbUpLcHdWVElGTlN3TjJwcWFKWDlFOEp4L0ViMWMy?=
 =?utf-8?B?ay9GeUluWUVXZlhrdkpNWWlxdWlhcHFqYlVaaVowYmtnNGZGZ1IrRG9xVzl0?=
 =?utf-8?B?NEVrcURMYXJBajkxODU2eU1hVjEvNjlGV1V5YmFtUGlrTjJqNmhsWnFBUFAx?=
 =?utf-8?B?Zm9ROUxDVk9uR2xjNk5YQ0k0R2Y2UlRlM0huT0R4ajdzdldzRTN2aWJ0QmtL?=
 =?utf-8?B?d3FsTERuM0N4dGRNQzF6Y1NWcEpzMmhjTUhsZEFNOTdOT0ZvcS9Rbk96MWVS?=
 =?utf-8?B?MU16aDJHbHVuNERiRVBHL0JjZ2JWaE5nRVprR09QbHgzRk5zeUVoc25wWDRK?=
 =?utf-8?B?ZXZlZU5MY3k4dWowK2ZENXRJUGhJK3gvWnBTV1NZem0xeGs5bTIzeENaZzU1?=
 =?utf-8?B?cHFxaVZHbXJEWGJuUlJPTWcvRlo5eGtCc3Y4bzVmYTUwQ01xcjhwQzZFV2RT?=
 =?utf-8?B?TCtxOUR4cmRIVnlxMXZubzBRS3hEVWhURXVYb1pueW85bHlVUDFIekhDWThL?=
 =?utf-8?B?ZlhRVjJkRzh2K2FQMEY1K3NrbEVkb0VHbWRBN0JhWU5EVjJnSE1VUDJVcWZ1?=
 =?utf-8?B?UTJxMmZTcFlFemxzakxreVprUUxTL3hFTmJDQTQzYmNWakJYN2Y2MTlmTDU5?=
 =?utf-8?B?ZkpqNlcycTZseEhuQnB3a1A2UkFOVkdVMk9ENFRHQnRia0FlMXpHeXhlWmdO?=
 =?utf-8?B?ejhjeVFrVW9Mc3ZETmtoVkZwSXNqYmhqNWZjN0s1U1d2NjhoeEFLcVp0YWtV?=
 =?utf-8?B?M0YvTEJjYWdkUXRCVW5lekw3ZHJLUkhNMTg5TDhXQTFTUXpXb0hvS05qTEZ5?=
 =?utf-8?Q?H3Q0JZ6Y5b0lHtaYoO5HslI3x?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba2f9c77-b702-45c3-255c-08daa1538e58
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2022 13:15:46.9939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ykdac2jVEcm0YM6PqI+zDADdQvouUj9YXKuSAivO5AmSccXyg9CPeoumd/pZS8QfqiD9H61bw6+h7JiQWOlKVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7084

On 28.09.2022 15:08, Roger Pau Monné wrote:
> On Wed, Sep 28, 2022 at 12:45:13PM +0200, Jan Beulich wrote:
>> On 28.09.2022 12:08, Roger Pau Monné wrote:
>>> On Wed, Sep 28, 2022 at 10:01:26AM +0200, Jan Beulich wrote:
>>>> On 27.09.2022 17:39, Roger Pau Monne wrote:
>>>>> --- a/xen/include/xen/iocap.h
>>>>> +++ b/xen/include/xen/iocap.h
>>>>> @@ -7,13 +7,43 @@
>>>>>  #ifndef __XEN_IOCAP_H__
>>>>>  #define __XEN_IOCAP_H__
>>>>>  
>>>>> +#include <xen/sched.h>
>>>>>  #include <xen/rangeset.h>
>>>>>  #include <asm/iocap.h>
>>>>> +#include <asm/p2m.h>
>>>>
>>>> That's heavy dependencies you're adding. I wonder if the functions
>>>> wouldn't better become out-of-line ones (but see also below).
> 
> I would expect most callers to already have those dependencies TBH,
> and in any case definitions there not used would be dropped anyway.
> 
> Or are you worried about the newly added dependencies causing a
> circular dependency issue in the future?

Yes, but maybe for no real reason: Now that I look, I see that no other
header file includes */iocap.h (except, of course, xen/iocap.h including
asm/iocap.h).

Jan

