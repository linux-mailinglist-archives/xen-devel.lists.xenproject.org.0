Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A70CE73B250
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jun 2023 10:07:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554305.865428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCboz-0005T8-G8; Fri, 23 Jun 2023 08:07:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554305.865428; Fri, 23 Jun 2023 08:07:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCboz-0005Qw-D4; Fri, 23 Jun 2023 08:07:09 +0000
Received: by outflank-mailman (input) for mailman id 554305;
 Fri, 23 Jun 2023 08:07:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O1Yh=CL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qCboy-0005Qn-6c
 for xen-devel@lists.xenproject.org; Fri, 23 Jun 2023 08:07:08 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20601.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1c07914-119c-11ee-b237-6b7b168915f2;
 Fri, 23 Jun 2023 10:07:06 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7822.eurprd04.prod.outlook.com (2603:10a6:102:b8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Fri, 23 Jun
 2023 08:07:04 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6521.024; Fri, 23 Jun 2023
 08:07:04 +0000
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
X-Inumbo-ID: f1c07914-119c-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AhgVaiF/RoEezvBYgNMU/o8wy5frBJ94LNAPYlygXOw5SKEA70vJJBkfXGyxiP5WakRwwugYCbD+dax3+Any5MxVQOYqU6wYYCd7a+0leRMeTr3Tngl9eANJ719MtDAS+sAIZjYlJFbTY4igE0AkRUfIAMV3Z4qMqvge2z9661FdQRD7ZUSUSY7KRzVAKbRM1pwmygZjey/K7Mt2yiJtoXVHpyH/kyadj0FvNzoTpHJDCLmP7Z2MGAmwmh6gTSPdEmdAkcEwsRueW58cpCeiyhtnm/OMDgi6erLTr4PCV4jw6ozIoVOccQDaixt2jyP0q74pGqvsVR202nNMURXwjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K50uk+KgZD6sgl5v5QAF5/v6VfhZfN97VSZaBiXdcdI=;
 b=QaNWTQmisTRwxOQIAy1M95Gta6X1Ker0bJnTt+OvsS3q7R7knJGDJNRlwBw28q9vJUYDj3s+xhM4HWy9cC8khnGUnbIwwVPZIVbd0xwWr4oexfba6XjwjgEM2M+hr1Q4iF7x8yggt0sJjseWZjUcV0spBanjqYoRIaT48zZdgrzSi93AaIcyJ8BYdSbI3Z2yYjy0fNkq1YLMDTApM7s+sHkWJTGGw9I+rq/82NO7Z9moioPrdoZVgyC0Ew2xiv4uoKTy8V4B1AhWy4W2M1B7ywPyex/k+XFQjLzRXhIhAJBUUWZP0Zu7FCtnfuT/Cuqvyc9bs5bD+Q8SLrpIX2ZP6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K50uk+KgZD6sgl5v5QAF5/v6VfhZfN97VSZaBiXdcdI=;
 b=TbX8LJfW4ufzS/NMzP7SGxzHqQO65XXrFajzz4K3PaDgopaCoyd4q3lV5CgyY9dD3Rq9uRgSMcY79UoBegIbCK7E7KQ95EWvZF4xVuV5Z3+lLZM5Sw3Vsx7Pve/ARt/opl18v9Ry0WsYw3Zcfpi5j39XhogyUgQQGNpZ1ZK6BxT0e4ejZq4Rohx03+NgMSBQf3VRDg9d/0y5lQFoYgc9DjbUUSbYUtuOc3C5a2jMRh3GXzYMshM947YbngjT8LhBdEuP3cK+VyD/TwePHsO31TVkiu0CGwCqrPGFlBtTENXNTw6DWXm+1tXJOrIfKwBwX5alAXexEvanFhRJdjYOsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <edc3f2b5-8722-7f11-f759-b87d71a840ef@suse.com>
Date: Fri, 23 Jun 2023 10:07:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v2 4/5] build: evaluate XEN_BUILD_* and XEN_DOMAIN on
 first use
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Jason Andryuk <jandryuk@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230622153005.31604-1-anthony.perard@citrix.com>
 <20230622153005.31604-5-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230622153005.31604-5-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR04CA0081.eurprd04.prod.outlook.com
 (2603:10a6:208:be::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7822:EE_
X-MS-Office365-Filtering-Correlation-Id: 6caddd1a-7c0d-4903-5b86-08db73c0d497
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Kd6CxN22HrVbpFFsqbC6Njo1RGryY053pm75C4LVpqzlqFZtleBAkrmd4VtK96E50B9MGXzd4NLY7/zwnWoEv4vJE31TjydDX03Vkv2B25YQnyaXHJ0ZjKvniAphqGVlGZDmOZMYaE41pdfOIrxwVYCAXeb/3AMNkwo0tJrGvL9nkuzSf/Rg+7Hj1g9cqFB+T0XWJsBw0eli4x+Y4OvwXWyH932+z3o58/UXEeNyIZ6LGdVgTbYBBb5enepQfU8Vdd03BupRs+jFiQZuHYmVhwz1XACkv5msQDYq0kGC/j7ftrdxSfa5eTnNTgavSfElVTOAJ70cTPeNFDnEBQPlnsdkCd1uHdux4dnWk5Lx0YOrM2gour7pvfkwshdWONfYWCKnTn0t5V0SawN3OztErud5jt8VOlGqkHWmr0Rnpwj3VT/LzdsE1m8LVp803Wh/iPg/DFfg0f80bABSYQBFT+QRBunh+Vo2g7gkcqRR/rv+W/EeQCKQvVDI8+DWHhsvkO0R02uOb5C7lUIaHyB6DO4dhbfrnH9lsnZOJ29UQ6OGu8pbGMEOJVzNrLqy5DBYCL9rjFyqih2iq0I9ogSMCoHlzi/4joeG8Kgh8mrql7XZ2ZrjyClq2Ca2h/DvN6uuTdFXyi129F2T1fO+DS/FMA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(136003)(39860400002)(346002)(366004)(451199021)(54906003)(66556008)(5660300002)(8936002)(478600001)(8676002)(316002)(38100700002)(4326008)(6916009)(66946007)(66476007)(36756003)(6486002)(2906002)(41300700001)(186003)(2616005)(26005)(6506007)(31696002)(6512007)(53546011)(31686004)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlBKa0wxaUFLUDVVQloyNHZ0QlVDcDlWSnhpSnBKbHVQNmpNdzBVbmN1TmFS?=
 =?utf-8?B?a2l0ckRTQjQvU2JvNnNlNFpsRG9GZS9IZ3R0amh6eFgzOXNMa1VMNWhTZVJ4?=
 =?utf-8?B?T24wVlJadjJMZUZTaUsvdUpqeXBnUDM4TExDQ2ZUUG9rOWJOYVRuM1YxVXlz?=
 =?utf-8?B?ZkppTE1tcGxIM0F6Mmt6Q2U4UnpVRXd4UGhhWFZYaUcyOFpKeGQxTWMxcE5z?=
 =?utf-8?B?RXRFZ3FnSkU3bXkxeE1GejdWUjRpZnM2Z3NOMysrRzNxUWZ2dUFVRVlQNzM2?=
 =?utf-8?B?Uk9yMUFiZDBwMXNDUENHbk4ySFUzamdJWFFGQSttNGwwVUwvY1oxNXZ1VEh5?=
 =?utf-8?B?b0hkM3lPMGZ5NWNiVTFXRTJ3WSszd2M4d2pCVEJjZWNLc3NvbUxpcjB2aFNK?=
 =?utf-8?B?UEUvR1dQS3hFdXNZd2JTbnVTaW1yWnJPY2hqSWlzVCtjdGxsaDVJL1FvTUtZ?=
 =?utf-8?B?c1hLVy8rbnl2Z3k3b3NLRzNlLzhDUGRYVy9RRGZPOUlCUzRBbjJBQ3V4SkU5?=
 =?utf-8?B?ckJVRWZ5OWM3QjNUT2JEMmFwV09CWHFLVUwvbktUc292dGhNa09FOWFyQkxV?=
 =?utf-8?B?cXJzWUxMRHFNb0d4M0lGbnNIOVNnOVV4QlRkeEVxa0s3Qnlia2ZnYklaVXhV?=
 =?utf-8?B?STV1dWNPZm1MMW9mYTF6NU5DVDlQeENjYy91SkJtWkdDOVdZK1FmNUl1NnZ2?=
 =?utf-8?B?MjVLUTQ3YVU0WHZBZGtpb0NaRk5sYk9XQUwvaDU2SloydzAwR2JxQzZDL1g0?=
 =?utf-8?B?c1VIMDZXMlhnMEVOV1BDNkZZZXN2dE9TcmIyL2RJMG1wcUh4bUJGWjBmSjY3?=
 =?utf-8?B?Z2xhb1pVQlRtS2VORU42VGgwRzJkVDg1MitzdXVwTDBNc1RkcVJNNHdIN2I5?=
 =?utf-8?B?T2c4dDREcTdHeDFqRTJWc3RMK3haSE9mQWMxZkEwSmFabnV5NTl3N2xHSkRJ?=
 =?utf-8?B?L056SmsxV3I5WmNNMzgxbmRuejVWbzNpbHRoZEdqN1l3WXozM0kxYVhMeTEy?=
 =?utf-8?B?Q2ZuRkZSSyt2NC9ybUIzaStDNElGUmpBV1FhYlB3UW9sa2xCLzFWdkU2dVZG?=
 =?utf-8?B?aXQ0bElFRS9lRUJrUno2U0VKWUIyNXdnV2JUVW1kenV1MWVQWjFuMnAwWVkz?=
 =?utf-8?B?RHMzRi9DZ1Y1S2xmciszOWg1RlFTemFtTVlwQU5KZDBjTm83OUE3bk1leUJz?=
 =?utf-8?B?Y2x5bUs0VjZ1SmFVQWoyODNZODEwUVdlaDlYaGpva2NCeUVBT1pGSXFNTnBJ?=
 =?utf-8?B?U1BCT0RwY2s0ZS9CeUZubTRyMFJHN29WT090UE0wRDJLcXVGSU40QkxLcU5q?=
 =?utf-8?B?SG5xcU5ZUExWVlFUY204MEhRZDZMNks3ZVdJL00rNmZwOU9kU0tvZFJSczA5?=
 =?utf-8?B?aEtCL0ZNOUJVN2lGRHRYNTIzNFpLZnJGSmYvOFgyd1JROS8xdUk1MExiNkJi?=
 =?utf-8?B?b3JkZk9aOTFtb211N1Jkc0NrQ2t3OFRiSXJHcFFYVVdiWmZMVjdXR1JodHFs?=
 =?utf-8?B?REZ2SnhJQ2w4VkRSeFp1bDJZY2t2ZSsxVW9vaDIzeERjQ2hDaTNEWHV3b005?=
 =?utf-8?B?Y24xVWhuRG04UDU3Rmo2emN1UTVOZnRsVHVrREQ2eFpZZVZ6YW5LYzcwRnh3?=
 =?utf-8?B?RDV1VnFhOHMydlJlNWF6cERzdGgyTnUwd3pNWXU4Rkl0dU9tYld6cWVqdHhm?=
 =?utf-8?B?Q3ZEdkorcElnQkdoa2FSN1c4cWhjeWxaMTRQZFdPMmF5czhnRWRLSU9PQmdp?=
 =?utf-8?B?OTFYeVorZWNxY3N1MUxpMHBkTVlXaTlMVTNlSDdEbTJyd0NHb0k1WWtFNVhi?=
 =?utf-8?B?c2FtMU9RTmZkd0FMVmpSQ2k5QXZRUENOTkYxeGpsUGNPTzZraEtaNFh1NlR0?=
 =?utf-8?B?QkJxd1h1UnBkc1RXWk5Yb1BKWmR2N0JibStlZWRMYkU1c0xXWEg3dnI5Z2xh?=
 =?utf-8?B?aFQxSnBuMWRKdE5LYzVoTU5ZOGYzakZCK1dNcThNdkh4eXJxSHZETmdqMVNo?=
 =?utf-8?B?a2FyL1NyVy92aEFFN2J3R2VkeTFsa25kQVg5SmNrVGE2cG1ia1Q0QTVTNUZh?=
 =?utf-8?B?d2dhOWNTanFLMlgvRzN2SHFJQVM1S05DYTlWd2RjUXVFS0NVbEFMTCtUUFF0?=
 =?utf-8?Q?+bP1oMlaahlw1J7mG9t47bXU4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6caddd1a-7c0d-4903-5b86-08db73c0d497
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2023 08:07:04.2013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PgzR7NgeHwAzUdXzqWSGZn05aQH2O0ZoAGfu28BRS0kb2eYJbXM7tTvWZ9HEJFNf3kT+/+Ua5NpTnPjC58QNCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7822

On 22.06.2023 17:30, Anthony PERARD wrote:
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -11,10 +11,10 @@ export XEN_FULLVERSION   = $(XEN_VERSION).$(XEN_SUBVERSION)$(XEN_EXTRAVERSION)
>  -include xen-version
>  
>  export XEN_WHOAMI	?= $(USER)
> -export XEN_DOMAIN	?= $(shell ([ -x /bin/dnsdomainname ] && /bin/dnsdomainname) || ([ -x /bin/domainname ] && /bin/domainname || echo [unknown]))
> -export XEN_BUILD_DATE	?= $(shell LC_ALL=C date)
> -export XEN_BUILD_TIME	?= $(shell LC_ALL=C date +%T)
> -export XEN_BUILD_HOST	?= $(shell hostname)
> +export XEN_DOMAIN	?= $(eval XEN_DOMAIN := $(shell ([ -x /bin/dnsdomainname ] && /bin/dnsdomainname) || ([ -x /bin/domainname ] && /bin/domainname || echo [unknown])))$(XEN_DOMAIN)
> +export XEN_BUILD_DATE	?= $(eval XEN_BUILD_DATE := $(shell LC_ALL=C date))$(XEN_BUILD_DATE)
> +export XEN_BUILD_TIME	?= $(eval XEN_BUILD_TIME := $(shell LC_ALL=C date +%T))$(XEN_BUILD_TIME)
> +export XEN_BUILD_HOST	?= $(eval XEN_BUILD_HOST := $(shell hostname))$(XEN_BUILD_HOST)

Interesting approach. It looks like it should be independent of make's
internal workings, but I still wonder: Is this documented somewhere,
so we won't be caught by surprise of it not working anymore because of
some change to make's internals?

Jan

