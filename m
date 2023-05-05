Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D08926F839C
	for <lists+xen-devel@lfdr.de>; Fri,  5 May 2023 15:14:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530347.825926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puvG0-0007kf-14; Fri, 05 May 2023 13:13:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530347.825926; Fri, 05 May 2023 13:13:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puvFz-0007iG-TX; Fri, 05 May 2023 13:13:55 +0000
Received: by outflank-mailman (input) for mailman id 530347;
 Fri, 05 May 2023 13:13:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9G22=A2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1puvFz-0007iA-1i
 for xen-devel@lists.xenproject.org; Fri, 05 May 2023 13:13:55 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0629.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aeaa9810-eb46-11ed-8611-37d641c3527e;
 Fri, 05 May 2023 15:13:53 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by DU0PR04MB9321.eurprd04.prod.outlook.com (2603:10a6:10:354::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27; Fri, 5 May
 2023 13:13:51 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7%7]) with mapi id 15.20.6363.027; Fri, 5 May 2023
 13:13:51 +0000
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
X-Inumbo-ID: aeaa9810-eb46-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h1Ns65s5gzk3qVBjgG/e7doc1RcFesMfvCAY+ZYh5bF8O7j5WOVDj4ShIjE3THNT6Lg6k6QGxIcXA6kw2knQn9qxohiNgxBUG64PcDlBSBQBy+9iU/zx0Ol4TkmHU9vU06ydbXcDsNvRyhqYTq877GuhpITUnnD47q1xlmQt0azr0CiVTtPwULV6XAzT5JpyYvEhVLRd3GUWZq9Tm7WO8BU/ORFvjJEdyR7ZwmdZSD/TGbPT44do08eF0CdsO1lVV/BvTdOwSp9DUzgdy+rxYO5NVvgp4wp8wkxZK1w/CFRZWBn0cj7gVDneTFC/Mftm1493tRvSdRg42EALbib04w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sy7ekOGL7Ui1hZMNT3Lmp3AyM0dO+DQEghWHmulQAgA=;
 b=lkzAyPg3Nm7Hggv0ujhinXZ+KC3RpLBMUkdcO89ELUMHPHD2a0XH/g2oV+A8pOVHee7VarixSZUUkypWC7I7EY+FAczVjaJlnJMqNqSQucsTJjHmYUQ+kOe8KPSPp+oMYoBGuQoSOTnJGsux5quI1rjr/9QtUXw9wxKkpjwloTfgS139f+lD3nLZYUfoc6F9Gd1pC+qCfMfzfGX88vf57oFvmYSYAeyDY+MTTY4kHUAjL0ooTrIKh6BrZZD8W/3OXSWzezHbQn48GrvoH7P+kiPGoW47A6k7YAjg0GRpuf7qV4YaYGKPMugm8OcZWy97y8ib2pPu5oQCNzofvgh5Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sy7ekOGL7Ui1hZMNT3Lmp3AyM0dO+DQEghWHmulQAgA=;
 b=bn6WdBEh253JrxnLtrTntVDJ8OuZNn1+ei9U83v926DU8LeKt01OMUubtqBjef7R+elcECsaBKJY4Z09j9Hlj7mkri/FgQPu7bLUEkKGATzq77acLwz0X9N2OxTnoaYor06kvuiTK/6rcit9VkhSdWgc8UdsV7HcO4S9/+yKt/066zKcf9xtt/E9jioS9RWP8M3kQY9eYlEvoHHo3jqo9xvT/hqMQS3oqEnscoRvOgtfbwMua3SFZE7EMT1essFJ01bT+LQNaQQLa4bTDw+wgkAcIC1W2nuifjREzIMwZquZoFD2wEd91ovrDdaST3bH4n5ESVTlZQJlkoQ+yPIKNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <40d70f11-37e7-ff29-37c1-a94d3e286455@suse.com>
