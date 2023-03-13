Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D18BA6B7D6E
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 17:27:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509344.784920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbl0W-0008QK-G1; Mon, 13 Mar 2023 16:26:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509344.784920; Mon, 13 Mar 2023 16:26:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbl0W-0008O1-D4; Mon, 13 Mar 2023 16:26:44 +0000
Received: by outflank-mailman (input) for mailman id 509344;
 Mon, 13 Mar 2023 16:26:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ddKj=7F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pbl0V-0008Nv-BF
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 16:26:43 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20631.outbound.protection.outlook.com
 [2a01:111:f400:fe13::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d57adc66-c1bb-11ed-b45f-930f4c7d94ae;
 Mon, 13 Mar 2023 17:26:40 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8943.eurprd04.prod.outlook.com (2603:10a6:102:20e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 16:26:39 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 16:26:38 +0000
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
X-Inumbo-ID: d57adc66-c1bb-11ed-b45f-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vx2OgP+xfNQDlJm4S/c719gaJARmf4k/q5fg9+Q/U4aYH2y+J7ZshN+EqpMgPuYg+qqWqGApV6u4qczJSdNGpxdawk8R/pLwy3ay0o9bYbEEyRmlo4ViYXbh0FyenEzxAQ7lWyyDrImirXgHy9H22YzRw5MH/uQgY4AXJwsWKcYzcq/8E1RCIEPFtKJzvDE4fQtaawv2Sig2+O2lanDcT9AKZ7SFdxtvUu0VF5c7Hg5TfRnwBc5OU75k1x3jzQ5juX51gtSIFBeAcHMNq81tRPXgpVmPzm/+opNhBkspV2uQEbg+l+qtfqflguHmQOlT5GdeifTQD3YkWi5DR8PiTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G2vus6BNRVFckuwcSlznto5IidHqjeDrezO/nwXOVxQ=;
 b=dXT9wmATUiF9CKKq56OXQYc6cqHX84H0W1NGYvRLhchK+DcAKsldecthKECX/lhwDxQGzFWC3aSK+MCvyXITYvol8OVA/mhirfe7n/3ZqKRGlwaUQ6kFrPrg2HPdCoCAqA/k+WlPt8gp+ZQWyJ+rY4ppVpohVPdQjgPvi4bA2dyz+yvTZUn+uSoJ2e1jK474UQTktB0+qvAM+iNQXVkJIWy5pBy2Gl9k7MvkAcf9VeQFkS+3rQ3g1s5i8chKasF4+Fa1qz6iQKEfdvpvUor3Dl0v2KWgMtkXJL23tYASh7PDEKvFYIOwsegJHGCQ7WRgF5pZRdtdOMlc+pMkaIYlmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G2vus6BNRVFckuwcSlznto5IidHqjeDrezO/nwXOVxQ=;
 b=GQnJxFE0dQ58K800dGAeoVuDmOo5D+8xLrHC0sL4waWCG70YNbje2XyKXpRjmnP+Okxn8BjG4V244W+RwwfvMpzlO0x4TGsFdKrlRkxvQuEsc+nO1hPA5TCLKQxTzefkAfWb2OXjFFqlAZzcwuK6CceGAwCKdK9V0v4rvERYyePfOmzjqM+sAUd1PUvreQWN9zNaNLHTuWsQLKVOmS+wOEJXeT7xpv99Ti69D+MLaxVLmD0nqVpp+fo2PqC9zGsX3iU6fCVBiQ1W9FguloZdKc1cNHaxR+28z9/LmAVknVGNU23aZNR+ogQB0A3jevaDucJjf3ye0tpmTJoQS9O64Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3df43c25-6c06-0cbb-5452-c989511a7e15@suse.com>
Date: Mon, 13 Mar 2023 17:26:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 1/5] xen: introduce CONFIG_GENERIC_BUG_FRAME
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1678368234.git.oleksii.kurochko@gmail.com>
 <671cd744b92f14ddc0c47ca471e03e3229cb89ba.1678368234.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <671cd744b92f14ddc0c47ca471e03e3229cb89ba.1678368234.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0124.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8943:EE_
X-MS-Office365-Filtering-Correlation-Id: 529993ae-4a1e-4f52-bed7-08db23dfb8b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CXeOhE8yns0cQ2xpSzje/HmnExFp33S6SpJDs3+OD90mzc+Tb7dd9i3y1QiE5++QL25zNGZtIXGrzT3+7HCVWkB6Lmgg7MYiHen1N2JYPQ67pQEpzVdyvvd4guQc0BLc3GNPJlPDP3XOIP7J9uo30jjJaz5WFYBHkU5DQr9kDLOox9BI+2kwrvIFlTBrBdy2ySatB/Tiv0BX0xGkGUPovNPABDEeDO8h2YE1ZCdombZsphwS7vQZH4CgGPEBB2R64QUd7JOO0X8IDxc86IOZB680FGGRUQOxBokKaETXvLBnn/QFFEqO7daQ4PbCe6o6MkUd58kw8NMuOdvoyKfJDaEStBAh3YZuzoYUGwE7mAyM1KdBvbE5M/H33LRcHf6iWhksCJETXqz6BEKxHMUmR1ILnD2YczdYdQIxje5qZn/cLzxQ78KH0n7vz1au47ht5QyCx3Lxo42y1M/8dijE/jwNVBpajdEPKnCybco4NqVu7zMU6cDJ9bqSB0/5p3HMuDg7y9o2G+HhqhwGsWYUJeJHhkMGChB9Fq1bWuVh1rS8+Fur/W9lM1Q/PfnuXX1hrupqePYJR6W8WwPl+rg15IuurAAR6qjAs6rgVpIVKiZoLhTGh9BQtgpJbAJ6mI4DJCp1P68Luo2NGT/776ZKR54IkKq0kQXa66/sUi0c33dA1LN+3Y3UZtSoFNcbXW+8iZFYpnnXUFgnanu5wqLDu/VvOoN+IPgHM/S1LOyi2L8WEZh8YF93gNmHFtLVpywS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(376002)(366004)(346002)(136003)(39860400002)(451199018)(2906002)(31686004)(41300700001)(83380400001)(36756003)(5660300002)(66946007)(8676002)(8936002)(66556008)(4326008)(6916009)(66476007)(38100700002)(316002)(54906003)(86362001)(31696002)(478600001)(186003)(2616005)(53546011)(26005)(6512007)(6506007)(6486002)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WXFnZHBjSjhsMERQUm5kOXRoT1RGazI3NzJqS2lWNDEzS2dyWit5S2MxNUxj?=
 =?utf-8?B?WmhvSXhDcjYreXdnTnNqdGhMb3hTdzFtWjJlcGR4dGtyRlNPV2dKRFg0STla?=
 =?utf-8?B?ZUY4UWp6eFpsd1Y4Q2JZUGJIVHRMbmMyWUUrL3hGUjBIU0ZaVFg2cktNU281?=
 =?utf-8?B?UDgwdlJiR0xDZEhuS0JDd29hNUVoR21TL2c5aTBLd2F1anY0WlpaT2twQzh5?=
 =?utf-8?B?QmNMcDc1d0VZZXpXbENqZkVWWVVUZ2ZTMndac0xIYmNIa0pzcjd6R01IUU53?=
 =?utf-8?B?KzluMzE5UjFNU1Q0dXQwd25Edk9QeFM2T0dZUDdDTVVVbG4zd1lGSldjRm9W?=
 =?utf-8?B?NUd1ODlIZG1CSG9wd3g0RFF4RVJDWThRa2UzRXhmSU5Ja3lDUDBLS3BIcGpy?=
 =?utf-8?B?RXQzczF3NGxRSmI4QzFacmg3YjZlMkVQNGw1a1ZhMXF4dFJtdzl1clJCaWZC?=
 =?utf-8?B?ZVc5aDNDZ1JleDhuQ2RHL3VaeTR6RXUvdGxwQWQ3bmdERDEzM3JXNUhhUjNB?=
 =?utf-8?B?UDJrWjd4SEZJQm1FOXFxQ1lIVEhIZHY1QVh6M1FtZ3N2ZFlQNVo2Y1RRUjJr?=
 =?utf-8?B?d1VEZnU2TlNmWU1hRkdlOTQzVTdBVmpZVzdCMGE0UzJZeDJmc0ZYdDNjK3ZS?=
 =?utf-8?B?dkFVcmhpTGxPRHo3eXljYWgxUHZyVkMxK0FBMFh3RkFTTFhwN3NVQk5tZzVt?=
 =?utf-8?B?VDRZdFhwSlBPNEIyR2dxaExXbU5DSjg5by9sdDlSS1BDR0s3VTRodEtCQ1B5?=
 =?utf-8?B?azBkNDBhOWkwUFQ4c01IWm94TE1tWFUyMVJvOGgwMmo0Mld2NllDQTZTQkVF?=
 =?utf-8?B?VFVxUkFTZUQ2dUJsTk8rVGdJL045K2VaVmhLNDdFOC9CVzVBem92Tkh3a1dk?=
 =?utf-8?B?QjhGZ21VWXoyNTExZm1FcS9EYWVlTjZQTW1sbWlnT3QvNGhFWGIxdFVDN3lk?=
 =?utf-8?B?bE50M1RqY0JPL0pQOTIzZm02T2piUnVDZmE1a0pwZXEzeVV1bFVKUzJrdlhB?=
 =?utf-8?B?MDArdE5WSi9NbEJCTzROL29RM3l1akVXdjd1TThjck5yY2hEcUdyalBSdGZF?=
 =?utf-8?B?NVpaWk5WTnF2cmVLQVRnb09ld1pWZkQzcGpRR2J3MjRHYkxiZDRFT2x0V2hQ?=
 =?utf-8?B?ZHFiUkU4Q01xaVVwVlQzcXYwQUlqWmpTK1NHQm5OaDJmeUIyaEtxdW4wblRx?=
 =?utf-8?B?VmhqclB0QlJMMXRCZ04yYWliWkdHQkY2SzB2dDVzYzNzYmZjWWFJd2FTR1Bp?=
 =?utf-8?B?YS9YcnZKSkFMQ1haUVN1by9QRjZucE1DYWcxaEhxSFZFWEg4bGM5SmFOMytk?=
 =?utf-8?B?ak9NSStYaFVCZGZoVzF6cDU0TDVKOElOa2dYR3F4NXcvWHU5TGM4ZDZZbHRz?=
 =?utf-8?B?RGRKT1hGazlzYWlJUU91dHZ6ZkFiUW5GTTFzcFFDcUNHVE5ISm5tbk8vd1pM?=
 =?utf-8?B?R20yK0ZJRjVYYnp3bEFGeURYV240VWRWc2VSNW5ydXUzRFByaGpMOEFXcTFp?=
 =?utf-8?B?cDE4RnBoY2RXQ202SC80eTFrYm5oSTlDeTZFbGNLM1ZFbzcxTXcySnVlclk2?=
 =?utf-8?B?dndrMm80QlpDWEk1QUxOUlhXK0ovU2RlTUsrZkVUS25kVnhzUnBFZU0xajBX?=
 =?utf-8?B?Mm15NVdNWmRPM3FYNnpkbWxUZDRrK1NIcGZLaFREV1dNOUZsSGM1dkxFKzUx?=
 =?utf-8?B?OXc3WitXcHhHMzd1S2RrV2plMk9pOE9XbFV0MHJsVlJWUDdUWTNCZ0Z4bTFm?=
 =?utf-8?B?VkpsNXpzczVyeHlSRFFPWFNPb0NYcHVUTjRHbGhkL3lkL1VCYVR6YXY2YzZS?=
 =?utf-8?B?RG5PV3dLTUIyK201ejdTWVRRR2F2ZnRFUTl3RTN3VVNlZVpVZmtIbXFxTCtn?=
 =?utf-8?B?eHVrQkp1dzd2NDVET0lzOGFZTGw4Y2NJQndZWWpUN3RBYkV3cU5BeE9uMGZh?=
 =?utf-8?B?eHVOYWpCakIrVXhtV0I0L2Z5cWZ2M0pFVStnclAzMkJpNDVhWlRPRTRiVmw0?=
 =?utf-8?B?UE1lUmowaE9uTzhFSGRYaHZRazZOMnlGNjVuNG1QVkQxaW9xK0hXUk5Vemlw?=
 =?utf-8?B?RFV6S3BaMzZBRU1oMldZN0tZTmhzN2ZOQ2lsTFJjN3N6YURMRHJFR0RRWlli?=
 =?utf-8?Q?sCR8CE9+mLbqckHCLSgG+5F3Q?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 529993ae-4a1e-4f52-bed7-08db23dfb8b4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 16:26:38.8308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5RL6vUDrlmynbAQOC8EQRSMuxTwEhj916HtLW3oq6tuwvQoCJL0vliAyAOvYEEdqTHJPJlB/8vQbkFe8WWKWJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8943

On 09.03.2023 14:33, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/common/bug.c
> @@ -0,0 +1,107 @@
> +#include <xen/bug.h>
> +#include <xen/errno.h>
> +#include <xen/kernel.h>
> +#include <xen/livepatch.h>
> +#include <xen/string.h>
> +#include <xen/types.h>
> +#include <xen/virtual_region.h>
> +
> +#include <asm/processor.h>
> +
> +/*
> + * Returns a negative value in case of an error otherwise
> + * BUGFRAME_{run_fn, warn, bug, assert}
> + */
> +int do_bug_frame(struct cpu_user_regs *regs, unsigned long pc)
> +{
> +    const struct bug_frame *bug = NULL;
> +    const struct virtual_region *region;
> +    const char *prefix = "", *filename, *predicate;
> +    unsigned long fixup;
> +    unsigned int id = BUGFRAME_NR, lineno;

Unnecessary initializer; "id" is set ...

> +    region = find_text_region(pc);
> +    if ( !region )
> +        return -EINVAL;
> +
> +    for ( id = 0; id < BUGFRAME_NR; id++ )

... unconditionally here.

> --- /dev/null
> +++ b/xen/include/xen/bug.h
> @@ -0,0 +1,162 @@
> +#ifndef __XEN_BUG_H__
> +#define __XEN_BUG_H__
> +
> +#define BUGFRAME_run_fn 0
> +#define BUGFRAME_warn   1
> +#define BUGFRAME_bug    2
> +#define BUGFRAME_assert 3
> +
> +#define BUGFRAME_NR     4
> +
> +#define BUG_DISP_WIDTH    24
> +#define BUG_LINE_LO_WIDTH (31 - BUG_DISP_WIDTH)
> +#define BUG_LINE_HI_WIDTH (31 - BUG_DISP_WIDTH)
> +
> +#include <asm/bug.h>
> +
> +#ifndef __ASSEMBLY__
> +
> +#ifndef BUG_DEBUGGER_TRAP_FATAL
> +#define BUG_DEBUGGER_TRAP_FATAL(regs) 0
> +#endif
> +
> +#include <xen/lib.h>
> +
> +#ifndef BUG_FRAME_STRUCT
> +
> +struct bug_frame {
> +    signed int loc_disp:BUG_DISP_WIDTH;
> +    unsigned int line_hi:BUG_LINE_HI_WIDTH;
> +    signed int ptr_disp:BUG_DISP_WIDTH;
> +    unsigned int line_lo:BUG_LINE_LO_WIDTH;
> +    signed int msg_disp[];
> +};
> +
> +#define bug_loc(b) ((unsigned long)(b) + (b)->loc_disp)
> +
> +#define bug_ptr(b) ((const void *)(b) + (b)->ptr_disp)
> +
> +#define bug_line(b) (((((b)->line_hi + ((b)->loc_disp < 0)) &                \
> +                       ((1 << BUG_LINE_HI_WIDTH) - 1)) <<                    \
> +                      BUG_LINE_LO_WIDTH) +                                   \
> +                     (((b)->line_lo + ((b)->ptr_disp < 0)) &                 \
> +                      ((1 << BUG_LINE_LO_WIDTH) - 1)))
> +
> +#define bug_msg(b) ((const char *)(b) + (b)->msg_disp[1])
> +
> +#ifndef BUILD_BUG_ON_LINE_WIDTH
> +#define BUILD_BUG_ON_LINE_WIDTH(line) \
> +    BUILD_BUG_ON((line) >> (BUG_LINE_LO_WIDTH + BUG_LINE_HI_WIDTH))
> +#endif

I still don't see why you have #ifdef here. What I would expect is (as
expressed before)

#define BUILD_BUG_ON_LINE_WIDTH(line) \
    BUILD_BUG_ON((line) >> (BUG_LINE_LO_WIDTH + BUG_LINE_HI_WIDTH))

#else  /* BUG_FRAME_STRUCT */

#ifndef BUILD_BUG_ON_LINE_WIDTH
#define BUILD_BUG_ON_LINE_WIDTH(line) ((void)(line)
#endif

(perhaps shortened to

#elif !defined(BUILD_BUG_ON_LINE_WIDTH)
#define BUILD_BUG_ON_LINE_WIDTH(line) ((void)(line)

)

> +#endif /* BUG_FRAME_STRUCT */

... and then the separate conditional further down dropped. Have you
found anything speaking against this approach?

Jan

