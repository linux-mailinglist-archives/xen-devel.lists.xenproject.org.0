Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CA47FB7F9
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 11:35:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642945.1002779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7vQl-0001gk-AQ; Tue, 28 Nov 2023 10:35:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642945.1002779; Tue, 28 Nov 2023 10:35:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7vQl-0001eo-6T; Tue, 28 Nov 2023 10:35:03 +0000
Received: by outflank-mailman (input) for mailman id 642945;
 Tue, 28 Nov 2023 10:35:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xcZ5=HJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7vQi-0001eS-Ua
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 10:35:01 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0606.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7410ee2-8dd9-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 11:34:58 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8844.eurprd04.prod.outlook.com (2603:10a6:20b:40b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Tue, 28 Nov
 2023 10:34:57 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Tue, 28 Nov 2023
 10:34:57 +0000
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
X-Inumbo-ID: c7410ee2-8dd9-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I/GB5xavGsit3C5KGxn6FretSoyY3qBHzDsYC4aRpAKcz96SqU7UZCK+qS3OtP/IlTrPdMo3+9i2OF6cM9z2oC10oq0E0s2VxqRlL32jZPYMHY99BI4kkmrrlFgx+jMumjFI54UavzUhTQBB/iec+5BHIRBW5QzSXfq3+GPum6hjpi5XbynBoTKs5D6ZxMfA2q44nIEjvEA0b0zFx+fWGl90ciRRoopuyRiTqF7u5PZwW7i/Ciq15nzRmnBjhwe29J9eu08KR08oPCdIJWc56i5xO0tGEfvUYg+nsMRIHO2Zaw7iAbxcakMA4IhebcCr5LILihiVbYSSTJz+x7i+ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VPblwhZxXKXmmMEQwPYJhq3BZo9HkDC2DOK95SX8Bhw=;
 b=RSAn5rkq266bpDOt1vQKrRrRiCn7+nGs1Oo6HtHLJNt0DDqQNaEYA6KJuX8Be/D6alhb6FlD9TGNDm6FGKghxOAs7lGmdxfykul0lq4K7o8fSb9sH0VLa5hy9Ae9rbjK8I4b1FASrcTOD1M5jKDPpRw+Zncjyy4p0vgyE1mvgtFRPyo3FaGO5ffzbgVnks5BsW+2AOKHkrhV9LHl89bpJ28vYn5J4eKX69PcCZP8P/e6xZyJ42cnuZ/ykvw7Ye46T1jhVko0T31bGuIBYwZQUtCwU6bOb12UUCveLCNZNLrxeK5rcKL/ruKYYENZW32q1878e0okb7YBou50FHtoNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VPblwhZxXKXmmMEQwPYJhq3BZo9HkDC2DOK95SX8Bhw=;
 b=u/oIFidpg4oE+dJb26v59hPJZANIgUReV3AsOa0yr5Ne/36uykVexqapAWn/JPwwE8q8378sxMtaGJiG+wgk0MegoKI74wE4HQhvhSf18RGzPeWjCBCwSMNy4bPtw8MmVGWmsJH8JlCU/XJfmGI5INJWjuaEdWjdkQVN/HGYJ4bZrSSIAEr+fDquGZgApseN3GfiiO16sgMaY/Q/SAvQjmodsPMNs/GNPVEcQAZvw0CxFWsLJlC9XSbwPLsGQupp+Zn4c3IO6mwv2oDWW9dxMGR7EuHEr7WxAe9ekqMnH2Hsbm1IqReujh0lndStkVXarCwcHmqxW3wv44LhWdEx5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dbd5bc8d-baf9-4181-8f75-6e8c4f2351a4@suse.com>
Date: Tue, 28 Nov 2023 11:34:57 +0100
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 3/6] x86/HVM: adjust save/restore hook registration for
 optional check handler
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>
References: <49a17ffa-c873-4b0f-81ed-9587053ca159@suse.com>
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
In-Reply-To: <49a17ffa-c873-4b0f-81ed-9587053ca159@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0444.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8844:EE_
X-MS-Office365-Filtering-Correlation-Id: 09482840-8f91-4fc5-9f63-08dbeffdaac5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t2dPqKkbG8YOGiziGkBRGMxX++Fib838ObmeL+AiDZoIth8pQEAMQh5Fr8b89jpyEtYEIJhIOBk/jOoao5puvJggO+xa9G7Fp+JVLnbm8CCK//ZmOwzjUWYHdQujDqdPTY2LhjDCyDYaM92SO4EqZQtamo5+JtN2vZ8ZLyo3BPp4gfNB+x/2lQevImkymdmO5rfvkV56LbEU+9o35w/qNNo8MoS6tWh9XtIFo4tDLwgKsU0mfX74rmFL1cijxFRY3LkFQcN1Rpk2DM9cv9jColhqsRM2TjIQHXGWRTlUz6ajiKv6i3qCxYU0w5rFKnWKHi5a0pfqXesfMr9e4bRR3svoX5sU79OVKNXnCt0aphkhCRa8vAnOaBqkjGOhfjECQAZDKgoRVMFFlvbmZ+8lW7xroJc1/fV0lkFMWHWU8ILs9fZKZXfGUGzpTyQbhl7exmYvq43gwV+kI0DYw73fJGA7XSXai/8fcfPbKE8K0H2H2QlEhiAORBRtFyYcMEN221w43U4l9S4ZZtHh/SLwh99oyv0ZcFDgYF9hP+HrnWnBZtRLKC70s1IdZa0Da+J27KmuuUlae+Rrr1Tv8BwDq+WIjn7oxLn5EEwtQLWL4Ag8bF7G4TzQAz+MbDWyhfWME+PFFyzI87sCdZRsCHJ4lw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(136003)(346002)(396003)(376002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(31696002)(86362001)(2906002)(5660300002)(6512007)(31686004)(6506007)(8676002)(4326008)(41300700001)(8936002)(83380400001)(316002)(54906003)(38100700002)(36756003)(2616005)(478600001)(6486002)(66476007)(66946007)(6916009)(26005)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHlFOUZyUHNFSjU3QjdNYVpSallTMmdQSmlnMk83MTZTSGE0ZHZhOHhPVDBM?=
 =?utf-8?B?UGtLWUVveTIzYUhqeGlmUXFyZkdDeGxyWXh1NEFZT3JMd1dROEh6U2NJSFor?=
 =?utf-8?B?b3RQNHU5bGpwdXhrQjdZZWd2cEZTMyt3RzNFdWZmZmc4UjJ5UitmSU5janpj?=
 =?utf-8?B?dEozczVaUVBYWStkQzRodHRYSTlvT2Rudm1nclFzV1RoVGUvUys2NlpmZXYv?=
 =?utf-8?B?cWMvWm5xSWxXUWFoWVFNdnExTTYwMUp5am94R2J0cFU3UXV3THZhNHRLd1dv?=
 =?utf-8?B?eE1PL2xJdlI3RjZnYTdLSTcvUUNxWlozTit6Z0hJRDRTb3ViWEoyUmhzNWR5?=
 =?utf-8?B?aVFTVWtnWUlFU054aHpaZEZoSURTbEd4Y29CQTRaQkRjY2NGMnJvT3hxdEFU?=
 =?utf-8?B?RHB2OUxPVUd2ZytCVFRDOWNRbC9iVHBQTjh6S0JsTnFORGk4a1pBOUt1RnBM?=
 =?utf-8?B?YmN0V05PVFVqSzBvUnFiamJwMHNoeFNPTFBDK3JJSlpLcUd1SmVxNWZOK3F6?=
 =?utf-8?B?dkNBRUwzSWhNU2JYN1ZHWWJHR3kzS0FVN0U5bWUvRUVTbjhnY1lvT2FxWWkz?=
 =?utf-8?B?TkNiZ28xclNQUFRGbytjcTRjcU9TZHFhM1RvaGVJcEpEYWpwQWJ1ekx6ZE1J?=
 =?utf-8?B?cHZOYWN6bkorb1RFMXVnZ20ram8xS090V2luL0lTcXFXUUxUZlB5SDNoTDZp?=
 =?utf-8?B?Wnp3Rkx1eVVidGRkTHlibTVFOXplT2lqWHlzMXl3ZVNRQmcrOUlZN280UDlq?=
 =?utf-8?B?R0d2b01EU0xkUDlpejVNS3JXa2h0U0RDa3BmMHNGbnRpRlJpTjR6U0xoNU9C?=
 =?utf-8?B?Yjd4YTdkdFk4NU0zNTdLMThaMVcvcllQOU94NGJEOFU1OUdXU2ZXQWs3SHpk?=
 =?utf-8?B?eWdNODNjOWpXNEw0L1JBVTVyYUpsaFZFVWNVS0VaSjE2dEYzTVRWTjZwK3RC?=
 =?utf-8?B?NjZnL2ljUmE2NjJ5WHAzcW1sYzdianR6bmhXSXYyS3REUW93cTJMZXNXRHMz?=
 =?utf-8?B?Y1FXN01PSkZVcUppdHRkWEZvUEJMSWRianFwc2RrY1hwSjdTeTZBV1dCeUZR?=
 =?utf-8?B?bVhsSTI3YlpuNEtONWttNEJCOUFORGJVOWZMZk5ycXVKeng4YllTeUVFSFZv?=
 =?utf-8?B?WHE5TkF6bkI0Y2lNeXpsc0p2TE5XV0NFMXg3am96OHh5VVJuZFZTL2dHdUgr?=
 =?utf-8?B?NjNFa3ZNNDVGMDBVWThzdHJhWU5USThWR2pmek83Mkc5OXhiRmNrL20rUU91?=
 =?utf-8?B?anhmMGh1bkV3T2E1NTBBTXZYNE0vemFnd1NOdjB1OTkvQ0dMa0NjdFFsSGha?=
 =?utf-8?B?QUljNE56MlFBMzhvRUJDd1paOG10V2Z0M3Fvalo3UnRLYzFKMHRUbG5kZ3hs?=
 =?utf-8?B?YTYwblFieFFPcURTVytvbkdEWkVEclZGMUxwdURxR3BrcGZSN3JMQ1BKS1hS?=
 =?utf-8?B?SjZ0QWtTWUlsOTRMTVpqVzVybENtNk5qQnU2R0E2TkJibHpIRDk3VFFndWdp?=
 =?utf-8?B?RmZHU2Q5Mk0vbFQ3V0xjb0hLbkt2Njk1YWlpeHZ6S1dEbjV1cGlmaTFmMk5F?=
 =?utf-8?B?Vm5TTnVaeTRrbVA3Wk5Uc2I3dWJ2dk5wbXVTa29JZ3hYWFBLM3hFdUFldUJl?=
 =?utf-8?B?UzVDQTJYMFRrVzRuRy9jUVQvQi85aW4wMlRVYXZjQW5CTGJvVVl1Z1BxMWs3?=
 =?utf-8?B?ekJvek0rSkxRTHhKUFBIMUpQZG5neDN0RGN6QzBGNVUxampqT0l1ZmNweDdN?=
 =?utf-8?B?TzJzbXNyRkY3NEFaQ1lwQmlLUjFnTGJrT05MSEFZNkh2WHEvNHlwQXBMbUE2?=
 =?utf-8?B?cjVpejdOa0hYUHVrajZHYzFXOWVYYWlCSVA3RUUxMkxCWmpaTnVUM0d1T2hI?=
 =?utf-8?B?dTRiZ3dLRXhPYkx0NGpER3N5d0JWSWt5c0V2NHFlSmpTQjRaeTNyTG1aZGdy?=
 =?utf-8?B?cHR5a2RJNXFJc2VjSDJ6NVZ3NXZtMnEvQ3lTYzlCeWhmQ2VjTnZHd0poZklH?=
 =?utf-8?B?NkNZcE0zUWRJRFg2Z2xQSkROTWJIOExPME0xdjRwOGdXaFdMS1FmMHBhamEw?=
 =?utf-8?B?Z05OZmV1NVpBR0hYbFJ5Y3AwNTdaVDRmc0lqMXkwcU0zT1dTNm5DWUpyK0VQ?=
 =?utf-8?Q?cp7RZIU6UUUgreVh9JTbBsb2m?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09482840-8f91-4fc5-9f63-08dbeffdaac5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 10:34:57.4683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MO8lOy9zTZFWNXZUsmBa7A1ByF1CmiIAWUIBNtR8vITWKmwHb38zEP8cCE7JL+nRPhrSgQdClVzon1dgfAHfpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8844

