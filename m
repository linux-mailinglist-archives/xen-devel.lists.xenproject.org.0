Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1CD771C1D
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 10:15:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577813.904853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSvNp-0006pn-0J; Mon, 07 Aug 2023 08:14:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577813.904853; Mon, 07 Aug 2023 08:14:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSvNo-0006nI-Tn; Mon, 07 Aug 2023 08:14:32 +0000
Received: by outflank-mailman (input) for mailman id 577813;
 Mon, 07 Aug 2023 08:14:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Szp=DY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qSvNn-0006nA-Fr
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 08:14:31 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20609.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e90dfc2-34fa-11ee-b27d-6b7b168915f2;
 Mon, 07 Aug 2023 10:14:30 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8785.eurprd04.prod.outlook.com (2603:10a6:20b:42c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.21; Mon, 7 Aug
 2023 08:14:27 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 08:14:27 +0000
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
X-Inumbo-ID: 6e90dfc2-34fa-11ee-b27d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SzntF4Q7LSkhShJrZ5k0sSsVOiZt7jlFelfE5pTS3C4MdSgXbBMycx1C/aylAcuQAL0PrgI9QtLavQw+yl0A0RuY48K22V1KGwVBw6ApZXwYAJ2fPQ+j7isB6OCUT51xvO60OfYw5IcufI5I2L8jRYgttEsqGo9n72yZOkFJAJ3sLi4UTKyvjVH7UDGNc0EbElADP5fLrU24BvzvHTUJZbciM035syUrTdxsYQgKhsXK4P56EdXrslpykpbmkl/h2pR5ZZUrYQfcWasD1XExGvaKnGFi05ICTzfA4ysu9Srcb5zUdq/+C1Lu/UyWEMBpyLnD3tjxiQE9BZERHyy4LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tp4Wqs3WIyB0xU2HZc0LdtEmJywyEhfHFm4QfbYQrUs=;
 b=HQasCcBnwJrPm6vbRrKbFb822i3yl8bFsp6kiJQe0rffVjkjF1DnWEVY0+r2lTON7+WezDNgFaSSWVN8F/RjZ7aBii1nmhAi+PImlpYTBBxbmEQuiyecgy1ZJJHAZGHE543Cb2txTjwmBooXUe/f6c1QlarHe6e8EqdiJqupR4VLy1aXTcm8ckOJ8wn0BbDx/xWIcfQ/13VqBJevNk2JzFCS72nC6NxTThaMKpsKu6BB2lvYagdWq457AcDncIiRZEfQ1PZ5THhT5/dhRcFnC91+5WKRscBlxCl+CzRk3lw/Y/tkekOd3ktHy2IdgFd3PO4+FqTyl/PIXlJcqHviGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tp4Wqs3WIyB0xU2HZc0LdtEmJywyEhfHFm4QfbYQrUs=;
 b=457JQoUCDPXHTmVPaH+FHBzGKxgBdtoYVuZuuXLdbRK+aJek7kXKkcD9+LJGwASUikKfFvRIlK2IkWnapxgCypflhKHh5ZU3ozgqtNpnV6V45hpqYjazQhrD33BDVMAxs0YS4CTjvTAVUZnBjkbKUjM/HUWYNBRZydTQc2678PhHXDqRHhMC+NsbWT+/CAneVo2YQtHvFbfYGH5og6hlVxJLmbHht2gtUlDwM9Q94La/Clsjy7a9vA3niFpz1/I7+RgJ21Qdum0a9PZ5XjjZ/LVJsgKqntC22ShIxenMDPdkF7AfvfHEfhFux37N6ZHRwJiCCiU5Bi5HKflth/ZpyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fed4b27c-91ec-7605-1a71-a0b7c6d7e2e2@suse.com>
Date: Mon, 7 Aug 2023 10:14:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 3/6] xen/delay: address MISRA C:2012 Rule 5.3.
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1691162261.git.nicola.vetrini@bugseng.com>
 <e67bd46f204bef64cefdbe7a0b447148f7f9c9c6.1691162261.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e67bd46f204bef64cefdbe7a0b447148f7f9c9c6.1691162261.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0077.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8785:EE_
