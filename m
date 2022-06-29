Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B701B5605A7
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 18:21:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357960.586869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6aRK-00051S-C6; Wed, 29 Jun 2022 16:21:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357960.586869; Wed, 29 Jun 2022 16:21:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6aRK-0004yA-8S; Wed, 29 Jun 2022 16:21:18 +0000
Received: by outflank-mailman (input) for mailman id 357960;
 Wed, 29 Jun 2022 16:21:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NFaf=XE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o6aRJ-0004y4-8d
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 16:21:17 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2055.outbound.protection.outlook.com [40.107.20.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7feeaac7-f7c7-11ec-bd2d-47488cf2e6aa;
 Wed, 29 Jun 2022 18:21:16 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR0402MB3380.eurprd04.prod.outlook.com (2603:10a6:208:19::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Wed, 29 Jun
 2022 16:21:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.014; Wed, 29 Jun 2022
 16:21:14 +0000
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
X-Inumbo-ID: 7feeaac7-f7c7-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mY3deMXYLasuNs3FGu6U9foTwKxncLfPIRPa4QOeHf2+cnbpFWLTWJk+sAtIYLyq9p/md4UngxSbQzeINDD4MaonvV1pMOA73KD3lmgQ3Zo2fqzmSJGGr5dxDQDVhOHTzjemyOsXvtJ8HoNbxE8kFZ1YZDcR4NUUoq7pmxRr/sHgYfskGvS9cnaIGub34h2P0sM6hrQYdqqjWT1oJuLoLdQ1D1HYOvOkxrfUGZSnL1lRPQSv+RDA97mfSOM2nHUGtpZjuQSokm91pUhXEMLxGS1jR+h1LtLFsv27DRhLumgWDK/5Jyix7UhafKIBs8Ss+ICFIzHwjqSkJcLFnA9zlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y70GIlYFuOx1UrbqmbhtVGLcIpzH3WvBuudZ2aIuwc8=;
 b=VyHWOQpn98V8d5o5tsMPIeVVdOVHyrzENP5d7gY+OhMvyEY1x1MzCWvliJAXloo+wJD8cQVFCrs0AQgZTSq4Gw2R3i2YIakcNIBirorCpRqeJF9C6Y716A/mDLeQRdPx7Y/o0DgDBogid2lBVZFlJhRgfA3WE5Zbn5NqqE9td+KJ9IrSaRY0ZkBwhabEo/ADl+mN+8vQyOV9qujDffC08RjhJDPAo7/2mAxMYaByzXFTWfUjE93vr3rkOd3fi0E5UAggFz2B6XvpJf6RtK+HA3KN2OVLAh7nhOSvKwaTChc7C7K/yt3bC2OL+o0zR5H9ZgnelUCPQgPUpDHwtt9Z4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y70GIlYFuOx1UrbqmbhtVGLcIpzH3WvBuudZ2aIuwc8=;
 b=YAT8xFnjdQJf0IBcdlKz7VShWGHheG6UvKYPOu1+YZtQaWulY5n51qu6FZ/yrBT1ylGRLahBou6IWU/tnpbHcsPxWAr1KAEGHcBpBy1VJr60vz8qfKwyo8Uz2BS04P+YEMDZ9BMKZj3jznp0k3UOq7il5hZCXn74xf9OsKniuASydvHEcEAOlFwYTS+D4v5dg1GDNr0uqZ5YY8He9Dr1VsTS4x5JKzXAWxQQJoHGdg5jvx7uoJHeSJCxQaPO8uDV3oGCcwncVy6xXuJZDN152T0MHbBgQXPHJcxm56Uz7lyOneDYUQ45ck8ncsHWRK2rqaIJQBRJ3RQ/qD45N2nKCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <22a70226-71a5-6caf-46b9-52956f6e9a6b@suse.com>
Date: Wed, 29 Jun 2022 18:21:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] x86/ept: fix shattering of special pages
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20220627100119.55363-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220627100119.55363-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 163978a9-1c5e-4ada-2bc9-08da59eb6333
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3380:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UyWOCMzdqagE1nm325CzxK3ikSAcQdRL9qrB0lQ9pkscfdiFLnx68Ffxjbtb+N8JpdAh1ke8JnCVplh4+2hpBVGJxki74IzcqmytOYV6GgwlmKP5zG2zyOiNzLxFNonaXNS97jcHOO75FhJ7wPgn7HVc5asNDFIGVXtGYPNrcEzwC13+lQOPuyniGsAO8MzDeLwE9IebO4sGojvGoEUxY2ZhKB/weBV7FdW/TG/l4/fbpcFFwQFc4zyqYwlSKh5OaHWFYhnKQ7UMNGoT5zlRlnF73zqlMND3QJ1KmF6PmJGTaj1tn/iciE/SUOnREDH1AkmO4IQVjQTvFBS5TyQoR8SnQbxFOkIux1hrMeff0vkcb9Fkpf+7XLfu4c3epf65aH3VwWIpHNC3GTIWErRXjvTtUuRjnnNsx/mypPhSOQmmAnhAcbNqML+hcJ436hvOCu+9Df2iYcnJp5uSWr/6w15wQuTg7leXGlLspCkxxDEzJZO0dO1OanrNmLwMCfq4tRrxIlu5GxOaKab75P+raeQdZXCByECWuUkeC5Ui4xvCIszjUGMah8N8ImSqalnnG/JH5pgma9EL+douzxIhPU+F23xopLkvXbbhUllam+JLHM7LGbiBfcmXs0wE1qGFPf+SwTKjvM41acU09+ekBry1kvPYwL3TZR0yVNzJxaSHMzRIZ2/PCBQQ/x4LMYtVwrew+mnIBhQ+KumTyuWOAViP5pHmr4V9iwq7L0bPu0dW++qSKGRSO0NKgfeeFQ03XUafuL9SbbJ52pNzaORukhhxDdlzdCESR8BztBQ6hHTHk75zXWi76SVXWA7jIPavqOTrYjNmm+hC2JOKFtpKdA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(136003)(39860400002)(366004)(396003)(346002)(26005)(36756003)(4326008)(6486002)(186003)(5660300002)(8936002)(478600001)(6512007)(31686004)(41300700001)(31696002)(2616005)(6916009)(54906003)(66476007)(6506007)(66556008)(53546011)(38100700002)(8676002)(316002)(86362001)(2906002)(66946007)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWZIV3NvT1NaTStVRkZPWkJBeVdPNldrVnNPeHZhOVEvc3NtUmJYR0J3SnFn?=
 =?utf-8?B?SlJZSDlvcUZ6SGVRaTFJRW80QU1rR1lZY2ZlVmZmN2FIcW9RN0Z3SnhmUytP?=
 =?utf-8?B?Y3NWYmRsUThYMHB6MXZhNHRWclM2QkhRdlJJK21veHhvSWhzZzR2ZlZreFdI?=
 =?utf-8?B?YitWZDNOLzVkTUE1R05qdnJBRk5hRHBYNnEvNmx3dmkvdys1bThPV1pPNUkz?=
 =?utf-8?B?WU9hZmp0TXlCc25MbStFR09QcGFwT3d6cTRIUnFVNnNPcm9hZGRFY2hjbjg3?=
 =?utf-8?B?VGNBQzZiTmpnWEpzMURRM1FlQk0reno2aFFKbFVFb3Q3aFFkU09UWkM3dC9i?=
 =?utf-8?B?OXVYTmxMdDRBdENGUWFlbHdpMkJGWEt3ZFd2UHBsVERpQU9LR2MxTVgyam9F?=
 =?utf-8?B?VThVdWhlK0tPUVB1SG9uRjEzeThaNnAyK2QxK2l3WG5mRHlKOEJCRHhUMWlF?=
 =?utf-8?B?U3cvSWptbHI4Z1R2Z0ZwT0trREhpYUt0U2FRbVJpYUVYRitrWlI3OUd1eEVj?=
 =?utf-8?B?QmJIaTVsemIwS3BPRXBXWHVua1NQODN3alJhUTJnRG8rVlliMDBVUUdia2Nk?=
 =?utf-8?B?RGVCdTBicXJTaDdkbzhnaDFNdnNiM01aeE1aRGVHOEd6ZXpqb1R4R3VML3pB?=
 =?utf-8?B?cUZ1UWs2Rkt5TEtOaEF4a00zWkIxTnpIWEROY1M3U1Uxa1RxSGxaSTVmMFBp?=
 =?utf-8?B?NEQvd0Nvczg0ZzJXVFdrbE9PbFBZSmdrOFZyVDNodUZaL3BLWC9PWDdHTWp6?=
 =?utf-8?B?NGZMb1Z0V0dxNml3ZnJHakFiMDhqZEpGMWFOMDJoSVVoNnJPNjJiVkgvSmtE?=
 =?utf-8?B?eWczejBMbkFUbTFqNDlHVjkzMHczV1kwaFI1Z0N5SWNOcVRIMnRabkxwdUQ5?=
 =?utf-8?B?aDU0MkxhK01OQzVNSjJaVVp4U2E1M3BrTjVyRmI2VVhMc0M5Y0VoWURwc1Yr?=
 =?utf-8?B?a0lxcXEzTFV3ZGR3Q0xUWWo2THBhU0Q3bk1TOXZGR3pFaHJjdkErQng0T3lT?=
 =?utf-8?B?ZjZxMERhNW5UL1hiUW1xVytFOHhTU2hUS2xpNkM1YmNDeFRKRmNBV3J2T2xN?=
 =?utf-8?B?Y0NIRllQMGIwVXFoTEROMWM3cjRKSGU3ZERSSHJDWS85ZGxHdG9nMVBCOFZY?=
 =?utf-8?B?RjY1enc2S1lBbUFQbjFMdVUvRjkwbjhmQzhIWGZ0SHJVb0JzaEw5QVNzcjRS?=
 =?utf-8?B?Rm5oMHI3elRqMmlnMlUyc1JOWUllS3EwTG5XZ1M0bnJKT2JmSHI5V0RWM1du?=
 =?utf-8?B?aktNYWlFdmdUS0JRamExN2VSdlBBN3hxRFVpV0NUdEc4VFJmdG94OFF5VkYx?=
 =?utf-8?B?cVlmNzBmdTYzS2ZMUzltUFErYmk1WmV4ZmIwWVBzdHVtV01WeVMwSWY2bGFR?=
 =?utf-8?B?aDR0Zk1xY2h6Z1Njc3lqelU2RlJOYnlmM0xWVHQ0TXVVcUN1RStJUGZLbnJM?=
 =?utf-8?B?U25aRDk2OHNJUEVGTTdMVjkvZGVNWnQ4d3Z4YkhFNXlZeUp3QWJzRjl4ZUZG?=
 =?utf-8?B?M1ArN0tCaFhqNHlkdyt4Z2pGa3M5S3U1bUhxNDUrdzNHU1hxWmVNbXllU0Zk?=
 =?utf-8?B?ZGNEamk5bCt2b3FzeWZVdFRnWEY3cGFtc204QVF2bGRjZ1dnUnJ1ajQwNk9h?=
 =?utf-8?B?ZTZBU0JNYlRUYkkxSktpRGNoVThiYW1TRjlVMS9GeGhhT2VTZFBJcGlMaXZj?=
 =?utf-8?B?cUlvdUtEYTVlaVlDdWRNMEdiMmtMUlVXaUJqakRJcXoxWnNmL1pOSzdyK3pC?=
 =?utf-8?B?N0hybC9URStGWWEwWGdWc0x3bUhzNUJmUnQvK0tmaHJGRUE2Vm9iYmg5QkFw?=
 =?utf-8?B?NlNiQ0FuRkhiKzdTL2Jpc0gwcDJTN21SV0NacHdNL0ZsekFMYzhyWGxkZGdL?=
 =?utf-8?B?aFlxVENNYjRwbjRWa3htd0JodGlSYndNN1BqQzNvOG45SWJSWjNPWGl6ZDVO?=
 =?utf-8?B?YmJtLzN4S3crajg2c2ZNNDRxeGpnTmZXRmx2YmhrZEk2WEFlampreUtvdlpU?=
 =?utf-8?B?eWlyN0RsRmJnUDYyNzZxaGdtWnJMRFZoUlhWWGI5djFtbEtMVWpQNUZmaUZT?=
 =?utf-8?B?NFRPYVpZL09QOWkxWFBCZ0RERG9pbGFyWWxQeFFGVEtQZ0VyMTlabEN4SEVH?=
 =?utf-8?Q?I3btvzcGOc9S5a/rQ2B4FXNKe?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 163978a9-1c5e-4ada-2bc9-08da59eb6333
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 16:21:14.4080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JqZn9xcZ7aOjVzYW9OcLg+L1Dab39QQSSRpHORqq7lFx7Kjz4+waLS/Pu9zv3+eaF6i+UWLUll4rWVXhNImIUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3380

On 27.06.2022 12:01, Roger Pau Monne wrote:
> The current logic in epte_get_entry_emt() will split any page marked
> as special with order greater than zero, without checking whether the
> super page is all special.
> 
> Fix this by only splitting the page only if it's not all marked as
> special, in order to prevent unneeded super page shuttering.
> 
> Fixes: ca24b2ffdb ('x86/hvm: set 'ipat' in EPT for special pages')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Cc: Paul Durrant <paul@xen.org>
> ---
> It would seem weird to me to have a super page entry in EPT with
> ranges marked as special and not the full page.  I guess it's better
> to be safe, but I don't see an scenario where we could end up in that
> situation.
> 
> I've been trying to find a clarification in the original patch
> submission about how it's possible to have such super page EPT entry,
> but haven't been able to find any justification.

I think the loop there was added "just in case", whereas in reality
it was only single special pages that would ever be mapped. So ...

> Might be nice to expand the commit message as to why it's possible to
> have such mixed super page entries that would need splitting.

... there may not be anything to add. I don't mind this being re-done,
hence
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Yet I'm not sure I understand what case this actually fixes (and
hence why you did add a Fixes: tag) - are there cases where non-
order-0 special pages are mapped in reality?

As to the Fixes: tag - I think we mean to follow Linux there and
hence want 12-digit hashes to be specified. See also
docs/process/sending-patches.pandoc. (But no need to resend just
for this.)

Jan

