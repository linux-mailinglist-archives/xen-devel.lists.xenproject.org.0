Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3FC76954A
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 13:54:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.572942.897091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQRTG-00086z-HF; Mon, 31 Jul 2023 11:53:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 572942.897091; Mon, 31 Jul 2023 11:53:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQRTG-00084t-Do; Mon, 31 Jul 2023 11:53:54 +0000
Received: by outflank-mailman (input) for mailman id 572942;
 Mon, 31 Jul 2023 11:53:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bN9S=DR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQRTF-00084n-LA
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 11:53:53 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20609.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eaa9bea8-2f98-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 13:53:51 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8966.eurprd04.prod.outlook.com (2603:10a6:10:2e1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Mon, 31 Jul
 2023 11:53:49 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Mon, 31 Jul 2023
 11:53:49 +0000
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
X-Inumbo-ID: eaa9bea8-2f98-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=abETt4sPeMiXB0FiNM+436NMHjwDBdbX1UKhyr2w7YMwj+UwJrK9C2qUVu8Vwm+aNrpUIu4OACu/Fthh/nSWKrYj96KJCh2g5fo5seVCUzb2XKVP0rvYOKu/WV0EuxAdbff+Gj5+Ub72tTUpdxseErL1ejVjwJMYXNZAPkGK6HxgiGKsxpmeeBE1H/CymxG5PCF4D8D4GTclQK2KZyXS64uEm+Eu/dbfkmD6himv4r57XgN3Peqc67JbgFQBZvAb86mfWLPR5AD4HJ9CwEuRCPasRVepddQPfsu5cB8J0Gylmc1F4yuEYHsKH8w9z0GlmoiEQpUWK46iTKzhKLd4QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=imOmaTds8fMDWiVdJoDNGj1OHQOgFq6px+l/HTwbCKo=;
 b=CS+rB8CCDDhknn9uuvxZrf3Yt0TYvQ7WnI10aAjTpIQcEneNSnHyd3tyAiDpB9oMXHKTeQE5dq8hRScPvXjkUlMSvZRnJRQeR2McAes8tq8RlhQa2DBhJXHDDZ6hwye+04nFT4p3UaDJlPGRCkKrR7hXO7LbPOYf/RBFjhiAjcWsb3S2OUQ8dMUx+KuA4VH5NsM+VffY9EIh2ztzTt7Hzn2ISWNbVUIDfW5tv3i4E5AB0PsxM9L1FEGoowC9E+E+NlhkUlxBULJrWebbze5z9w5JnYS52+geUiv+08uiOyFas1QJBh+7d/hUc4fjiJKxqUBKLfBn3vdXPhYyfQqA3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=imOmaTds8fMDWiVdJoDNGj1OHQOgFq6px+l/HTwbCKo=;
 b=lXx3RxIJYWu8nF7S3vxkv2Id70kPeMYlsf/ty8q7akgsPKO7w8e4ZVeGPJqjzoeI7908NDAzD0NBBuDY6M8X01t9luCfGDlSeW7iJ3IOnqgp981nv0chKFjXFIr/9UrOts/2yhMBDdyeO1sNZiI0mPpDT0RqGmIF73a9U7gIfmRRnguU0U+74ie08fmrLcR16JyyoS1NoJ5OG0fEJCCDs+UAMZvm0R9wZ1Dy+7SH8barHA2Bg+0RNSyyJT4dQ26v+oHb9Er7VzoDUiZtSZqjth3cEW++JHBMx8/fazXcuUX/9szSI/VgkTuNmIXtu6Z1M1IVWvuPO+Ss7akkru23Sg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ebd46128-a8c6-4aae-4efa-85ce889d0f72@suse.com>
Date: Mon, 31 Jul 2023 13:53:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [XEN PATCH v2 4/4] x86emul: remove local variable to address
 MISRA C:2012 Rule 5.3
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1690788513.git.nicola.vetrini@bugseng.com>
 <d9ab52ae16d3c9a780403906db52b42f24c1e60a.1690788513.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d9ab52ae16d3c9a780403906db52b42f24c1e60a.1690788513.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8966:EE_
X-MS-Office365-Filtering-Correlation-Id: 6230c135-6b0a-46a9-3734-08db91bccdbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ePQc/ZBZC2AtXoI+1V2oBVe8py5SLpzD3eIIpnv7WP+m2efwI1Nxb6Iq/CMQZolz1/Si908Gy39qGZ26JE2m91LSvd5T5h5L9kEbizs9Tnxq5391x5SesIc8XlQdRz2BGBRKzdYITs5RIk4fQ2vZeq9Vui4VlEmlB2e59vpyA6k9PkKgYYiUwTP8CoWuR/cq50MKlIIm+RvzgJtl/cnxHFqbnOJcWhCr8mIeOZ6zrxI/cDOA1z0SlDhbzlnrhoWE5YgPzBmXKhuiSTIExEvQEl4c01/jE2I5lUSTzUwzoIOMPvHVQKn1kN8vLNklllVZscU8Ri1rrzjwvzC8EOrdgcyhV5BWjDr6bRWPzK7tLkxLr6SamMndSWJvGX/9UBaACQkQfQbBVh95XwcraZecRkll46P7elRllNuU42hX/bDN6femwScrizAmhhcnP54JMdZ9IrerLyDtfYQEQ6ylbpWippZXOzOTmrGu2Y81YQ3zuxI9cpYtLBWyUfP8VTqjO2cDWcxvgnpxQ21Yihm1VrxQZB7ySGAvr/LNlgdfRR+8dHBykkqPDRmaSEP7AYfMQ/w/uh+HuPg/iOeWKzC6PiU7nEweGbq0UMWaJA0V+XO/S2z9M1Q5uf4cx0m5EK+umFHOpD13KN2lNd0J5p09Hg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(39850400004)(346002)(376002)(396003)(451199021)(6512007)(6486002)(36756003)(53546011)(2616005)(26005)(6506007)(186003)(66946007)(66556008)(7416002)(54906003)(31696002)(86362001)(66476007)(316002)(4326008)(5660300002)(6916009)(8676002)(8936002)(31686004)(41300700001)(38100700002)(2906002)(478600001)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MktTbk5nUWdpeHlBS2JsQ3o1b2dGdkVUOTM5SVliTG9aZnVHczUvVWtVOXkz?=
 =?utf-8?B?Q0Y4SWNvY2JZWXBqQmpENGg5dWt2cnRKaUxXSnBLNnhqUWFPaW1DdXNsMndl?=
 =?utf-8?B?MkpUMlppbldua1BGbnBUdy9GZHVQM0xIRVhCdXZBQVBUaEF5Rkc2dXdFMjBZ?=
 =?utf-8?B?b2lsNTlsNUROTDlNbnAyckJzdTN6M0dPbUl0TCtLWlNONjZEY1B3TnQyQUdX?=
 =?utf-8?B?KzVkeXgzc08xa0ZIT0UvVGl4emxnTnRIQTJSMEpDOGhhaVk0Nnkzbmd1RENJ?=
 =?utf-8?B?SjErblBYdTFybFpXS2FadkhFWERZclRhVjFNV0VEU0JBcTVlSkVmNEVBMkdi?=
 =?utf-8?B?Nm1OaHF0WmhsTkhtaExURHFnK0lrZjhXZS82a2FYemZCaVNlRk5qMDFUNVVD?=
 =?utf-8?B?ZkM3L1d0MHhVOGxiaEMwYXZjeU9UU3lwWHlJL1F4c011SE42OWNCdHF2UTJ3?=
 =?utf-8?B?S25PRmxHNVZweHFSRm5IOFd4QjdNNi9FTUVDSHJlWWhUUGhiZ0F2cE5Sdmds?=
 =?utf-8?B?Q29PWHVwS0JtVGVnU29yZ1A5dW11eHVRL1U2Wno1YzZKSXVXUXRXMFVrRlNQ?=
 =?utf-8?B?SDRvakxZelIxOWVJd2NFZGMvT3JsVTM0VTRWVkUvSFZ3K1pwK2hKQWlmQ2tM?=
 =?utf-8?B?dWVqTUVhZzIzZXhTaDV5djVla0R1SEx1MW54OFJoMUhyeW1pN0RTSUhxVi9D?=
 =?utf-8?B?V3ZpUEpZR1FBLyt5anN6MGh3cThRVjJ0WE1iLzhGMjJrcURyNmtpTUZCWlVz?=
 =?utf-8?B?SzhvazltKzdsWWdjWTZrQVJ0cDFzbDcxNmRuRmFqZ29QNEViRVBiYjZGN25l?=
 =?utf-8?B?b3UrNEFnN1ZlRkwzdDFwMmhhNzZRa1JMWkJSbG9pRG9RbU1DU0I1UmE5VldG?=
 =?utf-8?B?MDBzOC9IRVZyUzU1OUtFNGxtNWpLY2pHMzdSRWIvTnY2eHo4YmpjcUhFb2lU?=
 =?utf-8?B?MkZ3d1RZVXBsUjFSZEtraC8vZytYTm1rZWtINStKcDhUTFZ0UCtyZnZGREFz?=
 =?utf-8?B?cWpEKzlRNklvT2hmVU1QVFdKMjdqcERGQ1lkZ3lDdU5FWjNQOVNtV0tQUUFF?=
 =?utf-8?B?ekZib1JEbDJKbGJWczdEZHF3QmxzZW1WbFRzUG1tYkNaNEdZeXhINGpIcVQ3?=
 =?utf-8?B?dHNPTnhoSkJ3ajFyMVlDSlFjcEIzNGJmeitQcEt6ZWJ4dDVXeEhxQVc3dGlW?=
 =?utf-8?B?c3NLTFVFOTl2czFQMzcwb01yckVUcW10Z1B0ZlJrSWM0Tk5mN0g1WVJDVDZ0?=
 =?utf-8?B?RTRDb1hrL0FWeGVrR2xsc21pS0tIYWt4amRnWVRicDNNcGpza21jNHhKekk5?=
 =?utf-8?B?MHRVRVpRVnVuS2N3VlZCdjcxNFJFMlFOd3JBZGtnMW9pbGsyd1ozYjluYlFa?=
 =?utf-8?B?Y3hhY01BbnRaUCtDYmtpS0hKYXY3WW5raEE2SS93NVNaRWE1TFIwT01RVGxC?=
 =?utf-8?B?VTh5UDY5ZmdkSnJoTFJ6MzlyYVI0K29ZejJGNTNtbDhjdTU3a3cxMlJWa1JF?=
 =?utf-8?B?UW5ydVEvWENBNW1mU0l1UUdkTWR4T0VhUVJjWFllbk0rL3RoYTJubkVpZUli?=
 =?utf-8?B?YXQwanpYWVVlYVJEUW56aHN0VXF4bGpSRDJZQlRHdDNtMDVBK09qUy9Kclhh?=
 =?utf-8?B?VUU3ZHBDbEVQaytNc0V3Ymc0SUQzS3BpQ28wK3hDUWswcFZLajRVczZFRzhu?=
 =?utf-8?B?em02cExjZkNsSzJnOCtmM2JvR20rNXRjVm5qV1dSenBhWWQ0UHl3NmxReG5U?=
 =?utf-8?B?UVJtTG93ZE1ta0RNMFRMcVBCZmlXOUN1OURUWmhGcGJTZWlRREJyNEZyVFNv?=
 =?utf-8?B?U3JHbjE5ZWpoc0lJRmJIUXhQSURiS2pGUGIwTWtybVhGV29BZEhWMDJaV3NU?=
 =?utf-8?B?b1hyVGpnMXhDajZrQytMei8zaytua2FjYThzMnBVKzNLSUVndUNpc24wOXZW?=
 =?utf-8?B?QkJDZklBbjBKcERqWTNDeE1KZElLUnBpV0taSUhFcWp6MW93ZUhzcGllZWc3?=
 =?utf-8?B?SlRxa2NrbzZUK3Y2cnVvYVRCaG1MVFhPOXJxdHI5WXZBQnJaaDdTak9BOUNv?=
 =?utf-8?B?ZjVYM1hEendtdmhtbXlDQnYyaWo2QncvY0h1eERkLzJaTmlHQXlNTmZ1Vzhn?=
 =?utf-8?Q?1zP2XzJGJCfzvCepvjNqZuHKw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6230c135-6b0a-46a9-3734-08db91bccdbb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 11:53:49.6103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LInktQhGXfsgcIrL6HzZmwQE3Y35t8OTi9VaLOxmUR/PQTN9hJTD7sYXVjc/LMBy6HxjWK8KJOfBiMpc3L5a1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8966

On 31.07.2023 09:33, Nicola Vetrini wrote:
> The local variable removed by this commit shadowed another declared in
> an outer scope and thus violates Rule 5.3. It was introduced as part of
> a refactoring by commit abf5fb62f73d0dbeabc6a8cd6dbb55174b36c8d1.
> 
> No functional changes.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Albeit, just to mention it, the description could have done with making
clear why the removal is actually correct (nothing like this can be
inferred from pointing at the variable's introduction). But well ...

Jan

