Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E572D79718D
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 12:48:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597250.931466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeCYr-0006LG-It; Thu, 07 Sep 2023 10:48:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597250.931466; Thu, 07 Sep 2023 10:48:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeCYr-0006Ik-G3; Thu, 07 Sep 2023 10:48:33 +0000
Received: by outflank-mailman (input) for mailman id 597250;
 Thu, 07 Sep 2023 10:48:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+6JM=EX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qeCYq-0006Ie-1k
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 10:48:32 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14b62bc9-4d6c-11ee-9b0d-b553b5be7939;
 Thu, 07 Sep 2023 12:48:29 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB8PR04MB7162.eurprd04.prod.outlook.com (2603:10a6:10:12c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Thu, 7 Sep
 2023 10:48:28 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.034; Thu, 7 Sep 2023
 10:48:28 +0000
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
X-Inumbo-ID: 14b62bc9-4d6c-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LPIAmrQkZ88QCJS6EmUdJoLWxBvKKpMVoQ9Zf0tIsCUmj8pAEBQgSZw4RKk6okY1UEC0s2B+NUnQpeCxznLWynbbtbWKdAz/55CU8qwr6ES9IWeZZILkUDvb4DPZiSeEL3j9kyl3McGzBBcXvklVVs8FoCDuUOQdSGaECJGgD0izDnS0nSpGQy4DwPZgw89RptBS61BHEcdnnH4luqA6UF5RLyIEXrKEpP2mKbmr3FiJqv9ekgja6jg+MDTKrnLRdwF9yXYsVmf66PdKyHOb+V3+JPT7z01XK67934X4wnC94/BdEltLix4WiE0wFFbo9X15r2HfcB0FH3xp5w3u/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j26Dccb4Gznq2tdMBzA/AAZgU2iq5DM14sZoKN40VOc=;
 b=mjUyx2T0rVLH09vPtpPQPuu2M6i9PrfTWznCDYCD6MFs9oPyyU1O6Vkk6g/oHoA3OcqtaDMRa29xan4tNOU4IlQ9gjc7x0a1IxjdFBAvaQFTl/9zpWR32xJ/Wp2Y/vK1JtDO3dHD11tluFISN3CRY9WhwsCX6ztjtEZR8XSYdvMdoHitNxXh+8qqasfxBqwn2NsAVOZhdw+AcURyszY5055ktckjyglHioG3s6bY5MhvMwZkqiUCLM09tl5ZMKM7vut8VG5J+pKvZxIwtqWvjtK9oPXwi+M+zE514DKtPR2BJgj5lgSDCAC9TTgLcUrChUxGD33LwQ6g8JG/dWwBHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j26Dccb4Gznq2tdMBzA/AAZgU2iq5DM14sZoKN40VOc=;
 b=b/LWL8wlVxo4wR5bamiPjMiIJXQ0djaWdVqRoYhigHE69DEEM83qbtdS9DZsr3ATr+e6ONLhKYG3pyBpSB70KhAku4RmoLaEhuWpRWz1ELQ5v6fcITLOcBeJs9BS4JXCoup6S3nsnwO1C3nasBq5IqyaOM3l8zSqHr1LQZMXYsIX5D8pAeQdxWhZlhcP1j1HJ0R04ikvGN+lL4a3kH6f9CS37Gv7syy+uRd1eQf1pAj3LiZB4j75mNX+Try+Y7QYRNtdTaqdRpahJTfvIZRjpzTUybhHnvklYg7+e/N6LaNZRqkES0L/ffs7VXIADwEsPaR5yuGRjq8lggkjotd6kw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fbc5ea33-22c1-52a5-dc7d-97ba29e06e9d@suse.com>
Date: Thu, 7 Sep 2023 12:48:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v6 1/2] xen: asm-generic support
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1694078544.git.oleksii.kurochko@gmail.com>
 <cf5f446915bd5c8980beda22718efff32678e16b.1694078544.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cf5f446915bd5c8980beda22718efff32678e16b.1694078544.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0130.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB8PR04MB7162:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cf6dbf5-f7fc-454e-1056-08dbaf8ff80d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QBuA6L7yCZDfgVsfT/r5tpJDhJ5Lie+Qfuj2vuQ9aSXxoX/uAPTKa0Zc8FzMlsLpz4eTnci6KNUzeWeZWkV2ctUPQEcVMOptZwHLdhcYlz8gflmkuTN/QcyNP04qOCwLpg6PYuUI75UQcqrDrmQjKJUS1Guu04q/EoyXC80IZ2E06FHbCgkV1YcuoXNXAvSz7SbW7YWtPSQZ2rjyj9fcfvSAHTatT3zqtuAXGuXssueLMsv9ZjYoO8l+id25NYovwWI6B9mDVyxbO6j5qqbSFxOIcPdN3h3OHzjN6JF7Rs/7jJor5Uj06937rO1p+ND/vt0eGgLO8+qgl9ACCSw+6tGS+078qq4vW8Zpu3h012s2qBB7zR/IO6sg09bqJFApt5FuGjh5vXKYsWrUIXMBgQbU1i5H8S477T3HzZW6rFg/z1W5kig6h5ZkXVx/SRoOTq3acpB929w3zWkfNfj6KjJXOfShppyS4U8uY46Zg1E2UAocGkJnYY8GE2Cqe+7DWcMRLyDVRU/y6Ry/y9UJC4MnA2ZA0IYGcCyWdxEORhciJ3k4h0Rca1Q+9oRkOHtyi7eoGV+4GUQ0vHJERtuClKOvvMdYWzmwCHyTibr4Hg0Ib/T9gVBcGe4HtsH3/xfLMgJvM2AedQoU2pErCBfVyeWTLFx2z88zpqC/WD5OykU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(366004)(396003)(39850400004)(346002)(1800799009)(186009)(451199024)(31686004)(6666004)(6512007)(6506007)(6486002)(8936002)(2616005)(86362001)(36756003)(31696002)(38100700002)(26005)(478600001)(4744005)(2906002)(53546011)(8676002)(316002)(66946007)(4326008)(5660300002)(54906003)(66476007)(41300700001)(66556008)(6916009)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTVjMGdvTnNlNjBOcU1nY0FaR3pQTDYvOFVCUXFrQWJaUDdYSjBwaEVmVFg0?=
 =?utf-8?B?Lzh4ODhnb08xbTlzdld5N0NROC9wdzJqYURXZzgxbWlTa05PaTZhKzFzamFa?=
 =?utf-8?B?U1Y1cjFCNUZ0RVA1M0ovTDlYVldFMzBhYUQyOURvVWllcHFKUjI0SU8xOWo2?=
 =?utf-8?B?SnNBYjc0eGVJZ3hJRFJwRUhRRnlpY2FxRzl4c2l5UFBtNnhWVngzbkpFOWhj?=
 =?utf-8?B?R3pFbDR4NnhnZ1BGZ01iKzVPT01IK0xvMjdMTjhydFdtRDNsNXZLUkhKamww?=
 =?utf-8?B?MUp3amdoTnk4WmlHUUVzMVJTbzVLemhCOHdHM1hpdVIwc2cwSjhyL3RWeURL?=
 =?utf-8?B?QlhvUURoUDdINWsyZFY4UEdST2dPV0Q1dG9pZFFVOC9zbXJmS0llUlkvbzh4?=
 =?utf-8?B?SUxjYVFCOXRqdjhJVUgxc3Q3dGEwNEw4QmRCSE84eitxS2Q3bk9WakdpZ2R1?=
 =?utf-8?B?bDZHdjdTclVKODBYT0dvSnRvQWhMdVpIdFZVSUhDdFk4QnVPZDRvVTI2Ull2?=
 =?utf-8?B?U1YxQXM2U0NRZ1hWU1BCcElWU0FETWs5RGF0SnI5THV3WVloaTZRY3ZVUms4?=
 =?utf-8?B?Zmk3akNDalR5QlJ5cDNSQnA2c1JkYkFqbGJWNHo2a3dhTnNwZ0JIZ2RmQkVT?=
 =?utf-8?B?a3FQT0dGYmplK3R2OE9VSE1qVEJnbUxrcXRsLzRydjhOVUNoN2ExeTVoVUFX?=
 =?utf-8?B?YU13ak1keVpodW5DcklPS0psUXBGSHNXNkpSdjlBQktCTDVROUxoKzdXY1R2?=
 =?utf-8?B?aDR6c3NZdU1HTWk4ejRlUG81cjNaMUJUNzVRR0VCVWErRlhCMTB5ckliNlo3?=
 =?utf-8?B?VDhUYWh2a1RHK09LbWFIS0FmQWlsUFdyNWdMcDlRaGx2VWxlSWc3eU5HOHZF?=
 =?utf-8?B?ajdCSTdNNFQvdmVQR1lBditVYjlncEF4K3ZpQzZhd0JlL3NWR3krcXc2ZjA4?=
 =?utf-8?B?Y1RDMUZTU3VIZjRMbXhnaFJHaW1XTGQ4cCtCNUpENDdCaXFCRkIvZGxPdy9s?=
 =?utf-8?B?b0ovcks3dnNRaUp2Wlc2M0tiUVdRd1dacGt5ckgrRjRQdDZkWUlkUmpUWlJ1?=
 =?utf-8?B?TGFFeTAydG1OT0d1MVE5WEtpbWgyL2NYZjdHbmFQYVZYTmdmYjZraitQalFE?=
 =?utf-8?B?dkRlS2tiOTBYb3RHNkc5bFJiT0E2cFdxUGtIckZrVFNSbldud1FMU3RETTB6?=
 =?utf-8?B?YmxLZHBwcUU2OFlEMHBISzZRRnJ6a1ZFSmFuSnAzVWJDTU8rNnV5bi9EN3pB?=
 =?utf-8?B?YWV1N01oc0xNVzVsNFZnemhnN1dsa0M0cUZ3cWdrd2diSnhXUGREeUVQQXUr?=
 =?utf-8?B?Ry8xUU4wTkRaS1NCS0ZkWUphVUk2a05CVU9zdnpKWExCKytvb1VtY1B5Rmth?=
 =?utf-8?B?bGlLSVF5b1dBd3NmUmpTTGQ0RHpKNERtYk5OVEZURHUrSUd6ZE13a0ZDYnEx?=
 =?utf-8?B?THYxU2pzeWIvKzg5SXdrdjJ2MU1XWVpQUFdheFRTUmpnc3YrUERNVitYQksy?=
 =?utf-8?B?RitCb1grREVyaWk5S0NSdmd0Mml2RVgrbjZJUllwazZOeldXMmF2R0xHT0wv?=
 =?utf-8?B?ak1TUUJjNjF3QWppUkE5K29aZFRTam95TDhweC9uOGNySGUvSGJZeEhCLytx?=
 =?utf-8?B?aGJmSHZNaUlhSHo3QjV6NTBmUVp0bklVa2NMTE9kUWZ5NjhCZHVsVFNnVXhE?=
 =?utf-8?B?MXRXM1ZxR2hyc0diNVlDTUJ5SXJSdXkwSk1IMUg3ZWRabjd5UTJaL1B0ckw4?=
 =?utf-8?B?SjJidmFYaCs3djZzc0xWVXlmbFd0YVZPUW9xTlZxR2dYSy85ZmYxd0wzTGhR?=
 =?utf-8?B?M1U4dlRKR2ZjTzhSbmtKeXlkU29hSFFuZWJVQ3BmMUlFemo2THBPWVVxUk9l?=
 =?utf-8?B?dE1NUHNsZ2hPVU11dVBsMU9pOUJhU2tyY1I5OEw5OThZQTR3Sk9jQ1E2UWRE?=
 =?utf-8?B?R0hNNHVLb2NKT0RGT28rYzlUejhoMUY0K2l0RDRpNG1WU1ZVUVIzY0RhK0d5?=
 =?utf-8?B?eklxS3NsN3dwZzQwWGEzWWpXMTk1ZHBrYWFoVitmWXVUK1BML1p5WisxYU8z?=
 =?utf-8?B?NytjNWw5UW9IajV3WHRHV00xSTQ2RWRCRzJkeEkrMi9BRlBIbWROMFNMaHBT?=
 =?utf-8?Q?EZtk9BcusRox9XRiekzyEz0wy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cf6dbf5-f7fc-454e-1056-08dbaf8ff80d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 10:48:28.1032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9eqJ7cXO/CJkuJmprj82YCscRlZzVFHcwuCoiG0AVwK5+ydSHroA5KlZG32fhCNPUHQKWJCH60wlRGvgzBMEdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7162

On 07.09.2023 11:32, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/scripts/Makefile.asm-generic
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +# include/asm-generic contains a lot of files that are used
> +# verbatim by several architectures.
> +#
> +# This Makefile reads the file arch/$(SRCARCH)/include/asm/Makefile
> +# and for each file listed in this file with generic-y creates
> +# a small wrapper file in arch/$(SRCARCH)/include/generated/asm.
> +
> +PHONY := all
> +all:
> +
> +src := $(subst /generated,,$(obj))
> +
> +include $(srctree)/scripts/Kbuild.include
> +-include $(src)/Makefile

With the definition of src above, is this correct for out-of-tree builds?
You want to reference the Makefile in the source tree, ...

> +redundant := $(filter $(mandatory-y) $(generated-y), $(generic-y))
> +redundant += $(foreach f, $(generic-y), $(if $(wildcard $(srctree)/$(src)/$(f)),$(f)))

... much like $(srctree) is used here (and similarly again further down).

Jan

