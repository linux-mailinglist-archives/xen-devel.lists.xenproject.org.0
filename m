Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BECFA7F5C42
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 11:26:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639502.996952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r66tw-0005T8-E6; Thu, 23 Nov 2023 10:25:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639502.996952; Thu, 23 Nov 2023 10:25:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r66tw-0005Qe-AY; Thu, 23 Nov 2023 10:25:40 +0000
Received: by outflank-mailman (input) for mailman id 639502;
 Thu, 23 Nov 2023 10:25:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=licP=HE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r66tv-0005QY-Mh
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 10:25:39 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a51e94bc-89ea-11ee-98e2-6d05b1d4d9a1;
 Thu, 23 Nov 2023 11:25:38 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.19; Thu, 23 Nov
 2023 10:25:36 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.012; Thu, 23 Nov 2023
 10:25:36 +0000
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
X-Inumbo-ID: a51e94bc-89ea-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iNr7GJsaB1NdIdKxAnW8x1zAIWEVSPoIdgmjLoK2vnJfmr0B8x/LhS0dQ8ejsWwz8CCkfMuhTudUYKRHsk6NiIerT8H1tmvVREXGkmXAjW9PbDEV1d0BdGk4hN1LYEEuviKpVIWQIosES/yElccvMd3qByNlRqFR62+PJe2DZ76qdH4gShl4TFzbmr4xgPSlL49nz4vVO1eS/6Y0HYX1yP3aCYB72RusTooxptF37hC9iHrH3P7E79yPHkVxyoS7jTTZewA16DmAIsbYwTAasl/G3j8NmR1aAdJNtTXVGbVjWvJZkHMP5pJxtS/e6p45G+JZHhBN/Q5b8CTO89+Saw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BnC3OyozHE33/JAUMUxXZfR33+rkJvqVx1YnwNe1zTI=;
 b=S7uAmw2iTv+uasOD96cqxD0Qhdeq9BhCRpO8efGX9oZDQvAAxvsbVw9LLo3+Pm9URDN4tIWW03XeKe8+hNTIZ1YfhZZyWmTl2DvcpVj3vuEjWsS3eNSXEmfVDYXt9EXzoQ/uU9+FLkdEGxYHYeYjcX88EjnpEUbNukAb1uETOOggxkPagrxheN6KcZiYIrLhEVlRDMALuy6k/n2MlK55NwELKctxtU7onBwsNbSq3NoiC9rnrdmnrC0cerVAfohkTMbD2bEw9Gd7aZwluLLEXguAfLv5wqWs6+0VgPKau/PpjBzjp37B8FcI8sHF15xeBuUeZQrHTDzCjLvp8XoRfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BnC3OyozHE33/JAUMUxXZfR33+rkJvqVx1YnwNe1zTI=;
 b=4mOiFrXZ5jpaxWEvu6GWkXdakwAVDUIc+SAivbL8HdSjhFzs9O/OVkv9eFIxG7SmeEZObEKG6kyfFL8WJjWkxacyjOQO65QVPb+Q1adRdjxPkvQST/ytEBx9186pU05g7j0FCOltzFCg3wG1JK7DgbRebuzqsg0+HYEIewc7spx62Jd7SXbhC8jTfSSG2xEhsCG6i1/ZXF4UC/npsUS9ZPtfK0edp6CrT1rSPTGbHtW7BiaU5lttZlVt+5IE1RYqgPljP5pLdIZ6KLgx/QVeHv6+dn81S7EZ/I2JSUwIreMG2SAAH56AuXZmGxnKebu0gI2xkviOySEMDc8Rv3Mn8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8efe0fed-8533-474c-9893-e6fcb38b93ca@suse.com>
