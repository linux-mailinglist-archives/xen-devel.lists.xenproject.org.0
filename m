Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C407FBA82
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 13:52:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643126.1003032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7xZC-0005yF-L0; Tue, 28 Nov 2023 12:51:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643126.1003032; Tue, 28 Nov 2023 12:51:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7xZC-0005wW-HV; Tue, 28 Nov 2023 12:51:54 +0000
Received: by outflank-mailman (input) for mailman id 643126;
 Tue, 28 Nov 2023 12:51:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xcZ5=HJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7xZA-0005wP-KA
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 12:51:52 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20622.outbound.protection.outlook.com
 [2a01:111:f400:fe16::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e64fa86a-8dec-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 13:51:51 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8318.eurprd04.prod.outlook.com (2603:10a6:102:1c0::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.19; Tue, 28 Nov
 2023 12:51:47 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Tue, 28 Nov 2023
 12:51:45 +0000
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
X-Inumbo-ID: e64fa86a-8dec-11ee-98e3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZHX81550qiue0njvsl50J6cDKQRjOj1sJ44j+TCzxYbBg4fdSaN60j1EKszjmPIVV2nO7YkUK2ot9B0XzMnMA6h5NaXv5AKMR8hzHu9Yrs3x6QRWooKozdJBpOYw2GWJI9NQxaDmhbDQBgb50cvLl4UNtCyHpyG05r3uE+GP88zu8Lc7HHycFbja+1et6aVgF3foEJX2lWD8fXMiamFc2sIaFbkpZt/fD38rwjWqfvHmRMeIBHKeHYoqtXObLJBqMccO5ZnNfd1MzvVmWN8sw1MAJ6CD8mM3fB0oiFlUtfa4HZGOeaoLdsU7M+kKXc2aaj6Ial2NqBphUg7hV7iQmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ksOpb5R1khDl5tUF7jiXls5PGGmugXGR998w9ZjNdGo=;
 b=FL2zEW9/c18f9mEJYjq+mpOsjpJlLKNegHTMyB/0Fwkl/Tgf+CT4C2ey+LqBjQsvAHqFoXx4FrAqV2RwvYp12g1Eb1XFwr5gdbzvcGDwgtXLeUv/MDgb/RhdtWM2L1RnwZucTAzuYGkyDdlboP74F/n9MSTtmlvj6evY3bzyxHjPkBfGRjIyblxFPx3aAA2HhWEkJwVcF9WLZ9DU4EXiUkj4ErPhNrxaQghbjLJ/861L7cP0Geu0pZb/CvrI5mQaYhXhbuk7gmvpopkYWKPbM9iHYYpOFGoEQDJT2uU4FjURlExlp/Ul4ESthAdIXV6F7otxPCXezh1aINPtXpy7IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ksOpb5R1khDl5tUF7jiXls5PGGmugXGR998w9ZjNdGo=;
 b=dkZB/xDA5gEXeX00u7opg3huQohVR5sNpGmDaI2Ov4/6RasfcApzFazhbNmDTAf5ftLgmevdooRVaNO8jYh5hLF+Y6/D0NY9IgC62pg8GWpckQlPSxbA9CTi2/I9oPySomLYSgZZCV2YzlrmusJADbvK8hxqWD7/EORdMHpEynr8FE2dhY7JkwRJ57CKSVgFbR0ZX+cvCKk8pllcbQJgTRKEAYQ51oYby/btCQ+26uoSFFxLigSepfh2xR/SO43wGx6J4USsYRcjDhEOKDN8XiGDEK+A1G/aXGqECLGbRKHTVFltjItfHoUy1X6cQlcZOyIWgj9IqzfXmzMp8jPF+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <40438252-0d54-47f0-aad8-e76d57508bc5@suse.com>
Date: Tue, 28 Nov 2023 13:51:43 +0100
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] .gitignore: generalize *.new
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0153.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8318:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c73f5a5-befe-47db-2416-08dbf010c6da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	r6YLNsYxNrKRBy6YT5JAx8uytN20aIOE47M2pefToA2RU+7w9ZZ5WznR+1WzICrZheIUEM3f0JPSTc3i8/X5s+7nzJsOCww2FMqfSMVwj2mjypVuX6SCVo/vim4orvhLwZtBSf8nbDpOSdPmgdkGp37PBFLDCiRIXT/9Ld+ERJy1/ODUDIIt50zlILQ0YhgQgisH35BY2nvVe5bkRa34A/y90zqYCnf39gQjkf1urYPgzC/axhHVufWZCVPKL0OCNnW6i5KBrOhKk3wLHHciNr4AYb1DNBFhnRNqoW1bg6u4W1S8/PlQ38VoJ0awCjPrTvyAcAuaMnNCDHXW9tfe5auj3sA3bS4bd/4BaS+NwvYT6MSKyk3NiCnuVsDV4cqGBH4b295X4qsXLltaIzFhna2XY4pOgwYzBBo2/sTvH0/U0fbSA5E7HARd0ckl9J7lyVZw6+137sU64cBgW1wJ3iSRn05BTzElPvf7X7EyvlF4JKass28XiObYZhuxLO3aotSwHoJcdB0WL7nZ3X2eMaFnncHOzA/A4HhDTP6x3Tn/wQVNQGnJE8EnNSp6zlF4rOTnWo/h3YdiWSD3DB21u1f/uSy0mLtNjuhM0ctkbvwj2BFxgn63xh0i2wN7Ygk94ekfQL8Q3gkgmwqecNoVGQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(39860400002)(376002)(136003)(346002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(2616005)(26005)(6512007)(6506007)(5660300002)(8936002)(4326008)(6486002)(31696002)(478600001)(86362001)(6916009)(66556008)(316002)(66946007)(54906003)(66476007)(8676002)(31686004)(38100700002)(2906002)(4744005)(41300700001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWtSTWlucFBmQUhYRmE0V2ZmTmtQbnFDSk5vY3AvSG9SSW1XSC9hWDFaUUls?=
 =?utf-8?B?QTIzN1dtaGhWUEkyTTNuTG4rL1Q3SDBOa2JxMHd5eTRjT3RNSWQ1ZlNPQkZa?=
 =?utf-8?B?eHlvZmY0bHhac3ZtNmo5SVpZYndsSGNqcjZWZ0gxcmxBSjhKeXorYk1EWnUx?=
 =?utf-8?B?UVh6dVc1SmlWa3VPT0E0Nkt6Q2NNNzV0aFdHNytiKzI2bWkvbnBpNmtDd244?=
 =?utf-8?B?d2NaNFFXYjVMVFRDOXZmeU9SRGZTQk1yQTZlV3hXL2J3MlVRQWJNQ2tJeDMx?=
 =?utf-8?B?MHFPd29sVWJYdWQ1RW53OGJXT2xSTEdobktPUW82VFl2clhIaC96Z1luQW1V?=
 =?utf-8?B?S2k1UVBNRGlqTjM4YWV6bWhUVUtuRjhxcFlZUGxBdFl4d2t3MklnNU1IYnZC?=
 =?utf-8?B?RXVmclRmL01mbk1QckNCcDNvY0VoeW9WRFBkMWNHcURhMVFBUnYzYi9BL2h3?=
 =?utf-8?B?Sjlnb2x6alo2dWtBY3JOSytQczB5OVBLZFN1ZlpzT2NlUFZvVUhROUExQUdE?=
 =?utf-8?B?Q29PSEFEN2NEdm1GRk9BY2NxMDh5bzM0cTdqQXFLTTM0akwvZVJDcExrdHZH?=
 =?utf-8?B?WWthdkcvc1RkMk15UVhVc1J3SjVsYU1VWVNITTJBMkpSeTZvQ0JNZ0RVMlYy?=
 =?utf-8?B?MXE3RUZHZE1zYkdzbEl3dEZQL1hLUW5uWUlFM28yaS9ITkpES29WQ2pUbzB5?=
 =?utf-8?B?cTBIdzk2ODA0RnJjS2VvemRZN2g2b2pzNmphSnlCYTF1Mmg4dWNBZE5VQlFI?=
 =?utf-8?B?STRUcFNvQTk2MllnZWJ4b3BYYy9seG02Sm9jTnJmMEVaV0xSNFQzY0dHZ0Vp?=
 =?utf-8?B?SytTYjhETDBZdU1wMVF0dldTalBuWFUvL1VFSGtiMnAwSFhSRHMrRXhTaVlK?=
 =?utf-8?B?QU5UTWlSSDU3MDlQWUtWczlLRGp1bU4wZkpUNytibUZvakJuZ0FCRnkrR0Y3?=
 =?utf-8?B?VmJKd25FOC9qOXJDMGV6a0NtZ2RHWFBITlRNVFp2ZnJBM3dIMXBzTmlrYSsv?=
 =?utf-8?B?OExFbWhvdlM2ZStQazJjUGJmaEc1R0I5NlhKOXJvVmRkcis2b1pqZWFVc3Bp?=
 =?utf-8?B?ZXlaTWp1bVl2MEFkOXhkaS9hbUVtWWJRcDMyRjdsaUU3RTZuN2Z6NkFCTzJQ?=
 =?utf-8?B?c25oYTBIWjlxamRwdEZRRm0ycm5SNVllYllwODFRUzNscEFiV1BWdzNTVHFI?=
 =?utf-8?B?cUk3ZVBaNXhvclVvTEsvTkV1ZXk0bWY4QWFueXRKNFJ0N0lwYXNHeUxldjNr?=
 =?utf-8?B?eUIwdlJRNWw5bkFZTWJWcnU1WjBtY3NnemtQb25XeTRwUXduT0tGZlJ5M3lq?=
 =?utf-8?B?V1JNV20raWhsR1NOeElzNEhXeWV2aTFpdEpOZW5IZlB3VzlkMW1TZlZVNjNW?=
 =?utf-8?B?elVrMXNTTWNPZ3puY0JtQm5Tc2VKS3o2MWJDK3NMNVBPdTZCd2tpRXJ2T3VY?=
 =?utf-8?B?NWRod09iMUtodlltbUdzem5Wa2cwYUhseEZKWGNIbGVqNnRHZytudFdwQ1hE?=
 =?utf-8?B?MnIwMEVWVVFNcE8yZHFaa3ZkbVVJUnM4ZjdNYmJXUWFKYU03WkxlQlZiRUQv?=
 =?utf-8?B?Vk5WVkk2ak05QXpkemtSUFlsSTQ3OXNTNXRVZzV0K1pvb1hHc3RKOXNFbWlu?=
 =?utf-8?B?Z1Y5N2hPaURrTTR4Q3NpVjVKRkIxOWljS05adUs5MDc0aGVESkxlOHFxTWdC?=
 =?utf-8?B?SHlMcGZmbHVJR2VJbDI4REh2R1Z4azBtSXFnVFl4RThtdVFFcmV2bjJnVm95?=
 =?utf-8?B?MUtPMitabVJqSStvNE4zUGRvS0k1U0YvSkxkZGZ3eFY1MEhiZDl5U3ZrMlNV?=
 =?utf-8?B?ZG1vZVlsd0o4aW5MZEwvS1lYM2dPUzAwa2FTeWJFMUZPYm5KbkxvZVdYZzJs?=
 =?utf-8?B?TFUzU0hhenl5V0hLaytoQTQ4b0h0SW5lYmRrQ3lsSVNvQTJPcHdnZzZwb1Rt?=
 =?utf-8?B?Y3VmUmIySG5VNHZIZzA4eG9CbW54VC93d2VxYzJPb3BMaTVPQU84emJtaC9u?=
 =?utf-8?B?eUZybGo2bXAvanBhTzlhUW91WUxXbFBuUlBVc2kvSU5UZ2xvZ05OcUEvNUtY?=
 =?utf-8?B?ZW1wUERpeFNwUDVxTytGNld3SWR0d1BsdVovZE9tSEdNVlFSZnkwU3RVU3pG?=
 =?utf-8?Q?LnbX5pE+HCrtvkJ9YsoXP9t4E?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c73f5a5-befe-47db-2416-08dbf010c6da
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 12:51:45.0478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NIgHAHO63LoiwyYwiecH/tcRJdWy9W1XG3bz2neqnvOcA8nADXnrec9lPas4nhvHMwJ6WjmeioJY+6u/hSqRbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8318

It's not only in xen/include/xen/ that we generate (intermediate) *.new
files.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Really I don't think I can spot what *.new we create in that specific
directory. xen/include/ certainly has some.

--- a/.gitignore
+++ b/.gitignore
@@ -17,6 +17,7 @@
 *.so.[0-9]*
 *.bin
 *.bak
+*.new
 *.tmp
 *.spot
 *.spit
@@ -277,7 +278,6 @@
 xen/include/config/
 xen/include/generated/
 xen/include/public/public
-xen/include/xen/*.new
 xen/include/xen/acm_policy.h
 xen/include/xen/compile.h
 xen/include/xen/hypercall-defs.h

