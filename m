Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4820F7EEF6C
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 10:56:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634988.990658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3vaY-0003GE-Uk; Fri, 17 Nov 2023 09:56:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634988.990658; Fri, 17 Nov 2023 09:56:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3vaY-0003DB-S1; Fri, 17 Nov 2023 09:56:38 +0000
Received: by outflank-mailman (input) for mailman id 634988;
 Fri, 17 Nov 2023 09:56:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Shlr=G6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r3vaY-0003CJ-0y
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 09:56:38 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 980688a3-852f-11ee-9b0e-b553b5be7939;
 Fri, 17 Nov 2023 10:56:35 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8693.eurprd04.prod.outlook.com (2603:10a6:10:2dc::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.11; Fri, 17 Nov
 2023 09:56:33 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.010; Fri, 17 Nov 2023
 09:56:33 +0000
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
X-Inumbo-ID: 980688a3-852f-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V2DzPhgGb2FBcJh/CvV8ZooBVVhf3C3VTlJGA+1wnZsmy5TwABjW1qyjNwqhFha3sz6MpTPViHdCxLOdY7NxPfby4CHsPHdzPA8n0dnlV1wxWmceBqOYHiaQ19x+k2YSLZEJ0vo4TQ0Vgmd+DAbp/mzOs1D168SLTVQvITD3GKXUZJYbpe/lrxO/vS3XNZ9l/f6tZkj/JJZii9CNBBmHH33aJSi4BmqrDpjuQaDSy0foi6hF/LTJYUqK1TfgRTQuhrIok+YW3vJ1wf9xuNb0Ocg/04ufVcUShGFOHoXy/pBoFgvOFCUYG8dLRb/KWjVTzFJr2wPVWWj5VTMK5GblqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kmq16qRxROMz5LoDpnfjln4AJ+XXkK0MZV34ir3+kkk=;
 b=hY76HJkK2pr8Aean0d3tAsGMxBUgOlM6/Co93QLYQqkt974Hi+XFg1+Yk1QbZQ+qthfq5tacJNsaAtrxVbOCJ0D51LWhdxgj23T5zlMyA7o9H0YIkk2eE1E9gV3+TBViW6SiPBwRBljAPwD0YBBjoC9fsNlWKcnRX2avevvkGQeDRjecVQVxVqVtctYfqjHd67moR8ivhX7Sv8bsz38Wv3NndiE/E57WElWLSmLRjYeg52Z/B468qQ6eiqxSTAS3tyZoAH/vTdl/sGOuoP581C10KDiFXj6uCfSBdYx3SLHuovPi3uaA3o/macY2TiGEJz+E8lYJJ2/ux5RbIUNzMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kmq16qRxROMz5LoDpnfjln4AJ+XXkK0MZV34ir3+kkk=;
 b=1UoDOzH/5NRj/9Z27U+3HAIGqJ760NfdeZqNffIlaSP8c66gghem2RiwuiZ8WpCE0pXGo2PzkXe5yS2dpD5QbGIKNQYmKb1gh0syf/+xNpJfRGtqhqXMieMvEvlsaat1UgGmiJlvdI5BLEZfaNdJz47bj/F1fArfd+H1yGXkyvel9QdFivLd5PBZ0utY1ujPa0OuzVh6Va32XnV7Rze/ei+bpmEb5FbiuUi5yPERM1hf0CeS9RXXTfZixwSLjdyiD0iJ8TSHdRtZ85nj5wCDzYV3IfbEf0PusETC5WQXYQGnEQETdq716KUmfAAxJeqL6tBTuWthiYIDtxbg34fMtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2bd9028d-bd3d-435f-8788-38f3460ea188@suse.com>
Date: Fri, 17 Nov 2023 10:56:30 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: xen 4.15.5: msr_relaxed required for MSR 0x1a2
Content-Language: en-US
To: James Dingwall <james@dingwall.me.uk>
Cc: James Dingwall <james-xen@dingwall.me.uk>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
References: <ZVZAO/W0m/h+IPbi@dingwall.me.uk>
 <aa13be5e-d90c-4074-a16c-d3b051da754d@citrix.com>
 <ZVcv7259slJF4wBh@dingwall.me.uk>
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
In-Reply-To: <ZVcv7259slJF4wBh@dingwall.me.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0328.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8693:EE_
X-MS-Office365-Filtering-Correlation-Id: 7881ba5c-50f9-431b-15de-08dbe7537ad9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9CBxdPIHRIkNml8yQW1BBv5RKGMPtR81gn1N7V0itGFbeIAVa0w1opboa4kAQbACilLSTWvWr6emFRpt9IBvIUKL6u9PXSeql4zCSwEQlGDkXQXch2A9yt9YfNOVexXXXAwOLOcrJzkugFuihKqL1fMwBSdhMmIvZUpXKITL1Ejs9nd9M4q4Kotvd9wQ5G1TPpXOeGPoJk3Fsxuymx6IQ7R1y1yPAUvfzRxhkRF25w06DbT1bhY6Ve0mO7GWc02fN/sQX+X2g0TYX1mlbIXJNUftMy2I5eTY9lRemHqcKERkEFrBrLF06y+MyBSYZ6xPZCkTK1ilJUt8gDuBWLyaoP6O87zmclL7xIIjG2eMB3qhl/CI7iHA+xdeFbuJpE9AF2TbgDPrT5js/TF6/RnoxJckti/1hiThCad49IMNEG0y85g22MVkjShWD2SpyQEqG9Ja5KHZBpiwinTN32s2Yhia6XNy9ZrjGt0Fs/jjHZCy9U2j7olx70+IrC8jCKWqE9hR8Ku0vtwsrLDIezDTlKoEj9LfnFlC97gZeRs6y7T7Hi1ieKdmBdEfJIulI1bFZM6ILms2pamI6SDAtxby7ImeYld6cAkpBo14nq+yFfp5sVhPO9YkyqrX28kG46E2fO0u5V5HV8k6Nx1G20Q3dQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(136003)(346002)(376002)(396003)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(66476007)(66946007)(86362001)(66556008)(54906003)(316002)(6916009)(31696002)(38100700002)(26005)(8936002)(36756003)(8676002)(2906002)(5660300002)(4326008)(83380400001)(6486002)(966005)(6512007)(53546011)(31686004)(6506007)(478600001)(41300700001)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1NXeWN1MEdrbHVCUjIybUJiVUFiUXdubUl4R2hId2xVWDFqUkVpRkVSUjFN?=
 =?utf-8?B?RGFIbjdkKzlCei82Qm5yMGNkb1J5NGdlZThQbTc5eVJ5OTlTK1F2YTY0VERP?=
 =?utf-8?B?MG9JZnhlNDBpaktueFJZM0VhVC9QQ0hIQUdHTWt3YW5ES3FLR1gvd2d4bC9u?=
 =?utf-8?B?Qlh1RUZEbGZXQUdaZGU3VzFKaEx2Rlljc2NBSUxaQTc2RkFlTzRGKy9oTDVt?=
 =?utf-8?B?bnlhSWpCQ3lUMndVV0RGK25qMVVHUndMK0d2VkVBWWJISlhKN3JtWVhuZU1Z?=
 =?utf-8?B?SnNEdWhyZnBPNy8vb3hGUzB2ZXJvNUIrY1N3cWR5eG1oZktTNDBKVEV2TXVC?=
 =?utf-8?B?TDFuQ2hKTUxOUHNWMWdEcEhOUHoycWZOQkJvTUw3NUJkajZqa3B1a1hnVGNs?=
 =?utf-8?B?a2pQTG5uV1BLZ1QyMmlDQXR1MGdYamlYK2wwdVlCdzVWaHhVMEJqcy9CQS9y?=
 =?utf-8?B?YytDVVNHWHF6cUlUUlYyZEQrNlljZ1d2a20weXhVRGFWc1JHa2dUcys3SG1S?=
 =?utf-8?B?TGRpRFpqcGsyakxGRkp2dXozNE4yUmdTZ3lqU1dlUHNUYnY4NnZYWFpML2Zl?=
 =?utf-8?B?M21oU3QzU0txUzhET1pVTmQ2UHpXTE81ZXNnRzhidEpySk1RWnpBS3FnamxK?=
 =?utf-8?B?cmVQUVFDN0xzQ2FzdFdUbWhBTjk5R0NmTnZhTzY0MkJSNWN5U1lYNVZKMUVp?=
 =?utf-8?B?S1ArQnRHRUl0UVRDdmhoMGU2SnpBQVNkSzV6UDBoK0VkekNjMHBIMUxvVUQx?=
 =?utf-8?B?a1F2QUdON0tzY3ZQU2doSFF4c01ZQS9wekN6Ym45THdNbm9sQ1NERCt2aHNk?=
 =?utf-8?B?N1J1TXB6dFZ0UjB1ZTRudkpHeFNia3lMSlI4d2ZWK2UrQjN1M3FFcGlBNTkw?=
 =?utf-8?B?VC9DUlo4Nk1nY2U5Mk1ENmZwMmdpbVdYN09Na281eTRkakdWOHFPOTViWStu?=
 =?utf-8?B?N3ZEMVhzM2NPRzhrNjBWSllHcDBwdVF5dGo4V05LMzJzZ295bW5CM1pPSmx6?=
 =?utf-8?B?bkxmZFp6MmhBRUc1b2ttQXRzNnI2b3YxSVpUK3h2SVR2c2ljMFhSNTI3eEtz?=
 =?utf-8?B?aHJpamhvTlJhTnAzR2t3VGwzL3gvY1FJSjFnL1NMbnNPRXVva3hYT1hzZlNB?=
 =?utf-8?B?Y2liTVVVOG1IUDZZMVdPU05BRmhUbFVmbFRZQXp5ckp4eHpzOGZhVUpMVUhF?=
 =?utf-8?B?YlplNVJRY2dCUW1HUGZPSVRWeFNzVUVCcGJ6QkgvNXZiU3hTRDdVN2dRMlRW?=
 =?utf-8?B?ZDA4dDZLSVU1Z3lTMnpNR3JoUGYxWitKMHdKNUFoWDZPTy91U1lES1ViN0Iv?=
 =?utf-8?B?c2M5WmZxM2cwVWpXNWUyTi96NnBsNWFDZEI4RGZSSm0zWk94OXowSlkvSEZK?=
 =?utf-8?B?WEx3ZjFNYUYrNWFWbnVaTlJxOEIzaDFRSmdTV0JaaHlyTVU5UFloY1c1YzBq?=
 =?utf-8?B?OXdCMHNQM0Vidks0Zm10VCsvb3dCeUtjbnJWUVBmTk1lNEpLMUFkQmZnUmhE?=
 =?utf-8?B?SS83OVpNRXNIdGtzalBxd0dxQWFrRHk2aVV1YW42VWphSG5sT2NWb1JWMFhk?=
 =?utf-8?B?QUd1bWppN2J3dlRjSnlhNTJ2Qk1CYjBNVU9nc2dKb0FCUzdIL2FUNE9lSC9N?=
 =?utf-8?B?eWw2dklPZUZENEd2OEpjejJzdnJVV2dDWnBpSmdkelE3Y1hDRHhjYS93RG5O?=
 =?utf-8?B?ZXEzTU5OaGxMZzBHWUI2WlV0RDhhcXh0MWdrMUU3MnNDVEg3Z21XTW9wOTRV?=
 =?utf-8?B?N2E5WmJnUWxEK1dTSjI3K1N1S0JFNkx1ZFExWHlYdm5veDdKZGpHVU81cklP?=
 =?utf-8?B?ck5wMVF3cXY0bEMrRU9lWS9ET0pEUDFpY2dJUWRiVHlqUk9IT3FzT0NJMGd6?=
 =?utf-8?B?WWFvTEZ0Vm9obUxuWTVQU1drNTBVY0lRRVdDc2tza3p4MFBDQlpobXZ2Rk9G?=
 =?utf-8?B?NnlwY25NNlk3UDJwWXBpY0R1ZmZnUzBUSWJJakRMY3dLSWJlR3oyeHE2OVVC?=
 =?utf-8?B?bHNxV0ZuMXhMZVFSUXAwSU5PWkhOVEM1S1hsNzZTMmMwYk45STczekJRdlBR?=
 =?utf-8?B?a2oxOGVySUg1aGRrRVRpSWdzdGQyd1k1dUIrdGdXd3g3U0FrNkdVTlF0MjZL?=
 =?utf-8?Q?kswoYwSpwWWEJzEMO6ZnvMoPL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7881ba5c-50f9-431b-15de-08dbe7537ad9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 09:56:33.3355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4sbumBaidO0k8ES6aO9LN0E//CkUihC+Gb8gNgqQ16UDeE4dMOSzvtU+lFJEywYwedsMy67hBL8bGqw7rg1B3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8693

On 17.11.2023 10:18, James Dingwall wrote:
> On Thu, Nov 16, 2023 at 04:32:47PM +0000, Andrew Cooper wrote:
>> On 16/11/2023 4:15 pm, James Dingwall wrote:
>>> Hi,
>>>
>>> Per the msr_relaxed documentation:
>>>
>>>    "If using this option is necessary to fix an issue, please report a bug."
>>>
>>> After recently upgrading an environment from Xen 4.14.5 to Xen 4.15.5 we
>>> started experiencing a BSOD at boot with one of our Windows guests.  We found
>>> that enabling `msr_relaxed = 1` in the guest configuration has resolved the
>>> problem.  With a debug build of Xen and `hvm_debug=2048` on the command line
>>> the following messages were caught as the BSOD happened:
>>>
>>> (XEN) [HVM:11.0] <vmx_msr_read_intercept> ecx=0x1a2
>>> (XEN) vmx.c:3298:d11v0 RDMSR 0x000001a2 unimplemented
>>> (XEN) d11v0 VIRIDIAN CRASH: 1e ffffffffc0000096 fffff80b8de81eb5 0 0
>>>
>>> I found that MSR 0x1a2 is MSR_TEMPERATURE_TARGET and from that this patch
>>> series from last month:
>>>
>>> https://patchwork.kernel.org/project/xen-devel/list/?series=796550
>>>
>>> Picking out just a small part of that fixes the problem for us. Although the
>>> the patch is against 4.15.5 I think it would be relevant to more recent
>>> releases too.
>>
>> Which version of Windows, and what hardware?
>>
>> The Viridian Crash isn't about the RDMSR itself - it's presumably
>> collateral damage shortly thereafter.
>>
>> Does filling in 0 for that MSR also resolve the issue?  It's model
>> specific and we absolutely cannot pass it through from real hardware
>> like that.
>>
> 
> Hi Andrew,
> 
> Thanks for your response.  The guest is running Windows 10 and the crash
> happens in a proprietary hardware driver.  A little bit of knowledge as
> they say was enough to stop the crash but I don't understand the impact
> of what I've actually done...
> 
> To rework the patch I'd need a bit of guidance, if I understand your
> suggestion I set the MSR to 0 with this change in emul-priv-op.c:

For the purpose of the experiment suggested by Andrew ...

> diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
> index ed97b1d6fcc..66f5e417df6 100644
> --- a/xen/arch/x86/pv/emul-priv-op.c
> +++ b/xen/arch/x86/pv/emul-priv-op.c
> @@ -976,6 +976,10 @@ static int read_msr(unsigned int reg, uint64_t *val,
>          *val = 0;
>          return X86EMUL_OKAY;
>  
> +    case MSR_TEMPERATURE_TARGET:
> +        *val = 0;
> +        return X86EMUL_OKAY;
> +
>      case MSR_P6_PERFCTR(0) ... MSR_P6_PERFCTR(7):
>      case MSR_P6_EVNTSEL(0) ... MSR_P6_EVNTSEL(3):
>      case MSR_CORE_PERF_FIXED_CTR0 ... MSR_CORE_PERF_FIXED_CTR2:

... you wouldn't need this (affects PV domains only), and ...

> and this in vmx.c:
> 
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index 54023a92587..bbf37b7f272 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -3259,6 +3259,11 @@ static int vmx_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
>          if ( !nvmx_msr_read_intercept(msr, msr_content) )
>              goto gp_fault;
>          break;
> +
> +    case MSR_TEMPERATURE_TARGET:
> +        *msr_content = 0;
> +        break;
> +
>      case MSR_IA32_MISC_ENABLE:
>          rdmsrl(MSR_IA32_MISC_ENABLE, *msr_content);
>          /* Debug Trace Store is not supported. */

... indeed this ought to do. An eventual real patch may want to look
different, though.

Jan

