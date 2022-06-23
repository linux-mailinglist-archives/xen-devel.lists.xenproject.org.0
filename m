Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C81F8557715
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 11:49:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354750.582025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4JSW-0002Lf-6A; Thu, 23 Jun 2022 09:49:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354750.582025; Thu, 23 Jun 2022 09:49:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4JSW-0002Ib-2h; Thu, 23 Jun 2022 09:49:08 +0000
Received: by outflank-mailman (input) for mailman id 354750;
 Thu, 23 Jun 2022 09:49:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CRa/=W6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o4JST-0002IJ-Oz
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 09:49:06 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60088.outbound.protection.outlook.com [40.107.6.88])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6f6965c-f2d9-11ec-b725-ed86ccbb4733;
 Thu, 23 Jun 2022 11:49:03 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB4385.eurprd04.prod.outlook.com (2603:10a6:208:74::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22; Thu, 23 Jun
 2022 09:49:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 09:49:02 +0000
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
X-Inumbo-ID: b6f6965c-f2d9-11ec-b725-ed86ccbb4733
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FI4aQrOgKc7nK9ju4k22Y3uZ06BmeY474C7YqYlxomZeMfBXKelhu9iSsAqRsRSOw2I5JFUboC21k4jkcxdEUU8m6RJI8uzPkYOurI106PkTNJuow5UXuY67jNjXq1BqbebwxFh13U9CyqAMCHjXCmcTRCZmNMyP42bhtwyQHTheb5SsOkTW6Vfn6N5dsMufxYRow9BGlio/310u8fYVUX+bUOZaazZCdseK0DNKlHmovlTk88eF5lc2Sc68Aheus7KmGuAvBnHtePe7y1f2PLWvcR9XKzroEIk4VB5vGOu+MJayL/BmCDjVIQ7TZRF2yTm3joVTxYiH5FFONHYucA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fzPfA4UDnIVpPE6hjVBB4ERwhtRK52DcWyywnHSgmxw=;
 b=OY/eoIpEflmeRhKYx4vEZLW7xa/W590MD6YY/xn5T3he4wX4IA7rEJOiFESjv9U+ey831yu2TbdqRL0nZSPwjOqhn9+4l7n0Vry17ogCNaR9UrZv1AKUd3veHMirRd21Y/4dgkvsM8ghf2u5RdercV9xBhoQStRe3WNXlJFwulQqIJ2L1FHHj9tixd1M5kw4JKGp3HkfbiGmxtP4hZ5MwmYtAaBvgbyRfyqebJnx3Jr0P0ry9LTCAApq0VD+BRNBQ4A8m4M3v/Tff45O/m5ds5o6tqkuw0YGCWQDn6Y/rFr1bMMNfulzjCZfU7c1ZHRN57GPnKLyyizTdRuSw8CcLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fzPfA4UDnIVpPE6hjVBB4ERwhtRK52DcWyywnHSgmxw=;
 b=SncYYBOQPdU/fJKp8aYIa8CrUC9Qedf2PncNHXVI6COt1TQStyN0TC98A2NsD0jhqjZ+pkyD0/RnynkkbFDZJTfHBj/hL7Nb8hYT7/KI4DnF5T2xNggGhpOHSi2viSYqeXgHT11CF58FHWl5RItGHJrDykMG6P0jxnS0EiRWFmV9Ec8M/i7hc0sO5NIWDO8klLSZ2yrzPQAqMZIUrBnHHtlWVWcw0dsYJzw3I+KQpftMHknXrgnC/AzmnoOvsayilti1OMn2C7G6M7lPolrLJRN3LWWocHiAiReON5VzM09sICaJ8ra4h9LtVfaJfkY104Qe/0zpm2uKM9n+IeN+aQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a968598e-cacc-d762-46b8-579e18f64d12@suse.com>
Date: Thu, 23 Jun 2022 11:49:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] iommu: add preemption support to iommu_{un,}map()
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20220610083248.25800-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220610083248.25800-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR04CA0074.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5af40d5d-f98e-463e-f320-08da54fd9a8f
X-MS-TrafficTypeDiagnostic: AM0PR04MB4385:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB4385CA23BC0C7DF4AA207A3EB3B59@AM0PR04MB4385.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lkO0xHMMGded0xi/lgSNy3oZhYMKNO+ggfoktSv/9MTvwphQQ7AFizMHYajAivIqUpruThUJlkEW/ux8r24rINsAmXqiL6zxDixa/J+ymSY9zu+6W+/1YIbjy68fusdXlUXjPe5d6zo+U1gL7f+Un2HDxcU0Y7MQISHo6lI15uxj8lcn2YXktKCqVGGER5FNedXEybgIEJYwd/NZGNcJaS6z8H1g3yOcpNm8EhoWNvB84eFdPU/ue6rQiCuG0AoKqpcxkgwROZ0M8knE1LpEJqhSfUUs3kMG57RzD6YiG/aORPy6M+O2fS5hia2UXvh1k/y3o3ioTt4h1LAjxKZAIwbkBUm+kvm1Vr554Z7+uWt8rjV8IGQalIYU+dM7WUUF6hhAgd5VVJVCu+ZIbFptD6zcU1qsydHrhAGXajOASoYlKuLTjkxvw4tOmAhnWmFaU6C5YQkcSjw9Nfxfby9YZBq2UN0f3eJvX+7e570InzWft7fh9BNgIzpR/JqfZrVkSwm0KDYcoNOm4SZCjaGbEgZi2aYwOcmyTkVLNL8k6vpGz/BIQ+vzVUuf3kvTQHlgVLIQK9gdakI7cc3pjpwe1hB9odyLoL+6jcIPfICGN1kngAq/Ec6brSOGRzgwA1TkvbMni9WhdgMks8Cs/XCydszdfgiZq0wXdYeBRSLgSP8luPeLOVcBu84bw7MjT7XX1++27GpodqxV8h+YF+eYjvvCM50MISJZHYC2QrPZTio5IIHHpdAqEJV7I759tWDM85rO14tTZj2HBzs4rBwUiCVcEjE6Jw1sFATL1H6Xgy0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(136003)(376002)(346002)(39860400002)(6916009)(38100700002)(8936002)(54906003)(41300700001)(316002)(6506007)(36756003)(478600001)(2616005)(6486002)(31696002)(6512007)(86362001)(66946007)(5660300002)(83380400001)(26005)(31686004)(4326008)(8676002)(66556008)(2906002)(53546011)(66476007)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1ZpUysrdFlzenRjT2NIN1ROQ3RTUEZ4Y1Y0NEpPVVM5RUROcnhsOU9pc3N5?=
 =?utf-8?B?dlJybUcrLyt5K3pwM1JJR3hkOGdacUdDY3JBRlFWNlRxS2tEc0J1VFYvaXl2?=
 =?utf-8?B?V1I4TXhRZHBaZEJqSUlIajJjS0tXY0xFOVI1bnlhb0RvZEZoZGF6d3FqQ3lm?=
 =?utf-8?B?Zjc2WnZEb2N5RGtVbnVXdkhBeDNPMmxwLzhqZHZmT2RmbWR4emxFbXZxdTdt?=
 =?utf-8?B?TkxtMjE0Mit6VVBYU1pnMTdIZ25jeGxtdlA3TGZLamRMSlhFQXRiYWJ6Vytt?=
 =?utf-8?B?SkxndkxLb0pYQWpqa3U0TzNQQ3U1cWFEU01FTjIyVjVCVmRjRHhGN2VMeWZa?=
 =?utf-8?B?c2JmTzNJSm9XbkFsOWRSaVpLRk5nS2pVcHBicUw1bm0vME0wdStiVUlOeG4r?=
 =?utf-8?B?WWdwRjJ6NUxsdWVBMkJ3SStxTGV1Q0Q5S05zRDRoQk01SGtBMDFONG1ua3Fh?=
 =?utf-8?B?YmNMbkxzWURWa3hEelltNzY2SXpCVnNENS9zaWhZNS9uK3luSVJmdVNlbHlo?=
 =?utf-8?B?U0x1RmVScSszbmZhbnFQOUFDZFpFdzg4eTN0TVNrUzNJdTAxVVBZY0dtcnhC?=
 =?utf-8?B?VDY1UzVpZVRzeWVWSzYxOHd6WjJZb2FoSDZvV291OEllZXVnaG4wcDduRlpj?=
 =?utf-8?B?bHlreXNXZ2UvbVo1TmFpeXdjQlhtNS9MZjIyblh2VzVFRkFDNFBBV05qc0lM?=
 =?utf-8?B?MWNLOWlhRzZEMmkwNGhuQ2dpWFhWbmRFZHdvTm9Dcmd3TStibEtpMVNwQnZF?=
 =?utf-8?B?aUlHZnViL2lrYU9NYVk4bzRXOFNsVFBqajFNcDljK1dLMXRDR2UvNDQxNkRu?=
 =?utf-8?B?S3NCT1RNVm1JN3BoVTdnbzZCWTJNUlFWNmoyTjJYdjZMZGpvWTVkOTBES0tC?=
 =?utf-8?B?SmRPYXduNFN3OVhDK3pHL2xjRXRqQmErTk9Kb08zc0Y3Rm9Yc0lSTEZPbjg3?=
 =?utf-8?B?NVVrSHpuQW5uR0ZuZExDSi9QbTMzM0w4bXlmSHFqWFQ5blBXY1VTeDFQalRB?=
 =?utf-8?B?SXR0Q1VZVS9td1JlTENpMTJxWlZLSDNzT3BackZjeUMzM1BUd09kZGxMVldq?=
 =?utf-8?B?U2JtOUdrTlcxSzd4NU53dTlUVm54Q0g3TFIxVU90WGpBa2ZkbkFnQ3lrR0FI?=
 =?utf-8?B?bSs4VjlxL1lSQmZ1ZG85VFVuc3ZSL3FFUzVUaDR6NWtaYkVJM2xiMjdWaE4r?=
 =?utf-8?B?dXdpYTRlMmRxLy9wVjRqakpkS3B2T3c2RlU0ODF2a3B2QloxYVNId2t3WThs?=
 =?utf-8?B?cnQraS9sUUZ3TTdIYXkrNVFBT21ESkJqdi9lMG9uOTBLcHJSanRqTGJqNVhS?=
 =?utf-8?B?cWFmZzBycTF5RzUydFRXWSttUU5adGc4WlFOSVdObUpVY0diUDdFSWlTSU5y?=
 =?utf-8?B?RFV5bFZmSXcxSDlEYWlmOEtoSE1wVnN6eWpwYm0zR05DRTJBQ0NzWkl3WmlI?=
 =?utf-8?B?ejhRVDhvanJkT09ZZE1XT3pJbis2WE1IQis2TmdqaDFCcWFkeFB4UitiL3FK?=
 =?utf-8?B?TWVBY3N1dEhIT2NZcUFLcjhnZXF6eDRMclRSN1hrOHdsVDAwZGFaeWdycVNK?=
 =?utf-8?B?RHRFNWRISVZnU3NLbXFabnVRZW9UQzdmTm9Za2NocGFyU2VHakU5UVhIdldw?=
 =?utf-8?B?NHV2VTREMFpzdmpIWnpYdzJtVzRvUlVyemQwSDFlNHBkWW1JOStUamhNOXgv?=
 =?utf-8?B?RG1ML2pNT0VYVkpZaXhnM1FXeUIxVFZoNWc5RWhYZ3Z5YTB3V3o4VFNRNmVO?=
 =?utf-8?B?NTYvQWZEY09vNmxDUlRmelpnaDhsSTRqRDdQbUt0QUJodEc2QUVLWTc1bTBU?=
 =?utf-8?B?RndPa2swYytmV2EzZkFNMlhTYU9vSFcyUnJ5MVJuZ0d5WUVienQwTHNNSW1H?=
 =?utf-8?B?eUs4MHVhZUFXOGl6UFhUdzZQQ2I1VXNRZjVXdmpFb3hFSU16VENoTy9wcURt?=
 =?utf-8?B?QWZxbS9DbHptL1dPSlFFMkpzdVErMFg3TGN1SjZheWErNHlCQWxrRGxkSFh0?=
 =?utf-8?B?V3ZBTCtVSGNOWEZnd21VZTdhcWVrOEM1V29wUE9SNitCTE52azhVM1dZcVpM?=
 =?utf-8?B?c3Exak5FTXlDdjJiLzVJS1hmd0lzS0Jtdlg5WnJWZUVieFpRS05zdjJKa2w0?=
 =?utf-8?Q?A4dMqWPBP1jzsLB6BzszqPWdR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5af40d5d-f98e-463e-f320-08da54fd9a8f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 09:49:02.4336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WOGNAdqodP/ynBvcSWqqo3DpmDiqd15xkuTdtWwlorORJxI1bKXVnsWqFzdZeu3PN+CKKWF3jgtiZxdZqMyVqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4385

