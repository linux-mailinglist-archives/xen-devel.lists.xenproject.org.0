Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1417F5BC3
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 10:57:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639495.996933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r66SD-0005as-Rw; Thu, 23 Nov 2023 09:57:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639495.996933; Thu, 23 Nov 2023 09:57:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r66SD-0005XX-Oa; Thu, 23 Nov 2023 09:57:01 +0000
Received: by outflank-mailman (input) for mailman id 639495;
 Thu, 23 Nov 2023 09:57:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=licP=HE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r66SC-0005XR-60
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 09:57:00 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0626.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a404b902-89e6-11ee-9b0e-b553b5be7939;
 Thu, 23 Nov 2023 10:56:58 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS1PR04MB9454.eurprd04.prod.outlook.com (2603:10a6:20b:4d9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.12; Thu, 23 Nov
 2023 09:56:55 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.012; Thu, 23 Nov 2023
 09:56:54 +0000
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
X-Inumbo-ID: a404b902-89e6-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B4aAzd5Z8sCb+mtApqIC2C08/+CKYSjBlcXp1Hgf8yyJOa+0Z57rvE/xvqzdHrort8/cUd1ceBtK0YnljZ6aKOjJq17eSqmuk/Me5I2X6QaMhctauWlauO7kXIOowLvVqseUFISwkqwx2utZGxGwrQmHckkFaFt0s9bWbzTOJnD+tczNL1Ge7NOXRuuQn5FzH9MXqvcNAlUgH04/Lbmabf1g+PbkqFBo02O1/mEKKfcKZ/Cs8h68gSRQJ5SxUaIwtPiG6HT2e3B97BDS3/u6NNbOfFNa94pPIF0cc0g7KbaaB65Jk6BYn3T0yzuwYGqoun1QOV5Keq8YqQ9aUn4P1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gfu/VNEnKZ3qqlnw+ieUfhWmAl1pdDagFz4gbB063eY=;
 b=EfKoRC1L2+EX0w2bfLkucR9Okk/xQ9pVkekh7UCrNM6TXCBdCgqlk6NarXLRVDfg+xeyVyNToErl3F9U/md2TGEj69XjJNhDDtra/wWt22tTGLBb3UBLUzV9ovwAfX5yiq7fS/IAMG/9ELQ3JS5fdr88Do2ClJJIkxIJYq6SO+9ydFBVNN+TyuvLyh4aYsPcpWzWsS5ruD4GY6VHA/BxdA4ndZLZwlNib7CNzlhJjCoNh/ljyN/Jw0xhVQXTmWA7SzC3CK+kTsszaKC/afRpq8xwVL+kaogkfkvdFs5Zl7APB5r0WIoeH/hLeC7/dZsNpPsaAmAV9OBDyrdlfEHB9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gfu/VNEnKZ3qqlnw+ieUfhWmAl1pdDagFz4gbB063eY=;
 b=ooDrg+HEZLzuVnKUzKgEljyZ1Twdc3e9QCR7i+zTVHZsEFKxQHXuZRDSs/r2w/xTzeX4GBoBwlvC086IedRVu6dduiB9RkzAXRyOaUtHpZEA7ttul9Z9xiYrtQmy0xSQ5jEmITktYKH/Rc+JuJ1Z4xDHFILRY88QmQJwaFPIGkri1AnjwzCB2curK6//2LU36ux0NaK+c7jcVlL9U19p8VvDYTYGpT4hFObHFiZbhifNpvqev5tyxfiEDSzRklcyrg1G05g5+shZmN35XoYpJac17ExRtvWJhqGpGkWdKO1xP1dLu/4zPiWHQ+ZScs71GOcO9Zb7ugtQz1M1a5lvZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dda4acfb-65e6-4848-bacf-8974ee98e028@suse.com>
Date: Thu, 23 Nov 2023 10:56:53 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86emul/test: fold AVX512VL scatter/gather test blobs
 with AVX512F ones
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <002261fe-99f4-5aa4-3984-1fd7d4d250ff@suse.com>
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
In-Reply-To: <002261fe-99f4-5aa4-3984-1fd7d4d250ff@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS1PR04MB9454:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c4c963b-cbe5-4ac7-7dc2-08dbec0a8616
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	elZcwU9LgUprGGZDuziGMpygxJAp+rrkXiXA5lOIPxEsq2HjRTAPmXDvNufB55X7fzHAUlPx7E/MsdBIdDAd54YJllzrKaJzTXLRj/y/+45R10kiVhgQaCzRg1gConyaSJ4NpgtI5Yn1HpvgW/wA+BXCqY2kqna6JFP5TQs53Lg3FuruavVju+/WDCpLGUJ6O7t3wGDuGEo63kW7j3PCxVeMDwrIGkDEIrgJ4yzSgfv7FBfuZZXhSl4FshGwcZM8noEZjJh6Py0UEeoLxpGQuYMhIeTu3TdfzusQNczdcgTnAxkW2ZjTK75VwwNUwy2h0WUN7gkBiV/NE+SFiJ2GCHacKG4BuMSYZcHV/eVx7VPNLxaKG3/d2Lt0OljAcARuUpP6Z5+lZzCwFojJMQXJ8C5xN/EfCZVWWBccnXB30sRPuOA7UU7fel4A7ZN0IfWq6SzAm0mZmP+TByGqt3aEcgbcmrvoYAxtYh3itWU8gj/Ynie5cHCrsHYtJKRpJ6T2ZD5yl/uC3ALHehn9kcDLugdJ7ifj5wdKoUeU+PY4cJBb/IpFQR0t7deZIWrXnOqKhNQoN0hbmykh/YZSI6glsVLAxc9NKrh9tbQzLb0PTdNBCidheOoCKG1La3BF3TnBr1uCH9yNXpTd6VY9LZoNRA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(136003)(346002)(396003)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(2906002)(86362001)(31696002)(478600001)(6506007)(2616005)(6512007)(53546011)(66556008)(8676002)(66476007)(316002)(54906003)(66946007)(4326008)(8936002)(26005)(36756003)(6486002)(110136005)(38100700002)(5660300002)(41300700001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1M5eER0Sk9Jckg4dWRrRVF5MlVabjZyT3VSQ2VqZFhMcUx0Uk9jbHo3UEdB?=
 =?utf-8?B?eDJIRDd5ZSt4TFBmQW1tdDVZc3hDU3N2dFFaQUJuODRpbnZGTEJLcVdFL05E?=
 =?utf-8?B?MTZwV0NqR1YveWhEL3hwaU1zeGVnYkJwL0JEQ0paZGxOR0d4Wmhqc3hNVnpG?=
 =?utf-8?B?cXdFWDlYRFUzOHJJQXQxT1BrWXRBeW5vK0Y5VWhmbnVUbjh5UzBJNXFZdDcw?=
 =?utf-8?B?QWQzbCszTVhjMTdlUE5YcW5LcHJVUDcvZmxiYVhkUjBBYTRnSGJJMUdxR2kv?=
 =?utf-8?B?cXB6eTJwR2M0cUN0OEV5ZlJPeUswclc5dE8xOEdxSVY2RnYyTzBEWHdOcEM0?=
 =?utf-8?B?UVcrL2hVVHB2Z0VBRDV2K1BSZ3hoMmhmcUhQQzkrYzhrUExvMHBpMUl5QXZ1?=
 =?utf-8?B?S2RPVStWWWI0MDBQbURuak1waXhNb0t3R2Jjc25veGluZW8vWjZSUW1mYTF6?=
 =?utf-8?B?L0lhZUVSSTdHVlBYWUFpdGFiRUhxVTh6eXd1M0g1TWZwRCt6QS9RQ25OdURC?=
 =?utf-8?B?aHRER296REFHUm1ydUlZTmZGNnVyMUtaNVRzQ1E2Q09FZW5nekpyRllBc1lV?=
 =?utf-8?B?UmZRcXZoZkRuamN6WTVZWndCRXE1MHZ2UHZqNnhzM0RpUHJmZHVkK3lLQXM0?=
 =?utf-8?B?eFBvQmduRzU4SmE3ZXFkR3pOYmhhMU9Nc0hDd1V3K2g2Z0VGSURNZ2ttV2R0?=
 =?utf-8?B?M1NwVFQ5Z0RKN21kdzJzOEhuek85TlJRSkJ4MUpGZzUwbEJzek5TME1GMlV2?=
 =?utf-8?B?aU1Rd1lRMkcvQ2ZudTBldW5wTjZrRkp6YVNQNHp5QW45ZkYyQUVWd2ViM2ho?=
 =?utf-8?B?ckFmUFE0ODBuTjVuQ2RadFZEUVk1dFphRkxNakRWa29lL0JGUGZtK0NEVXl3?=
 =?utf-8?B?RDYveUVlWFdNT1Q4VHowSlBLb3FFZXE2SmhVR0tVbFBYS1ZjbkZ1bnUyMmtm?=
 =?utf-8?B?VS9RMlFvcDhYdW5GTzQrZnFENjFoNHBlNHoyVFpWd3hFK01xS0NrcTM5RUxw?=
 =?utf-8?B?VEo5QUp4VXA0QndJMW9jdkVjRmVXc2Z4T25iS3d5aEhoZjVBc2VlRkpuVUdO?=
 =?utf-8?B?NUtSeHFMRXVSOEs5TE05Z2hvaE1JRlNaNThGYmNnVnlwQVNicWJvMWFaVmcy?=
 =?utf-8?B?azJiS2xUbzgwVk92MENhSjNhQjhnNEVnNjZocGNnb3krMElTNTU5YmVKUTVK?=
 =?utf-8?B?VU1WUHl6ZXFxU2RtOW1rUXMrVkE2M2x5TnBDQ2pCSGFGWEUyeTQ5Z0krdGQ5?=
 =?utf-8?B?WFdJVkJsWGdIQjIwcGxmcXZURUs0ZGVYN2YvbEs4TnVYSEQ0Tkc4YlRtWVhq?=
 =?utf-8?B?Q2pXV0lLZjBoSzMrSGt5bWc3RW1BSHoyTFo2ZXVwbTg0VFg1cS80VWcwME1G?=
 =?utf-8?B?cjh2elVUMVQ5RmM5ajc5bE5pV1VNMTZCRVRIUmZydW10T1ZiamtkbDhDSnJo?=
 =?utf-8?B?WUtYdTBlZk5lTklWTHNEajlUclQwcHl4bzRaNXdqMzllODREazJSeHBXc0R2?=
 =?utf-8?B?SVMwUzBoT2J4UERmOWgvS0RsNENSM1pjUHU4WjdrOFFHbkF4S1JncncvQk5t?=
 =?utf-8?B?cWtGd2xvSWsyMXNRVUQ3NXcvUnZDS29JUW9uR0VtWTFWRTU2ME9SZ29Hdmw1?=
 =?utf-8?B?VEliQmlJLzJGdnlxbUpvem9wOVM5VW1GeUhwSDFPUVdXWE9KbFBsc1U5UEZp?=
 =?utf-8?B?T2JqZTVGbm1XQXNMUm52aTdkSy9xcHMyVmozMmp2dDF4ZUdQazJkYUY1Q0t1?=
 =?utf-8?B?Yk9MQnVWTE1mNnRHeUp3alovTnozbU5YK05tb1NycTBwRWVYdytFK3hCVG1J?=
 =?utf-8?B?cE4yNGtpOUc3cEJzWmFZajd0M3RxRGhuVzRDNzJ0dlB1UjVLOEEyVVA2TUda?=
 =?utf-8?B?aCtQdDhFSXBlUExWN2p6Y20zcGhnTjJ3cGZ1WDl1L2ZxRkZIMnQxeERqWUtv?=
 =?utf-8?B?TGpldEwyMk1hNkZXR0x3eUErcGY2Z2dpcmpUcUgzcmFzQ1VnM0lYYnR3b0Jw?=
 =?utf-8?B?QUtXd01kZHlHWlU2TktLSDUySllYSmVBZ0JDL1RzclpuK1lsR1BnMGJ4dm9C?=
 =?utf-8?B?MVBtcW1ZeDlGbTU5ZCt1OVgxdnZ4ZVY0YUQ4eUtPNFlhL3MrY2kvT2lPd25k?=
 =?utf-8?Q?EtkPAWjbK9JLXNxmRs32kh+as?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c4c963b-cbe5-4ac7-7dc2-08dbec0a8616
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2023 09:56:54.8693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rR0MqZnoJE7f9A3AJ90uJiBVF9wcBN8M0peyDcdh1isveyBZMnFFU1NmyV/lCzOr9ta6zJwprDPEIzr+7DSm2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9454

On 29.08.2023 12:53, Jan Beulich wrote:
> Everywhere else the VL tests are grouped with the basic ones,
> distinguished simply by the "form" specifiers.
> 
> No change to the generated test blobs, and hence no functional change.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Any chance of an ack for this purely mechanical tidying?

Thanks, Jan

> --- a/tools/tests/x86_emulator/Makefile
> +++ b/tools/tests/x86_emulator/Makefile
> @@ -18,7 +18,7 @@ CFLAGS += $(CFLAGS_xeninclude)
>  
>  SIMD := 3dnow sse sse2 sse4 avx avx2 xop avx512f avx512bw avx512dq avx512er avx512vbmi avx512fp16
>  FMA := fma4 fma
> -SG := avx2-sg avx512f-sg avx512vl-sg
> +SG := avx2-sg avx512f-sg
>  AES := ssse3-aes avx-aes avx2-vaes avx512bw-vaes
>  CLMUL := ssse3-pclmul avx-pclmul avx2-vpclmulqdq avx512bw-vpclmulqdq avx512vbmi2-vpclmulqdq
>  SHA := sse4-sha avx-sha avx512f-sha
> @@ -70,14 +70,10 @@ xop-flts := $(avx-flts)
>  avx512f-vecs := 64 16 32
>  avx512f-ints := 4 8
>  avx512f-flts := 4 8
> -avx512f-sg-vecs := 64
> +avx512f-sg-vecs := $(avx512f-vecs)
>  avx512f-sg-idxs := 4 8
>  avx512f-sg-ints := $(avx512f-ints)
>  avx512f-sg-flts := $(avx512f-flts)
> -avx512vl-sg-vecs := 16 32
> -avx512vl-sg-idxs := $(avx512f-sg-idxs)
> -avx512vl-sg-ints := $(avx512f-ints)
> -avx512vl-sg-flts := $(avx512f-flts)
>  avx512bw-vecs := $(avx512f-vecs)
>  avx512bw-ints := 1 2
>  avx512bw-flts :=
> --- a/tools/tests/x86_emulator/test_x86_emulator.c
> +++ b/tools/tests/x86_emulator/test_x86_emulator.c
> @@ -34,7 +34,6 @@ asm ( ".pushsection .test, \"ax\", @prog
>  #include "avx512f.h"
>  #include "avx512f-sg.h"
>  #include "avx512f-sha.h"
> -#include "avx512vl-sg.h"
>  #include "avx512bw.h"
>  #include "avx512bw-vaes.h"
>  #include "avx512bw-vpclmulqdq.h"
> @@ -462,22 +461,22 @@ static const struct {
>      AVX512VL(VL u64x2,        avx512f,      16u8),
>      AVX512VL(VL s64x4,        avx512f,      32i8),
>      AVX512VL(VL u64x4,        avx512f,      32u8),
> -    SIMD(AVX512VL S/G f32[4x32], avx512vl_sg, 16x4f4),
> -    SIMD(AVX512VL S/G f64[2x32], avx512vl_sg, 16x4f8),
> -    SIMD(AVX512VL S/G f32[2x64], avx512vl_sg, 16x8f4),
> -    SIMD(AVX512VL S/G f64[2x64], avx512vl_sg, 16x8f8),
> -    SIMD(AVX512VL S/G f32[8x32], avx512vl_sg, 32x4f4),
> -    SIMD(AVX512VL S/G f64[4x32], avx512vl_sg, 32x4f8),
> -    SIMD(AVX512VL S/G f32[4x64], avx512vl_sg, 32x8f4),
> -    SIMD(AVX512VL S/G f64[4x64], avx512vl_sg, 32x8f8),
> -    SIMD(AVX512VL S/G i32[4x32], avx512vl_sg, 16x4i4),
> -    SIMD(AVX512VL S/G i64[2x32], avx512vl_sg, 16x4i8),
> -    SIMD(AVX512VL S/G i32[2x64], avx512vl_sg, 16x8i4),
> -    SIMD(AVX512VL S/G i64[2x64], avx512vl_sg, 16x8i8),
> -    SIMD(AVX512VL S/G i32[8x32], avx512vl_sg, 32x4i4),
> -    SIMD(AVX512VL S/G i64[4x32], avx512vl_sg, 32x4i8),
> -    SIMD(AVX512VL S/G i32[4x64], avx512vl_sg, 32x8i4),
> -    SIMD(AVX512VL S/G i64[4x64], avx512vl_sg, 32x8i8),
> +    SIMD(AVX512VL S/G f32[4x32], avx512f_sg, 16x4f4),
> +    SIMD(AVX512VL S/G f64[2x32], avx512f_sg, 16x4f8),
> +    SIMD(AVX512VL S/G f32[2x64], avx512f_sg, 16x8f4),
> +    SIMD(AVX512VL S/G f64[2x64], avx512f_sg, 16x8f8),
> +    SIMD(AVX512VL S/G f32[8x32], avx512f_sg, 32x4f4),
> +    SIMD(AVX512VL S/G f64[4x32], avx512f_sg, 32x4f8),
> +    SIMD(AVX512VL S/G f32[4x64], avx512f_sg, 32x8f4),
> +    SIMD(AVX512VL S/G f64[4x64], avx512f_sg, 32x8f8),
> +    SIMD(AVX512VL S/G i32[4x32], avx512f_sg, 16x4i4),
> +    SIMD(AVX512VL S/G i64[2x32], avx512f_sg, 16x4i8),
> +    SIMD(AVX512VL S/G i32[2x64], avx512f_sg, 16x8i4),
> +    SIMD(AVX512VL S/G i64[2x64], avx512f_sg, 16x8i8),
> +    SIMD(AVX512VL S/G i32[8x32], avx512f_sg, 32x4i4),
> +    SIMD(AVX512VL S/G i64[4x32], avx512f_sg, 32x4i8),
> +    SIMD(AVX512VL S/G i32[4x64], avx512f_sg, 32x8i4),
> +    SIMD(AVX512VL S/G i64[4x64], avx512f_sg, 32x8i8),
>      SIMD(AVX512BW s8x64,     avx512bw,      64i1),
>      SIMD(AVX512BW u8x64,     avx512bw,      64u1),
>      SIMD(AVX512BW s16x32,    avx512bw,      64i2),
> 


