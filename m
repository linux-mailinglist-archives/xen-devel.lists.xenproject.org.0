Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A517EE18D
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 14:31:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634212.989563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3cSe-00063s-1R; Thu, 16 Nov 2023 13:31:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634212.989563; Thu, 16 Nov 2023 13:31:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3cSd-00060N-Tz; Thu, 16 Nov 2023 13:31:11 +0000
Received: by outflank-mailman (input) for mailman id 634212;
 Thu, 16 Nov 2023 13:31:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r3cSc-0005TT-EY
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 13:31:10 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0611.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 667b2455-8484-11ee-9b0e-b553b5be7939;
 Thu, 16 Nov 2023 14:31:08 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8499.eurprd04.prod.outlook.com (2603:10a6:20b:342::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.9; Thu, 16 Nov
 2023 13:31:06 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 13:31:06 +0000
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
X-Inumbo-ID: 667b2455-8484-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M+qT3qKFT4xI5Fa5EbGBacr7u/6O/4gheezH0nQsCcY7V7KpSRsM5S0JsIxveS/JGlbgWbbwC4RegUgZDf0jy86GdCmESmtEZJk/mTV1rj1Mdfb8S6xa41tZ7p8Mj2BOEVimbjVIzgLY7FclDtvvJTDroPDQgpNp0OvkTNKUhyuiTFq5p9bIxtqDBVtltgGdC+NGaG4I6RCp6EbDgm699zmq0hqb5L8LVtvJJSVXt5iGB+e+02LSlMoa/wBPSynTzpJwV+X2CkjXLws5Y8Pnjd49pJvnPPK367Ai/+18p9b7UHQWhWhblq54e85S+NdFXaR00q8qYnM4sbL1g5OoEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xpmbzUYWRrR5ZbwtWXyVrKKEOLtrtSL96BWfS0R0oPQ=;
 b=PI58vr+BVyiFmBiN5viT13bG71XVj2UH0EQ3S+I3EmJ7c8/Ys01w5UWa25mPVdUp/zSdgPSAEvPIIhG1Zu3jKjTsdACP6a0+BlNt5qWWwFDDhK1Sqjykfuwa83cbUf4ebm1f/8PwYCIwPoBf6fKRfpo8xGx0KoaJQMkreys2eBgiGY4bOoiEZZj4TrItBycnaaFbr9aDo7BvPSA/Y734qpVAE+njpOQlCrDNJmo9H+8TJg5pgbfTMsMNOsVNZY+gp9LlzFmQINQpp9RyYyms4uTsqL8bEMCW982wYtn4KxnqKkfncXt/74I6l72JaJtPy75wSAeFmSbu34l++EFzpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xpmbzUYWRrR5ZbwtWXyVrKKEOLtrtSL96BWfS0R0oPQ=;
 b=vDouL9Dky6AwkWgmxhxE0dpXjJIKv+EdEx7b7zg7ByxELNMvK4Ia6CYOQD9SMYf+6zLC/bnO+pH72WZunsSTA61aKQQ18LpKtZNY9Fhvo+WoQERSjXeqbiEd+KCaKkov/JxoQY4IChnNIfueirVxGU3oMi+Z7X2NPQf+wPymazH+V/MTPK8SDy2EOjIxNgHW3av1LzfcVtVVgliydM7mgBlDobrMf4poTpUktFCvQFePU19LG/GUXG157d+FXA6C55kV9/h8KtbeYubwwH8wio8PUMFF/qtwuFF/UzuTeTd8urRkVGIhJC7DsVZLoatsXLkvNNzmJEr8e6qREl1Txw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b16802f5-13ae-47a0-b12d-604928f4cf7e@suse.com>
Date: Thu, 16 Nov 2023 14:31:05 +0100
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/5] x86/HVM: hide SVM/VMX when their enabling is prohibited
 by firmware
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <791a9f45-2bed-48f9-af6a-9fbde65bcc71@suse.com>
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
In-Reply-To: <791a9f45-2bed-48f9-af6a-9fbde65bcc71@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8499:EE_
X-MS-Office365-Filtering-Correlation-Id: eaed8d4e-8bc6-4d61-123b-08dbe6a8493a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	V1gWjRotTyF6/VNLNc42dhoMqtdx2ezKzQo1F4PsyfCucuED4bYo766KFtse8DfR3WkjbR3E6ktyL6x13Es4Q30MbaJyL4t8iAcYQt/YE/nr6mSICtySIoyMyZQiRCdaAagO+lPGLgQbRbYedPzjjX7zz8x8QDt73b6aX/ZBp27H0h5KRxos+aMwF5XyzTtVCWG8EEwgwj1GcpJIbPu80Nl4XM6tn7L281V6O2D2bRrAsrZl2NvKlMnA8vs7+3g6F+cqnr+OXEBIc88DNPxe12SxCmR/NvaLg4R4cpciDkH5XbNna2IUY3MZIdHQh/oRDw5axXLXKXqYNdCw557P1HpJIrpL8i4zspIRSPVjn+O50iq+914OoG5VIfmTdMANpoiCIiLijZkxl3vpXoUcAJJvhG7TjBSD4McR/H4FEOhd1NoCwZ7iNqLRX7qhg+85DMYPv1VaqYT2IqhWiylgVx6wktnARbajbg++zolgMBsy8F/C+imML4ukPLeCdxsOX4Yj5O3BKX4nhZbQus30cBPJ84CmqyJDzzMfT08yT8iF9KfInD0Pa5De+7aR2Q2mNJ8Bf0JBN4HfC4CaNM3QHSWdp9RXbV6olO7Xd88PUUGdMASfJWIE9WtMyc4paz99CYdfRW8syemvYAsP6MFXEQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(39860400002)(366004)(136003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(2906002)(31686004)(38100700002)(31696002)(86362001)(5660300002)(41300700001)(8936002)(8676002)(4326008)(6486002)(2616005)(6916009)(54906003)(36756003)(6512007)(66476007)(66556008)(316002)(26005)(66946007)(6506007)(966005)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2ZCSkxncVMvTUo2ODBmTVU0OFlEM2x6bnNoSG92YkhIMlpHYStVaCtqOXZO?=
 =?utf-8?B?djZndmJsSVdwNTk3RFdCR2Qyc245T1hZMlJWaDRwaDNuQWZEaUdvc0oyanhF?=
 =?utf-8?B?czY5SVJ5eVNZRUlwcStuTUpVTENJNGhoTnh4OW1JSjk4SCtOYzlkTEJBQlpr?=
 =?utf-8?B?UXRMMEZMMjltSHZqcHpUVnBwdnl1WmFiekhyU2pFQUNYdEpNQzU1a0x4NVdK?=
 =?utf-8?B?S0ludG9XUmRBZzNOUFpJL2cvZFg2Wi9WbXZRc2pkYnBHajBwOVZ3V0hVWHcr?=
 =?utf-8?B?bkJBNEE5RUNOcUxZOE9pNVRUSmRleGxDYVU2MnhvNkxmMWJqWlBZMElxdG9h?=
 =?utf-8?B?eVpyaVBuSGtGYnY4Y3p0VHpsN2I5dGZQNTZZQjQxMnRGVzJaVkgrWFY4V2Va?=
 =?utf-8?B?emtYQ1lZcUN4czhVc3JDcWVtNENMZ0M4WmozWms5WkNFTVc4VnZGUUVBSU5Q?=
 =?utf-8?B?K3g1cklJcGJ0QnBydjlqQW4wYUEyRlVrTmQ5WDJYeGloNWE4RmRoVjRmVjcw?=
 =?utf-8?B?OVI1WDZBWWpwZGwxTDFhUWM0eG5jQXNpd1BBbVFtZ0E5NSt0VTRsTHo1bUsw?=
 =?utf-8?B?ejF3OSs5RkhNL0RBaEZ1aFlJSCtNY0FSb0M4cWtIamJUanQ3bEh2dHBUa25K?=
 =?utf-8?B?Q3dUOXhFTWRkeVJmTCtxbkZ0RXJ3VkcxaElZSDNoVmtIR0JMcGlTVDVkTEgx?=
 =?utf-8?B?YmpVcGRVWmhsRlliRjdCMDRpaytIWGlPTGd1RUxxYUpLc0tRbzllMmRnWmZj?=
 =?utf-8?B?L3dUeVFlN3dZMDBwejZWWFZkL0YxYlRPRlRFTGdxRjR6NVh1dW8yVmdNNm1J?=
 =?utf-8?B?c3VBTk1uWGdmQUNVQVdvazErdjcwWGlJWFdIdlVRZkQ1Wk92Q1ZIN0tUNnRL?=
 =?utf-8?B?OU93SGVORzJDejZZS0Q3YmZRczlIaWdFcllWdEJpMnlianl3aGxyZTh4aWRh?=
 =?utf-8?B?ZHBCZDRycXRWT2RXeXkweTBLcEhCT1J3ajBFL1lLcThFbUMvRFgyVlBweDBy?=
 =?utf-8?B?czRNcmU0UkJkdTdWbUUwdXRjZzBkUmdVZTZMU29TUDduUE02Q0grdnpocUFO?=
 =?utf-8?B?RkVFRmlTMjBKQ3ZuOVIxWGRjSWtpVTB4YkYrOVBQUnkwTlBUc1ozd0tYS2hq?=
 =?utf-8?B?ek1JMVc2Y3F1WEcwc1RaWng3Zi8rbzVXZytYZXVnQzBlUENZdW16U3pWaXRJ?=
 =?utf-8?B?UlVQU2lDR09MUm1ldGdYSGdjY1JhUUswRmlncklWY3YvWWg4Zld3WXg4Yzkr?=
 =?utf-8?B?NUVmN0s1aEx1OFZ0N0ZVeDNGREF1bVBLSHk3cUVqc1lFazFDb0MxNUNIVktz?=
 =?utf-8?B?WGZFY3p1a2RabHVUK0JYbDl3T3NuYlhCcVlydjlzRVFoV2pKbWFjUjkwOWtF?=
 =?utf-8?B?TGVBWG5OeG1OQm41TWRwcGhGTmRRYUtGNTdPTmRFSTJZYk9RV3V4ZUN1SlJJ?=
 =?utf-8?B?VUxBa2VmejlOSnB6VGV1T05XZXVTbXF0TEE4NnlrTXQ2L1QwZzduWGhYR3pn?=
 =?utf-8?B?K01TYTczVXBlKzAveHRLQ1ovV0dlU2xtenBORmxHVkpjQnFFM0hnZFB3ekht?=
 =?utf-8?B?TmwvQnNQKzByelN3M2lQWFFoR0tpV1lLM3lNZ2FXYXN4ZFA3NEc2eitLVWFL?=
 =?utf-8?B?eUtmWUVJa0U1Tk1DMmMwRUtmSVV3cUtmd01MaGJnRVZwbnJKLzd4N3JrL2Zi?=
 =?utf-8?B?eTlQOVptMTgwU0NROTZEUDRtWUpSdE8xOG9wS08zN0tMc3p2QVJuK00yRXpS?=
 =?utf-8?B?cTRQdGZ1dDdYNzNKZTJOL21xY2JXdmFUb0FzampOb0pkSXJjbVowUGVsa2Vz?=
 =?utf-8?B?ankyVkJmOHFmUU94cFFQSVU0U3cxRDBnMVByUnBYeUw0QWhqVkp0bEpBb2FG?=
 =?utf-8?B?b2VxZ2xjOW5NdzlSUm5kUjdkMS81TjJMMjNXNjlQa0o1STJaMzNLMzB3anRK?=
 =?utf-8?B?N2VabHpzYi9NQmcrTURxQmtWTkZHcVVFdkYyOGV3ckIyRkFWckl0cUM5eVU5?=
 =?utf-8?B?emRkT040L3lnd2tTNU1zQXpPd0VCZElGZkllYzdTV1JCbm4zKzZpcDNjVkJP?=
 =?utf-8?B?cXRwdVFEWm52NUVSdk1MYXg3TVk4NmVtWEcyMWRFdkIvL1ZXY2VCbXNXSlZj?=
 =?utf-8?Q?J+GMJyl8rYVICdrW4emqbP+BK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaed8d4e-8bc6-4d61-123b-08dbe6a8493a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 13:31:06.2234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XvAeL1PH6+KGnl1LuUullXxE7e8Wbs1upMgo7sVHISegCeZy/f+GLBPu6MDYS0hU9ZFApneTeFeNZ0GP4xmHVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8499

... or we fail to enable the functionality on the BSP for other reasons.
The only place where hardware announcing the feature is recorded is the
raw CPU policy/featureset.

Inspired by https://lore.kernel.org/all/20230921114940.957141-1-pbonzini@redhat.com/.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2543,6 +2543,7 @@ const struct hvm_function_table * __init
 
     if ( _svm_cpu_up(true) )
     {
+        setup_clear_cpu_cap(X86_FEATURE_SVM);
         printk("SVM: failed to initialise.\n");
         return NULL;
     }
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -2163,6 +2163,23 @@ int __init vmx_vmcs_init(void)
 
     if ( !ret )
         register_keyhandler('v', vmcs_dump, "dump VT-x VMCSs", 1);
+    else
+    {
+        setup_clear_cpu_cap(X86_FEATURE_VMX);
+
+        /*
+         * _vmx_vcpu_up() may have made it past feature identification.
+         * Make sure all dependent features are off as well.
+         */
+        vmx_basic_msr              = 0;
+        vmx_pin_based_exec_control = 0;
+        vmx_cpu_based_exec_control = 0;
+        vmx_secondary_exec_control = 0;
+        vmx_vmexit_control         = 0;
+        vmx_vmentry_control        = 0;
+        vmx_ept_vpid_cap           = 0;
+        vmx_vmfunc                 = 0;
+    }
 
     return ret;
 }