On 10.06.2022 10:32, Roger Pau Monne wrote:
> The loop in iommu_{un,}map() can be arbitrary large, and as such it
> needs to handle preemption.  Introduce a new parameter that allow
> returning the number of pages that have been processed, and which
> presence also signals whether the function should do preemption
> checks.
> 
> Note that the cleanup done in iommu_map() can now be incomplete if
> preemption has happened, and hence callers would need to take care of
> unmapping the whole range (ie: ranges already mapped by previously
> preempted calls).  So far none of the callers care about having those
> ranges unmapped, so error handling in iommu_memory_setup() and
> arch_iommu_hwdom_init() can be kept as-is.
> 
> Note that iommu_legacy_{un,}map() is left without preemption handling:
> callers of those interfaces are not modified to pass bigger chunks,
> and hence the functions won't be modified as are legacy and should be
> replaced with iommu_{un,}map() instead if preemption is required.
> 
> Fixes: f3185c165d ('IOMMU/x86: perform PV Dom0 mappings in batches')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/arch/x86/pv/dom0_build.c        | 15 ++++++++++++---
>  xen/drivers/passthrough/iommu.c     | 26 +++++++++++++++++++-------
>  xen/drivers/passthrough/x86/iommu.c | 13 +++++++++++--
>  xen/include/xen/iommu.h             |  4 ++--
>  4 files changed, 44 insertions(+), 14 deletions(-)

