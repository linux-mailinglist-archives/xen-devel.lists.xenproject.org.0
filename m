Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55ED244AC53
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 12:10:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223880.386823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkP11-00055O-1p; Tue, 09 Nov 2021 11:10:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223880.386823; Tue, 09 Nov 2021 11:10:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkP10-00052Q-TS; Tue, 09 Nov 2021 11:10:10 +0000
Received: by outflank-mailman (input) for mailman id 223880;
 Tue, 09 Nov 2021 11:10:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ImPG=P4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mkP0z-00052K-25
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 11:10:09 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 990e7cc3-414d-11ec-a9d2-d9f7a1cc8784;
 Tue, 09 Nov 2021 12:10:08 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2174.outbound.protection.outlook.com [104.47.17.174])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-26-wxuAwi2xP0SJguXS2hr3Vw-1; Tue, 09 Nov 2021 12:10:06 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2606.eurprd04.prod.outlook.com (2603:10a6:800:51::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.15; Tue, 9 Nov
 2021 11:10:04 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 11:10:04 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR07CA0052.eurprd07.prod.outlook.com (2603:10a6:20b:459::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.8 via Frontend
 Transport; Tue, 9 Nov 2021 11:10:03 +0000
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
X-Inumbo-ID: 990e7cc3-414d-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636456207;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KivgD9K6Tazs3NnxAybD6AncL3UalGVUoefztQLSq4E=;
	b=CBPqqiYUcOnQgovSCraDNffCkV57yDHE0jGGpj+rfd/GT6dNHstIIhkXWQQcKuvL7FXWin
	EoL37KOQZfqGACJE+3JPWkKEDOutIUlv4HhiPtNk0sk20mX3J1QvFeUX4liJC+OFeX9zI1
	qD3AEAIDcwHlw708bMxwhJJmKvYddtA=
X-MC-Unique: wxuAwi2xP0SJguXS2hr3Vw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fNg6k+gCW0SGWvf0Sm2ul18/5fGAGA8Mj5UqNC47oIu8OmRp1tFJEssmnFGgZ6BVwYGdYUi2X32wnnE20VvpQrS3X2S9+15R1kvBAmWkNN1ajvdjNeB8mXdz/ypAscbONiqdpVjJytk4LTxxDjI3PJVrvs1tdZYe0S7LpEeHJ9YeBcxOhaTh9aWtW3vko6IAMzMkwadt1TLDG0Lv3JlvZPTvC8sWvM1UwqRq3o8vw1qB5WYduGVEObzN1CVy/lwzBxloIJc0TON5YpC3zGdlWjAinviuGL/WZoeDlH+YJWVmFszSvKjcGc9KQiHTCo7flb3PvpyWHcUb6v9m5mYiXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KivgD9K6Tazs3NnxAybD6AncL3UalGVUoefztQLSq4E=;
 b=nI6dCaKBOcd5y4shyXdZw9+Jj4J/X3xt91+owASoYAkiuLfyHv61d9A21UX7+Z8kYA7F36IZxthTXihAiFL43Zct8ThYUYAfBnVXylInMxqQdsdTEqe7MOLPvumGs0u75SgIQMlfKI4rSt00rSOQiDNehsoWXJMF6FeiC8t1Gr3xD2zfdGC0/jEbds+/UYDelQCgPkdY8fjtD9rKg5tdMD3bI5GGgX8IuqFupEzba99pkMWuFz3Z783cslFb6nWVuCM72BVxBS3DmtVAzXQ9PGDYoHaBLwDq3YZSmgF/opt/yLewGtITsScvHPriJCPdBpEK1IQAImqyT0o/EiS40Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8e0c35a3-d199-0dac-ae26-dc237006bb3d@suse.com>
Date: Tue, 9 Nov 2021 12:10:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [XEN][RFC PATCH v2 03/12] libfdt: Keep fdt functions after init
 for CONFIG_OVERLAY_DTB.
Content-Language: en-US
To: Vikram Garhwal <fnu.vikram@xilinx.com>
Cc: sstabellini@kernel.org, julien@xen.org, bertrand.marquis@arm.com,
 volodymyr_babchuk@epam.com, xen-devel@lists.xenproject.org
References: <1636441347-133850-1-git-send-email-fnu.vikram@xilinx.com>
 <1636441347-133850-4-git-send-email-fnu.vikram@xilinx.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1636441347-133850-4-git-send-email-fnu.vikram@xilinx.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR07CA0052.eurprd07.prod.outlook.com
 (2603:10a6:20b:459::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ebf3749-476a-437c-e804-08d9a3717b19
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2606:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB26067FF239AADF469FEA3863B3929@VI1PR0401MB2606.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:298;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	D14agAZJsfbNihqqxt9tG10xI7On+7843oQUnOJxkAniIWDjVvupPs34C3wIvhURAv9NoD60eTkZ5KDn0T/Rcy+LuKPlBopSSyDFmgadhFbRRl2hY/U9gWSAlRlMDBVWcNQRp7qgMZ72ZWY9+ZDkRJO8sIYrNPIRvSlONRXM/wj6VoyqUyYXT5UtbFwUViH0Twjgzpu85z4NwhNE2DnQxa4KXJaoub6B/o3h6wTyBcvgHoogtbFnailPIWZ15DhbPFqkQV+P9BZS/+ojlQI5opavq0LFL3YP2APmcYZLFAnXtPExZBwYqIDfnTlS3/xFOEHbvtvtTkNYVnKt+GfDyIbA2R+ShJX3dYN2oZ6LmrM5peUvBU+zElb0OVb2eeINUS0nnB00zMv7MEQiHRv+/tSHk8sJWe8L80l+lE+BJm7sgaWVFGwePr+veaE4k4bKMLKNNFGyEbb6lZXDCfbu29fqd1L+afXeXunAY3WAarD4kA0llLivE36FGLWC0YBPzY9svbNiz167o4m1KOgPniTdK5yXspeHzMoedrpzfp8iFiBa7h6COt7lcRAp8qqvMGF7X0kfzYeX46HKWMk45dJPZI6itUdwfCC65vSZdQjrQuO9bmrmoOSRoePWw2O4OSii7ZgnDzHqmekGIe3eaVEOVTVtlwhgoa56K/mzt8PzTZabinq+AvZlOpGrUEyin5caFKQFdGtviIGeFqqyPFYM7EybxQOc1aXoLK/gbp6qyP8L2afnelNDyAGAeu3D
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(16576012)(53546011)(2906002)(31696002)(6486002)(66946007)(8936002)(8676002)(83380400001)(4326008)(86362001)(508600001)(38100700002)(31686004)(4744005)(5660300002)(6916009)(26005)(66556008)(66476007)(2616005)(956004)(186003)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VTIxSWdwRDJqVk51eFBjclVSSmFLL2FVbFFQSW5aOEpvR0tlMnZDeWhFL1VZ?=
 =?utf-8?B?bGUxWHJ2S3IvVDI2UHd1V1BHMHM1c1FkUGYzYk5oYnN4TW1ZYmgreEJFWXkx?=
 =?utf-8?B?ck5YQUV4c3F6N2xpSEhnZ01SKzhHVmtYMFJyQlRDcmdJODBad1hHdERlekh2?=
 =?utf-8?B?SWt4a3pOSFM1N2E2S3ZLbGlnNFdUVWJtMDhkRldIczRKUmluUHF5ZlVCbmlY?=
 =?utf-8?B?aUNOZ0xZK2pRRzdnY2d3VnM1M2g0alJydEFTMU1KWUdqRnp5N25qQTdxaVc3?=
 =?utf-8?B?UWdNWm1XdjVYaTBjUHBlZFJ6RUZDRDlKTWJZSloxdVUxd3U5YUVGdWd5dHhX?=
 =?utf-8?B?VDRPME4xWVRhZXN6WFY0TDJVc2FhREZuMDZsMG05S20yNS9SZkZoeFk0VUlD?=
 =?utf-8?B?elVDaTI3RDhFQ09QeVNuVDI1aXFiczV0dHBWd0N6T1o1azVDTFU1WHpRV1Zn?=
 =?utf-8?B?M2NnQVNqeGtob1N2VFNNL0tuR0xpNEZubys0dllwTGZSVHMvaGMyNm94QS9B?=
 =?utf-8?B?eSthVDNsTEhsNDdqWXRvcmZ0WHFMWGo4UlNVSmg1RUpSMTJ0V1YvdEF0THh4?=
 =?utf-8?B?YkRVQWd1SkpoVnlNQlVWNWwxL3pXNytXUkoyN1JReUVHRzNGUlhZRlBHRExH?=
 =?utf-8?B?TGVWMlp1dUpzL0FSZnpFeGlIdVdmRjFuc3p0R3BhYkJHTWNaWDVSNnJERVY4?=
 =?utf-8?B?V3U3UUkxRjZ6NUNONWJVQjkvNUJKNGdEaGVTOHlBZEVEU2tkOHlBaDlKS3Ir?=
 =?utf-8?B?ZXd1VWNmZkQ0dDg0RHcyNGRYZkszV1M3MWw5R0pOQzR0Ti9jZnFOaEJ6UDdV?=
 =?utf-8?B?RVFzSENGMU9KS0dMQmpNYUZoREl4RStHK21US1VObnJXbzdsSEFGenhYYWJN?=
 =?utf-8?B?RFdwOXNWa0ZacmFEV0JmcU5jakZmbnNCd21hTG9BS00xVlJIVm1aM1JidXRu?=
 =?utf-8?B?ZjJodkprWFZ4RHI5UGRHV0s5SWdJY0NXOWIxUXRhVjFaNFcxNkRjNGttSEVK?=
 =?utf-8?B?VE5DMXgxbW9kcWd1MU1iMXZCS2ZpeitWaUUycGIzUUh5RXZndFNkQnpPU0Zx?=
 =?utf-8?B?ZHBzaGJyc1lwVFFRckIyS3lOZDhUemFuRXAyZlVKMFptc0x0NjEzNG5rWVFU?=
 =?utf-8?B?SnNaRjg0OUxZSHJ1SkgwdUZGTStLQi96Uko1YWJrdm44K2tPMjhHaHl6M3Zp?=
 =?utf-8?B?dmRkUm9zazd1TlF4OVFZUzhGdGlhRGtMc0J0V3FrV0pEcmVEMFpNUE0wYjgv?=
 =?utf-8?B?UFlZV3EybVhReVRRbGRhS0ZhTUViTXUvWVpMbStFbCtqUDdnUEJ2emhoSC80?=
 =?utf-8?B?VSsydHpSUllyR3c5dzhOQ2xmWXVYek5yd29IQjlpYlNCKzVoM3hYakVORU45?=
 =?utf-8?B?ZG9zRjZFMkdDQmpXTThiczYrMHlVVmorUU1qNVcvSEk3STZjK3dNd3Z1dmZY?=
 =?utf-8?B?eFNSSWIvOXhzdEZzSFc4clgzWmk4RjFjMlFSUmIzVVlMVGdFYW1jaThQVGdH?=
 =?utf-8?B?VFNwZHB1RFVtVVExdDFUeTZaSndSUE1BM0RrT2ZiaitWNGRhbjk5UDdvN2Nx?=
 =?utf-8?B?RGloQldOMDMxWDJGWmtmVDQ4a0U3MkhIeDhycTlqbWdxandyLzg5NVlZZWpE?=
 =?utf-8?B?SU9xcGQ0U1FBb01BdlE2cGRLRE5HOTNISytPdDVwWGZ6MTgzUTMxb1VJc3o0?=
 =?utf-8?B?VUwyQ3E4RFVER1l0WDkxZXlTcDQ5di84eGdXak1DQi8zZFc3dEwvR3BSVU1F?=
 =?utf-8?B?dXhFS29CdUhVbTdkbjF3cllYUjQxVisyTzRzK2tIVG9MS0I0Q25tM2ZmcHlR?=
 =?utf-8?B?NXFPTnd6NzBFbjRaT0h6YmN3ZXVhZ0ZPd0p5VjM0VE52L2ZkVmxuUFpNWm9u?=
 =?utf-8?B?dHhIWHJCcGN2aGNVWEpucFZvMXFkbHFNRXQwUWk4aWNnTWd1SldZYU1HY1hq?=
 =?utf-8?B?bEpiUXZDV0ZDbnNxVldBYjVnRXNjTnUzc3dURGFIemxraVpONkpCK3VCVTVv?=
 =?utf-8?B?UDJIaW03UUFWUmpNWnhQenh0bTFiRUJxc2IvdkJjSlByTDQ0L2w5RUxDSmZV?=
 =?utf-8?B?bUFqNHYvR3VWTGdwcTZFcG9vVVhmekhBUk51ck9ZVW9GRmxEUXMrclpESURE?=
 =?utf-8?B?MldMSEMwalpIRjl4TXdyUTl2RHFHdVR6cWRxZk5haXJXZHBWMm14KzNvQktq?=
 =?utf-8?Q?fGsJi68IKJHCV9UV2ChdfJs=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ebf3749-476a-437c-e804-08d9a3717b19
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 11:10:04.4531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3NOoVWFnt77adXvDbj8n8uh2cYqIThyQmXHgymiZmXq8Rpj3grzU4nYEM47SRuHWsPefC/S92hECD+b0XDAgXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2606

On 09.11.2021 08:02, Vikram Garhwal wrote:
> This is done to access fdt library function which are required for adding device
> tree overlay nodes for dynamic programming of nodes.
> 
> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
> ---
>  xen/common/libfdt/Makefile | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/xen/common/libfdt/Makefile b/xen/common/libfdt/Makefile
> index 6bd207c..f838f5f 100644
> --- a/xen/common/libfdt/Makefile
> +++ b/xen/common/libfdt/Makefile
> @@ -1,7 +1,10 @@
>  include Makefile.libfdt
>  
>  SECTIONS := text data $(SPECIAL_DATA_SECTIONS)
> +
> +ifneq ($(CONFIG_OVERLAY_DTB),y)
>  OBJCOPYFLAGS := $(foreach s,$(SECTIONS),--rename-section .$(s)=.init.$(s))
> +endif

I think you'd better suppress the objcopy step altogether in that case.

Jan


