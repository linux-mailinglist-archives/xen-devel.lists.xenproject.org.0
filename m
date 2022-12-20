Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DF86522F2
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 15:45:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467087.726089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7dr6-00006s-3F; Tue, 20 Dec 2022 14:44:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467087.726089; Tue, 20 Dec 2022 14:44:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7dr6-0008WJ-0U; Tue, 20 Dec 2022 14:44:32 +0000
Received: by outflank-mailman (input) for mailman id 467087;
 Tue, 20 Dec 2022 14:44:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I7dU=4S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p7dr4-0008WB-4v
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 14:44:30 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2055.outbound.protection.outlook.com [40.107.105.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce799f5c-8074-11ed-91b6-6bf2151ebd3b;
 Tue, 20 Dec 2022 15:44:28 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6916.eurprd04.prod.outlook.com (2603:10a6:208:185::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 14:44:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 14:44:27 +0000
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
X-Inumbo-ID: ce799f5c-8074-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MN+iGPduYT+tWlRZxoeUM4SZimtYgc4CTfsKyRd8tI/MO+nySJA+kzMf2MqSOrWfIYGSEXTBiwTTWc0g5THpAWB6+zz27ehnsmiixdlLTcmJs9fs9JwwUSal//Ly16xLhtZ3UW7NO4jLkonMKX34jMtMAwnRtdCyuxQYoBEW0g8ycChLQrOHuVdGdQ54xTN6mw4Vom05VoS8kSZdr3QAt4hxsLEW2353BugyDdhp6qoAXRntkNv1+gX/+KyZbUNBq5+Kb9RssLaVpngjwYStFK7Mp7NAlSOH+/iklvvU0mtVV/n/fmEX+TF3cD7IuHJt7YhvOrZsTSTJ5nXjLBazDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cHDx57WDSD/FjQk5PiixAk4RHyYd8qzwEI6QOqzXKTs=;
 b=HyLQNltxD/2iHHUop0JaGiPyVy7O+M5AiV0mhIgy3PeX2qPboS4C2I2PJuMFEdp0uqHAW7G3mFxyyMcgEdk5sFxqrUSL0vTXbpM+lckxxftrCWyfufmWEgc5S84E/hxpM+GEghT7R0fZ34R18Ls2PFBlrv0B8IPY2gY24AMbrMOeN8EfS/5Dx1O6lpB9uzIvFmswmN+/fq4Fa3es1f2bIFg+qRsFATV4gOg2ocVDKWcb66h/HJMATvi0iabq2zhsvNF0CmuRnl7L6Kf96rufCLr4O7qnMbPXn1SmqB6+oRSRpZH5zrSIuJ5aVbtm3TDg4L6YuixTm8RNrwI8kNlVRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cHDx57WDSD/FjQk5PiixAk4RHyYd8qzwEI6QOqzXKTs=;
 b=iFWlATDilYahsj2Zyi+sug/T1Obehb89Qb9ZUU6hpLCdvPeYtLnQqtL7FiZfJGOCYyaJPTtvWCxtsYlsWUuJcACpw3G5f465OLhlTu+zGCLqLrkd4XtNsIJJgPYEbFu44QDcMEer7TbNfmy0RFkJC3NrpNXyyeMzhvp09vwlW+7ykEjkC+HgH+m2mSwbMcWys7zn8XNHLpBPdgY9rY+Dg37vvfVQE1SrQqGxXAepdtf3qelEjWlUe81HuiQi6i3R0wzgU7n+YWaBP20ALjSsbUBaErynU8TpevQbtix8VBSUk7FE3UaH2mF/STCKo8IdlDhoxCdiNsCoP7Y7mHhH3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <87a0153a-aa90-6358-54eb-e78d005bcb18@suse.com>
Date: Tue, 20 Dec 2022 15:44:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 2/2] acpi: Add TPM2 interface definition.
Content-Language: en-US
To: Jennifer Herbert <jennifer.herbert@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <0548fa97-5384-94e4-7329-b019e60555f4@citrix.com>
 <20221215170934.123889-1-jennifer.herbert@citrix.com>
 <20221215170934.123889-3-jennifer.herbert@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221215170934.123889-3-jennifer.herbert@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0008.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::18)
 To VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB6916:EE_
