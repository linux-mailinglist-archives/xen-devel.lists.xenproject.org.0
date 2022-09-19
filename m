Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38ED45BCD57
	for <lists+xen-devel@lfdr.de>; Mon, 19 Sep 2022 15:34:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408733.651569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaGuO-0002EE-Mn; Mon, 19 Sep 2022 13:34:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408733.651569; Mon, 19 Sep 2022 13:34:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaGuO-0002Bb-K1; Mon, 19 Sep 2022 13:34:00 +0000
Received: by outflank-mailman (input) for mailman id 408733;
 Mon, 19 Sep 2022 13:33:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6dDj=ZW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oaGuN-0002BV-JQ
 for xen-devel@lists.xenproject.org; Mon, 19 Sep 2022 13:33:59 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2066.outbound.protection.outlook.com [40.107.20.66])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6aad8c1-381f-11ed-9647-05401a9f4f97;
 Mon, 19 Sep 2022 15:33:58 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7929.eurprd04.prod.outlook.com (2603:10a6:10:1ec::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Mon, 19 Sep
 2022 13:33:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5632.021; Mon, 19 Sep 2022
 13:33:56 +0000
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
X-Inumbo-ID: b6aad8c1-381f-11ed-9647-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ShG0+c4MDHq+TRPNf5eEa1rv01x+5V6MlUVDyX2imoOn0xrn+4Th8BqN0UKtK4BbI6QUqJ8Avd52EJxgPvZaIuIrTy/DDPLWPWQMJUjbZ1cj2LDvZWX0sbFqt1Ks/rEmVH+V3wWaha+t9T2urvMHrh51+DNkjvK7Ru6qpnJ3mRRmQTwbyr7RnGsLOFgcvOiz2qrPjjd9k6pYlM1PmYsCJWIikjG4HooMd09GTq6oEFmrurQLYPgnmlNM4HVGoijN0WQf4I9HkMhbB1b52VEtsIkXlu7rzK/mNCrWSVqm9vyrPLIn09qJcS6AcdOCrqnTaM6hsi5V8CMlm3tvVkgO1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jrBA+O2CEsDVuJpb0NA0D6TzHQhOStL3qp5Kfu5RO2s=;
 b=O4WOb7pMTJMNJINnYOKZ9k7tpBRr1cN1w7xjEYLMszVaF0s3VjDeW+MUiGPdbKjhs7NRsHBsTS0J8zCyF5oF0Zygq9yXEVO/Izk72jm9oJohcfGtiacMn4+HclaBMBvhgOvMd4j5fpFtzknEt/OnD5NqC406dnZxIQZ6ipFnjA58e+gGtxQhGBWkQATlgI1zmdOybo1OFoj53v5OlN/uhW/eEn9Yr5Th9DdcwxK7TmWMU70kq6EvgB0Vjo7MKsMQ76GmmJXc3fdiejSRM+rIilscYla80JCaPNbhgCs+F1kurmRWWX9VSzOMLTXLK96lDne+OdNNyCnbToh0iKqu+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jrBA+O2CEsDVuJpb0NA0D6TzHQhOStL3qp5Kfu5RO2s=;
 b=wNVGD7ra9OTfvFhN9TFPFFXyr4wlzwsXIRFt92Xxg18ilj4mieO6DqDwabhvoDle8VGhuiGEXadp7XDShSJlhAJhtLzxewYGJ8USHhElyNVio79Cb+XV5vXXIM8YUOn3p4ORmUL/iuvNmTG0iDnzhHz+nT1O6u29xgAb/FgZuU1BdazWHM8WVprLWinylKT0ovyN6xhjHSvee5SczMClT6Bqb2IiDlY9ZlPW3x1eHxaAlvFWI9aLQOYkZ8ToHQaNfETBnctlpfTfMqh7PhxTv9LAaXO1V4XEdws9GUvjgliEWEkOvrbPNhSrSgSUde/ulFXAHKuuqVK9OgD6vRHNAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6211a296-c4ba-5783-f6b4-8dbed8261a2a@suse.com>
Date: Mon, 19 Sep 2022 15:33:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v7 00/11] Add Xue - console over USB 3 Debug Capability
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>,
 Connor Davis <connojdavis@gmail.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <cover.677e6604707b02741b065906ac6f3ea8f3a2f4ca.1663383053.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cover.677e6604707b02741b065906ac6f3ea8f3a2f4ca.1663383053.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0012.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::24) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7929:EE_
