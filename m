Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C34E27CF6F0
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 13:34:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619243.964023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtRI4-0005vN-Px; Thu, 19 Oct 2023 11:34:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619243.964023; Thu, 19 Oct 2023 11:34:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtRI4-0005td-Mp; Thu, 19 Oct 2023 11:34:12 +0000
Received: by outflank-mailman (input) for mailman id 619243;
 Thu, 19 Oct 2023 11:34:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g4nO=GB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtRI3-0005s9-AN
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 11:34:11 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on060b.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b09924c-6e73-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 13:34:09 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB7134.eurprd04.prod.outlook.com (2603:10a6:800:12e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Thu, 19 Oct
 2023 11:34:07 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 11:34:07 +0000
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
X-Inumbo-ID: 6b09924c-6e73-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f6xzsN6vP5ofwz4Txk2Me3jfTGiOOFCymKkSAfa7YsCfk3xCwsCsbv9wQ33VQ3Xo3T8dzu/C8nlncCMO5caCNeMhH1YFNY5NZpJImGcaV2FsANudgsA+HL7TUlepi0ODFvb0e4ziL9j2urjC61Lhd+2oCR6U8P4asKo8umV4YPBvVnw4/nSr90v/3Cub9mdt6BHPwjHj/E8ipYtODqSPPsRbZreCpkKanzmv5Av/ZRfLd5uJ+ypmna+VU8msBdwkqcpIjAgRyEtx1gvsHTmPR3FbXJs0BD4iucv2HdveqOyKMbHGe2AOmrbYHm/NFPOaF7Ofr8B+lMZIbR+rwNMV+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+sOnk7pfsJCIBixwM4iGZyICMVqavENGBaAPr8tuJk=;
 b=HiSdmaY8zg7f8Ryl/XuHzYw3YHNMUUfNeEBC3Zv1GzbUsP2Ii86FnvkKkGHjHXE1tTdmQcW43zQmVBZEq6UAnX25now2OFYKy9CeEfP3OQHvZDymkkVzs9pwWwxg8dxn2lPkCYUBWiDCOn0VYlpVX4Cglh+e4CH0DrulIClkYavIOL7XdXD6xdVabQMy51kDQHCy/FGaZwssOz8XlZQWOPKTCzx27RE09oGL5p2n8GUnONw2667Aeqb62Js+0f9Efn4qNWOTdeqkS6nVj4QWmU7iEJRXeoURLpJqD62/VKtuZA1lDsegIQKtixISrAhcEh4GboDH/YQ5dMcjgPRFGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+sOnk7pfsJCIBixwM4iGZyICMVqavENGBaAPr8tuJk=;
 b=F7TqEDjhq4KfBnYr/asNVUXWFA6YE4iQLju7UkiJ+Ns87q4TR7WSZkWLLN12gtU89g7rZnYx67W7n7Qk4JqKgOTijB/P9S3QBGTMTrt/F4C4s823bciEnwstqreYz/XhMTzFwju+t4tuJjU/wHgLTdT+VceNHEnmTQv/oPtsvE/wpLHxjV7XpU5OIzDaOQ349xs91I5X1SXkmL8/5/AgG5KS4+HiUyTPI9QvYClFPbhs3D5SGEPZElmXTXHoyUI9Hko6oyl27e8Subst7h2TzrHMZq+ElQwkO0c33EHrdaRYgII1pKyJ2CJ/pxv8RN7Ap/axzQKTo0Yd+UMRatZYMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a6d597c2-b822-79fb-233c-fbd7d7bee137@suse.com>
Date: Thu, 19 Oct 2023 13:34:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 25/29] xen/asm-generic: introduce stub header irq.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
 <63ee09cef41d0d2ec5e26eb6dbe20df2e377a0fa.1694702259.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <63ee09cef41d0d2ec5e26eb6dbe20df2e377a0fa.1694702259.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0149.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB7134:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ef7636e-ae68-4695-9b2d-08dbd0974e0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Hf3SZt775RC8K8vvHn+f9W8odcANuWqGk0oDtTf8L8CwnNEzNmqPHS6tbBhLhp148MYxF+NMk2fV5Un5w9VzQzU+a1x1eBatgpE5VoaSmYTorJ9Vo/HmO72J6ujTsMHNJuEMb9mRmUxD9qP11YYR/qZDRL9Ger3SpHFQpEHyB6/sl4EcSVlJ7HRDXE0Eov0G3www9UPj/1RVb29ByrtRvvJ4g6ZQaMsqBy9QrSlt1bwk6XYh30uUcG7RSxqJ4OxodHrBdvvHw+Nz9kTiSIX728a4jirycvlgJMNXBhF6loScwBKX59ljLsGBt+MdZN34EZK53DL1dPm0W3nVtJ/kqjz7jpoTtx35ZXEjMb+Y1pjyLA0tf553KaXhLbBGCZdqbUtBaDCD2zNAbJDh22tTN9pBJ6oczrmNc3a19B47F7Y7juDCe1fSRbiM7TF7Qbp3qYRTcYdwNPqc7/euEvsdIgOGbz3RfxU/fBXYQ+iJ0Kn0ZxaYJAZNDZTAITz1Vp4mEqyGfPvFfREvWVtO7q3mAmdycei+wuwvjXb0SIPahnAZwtGeqskCDlkCUT/mze3TiHZrTZsA3nl5jyj/SurX+GyVGe+ka+v/pL2px7Y8wHTWHg6sYTO/qpDUzTqM2yPzvAUaH7iLXvtWIPfeXpiOqomJF6BwAoWek2AF9TqlgEA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(376002)(39860400002)(346002)(396003)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(5660300002)(38100700002)(53546011)(6512007)(6506007)(26005)(2616005)(478600001)(31686004)(66556008)(8936002)(54906003)(66946007)(4326008)(41300700001)(8676002)(316002)(6486002)(31696002)(4744005)(86362001)(2906002)(6916009)(66476007)(36756003)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnZRSmFYcG5OVWNISFIxcEN4TzNmSFVmSndPTWVkMXEzSUZIZnBXMzdpMUdX?=
 =?utf-8?B?U29CNis0ejBlOGZTUlRzdEUzY1JjM3BzTUd4QWZ3T1VaTWYzSHVyYUFkNHRU?=
 =?utf-8?B?Ym9iMDQwUEdzZmc1eUxkMVNjQzN6em9lLzU1OWhkYys1TnBvZW1UQ1hjUzhP?=
 =?utf-8?B?OXFCRnZsaHpXa1BxU29XZStzS1NEVkJGTFQ1WHNxQTZGUnRFbW1HY3c0NlhW?=
 =?utf-8?B?YWQ3ZGM0alM2U1NyM3psQ3Y3V0Y2TjNoWWh6dCtlSDZ2d2hKbjdySEk4OEIw?=
 =?utf-8?B?U2xFMGN0WWl1QXdMZERKKzFwSUhJRjRTb1pDUitZRW5nOUg1b01uSWlaRXJt?=
 =?utf-8?B?N0xERVVHUmFUT2NsbExMUHI5Z2pKRGd0aFp2K1YwNUtYandMUWlUV0RsVG0v?=
 =?utf-8?B?Umc1cElvZDBESUphdHFBQUEwL2RTMmNWaWc4am1xRVpGOEhKNS92ajJ1TFVF?=
 =?utf-8?B?MVJuZ2ZCeFUxUXprNU9zZkZaU3pLdGM2T0UxcnZSZU9lK0t1enZROU5uV2pH?=
 =?utf-8?B?d1RBNVJJWGRKK2Y2dGlqT213b3JQNmJ4bzE0SnRIYy9qb3d4ZGZQQ0h1OVlu?=
 =?utf-8?B?VGJwa2lLSXhxOVQ1T2tlUkhqaW1kWE5wZjZUeHhtK3hLbHU2dU1SWFJVT2Na?=
 =?utf-8?B?Vk9ZdlkxeWUvQUpRSXF3TjhINnRLRXArSFBzWlpIZmhHNWNpYmpONlNDdzFO?=
 =?utf-8?B?OGtMa0pPbFBTQ2V1NkxFbXFWS3lEWXY0SHE3TStFUDR1ay9MNVFtdUlLV2RS?=
 =?utf-8?B?cTFaSDdPaDJQcmhNZ3AvVDk1SVNLVCtWKzlsTXc5VzNtK0tUbUhZYUlzTnh6?=
 =?utf-8?B?MzlnaXIrM2t6cUtmZ1dpS1ZNT1lTRHhFQkQ5OXNUdXpsSEx4c3hwNkYyR0hp?=
 =?utf-8?B?cnNGMmkvaDFSSFVIVm1OU1cweFV4NzhDTDA3WklOanpoSTVhZVk1SWFFVVJy?=
 =?utf-8?B?a0IzUXNYVFVuR0hPNVpZZjNvbEs4VVpJRGhSeTBFbDg0dGo0aS9VWW5vczNC?=
 =?utf-8?B?Vk9vcHVpMGZralV3ejBpdmRLUDJySTlVeTU0aDd1UG5PZnlhbW0wMHNxMGNS?=
 =?utf-8?B?UVhwU0kzTjczS2hEVDNWRm9jNVo0Yk5YTEYvTHozOUtySkIxWU9pQjJ0bE5U?=
 =?utf-8?B?WFA2TzI3TDNHUjhxYnYySVB0ZldzK2dtd3B3VFlDRTIweUVmY1l1MlI1QlZx?=
 =?utf-8?B?ejlHa1N4RGJMMGFkYTZZVGkzL2gvRGQ1QjhlZ2FWRjZ1N3Y1dDJpRG9nMHl6?=
 =?utf-8?B?dmlzVHk5M2J0UUM4YXZJY3ZtL1gra1docjNtODdTSURGVWRyRkpEb1lObXEr?=
 =?utf-8?B?MkkzWHV4anpaL3VsTUgzaXRGOVcwaFZMRWtvUW5ndGk1QXh5ZC9rM3VSTHZF?=
 =?utf-8?B?a3AwcnN0ME1MUGFQTi9wQTR5RmVXT252aFFoalJIcU9Jb09IdUJ3NkFNTHhY?=
 =?utf-8?B?NzBIeWFRc2wvM1F4MElFUlh1dXRnYVNnazZwcGxycUZlR1lMdjFBeVpGQStW?=
 =?utf-8?B?dVNKLzlydHpFR2Fhd1c3VStmclRSL3BjYytOczh4bjZLSDlleW8waW5jcmYw?=
 =?utf-8?B?Rk5PUzFlT2lsU0FBTExwNWMxNGJLUjBuOVpXM3l0YXloZnFmNnRJNzBDdTFp?=
 =?utf-8?B?Vm5OK0p1YkRaL1BPdWdIT2dhcEZ1SERDRzNhYkRtYWRnNlVDT1VaSkRXaEk5?=
 =?utf-8?B?MmxhKzFHU2JIdmFrdEp1SGRWblQva1dFSXYzWDMyVnBNeFF4eU15R1pRN1l1?=
 =?utf-8?B?QUswdlBQcXlja3VuOVdPRm91YTFCeTZMVjFCNGhQUXpwWXlvcFVRUlR5M0p2?=
 =?utf-8?B?bGwvZUJIdC9GNW9BcWFNQlA1YzZFblM0NmVQck0wblNOWmZ2b05PNEVpMVp0?=
 =?utf-8?B?QXhaSFUzZkFKNjI0dFUzTUhIQ0V2enI1Q0U0cHZXcDNyakg5VThyeUJFZm1J?=
 =?utf-8?B?djZudEF5NXlhZXU2SzNBdXFLclZVNzVneDhHcXFIRW5ZbE1GZWN6S2wxeXVQ?=
 =?utf-8?B?diswc1IzenZyTVR3RHN1dVVOK2tucWV0SVNuemZjUC94ZE5FRjlUQlNPSVZI?=
 =?utf-8?B?U21XTk50alBwcHltZUFtb2lGSWxZNXJ2M2plVG1Vc0QwUmFLcFRzWmJxUDZD?=
 =?utf-8?Q?g9nGH31RxUxUMR/LHE5VM/dek?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ef7636e-ae68-4695-9b2d-08dbd0974e0b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 11:34:07.2119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LoanLbvAdekjC1uxSNpSUeB34u/7gha2s8yp57CDvQ20ElKld2FDCu5wDARFoPhLm5DPMEWY1pC++2zQpVUGdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7134

On 14.09.2023 16:56, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/include/asm-generic/irq.h
> @@ -0,0 +1,44 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ASM_GENERIC_IRQ_H__
> +#define __ASM_GENERIC_IRQ_H__
> +
> +#include <xen/lib.h>
> +#include <xen/device_tree.h>
> +#include <public/device_tree_defs.h>

While Julien and I are still discussing this aspect, my view is that DT
things may not appear in generic headers. At least the #include-s here
aren't necessary anyway, afaict.

> +/* TODO */
> +#define nr_irqs 0U
> +#define nr_static_irqs 0

Earlier comments apply (at least) here.

Jan

