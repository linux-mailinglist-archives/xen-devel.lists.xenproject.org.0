Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D107FA76E
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 18:02:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642360.1001785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7eyt-00063v-Mi; Mon, 27 Nov 2023 17:01:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642360.1001785; Mon, 27 Nov 2023 17:01:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7eyt-00061v-K0; Mon, 27 Nov 2023 17:01:11 +0000
Received: by outflank-mailman (input) for mailman id 642360;
 Mon, 27 Nov 2023 17:01:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nblC=HI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7eyr-00061p-NW
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 17:01:09 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20604.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8be8abf4-8d46-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 18:01:04 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8466.eurprd04.prod.outlook.com (2603:10a6:20b:349::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.21; Mon, 27 Nov
 2023 17:01:00 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Mon, 27 Nov 2023
 17:01:00 +0000
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
X-Inumbo-ID: 8be8abf4-8d46-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SkFQmxhcg42pccdZnihu+/iyEmvoTmNX/3oftOIJcY/0pLndZ59/wJQaOJAeYvCV7xXX5e7Z1Yn00zrkWAB7RRwM2Ql7z3GlGzVwfIK+dXHQrDUE0vGN5SgI3vpt8tFvW9OyUQvFUGvYDRltrw/D3neh1XVm1KMcnFuiBvcB79UMt5y4Do9NEjCxsU3CSJn9eh2JBm6fk23O1gRiP76ww5ah3ZcSqDx1L//k4fTOgKGUeWY0dYaIW9pVWbyh/Y9DZvnzevmrfmOpBpH0Iyte7gsHLWX+VeNvYUCVp0M0WWJNUSajXGJIPz2ope+/eHfu46pwhUwvwup61MO/JO67rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mMM5gqqY6GhO3pJrgHG+fgXdLNUvYC+Vadfm0e4i5sA=;
 b=GHSMiLnLOZdty382tfOu/4RTUI6Jdf0mqqN0vsDXm1jQDAJpQIi8OpVRTgh1Bdii+rSl6NwH1pR3L7xl5tQADdxhTZYREEcV3r9XUMgVjDp3QJqfzjt8Mw4yVSH7ph/0OQ1uF+oZ1hN2l7dX8wqNAVL7H/LkS5C93tr+Gc+PN6dBp2ZVeJYPIbqnrDk+MdT0SKHfx8q6+43bHm1iz4lDpmLkY35D4YYDfOKJ3XOza/r4l6HdsVPwUd8iSYX8i55dnOYk6WkreHJuUAg40iZc5u9h8BaeBs9vlkuodI3GgSChnNLDOCfeqUSTIHXEjcIP3oiU+EXjs6+2wsr0Dnz/4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mMM5gqqY6GhO3pJrgHG+fgXdLNUvYC+Vadfm0e4i5sA=;
 b=szyPqjZOaKlzsjrxwMPcwXS3ycTN/x1pmxK9XkMMCzLg13cBEiulyDF3Mu5U6R0m7+72UGBu0hLknma+fNt6GfGQv3TDtByTAI8mfL0IuqY6a7uHVZ9gR8nOO5FV3u4WXjC+0XIXEE12xouvYoLErAsPpgwOGmEl9t3wZek3VV0kr2QQHVdbKzFE5oHalyKQb5pa8pPum/YbliWQUjab+2HyvVMkDdnGNO1ZzYr31NWHe/syMP+AB7esOnBSaSSqHIxkU5IN274lbSxIVtEA/MGxcLFQrAZDHrXPZSDyY8mRve7C6a6ORlJj47HGqX6XVhzXomIS4WFb0yXtyJO8/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <277f832d-20ce-437d-a7a3-7935aa6cf34e@suse.com>
Date: Mon, 27 Nov 2023 18:00:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] x86/hvm: Allow access to registers on the same
 page as MSI-X table
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <cover.e8ee4f1e4458c19070007220034a9bfdc34190d5.1700790421.git-series.marmarek@invisiblethingslab.com>
 <de5e66c790c9fc5e7f668f06826c7ee781b6d6e1.1700790421.git-series.marmarek@invisiblethingslab.com>
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
In-Reply-To: <de5e66c790c9fc5e7f668f06826c7ee781b6d6e1.1700790421.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0407.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8466:EE_
X-MS-Office365-Filtering-Correlation-Id: 66b72f39-9051-4641-e5f5-08dbef6a6e70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2WwEcFtbD9301PxSv0HLWsvOhhGUqzIfxbtpGA3+YnwNrnQ4pVo/MVDKK4eRHGozhIhYc2pDEEItkMM5PrRlF7gKzcbzMlA8i2+KRTPVNFkF/ieJ1DnuPqico28YsomdsWKNOD3RcM+hpFKCtaiZYJ2BF6gLRoYCCSglQaqbmxQac+2OI8RnpOBIdpC8UFRebrEL8kJ0HTpLeaeDFM8xTxyY7yStjrgQ9OiqhzAA/CNpD00ek0L8W8jIV2KxAtXq4Be2TWKf9ZI9CNQpQGWRPzBe9NB5p5KqI/7uNEHSWFJr3et1FmbufcyS7+wKR8Kf5ZQoawMGoG9QZHR8BHo7L9Mvv1JEb6m3RR6NrlfDlKfU0gxu+wm2mL3AXe7G34C/KYD0rUIX4QNvUCW0b7eXX9XOsPsM/pycyUCjQMmh/aFIOTaCMA1bUVIsK7ibLqHH6la2Hn1BiB8f3Uoa+7a5QkZiJVnR4mvS93GIjzpEUZT4Ax8MOkgBV4K0mFtJAeSjE0m5C+yx5aKErJclPbs0aTSH51OmaT6sap+ywHZQEtkI/IejPOw+v8dCf6snA+/w6IxTvLydNp0oRbHwIXCIQw2F5lALP3RNga71gd92y+RAhJxqY1n3rSVMtdxfMURufKDZ+lae5mq3buCsv3MMZpejl4DeMeQ4mY8xYpSXWqpQgZ/tfzuHq9TLtI9H40zM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(366004)(136003)(376002)(396003)(230273577357003)(230922051799003)(230173577357003)(64100799003)(186009)(1800799012)(451199024)(6512007)(6506007)(53546011)(2616005)(6486002)(478600001)(6666004)(66574015)(83380400001)(2906002)(5660300002)(41300700001)(66946007)(54906003)(4326008)(66476007)(6916009)(316002)(8936002)(8676002)(66556008)(38100700002)(86362001)(31696002)(36756003)(31686004)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NU5rNERib0hDL1NpQTV6cjhKbTdsR0hDLzhDY25sdVVMYnFCUHZTcTQwckVE?=
 =?utf-8?B?OHJ0WllZaUlHVUZsdGNiYXhodHdEY3RDbFRrWU5SakUxTVF2S1AxOUx0VzVG?=
 =?utf-8?B?Zm9DMkV3YThnM04wQVAwSWZBQmRkVGxxLzRXZ2prbUlOY1Y2OUhsUjdsWmZ0?=
 =?utf-8?B?ZkdUREU3ME1RaC9DVTlIMTIxS2JxdlY4WHd5UTNSb2docHRYSVBDTmduM0cx?=
 =?utf-8?B?UHRNQk1JekRINTFqM1dTQkJyNVAyVlJSUmpYVk9VZnhTK3dINFpYNkpJYVMw?=
 =?utf-8?B?QlliRDNqSXN3Y0MwTXRyTS9QVFV3aTFFQkRoY0pqQXFrclZZczJUOTZRcFhP?=
 =?utf-8?B?L3crYU5tQ3dEWUlGTUM1UE1NdnRvMnlxOW04NHIyNGs4clVwNjQreUxTcVd4?=
 =?utf-8?B?ZkxIMEtxUUtkaGtrT3hHVUczK0h1WHVlbGMwSXFmaDZOUTdtT0VVVElSak5q?=
 =?utf-8?B?aW5id3NVYXlLQTc3NlJ1d2NLaWFINFJVRlIwbmxXU1VIZkhnOElIQnYrT0Z6?=
 =?utf-8?B?ZEpqNjhQWk5hTUgxeStRUC90VWdVZHhQUEtmeW9oU2ZMMFZ3UHJUdWNtYnBI?=
 =?utf-8?B?czlWWDdvaFNJTFFiMWtaVkcxTE12WVBXaHR1NmpUQ3dIVStRZ3BrWkFpYWJv?=
 =?utf-8?B?a29XdUJUQjBWa3dBSmZSU29ydThWSVRNZjJjeXl2aE9jVk9WaG9RMFM5UHVJ?=
 =?utf-8?B?ZXp4cHo0b3lRWTNMenErZDF0M3MrbmxFa0VSRE00eStwcllwOVpNRGJVWGdJ?=
 =?utf-8?B?UlVSUUFXRDRvZzVZMU84N2ZjRldDdW1UL3JVdEJldFdaL2RWREJ6SHNMWWIz?=
 =?utf-8?B?TzFkM1RFZGQ4Q003R2d6VzJDUTNQZXZwM2JSbFMzTktTTTNPNVBYZlZTZUhL?=
 =?utf-8?B?bkNiNENrMmhBM29sQVJJY1Mxem5jeVZaUmRiZU0xVWN1REVWcWN2eThxSk14?=
 =?utf-8?B?TlpvZ0h4d3lIV0gvekVTcWp6YlR3N1puKysxV3ZxSk1leVRNd1JCSFZRMmI4?=
 =?utf-8?B?YzRKaHBPYVhEK2xPU2xUMzMxOUxHT0U2dzZub3hsdGNTTGx4Wk0xZTBmSGl1?=
 =?utf-8?B?RytXNklGM3NEbUpsUi9lY3J1NzNBUGhxLzJrQWtyNFFjMWExY3EwOTMzRlVI?=
 =?utf-8?B?SWxnb1ljOEVDRGR3NHBBS0RxZXh1aVorMHV3ZDRkNStqQm1teFd4a0lqYzFi?=
 =?utf-8?B?bHVGSkh4RDREMkJFMi9JblBDaEJqRnJRc2NHZnJtdnNZM0p2cmdRZUM5azA1?=
 =?utf-8?B?SHpTS1ZMUmhUbUt3eU41R3BVR0dHVnpFb1BNR0JnVHg5VWFBNnEwaFIyVnI1?=
 =?utf-8?B?Z0pBQ052azlUU1FQMWpVY0xLdHFDeXhiZmVVTE44UFhTQytKbnNEK2Jtd2xu?=
 =?utf-8?B?SHZma0ViNkE5YTRHakdhSEZEeG9jYjhCRmJtSXBlWTBsWXVSMlo4WW8vN0JH?=
 =?utf-8?B?TXVGcGNoRDBJWGFQbWxGVnNEVXYrVU91bGd4c25qcU56aCtLQ3I4ZmtoMjlW?=
 =?utf-8?B?ZTJnNlpySTRCTFEzb2d4WXF1TnZ1NkkwMklxZ2hZclVHMlRCUE85blJYSE9G?=
 =?utf-8?B?Q3V6VXR3T2FwbHIwV2lrd2dhWmZlNkJJNEV6dFJ1S1lTRXBhQXVobHUwMXRB?=
 =?utf-8?B?UDcreUx0NUpnUUtvU2R5Yll0STNnd2dtVE1wMlhncmlNWnFPUFJvTGpjWTdo?=
 =?utf-8?B?MlRVR29vSjBpbHlvaTdIbU1zMXVCWE1xYmIvV1NaSk8yVVNnU1I1a2pMNFAv?=
 =?utf-8?B?SkxvUmNVN054VCtpSERGM2JWaGltRlNjS0U1a3hyK0VGL3YyaklmWEVvS0tK?=
 =?utf-8?B?UCt4blIyMHdvckI2eWxqbnFkOGVyTU1UcXVxRndEZnFKd1NFTkpmd2xGL0l6?=
 =?utf-8?B?bEN2K0FBQXNzelo4R1lNRHRkT0JTUDJGVjQzOHNwQmVGamdHci9JK2ZtVlMr?=
 =?utf-8?B?UnRPc2xoU2dma2U5a2pCVFVRY1VXUVJNN2tLeS9KUXNvKzh1ZEI0djZIK0xu?=
 =?utf-8?B?aTUzbmRnUHQ1QndxSFNQMlRDaUhQb2tBTklUaTN2UjJLY0FJR3g5TDB1ZDZM?=
 =?utf-8?B?SHhnOUdtQVZEWU8wY0V4T3RmSVZLaWpHNWNWclF1MXE4M3N1Q0M1YnVSUGV5?=
 =?utf-8?Q?JJRC2XcdDVhw2xOHinZAfw45y?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66b72f39-9051-4641-e5f5-08dbef6a6e70
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 17:01:00.3456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yuvJ3pj6gi8sw+9LKLTceDQsEtsrAmIR74X17dxiHhyX97XeDTUZ22l4FXzyrA080XsGoiU2udSbucrzblPzFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8466

