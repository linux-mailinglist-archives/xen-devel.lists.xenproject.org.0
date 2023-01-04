Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA75865D9C6
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 17:29:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471296.731096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD6dZ-0007dP-KN; Wed, 04 Jan 2023 16:29:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471296.731096; Wed, 04 Jan 2023 16:29:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD6dZ-0007b9-Gb; Wed, 04 Jan 2023 16:29:09 +0000
Received: by outflank-mailman (input) for mailman id 471296;
 Wed, 04 Jan 2023 16:29:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+XhT=5B=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pD6dX-0007b3-Vz
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 16:29:07 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2044.outbound.protection.outlook.com [40.107.20.44])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e87ed6b7-8c4c-11ed-91b6-6bf2151ebd3b;
 Wed, 04 Jan 2023 17:29:06 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9584.eurprd04.prod.outlook.com (2603:10a6:20b:473::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 16:29:04 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 16:29:03 +0000
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
X-Inumbo-ID: e87ed6b7-8c4c-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fDU9paoNdYFVwZ1CnLYr0VfEHjf1dyc+ZhZuQz6YVhuATmGywPvoDXES9uE7/9ia/ZlJ07R5rEqbHFde+KGsd69miJfntoWSH4r6VG18Ov3h/7EEHep0vsDR8wvy/yj/SudVv6cUkMdwb9Nx3k8MqRH/W8ByD8u4yxs3WAvLLlZTwQeCBmrfZDwuM0e/R5YejWPEqbDI+Cgl519Z3FWAmuDtwG8bUxxDmqKCKEaTo64/gS9c5tBFdyTtfpHAG+bwduGROwIwMNhltdQYGPMUmYrSoKJ9enBZsgDl3iIvnxJvneLL1vPIJ5r2uR8COyTthh2C0gL+coujE31LCWfBuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YYIvdnzux6f8D6z+9d1KjGqws6fClpdUIa/CmQotqho=;
 b=T3o1oHLJ/LK9zDofWyQ5+/bZHked8AB+j9NzXSFsz0lEEO1e9UUoI4xXPRg4oSwSanHOfy/oS2VnE91gqOnqN1tiylKg27BS7RH+yPyWtqdBgK6pLFnpkiaC4XELT7HFPd8doaTGsv8OYm30lM35CzFUmK77X1j8aMSd1PZbpFsB0JBclDFIxvJh+4/kLao7jTnqBs4/bGV0DE3cjNM9i1QJWemj1k5MmQWSNvGgA7Je5XyByOpMKvv9E7Bo9tsUiN4sLDxswWCeFUx8DwSu/SrQIA3WTK7njQW4NWQdcK2DuL3QfzzXt2ckqcO2fC01jGWLBmMmTpNINCRMUwx99A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YYIvdnzux6f8D6z+9d1KjGqws6fClpdUIa/CmQotqho=;
 b=bAQBfQfM81T/jgqtFtm0lm0fOXjhmIPJisCn3eMAx27sYIm5pot/F00BDEyH0jtY6BchOow3p3Rl/90Fv0xhovJgAkXPY/JGit0Rqh4e8fS/qBOO8KJrDDzU0pjMRjQHgrIMZWKEXQcreFrn+BDbvMhFr9YpYz6rnrBLetXTcPB5soITIWxowUIAU3TTQJ/bU93FcLhLl3BQlFubCf5yE4ki8aBaoFOwsj40KnKE64ycnjcsGTgazw/E7W+dHhNYTgFDiLQ8EfHke6H/CPXNq2CTQRs0Xe4m+kFq8ofDbn3zU5JXX1VIr0kkA34jwOBH5ikrFEuyQFJLOYwTvsbAbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <074042f5-ecc1-11c9-bdcd-b9d619475d58@suse.com>
Date: Wed, 4 Jan 2023 17:29:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/4] xen/version: Drop compat/kernel.c
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230103200943.5801-1-andrew.cooper3@citrix.com>
 <20230103200943.5801-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230103200943.5801-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0136.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS1PR04MB9584:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b379f1a-b868-4afe-3e69-08daee70cb11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8fwNwtfOnFpeg+cvUu0La0O64US0YEfij3D760+CsAIuzu0orLcT4r2LCps9j6VXSeXyoXoOBTxqYY5WbI1lSOnmxbA8046p+toYlKYD57nXc2L+3WALWwuzsMrUxk97aP2oeSDjvXh7MIsp8xXDzVpW3n3N1o705vOYLG36MkaB0Eve+hNibl3DExO6G0N10Bfc5IU0nViH7wRPQUWiRmNuFA/foc9gDpk6uEvr5pWiDMEdN/hfn2hpL49bHwMKBMXlQUpB7HIwQVigidjZ9G3V0ftOj2CHBFXIPSkRCNbPOpztMvBU8jfXDt5Pt1Vu1+ZyhgMMEXu9o8Bjk1ARvfxBiC9DQ/ArTV7kCVKF2O3XYAVTfIGafivUPei69ams9vwkMU6RRXt+L3Q6l4ycMvDxZePYLDqSwG+Zn/gi9IcLo+kHAuqCQR8QG/kYRlW9SY9Vvkbu5ctZlZzRiK6JuF/roZrlba0MeGPEEABX1+Rbfyft9l2Bj0Ss0oD19y1MaenWLpi1tyI32J7ZkKyGBhdRTcSs2k5TPKGtafUjcxMP9MQuRg6ooAHr/XEC+LApCf4nxYZdM8toCwD8emw/fwn7ox/sOEmDh6Lp5qPqZ7v8FqjNtgB7BbXU3lOmfP4dxPieTIBXAiGLRTZyaK4fHYPUVKVxoeLAfqM4sHfPRVCn8BqFGzvYqXKqSY4mLaMVRC0ajgWncMZ/utNEggPGumeJpVMO2S6FKDLxpyl2OEg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(376002)(396003)(136003)(346002)(366004)(451199015)(36756003)(6916009)(54906003)(53546011)(316002)(478600001)(31696002)(86362001)(6486002)(5660300002)(2906002)(66556008)(66946007)(4326008)(66476007)(8936002)(8676002)(41300700001)(38100700002)(6512007)(6506007)(26005)(186003)(2616005)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUgxUHFJdmtGTXR4MTlsVFlub3Z6TmtMRjZPMDQxOEpjZTY4QlhMbjJqSDRB?=
 =?utf-8?B?b1hXUzN1WnVVZWYzTFVWTHF6Mk1oNG85emZqVlpHanNKSVhwSjdUakVZSTJu?=
 =?utf-8?B?NzRpMlgyaVJ5V29XWThmcnpMNC9ZVUNUK0xBTXVwbXlvS25lYklqendveXls?=
 =?utf-8?B?bWpsekZmOHBnWmk0OFJ1MUtKbG5vazY3ZGp6aWtSMm5rNHdReGZWdGI2Sjhy?=
 =?utf-8?B?S2IxaHRFMHBKMU9qTVh4YXdGY096RmVpV25JWUJReGZUNkZzdS91QTlRUSt2?=
 =?utf-8?B?cys0L0RRUVFRbSsxSVNRbVFGWFZKdTdLT0hEUGJ1eGxzWjhXaXNqWDQ5Zi9G?=
 =?utf-8?B?VHUwQitYVTdEcXhvbXVna0JVdWlJRkZOaXNKK3ZmNGRzT3JJTy9vS0drZFF3?=
 =?utf-8?B?V1lGQjVUdHY5c3M5c2hrbmw0Z0krZm5yTUdrSGMzVlRTYUpCaGtjR09ZZk9V?=
 =?utf-8?B?WkkrTFJQVi9XRmRIRUZDVnJabGZrNlhmZHQ2U29hR0RnMnF3WnM5M2hVTXQ4?=
 =?utf-8?B?N09XcUorano5SDIrck1IZHNkM05IbnR2b2xzZGdDd1pjWm9sUVpkQWFCaFZu?=
 =?utf-8?B?NGVMenpsRnBKK1VDK1ZEMEw4RlpIK0ZKcmQ1cVBENFZNelV5ams1b2NFb0tu?=
 =?utf-8?B?eXBuSzJ3bGhRcmJyb3ByWGY1ZjUrYnVRbU95WVhtdzB2ZFY0QXZyOWhtdk5u?=
 =?utf-8?B?SnAyVXZsM2N6WHZSRCtBVVhvNUVBTW1ZZWZlSS9xZlhHRWI1eGNYWUNHZ1o0?=
 =?utf-8?B?YlNJWFAxcjR1eThBUHIrYzhqSVpVYjJuMlhzMGlhV1MzZDc0cEtGdjQzZ2RC?=
 =?utf-8?B?TGt0ekxDQTBaZmFUOVZIbFpJVlRnbGp5cFZTQWIxVkV2NUVjbnV1WnhsTUNY?=
 =?utf-8?B?Y2ZNeUZJNVVSbTcyODNaWHJaNUlYNSt3V0VBWFZyRlY4Z2U1b3pjUUdVaDdm?=
 =?utf-8?B?dElETHJwV3hQWmhDRy90TUg4azZVSG9zZU9SaDZSQUhvVCtJMWRrNkM2N0c2?=
 =?utf-8?B?VkF6bi9TSFpXaUMzYVlXYW9MNmVnUlRoRWFwVVlCSk1CVWlma2NqUzhEa0hm?=
 =?utf-8?B?OEFWRy9OZGM3M3hOTkNtVXFSaERRbEFTazhNY1NHdE1UcFZYVUxKMkJCQWdv?=
 =?utf-8?B?R2YzelFpbTNzclY4WGNnOXdtdXFxM1Z6Q2NuSk5LaE50R2M5aUowSnVxd3pr?=
 =?utf-8?B?NW5DZXRGUllkWFUvU0kxMmVBaVlzQUsrVnk1dTY3cmNROTdsbVVKb21hcHg0?=
 =?utf-8?B?a3BVNGs2ZEYxMThsaDhuSFFvZUcvZDhpeXp3NUN5OExtNkkwK3k3d2VoYnpx?=
 =?utf-8?B?SU94ZXFWb2FZeEN2MnM0QldtT2pXOVdQMm1LQzdqeDlZRXA4dWZleEhEbmxi?=
 =?utf-8?B?cjVUTG5GNGhRM3lNTGFjcXNOWXZhR2MvUlJ0NU8zWi8zUEpDL3JxZkdDTDQx?=
 =?utf-8?B?eVBBUlM5QjJwNnFVVnlEYkNDM0FrWUpzTUtzRU1uNjhrWGRIeEVzS0JvWGtP?=
 =?utf-8?B?QmhyUURZaVhzTC9uTncwQTZHMXdxZ0s5TXA2Skl1bDNjaUFRWkJIZ2lZVlFC?=
 =?utf-8?B?VlQ3NkUvdVloWUVMcHBWYXFaejlLcjdmV2hJVVRRUDZOUTlMWDFzNmo5d3BL?=
 =?utf-8?B?Y3FHU0tscUlFaHl5K0hCNnRZakprV3lpMmFWakRLa2h2REE2emlncVFkYXBh?=
 =?utf-8?B?ZmZIVWpOYVJ1aGNzc2YwdGlXNTVFbEU0Rkx3WFJSWnZXUjZuYUpaSm1zM2g3?=
 =?utf-8?B?c3g1VkdIbjV5WXI4T1YzbU54UlJvZlA1c1VoTnVQOFNnL2hJc2lFU01HTkpG?=
 =?utf-8?B?VmV3a2ZqL0VCanRWdFNMRHdzWDZDY2oxb3JhbVBXSWJUYm1ldmt3SVQ1eCt6?=
 =?utf-8?B?VlIyRXZ5UStWT3lFR2IyY1AzVnpqSDg0K1BjNmttejVYTjJYSDFjYWJYYzN1?=
 =?utf-8?B?Ky9ZZENnNUdkb2JDbFFwbEJadFN1VVEwY0swU1NBQit0SkJ6Vnp1VHVQU25G?=
 =?utf-8?B?TlVucFk5T0NINjRvdUlJNG8vazVsM2lXMkFKYlBUSGEwOWhRaWxYWWx2MVls?=
 =?utf-8?B?OGZSZGNtMm9KOE9XSmxDSFF0Y2V3V1NIVml3MFVnaSszbVdyMzJRb3NoS2lw?=
 =?utf-8?Q?4G3nlEN6aMIb9wgBAdBPs3EzI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b379f1a-b868-4afe-3e69-08daee70cb11
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 16:29:03.8405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UHbYP3SdX5R7wWmqtaiLWfvIN0izWZIlCA/LBsNqhBg7DegTbALWNt3WGBjYrALsok+iB0qxI1ZWy289miWERg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9584

