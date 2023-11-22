Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C77617F4303
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 11:00:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638609.995358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5k1X-0007YB-Vi; Wed, 22 Nov 2023 09:59:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638609.995358; Wed, 22 Nov 2023 09:59:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5k1X-0007W9-T8; Wed, 22 Nov 2023 09:59:59 +0000
Received: by outflank-mailman (input) for mailman id 638609;
 Wed, 22 Nov 2023 09:59:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r5k1W-0007W3-F6
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 09:59:58 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2057.outbound.protection.outlook.com [40.107.7.57])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e43b86bd-891d-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 10:59:57 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8999.eurprd04.prod.outlook.com (2603:10a6:10:2e2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.17; Wed, 22 Nov
 2023 09:59:27 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 09:59:27 +0000
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
X-Inumbo-ID: e43b86bd-891d-11ee-98e1-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iltpC+tILz/cSvgE//TSB/j3yZxlVfiM3WzeILENih55ARB80ekn7XN+Tz3P33N7O9Kq6bhWx/Lr4uFXJGPRrLi/ef3fOvtoqS/hyue/FmKynqB/3XLd+jIotN9jqijoIMz1PQVX8CUA+tQkHwhnUFxQM+4+did7xhJ3EZzdr6s4sPZyZ/+cEQnl6FZ4n6bqbKOC7tTyv8sOJTcObgu2G3D+kasnKe5NaiwyWPkOtVWCJp+wJ3ibG8DkPFiMCwhXM+JCcoVpj5FUPjg1UbO1J3sSRg20757PCvk00bJU/9YmB7gWsLPp/o2MbWAXn2UzPOeC/4AR9USukj2o5l5DlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d6Z/4WQCzv6H16+oNybb/zJlsDnm4vSATftKXSdUvy4=;
 b=ZZhlSg8bLvzdrnjn3LaVmteUE1WqRqvUo3w8B8gMalHxlEMxcDuDUmXFqdLD8e6znNwqk9TfFTbekN+ZdalIQ2Ni1vBe0b1qx+KY2M0XwLp6OqJ+62Gl/OS4Olt544PL1WsorNiViVNrvqRCj7iAhymJjeMHLKictoDrJQi2zYqWBSR9fpZjHMqtyUP8VTY/gsKpT3ScE990QBtbi0zLAKzPqMHLn9C1aJHBGRIVkSZl6kxKhLTR5Dt7TtpX8ii5BlgrKDYG9hur8sxzWa9O0l7ni7SiIv3cJq78dx2kjVTkT3reB+4s2Lel+ikrWitIn0gB0VBdp10R9xh8IgaQiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6Z/4WQCzv6H16+oNybb/zJlsDnm4vSATftKXSdUvy4=;
 b=nRzchTNTkh5HlqpwL2cO/tFeG7Cx7g2V5RjjpFMpv7FqNft2z/yuPPjrMGXbp1Euu/6NJJkZjzOapEHqfiSiLZ8+BSsBwfvAbzgAbgrsHM9knQO6dXT+JMCcJxJ63A4iETutG+ara9SbSGKdhzUsCIO8EouK4VyZP/fCcRi8QyDkW+l1t23x5q816XFd/A1N8Og1MwbqQssgEZiijFmyHHzyNqKnmmBLl+xyRyCaMkypd4vpa0i3/sP9Bk5sM7D6Wfj1nCcf3VAlTrhJOxQIfa0UmPxkRxrFZyjZ+1bd7n1QbSLbOSC9h8Kp8yWrIOGG1Wp6VDWmtkONAirjtKIerg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1ff6aaca-af90-4982-a8a1-a9d8c8e2934f@suse.com>
Date: Wed, 22 Nov 2023 10:59:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tools/python: add .gitignore file
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Anthony PERARD
 <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20231122083153.24101-1-jgross@suse.com>
 <20231122083153.24101-3-jgross@suse.com>
 <5471227c-40d9-4b85-b4f6-d0a41c471166@suse.com>
 <2016455e-6bbf-400a-82c9-05128487c5d4@suse.com>
 <a00b32eb-002a-4a5e-bc2e-6e9482a17520@suse.com>
 <84234983-f811-4e5a-b01a-0a68f2e73447@suse.com>
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
In-Reply-To: <84234983-f811-4e5a-b01a-0a68f2e73447@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0235.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8999:EE_
X-MS-Office365-Filtering-Correlation-Id: 63b6ab0e-12a9-436c-dca6-08dbeb41b67a
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Tx2VQGbfOsbXlVNUjlWps/W2AXnnItyTTKy/r9J2lz2NaU75mtdhplW5ho9t2gF5c3xkUjOps4iTEYNdH8OQDLsIp3j3lsxF6Oj/4NFnw1IBp76JvYNIHlFvgF5CgQLDnvIhtj50BHAPjkAsKOsy8+nWLGOFCTWVgWWW+KES2eUmNJNId7apBBEWnWPCjwbfp5bgYjucaqus0kmUl+uvROA08oF4F5HUTbnEv67Rf9z7mpZD1x/Bjo6vSgT68ILlKjdz/VamEoEy0u0i4d5xr1RngtN/qkcuNMqA23awfj2kiuc65TeUKPhdzwQ0xTuZbqYVwBrFrHZHv/qa6Fd/AunSyLCIWKox/xxfBSf6k7cqunv8aX8EBEySGJJf1ojvdbZYgXtCVmAa4CxKHdv70MbxOKNCQICMxmOwSr3t25/SwdaPYDh8yxuXD2ALf7p+G26CY+KfG7DxMKUxTMYTaXpcvU4xiaVrBpxkrXuQTcn68vEhGiTkfiSMkf6/AaKHUpwEufzG6TmiTNCkmGsujTS9WJk98p8T7qKLjns6PUB4dDyLD0VHXvZEbwf1MaDGHJJupJ0N6vfs2vkBaAGI2szVH5+2M7VQuaBSaSYnqYuRpvV4W6o2j0xiCwDRS+K0uiYeVeGxhMDVSW8rfXebGsrDcdwJ19rPHiz3TRyH8xuOdXwa+lCOxeEKhm6OMCF9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(136003)(39860400002)(376002)(366004)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(83380400001)(53546011)(6486002)(478600001)(26005)(6512007)(6506007)(37006003)(54906003)(316002)(66556008)(66476007)(66946007)(31686004)(6636002)(6862004)(2616005)(38100700002)(8936002)(8676002)(4326008)(2906002)(5660300002)(31696002)(41300700001)(86362001)(36756003)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWRYSVBDQTd2MWd1QUZxUzh3T3prNlRHVVhiUXo1b1N3a3M0L2NzSWsxdmln?=
 =?utf-8?B?VXBJTmlNM3V2MG1VMS9FN3Z1Y2IrNzh2Q2VFMUc0ZFBwSjVMYVI5aURVQlVi?=
 =?utf-8?B?L2ZuZHpaYWEwYTk5QzNtQ3prMG9tNnZBRmFhY3hpdE0vQTRBNzJocG04QWNN?=
 =?utf-8?B?dytSRTdKV3VCMjczcHUxV29scHlNUmdSL3IzdjgvdEhlaXZjb0VXWnBzNmp4?=
 =?utf-8?B?Tld6c0ptS3g4c0NBNHZ0SGcvYkUweG1oVnhIUWovM0dvSjVnWXJkeFFzMzdL?=
 =?utf-8?B?WkZoNUhGTlI3Uy9sSzlYa1hmY2tQTHBVdjJ3WUtKNkM1eWU0dWZzMEFUS1pH?=
 =?utf-8?B?TDRyTVljWFJ3T2FkSVJhN1NQV3dpdWxjcklSdC9UODhHTHk5TFJFR0JUU1Ay?=
 =?utf-8?B?ZWtWcVJKNENEWkw0UCtscnRrS3QvamhPVFJEc2VHMy91eTM0cXd4eHlSN2NN?=
 =?utf-8?B?a0xaSnhJMWI0QURwMnI4eWV6NG53V0NTWE9zeFUxVzVvNlZzOXNJOWQwejZY?=
 =?utf-8?B?TnRCS0tmU3dTQlZ2a0xDWEgwbDgzU1lpbnNlM1BjeGloa3cyVHZjcDdaNUY2?=
 =?utf-8?B?OStlZUdLVEdVNWxtWTcwRGNvNGtndUJwSTQrdHpUTzd6RUt5NXdJNU0wa0Fw?=
 =?utf-8?B?Y051enZWbGt5SGRvVmZ2VjVXQWlCcCtEUjRKbG5JUDRmb2Nqc2JpYVhxblh0?=
 =?utf-8?B?dzBncm5uYm9PZWhmQXBjNEZxRG1KT2FqcUxIazNGWU9ISUp6b1B1cnFUa1VL?=
 =?utf-8?B?bGkrbFd2NXJyckFFMWlMNEZiL3ZBMkt1SG0vS0J0RnJndjFodWJ6c21IN25n?=
 =?utf-8?B?ZUxRSnRraDV2N0RhMTkzT1N5RkUrei9VZStCNEt0NmduaVFyaUNIVVdsNVcw?=
 =?utf-8?B?U0RRaG96VFQxNUk0c210WWhaRkUwZzVOQmVxSkMrY1NQSmltaStRNk5YZ2ky?=
 =?utf-8?B?TDVGdnpCTDlWZ2lEWHBvK3dUdXdSbFpBR3lwdDU0QjZOeTZEOVFDZ3lCc2lN?=
 =?utf-8?B?OWZGb3VrRDRMVENndS9CcURDUS93d1h4U1dZUUl4VDFYbzJDZUJoSklWVWVB?=
 =?utf-8?B?NWdqbnVoaE9oU2diYzB0a3hGZ2l4NEd6Rk9NUm0zeTVRa0Jyanp5L3NTeTVG?=
 =?utf-8?B?Zy9wT3hNQnNtQ3FRMCtYSTI1T0poU21aOFVHSXZKakVycGg0ZFZlZzBQWDZn?=
 =?utf-8?B?VWFTTjVaWlEvVlBQVUZBTlZCQk5aMVFsZ0dzNlVFVkdHSTR2V1JSUVFoQ0Z1?=
 =?utf-8?B?emQvNy95b2dROE9kR3JaNVV0RDhBN20wVVA5akJNUkxXdmE1UnBvaWJzSmZQ?=
 =?utf-8?B?SXVLa2tKNVRiQXlwdzA3aWpuVjNCK3lRV1NlWnhGQUlrWlMxZjdmbmhuRG5i?=
 =?utf-8?B?dmdOWEhyNVlrelI3RDlZYVNqdElBNVgzbzF3clZQR0U5allZeEVZN2MyM3dv?=
 =?utf-8?B?T2UxMkhvWkxTUHh6Y1plY2xyb3ArSTh0QVlRcDY1cUlWaEcrb0FoL0ZUZk5o?=
 =?utf-8?B?TzRwTVBYczk3L3BFYmVraEVzSit1RCtTK0JIdzkxKzV3U0MxM0NOa3pqK1Js?=
 =?utf-8?B?S0VZK1hvUmNLMGRNdHJaMkNaajgxdldpUExjcGJUT0t4K2t0Y0lnUzNDY2JH?=
 =?utf-8?B?SzlmdzhkYWtsMXNPeDU1QWc2WXpQNURZZE90ei9yMXRGZk94VmtmM3ByMW9D?=
 =?utf-8?B?a0t1eEczTTl6ZFlIa2xXWTlVOS9TN3Bva1hQd3hYVitSVThyZmcvZjB0LzFm?=
 =?utf-8?B?TUZINWk0QjhKbDY0cDQ2ZmRQTzhuYlNmczJjdDNVZHZld3JGRVdBQ2NndEJC?=
 =?utf-8?B?c2ZJRFpMT0o5ZzJTTG52WEsyNjBMUCtOZEZSYjBpLzN2N2tTSDZQME0rRHJu?=
 =?utf-8?B?SWdIS21MS3RsRGZLektVeUYzUXgzdi9qdWlYMzF5QnJnc2l4RHNZNTVsVE5T?=
 =?utf-8?B?ZjVTdVNRd28yWWFRWFJGUHpFdDllT0Z4alpsMnRZUkpCbnBsdGtNUUQyU2kr?=
 =?utf-8?B?bU5lMFIvWk1LMWdyOTQ0T2d5OW1pSmVPUndjQ2pkVjNwSnp6Q09QeXp5V05w?=
 =?utf-8?B?ajZETXJwdWc4b3QwMUNiSjhsd3UwY2pEaHNjV0NPOWlYaFhZTFNPQVA0cE5K?=
 =?utf-8?Q?D5wtD2QS1XUV8JBGLuN8dxt5l?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63b6ab0e-12a9-436c-dca6-08dbeb41b67a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 09:59:27.0945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JRlLhRliXM21SInEX/yYddLIJKvA4OeTWNJQUSdTw+Bfg/mlEb3SVPlMXmJ0dKM99KAws3/xkGa3ZQdjWIA13Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8999

On 22.11.2023 10:53, Juergen Gross wrote:
> On 22.11.23 10:21, Jan Beulich wrote:
>> On 22.11.2023 09:57, Juergen Gross wrote:
>>> On 22.11.23 09:39, Jan Beulich wrote:
>>>> On 22.11.2023 09:31, Juergen Gross wrote:
>>>>> --- /dev/null
>>>>> +++ b/tools/python/.gitignore
>>>>> @@ -0,0 +1,4 @@
>>>>> +build/*
>>>>
>>>> Are this and just build/ actually equivalent? Looking at our top-level
>>>> .gitignore, I see e.g. extras/ and install/*, which I would expect want
>>>> both treating the same? The form with a wildcard, to me at least,
>>>> doesn't obviously include the directory itself ...
>>>
>>> The .gitignore specification [1] suggests that we should use build/ (same for
>>> the new entry), as otherwise entries in subdirectories would not match.
>>
>> The description there of what a trailing slash means isn't really clear.
> 
> "If there is a separator at the end of the pattern then the pattern will only
> match directories, otherwise the pattern can match both files and directories."
> 
> "The pattern foo/ will match a directory foo and paths underneath it, but will 
> not match a regular file or a symbolic link foo"

But this is all about entries named "foo". Nothing is said about whether
foo/ also includes foo/bar.c.

>> Nothing is said about anything underneath the specified directory. Also
>> nothing is said about what a trailing /* means towards the named directory.
> 
> "The pattern foo/*, matches foo/test.json (a regular file), foo/bar (a 
> directory), but it does not match foo/bar/hello.c (a regular file), as the 
> asterisk in the pattern does not match bar/hello.c which has a slash in it."

Similarly here - nothing is said about foo itself. Yet from us successfully
using foo/* entries I derive that they actually cover foo as well, no matter
whether that's actually sensible.

Jan

