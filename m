Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65ABD589C5F
	for <lists+xen-devel@lfdr.de>; Thu,  4 Aug 2022 15:13:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380355.614475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJafE-0004wt-7z; Thu, 04 Aug 2022 13:13:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380355.614475; Thu, 04 Aug 2022 13:13:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJafE-0004uN-4q; Thu, 04 Aug 2022 13:13:24 +0000
Received: by outflank-mailman (input) for mailman id 380355;
 Thu, 04 Aug 2022 13:13:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ntlx=YI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJafC-0004uE-I5
 for xen-devel@lists.xenproject.org; Thu, 04 Aug 2022 13:13:22 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130074.outbound.protection.outlook.com [40.107.13.74])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3679eaee-13f7-11ed-bd2d-47488cf2e6aa;
 Thu, 04 Aug 2022 15:13:21 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB4483.eurprd04.prod.outlook.com (2603:10a6:208:77::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16; Thu, 4 Aug
 2022 13:13:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b%3]) with mapi id 15.20.5504.015; Thu, 4 Aug 2022
 13:13:19 +0000
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
X-Inumbo-ID: 3679eaee-13f7-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V2Seh4k7v2Xi6T/NP1zAsUxPGTuFdvqI4Ah7GegkwEPJyewlmF5C1MqNgXOZ0vZR6xKAVX6qtCVf0EwKheTdqwcxhB5REGs1ZBUJfGP63T81VsRjJwkMD6h8Bh/Jc5YpgMqKQDnMkc8BwHberBbELME6/eMaf7Bu48TZGvAD7olkfSXCTa9cW1gUqznsHVkFFZn/qnnl/iNWsjMG7DgiOf1z8t5t4EbPghbk1mf2/tiqWP1s7BxZzMkubnB3wBp8HGQO9CktDhPRR4rJhOqvO5X4I/EA6u/2pmXy19xBIeQC2jCrkCWk66tHk0NXH2CLmRxI3SAH414xZkpd9J9DHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E+UpX4r3vviaB3X1TVywyJQBaTutGYVM78L9WRt0UZI=;
 b=egK/2mQlm80JMhk21Ib9eLLbYpR2gKb7SVuyIcqLZM0TNcEPV266ekaboCnIC7OwPJNltLZVBv1Q9czYvZREK4phvpX1GSBYqubvoc3taZGmDpbJAeqJ3rIkM0+RRN3ny5K/PBh9UvF87uXCT6Us6gdTUxcfgGgZSaZeaB/GeX1p47ZO2Qhb7OyfeOUdSiF8hsuRKe8vyJYetQXJeQl+JtTgEuF7BDy4hnnZF7Khe3ZtNSlhJGe0YjDljjqcmQz/CO7X/S/bqq8WluH74kYqHlwPvLO3yY9tNhdeIUQAjKdBWCLOXmpZSYsOW7OdT4MGl3DBMkfjMtIdRO8eOR5SUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+UpX4r3vviaB3X1TVywyJQBaTutGYVM78L9WRt0UZI=;
 b=cZ/DRBCx6Hc/w35xpW3MutteB3jiKEBH3e6GAt18G3BUlIdDQC06xSCIuC+xAC+fMpj5JVIubAWo0Fh+5ofqShMN55foXtqg6ouUEtkiQ6X0EF0qtqu/eQbOeFNhmJ3nGB51854/oWJwecX5C4mcULrq1BkVivN308HuQeB3ZAlbADCs/DGr6eide1xwnNyVkwUvgmoBrpi5HUHNnvM6lVNzwCwADfsh/Gqzv2p2yRM+MOvsJPp6wftyu8V96DIW0KQn67FdDlMv9kVI/iEfv14gss1DvdFINKlzq2hR7j8sCJ0J1jt6X8jROtEVqk8fHploIr0k6q4Ra3ZXczeIWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <81276568-232d-b068-0237-f888ecb1ca91@suse.com>
Date: Thu, 4 Aug 2022 15:13:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] xen/hypfs: check the return value of snprintf to avoid
 leaking stack accidently
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20220804124736.1827246-1-burzalodowa@gmail.com>
 <be627b72-9f68-2deb-5639-2e7731f3e8a6@suse.com>
 <d7e0a598-d642-6227-09e3-51d3994ae359@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d7e0a598-d642-6227-09e3-51d3994ae359@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0030.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::43) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf77d8e2-2c37-4b28-2bca-08da761b195e