On 24.11.2023 02:47, Marek Marczykowski-Górecki wrote:
> Some devices (notably Intel Wifi 6 AX210 card) keep auxiliary registers
> on the same page as MSI-X table. Device model (especially one in
> stubdomain) cannot really handle those, as direct writes to that page is
> refused (page is on the mmio_ro_ranges list). Instead, extend
> msixtbl_mmio_ops to handle such accesses too.
> 
> Doing this, requires correlating read/write location with guest
> of MSI-X table address. Since QEMU doesn't map MSI-X table to the guest,
> it requires msixtbl_entry->gtable, which is HVM-only. Similar feature
> for PV would need to be done separately.
> 
> This will be also used to read Pending Bit Array, if it lives on the same
> page, making QEMU not needing /dev/mem access at all (especially helpful
> with lockdown enabled in dom0). If PBA lives on another page, QEMU will
> map it to the guest directly.
> If PBA lives on the same page, discard writes and log a message.
> Technically, writes outside of PBA could be allowed, but at this moment
> the precise location of PBA isn't saved, and also no known device abuses
> the spec in this way (at least yet).
> 
> To access those registers, msixtbl_mmio_ops need the relevant page
> mapped. MSI handling already has infrastructure for that, using fixmap,
> so try to map first/last page of the MSI-X table (if necessary) and save
> their fixmap indexes. Note that msix_get_fixmap() does reference
> counting and reuses existing mapping, so just call it directly, even if
> the page was mapped before. Also, it uses a specific range of fixmap
> indexes which doesn't include 0, so use 0 as default ("not mapped")
> value - which simplifies code a bit.
> 
> GCC gets confused about 'desc' variable:
> 
>     arch/x86/hvm/vmsi.c: In function ‘msixtbl_range’:
>     arch/x86/hvm/vmsi.c:553:8: error: ‘desc’ may be used uninitialized [-Werror=maybe-uninitialized]
>       553 |     if ( desc )
>           |        ^
>     arch/x86/hvm/vmsi.c:537:28: note: ‘desc’ was declared here
>       537 |     const struct msi_desc *desc;
>           |                            ^~~~

