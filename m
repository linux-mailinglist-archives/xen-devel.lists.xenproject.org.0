Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA5374AB66
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 08:53:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560196.875909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHfKx-0005TV-UZ; Fri, 07 Jul 2023 06:53:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560196.875909; Fri, 07 Jul 2023 06:53:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHfKx-0005RU-Rq; Fri, 07 Jul 2023 06:53:03 +0000
Received: by outflank-mailman (input) for mailman id 560196;
 Fri, 07 Jul 2023 06:53:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ruU0=CZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qHfKw-0005RO-Qs
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 06:53:02 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2079.outbound.protection.outlook.com [40.107.7.79])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e982ec46-1c92-11ee-8611-37d641c3527e;
 Fri, 07 Jul 2023 08:53:00 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8438.eurprd04.prod.outlook.com (2603:10a6:20b:411::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25; Fri, 7 Jul
 2023 06:52:31 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Fri, 7 Jul 2023
 06:52:31 +0000
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
X-Inumbo-ID: e982ec46-1c92-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PpJfqU2LNVCzTiFFlOj2P2VMoXcXkIwF281J2Kjr1o7qRPQabobQoQonDvlrYTvkxc8jTBiSMzlUUKkaOv3a0zlDm+7irupnLwejUl9pEQ76eqBN2cXL4N04+HQD3yp+oF0mW2ljeLxSq3q5OTQCKXvqup3WCCOFwW9wU+NQ+kTRdu7KanzkIfT5IppMl/PzN0BnNd7xdg3LR4Sxu2uXyB+sWDyJHCDXJo5IHYo9g9ut9//S7JqbG1N61qN5VeB2hYAg0aVkxDZEsV7lgqUWVkbUkhOqIr9QDcYTKolLwsV++evQa3w3ctcus3CG1VclF+0EnVPnFwz2mstrJGYvaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2uasM40HRG7OgJnwBX5gG/lDzbEOH6AcY4QQKmPvDoY=;
 b=NV77b5ckSU7hltv29uQ7L3CGEQ5PbQb9KvZP5r5LzjtLbCI32UXvOju26iKOfuO5B8BQ88rqpywkgLAM+wxh3H435Kiixck+3VmbchfTMWDUQxep+MgGnZdjKJiv9RS9F0+UyCc3brWCgN3qNsKg8tsxgmO/zFZUpw/cO8gQr3gfN3g9bvj6D6r0IIjS7HE3JOQO1MARdIlug6QybKNwSKjbi9PoNRpDF4Slij1a+R2o1JEXTi3Oy+FhnYJM/+d9drwqFeBFLR6xesljnPiNOExUA2tPSWzo7+TignotzMtgENHBprsKdo9nO1zf665DTrwhKrRWkdzNcS2Kvsq6Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2uasM40HRG7OgJnwBX5gG/lDzbEOH6AcY4QQKmPvDoY=;
 b=QdCfY4TWjssxi6/ISc5+m6ZQrtdqAoFhTJg/eAM2oCWphCiO84/1x/mCufOJM9VG8Azuk8n9yv+85txoO5HAdyQp6w2br8fQ3n8w44HzZFZDjbkNxa1dSeOPV3p+kYOd8P+aMbrp44EuzhMApL/pE1qHL5zHa7MNVXkEDZcQnoBCUFpAleqaaLq61YCB1em646yBl93nQQTVoG4V9q95nEdWoVb/9eUIfF6FMoB6nm6rCYqM8wmhJN6WJytqu1e2XnkiYsIXTYU+9o2skU5gRUd7jRmlP0u1/R80/1JKHEbO61BI2/0ayI2r5pM7SEtfTssw/qIArDfwQyQBhIMzEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9f2fc7fc-cab6-e14e-6fd3-a2e75d4becfa@suse.com>
Date: Fri, 7 Jul 2023 08:52:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] docs/misra: add Rule 7.4 and 9.4
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, julien@xen.org,
 george.dunlap@citrix.com, bertrand.marquis@arm.com,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20230706224619.1092613-1-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230706224619.1092613-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0108.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8438:EE_