Date: Fri, 5 May 2023 15:13:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 2/2] LICENSES: Remove the use of deprecated LGPL SPDX tags
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230505130533.3580545-1-andrew.cooper3@citrix.com>
 <20230505130533.3580545-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230505130533.3580545-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0238.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::13) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|DU0PR04MB9321:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a1c70ea-b93d-4ebd-76af-08db4d6a91ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oGOd4uxUd0desVQfbJFQq2WcbRIjz3mSImVXhQKeuOyJhdO3ZIS4ZMfsSIUBfG2FuRWt+BTbejxThlLeI99OjtXK4oLhpOACLGRPucj6+nf65rn7ONuEWOmz5GjqB7uG31VgWWqX+dYM/xUPBu1eDHCSlpw5bA7+D1C9C4LjV5+P1AkhxXCZMIl6qJyh0mYKcR5eaPXbn6z079panE57wACvT99x2fW2hb+UZYGYCI+/nk2kf/tfekkZ1N4ehz7g2UgWN+7iZqwebzyiaJAJFSYx7MeGcoy2QlXKRNhzikvEn/mMFwDex4jgc1ggb8WDUgITDwK56OH7CI9DfwOQlm/3MGdpcysS94pf8cbIHK1xFLtiPgpfZS3UBDxJTHpZKDYkxD6iARBU+2mrrFlN1+N3TotpnMpKhlnCxjOvdTEZYd94ijR+2u29MOyS5s/DispWvPx1UIvsThWRsNDpw6ODfdC/TQJc00GUF0aoHZfluFeJtan/WGDB8/j1kCin84pfj5ejUyAFAjUZt02gFAJkmFtO2NtifeXNH9+rHRgPapVkHEZwPjp3MI12How48LreYOJFCQHU58582BiRxs8CVA7BqRWQ++u07or87E6FnyHfB7fIHAv6v2ZolJGC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(396003)(366004)(376002)(136003)(451199021)(31686004)(6916009)(4326008)(66946007)(66556008)(966005)(6486002)(478600001)(66476007)(316002)(54906003)(36756003)(31696002)(86362001)(2616005)(6506007)(53546011)(26005)(6512007)(8936002)(5660300002)(8676002)(4744005)(2906002)(41300700001)(38100700002)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXp2a002VG51Q2F3aXdNMmY2M1ZGK080ZnRYZ0t1U1FGYUVDcWtEZ2FhNnNr?=
 =?utf-8?B?YWFWTjZielE4WGl3UzBoUEZtTW5PSC96emdUdDhaYmVMYUtwbmZWeHV6S2hq?=
 =?utf-8?B?MEJKOEZGS0pSSXZmTVRjUWZWS3pxVW5qbXBQRUQzalZlS2NlajhRL09DeDB6?=
 =?utf-8?B?RkFlcXByQVBGY0xFRW55YWlaV3dQd3YxVkJNenpFVzQvRklkdHcxelU2NklS?=
 =?utf-8?B?ZThQMkcyK21zRXRaQUw4Mm5EaHlhNUcxWGdESGJxNHc1ekN1eGlweGk1blht?=
 =?utf-8?B?RjVxQzEzK1dmSGlRd3hVZ3NWTlI1dWZxQVB4RG53eHpTR1ZubXRZNElpWE5s?=
 =?utf-8?B?Znk5YzU2N1V6QVFzeGJWWUZjNjR0cUEwQWNtdWZqYksyM014RXY2cjFqa0xY?=
 =?utf-8?B?RGk4TVFvWnc0VUFiR3o3VE5IdW03R3FrVzBJbjFPL0xjbWtRRUR2UXV0NjZC?=
 =?utf-8?B?OHhIbmhHczhrckVFa0tWZ3lIV3E5N1BpcFdlV0o0M2JERDdPOGJYMS9UdGFE?=
 =?utf-8?B?dVIzNDN4dlRJYWlOM3pUSmFHWVQ4ZHdwWnFDMG9uamRnMExaYytEUEs1Q2Mw?=
 =?utf-8?B?ZGVqM2JIc1JKYzYxa3NaeCtLZFNtM2lDeGVKVzl1bnFnYkxOS3h2NkxZWmNi?=
 =?utf-8?B?ZStyaXZwM2hGQlBNTXVRRHNNbkZLNjJYME9TcTQ0djBRUVRYaXZpd0UvUHV6?=
 =?utf-8?B?QXI1UVJTcXY2MEZjQzhITXV3amhmQU9TNlNRM2FvdExlWXZwcTdvbi9KZGQy?=
 =?utf-8?B?R2Q5dUdwVnVnY0cvUjNTU0VjeS9sdVRGRFpvcWY3VWI1Mk05MVBmWDhwVGFl?=
 =?utf-8?B?b2hSR2pieTdHVEJ2SWtacXBGdE1hN1dzRTZ2KzQ2dWJjWFF0UFNZZUJUWGph?=
 =?utf-8?B?OXJmZnB4Ukd2Z1NQT1JvMGIxeGJFNHJGWlhXNnJyVWkzcHdLckJzVGJBRVd1?=
 =?utf-8?B?ejlwWUgxYzBoOTZrckp4QmlkUTVsemIwS2UvZnJ2STRlOXVOTFZwYmhhdGNS?=
 =?utf-8?B?VXdqUEx5OEhsVVhEUkpyNUsyREphZ0M4TkozSEE0cFRaWDAySmM3ZEY4b3cx?=
 =?utf-8?B?Wm5nY1daNlV5bjQ4Skp4OG1rM0RTb1U5Y21kem5wUG1COS91dTVYSGdNby9j?=
 =?utf-8?B?RzhWSjZCQ2tuY1BHN29vOHNIUWI3RGt4dVg4U2dnejJTRE04azNrQ0tOS0xB?=
 =?utf-8?B?czhwdnhjZWN1VEsyWWVucUtydktFYVBTSzNEbStXRGgyUmJxaThrdld0Y0xI?=
 =?utf-8?B?QjA2aHNmZ0w2ZzYrODdsWmQ1c1U3aEpiYW5tcGg4ZXlFaXgza3B1VXBiOGUy?=
 =?utf-8?B?VXBkd2lKRS9TaytxYkJkNHdJY3VtZEVwODJrd3lYTDlva01lbkl0Ry82N055?=
 =?utf-8?B?QXF4MXJBWUd3ZFdEckNFSXp0cnBucm1HRnVRNmJxYWpBd0NEMTU3Q3gxbC9y?=
 =?utf-8?B?Ri90L0gwWXNtUTlheEdBU1V3TDFJbWY4OWtOU2NPOFFUc2pMcnRrRml3OGtL?=
 =?utf-8?B?c3FpcmNISkN0cVQ3Z2o0VDNuTjM4VXBjOHd3TmxRN0huOUNCQlVPaWcxbndu?=
 =?utf-8?B?NEJRa3ZQYXUzdVF0bmdTTG1Yb0puSFdKL05LM24zVWIzbTJRUVFlOUQ5Qy9B?=
 =?utf-8?B?TUFjaHVxaWxNUVhkYkJrK0F4aVdEbVoxcTluUVpPR01RK1cwU0JrOEFSV1pm?=
 =?utf-8?B?aU1nWG45U3VxbzNqVDdMb1haeHVCSlNPY3ByVFVuL1lxRXoweGdnZlpMSlhZ?=
 =?utf-8?B?VitJb1Vpek1ROHZoa0I4cVVmelo0ekRDUkpyMDJkRFl3cXAzbDJ1ZUFwU0VK?=
 =?utf-8?B?RXl0bStJQXhmYXFwSFpsYldIczc2RkNCV3FVZEZBM1NBSXZ4QnQwcnlhc0JT?=
 =?utf-8?B?NW5KZ2E2SkJ5S2g2OC9RT2hDZzF4ZWM5dEduUk9SdkNGTkd4d3hRQ0lZOVNL?=
 =?utf-8?B?RldBUFJFQlhtQkp2WVpvVzcxdkJlMldwdmI1RFd0d0xNcUk4TW12WkxNcU0v?=
 =?utf-8?B?ajJ0dTBQcEt1YTR2VnBqSmVRQS9aSlNoQ2ZwTXFQdkx1VEh2MVhIaFAwVTMz?=
 =?utf-8?B?NEVvWmhkc2xTTnpmM3hYdzduWHg4NVB2NEJ1RFFPQSttOG5oaHBtMlZrRzc5?=
 =?utf-8?Q?rYgsO6WU4WF5IHIDFMP3J/qOm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a1c70ea-b93d-4ebd-76af-08db4d6a91ef
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 13:13:51.4415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tv3qhfySMW7398sxvvVgOCWVq4RzkJu08LH5K8z6RKdlvMDruUlr4WuEl2icm7b8JX9367ge8NwJ5m2JhKLMlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9321

On 05.05.2023 15:05, Andrew Cooper wrote:
> The SPDX forms without an explicit -only or -or-later suffix are deprecated
> and should not be used.

I guess this wants a reference to where this is specified. In particular ...

> --- a/LICENSES/LGPL-2.1
> +++ b/LICENSES/LGPL-2.1
> @@ -1,5 +1,5 @@
> -Valid-License-Identifier: LGPL-2.1
> -Valid-License-Identifier: LGPL-2.1+
> +Valid-License-Identifier: LGPL-2.1-only
> +Valid-License-Identifier: LGPL-2.1-or-later
>  
>  SPDX-URL: https://spdx.org/licenses/LGPL-2.1.html

... I can't spot anything like this under e.g. this URL.

Also is there a reason you add Deprecated-Identifier: only to GPL-2.0?
Enumerating them would seem reasonable to me, not just for completeness,
but also in case we end up importing a file with a deprecated tag.

Jan

