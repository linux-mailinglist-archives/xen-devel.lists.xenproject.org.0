Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1DD7F6E61
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 09:39:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640229.998185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6RiG-0006qL-In; Fri, 24 Nov 2023 08:39:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640229.998185; Fri, 24 Nov 2023 08:39:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6RiG-0006od-Fg; Fri, 24 Nov 2023 08:39:00 +0000
Received: by outflank-mailman (input) for mailman id 640229;
 Fri, 24 Nov 2023 08:38:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ulgz=HF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r6RiF-0006oK-4h
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 08:38:59 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20617.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8f5fcf6-8aa4-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 09:38:58 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB9438.eurprd04.prod.outlook.com (2603:10a6:102:2aa::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Fri, 24 Nov
 2023 08:38:56 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.012; Fri, 24 Nov 2023
 08:38:56 +0000
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
X-Inumbo-ID: e8f5fcf6-8aa4-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VWWTt2lN4FuWcdLEghiqx6ZLaagWN/yFPTWilip+MoqqQ2/5dsFyZLCHshvMMH/mNv+nylBS0QQng768AhMlQ9LqoykwhledQJsxlVEKH+WogVLVJjnm1cB1qkQ91PFm4b8INZBA7QcxS4jlDW48VuRDSL6tDSdkKPWOVcMbW47BRBuwdNoF6tfYS+/mETd6t0XK8V2p6nXYipTHKNCoYZk20aEEZLz//6p9wbyB5qXRudaAxsrE2m5lzX/BRgjWmxDP/65VqKj2/vDr5Upm3H1Bii0x3OjIMPk1C7iclKlXY+IebGqS4MCrieXd/NOcAx/MHpzRu5+Laf/LUbeBfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JvvpFQBeLYGJ9UIkAzWZ3Gq7BhQMOUOR1+k4804XyM4=;
 b=hT/pV/n/6APq75scMZ4L8nl+U08Jaew+vcEfofG54M/22hXuUuQ/g/lvou7bkROC739QqPkvsmY5yD0NOw4C+ipmlB6D9M7hKfcob9/6BurkKiFRghi0m9GW5+3pjPfPLhvjgvOrfz0O3ayC1DPHc2DzcqFOm6xSK3QFRrJDrZg45u5IWjH4I5YvBHSvtagfUtzMY8M9XOqSqifNY7yqp3A5YSB2FPC5krh5gj/rXiH678ho4Bwb1CPSuUZw0yN1bD/dX0BKiWkU1NiIbjAwyJyUIIZqHN9Tf+7fXxrwvcu+yxyHmPFNx6GUleDU0H/0l6BzLivVSdohu/5rR1rmww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JvvpFQBeLYGJ9UIkAzWZ3Gq7BhQMOUOR1+k4804XyM4=;
 b=Xs7baik+7y8oJVaZbnGRXCkQx/3PCy9eme+348f/d8DoPIXNvVpm48EjYAdWTpK8x9+Kbp7ZtHGn/jirwQmgyu4JTAODV5KdPudFjpoPcLlXd+tm780p4XVy9VpW7Ve2ZRoHfJos5+l63UHs41iTVl9Eh8kjffpody6Xduk5f0+79X7BmfJi2lXKVgEGy8ZHyUuD6/EKmsZulzjVcYQU6sgvZwf1U6Qh/TapngwcLrPwWXFy4eGI6X1cElmY+Vo64UMBzV9pd8XAbGGDSkX8OsNNhGuvW2Lbbosx158qShYEEYtN3OYJU9B4Ugv56i7J5mdX3fVJBPfVwHQaxHhNxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8f9c3db0-bedb-4b8d-9560-3e5526288b5f@suse.com>
Date: Fri, 24 Nov 2023 09:38:55 +0100
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 05/15] x86: amend cpu_has_xen_[ibt,shstk}
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <b63b648f-02d0-4e52-a5e5-94ffd5666a14@suse.com>
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
In-Reply-To: <b63b648f-02d0-4e52-a5e5-94ffd5666a14@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0408.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB9438:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b668637-8777-4989-a6bc-08dbecc8cbf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pdFNgzNObgfxTTrJpS2f6UEJKA+WCzVe3hC2W/Uk4D0TypSIeWMtu32/Gfj6zOXu8cu9c50L0hWRwyCtl99He5JXHnBuJhWf11a1/kMRAAxp8jUywVGe86Zq3VkrDn8eGzJYFnDQ2tBZrNl7ksrECGk3YLEoAUdP9r3bRylOG8ERXpggnj+cRyV5Q9AcmwM4UeAraA0HrC/71f8fdysTAAQlXfHw6VnkYGxQYp0JE1lcoevCSTq5ebn82kpp/CKVoHsbJrvRiIIacbU+0JEBxlELcQQrYYgLhM9sF+d2ojWWh//IdIFzJCX4c0Ic1TIjuEP7VkSXqJRC08ZnhxEflm5D22Ebv3mxS1RpWl0a6sbSB3syipA9iowoEJERESugTYHelDKB530i9lTCe6nY3vp7JKCRsSUGHy3RkFmhzEK0vYk+uI1MSiLfoBe6nR7tuOkUj5/Dm57thRqSal9GCD3lNa4g4rILxJR37rrofWZFqeTfQQEXHEoz/W0HjainLvQOgx2ui5lqe8jsY2dFkBpKexYLRX4DUBK0dq8EniSNbuiABka577vc56lcdZTnGTxsIxfAxaJ33BWXGf8BYs6lCuB8U8n+nEtW7R7xojJr2a7z7FvTD2U7QemUELHzJMpD2T2jWymIRKRNIdqoaA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(136003)(366004)(396003)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(36756003)(2616005)(6512007)(8936002)(5660300002)(4326008)(8676002)(26005)(6506007)(4744005)(66476007)(54906003)(66556008)(66946007)(316002)(6486002)(2906002)(6916009)(478600001)(31686004)(86362001)(31696002)(41300700001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVgzWXdDK0lJQ0pxN3M2UnRWYU9JMWNWNXc4dUVZSnJvVVJlY0dwdzRVR3No?=
 =?utf-8?B?clBJUzFWckVYVU9FVjQrc3ZCTmdEaXFza3cvV0lrbDBjMjdZaWJFajdSRUlO?=
 =?utf-8?B?eXZyK1RDL3BaUFI2Q1UwSmhxakExcnFLcUVYYVhReUd4cit4dDhud3BHcFhL?=
 =?utf-8?B?TWFrYS9EdlhZczhYa2VVMURFZko0allFTGIxYmIxWXArMngvL1FsNTdRQ01J?=
 =?utf-8?B?WXBsQVhVSFgxU0xWbDl1b3NaSlVTY3hIS0YvYi9Xc29rUlVPZjRMbEhVVHps?=
 =?utf-8?B?aWdVMkl2cTRlQUpZWkxiOXVyTWg4TkZlaXpSUVZ2TXJZb1JneGlGTEVYZml3?=
 =?utf-8?B?a1FPaldqSWFLSWRQS1d1RUM1QVl5aUNYelc4WFVKYjBJL05VZHYvQ05PSFR5?=
 =?utf-8?B?WlI4QklQYVVQRTA4dzl4eUMyT1UybmtlaVBVbVhpQm9MQXBIMUNPZ2FyNWRJ?=
 =?utf-8?B?Z0xKRWJYWjZHSC8zR2tEQms5Sm5tczV5MkxqMDJKTmxsZjRMRVRUaU5TS0p0?=
 =?utf-8?B?MkJuai9oUGxiZGMwVU9WRnVpQjZxV0RFa3FIR05CSUJQVlJXbEdzRFF0M25r?=
 =?utf-8?B?d3R1QTZFNXluTWxldzhxdVM2QmJHcmYyMVcySjZRSzJaNWJjSzQ1MmJjbVIy?=
 =?utf-8?B?eXYxU3NQQVFabytQNjhuTjhvNGhPMGQwWExwU1ZKd0dPWm8rNTNWZWZURGUr?=
 =?utf-8?B?c1U2cm0rQWxhcHJ6N2orQldYNkc1aVhFUWw0dWdLbUpDaitPUFRwUkFCeHZH?=
 =?utf-8?B?N3pVRGZGOFVrQk1YR3NUbGdJTmFIclNicVlETVZIQ05KV0lhUEl0cWVPbGY0?=
 =?utf-8?B?ZG05NW5IKzJ2aXFpTlNPQ0hNT2tjcnpGMlJZazVyT0FxeXQxaWpyWjVpeElB?=
 =?utf-8?B?SG5JblNGZG0yODZqU1JtUnpjRjZGdUZxcXJtY0hUY1FjVTI5TGtMa3FDczNy?=
 =?utf-8?B?b1dUVmFlRlNqMjhnWFZoc1pudURXUElzN3pCZitjRUZHcjcwbktxM0NnZEZK?=
 =?utf-8?B?ekw1bE9mSDU0QVhmZ1BlaHVXR0xXMGRJSGJaM3ZBQjc0TUd3SStDcFZFZUg0?=
 =?utf-8?B?a05NS21lbVYyR0lyLzVBblpZS1RyZ0NNSDJ2ZzFGS0ZLQndvaWFacE9BQmwy?=
 =?utf-8?B?Z0pnK0lXbmxmczFETGFkOXBQVzYyNitYMHZVd2x4NU50ZTJGd3cvU0V5RGE3?=
 =?utf-8?B?cUwwQzdyTDJpT0Mzb2FrbEZBNXNBUHdGYi9qajZOenFYL2NxV2x4SkhyR3py?=
 =?utf-8?B?N0pZOVFMckpQcUpCdE41eG5wdWYzcTRuTGNLVzVCY1NTeXlpZUVCWENOUkpj?=
 =?utf-8?B?ZU1Hc3FXdTBDS2t4UXdlQkkySlFwaXYrQzlwV1pEa0dvN01tU2pRL3JjdE9F?=
 =?utf-8?B?bXVMcEZYUHEwYzZ5RzlaR1RDL0J1aDhSaWVQQno0ZXVHWlZLUlJxSzB5NEpo?=
 =?utf-8?B?aG9VK0lLU1RsT2U0djJqcXRKc3pwYWZBZlAxNWh6bDJCUGwzbXlXd2o3akdl?=
 =?utf-8?B?QnFlVitiejdKUXplQTlYR0dlZ3lMUG1zWkxrVjJBNytRakN3UGJ0YndGb3VU?=
 =?utf-8?B?REd0K2FUT0pSMWtmZ1hCdWdXelBoLzhEdDNYTCsyTXpBTHBKV0JKM2FLMkl1?=
 =?utf-8?B?UkRrYm5uZmtCdDM3Z2owM2VuTCt1MTA2UWJxVXBJdVZhblphNW9aa2ZiT3cx?=
 =?utf-8?B?VEhCd1Q1NG1uSTdPcVRlUTZGNkZVQW5JWDlJYzY1VU1QNVVJVmJsZi9uaWhm?=
 =?utf-8?B?Vjl6ZmY2OCtaeFhyem5qWkNwbUI0c2VtcWdmcE9QWDNsR3QwTWZHSzFsaUth?=
 =?utf-8?B?UjB0MThRREZiVUE5RklxWVhJMnJ3RUZJc0E5Yk5WWkcwcE9xSG5lNGxuRFBG?=
 =?utf-8?B?aDZEbGtOOXB4c1EyQUh0dTd6VUh0QkRJK240K3hvek9IeWc3aTN5aXRLakE2?=
 =?utf-8?B?R0JtUlZuRDdmZEdHNXBGLytXM3BRQnRsZU9XSS9zNmVOTVFIL0I0YnNBbXVD?=
 =?utf-8?B?RTZYaTU1Tm4xRXp4M2ZybjZadXkrbGEyeVVQT21OU2x4eFVBeVRTak9wMWZE?=
 =?utf-8?B?a3Flc0I2MWtRU2FJMXJkR0xlcnlkSzY1bHZxK1RlQzBOUjN5aVh4YmIyeklw?=
 =?utf-8?Q?PUss/gy6nvOoHPXxQ336A2dK2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b668637-8777-4989-a6bc-08dbecc8cbf5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 08:38:56.4009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mK8CpvkA7+50gP7wnLFCMlXkd2+XC0mi1uKi5ghAseJUijFdMDa4qr1fzo8N46+MOUD06iw5Qak2gcgg3L8WEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9438

... to evaluate to false at compile-time when the respective Kconfig
control is off, thus allowing the compiler to eliminate then-dead code.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -215,8 +215,10 @@ static inline bool boot_cpu_has(unsigned
 #define cpu_has_lfence_dispatch boot_cpu_has(X86_FEATURE_LFENCE_DISPATCH)
 #define cpu_has_nscb            boot_cpu_has(X86_FEATURE_NSCB)
 #define cpu_has_xen_lbr         boot_cpu_has(X86_FEATURE_XEN_LBR)
-#define cpu_has_xen_shstk       boot_cpu_has(X86_FEATURE_XEN_SHSTK)
-#define cpu_has_xen_ibt         boot_cpu_has(X86_FEATURE_XEN_IBT)
+#define cpu_has_xen_shstk       (IS_ENABLED(CONFIG_XEN_SHSTK) && \
+                                 boot_cpu_has(X86_FEATURE_XEN_SHSTK))
+#define cpu_has_xen_ibt         (IS_ENABLED(CONFIG_XEN_IBT) && \
+                                 boot_cpu_has(X86_FEATURE_XEN_IBT))
 
 #define cpu_has_msr_tsc_aux     (cpu_has_rdtscp || cpu_has_rdpid)
 