On 03.01.2023 21:09, Andrew Cooper wrote:
> kernel.c is mostly in an #ifndef COMPAT guard, because compat/kernel.c
> reincludes kernel.c to recompile xen_version() in a compat form.
> 
> However, the xen_version hypercall is almost guest-ABI-agnostic; only
> XENVER_platform_parameters has a compat split.  Handle this locally, and do
> away with the reinclude entirely.

And we henceforth mean to not introduce any interface structures here
which would require translation (or we're willing to accept the clutter
of handling those "locally" as well). Fine with me, just wanting to
mention it.

> --- a/xen/common/compat/kernel.c
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -/******************************************************************************
> - * kernel.c
> - */
> -
> -EMIT_FILE;
> -
> -#include <xen/init.h>
> -#include <xen/lib.h>
> -#include <xen/errno.h>
> -#include <xen/version.h>
> -#include <xen/sched.h>
> -#include <xen/guest_access.h>
> -#include <asm/current.h>
> -#include <compat/xen.h>
> -#include <compat/version.h>
> -
> -extern xen_commandline_t saved_cmdline;
> -
> -#define xen_extraversion compat_extraversion
> -#define xen_extraversion_t compat_extraversion_t
> -
> -#define xen_compile_info compat_compile_info
> -#define xen_compile_info_t compat_compile_info_t
> -
> -CHECK_TYPE(capabilities_info);

This and ...

> -#define xen_platform_parameters compat_platform_parameters
> -#define xen_platform_parameters_t compat_platform_parameters_t
> -#undef HYPERVISOR_VIRT_START
> -#define HYPERVISOR_VIRT_START HYPERVISOR_COMPAT_VIRT_START(current->domain)
> -
> -#define xen_changeset_info compat_changeset_info
> -#define xen_changeset_info_t compat_changeset_info_t
> -
> -#define xen_feature_info compat_feature_info
> -#define xen_feature_info_t compat_feature_info_t
> -
> -CHECK_TYPE(domain_handle);

... this go away without any replacement. Considering they're both
char[], that's probably fine, but could do with mentioning in the
description.

> @@ -520,12 +518,27 @@ DO(xen_version)(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>      
>      case XENVER_platform_parameters:
>      {
> -        xen_platform_parameters_t params = {
> -            .virt_start = HYPERVISOR_VIRT_START
> -        };

With this gone the oddly (but intentionally) placed braces can then
also go away.

Preferably with these minor adjustments
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

