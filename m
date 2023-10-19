Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA2C7CF74D
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 13:46:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619260.964062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtRTA-0006il-I6; Thu, 19 Oct 2023 11:45:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619260.964062; Thu, 19 Oct 2023 11:45:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtRTA-0006gQ-FD; Thu, 19 Oct 2023 11:45:40 +0000
Received: by outflank-mailman (input) for mailman id 619260;
 Thu, 19 Oct 2023 11:45:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g4nO=GB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtRT9-0006cw-Es
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 11:45:39 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20606.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05c5e1e0-6e75-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 13:45:38 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAWPR04MB9958.eurprd04.prod.outlook.com (2603:10a6:102:380::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.22; Thu, 19 Oct
 2023 11:45:36 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 11:45:36 +0000
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
X-Inumbo-ID: 05c5e1e0-6e75-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BuI85PPti6YIAYnjE95yuDnehOAf5Y19EaF42r4gMnpqUpRLhpyHPJ/P6hYMmQ5Vuy4xxMWA39LgF/SOZI5y8kopwiBVChCrl6kSgSEx6+onbkoPBvp8g0+nLMufnYpLgbvCrf1MqzIEHIcKRHlLUoYjUm4WPUPK2Jw1hUidxKto0xNgPa7Wm1QPmElud9H2KyY5vdgQOVUjDcpeAnpeqvtIR43h7/3g5syp3EJJTquPZlL13yP14P2GRsUntBAEhAdJUf/6b75v0GbfBwB5q5LQA/xyCvg2i1o7jCVSmw55MOFAa/P0/s4DwxIwF3wBFBCttgvu14t/QaXlVBTmQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7GlvpTOHiSo+w+OjXg2GACEazVVU3JeFmQjRK4NWK0Y=;
 b=BPtsHbbEipKaLUOCzxOfjVZxGOmIdvWCr742jiZzk/KUkjlsRGyBLSNg/F64DjmRnrexjIHU8GH6kHkOH2zxsD1VVWGzeqHw/gI5t1cfa/AFOOip6oaKrU8+rLVkOWsYwQ4SY2xbQsTh3HAVI3Gbn3YajNg0K3YHdhMgY8mkPbd5EVUfZJ7p9DAaSMLgdYpjStJB++wdYdZQ0IWoO9ozRKZRsXJwDv4xyX9JlZGzZKv0bhuR1+4C+Jb0S3saiwqDwOnIeHhW80DsEdK/NMjTrbfNunkrHq5ttzGTduDGeEjPumHC9N9hXLwEWnKXW8RKXa6nKAveQ6qi2tkVrxaLDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7GlvpTOHiSo+w+OjXg2GACEazVVU3JeFmQjRK4NWK0Y=;
 b=KhUtrO6fa32Y6o1CGv7oneE+wOW2WYMbw7m6f1TmMun5QBWEIBgCl6wnHGQ+Q7xUBZ2tf4wZWHniH8kVbY9883TKURUz2Dg+5UZ5i9oJUgkpxhE1ttiLK+Doch/UAOPOxAxbzxPS96xgkXFPC+sGxw/h48rv8Zq+oFW0dieBP7KAREqO3rF3MDKn5g6mBGqTc1PCVl2ncQXscd2Tp7CDkBxphaMaCpe7HPHPSalWykUkOR2FYK+Fkfm/g+jJSxFPgfMkxzCMOcrDUwPrqv+HhOAGFkh1Abjcw0rsIhgNBH9xHnN4DaqDZrLALjnNiqabbWXyGplljc5zxnTUXxwDgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f7904a76-8793-14b8-2c0c-3660c2965287@suse.com>
Date: Thu, 19 Oct 2023 13:45:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 27/29] xen/asm-generic: introduce stub header numa.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
 <102c2a155cc7b14f0a8ea8049672f1d5ecbcd0e5.1694702259.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <102c2a155cc7b14f0a8ea8049672f1d5ecbcd0e5.1694702259.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0027.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f1::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAWPR04MB9958:EE_
