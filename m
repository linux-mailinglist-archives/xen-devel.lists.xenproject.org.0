Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0419C7F0E1E
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 09:50:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636487.992017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4zyi-0000r5-G9; Mon, 20 Nov 2023 08:50:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636487.992017; Mon, 20 Nov 2023 08:50:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4zyi-0000o2-DT; Mon, 20 Nov 2023 08:50:00 +0000
Received: by outflank-mailman (input) for mailman id 636487;
 Mon, 20 Nov 2023 08:49:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9+lD=HB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r4zyg-0000nw-Jr
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 08:49:58 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20613.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c80461b5-8781-11ee-98df-6d05b1d4d9a1;
 Mon, 20 Nov 2023 09:49:57 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB8331.eurprd04.prod.outlook.com (2603:10a6:10:244::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.16; Mon, 20 Nov
 2023 08:49:54 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.015; Mon, 20 Nov 2023
 08:49:54 +0000
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
X-Inumbo-ID: c80461b5-8781-11ee-98df-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f1UDiLOptxlTv8y4yZYZU97fn/R4mSefuVKi7QtZJTb35FqwSSQlK1hMeHa2deFtJXgJrogHeq4BmlWGM1ybDrVj1lcHdO3wpPo8JTWdvFqJcgAupJ0iqgR+QqDgoL7CSI+g8v3uNE7IxsUVTWFkXXNg2QCGzymxwAnn33t548W49ODfgUjX3GYta48B/CVqq0uMWi6bGgu2plf53h+dOnHCcYSSF0q82Kh0pghSn0Hg3XqmvDBDPF0tx6w9OlM4HDHnBdtyxfbyv5UBMc/uqrdDwtMKSmELW3Xg+15Wc5n9Gx9GUdRWfYgxFQEyzu1H0MQ5zUjCmQmL0WxdL1p/+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nAktaf85t/vhDiCnMpZ5efGwHAWQ0kF6N8nMqu7EhE0=;
 b=N7MmYCcIKVk2qXeimcM+tYMzpLH+iIjZKhE2B6SHI/Mb6zpqEkU9YbG31EoHO/SNQgWKeBMn9wpdSgtSOVU3l3VB3bMztaxBPJszmYdzXVkFSNBK1k3GYJKh/bn5qHwjawCT6Vlq5EMbk6TEg7YO+wSQRrptOggdOnpueBhj0KpPxvJ+uG0T5mUj0W5TnEJbRrrk0sekPu+/0KSHN7ClBw4oGGS4oE1iDhYYN4AJEj5soFVkYgYPI7r3Rp3a20f10235M4p0wyW5dpNZGb7Mv+jm5RQ4e1uhsL/jI1j2CxGhpcZe959Sw4NubTUWf72JcO2bPUnTpRzAwaBPFVhw0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nAktaf85t/vhDiCnMpZ5efGwHAWQ0kF6N8nMqu7EhE0=;
 b=MNH9Eoyfqlc4kFtf5czp5A//LGz9f49uWspsi0or9hBJnkfR01LQqQwDYdy7XngmafGqddUNTEa0EmBC+48treVejyGylcYOUv4YUszOtbaMjMqvlhfy+SyEiDhfOXB0MaZR6cOFnJ+PZv/kO/78/L4w5POothHQosXIbP6N94ekS7lMz35dxavvwHrgHQhFqf+A71ChK94UAaqUwQZVTfOo1LyAW9fT3gxGyZJJgOPk0zaEaJy4c2EGUZdyscWhrBHE/D3PoBImhWj+S/MYNnI7PoOm9RqhrHTzQwX8bE3ih8K2qdxZmN2oyID39gLox03suwF0LKxAUrfZaG/OaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7e90d6dc-eefb-46d1-a35e-abce672efcf7@suse.com>
Date: Mon, 20 Nov 2023 09:49:54 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: xen 4.15.5: msr_relaxed required for MSR 0x1a2
Content-Language: en-US
To: James Dingwall <james-xen@dingwall.me.uk>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org
References: <ZVZAO/W0m/h+IPbi@dingwall.me.uk>
 <aa13be5e-d90c-4074-a16c-d3b051da754d@citrix.com>
 <ZVcv7259slJF4wBh@dingwall.me.uk>
 <2bd9028d-bd3d-435f-8788-38f3460ea188@suse.com>
 <ZVsYeB7DG/F2EdM7@dingwall.me.uk>
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
In-Reply-To: <ZVsYeB7DG/F2EdM7@dingwall.me.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB8331:EE_
X-MS-Office365-Filtering-Correlation-Id: 88894da4-c055-48d8-69e0-08dbe9a5aa85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4lk/d8lg+BrgLgdAZckPzxrp2Ch53+Z4wXaMusrQ6QaU24j7ix5NUZeLJIVNA9M5P4BkakCmuY6jxVTCiFfjaUwBMgbu9LI+EXaGv+FaGbFd9DtXHXU4vFOclmL3vo7ryjOVyRQdFFre373jibL4biRaPTTK7mJjsf0Bz2mAs72tcGiPfV9+crxMuYI8G7IBhlzq6no6q0LPSuy1NlVNTiynk479QR4ZujyHV5qobHHxbCBtNWNYYtY2ABd7yVfu7i8l2Xm1V81YRGf/J45CBF/KkIm1BLogz4xaBLfgRm+2WWOZHpmvEfkXxwD6nq6eRegPHuiv2ZEXww5EXybRW7cbaBZY3BC8yPUZ2jYAsTcxm8zITZ4C16DL2jS6JKYrBWz+9eVWCj43nCsOd/YGGof/EKDAUy6gRMJICbShTQ4TCCU683Hj57Iyxsh5K1klHwrPmgzKWx1UIamWf06An0OjW87owNJej/CZZDMvojzCkZUiRzsq9YOvTYsk5qXzJZs+oE8Va7yGrRtysukZ5wmPxk3Uf24cWo5sBDK4Yo+pTGpQyC19Ola+lTsxcrsYaWl/2F66vq9dg5KGvKJECAbRbDr6Q2y9Zc/ON+NF9RObw8CBZSQD8FsYTno76FwS4yf96AI4ts3EcUa3/Clh+g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(136003)(366004)(396003)(39860400002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(110136005)(316002)(66556008)(66476007)(66946007)(478600001)(966005)(6486002)(26005)(2616005)(83380400001)(53546011)(6512007)(36756003)(6506007)(38100700002)(86362001)(31696002)(2906002)(31686004)(5660300002)(8936002)(41300700001)(4326008)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkI4RzJEd1l2OHNudlhWOXBzdEtyS0lpVzhUOENudFUxbGw0V24xVFJtOXMv?=
 =?utf-8?B?NGdqb1Y3aExsZ1M1SW9sQ2pwZDhnQlNZall4VlNkazBYbHJEZWM4ejkxNHN0?=
 =?utf-8?B?YXAvVXlHRU02dVp4c3hLZWg5bEhsZExtY3lIZnF2UzNnSXZ6WkxhWGVRUVVR?=
 =?utf-8?B?ZHFvYk1IbkQ4dG51S2tZeExTa21wUjV4UG02ZGRET0VONm9YbExsdEFpQlNk?=
 =?utf-8?B?V1Q3Wnc2SzJDUC9taGxDRCtmcEhlZ2RRcWFKWTZka1hRdGxMdXpNRWp6Vmdj?=
 =?utf-8?B?aHR2cEIrYmt3Qm1nSGRmYlBiSDJVUTFhblhzWVhYdVRsdnZ3dHh3bFBiY1hm?=
 =?utf-8?B?QktQclZDbHZWeldiOGhWd1hqNlJqdmVtaEhFZy9CYXNJRVNrQkhoQy95OXIx?=
 =?utf-8?B?d0hXUy84TGVBYkw3UngxQ1NYZStaQ05uSWpDSW56b1hQdnE0cFZaR0N6WG9r?=
 =?utf-8?B?dW5YbWdEVnJ1dFcrTkRpVTJuWTFCcURKVkpoS1pCV3lQMldZaHBnWHBUWTl6?=
 =?utf-8?B?dmMzUEp2cXZveEdWdGZjNGMxblAvYXJMSzRKTWNwZnlLbDhRclpFUU5Dc2tF?=
 =?utf-8?B?UFh0NTE1ZVh6NXF4MWtMTXVXK2xneUJrQ0Y0WU12UG1IZThmUWk0TWVvMUpL?=
 =?utf-8?B?eWoyS1dTT1NXTXc3UnhIcG1tVmV4ZHN1Ni9tY1JPKy9aVVpLOXlxeVhEakdX?=
 =?utf-8?B?S0c2eWphSDZiOE50Uk1mZFN0UW9SQThMZXBYOXNCcWhoZ3BpNWNJTVloMHpZ?=
 =?utf-8?B?RVI2UjB2OEtvYzVYOVZqSUpaZkQ0K0RyYUZBUERxUk1haWcxRDY3SnA4RC90?=
 =?utf-8?B?bUVidlhFS254Wnh4cVhGL3hESEFFSzJkOUgybFA4R2ZmcFl3dnBkU2hVTHhE?=
 =?utf-8?B?T08xTWhld0VPSnJRQ2ZsczB5K3dOQ2Rpc0R5VGhvTWNLdnh3d2VVbEF2WC9S?=
 =?utf-8?B?MEpoT1E0TUtGVnhLZ3YzaEY0dGhDOW1LVC9WWGlBNUxiMUo3a1JDcmRtZWto?=
 =?utf-8?B?TGg3bDBIbW92SzFNZDVqUlNUQm1CNDMxeW01LzNDMkU0ZW1pTnVDYmRyVzQ5?=
 =?utf-8?B?WEpWR09UNm5UR3Bqa0xyaG02cFlUQ0JUR3gwTUg3a2twYzc4am5Ebk9GNDdE?=
 =?utf-8?B?YTFlN2FrYjZoTTNDM0xnMFpnWndWWFVwL3F6TkE5Mk41UUkyb2hwQXdxRjNa?=
 =?utf-8?B?SzNtTjFLTHpBTVJpK3kyc3EwcS9mcC9SdEU4cFM4K3pTVWlWcFNoUFpmTi83?=
 =?utf-8?B?Q2ZWS0xFMklUL21ENmlSMlF3OEtuL0ZxSzVNOEZVRGdNVVByVENNcWhQTlZq?=
 =?utf-8?B?VGdNb2hJeXhrZkV5Q2JPNWJ0c0MzQkpDSDZudFFrWHdCZzcxeFRzTTVQbHB1?=
 =?utf-8?B?T0JITnR0N1BXSHpFYkhkUFkwUGhaakgydjhLTWVDWFIxOUdLVGQ1dHp1d2px?=
 =?utf-8?B?NzVlT3F1TkNjYStFdlJDa0ptSm05UE93bUV6eC9DY3BwTHVnSEZUeGpITUdm?=
 =?utf-8?B?Nk9SeUFUT2pCbVM1TlVrVHNTRjdQZGpPZkhmbEI5RERvUWEwbnZ2SWtiZUFK?=
 =?utf-8?B?azhJT3RZcHJVN09acUFYQXpsQ3pmNUpTZXNsNkRFWUhSMSs3Y1pXMHh0WS9y?=
 =?utf-8?B?OGtiSVlWREF0dmdzTGlVeTZkUjJ6OE1TZXhZQUx0SmZUNEdYM2NJNlFOSm8r?=
 =?utf-8?B?RGtGNW5la29XTTBtSFM1WTJkUWRKNmNDNnhocTFOamc0WUJEbjNyTUhsSnE4?=
 =?utf-8?B?dStNcW9MQU5aVnBSeGcrNlU2M2hEMHZkR3U4QXA0VHlYd2ZpRHliWUlCc0V4?=
 =?utf-8?B?Q3VLWXJ0QmphbFkvYmNQUUgwUXlRZVhldjF3K0d1US9TcUtSSzF1ZVBSa0NB?=
 =?utf-8?B?clhhdXo4NUtkNVlBR0pmL3d4cjNwS05sbzNpMVdBd1hFS1h6ZDZvOWljTUJU?=
 =?utf-8?B?czFnZDNLZUk5YWZPc1NlMkIzMzhTZlBuKzA3eU5jcDZObzFGZSt5UTdDWUNy?=
 =?utf-8?B?WEtRRnFpNFZVWkFUWElLRXVVaGRoSTVBMXlPaEZiOGtOdDB6NHFnRXo2S1or?=
 =?utf-8?B?Vkc4UnBmWHZPcGlUMzd5b2lmZ0I0Rzd2U293VElqZ1dZWTdBbUhndkc1dkZC?=
 =?utf-8?Q?NlxKWiCOoMiSX+QDYMHpJrYWZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88894da4-c055-48d8-69e0-08dbe9a5aa85
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 08:49:54.5290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CYGogOo5tWYAbBJRGrKgiJQJ/3Px77gcOu9iBjY4KSwcK+xOM2lMHEO1QGaPa6HWGh7U6uzVi875Xt3S05LQtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8331

On 20.11.2023 09:27, James Dingwall wrote:
> On Fri, Nov 17, 2023 at 10:56:30AM +0100, Jan Beulich wrote:
>> On 17.11.2023 10:18, James Dingwall wrote:
>>> On Thu, Nov 16, 2023 at 04:32:47PM +0000, Andrew Cooper wrote:
>>>> On 16/11/2023 4:15 pm, James Dingwall wrote:
>>>>> Hi,
>>>>>
>>>>> Per the msr_relaxed documentation:
>>>>>
>>>>>    "If using this option is necessary to fix an issue, please report a bug."
>>>>>
>>>>> After recently upgrading an environment from Xen 4.14.5 to Xen 4.15.5 we
>>>>> started experiencing a BSOD at boot with one of our Windows guests.  We found
>>>>> that enabling `msr_relaxed = 1` in the guest configuration has resolved the
>>>>> problem.  With a debug build of Xen and `hvm_debug=2048` on the command line
>>>>> the following messages were caught as the BSOD happened:
>>>>>
>>>>> (XEN) [HVM:11.0] <vmx_msr_read_intercept> ecx=0x1a2
>>>>> (XEN) vmx.c:3298:d11v0 RDMSR 0x000001a2 unimplemented
>>>>> (XEN) d11v0 VIRIDIAN CRASH: 1e ffffffffc0000096 fffff80b8de81eb5 0 0
>>>>>
>>>>> I found that MSR 0x1a2 is MSR_TEMPERATURE_TARGET and from that this patch
>>>>> series from last month:
>>>>>
>>>>> https://patchwork.kernel.org/project/xen-devel/list/?series=796550
>>>>>
>>>>> Picking out just a small part of that fixes the problem for us. Although the
>>>>> the patch is against 4.15.5 I think it would be relevant to more recent
>>>>> releases too.
>>>>
>>>> Which version of Windows, and what hardware?
>>>>
>>>> The Viridian Crash isn't about the RDMSR itself - it's presumably
>>>> collateral damage shortly thereafter.
>>>>
>>>> Does filling in 0 for that MSR also resolve the issue?  It's model
>>>> specific and we absolutely cannot pass it through from real hardware
>>>> like that.
>>>>
>>>
>>> Hi Andrew,
>>>
>>> Thanks for your response.  The guest is running Windows 10 and the crash
>>> happens in a proprietary hardware driver.  A little bit of knowledge as
>>> they say was enough to stop the crash but I don't understand the impact
>>> of what I've actually done...
>>>
>>> To rework the patch I'd need a bit of guidance, if I understand your
>>> suggestion I set the MSR to 0 with this change in emul-priv-op.c:
>>
>> For the purpose of the experiment suggested by Andrew ...
>>
>>> diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
>>> index ed97b1d6fcc..66f5e417df6 100644
>>> --- a/xen/arch/x86/pv/emul-priv-op.c
>>> +++ b/xen/arch/x86/pv/emul-priv-op.c
>>> @@ -976,6 +976,10 @@ static int read_msr(unsigned int reg, uint64_t *val,
>>>          *val = 0;
>>>          return X86EMUL_OKAY;
>>>  
>>> +    case MSR_TEMPERATURE_TARGET:
>>> +        *val = 0;
>>> +        return X86EMUL_OKAY;
>>> +
>>>      case MSR_P6_PERFCTR(0) ... MSR_P6_PERFCTR(7):
>>>      case MSR_P6_EVNTSEL(0) ... MSR_P6_EVNTSEL(3):
>>>      case MSR_CORE_PERF_FIXED_CTR0 ... MSR_CORE_PERF_FIXED_CTR2:
>>
>> ... you wouldn't need this (affects PV domains only), and ...
>>
>>> and this in vmx.c:
>>>
>>> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
>>> index 54023a92587..bbf37b7f272 100644
>>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>>> @@ -3259,6 +3259,11 @@ static int vmx_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
>>>          if ( !nvmx_msr_read_intercept(msr, msr_content) )
>>>              goto gp_fault;
>>>          break;
>>> +
>>> +    case MSR_TEMPERATURE_TARGET:
>>> +        *msr_content = 0;
>>> +        break;
>>> +
>>>      case MSR_IA32_MISC_ENABLE:
>>>          rdmsrl(MSR_IA32_MISC_ENABLE, *msr_content);
>>>          /* Debug Trace Store is not supported. */
>>
>> ... indeed this ought to do. An eventual real patch may want to look
>> different, though.
>>
> 
> Thanks Jan, based on the information I've reduced the patch to what seems the
> minimal necessary to workaround the BSOD.  I assume simply not ending up at
> X86EMUL_EXCEPTION is the resolution regardless of what value is set.

Good. This then confirms that Andrew's expectation of this being enough was
correct. What's not really clear to me though is whether he'd also be okay
to put a (cleaned up) patch along these lines into the tree. Andrew?

Jan