X-MS-Office365-Filtering-Correlation-Id: ac356a8e-e1e7-4acd-13e5-08db7eb6bc6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HOEN+x1kXsaROBbYEiyIpvmpu1l2kX9iaw2C8zw0nNwk6w720K3DgIxaZHd0vGASpmjGOJVIxc7CJLcq4pcbiuVdQmpPydwGlTA16am9YKWoHG0P9rs9lTInyPA/sj6/4eYmIOFd5MjRthDI77+KE2ZGFmyT3plJJ3DyPOfmK3Xl8Yxt8QaKx8JJ/SJWZuFadeoOFNXA9IXg2MOvkG3oaLSs+9wkU1io85cE+veN6HM6Xao2rl1SGhouEBPsrp9ZgzfSnKj9kPtWmJ66G6AqIfQYfnORN/WKJuyfjLtqB55UmHSXzgTwo5OwiWzy7u0AB5yatf1dk0jiGal52oIj44dkuYIN5L8ZkFq/nzZzzGpag6FT7t+wSvpEFErzVvmOrbcgpDz+bfZ24gaduZcNAAxi49/bMluIh3KhSz1nz57hHQMvpMWDjP2blTx0sx/bHHzM9Eq2hbDO4FgSwd5ZLcHyswlbWaFr1IQlVU5Dgk20EZu7yxgu4BOXcGlOBa6BBXjnISrXWvedckWWl6bR1HuVfOrzk8Xy7vWZcbapoAZ7UxmPdpMjbDE7zzCPOIyUUTiuXTEWQymEFpKVOZyEfBhtAiOJ0IGUGJsdWZZMAGZCBpTcV60Q3XgB3MRQWyMun6CG+Ns35E3VRlNAu4GlkQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(346002)(366004)(136003)(396003)(451199021)(31686004)(2906002)(478600001)(6666004)(6486002)(8676002)(36756003)(8936002)(41300700001)(316002)(6916009)(66946007)(4326008)(66556008)(66476007)(6512007)(83380400001)(38100700002)(31696002)(5660300002)(86362001)(26005)(186003)(2616005)(53546011)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enRGd3NPWmcvQnZHK29rMWlETWNlRmV1dG9VZldxYzIrNFFvRmMwMEZTalM4?=
 =?utf-8?B?aWNIRVRWMU5TUFIydXJhUE5pWGFqZ0dMWUNtUXhSNjd5b3p5WU5OZDRpeit0?=
 =?utf-8?B?QlBKRm9aVXUzYWN3a2RDaDNxbFFNOUQ2WTdGOGh0LzdJcnRvM0RObit0Q1lM?=
 =?utf-8?B?YXp2clVFcDRza2RsZzU0ZjNYaFZEcGNWNWRLREtXQ1VVQ0cxYWk1TmxOQzVE?=
 =?utf-8?B?N05SdzdnVnI3WmVMMjR6U1hLa1VCSWhNb1NsZDV6VmhnT3FkZ3JqSTRrakJG?=
 =?utf-8?B?WkYzZlhEekNRTDFKc0Y0QVhLVm1lcjZKaUt6c3J6bUxGUGttQW9EampYdDdI?=
 =?utf-8?B?dHFQYUhGeTdLV2FXeWNEMVBUbW5MT3d5aU1zeFpyemtLYXozbmpOUTVqaTAv?=
 =?utf-8?B?b2xUVjN6d3NiK213ZDNhd1dYaG1PMUE3MUhkR1BJK2xpY0xuMlBzRWpQNnVP?=
 =?utf-8?B?R2RFdmI3RmNDdFpqYU1veXRlaVY0TzFrQ3phN0txS0JQYy9EckRCN1prdmpQ?=
 =?utf-8?B?Qi9hQnR3YUtaWkJFUmlQb2JRUFV5UFlzZFBGQjlFeHRQd0RWSFkvZERhQS81?=
 =?utf-8?B?dDI5L0RTUno0ODZVWnBacWZLTmZVVUl5TU5VeHRFMHRIZndvcmpoQ01vTTdV?=
 =?utf-8?B?TXBzNFB5dVJRYW1DZ3YvZFJxcW1PT1hDM2MxQnI0UnBtdHc3OE5BTlZPL3BS?=
 =?utf-8?B?Vy9sNVJoVDA0OGhWeTNwOXlhLzNTTXg4WjI3aFp6akJMY1A3d0JnVUZROGhj?=
 =?utf-8?B?Y09MRnU1NnoxY3J6VkVQV202TnVXdmpvYnNtOFRHWHlERzNMdytmNnVsVlNp?=
 =?utf-8?B?ZVZ4V09SbTIrYnpTZGx3cHltOVhSZ2c0bisrVTlKeUZkQWp5VkM4T3pmLzFs?=
 =?utf-8?B?ZXduMVJ6UE5iQ2dXUzFqbkN3VDdyQ0xJUUtkZTNEVHRRKysrYi9FZUxWV1JL?=
 =?utf-8?B?ZXVBdE9zUURVcHBRd2xUS1p3YkVwaTNSRm1yUDZhYlNvQkFkQ3FqUVg1UXVL?=
 =?utf-8?B?eS9uRUxjNzl5YUpKbXU5ZTgzQVJ6MnpJZDh5V1lQSU5HdWppWE1TdzB1T2lQ?=
 =?utf-8?B?QW15RHIvOW1IRGNWckJuUm1GZ1hnWWpYNlF5bWladHc3Qm9hRVRiYXZuRTdx?=
 =?utf-8?B?MzZsbCttWDJ1WWZZdDM0L3RmY25uTlAyZVhyaUw1eVkvdXhDZ0NieS9kV1d5?=
 =?utf-8?B?QXRNc3UwU2lxaVEvNDlYL0J1c3FzbTA3VXZnS3loNlZ0SHVzL2EyQU9OakVK?=
 =?utf-8?B?eml4NFZuMStvelVCbURFaHY4THNXZjVSZnlKZ21ISjdyZGkzZUVUdkZpeDdl?=
 =?utf-8?B?TEtFOXh0bXU3RDAvQ1RkMnFMRzgzbEtYQ2IzR0UwRkJheEwwVkFaK0FBL2F6?=
 =?utf-8?B?ZmorWFpOTWVXRjA3clU2UVpSZFpNRzk5UUNFVkV4MGZGYXFhTzJGNWNqWWJu?=
 =?utf-8?B?S28yaEd3dzczOEw1RDF4VHdudGZ6LzZNWFhad1FJKzZ5ODd4bi9PZ1hJR3pa?=
 =?utf-8?B?LzVCMGxFZVkzWWxFb3QyVE1sUG5JZUxNQ2xKMHNSM2p6MXRvQzBRc3hDbVkr?=
 =?utf-8?B?ZFlRWDFsRU9LMXpCTEFLSmc2Q29wL0V5c0l1MHBacFRDczRCQzJNUWtCR3Bp?=
 =?utf-8?B?WkZpUm8zYW9qMk1iU1FFanl6KzVjTks0WWJCUko1N1Izc2tJQUU1YXB5Q2Fy?=
 =?utf-8?B?RkZoQXRFSnBsL29KOHVyOWhka3hMTXJvVzkxVGVHT0RSbDJpMWFDN0lWU09P?=
 =?utf-8?B?U3NEckIyYjlpMmwxU3owakZ0cXFoQVRZS0h6ZFJ3Z0RzTCt6Q3V0VDFSbS8y?=
 =?utf-8?B?ZjYzMnRYQjdnbkgxSHNHL1RGWGNxRVFUay9QRlVVY2ZPcEhXSlhDK0xxZTRp?=
 =?utf-8?B?NUVwdEVrS3MrNVR3eXgyeG4vNnoxVkExVS9GNm56Q0tTdGlhSnhVY3M2bXAx?=
 =?utf-8?B?OW5iQmlOU0FwbkdVaFUwNnZYdEtWTW0za1ppUHZWQXJBT0g3QWwxWXEyWFBz?=
 =?utf-8?B?NXpyRUpMUHNPYXRCdFRDb2Z2Z0JVL3Z1R3hZZjNEV2JuRmMvQ2I5MWQ2OEFm?=
 =?utf-8?B?M3I1NnFpclhRc3FOMlZuMjVJS1Rrckh4K0Y3Z0M1Y0prTzZ0OGVxS0hzdnB0?=
 =?utf-8?Q?Lv+bmHHw5OoQg7/kgdA+VudQ2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac356a8e-e1e7-4acd-13e5-08db7eb6bc6e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 06:52:31.4532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 58BWa4weSvpM3mpMKQlRo/qcSV04NnUM5EU+22AI/O8vpWhaE7MGFpjfHUZ2wvquRFSsJhcHqkFvvhzG4JL65g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8438

On 07.07.2023 00:46, Stefano Stabellini wrote:
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -203,6 +203,13 @@ maintainers if you want to suggest a change.
>       - The lowercase character l shall not be used in a literal suffix
>       -
>  
> +   * - `Rule 7.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_07_04.c>`_
> +     - Required
> +     - A string literal shall not be assigned to an object unless the
> +       objects type is pointer to const-qualified char
> +     - Assigning a string literal to any object with type
> +       "pointer to const-qualified void" is allowed

I guess this is relevant also in a few other cases: Considering the
significant difference between title and actual text of the rule, and
further assuming people looking here won't always pull out the full
doc (they may not even have a copy of it), I think it is important to
also mention in a remark that despite the title all "character types"
are permitted, as long as string element type and character type match.
Since the compiler won't allow mismatches when the lhs type isn't void,
mandating no use of casts to "satisfy" the rule may be a way to express
our intentions.

Jan

