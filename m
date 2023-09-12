Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0FB79C72A
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 08:48:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599945.935566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfxC3-0007Kc-OL; Tue, 12 Sep 2023 06:48:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599945.935566; Tue, 12 Sep 2023 06:48:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfxC3-0007Ix-Li; Tue, 12 Sep 2023 06:48:15 +0000
Received: by outflank-mailman (input) for mailman id 599945;
 Tue, 12 Sep 2023 06:48:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z1UZ=E4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qfxC2-0007Ir-JV
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 06:48:14 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57d9a103-5138-11ee-8786-cb3800f73035;
 Tue, 12 Sep 2023 08:48:13 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Tue, 12 Sep
 2023 06:48:09 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 06:48:09 +0000
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
X-Inumbo-ID: 57d9a103-5138-11ee-8786-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A5RPWnCrLAR17Ch50I+QZPPyURQG7EBegU/TkNDgliO+s98t5nAngs85GiWGIRKvvS7jZhRb4pMST5PNC2Cz41D4CMT2Tp74f3SFZoRI5cFAtHX30JksI7kNiH6o7dTrYPeRbfw5f0wagbiH7FnQkGmQb6wBScshujhCh+Yezq7NgiJT4iIHFqGWSX2Wlmd+FPe478ECIAiKaYijzhH0emnQ4s/lyNDRghE429i92ue81wZmBtA5/8XnmeczRC+qjuFH2+XQ1HvceRkyfRzhm2XjNAGFJg/9VFUGLidIlF+1MqP/IBymQ6Yn1YKx0ITc2tmuiPxZVbCMJRnHDaNWyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ziIlcc1oiZPK6j/k834YE6oO6Sk9Q7wyTUsUy5JeGb4=;
 b=YuGfSGqfCSqm8iN1fOBTI+osqsgvo0RbfbZqXDTd1Q0d3jGt8ZCek4BXZTJM6aEKey0lpkL/cdhdDZ+0HXDePxMN/0GRLpVSASGKhSJTC7/riUH1HJ1PXeLNoquZFrenWrA9BqOqRoZuATYGo5ScKIqiYnZVL92sbsCs8jk+MAk99W92HteSTv/QYdBBzChPk4ZHazdtgiAI3iWISFqpjR6xw97aNW9FERpTK0Ev6rvFomN9hawh+mN1ML8EHTbuycfGwUIegNSik1UZVwkB0l4UPHKTZrv/dyXDXfBjxl3Zhe2OfiEZXXCdxl+x+7atq1vjtyTRcK4kcJqKrsgB0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ziIlcc1oiZPK6j/k834YE6oO6Sk9Q7wyTUsUy5JeGb4=;
 b=B0nH7M/3ZQtuwDAnULTckHAg+KjToOzO8BO+zezMS8OV22Ll+n85MBjdlwQOOJo+KQNGJVf8Rdig9au96oZeqeGb+tJ2JkGgAb4urF/V9mb1XURf6eEURU1lEX8aqVcV0WgTBQgG3Va0WKgFG+gimRCwRgI6ulcXQBog2tNbAcOwY/qKwQec2+wMHIqsiHPYhuewmXSV3ExQBJbfu3upt5cY4ONSe8zc06+vsRCLDQHQ+pUR3KuOyY4DT86bzjo4UOIA7gDwOlnQAvOXtgXSLEn5uK0aTGTCzo2ncd5z2F3FfHwbGaOHEucmKlxmk0Hfcrx8PIibwe6wTxIOl4QeFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <07f75b80-1579-25ec-ab64-cbc1f2ff15e1@suse.com>
Date: Tue, 12 Sep 2023 08:48:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v4 1/5] xen/ppc: Implement atomic.h
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1694211900.git.sanastasio@raptorengineering.com>
 <7ed453323033a759427da33cea7d18ddca247ae7.1694211900.git.sanastasio@raptorengineering.com>
 <93f4a2f3-b98c-332d-64a6-9e34cc9dddf2@suse.com>
 <7d3029fc-1188-3c55-0a54-bb9899fb91e8@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7d3029fc-1188-3c55-0a54-bb9899fb91e8@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0009.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8642:EE_
