Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAFD5B3339
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 11:15:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403984.646277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWa6a-0007KQ-7j; Fri, 09 Sep 2022 09:15:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403984.646277; Fri, 09 Sep 2022 09:15:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWa6a-0007IF-3B; Fri, 09 Sep 2022 09:15:20 +0000
Received: by outflank-mailman (input) for mailman id 403984;
 Fri, 09 Sep 2022 09:15:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Oy8C=ZM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oWa6Y-0007Hz-Uc
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 09:15:18 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140070.outbound.protection.outlook.com [40.107.14.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eab91472-301f-11ed-a31c-8f8a9ae3403f;
 Fri, 09 Sep 2022 11:15:18 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8753.eurprd04.prod.outlook.com (2603:10a6:20b:42c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Fri, 9 Sep
 2022 09:15:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.019; Fri, 9 Sep 2022
 09:15:14 +0000
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
X-Inumbo-ID: eab91472-301f-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GfOeb+rCDuOxAU76nqzl9PtiYkJsIQz3ia16+n0OyGtcppP7xSBeF2meU86F9BKYJmK7nOnEB+fJAnT2PWlMYOAK7p59571pTMxg1yjvPZkvT9nQTBFDd/Elux3XP3a2GRb6FDJ+o+Ppkrd7U9ExcFIc7TqltUe17VdzwcTI2zptia/tOK6AsmG8hKAHAI+cX4BdWb0iLsmBTtje5uOTp6n5ldneome3Pq31DMU5Hgj5/BB84/M7r0o8wuQiZ9onnBTWQd+qnzh6+Gcxm/udOPmZLYUcV+0v4u6vtnFFF+ZC6gA8yfZv9H69sWeWvPVb6XbDWeVfz3xfZMVgXIJQKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6mawu4IQVyG0TwWaH5hY3MU3pQjCiPLg99tVXVJ98VI=;
 b=jqtoE8M0oWzLyqVU3pFjnqW7AhEYKOIc21CF4UdjS6uSSyvmV2JlKm9QPILoqMIWuLSuD5njQ1sOXbpinYB7TpA4gZV3W3jo78Kgmyie8v7ENA53AItsKFvJYO59fS3df+YLujMfOnL1RUVJXSt8LIkPwno7ZaIIL4Zc5H/m81leKCN1mMcUgTHkOdfh1a9jpTUpg/exgjGEMNpMknMiBNR5n5k7+wxgOESIz/m3ASdhHF6tqAIX7Q87ivXwY95jieam3bdCS87qxSW2TN0R/GPfhMmp7owf6aiLvbqiHk7Ma/fkaffYS/7Tn0a8OkRSekNf1cj/zBy1X0uaJwCRxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6mawu4IQVyG0TwWaH5hY3MU3pQjCiPLg99tVXVJ98VI=;
 b=puNAHjR/hW70IjlHdeRuID/KpjDw8P4bwNGswBYXCusBP17TOHCJTytBJ2e0WseXnXo9kFAkz33m6l5gV3iwaVlXuOqg99QY0T8nbzZUxNFQK5XE/nANrkiXlPGInWijd1ckN+ZS+dE4UIzZXjDtBf0n6JBa0bwey7SwkOE5n3FrCw23FLosdq9l4j/czvIcj9+2S6HYv3UVtKQEIYMt6iWsSR2NZr+B65yGa9bwY7TBMaLPdJRPXj0znbhIqoRYGlTzH9f7BNEjgNK/9yKUVJRJPU99EyPhXhrOHIvf04T+GPgFPBoXWPOU8hK2tOkaGoXiug3cKW4GDYU/QoBmOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <52ff1228-3092-c455-479d-315a16cfaaa6@suse.com>
Date: Fri, 9 Sep 2022 11:15:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] xen/gnttab: fix gnttab_acquire_resource()
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Henry.Wang@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220909080944.28559-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220909080944.28559-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0047.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::35) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8753:EE_
X-MS-Office365-Filtering-Correlation-Id: 47466285-89ff-4abe-f239-08da9243cdcf
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	++oeZGF1UabA7Zy6rZU1IQLEqCxzJjKqC8Pfc1yIsR872nOPEpJ8YHegwK8KL96EnenaD9uiK+cDDBfqZk+UAn2QTK7IoMMccqHlFlwcXhrqI4LER3VYp+/x0Id3BiOULvJnLuNvYsCn9Qy5RT5hzeHnceoK29dlPbZK6ZoP3lc8fd1r8mZIteLKPpiWm1mxhE6aZBxz3hw/fytKdAUU18COcdhvFy9+Cj+LniqHzpv/fWzutMU9uyRs9kcQh+meViVKyEeSrzeiesedLdhHeLa4qpjDYnaNY2NCRmkRQuWFGoValAklrGc57/7xcPbfKPPirbUc2l7GgsYYKjdGetixhjMGyRUW+EOFAjH7LvvYouzDHJnYQSfs1Y5pFFRNEr9f/1dVS1TzlxK/KE1pCeIzhCymKzN5XrvMwC5XPRZ6FLfl/D1Y04I9G6zpeYjGtIFFTjeYUIITrvxIgEw5L6RJChp5TMAuetnKqdjhRiHa2xBzVKk756l0QG3u8FrPyE6xRquoQCfX9l8dgERXP6Hm/14rBkxb4HNcWhs0qJjMIdMzmzQBQuV5si5QXS6+N8lFAOxNFpNqtbXNWyp/B3mleqo9P30/VlVjm4i2E1e7xlATVWfIqamUPtv6Z4t13aDKyl1E8/EqSRcBv1s6Jf3fbvhxi67t85jhZlHSEsF3bINfg/cxLTjQBYJ3viF3OPEk4yW/nUmNymm1aFD5IlMxzTMpl97IAFJ/r15VrMYvYNrm6LNAoczVCmgd8k73DvCas2chgaPINpDFOX/wCupHFOM4vdbKQIIONPXfZfw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(136003)(366004)(396003)(39860400002)(346002)(4326008)(8936002)(38100700002)(8676002)(31686004)(37006003)(54906003)(316002)(6636002)(66946007)(2906002)(6862004)(36756003)(66556008)(66476007)(5660300002)(6486002)(186003)(478600001)(83380400001)(6506007)(26005)(6512007)(31696002)(86362001)(53546011)(6666004)(41300700001)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3B6WG9FNGM5MW5XNFlXaCt2VE9KTTkwK2FldXdMNkVTdHByUmNSVnplTEY2?=
 =?utf-8?B?Y3ZlL3lJbmN5c082QW16dWFTUm8vTHRKR2RRbFRva3BVOERUT0FmTUc5RUZ3?=
 =?utf-8?B?eERTVnVKVDRQTFRCbG9zc053cFdVTVVkYjErUlR4b2hPRFpRM1BJWGduRDN0?=
 =?utf-8?B?aSsrNWhIeDU3UnJvK2o3Rm5DUGRraFhvYzdtLzU4d2xBbGN3WGNjRURxWEkx?=
 =?utf-8?B?K3ZiaTFJb3J0TEhWWlAyNGdhb3Z4NlNPKzZtSzF6MmZNQk9kYU1DcmxHZlRU?=
 =?utf-8?B?bGlJVThiQVlNeExwR0FLQzVTYm1BRG5rcXYydzdocWIrK1JWYzBGVVdPL1FC?=
 =?utf-8?B?c1hmQ2p4UTlXN2FRb0l4VkFhZkpaa21HMkZtOHF4SlRUN2ptLzdSOExmN0tq?=
 =?utf-8?B?dkRlOThHcStPUEV2QUwrbGwwMEx5MHkzcWp0Q043K1RSd2lxbkVxR29naEpI?=
 =?utf-8?B?b3d0TWNaMy9UaytNYnR4ckdJT1ZDUmF2Z2Z2NlhMem5GWkdyK1M1dW5zZ0dY?=
 =?utf-8?B?SENhelU4ZUMyeVdHekJoMXRUOGtYTithUFp2eGRUaFgwQ3ZiUmQwVzJnb2VR?=
 =?utf-8?B?WnlUajRpT3F3dFRwbGdveGRvcU52c3Z1aW13OFdGWVM4WkphZnRMcGM3S2px?=
 =?utf-8?B?NVYrOUdVbDJLcm81dlEyWVFxbXNSclhqSk1BREczTTNRUDlHbXdyaGJnK1BW?=
 =?utf-8?B?QXgrUldpSDJxejE4S2k2ajNGN1QwUlJ6Z1Jrb2ExdHpZMXp4ejN1U1FSWFFL?=
 =?utf-8?B?YmpMcEFnM084OVhUbEgyR0xFOVliTDlhenozOWZpSCtOay8vRWlnNDdTZGE2?=
 =?utf-8?B?anYwYXNXYUV4cnRHTzBCSGNEcTdqM0ZHbW1BamltY0FxTzdpWkV1OXpzWWY0?=
 =?utf-8?B?Q09ZRW53MTdOZm1obk5OdnJ3YklWN0VuUlJEcHU3Ny9ZMUh3aFRoODFJeGNB?=
 =?utf-8?B?bk5tQ0l2ZWFJeUd4TkxhbCtpNTg4aHZ3cTNiUGVVcmJmSzA0Qm80cE9QZy9X?=
 =?utf-8?B?aVY4ckFiMEV1U0U5NGw1NDNWVXdnTDZKbE9TL3JYWTM1TUdjM2xiRmpBRllk?=
 =?utf-8?B?bzFvZXBscGxzMHgyMHgxb2QzeFdaVm9qUFh1QmZuTWV2RjhkTVl2eEZnMldZ?=
 =?utf-8?B?c0ZhYlczQ1g5SHhiOENtWDdLTHdjN3Jzdm1YdWJYYXczK2FFRHNBZk5kWWJI?=
 =?utf-8?B?bXNwUmIxTWVXaElSMlNjd2wwaUVBZE9ZZ2MzM1IwTFF6Vkx0ZUNDYzAvbW8y?=
 =?utf-8?B?T2tzSFlTSFdFTlJHRkhlczJ5TXNZTWlYS1pyb2hjRGFuYmhLUVIwQzBteGQ2?=
 =?utf-8?B?cVQ4WG1vTkZoT2l2OXVIa01TUnZuemRnYW5KbEJOUDA2L280TUZpVmc3bFdL?=
 =?utf-8?B?bTlQaXhQQ3lkQnBNVnRJZkJrV2lPalZXeEVwdklNR3ppVXhxSlRJNmEvc0lz?=
 =?utf-8?B?NjAzbVNWZis5a2RrRENBc1J1WHZtM2dlZ1pncXdRVmNkZmVxTU9OTVJkZUlE?=
 =?utf-8?B?TmpwR1BUSWhjR21HSnZUeHJ5eXM4aGgvVG5FV1R5QzNRNm5GK3hlZng4VTJU?=
 =?utf-8?B?VE9GUjBTWGxYcXV4eTZNdy82UUVhQm8wdkdPSkdjdDJTdTFWbjdQTDRQRE1H?=
 =?utf-8?B?aEtQSWlObzJQSy9wK3ZzU1d0aHFRQm1SRDZ5SFhSMlkzSUpmVFRENWlvR2Fl?=
 =?utf-8?B?cUdQREFyazBBNnhLdkt0Q09UdUlocU51dzgxZjl5RCsrU0ROYmRwYmR4OW9W?=
 =?utf-8?B?TkgyQWhRWWU1QndOOVBpNDlNdGxKc0d5ZDFUTGg5Z0Z5dFRxL0Z3dFZsTkJF?=
 =?utf-8?B?c0R5WUk0Y2Q1ZnhIazlkYUg1NHh5NHlqRXppdnpDcTB0bllxbTR4eUpyQmhC?=
 =?utf-8?B?THBZdzlFWjNwdHRPTkd2RDdpZWk3KzBEelk3djRnSThaSjFjM3V0aU5rTzB2?=
 =?utf-8?B?MUNaVGFaQThUSnJJMGRSZmRWaWJvR0JCSDBFeWI5bmZjVlRZTCtsT2dmNXl0?=
 =?utf-8?B?ODlrY3A4VlJzZ2RMS3p5Ym5majhKb0w1VXJsLzJWYk45L1EvRmJIdDl5N2JP?=
 =?utf-8?B?dzQ4V29UNlRQaGJIblM3QlQ0ZlFSbVlOSHJvNldTVXV0Z3RucEllMHJuTUlj?=
 =?utf-8?Q?/GOgn/Hr2kYHKdLKhe4AIWl03?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47466285-89ff-4abe-f239-08da9243cdcf
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 09:15:14.1017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wEGIkytNAclWx67cs7fRkWhhSjsZm4ofzSGcEny1BH5g2trE/Sb6jmz5MMQrZ7U91SjBOx9W0T0Nv0PO+STIvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8753

