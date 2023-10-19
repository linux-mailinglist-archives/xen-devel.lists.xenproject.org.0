Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7336A7CF5F6
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 12:58:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619180.963833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtQjD-0000ky-EU; Thu, 19 Oct 2023 10:58:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619180.963833; Thu, 19 Oct 2023 10:58:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtQjD-0000ih-At; Thu, 19 Oct 2023 10:58:11 +0000
Received: by outflank-mailman (input) for mailman id 619180;
 Thu, 19 Oct 2023 10:58:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g4nO=GB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtQjB-0000dG-Oc
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 10:58:09 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on062a.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63758178-6e6e-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 12:58:09 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8647.eurprd04.prod.outlook.com (2603:10a6:10:2de::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.8; Thu, 19 Oct
 2023 10:58:07 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 10:58:07 +0000
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
X-Inumbo-ID: 63758178-6e6e-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S+Qyb7KishHYxMQbl8Yn3TgXPk9aSC0pXz9ugJlgLK7dCq8FiXMqqEQhnQT/9inEqBoF/gQOfGBAEzPN5cftbe6gnifWqbWfTBHaRe0zAFaYWBMOEzRgHbOy2kxesevlgCpsWN5JxFu/piaRCFgYu/PY7G7D2qLr7NmQrHBnmHEKozyT+Xxbn7kK5DASPC2O+2cjAZCdIXtR9HRDlZi3s7rTDDWEmNw/CCrNRqBz1/dMJwQqA8cGYa91fcIs/k3YVz6ZF530wH1DeUftdk7f66Svnczb5XCw9QDNbqG9RjZ5R5/jpRYXxuBTECz1SIa18VjCVtz0bo8TqtXBGfD3hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mkEoCjaAANDv902aIsa8FTPwP0/8ENWU6TwgUbE9TFw=;
 b=TkYJ7BCY0cKMszWG4gj9Wro/yVm/UsHUlNFHnAlmG6kOHewsk+f7gE46fre+ZIT/JLjPmaUhp/zLu3nC1oxIYjm3ASsQ1gs1anu5xZFtrOhha35q/Yo43TrTtu0MWJQeVdb0WxshxZPSsRS1HwP+mRNBdCUCTbi6Ke8dG3tJuTyiF1qz0vXuT3xmQZgnQ3wdcChm0BhuonXdxjMG1w3m4Y1PkUtuRoaih29MzSc4LbKczLB7GlVCdZGgEG9mv2u6k0nObuc88fSmJFYzqvTEnLm6iym2BNqcLL4+qnT6FKXIANdUpSQ6n3rooROikyLtbkiHxsGe5dg3lrEswzBsjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mkEoCjaAANDv902aIsa8FTPwP0/8ENWU6TwgUbE9TFw=;
 b=w9+Vy06HpdDwE7nozVMxuG/7voyr3JnwUyDb5VYHM7gktBW0hScR3lint8otNJF5+871gs7WB/+NHqflQ/SxC0jhm2Qh8i5Ivi2XPjfElycAta9XjqNt+yUuYlCA88TPE5CgHs4XJu+Xtwxhz9Yvb/5CXL+fJwV7jJDFHN6jmZfSkPnRil4CBJbmJeqyCt7l5AOIqDqbcrHFSQHfaJmf8EHbzNV+qwf/rCfnQUCqZaplPtrlzVTmQmpC3B1XQumwfdsmWfZefD4c1gpydsKjmExMQQs13rUFL0NEmsmjco5rQAbfF4RIukVv3ePe7Jl1MQCPiVLZkjELWz3XtpVBwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3b012ae1-423e-545d-70bb-7265ca6a8ab3@suse.com>
Date: Thu, 19 Oct 2023 12:58:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 18/29] xen/asm-generic: introduce stub header smp.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
 <e803ff406f9f597bd42242010a219148d387bba6.1694702259.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e803ff406f9f597bd42242010a219148d387bba6.1694702259.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0154.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8647:EE_
