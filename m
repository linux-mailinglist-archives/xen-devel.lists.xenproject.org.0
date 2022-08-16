Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB611595C51
	for <lists+xen-devel@lfdr.de>; Tue, 16 Aug 2022 14:53:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388275.624889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNw3Y-0000T1-DU; Tue, 16 Aug 2022 12:52:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388275.624889; Tue, 16 Aug 2022 12:52:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNw3Y-0000Qf-Al; Tue, 16 Aug 2022 12:52:28 +0000
Received: by outflank-mailman (input) for mailman id 388275;
 Tue, 16 Aug 2022 12:52:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qREP=YU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oNw3W-0000QI-If
 for xen-devel@lists.xenproject.org; Tue, 16 Aug 2022 12:52:26 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80044.outbound.protection.outlook.com [40.107.8.44])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45b9a499-1d62-11ed-9250-1f966e50362f;
 Tue, 16 Aug 2022 14:52:25 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by HE1PR0402MB2890.eurprd04.prod.outlook.com (2603:10a6:3:da::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Tue, 16 Aug
 2022 12:52:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Tue, 16 Aug 2022
 12:52:21 +0000
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
X-Inumbo-ID: 45b9a499-1d62-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aIE+2OAARIwPq3HsYVOTxoI/7uafet5z8XV2hkNn0vaw3RsrRa4Pglm1AYt2hDyajpGZba6eFXuscKnSz6pwYjW29P73TYenC7WbVzW30xonUm0gHpKJawyk03lkj749NN7VVknMXsAF0R7i0jakX61DxU9XddbTx9xgocgxvOCYsElIjz8nlyPhJXIUk7zubAm/locqODeGV0hC/TNJ3p+OcgecC5ZKmaAVcOe7L/coCxaNm9ttFwePhSTHQyq8M3eBPSLR/B1X8kBaFXIk592mpPge4fpG48romUIvMiCM8EHG2OdhKwa67bSS7QXlKfqj0crpRalJ8h5QNGX3Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yw2ena/XP2tlzURslaoK7HTdPAMCVf6O1iSC4Er5MPY=;
 b=YTJwoGzSQSN0mZLvtiHe/lXVk7BJ7EhAKgEyF3g3wMnBhwVViPbqa3Iv4ie6AcOggXu6rU5uGdjOO0H43jyIrFo/JNujVYdgJchzAaIUjDDCqIvoqHI4H9fIVZhoBHc/DEvmbODQ6p8ofyoiBJgECnVpQOHiV5RU1YfAC1koie55Uh2gPOQhzPCdKLmfKfyfJDZa2UMzNvIzCN/RacmBWm1awFbb7koxZM1CWrg+EHZtqLyx2eKu7nbJhegqZCiqWsmSZNkDpDzA8V0t8llWalgFUrCw4dzU9gyjcQCj2IlavYQJRlqvOAKV0p+43wOWJ+J76YNkw6Qe3fPAYQWWwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yw2ena/XP2tlzURslaoK7HTdPAMCVf6O1iSC4Er5MPY=;
 b=FZIzmlBz7cBIcR5aIur2RgYnfbpjQqJ+OPrObdaSwaYlCaZGiIRJd3bC6tB5ATKQlNJ6bLU+spm4HUOBzz31++TbYhNXtKIWOwdIIbhKRRpiV5/yFObxO4tQqbAZWvv1/1Fd8YZL+2JwPet05+KmBpi8PPct7FMn2xsBHJTPNgcXUJz6pSXu0C/1fbQQ+13j03Y3Xfpx3NNkM5Ww7UouaYUuXVi+PrYFMPkEDIBqMs8b21kPRuR7WhO4SwkCKRabfEhUpF3shHkg/zHraFYfPZ2K00PWqK0+zBbjKz7J1oFYIwNdUHDS+Zu8w/thdE24gNiBeEylnsotZaiwjFPrOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <01d2ca0b-2212-1d46-cc4d-60f5f11268fd@suse.com>
Date: Tue, 16 Aug 2022 14:52:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [XEN PATCH] MAINTAINERS: CC Anthony on Xen's build system changes
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220816110340.35453-1-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220816110340.35453-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bfa63af6-c069-400e-d962-08da7f8628e4
X-MS-TrafficTypeDiagnostic: HE1PR0402MB2890:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gDJDMyVZt9RRTSVZSYcB9mPkj78dgQdd9FVT1kVTS39RxZAsJCMiQZW8DOtDHPt/j6d4UgPgeGYyu7azuzsr9w7m2co1u/6WT9XKhtiVN74nrrcy0KHbHVD9RISmVrraD2sBkcmuRsV8bh5ZqStiaKecre+7GU/1RQ6sHToIMJSWe3ZqLHC1GO2WfTuQYiNl5AZmwLHtKejHEp10+9FEiew5NkTo4rYhe8JY0d+voRDf5yTJADxZLzKKCVWPr3sjD4rDhA2pPTC3Sjupbr7TrFPpklG5FTGqj8SOM7UoUqwvM/05+g1ZCVV9YOGtq3we2j6/zJASr3vh1qB2Vny80ih3TWpos7OzpaHdyjanb2guRgM8jtNctuUo20pmyO9FvoOux3F1pDXBjtGBr/VMwHwfVKN64s3p7YVXTUvJZ52Ap//DmNXl+lsU6i7TIVAvFjth88y7pxc8ighTcala7eVWO6ZE+E4wF98fdrp6DQ4iAYMoW7wkPNqKElR5hSb2dnHDhGzeiPW04EHkFvWTs8jLsr65d3rjxv0OZ+d0n0qCnig+qXcE442cSqB2ULCz0h6+mGAtETyEQwAW8GfxD0es+xMRNKUaCzKZ7IniB2GSWS7oG8NL6vunbl5MQ1fSFtsTvbP5gesJq/CZdk1FTa4w+06/27HG3CjPN6aNUppvnNAI3C6wPrJutwG6r3wfeM8BOZCb8uNmJOno7JykLG6aZlYWbqJkQA+bmNZPiUVI05ONgcg1axEyd94/Wpz59rOeKyFI+hdcCXxohNZdqV4FqSRYGBeGjxiBxCKPAupQu2OicMnYlkLI3KTXT+9W6nbP4yeow4kDeWaF3aXc9g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(136003)(39860400002)(366004)(396003)(376002)(53546011)(316002)(4326008)(38100700002)(66556008)(8676002)(6916009)(478600001)(31686004)(66946007)(36756003)(54906003)(6486002)(31696002)(2906002)(86362001)(26005)(5660300002)(8936002)(6512007)(6506007)(2616005)(41300700001)(66476007)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q281MFBYblIrVFlZMDk3THBlWUxMMjFZN0FuYUk1SCtFSGhlNEFuYlVMS2tP?=
 =?utf-8?B?Mk5FQ2kwRGY3RmNRVjFPZy9yUXUyZkN6SUI2K1krc3R2VDlZeDFVa3ZjL2Ns?=
 =?utf-8?B?bTdtVFVhdmVuSDlIMzhKNTMxU3A4MzJKT1NxNmVtRm9VUnFBVTBKRkJFcThM?=
 =?utf-8?B?WlVxbmVRcDVKQ0FyNXE4cm9qYzQraGhxclJjK1VtQkkzd2RQNWJhdzRHVGRK?=
 =?utf-8?B?Yzh2NEh6a2duUjdqbzd1aWFEMGdzQm5LWnlrc2hoaEdXNEJTWDJzc2E3QU5Y?=
 =?utf-8?B?cHlCSUNSbnN0QkZMeFRUTXB2aUhDVUdZcVJkaVNycElERThpUXBxTWdRRnFy?=
 =?utf-8?B?aFV6R2l1emgybjZvZERGcFl5bFdFWkl5dXNNZlh1MmhsTTlHQWsxSUExU0FC?=
 =?utf-8?B?dGhFczBkWjI3emVQSnUrVDhVbnhZUVBXRVBaVzNTQWgyRzBNQlk1MFd0QXgy?=
 =?utf-8?B?SUhxc3JPNlYwdVpTMGFHYUtVditRNmY4SUxlNG5zd2k5S0J5cFdZWk9relRQ?=
 =?utf-8?B?MDVuNU9Yczd3K1dEZWFtVjhsRkpXNXBQS0lWNjNZbWZ6a0FMYnVmREJySGVJ?=
 =?utf-8?B?OE53YUlwaENPWmVwbW8xOVdQc2lmd3hDRzdFVStNcnUwL21YZkZMV3YzZVd6?=
 =?utf-8?B?TlIvc1dNcDA2VGFoMGcxcTJFSkgxRHpiWTBBdnk4Qk16TjVLa3ppSHRnR2FT?=
 =?utf-8?B?SDZ6QTVvSmE5TlRPblJLTjhkbmh1QktOaEIwN3FQWjE4RHJhSVJOYWFoMXky?=
 =?utf-8?B?TWFMMTBPNWQ1aFU0ZVNLazNQRjBMVkgvTE9GT1E0anBES0RtOXF1c09lZUlQ?=
 =?utf-8?B?SlpWUFFPUUp1eldienovZlI1dmp4MUk4cGZOKzRvdjNsNWdja2VBbW1UNkc1?=
 =?utf-8?B?Q0VMYm9pVlpRN0ZlK3VhYVNrMS9xdXNsejhOZXlSQVN0c0dyTWxsKzI2VC9Y?=
 =?utf-8?B?WE83WWFSMS9nQno1UHJwaHlFQmdoKzUvWGs0VXNWNmFLWkJwTTJXWXU1VVo3?=
 =?utf-8?B?ZHNmY2RzcVRWUGZQb0pVSGcreGZLWkQrZWY2TWUvTVp4aHQyTUpFcTFHMzRr?=
 =?utf-8?B?cnhnT2NnbU9lVjkyTmlNTDVnc0t3WmNwYXVHeisxODdNZC9OcHppR1BGaUdC?=
 =?utf-8?B?YlExakxibXg1YktwVXowclY5UkFQT09TNCtiOVYzWUREQTZHeTdOQUZwemNv?=
 =?utf-8?B?TUo2SCs5aXVaWUpIU3NUVkEwWGFYRitLc1dlWlNVN0hlaXRsbXAzQnFOSUg2?=
 =?utf-8?B?MWFMd09WYVc5ZW8zeENlLzczbWxZZHhoWElRVVpRQ1ZkOUpvZ0hrMHJwQnk2?=
 =?utf-8?B?cm0yQW5YbVVFVjhPUnhhSDVWRkRKOHZUK3BwdWVhc01ndEZEc09JUkFvTFg3?=
 =?utf-8?B?R0RIc0U0MUZjQzhnM1M2QU1ZY2JFdXpXa0JBUXNpVXhyV01iL1lqRmZCR3ll?=
 =?utf-8?B?TmVoR3Z6RHBlMkEvVnlUcUladXZMY0svQXY1azVQLzlNSnE2R2tQaVduYmt0?=
 =?utf-8?B?aUhSQVlKZnhSTWhoM0UwOFN5QmVJWmp5VG5zNFJtK0EwV1lyVDlpZnRiN3Nn?=
 =?utf-8?B?ZXJHb0JnS3I4SGsrQ1RocmxDM3NWS0ZQdzBTOUtSbUN2U2VKUW1YR1ZoSlRF?=
 =?utf-8?B?SWdvai9iaWJCamxHRDY2RmlSWUJlWGNDOUFiNGdYUENvUGl1NDJVYkNLOEta?=
 =?utf-8?B?eDRycklESEJDZ3dzU2ZraklxeW5GT0hUaFhFRVlNYUc5WEFMRURyVWRlcUtY?=
 =?utf-8?B?MFFJNWg2cDVDNnUrYkhiZjdtRnVaV1JrbFJpelBiMGoxNlJybnhVU3VlOHd2?=
 =?utf-8?B?T0hZMU1aU2wvWDZjQVltdVQ2bytWaVhhUkxEeElYNC9xTUlleHB2Y2FzbmpH?=
 =?utf-8?B?NG1MYWlCUlpNK0EyenVHc1JxYjJLd3R2bXZhcVBLM2xXMVNLQzRwNmV2Mkc4?=
 =?utf-8?B?azB4Y1lRMGluN0twVXFRcGJndEFCdkVyL0dGVS9MVEI4aGFUY1BFMU9kKzBK?=
 =?utf-8?B?aGcvbEUvVFBLdlhyY1VlV0ozSTJoR0Q3MDZkaEM2QXB2MDBPaW9zTVkyZ2pp?=
 =?utf-8?B?TnZYd0loTHZGYjgyVzdXb3VlajFRMjlrc1oxcE1MalBIcnpuK3loY1ViSHVG?=
 =?utf-8?Q?uXTCCA30w/EZD0IdaeUOTPm5X?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfa63af6-c069-400e-d962-08da7f8628e4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2022 12:52:21.6184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QDu/TOMS0Sv/29OeZZgVkskYGIB6jAClf6OTqIUOZr2GUd9JloORugjZ9o/W+S4LtTMc37El2kiyww9cIQcttw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB2890

On 16.08.2022 13:03, Anthony PERARD wrote:
> I'd like to keep an eye on any changes in the Makefiles, to avoid
> further break of the build system.
> 
> With this entries, it means that THE REST will not be CCed anymore for
> changes in
> - xen/Makefile
> - xen/*.mk
> - xen/scripts/Kbuild.include
> - xen/scripts/Makefile.*
> This could be an issue.
> 
> Most other files are also listed in other sections so would have a
> maintainer. There's probably a few Makefiles in subdirectory that
> would have CC THE REST but won't with this new section.

Ideally the script would still pick REST if there's no M: entry;
I have no idea whether that's already the case.

> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -260,6 +260,20 @@ M:	Rahul Singh <rahul.singh@arm.com>
>  S:	Supported
>  F:	xen/drivers/passthrough/arm/smmu-v3.c
>  
> +BUILD SYSTEM XEN
> +R:	Anthony PERARD <anthony.perard@citrix.com>
> +S:	Supported
> +F:	xen/Makefile
> +F:	xen/*.mk
> +F:	xen/scripts/Kbuild.include
> +F:	xen/scripts/Makefile.*
> +F:	xen/common/efi/efi-common.mk
> +F:	xen/arch/*/*.mk
> +F:	xen/*/Makefile
> +F:	xen/*/*/Makefile
> +F:	xen/*/*/*/Makefile
> +F:	xen/*/*/*/*/Makefile

I'm curious what the sorting criteria (if any) was for the individual
F: lines. And I guess the last four lines can't really be collapsed
into xen/**/Makefile ...

Jan

