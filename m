Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 185A472948B
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 11:16:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545716.852228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7YDj-00004r-Kn; Fri, 09 Jun 2023 09:15:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545716.852228; Fri, 09 Jun 2023 09:15:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7YDj-0008TD-Gq; Fri, 09 Jun 2023 09:15:47 +0000
Received: by outflank-mailman (input) for mailman id 545716;
 Fri, 09 Jun 2023 09:15:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b5Wx=B5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q7YDi-0008T7-JL
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 09:15:46 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0626.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 366ff708-06a6-11ee-8611-37d641c3527e;
 Fri, 09 Jun 2023 11:15:44 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7217.eurprd04.prod.outlook.com (2603:10a6:20b:1db::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.42; Fri, 9 Jun
 2023 09:15:42 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Fri, 9 Jun 2023
 09:15:41 +0000
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
X-Inumbo-ID: 366ff708-06a6-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QNx/BV2NdckBqZJ9GcQWRjoA2lSMznnDkkATnhHslSokgcXGXjsaVSXF2S7RLLWHluWnmUI8ezBYjXBJjyOiyLM2NAqbIyd/9hSxwZiuO9z6OXSi9vkvTEFAyKmzt/v1Pm+dWiMEsO2c+vk3A9kV2H6cj4z4xW8PgWXg6YDk3vEk4aFUdeAlr93DrHfz5F2mdylV+JX/uupqrnF2i5/aCc1YZ8abnCGZW6WwTdWoTW7oersG8XDlv93VvW4tFZR+uS1+0yDGuZ2LxpviCGPbdjVwrBDFfc0+bYfq4YtjqleebJlUwyZfZ12Yro3uyIuXJGNwjN0ZtjzfTbGD5+umlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cEDtN8N5kHk/NUBdxttDUqJow0ZcwhO9+VdFQkGmzP8=;
 b=XNmziYgCxQusu4kgk3BpK+GkcULuuDhUCLV4vIUi3jwUp2ygYQeQbXkBT8BOdkbO4uJZyHq7VKG4pqFl9LmWjUhcG91qmIRU/PYffBb+Yw8txTnrzlunTcTmqS9gqkvXiqpnLSw3LiM9h1nmy/5KZdXoFp/c2rZEoXi66RUB6n/mn47a3cNvUcHifgCpB+RbOcNfI9DRyXTIP9SMhJBp2v0UMgUT8Qc4RzMba32yIGjlRtfaAfLl2AdOZghyuswhrNcimaEns892yvI8pPIBCuRoFuDLasiCRZY4g/Hcg9cxTSmtNILAtZ14vN+/SVw2T1ZjBniY8LLVZri3Oq1kIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cEDtN8N5kHk/NUBdxttDUqJow0ZcwhO9+VdFQkGmzP8=;
 b=0tXSerjNF4hfYj/VRHIx/Fjzq+XztaNI2uYKz3JBtqGSx1zTLCdlyhKo1mlRXJm2CuD5bLiAIXOonoIaAnHrVxLDzxiK0oqpIZnHDXHt1C7Rz8zSlpfzRB3n8bgWm+eP20/ZMHTSFsLvqwGb2+GM87dKnUD4Ep8h3WEobircho5wcQRvG00a/XpBs5ZOyLg7B+bHfBljrFddC/kotYaTpXwyAXhdiKCDxDrOlhfjfWYra/psujmz7ux6c1GwtpMT9sTywAhZQasOFyH0XrC95BQDkh9pH4CF2eDX0BK0FS4jZ2Xt3SVazFwbOSyOqvGGb0ESVhPHCAEBxjfQGyL2Xg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9676af82-7af2-24d4-838d-6f5a90c1d604@suse.com>
Date: Fri, 9 Jun 2023 11:15:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/3] xen: Add files needed for minimal Power build
Content-Language: en-US
To: Shawn Anastasio <shawn@anastas.io>
Cc: tpearson@raptorengineering.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Shawn Anastasio
 <shawnanastasio@raptorengineering.com>, xen-devel@lists.xenproject.org