Date: Thu, 23 Nov 2023 11:25:34 +0100
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/HVM: limit upcall vector related verbosity
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8951:EE_
X-MS-Office365-Filtering-Correlation-Id: e3f1d4ee-56c5-4599-7376-08dbec0e8814
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mDb+Xap7w337/WHBYiiJt3iwnDVrrFpmVV6xrODMXosOI+wVbi3sHzsJUUAYiy9/tTPkZSN5OumG9OESlM6cC25Aszu1HELzCLQqNgWe7RBDErF6O8XDm2auk/Kvpm0Mjc7i4tlc1Mkrw13vlIlxWVBeYMCycuOZsTVoUi6j7liqx/AedYdF+zU5J2vQodGBvCMktx+X/5FUkFGuXSiiH1cvAScGfjpeAA5cio8Foly2n8fn7yRruhbBjqJvZT5D9tr78Mu27yqa6TQDJjCm0vVB1Tvv5iqlQ93Wsr1lz8xQrqCB3Uy2l33+KyN6hbbHDAQDq/ZTvnuU5YFwp9UlCCQBpP8C7JZxOiemnVjuSA2BycxEdOyTwwcbqLZVM6E//8dm3vGwdgWNxqO2QejIR6jBV3kFHRWH7/FkR2dxbXgp5R7UIlkXh4zJ/KLuR2LaL9uuR45hV2AaM22v+AaCNwXmSphZ0IlrxAeyxeixp8nh97R+1Nuekfv7sSAsmv9CL97bWdjaQf4GlvWcQAmSgaMpojrJFZ29NwLo8IpkrO6gF6uXRYOUGjNkGkZUVpCJZAw/V+Y8o32A0cSrt0P9sCk1MkAQOqsIIWI6P6MPvU/lH9fIIo0prWRiAR24dB5KI6nQS1tQodljyTwhRXWvPA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(136003)(376002)(39860400002)(366004)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(83380400001)(2616005)(26005)(6512007)(6506007)(2906002)(5660300002)(41300700001)(66556008)(66946007)(6486002)(66476007)(8936002)(316002)(54906003)(4326008)(6916009)(8676002)(478600001)(38100700002)(31696002)(86362001)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDl4eVVuam5HRDRzdGxja2Y1aUZ2OWhhUENOM3dndVdDS3pFWHFTWUNSUTk4?=
 =?utf-8?B?Mmo1cEQvVEdFSzNUZHRxZ0xrVVJrcy9MV1pVOUl4MGx0YWgrckczZEVzeTM3?=
 =?utf-8?B?czZ6RDFNdDJWVVcvekc4UStteWZmYkVvQ2VGYXdUTG1BM0IyalR2d1JGNHY3?=
 =?utf-8?B?MEY0eWVaZlVPNllBOEZXRlJrcUFLSWNWWStJTEJFM1hWYi9mUElrRGZWbDdi?=
 =?utf-8?B?RDVuRW5FV0hBNWE5RXdKZEZ5T1huaVVjbGdueXVWQmhtdTVSMUtBT3QvSzhX?=
 =?utf-8?B?ZUFITHFLT3RLcFZDbG9xZW01UTdZUXg5aENCc2wramVBamFjZi9oejZCSWVN?=
 =?utf-8?B?L2JPcjg3NjhjNi9qazI5NkZ3bTVNcmV6TC9yaENMR0Z1RURkSzZmSjB1aEJM?=
 =?utf-8?B?TS9MUE8zVitaQTJqRG1yYTg1a2xTRW9scjErVFM5YWNQY2lFZWpmcGJERFd2?=
 =?utf-8?B?aWxmNk80RnY0S3BDdFZqZTdIUGdNcFg4UGhudGYvbmhDay9RSkJKYXNhTldu?=
 =?utf-8?B?SmxlRVpQUDBaV3ByVXNtQ1Z3ZDlzdjZlOU5VeHcrcWRqSWFnRi85WXFQQmZr?=
 =?utf-8?B?Y05WVzM1RXJlYzh2M2hxdEZGZEVGdDBhMzVBQi84SE1QZWt3a055YXh2eGFo?=
 =?utf-8?B?R21nc1Jpa3M4am41ZnhpWVRRc2JNSi9wYXFBeFI1NFBqbFViY2tSeEE1Q0k0?=
 =?utf-8?B?eGJkK1NYMmpZMlR6ekdKR01ObSs4U3NhZ1dIdncvVk13bENWL2VBTjRzRU5y?=
 =?utf-8?B?a0tTOHo2elZhU3NzaFc1b1VVSGhTNE9MQldtSk5ra1FONUVVZUNXOUdIZzg2?=
 =?utf-8?B?bVFLeDhaeHg4T2J2b1NNV3ZteGxiVklLMXgrZDNTVGJuZVpOc3UzZEQrd0d0?=
 =?utf-8?B?UjQzMFNMREFDOWV3NnRlSG5DQko2N1E3bkw1OTIyd0lzQ2NpUGc4K2NLb2tX?=
 =?utf-8?B?eTN6a1VFM3lGSXhVblBSSTNNNFBGejVVRlByRGhUeTNIZmt3dmRPdnpYaStk?=
 =?utf-8?B?MmpXVEtzSkRtM0pzN2FmNk42MFE3Qy81M3lqek5xYnNwZWlDTU9Eb3NWVVVJ?=
 =?utf-8?B?NDNaWm5PRUZqT0FRNUVVbUROSWRhQkF2MzZFdjZuRFFSRFN3WFJLOU5nNVVY?=
 =?utf-8?B?TUNiR3VXYlZDWmNwNWQ1TmxlS3cvWjFRb3czTzc0cjZERVU0akcyL1ZRU3Qy?=
 =?utf-8?B?T3JMV0RlZUorZENiNXVXdHlnZW53am1PdU5GUUZYcFhXRUdEbk1nRnhBZVpN?=
 =?utf-8?B?TmEySE56eXZJckxWMFR4RUFHY0piRW1XZnY4S1RUdzN3RC9keEFvdy9hU0ov?=
 =?utf-8?B?UEEzMjRUR1NsYkZrOVMzN1k0SUMxaUIwYkFjeXRxSGlmN0NiMTFRbjV2TG4v?=
 =?utf-8?B?UXd0QjlsQnpncnV4MUlRWVozczR5UDdtZCtSb3Q3YkRrR3FheTE1V3FxWmdN?=
 =?utf-8?B?M0ZBL250aSs1ZHd5OURsNCsrU2VUVXhmcmN1ckVrVDgwVzR6dDVuYjlMeTha?=
 =?utf-8?B?dU0rTDcwTkN2MjVldnJ2ZUNNdWNlSXJwOGJQRjZ6Q2VUeEFKKzdUM1B3bUxX?=
 =?utf-8?B?WExSbGlSKzU1OGhrNy9oRHh0b2ZKeTAvem1QRTlVMXFtdEpYanhqMkc1STVj?=
 =?utf-8?B?Ky9JUGdYNGxsS2ZTa3Z5Rm1Rd3JrY0FBaUZuTEMrWmNwbXFDNk90YmFpclhT?=
 =?utf-8?B?VUlJYURMZWxVb2FBMzNZandPWFRCOVFBaU1oTVF2azRtdUFiM3VGVEhmcWJh?=
 =?utf-8?B?QzlUYWFUVGhSNUd0OGxsZi92QnhHdmZGR0tjN0ZVTExRUDQwTEI5TTJQZVNy?=
 =?utf-8?B?cXVUbkduRkZ2YXNLZUU4aWFpaTBjMStQVmlRenEwektCZ3BTVlo3aDlFc2Jw?=
 =?utf-8?B?WU5xZFUvMFhyejlhL0I1VGYrOGUwR3VOTTdsTGJhUmdKTW01SUU4OFVob296?=
 =?utf-8?B?a0hBVHo3TEU3eVB0eXB3SEZuNkdlWGNIcnN1OUQ3am9ZZCtPRDZqQXFiWFZX?=
 =?utf-8?B?TzlSUWxSYko1S082bUxqa3NmTVo4cVVWVjJiY2ZjNEhFdW1jYy9odVhKYllC?=
 =?utf-8?B?LzRyMThrZ2J3VTJCR3pDdVM4emkvcS9FRkF6VjR1SDVRTGQ2MTlnYndOOEMr?=
 =?utf-8?Q?mxeXbUuyq4CWNy6YxZR8glqT3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3f1d4ee-56c5-4599-7376-08dbec0e8814
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2023 10:25:36.0771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 902IuKINg2fL7MMuLhach/tTgFOOfnaAGSWTVdvkW/EOJdmJzIGnecq4vrpL/79pGWc2FYaO+P+sAKH5Triovg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8951

Avoid logging all-identical messages for every vCPU, but make sure to
log unusual events like the vector differing from vCPU 0's (note that
the respective condition also makes sure vCPU 0 itself will have the
vector setting logged), or it changing after it was once set. (Arguably
a downside is that some vCPU not having its vector set would no longer
be recognizable from the logs. But I think that's tolerable as
sufficiently unlikely outside of people actively fiddling with related
code.)

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -4129,7 +4129,10 @@ static int hvmop_set_evtchn_upcall_vecto
     if ( (v = domain_vcpu(d, op.vcpu)) == NULL )
         return -ENOENT;
 
-    printk(XENLOG_G_INFO "%pv: upcall vector %02x\n", v, op.vector);
+    if ( op.vector != d->vcpu[0]->arch.hvm.evtchn_upcall_vector ||
+         (v->arch.hvm.evtchn_upcall_vector &&
+          op.vector != v->arch.hvm.evtchn_upcall_vector) )
+        printk(XENLOG_G_INFO "%pv: upcall vector %02x\n", v, op.vector);
 
     v->arch.hvm.evtchn_upcall_vector = op.vector;
     hvm_assert_evtchn_irq(v);