X-MS-TrafficTypeDiagnostic: AM0PR04MB4483:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IVaHs29tvt0RCFULhRSLbDvjX1UrSb4xAVX27Iki3nsKpBCxGCSzunTSwmx3g+/VdSuzHwybGC4eIm/rDaRmFbudpoA5QQPEabv/EjuU1csNiK1FQRhdMAo/Je5Jot0YYZLRsY6TZr2UKTAQKbM9+HL+0WwNzpvCharSdvrphj+jjYxF5rCfYAMiT0xNbEkXDZJ4RgDNuxYPeG0uSwkD8S79U3hhpdxJdytvQZcwvHDp1PS/NUdSqSnH1t/7o52Bd5iFv3m5UeHHRikuFuumIDaiWtQHtY1a1zhuI2EwwfgWbJLHSipckvjvpcwIzXY4NARuoqdBFjR68TMmuRzsbf8CkJTN/rJmOBP9LpTCP3phhgQz7y7i+/pDdPYbX0CiEpEa3s+P2xBeU4Qd11AG2xzW24qS7UekHNFoyfTSm6GBIsgFAogklK6raRRh6GJugpFkxHiqElK9po7TWGK1bx4/LBQAa0rwqM0vogfnHlu7F/ltN/7IYh5C67kqKVRa32EmabMJma6z9RArdyqJeodIVPTkPLPSXCsYflXl67Vpw9XhQtdhKpw3wl5zRLgCDPXrO51GV+qXFhh+Pi4eF1yoa+6mv3QcyskL5y1aUnFmAeG4MfQolYucp+BpEXSST2KnNUus56CNWWfAp5lhbTNP0GvNpqmOvaZXWZylc0lJZiLQZCdKxwo6ytnuUOLPq1U72dMYYpQi+Qh0Ez217tYGg+gQvYYaH39TqUoVhwo8FL5b8HBJoRyUxVLwQ0312+xWmMALQ5F+mKJ9ldCymZYzi8tFxZGOVspFB4fsueAviHpRBsNLc/Qk6AvlmClKQGs7iH6desxyyPBWByi38g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(376002)(39860400002)(366004)(396003)(478600001)(53546011)(86362001)(6512007)(26005)(6506007)(6486002)(2906002)(5660300002)(41300700001)(4744005)(8936002)(6666004)(31696002)(186003)(38100700002)(36756003)(31686004)(8676002)(66946007)(66556008)(66476007)(6916009)(2616005)(316002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zkk5TWgrM1o1VmtNbjZvWVk0MjNNSUZ2M3FFU3A2N0hYTXQ0c0dDMEt1Q1hT?=
 =?utf-8?B?RU4vUTA0UkZYVUxpWXpTUDNaYXlJK1dDSDVzM1Q3eWIyTUZyb3ZxR2Ntc1l6?=
 =?utf-8?B?TGJUbVZSUkFES3FTWkVoMEVjSTFHN1l4djRkaWFLemF3ZGVUWWUvSFhJaElN?=
 =?utf-8?B?UDRMR3ZKTGFNRHhtTTMwNGhuMUdndTJab0xBTWlwRWdFN2RyYXdlbXNtbU5M?=
 =?utf-8?B?enQ1Y2cyVkNnb2R5bEVweTNqS3NPYmtOQkhSRGFGeHhZanV0OExiQS81UWlh?=
 =?utf-8?B?dGtUM2hvdUJkSE9nblpwQk9HaEhYRUFZZU9WWVBrR2NiaEJrTTZGQitFTGZr?=
 =?utf-8?B?aG9meU9nNEQ1VVpkNWQ0MEd6ZTdia0RwRm5md25NdjhWaERZMkhQTTd5Z2pF?=
 =?utf-8?B?TUZQMHY5WUFQUEI5eVhrZTlhcmwwZU9GNG42TjhFTnBIdlBROEVnTzYzRUFG?=
 =?utf-8?B?ZkI5dFB4eTk2TkgyWHZwM2swbU9OOFdRa2MxVXdBdmNBdnU5NEtZT1J3SFNm?=
 =?utf-8?B?TnF3U2dyZEdMT3dZKys5Tk5hbE9pakRBYmpOYzhOOUJHL2lXR29EVHkyWXRk?=
 =?utf-8?B?ZjEyQi9Nb05NNXN5NnNvdzNmSWdlZ0Roa0hzRGRqd3pzRjlmMVRCelVuSEI0?=
 =?utf-8?B?UXNXTHp1U1Q1TGRpWU5lV0JYSW5rc05TUlIxczEvazQzRjYzSWt3Q3FPVjVX?=
 =?utf-8?B?ME84TnY3a0tpNUdnb3BhQlFTeVZqeVhUc0RTVGxjQ3VyOHdtc0ovekVSN0Rw?=
 =?utf-8?B?V0ZkS0xoNjd4R3BFY1o0Q3dTaFBVc1UzMERjcmhoZXE2T0Q0VEN1R3p0YkFL?=
 =?utf-8?B?Q3FPU2VpVWNmWU5URmpCOUdYeXZNUUZxSlNWODlLVWV2MlVLWCt4UVU2SGc1?=
 =?utf-8?B?M0VlQktiL29WbU9SeWVZcStaYnFralpGcWlaZVJydWRuYnEyUGhpT2JqeUtP?=
 =?utf-8?B?THFXUkJ0Zlc0MnhmcHdDTTdERnFjSml4bEhibHIwb2NhV0QxN1QrcjJ1akoz?=
 =?utf-8?B?elVXanNPUS9NZTJuSHpVb1MyVHZaK1JHL0REdE5sS0hiNW9jUTVzeit6VTZt?=
 =?utf-8?B?Vjd3b1RSYWh6cXpieHZTWVF2QlIxeW04M1c1Z2VJTlk5TVhGY2JUZVlHRjFK?=
 =?utf-8?B?ZDJsRHMrS0hpeEpzL1hJOUQyNU9lbUNJZlpCNUdnN1VURmNmREo4eWZtUzB5?=
 =?utf-8?B?c1dYWml3aGJPNDZ4bDN0S1pxVkdCSjRHQlpieE9jSE1lbEszMjI4OEVjaDBK?=
 =?utf-8?B?ZVNaLzBRdllLaVhwSEJ4Q28rVVpYSXI4U1Vkb0ZrUEVmaG5ZZmRlUHU1NzZm?=
 =?utf-8?B?eDBNM01HYWZGMmRaNHRLcUJza0JPZFBGWTd6ZXZsdlZQWFJQbkxreE54bWNh?=
 =?utf-8?B?cjE2VFRZZjJ5R21oYkRVVW85anhod0RuV0VPSS80NkloNzdSVG9JMWU0SG9l?=
 =?utf-8?B?K0taVk1xZ0t2NFdWL1M0cWhvVHlRU0p3MTd4L1B3Tmk0eVVNall1ZDFtQVVz?=
 =?utf-8?B?RTdLUk1EK3ZPT2UwOUloZXdDWmJQaVZZbzhTMHUwZDMwNXRrbVByckFvWC90?=
 =?utf-8?B?N00yR0dYVWM2eGQybVJ3WiswZjNyYmg3M2hwTmZwajgvVndCOTJlbE9jN1pK?=
 =?utf-8?B?YnF5REVtV1dhcTZyVERoZ3pzeWFzME83ZXFQWm5sZ1pESkxyM2Y2QnJXbGdi?=
 =?utf-8?B?MWNBMFNTaVV5UzdnYjEwV0ZvdnBWdWpqcUVnazlCOEtZdGZISnNCNVZwYk1B?=
 =?utf-8?B?aldxTUdOZUR3RHV0b1lsbnd2UE4wMG9wdVNmT293bzRaMjA2SFBYWUVUdVUy?=
 =?utf-8?B?dnZlb3h1SjZZai8ydkJZRWJqaUVwMW90dkRBWnYvVEEzMkNTaXFSTmVER1hu?=
 =?utf-8?B?MnQ0UkNIT1I4cEVDditZWmpxallobUdndGR4NXpsQUlxLzlZZm95cXZ1T3Iz?=
 =?utf-8?B?TExmYiszKzl1dG5VMjdManpTZVExVjFPOENxOER4M0lubllsRVdZSm5JYVdo?=
 =?utf-8?B?N3JLZHhnZUVvVktrSGpSMEl1WkhIbmNuRHM4U0l2aVNIckloN2FFUWNiaFhk?=
 =?utf-8?B?V0JDWTVJOHUweTEvbTh1aU16NXBEQk1YQjBWcTM3cndYT1dvZzBGUU1hOTlv?=
 =?utf-8?Q?Hox+yJ1zkiOrODMMRw9CwRHqw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf77d8e2-2c37-4b28-2bca-08da761b195e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 13:13:19.0174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G0hz/UY5xaQEAr+K2XaERb4BTRVWY/lEPJ57Tg6i01JrN+qE/b2eu34he2hx6sDwozpVirB8fESF4P3m4zGa6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4483

On 04.08.2022 15:10, Xenia Ragiadakou wrote:
> On 8/4/22 16:01, Jan Beulich wrote:
>> On 04.08.2022 14:47, Xenia Ragiadakou wrote:
>>> Changes in v2:
>>> - add ASSERT_UNREACHABLE()
>>
>> Hmm, this ...
>>
>>> --- a/xen/common/hypfs.c
>>> +++ b/xen/common/hypfs.c
>>> @@ -377,8 +377,10 @@ int hypfs_read_dyndir_id_entry(const struct hypfs_entry_dir *template,
>>>       unsigned int e_namelen, e_len;
>>>   
>>>       e_namelen = snprintf(name, sizeof(name), template->e.name, id);
>>> -    if ( e_namelen >= sizeof(name) )
>>> +    if ( e_namelen >= sizeof(name) ) {
>>> +        ASSERT_UNREACHABLE();
>>>           return -ENOBUFS;
>>> +    }
>>
>> ... looks to be an incremental patch on top of v1, not v2 of that
>> patch?
> 
> So, here, IIUC, I have to create a patch series and add the assert in 
> the second (2/2) patch? What should be the version number of the series?

No, why? Simply fold this change into the earlier one, and call the
result v3.

Jan

