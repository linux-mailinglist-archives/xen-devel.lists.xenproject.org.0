Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7C97F457D
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 13:12:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638740.995602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5m52-0003BD-VS; Wed, 22 Nov 2023 12:11:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638740.995602; Wed, 22 Nov 2023 12:11:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5m52-000390-S2; Wed, 22 Nov 2023 12:11:44 +0000
Received: by outflank-mailman (input) for mailman id 638740;
 Wed, 22 Nov 2023 12:11:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r5m51-00038u-82
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 12:11:43 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060e.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b923f9c-8930-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 13:11:41 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8781.eurprd04.prod.outlook.com (2603:10a6:102:20c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.19; Wed, 22 Nov
 2023 12:11:38 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 12:11:38 +0000
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
X-Inumbo-ID: 4b923f9c-8930-11ee-98e1-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bGpisNx487tKRJmk1Vyy7hgjEEmWr0P1VkDz+EGGwAqhLP7Xo177Mop9euysPx6haUii8yXPyTUtIjvHboyvhHjW0FBiICipBWnk6EwffvIv3hkHlA2n1A8UmpbFT5EhA6nfa4Y0mj4uO4z1hcyjKGhFz/K/asJJI5x/RpwH34NeI3V3fTMqa2Z8XJ/H7kbiZOOBrZNZin6cFRWh+MnNWgPCTe7aJxbfY/2s6PPEqZML0hwtBhkcP0GzliFR4qkF8EdDw1pYbGjN6InwMs5DN07OneNEfBIOMwa/elCMC53KMC2z4Pfn/IKDHzhIhuo8f36H0dODLU/3xZw4LOQ1sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+lSILnCcXEp+ZMf0zSzNPRJfy1/RaAY6jXaCSke3q6w=;
 b=OQmx3aqt78MvOBw7EGtjLJ9k8JARdvqZec7W3Imgk7kpbsoU9UTix9H3RyeT60JSMnbW5cT8I2Xj0eQiFwX6QZqcskGUtYI0ej9Qmij+ivTHX4ZDhJFyGvqWWvyfm5MGRcvN408wvWHEwiIAuogVQ4mBLlphy+uQcDMyPQoqX/nlJuvknPzf/xoX1HzHAkffD4MwPQqEnHn0ASfYn+n/n8ok4YaKXaOJVyARw/5O4/nqr+vBv4eRe33X77zjk0z5x2M/1ZYKeUXtgF9le3yOTr42yYPykdaCtf543weTb3sMaSb32IxUWjnCybPepqpT0XRYNokHObbS6jd7vH0tMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+lSILnCcXEp+ZMf0zSzNPRJfy1/RaAY6jXaCSke3q6w=;
 b=yYy1GJmBmPteb8eTBse4ekaNw1LLrrd9pXL+dQSrXejCfdf174tFgacuTAqYZUNHYf7JqbjeiMO5vS9HOXWIT8H/bIBIN3KWuSvbVMyxzuX/s53gWtg1yZAOI2bWXDRvMTTrbwK/17MbGACT94H8m46XlM+36rRJsKhkjNO5mTwfdnwB3vDboC4zx75HQi3hnate7wpvDyDvmsQ1LIcXHNkJMku5v9XNO4MwhwqfQhqzXmiLrRlwGPv9a74xLmOWY87T4cudNDbvC9LPsGATEIGPYlokGlxXuYe+FPxWMGMXdYBuqfMcZYQLJModi9T08zXMYIeRxDsHpitw3/33rA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <12100118-b442-4cba-a8c3-5bfd33de0081@suse.com>
Date: Wed, 22 Nov 2023 13:11:36 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] x86/HVM: improve CET-IBT pruning of ENDBR
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <791a9f45-2bed-48f9-af6a-9fbde65bcc71@suse.com>
 <40585213-99ac-43b4-9432-03d739ec452c@suse.com> <ZV3TL7BtSxC-sv7z@macbook>
 <700ab3e1-0bd3-421b-8bc3-482ea2c84861@suse.com> <ZV3tg_FjPP3ybJFp@macbook>
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
In-Reply-To: <ZV3tg_FjPP3ybJFp@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0127.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8781:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e6c5f6a-e789-4709-7f32-08dbeb542e17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wFWTW+/1js3GoSUhCmHmX6dQZ+K0FA6bJQH28nM8xXlyguCd29rf79vZbce0Q10cRbKBhz3oPAAYzAN8WTHjI/W5OrDJkkV64DE4MA3jxlqbYS+vVQaXg3JUuT2TlZ7id/VyQvCtF9j5BWinncC9LTh28Ru14ypqEV/HsOhcUriMB82/504grO/K51eiXPJ1pqkoYe5ER0/5Nz79hVGf1qKxZoZD9+OIs5HfYatUs8CplNX4JHUD0pHrCvwjEH6e0gfRvIrAi+Xt5BslyW5X7QTw7nlt2ca0YPP9bRZTwdUKrSjxjU21IzEkvuurt1sXX9goPJ1IJJx/sALeIzVvg4XQyCi/Hp2MeiG3wCnB7Dw4G7e0oGaxIb4dNIp2TF77zfASh86ko2RBsG1y5eMueJ8NfnKvAK1kSIqM0+Ovf45tMwknOpeL5MTtAg8LzPyaRH3rhlS8r8sc4o681TirfAbTMnftd5W1Tk6Aeqs8irmi5OdPi6F+hz40BD9B9Wpjl36+jFDB/mjjyxB0fmTcBI+XHGprt/BuVbt/diIBEEaLLcyWVmCTF++lLHJmVc2zgqmD/g6bjySjUfNnw/4BbnPuy8w2oRK46Gp0kNsvFu6UYwKAdoXWH/eTdpxhW42rsFoTqDGCKMyOklB5rfvoyA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(376002)(136003)(396003)(346002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(31686004)(2616005)(26005)(6512007)(83380400001)(36756003)(86362001)(31696002)(38100700002)(5660300002)(2906002)(478600001)(53546011)(6506007)(54906003)(6916009)(8676002)(316002)(4326008)(41300700001)(66946007)(8936002)(66476007)(66556008)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWdZMXdQd2Mrbnh3Nm5TYVBHYVNBSXIxTk5UeU1vdlJVdWxPV3F3eVpuQ3cx?=
 =?utf-8?B?bDZXNkJ4ZDFoM0JIQTlya290ZWpkbHV0R244L3NYd2sySjVRWmJHUG5uOUNG?=
 =?utf-8?B?ZVpxcU1kU3NlVk43RlhpYk1FbFg4YVdpVW9YYnlnRXdZU3Z1Smsrd0x1em4z?=
 =?utf-8?B?cXNZUnFmSmdlaTdjOFVONnpKbEtQb3R6eUgvZ2x6SVVFOU1HM0R1TmxJVXB0?=
 =?utf-8?B?R1M5T1NlMmZ5anM4VDB3a3YwVFZsYnZHNlpaU2o1bWNIdmkzYU5VMysxODVw?=
 =?utf-8?B?Q21hOTRjcHIwMkt6ZUhSVEgzYXEvYWFWcDFTWFFkUHdGUDIyR3R4SStzcGVv?=
 =?utf-8?B?cHBMSndnY2RIMnFrS1BzVjRSeVlLakxDd3ZMc0Eza0VaS2hHZzlaZWd3eDRQ?=
 =?utf-8?B?WFRVc01YMHZqVGJ4aXBNajZpL1lTZXJ3SVlLbGJSdzZzNWtIa3dJbkNBaHNI?=
 =?utf-8?B?TWpZdEdBRHdpTmpITE5WMmtNR2w1UjlHQi9SazVaVVNrcFUzWHdCRVpkT09w?=
 =?utf-8?B?cXBPNVkyQzVSOTdkWDlhUCtxdS9YTmRlV1NRNmxVVE5qNzdqRXpsYnZkUzZI?=
 =?utf-8?B?SFVQQVpscG05SjRUQUlZM3dZOFFqd21Yc2VwMnkweUwrbmZuS3NOQ3pjektC?=
 =?utf-8?B?UzIzN0NKdzQ5NDBKVEU2NUExVFhpeWxzdHdzWWs3bFBIYVFvb01BYWFvZkVu?=
 =?utf-8?B?S2ZhQkRpWXRUcDQ5aTVLTU1QeE1uMFRTNTlxY1I2UjRXZVhMZnBuc0JTVEhK?=
 =?utf-8?B?cEQvTjNhQk1LTHR5NUlkQ25DWVR5cFlnN0MvMVdDUWNqejJjOFY0STBPUXNK?=
 =?utf-8?B?ZkxjMW5xaVBXS2dDMG1pTmxML2hzdTJnaHlWRGRkU0VnUmZxTTRLSTU5cEdy?=
 =?utf-8?B?aSt1U1l3UUhwQnFEOWpUT2pRWXJJRTdoaVYyUEhvQU5uVDk4NktpQmdTclQ2?=
 =?utf-8?B?b3lma3NXWHlVdUt0MlVBaVlXRTVONWVTSEx2eTEwMm45MzBIcWxQZzk0ZEtt?=
 =?utf-8?B?czJtNDdNd0h4MEhVUnRlMkRmM1JlZFYyWWJzdnh2ME1iY2lKT29UbkZTV0Fp?=
 =?utf-8?B?V2lReXBhYnB0NjlFTmp6b25NODgwKzFRb0J2YTNTVCtOS3VxY0Qwb2cvVTN1?=
 =?utf-8?B?d044QlAveXhUZ3BJcXlIQVBwTHhYa1ZqVGhvTmNiRFMya1hYVXJNZkN5c1o5?=
 =?utf-8?B?WWNLaitLb21xaWlINzd0YXZFaFhGaDA3Tm5qS0JyZENuc0k5YkI1U3R3WjZn?=
 =?utf-8?B?ZTJhQXVhTmR0UVpWS05hcGs4eUhwYlVqWHVzbzk4THRQRHNWWS8vNm9Hc1da?=
 =?utf-8?B?VzJEajZZVVR1eHpiUGJkYjN2R2dJRE5WYVZqZ1JUUS9sS3diTkg1eUJCckN2?=
 =?utf-8?B?eGg3SGYwd2x5Snl5d3llOG5HRzFEZ1c5cDhkMlZ1c1hWSGR3amFoLzgwMnUy?=
 =?utf-8?B?VHZQM3RJZmRLZHNNeEdHenFPeUtFUkRaODB5QkMxUHlGYzZ5ajFXQUFIREZi?=
 =?utf-8?B?Q1U0RTZqTnovdmNKVVUwaEhoR2tlUkRGK2pnZEoxWVoyVHhCQy94UUNHMHU4?=
 =?utf-8?B?WEFMTzlCbWc4RlJSSHduYlZMelRHWFhkZnBhVjBxZWtmUVppRG5QUFJFWDN4?=
 =?utf-8?B?aHJKK25kTWJZZ3pUNmMwS2k2cjRkcVdIMFFqTHdDRitRTFF5Z3hCbkI3ckdB?=
 =?utf-8?B?VC9pYzl2cXpMM0trYUNTR3hDL0QvVE9vZFFQZTNaRDhEVHNndWlmMmIraGVz?=
 =?utf-8?B?S2pCemxUeGh3NUpjOWZlVTVFbkJwSE5pV25lVGdwSnlYZDhqSzF0Z3EwK1hB?=
 =?utf-8?B?emYwNmVrTDFMUHoreEF1c054MFR4STdTdm9FMzFTMFVQZ2lRbGNPWXVyK3BS?=
 =?utf-8?B?MEhvdFFjM25UdnhmU2tmbWlYUnlkeVRCUm1uQXQ5dUp1bHFqK3ptSmJXTktx?=
 =?utf-8?B?TStYaTR5eDEzdDNrRlA3K1h2VmdKaVZlZ3lZRTJMUVZaeG9lYWxEcnBkaFZG?=
 =?utf-8?B?T2cwUzg5RXBUeFZtdHY4TFpKNEt6UjRybzFnSGNDWWdDU21zSHNSR25XQ0xJ?=
 =?utf-8?B?bUZ0YWQ4QzhXR1hCbENmZFEvdFlnVnVWbHNxZDVOSUU2VGRRZzdzdVp2amIr?=
 =?utf-8?Q?Gp/PEUvGnmgm83PQU020Jzz7p?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e6c5f6a-e789-4709-7f32-08dbeb542e17
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 12:11:38.7613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: msG7eUSMVroai8qrNAfKGloEHt5uXVsLJ78CBN021bF18R4P9WhJ2v62q1W1pTli9yu1u3m27xXKHwcg/jP4HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8781

On 22.11.2023 13:01, Roger Pau Monné wrote:
> On Wed, Nov 22, 2023 at 11:42:16AM +0100, Jan Beulich wrote:
>> On 22.11.2023 11:08, Roger Pau Monné wrote:
>>> On Thu, Nov 16, 2023 at 02:33:14PM +0100, Jan Beulich wrote:
>>>> --- a/xen/arch/x86/hvm/svm/svm.c
>>>> +++ b/xen/arch/x86/hvm/svm/svm.c
>>>> @@ -2587,6 +2587,19 @@ const struct hvm_function_table * __init
>>>>      return &svm_function_table;
>>>>  }
>>>>  
>>>> +void __init prune_svm(void)
>>>> +{
>>>> +    /*
>>>> +     * Now that svm_function_table was copied, populate all function pointers
>>>> +     * which may have been left at NULL, for __initdata_cf_clobber to have as
>>>> +     * much of an effect as possible.
>>>> +     */
>>>> +    if ( !IS_ENABLED(CONFIG_XEN_IBT) )
>>>
>>> Shouldn't this better use cpu_has_xen_ibt?
>>>
>>> Otherwise the clobbering done in _apply_alternatives() won't be
>>> engaged, so it's pointless to set the extra fields.
>>
>> That's better answered in the context of ...
>>
>>>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>>>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>>>> @@ -3032,6 +3032,30 @@ const struct hvm_function_table * __init
>>>>      return &vmx_function_table;
>>>>  }
>>>>  
>>>> +void __init prune_vmx(void)
>>>> +{
>>>> +    /*
>>>> +     * Now that vmx_function_table was copied, populate all function pointers
>>>> +     * which may have been left at NULL, for __initdata_cf_clobber to have as
>>>> +     * much of an effect as possible.
>>>> +     */
>>>> +    if ( !IS_ENABLED(CONFIG_XEN_IBT) )
>>>> +        return;
>>>> +
>>>> +    vmx_function_table.set_descriptor_access_exiting =
>>>> +        vmx_set_descriptor_access_exiting;
>>>> +
>>>> +    vmx_function_table.update_eoi_exit_bitmap = vmx_update_eoi_exit_bitmap;
>>>> +    vmx_function_table.process_isr            = vmx_process_isr;
>>>> +    vmx_function_table.handle_eoi             = vmx_handle_eoi;
>>>> +
>>>> +    vmx_function_table.pi_update_irte = vmx_pi_update_irte;
>>>> +
>>>> +    vmx_function_table.deliver_posted_intr = vmx_deliver_posted_intr;
>>>> +    vmx_function_table.sync_pir_to_irr     = vmx_sync_pir_to_irr;
>>>> +    vmx_function_table.test_pir            = vmx_test_pir;
>>
>> ... this: The goal of having a compile time conditional was to have the
>> compiler eliminate the code when not needed. Otherwise there's no real
>> reason to have a conditional there in the first place - we can as well
>> always install all these pointers.
> 
> Maybe do:
> 
> if ( !IS_ENABLED(CONFIG_XEN_IBT) || !cpu_has_xen_ibt )
> 
> then?

Maybe. Yet then perhaps cpu_has_xen_ibt might better include the build-time
check already?

Jan

