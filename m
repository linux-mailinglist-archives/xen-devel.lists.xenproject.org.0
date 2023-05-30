Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AC5715C41
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 12:51:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541090.843453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3wwL-0008VY-Ur; Tue, 30 May 2023 10:50:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541090.843453; Tue, 30 May 2023 10:50:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3wwL-0008SV-S0; Tue, 30 May 2023 10:50:57 +0000
Received: by outflank-mailman (input) for mailman id 541090;
 Tue, 30 May 2023 10:50:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8LP9=BT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q3wwL-0008SP-5c
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 10:50:57 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20616.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da53ff02-fed7-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 12:50:56 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB9208.eurprd04.prod.outlook.com (2603:10a6:20b:44f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 10:50:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 10:50:53 +0000
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
X-Inumbo-ID: da53ff02-fed7-11ed-b231-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wz7VPzYse55yDRSIc65PzCR0DPlG2sD3JBE809PEEVjQOl7tD7I9FlgvY+ayPXWAwInUpctZ/GrSnjXa1lZ71RK3zcK0wY2TIiEN1HaItz1ulrRvi928SC5rpBeOoXKzCBNDB1RG/lFbwiWKf9X37qIZJTm/5JnuZIMSB6Qh6hn7p44FoFu6EtlJrWrTM/QWkDwKs1Rn6zwLr/4cc2mLwrqxu9xo9GoT1CcdSprdBKcPZrqhQFQRVolb3+Ur2p8M7Ao9u2kONUMXLZqdtuPA73ctyO67DzWVmxh1AI2pdwGFIphXTv/ErBQ1KspksQRgDQBxLRRjiP/7Qz/8jOtp6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CYVJoW2V+TtYrmw6ENM+NmRnA5VEBxjnlnPzOjcoZIc=;
 b=h6TvcC5dCnJSro5vVGADrqQd7wEAM7KWRfKGYIN2LOUOVXNE8UYGICbYp3WJiKn0+tRdC5ZBfzsYpiuJo8+RtK3T9IMhW5xQWWtJJfkx7d2/h6oj5PXEissO5dvQOo2VR47hMEvnqqI6MpWyHwRPP9VQ0sHUwAksZHGHgwY7NJKjIxE3ZKQMgFSflDP0987GA0GlUF/JGFhl51UfAQKWir72fi0cP7Gp/fCMieqtfDblGIzb6cAk8TdgqQJCkJAvW3bcZJDcz5a06kn2Ow2UphsYZuk8beVWLEDzQD6F5cMtSirLTlIQoZX60hwkeQD2o0y1ED1iwwe2cmeezF5uUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CYVJoW2V+TtYrmw6ENM+NmRnA5VEBxjnlnPzOjcoZIc=;
 b=cxdF+TmiLS+sNBkdmfze1FrGT4BTPrmGBz2lSmH2NpS9+vztN5xiiD7g8VaFdCONURnTiGU/AriPG9khjs6Zw5y0dFUAz9cFy08nNfrpSxRyRO5RHnglM8cQcqAiWyO6K1ccDCdE1bWRuxT7a1yJvZLutSjX08PG6xnKvKaIsldJE4IYruEFQea/fMfRHAS2l1XLNvMem/t4XMm05woPJNR+Vbglvplyp7WGoo15Dbxi/mJewA/xwTi5q8jtTyCyHBSjAa+P0zOttAXDJqk5zW2aZgV7ROTfXI/48I34yHVIwGZfkhJiN3WndwbHSVWQoVvmdOwJkeTeIL44Telc4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a9c391ab-ce82-f368-3802-6776c269668b@suse.com>
Date: Tue, 30 May 2023 12:50:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [XEN PATCH 15/15] build: remove Config.mk include from Rules.mk
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230523163811.30792-1-anthony.perard@citrix.com>
 <20230523163811.30792-16-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230523163811.30792-16-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0013.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::23)
 To VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB9208:EE_
