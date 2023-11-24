Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7B97F6ED2
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 09:48:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640276.998297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Rr6-0006iX-IF; Fri, 24 Nov 2023 08:48:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640276.998297; Fri, 24 Nov 2023 08:48:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Rr6-0006fC-FS; Fri, 24 Nov 2023 08:48:08 +0000
Received: by outflank-mailman (input) for mailman id 640276;
 Fri, 24 Nov 2023 08:48:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ulgz=HF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r6Rr4-0006dr-Tp
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 08:48:07 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2072.outbound.protection.outlook.com [40.107.7.72])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2efdfe39-8aa6-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 09:48:05 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7493.eurprd04.prod.outlook.com (2603:10a6:20b:293::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.13; Fri, 24 Nov
 2023 08:47:36 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.012; Fri, 24 Nov 2023
 08:47:36 +0000
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
X-Inumbo-ID: 2efdfe39-8aa6-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DGGOJq1MOUGT61xGRsLW2bwLcdp3opSy/snODBysNT3gfb20LNLk20ULJ5RjZ6Ab3+58UckEtc6K14j+sNlCR+uzFno3M/I/MIP8jBArh00fb5TxDosLkMRCa9vF56M687ZVj4LRRH5UlPPP7c4/5YsxsAFq9zLRhQHSwolLPhGuL0Y6NqLbx81EB1ZJcLp16LdDo0d4RcW3Ox0HLia/WiniOQRvVovh32hSsQXBGHcQwT4Yz8oQsbUDhda8o/UCF+cnBCjOzy9MKaU38xJRHyciusyKWRZmxE69OaZYM1mtbxaGxg3jxfjTGVr4jHF5MTT9n0yJffxQRy9Mwv060A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pRRCvdEzfHXau9NYAIbaWHLd3gmeT2DUcL+3sKARZv8=;
 b=dJTWoSX833vgeq8NxRDRGnMDY38JPGYK4EeDk3F4s/zladKLt2auVkm+deaHaCEYq2WPN7NVjKBo2/8IyvvZwDHWNzryuyuZQMznw0zDZFdUHMqz1tjm6oimFftyq+KeDNVKzMoaPSI+ZWlMGzkF3y5FlSbZC31m8ohiDWsYaf6364uNP110P9Ooi9Vm5Rx/SJYEv+gPL1vLRyPt72XZ2zeTz3fnPjI3KrFZAnJkl1kfjJmAXv5o5FWOSUaZPFpnf1g6xL+spPwoCjbNHCzR5ULXmsISfllTAyU+8f+N2DVuODL/z2xL1GzlfcMFNCsExkSn0EcaLt8r3wxZMecUpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pRRCvdEzfHXau9NYAIbaWHLd3gmeT2DUcL+3sKARZv8=;
 b=MTe2UYywcVPJsKkkPW8f5F/FEX4LfS8HX7zO5CF6lwQ2TdBGBQ21/AIU0q9SP35bx2cYEm5BmvSzLHZ3zEqXC6FzKN7BzcuAUux3+q3mnPLQMFLZ9XeH0P4lccq5U2CTEfM/3CzDW7eC+Yk3L96R3/sF/l76+FHaaOMZSSjT6tRT0lHyt41gAbVwp3vS5LiK6Wsq+RHuXlH0f0WsF8oKwvdmm75f84n5eIe1x/v3/nS9TLiMKRslGA5c24w1n2Cbg75MTMHZBnN3wdHpqk9RuQfAb/PlVpuk8/lYKUO1vULz+rqwKXG6OSh2hOZRtBfG5j/r48AJvZ2+YJtpYZPTkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6a8cfa36-82c7-49d7-952c-a35fae318369@suse.com>
Date: Fri, 24 Nov 2023 09:47:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/15] VMX: convert vmx_vmfunc
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <b63b648f-02d0-4e52-a5e5-94ffd5666a14@suse.com>
 <b2accc3a-9b54-45b4-8cec-29cad9c2d638@suse.com>
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
In-Reply-To: <b2accc3a-9b54-45b4-8cec-29cad9c2d638@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f2::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7493:EE_
X-MS-Office365-Filtering-Correlation-Id: 765b9090-1e7d-4e16-7186-08dbecca01c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ITjzT9cy0/lGRHfdPuRiqfoa/EFht8Hu9NlWgnv+yDuFT6BnC7ga1aqrB1144U2uKesirYi33QJfvzp6aB86+YtQvoM8f4VLjsvDBjMdy5vA03ax6v31lx86u6y7PS6tx9V1hecXh4H6ITUPpL9e9oa0//b+6njXsfXJXPBaT5Yo6z+oVfFOibHvtc6mMt0wKXtRzavpquj2oGF/hrHv5dJMzJo3jhuJ+2cUh+Uq1+srp0LUZ/POXzm4wT3i/VYa1BaYoNs/GfjnrOKfQNEXpAjiy6KN9FhaFLBTqTsWN2O/LI2FreNp/mZ/ZJZjFmVaJ7M2D0RjGo4OxeGYuAqI4+1gNOu5r+KbwtbgjRuz75LoR26bBVJJf32w09AHBJXiWIxsaWuBZgYdppXrjPhupJXP6/lfSQ+V2uPhdyXOsz/JyYBDMWWH+D8FnUlr0SQ1bdrNSkitzBMv27FBIq80JftiQlHm0bSMfn5Qx1VnIoRpG3HlON1b2fIS52IdNyKQqTMrDjpFB9BMzCQFb3med4CkrAddjPICvJgYj1yjHn9Dy+eHpuCWzmYwpmEg6IjsFEd2JhgtejuMjeno51j3grygi0gT09agVtS4fO0yM0L0CvxYSVyQ/OMp+7ttHNqFSnrocmQ3rqyTrNKYbL5XwQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(376002)(366004)(39860400002)(136003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(26005)(2616005)(6512007)(53546011)(316002)(6506007)(5660300002)(41300700001)(2906002)(8676002)(6486002)(478600001)(8936002)(4326008)(54906003)(66556008)(6916009)(66946007)(66476007)(31696002)(86362001)(36756003)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUUzb2JFOWh5dDVuV3BQRmNEWENHUXBoL1NDOVFpRWxjaDBYK0JRTkhZT0lW?=
 =?utf-8?B?a2FMVXdmeDFoOUhsWEFvS1ZJUHBOcFFYMElQa0hISm1vOGZvY3hxbVlyd3Rr?=
 =?utf-8?B?RlVOOEo4dE5XblFHUWhQTzc0WlRMMFV2YkdYbG1DU3B6SUJROVlUaEFLZFFk?=
 =?utf-8?B?bFBxN1d2ZWE0ejlzYTVraHBBK2Q1T04wdEQvdXZTOU9ZRU1LOWhhc1BmbTln?=
 =?utf-8?B?amFEUnFFOE95WXA0RHB6Wm5nNWZtOFRMYnZPOEUwV2dTUWxmWkJwd0hGY0hk?=
 =?utf-8?B?SEgwODQ3YUhhTDJXTGxycU1NUXp4a2hUWHEyRTN3bVBDY3BsRm5PdXc3d0dr?=
 =?utf-8?B?OHV4ekJxMmQzanhzUS9VLzdFSjdpeUp4RzJOL24xOXZ5cXVLQjF4aThKbnAw?=
 =?utf-8?B?SSsxUWc4YnRBR3M1UE1qa2tHb2kxQllrY1daNDR0ZXQ1dGdtL3ZZeWMzaXBj?=
 =?utf-8?B?OTlqWi8xczhuUzdGd0pQdkUyV1VaczRQLzJ0VThQUE1zVGh3MUpLclJPL1R0?=
 =?utf-8?B?QythbXdoUUpHbmhsdlN6ek1mZlFhT1F1blFXNTd2VmFSb3FnS3ljOWdRZERz?=
 =?utf-8?B?OSt4dHdhVGdRZzV2VGxLdTM1L01IazQzNVR4a3dVNDFuRlYzaVdlZjJ5NnpP?=
 =?utf-8?B?SUZVQkpNZktncEozQ1NuM0Npc1JsZ2xlZCtieG94NkFiMEZDNWZpWEJ5Uzhp?=
 =?utf-8?B?NSs3amZ0UHY0cEw2MkZYZVNzOHRBcVhyakpMUU9JSVdEc25NcDJxY3R2dm04?=
 =?utf-8?B?S3p6aEp3bHNtSUUyZkU4Y3J3OUZrbEpxb0d2aURUcFRDWWxXL08xUW9jQ3Vi?=
 =?utf-8?B?VHVaVGpuQTJpZ01DUEtQZEF2SldWUVV0UHQvT09PQmhXT1Q3ekpySDhwUkVj?=
 =?utf-8?B?OXJBWkRZNSs3M1RNZFVoMTZHRzdHU0lkMTh5dEZFLzBZM2ZobDhVYTNwODlG?=
 =?utf-8?B?OWk0WTRGWG5KS2xoZlJxM3JZcEZJWXdvT0U4ek5JamcyMkoxVHhReXkySkxE?=
 =?utf-8?B?a2ZnL1Q1bm1DYUQvb0cvL1ZMQTB0cE5qTCs5UWNHQThIemFDbUVCUjZCdFBC?=
 =?utf-8?B?akkrakQ4WjhZVGhsa3FwZUIydVA2OFZsbFpIZUFyUC9lSFdGVkVGalpYMS9r?=
 =?utf-8?B?VytxbXcrV1hrbGY0Z0ZKNDNsVjlWQ1RoOXcybVFxV05pRHU5OGRoeTlFdnQr?=
 =?utf-8?B?dWcxWVpvT05sSTFJaWl6R290QW5CYmdYV3ZXSFMzczNvUHFCNFh5VjkvbUor?=
 =?utf-8?B?VExpd1NhUlYxb08wclZmdFlBUDRlMkpIYklQcjJRT0I1cDMwNHpHTnZtbDZ2?=
 =?utf-8?B?eU5obXgyd2lleWFISVdGTjY2UEtpbnNrWGtESkRrSGdGd1I2TERjZStzTE5m?=
 =?utf-8?B?ZHhpOWZsZnVxdTA1MXVXMWlaMDRRSDlxNDd5Mit5NG41NGZsay9udEcrOVpV?=
 =?utf-8?B?Ky9yVVFyRlJPcERDdXJUTU9GU0NlRFE0cHU3WW9TZnNEeDg3bWpPZnNtQ3ox?=
 =?utf-8?B?ZnU1bit3dWpyRHlwaVhTZy9LeFl0NFNrWnE1TCtWMlZqRi8yL05sZk9Rd3Mr?=
 =?utf-8?B?K25Yd1o4QTlBK0RCeE1WODVKMmc2V3ljRE5oOHRvajhwUElSellXMHBYWDBp?=
 =?utf-8?B?OXRGWFN2ZnpjWHlzMVN1VGZLODRlbnluNU9ZRlcvTW5rZ2FnWXd4T0RscnZ2?=
 =?utf-8?B?Wkc3M1MwZFZMQXFKMWNIaE5oUmFWUGxrQ0lDMEJiSEdkYXdyd2p4Sm12ZHRM?=
 =?utf-8?B?d3ZIenIwV1FraVhxbVFrMmJMRkxHWkp4VFBjU1hYUkEzR2VCZ3hHTExtUXNs?=
 =?utf-8?B?Mk9hSVA4VlZQWkZFbCtGUkNubUk1NC9hKzlYbW15MUxPSHNJOFVvY0V5c2Vt?=
 =?utf-8?B?UXNjZVp4VlVrQVBCWnhyWjI0b2VzTFZZTWJpQWhiMkdTdlZaZGo2cStvSnZR?=
 =?utf-8?B?a1lZWGZSUmx2cDVpM25rREgyQUZYNjAyeHBleUNkRTdtUWgrMUJhYVdGT2Rh?=
 =?utf-8?B?QXR0bjZHaVZRUURwOThIVG9NUFZmc0xPMjVieS9ZUlErNDRXYkNoa3FHSnlu?=
 =?utf-8?B?SUxkQUsyRHN1NVJLMzJKSHZQNE5LWUZ2OEdzbnhsZWZrWnBmdGRZQktac1Bp?=
 =?utf-8?Q?pfyXcjZDs1ppSKXVIPkcmRbjl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 765b9090-1e7d-4e16-7186-08dbecca01c7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 08:47:36.1709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +t55bbkrJXEe0BbH1GovX29Xy8zSyJMMMBaoDw2oBqHzj+VJ5lIIX3nFjyJvazONv/rdRqrQmieKK/er/+uHiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7493

