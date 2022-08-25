Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8091B5A0AA7
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 09:48:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393090.631822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR7b3-0003d8-0N; Thu, 25 Aug 2022 07:48:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393090.631822; Thu, 25 Aug 2022 07:48:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR7b2-0003Zo-Tj; Thu, 25 Aug 2022 07:48:12 +0000
Received: by outflank-mailman (input) for mailman id 393090;
 Thu, 25 Aug 2022 07:48:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2f78=Y5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oR7b1-0003Zi-Uw
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 07:48:11 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70057.outbound.protection.outlook.com [40.107.7.57])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43ef7c17-244a-11ed-bd2e-47488cf2e6aa;
 Thu, 25 Aug 2022 09:48:10 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB5784.eurprd04.prod.outlook.com (2603:10a6:20b:a6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 25 Aug
 2022 07:48:07 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5566.015; Thu, 25 Aug 2022
 07:48:07 +0000
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
X-Inumbo-ID: 43ef7c17-244a-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fteRZ6e9KseCJtCQd2S/Rzq7VNEALFJVYVRnNsqRqHuCeErCKpZKVZ+cx0UBq8CkDWXOkhhHGDuXFSHd1+LS14luknxhwELo+DwjpGf+UO8tgR/IXldhOYqMTJnXlaWEcdnQ3+ULKsOhXM7sri+rV5I4W9yvdH6KAILUYFnhjkrUDoBUB9yPtSHmq8WCOeamWZOJCuumY5jBVwYG/E7/nO1sPiiLkZG0czp1ROF3PNBSNV+mMtrUSGUX6lKZAacTG9qXe97TB23c4N6G338L2NfKKmZQyqnVUUInBNzUWmVZVCY57XC5Adh15YeWdfVnZQK3twd7iRcmCXaALpqngA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m4KgRdZWB3BvL7dBULa8P94RhAonouJLWj4ZnCKt2VE=;
 b=eaY9Ryi00V6RrvqYk0kRuIhfzbru4f1J+K0nGIFA7FXWrjc0RBXSsJetjG0BheC/ttsWnoQ4xRPCHrk3IrmE31xZg4vSp2nYkBWNNp1JBukCvGSJnzIZpmYHI9wGb0OkVkEu5e3iKuzNN9QpY7S0xKH39NlV/j5tdr2m/itB/PEEjLNN59YeyqUmDWlY7TZrODs7X+qICVSJXknKC9OjvvNQoavyPXyTe7LpbsFY1Ms4X8jkBKaxV1mcwPzlpSYh53qd/PWbFnfdkgDtU14Es5twxqGuUOsrE+WI+nbw7y0uje90lkcDIObUN4L0t3LvZTAu0gx9ZhCzdB0HRdEYnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m4KgRdZWB3BvL7dBULa8P94RhAonouJLWj4ZnCKt2VE=;
 b=tI+NX7lH4oKTe/DCp1GEmyMEnXb4ZrTDAItA80+7tk79wu2NZYbqWZ7HXgSl+AOxv9NBWq9m/dmrvRXp0khvH4J3UM9o9BdYcDhBs+JLHQ6d5sxFq+86CIGTEdtR1UVHGN2WpcsX3+RRsxGBmFh7eD8pgw0/HtuyotTEIZ9wVhmoHMfNyCD7OK3/7FAyMBBs3df+363oCsysFLp+XeXFHItBwC1pCOIzOV0gi+55M8DtrFPS5k4wa7uQO5DOTJMDp3j6R/LsFtY5u67ub2VRX7HNmuMvpAAnDNnGJw+n7wuaxRWOZ0ljTwg7YkEpdWmXJhH4keJG5Sx9ksPgXO/eUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <17557d6d-8c07-915c-ed01-1e7d81891023@suse.com>
Date: Thu, 25 Aug 2022 09:47:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1] x86/public: move XEN_ACPI_ in a new header
Content-Language: en-US
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <b79164d207113af05417536438b786850875edb1.1661353272.git.bertrand.marquis@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b79164d207113af05417536438b786850875edb1.1661353272.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0102.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf1cc600-1a9b-4129-26b0-08da866e261d
X-MS-TrafficTypeDiagnostic: AM6PR04MB5784:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1cwESE5Zmx3S9UCIxjhPnSBhTWAit+LJuXsIBQ6yNGxpCfsy9biv9RcK0/p7qJsug7fBZRhFl01b4WLbjFQmmL/n11QsrWCLR0mijUiQF9XggxKbrfDalnPA/yn1T9/b6vPCipBxXodDS3tzDe7Cfj6Qn0CIv5cWEMNxYPVmlMRftbAO1sQfvll1zov7mN9puoy9FCBT1jzFHDzWG9Ml4jTSkJFMgyes3Dtxk9Gqk+7/JMU4nnl1sJKA77CKmKb8ApM6aMYKUeJ5hXv8JyGCpGzB605l6xu+d7oC6gCN4qyKSuur+2Qjyb1VC1TBKB1L2Uh15BvMTeH5BJZqEyd1eoMB9jdvqn79eaVuKU5vk02UBrnF5St82ik/W266Ih8PPNAWevm2ggVR4G6PELTq3UXnE/zj9kKxTdi0ggD4A7/Whfoke7vls3m/Ky9xuUsuiSeklYTKydmWxptPOZeEQR8rgOXemP0b7cVAWVnkOK+ANDFvAYkJFEXi7zG3a9uaFWiQMyMIy5+JlqhZEZWxB+R4HUOCvE+9cAZf2FJTVWbMlpQLJWwgpk6q7TcWg03j0IpGuDPM2zTMG24lfCqWCXBOiFhm4orz1+Cj8KQm4vCEXDyYd7U8kCGDSOk8bDCTLCu2pRUznGyjVVk2oldjHhagJSLyR631X2VjYcaGeepbukeT/sfDodZ9fMua+jcJhYSNo0Y1D1ZPGGJxwc9xPGfiUsAw8F4rInTFtjkmxAPX1S1iL3/4H+4rqSt0MJOJaNPjj4tu1MgVh7xvLZmzNtcuj4mT7qkuf+XsNZFktBM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(39860400002)(346002)(366004)(376002)(136003)(66556008)(41300700001)(6506007)(2616005)(26005)(53546011)(6666004)(86362001)(36756003)(6512007)(83380400001)(31686004)(31696002)(186003)(6486002)(478600001)(6916009)(54906003)(66476007)(66946007)(316002)(4326008)(8676002)(8936002)(38100700002)(5660300002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGdqMkhYWDNnWHVuMERaV0Vlc3V3QTRYRjYrdU1xOWpIRGdjdVlDT0Q5NkE5?=
 =?utf-8?B?S0VkZFI1TE1IdXo5VW5PdVhMY3g2eUpCdDlDWHJFWWo2K0pscFJ6ZzFya2xo?=
 =?utf-8?B?eFhPY0thejZZS1JkbWVYMVZVNmZ6UWVGYUgzcU9OSmNEcHVjZmovV0QwN0ZE?=
 =?utf-8?B?RUpqUjB0NlRJc1F4T0JFazd6UGY5K0J4WmtmaE4wOS9zMnRmRjlmUStYNE51?=
 =?utf-8?B?QmtGT1JtZTlqKzNNN1Y2YWd4cHR2akF4YkloeFRvYkJ0bGZlZXg2eHo4Wm5o?=
 =?utf-8?B?d3l3OWkwU1ZUaGFwYXV3RHh2aXFkbUszVEp6L21DNEVxZ0dsRVo2VFdpb1FZ?=
 =?utf-8?B?cXVGazVvM1l1dFVBUXhHa3hrWkZZZVVGTTRtOEpKSVFpdFNxUk9Md3ltV2Rp?=
 =?utf-8?B?OW53QnhnVGtTYjRadUExWitqdGxkTjNUVDM2SjNEOTRMTld1Tk5ObHhkSjA5?=
 =?utf-8?B?MEZ0OEx6S1FDeVFDSXVRVUxzd0toZ1hOSTNQNzdEWFdXRi9EcEFNbUJGdUpN?=
 =?utf-8?B?bDVYM0NKWkFCRTdXazNxZGMrMmZwbncvMVlsTWZjbXhBbTFFOHVWY0VEMyt5?=
 =?utf-8?B?RUdZTmsyc0x2NTRRREdpSzNBbTF4cFdWY0xYUVFZbEdsVHFpRy9La1grTmN2?=
 =?utf-8?B?Z1k1ZU9DS3lVNlluaE9keXZiQ09Ubmk1MnhuSkY5Z01XYUlLQVVvNEk0Ymxo?=
 =?utf-8?B?b2UwaEFnOEcyWUQxbCsxZDZ1UVgvZEoxd2NTV1ZXRklPTW4vY0N4bkRwVVBR?=
 =?utf-8?B?VVZ1Mk5nQ1FuQU9RczdoQkNFdzVPTmxZUDRXRzUvdkhkOFNwNitudkp3T1Z5?=
 =?utf-8?B?dlNjclFjZ3NmNUhGdXkxRndPV0dCREpqUVpYdExwR1IxMlpZZEM2ck9pbjdU?=
 =?utf-8?B?NXBDcVY2c3NmQlVGVHE0bXlVT0xURnAyQkV5NjFjQjQydHYraitOVlI4RmtX?=
 =?utf-8?B?ZGxkZWZzM0cvM1o0TUw3VlFJZTRoMlZUcjlueVVTblVUZXFVTUpQajcxeGZR?=
 =?utf-8?B?R2NQQUtxeCtDZEoxc3h3N0s1T1NFVERFSFdBWWlYK1ZyQWdCdnZ6eUtWS3Ni?=
 =?utf-8?B?QkhjREltdjdLZDFUMEZQNThNQTZ0OXlXR2lFdlhGcDY3VU9NUE9IVG5YM1N4?=
 =?utf-8?B?VHRwdmhvVnpTb09LLzF0V2VreWhEa05SWWlWSC9WSVBVKy9JNUM2UlllbHhZ?=
 =?utf-8?B?MGVYUllMN3JIOXJ5bFVhMzc0WTE3Z29IVGFFN2dGczAvRzBXUTdxWXQyUXBt?=
 =?utf-8?B?QUpGSmVKOHZtZFc5eGJqcE5YSWRSdmFyWDFibmRoVEI2R1phK01leUN2N2ZF?=
 =?utf-8?B?bkF1WjQxQWxLaGEzdnRzQ09lK3hLNEJsVjlpMFFvcG11QjZTcVJmajBZK3Nt?=
 =?utf-8?B?WFM1QmYvNzFRWG03cytVc2xPa3J5M1YzRHk1cGhVWlMrdHd5OTNNa2E4dUFP?=
 =?utf-8?B?MzJ5MllnUEloaWJHR0p3d1luSDljNnRweldYOTlkRnNIdUZBbS9NTk00Zkpm?=
 =?utf-8?B?WFhIMHFKQkJ6anAxY3ZGdStiTTRvcFYrM2s0UFVxU1NndmtTZTdDcDdUVnhC?=
 =?utf-8?B?V0tOVG1iMlNKVElJanRzTEFTalFpZnFKODVINS9TbXN3dWJCUU04R2g2cW1W?=
 =?utf-8?B?WWd2bk52N0N4UTJzb3k4K2xKK1Rhb2xDMm80TG1HcHFlWE54WmRMVU9oR3BZ?=
 =?utf-8?B?VFdLQ0lOSjJQYUt3WlNFdWtlWDlsZmZId3RqZDE3MXduNW82a1ZyVmNtM0VZ?=
 =?utf-8?B?SVNUVU50RGJ3UDR3cHJaajZXL2xVVVBTUU1EVmhKWVdzUGpUMTUvRVNQTHZt?=
 =?utf-8?B?U0dZdndsOGdyNFozWjhFbUVrUVlSVy9oWi8xSy94azRaOUliYjdxOGZjZUE4?=
 =?utf-8?B?QUU2RTJMTU1UMXgyQjR5cVFuUVlFVzhzaHlrTEwvRXdaRjRCelc1ZTJZaFli?=
 =?utf-8?B?TGFFTXd0UDEvWG5YV3VERWErSmRWSms0Rzg0eFlMVXh3NlZSZjVpOGlkenN6?=
 =?utf-8?B?a1Bxdk1ZaVk4Z0pFVTlQUmtyTkdHZlVnb2tLWVVFbXo4am91R1VHUCtEK3lO?=
 =?utf-8?B?UXJUcmdNTGVIczBVaVFYd0NUR0NOM2tuTXY5THRwcTZnZldOWlRzbU9vNjQr?=
 =?utf-8?Q?POo/riXYKiqkZAsflmGwc6yAn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf1cc600-1a9b-4129-26b0-08da866e261d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 07:48:07.1721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sckDbVwwYLttGGyi2whaPH9BAAQL9gc0292SxuRh3NRcHg7RThuoEQaIhodgJ3FKDTQYqpPAdSi9qnL1odS7KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5784

On 24.08.2022 17:29, Bertrand Marquis wrote:
> When Xen is compiled for x86 on an arm machine, libacpi build is failing
> due to a wrong include path:
> - arch-x86/xen.h includes xen.h
> - xen.h includes arch-arm.h (as __i386__ and __x86_64__ are not defined
> but arm ones are).
> 
> To solve this issue move XEN_ACPI_ definitions in a new header
> guest-acpi.h that can be included cleanly by mk_dsdt.c
> 
> Previous users needing any of the XEN_ACPI_ definitions will now need to
> include arch-x86/guest-acpi.h instead of arch-x86/xen.h
> 
> Fixes: d6ac8e22c7c5 ("acpi/x86: define ACPI IO registers for PVH
> guests")

Nit: Please don't wrap this line.

> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> The x86 header is including ../xen.h before the ifndef/define so that it
> gets included back by xen.h. This is wrongly making the assumption that
> we are using an x86 compiler which is not the case when building the
> tools for x86 on an arm host.
> Moving the definitions to an independent header is making things cleaner
> but some might need to include a new header but the risk is low.
> 
> For the release manager:
> - risk: very low, the definitions moved are only used in mk_dsdt and
> external users would just have to include the new header.
> - advantage: we can now compile xen for x86 on arm build machines

You will want to actually Cc him on v2, so he can ack the change (or
not).

> --- /dev/null
> +++ b/xen/include/public/arch-x86/guest-acpi.h
> @@ -0,0 +1,50 @@
> +/******************************************************************************
> + * arch-x86/xen-acpi.h

Stale file name.

> + * XEN ACPI interface to x86 Xen.

Perhaps also here s/XEN/Guest/.

> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to
> + * deal in the Software without restriction, including without limitation the
> + * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
> + * sell copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
> + * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> + * DEALINGS IN THE SOFTWARE.
> + *
> + */
> +
> +#ifndef __XEN_PUBLIC_ARCH_X86_XEN_ACPI_H__
> +#define __XEN_PUBLIC_ARCH_X86_XEN_ACPI_H__

Please make the guard match the file name.

> +#if defined(__XEN__) || defined(__XEN_TOOLS__)

While separating it out, may I suggest to limit this to just the tool
stack? There's no use of these #define-s in the hypervisor, and none
is to be expected. (Of course this will want justifying this way in
the description.)

Jan

> +/* Location of online VCPU bitmap. */
> +#define XEN_ACPI_CPU_MAP             0xaf00
> +#define XEN_ACPI_CPU_MAP_LEN         ((HVM_MAX_VCPUS + 7) / 8)
> +
> +/* GPE0 bit set during CPU hotplug */
> +#define XEN_ACPI_GPE0_CPUHP_BIT      2
> +
> +#endif
> +
> +#endif /* __XEN_PUBLIC_ARCH_X86_XEN_ACPI_H__ */