X-MS-Office365-Filtering-Correlation-Id: 22c57d62-6e26-4e3f-b77f-08db60fbbd56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FGBzEZZoD5hSzwCmlgzIp6D5ZFjL9BeMaEb8yHFpOMydlRs1EXZy9Pf3XzYIBhZtwcMK8JHu4a4M/z4EJVvNZsmSOju/IgC+GxoPehBpbSA3KD/RzqQCzivdIBgKgKCosWc+MveYsuqh7kwpZCoVae3QcmavO+N8YaZMyg5oFzLji72glQS64tWBK2ErgN89Gft5sygTGC1cA/mtus3m0PJbK7CYw3qsWRjNbNsrkZ8BFX9yaSoqQX3vJ7R6E10VGbu+alL+Tb6DRzq8swAXdF07Cv1ZzvTybB3dDBQT9blSB2FFWH+IsidWPiWLHJYwEWwTNoktQTWsuhrQwPFN70ujfTnUE4Wi5wd+dkF9PH5TXYxZSzziabQbBAWRd+1fOXS6e+z5NspU/fTk1lr1OOnJl6vmf2pW13+Z1cUOf0ZNGqlYfkeZMf+Qj1+2uG1JwowwkCMqcWHdTZh6XSiaw/HDYvvL4cIOzQgWfFiiRcL2b8t9/6/h8DMTuGjR6hSIi/8NRWQJ6kItbPZn9QWPn7HIihcMYtiVLBSJUrRPpk8nnf2lRP7JpKbM/yKtrMKNOWsjsnHp3GxUQPHQ7/S3aWrwVQzuCRziZDAnc4FmGmpGuCFNTbUGVEnqatCDRLCaoG91qfQPb7IEWWfBh+ao4Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(39860400002)(366004)(136003)(346002)(451199021)(478600001)(54906003)(8676002)(8936002)(5660300002)(2906002)(36756003)(31696002)(86362001)(66556008)(66946007)(4326008)(6916009)(66476007)(316002)(38100700002)(41300700001)(26005)(83380400001)(31686004)(6506007)(186003)(53546011)(6512007)(2616005)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFA5Nlc5d0tNOXBnZnIwTndIdXRHM01oRVhmZ2pSQmJDM3hJd1ZwNkFWVGx6?=
 =?utf-8?B?aEgrQU1jdU54YXYwNVhhTEQrUzZPNU5GY2pBdllOYkJDZS9WMVRWL0p6M2oy?=
 =?utf-8?B?K1c4SldYdlBPNXFBWGJQN0dxbXhaR0dMWVRXUEtsUjBpK0dqYkJUTTNJbmxF?=
 =?utf-8?B?ZGJyMUEwb2RUQ1F1dXlVQXQ4VkFhZjUvV2luZUp0blVDNjNZaGg0aHdJOU05?=
 =?utf-8?B?ZHd4aVExeWVSVGpYc3JhK2xDQ3lvdE9MeDJuQWRrVjljVmo4L0NsQlpHeGlF?=
 =?utf-8?B?aDhXUTZSSkxvdUFlNFVUUUlMODE2c2NrVHlVUUorcit5YjRUMTdYSWkrbE82?=
 =?utf-8?B?QmFINFJaR2NsRzJjM0ZGbzNuMlZaZkdTWDVCMHFvWHR4aEJmdk0vZFF3blo5?=
 =?utf-8?B?dkh3SFFMUjBDb2FUM1JSYzlEcWdwOVU0Q3Q2UzdoSDFTcXFRL05qajhlOHNx?=
 =?utf-8?B?WURCTzNHd0xxTmorRE1tV1lSTFNBUlhheEF0dHFiZ3ZZMDFCSjhPZ2tEVmxp?=
 =?utf-8?B?QjY3YWlqazhIRU9jbFQ5d3RjbVJtdG1sVXQzei8raldzeDJJUGFoeGl5S0ll?=
 =?utf-8?B?U2Q3QXVPdnRyY3piak43eHNmcGJhTGNNNlBtMmpKcU1WYnAyVjV5TFNBME1n?=
 =?utf-8?B?d3h4V0lPSldKTmZoNjBzMjlabzNabjROdVVLbXY1Wkg2Vm14bVY0K2lUWUFp?=
 =?utf-8?B?T0NvbnAxeG53dERWVTA4Slh6OU1ZaTdoeXVXdkZXLzJaU3c2dDAzelZvNUxp?=
 =?utf-8?B?TldZREZtaE1PcWJ3K0xOMmpRL2FZV21aa0RLdmFaTk1XcDBxVlBJYytvMks4?=
 =?utf-8?B?c0lXbTIzS05jQ2I5YStoc1dzN2IwODV5eFhJNGRscVo3SlFwTGphUXV5ckN1?=
 =?utf-8?B?OTduN0o0WDdKWllPMTNOT2RwYUt2SDJ2bmorT09Oc01sbE9HcStMbGRnR3hp?=
 =?utf-8?B?MGFLaVpweElycmJkeEQwV2d0MVVYQjVRWG5uUDUyTjNoS2ZONXlDNjdOVkZk?=
 =?utf-8?B?NmhQYTJydjlPa0J1L0Q5eC9INEpCMTNSaEI4ZUU1MFNSRVM3cmQ0Vm1qTk5B?=
 =?utf-8?B?VUZUeUNQTFY2c0tPZEIxSE1vTzN3VWR5ZTlVcFhvUVZIYWliTWR0VXJKNC9P?=
 =?utf-8?B?c2UveDZXQXJ3Wk5RM1FwOWNLaXZlazdNVjhJQ0l0Y05pWDQ1aGNkSDBVMm1v?=
 =?utf-8?B?V3pRTTNHSTdvckdtbGoxYUNUMFIySWFoeExWUWo1SW13cFV6bTBMZENpN1Zr?=
 =?utf-8?B?RGM5aU8zdlpHUDNDUWlhRzJhcWRVenpVdkRGZVFWRkFHVS9ROU5DcmxQRGNk?=
 =?utf-8?B?SE9XUHpQWmxNL3ArMVcxVHFlT0RLT3NFRkRtd3hlM3M4NmEvaHRwRU1ORVAz?=
 =?utf-8?B?emZrUHNudElpMXNNQ2JhQWdiaDlOc3k0MXp3ZFlqZHlKbldaMGZKbFpWNVBr?=
 =?utf-8?B?ajRCK1JQVEd3NmNVaXBkZjNkcTlCWGtsaVNEcFRxYUZoa3N3alg2RTZlZWl4?=
 =?utf-8?B?YzF6UlpYYjVOb002emZ3S1dxYjhSOHdmaFU1N0E5TWh4YytkNG9kR2Ftd1o0?=
 =?utf-8?B?bFJNWmpqbHlUVVdNZXpCRFdTNjBCaUQ0dDJmK1hYNTdQaHhpUis1US93dHRo?=
 =?utf-8?B?WGxZOUtBbnI4UHNTMmw4STdORG5oTStkYzlGZlpmVXgrL3l0U3ozSm1hcXI1?=
 =?utf-8?B?SXpWSE1kM201dFdjZXg0Q1pvamdYMm1TVDNIU2lQY2doTjB6S1poWmx2dDVv?=
 =?utf-8?B?dHRmMmJHOW4yaFZOdlorSEc2TnZsVlRiZjdiVGI3RVlZQjFJNFMvYzBvM3Ju?=
 =?utf-8?B?OUgrMmZPU1ZKeVJ2NWU3TThEOFU0QUFHeHJWVGxNcG8zcmZMeDhRTEttaER4?=
 =?utf-8?B?L29xTURSYnZUSytobmVCc2ljNVVURW5mb0Y4bWprbzVTTTd5RWd4dmZHQjNC?=
 =?utf-8?B?U2dLZnFsSXBUR3F4RUVmWUlEeEM2dnlXUkp0aDlnYURRVHZZQnNmbTBFTTJ4?=
 =?utf-8?B?K3ErZmRubGFhRTM3alRSVXIvcHE0S2wzTFlFSUZ1VHQ1dmFndjEwdzVQQ3Jt?=
 =?utf-8?B?TnFrblVSSUF0V1BreFFaeEZudVVvelM2dE1tT3BqeThhQzM0OEFQcmMvaEdv?=
 =?utf-8?Q?otr83f/o42JNNsg8+C/ZeZfJl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22c57d62-6e26-4e3f-b77f-08db60fbbd56
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 10:50:53.4388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HNDOwhasrBGXtC74k7lJSRFgUs8OZN2ftnBshyX/I4OqPqd1KHZuPTAnmnh5jShiqQfZkrlKozVvC7+fMr4CbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9208

