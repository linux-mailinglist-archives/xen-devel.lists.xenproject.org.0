Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B42197DBCFF
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 16:56:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625228.974303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxUby-0002P1-Tx; Mon, 30 Oct 2023 15:55:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625228.974303; Mon, 30 Oct 2023 15:55:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxUby-0002Mx-Qz; Mon, 30 Oct 2023 15:55:30 +0000
Received: by outflank-mailman (input) for mailman id 625228;
 Mon, 30 Oct 2023 15:55:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hhfi=GM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qxUbx-0002Mr-GQ
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 15:55:29 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id beeadea0-773c-11ee-98d6-6d05b1d4d9a1;
 Mon, 30 Oct 2023 16:55:28 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8341.eurprd04.prod.outlook.com (2603:10a6:20b:3b0::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Mon, 30 Oct
 2023 15:55:25 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.016; Mon, 30 Oct 2023
 15:55:25 +0000
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
X-Inumbo-ID: beeadea0-773c-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S/VWhyNTx7nkzzdLsGoivGsD4Ilyk11c9sCbWxarHY+worU0yyzzja8LcTZcmUBOUyncgI3BxvjHSOpJhLVsO7VAy7B1K4+bvh98BO0gLUAIwV5TtIzw9A9kb4PVi/ejWNCt8vjQSCKhLsJIVJiSCnCwRHfMCO7/TOtpnYCvIlggMLDmEqk40pce1oh9EiZhzLEMpwRu0TuHdqFLxzoR64Xu+yPr2Z5n7R9lan7ASf3Cv6alxCRpENG3XHOXbZ6oBe8QmmY7r1MGdx5vQm7VwTNVBbEQ75xtSrk/ivQniSJj73Fcpq+7V1M4TFWaOVsQ5PkrLE2uHN8Izh/lD2H82w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SXBZ0yuj37WjjDEcWh7Qb4ZpzwNyuWKUHgvB2OrnO3U=;
 b=hN12UNelVQzE2cYudsEo30+oGjV4uRa9RXwJCLOPyQufMcKpoO9g7F4vYwewRcKFcgKEE33m+g9Lvr+vYrpGX3HaPPR9r+EPds5y+OfwB6tz4X/iiLKEnnKCK/gheBn2Inowt+TQzpriIaFstlCOq1DY05zxbPLFSjMorOKAmGWSriL1guu+2zsfYsEymYDknpmCt5iNLHvGZKoAEtDp8/IyGoYAyPuqFBGEmuAe0qX059jlQl31DCxnPqr3WJnC5rNTCIP7SWQqqrwXiKzpXMWPplQkUM7i8NpddQay040H159brRFFIO9NamfbZM9wa4raEjBkOLo49rd7UnHIdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SXBZ0yuj37WjjDEcWh7Qb4ZpzwNyuWKUHgvB2OrnO3U=;
 b=0l91I46d45MHoHLCtGkppt3ZdFuE6OTF5utQ2fSKF+SiVW/3SZt2y8DkXl4qHrUzpBxQIh8KrszygpmkvfJ/Wj8uNguTi3RAUH6z4YZk69Z9tGEcFJC0HLKIMEdCOCNTdLOS28JsNWz3NjxtWYIX6aWEqRSO1BDDGLh0jBloJWhEtyy1RNnbmu92jTxCik8rDDz+H9d/gf9P9CgmGNojCJeztqX3bkkpulOriAxR0HGSqiW2bsYvyWWBvMzfpdyLWMi8a4qpu34mwsGmTRxroJacaSQEufcIMUq58jXteibHnrD044uhUgFOwWXX7SwO1ipQpByc1uJ2d+/bkwLzGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <105291bd-3109-f7d0-0104-6728ca31315a@suse.com>
Date: Mon, 30 Oct 2023 16:55:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v10 01/17] pci: msi: pass pdev to pci_enable_msi()
 function
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
 <20231012220854.2736994-2-volodymyr_babchuk@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20231012220854.2736994-2-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8341:EE_
