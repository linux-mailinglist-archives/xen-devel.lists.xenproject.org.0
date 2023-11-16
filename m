Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B22FB7EE1C0
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 14:45:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634228.989603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3cg0-0002yV-52; Thu, 16 Nov 2023 13:45:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634228.989603; Thu, 16 Nov 2023 13:45:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3cg0-0002wS-2E; Thu, 16 Nov 2023 13:45:00 +0000
Received: by outflank-mailman (input) for mailman id 634228;
 Thu, 16 Nov 2023 13:44:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r3cfy-0002wM-7t
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 13:44:58 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060b.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53a3ee19-8486-11ee-9b0e-b553b5be7939;
 Thu, 16 Nov 2023 14:44:56 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8973.eurprd04.prod.outlook.com (2603:10a6:102:20c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.8; Thu, 16 Nov
 2023 13:44:54 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 13:44:54 +0000
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
X-Inumbo-ID: 53a3ee19-8486-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=braBt4rcoJ389L3N9K4dkqyYguDAKCN85iyarD2ebW6QpeJRDdEoarcv0kAl6ag3eqXrw/TwCMfB7gt0NXg7m7vkicPW2elVlmxMMnlSs2bgmdfl0j8gsFqlXls238Yj7k/0bsHotD08/bD3BD7jp5pie7KHh7jVq2csINYWB5oCQVUm/+bPoAX9oMVF6K/lemzCQPx6fNlw+bnX2MYMYBPlXN+loh8Hy2uBoQXIVCRAFCi0vX5k8+g8X6t9RHM7v11Y3kTpBxqj1ysIv65MJxFf5Mf/QpJbwzvx/acmZnmppz/lzvugYmJ3rIyse8J1L07xoy4SJU0DIfyJzLEOww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pnatshXM6Dw4HDxZ2mxb50luAiVIMzE4syxGe0D5+6A=;
 b=QsdbySd6DO/o9Ot1QIam2AsJI+wP8ilgmZ0GcTQCJvn5zT81W+pLeGhRsm7wEXxxgV+HiX6G3hc2e4Q2wZEcGU1CocMi0jkBPCqaMKZ73txbrz6p7hskSEqAFa+EzxLBaK634z/FqmDLYo5Ah8Ex9N7VejlyweeS9iNcHAGGijHdGQ+liUVNrGYJqFha2dx4riF2StIiUlxk2uRZ1bWG0S4bOt4YCqd9ZdRZIqOycqRx3/4sQKOeCk5FGrf0Y1g1RU+y1pxb5PkqJ7/1QA7OLZksAl1IpjnWwCcYNmePUCTTNuySE+8FqW9ySsadSKRsrkTUzPOmnT0grFi/lHLH3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pnatshXM6Dw4HDxZ2mxb50luAiVIMzE4syxGe0D5+6A=;
 b=0CEmX5DdtEoSm9K5ojoih2BIQ4QKO4ZiuYUz5/QTq5QdaZ00Ao/o3drq271sx7xvYVTufHbHrsrh3B4utk1ID3Llcjv3SUQPf5vOKhEB5SG3kbS0ulLo1RrMwIEC4fpXh3uKRos2MWOE29O7iqK3pmvzrxn+S8brBVBeF/2tB2fJ7aus6WhFDsjeDIf8pwBF9yhAgkQaUA25uVnsHye+GnH6Iojjw5GnA2dNhaXFgiSbV8WqGQ5WHw7XEAAoxsBj2LHDAFm2HPt3VHWFit0Yhd7RlT8kme8dVLmp5+W0WsSvGCOMSSXM8ocSbJkcL/fLdo03roGF16u5C0IbumC0Zg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <08e0708c-17e2-4a5e-aaf7-5f60a40f76db@suse.com>
Date: Thu, 16 Nov 2023 14:44:51 +0100
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/5] x86/HVM: load state checking
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8973:EE_
X-MS-Office365-Filtering-Correlation-Id: c86e67dd-7297-424a-135f-08dbe6aa369c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T8ZSBie66SzVugedGMKajRk+zE9pOlr+sYnQKWnXfpTD24/CR72WCjQfcHU4lw0312q9dCLnrF6OccmgH7EqV4B3hf7MJguTK/+PFm1gZTIz5xZGGEd1rWYpaAjkMbE490toBf4D70wPxJPLH7Xd+OUjzYLtSa/oeOOmq9XreCLpWI4p6go18SbVpwqohLByANp+S2gufUjhFFAD1qb4g3FBfGsKWAA4yK53DbJiLbB7de6m2O/t54rvRtjQhtIS+LO99sd14+Oq2gL+MZP8YNWE79PHIyPvG3zE1cNzXpmXcDLcWjj6/tKBkov+F9gEg1t1va9DymFhXvR5Z4g3YChIV7v21UxruC+oC7F6Gv9HoD2RKxBfNfANLuRoKE8eYXgjPc4hE8zwj6O+Es0QiOgNq2fd3UQh9k66BdcZ8z4ustZWeQC+vBGbiITx0XUe1dipx6eF6ks88KeDAd2bsVYFnWDrAsShzTHw4wkXkSTSc4oJfVu2pIa+Ke8AW2FRIBXKzkfMDeMcIBGsSooCKvJxzc+RZOwaYzMsgAJD89IKMRjsq3e75Gv5VeWFfNshGneTG62tF005Xsv2iUx4M+NQJF9zpPiTxMmmPCThi8EAvSSG09l2aZBrn5pw5J3zlgLM1dez5Wg2HPt7GpdJ7w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(39860400002)(366004)(396003)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(4744005)(38100700002)(5660300002)(2906002)(31696002)(8676002)(4326008)(86362001)(8936002)(41300700001)(31686004)(6916009)(2616005)(316002)(54906003)(66556008)(66946007)(66476007)(478600001)(83380400001)(26005)(6486002)(36756003)(6506007)(6666004)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eWIxdmNkRnNraFNRZmlLbXJ0M3VuM2hObTJjREpLOWxOQkdyTFlnMHlGdUtK?=
 =?utf-8?B?ejkwWTZiOVhWdXNXay9WTy9uRm01L3dlenFkZmEvcUtuOHpNWWJaK0EyRnJo?=
 =?utf-8?B?dEdYc013bjluOVdaUDNmRmcxYUNselJJUS9hdWtqcXp4WHA5OU9UL2IvaFVa?=
 =?utf-8?B?MVFFRy9teDVlTUxUZmI1V3ZYeDg4T0t6TnA1MkpKZ2lYU1M4U2FENG0ra1VK?=
 =?utf-8?B?OERFUWVBVk4xQUhqWFIzbDVnVFBhZDhGRklwcnl6ZFJLb1lRNnBTRE5oKzhK?=
 =?utf-8?B?TEN3OXFHOHN1eEFlRDdCYllJbk9OdlJqNkJmTUthaElqVTBlWGpVbjJadDZt?=
 =?utf-8?B?NUdTa3ppMHlhSUsrRjNZQXEwVDZaeStpbXpTWXA2RWx0NGFtaWdXM3ovR0Va?=
 =?utf-8?B?YXBkS2FjQmRCUGlPcms4d3V3d3ROMFAvNi9VUE53dTVrL09zbmVCRDU2SVJ5?=
 =?utf-8?B?T2g0eDFhU3pIbUQ0WHhiTW5KZCttcVFqU250aGZrWnB3NHVpYitVSXRKUVI0?=
 =?utf-8?B?NUthQmVPVUlSUVIzWEJyNHdjNVpTOGdoNnk1YVJETW9YMG1MRGRuTlRDTzNP?=
 =?utf-8?B?MHR6NWhLZFZ2TCt1cGRtVUF5cS8xZzZLUHA0QWo1QUkwUE55L0FVUnhWYU5L?=
 =?utf-8?B?MWlMT0J2WUxBMUZ1T3psSjQ5ZVhDSnF6YkIvMWk2SlRITzF3eHFGMjFvNTBz?=
 =?utf-8?B?cUdMMnErYk5iaW5NSldFcHVTVmdUVmwyalIzazBpc2JUUm85cngvbDdvOTM1?=
 =?utf-8?B?dFVMSjZhSFJUY3o5U24rQ0hOZDY4akhzSzlsRWhLeUkxWUFBd054UG1tOHBq?=
 =?utf-8?B?K2l0eDM5ODZpNU5ycFhsMSs5SGVGNzZ2N0NtbHJnQm9aSkZDV2Z0dUtCMjNZ?=
 =?utf-8?B?dEplcTZMaUc3MUFPbERwWUNrWm5DTE5FbUlObG1KWHVmbnVRSHE5SmNiaW9T?=
 =?utf-8?B?bzRETmczQ09PUjFrVlAzdWZoUzVpK2kwWWErb0IyaWtmR0pLVEdXMlpISTlR?=
 =?utf-8?B?ZlJSRFVjV1BjT09lTU5nVk5OdXhWWTNoUEFPemFBUi8zWlBVNkg4aWZWUXFo?=
 =?utf-8?B?MW13SkpFNE5oM2RIcHNKSWhYN2JHdGppc0VselVvbFZjaTA2bFRhNjl4d0lF?=
 =?utf-8?B?ZzlxMENQWElMQnd3TWxjNTEwVFliQnMyMjVTejNzQUYxKy9wbUVhbzMzM3RK?=
 =?utf-8?B?YWFTK3V3Q2s3Q1RBUlp3eVN4M1FRK1FmejBkd3hMWlpsS25XNHF3Z0x3L1pR?=
 =?utf-8?B?RVhmRVFUZVRPbnhrRDVGQmo3REtZY1p4Nnd1NmZXR1JPNDdSY1J2NWRSVkp1?=
 =?utf-8?B?V0hQbTAzSW5iU1hqVGFYVWFoMmZWODcyN3UrSy9OcEZ2cFR2bzE0ZFBVN3VR?=
 =?utf-8?B?VHJIU0xxUjRoRDBVbkZ0RFF4QW41WGVXQ3dNaHVsaGV0Mkpud0h1RlZLbkNM?=
 =?utf-8?B?ZjVnOERlWnBBR1VuejQ1QUxNenZoL04zREV3YmZrTi9zd2ZyaXpYVkVvTkw4?=
 =?utf-8?B?TWhnaG82MFVqSCttVVVhOGhlWTFJbkltVVN5VitKd1dNVDFiQ1ltN05XQy8x?=
 =?utf-8?B?Wm82N1JGcTFvaDQ0QWwrSWd3TXVUb3hTTmxTMzZ6TERrbzVjMXNBTmtMTkFI?=
 =?utf-8?B?NjVaYlJ5alZCN3U0eGlUaENtWXV5UHlBeHRWR3laQngrMEorT2pQbHNKQnlN?=
 =?utf-8?B?SXpuVGwxSjVYL2FhUCtzUTBpVW5xV1dHdU9pTldBbWZsc01oYlU0UjNBbHFK?=
 =?utf-8?B?NWN6TlpCcy9YaHUvVjhNZ3FWZHBNYmZJSjhDMk1xUm1YOHFFbXZqMnNVbTla?=
 =?utf-8?B?S3Jia1NrcHZyQVRiVC9XOEs1OGhFTS8rai9wTGlUUDlwdDM2QXlzZW5SbEhE?=
 =?utf-8?B?YlJsMW4rK2YwZmZJY3BZbWo4RmhmcnJ2L08zNUtWSDI0LzZBMVZabWdiVWdB?=
 =?utf-8?B?dWNWcE5FSGpoWUQyVzBJS2V1N0ZrL21zU21OTUhFdExHNkhrbCtoKzhUTWZY?=
 =?utf-8?B?RG9Rb013RlJFbE4zbWRCQ3N4dTczNlZ5TTdlVFRlRVVrblppOXduTkdRUExQ?=
 =?utf-8?B?QUhWVWZ1UXRBWjMvQlhLZGJjbjJGMjRack9YbyttRkZyNDVKK2Q1WlRpbHJp?=
 =?utf-8?Q?oAWZkMenHlkzydcRpv7bgucnS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c86e67dd-7297-424a-135f-08dbe6aa369c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 13:44:54.0724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: afsaIgt5fHocpo2l/VluA5xghQ/JtPgcjgIFscGstQ/IYzdaDDdhO1JRupRNml0lV+z6LZkV4QwRgs/LIv9pcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8973

With the request to convert bounding to actual refusal, and then
doing so in new hooks, the two previously separate patches now
need to be in a series, with infrastructure work done first.
Clearly the checking in other load handlers could (and likely
wants to be) moved to separate check handlers as well, down the
road.

1: HVM: introduce hvm_point_entry()
2: HVM: split restore state checking from state loading
3: HVM: adjust save/restore hook registration for optional check handler
4: vPIT: check values loaded from state save record
5: vPIC: check values loaded from state save record

Jan

