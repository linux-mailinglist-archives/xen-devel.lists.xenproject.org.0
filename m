Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6413E7D5447
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 16:49:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622075.969231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvIiA-0000PP-D3; Tue, 24 Oct 2023 14:48:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622075.969231; Tue, 24 Oct 2023 14:48:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvIiA-0000Mx-AO; Tue, 24 Oct 2023 14:48:50 +0000
Received: by outflank-mailman (input) for mailman id 622075;
 Tue, 24 Oct 2023 14:48:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=krZT=GG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvIi8-0000Mp-UL
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 14:48:48 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2062c.outbound.protection.outlook.com
 [2a01:111:f400:fe16::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f630715-727c-11ee-9b0e-b553b5be7939;
 Tue, 24 Oct 2023 16:48:46 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7951.eurprd04.prod.outlook.com (2603:10a6:102:ca::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.9; Tue, 24 Oct
 2023 14:48:44 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Tue, 24 Oct 2023
 14:48:44 +0000
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
X-Inumbo-ID: 6f630715-727c-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A5ucksy5SFTiegWqvatL5o3cwXL0Azg+FJOEY4tNG2/MNMR/ozTXOXDv2oiXROb2J/Pw8EYGs4ihdkUdwSK3gvjoZGQpG0H5NmS4iyNQmpRh8f9cfTTFs6PntaB+w+/ARsMuG8kB5c9njPcfAL/ak0qR/PAx/66dhfUPwq2bI6lJxgxdl0iBaC+C5GYCz9VHRDShj8wq7KD9dxz1/pTmZm/JAcz1DVzr3uWUNUnzP/vFOp3jqKf64uSkz9sFHic+WlF3W+cHgg66PYSoUbVZ2BvOOojpxeH7HodeWNZDMBdTGthltxn0gGI+szo0yXZfFwqQKSKBrXA0v8pOnWqb5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ImfW75Ej0CJDLxayEutRsb0cgLLbHpD24FhnXr/aTA=;
 b=lSHtdDtDP8ldyOvCuCl3yMQnt4QWPb5vpYGsiBzKRXDgnGO80RmvI8heh2jA9crKp73ek/GHql5vDZ0G+VtyFKyNTUsO2Exum5jhAMtlYuVUc5YbG66xoaHu/dOIkfWfmg7gHj8k9ZfyoJQqfyllltCWYvobA0BkI+PFTa03mydqQHgePijIJJIKGnLakop2XfLzCBI6HxfT2LUYJvdJX9wUxgGaXwRrJskKT8qEkZsvatdsXnghk10ZOCIM0RNqDUInEH7gXWDmd3NtR73zQaXjY8SL2bkTIZbFa2Toq7TMdR4Ih/ZHbHZaQ38CzkV2GysHU80CyVJAMuCVm2ThKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ImfW75Ej0CJDLxayEutRsb0cgLLbHpD24FhnXr/aTA=;
 b=peQy8eaNZZC3FNa94PyRwWpvVbExj5cNhyByE8Q9uGowuK7orUAjUwxdkMhsKqlfhcBQkhKJVcAjE029IJqiIrdi1SZ5vSYzqLYpit2/FA/4cf9/ruumx+eBy6ryoNtAx/lRL+C5kqNed/ySK7zpf3/Y18P9tBM6ODCzPUPpULrPpBSbgOZ9o+VPDnMHHgMAtQid2Q5rHNnvwtjV8OL137xUMAENBat6hwjfhZPyZDl6Q9MAVeysr6OTHnVxQjlzKk6UIfAiGzGUi1WPee8bIm51NV7gOZrW1iFmVYfsBBQ0lqXUA6fuqp6txCEelaWMF8WV5voHNka3TA5KfrjaUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <60e26ad6-7366-2604-e9b2-ed401cee6e73@suse.com>
Date: Tue, 24 Oct 2023 16:48:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [RFC 1/4] x86/ioemul: address MISRA C:2012 Rule 9.3
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1698155925.git.nicola.vetrini@bugseng.com>
 <76c9f78179a8bb5b4f99b34f163933394f79066c.1698155925.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <76c9f78179a8bb5b4f99b34f163933394f79066c.1698155925.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0240.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7951:EE_
X-MS-Office365-Filtering-Correlation-Id: d1e4adb8-71a9-422c-bec2-08dbd4a05207
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OeCf8rwEznwwlMSI5v17MBb2CGF+RUIzXtxQC2b2w+YgpNInx9bii7fDXKc4BtTb8dG4LDw4bZhttnETQ7iiHEmUQYR5rtHMzWuESLuhFBtEWltuhUDiu3dEhpA22MZeP1Es9J7wyJvqTrWOUwnm5uudyT2ktHDNoMAMOcxxY0UIIDUrcRScNoJ7Fzf5cR9+2MmRIa9ZK0i4bw5D0xYlaX90SZ+I1fPAuXEpzlvcKpDV1cU2ylregWMBttR7jk3fEj3+nt2YwtZpEQYdU+eGnTXZhAxBSG9SDSha4XFkUpGpCCcRBytMdCO9HLZmRalQiqQQnNZl/YTjLHugNuQ/FLPv5K45PVKXGfr0v2G72/HDyvQmJcWDDbyYnd24I1MmdQ3v1FqTsDk2lhOGIGLwafuFq/Pn5Dq+lOf7dEtUbsIWeSX1xdBkJ04k4ewUYMHRWKR+ij7pjVTGIvIbN/faVeeX7+sx1mvczwQCP2iUZL3F/K6fOe/YCrWN4EoSzA1LDWNtalvit70/vxBJahDeIWcY/XBTgjPTHlF3bvZje8beh1+JiIwsjD5SKgxRHegXuTzKl4smMNaSw6DvHUoIix9brsxfsY6e2j6Uemx5Uo+fhBhlxw3BTad6a8IjQWnbyiHTKsJo2HY8BoqqISs9uA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(396003)(376002)(136003)(366004)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(31686004)(7416002)(2906002)(41300700001)(38100700002)(6506007)(36756003)(2616005)(4326008)(31696002)(6512007)(53546011)(86362001)(26005)(8936002)(478600001)(6486002)(8676002)(5660300002)(66946007)(316002)(66476007)(66556008)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWZmUXZ4Sm15RjRrQTcvY3N1RzkxZFNzbXJ4T3JPMzJnVU41VS9wTkdmdjll?=
 =?utf-8?B?RlQ4NTRJOUhZK2JGcmJpTUYvampHMWVuaHRWbDA3ajNaVXZkS1IzM3hWTk9M?=
 =?utf-8?B?QmxPdWJKZXJhL2RncFcrcGxRalhPZS9NeFdQMmRWcmZRQU83MDZyZ1RkZ3NT?=
 =?utf-8?B?Q0FiSmtjMlc5YmF5Y3dNN2ZkSkVpb203M3htNnZtaGdHN0ROZXBCelFVbllZ?=
 =?utf-8?B?bVFSVkliT3A2dzlCdUpucUxrMTVpeVpQTnZiQlFjaEpDQlZ6U3VhTzFnNndU?=
 =?utf-8?B?aXVOQUpIS2kwa21GbUFuMWNjdkJubG82OXBKSkNhdHZuVFI4dkQyRm9KUk1T?=
 =?utf-8?B?eTFGQWVCMG42V0Yzd1NKZHF0dngvSXNrUVp3cy9QbTB4ZTByaTNGdm1EeTdP?=
 =?utf-8?B?UUcwc2VJNXFLK0N0Nms2K1FEajJQTVN4WlFqRWF2dXQ4dGd5YUFNVGduZEs1?=
 =?utf-8?B?M01MVndzV003OFJFM2QvdkJmRU9WbGNWcGN5eG1sNkN2eWp1NUhzdkZOeEJv?=
 =?utf-8?B?b21YWVZaMmVEZFBWL0VUN3B3Tm83SG5vMVNMRklYVUhEZVY0V2FZMUhlTndF?=
 =?utf-8?B?cm5Rbi8xTXI5aGFZZS9XczNydnNocHY5aU9sME5BdXBITEpkbFNReG9UUzE2?=
 =?utf-8?B?OXdDU25CK010WE5VczhmeUxDekNsVG5HbExmUXlxSGVLdmpBT1lZRVM0VnEz?=
 =?utf-8?B?aER0ZisrenJabEwrcXpSalY4bWRJQ2JQNmd3bHA1dWNkODNSVVkyYUkxZmlx?=
 =?utf-8?B?VE9SRXdZc292SnFrb3V3SnU4K0RZbit0QXd1TnZVMm1Ldm1rbnd5aEp4eWlt?=
 =?utf-8?B?ZE9uUEdEZnVIb0xGMTJtbHBDOXp2c3UrNFJKVGVRcDY2NUx0Q25QT2xSMWZG?=
 =?utf-8?B?dnVZVjhpdGNlYXlmUGhORXpEZzRwdWJ6MVJHdXd1NE9sWWEvS0lOY2ZJWk9W?=
 =?utf-8?B?QjlNanQvN3AxS1ZkZkFrMUhJbnMvNFNmVEl5L21vN0phcUg1WWJVWDNuazV6?=
 =?utf-8?B?UjdWU2U5TUJwYWczOC9kcG9kZkJERVFGK3JiTmhnM0w2bVlrNGVlK2pXYjVM?=
 =?utf-8?B?eDNKbGlUSGNITmRkYzY3TGgycm8vRVpEcHVKaUx6M3JWc3FRNDFsU3lGOExs?=
 =?utf-8?B?Rm1lMkFRQjJFTUllT1U0WWJNZVVPWlFGKzR0NUozc2tTRkZuUHgrVVQ5YjNw?=
 =?utf-8?B?aGs3cW5ITU5TbE9SOGp3ekFSOFVxZCsvbFl4bm41aTVPTG5IeS9pbkdUdHI1?=
 =?utf-8?B?QzNCOFg1aEN4SjMxbk5NTEFYRlNubGFXanppcjRiWWd0QzF4YitZeWQ3V0l1?=
 =?utf-8?B?U29XNW13YzE3TXFoUkJrMGRUa2ZFcEh5alJ2WTcxN2ZwOWRLUGNGVzRpaGFV?=
 =?utf-8?B?RS83cU1IaHlOMlZqbDNrbW9kUWJOanYvdi9jYnBqU3IvVkc1WlJPRnlRTWEr?=
 =?utf-8?B?Z1NWcGt1NXJHQXVZdVB6Z2Q3MisreFZabEpqTGFnNittZlZVVzEvd3JvckQz?=
 =?utf-8?B?bitYL3REZ3d4d2xpbjhvYWpKdExadFdYY0RpM0Z3MEwvZ2hMajVnQXRNcUpY?=
 =?utf-8?B?cEVxRmdTZVdMS3dybTJWLzZCUmNQWUcvbHhPc25RVHFvKzFrMUMwZ2t0M094?=
 =?utf-8?B?THZQbStFUTBJTDFkeGMzb00zeFdPWm1JSTF5aU8xZXZjQXQ2RTkvOGJkYnZj?=
 =?utf-8?B?YnhkSnV0T1lpTEFaUjFsbGFVeFFuVk40blFRTFVjSE1wSitTdXlYOE9CSE41?=
 =?utf-8?B?dmNlMi8rVWptelpmWFVIUnFtYlpsMEpmYVc4V3J6cVR6eDRyMlR5L3Z0TFpF?=
 =?utf-8?B?a3hMeHVNVUlURElsWk9nd0ttdzlwUlJSUjArNjIyZXhLd2h1M1ZTU3RRdVB2?=
 =?utf-8?B?R29hU0YxbWpnK0ZGS080cWI1MHgyMitKWTNmRWtpNmpRQ0RpU3NNS2Y0bHZX?=
 =?utf-8?B?Yk9TZ0dzV09qU3ZTSzN3VDhRbnhjYWs1ZWNMSlI2ejhTTzc2VFFlMWdIRk5J?=
 =?utf-8?B?ZE8rWUVCNTFnaXgyd3lmK0x0Nmk5eVA5WUs5SzhIVDJZTVJvQ2EvRUl4UnB0?=
 =?utf-8?B?c3c2eWxwNk8rU1pTNmo3R2s4eDFPaWw0UHh6c05NUTRoRUZXOCtiaTdSbjA2?=
 =?utf-8?Q?1+7we+AzHZ+QKSAPMcxhCOucT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1e4adb8-71a9-422c-bec2-08dbd4a05207
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 14:48:44.0145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jdY+UiMDkAjSf5BI3mhTo0dC+YwmTPt2XcAiLRejROSo4JeUh2ehU7kRtAUcrxEby57/t/eaOmDP+5FZEKId6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7951

On 24.10.2023 16:31, Nicola Vetrini wrote:
> Partially explicitly initalized .matches arrays result in violations
> of Rule 9.3; this is resolved by using designated initializers,
> which is permitted by the Rule.
> 
> Mechanical changes.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

While not overly bad, I'm still not really seeing the improvement.
Yet aiui changes induced by Misra are supposed to improve things in
some direction?

Jan

> --- a/xen/arch/x86/ioport_emulate.c
> +++ b/xen/arch/x86/ioport_emulate.c
> @@ -44,57 +44,57 @@ static const struct dmi_system_id __initconstrel ioport_quirks_tbl[] = {
>      {
>          .ident = "HP ProLiant DL3xx",
>          .matches = {
> -            DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
> -            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant DL3"),
> +            [0] = DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
> +            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant DL3"),
>          },
>      },
>      {
>          .ident = "HP ProLiant DL5xx",
>          .matches = {
> -            DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
> -            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant DL5"),
> +            [0] = DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
> +            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant DL5"),
>          },
>      },
>      {
>          .ident = "HP ProLiant DL7xx",
>          .matches = {
> -            DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
> -            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant DL7"),
> +            [0] = DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
> +            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant DL7"),
>          },
>      },
>      {
>          .ident = "HP ProLiant ML3xx",
>          .matches = {
> -            DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
> -            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant ML3"),
> +            [0] = DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
> +            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant ML3"),
>          },
>      },
>      {
>          .ident = "HP ProLiant ML5xx",
>          .matches = {
> -            DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
> -            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant ML5"),
> +            [0] = DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
> +            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant ML5"),
>          },
>      },
>      {
>          .ident = "HP ProLiant BL2xx",
>          .matches = {
> -            DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
> -            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant BL2"),
> +            [0] = DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
> +            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant BL2"),
>          },
>      },
>      {
>          .ident = "HP ProLiant BL4xx",
>          .matches = {
> -            DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
> -            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant BL4"),
> +            [0] = DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
> +            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant BL4"),
>          },
>      },
>      {
>          .ident = "HP ProLiant BL6xx",
>          .matches = {
> -            DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
> -            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant BL6"),
> +            [0] = DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
> +            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant BL6"),
>          },
>      },
>      { }
> --
> 2.34.1