X-MS-Office365-Filtering-Correlation-Id: e8b4e4c2-4f5e-4f24-e409-08da9a439a0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gKZKAtgjjgjBrMQHnZrQXIJpOlcvbm+qhmXJBIU47ig25Moa8jNdtAIFyvJO1FtUFyW6vQ4d2HE4m2FGPRBLuofcdom15grT4Gg0peCIu4Ou4neqWgDSSlFLeu0Sq1Hg+eCCbwfsudd6npgygGD1AWHZKBirNNbeFNzS8iW9jdH+lHmHJEnQklr5m4DiPnlli8qyQEZqdOhu4JTUAc2Ktl2quz6SU8/jTye108j/wSvSdhEQPGUkS++6qDNJM66CI8FhalcuMX7+uVo3udfo+/ZZcJAFH1eFRZTQN84QujGWYSLRGe5e6O5Ein/X1SnrLHL2/bF8rhuiOyCiVfiRnLsBtYegAxiwxdCnVXzR0LStANUhGgDLft7iSLA68kXFQfbZApf68HVuRNEs2O+7DPx+W6tIvFf0nJlaQwDMtYnU0ihuIQJ0DqCE+TtsvXWwUNaUuBEU+72obkwdr9zWH1txAxhqfamJgZMIVFShSvNgdQ9WsoUwyTRqqxdZCOoHqss2mQa/ZzFmrUqzrEIRiCbrTBlxAAl8048Eoz+m5P96IoIVmvqh7PbE3nFOFZKJrkFqKy5ZbYFk2JxiJjO5tOGlJqA0yM19B397c32NpYthRopLkXE7alWpwF/4Bg6NK98aje1x5Fv7cBajPS1ZEzKWXwajOT8Jh9Gt5vQX/LnYW9+V0LY24uAxsAR/uHMcLguP7wdG29aUporez+7qKQTKaSwnKsNTnlJA08LjRZBv9X/2L/TdMyZtaQkiFeuR2yUzGcm10d5daZw6UNwEnbKDI5CNiK0Fc+iR1XsrmSMncbqebwvMpgPINUkehGdr
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(136003)(346002)(366004)(376002)(396003)(451199015)(7416002)(31686004)(5660300002)(2906002)(83380400001)(66574015)(41300700001)(966005)(316002)(66946007)(36756003)(38100700002)(2616005)(186003)(66476007)(66556008)(8936002)(478600001)(26005)(53546011)(31696002)(8676002)(6486002)(86362001)(54906003)(6916009)(6506007)(6512007)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0Q2OTh4ODJhMnBvbG1HUnQ5aVhydXg0aC9BdHNHamVtMFN6cnZGZG5mTXVs?=
 =?utf-8?B?V2VVTkVNQzk4SXRMVDF6SDQ0alN4akRhbmZUSTlJTUx4czJBcDVBU3VqR0dW?=
 =?utf-8?B?WkxGMmliSFRIbVNvZU5ZMjF6NzR2bFJoL0FKM3M5MkJkd1N5ajRsdjc4Z3hZ?=
 =?utf-8?B?UHdsdGtDOTVMbmNLMGdYSFVWKzZPaWV3SkFTNEhGTTBETjUvMkNPb1Q5M2x6?=
 =?utf-8?B?MTZyUXovS1h0dzl3MWVIZ094M3pmcnEyMTF6OTBQUmt6Y1E1RXA1TUJ6TGdH?=
 =?utf-8?B?Y0RWMFZxY0hyalB3K3ZCNU1YeVR5SWdhVHdRNHROd1E4bDNVUC9QUWh3ZHB2?=
 =?utf-8?B?ZU50TXBUNFliR2E1cjIwWHQvMkJBbkVjT1l4UWJvWVZMUU5HRURNYURTc1Q5?=
 =?utf-8?B?MnI2VVI2eDVrV0tZQm12Ukowa0REdFpMejBYdnhvOFFXVGEzRVQwMlhCTDZh?=
 =?utf-8?B?VFRvbmZOdTRWaXBXNmpPUXE5V0YxOTF2MDR2STZnRHlqb1NNS2xyZlc1Q3BR?=
 =?utf-8?B?ZUh0NUFyVGd6OEozM0pIN3U5akhrN3hIMUlkR2Q1WjNtSnNFUlpmMjhNS2kr?=
 =?utf-8?B?TE9GckYrVEhFMlk0WU9yVWkyNFNaWDRTaWg5cVJmcjFTNHhoM2MxWkdzNXo0?=
 =?utf-8?B?WFltcnFDZG5WY21xQ0hkZ1JDVDhncGFsUHhkVXZtQm0wMWRWaUJtaldqUTBF?=
 =?utf-8?B?V1VCaFduN2RCWWpYSy8xUU9oRFQvQ1JrOTNaNWFDd2RzZGMybEErRlB2RUVz?=
 =?utf-8?B?ZW9GWHdNdjdDZTZ4QW1MbEJuUmNmdUt1eXZNb2NQU1hnaFN4dnFWcjB3b0t4?=
 =?utf-8?B?WFU1MlR0Ukk2WXF4NWhVT1BnQllCb2tJUG8weU82UHFvQzBEUmYvSTk4VklM?=
 =?utf-8?B?RnZCcmxNWW94QjMzTzE5OFhGd1U1S1JvM3k3L0E4ZHE3eDYrTXB0K1MvMWU0?=
 =?utf-8?B?RnhNS0lXZ2lwWERFTjBiVXN4QU1HZDM1OFFHNVd2S1FyUFNuN25Vc1BFOHhu?=
 =?utf-8?B?ZTlncXlSTTdTOVRXNldVY0lhUUVuZEhTSHNXcTJKRkxFb2p0bUQrSXdkVVZR?=
 =?utf-8?B?YWZKMnQ2aHZPSTRFUmN3dmpIT2VGZnpHL1lyOEQ1aFpqL3VONk93L0hvWDc2?=
 =?utf-8?B?YWVXaXlDaFpkemFsR2ZNT3dHd0REYUtyRGlaVWU0ZFNWRU1heWZ4Mi9tZEFN?=
 =?utf-8?B?L1ZjZlRVYWQreXJvdkJZUWlrd3Fwb25PdDh1YklSd01VN3lFaEhqdGVKcUcr?=
 =?utf-8?B?eUFCYWEyNVBoWGdyeFgvYXd0cFVvOVdzbXMwL2wwL3JwQmw1WG1pU1NKTUJl?=
 =?utf-8?B?cndMU1RReTdrVlVZVkFCT3lNdktPWkhyazJXSEx1bjlZaDBQdy9hZUY3NDk4?=
 =?utf-8?B?QkFpaWNidzBrdDZwTnUxLzc4NDdyYzBnZms4QWJDZ01ubUxLcFFubFZBdFlH?=
 =?utf-8?B?QjZRWmtoRFU2aUFKSjlVNzJBVnYrNUdHdTUwaXdXbU9PbUlOWlBSN0ZpMHRU?=
 =?utf-8?B?UTBYaXl4c1d1bHF2WFI0QXBVd2k4T1Z0SkM4alRzS0RlZnY2aVA3WE1BMzdx?=
 =?utf-8?B?Qkc4V3FLN0xBZmw0WTEzYU5NUVV5dktSRERZUTg5aHdwVXpIaWxNMUE4Z1BH?=
 =?utf-8?B?c0ppaEx0THVLNXFlQU1CSHZLK01WUDNvaVdueEw1NURCMjJNWWEzb1RUa3pY?=
 =?utf-8?B?bVBrY2RhaGc3ZTRwOVdrem1GRzNQWGtiQ25CazQ3c1Z4L1JlOEhCYlhxa0x2?=
 =?utf-8?B?UTRvdWxUWDhnbDdaUDlJNzJkSXZCbmhtZW1lbzF3eU5vQWxUcVMzR3ZyeU1U?=
 =?utf-8?B?Q1Z6eHZWbHFnNXVNT1JjQTREcU4wU2lHbWdaMTBwM1FYWXRpQ2dNY0E4cVkz?=
 =?utf-8?B?ZTN0OGJhWm9oUTZlL05vd0sva1lOYmR5OVZrWlZYd2djemFrZ2F5L2lUcGIy?=
 =?utf-8?B?Z1l6eTIreWlveC9pVlJWVitodjdJM1d5b2V5Z05vRERjMnZrcE1aaWJ0TkU1?=
 =?utf-8?B?RWtzVVRXcXNIa0FCMHdadHhyUFMrS2VKY2YrUGY4VXBvaUdRT3c2RnRFM05D?=
 =?utf-8?B?U3VhaWhNNno3U21MTlBMR3lBQm8yTFdYVTlxYUhQNjV4Z1hJSGNMQXIwRk1r?=
 =?utf-8?Q?fjAxH4dan4UKpi71qsnD2HOXH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8b4e4c2-4f5e-4f24-e409-08da9a439a0e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2022 13:33:56.5906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f1WKHFKcQf9sC2mgy6LVl9/+ivw66meVxHgc/wrxorucWt8a66Y3O083u3tlM0XRQr7/IVqyigD6TQbQFdzTCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7929