X-MS-Office365-Filtering-Correlation-Id: c0b26bdf-50c8-4b3e-c5af-08dbd098e898
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	umUjzoA2Ry1bYGMJUFt2xMPqqGg5vG8aAb2+YLowBOP1lOMux2k8U4G7mFrFuBJKbu1t3lCnWl0Us7ho/qjgQKgxIgn1akpSa9QwZBNa9EFGYmFwc/GU24PPTQmhm1yiIVGlKiTCDTMY+KjKVI0ZmVeGujJPzAl/BJ3f8Kq8QDDuOiZVFP/p2JMABlBV8HvzYlE2DyVBVWcbrT/k4bz91FI16rBItj26zl4yt1lt5UfJCU9ASyraiw6BDDofQhi1k394/1ue1RI6UtgBmjpttgnLjMUXaMdl8mQyvpBYsbgDDqswbaAwoammlzTTcX0b5mBG1gUfYCokJJmMwbWTkK3TkLpqrGiy63pFXq25LLklXEMDiMzxPp9CQZcnnYIwoOahvU1joN7G10VsRLB7PPXJ2Qg+1TkW3eW1zZLgA+J/HjmpcszLzoweTYBhc68aGHIgk4OoXnuHKh/fiA7YBrtldvluP225Qfu7DZ102cgbvXuhkfa6VJ0ITsegAJ7HlTIVzZGPptbLg7KWkX0huBPUssFbQR2QL6znXSQI7uhaBQWtZgDYpIfKY0MU47E9g0Vqcz3izGd2nnDN8lPvQIMjajmiU+tVz8IVQ0iu74WZKYl1nnPLGnqrLdN+t68XkfpQKC4clbJfsUxFxvUydrKwg0XpCYJEuIEyprvYGU4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(39860400002)(376002)(346002)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(6512007)(6506007)(53546011)(2616005)(31686004)(26005)(83380400001)(6666004)(6486002)(478600001)(316002)(5660300002)(36756003)(41300700001)(86362001)(38100700002)(8676002)(31696002)(2906002)(4326008)(8936002)(4744005)(66556008)(66476007)(66946007)(6916009)(54906003)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUpuWHB3cVR2NC9NUVhLb1cyd0FtOEZXVW1mc0tBSWl4bkx2dGFiK3BmZjZN?=
 =?utf-8?B?aTArVmlqWW9JYmtIUjZpWEhwRDVLOGtoaXJBMS8rbzJmeXBXT3h1SHFJL2xs?=
 =?utf-8?B?UGpnVUFnSFdBNkxwRERzZmo4YzZYNWZudjlWN1crZjdJUXJLQWd1N01zRGtW?=
 =?utf-8?B?dXhWTWk4T2NIT1NvNDF6a09hbzR2aDhEUHppSUFJSE5oR29LbCtTaFVlMXEy?=
 =?utf-8?B?c2xVYnM4Q1lYNUROZTE0RUMrdnM0T2Y1Q0U0ME1RYWt1NERxcHJOTWV5NWFw?=
 =?utf-8?B?Z1hwekNJRkhnZVVEVDBha3U1VG5acTFPeTdWWWNyZTE1cDJDeXoweWhNQWJi?=
 =?utf-8?B?UUJnQjlOVW5OR29xaFhndnQvR2E0SkNlVzhkR29iWlg3UVA4dFQ5VlVETWtQ?=
 =?utf-8?B?YWd0ZTZ5SVFTMklpcXdhZ2pHU2xNblRJeU8zKy9SY28rUGFxTDFIUlR1Yjlz?=
 =?utf-8?B?QTc5ZnJyeFNaSVFMRE84QVVUelg0Nkl2SSsxV2h1ang4RHFVbFVXRVJ2ZWha?=
 =?utf-8?B?M25rOUpCamltQ3Y0RUovcHFwTjZhdm5hUXB3NnIxbWpWWDF2S203WkRNcHhk?=
 =?utf-8?B?cHZuR2RURlJZQ3MwWVZRajhMdEw2Z09OMnh6VEw4U3FyTFlNUFAwaHpxZ2lH?=
 =?utf-8?B?Y1lUOHVTNGFoVWNsUHR0TGpoTzFRRFVaakhzUUFGemcxUnJpUk5ZSW04TjZj?=
 =?utf-8?B?UFlyTEtYV3N4OGtVOFB6RVVPREtCekVGRjlGVnFiSkNSSmF6QlNtZDFXYkZD?=
 =?utf-8?B?NVYwbW1Yc3I5czM1cnV4RGNCdlZ0WitPTHc3YUlKL0RNWjRjdVdPaUtqYWVr?=
 =?utf-8?B?OTM0TlNYeGtqc280QnNhRG1BaW5jQ25kV3RzcXlwOUdnY3ArVGNMakJpUGpp?=
 =?utf-8?B?YVFiSU1CbGlmbFAvU2tkcng2bEhmd1NvNU43UFlud2MxU1B4MG04dnFIcE8w?=
 =?utf-8?B?WktaY0dCcUFhcFhjUFUxcXZRSVdaSWhMZEl2dnJJRGtUUFhteVVSUUEwUnFQ?=
 =?utf-8?B?dHZRNjc3bXB6WFRnYXlwY3Jqc2h2dVc4eExudUpxcEZKeGxKbk9vTTRJMnJK?=
 =?utf-8?B?dU9JcE1xK0FXRE1iR2dRR3BXUWo0YTdmVUZvTVBxcm82VWxhdy82enZlSVlW?=
 =?utf-8?B?ZTV1WElGTk8yYTVQL2xmbHYwNVRNRVd3STE3WVpRdjB2Z1pud3MrQmJsdlVG?=
 =?utf-8?B?OGdwQlVDVnFvNWRhL2pUY1c2QkJpSFN2K1ZCVWFLNUpjUTQrTEZUZ3d5SmJo?=
 =?utf-8?B?a0piTE9IQk4vY3V3RFBhKzF3TW05VEVDRUg2WlFLWm0wK1N2c3lTakgyemFr?=
 =?utf-8?B?Z1hQR05WWTlVMGl3Tndhd29ibWY0dWg1ZmdxSk5GWU13TnBjdkZ2NFJXOEpR?=
 =?utf-8?B?MGlTZFhMU2phWDFuMkRWOEo2a0ZVNkxBNlhJcjVRNWZBekVKSXhlR0pWeTJp?=
 =?utf-8?B?UFYvU3psZzIwK0RlMTB1VjBnci9FZUh3TlVGR1hDVmhoYWpMSXZURi9xS0hJ?=
 =?utf-8?B?ZENUSndWUHc2dzBZU2pSRHJ1SW90N2lPaUd6SU9iTHlJYTN0YjlRR0NvbzNw?=
 =?utf-8?B?OVFGaWhZYlloakc5UTAwQjUvbGVmem9POWt0YjU2Z1Y0Z2tIMTBLa3pPTk9v?=
 =?utf-8?B?bUtzQkhlNGlaQ0ZjbHMwQ3lhYUFMU3RLV2llM2p2OWlCVElXVlhiUTUyZjRN?=
 =?utf-8?B?K2FEbk9sNVhJSms2aG9qOEhteFJPb2xTRW43N3UrRnh5TEJIYlNtNzlHRTR0?=
 =?utf-8?B?UmdBQjhSeGRrZUJqUnJXN3phdDZDS1Fxc2xGUVQ1RWpxTStWUVhOcm1IRms2?=
 =?utf-8?B?c05YbThjRmdXaGRIclNPd1E5MWxFbWFlKzMzWnhVZmlxVDBpMmxjbUNxdE5a?=
 =?utf-8?B?M0JVc1AzU2pTT3B5NW5wQ000RDR2SThsNTBuM242TFBsa3RiSHhPVU1FSDgz?=
 =?utf-8?B?OUl6OHVtYnhwcG5MTGhNUW0yb2Nwb1FIWSt0NDBOV2RMeVgzaGU2cDlkelBP?=
 =?utf-8?B?UzdWZFlsZnNpMUZocmg5bG9mbmxUdldxcjU0eitSMXdveC9XTVFBRUxNdzFW?=
 =?utf-8?B?K0tpdlJMbmxaNW84d0V2cEdVaXJzSjlmbzBtdXNQczhJaXNVVlIxa1Z5VFdN?=
 =?utf-8?Q?DDcClBy5NCZacAIfKda7+z5Rh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0b26bdf-50c8-4b3e-c5af-08dbd098e898
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 11:45:36.0309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pulsgZOtkRSgzn+KBp33gKa399Q6m467beYmGe8EDwAMj6hMq1bDL5c2aVWDMPInsPfPPud5qnK7Fuk+mz7lgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9958

On 14.09.2023 16:56, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/include/asm-generic/numa.h
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ARCH_GENERIC_NUMA_H
> +#define __ARCH_GENERIC_NUMA_H
> +
> +#include <xen/mm.h>
> +
> +typedef u8 nodeid_t;

If an 8-bit quantity, then uint8_t please.

> +/* Fake one node for now. See also node_online_map. */
> +#define cpu_to_node(cpu) 0
> +#define node_to_cpumask(node)   (cpu_online_map)

Looks like this really is fake NUMA then, with just a single node. That's
certainly in need of expressing in a comment.

> +extern mfn_t first_valid_mfn;
> +
> +#define node_spanned_pages(nid) (max_page - mfn_x(first_valid_mfn))
> +#define node_start_pfn(nid) (mfn_x(first_valid_mfn))
> +#define __node_distance(a, b) (20)

This also needs commenting, even if it ended up being "arbitrary".

> +static inline unsigned int arch_get_dma_bitsize(void)
> +{
> +    return 32;

Same here.

Jan

