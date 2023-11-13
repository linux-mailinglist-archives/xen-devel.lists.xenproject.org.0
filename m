Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 952437EA17E
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 17:48:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631839.985535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2a6t-0006nG-0A; Mon, 13 Nov 2023 16:48:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631839.985535; Mon, 13 Nov 2023 16:48:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2a6s-0006lU-TN; Mon, 13 Nov 2023 16:48:26 +0000
Received: by outflank-mailman (input) for mailman id 631839;
 Mon, 13 Nov 2023 16:48:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OC0U=G2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r2a6r-0006lN-Is
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 16:48:25 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0608.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75357d11-8244-11ee-9b0e-b553b5be7939;
 Mon, 13 Nov 2023 17:48:23 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBAPR04MB7286.eurprd04.prod.outlook.com (2603:10a6:10:1aa::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.15; Mon, 13 Nov
 2023 16:48:20 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.015; Mon, 13 Nov 2023
 16:48:19 +0000
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
X-Inumbo-ID: 75357d11-8244-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gVTILsWzWacJZE0iRO1eQAszenPr+WROx4G0nglT3axn1sR6thM9K6KlnwP/DScPN7o7xvln61T7FKMcF4Nn8etQtKD3g1TTwcrDmYEGCftJODI3dcpgi5H6XKRQiHnQKgy0DsWkST74F0eFvu7vIqj5EbM9ktFfVp1dXkHKRTQ3IsIFCx0W88pUgfcXzRUITe6iyRjz9wy/bgUhfopisKPOeAS7iCYCbpmuij1ROuQZAmaERImr6IpISxyhP8U+oa+Tgyk/SGXvKp8+vZ85fwZmhbMaEggMVyf33MTrp3ca1Brl31ByOT1iakq9N4rqNYx5meiCge/1ERadvrdPWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6JRSdqBHeEkCAFq4486nRARdw8b/aSBwq/+1n4Yju6o=;
 b=FHIfhTT1wAZP8xtDMjrIlT6z1xTVqd17DsHxjZEICVDk0o67QsmbmfiLMDb/m2TTY+YwOpb5oCkLYr8IEdc6//nVGTvwpwaiba4PYlQ8HYrC3nvl9rZIbaEYdNUozvm8dL9GJiJDp76t/FvdEX2wVZjLSf099kh1HUGBx0YUCaioqYzi+WjXLL4vUlFlhT7dhUpKflTWCPQddvuhKQaxlDFSOb8hXyNrZJteeuT8s4rBgJ0ZtQwTaJiPg0HUt0OmGzaZb74YfudspI7s3H+qfXHa5hJkzj1bAl8xScsTHp3QSydBEm2ZJmllQz0tvMDQ/JYpU7bjAhdGip/tGOkqnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6JRSdqBHeEkCAFq4486nRARdw8b/aSBwq/+1n4Yju6o=;
 b=XVot3Yp5vyLlpU3PMA8Ru3GYJ0GClVqmHjYAc3LY47PudLVdX/bPvj7uu36YWuEypZFlgybxWOYxWg3PHvGq9eT/z6AucFIN8+EBrglbS87eLQJIMsJ2Jbg+OeQaIRCNkMttAbz+MFzy5uXS0+zORgvrjP0yeMY61pKXMtTvc4dh2bbpDyyeH+AblvI0ZwVoXGTaudw2bjok4oNyZcDiXiLPzQx3Ia/z9OXibfx1NFCTespEJjbUb3WZ+5QZXDRHMuKnnL2LHgwSPFsKvemEM3/j88IVx8H7yJAsqowOlgDO4MQ5B0GslJ9Hsv9CCRRjspjsyuMJOItiQWsyZfXchA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <583e3c47-e5e6-b6d9-79dc-81e115a9b43d@suse.com>
Date: Mon, 13 Nov 2023 17:48:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 05/15] xen/asm-generic: introduce generic header
 iocap.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1699633310.git.oleksii.kurochko@gmail.com>
 <6ea2fc1c12fa08e7cc6a47735c4fcd49c48ac4d3.1699633310.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6ea2fc1c12fa08e7cc6a47735c4fcd49c48ac4d3.1699633310.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0442.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBAPR04MB7286:EE_
