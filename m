Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B4F7F5C54
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 11:32:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639507.996973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r66zk-0000Xx-AM; Thu, 23 Nov 2023 10:31:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639507.996973; Thu, 23 Nov 2023 10:31:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r66zk-0000Us-6L; Thu, 23 Nov 2023 10:31:40 +0000
Received: by outflank-mailman (input) for mailman id 639507;
 Thu, 23 Nov 2023 10:31:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=licP=HE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r66zj-0000U0-65
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 10:31:39 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0619.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a6ae1ae-89eb-11ee-9b0e-b553b5be7939;
 Thu, 23 Nov 2023 11:31:36 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8544.eurprd04.prod.outlook.com (2603:10a6:102:217::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.13; Thu, 23 Nov
 2023 10:31:34 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.012; Thu, 23 Nov 2023
 10:31:34 +0000
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
X-Inumbo-ID: 7a6ae1ae-89eb-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H5LXVMIiZ4bsdZ6V+T4fS72ZHFLeorp9/AWyDEw7+agxxAVOwKuQRIjMk5OAq0mNbVMJFSLmYtu9tdup+W+y90Qx2CswBwHp1pncqSBwTn1U8WIVu4X3fgPDMhtSvsadoL43QYlwXJv7a7h9jKJzn/PRzPQJTTRNydEeFMcwlvRw+uXkxHAH4Pmsj/p5Vj7Bgi/ZE7RguHTi55FVpxqj2BnsRO9Dsl17oDkty14MaTo1f74E4tUdQlhrQwvu6ICHXTlg5JhdLigSL4mEJY4K/ub3u9tKgZtihfVWcFMiKm2aFENIUQuRkOPLQE95zcM8TGw4IbAEAfNIbryZhUUUHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OrnuJU7FIhbuhk86KldU0YrTQp/Wmtb/GbBTELJs4ck=;
 b=ZEk7o7jvCX0gZmgqolOE8ei8KTcqwzjluMKdfi7xQQRjWdspZnOR8q8v/dIgLWvgsXQYy08I0p6H8T1prqiGDbkrjRZ//LhlEmLaGVyGHQtJAsqm8JUcLb5edJ1qUjhPTN4fb2KTWnrVAJPOlwmfCcOph6WZq3LhBP4+7d+KjgMGgy9F64zNrHQxdCgI0+739EBUe0eB6du2pmhr/EjjPq2q3XMbGWLQ1A9eHFseNM9FUC1FaMeVLKb2P5q1kl741s51BX9WDlpa3S7XeIwJlPm+5/JT7DtL96Dl9L1BuTibzR2oNFOKamy+11/34v3/772sSddxso02mkghR88M4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OrnuJU7FIhbuhk86KldU0YrTQp/Wmtb/GbBTELJs4ck=;
 b=5lNyLoHgHBYZUlAa169eh5mxeujWNeTgux+x43FTcayLoGnnIQqCusxbQ+CdOY/AUAumEPFkmKp+MUgSqye+LtKCFTLQehZxarkrSQNGj4xBpoehKlmzUeXfqxrHRcmFU/4IVqwZVVTugxq81IcnCuefOqz2H+rgzNpjOql2FNHRwYGzjK1CouinfUEphgylJ2b1lo6uPwbAkP+8ts7b3G13y9RfFm+Yc78fKfhMLE9p8gmHIICdybzOLRxe5ljFy4LtWnVlIQKZSHsmhblLomcR19Pij6VFOTc+OcCh4wcfERSwrnbHKFnfrNby4TrKbfaVCPE7ZbN1ovSY+f2uMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <642e91f1-3b1c-4824-b624-e5077a09670b@suse.com>
Date: Thu, 23 Nov 2023 11:31:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3] xen: replace occurrences of SAF-1-safe with
 asmlinkage attribute
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org, Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <b193825385eae75ae320ab7d8c7f63b61c8c8786.1700125246.git.nicola.vetrini@bugseng.com>
 <23575a74-2a8d-41d3-a71a-420f6a6007c8@suse.com>
 <2123235ad5e5d18c89369b6cc1be3a4c@bugseng.com>
 <1f5d5e07-1b34-4e4d-8904-e5463a2db919@xen.org>
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <1f5d5e07-1b34-4e4d-8904-e5463a2db919@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0039.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8544:EE_
X-MS-Office365-Filtering-Correlation-Id: ba9b3342-c161-426d-d9fa-08dbec0f5d4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6UKe/spNKmN8U+/HyuDJbSXg1ArwPaEqsCPfJoBa++t/YxHqvZsiQzGzZsCGLR+0KtQzEx/j4NmuX1JKrl6jUkA4uTpZ4rhu5R+D0dXMDwkzxGE8SE7KrZcfy+exGdrnEESOc1r+D42J4AMfB1isHd2mcI/NK0jPaduRHp08eCKvWZ/L0cYzPdfirXRcmXddQkAcSJr/6ExhG8VR8CMdHUCk+zAQIsDQsRHXzN+bavd2bD4z6X+54mVAwspknNXuoVTug4CTnGNGM1kDKTYJb9vT05zdvslZ8tjmomRRmcWlaU1iO/mbz0bCiMp5FaDHFcDWcSo+k1OpwUmDf0c65S5NXWcjMMEaLS7m/hZ8aozLUlbhyOAHxpj1Py92Md/xJsuMlmbfnQFqLzl+WzRbwsS2ohwdeH20GMkqIrtFSDRqEFbJg4UZE6FUeoNOK/OT9UUSsz3TyELOjj9Sua9LljqY+WXx5gDO1iHLi4qc2scC4OU0tLJH0MGGRi7wTG8Yt2AM0DsH/vEZnjKZOfF8fP2D/ioC3wOJdgeVMJ+V1jSPW6+U6FmwLoScEbYnRI4Padc2EZETXjk/G/IIH2C7WwxaazUpjTeD4MGoiXRm2et/1aHXbVVZ7rFzMg/ISSNoFIdZQ9IozNR6qvehZmR0RLKL6gKS856vm2sCtODHs1I8QRlcjvCuaNon/mbqON6kzTEXpieqBzpou5Y7+3GaUw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(366004)(396003)(136003)(39860400002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(26005)(83380400001)(6666004)(53546011)(6506007)(2616005)(6512007)(5660300002)(41300700001)(4744005)(6486002)(2906002)(478600001)(7416002)(4326008)(316002)(8936002)(8676002)(6916009)(66476007)(66556008)(54906003)(66946007)(31696002)(86362001)(38100700002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akJJVGhScDNJNTRLeUg0VGNUY1Vzby81dmxoZzVqZTQ1LzFPSXJZc25paEZC?=
 =?utf-8?B?MldCZzNBaFRGZVJpT2g1YnFkYnZPVE5xUTdUdi9DZzBRVEZaZjhlR3BZWVkw?=
 =?utf-8?B?L3krVWFOUGlvYm1mTm9HcHlCbmhnaU1CME15NXBPeWhYTzYzd0k1TW0zQVBV?=
 =?utf-8?B?SEFhSDlnTThmMFRYMTBVNmFiQTJKdTBmd2doTStHa3dORjRQY1VSU0RPQmhn?=
 =?utf-8?B?dGtpRmhReUM1ZytpN1hiakp3N0cyVWZlcGJULzgrWVEzdWFnVEIvRmFJdmo5?=
 =?utf-8?B?aEtoWnB6eFpJNnJZZytpb2R2dldKWUUvbUtQSGhpS2t4T3M5Zy9TNVlzVThK?=
 =?utf-8?B?OUNMRlQ3UDNJZ2VuaEtoY2ZRTE5SSit3NVArRnVSUGlwbENRV2JQNW1kMzBG?=
 =?utf-8?B?WVF6bFM5TE9NSEhCRFQzN1IvMzVpWUZ2OFJkQlkzUDdTWHBNSDNOWDAzTjYv?=
 =?utf-8?B?RUVkUlk5ZzFPWi9keTNKU084QStJM21ZUWpsSWIzVVVXQ3JCbUp0cHZMeGFW?=
 =?utf-8?B?bHNOUUVWYlBwSzNJQ2tNb20reGh1ekNDWlZELzBtNFp2SGQvT0pjaTd1RTgv?=
 =?utf-8?B?MWpFQXZwVWhXT0tTaHhnUi9wd1NyMGtvSU9zVmpwQXJkZm1obk1SOHB2eUJm?=
 =?utf-8?B?L0xjWHBLUkw2dDNrb1NSV0w3cFNUSDdiemxhSHkyeEJUbXAzekFybXdaR3BW?=
 =?utf-8?B?ZUJ0RW90dTRITzAwSGluZ1VEUUE3a2ZOMGJETnFFUEUyVExxRGRBSXQvRlR6?=
 =?utf-8?B?OTNZam5vbHpScWIrNVJmS01xbXJpNEVVWU9WVW00UnBZZ0RRL0tOMHJ2K2x1?=
 =?utf-8?B?QnBKRkdZVWRKWDlqaTZzUjRTQnBVOTc2YWZ3ZjllSEhGTXVTZjk1WGE4eWhm?=
 =?utf-8?B?NFlRZEhJdmJwVUFjamFlcFI4VkNCa0xQVnJrUnhJcWRSazhvdndLZ0hSWnpX?=
 =?utf-8?B?OUEyTW9acW9qQTNacFNEV2w1cC9JQU5mazIvZEtjTUdVTTExeDN2c21WNG9h?=
 =?utf-8?B?cWV4SXExRmd6UUZReVAva0Nac1R3NHZGLytEU3o4WXpVM01jeGg2Q2ZGY2F0?=
 =?utf-8?B?T2hMNWpwdGxKc0NTVEdNN2RqcWVnQnF4eFdKTWJKdDUrd09vN2JadVVRd0U4?=
 =?utf-8?B?SGU3VXJCbklZdjBLazNBV1ZLRVVZSjloUE9sOXAxTVBBNHV6cUVrNW9RSVpa?=
 =?utf-8?B?ZHBENnVIdTF2S2dlbG1rOEt6UFh5NkxycjBSc2ZrYXg2WUtGa1VjeDZiSnhT?=
 =?utf-8?B?M0Fic1JiVVBhOURPZEJOWCs0ZCtSRkRRL2trM21WT2hxL3BwQUlJSlk1M3U3?=
 =?utf-8?B?cWdiWWJTc2p0aUZJRmJvRSt4a0pkd1hkY0NuNTdqcDJxTUJHWlRiT3R5bS9r?=
 =?utf-8?B?Y1Y0R2l3cG9lRTl3QkwyU0lFZHBETEpYZGg0aG53N1F4ZUFocE0vKyttdHA3?=
 =?utf-8?B?U0RYV1FrMTZsVzZ0eE8rRjZTZURQWmllWTdhOE8zalJKRi9hNDdRM25mOSs2?=
 =?utf-8?B?T0FEaWM2SFZsRmVYVFgrUWJoTlNVZGpVbTN6ckg1dnZSQ2toWEE2ZEdoTmYz?=
 =?utf-8?B?WGcwRDBIeDBvenJ6K1Z1MFZHMitKTkpWbmNNYjVGNmp3cUVSZ2JjSmUrM0FU?=
 =?utf-8?B?T1JrWElvTWJHM25JdDJVdXArSGMxbXVnNyttZkNCQjQ1a3o2eXRPSjl4eFN1?=
 =?utf-8?B?UXpZcXdrb1JPWnRjc0kvbFVxbUkrbk9US2xwVEhwNXI3MyszVE5QQzIrTXdJ?=
 =?utf-8?B?QkwxaS9KSDVCbk9kc0IybnFocEt1b1h6bWpnMUNUTWVJRlBNay9UYTRWSHh3?=
 =?utf-8?B?QU9IYWhsWjVsaEY5VDBpQTlpd2pHSEdvb2VxR0MrSW5hNHNZWHFTckV3eWph?=
 =?utf-8?B?RytOVk0wYXJsRFNaY1gzNmE3ZGliTDdURWFWR2wzc3lwQzZhVVgvY1lIUlhi?=
 =?utf-8?B?MHJ1cyt6OW00T3B1a0lQeEZWOGpsT09hTStMMWdodm1IcHNCUkhNQWFiU1Yw?=
 =?utf-8?B?eU9TYWROYWVTd3Q5bEpoQnVXUnA4S01hcldRQW0wcTB6ZXlCNThaL1ZHbCs0?=
 =?utf-8?B?L2MzelZzKzBlNHd4VnpaamM4WUxyYW56TG1odmJyaGIwTjUvN0hvcXFFN2JF?=
 =?utf-8?Q?w/gS+MuSdcObK/To/bSZIOiSj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba9b3342-c161-426d-d9fa-08dbec0f5d4e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2023 10:31:33.9474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /BGzQZYKiabEZgxib7unC6L3gvlkV3RX/25555xEcTTqJom3IBZCBWPGj0PxX4/jqeWcs4OhVKTRAjObiLtiSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8544

On 23.11.2023 11:26, Julien Grall wrote:
> Another possibility would be to deviate __stdcall like we do for 
> asmlinkage (I will let Jan confirm if this is desirable). With this 
> approach, there is less ambiguity when to use either of them.

Attributes changing calling convention may be a sign of there being
interfacing with assembly code, but e.g. EFIAPI generally doesn't (it
only happens to be so in the specific case here).

Jan

