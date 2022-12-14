Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3912C64C66E
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 10:55:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461974.720129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5OTY-00011T-4C; Wed, 14 Dec 2022 09:54:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461974.720129; Wed, 14 Dec 2022 09:54:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5OTY-0000zK-0r; Wed, 14 Dec 2022 09:54:56 +0000
Received: by outflank-mailman (input) for mailman id 461974;
 Wed, 14 Dec 2022 09:54:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dEbZ=4M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p5OTW-0000zE-Vc
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 09:54:55 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2051.outbound.protection.outlook.com [40.107.15.51])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b8355c9-7b95-11ed-91b6-6bf2151ebd3b;
 Wed, 14 Dec 2022 10:54:53 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB7090.eurprd04.prod.outlook.com (2603:10a6:208:19e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Wed, 14 Dec
 2022 09:54:51 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.019; Wed, 14 Dec 2022
 09:54:51 +0000
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
X-Inumbo-ID: 5b8355c9-7b95-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KQ/eW7KNnKboG3D/j2lHPtL1vCMkPukXlQMh9pZ9ebN0cLEb/4qnfYTc9LdI2WvQ6lR8FDVPpvdmmpE51Qm0INH2ZbrnpUGNGm7kqjs2Zk4oYCrr1nUJ/Bqb/F6mbSxSQ3KxMHAvIkxt1aDPq3EyCNzJa92IB+zHIj0nCj1jgHnyKknXTOaF01XfIKfP8jK395WW6MvqIHOhvbKH4JHH2HfRvTob00gYAqRjKui8KlZnndrRUfIK+p12fOsryuiGthZ3PbHrEC2DUpVbOOvicVB0oNqCE4C9wDkxiwCCI15zN6xgJyEjJgzVq4PPVvxztB5obs1NNKHf3n7rLoPy6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=glOYJ+UpQVslLNTGc1Qxkq2UXXHNyE0lNYIpA7VEbZ0=;
 b=AQ9sZxHc5JK6yyLKkfMqtvYv0q/EeE49ufvCdYPHhwKlwK/9iEEmtK9bESDVI4q6DrEX+muiknywkGL8hN/DAypa7ThizlEK4Qtbec71TKnDwH1sxT7pwUGKLXhZFI4+e0xx7jxSr3mfc0lSuWveBYQ6HDXtyaRlnoPEtQwQN6pL8/jVoH2h6TgVKBSYBqQf11lTn/nl679wStQXftcuvu1xijSw8U5hAhqSInyuR1BD3hODe2IMYBlrRethtLNckku8KLewRXQgjQf1bB5O81jgIbjikrUSCy0PLdCGvAqGxokIg81nF6EqIVZVCQyKXBKHRawub6GH+YVmCfL9bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=glOYJ+UpQVslLNTGc1Qxkq2UXXHNyE0lNYIpA7VEbZ0=;
 b=wMH+o04BnOJAWVWh0XTYpH1Q+abOvjVcsNXLnaelVfsOdNkIAroJR6zOeK8YKImQYoXnoT49diXptg13UviJ8dcvTCbGmaONhksB92+1hvf6cNmICBP6RMtQljaugCXXEmPdNSEAf4Xe9G2OatkVFRf6UVLHQgnNa5VNS6V8XE082JlvP0ESr+webSrzaofygeiS36OblY64Xj10HNpFv5/qzPILX/EN7UCazvgmq4KjwkbSg/3Oji58FLnngycV+13x8kpMGTjkjWRlqHWTRbA91ZSdxMR5B8B7ho52YdumbSdMeemtzIMbjHfZdklL5WQfu0xiZtVEROrEaybVLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cfa88146-96c2-33c2-e140-a486caa320ca@suse.com>
Date: Wed, 14 Dec 2022 10:54:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 01/19] tools/xenstore: let talloc_free() preserve errno
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20221213160045.28170-1-jgross@suse.com>
 <20221213160045.28170-2-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221213160045.28170-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0097.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB7090:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e6d5417-5a12-4fb7-c812-08daddb93e86
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	10vA9CXc1enj5ANq4eDB3+pqsu7cYMHRWmd+Qk9t43yGC0h7U+rVd89Z8AKVUC+Cbne0H/sI3BTihXm1YNMQloIQKAJph/F0VOyzaXCh/FMcj01y+2u4uwgo/s/u2B1vbaBCkUceCWB8eVnsQ0KcPfT1eghUH1I+e+Iszr5ydaTkjDODlaTjdBzJh2OHkgwzeJsSJ5PXmg5qgawbxhZgIzRmZnGSjtq2qok9xEdw4bfwg4YMNEHscdzfa4C5lEoqEudZcnhAvcJrBHV+HwvLkkX+TPNRDC7JbZwxBEwbmTJrTUOhMK6M1ge8EHi4hbkNOKk7JAsDopoAqz/SKbQSYKAJVd1zqJgpw/sKYKhTUTTv+gbckTkJV3WCsPzsGYORD6AUc5MN7e0dzivpmQnb80HBYHhc1LlyIDYOvMJJ7M8nTaZlsDGXl9CtjUNwZouxCmCgGbcmQUKaIbXXf0XdT30KVS3SiU2msmPoMG+rZlAqQnynAUfiFuYGg6HYUnoyZy2FsXT5a/YRhrglrQ+Cporo7zPNi9qBvffAFZIw3lKLYFPdxKC7NeckwXSpjYyRpyv6Ayg8gyV27EyZMzrU669N4WK3NssQ8S8/0ZDTGsoLmhK6yTkTtS1NSa1AoYVLtceIDer0pbX4rkwJECJmUBqCtRZkHLTOfjNzWiJu91l2Vl93za/5zBFiE3WvMcI0vyebNPNKpaWyGVJtEDa2Bfg/t8Ixi0akVavsodbNVw0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(346002)(366004)(396003)(376002)(136003)(451199015)(4326008)(66476007)(66556008)(41300700001)(66946007)(8676002)(2906002)(38100700002)(5660300002)(8936002)(6862004)(4744005)(2616005)(36756003)(6506007)(316002)(6636002)(6512007)(186003)(26005)(31686004)(86362001)(478600001)(31696002)(37006003)(53546011)(6486002)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NEIxdnNHNXUzQnF2R2ZhMksyWU50ZUZNZzZmMStkcDZPbjJwcjNZOWJ0WEly?=
 =?utf-8?B?MFg2SSsvKzU0d1JhK3A0dGZRY3BhaU5jRmxoWm54akF2c0FodklDY0d5VUor?=
 =?utf-8?B?Uml0WUtES1F4Y3VFM0xGdEJmOWVMc1VBSWpaY21OVEMyb0pjTTYxZk9IL05t?=
 =?utf-8?B?alpaNTJlcmVnMHpqVjh3Umx5dzIyeG9WQ2V0a2FocXBVbEpidWVZc3J5L2w5?=
 =?utf-8?B?eklmUGErVnlTcjZ5UkZ1L3JxZ08zUGhUOXRqNjBESCtIWURNNjJUT2J3OFhn?=
 =?utf-8?B?SnpoYnVLcm9ORHAva3FyUDhWbzJneEJ3NXhzYU9IbENWWUdnS0lXaGVmQkkv?=
 =?utf-8?B?MEdsSVVmR2w2NXozSEQ5SzJJbzZSLzRIN05OTE5kenAwUnhJaVlIemlyZlZQ?=
 =?utf-8?B?SzBTWGd3VG5zaXNFRXlWY2V4ekxuVERsekIzaGRDZG9BUUpZSEJ2UzZDZnpj?=
 =?utf-8?B?ZDQ2VFNLYUQzamR3NlFOcW5HbnpCTkF4Zi9qVm1odTRzUE1sM1duYXpBR2lY?=
 =?utf-8?B?c042UHN2bHVvYTFYUEE1MjZHdUFSbjhGL29pdjQwSGRqN2ZBS2xmeUZYSHFW?=
 =?utf-8?B?S013Uk14OXBMa3czWkNLTi9aSW45ME15STltdDlXRjVuVVVlbDE1UU91UThT?=
 =?utf-8?B?eGFWdHhtWTl4NElSRW1DbmdxNkplZTY0aklZNXZjd1NIcGhFbEtSRzNWazFU?=
 =?utf-8?B?Q3ExVVVDUFJUcmlvcU91cEdFTWRGSEh3WGs1bjR1YXBoZFNJdmtNWG1PTEpB?=
 =?utf-8?B?dEhlZDBnUHpnSWNHREppZEZZZUVOQWdDN0FSeXFBN2tEdW1iQ0Y4bWdoVjFT?=
 =?utf-8?B?Tmp3a2F5eE84TmJ1UDBtN3VydWVIYWtLNzJGRmdKSlZudU5kVnpGUWZYZUI0?=
 =?utf-8?B?Myt3VU5tY1Yyb1BjVXFIMG5mSWZZbFVDcHk2K2VZMzdUblFHV1FjbjAxRmVL?=
 =?utf-8?B?R0tOMVFUMWVhR2pvNmd6UVRqdlByaFdUQ0ErcGpZUXV5UDg5N0JDTzEycGs5?=
 =?utf-8?B?SU9kaEt1VjJLVVlmMnE4TXljUURNUGdpdTBOQ21zOGJsQTdsT1gyVDhSVkZG?=
 =?utf-8?B?Wnd6NWphMStIM0xoeW9VOGpCVXhpdGRxM1l2TSt5bm9EajBaUmRvVFhOSGpk?=
 =?utf-8?B?b3RqaTRmQStTaVkxK2tNZFBkNlFmNzZERzZIMGgyTzQzSW16SGRLY1JzdGVL?=
 =?utf-8?B?VEFKVC9Lc0Fxc2NiTXdaRHdmVGtDZmJXMTNtdEVyK0FFanpMb2djbndFQVBF?=
 =?utf-8?B?L082bVliTStyMkdRcVVOdDBwYTNsaE9lVnlOMDIwSVNyUytDZ0gvSXdJU2lp?=
 =?utf-8?B?ZTdyTEYxbm5SRnUrcEhIaGY1TEVVWElEMVpXMnIvVHZPQnMxTjVCYVNtaTZI?=
 =?utf-8?B?VjJuSUtMK1VGb0ZsUytWc1J0ejBKWlprcU1WWDZ1ZWN5OXNtM2ltcDNTUE1K?=
 =?utf-8?B?ZzRSYkNXazY4eUpzVkN0TStyVi9kYmdqVDRwcFdGaGZUQmFCK2RXazN4dTNs?=
 =?utf-8?B?NmllWmQ0RGZ2OWhsaFZNN2w3NFJheXNnTHFFajlwZzJ3VE0wQ1gwd25FdHIx?=
 =?utf-8?B?NnZHMEh3SFJWUm83UHpCWmZMSGhsazNBMWdaOW5QSDNlYmduVGFRa2plR2ZP?=
 =?utf-8?B?UTNQdUJNNnVVZG03YkJtRTdDN1ZqZitEaHJkZEIvQXZMZXljbk1LVEw3cng0?=
 =?utf-8?B?ZHg4THc2Y0dTTTdqOWJjOE16WFFoM2ovRWloYUNydnh0YVFaSlZIYm8xbUhq?=
 =?utf-8?B?SHM3RUQyZTlKUkFZYURja2RKVUxob3lpQ0xQRksyZDlhM21XT3NlYVFNRTNh?=
 =?utf-8?B?THpZd3NnNTRQS3pUVUIxNGxMNG1FMlU4aTg2WjFaektiaEo1cmpKRWpuSHhS?=
 =?utf-8?B?V1BkUDMvQ2xRbGFSUlBvODNNUnpIVnE5SjhFMGxlYW9vOUZJY2JGdnV2QnZT?=
 =?utf-8?B?SWVHK3JwemVpU0VIM21SeC9oOGJxVEg2Y3JYOW1ocnZ5Y2E5L0NISCs0dGRF?=
 =?utf-8?B?RElPQ1BiaTFuckxvMjN2ZkhJZGYvTWN2TmF0bHRYMjV4U2h5RjhyU0QrRHRt?=
 =?utf-8?B?d0xabDZlMWpzTGIxQnQvUVBqZTNuTE5HMjZ0MlB2S2V4bE93dUZUMUNhZkw2?=
 =?utf-8?Q?QEAf4djUCk7Z3IOP8oxVcsqBb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e6d5417-5a12-4fb7-c812-08daddb93e86
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 09:54:51.6086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eN0g2ksHeM4p/a4KXonTTnEQdmlOWEbH78ZnAjGSNLHwTk8rmaqaux8GRiJx0P1GHu6SKZo4ylA6i2FFaZ1x3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7090

On 13.12.2022 17:00, Juergen Gross wrote:
> Today talloc_free() is not guaranteed to preserve errno, especially in
> case a custom destructor is being used.
> 
> Change that by renaming talloc_free() to _talloc_free() in talloc.c and
> adding a wrapper to talloc.c.

This looks to be stale ...

> This allows to remove some errno saving outside of talloc.c.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - drop wrapper (Julien Grall)

... after this change?

Jan


