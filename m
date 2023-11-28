Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A36C7FB900
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 12:07:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643035.1002893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7vvj-00011v-Oa; Tue, 28 Nov 2023 11:07:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643035.1002893; Tue, 28 Nov 2023 11:07:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7vvj-0000zh-LW; Tue, 28 Nov 2023 11:07:03 +0000
Received: by outflank-mailman (input) for mailman id 643035;
 Tue, 28 Nov 2023 11:07:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xcZ5=HJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7vvh-0000OW-Ju
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 11:07:01 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2088.outbound.protection.outlook.com [40.107.7.88])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41015128-8dde-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 12:07:00 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7517.eurprd04.prod.outlook.com (2603:10a6:102:e0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.21; Tue, 28 Nov
 2023 11:06:31 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Tue, 28 Nov 2023
 11:06:30 +0000
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
X-Inumbo-ID: 41015128-8dde-11ee-98e3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YEoYu6wfxPKHyjTbnN88MSxvDX33DhKyBiAMUFefgHV9yglWRiBaSwpqgShXAvUDRQkgaubdC8bwnTqQDnP8aSJy3vFfV+nRzw1v11gFaDiz9wGFWRwxrCk1c5YXhZp/hS3w0cMkoqucrZbvgxYirP0e7cXoCGOnCyDoKQJVwjJSFRMfB4QpPfEJ5ueRAQ6HTsURTJjAq2afOGCoKtSSWiHz2yWgJpHIY3A/UvXvcPevbypn+Zj+dI/fGFAI6v9o++fOHUYms30pBOVIt6yTYmklSCAWkhKKkDWVpZBxigrZudxf/WPPcm2kM9fq6u6+Yz5IjbeJBr/GOHrLKuwFeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1MUubPn8Vwssi86CUDg9oJURDLWCW1lqV2zisTjO2sI=;
 b=H0BH/evT/xWHaYFwf+GPyZcGQAkESAHGPlZbwVVsaY4ALZwVNMXEkO26TeRqNksMqtvcgr574Qu+wuuAh2urGvyeg1p6123jSOdRbkb7b+xNud1txTFgQWSiMyPtw9ZwgAG+m8Tp7vTsu7PXPor2/BUqa0y63xYBvq5f44FZqT0UfpfyBjyZsBFOehQ1+4h64iN8tV/5MDA3DJkyRiek5t6WEx8vRBxTSW0pIsBa809Ue7+HAXa+bBveVhFJ4AJCSghkGG9U9lWvhZL64UaHeKnEENS/w8WcX7Sy7pmGhbFozl3RePwk2KscPZ6N1/i3HdVlE29yDgtLwoYH9VLlcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1MUubPn8Vwssi86CUDg9oJURDLWCW1lqV2zisTjO2sI=;
 b=TWXaRLyidBiggDsezc5YePJBZT8grBd/IR5vGj9FGhs08CE3CntqPlT44wHixjW8irb11xqlkug6GqjBF1lOCPgehy5TJmdPmv4fqAD5nBFI9hLoTa0jumZRR4zfCSCErzvk2PfBzKdg16QEdsxQ4wClDIRlE/J6mkyBTQtPJdsXl20Lh1eDxk3+CgGsqn5t37eXat3H8L0P6SJG8F+mEDkThW+BJ+JJyNqBZJ/0GLdqogyKuj7xHQIWk6AIypV6huzu9qSW0mvynFDmGD8toue6y1vft1Fg/+O23LfS2eIPyG61seXk9vllrAobMB/tzNaFdLUIzzmc9t5nUuCSUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <24060b1d-fa13-47a5-9bb5-e431b1ea7afc@suse.com>
Date: Tue, 28 Nov 2023 12:06:30 +0100
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 2/6] x86emul: support CMPccXADD
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <e13004ac-22af-411e-a5d0-907a2a0301c5@suse.com>
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
In-Reply-To: <e13004ac-22af-411e-a5d0-907a2a0301c5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0192.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7517:EE_
X-MS-Office365-Filtering-Correlation-Id: 44f5ca90-aaac-406d-adc9-08dbf002135d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NaJ1H1/2a4EjgHVMrjOl0v13g7kRuUwkyBBvjbCiKCpD+l2vJxq+Anb4Yw1JVMmzDoNpJsmSRStHKGT0YDYhxFkQIFYiRsxlpjRMvXYBZFVw938r+hGzhqjuM0LMDt9XtmihuWUkZ6PtikT1l5itNgDBULyLrH9Ogi4352k2qq7u/7ELFKMEnm8m9dcbWl4nggbm7FvOObimy8FhoviSaTwPF2O6RY49lcRbNgPWf8h1TV6nemUyysrdhnK5YDdpH4RlXLhwCVBALF2eThTPdi/X/qcbVOWredb7zSwuO1/VOQtbvHUzBgtdBlckJ3Nxqjf2CyT4kPjjtk+/Sbn9BOZQcYlfFlo5GgbPYemjbggx/g8dzQWMrVlBh48mJSf25p7utpZLuBuEh+L9uqDbrC2F7vBQC0m/OdtnTnhGKpkgaPiRozocmk/mC2qwbc2bMS4zB0MNSLrk7YFQDwVYDOY3U0rdPhJiITgpjeOm6d8F+ulb0NWa/tWSagtgmrVg1pcuOjaCouZ8A4tYUuVL/87nVznpzFyPrxk66kJZPfkJe4tBTwvxCQjbUVNygo2TYee75C22vQZ3sQ5fl/PRz7DuPQArFAbhveQwS7U/jw5p9xZn+wHeAME4k6nRotn0bQqOTwcwtI+7XspT+tUxnA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(366004)(396003)(39860400002)(346002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(86362001)(31696002)(83380400001)(66574015)(26005)(6506007)(6512007)(2616005)(31686004)(36756003)(38100700002)(478600001)(66556008)(66946007)(66476007)(6916009)(4326008)(6486002)(8936002)(8676002)(5660300002)(2906002)(30864003)(41300700001)(316002)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFR3VVBxRlNCSEFZdUs4ZTJXK1BwTDZvbHZucWZtcHpLNzdNTjYyOTA0UmNw?=
 =?utf-8?B?elNyNE1iVklLdGlQeGZWcDFXU1RLaE1mUkQ5TEZVQ2htelg3TzNFdGNwcEs1?=
 =?utf-8?B?NW92eXZqbjFXdGJSSFVhc0oranlPcDdjeDdlRjRrcEJDdmJGa0JZTjAwc0pE?=
 =?utf-8?B?ZFJPTHA0VUNYQmZTNDdUTkZnTXp2L0NKTGhrbzhSUXRzY2tNSFJSY1RnWTBs?=
 =?utf-8?B?YUlkNFYzclVYNzJBckRIL2lJMGtyUGJ4MEFCSlVYODVJTnljaEJPSFFqRWtZ?=
 =?utf-8?B?a0ZnWHphdmpCd2pXSnZrOHo5RG0rMGNSRUVOZkh5bXBYRWJOK1Zab0xsV0F4?=
 =?utf-8?B?SGttQm0vSzlIUnY4QjlIKzB2UTdEWW1sRGlVZHlvdGFXT2hWYk13dlNtZnAx?=
 =?utf-8?B?RmtFTzRTbDBORWN1NHo1UEkvYVJQdHpYeU53eHdnOFFkR0ZUSExsaWlvOHlV?=
 =?utf-8?B?ZDJGYWVJZlg0NzZOL1dkaTgzR0hwT1dCZGVBK0x4WHZ5bUhKMVpQcThOVGl5?=
 =?utf-8?B?VnllaEkwRTFFMkoxM3N0TFRWZVBNVjhYWENCVnYxT3UvaUNQUWZUYUpHWE9m?=
 =?utf-8?B?ZVhCcnp1WFN3dFl4VnJCTkZGVHBlNXJ6M0NnMkhmQ1BMeXkrTUYzWDBpL1Vj?=
 =?utf-8?B?UWFlaU5VVXdrdVI2M1l3b1dHdUZqWS9XeEZ2dFh5c2hHSWNmN0tzcEd0NVNI?=
 =?utf-8?B?dWhLckZrbXRLbDhqRTFFRk9xSWFDQ00vZ3loaWF4TzQ4TzNrdkxkaWsxcTM4?=
 =?utf-8?B?VjByaU8vY0gwSnFXRmxSTnBPdVVqb0oyaDBMd0FodldQeCtTRFNUZ1YremJ6?=
 =?utf-8?B?Yy8vbmg3b0VyYUxpNGY3SzlVaVBSVUFFWHJtcXFIRUlmdnRhbC9jNGdDZlky?=
 =?utf-8?B?Wk5GTjk2Rmt0cVJyQTJhS0JJTWJrdGF3SlIwT000MExOcXJqUER4VEJyMWoy?=
 =?utf-8?B?WmdRbjVDazZTNEFCdGMzMy9EcUpVV0VFM0g2NG92MHd3RUROOTNpNldOMDFq?=
 =?utf-8?B?MWlHYWRpeTIzZU9jVlhGclRUZnloUTZkVllnWW5MN25KZVFFUTU5NlR0Y2FY?=
 =?utf-8?B?OWxlWmNLSEhNTXprVU51K011TXNjRHV3a3pqbmdRNW9MaGpJMWR3Q3NTbTVr?=
 =?utf-8?B?ZTlEWWlkWThYbTlEbmRkeFljWFczQU1FeEFzMlZ4S2NZQUdhR0VFcDFPZ015?=
 =?utf-8?B?dm5EZ2YyVHdZdWpjQnpQYzBTWnczOS81T3k3OUdiY1RycHlpZ0x1R2RXWTNH?=
 =?utf-8?B?UFVRaS9RM3VBeXpydVIvdGV1T3c0NmEwOFdvVm9laTJvYzZQazFoOGN1RlVH?=
 =?utf-8?B?YnlXVDVmeCtsbVlFNUFTZzJqOWk1ZElDV3ZnTEYrWWFWdVU2aFNaYUlLdXNt?=
 =?utf-8?B?dkZnMnFlVDdsT0M0TUJ2amdkZHhmYnROcjNVUXJraW52Mzd3Y01oK2lhOVhM?=
 =?utf-8?B?cmxGQWo5YTZUemRxb3JMWDlHWVUwUzhVa3lodmc3c1BHSWNWbWJlZExxaCt2?=
 =?utf-8?B?TTNLVzJldVEzWHZWZVZZYUhwcEduZGZMZEUwTGUrKzkrczUvMndEUUNVUGVW?=
 =?utf-8?B?MGpmQndWaHNBbDA5WktXMHQ5Mlo4d2FyWWxpbE00RkduS0tXdGcyNzZWbnFt?=
 =?utf-8?B?aE4yTE9tbk10Y2lrNTRGaWl1T0FscndVUndyU2lSeEtjQW9kbENwRUxRS09k?=
 =?utf-8?B?RVZzM2FyeUVwYTgzL2ZySDRrYmZncW83bWlSdXRja0VrWjQ0c3VVNW5ZLzFa?=
 =?utf-8?B?YTJCa3hGUXRxMVdmZ214WjRrTlhIRVprV0VBK1BPQzVZc0d0dTEwc2JhUE02?=
 =?utf-8?B?ZGRCaGdTelVKWFUwUkpZRHh3VjgrZ045RzQxL21ERGt3NE1XQlNuU3NxZk9I?=
 =?utf-8?B?S2lEd1JUdzM2M25jL0NHdTlRY0lVWUdYWkNQT09mNC91UjA4ZDNHYWFhR2Zk?=
 =?utf-8?B?Rk5xNnYycWEraEI4Y3dxY3R4TkZxOWtOaFpMT2FjTTFDNFNRNjQ5WWRBME9o?=
 =?utf-8?B?K0JkVWpwaFNBb0RTSmxHZFV0MHpmdTE4RS9oZldlVWhCRGtMNGJ2MHU4Z3Fm?=
 =?utf-8?B?cVRwOEllVWhmN2hWSGtnWEdJVWk0eGpvVkVCTEpqUm9WZE9EQ01zaXlqeGx3?=
 =?utf-8?Q?c+cD8P6OPgbFo6KVlwa2MWQ3v?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44f5ca90-aaac-406d-adc9-08dbf002135d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 11:06:30.9534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fsWsY5O3s/uanTybo9ufWPOZ6FteTrzkjacxdzpy4A48vTFdIirIIVkX+70nwtZgOb3RVc0u+DkYuCIwwHtAGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7517

Unconditionally wire this through the ->rmw() hook. Since x86_emul_rmw()
now wants to construct and invoke a stub, make stub_exn available to it
via a new field in the emulator state structure.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Add dependency on LM. Re-base.
v2: Use X86_EXC_*. Move past introduction of stub_exn in struct
    x86_emulate_state. Keep feature at just "a" for now.
---
SDE: -grr or -srf

--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -186,6 +186,7 @@ static const char *const str_7d0[32] =
 static const char *const str_7a1[32] =
 {
     [ 4] = "avx-vnni",      [ 5] = "avx512-bf16",
+    /* 6 */                 [ 7] = "cmpccxadd",
 
     [10] = "fzrm",          [11] = "fsrs",
     [12] = "fsrcs",
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1403,6 +1403,22 @@ static const struct vex {
     { { 0xdd }, 2, T, R, pfx_66, WIG, Ln }, /* vaesenclast */
     { { 0xde }, 2, T, R, pfx_66, WIG, Ln }, /* vaesdec */
     { { 0xdf }, 2, T, R, pfx_66, WIG, Ln }, /* vaesdeclast */
+    { { 0xe0 }, 2, F, W, pfx_66, Wn, L0 }, /* cmpoxadd */
+    { { 0xe1 }, 2, F, W, pfx_66, Wn, L0 }, /* cmpnoxadd */
+    { { 0xe2 }, 2, F, W, pfx_66, Wn, L0 }, /* cmpbxadd */
+    { { 0xe3 }, 2, F, W, pfx_66, Wn, L0 }, /* cmpnbxadd */
+    { { 0xe4 }, 2, F, W, pfx_66, Wn, L0 }, /* cmpexadd */
+    { { 0xe5 }, 2, F, W, pfx_66, Wn, L0 }, /* cmpnexadd */
+    { { 0xe6 }, 2, F, W, pfx_66, Wn, L0 }, /* cmpbexadd */
+    { { 0xe7 }, 2, F, W, pfx_66, Wn, L0 }, /* cmpaxadd */
+    { { 0xe8 }, 2, F, W, pfx_66, Wn, L0 }, /* cmpsxadd */
+    { { 0xe9 }, 2, F, W, pfx_66, Wn, L0 }, /* cmpnsxadd */
+    { { 0xea }, 2, F, W, pfx_66, Wn, L0 }, /* cmppxadd */
+    { { 0xeb }, 2, F, W, pfx_66, Wn, L0 }, /* cmpnpxadd */
+    { { 0xec }, 2, F, W, pfx_66, Wn, L0 }, /* cmplxadd */
+    { { 0xed }, 2, F, W, pfx_66, Wn, L0 }, /* cmpgexadd */
+    { { 0xee }, 2, F, W, pfx_66, Wn, L0 }, /* cmplexadd */
+    { { 0xef }, 2, F, W, pfx_66, Wn, L0 }, /* cmpgxadd */
     { { 0xf2 }, 2, T, R, pfx_no, Wn, L0 }, /* andn */
     { { 0xf3, 0x08 }, 2, T, R, pfx_no, Wn, L0 }, /* blsr */
     { { 0xf3, 0x10 }, 2, T, R, pfx_no, Wn, L0 }, /* blsmsk */
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -1412,6 +1412,78 @@ int main(int argc, char **argv)
     }
     printf("okay\n");
 
+    printf("%-40s", "Testing cmpbxadd %rbx,%r9,(%rdx)...");
+    if ( stack_exec && cpu_has_cmpccxadd )
+    {
+        instr[0] = 0xc4; instr[1] = 0x62; instr[2] = 0xe1; instr[3] = 0xe2; instr[4] = 0x0a;
+        regs.rip = (unsigned long)&instr[0];
+        regs.eflags = EFLAGS_ALWAYS_SET;
+        res[0] = 0x11223344;
+        res[1] = 0x01020304;
+        regs.rdx = (unsigned long)res;
+        regs.r9  = 0x0001020300112233UL;
+        regs.rbx = 0x0101010101010101UL;
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( (rc != X86EMUL_OKAY) ||
+             (regs.eip != (unsigned long)&instr[5]) ||
+             (regs.r9 != 0x0102030411223344UL) ||
+             (regs.rbx != 0x0101010101010101UL) ||
+             ((regs.eflags & EFLAGS_MASK) !=
+              (X86_EFLAGS_PF | EFLAGS_ALWAYS_SET)) ||
+             (res[0] != 0x11223344) ||
+             (res[1] != 0x01020304) )
+            goto fail;
+
+        regs.rip = (unsigned long)&instr[0];
+        regs.r9 <<= 8;
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( (rc != X86EMUL_OKAY) ||
+             (regs.eip != (unsigned long)&instr[5]) ||
+             (regs.r9 != 0x0102030411223344UL) ||
+             (regs.rbx != 0x0101010101010101UL) ||
+             ((regs.eflags & EFLAGS_MASK) !=
+              (X86_EFLAGS_CF | X86_EFLAGS_PF | X86_EFLAGS_SF |
+               EFLAGS_ALWAYS_SET)) ||
+             (res[0] != 0x12233445) ||
+             (res[1] != 0x02030405) )
+            goto fail;
+        printf("okay\n");
+
+        printf("%-40s", "Testing cmpsxadd %r9d,%ebx,4(%r10)...");
+        instr[1] = 0xc2; instr[2] = 0x31; instr[3] = 0xe8; instr[4] = 0x5a; instr[5] = 0x04;
+        regs.rip = (unsigned long)&instr[0];
+        res[2] = res[0] = ~0;
+        regs.r10 = (unsigned long)res;
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( (rc != X86EMUL_OKAY) ||
+             (regs.eip != (unsigned long)&instr[6]) ||
+             (regs.r9 != 0x0102030411223344UL) ||
+             (regs.rbx != 0x02030405) ||
+             ((regs.eflags & EFLAGS_MASK) != EFLAGS_ALWAYS_SET) ||
+             (res[0] + 1) ||
+             (res[1] != 0x02030405) ||
+             (res[2] + 1) )
+            goto fail;
+
+        regs.rip = (unsigned long)&instr[0];
+        regs.rbx <<= 8;
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( (rc != X86EMUL_OKAY) ||
+             (regs.eip != (unsigned long)&instr[6]) ||
+             (regs.r9 != 0x0102030411223344UL) ||
+             (regs.rbx != 0x02030405) ||
+             ((regs.eflags & EFLAGS_MASK) !=
+              (X86_EFLAGS_CF | X86_EFLAGS_PF | X86_EFLAGS_SF |
+               EFLAGS_ALWAYS_SET)) ||
+             (res[0] + 1) ||
+             (res[1] != 0x13253749) ||
+             (res[2] + 1) )
+            goto fail;
+        printf("okay\n");
+    }
+    else
+        printf("skipped\n");
+
     emulops.write_segment = write_segment;
     emulops.write_msr     = write_msr;
 
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -178,6 +178,7 @@ void wrpkru(unsigned int val);
 #define cpu_has_avx512_fp16 (cp.feat.avx512_fp16 && xcr0_mask(0xe6))
 #define cpu_has_avx_vnni   (cp.feat.avx_vnni && xcr0_mask(6))
 #define cpu_has_avx512_bf16 (cp.feat.avx512_bf16 && xcr0_mask(0xe6))
+#define cpu_has_cmpccxadd  cp.feat.cmpccxadd
 #define cpu_has_avx_ifma   (cp.feat.avx_ifma && xcr0_mask(6))
 #define cpu_has_avx_vnni_int8 (cp.feat.avx_vnni_int8 && xcr0_mask(6))
 #define cpu_has_avx_ne_convert (cp.feat.avx_ne_convert && xcr0_mask(6))
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -186,6 +186,7 @@ static inline bool boot_cpu_has(unsigned
 /* CPUID level 0x00000007:1.eax */
 #define cpu_has_avx_vnni        boot_cpu_has(X86_FEATURE_AVX_VNNI)
 #define cpu_has_avx512_bf16     boot_cpu_has(X86_FEATURE_AVX512_BF16)
+#define cpu_has_cmpccxadd       boot_cpu_has(X86_FEATURE_CMPCCXADD)
 #define cpu_has_avx_ifma        boot_cpu_has(X86_FEATURE_AVX_IFMA)
 
 /* CPUID level 0x00000007:1.edx */
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -439,6 +439,7 @@ static const struct ext0f38_table {
     [0xd7] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
     [0xdb] = { .simd_size = simd_packed_int, .two_op = 1 },
     [0xdc ... 0xdf] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
+    [0xe0 ... 0xef] = { .to_mem = 1 },
     [0xf0] = { .two_op = 1 },
     [0xf1] = { .to_mem = 1, .two_op = 1 },
     [0xf2 ... 0xf3] = {},
@@ -931,6 +932,8 @@ decode_0f38(struct x86_emulate_state *s,
             ctxt->opcode |= MASK_INSR(s->vex.pfx, X86EMUL_OPC_PFX_MASK);
         break;
 
+    case X86EMUL_OPC_VEX_66(0, 0xe0) ...
+         X86EMUL_OPC_VEX_66(0, 0xef): /* cmp<cc>xadd */
     case X86EMUL_OPC_VEX(0, 0xf2):    /* andn */
     case X86EMUL_OPC_VEX(0, 0xf3):    /* Grp 17 */
     case X86EMUL_OPC_VEX(0, 0xf5):    /* bzhi */
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -257,6 +257,7 @@ struct x86_emulate_state {
         rmw_btc,
         rmw_btr,
         rmw_bts,
+        rmw_cmpccxadd,
         rmw_dec,
         rmw_inc,
         rmw_neg,
@@ -589,6 +590,7 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_avx512_fp16() (ctxt->cpuid->feat.avx512_fp16)
 #define vcpu_has_avx_vnni()    (ctxt->cpuid->feat.avx_vnni)
 #define vcpu_has_avx512_bf16() (ctxt->cpuid->feat.avx512_bf16)
+#define vcpu_has_cmpccxadd()   (ctxt->cpuid->feat.cmpccxadd)
 #define vcpu_has_lkgs()        (ctxt->cpuid->feat.lkgs)
 #define vcpu_has_wrmsrns()     (ctxt->cpuid->feat.wrmsrns)
 #define vcpu_has_avx_ifma()    (ctxt->cpuid->feat.avx_ifma)
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -6918,6 +6918,15 @@ x86_emulate(
 
 #endif /* !X86EMUL_NO_SIMD */
 
+    case X86EMUL_OPC_VEX_66(0x0f38, 0xe0) ...
+         X86EMUL_OPC_VEX_66(0x0f38, 0xef): /* cmp<cc>xadd r,r,m */
+        generate_exception_if(!mode_64bit() || dst.type != OP_MEM || vex.l,
+                              X86_EXC_UD);
+        host_and_vcpu_must_have(cmpccxadd);
+        fail_if(!ops->rmw);
+        state->rmw = rmw_cmpccxadd;
+        break;
+
     case X86EMUL_OPC(0x0f38, 0xf0): /* movbe m,r */
     case X86EMUL_OPC(0x0f38, 0xf1): /* movbe r,m */
         vcpu_must_have(movbe);
@@ -8191,14 +8200,20 @@ x86_emulate(
     {
         ea.val = src.val;
         op_bytes = dst.bytes;
+        state->stub_exn = &stub_exn;
         rc = ops->rmw(dst.mem.seg, dst.mem.off, dst.bytes, &_regs.eflags,
                       state, ctxt);
+#ifdef __XEN__
+        if ( rc == X86EMUL_stub_failure )
+            goto emulation_stub_failure;
+#endif
         if ( rc != X86EMUL_OKAY )
             goto done;
 
         /* Some operations require a register to be written. */
         switch ( state->rmw )
         {
+        case rmw_cmpccxadd:
         case rmw_xchg:
         case rmw_xadd:
             switch ( dst.bytes )
@@ -8473,6 +8488,7 @@ int x86_emul_rmw(
     uint32_t *eflags,
     struct x86_emulate_state *s,
     struct x86_emulate_ctxt *ctxt)
+#define stub_exn (*s->stub_exn) /* for invoke_stub() */
 {
     unsigned long *dst = ptr;
 
@@ -8538,6 +8554,37 @@ int x86_emul_rmw(
 #undef BINOP
 #undef SHIFT
 
+#ifdef __x86_64__
+    case rmw_cmpccxadd:
+    {
+        struct x86_emulate_stub stub = {};
+        uint8_t *buf = get_stub(stub);
+        typeof(s->vex) *pvex = container_of(buf + 1, typeof(s->vex),
+                                            raw[0]);
+        unsigned long dummy;
+
+        buf[0] = 0xc4;
+        *pvex = s->vex;
+        pvex->b = 1;
+        pvex->r = 1;
+        pvex->reg = 0xf; /* rAX */
+        buf[3] = ctxt->opcode;
+        buf[4] = 0x11; /* reg=rDX r/m=(%RCX) */
+        buf[5] = 0xc3;
+
+        *eflags &= ~EFLAGS_MASK;
+        invoke_stub("",
+                    _POST_EFLAGS("[eflags]", "[mask]", "[tmp]"),
+                    "+m" (*dst), "+d" (s->ea.val),
+                    [tmp] "=&r" (dummy), [eflags] "+g" (*eflags)
+                    : "a" (*decode_vex_gpr(s->vex.reg, ctxt->regs, ctxt)),
+                      "c" (dst), [mask] "i" (EFLAGS_MASK));
+
+        put_stub(stub);
+        break;
+    }
+#endif
+
     case rmw_not:
         switch ( s->op_bytes )
         {
@@ -8633,7 +8680,13 @@ int x86_emul_rmw(
 #undef JCXZ
 
     return X86EMUL_OKAY;
+
+#if defined(__XEN__) && defined(__x86_64__)
+ emulation_stub_failure:
+    return X86EMUL_stub_failure;
+#endif
 }
+#undef stub_exn
 
 static void __init __maybe_unused build_assertions(void)
 {
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -279,6 +279,7 @@ XEN_CPUFEATURE(SSBD,          9*32+31) /
 /* Intel-defined CPU features, CPUID level 0x00000007:1.eax, word 10 */
 XEN_CPUFEATURE(AVX_VNNI,     10*32+ 4) /*A  AVX-VNNI Instructions */
 XEN_CPUFEATURE(AVX512_BF16,  10*32+ 5) /*A  AVX512 BFloat16 Instructions */
+XEN_CPUFEATURE(CMPCCXADD,    10*32+ 7) /*a  CMPccXADD Instructions */
 XEN_CPUFEATURE(FZRM,         10*32+10) /*A  Fast Zero-length REP MOVSB */
 XEN_CPUFEATURE(FSRS,         10*32+11) /*A  Fast Short REP STOSB */
 XEN_CPUFEATURE(FSRCS,        10*32+12) /*A  Fast Short REP CMPSB/SCASB */
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -274,7 +274,7 @@ def crunch_numbers(state):
         # superpages, PCID and PKU are only available in 4 level paging.
         # NO_LMSL indicates the absense of Long Mode Segment Limits, which
         # have been dropped in hardware.
-        LM: [CX16, PCID, LAHF_LM, PAGE1GB, PKU, NO_LMSL, LKGS],
+        LM: [CX16, PCID, LAHF_LM, PAGE1GB, PKU, NO_LMSL, LKGS, CMPCCXADD],
 
         # AMD K6-2+ and K6-III processors shipped with 3DNow+, beyond the
         # standard 3DNow in the earlier K6 processors.


