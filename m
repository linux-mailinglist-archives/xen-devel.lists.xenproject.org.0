Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 457FC7F5A3E
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 09:39:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639443.996813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r65FG-0007RV-Kj; Thu, 23 Nov 2023 08:39:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639443.996813; Thu, 23 Nov 2023 08:39:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r65FG-0007Od-I6; Thu, 23 Nov 2023 08:39:34 +0000
Received: by outflank-mailman (input) for mailman id 639443;
 Thu, 23 Nov 2023 08:39:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=licP=HE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r65FE-0007OX-Mv
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 08:39:32 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2062c.outbound.protection.outlook.com
 [2a01:111:f400:fe1b::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8115d56-89db-11ee-98e2-6d05b1d4d9a1;
 Thu, 23 Nov 2023 09:39:14 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PR3PR04MB7259.eurprd04.prod.outlook.com (2603:10a6:102:8a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.13; Thu, 23 Nov
 2023 08:39:11 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.012; Thu, 23 Nov 2023
 08:39:11 +0000
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
X-Inumbo-ID: c8115d56-89db-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yq+qipWpN+t6vliASjYLozJSFsa19fNKXvUwPJte/D3zbyfHBOVVHp8F+c7rZSDX/S1CC4ItSXjd/sIYoTCOF7vY66vfo+ryhVZAz9ykh/MnKuqKH83JSgVTy+C3EGHGmnS4Nj3ccjTaaAoLZrNezXLb64on/6hqiJimQ13R4Ovzhcfk0rqp61UqwSrs7WaMoMwzGam3AU/x21fLL3W74zhO0EpFzWC4fubBgicwnFSIdA6EpvW1HwtP3vFtyZl1h8Bom2fn4IV4ZnJI7LHa4mlitzdxE4wi7obLbDrija7mJYe3w1dZnvezzVg2FQDDn/osIBSUrbe/bqUj1YS9Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6KnmZ/PWSQ/6mwMpdsoU3uu6C3LXnt/aNqTq7wkVGbU=;
 b=XT7+51eaz5AXA+kvaPflEe0aB+TTDjQdAPc4Px0Emyp6t4kKauPuZbu/vMfIl8HCmJg4pfNaHTaIG37Yuzb2TVsK+sLu7T+PCS+PXK7Jt6BDj3GfJHX9cERzM4j6KyYCbPCIrMVKdhHWB5k4n3+7tjWUeF0M2yNbo5E6Y/J2V1CRlVLPgeMZfiiZsu08hiNUPg42AZoQPNHyl+l98RhH8QNFF5G3kuRWH9Tv1W9/HMXNZq3FxLW1D8GfVFtN9KATLk2xsBxGIdKZGK8aj5OM+pbES6UAi3yt9WQQPImOJhFitH9iXa1ORvXdLOcpl79H45LuGaOLUWKlcq++RdN5Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6KnmZ/PWSQ/6mwMpdsoU3uu6C3LXnt/aNqTq7wkVGbU=;
 b=NwQE01YK3IZ5v22i+rqrTc19MwBNVHcBpoSz5tl/vIpTCNmrhDI/ZVlgYYUL7osY/iNv8JadJ9Xg8LDuR0oz+KSkBrU+LuEs3EOXFdJwwbBLecOv1gjyxVCcHQ3Uc5/4URyPyzzKs+yNXJCVYGHmrU9ZtdRP5GII0EmVCx6Zt6tsDB9iKqS6jYp/mn40gwImZfb7sjfzG7FUYoMg+b3BiBdYei0W+NZS4HR8UkppVlH/IkQTpxO2x38w3NVb16K7GXrnWUhdOhj0og5tC0zsU5DyHfQ3XyAGHorzXjbdptM5/hCS6ZJil6gOT5NtCrk7HbzXweCtkkPN5/vSuS77Tg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f36acdce-ed65-4270-a64c-103de414eacd@suse.com>
Date: Thu, 23 Nov 2023 09:39:09 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/ACPI: constify acpi_enter_sleep argument
Content-Language: en-US
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <20231122170142.15038-1-frediano.ziglio@cloud.com>
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
In-Reply-To: <20231122170142.15038-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0316.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PR3PR04MB7259:EE_
X-MS-Office365-Filtering-Correlation-Id: bfbaa2aa-9339-484c-d71f-08dbebffaab1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7FVsFt4HoBGpWCDWszXjBZ4TsO8+uyTAMdwIZpugCT/1vi2pWY5BAQXzhuEczfgNwj9SWQ2vj9kTNDP/R/LQXPJe4zm0Dwa5V9bY5SEqQ3uuxaeMR+cWQrsQaL3zMVIQw2YslO7beZgzxG5KjyAQUP0lNyK9OXFIcbPVPv+FpFNOKG1BlhNV+C2lguIHzDgT+Kok0u2xNGaSX0Nc5G6Qff/kb1nl6XjVyqiYRlKAj9it8pY6Lj/NhpmW1dZBjmm77NEWjl/ydbKqfoslmxmS0WlBPGlNWkmiY/4sFvV/akbLMvINqcp64hZYf262WU440SW2iiqgwU3NuReu0Hotyg8LmdsV4N9sore/22kE64AcWVMvYzL9D9yky5f7jaJMIq9v4mU3k3vzawufNLGkXfqbXRl8rxwx35nDrtkEN7AE+dpqs4sptUAIatEW4QuP7nw59TumDEbx1DXj4HbajLyN70Ij9a1K63u+fd1YG7infMlFh9BXrakl7tqChQj2FQE6W58zE8d2EyrI06GVEJSWkbDpp5F9O5sYkbwxtVqS5cKc+3dgOWJov4uV627kQgjCMuANHXpCN39uxqoadsTiI4yTLnanzimywJiUpcDbB7o1ns0k+K+6CxknOyyQJVGJpXJkOhJOQ/k2tGMpRg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(136003)(376002)(396003)(346002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(31686004)(2616005)(26005)(6512007)(31696002)(36756003)(86362001)(558084003)(38100700002)(478600001)(5660300002)(2906002)(53546011)(6506007)(6916009)(8676002)(54906003)(316002)(66556008)(66476007)(4326008)(66946007)(8936002)(6486002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWFVSmRjUnZBQ1BBa2xTMGxGRmx0bGVyaHVLQjRzNmtWUDM3TVcvL3pTc2w1?=
 =?utf-8?B?T0hoeFY2YUUwTDJGTWtvYkcrK2RqL2ZDOXVQaTYrSFJZeDhZczV5VWFrS1Nv?=
 =?utf-8?B?OEZWQVVhSW9OOTVHYTFTUWRmb0swekg2aGlNT09QSU8xQ3BVTnpXQVJvZ1No?=
 =?utf-8?B?Qk1xQ1BxdjJDeUNiU2tVZXFKYzVaUnZFNjcxRWVkbmM1YXM4aTJMVVdFNlNs?=
 =?utf-8?B?RVM2andETnhnN3JPL0dzbmczckQ5Z2tXYzZBZjcwZFZKZ3VidklkOHN5T3VG?=
 =?utf-8?B?K3VLUmhuS0M1QkFOR25xUkM3RFlOcEJoYU5qOXBPVHJDcjh3WEVpbmRnZDYy?=
 =?utf-8?B?Y3JzL1pXeENpTkI2bFJYdC9taEo0ZDhaRktKbVkzeFVOZ3pjckpXTUJsS1lK?=
 =?utf-8?B?REFqdkFBUnJFRGdNZFQ2QzIwTXlXZjNsRnBudjlPOWZ5MEprZm9OTExpZUtF?=
 =?utf-8?B?ZDYvNDY4YVpvVGdHSGEzektHWXloMGRpc0FYZmxsLzYwMUI4SG5odGdQRlJt?=
 =?utf-8?B?S3BhTjlOS1hGVkExdldEcTQ5cGdTSzZlblEzUDBMYXpOZ2RDRVJHanV6dGhK?=
 =?utf-8?B?dHZ2RUJQRlJvSGRrWkJSMWZDQlIvdkM3T0NuRlNxT0pIc240Zk10Sk9adWZa?=
 =?utf-8?B?SEFsNHN5dVBzejlkWUg1SFZNc0dNR3BFSUUvc1NHVExZcm1xMEFpdlV6YzJj?=
 =?utf-8?B?V0l4MkgybmRBbXRjZzhjeFY3STJlZzl6VkVlQXFUSzl4MUJ0eTM5Qm4rUncr?=
 =?utf-8?B?aXZlWDRaTkJaUUlYYndrRmxDeWUxSmZXQTVyZERqYklrbXhLYXJsaEdadk50?=
 =?utf-8?B?N1hSTG1ESDdYbmlxM2l0Rkx0eERjQXgzS0pHWFhPdFZqUnFLWHBzZnFwaVFW?=
 =?utf-8?B?VDRoVUxUOGRLa3FoelpRRlkxR1krRWxpLzN2VDlDMlAzOUxDd3h5Z0JDdDNL?=
 =?utf-8?B?TlRCbEZ0THdXZWMzdzBSN2hGSjRnWEpjaDBRZWFSM2VBSTBkMEFML0pYSUJ4?=
 =?utf-8?B?bXVCNGZGRGE1Qk9yczJmK2hvK2R0ZmFTWHRNZmFvWEFHQlI0clFxNTVxK1RL?=
 =?utf-8?B?QUFxcXNFVmhWdjY2SXZPbWtWMVZVVllrTWlNcTAwb3ZVTnZsamlhaVc1d3V1?=
 =?utf-8?B?S0JLaXR2YzBFUXJMbk1KaVZsRFB3SXVKdklxSFdLcFoyUWZCVVg2OXFLOUg4?=
 =?utf-8?B?YVhYcEtLQmNzb3VZbjNOOTFZbkttR1NpT25Ka3dqUFJQTlQxNGxRVGNOMllq?=
 =?utf-8?B?WExJcFZJLzEwRW9IOEFjYTVyWHZEejBrczlsRnBuelRxY2hQbXNkS0VBV0E2?=
 =?utf-8?B?eWppa3ExbE51OWJWeGFJT3IxWjBqS1dvc2xFNlNySzVRVU11d1lkZndjNC9m?=
 =?utf-8?B?Q0pMZ2tCVHVaTFYxSzVyWGlhck9CMGVTUW5ZWDNIY3NkNk5iMTZXL1VOV1BW?=
 =?utf-8?B?Y0JUZWhld3BmVzNmVDZNdTQ0MEl2WUpxUVdId1F3WTVRMmtCODZYWWxlUU9S?=
 =?utf-8?B?ak9ydExQTGU2ZkMzMVo3QzR0L0xPamV3aHgxaWJUV0VRbnl6SEM2cFRHK2hW?=
 =?utf-8?B?dWZlNVh0RVdJUWpCMXQwUllpMkZhWEh0dERqRGM1K2hUNlBzalIyY2x4dFp4?=
 =?utf-8?B?ZXhybU16ZVllaGFUb0JJZGRrWU1sQzMzUVFGVno0MW5kc3I1TFRwcWN6dkNG?=
 =?utf-8?B?RFJXTHU2a2YrUE03SUJRTGNYTW5oS2NidUFNU3ZxKzZpOWR3dFFUcXJOTXFu?=
 =?utf-8?B?UmQ3bXpSTmVHTDlZYnhId1h0YmVrMkhZQ1VWdFFjS2lhYjdPWkdXZkcwTWRi?=
 =?utf-8?B?czRRSWk1TVZjU3hFc1EzckNNSlFiRWdqRmNaZUJtYnpXT0xPTHV2dXQxZ3c4?=
 =?utf-8?B?RlJSNTZkR1FpWHYyNUdkVDJjUFp0M293VlhBNUcra1M0a2tvcWNmZjZOYXF0?=
 =?utf-8?B?eC84RUN2Q0RFcER3V0YyQkZGQ3crb1dNR2JhTEk0d3lEMzZhWERnRlZ6RnM0?=
 =?utf-8?B?TnVDQnA0c1oyMjd6ZlJCajFuc1lXVWxMeERQZFB4amwzNGsxd2ljOTJsRnNo?=
 =?utf-8?B?SEJRNmh3U08zSlNEaHBYQjhrZGFaMm5UZmhPWjRmZXpha2JxTXVlOTVFTmVY?=
 =?utf-8?Q?FuvtVhO1sqxSZXBoIUckoidRL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfbaa2aa-9339-484c-d71f-08dbebffaab1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2023 08:39:11.7051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GAtCcDpI1dXG8hp8d8zCz7/K1EffeFaqZKOGNsPwakIThWQYLw6yjORhObUL/5zz5KiV2vXt5avcF783gI7Kdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7259

On 22.11.2023 18:01, Frediano Ziglio wrote:
> Minor style change, structure is not changed.
> No functional change.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