X-MS-Office365-Filtering-Correlation-Id: f00a302b-20ca-4be8-15a5-08dbd960a178
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZKXpf/sFtTjGFxB+44ctZuLyksnMcYKEFIE6td+w6/x3UyRpexgzRXIc4/GE2yp1vEZNf631vhuyYNhXWMtZoR8EFQHk4+jJCSHfB5wYwXnnxsBxdrXLVoiqQtPmJ5jZEqJrxnD+Ilb/7iEGTp8ifTArVV4NnY017gzU29ASco45NVNo92fu+fr6nGLYItVIfvuuMKSMB3KZPpHM5WKiYw7jAE3QjZjXY+nLy+//fQNoSwVaaT9CHJG9rDqsMBQJd7u3+PUWu1uGPsChcxaB8DfBQLmMfzRcCHOUQh16mF1IQfwzJVGr2zZZpPw3eVTfgxrR8Tw5OqVg9EHN+heb6UzdyNopO2Vpcvv0zYfRr3Q6gRgXAOy5UHyXequz0wV9TVq86hT94upzooQ42NNFY404K7+nbHKDEDnjv5nt8YtNgcRBYKWyGG66/WIPJ6bwII4vU5F9oIVX62hmgJxFbmcvl7saLgztwNllyi2+rVUjusm2ayZxxSwYJIztGkj6KhTV/NY7to/AkLYmcdfJOGQrajgWEmEQtmZo6nwFuTkzrylTF/WNK1cYNHXvS1YaoM+WixkKVxkB04SlS45/j/kNU7o2w11MIqY9LjPqTC8zNckUeRSe6doh+Si9oj/MJeesnZeaYFz02Go1eyhGmQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(396003)(366004)(39860400002)(136003)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(6486002)(86362001)(41300700001)(31696002)(5660300002)(66946007)(31686004)(6916009)(8936002)(8676002)(4326008)(6506007)(2906002)(54906003)(316002)(478600001)(53546011)(2616005)(66476007)(26005)(83380400001)(66556008)(38100700002)(6512007)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWJ6dzk3NjhxMjUvTERoTisxUytZb0tsVlg4dEFWaDBMdmNIYWN3aDJINVpI?=
 =?utf-8?B?Q0FtL25IN2R0OERMRFNtZHRwZlJVb1RwaE0vZ2d3NVhFZGRlamVCQURuaXdv?=
 =?utf-8?B?bVJIM2JrZm1MNy9Ed29qYlF3ZzRsYnRRNUdBMWZITkZYbENJek55eVI0UHho?=
 =?utf-8?B?dU1WU0k3eDh1ckVaTHE1R0dvVlR1U2hpdlJCTzcvbWpnWUtxZW50ZUd4aGtB?=
 =?utf-8?B?UmRxL0ZlVjNpYjExMW9HTmNsRUlhRDcwREliUktKOUp6U3NOSFNkVGVYQWZn?=
 =?utf-8?B?b3kwMm9xWkpHMTVyZGFEbmExZEJ2M2R6aHd1YkVYSklCYXJMRmE1REMyV05C?=
 =?utf-8?B?VER0UFdMT3lsd3U5Y2VRRnA5WitaUFROL0EyMitFOTZ2Y1Y1bmRIWkNidmUz?=
 =?utf-8?B?WFlHZjZqOW9ScEF3T3BhbWVJR2c2eWdQcHV5VGdLWkEwY0NwS1k3UmVMK0My?=
 =?utf-8?B?ZjBvY3VQUWdiWTZGa2d1VE9oYWlELzljLzNCTjFzNnBuSC9iMm9UbmtIak1V?=
 =?utf-8?B?bFBqWkovV2lhd0hHcSt0dUJTM3hjb2JWNFUxRmM3QVFFeWliNURyMVZKY2tQ?=
 =?utf-8?B?dmVlaUpUYTVjckRwMlFkeGszbmdMbURTdjZWTlBTeUFPWmU2WW56NTUzRS9I?=
 =?utf-8?B?V2JTWEloaWRER21QTUtBbVFtR2ZQMnYwZzZZNE9UZ1hNUmlpYUhNNFN0a2I2?=
 =?utf-8?B?RFBvWWFCcVZsd1JGVm1HUFM2MjJtSitDY0JLVDdRcFFOcmgyaURHaXpVMzZt?=
 =?utf-8?B?WTZKaUxwckxHdHk0a0R5NHlpQjNxMjk0ZWZFeDkwRDh1S29qOE82czNHTnBU?=
 =?utf-8?B?VGJlOVQ1a1lkVXh0b1p1Rkh4bWM4dGtIbktMdU1UYkhFYTJLRW5Wc0pRd0gz?=
 =?utf-8?B?RU9Kekt3M1BRbGJuejZ3aEpVaTZnV25rNGVTTFQ2Y29oTUZKMG9hRmhKdDZv?=
 =?utf-8?B?cUpWSWl0TFd2ZkpjbHllTkRycktZWUtPQ2YxSWRJanBLTzM1UzREeW56V3lo?=
 =?utf-8?B?MENtY0h6ODd1TTd2UWNsS0Z1YjFYY1g4U016eEdVdFBXVlpLZWd3dlZxTnZM?=
 =?utf-8?B?VTZKZDN3RlNRRE5EZnFtRG9GSGZGZ1RpamNla3pKQVI4ZTFhRklmVklpTzIx?=
 =?utf-8?B?RmxBWGp4a1hXa1FBYTFieTI2bHdia2k1cEVjMzBzRHFIOG5TOHdxdTlxdDVr?=
 =?utf-8?B?K0JFSkcwQTc1dzBKTGhTdVVlQytpV0U3Tk1DVVpTVGtkTFc3Y2M0UG5TMUd1?=
 =?utf-8?B?ajRWMWhmMkdoSzJ2Ym55NnJvaXowQ05nbURJc21NRE5pSnJsWXJpbUFMYndV?=
 =?utf-8?B?YW0zOE5rbVVnZzJKMWsrazJDenI4S0J3cm9OZEtHbnFGZnFLNVhETEQ5WkVm?=
 =?utf-8?B?OVREbVpXY1BKSExUUUlCRkpjSWxhS3hBbVM4WXJSenN4RFFGOHdMaE9UWkZL?=
 =?utf-8?B?WWJCb2l4WDZWTEd6RXZEanQrY2VSZzdKMVF5cUpyUUFxZ3ZlTVJGN1dDSDZR?=
 =?utf-8?B?MVNkSlo3SXViZnQ2eUVQb1gxb3BKa2wxaEVxY3RxZ1lScWtmeHptaER0bjlX?=
 =?utf-8?B?WWJ1cktyQ1lsUjhBTzA4UHpTdUN5VE5TMC9tcVJYTHdvT2NWZWlYVkVoUndI?=
 =?utf-8?B?dDlnY2IwQUdJbWEwTjJleDkvSWRZdGQ1UE1CZzNlYURHdUxmUUdlWFkvZ01B?=
 =?utf-8?B?SkdUSC9lTW5tb29Nb0tkWlkzcmVoZXBPU2hxaVJQOEFrYnMwemtxQVN4TnF6?=
 =?utf-8?B?bUk5ZEUvZWF6ajROWndLWWd6bGFBeGw4amIxa3VWemtnKzFoZTlzYWo0Znlt?=
 =?utf-8?B?NTBFMzh6Sk1YNmJLc05kTlBTckNvUEk5NS9uT3NTcC9ONEF5by96MVlNbkZ5?=
 =?utf-8?B?dGlyUlV2OVhVT2VkODFWN2tmbUREcGo3V1FHcHdBOG1lbldvNEVxNSs0TEtL?=
 =?utf-8?B?RFhBRHg5RXU0a0NqS05VT2tQWmpxbU5OSTF2cGgwcldpYlE2anVYcENiemFS?=
 =?utf-8?B?N3QxeFUyckRwNjlKYmFPNG1DTU15SmgvK3VsODZDdHRTckVWbEp5Q3FJcFdI?=
 =?utf-8?B?MHoxTTV0UThtSGdPQXVES2hTcmpVWHE5TW1rT1NMaWVET1lZMGVGK1pIdkdQ?=
 =?utf-8?Q?jaW5F912f+Bk4ENyK4eWSIJsU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f00a302b-20ca-4be8-15a5-08dbd960a178
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 15:55:25.3912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FTEktEk3UbpeHlXG495GKxNBEhUUExaYHWdOAYtDKyXdsZWranduALtjlXTMPiqJADjZEPz10KlNECCTSuAQHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8341

