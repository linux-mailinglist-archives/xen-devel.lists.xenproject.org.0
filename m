Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6802669554
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 12:16:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477222.739830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGI2p-0006lH-28; Fri, 13 Jan 2023 11:16:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477222.739830; Fri, 13 Jan 2023 11:16:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGI2o-0006hr-VK; Fri, 13 Jan 2023 11:16:22 +0000
Received: by outflank-mailman (input) for mailman id 477222;
 Fri, 13 Jan 2023 11:16:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=grKZ=5K=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pGI2m-0006hl-Ff
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 11:16:20 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2067.outbound.protection.outlook.com [40.107.6.67])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b23f8c97-9333-11ed-b8d0-410ff93cb8f0;
 Fri, 13 Jan 2023 12:16:16 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8735.eurprd04.prod.outlook.com (2603:10a6:102:21f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Fri, 13 Jan
 2023 11:16:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Fri, 13 Jan 2023
 11:16:14 +0000
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
X-Inumbo-ID: b23f8c97-9333-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RGpEkSXGdQVIHQMXQzHfEl4ErKzjkw2QJlnSl/GQZvBzop0eS+Y47o/wDGUatGBARyup6rXWjzx3YeauERmSrYfyXF1N0nvUHLJQAZS3QlQctwxNO1LpoKX2lT920kXxWmtnvHNdb+jjzTbI16M7y3SQFuUWeet9lia6EqRG+JlXDAIP0uyZEn+OVBEQ17c8ng4ENvGx0859tQlsmgRaXCGXNkwuJumkQMOJiEw2sT1eMSq/XBeiwqx+aglDO9megL/MdWfGqHjs67jtqQoBtKdK3dLz84MaJ5krTC8wrjmsnLjTVvQDQ+VTeMCisLv4LtkJhKtKvA3VNPjnuSBKQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MiObNWxEp4WmdX8RLhIZ2MNwRpmKorvD7g/cRGflOKI=;
 b=Hh7OQ8XaffSmTEO4itByrh1ip/7d+n7kfs9EVNgajMr5CTg+3xwoNGiJQ0qq4RuGO6TMDT2WxljFR23n4gORExtZuR5vaxxj9MDDTI73kjJ1Kt5dd4JENZBy9qs1d7psRdQqNJjuazzaLGEMYrI8EE0RXayCqVePT7eWAYa1QyGyr+dbiMNt2B6L3zukINgITaalG0z2WfXuvDB5ZCwqIgm04+liqoRCOwCj+PRHoGVXTsE8RiI+ge9r5awy0fwIUJ/flBdnObLnioQjr+4thEOIy7Q8O/io1oV2pnh+dgIdAEmIn6RNdQMDdq1VD3c+KE9+1w8krXCsDAuCu2P18w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MiObNWxEp4WmdX8RLhIZ2MNwRpmKorvD7g/cRGflOKI=;
 b=qo7IvFX97JaA/aXaYnpYXG8hPqY2HwMfHfKlcrsk1Iik9oOwk4JK356Bbn12GHnXfur9OEO7L8tpTKPyvjwOsQ9H3r24t5slP6M8PkNjp2eptcMaqVqjLcJCZfsN7y0BY/IdEhjknJn3PoaEEWyAj4sD1LCvkqR8Sp8l8ER4HTFSlzAp5gSTmhbGAxbyG1gKQ0/cRQcYrgTNwnryNl5d7Qvc+9QI5129Ny3d3QJB+bGjXDijT9g6M0tGxWRS5MAXUQDpVgxBmsMTJkkN70WUwjVbDoHtX25BQ/HCoWFftPGzTGlzdl77oMP8oz9VtLDS8g4on6BKjfkGsHiqf3ARDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <09573105-b441-9099-eda8-cc1e407da67d@suse.com>
Date: Fri, 13 Jan 2023 12:16:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [linux-linus test] 175751: regressions - FAIL
Content-Language: en-US
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <osstest-175751-mainreport@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <osstest-175751-mainreport@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0028.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8735:EE_
X-MS-Office365-Filtering-Correlation-Id: bc16bc85-843a-4dcd-0b81-08daf5579545
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zfojpSO3ce6ZYi39vOkCuY/JC/BLYOgPK01xKbXaet2P0jJJzawNNAVOXOlKUwENYch+SnAiuGYASNacj3XI26ok2usreIwxqdWK9DFD7x6bkB9eWT/Lo+u1W9yaa9ZsQCeOONa/fYRlV8VaJaL7/ZooSllt/C3qTr1QW4+BOpdibxpnTBgcb0OmFxjRM9LY37Nl6xq1D6nBGcBE7MKG8r/bdYSuxmxktJ7vMvJ/oAeFInAJHmaNszCvVGtqUjaRHpzk+1bzR1KkiH4Irj49rG45apyz9rkWod811JH+iAvPL7f/c+dSrd5T/zU/BrrwpwdAWhVZ3QGDcJUK2QM8hoTuT21fx5VsxeEWyPkXgmfP7lMjVhulf32CGz727NW2HATzLoN4xbSF0CteMRQAD1zGuHWl+pwlPDRV289VrL/1GHz8DwZ3/A3Q/5ZU6P/wdBuxFYIwIDqMv9aTN6uu8Uk8N5q0TOWQmfrtnhH4p3kU9D8oF9ij08pHo5gvKk09qKshX4P4Ea/naB9Eswj0D8AkQlb9O1SZ5ldv1zh1fBv1K2w8XtVkDJORelqW+vmExLXiLPhAUOVwz6wYGlApCEOseecq+Mk3KSN8eawS07B2u0HRYWMVKeW2BtLZ37uhGG+KDYP1ayuOnipqhvfZTF07YZ5gd3qAPRZERvuwX/h2cwMXbRPQN+PgzvRSfoE+G6ClC8MBdgx41XwDm4OQ2iHClIvDU/x2Ay7O4p4yQQIgGprNXnjnXHKMyfpaGAuxjkq/I6h5gtdJboWHNd3tQg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(366004)(396003)(136003)(346002)(39860400002)(451199015)(36756003)(2906002)(5660300002)(8936002)(41300700001)(83380400001)(31696002)(66556008)(38100700002)(86362001)(66946007)(31686004)(8676002)(966005)(186003)(6486002)(2616005)(53546011)(316002)(478600001)(26005)(6512007)(6506007)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmQvZVZIdmhTNFAwYWEzbzFZbXoyY0xYUFBOZzVNMFdmZHduYitQdlpnTm1G?=
 =?utf-8?B?bDZUd1pUNVVuQ1p6SnJ4SGVibFhVQU81eUc5SlRxQ3lDc3k2WDUvUU9ZMFdE?=
 =?utf-8?B?STBUK3NQOC9Bczh6S0h2Y1VuUk12emFZcUp4VGI5M0VEdGFlZTdwRUxDeUVT?=
 =?utf-8?B?NHJZVHcvdUpWeVZ1ZEZzOWR6TFZMMWRtdEJIcXUySUNEb1YwdDZ1NEM0Z0k4?=
 =?utf-8?B?OFltQVRDbGVuRllYdEdJRkR5aHhZMllIWTZ3MkxhWk5URU1hTlF5R1pSTU1E?=
 =?utf-8?B?MnlGVW1zL1lramJieUg4TjFqT2oxU2FvZnFHWWxZVXRhbEc3UlR0Y09DZXg2?=
 =?utf-8?B?UGtQUHNIN3JDMVk1dm8rZ0taSU13UjVkYUNjci9xYzhmRHBDL0ZnaWVsRGUz?=
 =?utf-8?B?YTJ5L0o2YTdZL2gvaHRKZjVrZ0FlTW90N2lXd3RYWmlRZ0lTbmQ4M0liSHVQ?=
 =?utf-8?B?bCt5M1R6OEZUYi9iL1BnYlJTeWZMT0FIUm9LbWZiaTEwSldCU09XMHlQYXVV?=
 =?utf-8?B?ZmppZFhxbDVYaWYxalA0UWk3WHFFOXRhQmlqUDBSbTNScnFhbUdsL2wvMDB5?=
 =?utf-8?B?ZlhoM3NqYThMbXBhQjVodDExcngwdzJCa2UyODcxYlRsaEYvbHpvVW5ERHhC?=
 =?utf-8?B?YTBXMkFBcVJKdGM1MlZSdjFmdU9uUVlHYzJEWDcxTGdsSk96U0M1dVd5blNm?=
 =?utf-8?B?MEV6UkpXYWlrUmFidTRwdVNERU5vMlo0bitSN3pLcmVwTzN2Y28va0czSGk4?=
 =?utf-8?B?cVNqUmoyYklDUFRLSW9aNGJlRUVhRlhicS8yYlhucktWM3VDOVVkMHcwTjZZ?=
 =?utf-8?B?aGlqMXVzVk1rQ2FRaVZQb0M3b3NNeDNYZWZyRDRzb0xEWlNVUTlxdDhmVGY4?=
 =?utf-8?B?TnliL3pBeFlLMzk5Mm5nTUFPTHc1bmdzSlo0dkZPV3NMMHl4REhIc1ZnekVO?=
 =?utf-8?B?YTlZZXN6VFJ1NEZjdExDbnZTZ3QvYVg4NHJkdmhVNFo4WjdUODZTYWxNd3VK?=
 =?utf-8?B?Q1E1bVg1bloxZmphWmcwT2hsY24zSngrUlA2L1FDc1owdDg2emtHcTRpaFZY?=
 =?utf-8?B?czJ1alh5eDFodUIwMkg4R1g4MlU1MW5yOWZmTWk4MDhkd3BmK0VuWkIyVmtY?=
 =?utf-8?B?Q1JFM3JqTnY1UU5NQTNpeUprcGdybFFNMHdZT1FudEdqYkh2S3hXcVU5R3JQ?=
 =?utf-8?B?RHovY1UxbkRGQ2ZuMUdUYjFIQ0YyKzRGTzBBRCsxSTVXSEZ2d0tUN1J6MjEz?=
 =?utf-8?B?azhIZlN4K0FlNE5GVERJK3QrMEdjelBKTC9oL0hiRGRJNDFEc0YrNGVBVmNL?=
 =?utf-8?B?NjJBcmNHbnNvQy92V3c4RDdLTHZrZXArQW1JaFlROVlMN1ZncGNVQnBNTHRn?=
 =?utf-8?B?RGJJY1hiWm9NR0F3TFR5MW9HYW1VcTFZTThlRHpSS2VlSXg1a3ppZlA5Y0JR?=
 =?utf-8?B?ek1sc1YxUVN3MDdDbkZ2QlpYWU9PWk55YUcrVGQ1YkVQdlllS1kzYVZIMm1D?=
 =?utf-8?B?MnNjYkI4aG1ZSStyc2NpN3JxS3F5SXpjenphQ1Q5Y0dvODhFcHhENnlNQVVj?=
 =?utf-8?B?cUtxTWlvR0dOMWt5ay9QZDh1MERRYlJVeWY0RVVONU5jeFg3eFA5ekt0NW1o?=
 =?utf-8?B?QjRqUWFhdzFQQndFTjdJZ0hFVDBPcmFvZmF3UVZRMmFxbkJMbXpsdldhbkor?=
 =?utf-8?B?cWRWZWF0YzVGS09Xa3VsYnpQZmkrcjg2c0pJK0FiK2U2VjNOQVNJeHpQbjRS?=
 =?utf-8?B?UmdOcUgrcDB0NTl3ZElWK0l5N2NvZ2ZQWXlhWENZUmt6VmJjRU9tNHVpTStB?=
 =?utf-8?B?ZjhFWGYwb1NZdWJlT3Z3T3NwSTRXWk9VNnVwVFRIY1RobHl0Umk3WmpxVURO?=
 =?utf-8?B?MU9lYUJ3UHhiUHFoYjBkUGNMMnBXNnFZeW1OLy9uVVJWYTJuNFdzN1pnODI4?=
 =?utf-8?B?akFOK3I5ZXJiTm1wUGk1WWxsZndET3hsRHhuckMzRm5vWEwxemc3SmhHd0Rk?=
 =?utf-8?B?RnpSQjhIdVZEMEpWa0NHaUZrUTJkaTFzRzZrNDFGMERpcjR0YVcybUJzc1M4?=
 =?utf-8?B?cndQUUFQRmJIN0lDZnpmVGNyN3dpVXJVeTExN3RmWGh3c3B1SXcvc1dkVGJW?=
 =?utf-8?Q?XzMXolqjkQCL4L/2uqWAcOrx6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc16bc85-843a-4dcd-0b81-08daf5579545
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 11:16:14.3042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KWsD6lJ2DO55USZ0NKP5VY5XSFgdSX/npRTmRtgCZxUrcKzTvJN85joIUBbGKTk/QfCk68Tm7MaALb2zrX3nDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8735

On 13.01.2023 12:06, osstest service owner wrote:
> flight 175751 linux-linus real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/175751/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  build-amd64                   6 xen-build                fail REGR. vs. 173462
>  build-amd64-xsm               6 xen-build                fail REGR. vs. 173462
>  build-i386-xsm                6 xen-build                fail REGR. vs. 173462
>  build-i386                    6 xen-build                fail REGR. vs. 173462
>  build-arm64                   6 xen-build                fail REGR. vs. 173462
>  build-armhf                   6 xen-build                fail REGR. vs. 173462
>  build-arm64-pvops             6 kernel-build             fail REGR. vs. 173462

Looking at just one of the logs I find

/usr/bin/wget -c -O newlib-1.16.0.tar.gz http://xenbits.xen.org/xen-extfiles/newlib-1.16.0.tar.gz
--2023-01-13 07:41:15--  http://xenbits.xen.org/xen-extfiles/newlib-1.16.0.tar.gz
Resolving cache (cache)... 172.16.148.6
Connecting to cache (cache)|172.16.148.6|:3128... failed: Connection refused.
make[1]: *** [Makefile:90: newlib-1.16.0.tar.gz] Error 4
make[1]: Leaving directory '/home/osstest/build.175751.build-amd64/xen/stubdom'
make: *** [Makefile:73: build-stubdom] Error 2

Let's hope this was merely a networking issue and will work again next
time round.

Jan

