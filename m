Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC046CA93D
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 17:39:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515327.798066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgowf-0002qy-Bg; Mon, 27 Mar 2023 15:39:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515327.798066; Mon, 27 Mar 2023 15:39:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgowf-0002oD-7Z; Mon, 27 Mar 2023 15:39:41 +0000
Received: by outflank-mailman (input) for mailman id 515327;
 Mon, 27 Mar 2023 15:39:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81wl=7T=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pgowd-0002Qb-KW
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 15:39:39 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on062f.outbound.protection.outlook.com
 [2a01:111:f400:fe02::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94b47738-ccb5-11ed-b464-930f4c7d94ae;
 Mon, 27 Mar 2023 17:39:38 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7274.eurprd04.prod.outlook.com (2603:10a6:102:91::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Mon, 27 Mar
 2023 15:39:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.029; Mon, 27 Mar 2023
 15:39:35 +0000
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
X-Inumbo-ID: 94b47738-ccb5-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T9HPraDPJ9h1zti4lgXI6htWeQV5Bwtf2OABHO6aDm1y1z7E5l9u5uUGUPKO/E2CuJpMz2cl1GqNcsr9hUr/QIRETKiSCVSYoLKPF96aYC3ruLjDYEcj8JC8q/4UM3DMlYKd1PKMDKBigsRgaiDtlZ/IZSmw4qF6Duu8xHIU4Kz1+DcvQ4raR2NvrNiHqOl00J6YvUCcXaZs8DsKk59baXA3zUxy8mdbZXWmO2cQ88OdeW+iSRP6l/s+AK0uLaR4osHz7oO7Z0+U0pzbLU5JCTHNEx5ut9xuZa086JfUGwv0vAIFVKVONtOepk32wzGvq+2NHWOCUO/sL2Tsho9DIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kXE3NMlpQTWxogyqp9LmhYc2ZvZ2B0l7htTM+Xf/OVQ=;
 b=QAcq3AzT0Fi6ZYC2ZSf2X2xcplW4aFV2iFEGSdp+ocW4vgadbBC2g3egPGuwLwJwFwSmP4aFrgeHTKFi11waZeoR8GFyh8rQc/oen9Xd8zFIX+7AK058RipCbTYM8Nx20clClyQSe5lg2apsFL9Z8dO2XlNqaqaWmIovVMuMrGLEfnfQJS6LflyA8hUJaORKUoBn54EQihqMQnz3+bZ4lt5ARW9w7uaptoDY+CYYBnYmHaITmNsWsFv7weC9Auc69sBTEzL5Blij/gF1y/UEJSev37LkkniHkzdBTA6wXTvzX+ibANHGU0OFVGRD6RgvwUg5PmjYeu1VKXPbn72sRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kXE3NMlpQTWxogyqp9LmhYc2ZvZ2B0l7htTM+Xf/OVQ=;
 b=2kc01x08t5/4k8KJJ0sLiP6R/lb5nQw72vs5/mvumdmmMyCF6VyY99Bua2nPaDddHJyc2WJO1y9QglgubeO3RZxPqD0HfOx2JEO0rn6g/na9GT4kB1A/46lhrCsa6SlNcLcwjyOlQPnboJXu9XKkHLobNWM6Lq4NUP3hzXAU4SiqaVywoq4xwioGSC3Oi9nWNuEbbqXNRJUB5Q3vnn47lpfk0GUe+kJJLsq0pYWGyBlLbQGJL4gFGiy6e8zfA4ZFwTexYg8XvU1y+5bM+ZssFiFPMI55E2BAWZwxJVZsyGpwh4u20uFNd0aMv0rCA2I0aYb8AN2BpQhYpe6N24mkdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ef8a35ed-46e2-b7eb-60dc-bedd09b0c0c9@suse.com>
Date: Mon, 27 Mar 2023 17:39:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] x86/ucode: Fix error paths control_thread_fn()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230324214430.3277862-1-andrew.cooper3@citrix.com>
Content-Language: en-US
In-Reply-To: <20230324214430.3277862-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7274:EE_
X-MS-Office365-Filtering-Correlation-Id: 923756fb-3836-4c91-cdd5-08db2ed9777d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qBdSugBJH8g4XdMjgE4Bie13dG7WFEwTzXCSO4tfcaeb/IAcI6BxG0Nv8OEdOFVKVOoGUd25i5zAzEki9PnYA35BONUokhPmqTiiL09I8jVOwm8IwxdBMWMCdWiUBCeihl2VIijND63IvI4xjOQNJcgHFEZxBNryTSlbFsKrJHPiJJiF540gqGwe7GS4RaGEMCA7zADgpH2vaV19/Fw+YYs38J8Yj5BAcGS5Avt0RM9yLqQzqQi3hIyVThUQhyUsWekqjO5s+wc1rSVsPaTSHh7U1gqRFXOEaYH10Ma+jV6VvYBAyp05DY9rX3VktO6510clg+s45ugnitOl5qfmQMf1QElFYvqKaWq1ggPOUD5NfLSHybSk3aViDSSSX5t8wbC+ZvaQlKZ2TLeoMqnDrqOt8gISxHLOLC7W15+VzQ6b4xiwKkMqWjVgvQpJTqMiEZvth5Ob0ZWGzS21Q1qruNxAOSFDHl0mvEITlq+oH1lJfcGndqIqimYToRQ1X0NMUHSrZFZMqdfbOvGFRoLDGRxj1JZfIdiKE4iFxC+OtmbMXbgf2wCmOQV3neZnw8yTazlmagNVJhW5j+TSUx8Fr7TYrnr3mZlf9PJW4At6C6dq67vbeWW0QEQJSZD/10DhYGFZ+dc+0VOOZdYMk/Iurw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(366004)(376002)(39860400002)(346002)(451199021)(31686004)(31696002)(36756003)(86362001)(6512007)(6506007)(26005)(53546011)(186003)(2616005)(4744005)(8936002)(5660300002)(41300700001)(6486002)(6916009)(4326008)(54906003)(2906002)(38100700002)(316002)(66556008)(8676002)(66946007)(66476007)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZW02cUZBR3BWWUxYUFZvOFkrQ01QZUlhOEthQjU4V2FPbGFwU3plckcvR1FW?=
 =?utf-8?B?L2pKYU81ZVNGL2cxdFA1NHl5WG5kRnRkRzZIK01Ja2J3VWxXa1VOVWV5VElB?=
 =?utf-8?B?TkJFdFFKS0xLTVVzQWFPdmFpSGJJeWhwaTFRQ0pYTUcvZ0h5a3NhclRhYUdK?=
 =?utf-8?B?eTJjaFpad1JST1hnRGhMY1J5V21ESFErWTd4S1N4Ky9zWDBBbEZ0WERMSjNj?=
 =?utf-8?B?bHBBa3I4Q0RIc2lxNkRMcXhBcnZ5L3NXRGc5WUdNUkozR2d3cGFLaXhmU1ZU?=
 =?utf-8?B?b2JYZXJKM0ZzYytIZlVKcUVXRXFXZmVFNDlSSGVoZEhvTWZudDh4cW90dXIr?=
 =?utf-8?B?Z2h3bTZ2WXVwM1c1U0ZXWGhEL1k5VjBENGtXNUUxM1dIakRsMGRQRllodTR0?=
 =?utf-8?B?LzRvbWx2MDl1SGczMVRSMkplM3JvM0ExdklVZjc3SGR0QXMrRWozVW1FaUcw?=
 =?utf-8?B?bkw5Ly82bDJRY1JVUkN0MWYwS2NBdHpUWWlCNnUyV0FKejBMdVdhMHRkTFEv?=
 =?utf-8?B?V3JzbG5DTzdSN1gxQWFicktUSTM0bk4wZHhBS3ljVVZkSFVFZmpTZ0dhQWtV?=
 =?utf-8?B?U3Z3Zzhic0JVRkFkNW1Ca2E2M29ScXYzdFVmd0Zsa1BoWVdSbVhTTEVJNHVM?=
 =?utf-8?B?cy93blQrTXlLREhSbkN2RkpCZGVMeFllRUozYVpaVlVGOHZqcUh1dUI5enZX?=
 =?utf-8?B?cjlSeTIwNHhYR0xoUmxOZEhTR040SDVsRCtvUk0rTDM4S1ZmaldBbzJtVzZO?=
 =?utf-8?B?Z3FJVnV3d0NkbzVULzNrS05lS05LaEFxbzg4QnRhOTl1aS9zOFEreTVYeWRz?=
 =?utf-8?B?M0lITFY0cllmOCtZWllQbmYzeUhTKzdwZmFXRWozSDZ1SW9RZk9LZVAwbG5G?=
 =?utf-8?B?UzNwUzNJSEdHQXJYYlZsZjQycTc2NWtZSmJRNVNxc3JtckdrQzdPa1NkQ3hE?=
 =?utf-8?B?WWdwNk5WbGJaWmtxUTNpUEZTaHphMUhjREcxV3dMd21qWU9naTF6eXliYm5D?=
 =?utf-8?B?RWNwRnlUTGFNVXo3Y3Vua2tsM1kwZGk5SGZieGkvbHBvUGtKRExXakZEelQz?=
 =?utf-8?B?OW9KMUtLY3VCNUYxWE1kckQ0aG9sZTBJYXJEaTI1QU4yRkZFUzM2TXh6V21Q?=
 =?utf-8?B?ZE0yeitLZ0M1TWh1ZFI0M2xVcEF1eDQyNWlIRHpoL1EvSWRXaU9Kak5yVWZv?=
 =?utf-8?B?dkRTaDJyODVmdXBjbmVQbFdremw3Z2hUVm1xdkIrZ3M2aklRNHZhTmtlSWRn?=
 =?utf-8?B?YVBpdGhEdXM1OHBBQ2JHNnlaZ2RZc1IyNUo5K0JQVk0wTjJLZG9UTktRenZq?=
 =?utf-8?B?VlNhQTczL29ORld2YnU0TTY5cUVzbG91RjQ2ZWRjUU1mUDVTSkNmZTRmUmkr?=
 =?utf-8?B?WUhTeDRPSzIwZVR5VE5lRlo1WUk3U3FneGJTaEVFQ2NhWjNhNDdPNVdxeDlj?=
 =?utf-8?B?eHJXTGFUeDRvSWhSWlhXTkNUSFB4SEFGMkNNT0gzM09wanpGTnFIKzBIRTd1?=
 =?utf-8?B?S2pkaEJRaDRJWlFGampOSmhqOW1vKzJMaUFPMnpLOWlRbEdqQ015NUFoZjgw?=
 =?utf-8?B?ZHJGc2syU1ZYZENVbHVVaUQvWTByNityMmVhSW5BUm5tcERMSjVGU3RzeWUy?=
 =?utf-8?B?T3ZDSjN0YjUvSnRUL1JvaHB3eUMwQzUvZEVkTVM0WkxDSGt6SjV3dUZoaEVF?=
 =?utf-8?B?aTJHUXQ0OHdyL1V0RjdWazdZejljaDAySkt2VWZIYXR1d2lvcS96VkNxSW1K?=
 =?utf-8?B?ZzNOclRlRTNMOEJWVXlQcTByUm1hcU1Gck45QjU3bHVkWnJ2Umgwc1Jzd2U0?=
 =?utf-8?B?a0pLMG5YYVlXOEhvUlhucFpRVVZweHI4b3lUNURYMU0rbVhKOEFBbHIwUjNN?=
 =?utf-8?B?VHRPK29ML0lXcHBnaU9oU3Q4UFZWbWpjVzh4cTJwQmw3MmVyR2w3UmNEcDJD?=
 =?utf-8?B?NmR5VGIrbUxya09ycVhEUk1rSSs2V2NodEhXYUZZank1QTBPdTRtQkYrajZh?=
 =?utf-8?B?dWdUWmdBVHVTMUh2N0ZnL0MyMXZjc3RMMlJiY3lCMit5Vk9XV1NLRjVSU2JC?=
 =?utf-8?B?cVV0VU1GVnBJQkJBSW1INFFyaVF1amc0TWgvQldHT0JEWUFFbGtKNXNrS0Vi?=
 =?utf-8?Q?8nRlhHHmUy5W7aA6YTlzfxjQp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 923756fb-3836-4c91-cdd5-08db2ed9777d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 15:39:35.2433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L8aQZ9uQWYzm8twseYuCH5ohSIMSz3E4cszNxvHdQoQKNxdPNyx63nk1Bdhk4aII5E02g41fOVACD42+FfSJ/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7274

On 24.03.2023 22:44, Andrew Cooper wrote:
> These two early exits skipped re-enabling the watchdog, and restoring the NMI
> callback.  Always execute the tail of the function on the way out.
> 
> Fixes: 8dd4dfa92d62 ("x86/microcode: Synchronize late microcode loading")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

As a bonus you also avoid nmi_patch to hold a dangling pointer. May be worth
adding to the description.

Jan