References: <cover.1686148363.git.shawn@anastas.io>
 <e2e1435f5d0fadaa00dfff6c04af29165439db5d.1686148363.git.shawn@anastas.io>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e2e1435f5d0fadaa00dfff6c04af29165439db5d.1686148363.git.shawn@anastas.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0115.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7217:EE_
X-MS-Office365-Filtering-Correlation-Id: 922fb61d-6562-4993-1625-08db68ca18a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1DlPEHpP1dFhTW0zHcaqaxL2fJbcqBpRvuxG5qEBaAhqNMF6hc5Lmg+qH81jPpvihlTwIhRleVsO7SL0kSvC1mRCWonEfTE1MKB8SwW50fSwZiKLIYLdXDl7xr8f75ifYP5NrEMAfpgP2YHTU4+nxR0ylA4IykBQ63MYZQeKOfvHGPkCaGTJTkto7LVLcHmpoar00S7arAP2/qf8YcqtCdMkCvyzhMVXclMEQHAdzaRwQBGFSFz1cDFe+djWUZMbY1xwwdrjfnGdsmvGIQmKbfDka5mbbXSqFu1WXacTcbeyr1gUI+YRl1FzHlSprUzQCDe+lZ8r9e00kq4CGKm0v3xTSOsvKmeOYCBFq32zNcT4p0B+BkBBs7VnBnEG3I9/XL0cSJWj/oCk20ZQxTy8HhYemoaOYOpCZuYvrUKwZbO6bHLmDQMyztXWf4yS3b6u9RAOk4UaSRQM2TE+YsGqzFvRvgXvEyQ3YSltyTHqqnE2p+SLesRkHhALduJ0KIi7kbQtdh7DbOQmzr4keJwLRnF8iduQRxIDcQ9DaaWgSVz1YtzRKELR9+ldgEHWnHoyKCH0zXnSK5s6kFIbDng76MwOyP8cjDnnHqcJtEC5QrFe2+qFLEdf6W7vreI06NwnUZAHZMdtZOARhusG6b9vww==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(376002)(396003)(346002)(366004)(451199021)(2906002)(53546011)(26005)(6506007)(6512007)(186003)(36756003)(38100700002)(31696002)(86362001)(2616005)(41300700001)(6666004)(316002)(6486002)(478600001)(31686004)(54906003)(4326008)(66556008)(66946007)(66476007)(6916009)(8936002)(8676002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eklMVlpkQ2hDVU9uQmtOR1QzdVpzQzRJWk9RM0ZkY0t2dTNweU0yZXM4NlYv?=
 =?utf-8?B?dkdneEc3eU50emhwdW1FZzA1QlpLYkNRMnpsTGRjOU53S3BCN3lMZ1pFRC9O?=
 =?utf-8?B?VmVFS1NqZCtMZFNhYUZSTE1CeEFOMkVqZFZqclhuNHhYM21kS2x1Mjlwemd0?=
 =?utf-8?B?Mk1YcFpxNGV4anRsenE3ZTVzcEl1bFVEYTltMm1keHhhNGZqdzhYNjMvRnRN?=
 =?utf-8?B?MXJrWFFqa3RYTzFxR2hyUGo1NmxkQjBtZS9jakhKTnFKeEkzQ0FCVXJEQ2FY?=
 =?utf-8?B?TlJtTDk3SUhJMzMyM282eDFHbzRVaEV2YWRWdmNNZW5xcHZ0cDVqTUd5bE5n?=
 =?utf-8?B?SGtCL1lHckpucm9ZNTUyNWZiWmV0UzRPcGJ4aGZ2ZkdvN0FCdVIxQzhvRnhH?=
 =?utf-8?B?R1YxbXZQbmZFY0lJcld2VVltK0h5VDZBY0Q5elBEdDEwUVc5RGpPRTg1SjB1?=
 =?utf-8?B?N05DRWJLRlQ1ZWpkV2NDNkprYTNFYnIxNmFjdVNaaEdIbmhxemw4UTJtNjVU?=
 =?utf-8?B?YUFmOVdtT3UrcWlGNGxPcUZsSkFUTjFvbnh2djFLa3lmSENJK1loc0NkaWFH?=
 =?utf-8?B?eVBmdnRKVUVSNTltbXZPRjJIUXBmbWhpMlVyQVE1Z2JPTkoyd3hqYUtKelVH?=
 =?utf-8?B?NUtWWmxhYUtURi82RWZxOUc0SHZzQTZKOFZoMnFoRWZEb0xxN2gxR3E3WUdH?=
 =?utf-8?B?ZTFaQjhmM3k1Rkt1T2hBQ0JWdGVraFFTUFdha05xdHJJQSs2VnlGazBlclZp?=
 =?utf-8?B?TnlVcHBlWFpvS0hHb2dRRVc3ZE1kRlRyYmVJeGJvTnJDYlVPMXhsRGhNd2Jv?=
 =?utf-8?B?OG5rT0FGaE1vZk1CdFBhMm5lZzRmMi9DRWNWTUR4QWh0eXA3eTQ4dEVuQnJw?=
 =?utf-8?B?WDVNZnZ2NW56OEI5c1F6cUQ3TWcxVFBvNWZKVzlGMUU0NS9lWjUycWhXM2h3?=
 =?utf-8?B?ZTNKdWtxT1RRZml4ZEloV1lORC94NmhhRENKOGRVSEtGeWYrVGJpMkdwNmVk?=
 =?utf-8?B?b1gxVTRmdG5FbStiK2oyOVJXemxoQUVhRk5vNlpaak5aMTY1ZituY1EvS3hj?=
 =?utf-8?B?SnpCQ2FTNFJpODNxdUNSNitZaWYzeTRXTjBZUy83QUVKcitSL05DKzJDMkJ2?=
 =?utf-8?B?NTg4V29wS05jdmszTUdCTFRxc2dDOE4xQmMrTXNCSWMzaDBWejRYQUJab1hW?=
 =?utf-8?B?eGtjTzhpckxhV3NLM2dmVzNrczE0MnYvdGg3a2lGWTdlZWJtZW02SkxzUExk?=
 =?utf-8?B?N1NIdW8wNnNtRXA1b3pkb3FHL0JsdnB5eHlGVVpGR0N3d1FkNmhtT0xmZ1BJ?=
 =?utf-8?B?d1NiODNXV28raWZiVU1tK0FXTVFUK0s4bHhzNnJlVnU4K3RYRGkwU1kyK2J2?=
 =?utf-8?B?S20xdFlicEdjL21PWDBpRzBqVkNuc3hrMkR1bm5FNklQREh6dlNWbW8rQ3kr?=
 =?utf-8?B?bHNXbVdtdzA3SkU3Q0lMMVQyclFVekU1UEdQbzRESStwRHlLeEJCWnkxWnh5?=
 =?utf-8?B?Ry92M0E3MHVjVzUvZGdpbC9TR2dIbS9IQlE0ZXdJbzdTQWpJaFBKL1ZNU3Ni?=
 =?utf-8?B?S3Fxck5yMlVBSnU0ejh0ZHdIc1MvcnowdEFYMHBKMmthc3ROb1h4WFpqcFFL?=
 =?utf-8?B?aEkxdzFTZFlHOXN2eVZvQm9jYU4yL1d5b1dkSGFmd3JqQlZKaUJVMlF1bVlZ?=
 =?utf-8?B?RlRzWEVyRnY4Y1ZyKy9uK2hUN2lvTlBldjJxaGlUMHpyNEtpblFJK3FHei9Y?=
 =?utf-8?B?RXZIZ0VSbDVPUjNhM2swWHhxMkJRSVdzY2RCZVRxai8vM2V1N2hrYUNOUWs0?=
 =?utf-8?B?ZXhJNEhYWXRGazJ6dWtFNHFydXNoMFNlanZCWFMzMlJzSHo2c0EyRnFUU0t2?=
 =?utf-8?B?N3BHTmRHb2xkTkxjQ0d4NTAzWVMrUUpOUFBnOTZBcUFnelk3YVhTbVNWODV3?=
 =?utf-8?B?NlVGeWIrM3k2TU5NS0JhZU0xVm1vUTAxZ0w4VW1la0ZqTTkvQ2NDOHdQWmJs?=
 =?utf-8?B?bEJsTjk0cThjbXZKSVJPYm85WG41Rmp0Z04wWmlTN3B1cVVKSGhSOVprVlNu?=
 =?utf-8?B?ZjhFMldjUm5MMGZQNFI5WnZORENlU0dlajVHeDcvREthWnVBN3dWNk5QemNO?=
 =?utf-8?Q?Kx1hmLarZmtGyFb1zK/ZsNY4A?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 922fb61d-6562-4993-1625-08db68ca18a2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 09:15:41.0138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e5QnU5uox6Tujy0vQ3gBR5ehZiIP5uHKGRa57VieYdDi/FCzK3/UJ6xeo9GNNA9wqrKKDrKJwPC/GgxmGHhgvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7217

On 07.06.2023 17:06, Shawn Anastasio wrote:
> Add the build system changes required to build for ppc64le (POWER8+).
> Following in the footsteps of the initial riscv port, only building
> the head.o target, which boots to an infinite loop, is supported:
> 
> $ make XEN_TARGET_ARCH=ppc64 -C xen openpower_defconfig
> $ make XEN_TARGET_ARCH=ppc64 SUBSYSTEMS=xen -C xen TARGET=ppc64/head.o
> 
> This port targets POWER8+ CPUs running in Little Endian mode specifically,
> and does not boot on older machines. Additionally, this initial skeleton
> only implements the PaPR/pseries boot protocol which allows it to be
> booted in a standard QEMU virtual machine:
> 
> $ qemu-system-ppc64 -M pseries-5.2 -m 256M -kernel ppc64/head.o
> 
> Where possible, this patch uses header definitions and support routines
> from the original Xen PowerPC port present in Xen 3.2.3. Though we are
> targeting a much newer ISA than that original port did, some of the
> definitions have remained similar enough for reuse.
> 
> Signed-off-by: Shawn Anastasio <shawnanastasio@raptorengineering.com>

Just a few small remarks, as following Andrew's comments I expect the
patch will shrink quite a bit:

> --- /dev/null
> +++ b/config/ppc64.mk
> @@ -0,0 +1,5 @@
> +CONFIG_PPC64 := y
> +CONFIG_PPC64_64 := y
> +CONFIG_PPC64_$(XEN_OS) := y

The first of the 64-s here are a little odd; looking at RISC-V's
counterpart, wouldn't this want to be

CONFIG_PPC := y
CONFIG_PPC_64 := y
CONFIG_PPC_$(XEN_OS) := y

> --- /dev/null
> +++ b/xen/arch/ppc/Kconfig
> @@ -0,0 +1,42 @@
> +config PPC
> +	def_bool y

Is this necessary? Iirc PPC is frequently used as a name for 32-bit PPC
(but then also elsewhere as covering both 32- and 64-bit), so I'm not
sure we want this without having a need for it.

> +config PPC64
> +	def_bool y
> +	select 64BIT
> +
> +config ARCH_DEFCONFIG
> +	string
> +	default "arch/ppc/configs/openpower_defconfig"
> +
> +menu "Architecture Features"
> +
> +source "arch/Kconfig"
> +
> +endmenu
> +
> +menu "ISA Selection"
> +
> +choice
> +	prompt "Base ISA"
> +	default POWER_ISA_2_07B if PPC64
> +	help
> +	  This selects the base ISA version that Xen will target.
> +
> +config POWER_ISA_2_07B
> +	bool "POWER ISA 2.07B+"
> +	help
> +	  Target version 2.07B+ of the POWER ISA (POWER8+)
> +
> +config POWER_ISA_3_00
> +	bool "POWER ISA 3.00+"
> +	help
> +	  Target version 3.00+ of the POWER ISA (POWER9+)

What are the + in here meant to indicate? Since this is about a baseline
ISA, I find such a use (presumably standing for "or newer") ambiguous.

Jan