X-MS-Office365-Filtering-Correlation-Id: c322df04-e715-44f8-6d77-08dbb35c3a12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TthwUWDA9d/RwEN2Ddyd6rnSjMWqAZ4EBMPdokSTk+i8OSPOMsbd8haT0wiu3sbAmKjIXf+55gDxi7kP1V76cO6bITP9PmwjDTCCo3eAZ6ewXjLxgA2W2lNWBjEwDKESLrtysqRhLtkF/+5hALlht9t3of+aRtI06o9uQss2NHPRS9mle1fWUyFZAyMmqlcr+5WfFn2Jnd/ASw43JGPKnfIFovhFrbGHG4jypfF8/b9H4N5w6kwZ2iAwdAiQlrzOEHv1rxPoKOcq4p7VRj2PHYagXc4+GE4VcB2TBSpAtEFMCyqQJlcI6Nu7H4pn3q4ZGSs8lMVe/yi93JryUKw58xkv0KYZtQ5W0ymHhYGnUgZUbKo+uxBS8JmBW2stEoi5IjUMjdrGT9iirCHLrb3EhL9C3HqK8VqudYpR6bi5kt71IF/6SfWwo8vVUKo2jyRuYaJVdCAzlPSxwLyGapNtthG4x7vR1SL6g2KDRqdvv1KqNH1zQGEW0WyMT1Femn2VgB8oO8o+7qxn8JEEirSyLGKydJdb2R5KyEeaaMOLGL02/6z+ye1wpzdYWz+aWBsSv8K7DlJyXNZf58TmbKBSfmyvVezcj9cfd52klLHPj5+f7SbRkPCgacZJeEuEvwJX7tBq896rc4U/wBz77peffw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(376002)(396003)(136003)(346002)(1800799009)(451199024)(186009)(2616005)(6512007)(31696002)(316002)(66476007)(2906002)(66946007)(38100700002)(5660300002)(66556008)(86362001)(478600001)(4326008)(8676002)(8936002)(6506007)(53546011)(41300700001)(6486002)(6916009)(26005)(36756003)(31686004)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eU1qdms0RVo4TEFOcVJPZkF3MVFycnVNZjQxWGo4eDM4UHdzb1NoZWxBN0cw?=
 =?utf-8?B?UDJqTDA0ZnF2bTROeHBVaDgyWTFjRXNFeVZtaUdQb3BMU1JvYUc1RCtmbWJX?=
 =?utf-8?B?WkNkREhiZktDV01RZEJQTXhVS0VRVzJpUW9Jd2tCLzZkSEJHZWdMSFhJM1lZ?=
 =?utf-8?B?NDV3Misza1NiSWFTbmdCS2FDWWZ5QjZjZk9DYUZZcm1XM2dqRERYektqa0dx?=
 =?utf-8?B?eGhzQktCQisrNzhUNlFCN2xyMVRLaUNGcXJQbDB3R1BQR0gvQnprQURWS3BM?=
 =?utf-8?B?SjNQeEdtNlJaTHRmZHpQV1BLZ1pINkt2OEEvKzhOTVY4a3ZLVS8xaTg1OW9v?=
 =?utf-8?B?TmZ3cWZPS1B5TEErK3JYNDRpM1E3czNkUVZrUFMzcWJhaUFNTTEvek5ubDdM?=
 =?utf-8?B?YTZDdjdoWG5EYndXaStKQ1VYMjgrU0tkOVY4VmNZT2xjK1h6bmg4eTluT29j?=
 =?utf-8?B?Y2R6V1ZpRmoxVW45cjIrYUhJWUg1VDcwNU5FKzdoS2ZWTW53cGxTb2hrOURS?=
 =?utf-8?B?dDhEeHkxZnBBNTdYVm05RmZ1dERseHZSbGVFK0dqRkxScWJER2hwQzNmZXpL?=
 =?utf-8?B?RDl5aHJrZEdQS0FqMVNhMG1QT09qOHFWaFZLdDdMMzZGMzNkZy9HWE1Dd3Rw?=
 =?utf-8?B?ZXRyVTZHY2JaY3V3M0NEdWhoR0Y1blhWaVNNYm1RdnRIU2xFaTJhanJBYzFL?=
 =?utf-8?B?U3pvb1B0THhLRVdZampsN2kwUFpUUVArUklBQ3JnNkZwMlQvZjBHRTdMcDk5?=
 =?utf-8?B?cXlnVzAwWW9HYXFoV1hyVHAraXBoWVd5dGVkVFZxNnllbHdERG12KzlSUEx4?=
 =?utf-8?B?a1l2b3VqZnBBektVRWtiZm1SYVh5LzQ1TUE0S0NaeEE2VzJnbS8yZE9GN2Jo?=
 =?utf-8?B?NzVNbHhUWHpySDJtbStHTWUrYjBocUhucStkZG5Ec3E5QTh5Tm1tTXpYN2dr?=
 =?utf-8?B?dHZiSllRS3ovZ2FFUXV1QkJUcnl0SXlRSm1XSXpmL3lNanIxdVBuWEdwU1Az?=
 =?utf-8?B?eVhBdUFHOUU1dEFuMnRIN25ya0hsVWpmTUt1aTdQdnIxbWNjaXBDdlA2d3ov?=
 =?utf-8?B?SmFoRXFxajhkUVhzWjAwNGxsSHYyNEQwMk5sZDFWWGhXRWdoSXJDQy9CSmx6?=
 =?utf-8?B?dkp6MXZRZVFIeFI4aG9rQzlsekVEKzlzbTFMMEdSd3cvQzh5UDZyTFROZDFn?=
 =?utf-8?B?ZHVsUmhBWG9ENDFWcGhYdWZqeVRuak1lTjFKMWJZS3JSN0xuQVNrSjh1TzBM?=
 =?utf-8?B?MDk2djRrVjlkbG5zRHcxL2JDdmFIMGpzdDRQa1Rza1NVbzh3SkF1Tkc4Z2pl?=
 =?utf-8?B?bXVQMHFvMVFCMnIrdXEwTWtWUmY0RS80dDIxWnJqeGxwVXIrcUhuRGpMOVEv?=
 =?utf-8?B?Tmt4UUt2QjNMa1BxVXdYMmE3Q04wODVWWnJaTE1ZOFFicVk5cW5aMjEvRXBX?=
 =?utf-8?B?QzJoR3VGZGF1RU1GdXY4cmFIeUZRS1YybDArbll1NGUrV2FEQWNqYXJTcjl1?=
 =?utf-8?B?THdzQlcvakhlTzBReHIxRnFQbE81NitQVEl6ZVAvbFc2OVNscVJuTXdTK2hi?=
 =?utf-8?B?d0JnNHlTZE9RL3pMK3VxTksvZm1ycmtSdTF5TDZKVENDNUs1WmVwS01LaDBP?=
 =?utf-8?B?K3VGQkg5djdRSEkwZHNNV0Z5UTd1M0QzWU51Und3blFweHM5SG0wMGN5cnBy?=
 =?utf-8?B?QitXWkZDcjhlSDF2dWV6SUFwUzdxRFhlMTFaZzJXNno2by9FUEE2R3ArM3NU?=
 =?utf-8?B?Tkt1L0hZVENzdlk5TktwNVlGczZ6VHB4T3JMNXpwWHhnN2RMY2k0cnlmM2pW?=
 =?utf-8?B?R281ZU50V0N4TUpucWdmMnVaZ2poWW9tRkhWZ0tUUTJXYnJIV01rWXE1UGFa?=
 =?utf-8?B?ZG1tN0hMd2puTmxDVFdlbzJETExScG85NU1yZDl6QUFRTUt5WkJESmJLbTNm?=
 =?utf-8?B?LzFEWStGc3JkOG1FRmNFRU1rWUFGTEZIcVp1VEdORi96dlZyVy9Tb05XQ2FT?=
 =?utf-8?B?eUQrdXVqUzUyeVZIaWt3aW5hZ2I1cnNVQnVjTGx6UFZzaGNkbHdTbGFDOHlK?=
 =?utf-8?B?cE92UkF1MmJpejR0eFNVYXYyN2NLR1BEaVZYOHJJUGU0QkNLU3lnUHNKeDZy?=
 =?utf-8?Q?puVWJgGiAQ/ht6fyR9sl5m9tf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c322df04-e715-44f8-6d77-08dbb35c3a12
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 06:48:09.7749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UBQlg439ylzYRFSM953ipehNK369hYAawOUnMtTwtQFli9XjHK4RyHLHB52qHRa6iy7axMmZSYRR9H67hKA4yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8642