X-MS-Office365-Filtering-Correlation-Id: d0b28ce8-9572-40a1-3810-08dbe46856e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	G4yQCVQJZCVyGmDPU0YHLUUKpfUN34P1KfbKnoDK5cndCdcq7hDMDQFgmnEENSPIX8QeR5vENPAIo6GdXnaUAa1XsBZTCQgvuE3wbHZjfLoKIgLAO3GcV7clrMdxo5zWdVf96jQOig10H2ZHQkla/UzBMD0QmnZ/tCFv2gB1VS2XiFSJjLWEvBADz8EEBYICoaB6YvLU/ZE6Qh6Eev3cKxBUMqnno3oPoW/0SbekyRbbVTJHzUiS+ZNc9ZUuWZkaUeIeLLCfXllm7WfENR9xERjeeHUled+7yPcUGhtAdnyNpnYe92rS9TRvvx42TVgBTufWxUlbOVOR6x2Kv3cLAuB0tWDm1xyc28SU3bGFaL8YrF4SBGOsjAZewoHjZahEmPEQIA1D07EwshE65vts6F3W3QG4yhhhOpVUF/AKy/WZvpqhLj8WF6u3rRoLC0KW+bZZv5IEvFzmrk1OBtdJ2sIkwxVzv4PI6PNk3j5ELbhRZGsUXanLDAW/Xn4x6VMmfJQc/Pr++JF/5boWaRN9GGkY2oRB6pzUZRhWtgWtHM3DHlBiz32Q8GMQ/WbnGPcY0oRc59G3qeQAveDOXNlZGfmhk/aNkQURNQTx17J/5a8Jyv7GorIPAnqprnmguGNkchBzb+HTPc22pFXeuYEZ7gFVUOYa+LobAMnmqnDjL+4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(376002)(396003)(136003)(346002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(31686004)(54906003)(66556008)(66476007)(66946007)(6916009)(38100700002)(316002)(36756003)(86362001)(31696002)(6512007)(26005)(2616005)(6506007)(53546011)(4744005)(2906002)(478600001)(6486002)(5660300002)(41300700001)(4326008)(8936002)(8676002)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UEFrazZYZmRzMGIvWFFoc1F1SlFNN1F0TzZrNEtHb2dQU0dDbHZ4MVY2Z1J5?=
 =?utf-8?B?SkQ4SnB5NDNaS0JTaWE0K3ROVE5vNXMrRk9XM21ZYXE1VzloaEFxTFBacXh0?=
 =?utf-8?B?L3BPNDBkN3JUcFoyQm5kaEdIQjJQV3VNbjRTRU1HNk1GNG0yZXdDc0NZTWxv?=
 =?utf-8?B?N3FvUnlRQ09BZWJucHN4OEllaGhId1huTlZzVXJXODQxQlNOSDhMdHZWK3pP?=
 =?utf-8?B?NEEwdnRQYStpQWNjOFdKTm5qTTZFVWFOSmF5ZXBzeDhvaE54TVUxK0RnU3Jl?=
 =?utf-8?B?UXFnNUlxVUEwM0IycklkZ2h5WmI4WGhRejg5aTFUaktqL000aXhlam96bXNB?=
 =?utf-8?B?Sng2alFaY3cvTURsQzV4d2hKOXBDT0xoNkQ1Rm5ZVnRBZW9iTmNBdHFSSytj?=
 =?utf-8?B?UHhnVXlvZlFJT0I0RWd0bVAyYlkwdFFPYUVZSy9VSWJ1U1JKRVhRVkQxNjNC?=
 =?utf-8?B?YzdqYVhZd1E0elZFelhkWFVOZjZxdTRTdGRjZkhGZEVacVlvQVFjZ01Pd0Rk?=
 =?utf-8?B?NEF1cXFhNkQzOXVTUWduNEhhSElzeGZIK0l1djFSbTZpUkcrQ0tUc2pnVFVs?=
 =?utf-8?B?RnZwc3RKUmYwdXhXZ1pXZkJTVHRtSDdjcHduZnJBcjdoVFpCRUlvTTE4cEhr?=
 =?utf-8?B?cGE5akt2ZEdIeG1TcVNrd0lUV21xSUtzRC9jZ1JFekg4YnYvd1VGZTFDc0tQ?=
 =?utf-8?B?dEpmU2hkbHhFOXV4bE9TeDUvYVhsRmVJQjBXWWY5b09yOFI3SXBBZ3h5VU5W?=
 =?utf-8?B?RlQ1dC85aHg4Vm5YdjYrSG1BaGl3dlRhWThQaFFYWmJ3T2NBelB3aGdYMm9l?=
 =?utf-8?B?dGJ4bkdkRkEzamtaVVZIY2l5UUZLSFgyb28rNDdHZEkwSjJ3cERRaEtsNmp6?=
 =?utf-8?B?Mlg4TWRyOHgzQTRYa09sV0Z3ZTZ4TklKQkVlcmx0NzhvNmtBWmttR2NQdUV6?=
 =?utf-8?B?MWFpVGhYWmE2bmZwVDZadkVnQmxadTlIenhJaWljdzNhREhDOFY4VXRvTFlO?=
 =?utf-8?B?QXhSTVl2K1dsMXllamR3VTZQdzIxYm9ZTTZLSUFVVjJpUnZ1N1RYNFNUaHpN?=
 =?utf-8?B?Nm1TVDNJSmtFd1QvSGV6ZUpBVGZBdFF5L0xSeTl3TWFyL2ptYk9XOXZJZEpq?=
 =?utf-8?B?V0QraWw0clp6cEEwdDVoTzFUMXRKc1ZUSnlNNTdzZFliMHM3bVVjSnQvYVV6?=
 =?utf-8?B?L3REZzdzcFl1RlBNcFZBdUxGek9Ccm1lNnh1OGw3OE9DUlM2NDgyQlhINm1N?=
 =?utf-8?B?RzNuS0h6bkZWM0NiN0JQSDIzZUJTNmlvNis5UlcrSmFzMHZ0NkorQlh0Qnlu?=
 =?utf-8?B?THFiZFBBR2hvTjNzMjVKMVJQMjlQTytQblVPOVhMWFZwY0lyQmlia3RHdXhh?=
 =?utf-8?B?RnhCLzJkWkY4OGJGWU5ab2VIUTYzZ1JkMnpzTk5XR09EYkxVdHpYRnVtOHVV?=
 =?utf-8?B?eDRsOGRoMVlxYVovN1VlSnhtcTZia0VuanZCTkZQNytYR05RREY0d1ZOMllv?=
 =?utf-8?B?WlZxd3V6MitqT3Fqd2FQTHlJY3FlUFZYbkFoQ29PT0JnenBOZ3pLMVdlS1RJ?=
 =?utf-8?B?Szd0MlVCSEtxQi9GbUdYMmRSQnE5WlZnaVVHK0ZBWCtEaDl6YnNhdEcyR0sx?=
 =?utf-8?B?eDJYMjVIWk9tR1ppYUx3SWdxTFdld1JzcHpPL3RNQ3ZMSlJFOS9xaHpPMllT?=
 =?utf-8?B?bmZBS1lzSXIrcml4UURBZ21EUGkyREhuZGF4d0ZpWjJkMTBnTXVyQXI0R0ln?=
 =?utf-8?B?ZHRrTVAzK0hjeFdPeU82OE5nVnAwT0VvaU91YnVQaGdOMlZRR0xpTUl0QlJu?=
 =?utf-8?B?WFFqVjU0ODJseFdTQ1M4QzFTVkNHWktrVVYxSktCMEFuVGdsZ2dXb1UweFRK?=
 =?utf-8?B?cFcxcFB0SjJmeVJTTTF5WWY4bHptWlNFakNReS9KRnExVzF5WHhXTmVFekxR?=
 =?utf-8?B?S2RTcDlQV1VFQlRFR2trT3Y3SWNxN2VheW4vNU81TFZYQUNRNlJUc3FpVHU5?=
 =?utf-8?B?VDdrSTl1ZHErcno1N1d5MTl3MCt5VkZJcU5vTm5BSFJYZFgrZ2Y1TFFMR3p2?=
 =?utf-8?B?dC9WODdycXN6eDBKR2lrVzNOdkFONmJrNWVrNUZ1NEhTWHk3Z1pveTJjRlFQ?=
 =?utf-8?Q?0O3wYIkzN8JmkO+jPnp7AkZn2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0b28ce8-9572-40a1-3810-08dbe46856e9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 16:48:18.9831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cExzY9+/ojm/64fhaHgTfGuJj9b3E9Ve9g65mpBv4Hn1IH54lv18KGEA816cIOS6e2OzsxpxFlQ8EfEKkSzVbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7286

On 10.11.2023 17:30, Oleksii Kurochko wrote:
> iocap.h is common for Arm, PPC and RISC-V architectures thereby
> it was moved to asm-generic.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> The same question as with device.h. Should it be in asm-generic?

I think it's okay(ish) here, considering that ...

> --- /dev/null
> +++ b/xen/include/asm-generic/iocap.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ASM_GENERIC_IOCAP_H__
> +#define __ASM_GENERIC_IOCAP_H__
> +
> +#define cache_flush_permitted(d)                        \
> +    (!rangeset_is_empty((d)->iomem_caps))

... the only thing referenced (iomem_caps) is a common entity. And
again Arm demonstrates that an arch can get away with just this.

Jan

