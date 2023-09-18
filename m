Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E47847A488C
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 13:38:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603963.941132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiCZg-0006HG-Qu; Mon, 18 Sep 2023 11:37:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603963.941132; Mon, 18 Sep 2023 11:37:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiCZg-0006FV-MU; Mon, 18 Sep 2023 11:37:56 +0000
Received: by outflank-mailman (input) for mailman id 603963;
 Mon, 18 Sep 2023 11:37:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q4jH=FC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qiCZf-0006FP-LE
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 11:37:55 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20628.outbound.protection.outlook.com
 [2a01:111:f400:7d00::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cdba85d6-5617-11ee-9b0d-b553b5be7939;
 Mon, 18 Sep 2023 13:37:53 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7252.eurprd04.prod.outlook.com (2603:10a6:20b:1da::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Mon, 18 Sep
 2023 11:37:51 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 11:37:51 +0000
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
X-Inumbo-ID: cdba85d6-5617-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h4Mm9UQQ3TBegjQzNxa+czzVjgU46XLYtwuuKSl+0+/BsROYoUfjt6ha4+8rQi79MCxz/Ogbi3q9S02YWYHjfvA7uekQZtBT+osUb2QBZ6nN2qgv1CttTgNXfhvgd9Pk1QlTOq5PV4MJalpjMQ1R23wtDWZwnr3Jcw+eJeECkZ7ZSFRGE4pMubASHN+093K843YvWvw3bFaiwkxU2mQweTDcz2SafNBXuZtdBeTsJ1elqeML0TDt97iHdMNr0ENXpmSKq+arbyO/2oi3CqlcFk0mgK9tABXiu5mW7KlV3EJajysNGckhKLJPYvP9ggIJPijjZ4SBTeeZq/FBjCpvtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OBBXnKDaDPIgpbRRjEy0lNB7lIJwAP4CIziXqymuf4o=;
 b=eIzaSZUl2PftkjntAdfhHLg8g7GikzcgPUJDRvbTlpYuFQt6rv50fIB3WIdmxipgnoxrNgTZnMqIspETQ6BmvGn9W3VZatyTeRqpIl28zzD7Vmqjss62a+UIS7CxNcqqQ3I2DZsnNLvOTx4xzuD0a/SCaB7CApSUcYnezZ8wU0kKH+6Nn1QXob4zgKgUJSTCfHtW/j4xoJOIb6qKs6Ea8j37xc4gW4l3iW8boRqxy5d4NwLXkwsw6XVXKy43VpiJ1tTUan3vRaQ+vc8Ywy6HcCFEgKNDdtvhaLdhNLbHCtoDBhDVs1xxnvg7x+WzznfDz964mqtQK5AxNrmu0QX4EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OBBXnKDaDPIgpbRRjEy0lNB7lIJwAP4CIziXqymuf4o=;
 b=1+IY1df/B+xMTZK6VVeBiR76AAEcY6DWavhIZGMj+FX+dIrE5dQ6XwC5Qyzas6Qq1xcXf1AlCw37A3ux71F5s3yUyMUaz1wId8xqjCBTR7490HmvlyallLzEXka1XbbDiQMnhhdLBt08vzR3QFMwBr8YdubM8NUzGMna7dje5TqkKukH9iNtqlFyho9x7siwWEEx+mmOub8mt6SRtsRDQqi8Rky9CAkpoAoz65LBDdQ3yu8jEnk6HDRE1yTwo0phK/hAbCZw6uA+AK2QVplIPH6JyHy/bTWTzjTMnOk/Up6InyGT2c8OjCgJoptm2CjA6VbhvrTjRd1OddIA3UquIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <943d1d28-08de-3c1a-5a64-6caa98cdba78@suse.com>
Date: Mon, 18 Sep 2023 13:37:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 5/7] x86: Introduce x86_merge_dr6()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jinoh Kang <jinoh.kang.kr@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230915203628.837732-1-andrew.cooper3@citrix.com>
 <20230915203628.837732-6-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230915203628.837732-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0151.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7252:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e3eb32a-e5cd-4843-8c80-08dbb83bb0ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	skLo+0pDJyGrotqeg0dzIk0Y+Qog9YgO0cmwOXbM/Ou4foPHYbFYfGNuTKCX1gtApJcOog2AVIuL+KaX5zOArKg3OD6uiLAFnWArzf3rqSzwV+Yjfwfa8Zvx4LW5DEcwgIKkYPZ9LEDQ+CWIaq+cUdkD7qo+o1nM4f+U3NHQ6BIFGX1zQ/lJ8oh3hnJcnomrmOTFjrhqFr7AUIceGpjREX7Y1HPVyMfUoYmbbXS5HhZ4sY3pfjbqnEJ+RXWlezRD+8zNRMWTV3rOBgwPbJEHiNt3UvkU7U6SJbKfdjXzFPoRXu8YHJAyL/l0cxc8GLMQzDGIjHeAdSlClrzNTNGXmUZhEG07xLytZl1jQ2GzYUeGf5L5kHV1w8RCyVEEfAwz10y8OAqJhfiTM+nkKfCN64wLrI1KbqJKVCrV1Ps06P9uKFlA46DcrxRaWWAMOIsRDCy7NAR3L7wV3IgfRCGn2SkjWB+Ls5vYsF8r701aVLDBM8ymGcFGpunl/BFYUHRHNya2gLizhqccIGBevzj5FOiXISWqRrUJEjbaomUlDofDqv76fah4tAAfmWhOCtlEHU33uqM/S3/pJt9fvUSks39J+Mfr/nSHGyVxxbSc+xatQTjoqtGcTaoeKyLJq7uQxZ6yYC7RUhm8bxTx8e6PuA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(376002)(39860400002)(396003)(346002)(1800799009)(186009)(451199024)(31686004)(66899024)(478600001)(6506007)(6486002)(316002)(6512007)(2906002)(2616005)(36756003)(53546011)(4744005)(26005)(31696002)(86362001)(38100700002)(8936002)(4326008)(8676002)(83380400001)(41300700001)(5660300002)(54906003)(6916009)(66556008)(66946007)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U28vb0RMcytUVDcvUkVQL0JMa1RLS2RrVkNZZzAwT0Z5aWZ6WFB2dk56Nk95?=
 =?utf-8?B?UEFadXZzKzZKY1U3TlZjRDRFU3BjenRSditxVmlwWHRzQzU4MGF4QzNCNU1l?=
 =?utf-8?B?dVZwbzNmRnlBZVE4WE1BMWxnMmNsZW5zMUQ3ano4Z1dkVU02dXFsRXVIcEdL?=
 =?utf-8?B?dW5zN0NuZ3FHaWh4R0RFNGpUdVU4WmplTktodDBqOEpZT28wU0E2Ni90UCs0?=
 =?utf-8?B?T0NJV0lnamVtVEVBc0pqeFFVbkZ4MWhOWWR6SWM2dFhtS3JvaGdjdSt4TE5i?=
 =?utf-8?B?empqeTMvWXZhd3RsemlRZmtrclNXTGtweFJMb0FCcWRQVWZqTEFhdWovRDR5?=
 =?utf-8?B?aUpiWEVMdjBaVkk3bXBWTGVyYUsvK1F4RUtUdkt3NDBDbVV2dm9vOXJUTEZa?=
 =?utf-8?B?R0J5aW1La0lsT0dYTFJmRkdKT0NWWS9EZmc5ai83LzM1cktrazQrRUoxK29F?=
 =?utf-8?B?Z2V4TVNCSFNibEJEeU8ydkxjeGRBTGpMOGNRN1JJb0pQMWlIZFFhZ0pWK05E?=
 =?utf-8?B?NXRwMk96dmowYWhGdjhEaHM0ZHZxbWRwWDlKRU8yQ25OREJqNTltUVhMWHQz?=
 =?utf-8?B?dm1IbDZZODVJWGhsb0NZcGhVbWVlY2NlTnB1VGhUZHR0WjNmUUFlemQwd2ww?=
 =?utf-8?B?RTg1MEVGbjFlYlZGMVdqbEFZWnVpV2NqUC84WGdscEpsd2ErMEZqaXNGYmNh?=
 =?utf-8?B?T1RDbG12UzdFRWVBV1R2Qi8zSnBjTTlXRWJ3TnhwUTN4VE1aMmQ3N3VtZnEw?=
 =?utf-8?B?WldyQW1nS2NPSnZzbHV3OU45ZXM3Lzl1VzdZemtmRW9vZHJDV2VYRWpXQ0tq?=
 =?utf-8?B?UFJOZFJmNGVnd1ptSmN3aTUwNEx3d3Y0TDdCUWwvMlpIT3h0c0plWGt1Tm5h?=
 =?utf-8?B?SXBRSis5UWpMOGVWbTFyb1J3TElaMTlhTkRKQjUvQXFpR0NFTGxaWHZEYUJn?=
 =?utf-8?B?elp2V0pxZVlCR0t5MS9CNFd3Tzh3bHR6ZTRrQWNvMUF1aWNDSHE3bURadlk2?=
 =?utf-8?B?aHNPNytiQVVjbjhRSXJVWTFGTWkySXllaUc4M2VzU2tVaEVwRCtSM0RpcEcv?=
 =?utf-8?B?aUhaUkxyOExmRnhjZDYxRW42TG1PQ2I1VjRESzNIZlpyeFpJT29yV3AzUTRp?=
 =?utf-8?B?WkxLUS9BdFMvOHZ6cnNTcVVqTWlHRFp3UmdJNHpadTcrVjF5ZHpqdUVMR285?=
 =?utf-8?B?cXduRVBESUlTVGY5ODArZWpBUHE0enRQZnR5U0tmV2pFYU9JejJXcDZ3WDNJ?=
 =?utf-8?B?Q3U4MEdjcWE1UHBnYjk1aXVRanc1aDU5TWNQTEdBMXBkeXpjZWtheERCdTE5?=
 =?utf-8?B?cFlYbVY1WUIzODZXaFFYRHM3TlkwWCtwVjAzVlpmcVhtc1c1OVY4bWJYMktp?=
 =?utf-8?B?QVVldFUvejJLa3RqY2drb2xCd0l2aHV3V3hsSUpPalVCaXRQMmtlQnJjaWY3?=
 =?utf-8?B?OWdTSEt6V3A4eE5CekpmbGlEaGN5NUFEbEcwNzk4THBRRjBlVjhQaEpvVmdJ?=
 =?utf-8?B?SlphczZpN2ZhdHlHa2x3bk5Pdmc2OVpCa1dFbXc3RnJPQWhtWTI0Tk5rNDNn?=
 =?utf-8?B?eHB1YmZxaU5FRnh2MUJHdVZ0c2dRdDJPQ3NRRUh2Q3FpRk4rcnpsaUxaU3FR?=
 =?utf-8?B?dGhrWnEwRzRrKzExNUFJcjJ2bi9BZlgzK1hBdU1hYTVwZDNpQW50M0RwVHZy?=
 =?utf-8?B?TTAxT1E1b0JpdndLNmV0YVJlQ2dvL2lJS2t0ZXZwZDQvNXoyUlBWeGV2Tkpl?=
 =?utf-8?B?N2o5ZVE5cVJTY2ZENUxrSlVkWEFwSVhWeFNaUGlIbjdoUHIwSVh2UkFUdmtn?=
 =?utf-8?B?Y2o4ZUhFTE9QUHJrN0NjU3J0RHYvOUhrUGgyVXl0T2hPR21FckxsZ1dITGl0?=
 =?utf-8?B?M0xSNHhXaDNTTk9kaUIveTd3WUhzdTljNGsySWVoTUlnOFNCdEFTem1JUyto?=
 =?utf-8?B?cXRacWpJYkwyMnZQSWJBVjBWUTZ2Q3ZmZ2hvTnUwcFZsNklmV0did1BHVHpw?=
 =?utf-8?B?VFZVbGJGbmJvT2lQMFpxYXY2L1NWYjluS1pHL0N1M1FRRk5hc1NMYUZQY2xt?=
 =?utf-8?B?QmVPdmNqcjEyYU5EdHhIc3ArN25sQUowMDIrRXpSNHUwRUIrdThKQmFlTW5Q?=
 =?utf-8?Q?Q7KK9VSZMxXXdwrQajjk1cu0z?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e3eb32a-e5cd-4843-8c80-08dbb83bb0ea
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 11:37:51.5839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hrb17etKrUsn/2fXiq4UeXz9iEvkByEAR7fdCZIw+EaQDnx2RB6G4lDFYxlhV3zGDQMwPvt+dx28bHqyxHTRQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7252

On 15.09.2023 22:36, Andrew Cooper wrote:
> The current logic used to update %dr6 when injecting #DB is buggy.
> 
> The SDM/APM documention on %dr6 updates is far from ideal, but does at least
> make clear that it's non-trivial.  The actual behaviour is to overwrite
> B{0..3} and accumulate all other bits.

As mentioned before, I'm okay to ack this patch provided it is explicitly said
where the information is coming from. Just saying that SDM/PM are incomplete
isn't enough, sorry. With that added (can't really be R-b, I'm afraid):
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

