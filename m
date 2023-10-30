Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7694D7DBD4F
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 17:01:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625252.974363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxUho-00088n-SF; Mon, 30 Oct 2023 16:01:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625252.974363; Mon, 30 Oct 2023 16:01:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxUho-00085R-P2; Mon, 30 Oct 2023 16:01:32 +0000
Received: by outflank-mailman (input) for mailman id 625252;
 Mon, 30 Oct 2023 16:01:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hhfi=GM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qxUhm-00085J-GC
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 16:01:30 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0614.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 959883ed-773d-11ee-9b0e-b553b5be7939;
 Mon, 30 Oct 2023 17:01:28 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8835.eurprd04.prod.outlook.com (2603:10a6:20b:42e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.16; Mon, 30 Oct
 2023 16:01:25 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.016; Mon, 30 Oct 2023
 16:01:25 +0000
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
X-Inumbo-ID: 959883ed-773d-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V1mh2uMZu63F1rt9aKuMyb2H2gMn76Y7DPjOjJoEkzjTtG3r/jdvF0EfIuJ1Y7cib7jl+s7Qh29eW74f+7ffYG+rdtSQJ/k3wMtCkaw3iKxYj0HtZY73A7Ya2TAhgBV0lyeHV1h/WptwH/Vst4zU9ia/L0tHE2hZY6MWvVYkySM27JGSxfSqpRghNzAe0614/c+cjYoY4n6rr46jNrRS+Ae4vvwW7kMeEB+cmwmHQBMvf0KyPE68W5+DfgC7ILXKV5KVucpV52dgAEZzj0dp3HlVAr0ezwhqQg+W6Jq3C4e7+caAaiX4ztpNQ8wLkFmBc3twzvRjUOg7kY/aDoNC9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ahqQJthhHqeYtQzGfndnYtX3ZmHLkrUP2KSsGgJ9lfE=;
 b=SsrYaGJ2fXLMBmE6zLYB8CViKni/jpBZunCL1dTBy7JpEDcfqgNGk45O6FbHv/WPCRYZpcIM+J+y8ixdeFeufv5EIsNjdJ1MhmIYo0FsAGSfHRvPnpOQdM8D1TWY6GNUHV3J1CDlCgdQSZSHohiVjDG6AaCdBwZIb+K6ZFE0RI9zmXM1FK8h8k3UUeD2S2Od4FbXaDHYpOV4v9XIA4x5OmHNUIUPtTGz8i06Bj8XqHheY9v5MpUs8w6gyoPQZFLNsX3H1k4K7FwhaaT20mqwMAeEdQ8j+uHkR1svuxJpKTrojD49Ew6r4pRRmjyLiy27hWWh3Qt6XbBhNDtB8PN57Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ahqQJthhHqeYtQzGfndnYtX3ZmHLkrUP2KSsGgJ9lfE=;
 b=2IBdkUMzvM7Zu8egaBWolzXbuRtVhs9I2BVaMbHKSrGgt/QUIG1zImN16y4pMrzmuVZEftri3iVTAgLeHXJi9HKqj1fBxcV5QkoP5f97LQ3B20DtdKEfUZx7jHzpnAmPGfkz1qDRwm//0AS5/I77z2w/bRiq6ghGKWgy0f/LdxMHOYzDx97iw9DYi5BXdlM99X/M7GNyZFWDVXXB4kqNKmNHIWyd11QMGf58/iYOfbdMDm0K9zcTp60h7LLwcKJ+ZSfRgdeFFJGjT/AjbSSgePJ4IUDvoZ5muxGczzCD3vngXPn9llGLKQtjg8hF8OKSJtmaWAxcxzNZk62vF69J8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <91c8c189-fa39-b0f9-49b4-635d4d7344ea@suse.com>
Date: Mon, 30 Oct 2023 17:01:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH 6/8] x86/physdev: address violations of MISRA C:2012
 Rule 8.2
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1698045505.git.federico.serafini@bugseng.com>
 <dee7168f9ce2c52c8db0c4d5d48394550592756f.1698045505.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <dee7168f9ce2c52c8db0c4d5d48394550592756f.1698045505.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0172.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8835:EE_