This could do with also indicating the gcc version. Issues like this
tend to get fixed over time.

> It's conditional initialization is actually correct (in the case where
> it isn't initialized, function returns early), but to avoid
> build failure initialize it explicitly to NULL anyway.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Logic looks okay to me now (albeit I'm still not overly happy that we need
to gain such code), but there are a couple of cosmetic issues.

> @@ -213,6 +217,131 @@ static struct msi_desc *msixtbl_addr_to_desc(
>      return NULL;
>  }
>  
> +/*
> + * Returns:
> + *  - UINT_MAX if no handling should be done
> + *  - UINT_MAX-1 if write should be discarded
> + *  - a fixmap idx to use for handling
> + */
> +#define ADJACENT_DONT_HANDLE UINT_MAX
> +#define ADJACENT_DISCARD_WRITE (UINT_MAX - 1)

The comment would imo better talk in terms of the two constants you
define here.

> +static unsigned int adjacent_handle(
> +    const struct msixtbl_entry *entry, unsigned long addr, bool write)
> +{
> +    unsigned int adj_type;
> +    const struct arch_msix *msix;
> +
> +    if ( !entry || !entry->pdev )
> +        return ADJACENT_DONT_HANDLE;
> +
> +    if ( PFN_DOWN(addr) == PFN_DOWN(entry->gtable) && addr < entry->gtable )
> +        adj_type = ADJ_IDX_FIRST;
> +    else if ( PFN_DOWN(addr) == PFN_DOWN(entry->gtable + entry->table_len - 1) &&
> +              addr >= entry->gtable + entry->table_len )
> +        adj_type = ADJ_IDX_LAST;
> +    else
> +        return ADJACENT_DONT_HANDLE;
> +
> +    msix = entry->pdev->msix;
> +    ASSERT(msix);
> +
> +    if ( !msix->adj_access_idx[adj_type] )
> +    {
> +        gprintk(XENLOG_WARNING,
> +                "Page for adjacent(%d) MSI-X table access not initialized for %pp (addr %#lx, gtable %#lx\n",
> +                adj_type, &entry->pdev->sbdf, addr, entry->gtable);
> +
> +        return ADJACENT_DONT_HANDLE;
> +    }
> +
> +    /* If PBA lives on the same page too, discard writes. */
> +    if ( write &&
> +         ((adj_type == ADJ_IDX_LAST &&
> +           msix->table.last == msix->pba.first) ||
> +          (adj_type == ADJ_IDX_FIRST &&
> +           msix->table.first == msix->pba.last)) )
> +    {
> +        gprintk(XENLOG_WARNING,
> +                "MSI-X table and PBA of %pp live on the same page, "
> +                "writing to other registers there is not implemented\n",
> +                &entry->pdev->sbdf);

Here and above I think verbosity needs limiting to the first instance per
device per domain.

> +        return ADJACENT_DISCARD_WRITE;
> +    }
> +
> +    return msix->adj_access_idx[adj_type];
> +}
> +
> +static int adjacent_read(
> +    unsigned int fixmap_idx,
> +    paddr_t address, unsigned int len, uint64_t *pval)
> +{
> +    const void __iomem *hwaddr;
> +
> +    *pval = ~0UL;
> +
> +    ASSERT(fixmap_idx != ADJACENT_DISCARD_WRITE);
> +
> +    hwaddr = fix_to_virt(fixmap_idx) + PAGE_OFFSET(address);
> +
> +    switch ( len )
> +    {
> +    case 1:
> +        *pval = readb(hwaddr);
> +        break;
> +
> +    case 2:
> +        *pval = readw(hwaddr);
> +        break;
> +
> +    case 4:
> +        *pval = readl(hwaddr);
> +        break;
> +
> +    case 8:
> +        *pval = readq(hwaddr);
> +        break;
> +
> +    default:
> +        ASSERT_UNREACHABLE();
> +    }
> +    return X86EMUL_OKAY;
> +}
> +
> +static int adjacent_write(
> +        unsigned int fixmap_idx,
> +        uint64_t address, uint32_t len, uint64_t val)