I'm a little confused, I guess: On irc you did, if I'm not mistaken,
say you'd post what you have, but that would be incomplete. Now this
looks pretty complete when leaving aside the fact that the referenced
commit has meanwhile been reverted, and there's also no post-commit-
message remark towards anything else that needs doing. I'd like to
include this change in the next version of my series (ahead of the
previously reverted change), doing the re-basing as necessary. But
for that I first need to understand the state of this change.

> @@ -327,6 +327,12 @@ int iommu_map(struct domain *d, dfn_t dfn0, mfn_t mfn0,
>          dfn_t dfn = dfn_add(dfn0, i);
>          mfn_t mfn = mfn_add(mfn0, i);
>  
> +        if ( done && !(++j & 0xfffff) && general_preempt_check() )

0xfffff seems rather high to me; I'd be inclined to move down to 0xffff
or even 0xfff.

> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -155,10 +155,10 @@ enum
>  
>  int __must_check iommu_map(struct domain *d, dfn_t dfn, mfn_t mfn,
>                             unsigned long page_count, unsigned int flags,
> -                           unsigned int *flush_flags);
> +                           unsigned int *flush_flags, unsigned long *done);
>  int __must_check iommu_unmap(struct domain *d, dfn_t dfn,
>                               unsigned long page_count,
> -                             unsigned int *flush_flags);
> +                             unsigned int *flush_flags, unsigned long *done);

While I'm okay with adding a 6th parameter to iommu_unmap(), I'm afraid
I don't really like adding a 7th one to iommu_map(). I'd instead be
inclined to overload the return values of both functions, with positive
values indicating "partially done, this many completed". The 6th
parameter of iommu_unmap() would then be a "flags" one, with one bit
identifying whether preemption is to be checked for. Thoughts?

Jan