X-MS-Office365-Filtering-Correlation-Id: ed629dff-7505-49c2-b540-08dbd961784d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QXdkPOsu0ixnMhiOR/JgC+IM+yXkAeQ8WXpwygu0woOiT1aXlXD+UmJ5DcBlbMnvAxXyD0MAOX3/IzOhcC4Sb9jlaXAADyJL2BH/ImfEAZQpxpG4YjHhMqsNEWCg7ogU0K4HiwOq9/0vTFl6+BKpz8jplmFuf4FRdDzTLOQl6edPjnIuMkITMp+BujF1ARYJOo6ebtllMry9RG9ReQstgiX4G6axp+on/IX3u8UYTX20zZt2XJrJkxGu4YvOv4/zInA7werve5XpUyrgdg4IVjA4Ea6mCKBueWrB7zbCiN5kYGNg3Q7fvk1soiOVpMwTTANZp7/LPl6Wb1+r/Qp14oCGsz9eeGvBou2y3HTIY4u2iuoq22rTQdc27zBe0T2F5U5Xu9MsB0olsHYvd2QJumcNWYdLSY22mat9C6K2m5SKrJcVFQz/5YIEDxOO22PfUsRHx7wFNyKjinIm1v2mdLD1NU9UYE1rof8IYUpSWniDaSv5FT0yLM5kuuKVu0yn8YJw+gTpCZUgLCryZU67pRhWw9GMotKLBGn4QXOpenyy3xrEHxrH+m1gjs5Rsyi56aUzH55Xk0qOPbCd/H6Y9sBPeMFPgmUCl1BAvBS5OSkMQuUgemJ+cvzTgAQPs+Strz9Dqc9r6XeJpz6riIXMZw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(346002)(366004)(376002)(136003)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(26005)(54906003)(66556008)(66476007)(5660300002)(6916009)(38100700002)(2616005)(316002)(66946007)(8676002)(4326008)(8936002)(53546011)(6506007)(41300700001)(6512007)(4744005)(2906002)(6486002)(478600001)(31696002)(36756003)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlplMWplRjAwQUxHWWZpVHY5U2tpWHlBQnhETHpTdXRKTzdvWWFnZXU5SjBJ?=
 =?utf-8?B?ajhaSHh4T1JIM3lEcEhFYndmM0UwRjFtV2JTQzdzZld4SnFWcGZTZ05HVjNX?=
 =?utf-8?B?QUtFbzBZSkZ4VGhQUWRYdU5hZXBLekhDMU95eEhrZW5NRGtXSW1rZE1XRHo5?=
 =?utf-8?B?TXNNWStlVE1KNVYrVHRJcUVKWVhVSHFxNmFIaWNFZitUQUtJR2kzY0Vyd2xM?=
 =?utf-8?B?Ty9QNDFDalBYelhjUm1WODFHVkhxc1VXTi9mbTBPMlBoeC9UQ0J6UlhxeGt1?=
 =?utf-8?B?cW1kR21Ua2FFSjkxcHZaTkZPblNPekdWRDlFRHpmOHhZbExaWWdRMi9hVDN6?=
 =?utf-8?B?a2xaS3J3SWJKVUFXTnhsL1c0cFRGdS9DRG8xRUQ1T3ppdFRmeHNmVzNKbzBq?=
 =?utf-8?B?Sk5LejA2MFEvMDkvZGhVblppci80Ylc2MDVxQTBiY3BCOWFQLzdsTkJwYllD?=
 =?utf-8?B?Zlk4cHlxeWh4Yk5SZC80ajNFbklHQmdhdk9jMkhoamRYYmdFc1hjd3RheGI4?=
 =?utf-8?B?NkFPdG5UV1JzM3JwWmlGb0g1RVMrR1hkSTlWQ1NvM0REZVhCQkhzODNySnU3?=
 =?utf-8?B?U3lVQjU0U0s1UTVGREpUNXhqZXZkOHBuU2VSUFBzN2k4SnNoVE4zWUJtb1B2?=
 =?utf-8?B?eTE4ZEtyN0xxMzJWT1VaM2psWUVsa1ZVeUtQZmJNV2h0QXFRRHZKZm10ZUx3?=
 =?utf-8?B?QXA4cnBnWS90c3FpUWh4NVJsZUtCeHArQXZQdWN3UGhOQmtJSnhFbzZtdGVl?=
 =?utf-8?B?aDRaME0wS2F4UEdQV09MNFdrSy9aWWxKRUsvbTZCSmNiaG13ZHNVR0d4RVhY?=
 =?utf-8?B?dHM2YWN2V1UrQ1RSZW9IOXFDNUQwcXJjMEx2WWpoK3c0RGh3aWoySHhTc0lF?=
 =?utf-8?B?R0ZmQnBkMXY2N1JZNWgzOVpoMW56YktMVGREQlYxNm5iTVVzTGRieXltZHFm?=
 =?utf-8?B?dkpVRStmV2ZsamhwelhXUmVPTTBTdnp6em9MR25rMFF5bHpyUDlqTGFibTQ0?=
 =?utf-8?B?UHFSalNoSlJUd1hYQmg2ZXhZbEdGeENCTE12N0V1MXFsa3JnYU1SOWFjWmtS?=
 =?utf-8?B?bzd5SEpzUzBKTWlibXBVcUY0aEJLN0tyT051dUxTT1YvYnJ2d2ZsSnp6cVcz?=
 =?utf-8?B?R28xbkR1anp1dmdvQjRCbmtqdmU1YlpjQUpYSjFOb0JRd0xoN1pXSkI5ZjhE?=
 =?utf-8?B?Ky85TlZxUkkzd2NjZU45eTI5Z1g1a1l4eGZVT0diS1dvTDVjbWxRYWtPNU1o?=
 =?utf-8?B?S1N1QUMvVXFuSzBXRWVYbFlpWnFMVGsrSmZQSGNONUJRNm5xYTU1RUdFQ0lR?=
 =?utf-8?B?WXo3MFVSTnNvR3MweXR1aU02cjA2ZW5OWTNJUDJsYVEvcXRmQkkrVk8rdXpU?=
 =?utf-8?B?aHZIOUtYbThNeHBlb3hpRDl4OVQ3Sys4QnFzZG5mQTB3MTA3K2g0TVhMVDRT?=
 =?utf-8?B?a29Zb0o0SDZHN0doT3FvZitEenZRUDUwbTduNUZuaktzUjlOMXVhamo3OFhY?=
 =?utf-8?B?blZ6Mzk2UElwSjRtczk5NG5lZWNSbVdMaVRZVHl6SzBMaTdaUW5pcDI3UlNV?=
 =?utf-8?B?clE4N0xFNlNkdDlqeVBONG9DVVRSaTBxTkRFVmx1ZWVHTTAzWG5OOWhNandJ?=
 =?utf-8?B?Umh5RndIRml5WWNNQmgvQVBSR2JMMllNemZEd3FDemZ4K3JDbEJod0Y1QkRM?=
 =?utf-8?B?V2lvSEdrSkd2NmhKVHhiWHVEdkZsT2lmMkwxVUtJYUZoNHFqQTZhMHFWeDlz?=
 =?utf-8?B?NlRoZmtxblJvZFZwenEyemtSejBkejBHQmIza2F6UU5GRmRTSnFQVlNGR0xY?=
 =?utf-8?B?eDNCc3BWbW9oelNURDZQVmVxdEU0NnFlNXJwRlRtSDg2VExIUXdVMkVOK0xh?=
 =?utf-8?B?czhSeVRYZmx5ZkZoTUtiWlF3TGR1N3grWi83ekhqdmhHTkxXZjdQdmphWGJl?=
 =?utf-8?B?MnhCS1BWMFVNS3diQ3V5TUpaaWMwYStJaXBGLzBqam10cXZWV3kvZXVwemo5?=
 =?utf-8?B?Wjk4am56eXVNcDg2SkNHOTNjRlc2dFBYR2UrLytWam9QSXlxQStWeVZMekRT?=
 =?utf-8?B?eGJ3emNKdnhJcG9ab0xERjdqL2daQnpQOHNSTDAvR01KMTBNTGdCVHpIYksy?=
 =?utf-8?Q?rD82wiR8HwQoDHm9nCxAFGHPT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed629dff-7505-49c2-b540-08dbd961784d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 16:01:25.7792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vQ0Bdv/9/T53delj+47LY1k2XHD3lYGNyKAw25dFDkn8b1OmQlnE2f4FMMMCtvzzyoO/9SFLZLDFPY7MQ+0gGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8835

On 23.10.2023 09:23, Federico Serafini wrote:
> Add missing parameter names. No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Albeit I can't resist to say that ...

> --- a/xen/arch/x86/physdev.c
> +++ b/xen/arch/x86/physdev.c
> @@ -18,9 +18,9 @@
>  #include <xsm/xsm.h>
>  #include <asm/p2m.h>
>  
> -int physdev_map_pirq(domid_t, int type, int *index, int *pirq_p,
> -                     struct msi_info *);
> -int physdev_unmap_pirq(domid_t, int pirq);
> +int physdev_map_pirq(domid_t domid, int type, int *index, int *pirq_p,
> +                     struct msi_info *msi);
> +int physdev_unmap_pirq(domid_t domid, int pirq);

... this is a good example where adding names to the so far unnamed parameters
adds no new useful information at all, as their types were already sufficient
to express all that needs expressing here.

Jan

