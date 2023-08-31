Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C51D378E9C1
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 11:46:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593682.926733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbeFw-0000N9-2U; Thu, 31 Aug 2023 09:46:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593682.926733; Thu, 31 Aug 2023 09:46:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbeFv-0000KQ-VW; Thu, 31 Aug 2023 09:46:27 +0000
Received: by outflank-mailman (input) for mailman id 593682;
 Thu, 31 Aug 2023 09:46:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xL7T=EQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qbeFt-0000KB-Tk
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 09:46:25 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062e.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f12bbd4-47e3-11ee-9b0d-b553b5be7939;
 Thu, 31 Aug 2023 11:46:23 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VE1PR04MB7422.eurprd04.prod.outlook.com (2603:10a6:800:1af::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Thu, 31 Aug
 2023 09:46:20 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.021; Thu, 31 Aug 2023
 09:46:20 +0000
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
X-Inumbo-ID: 3f12bbd4-47e3-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O5VnJW7cYhp4xgXWb3KzQ+mtb3uQcFHBoUU6Ttl1CbrCo35paerKo+dF21pR+2mGipAHz14iaDQ3S23I9jV9q8xQb7pIudwjwyQkEU425mgqph7N197J2A0yTTyV0EgNjWVewyfL8KDld7jHo/Foz/pkWyjnqM0k0fmJnWUnyr3Xd3tJ3C01YCzIQK+x25J5jsVaAQqQdMJ9Z5/ZxijalsysuRbAqrJqbhlm/k9/aLJoHCpU1L+aW5zXQfMtVnImotClqTPSmmIVPNVvIvRoCC0+oD5FUNEL12NnKiL2iriWpX+ORHdU801kGTaVlq+mABTKd74POl86LmRYfNGC7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GtbEwX4+oS3nKOuBCAwjX38rPt2R6/w4KjD5Mr34F+M=;
 b=NB9xElV+tihS4DmmvMHYsRsUgwFiRSqGTvA5kwQA1S/WQAXaPlYHQJnEAAf7neKtxhb/5jozz7NCBdzZ/mtxPXa/aXMMVzl2MemiGgf9LnO/jjfqr6EFmN+xps+f9rg0ONzXasbBRePO2ca9NX1PaLoIqT21FMO6QcQtMf3//AvCqNG/+6ZCuKmJg6Z8mzl78MAd7E3HmQDsmZ6yJaAnczfp3isXM/bOSi1yb6lZfXUyw84oydKU5Lg4X6WPxZdD41JJMgxXKed4id6NkesAPCbYs0EuyP71euh/IJXQ0fd5bOrrscAN1TyWocOkR8j09P94QVxyNQS1q25W+72gow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GtbEwX4+oS3nKOuBCAwjX38rPt2R6/w4KjD5Mr34F+M=;
 b=g3pLA89xJQ4+nIgCWOKXHzE41wNAasAywnpyOozwUyj24iTIHvpFlgjnNqjIri46GLndNg3M3rxkHt8uSFo8AC/WBkMFLu2rOBm5/O3StAH/iPRyyAFPcibgaRqg/lVItmimVtlIG7sCbG2P1i+DJNrIFUrIqo3TLVTrVruZtYCrlFDvZsKD4ni2fu0Mu1NipYjhh+fUcVnb42KP4RsYsK6Na3sWfzP9x3DNIyX+gy5/GjJ+O45NuNCJ96OM/1jQcgQwikk9y0PfbH/Lx34ZGG70HvpiK+8zKeolscEa4u8nDy8qexD9DDwIAo98GBqp3uoX/CUqkdFDzvNJqyRbwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3a165375-0dd2-9a3b-403d-2306acd60b92@suse.com>
Date: Thu, 31 Aug 2023 11:46:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 2/2] xen: move arm/include/asm/vm_event.h to
 asm-generic
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1693414172.git.oleksii.kurochko@gmail.com>
 <ee7c3aa566dadd9350f39f5aedbfce3ae72ba663.1693414172.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ee7c3aa566dadd9350f39f5aedbfce3ae72ba663.1693414172.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0128.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VE1PR04MB7422:EE_
