Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E337E648E
	for <lists+xen-devel@lfdr.de>; Thu,  9 Nov 2023 08:42:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629481.981752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0zg6-0007Hm-GP; Thu, 09 Nov 2023 07:42:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629481.981752; Thu, 09 Nov 2023 07:42:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0zg6-0007FQ-Cy; Thu, 09 Nov 2023 07:42:14 +0000
Received: by outflank-mailman (input) for mailman id 629481;
 Thu, 09 Nov 2023 07:42:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U8Ox=GW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r0zg5-0007FJ-Pt
 for xen-devel@lists.xenproject.org; Thu, 09 Nov 2023 07:42:13 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20628.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d7253a4-7ed3-11ee-9b0e-b553b5be7939;
 Thu, 09 Nov 2023 08:42:10 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8895.eurprd04.prod.outlook.com (2603:10a6:102:20e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.8; Thu, 9 Nov
 2023 07:42:08 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.6977.018; Thu, 9 Nov 2023
 07:42:08 +0000
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
X-Inumbo-ID: 7d7253a4-7ed3-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lZvq9LCWh2Nr4ydy1vPbQwtfWtBnUWAzK+Jr8OLJeuGKiohTnVxzfDDU4YtQ72Bzg2wyeJyz8bx9zn1PYO4dOUoM0HrX84zkt45H3ELxoXlDQjp/XSV+IjjVoQXE5voykaGUvj5mq6tswIldN2amrz/d2XfjLjaGBnvYXpkyo7i9z6FCJd3Z/Js6DpJQNglu+ROQNLSppMVSGXFLt/v2JScZ68hqOLlWXVgsW/VPy8C9HTFc41hYdcAxwcsHPcWt4cBQvVCbe7sXEX3MuCBzBrCr8nnqDdeJzuL34a8gpNK79wtVWvsEqxWrLqUZYrK21k0908Fgsqxf2sI1xSdMsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WXQ+0P3MIHcV+4IygX954kT4L9eaqeKtZb/ggkmz1WI=;
 b=LGLmNHqFSca/ZzMRt0jrl2xG4rrXn5DLwMntJWO8QmVApbGRo9uH/ojXmf4ke4WMnvvnPAa84/WNb2Wpwd6H8OcVeRi9S87IpYIlplbbWdaICEN/EVQHnCDkg8t/97PGGz9WupThHnn0YpYLKiyrKaP1yWJcvNm1psW3BODvZ8TqjyugkTUizs/6+toUkwiHB2n3CXsYR4KPUrpXwFXB/xITlf1dUTm0IajPc/rxiRZaxl990wm64gTe6DF51cOtZ1RT6OhxH1SturHOxRCpqxh2e1FJ0nd7ALvPC5vOnKJEuGVv4C1qR0ZttBbiu+cJ9qvm25jqPyYcACYBup11Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXQ+0P3MIHcV+4IygX954kT4L9eaqeKtZb/ggkmz1WI=;
 b=rUu28XnXbzXTEmjKj81JsXhd3sZnViaLS2ExvoRBlJM//d7vlkoKpYT6tO6NGMs7SnB3oC5y/qX6xToOPYm2g10oBqbAaKig2bvLl8bgo46DvrPV2VtS4Ah2a64g2FmfEoDHlsRfalMowUaHpl/DFIcFTvPsqdrTW9wdBdFPSHidQ4Hxu2Guhlya/A6gvWIppytAc2/gOg8a3vlmuDVWwThGGcVioswg1IgSnRymQQZbZo2Qz5ykG9yCDUbBNmd0w2IclujWPW/0VJa5ig/jXOm0SKasycbRGs6yRfvXOC1EpLGl+OVL9PQrIpIjgJXagEh0DOf1ioO/Xt5NbMQ8+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4b4583f5-4cdb-6be9-20eb-22466b6aef28@suse.com>
Date: Thu, 9 Nov 2023 08:42:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-4.19] domain: add ASSERT to help static analysis
 tools
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <3f163bb58993410183229e72eb1f227057f9b1c7.1699034273.git.nicola.vetrini@bugseng.com>
 <d67ec7e2-a606-ed62-150f-08e3c1c9aabe@suse.com>
 <44df74cb532bfb9642b1c8752ee8c0d6@bugseng.com>
 <2c8c246d-caea-5c8b-4a2a-83248422c48d@suse.com>
 <b407f981-c58c-4272-bc7c-1470a87e2487@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b407f981-c58c-4272-bc7c-1470a87e2487@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8895:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f778a02-5637-4d65-1e88-08dbe0f76044
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XDEvGEnLCUF3kDlNdQKXGle3W35uhYwAetvq2yWQTRS0/DDfnk4iYA3yAe38jVJfy8qYIHhm8NhRidpLogGafqCTy0jce22csoEUhWhw9jMloXxoSxW9w+nQYEpqC6xbVl3uTHYI7IaZ+Tb1PY5kTvx+GoRq+s6snGGqOW/uB/r0gkrh5dlC+fZ1Bb+unwCz/fXXtBp0eqmLqtRFLySE3iCUOeKJvxJ+rAUXdgb6tGBjFHPjU6EaPk42UG/qI4wMCr6uOInCVYvvGmXv778fXbEtRJ3qjrXaUQlGGCDBEaEwUx3qh+QHwLGqpLCJa5AkBOsPsC0wGVZVki5OezagjrqEh7hGx4qv9JCxknLx7g8VnZ2RLXAUbgrolbULj65hWNsh3rFHares8orZ6q/ChBf21LvdJ5MQxx3dStR5PdG6xxU6EuLCrTUTbeel3gqJV01JFi/9afgkYwjGaDhdZz+Tx73Ux1Ma9uslso1TsUoZ8EITUawjB0Z4Aru+HJl3PRUpsemnKUB9M9GXd6r2QfOjbCUHE2ENfGzwWxV4sccjgmoCjRWPSIvhV5VsFBm5On4PbmAMSLo8FgiBtKUvT9wx4W6Jj7Y/NZTCGeXQ+j+JXwusUAnHHgDHioBDOik6c5cjLookJgApEUbndqktFw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(39860400002)(376002)(346002)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(41300700001)(5660300002)(7416002)(38100700002)(2906002)(86362001)(31696002)(36756003)(4326008)(53546011)(8936002)(8676002)(83380400001)(478600001)(6512007)(2616005)(26005)(6486002)(316002)(6916009)(54906003)(66476007)(66946007)(31686004)(66556008)(6666004)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bW1Nd2dNWXNCSEFEVDRyLzcrdjBoaDVXdXlVbXRxcFVZcGppZkQvNUJNbTNN?=
 =?utf-8?B?Rno5OGM1MGM0UXhyb251QjZtaFdXbG40TEx2aEI1R2lpQkxxcEFVWCtWMTZJ?=
 =?utf-8?B?azZpUmVIaC91SFYwWVozMjFuaFFMTFRwUzNWYzRCbDlYZEV2QWFldjF1NXZZ?=
 =?utf-8?B?SGY5aHpXRlZydWkrcVdhT0J5ZjMvVGhqRkxDR2g5ek96TDJlYUcvSmMvM3lS?=
 =?utf-8?B?VURyN0FaYVRGMk9lTk5RRWJRUmIveGlCUk1rMXFHb0Q3a2hQa1czRGVicmlH?=
 =?utf-8?B?RTFnZUhpcFRyc3dtbmZaL1lBRW1CakJtS2dicHljR29HN2t2WVFrMFV4aFRa?=
 =?utf-8?B?cWhZN2VOWUExc0l2a2k2ZUpjYS9rU0FYSzh6RFYxOXV4ZWJlb25KZHNXUjlz?=
 =?utf-8?B?ZEJyNjBiQjBjQTVtZnRwQlJhdS9pWDdSSyt2MGVvM0hRR1dmYUdkRjZrYVpy?=
 =?utf-8?B?ckR4bk1IeVZzWmhxaUFYSE90VnUrVzRkKzB4ZU1IMkExL2FrdzJsQTMzRlZq?=
 =?utf-8?B?SGtuanY4SXJDenlhd3R1UUxwK1FjSDlVSFZtRkc4aS8vbEV5VkFVdTNPQy9V?=
 =?utf-8?B?eDRCNUdpaUZTRm4rbUQrY2FsNEZiNW9KVnFleG9EdTB2L3h4N0hLRE5uSjZH?=
 =?utf-8?B?OWszRlMrbHROVDlzMnJOemJnSVZvY0h5cUkvbXZSNTBhQVYzRFVzcXlwTG9s?=
 =?utf-8?B?UzRHMHk2WmpJRVdGNUNBeE9rd3d0VWVpeUdKR2VPUTRpVTB3Mys5M0RRNmNq?=
 =?utf-8?B?ZVdYQ29OK2JMdFJsdVdVcFNUOHBBZEtLcGNabUUyYUczTGI2Mm9GZ05KWFZN?=
 =?utf-8?B?czRDRTJVbVNONU9DdDB1MHhHcFhTaDYzR3dBR2FvOHFJL1ArWCtpcjNRdUtC?=
 =?utf-8?B?TUVxblo2cG9WV2JyUnlnQ0pJbGs1ZlRFVjFzeTBxc25kVFowRGwxWEVzSlRY?=
 =?utf-8?B?d2FEaWY2Wk1LMHI5TWtTS1cxRFBqQU42ekEyajJUSy9CcURKTmZwMkZOZ2l0?=
 =?utf-8?B?Q3pyRVdZN2VGcWNVdFZnN2x0YmIxWlRSU0paclZEdnphK2xqWlh4Vkk3a0ho?=
 =?utf-8?B?VzF2cW4vRjl0VkRaS2xZNXN6VzR2dnptL0t4aU9JemxsbUZhV2l1d1FMNnhM?=
 =?utf-8?B?YVJLR0tkTFlEV3U0Y1VqVU1OUGRvYWI1dGxoLzcwbGh1V2ZLYnpYU3NyNnNY?=
 =?utf-8?B?UUc1ZHBCNWNhZkJyZWFKU2FyRHdTeHNXWmFvQTczSVI4ZHBKalViMlk2MXNR?=
 =?utf-8?B?Z1pzdWF4enBad1R1eWNLaGFkK01kNEhmemY1ZDRyOW15a1R6QnlQSldibHFQ?=
 =?utf-8?B?YW83MjZYa2VtSVgxL21OaTlYN3ZWemwxaDFZVktnTFRRNzlVcXpnVmNlTzdS?=
 =?utf-8?B?b3JQc3VFKzByRDBFTGhEc2xCNUZKSGpxN2pXQmpSaXg5SjhKazNZT1Z1N0tU?=
 =?utf-8?B?TmtSdkRDZGhmNGptVkwyekU1Um5yQ0hiOEhVdHdaREI5UUxuZFRmRVVIL1VJ?=
 =?utf-8?B?ZkFFVUpzcVJUdGVSSEwxSGgrazlTbFJsZWQvU3R6MUtLVHhleUJjeG1heDc0?=
 =?utf-8?B?TWZqYUNudXorUW11a0FrUnpwRytzVnFNTTg1WFgzZjFlUlN2WUtvc01BeXJX?=
 =?utf-8?B?eE9UckZ6cXdadThkS1Y0dWdlLzZGRlJKZktub1M1T3Q4bFI3T0tCb2U0Z1VT?=
 =?utf-8?B?WThXeTlXRlNQU0hNR2V0Y2MydVlpZnE1TVRZYkZZblNXcmlIcWFnZ0hQL1I5?=
 =?utf-8?B?NlR3Ky9scDBrSDlySkFlWEd2UlA2TkE1MUdkS0lPQzVrODJwZWttVHNGRFV4?=
 =?utf-8?B?V1h6REhEakZhS0Q3OVZnSzVQNzNyaXJncmJxb2lxY2pTQy9aTER3dmhFSmVk?=
 =?utf-8?B?bERkL0dEdVdJd2szbEJFTG1kVmZadThVR0JxZ1NILzE0cUZuY0xwNWkwYmth?=
 =?utf-8?B?SVUzNXFpeFBhQjh1L2FtdUxXeGVueUQxckVHOFVZSEQrR043ZVBkWUpJMlRw?=
 =?utf-8?B?cTd0MzNUOHRxdDB0TFBkZzBIdGNLa1NaTThYdUU4cTlhcDBuZHRsN2VTb1Zy?=
 =?utf-8?B?Rm8xNmhrTDlsSjdzVnNiUHcwT0JKTTBMcmRKNlNONitQNEt2WjRBUTNEdktV?=
 =?utf-8?Q?NRHs8NZ5VixTJTeLwdsvp5/sQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f778a02-5637-4d65-1e88-08dbe0f76044
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 07:42:08.0831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VEg6+iF2U9RZD5aPCgLFcHjSQMIucT0JUufHVep6gcAnqfVKjZv2eV+WkC1+3ifpVS7fH1NI7g/TikPzEUEfHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8895

