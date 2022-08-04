Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CEF589C2B
	for <lists+xen-devel@lfdr.de>; Thu,  4 Aug 2022 15:07:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380339.614453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJaZU-0002xI-Ap; Thu, 04 Aug 2022 13:07:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380339.614453; Thu, 04 Aug 2022 13:07:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJaZU-0002vU-7k; Thu, 04 Aug 2022 13:07:28 +0000
Received: by outflank-mailman (input) for mailman id 380339;
 Thu, 04 Aug 2022 13:07:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ntlx=YI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJaZS-0002vO-Ju
 for xen-devel@lists.xenproject.org; Thu, 04 Aug 2022 13:07:26 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2058.outbound.protection.outlook.com [40.107.20.58])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62956dd8-13f6-11ed-bd2d-47488cf2e6aa;
 Thu, 04 Aug 2022 15:07:25 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB5853.eurprd04.prod.outlook.com (2603:10a6:803:e3::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Thu, 4 Aug
 2022 13:07:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b%3]) with mapi id 15.20.5504.015; Thu, 4 Aug 2022
 13:07:23 +0000
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
X-Inumbo-ID: 62956dd8-13f6-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KVchL8rdY2N7GFU5CLnpZ7KqU2/INt9rv50nP71DURbre6S8/5qfTFLa1kV4OkHXPYsURKIp+3CrIzRQFdJoCMq3dscame1hz0K+Tt+Zh69Xax//dy1Rjvp4Wyyh/NEyIPrOhLtVIBTfhjXRuId3R59mZvez4RFYiZw/zE6P7zn0P68/D9fNY9biKY5BUKLfa4u7nImu7olebZW81L8swShXp5gC/Z4TVSmwJ3ZqhLnmZgtvpwM/aGUnYct25nymtDO7AjYRg7/aBkjDeNyIU4Hms27HJ/jo5p+NuoRJZTQBTVL+G0ya8D7PXKpfYsAc+hchY90CRyKxOgliLRb7pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qMYvBaXJZsFfv1V9X7rehs+pFm8i19kY3uO0fZIyNCA=;
 b=YKXWDAkdF7KcjqmwHChFIsb1kOW0zu5iO/r3Ysy04FcxW5b5XGiWmMUP2WtlSCdrn2gmYSoYG3kB3o/IyKv1VgguxkrlhDZD6snSZAo0QH5r+72j64wZG4nE8tFyrsukabT+W8KxKQclWYVfuYqexpz99uvHLFbi2BGPE7hR2PsszUXFU8vtimOOUlQ0gw4iCyhAY1lXar+JKtVFF5Wf8LdRjj+vZaGYLyf1ar4CToGkBbSH94oHsjwt4gWqu0wE3jLzrdpeRjzYnHa5YeFH6sqZ7S4DaRu3GKr/Txk/2cebjCAO/XBj982qmU9QYjMtEZwfm1n1KGYoJbK77QkKjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qMYvBaXJZsFfv1V9X7rehs+pFm8i19kY3uO0fZIyNCA=;
 b=h4axubb8RWd+VBMP+52N3G45AFFBSYYHqMZGwT8575fInYaiD856Afn8FD7w7pQ8IvhDUkXyabDxl9Y+VN7a5Q2KNoRmwXj6AjAcA7pYdTNo+eYMUTk9xep+xrlmRKsi4OtoiDlFfRI55KZ1uTwv7iy6O1UOecYtggPvvI2UwuNCRkEDHLw/9ey6/2mvY9wieKaHiLcEGF7n8FXl2VHNUDwNoRjeMi7SZttd0DniEsX1Kxs5LomjwtX6hV+vYgXUQ7pbVHiE8H/CDv/jDQjWQ7Vi3CY9Cq7AKcN72l6ibTL5i2uKDRICXWYDBA0lhUYqSx62mhq3ONd3ePoBh4jwTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bdd9b051-d67c-61d2-9c80-55e5caf0905f@suse.com>
