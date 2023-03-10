Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3106B6B4578
	for <lists+xen-devel@lfdr.de>; Fri, 10 Mar 2023 15:34:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508506.783209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1padnh-0005YJ-2K; Fri, 10 Mar 2023 14:32:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508506.783209; Fri, 10 Mar 2023 14:32:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1padng-0005WT-VI; Fri, 10 Mar 2023 14:32:52 +0000
Received: by outflank-mailman (input) for mailman id 508506;
 Fri, 10 Mar 2023 14:32:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=txLX=7C=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1padne-0005WN-UW
 for xen-devel@lists.xenproject.org; Fri, 10 Mar 2023 14:32:51 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20623.outbound.protection.outlook.com
 [2a01:111:f400:fe13::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d684663-bf50-11ed-956e-85ef70e17bfa;
 Fri, 10 Mar 2023 15:32:47 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DUZPR04MB9898.eurprd04.prod.outlook.com (2603:10a6:10:4d2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 14:32:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 14:32:45 +0000
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
X-Inumbo-ID: 6d684663-bf50-11ed-956e-85ef70e17bfa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AkHjx+WX7Y0QwPec8wyNVdUC20L4rYCZ6KY1Zb2fdtW2WFnwFffyikHTOzGZFwXJM1YctPsoVsqw/PaBjGzuSnOOnZFswii+tVOu8/1su4j2/AExMh7GtH5JYE1Q0fbIbgPElWtl7t4+b1GoZcXrQ6KWSsiJ43WfhjAUzqrvyPQth1hwgKS31yyzKBoXsqqDT7GM6pJBV7VU610ynK7RM7VnntvQAsB+il2bWUEZDb43M3/Hmn4VxLnRK/kcSoxUQVR7n+I2G/MehVXi6Uua+1UFHWheoKDLuYRjLK7IJXRrGvD7E2zMbYi6t+Jkvftyfa4O8yZhqESu5EkF3uqUww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lEy9u2qwxi3E/Tz+DV+Tf1MaPdOjXBFDw3HxTsKlYVk=;
 b=mb9EmrdfjcH1mZ32xBQS9qzWwLJ0gO3aegaCAy9r+6FLkWr7OEFELcBFtFqAl2jFTVcgXeWXJ/Tg34i2aCaF/rMvxqB3oKWHejbBwUbZfjHwpfe5kUjyAY8jR0zXScnqcfmWEhx9x/0UVt0vkL19eJAhvC/kMjqP70PWyOm7PP4vnbQpMEr7/0KzL4x/H840Wn77fT1TbBMo/6wesMVBQ1Ncl9pRXSv9hB4oOEsOq17w/R4oAS1fTG5fT9wPhAvc/N+myFx0t6QqMswejPvisORl9Lm/D0vuvBYFhiVelNuDmsLup02aSDRsRKpOtlgUDfqA7KJBCMWuiZ06ejJvNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lEy9u2qwxi3E/Tz+DV+Tf1MaPdOjXBFDw3HxTsKlYVk=;
 b=VzCBT2F8PwiqcpI0Ipbz3eTi7lNY1V5GA2nzPYNURaui+yHHDGVgrJ3dwkQadv4YNIs91Z7wwbQAAlx9TPQDkS6CfmiwbQUQsd+0bdAnFfW7IF5Uea/gEDOZXdwfUTcSsRBjhjbmq2HiRZ1wMfIBLsq8zoKAf7lGOR8pI9kmevKO1rCRces8kV59Hi2WB7/Rp8HRd56oYi5cll57oPT+D1am7WKBgYjY+1diZtA+VHKjUNibHp5el0yNgY3rEECX3sBgbIJUpqDV3IQzGEGwirSoIQ/SAXeYeVldouL3aCWy4co3PowNYSU9hm/YhQkP7AAMngVQLPfHWMgFbAuiRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <29c3e26e-e6b2-1b2f-b442-d468d8abb505@suse.com>
Date: Fri, 10 Mar 2023 15:32:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] tests/vpci: install test
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: andrew.cooper3@citrix.com, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230309165812.33918-1-roger.pau@citrix.com>
 <f2c7a5db-80d3-a89b-dff5-250eb18bec14@suse.com>
 <ZAsyxw6VvQHYrksG@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZAsyxw6VvQHYrksG@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0085.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DUZPR04MB9898:EE_
X-MS-Office365-Filtering-Correlation-Id: c4c7ca25-616c-44a8-451e-08db21745015
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P5qOT++vR089KWHVpqnWs0bwpcbv8fpKGEaV0UdNUQ8Ilqc/8rWr0YGadnIo1JEBX3vaZHQ/Q62kunm5uVFiCe+pMUyKXMOiA/oqXxz3TYpmODyVIRH3hbl853ShGKMFWrPNeiF5x//fyYYbuFPyxDSfKXOvFE5m+gfUuF2zEemXpasQN7gNhoVS5xPwhYnPt6BHbeFrJFB26hzG2lk7w/gvsCZJVr6rOCG+HpraVtD1IZLqNyV8xKQOwnv+UrxHzJZk+YlJ7u36cpXmUCm2+v3UspbmOfeQBEzqoq2xa++it7n0NEVff9bOkTP8laRz+UBuVBLzSw/Mz5QTeoPoH4XmPuMQgCOCFdYX/h3pQR0LSSTKT1bCi9AxqwYNZgb0EIR9hmLvksvpkrTtmY/KpmsLwxOvCKS5LaasTdlFwMRh+cY7PYZB/ERNEfTjLMh+aDB58MpvXMWFBY5ayOHAS3BsO03NJB+TABDJiLgMwY2uO0fJicm0rTWJcEJwiQX4N63jYOx06tIFURxhtBIpkCi+CM3usaJHjSXTiHavRowiV5foy4nIugLlxg48Q2pU86HicJTDiNKU82FzCDsOkECVmasHTDfOhEIT/ineXuPdHvvhOTRKweSF9dBDFrr/8b7ImdwflHLEs6PpnsXXo6jktQhAscmqk4ncR4brf49BcpBJbYT9V9/ahCKMi2kGr3AKf0wBpuWzc+PsmJV1TwGVuC6raAyO8i8tWIA6IBo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(396003)(346002)(39860400002)(366004)(136003)(451199018)(31686004)(66899018)(6666004)(36756003)(478600001)(54906003)(316002)(38100700002)(6486002)(6512007)(6506007)(186003)(26005)(53546011)(8936002)(2616005)(8676002)(31696002)(2906002)(5660300002)(66476007)(66556008)(66946007)(41300700001)(86362001)(4326008)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFBGUXdkZkswdXBkSitUOURmN1d2VmVJMGdyK1JBY0t0TE0wMTBONzN0TWsw?=
 =?utf-8?B?OUYzNnVURlJvKzFNVXBrb0ltQ1NBbnRodXlSZFAyMkNjek1JREZDbWNmZjRE?=
 =?utf-8?B?d1NVSmxIcFJuSi9UTGlSTzJ6aFFOV043RUJFWFB1cU9nQWNQK0J5U0RjazJU?=
 =?utf-8?B?OFhDeEJvUXhTR3hWRTEzRkliUjZsUHJTUGdWWG96d043RHJ1Y1Q5MTgyTkxx?=
 =?utf-8?B?RDRmdStwYllPSzRBSkVkSjdLelk0eEZXUW9kVG9MQ3M3MXQwM2lTeE9uYXQz?=
 =?utf-8?B?ZjZ1WmwzcWlsMkRGM2IyRXJqbXp6YndZeCt1dkh5MjBjWHNQN0NDdWxyeFdz?=
 =?utf-8?B?N1lJM09aVmJJMkZ1RC9Fc081ODdvbWhHRXpyeXhGTXU0T2F3TkY3a0w3bFV1?=
 =?utf-8?B?c3ZncEdaVUMvdnZYT2RXQ01kUnBramZCMWVrcUtYQmtmd01VNEl6ekRlaWRU?=
 =?utf-8?B?SVpFZ2l1bng4U0FuYjlSVVJ2WVlLVW5hc0dycDJLQXZVblgxR1ovaGlzNzR6?=
 =?utf-8?B?ZzZuWS85emY2dXlLVW1XQzhVdlA0bnVnUVJOcUxJY21TZFhtdStrUStwSG1Z?=
 =?utf-8?B?a25zWTNDVjRIcTV6cWZuTE1rdkw4TEZ4Z0Evd21UVEZMUXBub3NyZEZRUjdl?=
 =?utf-8?B?eTZlRjZISGhDYmtZSXBFSmVObk54SXk5QjV5b1R1Z0xRckJVU0VNbDRFV0JH?=
 =?utf-8?B?Q1BWQ0RNYlgvY2FBWndkSUdpdmtNdDAvKytvSkxYQndzREpZVVFIbUl3QVR5?=
 =?utf-8?B?UDhLcFZLaERmZTlselhlK0VobC8vUjdGL1ArdU5rempMbmJQT1IzdDUzSHVB?=
 =?utf-8?B?VERrQWdRL2RmaDg1TTVqQlVlN0N0SE01NmExcWJQdkVVMEdaNWtYNnE0ckJV?=
 =?utf-8?B?aDBiOGlwcVFrSnlHclk5Qy96OE5YbGtDSzRNdk1TN2NXR0M0RHBrK1ozZk5C?=
 =?utf-8?B?V3F0bm44OURCckhBRlZrZThKa2tFdktBTlNzSTRUbVdNWmJKTDg3UUtUNzVN?=
 =?utf-8?B?Y1BKaUtJOHN6QzZTU20ydnRqWXhNKzNkVXpQaG5jZXpndnVYUjRGcHR6dlVK?=
 =?utf-8?B?KzBVNXVpcFQ5K2d1R0xxWmtyMEdld3JnUlkrNTVlcnArYzNKeHpzL2tHWlcx?=
 =?utf-8?B?WFA4WmU0elhoaTdMalFGRVpLK0JOUjFSbHpqM2N6TVJKSDBhQlBFemc2MGVM?=
 =?utf-8?B?cUxrbmx4bkVURG1FMVhCejRYU0dKTnF5Y1lXU0k0TXFQbndjRUQ5Wjc5aDE5?=
 =?utf-8?B?anQvRytPRmthbDVuRlNnSlUyKzRxbVBpejRsNzVkUHo3QzNIOWJiUEx0eHgx?=
 =?utf-8?B?cktmdmtiTGF0d2Q1cmRqQVJzNElJQ1BiWWJIRmJpYUFtWTBQVlE0dWk0bEd1?=
 =?utf-8?B?c0R5VElTSFFyVFhLWGQzVWhyY2l1dS95WTNzZHZjS3c4VHYwSDFzdHZDZHVo?=
 =?utf-8?B?bk5udkt4ckYvaHhFWkRidDRkNnhUS2JORGhFcjNwbXgxaDVlT2pYNGI0enlC?=
 =?utf-8?B?bFgwd1pmWTdhZEM0WFA4blJkek05V2dWd3dlb2EzWndVYWR5SmxzT2lmS204?=
 =?utf-8?B?VlI5YlVFWEptYm40eGpRNy9ZWXRvOTRwS0pjVjJERzhoV3RJQTRORG5tbUU0?=
 =?utf-8?B?d3lrcXFDMnpGdityTGZSQmtBb080bHYxSmVLaEdmaW1XNmt0akR1dkRnWnk2?=
 =?utf-8?B?SkJuMS9HTUdYTmlZdlk0Y09hUkpWZHl5c0NKNjVPSXhrRTI5MWwyOUM4UnlH?=
 =?utf-8?B?dGhRWitFREY4UVhIbnI4czBreHIwaHh0S25tMDlYTEJqdStSN0EvTm0remVh?=
 =?utf-8?B?TXB2clhKTzIwS0hZRHh1bnkwOWQxQndQc010SEhQdjZVT1VBbWo2c0lpVjdK?=
 =?utf-8?B?MlFtRTVSQVVMVGozSlFDRkM5NmtFb2ovNEZ0eEZxdjlUMXBsOUNqL2t3TDBy?=
 =?utf-8?B?K3gwNzl3YUZmemduOWtSMTNNYVFqbEFKY01oVTMzbmxQQVRsRDJkcTAyeVQz?=
 =?utf-8?B?RzBCNVU4ZHhUOUJFejM1RittaVh2N1dVREFINER4WWxSNFl3Uy9jVGZOUTFD?=
 =?utf-8?B?UHdxZkpIenNLY1VSRld5N3EyUGo3YXV2cFpEUDlhT3l0Y3RYN09TcDEzSXhV?=
 =?utf-8?Q?A61HZjr05X3wGMNKOjSQCkQFM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4c7ca25-616c-44a8-451e-08db21745015
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 14:32:44.9363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2elOkq3L4tu0/cTK/bWgGIRZ34fcGXv+ZABgTIMqaKIWEPaeHIlzNHHwKWGdX5Rj4M+nZ/cegIlgevJCzX4jnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9898

On 10.03.2023 14:38, Roger Pau Monné wrote:
> On Fri, Mar 10, 2023 at 12:06:29PM +0100, Jan Beulich wrote:
>> On 09.03.2023 17:58, Roger Pau Monne wrote:
>>> Introduce an install target, like it's used by other tests.  This
>>> allows running the test on the installed systems, which is easier than
>>> running it during the build phase when dealing with automated testing.
>>> Strictly speaking the vpci test doesn't require to be run on a Xen
>>> host currently, but that allows easier integration with logic that
>>> runs the rest of the tests.
>>
>> I accept that as a possible way of looking at things, but personally I
>> remain unconvinced of this model. To me what is installed should be of
>> value to users. If there was a properly separated directory where all
>> (and only) tests were put, I might agree with installing. (Nevertheless
>> this isn't an objection, merely a remark.)
>>
>>> While there also adjust the makefile to use $(RM), and rename the
>>> resulting binary to use a dash instead of an underscore (again to
>>> match the rest of the tests).
>>>
>>> Since the resulting test binary is now part of the distribution CC
>>> must be used instead of HOSTCC.
>>
>> This breaks the run: goal, doesn't it? If the new mode is wanted, I
>> think the two kinds of binaries (and rules) need separating (maybe a
>> way can be found to avoid duplicating the rules, which would seem
>> desirable).
> 
> The run rule is not hooked up in any of the upper level makefile logic,

What about the run-tests-% goal in the top level Makefile?

> so I think it's usage (like in other tests that also use CC and have
> such rule) is left to callers that know that HOSTCC == CC.
> 
>>> --- a/tools/tests/vpci/Makefile
>>> +++ b/tools/tests/vpci/Makefile
>>> @@ -1,7 +1,7 @@
>>>  XEN_ROOT=$(CURDIR)/../../..
>>>  include $(XEN_ROOT)/tools/Rules.mk
>>>  
>>> -TARGET := test_vpci
>>> +TARGET := test-vpci
>>>  
>>>  .PHONY: all
>>>  all: $(TARGET)
>>> @@ -11,17 +11,23 @@ run: $(TARGET)
>>>  	./$(TARGET)
>>>  
>>>  $(TARGET): vpci.c vpci.h list.h main.c emul.h
>>> -	$(HOSTCC) -g -o $@ vpci.c main.c
>>> +	$(CC) -o $@ vpci.c main.c
>>
>> You're losing -g and you're also not covering for it by adding $(CFLAGS)
>> (there should have been use of $(HOSTCFLAGS) already before, I suppose).
> 
> Wasn't sure whether I should add CFLAGS and LDFLAGS here, I guess
> LDFLAGS is really not needed because the test is not linked against
> any library, but could be added just in case.

Perhaps. I find $(LDFLAGS) odd to use anyway - by its name it ought to be
passed to $(LD), not $(CC).

Jan