On 24.11.2023 09:43, Jan Beulich wrote:
> ... to a field in the capability/controls struct.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: New.

I'm sorry, this really is 15/15 ($subject also adjusted).

Jan

> --- a/xen/arch/x86/hvm/vmx/vmcs.c
> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> @@ -162,7 +162,6 @@ static int cf_check parse_ept_param_runt
>  
>  /* Dynamic (run-time adjusted) execution control flags. */
>  struct vmx_caps __ro_after_init vmx_caps;
> -static uint64_t __read_mostly vmx_vmfunc;
>  
>  static DEFINE_PER_CPU_READ_MOSTLY(paddr_t, vmxon_region);
>  static DEFINE_PER_CPU(paddr_t, current_vmcs);
> @@ -234,7 +233,6 @@ static int vmx_init_vmcs_config(bool bsp
>      u32 vmx_basic_msr_low, vmx_basic_msr_high, min, opt;
>      struct vmx_caps caps;
>      u64 _vmx_misc_cap = 0;
> -    u64 _vmx_vmfunc = 0;
>      bool mismatch = false;
>  
>      rdmsr(MSR_IA32_VMX_BASIC, vmx_basic_msr_low, vmx_basic_msr_high);
> @@ -426,14 +424,14 @@ static int vmx_init_vmcs_config(bool bsp
>      /* The IA32_VMX_VMFUNC MSR exists only when VMFUNC is available */
>      if ( caps.secondary_exec_control & SECONDARY_EXEC_ENABLE_VM_FUNCTIONS )
>      {
> -        rdmsrl(MSR_IA32_VMX_VMFUNC, _vmx_vmfunc);
> +        rdmsrl(MSR_IA32_VMX_VMFUNC, caps.vmfunc);
>  
>          /*
>           * VMFUNC leaf 0 (EPTP switching) must be supported.
>           *
>           * Or we just don't use VMFUNC.
>           */
> -        if ( !(_vmx_vmfunc & VMX_VMFUNC_EPTP_SWITCHING) )
> +        if ( !(caps.vmfunc & VMX_VMFUNC_EPTP_SWITCHING) )
>              caps.secondary_exec_control &= ~SECONDARY_EXEC_ENABLE_VM_FUNCTIONS;
>      }
>  
> @@ -456,7 +454,6 @@ static int vmx_init_vmcs_config(bool bsp
>          vmx_caps = caps;
>          vmx_caps.basic_msr = ((uint64_t)vmx_basic_msr_high << 32) |
>                               vmx_basic_msr_low;
> -        vmx_vmfunc                 = _vmx_vmfunc;
>  
>          vmx_display_features();
>  
> @@ -495,7 +492,7 @@ static int vmx_init_vmcs_config(bool bsp
>          mismatch |= cap_check("VPID Capability", vmx_caps.vpid, caps.vpid);
>          mismatch |= cap_check(
>              "VMFUNC Capability",
> -            vmx_vmfunc, _vmx_vmfunc);
> +            vmx_caps.vmfunc, caps.vmfunc);
>          if ( cpu_has_vmx_ins_outs_instr_info !=
>               !!(vmx_basic_msr_high & (VMX_BASIC_INS_OUT_INFO >> 32)) )
>          {
> @@ -2153,7 +2150,6 @@ int __init vmx_vmcs_init(void)
>           * Make sure all dependent features are off as well.
>           */
>          memset(&vmx_caps, 0, sizeof(vmx_caps));
> -        vmx_vmfunc                 = 0;
>      }
>  
>      return ret;
> --- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
> @@ -287,6 +287,7 @@ struct vmx_caps {
>      uint32_t vmentry_control;
>      uint32_t ept;
>      uint32_t vpid;
> +    uint64_t vmfunc;
>  };
>  extern struct vmx_caps vmx_caps;
>  
> 
> 


