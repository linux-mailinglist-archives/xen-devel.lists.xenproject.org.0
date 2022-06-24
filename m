Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E92B95596F4
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 11:45:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355399.583040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4frx-0004l8-BA; Fri, 24 Jun 2022 09:44:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355399.583040; Fri, 24 Jun 2022 09:44:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4frx-0004hl-8B; Fri, 24 Jun 2022 09:44:53 +0000
Received: by outflank-mailman (input) for mailman id 355399;
 Fri, 24 Jun 2022 09:44:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Tt/v=W7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o4frv-0004hf-C8
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 09:44:51 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80089.outbound.protection.outlook.com [40.107.8.89])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b4fcd9b-f3a2-11ec-bd2d-47488cf2e6aa;
 Fri, 24 Jun 2022 11:44:39 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8294.eurprd04.prod.outlook.com (2603:10a6:20b:3f7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Fri, 24 Jun
 2022 09:43:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5353.022; Fri, 24 Jun 2022
 09:43:55 +0000
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
X-Inumbo-ID: 2b4fcd9b-f3a2-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LRJpMQKZy4KzOYsdMOXdKsLBqjzhBdpHLWoklYDpczn74yqtgAvyux1fEPas3CdtGZpGoB4a9IQTHzqsHSKL54kPGw5WKxmCPKIsnyb27NoE3XoyvYNvEvSJNXeAVJDmnZQXAA/nMGakdIdUI3x+66SvJGaK7jO5I4OWtv8S8VG+KIJXRGIQ5RNIfQyDg66XxI911llUN1BWemex3ufDgJg5Ut7tUOzP5NGQADGyar6sOdO8xOipitd2r7tXunWDGtusGQwY7Ly7UnnDcyBpDPQ4Evtvn8sJUHuJ0BC+nXJS4GpxXcccvY+NQtPKGZmr5GGu/yJ+BtsvnGQZ1jGDDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wwaVRJ85vdouC/gV2Ca8NE5VHgEtpXwjIR8aFaYvWvk=;
 b=CQw8fKB5PuM7K0tRs+8vDOFGMwNvYFgwTuwNtts4dARWkuedKRRuc0SxEXUBgUmrvVmiduqQBc0pV6C5e/fIxlqD7uOle0VZ/4W9S+G3Hlnm2wHBQBvfiZSuUnzDGWF6AqgCWxd4uv8iD1Y2jhNy24GezjldKjim8ProQi0m3loC2PcR60LfBypul1lwOQLU3NEbaSqQzVToOkk49cs+ERpfn+RCDe/beidj9zNEZlf8RVJnORC4TIYCVFrWsAV/vHrHoPSX7sFIq/dEgTOxIQxIkySwwj66E38W2omTlkfjAioHhkvRbLDD6ewVnyLsUV/bc3bizreSEhhzVzGFLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwaVRJ85vdouC/gV2Ca8NE5VHgEtpXwjIR8aFaYvWvk=;
 b=uo7AK1RrCkQO8lJ3ewr5WP/QIg1uwCzIE7udTN17f8Qi07H844lr25MvDkZD/wfh6gpEJK/F0akgkIPmnkj/zRCOYM7lpULPLuroBwKoRdAddbIrHY5dWccYuKObI9b7iGbbOXidwErVmV01M/EoswhEUnmhfU+46NkVwzz4ZYHgsQZ+htflkByxLvtzzZdRX3lelJ/z4SeiKbjnrgT+1YgttTXS1EJXSFhX+lhsm23GrRNIX0B1M+Cc/ek9Kaymq4dbo/xieRIYrt/Mm7qw6BcIqrha1v+WKQ+NREOwZpqDk3BNkhQOCBZYjGejQcskC54Q4jIBZhKQCQGZTPByLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c46469ef-6f42-621c-ef4c-3e1e5d6bb0cd@suse.com>
Date: Fri, 24 Jun 2022 11:43:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 6/7] xen/arm: mm: Move domain_{,un}map_* helpers in a
 separate file
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220624091146.35716-1-julien@xen.org>
 <20220624091146.35716-7-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220624091146.35716-7-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR04CA0009.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 908e0daf-c975-482b-f5a7-08da55c60e2a