On 08.11.2023 14:33, Julien Grall wrote:
> Hi Jan,
> 
> On 08/11/2023 11:19, Jan Beulich wrote:
>> On 08.11.2023 12:03, Nicola Vetrini wrote:
>>> On 2023-11-08 09:24, Jan Beulich wrote:
>>>> On 03.11.2023 18:58, Nicola Vetrini wrote:
>>>>> Static analysis tools may detect a possible null
>>>>> pointer dereference at line 760 (the memcpy call)
>>>>> of xen/common/domain.c. This ASSERT helps them in
>>>>> detecting that such a condition is not possible
>>>>> and also provides a basic sanity check.
>>>>
>>>> I disagree with this being a possible justification for adding such a
>>>> redundant assertion. More detail is needed on what is actually
>>>> (suspected to be) confusing the tool. Plus it also needs explaining
>>>> why (a) adding such an assertion helps and (b) how that's going to
>>>> cover release builds.
>>>>
>>>
>>> How about:
>>> "Static analysis tools may detect a possible null pointer dereference
>>> at line 760 (config->handle) due to config possibly being NULL.
>>>
>>> However, given that all system domains, including IDLE, have a NULL
>>> config and in the code path leading to the assertion only real domains
>>> (which have a non-NULL config) can be present."
>>>
>>> On point b): this finding is a false positive, therefore even if the
>>> ASSERT is
>>> expanded to effectively a no-op, there is no inherent problem with Xen's
>>> code.
>>> The context in which the patch was suggested [1] hinted at avoiding
>>> inserting in
>>> the codebase false positive comments.
>>
>> Which I largely agree with. What I don't agree with is adding an
>> assertion which is only papering over the issue, and only in debug
>> builds.
> 
> I expect that the number of issues will increase a lot as soon as we 
> start to analyze production builds.
> 
> I don't think it will be a solution to either replace all the ASSERT() 
> with runtime check in all configuration or even...
> 
>> So perhaps instead we need a different way of tracking
>> false positives (which need to be tied to specific checker versions
>> anyway).
> 
> ... documenting false positive.
> 
> IMHO, the only viable option would be to have a configuration to keep 
> ASSERT in production build for scanning tools.

But wouldn't that then likely mean scanning to be done on builds not also
used in production? Would doing so even be permitted when certification
is a requirement? Or do you expect such production builds to be used with
the assertions left in place (increasing the risk of a crash; recall that
assertions themselves may also be wrong, and hence one triggering in rare
cases may not really be a reason to bring down the system)?

Jan

