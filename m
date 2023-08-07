Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 401927724C2
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 14:55:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578376.905853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSzli-0007xU-3K; Mon, 07 Aug 2023 12:55:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578376.905853; Mon, 07 Aug 2023 12:55:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSzli-0007vl-0S; Mon, 07 Aug 2023 12:55:30 +0000
Received: by outflank-mailman (input) for mailman id 578376;
 Mon, 07 Aug 2023 12:55:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Szp=DY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qSzlg-0007fq-6j
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 12:55:28 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20602.outbound.protection.outlook.com
 [2a01:111:f400:fe16::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae8342ca-3521-11ee-b27f-6b7b168915f2;
 Mon, 07 Aug 2023 14:55:27 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS4PR04MB9338.eurprd04.prod.outlook.com (2603:10a6:20b:4e6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.25; Mon, 7 Aug
 2023 12:55:25 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 12:55:25 +0000
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
X-Inumbo-ID: ae8342ca-3521-11ee-b27f-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dp/mVhC4pjUiEL2c/qt60WwX5Yi0+BxHThRDxiGs9v+5MjwGH5R/OrUUiCSID23vaCogNWOMavGsCSqCgRPOWPM1xYzdKfwSGAoh6KEaUsywpFHm9K/tBwg5KjX8IM+O47tFMWuqfB4b9/AV1PKWWxtTgSldIHzxcxJqLW8vMxBdWhVs+LYocWKmNl/SZvEffr+rpZyTdOS9ns2UIm6zHD/U+IbRZ1nJXXb7jGMPrIJUXuLiZpPKH9ObgJU1X60h9cR3mXPvLLnFpAOkbZBrPgHuE7foogMSid1PfyiS4PDouPIq6Vgvv5JPY8JfO3MxdwHLBSKpg3ZDZcUYgXXNBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=714EprljTvlE97Mb6c7roih6QuC6/NDH9mWbJEMKvWM=;
 b=QKsOQEvv0e9G7s/07JsFAKGbrBf366nR9dFFxzCNYAKHK+Dio2hhjJgVTqnYKMkgPP3LMp4JLw0ljjJcsWoBwDe1nuENEhAygLb0tRyRFJxBhcfA8IFIa1qPZMYl2D4Dvsm0u/8h0Hobx2O1EaAmKiXt12jT+vJ9ca8iLFbMRZOxVfNFYl1/G70hyMWDn6lI3/4oft6A9WF6eD8PRHNNZ48HyRMswz4vqinot8382NqTmdS5uJ1YtFF4MXwgQVRYB+4AXc9ROklj0rKylXlwWk8CcHhrBErqmLZgJxCZIepixnygZ3GT2WAqv2gUoMtb+IUS592lhirTfRx8Zc3wmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=714EprljTvlE97Mb6c7roih6QuC6/NDH9mWbJEMKvWM=;
 b=tvIE5hfjy+93teI9b3E6XISYnO69tLYfP5pw2oe+v2/HmAPRMqAvwL6/fzeLgofGAH9r1n/NjCf811N8+RPGPTbqq56ko8ZuMAibtFGor12sxwz1O7sSmHmZCVCLdzsKoZRWZchLUktk/xQ3mVwwHh6aOGF6qLtpIFhMtEvDl2VY+GfMuBi1y5GIG3Ug4eAZ0WZrYV4l2BVYRRo7VbD7WrGdO0zMLWLrW0fVPlgRW7KiyBlGpeKGG2wdjSrDhH0p6ei6x+btUmFB+nwBIaKLkbBMwZQE1L3B+8JXy+abhereUZESOVY5anyClL0MnHGUb3dz1wqDp2nSLgrIOdsXQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <19928768-b24d-3e40-937d-9460e7f06a9f@suse.com>
Date: Mon, 7 Aug 2023 14:55:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH v2 3/4] x86/irq: rename variable to address MISRA
 C:2012 Rule 5.3
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1691135862.git.nicola.vetrini@bugseng.com>
 <987ebd142ebd69ed062d74f7eb69c23759c51636.1691135862.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <987ebd142ebd69ed062d74f7eb69c23759c51636.1691135862.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS4PR04MB9338:EE_
X-MS-Office365-Filtering-Correlation-Id: d09f74fc-bdce-4ad5-eb0d-08db974591a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bl63A/PA09EcAyz4cpgukivElEZ7vIVx3D3ztX+MR6qnRGCfmuA4OChClbRgsxe07tGTFlrzyIKkqjEhaKcVhHqKHC//WbszuJHLOP/Qzw2wk695b0O+uGXGeOdQhF6MXMybisU/cZpywmyD8A8aJO2XXgIft/jnO4B3yFVJB4P/vRLXjbMUzl6M0x/2t99jP7wAGPFEXfTLEO1Xl6EnRXo7Ed8WHV+2l1bjTEngpw/vWFG4Si4kc6Zl6w4MEFYKTPCdwFHrLbtVim9x7F24Le2X9oFdH26saxVJzf0MHNKXc+SNsGB6flq0YIOZhwXzAx9YOdAoQpE2dpjMZRuHif6oq/xMK1gVbS0vXRDeRqwZXWVfqu4tEvHGgWpwvZ4v7GFwmWxpmgKBbXTjRU/xu/6oQ5PFj3HQgwsyPtVQpKSbJIkf5Sd/jJldktHfOKIH8EUxOxW9SLPNdMuURSwaY93LouB7v0d3owGpGvImanoDhUvgEzAUmeCo30DQO7nonmZJ7NrIhAbIuz1FfqOzKsPY5bzbhkWMhvkiZGUuQBbiWRA+vdGA4ZkctbL8aksm9nY/SAoVr+8Ck/x2XfPfZMdv47pM4YfrXfHK/xYsAp7R/0x6ohOX7E4NehLsmTwlVXeLtqpKeUF3lERdDkaNaQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(376002)(366004)(396003)(39860400002)(451199021)(1800799003)(186006)(6512007)(26005)(6506007)(53546011)(36756003)(54906003)(38100700002)(5660300002)(7416002)(86362001)(31696002)(4326008)(2906002)(6916009)(66556008)(66476007)(41300700001)(66946007)(8676002)(316002)(8936002)(478600001)(2616005)(6486002)(31686004)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVpkQys0WGxVRmtGOFFTZHAremdTTG5uSTNkbWhLY0VMakxJNzAyNmpnNFpJ?=
 =?utf-8?B?TVdxVFBWb3BjaFVwQkdYMzZLNm5HWXplRk9zbkZqdldCTER4bVpxa0tuem0v?=
 =?utf-8?B?WEh1anAwbXhmWGF2RkRGbEFNSzBNVzQxaXBidllXd2lwcmhUUEVPU3NCUUQ5?=
 =?utf-8?B?ZjVzVzNidHYyK3B5T0EycjFBbGN2ZVdXbkpaTWRIa3hLNG8xMHRjL2lXcUx3?=
 =?utf-8?B?bnZhVkJqa0IyQWdkKzQzeTNQMHZCYVBwbzlnVWpFdlpmb2x5WTBFVWhMamZ3?=
 =?utf-8?B?UkN4aWNJWkJucEVTcmtJWEVVRlU0QzZDWE5ORE83SHRLNFlLbmwxSnhoWm5p?=
 =?utf-8?B?OFllWVVGSU8xVTgzT3dCY1lvTVRKT3BrWS91WVJRQ1h1ZXMyRWlQN0Vybkl2?=
 =?utf-8?B?ZnRTVENkdUhEQ29nUEw2bnpvTVRDY1lUSjF2QzRtQ1VWWEVVQUdFSGxTOUxI?=
 =?utf-8?B?MVptRER6Z0t6TnM5eWZxUG02ekZGVE1zakhjM0FLb2I2dFNabEdYQjBlN2tX?=
 =?utf-8?B?VEFMcGZPVVJKM3JSTVpqYVVHYUxUK3BUSU5sSGhua251UnZYZkxBSFJnYStj?=
 =?utf-8?B?Z3Ard1N6dkJrT0tQdkxiUjhvUEp5Wk1YZEpQT0lONGpVYWZJckZmUWxXSkhP?=
 =?utf-8?B?YnIrMFBZZXdCMkN3Q2d3VDJrVjBkeURIaDJ6aDlrM29qLzZkU0NjSEdJRHEx?=
 =?utf-8?B?NjBQU3M5Qmh5OEgrR05BUW91VlJDeHVocEd6RkcvOU5HQUhCdE5vNW9rVlFz?=
 =?utf-8?B?K1NQU1JhRmtDaFRTanBHaFc4Y0xEc1hOOGFTRW1wNjVTZHN3S04raUZRMmlH?=
 =?utf-8?B?dm04bmE1QnZaU1R2NWlVSG9pSE5rQis3NUVYTGpWY2tCMlFTdyt5dFBHRTBJ?=
 =?utf-8?B?bVhocngzT1pXMHhuM3FLTVVnQUhla1o2RUd6QjZYc3o0Mnp4d1RpWDczZjFy?=
 =?utf-8?B?Z0ZwRnBRSnR6bGVUcWhqTWIwaXVEaGtobHp6Z2cwNHpyRnFDNlIrb0duYU5K?=
 =?utf-8?B?Z3ZwdkJpL3IwREFJaGdET3VRTGtWMzI3TmtoZmZaY2NZWXZZTXR0REtuenh0?=
 =?utf-8?B?SDNzaks4a3FXQUVoTUlGMjFUVlhBaC9MS3NQSTN5NVJMaUpBVkIyb09uRGE4?=
 =?utf-8?B?c0pNM2JrUTJQVWVFZkVCM28yZE9zWUdnVHp0azl1eDR6WkJadHBiQ2ptVTB5?=
 =?utf-8?B?Z2FxMm5sbEg1SHFxRjNGbXJTQVR2c1piYjUvbGtHRjJqTkhMTGpEWTQ5TXlk?=
 =?utf-8?B?MVJxTkx4ZkxLU3RQZEYxaU9SWmRBQjhZNXV6NkgrVGI0NVlTRnMrMWdrbUtl?=
 =?utf-8?B?cEl0MHZGOGMrS0thUFUwVmpGeVpsNUQ0anJBZlRDNHUzZUZVd0FJOFZNNFFx?=
 =?utf-8?B?MlJpcXA3UXJkOVpiSkJlV2twWXZBeUYvZmx3c2JlcTUwZUs1VmdLbGcvNHI4?=
 =?utf-8?B?NU5LNkRzbFFTbHVZUnJ0ZXhTaWtCUUhhNjAwSW9NUThkS1QyTVRlWUVzdDRJ?=
 =?utf-8?B?S0lPazRnSEc0UGUyTW8xVUNySnRZdTM4TE5ObVNnT3VUaE1rRHVmWEtWWlZ0?=
 =?utf-8?B?dldXL2RZVUpzdXRvTDRwSFRQNGFwMUcrZENlNnBld3B6VFc4Q2tvYmFzeERj?=
 =?utf-8?B?Rm8rWmxUaUdQNTFsbkRLdXlvaDRMUlJRUVRnT2VjalFlbVVlZzFISHFoMWVG?=
 =?utf-8?B?T0htY0Y1MTBQdHBHRnBGbkdUK2FXWWc1NE5FRnFyS3d4TjN4YmFKdDNRKy9p?=
 =?utf-8?B?eEtoTXVmOGlnTk9DRmVEL29MaVlWYzhseVp2YTE5MmlHTDY5dW9YRVdmeUZ6?=
 =?utf-8?B?ZHBpS1VQL1VSRWJKUXFIaDJCT1ZJVStXQ1FNV2ZmRzFQY0xEVld5THlFaHZK?=
 =?utf-8?B?c2NURTc2eW1CdW5TaFZDeUxIekxzUWdyWHlwL0tyNnNoV2QrRXM5MElEVUkz?=
 =?utf-8?B?ai9xcW5VbkdhMlNPZ1I3SzNiQ3BmM28xWXpwWkE4ckxFL3BRcEtBYURMUG1s?=
 =?utf-8?B?Q0VWVmE1ay91ekhrb2ZaNFp6dWNxMC9aV05qZzV5VEs0cHV4T0tJOFNZbzFM?=
 =?utf-8?B?SDFwWFdOWTl0TVFnMWpYbEF3R2t4ejh3SG44WTB5dmowVUhtM2pHWnZtbFRy?=
 =?utf-8?Q?st9XxKg/v7QgfuqSd/S8/y++u?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d09f74fc-bdce-4ad5-eb0d-08db974591a1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 12:55:25.5815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6OysXwvVhbMCEar9ZnouS7fhp6LBukYf7o7ZhtcKT1pSbNEvHwBJrT6p5nmkFGzf4+bF52K6JT9fkpnMZsr73g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9338

On 04.08.2023 10:03, Nicola Vetrini wrote:
> The extern variable 'irq_desc' defined in 'irq.h' is shadowed by
> local variables in the changed file. To avoid this, the variable is
> renamed to 'irq_description'.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>  xen/arch/x86/hvm/hvm.c         |  2 +-
>  xen/arch/x86/include/asm/irq.h |  2 +-
>  xen/arch/x86/io_apic.c         | 10 +++++-----
>  xen/arch/x86/irq.c             | 12 ++++++------
>  xen/arch/x86/msi.c             |  4 ++--
>  xen/include/xen/irq.h          |  2 +-
>  6 files changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 2180abeb33..ca5bb96388 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -474,7 +474,7 @@ void hvm_migrate_pirq(struct hvm_pirq_dpci *pirq_dpci, const struct vcpu *v)
>  
>          if ( !desc )
>              return;
> -        ASSERT(MSI_IRQ(desc - irq_desc));
> +        ASSERT(MSI_IRQ(desc - irq_descriptor));
>          irq_set_affinity(desc, cpumask_of(v->processor));
>          spin_unlock_irq(&desc->lock);
>      }
> diff --git a/xen/arch/x86/include/asm/irq.h b/xen/arch/x86/include/asm/irq.h
> index ad907fc97f..f6df977170 100644
> --- a/xen/arch/x86/include/asm/irq.h
> +++ b/xen/arch/x86/include/asm/irq.h
> @@ -172,7 +172,7 @@ int assign_irq_vector(int irq, const cpumask_t *mask);
>  
>  void cf_check irq_complete_move(struct irq_desc *desc);
>  
> -extern struct irq_desc *irq_desc;
> +extern struct irq_desc *irq_descriptor;

In Arm code you'll find

static irq_desc_t irq_desc[NR_IRQS];

It's static there right now, yes, but we don't want to introduce arch
differences here. Therefore the global wants leaving alone, and "desc"
wants using where function parameters collide. (Arm uses either "desc"
or "irqd" everywhere afaics.)

Jan

