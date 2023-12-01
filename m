Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 840F9800444
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 08:02:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645304.1007409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8xXp-0000WA-W9; Fri, 01 Dec 2023 07:02:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645304.1007409; Fri, 01 Dec 2023 07:02:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8xXp-0000TP-SX; Fri, 01 Dec 2023 07:02:37 +0000
Received: by outflank-mailman (input) for mailman id 645304;
 Fri, 01 Dec 2023 07:02:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jO30=HM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r8xXo-0000TJ-C9
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 07:02:36 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20612.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ae9b35f-9017-11ee-98e5-6d05b1d4d9a1;
 Fri, 01 Dec 2023 08:02:35 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9007.eurprd04.prod.outlook.com (2603:10a6:102:20f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.8; Fri, 1 Dec
 2023 07:02:33 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.012; Fri, 1 Dec 2023
 07:02:33 +0000
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
X-Inumbo-ID: 9ae9b35f-9017-11ee-98e5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QuISm9tBMpr4MxVNQM+uH3MYjXdL50Riz4tN/umFt/SboE3tAq0cgFyN26D6Hip0xuSOde/eKVhxYeJkWZUiPCQzNWltveXH25iUK8EIcTgKdmPprsnS1243hE73VlAeb/H8vLiXY4bRlwsIW9M5BD3k5VZlxUBODcCGRRNrNrmGJBoO2Xz/xEWPmlPUOs7P6CfYeD5KxwWVsaP9u2iUFNxH5g6S2IEcfuV3l20eBmACp/b1BmaVja3BVADDyEHmCRZ18mm+MbDy3Xm0kYMneSfsj8lOJ9Rm8jzZqKxohhTUUvLSdKAJOtiLvdTkaqXlOEO2ndkSx31KKv3R2rQW6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hc3VbQwl8iBqZ+QVA34SczUndA6xgUTDtNFyAweavFA=;
 b=Ne+kbDXh374czzAA5l1oz+OumYXsHpEuM26xIDkxLUFDCjW1580RLgv98R5KUdbhv/iKRwu57V14gaPygkBj+qUrK7xW8CexBusbN4MtaQ4jUu3+U5qpFKsfJdlbAVhWIHuTDYKYioHMdWkEsZZOC7gq7K+zBe8jhwu3u6uC0K28AP+1/cN/tYS6rdpLhlaK77op2QZuG0OO3II6DVLutzx2x3/rdnqu0ohbYCOpdXzTeux92jgPG9tRWK/uWAXlB8gF9ZB311uLndX4Xz/RMKeoLQIZkSNFda6hrHhg6KYiigfx5Cu34imqpJWEqVwbVztf/G1JWzaluCor97vTGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hc3VbQwl8iBqZ+QVA34SczUndA6xgUTDtNFyAweavFA=;
 b=CTjOtEckNs1eZTcvFignh0VUgGs5bvCvcVdmO5poVBrd4muMT5veaaSN6R3MZ5nyu2CS6737NwgJJqr+DIip2FnXaAlSUYwywyQ2MuFF7dpxziJTsGOwYaPKALshJQWdRds1NxfeGX0e477wCi3n+AhB4IwLqFhWkQgyUUHOWwE36j4mZGkFWYqdufvWDqph/lyj0m2v5p8JE3ZhWVqoBU6cz3npOiq34geud065ELfGy1usW2hR6uIZweXbn0EA5FuyiB0TPYBY4WsR6DhU94oqZdJnoATtU+1BgreWppHAr9vGCTyRk3WdUeJtl3mq2vicxB36N69pgBpFDQXcOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6921f9a8-94dd-41e4-9e4b-5e6411a8dcd8@suse.com>
Date: Fri, 1 Dec 2023 08:02:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: INFORMAL VOTE REQUIRED - DOCUMENTATION WORDING
Content-Language: en-US
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Kelly Choi <kelly.choi@cloud.com>
Cc: xen-devel@lists.xenproject.org, committers@xenproject.org
References: <CAO-mL=x3DntLhoKuaiWYjVqkQRqj=rdyZWmuH1aDjkmUbQchyA@mail.gmail.com>
 <alpine.DEB.2.22.394.2311301426210.110490@ubuntu-linux-20-04-desktop>
 <CABfawhnXtOFuqNgWP=6bdX_+T7X0+T_wxQtJsxMrbtpbempuVA@mail.gmail.com>
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
In-Reply-To: <CABfawhnXtOFuqNgWP=6bdX_+T7X0+T_wxQtJsxMrbtpbempuVA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0142.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9007:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cc1cf51-379a-4b56-8d42-08dbf23b7de8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p6A3pb9+2YiF1noCz6Wgo6SJz+sxI6q6Lnbuwxk3Byk1cqCvkFBwF0t751eqIQIYoGZZTuMKlLMSHpIbLfEzrwFZhHdOdQ2BSeYMlDQ6ftR9+WMnsFG22g7gyahlZnDK0g6HLhG/D9tyckQpHx+MxRRCdGc+EAtQoOFeGoLiX1UlyS1V6/FVpTwN98BVvUrop96MSM4rrYXpxZf1pYALmr6lD5auBPIiZiJdFLR5AlJ7ajlJt8R9hGzSerenrLsfekgKYYCxLYmYtWi7XL8wdMnR7BEXvqsAJWx1cBbKAcZwEjWZ/xuTwVRanGTKYG3XB5OJwR48yMUZgYasmZhiUQqj3cRb51iQm1Rsq1Wziv0uIo8eplrBepUY2W+IwkKIDEgBVmsBBCBj0KSjxTXq2L6RPte543NwmfB70uvzPAQK/i1QjJ0V6O3kkxwG4iZPIXpiLTHnKTOD9dLysS2u5FRDakDnNorf8vr0pVdbVhzxy+4/VFqiKo73CHVyr3OSDvuiBunz0Gi9xSDpnve1QlJsmUyyut4YHTh6MVQtj9/CB38u+542M2IPMx3G5SQlcxTQuhSwdXiWWLXlX2bmEwDW2B3+yAk1nnSxtXPBSXscjGF3cTtMyRMCZ1CZhMSooxfuqSTdbTYiw5yUpqE07g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(376002)(136003)(39860400002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(2906002)(4326008)(110136005)(66556008)(66476007)(66946007)(316002)(8676002)(36756003)(8936002)(5660300002)(41300700001)(86362001)(31696002)(2616005)(26005)(38100700002)(31686004)(508600001)(966005)(6506007)(6512007)(53546011)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dENYSVBnRjJQSEFnT2lOZjEyQTBCY05vbUY3eGp0cFNoSlRtamVZZjNoMHNn?=
 =?utf-8?B?eUdQcFNaeEZJbDV4dkVQcTcrVUl4LzEzaDJuaFNIMVlSZmZNRlU4V2s3QVZG?=
 =?utf-8?B?SWV6eURGNDA3aXM0SzZFbjBzRXdNOUpJN2VsS0hOdy85cjh0Uy9ERXZ6cTVv?=
 =?utf-8?B?UDFUN3praFFYb0xhYVhnVW1ZSUdGcm13VkhiOFduM0R3TDQ0Y3FycmxYQUI1?=
 =?utf-8?B?UG84M3NJUjVPSTA2QzNhOWZHZnZINjBlVFgySUZMRWR0RjBJcXBrcUFaRFdu?=
 =?utf-8?B?Q3JmUS9yTCtrSnRuV0NZNGhCSDVBaitDQ3Jxcnh3amVCU2lJc29mNVQ4WGl0?=
 =?utf-8?B?K3RnSjhKazR5eHE4RGxmVlVnU09seXVXckoxNS85VkRHbHErcy9kanJsVWdu?=
 =?utf-8?B?aGlNa29ZMHZLOXVRaFhPSmdDN2x1aSs3TGcyb0s4ODNsczFjcHlVS1EzeElv?=
 =?utf-8?B?NGFCbmtOMHBoTEliSHBEVkQ4bDAwcktIY0hiV29zOFFycXZqTWVOa0UvazNn?=
 =?utf-8?B?VExGbEdtaitScmxyNXhSNTB4ZXFMSjQ1QXBFbGh0clJlS05vdk5iMmQxMXpI?=
 =?utf-8?B?L1hIcndrbTZhYlhLRHlTK2doem5BSS9Palk0QkFrZ3ZpREFMcXpoTktrYTVr?=
 =?utf-8?B?MjU4MzRyamtncXZ1OVUzYUFJN3VrUzZTN3gzbzNVSldIUlFoVXN4TjlnekVX?=
 =?utf-8?B?Tmh2VGRmSFM1Wmp6alhlVHRScVJNWXh2Vk5oVEdMME1kV1lyQXNHUThqV2NF?=
 =?utf-8?B?SjBwNkdFNytzb3BSVzlTWTRSUFFHWVY1TEJBc2hkTG45SGFlOXhKM0loMllM?=
 =?utf-8?B?emE4a2lJQUlLbVltSFV5dGhOOUZCSTRBNVRmSW5iMnJvOHJNeGNKZ01DK1dn?=
 =?utf-8?B?dDhLek9BdFJLL00zNmZtQStvMGNMSVd6OG1WdmpiVGVqR0l0WnVuZWxtbDZ5?=
 =?utf-8?B?ZGNERFMvV1pqTEc0Y2ZZOGVxVmwxOXRLOUd2a1pZdmlFWkJUSHpxNmJrYzgy?=
 =?utf-8?B?aU4rdENBOHIyMzQ2QWhOZ0M5WUd5T2s4TDAxZW40Y2VvVVVXOXhJQjV6N2xJ?=
 =?utf-8?B?UThwTkJQMmFFQ000SW9LOEhaVDhWeWFmR0E5OXZUSy9pc0RTMHJsV2d5OWNB?=
 =?utf-8?B?WnhaNDg2cXN6YzhLRUxBdkVJTXdrRytWVFozMHpuVm4rL2xIYWhic0taRW1i?=
 =?utf-8?B?ZnZOYVR2bTV2T0lFT3VpK3J1T2Q1d2lOcVBCWDB5VGFweEVtM1UzaFErWVZT?=
 =?utf-8?B?VXovYk1zRHZUaGxhWmN4UWNTZk5MNzAzTVBsZzg2VkdKSnVqYXRyWnJNTXAr?=
 =?utf-8?B?RjMwbzJQalFDYlVxbzhPWEZrYUpoUUUrOVduQWdUWDMvZWtIbFdWTVpoRllB?=
 =?utf-8?B?ZjFrU3U1TnFwQ2dhRFVlK3NucDFRcGNIQXlvM3hCbVdYQVE2T3gvaTJramw5?=
 =?utf-8?B?eWIvaGF6aS9nOFdnblNEQ09kenRxRjNrYmFBUTdodEhsNjY4Ymg2MnY0VHJp?=
 =?utf-8?B?Q29Ebk1SZ2NFOGtjZHI1d3JxOW00YnRGYmNYam1ldmgwVnQ3ZzhzM3ZVWTBi?=
 =?utf-8?B?dFlyNi9VVWNWKzVsWmJIWHRveVBhRmszU00wV05USFhzU2d3aHZha3kyOHBn?=
 =?utf-8?B?aVBUODI0SmN2RWZlT0tLYlhvWjJYc0FLQllTbGJtZzdyaEtQUzhzdVBaeWN0?=
 =?utf-8?B?NFVCbi9Gem1zMUY4d3kvUDIxeFdEUytQSmIydFJLWU5Wc29lWFVCQnVWUFY3?=
 =?utf-8?B?K1FTSzE4WGlUNEJCZUUvZ2M5SnVEWU9jbnYxSUx5NXdoVmVvVERDZTRXakpD?=
 =?utf-8?B?bkFSREhTZTJHSzZBNm1iUEtEQklXSVBsRUZNTDVxNW9mT1F5TEN2V1lOZ0xR?=
 =?utf-8?B?aTRmdFBQQWpyVTJONFN6STB3blpBaU5HQ0tBZk9VbjJQNGJtL1JsQ1hCekpT?=
 =?utf-8?B?R1JYTEdKbVNHdGVFNG5rOGQvYzE4N0RrQSsrU1YzTytkSyt1a3dqazdlN2xr?=
 =?utf-8?B?V3dMQTZ4YnFlUHJESGdYL21tb3JUaEh3ZE11RUEybnVzZXphM2tVWHQyNHNB?=
 =?utf-8?B?alpSSXNHck9zK0V1cUx4QjlNbUhuNlNhaDJjYkhaT29tU2xrNWJBOExaeHhl?=
 =?utf-8?Q?YqzQS9bE+7zAilaBLi7sBotnR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cc1cf51-379a-4b56-8d42-08dbf23b7de8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 07:02:33.3552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rBX4yhUPOl+R2np4DoYaD9dsu109bgqOdO0VXUoJtNMMbjsmWwrB3Qh+0lgy/kls3zrwvAVuhlo7xPWXs4+Rgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9007

On 30.11.2023 23:57, Tamas K Lengyel wrote:
> I think this form is bad and is not helpful. We ought to be able to
> recommend an alternative term beside "broken" and "deprecated". I
> would not use the term broken in this context but that also doesn't
> mean we shouldn't use it in any context. But also in this context
> deprecated is not the right term to use either since deprecated would
> require us to actually make the old hypercalls stop working altogether
> at some future point, which we won't ever do AFAIU. My vote would be
> to use the term superseded in this context, which I can't express
> clearly in the form so I'm not going to cast a vote.

+1

This really supports my earlier voiced concern that reducing things too
much for "ease" of voting isn't helpful. (That said, I don't share
Tamas'es view on the use of "deprecated".)

Jan

> On Thu, Nov 30, 2023 at 5:28 PM Stefano Stabellini
> <sstabellini@kernel.org> wrote:
>>
>> Hi all,
>>
>> This vote is in the context of this thread:
>> https://marc.info/?l=xen-devel&m=169213351810075
>>
>>
>> On Thu, 30 Nov 2023, Kelly Choi wrote:
>>> Hi all,
>>> There have been a few discussions about how we use documentation wording within the community. Whilst there are differences in opinions and
>>> perceptions of the definition, it would be helpful to see a wider consensus of how we feel.
>>>
>>> Discussion: Should we use the term 'broken' in our documentation, or do you think an alternative wording would be better? If you agree or
>>> disagree, please vote as this will impact future discussions.
>>>
>>> I have purposely made the vote between two options to help us move in a forward direction.
>>>
>>> PLEASE VOTE HERE. Deadline 15th December 2023.
>>> Your name will be required but will be private. If you answer anonymously, your vote will not count. This is to ensure it is fair and each
>>> person gets one vote.
>>>
>>> As an open-source project, we need to come to a common ground, which sometimes means we may not personally agree. To make this fair, please
>>> note the final results will be used to determine our future actions within the community.
>>>
>>> If the majority votes for/against, we will respect the majority and implement this accordingly.
>>>
>>> Many thanks,
>>> Kelly Choi
>>>
>>> Xen Project Community Manager
>>> XenServer, Cloud Software Group
>>>
>>>


