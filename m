Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EA475C7BC
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 15:25:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567539.886730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMq7c-0007gC-S4; Fri, 21 Jul 2023 13:24:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567539.886730; Fri, 21 Jul 2023 13:24:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMq7c-0007dt-PG; Fri, 21 Jul 2023 13:24:40 +0000
Received: by outflank-mailman (input) for mailman id 567539;
 Fri, 21 Jul 2023 13:24:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBlW=DH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qMq7b-0007dn-A1
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 13:24:39 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0660c79-27c9-11ee-b23a-6b7b168915f2;
 Fri, 21 Jul 2023 15:24:37 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS1PR04MB9504.eurprd04.prod.outlook.com (2603:10a6:20b:4c6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 13:24:35 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 13:24:34 +0000
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
X-Inumbo-ID: f0660c79-27c9-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RXhCC7DfOq8yUDRGDvTN4kHk0Zc2KZXyQ+R09U5+5RPXxWLoNpgp6DwEcZOBtHPjW2GOCOMRutDMW6hnPiAKJ1Ix8OgPM5/blEXu6wBU5aDG6hs0RSrkIta09ckqGYQf+weUEVGsx9X3yxuyUDVl2H0ynO5FYDDHR9JumCEFWGlmEi9mLBwnSfeTvJSnPDt6KdtfmzePh4wr6IfqcINv1iPPJYbU+oC/UnJEmBT74aXMDt1XsZ2QTGeVOYSVvEfWx+Oa+jldxMpTD27UBKV6vlkA8WFnuAWyrh71RAmbSGqS54eDdMCq719Su6MzHXxXLxfLH5kE3jh5BTjQ9qJRnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SL6scpT7Vjwvxd9wo5uPjS1KwEjnYbIgvSSfJSCJ0aM=;
 b=Fwc51eGAz0v9mcJrseYEh2c9U8SUxfIwAQKTOVUcUNZgZtfTyb/eoixbkYZiVRjlKyFnBIKxYlHs8nWQQ/claqPhHz8u3E1L1hg2nzX7hpkkTMj7a4AKzzEAr5O44KArh1GdvMHmXILsQ1aAVXwasNhA62ho41s5V72C+S1ggPLxWkJ02aPDVJOOnEUk+FxRIb3m6FwakvTWO4tirVxckDRsaNDFJo0h4GlV1wXEd4Nrg0AByAkTMl/G9r68EVUv7gY/kKWTCddES2fPZX/qfJdowYCfYSyBZAPxx3nkzrSZFpsAwwRhLiiAZ9jta3AKAUChsATf0EAW/lx+dO1jXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SL6scpT7Vjwvxd9wo5uPjS1KwEjnYbIgvSSfJSCJ0aM=;
 b=estyIsmbcT1wGOs4RpoPs+rHLKeGTvIiLvNnYK3vdx6U8Qt5paQiL4C1iLaEFxJQ0Q1nhjSp5cVtAmSZJedbY+VctogDntzENqp/Go5MlafYmXR9RDBoevkya+B5OM742y07Dbup8O4XZ0mN68lQpRWcPeCRStS4gJftenx5ytUrJ33BsI7CoSMNT5gMycgsQSTkSS9qMzqSJsv0a/7Xc3b9H1/+ftiIsrUB1K2ZmdEquhcNh9YL+bfUROIPDSvAfhVob1WUlWGPJAfnkoCuKeFMlVrfOz5UqzHBLrns93QWm/G0N6M86XBvIEExZ1KT0SH1+vlPy07imS8vQPnujg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ceb7d6ad-0292-facf-6ad5-4bd265a8d34d@suse.com>
Date: Fri, 21 Jul 2023 15:24:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [OSSTEST] ts-kernel-build: add kernel kconfig for the Arndale
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: rahul.singh@arm.com, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20230721121627.1229906-1-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230721121627.1229906-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0023.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS1PR04MB9504:EE_
X-MS-Office365-Filtering-Correlation-Id: 21abe68d-abff-4416-6359-08db89edd31a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2PPE4+CaXtSrEQ8VHR7IDUH1/7xNnC0nlVHmYhqH3ZKto9r81CJ9SPfPAZivVPvbsFgaRC2Vl9X8DR7E150ho0hgh3+rCENBUBGATsbvdetfGT2d5wpP1K0m98ymoHyJp9yUJ/NLVBuDcj5gx8AnQ1Ur0xuh1/MQtsXzncrcGV2cZfXFDKneyWzvGczhZhw/2Gg+c9UiYHtNR/Z/LcbrXiLyYcgj8jotmPAfmaHippe9wYUo+vHJ8UOCfT15/DPiVHDubbFCiztKTfcktTsHfl72OSEfor8V+NkWFWu2znO6TLhWCf6IkATNqZx6kb219AIQq+WbqVpjwrSgFrxNVke0iZwI41LP7tuN8OVHeDQW3imYr8MAQAIPVLN7yjDob8bfqGoAgIiK61nyO+DmS8aZrz8HGfD1iJRVbEa+4Np3AtG6JKyNpYjLKoY1Fax5/M7KngMsoUsD0L8y+1Q9CuSPVaSLF0Bzsyzj5DMQWJR441hmQHBPKImF4VanT/Px1BXPgC09/NWz4o6VlyG/LvUou2GesPubvjtGIB2H6km1lW4UQg2Aph6Wl8oriva7U5kSmhCIPoBCwDtM5ybm5Au8KTVC7RNzKe2/OU0yQ5OO5244lqxjs2z1J7iEC6AvTiE0n7zR3rU/ely/EEGX8A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(346002)(396003)(39860400002)(376002)(451199021)(8676002)(8936002)(66946007)(316002)(31686004)(4326008)(6916009)(66476007)(66556008)(26005)(186003)(2906002)(4744005)(41300700001)(5660300002)(478600001)(6512007)(6486002)(6506007)(53546011)(36756003)(2616005)(38100700002)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkVpZVpNUmJHNnpQTlVEMDVRblF3R1VaU2FzN3o1TWFVSGpyYzV4ZkJLTlJs?=
 =?utf-8?B?SFVOc2ZOU2MrNzBYdnRtK3NPUW03a2RZamRJb3RRMlhLc0RxL3ZNTHRvQk05?=
 =?utf-8?B?WWcrT3VUaS84ZlNlRnp2VHZoSUE4SmF6NGRFT3dCbFhMbEt4OVVNNFBkQWYx?=
 =?utf-8?B?aFBtakZmWm9nMjlaekZwbGdkTStBMlN0MjZHRVdYYmJNZ1NLMDJNSUJiellO?=
 =?utf-8?B?Z081UFM3aEE1V2VLcHZiZDdid0ZPMXI5bDNqNEluL1IzWk5vUGVteFFCR1U3?=
 =?utf-8?B?ZWFUYmpTT2ZYdmxvTEp4MmdhbXhHcFNzYllkYzlTeFZOQzYvRkpBZmtYb2Ux?=
 =?utf-8?B?TE00NW55cVlHaENFUW8xLzQrNmZPUkVMeVVLQmpnUkNvVjRoWFo2Rm5zbWY4?=
 =?utf-8?B?SGpxNVErU2tweWFZWkR3WkRjLzQvNVBCWnNHWVlGSU4zc2phMm0yM1lLbzNL?=
 =?utf-8?B?WjFHM2dNeE5nVUxtQTZZK01VcnhxSDJWaFVTTnN4ZjgvV1V5SFpSNXVrRGpy?=
 =?utf-8?B?WEVLZGZZaGEvUTgrUjFUOGk3VTBVdVJpdTlwVS9jUExzZTRCZGZ3c2pTUkVQ?=
 =?utf-8?B?YVNSZXZBY1I4N2Z2dmhYYVpDMFk2cTdCVTdaNnJ3UWlTRzg1a3NHZUpqdnYz?=
 =?utf-8?B?Q3NVUkhrTVNYd3NJSm0rcCt1TTZaVzVidnhVVGlteEpCRnZZSHlZVXdKZit2?=
 =?utf-8?B?azZaUnQ3b2dqamNNMGtMVkx0VjhvcnczbHhuMlFVNm5vekoybHFlWmNLQjVJ?=
 =?utf-8?B?Rlg5YTNWQ0NhK3BMSkFjSkgvY2dBRktueFVXRjIzNnFGczNaam1YYkoxbkpv?=
 =?utf-8?B?MmhZc3BCUzBuSGlsZDN6RDkwYjJDa1dxbWJkL3VlTC8xamtTRUNNa0d6cm0v?=
 =?utf-8?B?Q2IzY2tjSklqTy90VEJ1SVVxbWxDK001WWs0TUJoU1NJWUVPem9VNGpUSC9u?=
 =?utf-8?B?ZFUveXZVS1A1RldDM1FrY0Q3S2xFVnRCQkZSa21tSDA5L0UyelY3eHhVMldB?=
 =?utf-8?B?emNDRHdUYnExdGlWQ2pXTDA2OUw2SGhYS09rRDVPNXhBdWlDYVEwTkREeEJs?=
 =?utf-8?B?ZVFRK3VPR1BnMTVwQUU1eHNWeWUvcTl1T2d0QVduV3dFY1NSWGxuSk1XMDJ6?=
 =?utf-8?B?RmJ2b0ZuZFVpalNiM1RHOUpDc2N4d3Q5cjZoaUZTM1pmYVYrbHhYNnFCSlhP?=
 =?utf-8?B?amUxU1U1cnlSak5RU1l5VVNnbzlPL09FSWVPdGNZQ2VyaXNTYVFnbDd2VkJP?=
 =?utf-8?B?ZnpuWThFMkp1RTdMbng0U1FGZG92TDF0dnRicjRVa1NHcE91M2c5dDEwbUk5?=
 =?utf-8?B?QWNxd2pMMFZ0eDI4cVNuaml3aVp6VU1RaGdvd290dDg0UGoyd3Q4dFo4YzNj?=
 =?utf-8?B?bXZndC91VTlhTytkOVdjbjFDcTF6RCtyeEd0V0RIZEZpdlpkSm5udXhOSFEx?=
 =?utf-8?B?c2hKeTQ5VTJNQklkZVhhVnN0aTF4aGRHalk2MXlRR1UyOHp6TkJ2V0IrVS85?=
 =?utf-8?B?ODJUeEp2czFLMmpmb0lpcFJ5LzVnbCtYL2hubS9YU1gzbUdmY2xCb0dTZ2Mr?=
 =?utf-8?B?VXZIMHdHSDFmSkpBdzEwUmJSNXpqdFVxQThmdDVVbjNuRDhDZkREMGRQK1ZY?=
 =?utf-8?B?V0tTaWhhVWE1Wll6RFBBdjR2cFBGRGhhWHRjUnBCaEEycXBCRUFnOVE1M2tH?=
 =?utf-8?B?d2RKNnlEVGtBK1RiQ3h1RFRKakRMUStvRko1R2IydFlVaEF6ZDZxbUtldnZu?=
 =?utf-8?B?VHRqVHR5UHRDYUIrdjN1NWVHM0Q5RWJQV2U5SUxzakU4TTVQcDU2djBkTTdO?=
 =?utf-8?B?YktlZExNNzZISE9GblJ4TFcvb05qVFVLL2phM3Z5YXV4TERiZ1pIYnZRa3Jy?=
 =?utf-8?B?MGJScmFDVGFiVE9xMENoRTkrRlU4YWVGQXExd1NFYW9rT2JaK2RTNTRZaXN4?=
 =?utf-8?B?ZHdJNmYxUlBFOTF0ajkrOVhDM3FyRzhrNmlTRVgrTjlsSWdZTFpMR2lOZmQ1?=
 =?utf-8?B?NFUvL3ZaSm1qNW0ycHBWOVM0dXlCRmpOaTRGZDY5K1hEUEFWTUtIMFJHQTl2?=
 =?utf-8?B?ZXQrUmJWVTh3RG10dG9nbmZrYWxqYnl6MldyTkNOV2V0Q0l4bnoxR1BMcU1L?=
 =?utf-8?Q?Re8cEo0xaEQC6n/o6KasCiGue?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21abe68d-abff-4416-6359-08db89edd31a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 13:24:34.6479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zhOFHdZwTaRj8l9nMMJXHdgNZnMoorFiv3pSElgcbq+byN5L7e9YUdEZDLB2NDB0i3BYouVkaXjvHvwNeLMknw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9504

On 21.07.2023 14:16, Luca Fancellu wrote:
> The Linux commit 33629d35090f5ce2b1b4ce78aa39954c603536d5 has
> removed the 'snps,dwc-ahci' compatible from the generic
> AHCI-platform driver control module selected by
> CONFIG_SATA_AHCI_PLATFORM.
> 
> A new driver, the DWC AHCI SATA platform driver is now implemented
> and handles the above compatible when CONFIG_AHCI_DWC is selected.
> 
> The module is needed for the Arndale board to have the SATA controller
> working, so enable the CONFIG_AHCI_DWC as additional kconfig parameter
> in ts-kernel-build.

Largely out of curiosity: Since you say "module" here, ...

> --- a/ts-kernel-build
> +++ b/ts-kernel-build
> @@ -245,6 +245,7 @@ setopt CONFIG_SENSORS_LM90 n
>  setopt CONFIG_ICS932S401 n
>  
>  # Enable some additional drivers for Arndale.
> +setopt CONFIG_AHCI_DWC y

... does it really need to be y (and not m) here?

Jan

