Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5B65815A4
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 16:46:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375368.607705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGLpb-0001Ix-5R; Tue, 26 Jul 2022 14:46:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375368.607705; Tue, 26 Jul 2022 14:46:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGLpb-0001GJ-2W; Tue, 26 Jul 2022 14:46:43 +0000
Received: by outflank-mailman (input) for mailman id 375368;
 Tue, 26 Jul 2022 14:46:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/jC=X7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGLpZ-0001GB-JZ
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 14:46:41 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2065.outbound.protection.outlook.com [40.107.22.65])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c18635a4-0cf1-11ed-924f-1f966e50362f;
 Tue, 26 Jul 2022 16:46:40 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR0402MB2910.eurprd04.prod.outlook.com (2603:10a6:800:b6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Tue, 26 Jul
 2022 14:46:36 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Tue, 26 Jul 2022
 14:46:36 +0000
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
X-Inumbo-ID: c18635a4-0cf1-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D96nW4eesnmLfu3i+wfdS+tK0b2A81FG82+/AYgoRYYHemcXG0efT2HdzuzcQXOWrtln/YJL5s8j2hTPvnxK/57skzv0PcCGn0bkmg67YDkYkA0BjJZ9XNdExpUa6kH34j8HA9l8EsPcmf1a7NkEImX64jec6UQRKo16K1aZ2bWc6+fMEXCGqRQXIPSSYkbJpBqa3xSIwalkNg4pgREZoidLJSQvfcY21vedVB3EXa+TOxH5sdJKVOli8sOM5DDXtAlcTBiPyQG2h2NwGbRZeZ8L4nWeFtCjnBZWZ2fR62yf/Th2Qh9OL9eQZsc7kap1QTvCPKrmFyeSBVrnBPyVOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=47otvH0QGOxetC+Ve6b3lJi2AEIUHoi3xmK9BI04e5k=;
 b=CaMNIGnvSlnrQRw54NdquMdjAtZxLljY5KOM/yPnhoyafDobYbvwSSJsXb0mt0FSLI50Jh4DxfEs0UMtMjGZaK6Sna7CKg3cSGZwd5dwgH0laFmtCy0HTIpO4BS+s0EM7/ybGoWx2SNoUO2IjxBKJzJAUbtCmVEl1/G/ly0dCSIGWWIUjUWjLTd2iYZlcCTJjEQz6PiEJz+HfrKezX+CK91g0AUBeYoDTuDuQ7rIOtkNVtejbDGPM0sbQCSiT1byedSYBfmND84GeNpiVuWmrK1MswUkY+zn+AoBBhpEnXJKRszT3i55xA9aKOMc/nCpgTgCADVhA9qqbZunMip3tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47otvH0QGOxetC+Ve6b3lJi2AEIUHoi3xmK9BI04e5k=;
 b=u0Cu6pR6cT9kSAAUzQ9lU65lj7hqonWatFct0cfI2Xt269id2zmhpJBSjNJcNygCMF9jLfc2L4PS6CGtqBV83dzoIJvcK7Vo0uqD/kgSryVujQOd+ip9MzupRUiDuax4vMIHjY+/EFHMuQDOCVfjBvw+nZK71ft2bKDLpwCrBg1sQaZSWGaTMeKL0WyRraqh+7cCoO4q9kCkkgJ37FdgCwJd5K9o/AercqipMiT4Kknika+XyeARLMOYuvY3wdLQqIjJNb/SgNe4ME+DYrCsBP7V8yDDh33YYjllQyZeSVRA7cWQUKnpNM6SUYpETaGJTPk4s7PN7Y1IowRa7SYttA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <257e465e-b991-de77-1065-c4e8c7d61461@suse.com>
Date: Tue, 26 Jul 2022 16:46:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 10/18] x86: introduce the domain builder
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
 <20220706210454.30096-11-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220706210454.30096-11-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ad8360e-c67f-43ec-44ed-08da6f15a441
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2910:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I/LIiXfMO5vXGruxnZusyosIx03a2uZMaRGBCWxvbl1L7wmUF4El+aP8IYUcFWai7Ft53JjqFTXhYciOIj6yWGBElgwKJzwjHWhOqfUsGMJHQZfl1OZ1WNo8DzafmJ3PDJY0RBp9HEueRuFpLcsRIoNGt+loHho/ICQdElZQAG6UtUNA4U2i4KCHOrQquacYVdSMkjByC62AOasLn0CiPPe0tBw6D4VVoI1CaleNgmM1HujpEebtWzArIUUnNQAMutHFZ1VC4I4Fz/juQB97X2H39alwlBFUnnQkyo144ql+t9j7o05+RrbgYWEca6QK2N7l7zS5OZ4p6dVZs0MVCDLYdNHPdN9xE8PvoWbypRvOY+pwnNDFVXK1zhpWKh74iYV5mJMtbF41Pwji3CRmCbN4XyBj13ZH5s3Zo5JqPd3q5lQZPq3HCREU79GhOC+MrBSOJvaebqF7YPJTCk0L1QspksI4AaCvNVCxtuqwUXvkEIhZeZvAiYHPX9xsxk5ijvMDsrNxmrsOe1IdzYQX2f5FXsZLtaLr2VrQF0kURByf1rtomw0xfkAyLDxlKMkgopd50M8knsKlDq11o9c1bFG/f34HNH1i+SkKVoe+TV8hF9SfrmoUaJ9yKJKpFOBxy4R3sH8wSRKOOgFtX6yR8LYzqUTarlln6AK+Y2uHqmZkN0XbiWvADePQEUp6cFK9eHXuFkE2/MvB+Q2nKVnYGty2sypCznBGrAtjX10uqrKfyEB5SgrtWRCG5MhwuUQonqtU0Tx9LDSN4szEtiuApmtph+zZzeyBmgfbd/F1TjEKJuRHDS4I+Vjz9wYsvYddPomFK/+bZ+Zyv+x2HXCxtA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(396003)(136003)(39860400002)(366004)(376002)(2616005)(31696002)(38100700002)(6486002)(53546011)(6506007)(6512007)(26005)(7416002)(86362001)(30864003)(478600001)(5660300002)(41300700001)(8936002)(186003)(83380400001)(2906002)(316002)(31686004)(36756003)(8676002)(6916009)(54906003)(66946007)(66556008)(66476007)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGZnMjVMSHNZdksvRDNrV0ZQS3JLK2tYTlRxb25FdTAvdTlkRTFxbFlGM0w2?=
 =?utf-8?B?Y011amtmRXMxWXhUZ1MvRHlCcFZuank2T2krZldORDZ4MVExS1pPUURad0lG?=
 =?utf-8?B?K24vTExnZ3laOXBrcWZsWXNoSWo0TDNhRWl1L0xoUWxZdGR6Y0UzaWRrQUpI?=
 =?utf-8?B?d25KdjhMN0drYXh1MGhIMUNYUHg5K2VBOSsrdEFUNlQrQktrbDNBTGxXYUJL?=
 =?utf-8?B?Rng3Lzg5bkVDQ3c4NFoyQlVXUWhLS1lmQzVZaUpOZm1RRzV3NkJwYmN4aGxD?=
 =?utf-8?B?NmV1QnlOMHpSdTR5eEV4TWlITHJadjl0ZktDZVVoaHBMbEYwSFFkdTRnVXhm?=
 =?utf-8?B?VFdQdUcyaGVZZUJMZUZveDlwM1NUeXZFNEhzQm1rQnlqWlVFZ2NiaWNGWWZ5?=
 =?utf-8?B?bGhISE5VZG1ub2ZLMmpEaFVJTDFYeE9DWkhVY1ZzVGNMYXVESkUyZDJQSWMz?=
 =?utf-8?B?RThFSkpYT05QMlZWRGZ1R29QZXZpeDIxWUVIZE5aNUw3LzZmcjNZWGVVNVBN?=
 =?utf-8?B?TmJrMnFjVTVxN1ZPNk13Zy91UUZoYjNZRVVTMkJ1NFVla3hvYi9wa0NWc2pm?=
 =?utf-8?B?SndRY1JXbjlad1ZpQlJtd3JPWWZKVDR4SThIaldYME1rcUcxYlpSZ0xnWmN1?=
 =?utf-8?B?VWVYZDMwenJSWTVJcGRaRysyRnVCNjBHeEVtd3hwOUpOd25ORjFuR3h2ajJR?=
 =?utf-8?B?UkEvWUxCOFVsenlJWWJwN3pJbWxiTVk0ekU5ZzVhamxjeHM1UFV6NXoxWUZR?=
 =?utf-8?B?MzdUa01BSmxmbEJRTlZxODJyU1RkZXZCZldWeDg0MGxzY0xsVFgrVkxRejNM?=
 =?utf-8?B?NGkxdllWTHhGT2VoQkpsSkNQODF5ckRLOEo3NTcyYnV5c0ZaUE5FL21Bb3kx?=
 =?utf-8?B?MU0xNFFtaTd5WE8ybkhXckJxTW1Yb2M1dGErck1wZjZTQTRENWxKZ1VmTXpj?=
 =?utf-8?B?VXN0dlcrekF2M1dndHJMOHJZK1FtZEM5MjNRTUpjYXJuK2dEdy90NVhQVTQ2?=
 =?utf-8?B?bHo5d3hiMzdIRUdSRFk5V2FDdmx6dVMzN1UrbDZtUUpOL3U4QUdmN3kvclBX?=
 =?utf-8?B?Q3JocjNOT0s4dmRqbmZjeElERm9YcWZuWWYwNGRkM0dVL21lc1FNV2hJTUN3?=
 =?utf-8?B?eU1WbFkzVFVGR0c4anZ3LzdIMTNLR2N4eVlFOUwzaG1KblRJait4VGZ5TCtm?=
 =?utf-8?B?K1kvSzlDR0labFp1S0tPOFNhQThaN1N6aEdaM1Z6eVBSOVVhTFZSdHZHYitv?=
 =?utf-8?B?RnZKVGZHck4rUnhFQVNtSDl1clhyR21pMUNCSG9aNGtpQXdOVERUUXg3cTFD?=
 =?utf-8?B?UmRpMlpCQUo5Q0RIQXVvek5iL0VtQ2FCRTBNdFYreDgzTWhRSURNWFdRclZX?=
 =?utf-8?B?cjh2SllPTEJ6VElNd2toaW05WW5PdHRpVjE4N0owQThMYVllWGU4djE5bDNN?=
 =?utf-8?B?QW9WNFpZMDdBRHZoRHFZbTNURTA2SHlodTYvRGZUTitKRnNZVGU5SmUrMHFp?=
 =?utf-8?B?U0htVllIWFBSS1JDcVNOdHFWNXdLbEM0RG16VThjZk8zY3M2NzJ4aWJ6Sko2?=
 =?utf-8?B?VUNhVFRVOERkMUNGc1crWWIyaiswNENIVUJmZGpFQ2swb1BYYkR0aXVrNGxF?=
 =?utf-8?B?QUlBUmt5R0trd3UzZFNlVlJGWDhsUW5nMnpwZlgxREtZQk9vNlZGVTdlWnRo?=
 =?utf-8?B?KzVKZ0F4c1VzblQ5YkdqY2pSOHFCRHFXNm9BdU1qbndwY24yQUhYdGp1d1Bj?=
 =?utf-8?B?OG5UY2FncEZmNk1MK3UvQm42RXQ4V1d1UUJOOTUwT1NzUDl0b2pVWXgxK3Fi?=
 =?utf-8?B?ODRzcGtVRnJVNWN1bVhTdFpSSkNzakJGb2FwQkpjNUJyd2NSQ1BJendJS3dn?=
 =?utf-8?B?TDNnUzgwVjk3U0xEZWQxVlMweWJCdDMveXNKb2VoNmJVbnpvZ0FXVHNEYXlX?=
 =?utf-8?B?dGY2c2dpcHVlc2RYcENRZ0ZGMXVtRmVkSWJNdjluaU14M3M2UUFTb2VSYWRH?=
 =?utf-8?B?MWczNWE2d2U2Y2ZlWkJpY2dHaEFhcm1MNm5EUFFWYUhXVUZMQ1kyKy8yYXJm?=
 =?utf-8?B?di9sbzhYUHVuVm92UTdZL1BFdlFPUUJwQ0FHVUV5bFQ0bTlhQWVTbVljZXJm?=
 =?utf-8?Q?a77TkFu/vbsm12rrJ2Xv4gedf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ad8360e-c67f-43ec-44ed-08da6f15a441
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 14:46:36.7864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +mYts91uqzy9E0+m55zpY6+35W6iVSPyKr2f34iXJJUip9pnSb+zqNB05TTGYnqciJpkJbMQLjGKqhtfCFDQvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2910