X-MS-Office365-Filtering-Correlation-Id: 1baa3db0-083d-4d6d-b06e-08dae298b1e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vwzUv23GHhD2M/0uFk1jAODHaNkxAEdW+iobYcKJzv3aJH/Imhw3/+EAqDjH/gAZioZjTFFllY9p9QYEeXPj+bDEMBC8Umi50FoYHnjySZBARW/0oU3WoJBuf3BkxPa9MLrxQ/rx4TiKnxvhBSX6JMxhoA8TBC02W2w8OfzTTZrBVlvvS+rxCpFuKy9CcrSbElgdWDQtxagJS6n0ISAi6g/8Lgo5MQDp4qPG2LC7zrBnXCyK0ra/uke+ngM/Wq5MphwZeTxZpi00Vc6DP3VSnHEPyA2EV0FS/KNCZ+HKXoq+Dmd5XMPGLU+ppIZV9z9LH9b6HltRBGClwZIp0INEtmZspu1/J7D0SqXXLY04tRA1g6vSOmSWcKC8yHSb/OiRbZK/Lr7G4sXF7JyKGfAhDo0sUrOxKuH/25p/a4OJZrD3eB+hujq+L0l94Te1Mj+zk876J1cKeJ3XxLcCEJNGFOu/1NvYvDuSD8s/xy32zkqgrf5ctpBVE+mj1B+v7NclC3o29b+SCjAtrlj0b62ClazAd4113pQcEAIBPhofjXPpKz7csRwzsOWbp3MrVm3HpE7YKR9iOyIwyZ5MFLVMeg0LCzzX7maYEZfxO/IyzMkAYuvu7eNrDaSXxZR/qao03dC7TfLYsHND5sAy6qf+45OA9jAzZ8NmW6fbqPciyJ9JVzFTf9GeCaVk5SS/Lu0URtAcyC5ssyLidQNFDd1OGhLfp1EJSG4melSZzlsm17Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(396003)(136003)(366004)(346002)(39860400002)(451199015)(36756003)(86362001)(316002)(31696002)(54906003)(6916009)(478600001)(6486002)(8676002)(66476007)(5660300002)(2906002)(66946007)(4326008)(41300700001)(66556008)(8936002)(6506007)(26005)(38100700002)(6512007)(83380400001)(53546011)(186003)(2616005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFZNOXQ0M3ZPYVo0RkVhWFM1NjlCdXlyYWFLWU1VWkdVYlIxamdZMjBpTUx6?=
 =?utf-8?B?TXNtd3V6UUpwMnFDMC8zeE9CVlk2YXM5T0gyT2QvK1Y4QjFrenZOck5Tbm8y?=
 =?utf-8?B?UjMxODZGQVFVanV2MmlGRVpGZUxpMGFNcXgyUTlBeGlEL3JFdTB1aE1mekli?=
 =?utf-8?B?MlJpenVrUm9SNGlGa3Y0OEpNUHk0K1JmakNmNUtlYit6bkxiVkhwZW5RdWxB?=
 =?utf-8?B?ZE1lQkRuSmx6TTRPdmd6UWNwcWc0UC9YQ0JDQmF0azhhK3U5NVRtUVprL3ha?=
 =?utf-8?B?SnVIY05Sa2tRTXV4U0xXeTVMSmZWTXF6RHdLVllEMEJmQjB0Y1AvN05wejVM?=
 =?utf-8?B?T0F0NWhVNjE0aWlYUk4zeXNVY3Q0dW9kb0l4UmR0RG05ZENUV1Jic1ltSlNm?=
 =?utf-8?B?NU9XREE0RkpFT1BZSXBWQkRCUWxJZGh0V2g3SVlqY2VsZ1UvdWFQWVBXS0dz?=
 =?utf-8?B?R2NSZGNvN1JrVm1rVTVVR0xOWEErOVJHMEZ6VE96YnZidkY2QjhCQWkvakFs?=
 =?utf-8?B?cWY5dDdhNWpiZjlaY0JMeU9NL1R5VmlOVUxxRVpxcDFjRE5CSmpLejVRckdG?=
 =?utf-8?B?bzR2aE92NUNuK3lrZFRaalh5VitsaExvUWNnMWZYdE1XT01GQ1M5RFBnTTBy?=
 =?utf-8?B?cEpyblpkQUJPdnpoZzJjZVRRRGlWRTlxRUo0aFpERzh5c3NtSjZrN3pOSEpF?=
 =?utf-8?B?LzNKVWpobGZPdjFTckhOQ1hVNnRSdHNWbkNvK3N6cXFMRE1ISHJpVnZ1MWQv?=
 =?utf-8?B?MkpWSDVJdW1xVUVlUndTblpaZk8wdWVxZ09XT1NJODR3ZVJZR3h3MHRVYWZh?=
 =?utf-8?B?VlptcFNIUkRLY05HTmNMUWcvWU81MGZtTEtNL0d5Q2VSOGljQkVqbmdDZUlJ?=
 =?utf-8?B?N04vVlV2MGxrY2RJS3huREd3S0FUZXA3R0JYQk4wZFhzV1ZDV296TjMvQUxE?=
 =?utf-8?B?NDRTbnh1MTdLUU40M25hWGJ2cU9OYVg1VDN0Q3RrMWdNQjQySjc1RG81K3or?=
 =?utf-8?B?Q29xZnIwUTN1K1J2ZytISC93d3ltclRUc2tvN1pFVDZ4ZUVCTlpvdE8ydEpm?=
 =?utf-8?B?Z3lqNXd3U2N5bTNMNHd3cXpPLy9JSG8rQXdVUXpaRFhyTVphejNGV1ZFTXp1?=
 =?utf-8?B?bHYvRHZuMTVNc3JDTFMzVkV3ZjB5WTlQcEJjUm8yM1U5K0FLZlBLb3RtMUdm?=
 =?utf-8?B?UmpqU2NsMHdXdllBN3YvcnptNDVqOEc1NmUyWHQ2UVdyL2dTYktsclBwL2dy?=
 =?utf-8?B?NDhSTW5icXBrVWxKOEJSa3Z1QmNad01EQm9LYjhpQzBHNzMyblRabmRrQWJZ?=
 =?utf-8?B?U0doQTZ6OFFnUWUyWERZWjV3UzhKdGJNMnpMbmNVNDRSeU11VVlJZ2wzZ1k1?=
 =?utf-8?B?OHB3MnBGNDVUK2NnVk42citwcVZxM3M2NUR4OVFXa0NpVkUxaGxnRkZzd2hR?=
 =?utf-8?B?WUt1SU9qOUllMEpPU2FFajZSNmpNVmhsU0Y5RlF1QnV2SUJxTC9ER3FQR3A4?=
 =?utf-8?B?WUxNNk5pU1hEZDNTTFA2VSt0UzdULzVhKzZUMXVHMnRuOVcxUEtQcWE5R2U5?=
 =?utf-8?B?Y3p4WHJjVlFDZFlualNTbHVqMmM3MXp3Qng2b0t4UTB4K2YzWHNBMGQzb3pP?=
 =?utf-8?B?QVIyMGt4SEE0LzFVR2k5UkFzVlN2UHdqUE0zS3RqVStEdFU0S3ZTTXBvSkNt?=
 =?utf-8?B?U3E3RjJwOTh5MngycWxWSm81NDlsbG13dkJaUTdndFRETURQLzFIVHZjR2dp?=
 =?utf-8?B?ZUZGNHBhcEVkQlZpQjBZS2NJb1E4S2J5UjdKRnlPSUJWaHdyWkFNVEVkNGhk?=
 =?utf-8?B?V09jUUhhV2hzdWVCTmU2Q2k1TlVENW1EUmk3U3NsS01lWDFGb1JQbGllV1VQ?=
 =?utf-8?B?Sm81Skw1MEMxTlhEd00yKzVUOE9CaTZadWVoWUllSkJVZStWRUVHZnYzNVNI?=
 =?utf-8?B?S2RTajZwaEdONUxjTzkxSUt5Zlp1cWhITjM5RzA4OXFtTDhFRXY4cjVYc2Fp?=
 =?utf-8?B?QUxFNktWRmk0WE4yT0lJRE91YnlTVnNhUkZIb2Ivd3EzN0F4TVdqdTh6SDNL?=
 =?utf-8?B?cmNtR0NFTnlwMzdhM1FwamNISTI2Z3hic0x6SmROM1FiN3ZnU0dESVArRHpo?=
 =?utf-8?Q?noRfYGelK6cm91aGRL354jpkk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1baa3db0-083d-4d6d-b06e-08dae298b1e8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2022 14:44:27.5475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OY3Sa8UnVzgpdxYfu3h/ZdMYdeRwVODaPovdBkxhjXfcDsfWervkHeU899gU6EQSIODyWMIiJT2TC1HAK35DLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6916

On 15.12.2022 18:09, Jennifer Herbert wrote:
> --- a/tools/firmware/hvmloader/util.c
> +++ b/tools/firmware/hvmloader/util.c
> @@ -1009,6 +1009,13 @@ void hvmloader_acpi_build_tables(struct acpi_config *config,
>          config->table_flags |= ACPI_HAS_TPM;
>          config->tis_hdr = (uint16_t *)ACPI_TIS_HDR_ADDRESS;
>          break;
> +    case 2:

Nit: Blank line please between non-fall-through case blocks.

> +        config->table_flags |= ACPI_HAS_TPM;
> +        config->crb_hdr = (uint16_t *)ACPI_CRB_HDR_ADDRESS;
> +
> +        mem_hole_populate_ram(TPM_LOG_AREA_ADDRESS >> PAGE_SHIFT, TPM_LOG_SIZE >> PAGE_SHIFT);

Nit: Overlong line.

> +        memset((void *)(TPM_LOG_AREA_ADDRESS), 0, TPM_LOG_SIZE);

Nit: Excess pair of parentheses.

> --- a/tools/libacpi/Makefile
> +++ b/tools/libacpi/Makefile
> @@ -25,7 +25,7 @@ C_SRC-$(CONFIG_X86) = dsdt_anycpu.c dsdt_15cpu.c dsdt_anycpu_qemu_xen.c dsdt_pvh
>  C_SRC-$(CONFIG_ARM_64) = dsdt_anycpu_arm.c
>  DSDT_FILES ?= $(C_SRC-y)
>  C_SRC = $(addprefix $(ACPI_BUILD_DIR)/, $(DSDT_FILES))
> -H_SRC = $(addprefix $(ACPI_BUILD_DIR)/, ssdt_s3.h ssdt_s4.h ssdt_pm.h ssdt_tpm.h ssdt_laptop_slate.h)
> +H_SRC = $(addprefix $(ACPI_BUILD_DIR)/, ssdt_s3.h ssdt_s4.h ssdt_pm.h ssdt_tpm.h ssdt_tpm2.h ssdt_laptop_slate.h)

This line could (the latest) now also do with splitting up.

> --- a/tools/libacpi/acpi2_0.h
> +++ b/tools/libacpi/acpi2_0.h
> @@ -121,6 +121,30 @@ struct acpi_20_tcpa {
>  };
>  #define ACPI_2_0_TCPA_LAML_SIZE (64*1024)
>  
> +/*
> + * TPM2
> + */
> +struct acpi_20_tpm2 {
> +    struct acpi_header header;
> +    uint16_t platform_class;
> +    uint16_t reserved;
> +    uint64_t control_area_address;
> +    uint32_t start_method;
> +    uint8_t start_method_params[12];
> +    uint32_t log_area_minimum_length;
> +    uint64_t log_area_start_address;
> +};
> +#define TPM2_ACPI_CLASS_CLIENT      0
> +#define TPM2_START_METHOD_CRB       7
> +
> +#define TPM_CRB_ADDR_BASE           0xFED40000
> +#define TPM_CRB_ADDR_CTRL           (TPM_CRB_ADDR_BASE + 0x40)

What is the relation between these two and ACPI_CRB_HDR_ADDRESS
(0xFED40034)? Independent of the answer it would be nice to have a
BUILD_BUG_ON()-like check somewhere tying the two together (and I have
a vague recollection that I might have asked for such in a comment on
v1 already).

And since afaics the space at that address also isn't filled
anywhere in hvmloader, the description could also do with saying what
entity is doing that (qemu?) and hence with whom this needs to remain
in sync.

> @@ -449,6 +451,39 @@ static int construct_secondary_tables(struct acpi_ctxt *ctxt,
>                               tcpa->header.length);
>              }
>              break;
> +
> +        case 2:
> +            if (!config->crb_hdr ||

See the respective comment on the earlier patch.

Jan