On 12.09.2023 01:56, Shawn Anastasio wrote:
> On 9/11/23 6:33 AM, Jan Beulich wrote:
>> On 09.09.2023 00:50, Shawn Anastasio wrote:
>>> +static always_inline void read_atomic_size(const volatile void *p, void *res,
>>> +                                           unsigned int size)
>>> +{
>>> +    ASSERT(IS_ALIGNED((vaddr_t)p, size));
>>> +    switch ( size )
>>> +    {
>>> +    case 1:
>>> +        *(uint8_t *)res = read_u8_atomic(p);
>>> +        break;
>>> +    case 2:
>>> +        *(uint16_t *)res = read_u16_atomic(p);
>>> +        break;
>>> +    case 4:
>>> +        *(uint32_t *)res = read_u32_atomic(p);
>>> +        break;
>>> +    case 8:
>>> +        *(uint64_t *)res = read_u64_atomic(p);
>>> +        break;
>>> +    default:
>>> +        __bad_atomic_read(p, res);
>>> +        break;
>>> +    }
>>> +}
>>> +
>>> +static always_inline void write_atomic_size(volatile void *p, const void *val,
>>> +                                            unsigned int size)
>>> +{
>>> +    ASSERT(IS_ALIGNED((vaddr_t)p, size));
>>> +    switch ( size )
>>> +    {
>>> +    case 1:
>>> +        write_u8_atomic(p, *(const uint8_t *)val);
>>> +        break;
>>> +    case 2:
>>> +        write_u16_atomic(p, *(const uint16_t *)val);
>>> +        break;
>>> +    case 4:
>>> +        write_u32_atomic(p, *(const uint32_t *)val);
>>> +        break;
>>> +    case 8:
>>> +        write_u64_atomic(p, *(const uint64_t *)val);
>>> +        break;
>>> +    default:
>>> +        __bad_atomic_size();
>>> +        break;
>>> +    }
>>> +}
>>
>> These two functions being as similar as is possible, ...
>>
>>> +#define read_atomic(p)                                                         \
>>> +    ({                                                                         \
>>> +        union {                                                                \
>>> +            typeof(*(p)) val;                                                  \
>>> +            char c[sizeof(*(p))];                                              \
>>> +        } x_;                                                                  \
>>> +        read_atomic_size(p, x_.c, sizeof(*(p)));                               \
>>> +        x_.val;                                                                \
>>> +    })
>>
>> ... is there a reason you keep using a union here ...
>>
>>> +#define write_atomic(p, x)                                                     \
>>> +    do                                                                         \
>>> +    {                                                                          \
>>> +        typeof(*(p)) x_ = (x);                                                 \
>>> +        write_atomic_size(p, &x_, sizeof(*(p)));                               \
>>> +    } while ( 0 )
>>
>> ... while you did away with its use here?
>>
> 
> Yes. In the case of read_atomic the caller is allowed (expected, even)
> to pass in const pointers for `p`, which wouldn't work if a simple
> typeof(*(p)) declaration was used since it would inherit the constness
> and thus wouldn't be passable to read_atomic_size.

But the helper function's first parameter is const volatile void *, and
while you can't assign to a const variable, such a variable can of course
have an initializer (like you have it in the write case).

Jan