On 09.09.2022 10:09, Juergen Gross wrote:
> Commit 9dc46386d89d ("gnttab: work around "may be used uninitialized"
> warning") was wrong, as vaddr can legitimately be NULL in case
> XENMEM_resource_grant_table_id_status was specified for a grant table
> v1. This would result in crashes in debug builds due to
> ASSERT_UNREACHABLE() triggering.
> 
> Basically revert said commit, but keep returning -ENODATA in that case.
> 
> Fixes: 9dc46386d89d ("gnttab: work around "may be used uninitialized" warning")
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> Might be considered for 4.17 and for backporting
> ---
>  xen/common/grant_table.c | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
> index ad773a6996..68e7f1df38 100644
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -4125,7 +4125,10 @@ int gnttab_acquire_resource(
>  
>      case XENMEM_resource_grant_table_id_status:
>          if ( gt->gt_version != 2 )
> +        {
> +            rc = -ENODATA;
>              break;
> +        }

This path is supposed to produce -EINVAL.

> @@ -4135,17 +4138,6 @@ int gnttab_acquire_resource(
>          break;
>      }
>  
> -    /*
> -     * Some older toolchains can't spot that vaddrs won't remain uninitialized
> -     * on non-error paths, and hence it needs setting to NULL at the top of the
> -     * function.  Leave some runtime safety.
> -     */
> -    if ( !vaddrs )

I guess this wants amending by "&& !rc"?

Jan

