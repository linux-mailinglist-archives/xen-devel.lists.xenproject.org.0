Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BF06C33F4
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 15:22:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512726.792891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pecsS-0007SH-PF; Tue, 21 Mar 2023 14:22:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512726.792891; Tue, 21 Mar 2023 14:22:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pecsS-0007QC-Lp; Tue, 21 Mar 2023 14:22:16 +0000
Received: by outflank-mailman (input) for mailman id 512726;
 Tue, 21 Mar 2023 14:22:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NAJ/=7N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pecsR-0007Pn-ED
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 14:22:15 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20631.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5f84aa0-c7f3-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 15:22:13 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6895.eurprd04.prod.outlook.com (2603:10a6:803:13b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 14:22:10 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 14:22:10 +0000
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
X-Inumbo-ID: c5f84aa0-c7f3-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=neunr9UrFpUkMxgv2kpg21BouF5jpO6xrpqZWUrnV/hlHnXKv6SwpC8dUV7rLJ2reACEfhwZ6nTySxsigs/1/CTyc2QnhH9FGCyx9LQ10z8qVjueHkotPHD2jWV1CwWCbTn4M51iWAioayz6ZvADj1sBO/c2LTqnPMhSJgcEy04ys+mWV2OWSMs2DHT0tVtO3KV1RMRw4mNRp0W2tDuZ1WaZRu3ees5KnPsMhVdgYVjvROCHyB9lh3emAyW2VotjNEYou4pn2TiuE1ae0opsMM2RyrhcTuFyHWHxdLUriv5aO9ptlbqMI74LY6XMksZ4eOgW0+DdH6Cp9L1oBuOZKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B1EnL6983SI0TKLh3dr0X/w3dETG+vIo/DRpVGM2Gt0=;
 b=eu2jxdCUNt6r2YGwDJ4U1oPtP0qZiGE/BcCIi0JMesnkzxBrFIPRDCqKZ12h4bGD1KVVW8REsguGRSl7q3YEpuNHm52Ybd7jzwsDhVh+IR/9oY09cNY6V3HHRmlxBUN+czL/ezEBc6MP1CuQ3tx7+7SEO6XunLvEOxnuIbJRCF+p9863B6nrc+0/30MaflTQIFIvPvI4IYwhcYglH/uVSVX0baiEXUsN8cLfspZyGwb14XiXLcIbaqd+EZjwnk2Nka9HceK8TS2/6/quEw668NqBRV4m8K+KLnFzkfLmHYPAf9ofiUP4KAL8rOOSGg4VzBtks3xBPaeyD/RFdSPVxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1EnL6983SI0TKLh3dr0X/w3dETG+vIo/DRpVGM2Gt0=;
 b=LXLHpFSZ6/j/Cjb102ZQKjVAto1caNNP0UKnNlmaOO2J00ToaTh9vH/cOtoaEcqU8XbfsXyRJnyk+Q/jpI4vSXDzZH11iAVTPKrJcgKBGQ9EkxaKEV5/nV3yxB+m20EY/gNDed8JDUBzAmX+qV7BXZZ0u+DC9nsB3LxXjZr3uR+PLOwuuI9bVZiiBHyOwBQEREOSrTinHH+tqv0Mi8V5Yatz4a/C0vBeMDMpDYTzWDEBjDSLEtSsLFHyeQDjABUpfHpDhTahW+hKMnFQfQdaKwIWWifrKODUhzlzfjY2T6RXEy7CwcdNkTQi/Cy9aaryn3kQGyqAeC0/+biy7jvQiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7d90ad7a-5daf-915c-2055-a27ca50d8581@suse.com>
Date: Tue, 21 Mar 2023 15:22:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [XEN v4 07/11] xen/arm: Introduce choice to enable 64/32 bit
 physical addressing
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, wl@xen.org,
 rahul.singh@arm.com, xen-devel@lists.xenproject.org
References: <20230321140357.24094-1-ayan.kumar.halder@amd.com>
 <20230321140357.24094-8-ayan.kumar.halder@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230321140357.24094-8-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0192.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB6895:EE_
X-MS-Office365-Filtering-Correlation-Id: c35257de-81a7-42bd-5dc0-08db2a17a8ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JL6OowKw+Hg30qkyBPyLoeyixTCzUcL4gnG1epUnkBIIkYVxfzUDIOVcGrF8Vb1A9izrZYcR37rVMYVLxBDFw7O73uWJtw9tSBNCfduLB+s4GMMI7tJpR6YI2L3eQuVsNWZsOZUo98s+A2+0Trhb56youeM59o2IjC3OhNSMsJzoM3YY2NR9mPkMgj8g5Id3qWvTZmkHoirVNEvotfIn07uXj8aXBkrk4LhZSUZ6azu5TObaMwKWHgvgSlxmlyt+UniIgpEfzWzT7UE9D/FMEIHb/yriMdhcuo9k6I3+2RTRawuPqKS2sEAn6bENWRzLStEq7PvlX6AAMBFCsx4uKhiLfYUSEEjCmm6ZQgQB4qmW45QZa3oXQkGdqjF/YKF/ROdIwsDuEN7KPmIXhX3NqKUGV8vINgJD+MvgrmAJIRe5ZyKOTKLSpdr3QwWzyIGSppB0dE+8/TyqBQ5bPtlCh1wiBSW1OJLqR9C5YunQoxniWxj1VP+kpiWYrW/2HhKh3ofyFKLO0gZeohMnr3bLQAnp6H1CFqlsNdQoUt5d0jp4l9Lcsb/l0vzjWy/dmfnn3GKtOzqHQqdd4J1tjtXrKD1ID7AMh7VMFRJ+AyqZ4jvZuQl2gFnJn5cKde1GFv/W9O0F4zjL2ti41ud9yxqt/RPSnG1Zf7bRYKQ1R1B1HhePxmnqF6cvscj+vDKFpHWOGcmtTiFRWSaDzSXNoZNwb4kk5qND+KT3vmuZM8RZk5o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(366004)(136003)(39850400004)(346002)(396003)(451199018)(316002)(31696002)(38100700002)(7416002)(36756003)(8676002)(66476007)(66946007)(6916009)(5660300002)(66556008)(4326008)(8936002)(41300700001)(2906002)(86362001)(478600001)(83380400001)(31686004)(53546011)(186003)(2616005)(26005)(6512007)(6506007)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QTJrdlRvVU8rY2N1a0RJeHVKWHhDVDJEWEpoOXZXRjBzNWM3RWVUczZSNW9r?=
 =?utf-8?B?U280ZysyK29VSWJ3bnhqLzRHb29LRmdOU2k1R1JTUm9Kb2tuS0F2Sk03a1ZL?=
 =?utf-8?B?Qnc3eGpucVA2ZHpmeHJmc1hSUDBTaWF4K3J2RzZxTmlzYzRrR1FFSnhBd2Vw?=
 =?utf-8?B?QmlibmtsV0VwOTRoQmVUTng3ZTFLTE5sWEtucUR3Q3VUeEMxaWNJK3VLRU81?=
 =?utf-8?B?ODhXekhvbXQzdUpSZk5ZWXJLdDVlME5EekdFZVdJZlgzdWlRUXFlZG13M2pr?=
 =?utf-8?B?bElwMGRPM0hRN3djV2g5c1pNUEZTTUFTWmk0VGpGT2FDRnkvb0lwNnEzcTJr?=
 =?utf-8?B?amRuNjVZb00zUkluY0lWYy9Pa0svdDUvNWU5aWFlR3lia0hQMnlzbXJ6L2th?=
 =?utf-8?B?NS81NkdQbzUrbVV3ajc3djcwUGJ1VHVPQitib08rYkxhNitiRFRBQ2tKeG5R?=
 =?utf-8?B?RmFubURHOVdyZ2xsNDhRV0VMMG9VWExVYncxZUxRYjZQbUg2MGNTeWRJZnlG?=
 =?utf-8?B?ZXRyN3g5SXRrei9JNkJZcFNoK05VNy9VckJvSEVCSkhiN2pCUEdsUUh3bXV5?=
 =?utf-8?B?Y2E5V1N0RDREZGwwVFJIVzg3Y1RRbjVNeXhaM2hmVTJSUk1sWkNTUjlSb2RO?=
 =?utf-8?B?azhyaExDb3FqT2xKbGRObWtab3JkYkJ2d2RSdW9mcDdUN0ErTUN4VnN4bTg5?=
 =?utf-8?B?V1k5a1BwME1pYVpZVnhiNlZFYkxxTDN3em01TFYvcFR4VHNKZnp2VDJKYnh4?=
 =?utf-8?B?MkVXUlZPNVM1OEdmZWZNcjU2djQxamZYZHUveDlpMVkwcWswSkFPNDhCR3Ux?=
 =?utf-8?B?ZjErVlNBL21MMmkvbGNPM2JJNGxqK0lLOXllOXpXTzZNZFlVdDBoT0YrVjUv?=
 =?utf-8?B?V081bEF6RnZlZUxEUWEwa0FNL29aTlllME5XV2N1REZ0ZmkyM0pNT2lETDZE?=
 =?utf-8?B?cHhZUGZwZ29tVTM4bmg5em1rK0VCRU5iM1dQVVNpU25aVURHck9qVEpTak9L?=
 =?utf-8?B?cU1paEEyQzI2SDlCbU9KT1dtcUY4ZEFUckFDei9BUHNWU1VUYUJNa1o2S2Zv?=
 =?utf-8?B?REc1V2x1cjdmQ0dPNzhycUYxM3BCMVhQaVFnWitrbXBPOE1YdHgyY2w0T3Vk?=
 =?utf-8?B?UEF6aXlMRlAwQlpaSlA4WU9CMlRvQUtjN25sQXB1RkNJNm1aMlp6ZjJIaW5x?=
 =?utf-8?B?cTZMVWVYZVptODlNWURzU2dKZktRY2dWb3B6cy9zSjQ4YmVWVGZDam83WEFR?=
 =?utf-8?B?Q01lem5FQnNlWURibDgzTkpRN01EZWpxOFFzQjkybDlsbysrOEozL0YrMmZ0?=
 =?utf-8?B?U1NqakQwY01xdDhMVWRwSWt6K0NmandONk1iMTJmVkgxMlFaOVNLSGFIdnRN?=
 =?utf-8?B?NUZ1bzNkZW9kdS8vTFF1OWE3Q1lPVFczUWlBckVZWm82dDNnSEh5SGcybDND?=
 =?utf-8?B?ejExYUVPZnBqS2s3VWtObk9TMG4waXFGZk92bkUvalpMRFhidnd1UnFLTlAw?=
 =?utf-8?B?MmllWHNTcFNhS2hWTGxQSVNVYy80cEs0Vlczd200N0ptY0hlVnFXRHc4NmZh?=
 =?utf-8?B?TUdMOGNPcXc3R29Nc3pIUU11dnp6anVwbk1RdWRObGEyRC9yZzN5bXRwMEk0?=
 =?utf-8?B?MmUyb3JMSjhaMW1PWVgrc3NZRTJOeGhLWW40bVNkN0h6Sk5IbmdCaldLWkVC?=
 =?utf-8?B?SFl1c2pQTXgwd1VNamJMTHdTeTkzazF4WjFRVmd6eitMa21xSXlROFVtOHBV?=
 =?utf-8?B?UGJycnZjT1FDaWY0aGJTMlJseFZqQWRrMDFYSkw5QnpJOC9WYjhKQy9JWjhx?=
 =?utf-8?B?THdDY2l3WjZGOEt3RHBpdFJVVlFoRkxJZWlramI1YVBjTXNFYlZjRzMzS1JZ?=
 =?utf-8?B?bitBcmM4eFBaOGk3bDBlMUdObzdKQzlQTThNY3pVTWtSZDJVTENwUWwxZlZT?=
 =?utf-8?B?WitwZUZDeXFVZkhqL0Q2aDcyT1B1WUM0QzVudUtTVm5vemJuMHI3dnNpOVVX?=
 =?utf-8?B?ckhFRm5lV0ZqUnJsODhWay9jUERBWjE5T1cyZVlFaFJKaWxKS3I1cU1OQTla?=
 =?utf-8?B?TlV3ZUxlZUVFa3RNQnF1NTVFN0ZuZ3doN2JMRHJVWURtSGJMYSs3MnN6aGY2?=
 =?utf-8?Q?dB6vw86ezpCm0xdx6xf1O+1Jf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c35257de-81a7-42bd-5dc0-08db2a17a8ba
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 14:22:10.8332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E+U1du458DbHdA4Zd0v2BLygqeOmdiGrNQPDraiASSIMZ8hrF9nlDECjQBai509mtTH2KTX3Nb87hlIAsiLGwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6895

On 21.03.2023 15:03, Ayan Kumar Halder wrote:
> --- a/xen/arch/Kconfig
> +++ b/xen/arch/Kconfig
> @@ -1,6 +1,12 @@
>  config 64BIT
>  	bool
>  
> +config PHYS_ADDR_T_32
> +	bool
> +
> +config PHYS_ADDR_T_64
> +	bool

Do we really need both? If so, what guards against both being selected
at the same time?

Them being put in common code I consider it an at least latent issue
that you add "select"s ...

> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -9,6 +9,7 @@ config ARM_64
>  	select 64BIT
>  	select ARM_EFI
>  	select HAS_FAST_MULTIPLY
> +	select PHYS_ADDR_T_64
>  
>  config ARM
>  	def_bool y
> @@ -19,13 +20,48 @@ config ARM
>  	select HAS_PMAP
>  	select IOMMU_FORCE_PT_SHARE
>  
> +menu "Architecture Features"
> +
> +choice
> +	prompt "Physical address space size" if ARM_32
> +	default ARM_PA_BITS_48 if ARM_64
> +	default ARM_PA_BITS_40 if ARM_32
> +	help
> +	  User can choose to represent the width of physical address. This can
> +	  sometimes help in optimizing the size of image when user chooses a
> +	  smaller size to represent physical address.
> +
> +config ARM_PA_BITS_32
> +	bool "32-bit"
> +	help
> +	  On platforms where any physical address can be represented within 32 bits
> +	  , user should choose this option. This will help is reduced size of the
> +	  binary.
> +	select PHYS_ADDR_T_32
> +	depends on ARM_32
> +
> +config ARM_PA_BITS_40
> +	bool "40-bit"
> +	select PHYS_ADDR_T_64
> +	depends on ARM_32
> +
> +config ARM_PA_BITS_48
> +	bool "40-bit"
> +	select PHYS_ADDR_T_64
> +	depends on ARM_48
> +endchoice

... only for Arm. You get away with this only because ...

> --- a/xen/arch/arm/include/asm/types.h
> +++ b/xen/arch/arm/include/asm/types.h
> @@ -34,9 +34,15 @@ typedef signed long long s64;
>  typedef unsigned long long u64;
>  typedef u32 vaddr_t;
>  #define PRIvaddr PRIx32
> +#if defined(CONFIG_PHYS_ADDR_T_32)
> +typedef unsigned long paddr_t;
> +#define INVALID_PADDR (~0UL)
> +#define PRIpaddr "08lx"
> +#else
>  typedef u64 paddr_t;
>  #define INVALID_PADDR (~0ULL)
>  #define PRIpaddr "016llx"
> +#endif
>  typedef u32 register_t;
>  #define PRIregister "08x"
>  #elif defined (CONFIG_ARM_64)

... you tweak things here, when we're in the process of moving stuff
out of asm/types.h. (Using "unsigned long" for a 32-bit paddr_t is of
course suspicious as well - this ought to be uint32_t.)

Jan

