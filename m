Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D5E7FEFCD
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 14:14:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644685.1006063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8grr-0007GN-3d; Thu, 30 Nov 2023 13:14:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644685.1006063; Thu, 30 Nov 2023 13:14:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8grr-0007DN-0S; Thu, 30 Nov 2023 13:14:11 +0000
Received: by outflank-mailman (input) for mailman id 644685;
 Thu, 30 Nov 2023 13:14:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BG3/=HL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r8grp-0007DH-3O
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 13:14:09 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20601.outbound.protection.outlook.com
 [2a01:111:f403:2612::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57efe9bb-8f82-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 14:14:08 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VE1PR04MB7357.eurprd04.prod.outlook.com (2603:10a6:800:1ae::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23; Thu, 30 Nov
 2023 13:14:03 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.012; Thu, 30 Nov 2023
 13:14:03 +0000
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
X-Inumbo-ID: 57efe9bb-8f82-11ee-98e4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OESFh8BbptiZciBU83JR0Cz5TULbPabyL+v0RIAGTVO2dsEWM9+P/t0Ks/vPeS1EqsDDRTGReY0iTwhRYf5TEsqzJbNm7zXv4jd8oAw7NMRC10s345yIoTUlxtm5+ugkEHpR0C3W3pqKAzPFqlbkzOT72aGGe1SjV9MzvWeybKJGrwwv140hXwtFNrpQPSIVCDtnH5HBOSz0BU/4bZDkRBuxO86ULL7vdNZ3kCfWBzava8Tk0hLuALkpUDOy69NosCASJDFBMUJ+4vBWnHDrw5KAJyLOk2FUkIXhQM7976O1LUYHztZ3afn2AI5L1tZNO1ykKX5nMNdiRobWwKlmZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=foRgBi3y0Cr4pbnmS1mZTp0AFBaiFoaRWRfaDDltVoY=;
 b=m64ds1VCLAPj9c5SJv2SInhTRMN9BdHSo0YwbYM8fUhHp6p0oS6DMFfOMGo9C+3wNGSl3W7WRoodik32rhNdHA6hYZlQlMGBQcdeLI4vArp19aITIOdg+GqMcw88H0R9FTjRCeal5we5qCtbVQA9C+g3GdwWTHS97oIEIucguIIRMiJkEMC66gcgCYkn84pXw2m18LJjWewFJibSMixrb1nwGBuoWUc1E3pr7L4AS7TpPHJnVTLCXVhZ2tBa2bIJRBJxE7lYiRzcmbCa/I6y9hIRajeXSeplAFw0SVHqkUkMv139xtSMUpIOZI8dJQrpBYUaCep5ZuqbVmgpJq8qzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=foRgBi3y0Cr4pbnmS1mZTp0AFBaiFoaRWRfaDDltVoY=;
 b=kNH+mfx0EuH7hkZI7t6OQHqk3lVR2j9R8bNOALc2LT94CVTYTZ43ySrZpGE+amQlUR8TnPzl1SnkzGca9jJG3fpCkEENXtsM+3q77tAIMixo8yjrI1StXR95PcPjpU/pd+3fqbHvTF+WCfjQsQyJJelyxXuZX31LiMr7JA8eXB9jcm9r02bRzJHhF1wsbSwWW2ecQADNEJkgpHuXeL5AlxvuR3kqMjHvMDsiVN6BOjydV3wPudYsEZ4/R6myL0EuRfwO7Ozv7K/nE+UMUD7uaEH8HK1RaU0V1AecxfOWKoRPtufm+O6o1z137A7+CiRqHPEtUKCJGuOKbAuFphCX2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0ff3e706-7bc9-4502-ba4c-6e45b9a3007b@suse.com>
Date: Thu, 30 Nov 2023 14:14:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/public: fix flexible array definitions
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231130092112.18118-1-jgross@suse.com>
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
In-Reply-To: <20231130092112.18118-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0144.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VE1PR04MB7357:EE_
X-MS-Office365-Filtering-Correlation-Id: b61c5ba5-74cb-42d5-7289-08dbf1a63961
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ReITQfSYvUotQ/MVSgodNigpW4hlVB9L3Aw2XhCq11xyYGKLhLythootEsZF5USI4lu3ELctRfLQUKYcQ/k6Q6IzwkbpKy9zdUoyLDT+pLqGjkXxm2305IckkEEw2rLsW/FhkEx+AJp9hvueHl6KOd4MP6KE/V9t4YqdbHBCSUTup6wBOFbhI8Mt63J9cGz+T6LW7c/byj/tZq5Gnw7AnZuc1CpddDw2nSR9kxw+I3g/Af6yPLkBUr95qKV5AC6BoTDxjFbCKhUfjoQsUzqhPI5K5GafNWTJnUVw8YoY7Y3nkomUD6P3FBMWrkfb8+Y8Px5DSSeU9/PXx84rciTgmWyYIoHPpg9zUpUsFPFhtRu4M1HMW11enETiJ/0CEO1XWFV7v+dB22sf4rcG6RybCVbB9Tj6HWHuMTxlIuYC/5aY7Xo54ZzQFfZhCWwE6NeqiXBFF5mHmzFbX5i4MywI/EKU8QGEo1asMBxoQNkH5ktqq0VnRwCQtFUCNyRi9QHPTZy4pE1vkYWhrtqoVJPcnWtEXEXMdyzO03nKLphxKaOXnlXrfCkjHYSAvJzc+9YUxJY7STl2b4fCYO0VP2yMz8hj8ATOP03DFCXIk5XJMpLi4No2bSIxawF2eoToTjVlUeHk8M28N/uw7B81BvhyqA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(136003)(39860400002)(396003)(366004)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(41300700001)(54906003)(66946007)(37006003)(66556008)(31696002)(31686004)(66476007)(6636002)(4326008)(8676002)(38100700002)(478600001)(6486002)(2906002)(4744005)(316002)(5660300002)(8936002)(86362001)(6862004)(53546011)(6506007)(36756003)(6512007)(2616005)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHpyMXZ6dEJJSFJzb2hwczIwazFUMGVzZWZhcmhYZHhqMUlWWlN4OFB1RnNp?=
 =?utf-8?B?TzY2cEV6R2RoUTNqUnhjVjVzQ1AyOTNUUkJMOVlJeGNIelFWY3RhYUExR3Yy?=
 =?utf-8?B?NzZNOG9QNnRxZXdUcllPeGQrUlJzSHdZWEZFZUU5UkswV1dRUmYrOWgvaDd4?=
 =?utf-8?B?aFR0UFE5Z3ZGcHlYMVlGWWVHNVJGbFd1UEJ6dDJVUWRPWDUrb0ZGT0J4VjVO?=
 =?utf-8?B?NVNYQktSOXBYQ084WDhzRmZYOC9GeUs4MEZVWjJJYWNHSVNnNUpQMVM2eTZt?=
 =?utf-8?B?WE5RRDQ4UzFVaEN5cC9wbXlJelhYdll4RHlML0pTSlBIRWpHVngzWThVRDly?=
 =?utf-8?B?K0tlR01yWm0vSzNUSStZdDZETFVyRGlHekI0dWF1b05FeUF4WHpkYWhYeHFq?=
 =?utf-8?B?YWtsSmFyZHBNL0gvQVFrUGtHYlEzbVhiTGtqMEltYXUrbmF5NFU5RnhPK1hG?=
 =?utf-8?B?NitCN29vUTRHMSt1bm1TV2xkYWdjVHJRRWZjcyt6b25vYmJqWmd3YlZDaXR0?=
 =?utf-8?B?M2dSMitsTS9tWC83NVQycU9jRytJSEhXSW5wZ1JRWDdjZEhCdXRvVzZPYjQ3?=
 =?utf-8?B?TEhDbzZHK3dFZE8xWlNmblBtR2Z5U3V6MkluaHZGcGNIK0k4ZGJXNmdQL2dX?=
 =?utf-8?B?RWJPb2FmNXdLUTBPSEVydTdtbEdNY1VaS2NmVXV0UGttaUZiYkRzTTJ2a0FK?=
 =?utf-8?B?cE40a1RGUDhsL3hRaG5YbmRxK1FoZ0lKaHdaY003blExMGNBVmc3bmJTVld3?=
 =?utf-8?B?a0o1Zm93R05NVTl0aUZKWERTN0dYOWZIdVcyc2RTUUE1UTFhRU13MDNrcDN6?=
 =?utf-8?B?di9zdUpJUlh0VWwxdVNYay9VQVFDa09vYUpuanVreHE3dWkzOEpqT01wRVpH?=
 =?utf-8?B?VG9uRW1WMTZTcTJpMkM2QTcrOEhsSlFUZ2E1WmJDV1ZYaTFlTFltTHJYclhh?=
 =?utf-8?B?N2dkVVFIdjlHdHNMbzl6ZmNoUERNclc1bmVHSW1NOW9yM1lTL3JUWm1tTDVT?=
 =?utf-8?B?WVVVcTVpKzY4VkFPRVVnQ1R5cDNLLzhWY2lZNGNnWDZlVGkwYVFwcCtscDFa?=
 =?utf-8?B?TDJnY25oaVRsc05jc2dBam9UQ1NUSSt6YXlrbFN1Ly80Yk1GNGp2SUZTVDhP?=
 =?utf-8?B?UTNqd1c4ZmVzM2dZYWVYZVhmVWwwOGZFNUtNK0ZvSXdob0ZpdEliWm5ZbEo4?=
 =?utf-8?B?eUtaT1hoaFhCZXdtTVBiNEpiaEMvOUhpN0VyaklmSk5JUVN3Y3F5NC9sSU84?=
 =?utf-8?B?ZXl6UmpLcm5sbGoxWUhiKzVPUWJGZW14dEZzbGErTGd3M2NRazAvalZ2NnNk?=
 =?utf-8?B?SXcvRUtFajVDZnZXZkZKa3F4a2RMMXBxdFdhbUNlMms1TERMRXlibkd2UmI5?=
 =?utf-8?B?OEJMSmhENkFYcFU3ZFBYdVVvcGpMOWVPNDE0d0VwcmFmZEpXMVQwVkJKTFI0?=
 =?utf-8?B?UC9LTE5NeFpwK1NDYUJqNUpLT0JMSjh6T2p5Wml1OUFTL3I4TXBab3lSSXhK?=
 =?utf-8?B?ZXplUGdFdkdWNVpzTG5KRmFma2xOcklxdTRmVEcvenEvaG1JNDZxZGxpWHJl?=
 =?utf-8?B?a2ZnR0R2Ukc5SzFJZlhoSUNheW5jUVlvcDdxVWRIVS9wNmZBZWxTYkxBdG1a?=
 =?utf-8?B?bkdPTHVDQUVrWlB5S2FmSkdyL3U5TmgwS3hRbGFDUjNJMTJXM2RiczlPNTJj?=
 =?utf-8?B?WjdmQkhtcDhIek03Z3AzNUtNSkl0SW1tZXZYWTJRN0h5QmoySjRVWDV4M21t?=
 =?utf-8?B?U1ZiY1hYWDhjeThoOEtMWmJPMWNUcmphSmNsZVZNekZSbzFCZm9Zb1BFQXlu?=
 =?utf-8?B?eHBORmpPa0ZKdlRYalRPN0V2dmpnWFhSY2Z6cCtFNG82SkloUTJSOWQrY0tQ?=
 =?utf-8?B?b0pqTGwvZm1CMDJJRk8reTJhaHppLzBKS2xubFZydGprRkxLa0RZR05PU1R4?=
 =?utf-8?B?M1prTVU5ZVY5SkRoS0N2b1hFTzlxTy9LdnVkN1Z4cXIwc25nRFVQanRXU3kv?=
 =?utf-8?B?alV5b1lIL1piNURtUDFYd3VRSVVaM1FsMktjelBERGhIUUlScm1kOTRLTk9U?=
 =?utf-8?B?OVhIMlJ5U0tUWC9jTndyNXgyekdPU1FMWHd5aGkxNm9GeU9rYWkxSVJyejVz?=
 =?utf-8?Q?qwAsrLoVau/MRpoVrtQ2P9YV0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b61c5ba5-74cb-42d5-7289-08dbf1a63961
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 13:14:03.4601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mGueQkCcZKUb8LHWt5PT3Ay39wC29qxpcef6T7DaSoEKLBwHjGHcEWrbvilRC5/o5MwIhpR+N5tnxj8yxMumjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7357

On 30.11.2023 10:21, Juergen Gross wrote:
> --- a/xen/include/public/xen.h
> +++ b/xen/include/public/xen.h
> @@ -46,6 +46,12 @@ DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
>  #else
>  #define XEN_FLEX_ARRAY_DIM  1 /* variable size */
>  #endif
> +/* Some PV I/O interfaces need a compatibility variant. */
> +#if __XEN_INTERFACE_VERSION__ < 0x00041300
> +#define XENPV_FLEX_ARRAY_DIM  1 /* variable size */
> +#else
> +#define XENPV_FLEX_ARRAY_DIM  XEN_FLEX_ARRAY_DIM
> +#endif

May I suggest that this live in io/ring.h, for the lack of a better place
under io/?

Jan


