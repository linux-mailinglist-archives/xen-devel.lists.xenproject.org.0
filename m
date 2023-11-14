Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEE77EB44C
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 17:00:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632858.987369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2vph-0006cO-Nc; Tue, 14 Nov 2023 16:00:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632858.987369; Tue, 14 Nov 2023 16:00:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2vph-0006ZT-KN; Tue, 14 Nov 2023 16:00:09 +0000
Received: by outflank-mailman (input) for mailman id 632858;
 Tue, 14 Nov 2023 16:00:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5ZB8=G3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r2vpg-0006ZN-HW
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 16:00:08 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2050.outbound.protection.outlook.com [40.107.7.50])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e18b1fc0-8306-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 17:00:07 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8555.eurprd04.prod.outlook.com (2603:10a6:20b:436::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17; Tue, 14 Nov
 2023 15:59:38 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 15:59:37 +0000
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
X-Inumbo-ID: e18b1fc0-8306-11ee-98db-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NnDVFJKLa/4br0SvfF4zQGK2IK9e4zWVWe458/PZGrfg+KGNYRfqc3XtaA38qXvMfrjKR1bUDkTxRLyHsaP++3ocL/8hxOrxYorVzA6B8Ane6FJAV/ZaupmdLBZ+WDSK5Yf5VRTefeN3wTzwWYxiUIJc/EmC0cD4l3ykMyP/9JdrbIjjjaxnPT2kXqBOboJjaEKApsYFPOSqfRSUnk2+48p8TjLhmj9XqWequP9luEGIs9PS6I3Jcw1KjSlytjN0jfkXy/JW+Kp70LZbclQ4l7M8bhtIGZYwpoh02TZH/m8+OJr2zEt+hwsajnwKmmWxO+cZer5blNF3jozQbTKp7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JSh2LkanoFnxJw6w+S1nP5flpj8T/jalNiLJWY/HvDc=;
 b=XpUc96NjzL4FxBtxaCUDQTS2RyReDPGLTBp9khfNSukv28B/s5JAGnkDvJJAzGUED2cYwmezX9EHIcWt6BwNGplqsU4rq/0cmrWVYRoenfsvhnOMxid7WjzgErWey1PbWdD8lwXYwxw6CLidAvURcMIVO/e+GVzhm5cJUz4T1wHIsz3mdmy1+e+VGJIXjb4uArWyEuImGmtT32CJvzc4d5AJ4I3hKEgw2F1f2kOMkt7kk9fw5aGNcvQRRta1P/6tr9oR2h8EU/rdDnNCH5K5h8fjRN1IRtU3FoMd7KlDS+Zmuxe7qB6rKVUXDKPnwSgt8jXdMWNwqqCl5L3EMH/smw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JSh2LkanoFnxJw6w+S1nP5flpj8T/jalNiLJWY/HvDc=;
 b=l8a+AuRHMJR4YLzLPxbMxWusYxzE4SWrUPZ+RiNgMVPpppiBzrGtpgyqD/HElZVF8R3Rn7QIhamgXZzNwgMhaxjpN+a/HdMKj0FXrf7cif4ddJqu6t8krDa1lXyjxBcxE6RhCSjHm+D8IlLJNOvgWrO6SiaNZulrZda9gGPXvk4IrkDt/noG9QcGh0sC1yr3baqRBMmP5WeIWDux7uO3ZIiZWd0mMTCDMiQUmmRpmW4BVeCAvy2pv8nXF0oj5ZnNU+tKcLb2KRUANujulEKJWY33fs/98LIHZhgi5M2FaZDlvUYvLkxQnFc2lCWMsHn5xcJ5hSfDbfAVwG7Qq6LHwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <530df892-42f4-4c2f-a8c9-23dbb6e6e2b2@suse.com>
Date: Tue, 14 Nov 2023 16:59:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Clang-format configuration discussion - pt 1
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <Michal.Orzel@amd.com>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
References: <174FCBBC-3C2F-47E9-936A-F1399DD9AFFB@arm.com>
 <930d7aa7-7573-97d2-e146-ebe68214c0aa@suse.com>
 <7235E3F4-8387-49D7-A3B6-0EA93CAE408B@arm.com>
 <30a94519-c622-6017-2cbf-35690114d49e@suse.com>
 <31A47242-54F9-42D4-B804-6D0A0392650C@arm.com>
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
In-Reply-To: <31A47242-54F9-42D4-B804-6D0A0392650C@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0201.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8555:EE_
X-MS-Office365-Filtering-Correlation-Id: 18871903-ff1f-4d5e-d5f9-08dbe52ab42a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9ZpVPI39SR7myeoGi3Aii0f4j+UDN1SXDJl7D0HkgrFpvFXIkuvRIyI/mc5LGwKKQtFkis6D023SWg+ZRMcyZ0ypLn/2pnsrpyOXbJlbkbkCCDjMtdtOkr+F6cwoRyANTzdeWWL27m6Hn8EZIG3U0JiO1Od+Xfm6YNhCjCKVJG3yu0yib3k5wAeGjqs/eN4unBR6IQM17tR5wzwjZSUH26LHjgMCW67vXZvtV0rms+lQ0seME7XZYq0HGtlfTFqopMmCET7jeYH4IggmGb3Bu8Cb264jN54CIx3Q4bdrAa34H723loFGtE5m/hIrKkbUWXz4TPbOjutE6qL1Cu0ewGfg6jvJ/PosKwTyBZgREK4m6R0oxPmfAxuyOcyx9Vurb0gOEK+u5tWX/2UnedBjYHP8m0aT5tFt8vk/I1EXw6uaeSpcfE7JB0JwKfPG7UJ8aE0Zyx/R83q+iGwcHMndlICLZojrMwsEjGeo2jh7pzwBVz9qbtmhp9hZ4muAmuO/sYi5Z7C3jeO91qp8pASFq+Ebk0n2FhgrwnUbyou47SdQR5dYA5MjVqrpoibOFHBa4MUeCA1SVPNaaYsy5bvDifpfsTJe8alG5t5wws1pBM0JmArcBa6JTErCl77jfQExechHTge/7MJw4CBV0w97/Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(346002)(376002)(39860400002)(396003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(2616005)(26005)(53546011)(7416002)(5660300002)(86362001)(2906002)(6512007)(6506007)(38100700002)(31696002)(83380400001)(41300700001)(31686004)(54906003)(36756003)(66946007)(478600001)(66476007)(6916009)(66556008)(6486002)(8676002)(4326008)(8936002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXQ5NXZUOHFzdEZsTEtSUzN2b0N5WjlWUHZxa1Fwc0c4cWlaOU5VT21PSW1k?=
 =?utf-8?B?ZTF0b2ptMUtKYVJ4U3FkRzFPT3BYSDdNdFJtM3dWbitSTk1Ma1RIQ253WWJ4?=
 =?utf-8?B?Z0U0dE5XMzBWUVUzVEI0dEFJc21wQnFwenFKUHM3TW8rcEpZbXdMdVQ5R2o1?=
 =?utf-8?B?UkIvRGtzQmVTcjhIeXdvVmk4VmtLYUNJRW5HazBoYlVEcDJkbldiamVzMWVG?=
 =?utf-8?B?VmNrTGo0ZTl4UUVjWGVmQWJ4R3hPRXhjZ3YwSmRDcU9XN3JiQVFTTDVsVVYy?=
 =?utf-8?B?VHRCWjJzcjhGbktEMGtPSWhoS0U2UVJEWktKdkFXbEtFNWJwa2VNRUZUZ1kr?=
 =?utf-8?B?YVB0eEpoMS9SL1d4eEZST1U2T3J6VGhDRzJ1VS9LT2NxWGhMMkczeEFwdDNO?=
 =?utf-8?B?em1xNkFibmZ6M3A2aWlCOUsrcGNBTjBzUEN4REVabzhYZm1XNklSZUNtY1pY?=
 =?utf-8?B?dzQ3Nzl0WFVQdkRhb3FvcUZaS05MQ3FaTW5mc0paQkhpRHhXdGd6dGdhc1lK?=
 =?utf-8?B?ZmR2WFZ0NnFVYTFoTTBjUFJ3MCtkOWdCMHM0NXlMd1NyeFZBbkN2SUFvRDVH?=
 =?utf-8?B?QVVGc3NjS0pQcU9vR3NkR0VkRnMwL3BGRlpWZ1BZS1FIdkdzY0UzRm4wcHB5?=
 =?utf-8?B?WnhyR1Q0YzcwbXR3WWlmSjY3a3dWRU1BalRrR3ZqM3k2YVQ4OEN0eUJRUFpE?=
 =?utf-8?B?VzNnUk90MEZXbTE1QlVPYmZmVHVpM0hpT0tiRVlWTzEzSitFb2RTRFF5V1N2?=
 =?utf-8?B?UE4wM2pCVnp5SXR0b1NqNkorQVRhVjc5c1AvQ0FGYnE2YTFVcDlBdzJUVnMr?=
 =?utf-8?B?NGhoSWxUdFF2TkFNWWMyb3hUdEVHbVpNY1FWNDB2YTI0UTM4YlZ1ZCtHYkdm?=
 =?utf-8?B?dll3bTlmQS9pc3lxNzdGY3JuOU1QY3c2Zkgwd3pnOTZZaUx4ZFpCWjdqRmt4?=
 =?utf-8?B?RkpRTmFra1dlQVJYVVZlSTZaNlZWbEJBYnFIWjRkbkJIeTRTdUtGYytiS3ZH?=
 =?utf-8?B?cWRIWDliMlhWeW56MmI2RFpXVjJUL1AvU1JKb1N4ZnlEMGYyZ2dncmk5QjNQ?=
 =?utf-8?B?eSttZjhKWEs0bGhkblRQbTVYcWlxMnYwb21DTm10T0Q5RnZWSU85bWhZN3RM?=
 =?utf-8?B?M0VtTWp6MTBtdytqbytDdlZKV3lNMk81M0o2ZEpQb1cwVURWYlN3ZmJJMmZC?=
 =?utf-8?B?VStiTklhTGpuaGFaaEdObWxOVnlxbVlYNjMxcmYwTHJzREtRYkpzZitoRzdk?=
 =?utf-8?B?bE9FOGt4L25WUUxRaURuVzI2QlVhTnMxcGpHdS9kT3diZEpIY0RzQjg5STBl?=
 =?utf-8?B?WXVGR1NWVkxUOVhLb0pBZlBWTTZjWU8rVVovRHZZc2t1T2x2ZktGaEVQVUEx?=
 =?utf-8?B?RnNWZDh4K29wWGVZL2tFNXE2aW40Q0RTczFPWklTQVRJcnE5VVRPWVFiSlkz?=
 =?utf-8?B?alVSdEUyU3VVb3NLam1mYWl1aEwvbk1KZjZwMnpDeWtWWFc3WW45c1NkM0ZI?=
 =?utf-8?B?OXVpVGpVbDB3cmljQlhabkZ1WnlYT29uVGxNMEIzUlVQZURqVUs5QkJRc2lP?=
 =?utf-8?B?ZVd2SGx3eXcxUjl2RDZHaGd5QTJCa2VzU0xiVlJTcmVYVnljZG1yb1BCK3ht?=
 =?utf-8?B?MnZ2SVhNNHdFWnVnNS9YUUY3RXlYenM3R0hzbXpmR3dydVdFbGN3a20vK2JP?=
 =?utf-8?B?c3lwOEpFUXA1azdBb3hkUkVVSFNNUW96U3JjRWhSelIrZHNEMzZIR281dGRy?=
 =?utf-8?B?K2xaUktlQU9KaWt1dnRBNnJTYW9pMU5zVENoajFHelRHdlpxVDczQmVzK3Zx?=
 =?utf-8?B?YWVMV2o1QUhaTzdrdDZERlEwNzJ4MG50YTkxYnNhSCtpSzJxdE9TQ2I1OGxB?=
 =?utf-8?B?Y3NQT2lwdTVZZzF2UWptYWJhdGhvNGtKaFlPZTYybTJCYlBMQnNIMnhyN1NX?=
 =?utf-8?B?eVBGSnkxRDJOb1BWUGtCWWNuc3pGU2dSQlluNEVDTngyM1NHMDRVZmd5Nklp?=
 =?utf-8?B?VUlTK3RkNlE5akNBc2ZiSlRhMEhOSjhQY2VJVE0rZzZvMVBjMVRsYjVDS2pC?=
 =?utf-8?B?T2s0SEpPanFUV01VVEx5TnpjMDhva01GYTk5emthTEc2bmxwcUN6cXhleDg1?=
 =?utf-8?Q?zN3KByAv2LWEt7ncMFxYq1eis?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18871903-ff1f-4d5e-d5f9-08dbe52ab42a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 15:59:37.8451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b8921yzQRW1owYGbpbyN1mKQd7bMLei+B2gYaKUuGy2SrABOpMy/+s/V08YCIX7ZHF9L9FnSR55HIGIYyQAbBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8555

On 14.11.2023 15:59, Luca Fancellu wrote:
> 
> 
>> On 13 Nov 2023, at 16:27, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 13.11.2023 16:20, Luca Fancellu wrote:
>>>> On 13 Nov 2023, at 11:31, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 08.11.2023 10:53, Luca Fancellu wrote:
>>>> --------------------------------------------------------------------------------------------------------------------------------------------------------------
>>>>>
>>>>> Standard: C++03
>>>>>
>>>>> ---
>>>>> From the documentation: Parse and format C++ constructs compatible with this standard.
>>>>
>>>> Since I continue to be puzzled - iirc you said this is because of lack
>>>> of availability of "C99" as a value here. What's entirely unclear to
>>>> me is: How does this matter to a tool checking coding style (which is
>>>> largely about formatting, not any lexical or syntactical aspects)?
>>>>
>>>>> This value is used also in Linux.
>>>>
>>>> Considering how different the two styles are, I don't think this is
>>>> overly relevant.
>>>
>>> Ok, maybe I understand your point, you are looking for a reason to declare this configurable instead
>>> of not specifying it at all?
>>
>> Not really, no. Here I was merely saying that with the styles being
>> sufficiently different, what Linux uses is probably not very significant
>> for our own decision.
>>
>>> If it’s that, from what I understand clang-format will use the default value if we don’t specify anything
>>> for this one, so it will take ‘Latest’. I think we should put a value for this one to fix it and don’t have
>>> surprises if that behaviour changes and seeing that also in Linux that value is fixed increased my
>>> confidence.
>>>
>>> However, if you feel that we should not specify it, I’ve done a test and not specifying it is not changing
>>> the current output. I can’t say that for a different clang-format version though or if changes happen in the
>>> future.
>>
>> It's fine to set values. All I'm saying is that at least I would prefer
>> if it was also clear what exact effect the setting of a value has,
>> especially when that does not really match the language we use in the
>> project.
> 
> Yes I agree, I think Alejandro’s reply to this configurable reflects my thoughts about it.
> 
> So if we all agree that we should set this parameter, do we all agree that it should be the
> value above?
> 
> Do you have other concerns regarding this or the other parameters in this thread?

I did raise what was occurring to me. This doesn't mean that down the
road yet something else might not pop up.

Jan