On 13.10.2023 00:09, Volodymyr Babchuk wrote:
> Previously pci_enable_msi() function obtained pdev pointer by itself,
> but taking into account upcoming changes to PCI locking, it is better
> when caller passes already acquired pdev pointer to the function.

For the patch to be understandable on its own, the "is better" wants
explaining here.

> Note that ns16550 driver does not check validity of obtained pdev
> pointer because pci_enable_msi() already does this.

I'm not convinced of this model. I'd rather see the caller do the
check, and the callee - optionally - have a respective assertion.

> --- a/xen/arch/x86/msi.c
> +++ b/xen/arch/x86/msi.c
> @@ -983,13 +983,13 @@ static int msix_capability_init(struct pci_dev *dev,
>   * irq or non-zero for otherwise.
>   **/
>  
> -static int __pci_enable_msi(struct msi_info *msi, struct msi_desc **desc)
> +static int __pci_enable_msi(struct msi_info *msi, struct msi_desc **desc,
> +			    struct pci_dev *pdev)

In line with msi_capability_init() and ...

> @@ -1038,13 +1038,13 @@ static void __pci_disable_msi(struct msi_desc *entry)
>   * of irqs available. Driver should use the returned value to re-send
>   * its request.
>   **/
> -static int __pci_enable_msix(struct msi_info *msi, struct msi_desc **desc)
> +static int __pci_enable_msix(struct msi_info *msi, struct msi_desc **desc,
> +			     struct pci_dev *pdev)

... msix_capability_init(), may I ask that the new parameter then
become the first one, not the last (and hence even past output
parameters)?

Jan