This uses indentation different from the two cases further up. Types
used also don't match adjacent_read()'s.

> @@ -220,16 +349,31 @@ static int cf_check msixtbl_read(
>      unsigned long offset;
>      struct msixtbl_entry *entry;
>      unsigned int nr_entry, index;
> +    unsigned int adjacent_fixmap;
>      int r = X86EMUL_UNHANDLEABLE;
>  
> -    if ( (len != 4 && len != 8) || (address & (len - 1)) )
> +    if ( !IS_ALIGNED(address, len) )
>          return r;
>  
>      rcu_read_lock(&msixtbl_rcu_lock);
> -
>      entry = msixtbl_find_entry(current, address);
>      if ( !entry )
>          goto out;
> +
> +    adjacent_fixmap = adjacent_handle(entry, address, false);
> +    if ( adjacent_fixmap != ADJACENT_DONT_HANDLE )
> +    {
> +        r = adjacent_read(adjacent_fixmap, address, len, pval);
> +        goto out;
> +    }
> +
> +    if ( address < entry->gtable ||
> +         address >= entry->gtable + entry->table_len )
> +        goto out;
> +
> +    if ( len != 4 && len != 8 )
> +        goto out;
> +
>      offset = address & (PCI_MSIX_ENTRY_SIZE - 1);
>  
>      if ( offset != PCI_MSIX_ENTRY_VECTOR_CTRL_OFFSET )
> @@ -282,6 +426,7 @@ static int msixtbl_write(struct vcpu *v, unsigned long address,
>      int r = X86EMUL_UNHANDLEABLE;
>      unsigned long flags;
>      struct irq_desc *desc;
> +    unsigned int adjacent_fixmap;
>  
>      if ( !IS_ALIGNED(address, len) )
>          return X86EMUL_OKAY;
> @@ -291,6 +436,19 @@ static int msixtbl_write(struct vcpu *v, unsigned long address,
>      entry = msixtbl_find_entry(v, address);
>      if ( !entry )
>          goto out;
> +
> +    adjacent_fixmap = adjacent_handle(entry, address, true);
> +    if ( adjacent_fixmap != ADJACENT_DONT_HANDLE )
> +    {
> +        r = adjacent_write(adjacent_fixmap, address, len, val);
> +        goto out;
> +    }
> +    if ( address < entry->gtable ||
> +         address >= entry->gtable + entry->table_len )
> +        goto out;
> +    if ( len != 4 && len != 8 )
> +        goto out;
> +

Can this please follow the read side as far as use of blank lines goes?

> @@ -622,12 +788,15 @@ void msix_write_completion(struct vcpu *v)
>           v->arch.hvm.hvm_io.msix_snoop_gpa )
>      {
>          unsigned int token = hvmemul_cache_disable(v);
> -        const struct msi_desc *desc;
> +        const struct msi_desc *desc = NULL;
> +        const struct msixtbl_entry *entry;
>          uint32_t data;
>  
>          rcu_read_lock(&msixtbl_rcu_lock);
> -        desc = msixtbl_addr_to_desc(msixtbl_find_entry(v, snoop_addr),
> -                                    snoop_addr);
> +        entry = msixtbl_find_entry(v, snoop_addr);
> +        if ( entry && snoop_addr >= entry->gtable &&
> +                      snoop_addr < entry->gtable + entry->table_len )

Nit: Too deep indentation.

> --- a/xen/arch/x86/include/asm/msi.h
> +++ b/xen/arch/x86/include/asm/msi.h
> @@ -207,6 +207,10 @@ struct msg_address {
>                                         PCI_MSIX_ENTRY_SIZE + \
>                                         (~PCI_MSIX_BIRMASK & (PAGE_SIZE - 1)))
>  
> +/* indexes in adj_access_idx[] below */

Nit: Comment style again.

> @@ -1078,6 +1108,16 @@ static void _pci_cleanup_msix(struct arch_msix *msix)
>              WARN();
>          msix->table.first = 0;
>          msix->table.last = 0;
> +        if ( msix->adj_access_idx[ADJ_IDX_FIRST] )
> +        {
> +            msix_put_fixmap(msix, msix->adj_access_idx[ADJ_IDX_FIRST]);
> +            msix->adj_access_idx[ADJ_IDX_FIRST] = 0;
> +        }
> +        if ( msix->adj_access_idx[ADJ_IDX_LAST] )
> +        {
> +            msix_put_fixmap(msix, msix->adj_access_idx[ADJ_IDX_LAST]);
> +            msix->adj_access_idx[ADJ_IDX_LAST] = 0;
> +        }
>  
>          if ( rangeset_remove_range(mmio_ro_ranges, msix->pba.first,
>                                     msix->pba.last) )

This could probably do with another blank line at the head of the
addition.

Jan