X-MS-Office365-Filtering-Correlation-Id: b5c06f85-5abc-4718-2aa4-08db971e516a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MNDnyqzuogqibqiUCoDue/7lrfWXr6bQKWE5jlzYtZntcKghlQirdg0d9UKs71ArHJrNtMr+7GFqTN2xx6q/aUE1mOCugB+uLK41mJNKSXjavJgnS80AnSa57o4HKCcfdeV/pS2t6A0keuzRS8GEfAlnt7WfVf7ek+6iNVfQCtJVPcUFDHR5nCHs0qVaqSwu6nVteDp/KO7Sy75y5OrKZ0uwhgj2oNTRNS+Lv/8T2SXANn/zUSWMZsqSb7+k/S/uJLDItFjTtw9dexO3oWi4HVImGBDRG8JMWQpF8gL3hWzpFGDVqQM4K1oVq7A65URbUPZaf8qV1CoF4SQOpN47UATCy8ABq5UJICNsHyhoQA2TsfBprJlqeoil2B6MPCnkKk8RrqS/JRUY9GmHCME1XLXNUCeNKhqFks7Dkqhsx1yRFiOltI6SAnADwcrfZbV11aWNKCH0PRkBAyIviIWHG3vT5m21Ce+PBfCLpaHvl3udmEnyiQ4v7Dg2ygfXmdXy2gQdSNwzDqY51ur+gnvywPcwKwqVVHfqAytLwTtsSdSksgxpP+SnVB2Ox5czQcxIBS7aIQO86xxnPaIDNakFXVlU8Q8z1102849RuY6riOHZ6iUqHZKAzc53hsLBsnMDOC6xoaM4y10QYD93WlWciQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(376002)(396003)(346002)(366004)(186006)(451199021)(1800799003)(6486002)(6512007)(86362001)(26005)(6506007)(36756003)(2616005)(53546011)(38100700002)(31696002)(66556008)(4744005)(66946007)(66476007)(4326008)(6916009)(2906002)(316002)(5660300002)(7416002)(41300700001)(31686004)(8936002)(8676002)(478600001)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aElld0NXaEQvQVR3Vk9pc1VYM29CZkxIczNjS054cEViYVlJbW5kMm5ITjF4?=
 =?utf-8?B?SFl3ell1YUdvYlFSVkhmaVorK29EdVZYYnNSMFZrUnRRSk5yL1IwM0JkRnVS?=
 =?utf-8?B?SExoNzlwbW96M0w2OEtlMTM0aXVtYTlGR09JRVM5MG9EUkpiU2VlVm1sNTZr?=
 =?utf-8?B?dVFobCtXQWdhYUZMbWpFKzFtYnIzZkVQbFBJMDZJeXVnMW5vVWpYcGZlcGZr?=
 =?utf-8?B?TzFkeklyR2owMEp6STVCNytrdFg3Q2NrTnZFNUROWFEwL1dvRElnci9iYjI1?=
 =?utf-8?B?T29iVTJaZjRvR1dkd1lkZmpMZjFDam10WFc4Y3k1UGFCQUVueDd5UmlKU2pS?=
 =?utf-8?B?cUY3ZXloYnlMRHZTZHd6dkpKL1p4UnZwZTF3bkVyV0FqdWpRSGtKTlpJc0t6?=
 =?utf-8?B?RXA0Q2F1c09OMFladmEyTVN0TTlZSFdBNW5lNjVDVVFyZ2VrOFQ0SDhsTGJ5?=
 =?utf-8?B?UTdOMmdwcHUxTEt4T2pZVzMxaVhiY1lvcTBlbGZKNndPS3lnckFacFkrSi8z?=
 =?utf-8?B?cEROZkFZZXk4YkI0UkNYUGIwaUt0eTQvZm0yU3hXK3JMcytOVHBPclF1OGg3?=
 =?utf-8?B?eWVtbXBKaTFvUTJvNTlsTFZLSW5MUm1jc01DSlN6MGVhditFZEJLb0Fmc1Zj?=
 =?utf-8?B?ZFQ3NnBIeDV4STJDTTU0UHJhWHR6ei9OUHNhL0h3SXFFcHo5NkJQbm4rS3BN?=
 =?utf-8?B?eVd4M3o4QUUwUzE4OTE0R1NScWR1QU5ZNTd1Q0JTZnJ5Q3FDb09EcHExMWJD?=
 =?utf-8?B?N2Fsb095U0lCYXM5ekVqbVFZSXZIdzNKSG45MzV5d0ZXdEZwTXUzbTdteEtJ?=
 =?utf-8?B?dzA3c3h3Z0VkRnlJSmFWN0VBL0FoeHNSaVpsa0lGZHFXU05Xb0R4MUVwTkRy?=
 =?utf-8?B?N2Y1UWd3Q084Z3E2Z2p2Z3pqelNyMk1rNEg2V2k1RUppdCs5ZEMrZW1pY09j?=
 =?utf-8?B?dXJpODE3YlNKdFlSTVI0emhkSTNuV0ZVczhwTVROQ3hwRkdHS1MyS3ZOSGEy?=
 =?utf-8?B?bllHcFNYMHJlM1prd2tlMDdPLzM3MjJzUzZnc1h2NVhteDcxeUM0Vm1iZDB2?=
 =?utf-8?B?LzljQTU5QWdDYWo0OE9XOHhXcXkrdVlvZkdCcVZEWDFrYi94elVSVStGdGlM?=
 =?utf-8?B?Q0NpaTNJRVhVeHBNbUx3NVVUOS8vN3l5QUVORk9XVS9mbVZTTFMxcFFBVmQ3?=
 =?utf-8?B?WG0xK2NNSDQ3WlFiL2dKWkJrV1BjV2pVOTNIcVoxYW1WVFpSYzlnRVJBcHU0?=
 =?utf-8?B?ZUNVZzhnNFpYcEdUaFFRZndaSUhCeTlsNHJ0L2pRQ2U1NHBBM1RaZElHdkJp?=
 =?utf-8?B?Y3hkbEQxOTV4Rzk5Vjd6dHAzWk84VG5HQTlBWGxjY29pYTBGR0dVSXRjcEtP?=
 =?utf-8?B?cVczbVV6UkVyK1hmcDdJR0pWMGY1cmQvOVhJeUtBQW1vNGFYeFdyMk5PNEUv?=
 =?utf-8?B?dGE4TEpoQUlocERpWnM0U3hQVjREOGlTN3pJUytWRjRFVlhxRVJPd0htWUJn?=
 =?utf-8?B?ZWloQU5oWmFlSHZhMGhGNXE5SStPd0RxT2dsY1JWcmk5bkhnY0piSWZQRjlU?=
 =?utf-8?B?K0ZjRXorL2x3SlU2c29GQXB1UlhKSDcxYjZ6aWJZN0J6Y1VodkFMUVlCVDRq?=
 =?utf-8?B?ampaNks5S3AwTWRpQWFKYUp4Z1NBRzFERldsMGI0cExpNTFvZzRNRDJSbnRk?=
 =?utf-8?B?eVRBb1o1dXgzbE9FNHJ5KzFiYW1iMlR3WjgzNGxSUEFqSWloU3hkRHlaZFUr?=
 =?utf-8?B?V2ZOVHdsc252MkZMUTdYcEtxd0pLbEU2ZTBwTWgyeWd5QnZJZVhHVURrajVh?=
 =?utf-8?B?S3B3N1gyK1VLQ1phY3U2MEVXWVkzR3NoSFV0MEt5a2EvTlR1alU4Z3NLNm5o?=
 =?utf-8?B?dmxySTczaWdBRVF3MWxWOW83ZFlXNzkvN1lyL3VDSTdyU0RramxROHlRVEFF?=
 =?utf-8?B?d2NMamZzRTRibEZJSjdRQ0p4RU9DdFROaGJZUVMwRTNEa09hRFVwVVh1Ullj?=
 =?utf-8?B?ckNRS0VDb3l3eXJpamREMms2R1Q0clRCdHVWS1J5NDJGNTM1Ym42UEc0UGpL?=
 =?utf-8?B?cmJKZ205eEx4a0h6SGZaVGwzT1ZuYlA3VmhWeW5DTmpnUGlQQXBIM1l4QUdO?=
 =?utf-8?Q?Y/MIam/RfJj8cPANtCv7GOCmc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5c06f85-5abc-4718-2aa4-08db971e516a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 08:14:27.5066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Civki7e4TVoKINHGmCYP5aO0qNIalpX9BAyeDecRJYODI2JaZKRLEQNt2PiNxSUWXn+nJYm2Y4sT+Z9Ehs+hkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8785

On 04.08.2023 17:27, Nicola Vetrini wrote:
> --- a/xen/include/xen/delay.h
> +++ b/xen/include/xen/delay.h
> @@ -5,6 +5,6 @@
>  
>  #include <asm/delay.h>
>  #define mdelay(n) (\
> -	{unsigned long msec=(n); while (msec--) udelay(1000);})
> +	{unsigned long msec_=(n); while (msec_--) udelay(1000);})

As elsewhere, please also adjust style while touching the line, at
least as far as the obviously wrong case goes:

#define mdelay(n) (\
	{unsigned long msec_ = (n); while (msec_--) udelay(1000);})

Even better would be

#define mdelay(n) ({ \
	unsigned long msec_ = (n); while (msec_--) udelay(1000); \
})

or some such. I can take care of this while committing.

Jan