X-MS-TrafficTypeDiagnostic: AS8PR04MB8294:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VSR6Ezmrae/nDvmfzCE3TWX/QrYyNI+X/uXffqn9z7b8lg3xSrjGBb+uTA3zFQXPnVc8UBj+gPANfbSF6IFtmvUU8fpB+ovnYqH/NcQDSuMPa2iadp8Jptl0TZw5CBUc1dzRR5fe4aqpSFL3/Lh9p1T7dgoo69Fs2IyNdGXM3cXd9x8tGAxIf7SqBqvIX1niqTyGWesby9QfMRMk3m7yr1GLUraI/93sboBb2tOFVBYfR1wVmu9EQ991ep2f7pjK+y//3IKgMOYUPUsZyRQbFAPcmkW8MbsfvO+jDrA8GrugqaYwisj3SEQ4LDXCz+B5umTCygNdoUQshRltnzbOC9fJlsQWpeI438Z8EianWSAKIJAnIjc2GkjkGVfiBAZYjIJoG6DkFGcDwo78/4nNOkIfHHNB9j914e7+WWtWOJvmdptRcK/xG2P7CevdOKojfTaLYn9fV7xvlV9ua6/efV78QbOctnIkt2F+Hwre6aVYb98r9rqF9X+LlCrEniGsZf4erE+FnFRz91+nD8NfB2cRw3KPIowdroVVduXes8kbj5hdTx/veaRNBuNjtE6b6acFPI935k0dbAICX/pdZDvLtuTHL6iQQ+23iyqAt71+sJFs4ObASW4jbvNggB8brhEYLsCILjMsF9JgII/a/0zgclvVPucrTd279nbk86PAdaFYxmBJ7g5k3QK8hVqDj05uin97FTK6lUVW1jsMXSq6/HxTJAWGdbYmMuUA3c7YrniIKy/3nbnOjK4ZSXuckm63SZMr/lE8GgvZ2wKyQ5DEBeqOC7moiElW6RH+U8xSzUeZPr1eiud8lKxdJdLNnPOYLHx7MZyYu9/6bTnU9w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(39860400002)(376002)(136003)(346002)(8676002)(66946007)(66476007)(66556008)(2616005)(6916009)(31696002)(5660300002)(86362001)(186003)(7416002)(54906003)(4326008)(8936002)(6506007)(53546011)(38100700002)(31686004)(83380400001)(6512007)(36756003)(26005)(41300700001)(2906002)(6486002)(478600001)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L1p1dEhFTnV3YU9aWWJFKzh6czRrUVhvbTMyaXdHZlFHeCtPbDZ2c0JsU0p6?=
 =?utf-8?B?eGszK2RSQWhwNFdHbGFYdGg3Z29DNDgxUDhXQlFDUFZmSnd2WVE2L0xRQTVx?=
 =?utf-8?B?dHJ6eE8vU3hoRWl4a3VuQk9lcWJPeEZnUHNQRzArQXpIaVFhZkhFZjNabzNa?=
 =?utf-8?B?MDg3L3ZrK0ZRZ09jU2xIaHRmU3pJUzZJZTVoZkpCc29CaWJEWFoxRGpLemlB?=
 =?utf-8?B?TC8vajU5b0FWQThyRTlXUTJXdHF0VHQvZ3RESW0wR2Vxalc4ZUxETTJiUHhV?=
 =?utf-8?B?Y0dlVjFTTzBLU2IxQTdHdzNacXZlS1BkYkNYQzlTSkRpbEhHQStaSUpmK3R2?=
 =?utf-8?B?dnVwUm5GU09sc1ZYQ243bEZRQ29lMEhqSE11YVBVRlFrUGRpaTZBSXRROG5R?=
 =?utf-8?B?UytXQkVZVnZYU0N5UzNwTE1UU09RSEg4WGdoT2ZaNTM1bmo2NC80NXJ5T09H?=
 =?utf-8?B?M21LOU0wMHlEZEFmM1NZVnZVbzMzUkZrQnFrMWRsejlmb2ZaMWxYNDJLdnVu?=
 =?utf-8?B?cENvTUdHQjQvczZWeGc0bGd6WVJBeUorUGxQdWNlOFFZR2JNUUkwMlMvcnVs?=
 =?utf-8?B?V04wL3dSMGRyMU4zTnFLQk9KZTRFczVjL0YzRTVzaFdMQ0RLaHlPVXpITkha?=
 =?utf-8?B?YnpmbmkvMWE4YWtJYUViSGVEMFJGWTdPSy9RR1BSN1lKbUhXdncyZjd2ZWNp?=
 =?utf-8?B?WDJUNzB1SE1ObmVNQ3hrQ08vL3Bjb0hRVS9lN290ek9kUXFPc2h4Wkl2TENj?=
 =?utf-8?B?SWZGSDF6WnFySGhDS0lmLzhZUnNrcGxIR0NOSzdaemhjSkNUVEJVc1EvdEti?=
 =?utf-8?B?dEJVczNhN0Q5QWFKVzB3RGxUT3Q3NmJyaFd4VG5VdlJ1V2hqdVIwRzA2VjZL?=
 =?utf-8?B?RUtIVDFPLzUzZkhYSmYvVWxGNkpvdUZSdnhqU2h0MDZLRi8zdExMN2d2M2U5?=
 =?utf-8?B?cXBGMVN2VlpFV1gycndnSmd5b2dCaEl6SURGK3pKcG5wUjJPalBBUFh3L2ZV?=
 =?utf-8?B?TmlxOEo4VWxrVXZ5Y0xpYmdnRit5VER3Tmdyd2xzcVJrWlBxUk1kZDFMaWVF?=
 =?utf-8?B?MVZjbDNLNE9CWkdkNjlyRVBBRE1pK2tqblJVOXBTVm8waHJuR09aU3RzcDlV?=
 =?utf-8?B?OWRDN2dqNm5nRG9kMGgxTzRiVDJPZHd1TW1wajAxTmwxdEZReGtmQm42dUdK?=
 =?utf-8?B?RXdmL1V6c0IwdVIyNkF3UlNHWnMyUG53R0VHWTFtRHJOM2lwa0Nsc3d3ellX?=
 =?utf-8?B?UElHWmxFT05lbGM5d016b2N5RUVNandUaVBYYWowbnZ5UXAxNjBIbUFGVFFC?=
 =?utf-8?B?Qm5tcW5WZWxBUktUWW9YRjFCOThoMGxHYUlzMUt2S1A4dVlWTDR1Y055azRE?=
 =?utf-8?B?YlhuZncrZ3pXUUoxbS91QjhZai9IRzJwaUxJUlBvVUFpZmcxdWVvWDRUaG1w?=
 =?utf-8?B?dUFYTzRyd0pqOGVubkdTRHMzNFBxMFViUDl4bmEvZDNINnZzZml5VG5xb1VO?=
 =?utf-8?B?c0VMUWNVYk1zL05XSXY5bWZmWG83RUdLdkg3MHo0b3ZsclYwQmFTQTJ5RmUw?=
 =?utf-8?B?K014QmVrNUpYR0Y4Zjk3MjZCb3NuM3AxaGhWZ3loVUh1UHNvZlJuRGQ0OHBy?=
 =?utf-8?B?aEFOaVE2SnpMdEtSTXAyYjBWNTVsOEd6RXJQN3lGcWN5R1ZITnEyQmpSNFU2?=
 =?utf-8?B?VDc1anNXV2hCS1c5TnhvY1FGT1Q0WU9mV1ovMXFEYzNTTmRibHBnK0ZvdUNa?=
 =?utf-8?B?cndIZDM2YWUwa09qd1pTam5RamVxMFVOOWxHbnNtd1V4VjJSNWxGMzBhZnY1?=
 =?utf-8?B?TDdPUU96UmNvamQ1ek5jME9JekFMWEpsZksvYWVuQThiUmFBaE1ZblFzOFVD?=
 =?utf-8?B?NDVadFhPWUxPU0ZqQVpEM3o4djhzUlFZQU5XM3RBVHBBc0tqS1grbGNEZGlV?=
 =?utf-8?B?cmlLblYzOXRhTUZqTExVNXNHWHNQVUFBYTJEVlNMaEY4Q2tETU1RbVBwZE5S?=
 =?utf-8?B?bnhhaEMxL1BZQ2lYbmZQNFJweW03Rk9JTlhhNFFCbWtFemRoeHQrQTA2ajV2?=
 =?utf-8?B?ZW9tNC9xS1dVd2Y0Z1VZT3UzSW55Yjh0dEU4SUh6Zkt4Snc0NjdqdWpBZzBT?=
 =?utf-8?Q?348gZZIwVWKg3XAVuB3PVuuGk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 908e0daf-c975-482b-f5a7-08da55c60e2a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2022 09:43:55.7022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DA8cbGsMkFwcqgWWt5PCH6vTwjiLcOaq7KkaEaI8+uR2afuYvoRA6SzjOF0JTsZicb2njTYlSLtSP9PK8WKkUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8294