On 06.07.2022 23:04, Daniel P. Smith wrote:
> This commit introduces the domain builder configuration FDT parser along with
> the domain builder core for domain creation. To enable domain builder to be a
> cross architecture internal API, a new arch domain creation call is introduced
> for use by the domain builder.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Reviewed-by: Christopher Clark <christopher.clark@starlab.io>
> ---
>  xen/arch/x86/setup.c               |   9 +
>  xen/common/Makefile                |   1 +
>  xen/common/domain-builder/Makefile |   2 +
>  xen/common/domain-builder/core.c   |  96 ++++++++++
>  xen/common/domain-builder/fdt.c    | 295 +++++++++++++++++++++++++++++
>  xen/common/domain-builder/fdt.h    |   7 +
>  xen/include/xen/bootinfo.h         |  16 ++
>  xen/include/xen/domain_builder.h   |   1 +
>  8 files changed, 427 insertions(+)

With this diffstat - why the x86: prefix in the subject?

Also note the naming inconsistency: domain-builder/ (preferred) vs
domain_builder.h (adjustment would require touching earlier patches).

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1,4 +1,6 @@
> +#include <xen/bootdomain.h>
>  #include <xen/bootinfo.h>
> +#include <xen/domain_builder.h>
>  #include <xen/init.h>
>  #include <xen/lib.h>
>  #include <xen/err.h>
> @@ -826,6 +828,13 @@ static struct domain *__init create_dom0(const struct boot_info *bi)
>      return d;
>  }
>  
> +void __init arch_create_dom(
> +    const struct boot_info *bi, struct boot_domain *bd)
> +{
> +    if ( builder_is_initdom(bd) )
> +        create_dom0(bi);
> +}