Date: Thu, 4 Aug 2022 15:07:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] xen/compiler: Fix MISRA C 2012 Rule 20.7 violation
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220804122907.1821730-1-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220804122907.1821730-1-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0065.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51dc40e0-129e-40db-49b3-08da761a458d
X-MS-TrafficTypeDiagnostic: VI1PR04MB5853:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/si9y3ly5V0fmAjp7iTpLDGPpO0F2e5nkWndacK05ga0ZQM1AKYUS6iZ7H4FL9ZZUHSiWbJhO+KRJSXf80z2WxBDUZtgzSSofKInD+RcZZ4fzyhN+Ykz3PaVCjqrVKNdVAAUtTqnb4AZStoqOmeKhmpWV7sS0q6YBIs8qOdPdiu54a1Ux75yEka3kTweSlAn+b1svT2YYq77v+HytTTddXE7PbhilNji2aBMhzXNkSTa8pMMXgogBrDbJ/9bjrlifxpGMjZt0XXE7YeePNaY8gwLNU5NQylVwQCL5I0X8FUatm5itOGJQhDJNrn3BlYkzgwd9/ufpaJREvdxeFVmVfdOa87g0eD1rI4d4pi5CpbLkGG2yXFmb3OBC5eBScR3e9PHxll/Llncq7SJfXkxdempf84Tekt8yTkfOnsJfDvGdVA30GuFLrgl7dzYlEoKXIDiDX/w4HIIyW79phetJ1WVMpzc0MFs7pM5Ms5vbhgtnlw00WtyxSexY3tnKPTfkqDq8JEB4Lg6G9hgPO9cZzeB1ePo1LKyw7t+b+KVZq2Zg6UOlCg1Q/IiaTEWkVwnfo9xo7I9TtnsFngVuxUQjRvVNmTQiC8XAsN5BzdyoQxBx2Em0L0qmcr9Cimf7gKCHLHY6jHqhpSGuNt6stxcnBGUxzIc/fcnyiKBH0sJRNdaEaXPSoXv2aI6IeDy0NaB9C4nHteJyphcTgab6+vPKAkzURnuVJqFx9Dbl5aYZVty6KWuw9vxraQ0WiZvX+hPGkJbBJQL/67PnHv3S505UY8IbLktwBzGj2KkQNsnkxcnwH8dvBlCaaokmWvJrDgEBmuvwRFc6xJqKvL2Kw0+eQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(376002)(396003)(39860400002)(136003)(366004)(8936002)(31686004)(5660300002)(2906002)(66476007)(66946007)(66556008)(8676002)(4326008)(4744005)(316002)(6916009)(54906003)(36756003)(6486002)(478600001)(26005)(41300700001)(53546011)(31696002)(6512007)(6506007)(86362001)(186003)(83380400001)(38100700002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTJVTlduSVhJS09rdVQ1dkVldG1tTE1JbG8rS1pCOUNYNEkzMHd3bWFNTzhS?=
 =?utf-8?B?bVZLMk5FSmRPM1Fad0Z0MXQwMUJpL1pRV3V2UU1tQmpMemNlQUlTb1R4S1FY?=
 =?utf-8?B?bEVRSmFKVmZibWtGOU9icHA5WXdkaXFzRUtyN0J6QW51N245U04yQW40OFpW?=
 =?utf-8?B?TVBOamJ5SUdyQ0MwU1hNa0FvcHVjSTByZk5pemIwRzVTdk1KNTdpVG54MHJk?=
 =?utf-8?B?K3NNUHg0U1MvTVMvVS8zQUtPVnMrVFBZaFN4NWdVck9wVUpOb0VZZ2dVWmg4?=
 =?utf-8?B?bk80R3FudVVmUEFtMXplQmJGZHJxdTJSaVlDa2Q4cUdFMmx5OEN5WUNVQzhl?=
 =?utf-8?B?NEtDL1ljR0xZV2xNUTcyTjY4aFFGMUgwOWZZMlFlc2dLSUxxYVUrMHZTakFY?=
 =?utf-8?B?ZUtIZXJtc20zeU11TXF1V3o5b29IV1NNMXd3dVE5L29ycnFlNmtFS29tTEU1?=
 =?utf-8?B?S2lwc2ovMkNjM2hzckltK3IzSjZuSlJSZ21qZzQ5dFlXeklLcHFoWVorWVI4?=
 =?utf-8?B?QjFjbC9uc0tpbkx1VUFVMUZYMitiVjZWRVBmdmJKeGVUVDM1UTdYZC9maVBy?=
 =?utf-8?B?QXFhT0U2NDRkUG04dlZseitPMGR2VnVwVE1mNWJISngya3pGWW9tV1UxWkFx?=
 =?utf-8?B?aERUdEcwczVKZFlXTm1pcER2aXgxUFFWdzh1MkdYcm5DWmg1M3dwNjczNG1t?=
 =?utf-8?B?cWlsRzJPaWdQT0VLOFZKTXNjZDdaN2p6VGxRNzc2NjZPZVBlOHZNY0dYTE5w?=
 =?utf-8?B?UXNwcE1mRXYvcUNTMjB5dGJ3MEFLTzNOSm9WQWZraGIrdE1TaVlCL3pzTnUv?=
 =?utf-8?B?bTNNTCszNk1oNjVTbGduWmdaeEFkaUl5endQdHBLTmV1cFN1YVFKSXVCSHow?=
 =?utf-8?B?VFRPUjBLR1JnWm1yajBkZWRwTzZnMHVxMklYRmx4RVo3SWVUR0R0eHVBNnlO?=
 =?utf-8?B?cFlkZ0JxTEFhditJR1lBTVJ6MDM5TXFJaHpjUTRTSGFJZWloRTByR0RoMGZF?=
 =?utf-8?B?dG51ZHlBcDhJaXBUSEprUjlPd09kZE9KQjZrK1BSbjFiazBxbldVZitjSWJP?=
 =?utf-8?B?bXJKeVQ4bWpiRENJakRmYVVwNC9ocGxXRUszN1lKZ1M1QWJEV3M0Z1BGSVdG?=
 =?utf-8?B?UStkQmVZUHp1elI3dmN0bm1XT3luZEpwNzl5c0p0WjZ0TGsyNGhIb2I0R0lZ?=
 =?utf-8?B?SzZNZXdQVS94ekYxL0R4WDdMWXVRSEFuK1hnUnVGcjJYcGhYSis4dUtyR0Q5?=
 =?utf-8?B?WjBkeXd4QXBaeUpOUXBRUXBFc2dVNVhabWJ4Z0R2YzhkaTVzTHZrTFg2MkFy?=
 =?utf-8?B?S2JpZm5uNXVNeGxWZm13YWgvMC9Sc0U2L2V6RU9EalM0aVU0QkNPWFRSYkJN?=
 =?utf-8?B?NGw0MlppbmxKWVNXTWhKbS9wWEYyMzM3TE40a29kcmpmUS95UjdiYjNXeGZ3?=
 =?utf-8?B?aitkOEIyZTFBTzlzWnpaaURMM2ZRVngxT2pTVXJQVzNTR0ZqZy8vMDV5K2g2?=
 =?utf-8?B?ck1Xd0d3NUxlZ0trSXVrUGg5dXN4N0pEbUhTZmpGSDRNc2F3MDhseC9CM1F3?=
 =?utf-8?B?MmZsZTdiY01GWlZ4amgraEsvaURGWW1tZUtVOUFucXo4K2VqTERMaVUva0NL?=
 =?utf-8?B?MFY5Ni9WeFZXdFlxQ3VBaVZEMlYybXVHeUV1eEZJd25NYk5MQkt6bytuYTlF?=
 =?utf-8?B?TFBSMzJ0ZVdaUTUwZlJ2UzhMcjdFaG5LbkFHOHdYNXpkNHBkTU1ZN1pUb0h3?=
 =?utf-8?B?S3FXT0tBeExuQUp6S3o0ak9BV1pQVm1VbEEzdDR2OTk5WXZKVzBhSjVMT1Rr?=
 =?utf-8?B?MDh1ZVM0WHVXdkg2Qmk5QnpoUitZcEhqQWh4K1k5aWc1L0VvblJDTWZEc2dl?=
 =?utf-8?B?RkxuWEc1b24vSVpvaEZQclF3bUtXQlYwQWdYa3Z1ZWEvU0dsMUFXZUJKMDdR?=
 =?utf-8?B?a1FBcVluQzI1djRKWGxEaWxSQVZwSlpFcTlVYk1tY2xBa21jSlVuTVhuRklV?=
 =?utf-8?B?TWV5Mm1pdjFKRk50N3ZRTjVhWHZRa2xVSWN2S2VVRi8wUGg5UjhUQVY2aE9Z?=
 =?utf-8?B?Q3hWWng2UGVTaVJ4ZTJsQm1hS1l3eVZDRnY4c013UUxGUHFyeHJETStBVmNL?=
 =?utf-8?Q?N1AFsQk3YGHOnYvpadR7i+JqK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51dc40e0-129e-40db-49b3-08da761a458d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 13:07:23.6648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eqbAZxglUEDBpchFV+AmIC3/CjMKCq5jF9p4XnnVpxKhbuRGp3vty1RzD1Z74TeJjpsUtHxKKZkP8QTcqAjMPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5853

On 04.08.2022 14:29, Xenia Ragiadakou wrote:
> In __must_be_array(), the macro parameter 'a' is used as expression and
> therefore it is good to be enclosed in parentheses to prevent against
> unintended expansions.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


