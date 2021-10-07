Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A745425533
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 16:18:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203635.358787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYUDJ-0004gg-9v; Thu, 07 Oct 2021 14:17:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203635.358787; Thu, 07 Oct 2021 14:17:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYUDJ-0004dZ-6i; Thu, 07 Oct 2021 14:17:37 +0000
Received: by outflank-mailman (input) for mailman id 203635;
 Thu, 07 Oct 2021 14:17:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qfpx=O3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mYUDI-0004dT-3u
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 14:17:36 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e03e6f4-d44d-4d61-b349-f007d8383b0a;
 Thu, 07 Oct 2021 14:17:35 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2051.outbound.protection.outlook.com [104.47.9.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-1-2STr7CtWO4CP8P1Dz0huKg-1;
 Thu, 07 Oct 2021 16:17:33 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3296.eurprd04.prod.outlook.com (2603:10a6:802:7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Thu, 7 Oct
 2021 14:17:31 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.020; Thu, 7 Oct 2021
 14:17:31 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR05CA0032.eurprd05.prod.outlook.com (2603:10a6:20b:2e::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Thu, 7 Oct 2021 14:17:29 +0000
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
X-Inumbo-ID: 0e03e6f4-d44d-4d61-b349-f007d8383b0a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633616254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xm3uB+uhp1nHeBTNBvh/sipFoncXa52J8/s1SQ6dXLs=;
	b=LJJMspOxLYDoSKBThQ3EWkRuhv5QpR2h3nmDKaqBZHOL/j1v7jxgJn/YALa3yMxJbbT4Rc
	wII34Bc1ybyv/q5AWz9EbEPyeRDmP1NHZXFB5zaDVXWrQ2ggu5Bs1aGG4IwvUnKk8po0at
	Gpit3kJqCXyg5XhSwA8SVmye+fu3wW8=
X-MC-Unique: 2STr7CtWO4CP8P1Dz0huKg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qd1wuRhdkQimvh9m/GYzZZ2XIb5oBuj0AUQmdNaGuDXGfpaGOSr5bR8rug6hxgeUWU1LTtZhKT1SuvMd/kGviI8DbFBfVLI/D/8s/WD3cGA4LxO3z/1RRP5QCINdvHTzOhc1WMuOYRF2FIPJC9z4QxCgDaCxFOVrKZItPm+Hj2oxhrVichNVykLtDV7f/UmFvDXTAd4bL0l1GMktezyY8Kk4fvXtTwHoeEPMN4t23JLPzKRMJtWG3n3u2ZE8v1y6MpPuCLkbGPuDT6BXhbUVk9RQsUovWjBWRKtkIo+01aHdp7s6CPmsyWiMBkxMZwB4CP+XrIZR65kJXz8XM+7Z0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xm3uB+uhp1nHeBTNBvh/sipFoncXa52J8/s1SQ6dXLs=;
 b=fG+Jiz5/78jmXNY57D87cPtCPn0ct1Ckkdo2gIv+5iQy6l75O0ICol8nmtEF3UrE5w4zjLnzcPqcmmZF8Jb2vqs7mA8N1NhHOKXORrCdjveflQjT6iVM/C+HlIk1yfKc9zAjtiFGOS0RP744Nwcdrv8kmcqc1R5hBr0Ps2caz8joaX4Dxh8ybQqNaV6RhfRGBqI4d+FhdzJK9ex/7lRs/33rNzZTCaBm2F46k7M+JhDY/ccLim04ThVxnfhcRGNf6Zt+Y46Ia/fBoYkk/2RhKGlxok5Nk0Kzeb9ZMKkpKynBtA8cajKgALB7/kmsaAcfMXLiGg73NjBa/Gwqzpkblw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 14/51] xen: move include/asm-* to
 arch/*/include/asm
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>,
 xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-15-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <320e5dde-2017-2420-8323-cbe4c2f0914f@suse.com>
Date: Thu, 7 Oct 2021 16:17:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210824105038.1257926-15-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR05CA0032.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::45) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dfb78ac7-69f3-4066-a92f-08d9899d334d
X-MS-TrafficTypeDiagnostic: VI1PR04MB3296:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB32963A3C3E7F1B14D4255F6FB3B19@VI1PR04MB3296.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1xqKugtQsTLgRsslICb5CUa4zyqGMYzMEoAf4hRrx+p2uegThFR658K5kDJfAXJ0zlQ/R/XgMp6opwjR59vM3nJxy7o16WdsI309YTTlPaVjJyIT0ZsrhIvmTBeHgNYcws2NtLpJHU3/XvC0XF2VdCP9lV6yraD2w6Z+By6nsAV3DuhvkJbz3DE3nhFmbL1KHxqnLdsw6+Lp4phOnGtzXKq9wNbucwCmh3UOZEykYirTYXz+oiG24xXzcR+LAddH+W+ak0bIeFQhJ9yZCovm78Iq1wdsaTiHTuCOdszT0S4ahWAYgTkbRN6QAeVx+oQb2jXLlk63/tpFUj5VOqO5ID+ApTp2cWAusCtB/doaZjtwwrkRJ7fKMYS3yD02UnvxU/rn0fF/a2TTwbWDxLEi1dKmfub0S7zNENIu5oRgNzHvrNZaxKNloZqIbCxb39YgLDyz+WQ+3WzFcYVdDFzjGLRDTtEDAd8kx0kdxxlT9brZpRWG3x7oLn9RfdJAs/3DfOaHInyqTnkQai/sEWdY6yUoqAPng9/j69hhGH8PwFf2t7iR4dq7q/yhFbcpKFhgrHkfvzu3po350EvVbasZP322mElo6bnqHX16MJi1RGdWwLBbPzRh5mN5p3Mfh0qc49tthH9OeUF26dD3dUCLMDftAf6J0cdUtbhSiXq2YBRIiv/1t73cUqdUmLCuAQWbXCtndY+i1SwLRCVDRvd3S5q1JZY4blS1B/3JoRMtseBDRB+pV5vU9SUvgX5x8j62
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(2906002)(16576012)(66946007)(956004)(8936002)(31696002)(66476007)(66556008)(4326008)(2616005)(508600001)(6486002)(54906003)(7416002)(86362001)(6916009)(26005)(38100700002)(31686004)(8676002)(5660300002)(186003)(53546011)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHFxVng3TFJxUWhlZlRRMVhVMTNMU2tReXlIZjlBSmZycE95V2ROWStyWXp4?=
 =?utf-8?B?cDZSY0JsdmxpcUJoWUxFNUhBOStLNklJTkdEMm9od2d0ZDRuN0lKN0tsWldv?=
 =?utf-8?B?VWJaSFdrV3JRUFNRaENGeEhkd1ovdUFmTHZ4cVFEMHRoSWJwVkZXQkhURXpy?=
 =?utf-8?B?cGpZUUNsemV1VktTczN3ZUp5MkRjSUlXM1ZXRkZ5b25wNlkxc1NheTNBYlhV?=
 =?utf-8?B?ZFR1eWhMRjhCQ2JEd3lJZ1l1ai9GM3dnWFR3Q1J4WTZadkVDa3JUTDhELzEx?=
 =?utf-8?B?VkxmYmErbVBGREhWSW1CQU5IKzBYajd1bzV2UzZ1SitlL1JFRW50bCtSWHd0?=
 =?utf-8?B?U2ZJUGM1TG9FU3JVWTFFWTdQNER0cmRiYjdlWitBZi9HVFFBTkhlNVErWlZh?=
 =?utf-8?B?bmFLb0NTK0NJOXljMEh3Q3VOem0wQjI5WEFvdU9Wa0lvVmdJRDJ0a3NYNXFa?=
 =?utf-8?B?NUh3SDg4MDJKODcrMUV6Y2R3K2FqdThrSUNhL2NxZ2xaa1JhaWszdXJtK2dm?=
 =?utf-8?B?Wkt3UWlrY29mZ3YyK0p0ZDlqaEYya3VZWUJWK2NHVzNTVFdaVjQ4ZDZZbTJK?=
 =?utf-8?B?L1BHWm1XY0N5TTkxQm03Ty9malc2dXN1dmNMc1J6bm5KaDRrWHdteUF0bkZ3?=
 =?utf-8?B?SS9BbjQzYlBqZnFDOHUxTmJjUGh3dkljWThGRWZhUEhxZFpDMXczRmkwc0pa?=
 =?utf-8?B?Yml2SmpWNERRcnA2OVFuRjVOcXBvakNtNm01cXQ0NVlzQTQxdVRrMXlyZDhG?=
 =?utf-8?B?T1Z0ZEtkRTVmaFd3NlJJelRRMWYvZHlNQm5nNzV0SVhFeU93eThJYzE3T0J4?=
 =?utf-8?B?N25rbWtGaFFNQ0VLUDJNQy8zdmhYUjVDYW5KYkVTMlRqSWRTSDl6cDZYU0xr?=
 =?utf-8?B?Ry9oNHVRaHJpS3J5WnpIci9uay9LdFpxZlZiTGRnb0tBVTNRWUxSRU9zMTE2?=
 =?utf-8?B?aldUalJBMExoZ2FOZExxRHdJNkQ3RmdRNWpUUGJjZy9ueG9xTlZwdDJia0hT?=
 =?utf-8?B?RHVBMnl6M3pneSttWmp4NE4weGF1aEZCalFSTWVTZ0JiUnZwMW44N3FQNjI1?=
 =?utf-8?B?Qm5pVHgzSUd2VnR0T2xHNkNFSmJMOFlGWlB5SWV1bm9Mdm9ETUZkWWRGbEl3?=
 =?utf-8?B?UlNrRGhqTU95bjVCc3RGYXppQzdhRFIzbnh3azFOaThwNTBtYU03U3k5N1lE?=
 =?utf-8?B?Ujl4ZEFJenRWbzVXeHUzV2lTcUJoZkcyTi9OTkNsYzBTV3F2ay9jclFKYUJG?=
 =?utf-8?B?a3cwZnBYOVpWb3RpWjNHNmdQUWJ3bm9QbmR6a0dtNjIzYldESTN0WVp1cUtX?=
 =?utf-8?B?WWJaTDVJcE5TeGsyOWZJOHU4L21YcGpWRWFaemhldHdZbEFGRUlnMHRJS1Vp?=
 =?utf-8?B?RzQyMzc2VStlRi9ya25KQkkvQTNycGZ6RFZiMWNuSDJCSGFmZjVCRXpZdDBt?=
 =?utf-8?B?TVQwbkpPa0p6UEt4RjJqQnZ0RjVjRWdDZmR4SEpjNFJMWk50MmFBQnRUYWlp?=
 =?utf-8?B?djBRRGRrajFNUUdVVUxvSVBVdUY4N0tnaCtTdVNpbFFZOWdxd0pVT1hQNVN0?=
 =?utf-8?B?aXFHTXdvakdObU1OVDhTdkNuVkt1b0xUdEpDaHFPdy83dXBaZmdHZzY1blNW?=
 =?utf-8?B?UlpsL3F2MEZtb1RZWWIxUDhIOCsyWk5tVEZ0d0thMEQxSUN6cldjcGJCM3E3?=
 =?utf-8?B?OTJyaXJjTVdMd0VUcTl0dW9MMytOcmRFME8rT1g0S1hoaHBUT0gwZnh0ZEUv?=
 =?utf-8?Q?/gc+1Hgg+Eha1c+QDNyAok3SE4MjRsV2BUc2sC7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfb78ac7-69f3-4066-a92f-08d9899d334d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 14:17:31.5402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: upmepLbmFRUjD6TdwW4LUVv/ZPxcf+x+xNQ+RNeIe+rSZHhaZLq344VfqhQ2W0UpeMslmMsbT61qYwBg/O4urg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3296

On 24.08.2021 12:50, Anthony PERARD wrote:
> This avoid the need to create the symbolic link "include/asm".
> 
> Whenever a comment refer to an "asm" headers, this patch avoid
> spelling the arch when not needed to avoid some code churn.
> 
> One unrelated change is to sort entries in MAINTAINERS for "INTEL(R)
> VT FOR X86 (VT-X)"

Actually that misplaced entry isn't really that much VT-x related and
hence would imo better be dropped from there. But I can see that such
dropping would be less suitable of a change here.

> --- a/tools/include/Makefile
> +++ b/tools/include/Makefile
> @@ -30,7 +30,7 @@ xen-dir:
>  	ln -s $(XEN_ROOT)/xen/include/acpi/platform acpi/
>  	ln -s $(XEN_ROOT)/xen/include/acpi/ac*.h acpi/
>  ifeq ($(CONFIG_X86),y)
> -	ln -s $(XEN_ROOT)/xen/include/asm-x86 xen/asm
> +	ln -s $(XEN_ROOT)/xen/arch/x86/include/asm xen/asm

I think this would now better be

	ln -s $(XEN_ROOT)/xen/arch/x86/include/asm xen/

matching what is visible in context.

> --- a/xen/arch/riscv/arch.mk
> +++ b/xen/arch/riscv/arch.mk
> @@ -12,3 +12,4 @@ riscv-march-$(CONFIG_RISCV_ISA_C)       := $(riscv-march-y)c
>  
>  CFLAGS += -march=$(riscv-march-y) -mstrict-align -mcmodel=medany
>  CFLAGS += -I$(BASEDIR)/include
> +CFLAGS += -I$(BASEDIR)/arch/$(TARGET_ARCH)/include

I find it odd that this needed repeating in every arch.mk. Can't
this be done once for all arches?

> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -241,7 +241,7 @@ PAGE_LIST_HEAD(page_broken_list);
>  
>  /*
>   * first_valid_mfn is exported because it is use in ARM specific NUMA
> - * helpers. See comment in asm-arm/numa.h.
> + * helpers. See comment in asm/numa.h.
>   */
>  mfn_t first_valid_mfn = INVALID_MFN_INITIALIZER;

I'm afraid that in this case it is relevant that it's Arm's header,
like ...

> --- a/xen/include/xen/acpi.h
> +++ b/xen/include/xen/acpi.h
> @@ -40,8 +40,9 @@
>  #define ACPI_MADT_GET_TRIGGER(inti)	ACPI_MADT_GET_(TRIGGER, inti)
>  
>  /*
> - * Fixmap pages to reserve for ACPI boot-time tables (see asm-x86/fixmap.h or
> - * asm-arm/config.h, 64 pages(256KB) is large enough for most cases.)
> + * Fixmap pages to reserve for ACPI boot-time tables (see
> + * arch/x86/include/asm/fixmap.h or arch/arm/include/asm/config.h,
> + * 64 pages(256KB) is large enough for most cases.)

... you arrange for here.

Jan