X-MS-Office365-Filtering-Correlation-Id: f0b3d883-d7af-4fed-19f9-08dbaa072158
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	e2IhGc1uWKU+134xf9j14llegi1CQ/yQSPJczCm7BThd0SmohYM2uL5W1AvRalbkptRfpN9t+oraycU8Xgv/6cw8qiZqUeCu+3xGukMcdcL2awFIS8pwANB1qp7OV9hGIHPY/+O/xpmn+IO3g1IkqZUHrezSM6qq5XiyGcxG/jc0blPhUgYAP7rAKYORYOFC4DnmQSmNczGBMinGnepL4KURZ5PuUSFDbqGsS+47l40+xfA0DSLmH3gwHySS1dvbDen8mSrD/aIQatCPYqAIGqIu0jOsDNRtv7IpgJw2NEhId6zOD1sygfnda2uY8UHOMsGHaiK89T61t1srzdCuq2xRtyFKojpw6lMpx9KfLJ9d8nLn52UVAz4EUymiezwT7GmG/3G1Pjru4T2faeW/cBoSEZEPT4awFFj7mDgHD+SKIELmhf5oDTihuKv/Rf+JMKPxcb0GrEbagr0aWEzsGAfTCWt2jXWUCFXJWc1XNNBPmktqe+rq7Ku7uzcNFpEUgivZU5R4JIY/pdPrMUnWf33l+EeIokzprlxTNLgOGwGGoToQXu99ibUj3Xi0cOJRZ8oo3bUNHUylvFfVEsq0wBXAmCSO9sv+doNaUPan2HUOL71/7csmT9dFlwHLqMxFuiXz47xNaKVjPkyW+8/5adkxskjpRioHAj7EvgpeXLw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(346002)(396003)(136003)(366004)(186009)(1800799009)(451199024)(41300700001)(8936002)(83380400001)(66556008)(8676002)(4326008)(66476007)(478600001)(6666004)(66946007)(6916009)(316002)(6512007)(2616005)(6486002)(6506007)(53546011)(54906003)(26005)(2906002)(38100700002)(5660300002)(31696002)(36756003)(86362001)(31686004)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmVOeXQrUDZFWW5OMG1lRno4L0tHaTJoeDg0NkNOT0I2OHczKzlXUzNaMGZW?=
 =?utf-8?B?N3hEZXM3eU13RTlQbU1WdzhoRW5BbnlTc3pFTUVBU2UvVUc2Njd6M2JTcTBF?=
 =?utf-8?B?Yk1LZ2pLWmwzR210bTlITzRLelczRysyZ1paWjVwOE16c25nbnlhOHhCdGRF?=
 =?utf-8?B?VStzVGpoQmR1SzFGVHJja094T0tMMkRZMm15Zms5MU05ZEl1aU1sVmhmR0Nr?=
 =?utf-8?B?bjBjQWFvTnJmUUs1ZkZQcWM0Tm5oQmlKeW5WMFp6M0kyQVVPYlNhejF0QUkw?=
 =?utf-8?B?Ny9nbURjZWxPeEVyZVlhUFk5RXNHakdpOWFpUWluLy9xTWNpZmY2S1gxbkhT?=
 =?utf-8?B?a0xxWUYzcEpFSjhHMW14ZDdJV0RQVFkxQ3k2V1pTaDFHVDVXbmRRYk5ZQTlq?=
 =?utf-8?B?am85N3EwREl0bDUrTzAzM0dIblF5RzRORFlQak9oeGF4Z2lnR1JtMlU3WDQ2?=
 =?utf-8?B?c0NLd1FkUWpUSHo1b2hCcnFqcDg0dzh4ZVlvU1ZyZi9yUHhHaStzUjVqMmRK?=
 =?utf-8?B?TzV3MFBuUGJ0MnBTWFRxQ3NRWXYvL0svc2JYeGVPNHVGV21qRUFubUk3dFJz?=
 =?utf-8?B?QjZLVkVjZVo2ai9MM05LSGhuVy8xTTdCNkFPTGVKNDl5K2FZM1ExZWg4bHg0?=
 =?utf-8?B?aXFwbmJjYnBKUmtBcXo2WUFHUXY3a2krMXh2YzlYS0lLaDVrTTVKOEthcWJ2?=
 =?utf-8?B?WTNMNStxc0l2QjBIY1YxYyszUDVTVWxlaXJwZ1RFclU1THY4TElUOURQUXhZ?=
 =?utf-8?B?eDhSSzJkZnY4TDMrbkY4NElQcmhSeXJHQVhhaWZNU2dWcitSWE9DNWVMTTdB?=
 =?utf-8?B?a2VSbGNBOVV3VlFVQjFYOVhEZkRsUVZic2VMQUI4d3hEYU0wdkM2K05yZ0lY?=
 =?utf-8?B?OUpzWlhjS1dvNmZjbUswNnZNVGw5cktZQVkycmlrNWVSS2QwWHZweUM4cnNK?=
 =?utf-8?B?SFVSYjhmaXprUUVlWW9iWENuRFlKTHpTOExlb29FWElZMFBMcVI2NkNMeHF6?=
 =?utf-8?B?ZmVUdURpZnJXUTZ3Rk8xc081SDBZNnkvbkJvMHhoOEJNWHB3L2Y4NXNtQVEv?=
 =?utf-8?B?R1h4T1dod0RQa1AzVklGTTJMSjVuaUgwRVpKdkQ4NEkxcnQwUU44SExmMWJ6?=
 =?utf-8?B?aTl6NmFIYVdNaTNNT1dXNklsdjlKZUJnOWc5eXNwaFBXc1NtdE44OW0vWld0?=
 =?utf-8?B?UnJVT2M3VFVvVVAxbzN3ZzNHc3Y3NlVJRHlyN0JOY0c3QjN3Qld0MnQrZUNq?=
 =?utf-8?B?TzgwQWYzemdVL0dJeXc2WVpNNzdSQ0lOUlhHM0VuT0VjaUJmOFJULytmVTBh?=
 =?utf-8?B?bnphVUdkRjRZMGw2SE9zQ0QyMDkxNGFpeVdYaWx5Ti9lLzBiU2M5TXBWMWhS?=
 =?utf-8?B?b0hyQThBSjZNcGtEQWlCSy90NE54UkR2dUdnVGQ0SStENlF3MVBLN2dhODBh?=
 =?utf-8?B?NjQvRnhLRkRON2N0aGRDVURMcnNqVGVQek1pelJvQzZJZEN3NXNpc2o3YXhK?=
 =?utf-8?B?aUhyTFpOMGZoRWE3YmVVRTI3cDVERmRJRmVSN0JSOFlabEJMcGlGaFNpOVVG?=
 =?utf-8?B?VVM3Y2RUa1lNbUxtajAwazFPcDFqSWhqTXZlampKUVY2VzRxL3cyWldqWU1O?=
 =?utf-8?B?UWZIb3dTN0tPOS9DampDRENKOGplZHQybnBTcWRhME5GM28zeGUzSHZxOGxo?=
 =?utf-8?B?YjNXakpEV05SR3B5Sm80L0orT0JpL0grWi9pellTYXdVbWdTTlFVclBiYUs3?=
 =?utf-8?B?RU5KU0JUK0xKZlhOUHpQdWo5SnJUQm9IZzdIY1BsY204c0J5Z0s1ckpFTU1L?=
 =?utf-8?B?UmlmZFM4cmx2Z3RQQlhqeEV6ZVBGS05SdXRJVkk5Nm5meXJFK2xpY3BSUDBm?=
 =?utf-8?B?UEIweEtOUTFsWURlSUNYelBxbDhheEEyMlhJQ1FxMFhFV2NYN1BxYXR6M3dB?=
 =?utf-8?B?NVZpTWpmNVVFQ09FeVhMSFZPYUNSVnFzUDNHelFpaWFBU2NsN0Ywai84ZnpB?=
 =?utf-8?B?RUM0dzFJRU13am9mWTNtSWJvNGhMVUdBcFhXTlFPMXRxc0hWQ0U1bERUTDZt?=
 =?utf-8?B?SXFvRGk0ZVJBczIrNmNMaTcramxBRDk5WUgwVlM2VVpxMU5nUHowajFWbHQ4?=
 =?utf-8?Q?KGIsqhFDFvL6GqKy3l/epzYdV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0b3d883-d7af-4fed-19f9-08dbaa072158
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 09:46:20.5152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GwKpN6YR2xJda2+HJz6OzdkMegIs7dJcqO+Ohv2uQEdtmyg/lyOHDthMEZY8N7aCeZa+ZtXrR23yO76hs1HLdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7422