On 23.05.2023 18:38, Anthony PERARD wrote:
> Everything needed to build the hypervisor should already be configured
> by "xen/Makefile", thus Config.mk shouldn't be needed.

"... by xen/Rules.mk." (Or else it sounds as if yo're removing its use
altogether.)

> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -246,10 +246,14 @@ export TARGET_ARCH     := $(shell echo $(XEN_TARGET_ARCH) | \
>                              sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g' \
>                                  -e s'/riscv.*/riscv/g')
>  
> +export XEN_COMPILE_ARCH XEN_TARGET_ARCH
>  export CONFIG_SHELL := $(SHELL)
>  export CC CXX LD NM OBJCOPY OBJDUMP ADDR2LINE
> +export CPP AR

For these two, could I talk you into editing the earlier line instead
of adding a new one?

> --- a/xen/scripts/Kbuild.include
> +++ b/xen/scripts/Kbuild.include
> @@ -8,6 +8,13 @@ empty   :=
>  space   := $(empty) $(empty)
>  space_escape := _-_SPACE_-_
>  pound   := \#
> +comma   := ,
> +open    := (
> +close   := )
> +
> +# fallbacks for GNU Make older than 3.81
> +realpath = $(wildcard $(foreach file,$(1),$(shell cd -P $(dir $(file)) && echo "$$PWD/$(notdir $(file))")))
> +or       = $(if $(strip $(1)),$(1),$(if $(strip $(2)),$(2),$(if $(strip $(3)),$(3),$(if $(strip $(4)),$(4)))))
>  
>  ###
>  # Name of target with a '.' as filename prefix. foo/bar.o => foo/.bar.o

As long as they're the same, the collision with Config.mk's will be
benign (for xen/Makefile), but I wonder whether, along the lines of
the earlier patch, these wouldn't better be extracted into e.g.
config/fallbacks.mk. (Whether the single-character macros are also
extracted into somewhere is of less importance to me, at least right
now.)

Jan

