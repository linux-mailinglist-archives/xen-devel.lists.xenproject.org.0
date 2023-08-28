Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A60D78B513
	for <lists+xen-devel@lfdr.de>; Mon, 28 Aug 2023 18:06:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591684.924133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qael7-0007Wf-TB; Mon, 28 Aug 2023 16:06:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591684.924133; Mon, 28 Aug 2023 16:06:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qael7-0007UO-QV; Mon, 28 Aug 2023 16:06:33 +0000
Received: by outflank-mailman (input) for mailman id 591684;
 Mon, 28 Aug 2023 16:06:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UdW+=EN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qael6-0007UI-JK
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 16:06:32 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2043.outbound.protection.outlook.com [40.107.7.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d98f84e0-45bc-11ee-9b0c-b553b5be7939;
 Mon, 28 Aug 2023 18:06:30 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8727.eurprd04.prod.outlook.com (2603:10a6:10:2de::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 16:06:01 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 16:06:01 +0000
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
X-Inumbo-ID: d98f84e0-45bc-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BDufDPXLavuy3PaO5OC2mEHDUvYR+SMN+YnOQLQTy3JajYxwqpXM95w/dBMZaWSTUxpZqa79Ukz+IJLo+zGAqe8wMPbl4mj9bGAMZWAAymq+Z2IqrmpXj0BQSmd4XO8ocAxyStT7MW3Bn7uQr5vZ6TH/RBOWImpkRLGufEz/1Edt6sD1ScIgbFpupbU+0ZaPqs++wJmw/xNPnuNadX+GTGpOf+ipaNrjxOWrfTXwd5ToFSzj94B1VfuTgTMv6OTRkSvMilG+gUf5vM/YJvKRVFux5c6wZ7NzhSlsAUs1xb7F9TYP6PW3ginwMVvsSnQ2LAb+I/jM6b4vzjNvFGhaaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mp7cpYfUI4DZyBtHSEZ552Qp3NijN18wJVOrzzeXxWg=;
 b=Rr66U8yi63DaniV565sqgy7kUIXxcOErJLwKUAIrOW8/0UABfQAhepjqg9wzJwpPuntfRtqIyxjdPvemPmzP2qKKpItxDI4Qa6pk8R2L9y7BqS3fZazeO8tZsHb3snSs7oAHURvwVu8j8IfUkWrt08DXvI7zlA/bYeGFz1QnJFMfy74QUTM3dXfyBogUlqrbzS8NBMmdTF/ty6ZbCheWK/p519Z7eh0NKvW1r6ekUCKL7IK8QOLJRut1lJlyrygADDqwaxBOpwhLJh0LcoVHYwix8Y+H08QnqSpuU0FUZqAU1jNNvaZcus5iCVQpsGweeXX8dvGeFJq1KrnXA880sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mp7cpYfUI4DZyBtHSEZ552Qp3NijN18wJVOrzzeXxWg=;
 b=X5nC033u5f7vYbby32SBYvSSE/QNf/sWuIQ5lcKSDiCwdZ8ji2X7+izqY9dVQVrmGnr1G8pclcffn2i8R+M9Rap+qg6aPzzmUem9ub4c8a5NJJIqOkZlfszbZL/3hBeLRNB/PorL93U6xy9Hyp/EkeywZRV2x0GHPWQEM0m86GsKRvHWefL6nXyVOEdXSUczYMZkI4lyXGTO9G0EcxpziqPMsvQLl/3HBAXFdLMkLCxDklyuIxOJZAmeorIV/W1hgFrep3BZ/789iExmsO4KIV5K02cdoZyCjxfeD8ihzJeCXv5nLZYW5z1mY6Ro0w/GE6zQPHw2Ddtc6ErimH703Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0b17a63d-ba1f-e8d0-88e3-6824ac17a26f@suse.com>
Date: Mon, 28 Aug 2023 18:05:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v1 2/2] xen: move arm/include/asm/vm_event.h to stubs
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1693235841.git.oleksii.kurochko@gmail.com>
 <c61f930fed46e2312f460333401488af4b0adfc4.1693235841.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c61f930fed46e2312f460333401488af4b0adfc4.1693235841.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0193.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8727:EE_
X-MS-Office365-Filtering-Correlation-Id: e82322a3-b806-4090-0fbc-08dba7e0ac52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ffAFtdPsxkFnNVVUB6xMJXKPKluWoY19SO3A6Yx6KL+1fxZde+cptEmikKy5NtNsjneJPHD8nx/BNFLKs3yaTnRhkM3eXTM2HW5Nqn+g+ZRCER5anrX+R8TJKu11OjqhDf71ugzW3ommykJnt+IMqMiSFv2+w5NviLpazhgaUEo2KMeNnGSadncEF11cYK1LB4uLBLkYxV1DzZA2SgFc8BKzBuWaVTdi5LhEUPouc5Cc/BMp2qnVab/TC6upH/2S518QP62apmmxotdMsHLdguX2rHKxEMZJYPKKoEhB/CfiH6b7e9Cc6wfY6PEhXLUWTbuKl6hQr5k+BAidSV81rb0/yrF0gq4zySDIJRkd2mzytJ/W3yHBgmRmZadnkPU2VSTZbQzSHaN8axh+sBkFpy7uIBdlEfXmLkaHlpOf46fNB2++VxGPf8a8orkxv5o3B4MJNZtjOjYYTabQv5jLLDTb6k52DO+Gh3h5XHSkNhEyd5j2XVQZIoa/m75sQGpbg872rpk/q9TZChPS8a5A33Xf6Fj3FdJ70huWtHMAN5l6EGR7LgqgorvBGGt89JOhs27VjoOfimuvrQZFCSiSk2oAjm5fQ75PCUCTEUi0kPsPyLTBEFfCaJ3zTgvzp6XEizf07KOBVhmLXsVIltkhVA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(39860400002)(136003)(396003)(346002)(186009)(1800799009)(451199024)(6512007)(31696002)(6666004)(53546011)(6506007)(2616005)(6486002)(7416002)(86362001)(2906002)(6916009)(4326008)(8676002)(8936002)(54906003)(66946007)(66556008)(36756003)(66476007)(41300700001)(5660300002)(316002)(38100700002)(478600001)(83380400001)(31686004)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rld6eEpaSlpRN2dCcWd6bjZrcmx2ZC9rN0R2QzVUZElHSTN3cFE3dXJNZjN5?=
 =?utf-8?B?NUZzVitIYVBZR1hCRlFaVThKRzlOTkdSVVhaRmhva0dPTXBmWVVLRDRxSHJL?=
 =?utf-8?B?Z09EWFNYRmNjd09XMU1pejVTRjQ4L0VVVSswKzJGT2NFUGpmQVBndFAyTUY3?=
 =?utf-8?B?anhnWDYwdTYrTHZNQlRKVWM0REpWeFpxMldURW1pTUVHVlV4czBXdnlYZW1S?=
 =?utf-8?B?UFBEeVdldlEzUTdtenhPMVZpeEZMamJHY2pvb05GV0RuaVlOVmhwcWhoREhW?=
 =?utf-8?B?dy9NN1c3dVYvdGNyWWI3WEt3UEFDWmZwQ1BDUU53NDJrY3owNjRWU0FhS00r?=
 =?utf-8?B?aTBwSk8vYTVsWUpnODZEazNYRS9qdXJJQTFIbVErSFAxTFdrZXpzZThzMjVR?=
 =?utf-8?B?M0VFY3hLQWIyQURFUDZZclBRTXh4L3liNGNmM1JNMFRRYmNDb1JxOTFRcjBJ?=
 =?utf-8?B?WTVVMGFCQll5V0h3QWt6SUVRM1F1d2M3Y1MwT0VqcHNhOTY3cXZ5Mi9IcVkx?=
 =?utf-8?B?Yi80OEhWN0ZwZGxWczRtUkVXSlhFV3k1ZE9XZ2N2TDJoZ0hwdkZseTRpZ0R4?=
 =?utf-8?B?R21hVXo5MlFRUTZVODAxbmEveWMzRUpLY2dFRnBlaUlkeTVURzZDZ1hoUDc0?=
 =?utf-8?B?WU1MOWU3cDZoMnV0bVM2Zk15bi93NTRhMmVrR2hHRUtnSWlhZzYzdzdCVGt6?=
 =?utf-8?B?YWNPNXJmYVZHRVBkZk9vNzhTd0ZieGQvekxsMXh3cnhxUU51cmZURXZTLzNH?=
 =?utf-8?B?aHFqaW9LME9TZ013WXpDUGl2dHVGWHhzS21hcWZoOFNtQ3JZb0w4YlRlRUlW?=
 =?utf-8?B?LzBuOEVSbFhpS3dLcVRINXgyaUhMbGQ5K0d2cEVqY25zSXBKVi9lakJSRzk3?=
 =?utf-8?B?eUNBY0swOFI0dmVYUVc1MGY0aExtSUsyYTJMSkJYVHpUb2p3djVXczBIQUg0?=
 =?utf-8?B?QjRwc0JkdjVpeWprRFBFamZFVkxTeVhJcjhBUGlNT2lVVk1vc1JyWU9QMG8y?=
 =?utf-8?B?WVRPRUZHdE9nNXE1d3dqdHJtQ1VSMllIdXRETlhpbkJTbFhCaEt5RmZIc080?=
 =?utf-8?B?UW9WK1NqRWs1R3Frc1ZPaGZ3YnhlcEswOERXZ1drbWpmbzQ5d2lDeFBIeWVz?=
 =?utf-8?B?a2hJdU1DREtYZ2c4WXVYTG5tODgwVmxuQUY2Nzh0aUpTRmdCWHBoL0xPaHBv?=
 =?utf-8?B?bm1kVitLWUlFcTE4dm8zRkhkMDJ5MDA3d1p2Qmxsa2tjcWI4dmJMMTBSYnRy?=
 =?utf-8?B?cXRNalYyVlBFZ2JTWmFISk1vbjFqQXk5VTRMK0xPS3VMaEhRYkp0UU1kNTFv?=
 =?utf-8?B?bTRyTXJBcFd5NWNzSUlxbXJuam0wWGtHdE5TVWhGeXl0L3dIWmJnUk1hYXRz?=
 =?utf-8?B?amhNbFpmREh0SWNEdkhrMm9SNTY1SEFod0Z3cEczQW9SUnNONHdzbG0yVThB?=
 =?utf-8?B?TWhmeThJRUs3T29UZ2NkNEVIaS9xU0N5d0xjM1hVU1FjY3JWMVFzL2tmS3hK?=
 =?utf-8?B?ZDA3azZob0xtTXEyZy9sdDE1U2pheEI2empvQXo4aWJSSHg0aWtWakxMeURG?=
 =?utf-8?B?T3lIN1pNOFdxZ0wyZ2xmek41WU5TQnA0TVl2dkZGWHREV0paSHo1R3V1UmRo?=
 =?utf-8?B?T3lISkRGbGFMT0cyb1B4ak1LOGd2MnZFQXNhWU8wMVhPV1JiMUFOUTQxd3JU?=
 =?utf-8?B?M1dNWFFWdjV3endHVGxuQ1RhdHNCZmxKQ2xrYXo1MDFsSysyM1pPbUY3ODdV?=
 =?utf-8?B?ODR0aHNMdjBSWTBXT1dzRTVTRUlPU2toeXdrUVJqcGR4ZWszMmpSUkt2RWZD?=
 =?utf-8?B?TWtxd0NYaEE2TndsTmVsNWpsbHNxU2ZRV1RLMFRHK3h2b1dPUFBYYk4vNnhS?=
 =?utf-8?B?ZVBJUVg3ZVo5a3NxZ2M2VmxNVy8yOHRXR3ZCT2VuTFNaQVh2LzdGc3pkTXR4?=
 =?utf-8?B?T2pHOVExRG1ZRXNYYlBXQ3orRm5pNW1rekNQdGgzT1J4UGJZU0FYSWYyLy9r?=
 =?utf-8?B?L3hmQ3BYekFZeHdVYkJuWStOQk1Sck90UGVlc3cyTkhFbWNUN3ZzK3U2UGd2?=
 =?utf-8?B?dXN6UmFXc0hMeGkvUEZZcENMb2x3c3lkQUVJWFBtS3o1dTdsQmozNXd4VHV1?=
 =?utf-8?Q?R4vuYu3zJ7Gk0gsDXmoatuvNG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e82322a3-b806-4090-0fbc-08dba7e0ac52
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2023 16:06:01.0000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jMhnZI5IFWTydg732zdtOBtJ5V0h6GfaKJshDp8MG2PO57rleFdOq6FqhsEAq6fenxgKRpJxKS65SisJJE+gOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8727

On 28.08.2023 17:57, Oleksii Kurochko wrote:
> asm/vm_event.h is common for ARM and RISC-V so it will be moved to
> stubs dir.
> 
> Original asm/vm_event.h from ARM was updated:
>  * use SPDX-License-Identifier.
>  * update comment messages of stubs.
>  * update #ifdef

When generalizing such a header, more tidying wants doing imo:

> --- /dev/null
> +++ b/xen/include/stubs/asm/vm_event.h
> @@ -0,0 +1,55 @@
> +/* SPDX-License-Identifier:  GPL-2.0 */
> +/*
> + * vm_event.h: stubs for architecture specific vm_event handling routines
> + *
> + * Copyright (c) 2015 Tamas K Lengyel (tamas@tklengyel.com)
> + */
> +
> +#ifndef __ASM_STUB_VM_EVENT_H__
> +#define __ASM_STUB_VM_EVENT_H__
> +
> +#include <xen/sched.h>
> +#include <public/domctl.h>

I can't spot why this is being included here. All that's needed ought to
be public/vm_event.h, and even that only if we were to continue to use
vm_event_response_t in the function definitions (which isn't really
necessary).

> +static inline int vm_event_init_domain(struct domain *d)
> +{
> +    /* Nothing to do. */
> +    return 0;
> +}
> +
> +static inline void vm_event_cleanup_domain(struct domain *d)
> +{
> +    memset(&d->monitor, 0, sizeof(d->monitor));

This looks to be the sole reason that xen/sched.h is needed. I question
the existence of that field in the first place when this stub is being
used. But I guess cleaning that up as well might be going too far.

Jan

