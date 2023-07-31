Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A927D769741
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 15:12:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573038.897331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQSh7-0003yd-EV; Mon, 31 Jul 2023 13:12:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573038.897331; Mon, 31 Jul 2023 13:12:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQSh7-0003w8-B3; Mon, 31 Jul 2023 13:12:17 +0000
Received: by outflank-mailman (input) for mailman id 573038;
 Mon, 31 Jul 2023 13:12:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bN9S=DR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQSh6-0003w2-Lp
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 13:12:16 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0609.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de55646d-2fa3-11ee-b255-6b7b168915f2;
 Mon, 31 Jul 2023 15:12:15 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB8185.eurprd04.prod.outlook.com (2603:10a6:10:240::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Mon, 31 Jul
 2023 13:12:13 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Mon, 31 Jul 2023
 13:12:13 +0000
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
X-Inumbo-ID: de55646d-2fa3-11ee-b255-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TmpSrtYK8BfQf9FEKnRwwguH3xFiwmz0vECVO0wuTyG2+blWBDeL2cz/pdyg3b2I6KXUAsS817rsHcFBhEO00ibz0ogaarYcS6LnroawSO/mq90/ZiyyuKqti/VwNVuQYO5C08znhqnahWSaIudI7aLW4YyVxa9p+Db0BqN6/wBuj+QR79yfk9jlYOrHNAdOPu4DEnCpQKLsjPDmWtbqwvsuxHxqtl+rMKch2hWe1y7BtrXRw1ukeK1mR78fJG+iWC+d9aDldEslQyuOqP1vFwwVKw8UcfvlVFvX5xoCME3kKWpbyWo/W/oO7A7hppGqJiM4rJ14w1KIxSQgm2cHsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BHzbX8IHjWokso4ux/ZPfO0r/jQa2hAbX6xf6fr9I7k=;
 b=KjI4vSoGjDc4rQhVaovehRlQzym6Un0b5O4zpQEjMPv9r0hXYUJxXegPuNnGMrApOZwogwqnOEeKlSOXfPXvh+6K36p9szvEPzwBVIQvkyOVXzIxxuwYJX1D5eK39JXPCkxywwvYUmJTkUihS+Dz1XpqVlwLOGM1lh0o1y0ux4Vh2vPySWxLxd1FMhTDTWR9l2rs5VXLuiH7SmplCg3lWkXeVopKA7+UVX5nGzoBDIWQbGhLkuQjh5BmJcKotLF7yVtAmQlp6w+9oy0vQSccF2VSULtMC8zwobKV4CNw6d/kowkixRZCnKtBcP+2YcH1u2fvBb8ikPP7eBA5Bf9zfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BHzbX8IHjWokso4ux/ZPfO0r/jQa2hAbX6xf6fr9I7k=;
 b=kMV+1d0KncwRpwkfBA9Gfioet4Ru6AlO7Mumhnrc5lGtCUtaTRmcfVFWv2NQBnUpTY9kb2Lzs8NC9gCpSsae7/cqC5zTc9WereVwNK9s4I8aTl0htWmlEMtq7+jMUHec3tOgoppcbeegI+bVVFOlWLHufKG1rmiAcEODu2AbD0QQ2hWKTYSjrP6AvHiUO5XBsBa9bupNVJc2Z3odoAm/xZqjueTjNIoVS/Zr4ysDXPeWoetSSB7gGx9f/kLYbuq7dUnyvJ5jIlIhLp135wEhUmyqGfH1Sx5ykQdrPHVj5d3Wgo0p6LpWTa3P2eQkimNbKU+x24j7oxzZ9pi7yZ7x+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c0a38938-b08f-b523-f681-74ba17c28dda@suse.com>
Date: Mon, 31 Jul 2023 15:12:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [XEN PATCH v3] xen/IRQ: address violations of MISRA C: 2012 Rules
 8.2 and 8.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <c07d2a38fa296e42f9d089553f9c6b1d916dbbe3.1690807908.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c07d2a38fa296e42f9d089553f9c6b1d916dbbe3.1690807908.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB8185:EE_
X-MS-Office365-Filtering-Correlation-Id: 1128b2bd-facf-447c-9fe8-08db91c7c15e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LBK9ldmlJwlEK+D1xmU649dUSJuzofCq9MeWPqXPMASu2PsPQrD9Fqd0xIeQKmWI5hAu5XVnj0+W0swhc16Icla0fbxsR0Eo6yasvIwYSxbYenFM+rmtTUwK/x1gbd/od1KwL8rIZFU+yhAz0GBz+6UWXR0BCo1vYB0HE3sd3japn8Qvq1ZqXnBGyd3ZnWjKioiQsSe16fdm5nxN8mDMKVn+/3629Qokf/WXruEl79bmK3C5OhDsEh8oa4FWhH/2QVsMFbgNsqfJAXEvJ/EzemBZjJLrTaz3r1IIB7DkQ/a9oFrDjXbHOK64NeJ44HxW9g9DX/CyZWVNTk0B4zZnjyRzcLBCTgPaFV46Oono4TXAYxiXeXzfH/iqAkrxLUevltDg8gOzVgNHhFPSrSxIXZLVTGaYDYw5b7/vUHRkR7Bu79vo+Af8tDMastGwDU+90ElN9nSyGG2CWw010r2fditrDNGBmn0N5LCRliqld+iYmgB8QidxiRQ8WckrCdZA/nrLHQKVBx/L6iupler1sbFyYf1prF9I9gumowAIW2uIM2aHintfqJGtQWrpPV6YD4WaqAtE3wTr7YhhnTmAeZ7oKhkkiR4wicAiCmV26kDxcAoElJuAzFzgkFcJz66de3c85abcrsEOkmcinjrSmA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(39860400002)(346002)(376002)(396003)(451199021)(6512007)(6486002)(36756003)(53546011)(2616005)(26005)(6506007)(186003)(66946007)(66556008)(7416002)(54906003)(31696002)(86362001)(66476007)(316002)(4326008)(5660300002)(6916009)(8676002)(8936002)(31686004)(41300700001)(38100700002)(2906002)(478600001)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWY4NjhQeEQ5eTNLeDRTaWlXWW0zUHk2TFJSMWhscktXaThRMUR0SWRSRXFS?=
 =?utf-8?B?Y1VNN2hXNWltQmRWYjJQQUk0U3NjRlMyWnpHdGw0ZDJPTjdYZUxKUlFUNEJQ?=
 =?utf-8?B?WjZua2ozQ3VsSXRaWTZjUjY1bUFiVzF1RURMUmV0dE1OdGJsTTh2QUVGSkJn?=
 =?utf-8?B?UGREQU1Xc1IvbzR4S1lvMENta0ljbitNcEpyL3EzQ0xNbnZsbXQxRGFpZ0pZ?=
 =?utf-8?B?d2tNOVNvWEtEOVAxUFZpNitmV3o4N0M3UThxdWtxcW12NzVmQW93Ymd0d1M2?=
 =?utf-8?B?UHp5cnZIMGtQcGdKSkhXak5tRlMwdEpDVFg3Y285NE8zMzBHdjNLUkRUc3NK?=
 =?utf-8?B?RFlyRWIvM0hWUzhQZlA4enh6M3J2VW5NYVk0UkpHZWRGd0tDQnJYKzU2RCtz?=
 =?utf-8?B?aVhFb01ZSG1mMFVxVkhIbDJVSHBTVVRLYlFBdU1wZFZBYnp2S3hoYnc1emN2?=
 =?utf-8?B?a09wUUFoVytWdzN3TWZyMXFhSGRETFhUcTQvZnREY3g1ZE1Wb2tMZGwrdWg1?=
 =?utf-8?B?blZBK0tIM0NuUXBlRXNTcFEyem1melAxMHJxRXFTSG5BUUNNbzBYYURUL0dl?=
 =?utf-8?B?TGY0Q2EvYnNYRDExQTY1aCszQmVGdzVVR1ZaNEEvcVJKcWo4d1NvQ3hMa1Nw?=
 =?utf-8?B?Sk5RQ0F0MHJIU2t2Q3VSRW5aaTJQNHprajNDRy9lK0JkdU5DcG1uTm4zc0M4?=
 =?utf-8?B?Y3EyWmwyL1prTm1JUTdEU3dtbjZlcWxLbk1adDB6eU1DUjBCRTZxUG44c21w?=
 =?utf-8?B?bjJNUGVUR2xRT0FaQmRBMTRTREw4QXlvM28wSFh4MEhLQzlGRjIyMXFqTUFr?=
 =?utf-8?B?M1RkRmNvSEpGZ0ZsRjZpWXNtZkhqZXUyR2wrZkdaKzU4Y1N1YkNkZDB3Nklz?=
 =?utf-8?B?ZVRkZGlRcloyQzlYc0lrWmxOcERqa2xsQlhnd1lqMmpscm4xSldaYktQZERh?=
 =?utf-8?B?cmMrd095UmJHak8zNmQ2K2ZpRXBXQWorV01ZcXZUL0lXeWhzcUs0ZyszVmV4?=
 =?utf-8?B?OENidy9TZnRPY2p1SlpmY0Jsek1tOGFseW9zem9OY0FqWjZOeXMxMXpWZ2c2?=
 =?utf-8?B?bVFMZ2V5UUY4TjJRbGl4NHlxS3BwQ05rSlBySVNVT0VsdGpldVRwN2hzYmNr?=
 =?utf-8?B?N0hFM1F5MVd6VmhOWGhjQlpmclUyKzdGek1SSmc4d1RKZEJOZS95NkdYaVBP?=
 =?utf-8?B?NXlCT3luaWxqVUFXMzVNZUh4N2ZaTjFGeHovWU1wSTdpK0N0UFlHTXRyaDJW?=
 =?utf-8?B?TEVaejEwWFhKbHVKZzRjRmMzcHZ5WmxUYUt2UXRjNzl0aFJjWjFyUFFWKzBT?=
 =?utf-8?B?OVZLUkl5RkJZRzRzL1c5NUlSWFJzeDNYQmttQWRxdmlvcE5vcjUrWnhMKzBC?=
 =?utf-8?B?dTlCZm9zTDJVNWlOR1VBZEprRUpKQ0EzVFBERDJvTlBMUHdUQnJ3bTExMExN?=
 =?utf-8?B?enN6TEFGNVh6bVN0anJVS29MV2QrdFRNVFZyRFgyRTRZYjUwM3hCWWhsYndr?=
 =?utf-8?B?VkFqTC8wN1Irck5zYWxTNzFMOVRxSUFYUE5SRDlZajlWQ053WkRxVFViYUlu?=
 =?utf-8?B?dGJWaE0vOFpidDdwdVlid0V6K1ZZSWpMWEU3czRpaHhydWMwd080eHByZzU2?=
 =?utf-8?B?eGFrQUlxS3FyU3R3d2o4NUMvbndiVCtiNVZaQWNrSFlpQmVOdzE4bVk3VHdZ?=
 =?utf-8?B?Q244Q0NucHNCMnhEUHRNZmZ5QTVsdm9vL3ZURlJsSDN2WW45ZXh2ZFBlSi9H?=
 =?utf-8?B?ZDJxa2c3U1VFblRhRVp6LzNHdU5VcWgyV3BWaW9RSyszRjdOenlNbmQ2cmsz?=
 =?utf-8?B?SEhHdENHOUJiREpUVXZqNXdteGVLSmdTWElkY2Q1VEhsdlgvZW1OU0RTSzly?=
 =?utf-8?B?Q1U4Ni9zaWc5MmFyMFVyZXRMZHNQRnMyMHQrb210NHZnaEZxU1JBQ3l6ZVQ4?=
 =?utf-8?B?bkgxWHBZbWpFeUZXTUlCUVMwUlNVRXJTUkJTQ0MzR1hMSDEycGVrYVQwT1hM?=
 =?utf-8?B?T3pGancrbHFDQUNENlRZTW1Pck5CSDZpRExzZlFNWU9DZ20vOXpQZjZJRDBI?=
 =?utf-8?B?QmlKS2loRDNDVmFCY2h6V0hjQUFMa0hNd1JTci93a1VTclNNQUxlTTVMT0FI?=
 =?utf-8?Q?USDG4VCzcMtpDeOGs+BwJdA9w?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1128b2bd-facf-447c-9fe8-08db91c7c15e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 13:12:13.3380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GcRwPU2uZmB9e9fgf3Z1k7EN0P9tIGC9V/wWXvROwwtyTNGYaMONqm7ti9pSPZbd/KiVlYaUVLy5Bn80GYUaow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8185

On 31.07.2023 15:02, Federico Serafini wrote:
> Give a name to unnamed parameters thus addressing violations of
> MISRA C:2012 Rule 8.2 ("Function types shall be in prototype form with
> named parameters").
> Keep consistency between parameter names and types used in function
> declarations and the ones used in the corresponding function
> definitions, thus addressing violations of MISRA C:2012 Rule 8.3
> ("All declarations of an object or function shall use the same names
> and type qualifiers").
> 
> No functional changes.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
> Changes in v3:
>   - uniformed parameter names between arm and x86 for irq_set_affinity().

I'm sorry, your v3 submission crossed with me committing v2. Please
submit an incremental change instead.

Jan