On 24.06.2022 11:11, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> The file xen/arch/mm.c has been growing quite a lot. It now contains
> various independent part of the MM subsytem.
> 
> One of them is the helpers to map/unmap a page when CONFIG_DOMAIN_PAGE
> (only used by arm32). Move them in a new file xen/arch/arm/domain_page.c.
> 
> In order to be able to use CONFIG_DOMAIN_PAGE in the Makefile, a new
> Kconfig option is introduced that is selected by x86 and arm32.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

In principle
Acked-by: Jan Beulich <jbeulich@suse.com>

But ...

> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -10,6 +10,7 @@ config X86
>  	select ALTERNATIVE_CALL
>  	select ARCH_SUPPORTS_INT128
>  	select CORE_PARKING
> +	select DOMAIN_PAGE
>  	select HAS_ALTERNATIVE
>  	select HAS_COMPAT
>  	select HAS_CPUFREQ
> diff --git a/xen/arch/x86/include/asm/config.h b/xen/arch/x86/include/asm/config.h
> index 07bcd158314b..fbc4bb3416bd 100644
> --- a/xen/arch/x86/include/asm/config.h
> +++ b/xen/arch/x86/include/asm/config.h
> @@ -22,7 +22,6 @@
>  #define CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS 1
>  #define CONFIG_DISCONTIGMEM 1
>  #define CONFIG_NUMA_EMU 1
> -#define CONFIG_DOMAIN_PAGE 1

... while I realize it has been named this way, I wonder whether ...

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -11,6 +11,9 @@ config COMPAT
>  config CORE_PARKING
>  	bool
>  
> +config DOMAIN_PAGE
> +	bool

... this isn't a good opportunity to make the name match what it is
about - MAP_DOMAIN_PAGE. See e.g. {clear,copy}_domain_page() which
aren't under this guard, and domain pages in general is a concept we
can't get away without in the first place.

Jan