You're not removing any code in exchange - is Dom0 now being built twice?
Or is the function above effectively dead code?

> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -72,6 +72,7 @@ extra-y := symbols-dummy.o
>  obj-$(CONFIG_COVERAGE) += coverage/
>  obj-y += sched/
>  obj-$(CONFIG_UBSAN) += ubsan/
> +obj-y += domain-builder/

At least as long as all of this is still experimental I would really like
to see a way to disable all of it via Kconfig.

> --- /dev/null
> +++ b/xen/common/domain-builder/core.c
> @@ -0,0 +1,96 @@
> +#include <xen/bootdomain.h>
> +#include <xen/bootinfo.h>
> +#include <xen/domain_builder.h>
> +#include <xen/init.h>
> +#include <xen/types.h>
> +
> +#include <asm/bzimage.h>
> +#include <asm/setup.h>
> +
> +#include "fdt.h"
> +
> +static struct domain_builder __initdata builder;
> +
> +void __init builder_init(struct boot_info *info)
> +{
> +    struct boot_domain *d = NULL;
> +
> +    info->builder = &builder;
> +
> +    if ( IS_ENABLED(CONFIG_BUILDER_FDT) )
> +    {
> +        /* fdt is required to be module 0 */
> +        switch ( check_fdt(info, __va(info->mods[0].start)) )

Besides requiring fixed order looking inflexible to me, what guarantees
there is at least one module? (Perhaps there is, but once again -
without seeing where this function is being called from, how am I to
judge?)

> +        {
> +        case 0:
> +            printk("Domain Builder: initialized from config\n");
> +            info->builder->fdt_enabled = true;
> +            return;
> +        case -EINVAL:
> +            info->builder->fdt_enabled = false;
> +            break;

Aiui this is the case where no FDT is present. I'd strongly suggest
to use a less common / ambiguous error code to cover that case. Maybe
-ENODEV or -EOPNOTSUPP or ...

> +        case -ENODATA:

... -ENODATA, albeit you having that here suggests this has some
other specific meaning already.

> +        default:
> +            panic("%s: error occured processing DTB\n", __func__);
> +        }
> +    }
> +
> +    /*
> +     * No FDT config support or an FDT wasn't present, do an initial
> +     * domain construction
> +     */
> +    printk("Domain Builder: falling back to initial domain build\n");
> +    info->builder->nr_doms = 1;
> +    d = &info->builder->domains[0];
> +
> +    d->mode = opt_dom0_pvh ? 0 : BUILD_MODE_PARAVIRTUALIZED;
> +
> +    d->kernel = &info->mods[0];
> +    d->kernel->kind = BOOTMOD_KERNEL;
> +
> +    d->permissions = BUILD_PERMISSION_CONTROL | BUILD_PERMISSION_HARDWARE;
> +    d->functions = BUILD_FUNCTION_CONSOLE | BUILD_FUNCTION_XENSTORE |
> +                     BUILD_FUNCTION_INITIAL_DOM;

Nit: Indentation.

> +    d->kernel->arch->headroom = bzimage_headroom(bootstrap_map(d->kernel),
> +                                                   d->kernel->size);

bzimage isn't an arch-agnostic concept afaict, so I don't see this
function legitimately being called from here.

And nit again: Indentation. (And at least one more further down.)

> +    bootstrap_map(NULL);
> +
> +    if ( d->kernel->string.len )
> +        d->kernel->string.kind = BOOTSTR_CMDLINE;
> +}
> +
> +uint32_t __init builder_create_domains(struct boot_info *info)
> +{
> +    uint32_t build_count = 0, functions_built = 0;
> +    int i;
> +
> +    for ( i = 0; i < info->builder->nr_doms; i++ )
> +    {
> +        struct boot_domain *d = &info->builder->domains[i];

Can variables of this type please not be named "d", but e.g. "bd"?

> +        if ( ! IS_ENABLED(CONFIG_MULTIDOM_BUILDER) &&
> +             ! builder_is_initdom(d) &&

Nit: Stray blanks after ! .

> --- /dev/null
> +++ b/xen/common/domain-builder/fdt.c
> @@ -0,0 +1,295 @@
> +#include <xen/bootdomain.h>
> +#include <xen/bootinfo.h>
> +#include <xen/domain_builder.h>
> +#include <xen/fdt.h>
> +#include <xen/init.h>
> +#include <xen/lib.h>
> +#include <xen/libfdt/libfdt.h>
> +#include <xen/page-size.h>
> +#include <xen/pfn.h>
> +#include <xen/types.h>
> +
> +#include <asm/bzimage.h>
> +#include <asm/setup.h>
> +
> +#include "fdt.h"
> +
> +#define BUILDER_FDT_TARGET_UNK 0
> +#define BUILDER_FDT_TARGET_X86 1
> +#define BUILDER_FDT_TARGET_ARM 2
> +static int __initdata target_arch = BUILDER_FDT_TARGET_UNK;
> +
> +static struct boot_module *read_module(
> +    const void *fdt, int node, uint32_t address_cells, uint32_t size_cells,
> +    struct boot_info *info)
> +{
> +    const struct fdt_property *prop;
> +    const __be32 *cell;
> +    struct boot_module *bm;
> +    bootmodule_kind kind = BOOTMOD_UNKNOWN;
> +    int len;
> +
> +    if ( device_tree_node_compatible(fdt, node, "module,kernel") )
> +        kind = BOOTMOD_KERNEL;
> +
> +    if ( device_tree_node_compatible(fdt, node, "module,ramdisk") )
> +        kind = BOOTMOD_RAMDISK;
> +
> +    if ( device_tree_node_compatible(fdt, node, "module,microcode") )
> +        kind = BOOTMOD_UCODE;
> +
> +    if ( device_tree_node_compatible(fdt, node, "module,xsm-policy") )
> +        kind = BOOTMOD_XSM;
> +
> +    if ( device_tree_node_compatible(fdt, node, "module,config") )
> +        kind = BOOTMOD_GUEST_CONF;
> +
> +    if ( device_tree_node_compatible(fdt, node, "module,index") )
> +    {
> +        uint32_t idx;
> +
> +        idx = (uint32_t)device_tree_get_u32(fdt, node, "module-index", 0);

Why the cast?

> +static int process_domain_node(

__init?

> +    const void *fdt, int node, const char *name, int depth,
> +    uint32_t address_cells, uint32_t size_cells, void *data)
> +{
> +    struct boot_info *info = (struct boot_info *)data;
> +    const struct fdt_property *prop;
> +    struct boot_domain *domain;
> +    int node_next, i, plen;
> +
> +    if ( !info )
> +        return -1;
> +
> +    if ( info->builder->nr_doms >= BUILD_MAX_BOOT_DOMAINS )
> +        return -1;
> +
> +    domain = &info->builder->domains[info->builder->nr_doms];
> +
> +    domain->domid = (domid_t)device_tree_get_u32(fdt, node, "domid", 0);
> +    domain->permissions = device_tree_get_u32(fdt, node, "permissions", 0);
> +    domain->functions = device_tree_get_u32(fdt, node, "functions", 0);
> +    domain->mode = device_tree_get_u32(fdt, node, "mode", 0);
> +
> +    prop = fdt_get_property(fdt, node, "domain-uuid", &plen);
> +    if ( prop )
> +        for ( i=0; i < sizeof(domain->uuid) % sizeof(uint32_t); i++ )
> +            *(domain->uuid + i) = fdt32_to_cpu((uint32_t)prop->data[i]);
> +
> +    domain->ncpus = device_tree_get_u32(fdt, node, "cpus", 1);
> +
> +    if ( target_arch == BUILDER_FDT_TARGET_X86 )
> +    {
> +        prop = fdt_get_property(fdt, node, "memory", &plen);
> +        if ( prop )
> +        {
> +            int sz = fdt32_to_cpu(prop->len);
> +            char s[64];
> +            unsigned long val;
> +
> +            if ( sz >= 64 )
> +                panic("node %s invalid `memory' property\n", name);
> +
> +            memcpy(s, prop->data, sz);
> +            s[sz] = '\0';
> +            val = parse_size_and_unit(s, NULL);
> +
> +            domain->meminfo.mem_size.nr_pages = PFN_UP(val);
> +            domain->meminfo.mem_max.nr_pages = PFN_UP(val);
> +        }
> +        else
> +            panic("node %s missing `memory' property\n", name);
> +    }
> +    else
> +            panic("%s: only x86 memory parsing supported\n", __func__);
> +
> +    prop = fdt_get_property(fdt, node, "security-id",
> +                                &plen);
> +    if ( prop )
> +    {
> +        int sz = fdt32_to_cpu(prop->len);
> +        sz = sz > BUILD_MAX_SECID_LEN ?  BUILD_MAX_SECID_LEN : sz;
> +        memcpy(domain->secid, prop->data, sz);
> +    }
> +
> +    for ( node_next = fdt_first_subnode(fdt, node);
> +          node_next > 0;
> +          node_next = fdt_next_subnode(fdt, node_next))
> +    {
> +        struct boot_module *bm = read_module(fdt, node_next, address_cells,
> +                                             size_cells, info);
> +
> +        switch ( bm->kind )
> +        {
> +        case BOOTMOD_KERNEL:
> +            /* kernel was already found */
> +            if ( domain->kernel != NULL )
> +                continue;
> +
> +            bm->arch->headroom = bzimage_headroom(bootstrap_map(bm), bm->size);
> +            bootstrap_map(NULL);
> +
> +            if ( bm->string.len )
> +                bm->string.kind = BOOTSTR_CMDLINE;
> +            else
> +            {
> +                prop = fdt_get_property(fdt, node_next, "bootargs", &plen);
> +                if ( prop )
> +                {
> +                    int size = fdt32_to_cpu(prop->len);
> +                    size = size > BOOTMOD_MAX_STRING ?
> +                           BOOTMOD_MAX_STRING : size;
> +                    memcpy(bm->string.bytes, prop->data, size);
> +                    bm->string.kind = BOOTSTR_CMDLINE;
> +                }
> +            }
> +
> +            domain->kernel = bm;
> +
> +            break;
> +        case BOOTMOD_RAMDISK:
> +            /* ramdisk was already found */
> +            if ( domain->ramdisk != NULL )
> +                continue;
> +
> +            domain->ramdisk = bm;
> +
> +            break;
> +        case BOOTMOD_GUEST_CONF:
> +            /* guest config was already found */
> +            if ( domain->configs[BUILD_DOM_CONF_IDX] != NULL )
> +                continue;
> +
> +            domain->configs[BUILD_DOM_CONF_IDX] = bm;
> +
> +            break;
> +        default:
> +            continue;
> +        }

For larger switch() statements please have blank lines between non-fall-
through case blocks.

> +/* check_fdt
> + *   Attempts to initialize hyperlaunch config
> + *
> + * Returns:
> + *    -EINVAL: Not a valid DTB
> + *   -ENODATA: Valid DTB but not a valid hyperlaunch device tree
> + *          0: Valid hyperlaunch device tree
> + */
> +int __init check_fdt(struct boot_info *info, void *fdt)
> +{
> +    int hv_node, ret;
> +
> +    ret = fdt_check_header(fdt);
> +    if ( ret < 0 )
> +        return -EINVAL;
> +
> +    hv_node = fdt_path_offset(fdt, "/chosen/hypervisor");
> +    if ( hv_node < 0 )
> +        return -ENODATA;
> +
> +    if ( !device_tree_node_compatible(fdt, hv_node, "hypervisor,xen") )
> +        return -EINVAL;
> +
> +    if ( IS_ENABLED(CONFIG_X86) &&
> +         device_tree_node_compatible(fdt, hv_node, "xen,x86") )
> +        target_arch = BUILDER_FDT_TARGET_X86;
> +    else if ( IS_ENABLED(CONFIG_ARM) &&
> +              device_tree_node_compatible(fdt, hv_node, "xen,arm") )
> +        target_arch = BUILDER_FDT_TARGET_ARM;
> +
> +    if ( target_arch != BUILDER_FDT_TARGET_X86 &&
> +         target_arch != BUILDER_FDT_TARGET_ARM )
> +        return -EINVAL;

So you'd happily accept BUILDER_FDT_TARGET_ARM on x86 or
BUILDER_FDT_TARGET_X86 on Arm? And there's no distinction between
Arm32 and Arm64?

> --- /dev/null
> +++ b/xen/common/domain-builder/fdt.h
> @@ -0,0 +1,7 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef COMMON_BUILDER_FDT_H
> +#define COMMON_BUILDER_FDT_H
> +
> +int __init check_fdt(struct boot_info *info, void *fdt);
> +#endif

Nit: Please put another blank line before #endif.

Jan