X-MS-Office365-Filtering-Correlation-Id: 84ac367c-3463-407d-5246-08dbd0924675
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nf4kRpWPy5qtWIPtZAd1R8LNkVvLDB0p3sCLp+Vxnh2Eazw4oxC1/mo/laqOrcBwOiUeId4Mjzi9dsvoASkCDVEsyimC22xw0CFOzsdpEYqhwLibK5FRSMk8Is2jhxWWy9LbGYnd+ZTxG6VZ/0FAc538vTKD8Net6UTelCjs1MrKD8AlTu4cy3vM6wsK4ZQL8RXTWUQ85IUHb/3ZPEuXoVdcEMEvlJPqDJbNnGLDGNCL6K09Fsev0pFZCpXEtdzpmYdcDilWiz+4EuZxteyKGG6hIsl65K7sRzXzhQnySTnsEUcfZBGm1gjjPYUDhViYZxVa7w5DZ3pR5eyRYGqntgUalJs1PdlXYbmbb86Tu3ex4useYdKcLcIZLt31g8TrJVv5YDvQuHV9jqfCwLZTe5Xel3zioC0FzRFQLolSklvWopCUGXESUB6+rKvegeXC7i0z2ip5bhqDW0JlWqf0A2lnUjnVicFqGZi0ahacNy2HcyOpDNhG1GTHkHdWpI5+w2uL21ayUFrXyk99RwyKLcyXLcmjiS3pXf7GfBv+zqPZSU9TT95JW9drvoZ+z/VCOtbbeyjnE0MUTDtH7EhbQhkDG7HGzr007yx+sUxivvv/YM553ZWYy/o+hDAJ7+/yCbTZAUBt0p+D32yc7gir9xgUCL8AIwS5KbB13NuJnYs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(376002)(396003)(346002)(366004)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(6512007)(2906002)(26005)(2616005)(6506007)(4744005)(53546011)(8936002)(8676002)(4326008)(316002)(5660300002)(31686004)(41300700001)(478600001)(66476007)(6486002)(66556008)(66946007)(54906003)(6916009)(86362001)(31696002)(36756003)(38100700002)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3daUWR0N0ZybStRSHN6aHA5ZVJQMHhRWDhvTk42blgydFZrd3VWeDFWU25G?=
 =?utf-8?B?UFRENi9qS20wMS85L052czdha1FweU9CMDRtNUtWalQ0bXhMY3ZydHoxNGlD?=
 =?utf-8?B?djl0bFFTcDJ0M3B5YmNpN1pLK29RZEFjSUQwbmtuUzgrVVZMMUlHaU5wUktx?=
 =?utf-8?B?UVNPcml1VmpxWjlOd0tsMllKSC9PWlFPTTJ4dFp0MEFHaEJxbUYvSU04bmJI?=
 =?utf-8?B?YVo4U0dtdktySXBxNHlHQ2s5Um5sYlJWdzBTcm5tTnRkZ0lqS1lEc3JiNXpG?=
 =?utf-8?B?bTZDYk80MUEyTVZ4QXBIOFYwYVFlaHBvM1h6dHFReUlLZTdxNlZzbHBWVDIx?=
 =?utf-8?B?OUpZWE1iR0tBQ2crL3FUeXplbVV3dmNPOGx0RlhxYTFOMHh4TmNjd3ZkQkJk?=
 =?utf-8?B?dkk5MXVaVWhhc2ovMit2aTlRYWltSWtJR2hxMGFQQnFsYXp4TC9ZQXFGclEv?=
 =?utf-8?B?ZzB2M1V4QlRUaTV6dUN6QTRrYzdtTWhZbWNJNU9ZS1pnZENUQnpiNkMrVkdV?=
 =?utf-8?B?L0xqckt1SVRKRlpRckd0S2NUU3hnWDJSZTE4SGV5UGJnMWwycVFHaVpoSits?=
 =?utf-8?B?Z05zK2pJYSt2SU8ySzdsYyt2VmJZQUV0TXh1ajlVUlpoWWNkVzZxQ2xDRDZT?=
 =?utf-8?B?ckhYZDRZcURlaHA5amgxOHEyd0dsbVY3U3g3eElkcnN5RVA5a1lFcUh3YmJm?=
 =?utf-8?B?Rnp0dEh4Qk9NOHFRWHZCbUhzQmZqcTZjeXluZ2tBTUg3cWlRNXRXRXF2aklH?=
 =?utf-8?B?V1d6S2syM1BXVmlBQkUrWWFkcWRDcmZsSy9NUE8zVFVOQWNTVUNJSU9mY2Z4?=
 =?utf-8?B?dlF3c1RTL3FkeG5Xa1dkVFp1emVuMWczTDNMSXpRVFNZU0VJRG1hNnJhNEJC?=
 =?utf-8?B?eUJML0FTZHdya2lERlI1NmVpKzI2UVEwTFdGalBabzJENmsvOGorYjdQa1Jr?=
 =?utf-8?B?ZDl5dmxrZ1pMYmppak1jN1EzaVBGMndRRUxBVzg3NWUrSXBVMlZURHZRNTIv?=
 =?utf-8?B?c1BKT3pFQ3IwYXpqQmQ2U0R0aXZIU2I3OFJPeDdXWnhWVDA5T05wb3h4NzFL?=
 =?utf-8?B?VGt3Yks1VUU2RVJmellzcmlRa0J1cHg2KzJYVmtRWWNLcUhKL3B5TXBPR2p6?=
 =?utf-8?B?Um1FbWMvRlA3WSsyaS9odUd3cm51WlpuK0tpQnY1Ukd6NlZlbWpuRmI2ak5J?=
 =?utf-8?B?WVZlUDFYZjEzeGt5ckluYUMrQnAyS1RCU0RBRC9Ieklmd1JPb053Rm4rd2Vq?=
 =?utf-8?B?aXliWjRWVXM4TStYQnd2cjNIMlVJSUUxUnhLbEJ2NTExQ29hZFJBQkJGODhw?=
 =?utf-8?B?cjdUYUhYVGZjTXdmdFkrQm1zc1RzTFRQTUpYd2NaZ0MrRG5IblBvS3dILzZP?=
 =?utf-8?B?NEMxOTgzZHRBWUZISkFpREhmWGN1ZmZ4TXh4ckdmZzJYdCtjZVNtR2IwUmhY?=
 =?utf-8?B?TzdDazkvcVkrb1ZXemFSbWlXa0ZESWozR1lIdHpsUzVtNE9OL1FndGN3R3JC?=
 =?utf-8?B?ZjFpem5WS2JleGdTSVFhczhXc0ZJaWltWVMrcFllYlpyS1d2Wmc0cTFuRDFh?=
 =?utf-8?B?aTA2S3lnTVhpOWl3RDNwYk8xdEVlNEhqNmZFa1NQa3lQSlJFVllERWhuMTBD?=
 =?utf-8?B?Mnc2WUVYaEFQWmN1VldzS3lCQjQ1TkdQYXNzejkxN3FOUzhIc0xxcnZSZHp6?=
 =?utf-8?B?a0ZlMlVyZnA3R205NTJ1ZW5LUDR0b0kzODlJQnNkT1crU3dWeUFUMDNGVGx6?=
 =?utf-8?B?VVNCREhUKzNRWmtXM0d4NWFMY08rY2hRQkowWUpWd1JkN05TVEF3Um9MMk82?=
 =?utf-8?B?QkJHSUl2SWpENCtzclh1cEtxNngvMExkNFl6ZktFZmZ2R1NpZEd6b0dKSUJ4?=
 =?utf-8?B?ZUk5b3BJUHFlcHh3bDJnRVJZUnpJYmlzMHl3Y3h2NVF4OFAxazY3dnFMNjAx?=
 =?utf-8?B?K0FQUmgwdXNycXA3S292cWlNQjNFWVpweVliOFFRai9JMnpZN3pXUVAycGo1?=
 =?utf-8?B?RHhUWUtpL3I4bFprRkxkcWd3VjQxM2xSOFQybjF1TFNCaGxKQmM1WVVCT200?=
 =?utf-8?B?TStHclNNcFBrbXY2UFMvYy9DQldZcExiL1ZvZ0JmMXIwYk1UZFJ3MzNDVlVr?=
 =?utf-8?Q?Cos+54+2dsuY9FO+RXtuOy0GG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84ac367c-3463-407d-5246-08dbd0924675
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 10:58:06.9975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AQqaAnsOOdzC/L/LwbYS3Dvy7FrWPP/92WlkO3Pp1oP9eCaKTSM0lqhkOOlzyxj6Z0rkfg1Yf4iEFSqQx703aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8647

On 14.09.2023 16:56, Oleksii Kurochko wrote:
> The patch introduces header stub necessry for full Xen build.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Assuming you expect RISC-V to get away without its own smp.h, just
one remark:

> --- /dev/null
> +++ b/xen/include/asm-generic/smp.h
> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ASM_GENERIC_SMP_H
> +#define __ASM_GENERIC_SMP_H
> +
> +#ifndef __ASSEMBLY__
> +#include <xen/cpumask.h>
> +#include <xen/percpu.h>
> +#endif

This #endif need moving ...

> +DECLARE_PER_CPU(cpumask_var_t, cpu_sibling_mask);
> +DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);

... at least down here, if #includ-ing by assembly files is really
necessary to permit. Preferably the #ifndef would be dropped, though.

Jan

