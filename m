Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 254A9780C49
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 15:09:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586235.917465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWzEK-0002nw-MC; Fri, 18 Aug 2023 13:09:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586235.917465; Fri, 18 Aug 2023 13:09:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWzEK-0002lp-J2; Fri, 18 Aug 2023 13:09:32 +0000
Received: by outflank-mailman (input) for mailman id 586235;
 Fri, 18 Aug 2023 13:09:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dk2S=ED=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qWzEI-0002lj-Vm
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 13:09:31 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0611.outbound.protection.outlook.com
 [2a01:111:f400:fe02::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 763f2722-3dc8-11ee-9b0c-b553b5be7939;
 Fri, 18 Aug 2023 15:09:28 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS1PR04MB9429.eurprd04.prod.outlook.com (2603:10a6:20b:4db::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Fri, 18 Aug
 2023 13:09:23 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.029; Fri, 18 Aug 2023
 13:09:23 +0000
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
X-Inumbo-ID: 763f2722-3dc8-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m2Hhc977SkwGlBULu9YkkMG4b+d6CJKf0QdifU7YDmSEF6iA4k+xiPPZA7LAtGRvGAoQOs+A/5TRNo7jYgNpsbtFnf6QlMHpWLetKAi2zd+N7ChWD6DGc99qFGBHdubmOSSnr5todqzBSXNycE4yoxO1BW72EI0hMrj692ynkFkC9eGJ1CQO+1rIAvTh1uWHOK3Pa22g0cRNcIG1uaNmGo+lX7AOjKWyEOuHfDKxVP20/JQaLApW7jFW4tt6cSytY7gTaCByDb244Ex+SzkYaP6Y0R95p8drTff8AHzhoRDmfA6bYokokfbv4E7UqElGNygTMFQZjItxFkVxQ4qjGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9tubOERiUbNbRRu6CHyBe+nwrRGU8pOU1fNz4qv2rPE=;
 b=Ve/3S6SQ/N+0Yc/mLep7DuGizD+zuJJtzTcR55XMawZwLBXnyhytrTQtBGXkuBUl41G1Gwfnj4Sj0z0hEmptCYjWQIbYtZTuI+CDQweAQ9Da3kAKa+32/bxY4q2rcG18kEhyR2gvdmTb2traJsH3Iv+/R6f0n4rCW+hwM2TwFNnqnulNAB93kacx5koSTQ/9Ep96jnzBurPk4ZBWIQknJ8p3x/yAPjAcC4eoS7HOwKOTcihV7OPvqKrJcJdCz/Yto2Q2VPn59sH17WTFV3oBrF1OG/126Sqs6VRk7htmo9g/kNPrp3KkXYWZ8NPB29f+5mutaLBRrgQ9WqwJlkQQcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9tubOERiUbNbRRu6CHyBe+nwrRGU8pOU1fNz4qv2rPE=;
 b=dPKp/OOVuBF7HsjY4OY0wSUq+WyQPusChOYbysdYJiKlsSnvjYca+unU8ul302X7x6f5iq60bRvvM96oMyPXB+wEr1TrXOcR3dLXf1MoeVHlJAKttEEHYJWRp9x0QDCuqy2xHo/HdAaExk4TAeu4KuEy487mxg/nzOEmUqwSHyoSCnKl8crA/pCMqArX+2PydzlqJsqiGJsZWK720OHfVlgIlUh3+de9IWHalNBHrTvX3cSdtWDFV1JtmU9r2ZYhZZts+mwlzyUoCWlPdoKqZgrvQxzx+575D+aHZ6lm8yOjD4vE4PkKX7qn8vOdX2IzYuJm8K4qIOGvGzAwkrDd8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5efbf7df-a487-bcc4-0522-7cc79fb9c4f4@suse.com>
Date: Fri, 18 Aug 2023 15:09:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/2] rombios: Avoid using K&R function syntax
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230818125753.876699-1-andrew.cooper3@citrix.com>
 <20230818125753.876699-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230818125753.876699-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0032.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS1PR04MB9429:EE_
X-MS-Office365-Filtering-Correlation-Id: 5527cea0-37e0-4384-d7dc-08db9fec57c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8ZE/tVCJ4L7yU6ntA1PkvMrQJlc3HRDQEkeqYGzqRSScqN6bBaKmIk6zEgaXFNyLeCAlfjAQYrEwke9FKVL/0IedWFdIggkmTlxcN3rPlVM0/ohwUfsgV2CGvshsMLt+F0legE1pyOqAc9U5yg1vtVaO0Os0KXCy+6nSEV2PK2ZYOphJ4DsRxEJlfgnm7UUlXFHksy7nT8EjQy558KHeZ3/jNVlB7z/h4lSOQ1skxtXWnjHflfgMeT1dhbQa67BD7esM98tkVQoBHAklB3Z8AjQ70ext/rcNZTRjKwa5oAj8dCnCgihyHFilwp/O77Zzu7O3ki9YBnZU1llrJzvVuAlrX5kMqahkj6O1eVqS+nnL8EwCwHxv0MvIANENWMoAH/FSc06GQy1HvFI59YDqYy35iCS33GFqumv0q5NL4LXtmXqM58xPw3NNia6nG+1zff0y22OUkVsMvhoTL2WIYuOoteGJTmfyFcLLhivd9ardynMSPuGlFBpegvjuAYe4SsfjKdOC+JnChBOZ+msnUnwZPjvfLja5biZSRT5hxhMfPC1irEmYAINGmDH28Ln0l2GeiJ1Uao2o4E4Z+0WJ1b6GKHEP9zmuCRWwpzntLVdmOFx63UzfKE6w1xYUW0C247zB9doXk/PI+KK8dTwvOg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(136003)(366004)(396003)(39860400002)(451199024)(1800799009)(186009)(31686004)(558084003)(86362001)(31696002)(36756003)(38100700002)(2616005)(5660300002)(66556008)(478600001)(6506007)(66946007)(66476007)(53546011)(6486002)(54906003)(316002)(6916009)(26005)(6512007)(4326008)(8676002)(8936002)(41300700001)(83380400001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WlBnaHRVdm1weTk0OFd5WDFmNzVySkZONFlFcG52ZzF6TmtoUmgvV2gvampy?=
 =?utf-8?B?R3VRanNUSGZSd21iZUlXTkNaL3BwNDVXOWZYNmlpdDlzQ0M2NndteHR0YXRl?=
 =?utf-8?B?SXQvbUZuRVNidC90YkVJYmdJbEFEek4rc04za3pFR25ISEZJUkNpWWJITEJ2?=
 =?utf-8?B?aThTVURCRWJUUmJqVEIyUk53M0VVaU8vMVVzZnlKYUFoMlVkRk4xSEx5VVdx?=
 =?utf-8?B?V25SK0g5RXh0bHpBaTJPY0J2UlorYlhxMDdKaWlXaFJrL1BIc3lUcmJmNVZp?=
 =?utf-8?B?RHVKK0pQS2lIVlIvQlIvQk9FQXpvOWkzTEx5eDA0VXUwYTZUWFJ4aEhjZmxU?=
 =?utf-8?B?SG8yQktUZTBOQzdBYmdHNHpuSUVyc2Rqd2cyQzhEWXlQa3BJcnpMWFdRYTRD?=
 =?utf-8?B?c0dET3JZT2ZrM0JDdHpBQkZGWVZFSFBmWDMwOGxEZmw1RkdyeTI3TWJrZzBs?=
 =?utf-8?B?cForM00xSG8rL0FidUpHamhicTJoNk1WWjNJcHI5RS8yUnlZQWc3dEREVnJu?=
 =?utf-8?B?RC9nb0dKTjhTWXZFUCszMmZVaG5iNk1qSEZiMk11TkczZ2d1dGYyOE8rUThv?=
 =?utf-8?B?NUgvS0dFZ1orMEVDOStnMEtGdE1rVkUreU9wVWc0QzExRWRiNXdsc1pLNHdC?=
 =?utf-8?B?bjgyNGNtYzdzYWJVc0EvejhuanhJYlh2R09raUF1c2NnYnE2ZDJvZmx5MVNO?=
 =?utf-8?B?dXNwdEoxYm8xYjhmUytoTWZ6ZlY0RkhvR3Yxa29Hd0RiZmFaVm5vOS9PbHNw?=
 =?utf-8?B?NzMzZWFCQ0hoU2IvWjUwM05pS2RIMDdhZlBsVHlqZmpRODNiYzN3ZXgwaFNV?=
 =?utf-8?B?NzU1VzJZWU1JQ2tuNjhRTy80R0FHTjVQWFZ4dHBEZTZIN3NDNnFnYUxSbnFH?=
 =?utf-8?B?NnZLeEVETkhDSzlEczVmemM5RVpMWXpjOFRsNFQ3UmN2VEJoMUxOOTJSYXRm?=
 =?utf-8?B?TDBzamhJWUZhRElyZlFKQldzSlRYcXhxcytHNHN0bm9BeklwN1paSTJnWk5k?=
 =?utf-8?B?SWpETDdMN3dQVCtwZzlHdTNHK2lMMG1JNy9FeDFCRlg2SUVtSmRtbTBndE1u?=
 =?utf-8?B?MnFSTnhlWUdWZ1UrY0c3ZVB5KzNXZjFNMmxnN0JpbkhSK2pXYk5XM0FxQlZa?=
 =?utf-8?B?NXhKMUNqaE1RNDE0b1FGVDBmZys3RDVHYVBBVUtyMWlCVlRoY2U1MWZHbU5l?=
 =?utf-8?B?UGdBZzlWd0pGejhJYjNKd0I4R09VN1lLQ3d2UVN2TWkvOGJFMlpOYVhLSW9x?=
 =?utf-8?B?ZTJqN2VIYVZ5aWltcjlDcHRNc0Q3WCs3dDNuSzJseDdhMUpLUE5Jd25PSFFY?=
 =?utf-8?B?c0ZHS3U3dW5rd3V4NnpoUjNKemgyZE90YU1lbHY3dS9kL3phTUw5YmRQek1N?=
 =?utf-8?B?M1pKUisxdEZxeXdaUkoyQ2NjMmNQZi9SdDlIT3pLOFR5SmNRSmZ1MkhpaDd5?=
 =?utf-8?B?T29CRlhpNGdDZFVnRTF3elNRN1ZBU3AvdlZ4UFd0emJoUmJMZkd1eFJDRWJV?=
 =?utf-8?B?aFpFWlFJdDR5elg3dHlFV1ZVYTl4WEZ2ZEVwUXN1R2txMFZmV0ZYeEEvKzdh?=
 =?utf-8?B?bmViZlpSOE1naHdkRU1jN1dmaDN1REdOY1ltYTVjT21sL1l4QVBPUmNSbEUr?=
 =?utf-8?B?TnYvTVJNakwxRjBTQkhiUmNWQ3RUMzBHeFhRUVdaUDhzT05SZW0rZG9XejRH?=
 =?utf-8?B?dFVtWHZGSFBIN3hWSU80UVd4ZERxQWdkUHBkM2Fxa3RJclVaTGhSWEV3R2o5?=
 =?utf-8?B?QjU5ekFETWV2RFVyUFROQllBQzhFSktwQXhPMkhSY2dFbzhYVmtEV0o1RHJq?=
 =?utf-8?B?QW4wNXdCVlZQaGZCYytkb21ZdG5MSTl1K0JJK0pOR0VDb0JDb1lqMzllalVT?=
 =?utf-8?B?TGpIaWFLUTFvcENJZzhoSmhKRyszaUMvMVlJSVJJV0FnRHVYY2xzTTk1Rmgr?=
 =?utf-8?B?eUNUTUViWStNSXBBbEJRdlNWb0JSdVJ3K0U2SHR0alhpYksyWHpsR3pySjlN?=
 =?utf-8?B?NUpYd2RmOFErUC95UUdXWDh5TDc3TTA5aWo3a2M2NG5YenRvcmV5Uk1aWFo4?=
 =?utf-8?B?aWYxek44Z2dnV0hoRE5oMm5ZQTFPcXhmQ1VVYkVld0tudEZJTWEvRUlOMGE0?=
 =?utf-8?Q?5KpXdhyu/69FvGUsKJWw/sas8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5527cea0-37e0-4384-d7dc-08db9fec57c5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 13:09:23.8204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ydEIH53lxXjizuxXy8kEHmWKBG00ChspKukoRu9RhXLJD4IyYgcydQ/aNwZYN9f1WzdPoLbqb4iXcE4tSelPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9429

On 18.08.2023 14:57, Andrew Cooper wrote:
> The declarations for these functions in 32bitprotos.h are already Ansi
> compatible.  Update the definitions to match.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