On 17.09.2022 04:51, Marek Marczykowski-Górecki wrote:
> This is integration of https://github.com/connojd/xue into mainline Xen.
> This patch series includes several patches that I made in the process, some are
> very loosely related.
> 
> The driver developed by Connor supports console via USB3 debug capability. The
> capability is designed to operate mostly independently of normal XHCI driver,
> so this patch series allows dom0 to drive standard USB3 controller part, while
> Xen uses DbC for console output.
>[...] 
> Marek Marczykowski-Górecki (11):
>   drivers/char: allow using both dbgp=xhci and dbgp=ehci
>   IOMMU: add common API for device reserved memory
>   IOMMU/AMD: wire common device reserved memory API
>   drivers/char: mark DMA buffers as reserved for the XHCI
>   drivers/char: add RX support to the XHCI driver
>   drivers/char: fix handling cable re-plug in XHCI console driver
>   drivers/char: allow driving the rest of XHCI by a domain while Xen uses DbC
>   IOMMU/VT-d: wire common device reserved memory API
>   console: support multiple serial console simultaneously
>   drivers/char: suspend handling in XHCI console driver
>   drivers/char: add console=ehci as an alias for console=dbgp

Henry,

this series is kind of on the edge between a feature submission and
corrections to existing code, as the base patch introducing the new
driver was merged only recently, and at least some of the things here
aren't clearly "bug" fixes. Additionally it's on the side of larger
ones considering the point in time.

To summarize state: Patches 2-7 are ready to be committed, and Marek
tells me that they're independent of patch 1 (except for a context
conflict). Patch 11 probably also falls in this category. Patch 10,
otoh, is pretty likely to be viewed as a new feature, and hence
likely wants postponing. In any event - if I was to commit any of
these, this couldn't happen earlier than next Monday, as the laptop
I'm currently working with is not (yet) set up to do commits from.

Do you have any particular opinion on the disposition of this series?

Thanks, Jan