Register NULL uniformly as a first step.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
v2: New.

--- a/xen/arch/x86/cpu/mcheck/vmce.c
+++ b/xen/arch/x86/cpu/mcheck/vmce.c
@@ -374,7 +374,7 @@ static int cf_check vmce_load_vcpu_ctxt(
     return err ?: vmce_restore_vcpu(v, &ctxt);
 }
 
-HVM_REGISTER_SAVE_RESTORE(VMCE_VCPU, vmce_save_vcpu_ctxt,
+HVM_REGISTER_SAVE_RESTORE(VMCE_VCPU, vmce_save_vcpu_ctxt, NULL,
                           vmce_load_vcpu_ctxt, 1, HVMSR_PER_VCPU);
 #endif
 
--- a/xen/arch/x86/emul-i8254.c
+++ b/xen/arch/x86/emul-i8254.c
@@ -458,7 +458,7 @@ static int cf_check pit_load(struct doma
     return rc;
 }
 
-HVM_REGISTER_SAVE_RESTORE(PIT, pit_save, pit_load, 1, HVMSR_PER_DOM);
+HVM_REGISTER_SAVE_RESTORE(PIT, pit_save, NULL, pit_load, 1, HVMSR_PER_DOM);
 #endif
 
 /* The intercept action for PIT DM retval: 0--not handled; 1--handled. */
--- a/xen/arch/x86/hvm/hpet.c
+++ b/xen/arch/x86/hvm/hpet.c
@@ -692,7 +692,7 @@ static int cf_check hpet_load(struct dom
     return 0;
 }
 
-HVM_REGISTER_SAVE_RESTORE(HPET, hpet_save, hpet_load, 1, HVMSR_PER_DOM);
+HVM_REGISTER_SAVE_RESTORE(HPET, hpet_save, NULL, hpet_load, 1, HVMSR_PER_DOM);
 
 static void hpet_set(HPETState *h)
 {
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -793,7 +793,7 @@ static int cf_check hvm_load_tsc_adjust(
     return 0;
 }
 
-HVM_REGISTER_SAVE_RESTORE(TSC_ADJUST, hvm_save_tsc_adjust,
+HVM_REGISTER_SAVE_RESTORE(TSC_ADJUST, hvm_save_tsc_adjust, NULL,
                           hvm_load_tsc_adjust, 1, HVMSR_PER_VCPU);
 
 static int cf_check hvm_save_cpu_ctxt(struct vcpu *v, hvm_domain_context_t *h)
@@ -1189,7 +1189,7 @@ static int cf_check hvm_load_cpu_ctxt(st
     return 0;
 }
 
-HVM_REGISTER_SAVE_RESTORE(CPU, hvm_save_cpu_ctxt, hvm_load_cpu_ctxt, 1,
+HVM_REGISTER_SAVE_RESTORE(CPU, hvm_save_cpu_ctxt, NULL, hvm_load_cpu_ctxt, 1,
                           HVMSR_PER_VCPU);
 
 #define HVM_CPU_XSAVE_SIZE(xcr0) (offsetof(struct hvm_hw_cpu_xsave, \
@@ -1538,6 +1538,7 @@ static int __init cf_check hvm_register_
     hvm_register_savevm(CPU_XSAVE_CODE,
                         "CPU_XSAVE",
                         hvm_save_cpu_xsave_states,
+                        NULL,
                         hvm_load_cpu_xsave_states,
                         HVM_CPU_XSAVE_SIZE(xfeature_mask) +
                             sizeof(struct hvm_save_descriptor),
@@ -1546,6 +1547,7 @@ static int __init cf_check hvm_register_
     hvm_register_savevm(CPU_MSR_CODE,
                         "CPU_MSR",
                         hvm_save_cpu_msrs,
+                        NULL,
                         hvm_load_cpu_msrs,
                         HVM_CPU_MSR_SIZE(ARRAY_SIZE(msrs_to_send)) +
                             sizeof(struct hvm_save_descriptor),
--- a/xen/arch/x86/hvm/irq.c
+++ b/xen/arch/x86/hvm/irq.c
@@ -784,9 +784,9 @@ static int cf_check irq_load_link(struct
     return 0;
 }
 
-HVM_REGISTER_SAVE_RESTORE(PCI_IRQ, irq_save_pci, irq_load_pci,
+HVM_REGISTER_SAVE_RESTORE(PCI_IRQ, irq_save_pci, NULL, irq_load_pci,
                           1, HVMSR_PER_DOM);
-HVM_REGISTER_SAVE_RESTORE(ISA_IRQ, irq_save_isa, irq_load_isa,
+HVM_REGISTER_SAVE_RESTORE(ISA_IRQ, irq_save_isa, NULL, irq_load_isa,
                           1, HVMSR_PER_DOM);
-HVM_REGISTER_SAVE_RESTORE(PCI_LINK, irq_save_link, irq_load_link,
+HVM_REGISTER_SAVE_RESTORE(PCI_LINK, irq_save_link, NULL, irq_load_link,
                           1, HVMSR_PER_DOM);
--- a/xen/arch/x86/hvm/mtrr.c
+++ b/xen/arch/x86/hvm/mtrr.c
@@ -773,7 +773,7 @@ static int cf_check hvm_load_mtrr_msr(st
     return 0;
 }
 
-HVM_REGISTER_SAVE_RESTORE(MTRR, hvm_save_mtrr_msr, hvm_load_mtrr_msr, 1,
+HVM_REGISTER_SAVE_RESTORE(MTRR, hvm_save_mtrr_msr, NULL, hvm_load_mtrr_msr, 1,
                           HVMSR_PER_VCPU);
 
 void memory_type_changed(struct domain *d)
--- a/xen/arch/x86/hvm/pmtimer.c
+++ b/xen/arch/x86/hvm/pmtimer.c
@@ -300,7 +300,7 @@ static int cf_check acpi_load(struct dom
     return 0;
 }
 
-HVM_REGISTER_SAVE_RESTORE(PMTIMER, acpi_save, acpi_load,
+HVM_REGISTER_SAVE_RESTORE(PMTIMER, acpi_save, NULL, acpi_load,
                           1, HVMSR_PER_DOM);
 
 int pmtimer_change_ioport(struct domain *d, uint64_t version)
--- a/xen/arch/x86/hvm/rtc.c
+++ b/xen/arch/x86/hvm/rtc.c
@@ -797,7 +797,7 @@ static int cf_check rtc_load(struct doma
     return 0;
 }
 
-HVM_REGISTER_SAVE_RESTORE(RTC, rtc_save, rtc_load, 1, HVMSR_PER_DOM);
+HVM_REGISTER_SAVE_RESTORE(RTC, rtc_save, NULL, rtc_load, 1, HVMSR_PER_DOM);
 
 void rtc_reset(struct domain *d)
 {
--- a/xen/arch/x86/hvm/save.c
+++ b/xen/arch/x86/hvm/save.c
@@ -88,6 +88,7 @@ static struct {
 void __init hvm_register_savevm(uint16_t typecode,
                                 const char *name,
                                 hvm_save_handler save_state,
+                                hvm_check_handler check_state,
                                 hvm_load_handler load_state,
                                 size_t size, int kind)
 {
@@ -96,6 +97,7 @@ void __init hvm_register_savevm(uint16_t
     ASSERT(hvm_sr_handlers[typecode].check == NULL);
     ASSERT(hvm_sr_handlers[typecode].load == NULL);
     hvm_sr_handlers[typecode].save = save_state;
+    hvm_sr_handlers[typecode].check = check_state;
     hvm_sr_handlers[typecode].load = load_state;
     hvm_sr_handlers[typecode].name = name;
     hvm_sr_handlers[typecode].size = size;
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -631,7 +631,8 @@ static int cf_check ioapic_load(struct d
     return 0;
 }
 
-HVM_REGISTER_SAVE_RESTORE(IOAPIC, ioapic_save, ioapic_load, 1, HVMSR_PER_DOM);
+HVM_REGISTER_SAVE_RESTORE(IOAPIC, ioapic_save, NULL, ioapic_load, 1,
+                          HVMSR_PER_DOM);
 
 void vioapic_reset(struct domain *d)
 {
--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -1145,7 +1145,7 @@ static int cf_check viridian_load_domain
     return 0;
 }
 
-HVM_REGISTER_SAVE_RESTORE(VIRIDIAN_DOMAIN, viridian_save_domain_ctxt,
+HVM_REGISTER_SAVE_RESTORE(VIRIDIAN_DOMAIN, viridian_save_domain_ctxt, NULL,
                           viridian_load_domain_ctxt, 1, HVMSR_PER_DOM);
 
 static int cf_check viridian_save_vcpu_ctxt(
@@ -1188,7 +1188,7 @@ static int cf_check viridian_load_vcpu_c
     return 0;
 }
 
-HVM_REGISTER_SAVE_RESTORE(VIRIDIAN_VCPU, viridian_save_vcpu_ctxt,
+HVM_REGISTER_SAVE_RESTORE(VIRIDIAN_VCPU, viridian_save_vcpu_ctxt, NULL,
                           viridian_load_vcpu_ctxt, 1, HVMSR_PER_VCPU);
 
 static int __init cf_check parse_viridian_version(const char *arg)
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -1591,9 +1591,9 @@ static int cf_check lapic_load_regs(stru
     return 0;
 }
 
-HVM_REGISTER_SAVE_RESTORE(LAPIC, lapic_save_hidden,
+HVM_REGISTER_SAVE_RESTORE(LAPIC, lapic_save_hidden, NULL,
                           lapic_load_hidden, 1, HVMSR_PER_VCPU);
-HVM_REGISTER_SAVE_RESTORE(LAPIC_REGS, lapic_save_regs,
+HVM_REGISTER_SAVE_RESTORE(LAPIC_REGS, lapic_save_regs, NULL,
                           lapic_load_regs, 1, HVMSR_PER_VCPU);
 
 int vlapic_init(struct vcpu *v)
--- a/xen/arch/x86/hvm/vpic.c
+++ b/xen/arch/x86/hvm/vpic.c
@@ -449,7 +449,7 @@ static int cf_check vpic_load(struct dom
     return 0;
 }
 
-HVM_REGISTER_SAVE_RESTORE(PIC, vpic_save, vpic_load, 2, HVMSR_PER_DOM);
+HVM_REGISTER_SAVE_RESTORE(PIC, vpic_save, NULL, vpic_load, 2, HVMSR_PER_DOM);
 
 void vpic_reset(struct domain *d)
 {
--- a/xen/arch/x86/include/asm/hvm/save.h
+++ b/xen/arch/x86/include/asm/hvm/save.h
@@ -113,6 +113,7 @@ typedef int (*hvm_load_handler) (struct
 void hvm_register_savevm(uint16_t typecode,
                          const char *name, 
                          hvm_save_handler save_state,
+                         hvm_check_handler check_state,
                          hvm_load_handler load_state,
                          size_t size, int kind);
 
@@ -122,12 +123,13 @@ void hvm_register_savevm(uint16_t typeco
 
 /* Syntactic sugar around that function: specify the max number of
  * saves, and this calculates the size of buffer needed */
-#define HVM_REGISTER_SAVE_RESTORE(_x, _save, _load, _num, _k)             \
+#define HVM_REGISTER_SAVE_RESTORE(_x, _save, check, _load, _num, _k)      \
 static int __init cf_check __hvm_register_##_x##_save_and_restore(void)   \
 {                                                                         \
     hvm_register_savevm(HVM_SAVE_CODE(_x),                                \
                         #_x,                                              \
                         &_save,                                           \
+                        check,                                            \
                         &_load,                                           \
                         (_num) * (HVM_SAVE_LENGTH(_x)                     \
                                   + sizeof (struct hvm_save_descriptor)), \