On 30.08.2023 18:57, Oleksii Kurochko wrote:
> asm/vm_event.h is common for ARM and RISC-V so it will be moved to
> asm-generic dir.
> 
> Original asm/vm_event.h from ARM was updated:
>  * use SPDX-License-Identifier.
>  * update comment messages of stubs.
>  * update #ifdef.
>  * change public/domctl.h to public/vm_event.h.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
> Changes in V3:
>  - add Acked-by: Stefano Stabellini <sstabellini@kernel.org> for "xen: move arm/include/asm/vm_event.h to asm-generic"
>  - update SPDX tag.
>  - move asm/vm_event.h to asm-generic.
> ---
> Changes in V2:
>  - change public/domctl.h to public/vm_event.h.
>  - update commit message of [PATCH v2 2/2] xen: move arm/include/asm/vm_event.h to stubs
> ---
>  xen/arch/arm/include/asm/vm_event.h    | 66 --------------------------
>  xen/include/asm-generic/asm/vm_event.h | 55 +++++++++++++++++++++
>  2 files changed, 55 insertions(+), 66 deletions(-)
>  delete mode 100644 xen/arch/arm/include/asm/vm_event.h
>  create mode 100644 xen/include/asm-generic/asm/vm_event.h

While it's a comment on the first patch, it's really better making here:
Did you look at Linux? They don't put an intermediate asm/ here. Instead
see their scripts/Makefile.asm-generic. That way an arch still has
control which generic headers it gets access to, without duplicating any
of them.

Jan

