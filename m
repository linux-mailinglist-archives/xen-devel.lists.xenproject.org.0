Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA9D785117
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 09:05:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588979.920651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYhvc-0004FF-45; Wed, 23 Aug 2023 07:05:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588979.920651; Wed, 23 Aug 2023 07:05:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYhvc-0004Da-0F; Wed, 23 Aug 2023 07:05:20 +0000
Received: by outflank-mailman (input) for mailman id 588979;
 Wed, 23 Aug 2023 07:05:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iSH1=EI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qYhva-0003zL-KJ
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 07:05:18 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69b492d4-4183-11ee-9b0c-b553b5be7939;
 Wed, 23 Aug 2023 09:05:16 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8490.eurprd04.prod.outlook.com (2603:10a6:102:1de::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26; Wed, 23 Aug
 2023 07:05:14 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.025; Wed, 23 Aug 2023
 07:05:14 +0000
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
X-Inumbo-ID: 69b492d4-4183-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BaDHullD8weYvqwg0ymMXMI96/qkfYD7vlRtC5YbZchfa+CFUvGiEfxDFupdAV2rrLvxTmPEcvj72RsbI5Zp199ZAESUx44G8SBXwxUPdqsouaDGMYtMgQoRV5bDifAD2vmj/nTnx95SQJ8Aq06HiqbSKbAxEnEFmYSj/mhxXYmYZUyoWZeXBvxz8uOFhDx5cqQ9Jn4dV4fC6l2XAhzP6qeGLyUOD4+ZuRrIwII1KaipY2lNUvj/b+YG0F1zLiQlU6d66r3JeKGDTW0I4Pah8ttZ2WxbiheoNr7lEad3NC2LVfa0W5rNxCgrzjrf4q1vL0GNmB/Trx/THNt+xlyjpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/H9Ae9YDA4dWnlvhiCra2Zhj/+uJOe6NvBfUyamyDI=;
 b=OHouph8Uspxy0mje7zoo223SA2moGYsx3yCzM0NH9D49UUb0+QrdsQThm08qiLscah5ztHj1V6bjixUD15gHBTTlYjF5cXIAxa5xx3/21kC6XzC+/GksXkL4fxxNpmacMhZpDkgnqUDBENIcrEsdNLMpJqni9r3hcDhLir7guzoxzPOom6rpCD3vyk0RpfPDqaBUKxunJauurd1xB3AJvW/DMHBfMItDkEA4P24YI/tFCgwoMINhMergQqFLJdsw6xpZl7Al2hMvtaD52vH4yEy282WaqkCwkv5/NEIGreH+QfImVazUSM5EzgefLh0gyZJ+sGcWHYEzfpBp6uVazw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D/H9Ae9YDA4dWnlvhiCra2Zhj/+uJOe6NvBfUyamyDI=;
 b=20hGwK/VPa9Zk3a0hpVZh8G/kvPkYf+NBp7oeQEUMxMAhvVYtVNCLSY1UUW7wlXkzDENNRv+X/41jIAuSeGVJSUWhkVG3X9GJnBLvmRsTXbKv9uT99j67p98kXmkilnvbc8eSkGFZAuKl0pUd5BgLllUrjrR8tMBr2hfKWT5Cdlx05rkodtAbemazI+IU8BLz6dQXN7YWwzPAPOaRYIoK6Ba9OOl3/e+SWcL5cF+ovGF/RYRAfp5NBxYVT68jtrj4RhnfLgEoKSmixcsC8l9QEM5lX91Md0qelruxWlvioPEpm0HKPgguGCqIBVj9DmO1pqbyUwhqyQrQYmXAoXpmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <49570fa5-abf5-4179-f046-97bb40614ae6@suse.com>
Date: Wed, 23 Aug 2023 09:05:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [xen-4.17-testing test] 182423: regressions - FAIL
Content-Language: en-US
To: xen-devel@lists.xenproject.org
References: <osstest-182423-mainreport@xen.org>
Cc: osstest service owner <osstest-admin@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <osstest-182423-mainreport@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0025.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::23) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8490:EE_
X-MS-Office365-Filtering-Correlation-Id: 5046b517-f05e-41de-cf09-08dba3a74c77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zrDKxREL4E0opQSfoydz1DCtYGqCpCQdPR0IGCwvcVVBAfZJXUh3uHoqu7HZ8yKdlTPTjl28jqJImH+OXLYm5FcN+E18/BCovoGYESi5QsmP1+F5xUtRS6XbDAY9ZLHJRhIYUO4os/9QR6VZ+3UmgIi536Vj78PWi36DOQ4EJc1ZmnN9QOKIfnaz7y+acEV/j10Y/GRntWCS1KK0+QttgLqf4oyQEO+t3rf01Z8pnKYdGTCo239X8hsFWU8L0GJiPakfzS09bwycgsREkDR0zfSNopeATHw3EvFc8F4W1DmNAZB9tGWF1/2/Ch+0M/w2X+/WBNAqFk/IamcFq6PfOZ+JMDlUCeYFx0SBOWkvRXgQH9p5QuqRD9HE5VVOr7rhgRm8Vp7j6J1fDVJu71+Wl9qBVTYQKlZyds3UsFkMRSZt07M84rqd3XUTNvf6kfdUaKyziEqk/7Vyw4FqJZdxDS6UWnN3t9GDl7wzJV2fPqjrsvHezYWLMFDQP4H83cFFUsnFQp4783PlavqE9msdwEUr/ikgs5v0GaCrO1vC8CqeMQX9cIRoz0h4PRZNXIUiKsX/fjEEQcNqJuiG7nwUpC9TBd8yuEoYHOE+3QzcsDiInV+ydVkJhA/lO1dqV0v/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(366004)(136003)(376002)(39860400002)(186009)(451199024)(1800799009)(2616005)(6506007)(6486002)(316002)(6916009)(53546011)(4326008)(8676002)(8936002)(66946007)(66556008)(66476007)(41300700001)(6512007)(26005)(5660300002)(478600001)(966005)(31686004)(83380400001)(4744005)(31696002)(36756003)(86362001)(2906002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y29oc1pSdEcvakVGTWRab0Q5ckRkQVZyN3doNVBMblIrMDI2T1BkMGhQVVVx?=
 =?utf-8?B?UmdEVVFyb0R2YzAxeWNCMzBkdlp5cXFkSTlpN0FHc2hQSnJMRGtwaHIyKzNF?=
 =?utf-8?B?b2RvOXF3bTNqVzRPSFVwRGFLMFJHY3NkWWRISkU5SEo5Y2UramIxMExITFIz?=
 =?utf-8?B?cUVtcVFYMnIxTlRsMndnNGJmWXp2OHdBUE9BdkhEUk04Q2dFTXMvQndYUWE2?=
 =?utf-8?B?S2o3bmc5UWpabm51clNtdHRNbWI1NG9nUVB6NUFIcXIyMG1MRzMyc0N3NlhB?=
 =?utf-8?B?UXVZZ1pLZU9SYmlNMCs5S0ZZS0I4R3JUblN1ZUVzRUFUb3dXUnRsSE5nUUxy?=
 =?utf-8?B?M25JcTR0Unpaa0tCZkFoY3RqQWxma1FkQlo1R1IrQ3p0dXBubUpFYm5kTVFX?=
 =?utf-8?B?T1gvUnRDZUdFU3ZWc1lkbENETU1IYWNWNmlNZFF3YkRrUmh2cHcxaEx0WGRP?=
 =?utf-8?B?VzA2QUoxVGlZZFBsQnluMzc5YnhHRGdIK2NjYldGWGNEMndFOVJ0Ymlmek1R?=
 =?utf-8?B?aXRsWmZVY2ZMbGE4UGdBYTJQZzNqb1JtZW90bHdZUmhHaGlReTJvbmFYeEwx?=
 =?utf-8?B?M09zUlZoVGRtSGgxVE1lai9BMEp2bk1KdklkbzVYUm8rcGdnVHVDNnlBNUM5?=
 =?utf-8?B?WTRCckp0Z1dIMHlGdW9hVDRoazYrWTlVUmFMNk9kQTR1WWpEeGJ4cEwrRDN0?=
 =?utf-8?B?UTJhdzhsT3JwUWVUbE5nQ1QxUXIzbFYxNlVweVNGaXJDRUNJMjhGK1Brd1Y5?=
 =?utf-8?B?ZHNsRVpzUG1VbGhLZUdsdUtHRnZCUk9OcDVBQkpYc1l0Vlk5M0tlNzkvejh6?=
 =?utf-8?B?OVR2OVBPTlpub1pKZlZWcStkdkRCcXJnRFliUVk0Q2N5bCtHZ05aWkRUKzV3?=
 =?utf-8?B?aldJUkdES2VxZ2hHWGpCK2diYzVCbS9lekN6RUZYVTRxRUY5WmVGRVRWSGpE?=
 =?utf-8?B?QUhlVEljbEFzY1hwZW55azErOVRVQis1eXJ0bEt6Y1FqZnJEc3o3K2hHZ3M3?=
 =?utf-8?B?Z3JOM2F5KzZoMnJwRUYzOW93d0J4ZlRaWm4yekdDY0lsdUZ3cCt3ODJGV0l4?=
 =?utf-8?B?eDNXU0Y2azVBTE9UbURZUFBkanhYYW5rRitaSFR2NVloek9Lekt5eklrdnpl?=
 =?utf-8?B?UGVWMTdSRW0rTll3QlcyME9nZGdtUUdoSjlQb1psN25sYnMvWVZ6QzRIOGVa?=
 =?utf-8?B?aUxMOGQ1SlJvdnFJRVdXUmU0UXZxb09iVU52TUNUdGYzbFVDdnFYTlljYVpN?=
 =?utf-8?B?TitkVnhONmxpZ1VlRzlsRnBRQlIydVdnVHFVaGFGUmI5WVZFZ1JuNFlkNmlj?=
 =?utf-8?B?VE1lYmxYNU5DWUxUMmxTSmdOS2JQakxuZ1VLUGZmcWZqMXVsWnpmS2t5Q1kx?=
 =?utf-8?B?SW5xcnRTU2R4bUhGWXNYUWJzdGxjQURsSmxyZVVRcVV0TzlJekFQdlpQOTVs?=
 =?utf-8?B?a2QvRStaNTN3VlFXVG1VYUoxbDRjd1BJMkhtSWZxRGxZZzNxeXdETXZycmpR?=
 =?utf-8?B?Rk5vRTlKZFhqT05tRS8rYUt4SlQxMGRvUllidFZ5RyszaVNEZGhMZHkxd001?=
 =?utf-8?B?Sk1JWnlld3dNT29DMHZ5LzhTL21XWitwdFEzUGZSa3pPeE1NYmU2QUFnV05m?=
 =?utf-8?B?SFhYQXc3MEN1SXlScExIQS9RdERDK3JFeEZSRFNXR1djMDRYQjdtZHNGZWl0?=
 =?utf-8?B?WEFjNlVkNmhsR3UvUU53UFVZRThYUG1pS0ZmcXYyc2NHQ0ptNmNTcitCUWMx?=
 =?utf-8?B?MTN4bm1JcGlEZXQrb3N0NCtES0N4SGJTa0luWXpCb2xJUEVIT0F0T1lRS0Y4?=
 =?utf-8?B?YUU4UklWV1pGZ3dUak9Ra0w2SWhUa0tWSEo1TGlqc1pVWVUrbDBoKzQ5dzc3?=
 =?utf-8?B?TnZSSWpqVjFoazV2RkV4ZGpzNHI4aVFscUF3MHF6OU9SUEh2cWRPenRHTTUr?=
 =?utf-8?B?c3NlbHByRmIrZ1c0VmlVWStrTVRPWFlGaDBXdHVKWGU0YlM1SU9hL1RHRDlO?=
 =?utf-8?B?TStqc2ttMm5NZ3FYVU1LM0NHSmhBLzhPWkl5SHJHZTlqU1FOdjE4T042VHIx?=
 =?utf-8?B?K1VlUVh4dUFidnBqYkhKZ1RKZkVSNlFaOCtsRWlrdzcyb3F6MHpieCsxZFVv?=
 =?utf-8?Q?U7YDYgbHgynsjRw+3yovtFyhj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5046b517-f05e-41de-cf09-08dba3a74c77
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 07:05:14.2065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ha6T+/LnP/ODzXDoX1T/wO9RDEBoZImIsSOf30XhzuDsKOqe9jvkXWKUo85Rjh9iNUWpqb3uJJV0e3zDOTD9yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8490

On 23.08.2023 06:32, osstest service owner wrote:
> flight 182423 xen-4.17-testing real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/182423/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  build-amd64-xsm               6 xen-build                fail REGR. vs. 182410
>  build-amd64-prev              6 xen-build                fail REGR. vs. 182410
>  build-amd64                   6 xen-build                fail REGR. vs. 182410

Looks like an infrastructure problem at the first glance, as all three
logs have

Timeout, server 10.149.64.36 not responding.

near the failure point. It's also at the same instant (2023-08-22 18:12:34)
when the failures were detected in all three cases.

Jan

