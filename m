Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DB677F633
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 14:17:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585362.916445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWbvX-0005O2-Ez; Thu, 17 Aug 2023 12:16:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585362.916445; Thu, 17 Aug 2023 12:16:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWbvX-0005Ll-Bu; Thu, 17 Aug 2023 12:16:35 +0000
Received: by outflank-mailman (input) for mailman id 585362;
 Thu, 17 Aug 2023 12:16:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aH5n=EC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qWbvW-0005Lf-3i
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 12:16:34 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20619.outbound.protection.outlook.com
 [2a01:111:f400:fe13::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e6834fee-3cf7-11ee-9b0c-b553b5be7939;
 Thu, 17 Aug 2023 14:16:32 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7998.eurprd04.prod.outlook.com (2603:10a6:102:c5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Thu, 17 Aug
 2023 12:16:30 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.029; Thu, 17 Aug 2023
 12:16:29 +0000
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
X-Inumbo-ID: e6834fee-3cf7-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PAzqPlgDEYZLB9uq5qAoXqnlN+IkQAXl/+bw0Yb7XFHhEeoq2qSNzAwhC8/COwP4xhTAHxuWiUvMg7aYZSGPZTe+EY9bRVIAiFvtvSGEH7bL224z1EwLSQxzzCMmTTuirtgyoAJXyQSGh0oQeSdIjE6LtmV+ZcpRpxJORNgSaESnJt2v0bP0n+/AOW2pNWwKs8veU/B76RMa5tCJ7oLHTOXUI8r68huzsepckG9unUbGb/L4OVi1WFEwLXsFxiZAIXYZkbOe98hhkOV7IdefS8WDpvOwlXzcMdjTM7WxspwDNDVymOlBn/zfiytMo9INNjmmlBegpUMzVx2SJmbw4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zU5Z0i3NUhZdc8tX6y72oy8QApCF0gyU1xHpLeTi4nc=;
 b=j9ArLHGPl+GQBbHy62XfOXHsUe3UFteFz17vYgqiJXJARzfPlFz4rUBnP9XjaXevZ8bK/v8X4DgKigpruYOpwABVvs25ZZ3I8iAR9qRypZJNYo4R0l0d0hqzSe6ZHEYLR+bpwblcumMZdQd2gjKm4kn7/5rWb0CzvPll7iD7rzmiaUTMQpCOH8dxHyA4dgV8/v9IuAEtEcfz7zlYFhDF0yuB9NjPxmPCOBFDYYXvS3JZrpHSDmiOHWxrF08vgt/XCdqqNlprm4X7sFPzrqN9NhAdHtQhZX6uhKUnxml7L2WvkdTobfxp6IFjiRrrt6BVEREMYb75bKmJpyUkw9d7JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zU5Z0i3NUhZdc8tX6y72oy8QApCF0gyU1xHpLeTi4nc=;
 b=HoQEJou2aweZogi8cKxVORcvv4FWOe5EYBC5UZrYZ9iYkntTNaY4apoLDYszmpqJfnyAp8eerYW1xJihxepiDQXJ76XICRrnmXFor4b7+OXWPu+cKzHqHPKTP7k+Pfjf5QShlxV2MmC1YSxdwaSAsims/EBgNmhYyC6/dwHMXJOO1TsdDWT5Jv4thsXkMvEdvRwR+9/H4oWVgqUwMctFXhpus6twRpEUZS3yWJQw0m22BovBLjZ06qUGIGhxuwD1eDco8BFWHqbFON83oa3S8scs46xS7sRlPi5MnRHn5br2ChUlIOI612y5or4kHpieizdfVqC4KDM+jvJwXzx/Mg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e8c8bd8e-7093-8509-4616-ca31e8cfc224@suse.com>
Date: Thu, 17 Aug 2023 14:16:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] xsm: removing inclusion of byteorder.h
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20230816190425.8160-1-dpsmith@apertussolutions.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230816190425.8160-1-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0174.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7998:EE_
X-MS-Office365-Filtering-Correlation-Id: d2aafb1f-93ce-4a97-848c-08db9f1bc984
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CB/olyLvPuNwAF2Cm3fpyzATssFtsfvNiMXgFu235EypfjFrd4kQYR58eOihuFquvPlD8GDC7HyhdfbQkZm17Isjrg6q63kjbvcjGIuI7lDSwvr9DcRIHJeUjMBLgMtjptrVqMdZi2opGzu82Tto2ZiN6jVQVpxFVHpWaWGBHl0fPa8dEmR+eJr6Rd37ZLi0DRCFd0FITkRnLR/eUxu/RURvSOgGKhQ/+dkBXTSeXJJ67oyxl7xl50l01uirjGJjb7ETnwk5Uz2ozFYevwtOoyCLUxLjFH7HDa3A1r07x1eCgATytBpD46kh6QsIYO4mPly0hMPk4q5xVfb+He/mxCHrLlrlorrxhNWwpxS2mzjhHCGsJc92mhT4fChw7UWmZsf8BMFQmL5doNa21yLvKfeio+uG21SSSKsXyeEiamvhG2iuqWJnyD0qHOuHedLvjCVQQNftVTOobBVKMvoKhSRMlND+yVaXgSNHmqI2fMbnyGPIGuZYdFUqjkx9NpXpEAlvmBZC6304kHoYrnaxoUNUh8m8UDHOXvE8sSVcHgMsfSA4QxDe8Me/8lss+lNYSO+RNzDIXmRMm0kPHzay6Su0GS+BnaukTGhCyFf6L1fw0suUAWwL//UDa1t5jEuRNKcfFhK4xPELpq0nMTcMcQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(136003)(376002)(39860400002)(396003)(451199024)(186009)(1800799009)(31696002)(66476007)(66946007)(66556008)(5660300002)(2616005)(41300700001)(4744005)(478600001)(6916009)(2906002)(316002)(8936002)(31686004)(4326008)(8676002)(6512007)(6486002)(6506007)(53546011)(36756003)(83380400001)(38100700002)(86362001)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGRDY2MvV1I0SHJZejcvRms0QWN2Q3VPRk1MY3NQLys3K2R6Smdqdm4rQjBK?=
 =?utf-8?B?SGY4bitUR1NaK1FNenpyWldCWFluTi9yd0VuRjVJMmxzNFJqWWFHcGlRT1Nl?=
 =?utf-8?B?SnpsMjUxN2VXRXU3aEVvQnZhblBnS1BDVHg0N2MvRitiaGlRaTNwUDNpVlN3?=
 =?utf-8?B?eFJ5VTJSUnp2YVVOTWVsbVFKdzVXZGhyK28vTWhkczc2VUJjcXF3Q0VHbS82?=
 =?utf-8?B?SjZsRmtDdGpQVjJVaU96cmwzZlNtNDIvWWJyTU1iSHV5ZU1vZTlWT0xKN05I?=
 =?utf-8?B?UVRYdmh4N3hab1VSOEpYWE9hbExoV0s4V2ZXd2F4cndnT3BISWVyZGVjZFZm?=
 =?utf-8?B?dXVvbDdhaGF4M1dZZzJDSThTaGdQeXprWS9lRndGTjFtTzVONDRZaUVJMUJt?=
 =?utf-8?B?REs0dXVWMU9nS1NCRnBkNzI5S0k3MlZOMExFUjgzejJSQ1lkMk9rMC9pU3pO?=
 =?utf-8?B?YkxMYmJ6OElQR2dqRjVVQ09wd2VrYW1veGF2NkdPUE9Uc0NJek9wS29XT0RU?=
 =?utf-8?B?YXlTcHVQNmFTaXRsa1lFQVpHdzBuWnB2empDNFhnYjhIeC8vWHkxdGc0NDFJ?=
 =?utf-8?B?QitRUms1c3A3aXYwM293VFBTaWZ5Q0k3cGl3OG5iellkdFUzQkpIV1ZrL014?=
 =?utf-8?B?OFVZZ3REU25LRDFjT09QbnVrbkUvS3AzTnRWTnlDU25PNHNBaSsxTWZhUXN5?=
 =?utf-8?B?UlEwbXFFYm5qcUtZTnMxQWpXbW1nR3h1N2FTeTExQk4vZWtwQjc2Z2s2Qktl?=
 =?utf-8?B?Qnl2NGVWQVlQbTlZSW1ueHNyeFh5cEdwTUt3M1A5ZkhIbS9UT0RZUDhMTWZx?=
 =?utf-8?B?dDc0SWlBeGIrVjVuWDRpY1I0Q2RTc1J6Z0FuSU9PZ01tMFZQaEpVUXl4V3pN?=
 =?utf-8?B?cGpuekVURUQ3L2RUYjNKcVdyV3FZeGFVRHA0eTRFaFozZEZyaC9TeU1QU240?=
 =?utf-8?B?RExuTHdzNFFEemptcEhIK25wQ1NWc0dnRWlZMklBZUhNZkdZaHIzdG9WZzkw?=
 =?utf-8?B?WFRvSUxqUzhGRFdjbjJTeG1rUXhFd09CL3IvQmllek9HeFZGRzBzU0krVUhy?=
 =?utf-8?B?d0xqRm9QKzN6SEQ1QndubDVPUnNvRlRaZXNEa1M3OENZK0NUTEFHSHc5OE9G?=
 =?utf-8?B?ZDdocm1MMFMzSEplK1lFUkpTNFJYV0NYTEVsWit6ZVFtSzFHTjhzK0ZYczFq?=
 =?utf-8?B?Qkk4VGIwRW9vTnpSUTJnS1FGRjdYL05OclpDOWYwZEJvc0FUNzQxcVp6U1Vq?=
 =?utf-8?B?dys3NmJqcDJCTDQxVGl0amZ2cm93T2laNlE0bFY0V1pPbDcxS3FieXpZakF6?=
 =?utf-8?B?cTkvREhuVlpQd25VdWxDc2lWVDBtazZZN2RkdnR3N2R0OTFTUElFOVY5NWVh?=
 =?utf-8?B?TTZHV3ptZVpSVlNjN1dqQnhKbHpqWXVjQ3NtanFScHdtRm9FdUs4dmN6elBp?=
 =?utf-8?B?RmFkd29uY0dBUTJTZXArVng0S2k5ZStYM3QxeDhTWDB4bjFHRG1sa3RDUStQ?=
 =?utf-8?B?aERsN24wM0cyZk5xOCthYWU1d1RTeEFwRzR0U1BnUG1VbjRWSkk3VUxZSWZq?=
 =?utf-8?B?TzUzM0E0VW5LU2UwSis1dVJmTHpIM1RYTTNzSjMvMmozM2tUTjNQMnpJdHBZ?=
 =?utf-8?B?WmxaazFVOXg0anpVcFp2NUtMekpDVWQ2eVFPbzU0SFB0OTc5Y1FSUjhwRU5B?=
 =?utf-8?B?UDZranlQazQ1R0xFMUFueHZzODlObE1LMWVXL0JYajhGV2xjUGZwZUlsa2pD?=
 =?utf-8?B?ZjZxeCtxdm41NUY2dW1QajZmVkJsVldmWGI0dDNJbjd3RFREYTgwZDdJS3h4?=
 =?utf-8?B?RlRObVQ0VEU2SnVyQnZUS21OZW9JTFJBd3BvN1ladUU4bCtwMzVveU8zMmlh?=
 =?utf-8?B?ZmthbWUvaUF3bWFEaHkzQ05pYU1xSFlEb0REcmlzV1FmaVNqeEMzVktCOGtH?=
 =?utf-8?B?Zy83MEl0ZEVHZFFkSHk2cGkxOC80MUh1emM5UHpEWldiTFlIN0hnTmpuUHJn?=
 =?utf-8?B?N0lrRG56OUgwVnVtYmFRNU5YeTBzK1FZNlJoTVJiWVZ0Rk5RWE1zM1BxUzln?=
 =?utf-8?B?MllkdnJDZTlkOVpaRDNKeDNFWnpyaVNsTG9oZHRUVDhkc3krTjN2VUVJRUky?=
 =?utf-8?Q?z1EbdSZgz9AlCFAUqX/41nHN5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2aafb1f-93ce-4a97-848c-08db9f1bc984
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 12:16:29.9161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ch9ZntQ8Nu+6F5phndeGt1NSDdLXP2o2R+96r7Zcag3ZxlY56RK1VrudjUW681Uo8nNuSC3XcIj4LGG0ZhwbrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7998

On 16.08.2023 21:04, Daniel P. Smith wrote:
> This is to complement patch 'common: move Linux-inherited fixed width type
> decls to common header' by removing the unnecessary include of
> 'asm/byteorder.h'. In the process of removing these includes, the ordering was
> corrected to comply with current coding style.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

I would have wanted to give this my R-b and put it in right away, but it
looks like it's based on a stale tree. The patch you reference was
committed a week ago (so you could also mention its hash), whereas your
patch looks to be based on what was there before.

Jan

