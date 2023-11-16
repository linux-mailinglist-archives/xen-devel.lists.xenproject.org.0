Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F19CD7EE0AA
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 13:28:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634190.989503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3bTu-0002jq-26; Thu, 16 Nov 2023 12:28:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634190.989503; Thu, 16 Nov 2023 12:28:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3bTt-0002gR-VL; Thu, 16 Nov 2023 12:28:25 +0000
Received: by outflank-mailman (input) for mailman id 634190;
 Thu, 16 Nov 2023 12:28:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r3bTs-0002bS-9k
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 12:28:24 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2062c.outbound.protection.outlook.com
 [2a01:111:f400:fe13::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a206c8bd-847b-11ee-98db-6d05b1d4d9a1;
 Thu, 16 Nov 2023 13:28:23 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7410.eurprd04.prod.outlook.com (2603:10a6:20b:1d5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.19; Thu, 16 Nov
 2023 12:28:19 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 12:28:19 +0000
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
X-Inumbo-ID: a206c8bd-847b-11ee-98db-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nuqypSpZ6FHV7GYIzait06WTQg7m/7wVByEBPLMdIohIoDy8kapBc27JKT3NsmT4MeeVOwsiYNhVOOVy+DA8I2avMQQxqpJpFehD4UUZMpDeUu60zz4xK/y3/P4IG4myEkfBGKZM+sHL8worStoJXOcNJOHClXKapceHgduK+/uyitz1Gyozxyfm0/E0QBdOBvhFQu+Vuf9CiXRCQc9ZSHPxXlt3f2A8MV816ZVXZiM5ZncfzRDajV7FtNhB5EzdUc/bARVFX6VOf7jmmPE2Ya/viDXq+wTiuLbVoESIv2P6mWpE/XkCgCeiqs7M0aKWia+moeC/8lg6oT0sVhP1pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zgN52kDw0DkGVIn4DVn9x3Tl550P232Y1yAbNiPMTn0=;
 b=nN128+JnsS2XqPwXK75UhLAHBuo1FFxJBYPlkS8esLEefqq11yAQaOXkaG9uzJ+L5TW2uaENePLZj+SAX8y74S4ZRMCO3LbmqRbH2ru2CtGcddjkr/iWZN/eAUnVdzAED4K5/HpZ/b2HxZ9Gd6/nngukfRB3yQwqCMh39TyfjS9Ua7RVva44jEKCV9CsBwJNFPzQtwmOnph7xMlJxlr15YY73+o8Skq93JIoRzN4f1MNETTO73k599QO3qYDoklE7svtVXDaQbD/NjGSnPRCGPOzu+lueQ1+EQ6PsdVvK/etrTHBy+yKglSaTkYtyIQRKB67UUfYXOe8kyE6VRtqJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zgN52kDw0DkGVIn4DVn9x3Tl550P232Y1yAbNiPMTn0=;
 b=CTXv/Y8b1NECawUZPfkwQl/N62aqzLzae3dd11c+zvCUMhAPXXdM9zpDdQYO5ZtPgGP0BQT9SQsIrEwc/8VuywAOnnWxelDEgUGVZjBOjR4lQJewyVVY9LjXVW6qRs+V6FlP/dDFo07p5BLrfD1LTFmTflKa7ZPQdLNI/oEJ5lZ5UTUKTaaUF4SjMfj9jfb34pZatTyrSpEGs0Bwy2ue8jfOX+rNMprzei8/IhWGWyJj6FwtOBUNFd5cpz1LaLTgXG1X+Y/DLZprW9og8pmTdGa5rQC3PCHy/VZmEc9wljTd2nG23EAHGc3lD4uTRGjW1Ysb0iPbdSE7i29p4cSE8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1e07fdac-f692-4ee1-bae3-1fe563481156@suse.com>
Date: Thu, 16 Nov 2023 13:28:17 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/15] xen/asm-generic: introduce generic header
 percpu.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1699633310.git.oleksii.kurochko@gmail.com>
 <d0ecdf04ceea49f57a54e15cc129c165a142a5cb.1699633310.git.oleksii.kurochko@gmail.com>
 <f7fca726-f4d5-4cdf-981e-2a6fcf5085b0@suse.com>
 <45623d7e6ca4f9ed34c1818ae304cbf49d82da4a.camel@gmail.com>
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
In-Reply-To: <45623d7e6ca4f9ed34c1818ae304cbf49d82da4a.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7410:EE_
X-MS-Office365-Filtering-Correlation-Id: 717b3009-8413-49d3-ba24-08dbe69f8415
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3iY9a5DhuEhCM92lV1S2uS+B08m9wOCWpQG/qvmDQmz5ATQ2qFav7iCC+mrBnQk7XBlgIH0HWPPkReqBpW0rsqmh1uZgJMI5dk8miv47oOts6ZJHzfnlaeRIlQ52qQ+smCbrFhAJTcA5uFringJy89dj5JbJ8N1mB2WySqaB+r9N46OwmORfZK47ptDaj4DkpYiK3VjcUvwhA6io7XeqPHiWlsZEvRBLpZ7gc6E7hnOaHQYY6Q6TotbuqdgDzz/LZ8w9tvE39ev3RiAPHan2DCeXxBWFwycpyebaHxNrWohWJFkAiFoyFXNkaOHQg+XvrYHlM8iELFTEOWgwf5byeXLuNH4JCBELJuHZJ+/ZR4q60pb6QkrLb3ntP+tbvXyho30nyqrmUKKvXfwkP/sdLZbYMEzvFTAyvEM24YEpA1Ez5MpGEbu7QuGg7EmwXSj7yJCCEzcIupqjV0tAzItoOhUtJNl/nAlbabnHx3EWGNcfVgiZ57Q8GPqUE4NjDvZj6xluaRlSB5A5GOXidS4/NMp5WwoxKLHIlbMPt/rl+6qF1ddj5jHUYPA5/f0O15RiAlpngnDrHlARPFAoXJ5KoJAGae97X4nmdrhKRu/irQmbj0bbl7J54AlTnbJemVOxS3NP/Kzo3Dtj8JT3oiAF/Ofeya0a8T6NCCX6dnNpB88=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(396003)(136003)(376002)(39860400002)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(26005)(83380400001)(2616005)(53546011)(6506007)(478600001)(6486002)(6512007)(31696002)(86362001)(5660300002)(31686004)(41300700001)(4001150100001)(38100700002)(2906002)(316002)(6916009)(36756003)(66946007)(54906003)(4326008)(8936002)(66556008)(66476007)(8676002)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjlPWmIzeFMrVDFOZWc5OFllM290TUtycDJDWm9VK0o4eEFmOUNPUEdHTC94?=
 =?utf-8?B?Um1ONnJjNXQ1bFNBYnByU2U1UHA0N1dDL05jVHJ3OUVib1pERmlGK1ZmWlZ0?=
 =?utf-8?B?Z09XcEFnN1JuUklPSmZGMUEzU2VuVGp0QzJiTC9VOUppWHVWbkxUd2hSM1dY?=
 =?utf-8?B?MnFGYXF6UW0wdlNicFdmdnNTQ3krb0JhTldTYSsrVXhtd0xacTROT2FNZkdP?=
 =?utf-8?B?dXlpbVV2ZzJ4T3ZPWUlQRzRrQ0o1YTRocndUTWlBeWJqRXpwSzd2OUdTcVR0?=
 =?utf-8?B?dnd3RHlhaEo5amxrK2VKQURJbkZIbjZlR211ZlRpWjhUN3p1NFY3N3hqbXZN?=
 =?utf-8?B?WFp4TUNEdzFpdEIrNlF3a3p0aGdoZGFWcHg1aWV2THYxc1QwbTBLR0xwNExa?=
 =?utf-8?B?dkpFZGQ0b1pvRTN0TTh5TSt5VkR0V1RGNmNnTU5oUEEzL2lzWUQ4WU9Vbmhp?=
 =?utf-8?B?c3ByK3BJa3hnK0ZyOWVjSFlXeFhUcHQ1TWNiTisxejdKWU9yNFQ5Yi9xYWtU?=
 =?utf-8?B?STVTTCtYR3BTc1k2eWQzdWo4aXRRVG92NE43U00xRTJWbzl1WGM1QlZ6RTNN?=
 =?utf-8?B?dkJJa0dRME43cFpPOWFacStMdUsrZTdpWW5kL0wvMXFHMHhKSjJSSDR0dHNL?=
 =?utf-8?B?TXI2QU5HSTB2UXJPSytIQmR5NjBseE1ZY1VuS0w0a3pHVWY0aDFmK09KSk1H?=
 =?utf-8?B?TFNRdjRSODZ3WlM5R3V2TytrZFNDS05KTUtjNlZYdktmWGt0ZERuSHc2SHFh?=
 =?utf-8?B?M1Z1Z0FlSG0ybFV5OFBpd21QWUd2d2NyWWQvNzdzeXlyQ0pQTG1taUp5WTJn?=
 =?utf-8?B?MWxBREh5NWdkTlJtRC80a3BCYTJoaFZZRU93dFg2cHdTZlNKNCtiMS9rOXJn?=
 =?utf-8?B?Q09FT3FtVGZ5NU5vSXRaREhTMnNVQ1pNdTBkVTJweDI0TStsb2VhUWMxWXdK?=
 =?utf-8?B?ekpxWjhTNWxYVVZkQmdRcVY0VVhVdjFKbjBNa3N2THgrK3hqRlN0YzhzYVRj?=
 =?utf-8?B?K1d2alRKcWNEUFRpbjh3WXNrK2d5WTNxNWtSRkpCemRaRmt2STd5Tjl4Nk9N?=
 =?utf-8?B?MGhaY3gvVTBudyt1VzNUTXhCVGRPR2JoemxQbXFqQmQwaGRzMS9ySzE0YzJx?=
 =?utf-8?B?SkpDMHpWNFYrbmdTbklIR3NsbFAwWTdBb2MzWDhRQ3ZzT1hDUlVxOXAxOE5T?=
 =?utf-8?B?S0JxMVBHWElYVGZhSDVwTG5NSXJSRVZPaEtsNGhmdytyR2pMQ2FmeTExdEp5?=
 =?utf-8?B?T3o2YThTZFQ1U296T0R1ZkQ2RHBxNHFrVHhLaGRmc3llRWppYUYvRmVKUkhm?=
 =?utf-8?B?RXB0ZEl3ZDNYdHpSUWY4ZXdKVEFlK0ZYcWJpem5KVXJKM1FaYm9lNk9wbHZq?=
 =?utf-8?B?QmQxaitiVXh3VUNFY0hnTG80SmJnRTJ6VklvdkhsZWI2ZWhHemdwVXdSM0lw?=
 =?utf-8?B?ZnZZakJDQ3JYZURzSk9jcGkrQ2lOMFNjTDIwZ0Z2VGoyZE1ZVEsyOWhSYlAw?=
 =?utf-8?B?WDFJWTJmWjRHYUJTSWUxY0U4dmRwZnZzeWtEQUlMLzMxaXVSU3p3a3lYaWIy?=
 =?utf-8?B?RCtoYTBVd1ZvRHVlblkwdlFEZmNRUVRQYXlHandNWElQSzMrekUxYTRUMlhs?=
 =?utf-8?B?QmI1R3M2dkxRdVNaSEhxb1d6cS9CNnV3T3BCVU5LcHVDaWV5Uytha2xGcTIy?=
 =?utf-8?B?Z2NnRnlIejQvVTRlZVpJSlJscjgyckUwOFNWSE03M2xyQnQ3ZTU1V296RHI5?=
 =?utf-8?B?R29kMVJsMlpIZTJmSWxXbGE3UC95VGl0L28xS0dNS0xzVytwVE9jN1hXWHBQ?=
 =?utf-8?B?am9PRGVGYlZtMWl1dG1qRzJCaG1kZ3MwdVpxUjhIN3V6SlVLZFF0d21IdFVi?=
 =?utf-8?B?Q3B5bzZwUHQ2RnFmcmtxdjdUamZ2RklJNnBJWVM2Und4cFowdDR6TFpqa1dM?=
 =?utf-8?B?OVdWd3JSVXlqSHZIaDAzV29JTEl2OE5mOWp1ZDJkYXpzVERPRHo5MmQvQnFj?=
 =?utf-8?B?OHNxb1N3blluSWFHV0UzL1BlckZvTkl4MXVjS0lYdUlzdi9BSGtoSHZna0ts?=
 =?utf-8?B?ZGcrTmNjWVNoV0FCNzJYME1ENTRwNEF2L250VkZjYnR2SDZEbzZrSUhSYXR2?=
 =?utf-8?Q?12aMTzXjuZ0MfzRxnvo2UAFI3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 717b3009-8413-49d3-ba24-08dbe69f8415
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 12:28:19.4877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rdg4gxEFIuFzWU9Z14fC2xigLs58WeTYk2nUBBiooD++6G6IHqBxlflz6kCtcBxYOU//UjclKYVTqYoPtG8KCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7410

On 16.11.2023 13:04, Oleksii wrote:
> On Thu, 2023-11-16 at 08:36 +0100, Jan Beulich wrote:
>> On 10.11.2023 17:30, Oleksii Kurochko wrote:
>>> --- /dev/null
>>> +++ b/xen/include/asm-generic/percpu.h
>>> @@ -0,0 +1,35 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +#ifndef __ASM_GENERIC_PERCPU_H__
>>> +#define __ASM_GENERIC_PERCPU_H__
>>> +
>>> +#ifndef __ASSEMBLY__
>>> +
>>> +#include <xen/types.h>
>>> +
>>> +extern char __per_cpu_start[], __per_cpu_data_end[];
>>
>> Can we go one tiny step beyond what Arm presently has and make the
>> latter of the two const?
> I am not sure I think we will have compilation issue with the following
> code in Arm and x86 because of [-Werror=discarded-qualifiers]:
> 
> static void cf_check _free_percpu_area(struct rcu_head *head)
> {
>     struct free_info *info = container_of(head, struct free_info, rcu);
>     unsigned int cpu = info->cpu;
>     char *p = __per_cpu_start + __per_cpu_offset[cpu];
> 
>     free_xenheap_pages(p, PERCPU_ORDER);
>     __per_cpu_offset[cpu] = INVALID_PERCPU_AREA;
> }

There's no use of __per_cpu_data_end here; I specifically didn't ask for both
of the declarations to have const added.

> I guess cast can help.

There may not be casts casting away constness, except maybe in very delicate
situations.

Jan

