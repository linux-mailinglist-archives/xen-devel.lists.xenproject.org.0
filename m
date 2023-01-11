Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD16665810
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 10:50:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475156.736714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFXj4-0000FY-9F; Wed, 11 Jan 2023 09:48:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475156.736714; Wed, 11 Jan 2023 09:48:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFXj4-0000DF-6O; Wed, 11 Jan 2023 09:48:54 +0000
Received: by outflank-mailman (input) for mailman id 475156;
 Wed, 11 Jan 2023 09:48:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1UMm=5I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFXj1-0000D9-Th
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 09:48:52 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2080.outbound.protection.outlook.com [40.107.241.80])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 242e3b18-9195-11ed-b8d0-410ff93cb8f0;
 Wed, 11 Jan 2023 10:48:46 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7412.eurprd04.prod.outlook.com (2603:10a6:20b:1df::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Wed, 11 Jan
 2023 09:48:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Wed, 11 Jan 2023
 09:48:46 +0000
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
X-Inumbo-ID: 242e3b18-9195-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SF6NnTtLrsJr2SzrT7J8Ho/n+m94qAWfm430rj6MFMIQUc7tSb4DwdqnJ1R1NB+M4CuqIcznr9r9lZvWwsUK3H9ZKC+B/GX1dKg6o0KGMVKUGxMzeVneBe9TKA4567kypnxcAg0edQDfxeas6kiXvHmrvznX9XmkYb/aU9PdEWDX2kjbhSvKjUaK2SP5dABdy/SMKURs0UbhQ5s53K/YZViTZ7yK0xWQk0Dc2ZXQYva3ML1xEjDSyIuT5YY3EibWwcOEvNTY7Wm5qFiQRq91ipnlpb9IgE4x0Dfc9UI5KLo878KqSrJjm698vkYohttzjAEIrCKbepE4aEw6U0Np+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eoZCTYBDdYYKGrLaMH8wVWpss546JEA1sd9sUuWz8iw=;
 b=KiDqhxp581K872JKra2y430/iY5zm86ZMRDQE2WDQlk5LMf6dUWdvzTfNT1Mq5OvY2epGQA6Qu2Tv3FVgPgl01RXbziMaOBjvnppuN+Nnc5lOVaVH3t00hS+sgERaZ5DPdPj3cYPSWbF0RM3xHhgE1aIA3Lf56IJN8Xh3bh7zl5c1KDTPQyrxGvBIh0uHzGlVs/sG+Ye42CmMu6qrFEJwGeCxknI+EaDX6W8uOOjUHN0Fr5WgvAxGwVljU8F7xUUXdioXNTq3DWQOJ1yGR80JOxZ6BUxJggtzEjaIZKMjIKjhw9H/gDB3H31XhxqD+07/w0rgAzBZ7BXLj/umPVlqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eoZCTYBDdYYKGrLaMH8wVWpss546JEA1sd9sUuWz8iw=;
 b=nefqHG47PLsLd6GumTbaxX61c/yS4XwF6iPxBs2RXkRMykjGlkymE5HJYAkv66wKA6iWmSkKL4e015CHlvIH1ueDzYXEPeTJbwLvS+DIniFKfrUFv1Ajflvin0LGerI+yuUSLrggr0jhGwiSBbcrZV7e/HZhMy5FQF5lbdeTeFVlnD4HdqUWX9C6YSEhE7oYKPtUhf0xlRE/L6KiYgOFffN8NkwkGXO3qefrkwAT9JQqkkIMF9Tcjuj/mxooFtg3exIcxiRLr28K+RP/B9j+i2sqXclqcjI1gpN5Qe8n7xbJYsPbvYe0LHl7AL0D+hHDkgcHnjf/7Pzbcje9nG+H9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <999009a1-bfef-3e02-09cd-865ff462c3d8@suse.com>
Date: Wed, 11 Jan 2023 10:48:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [XEN PATCH] tools: Fix build with recent QEMU, use
 "--enable-trace-backends"
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230110151854.50746-1-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230110151854.50746-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0162.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7412:EE_
X-MS-Office365-Filtering-Correlation-Id: f4672d97-838b-47fa-f263-08daf3b9082f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	B1b7uXsO2cXfZug3glU2a8yU4l7Hqbi1sVRxDBYbqp7mVWal+EiP+DAav4U9B1dTN2U7/i+GDoDP8qziT/efO+Pd5kaxdAy8JiehCrdQ/TQo+8y+NXNbYkNl5Zvj+RelAivucYdt16yztEXatFek+W+k42Z8Y6DT5CI/mfWXzNwOqgf0TpE39m+z5djUSy5i9grwGjNcUsa6QQTv/a5PVGn/qy11+WDTIhIz/5/2+UcaFp8ZblhTG6MqxZfvQTwPB1oToMBm3tuSaKJnXQ9DNE/kF5XLlszQc/dSLiuMbkl+8B9GcGqX2lUB3R6ebL3RAm7/yfJwdFXz2dtgtRjbKQGxNtlD3V7J2wXSqLI0Nay4nJrz5YRqobMdev05pW+AYhs09OWlST9A2FNg2sTaOuM+tz6am3BNNxiY/x0HMlP8C+3Y0JsGanf2XgvMTn5YA/XVp2cG+rAn9X0fXIea2wCKaihl/5ELbsgnN1baHYPr6oA9OK0nq3wr9RVLwFU0WfIbGyGgdG5AXwcG6FcgRbemNkoe05Exoep6yLRV0zVoGASpCJzXt6rDWlrtsSQCRgT1C7yby/MLqrDDL/f8i/eWhrv99Fss5DjaTe45uMBblwDMlrTGfuSG9b8vIktkicd1HDd2c502GD2M3hrttGaz1gWkJC9hq8MMin7faxMJ9bZApex/nteYr/Noe0hFy4wbsHtTRVnKj9vEVwmRIIpVWDKxRu6cVtod6y9yHsE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(376002)(346002)(136003)(366004)(39860400002)(451199015)(38100700002)(31696002)(86362001)(36756003)(53546011)(2616005)(6512007)(186003)(316002)(478600001)(6486002)(31686004)(26005)(2906002)(83380400001)(5660300002)(8936002)(4326008)(41300700001)(6506007)(66476007)(66556008)(8676002)(6916009)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1BFaGpZbXZyYjFUUEJJaHdYendTRnJaQ1JmK3VMejlFL1psZHYvU0JkclVW?=
 =?utf-8?B?Mno3MC9YZWFORGlZbmpkK25semVvekM0MWFDZW5BVVdFekEwZ3Q5RnVITTl0?=
 =?utf-8?B?SC9tMlI3ajYrODdJK3pVa1cwL0FVSHY5QUdXb0dmbkVReGMwSHdac0RxVmlK?=
 =?utf-8?B?SUd4b3FVa3FTcXN4clFVUlQ3ckx0Sjg3MGp4TkxWSDV3ZzFnZ0NxSVVrem81?=
 =?utf-8?B?SGIzSFkvbmMrM2VXV3BLbmtOS1VCZFRVdERRdmVYSlBvWTg3Z1V0QVRsN2JC?=
 =?utf-8?B?cHUyMVY4V3BGQXlJUmlUZDk0ZUpTN2VTTkZXd0d0NTJzY1NvNGdDYTJKbzR1?=
 =?utf-8?B?NGJ3T2dQWTFTZmlNeGl6cndCTmQrbXh2SU9VWmlxQS8vUkRLMWxsNFFyNE9v?=
 =?utf-8?B?UitiSUNMMGY5TDRtRnlmeEhpcU9Venh2T1FVN0tOS3hrZ2d3ZFdqdmVDWGUx?=
 =?utf-8?B?alJBUHJ3eHJYRm9MTUZ0M0kwdDhFSjdtQTFmRWhnUUlCalB3WHFHT2FhWFhY?=
 =?utf-8?B?RjRDd3JWcFJ6R3FEZVJiM09kMXRrVVdMZDlweWxhSjN3KzMvOGdpYy84TDlp?=
 =?utf-8?B?VlE1bnI0QmJSWURuU1h1a3NobzlDaW1JNXB2SEZoNENuV3hGNEpOZ2VVOW1J?=
 =?utf-8?B?OGlLSXB6SGdBaXpIM2ZLd21Jdnd4YVBpRlYwckU1ZGpUbXBCV0xaQXpYTlVt?=
 =?utf-8?B?RVB0RXVzbzRvOWNvNGpwL3lqSjlNVGFhNVdvRHpSQW1vcmRCblRoaW1DT1Bt?=
 =?utf-8?B?WC8zWWk3MVRTQ0huMzZuL0RRQ01VQlFRbkdxMXE5ck5kc2pzd285VGdYWkgw?=
 =?utf-8?B?U2NtS25sUVNlbnZldWZuS0tiWjVDTzRFMTJyaVEzK1RaYXl6MEQxVFgxZ1U5?=
 =?utf-8?B?V0FFbkxiT0Nvbzh6UFoyd01jQU9HTkV4azhHdmpQT3VZaHdNVmtOTFh3SU5s?=
 =?utf-8?B?T3JCQUpRRWd5ak9rVm8rbm9hT1lPMjVNMjBOUmFCNTQzNEJPN1F5YThURUdK?=
 =?utf-8?B?MFpMVjRjb2s0b0RBYS8rU0kwc0thVlE3RWpQTGJvRHhRaGZpcW5UMlA0cXA0?=
 =?utf-8?B?TkV6RW9BQlNudkIwNUR3OVVGdDY0dUxBMFpBRExnMUNYWm1naEozaTJpNlNX?=
 =?utf-8?B?bGh3MTlkdGx1d1N2Um9wWVVTdVJVSkxZYmk2Mk5qRUE5MnZ1dTZvMEM0cVJn?=
 =?utf-8?B?VkFVdlN0dVlob0VabFYxOGU3WmpudnFHdndScldtN2svb3g3QmRQODZEdXVJ?=
 =?utf-8?B?aU9iczIrNGo0eFJ3Rk9FRHpCU1V3NWtYM0wvYTdrUDlJN1RaVnN3RUZHOXFp?=
 =?utf-8?B?dUpsSWhVTy9mM1ZLb1VGdzFEaHBOK1NoUldDK1VYejJ3Uyt0M0lPbjRiTEtl?=
 =?utf-8?B?aTFJaVF0N1h4Umh5cXc0dWtUdmgzWEw4d29VZzZLT1VKVElFMVNUWU42ajZQ?=
 =?utf-8?B?THFpVWpjSUdQS1BkTkVEMlhoc0tYM2Q4WFVYTHpPSFhTZll3c2lQZ0RrbHdj?=
 =?utf-8?B?U3lBWUczWEo1azZFRVJjWkRnWjNvWDFVQnk0TTNJTktkVElkZzZFUng3SEhy?=
 =?utf-8?B?MW5HdW5CMHNZNXo0YmZ3eGFnTHEvT0VpUmRNSzNlK09pc2d4akxRRk1hWGFG?=
 =?utf-8?B?cEtFck5JdU9WV3R1UUNnV1ZXbFdwUlFwTnRoRGlMcnBSMWVTZlpPU0ZjdjZO?=
 =?utf-8?B?SDlWQzVYakMwNVJ5K1FBKzJ0R2tlWklwT2hucE1DOFd0UTNJSEtGdEhXNzBU?=
 =?utf-8?B?VUo3TTZocjNiZ09lZEYvQUFxU2ZlQW9Tc256RTVtTlpRWmZERnA4U0JxdWZZ?=
 =?utf-8?B?VWFqdkFtdlpRQ3BhL1JlM0NMRk1QQlZRUUtrVWl6dmFCT1J6NUhwRWQydWkw?=
 =?utf-8?B?ZVlMbXRCNThPaSt3Y0VYc3MwM1ZzVXY4SEVwb0VHREg5aEFvMDFDVDBxUGhx?=
 =?utf-8?B?clRjeHVqMFVFOTRjek5DVmE3cTRvWkVlVzlHZGZ1cDJiR282YXNwTGZkU21q?=
 =?utf-8?B?Wi9rYjh1dVE4SndKNys4VHJwZld2Y2RpVFhBd1JSLzJOUXR6bENMaUdWb1Vh?=
 =?utf-8?B?akRteWZNUzlWRnU4YjRkbmF5R2twc3laZTlFTzZhb1VTSWQydDRiR05hY21u?=
 =?utf-8?Q?HXgQQ09s+vGWIOhzEAbYe3eba?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4672d97-838b-47fa-f263-08daf3b9082f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 09:48:46.1174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J2EGgGcWWTDAM6KtGLMAXyZD5kBTFWXkbCUWPp34YYWygI6zdDUjafXfTogu6AdbTI66xIIeXkRulq5gPfd4xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7412

On 10.01.2023 16:18, Anthony PERARD wrote:
> The configure option "--enable-trace-backend" isn't accepted anymore
> and we should use "--enable-trace-backends" instead which was
> introduce in 2014 and allow multiple backends.
> 
> "--enable-trace-backends" was introduced by:
>     5b808275f3bb ("trace: Multi-backend tracing")
> The backward compatible option "--enable-trace-backend" is removed by
>     10229ec3b0ff ("configure: remove backwards-compatibility and obsolete options")
> 
> As we already use ./configure options that wouldn't be accepted by
> older version of QEMU's configure, we will simply use the new spelling
> for the option and avoid trying to detect which spelling to use.
> 
> We already make use if "--firmwarepath=" which was introduced by
>     3d5eecab4a5a ("Add --firmwarepath to configure")
> which already include the new spelling for "--enable-trace-backends".
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

I've committed this, and I'll queue this for backporting unless you
(or anyone else) tell(s) me otherwise.

Jan

