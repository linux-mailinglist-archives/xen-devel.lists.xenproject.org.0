Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5ED802C8F
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 08:58:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646553.1008925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA3qn-000216-JD; Mon, 04 Dec 2023 07:58:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646553.1008925; Mon, 04 Dec 2023 07:58:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA3qn-0001ya-Eg; Mon, 04 Dec 2023 07:58:45 +0000
Received: by outflank-mailman (input) for mailman id 646553;
 Mon, 04 Dec 2023 07:58:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CG6/=HP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1rA3ql-0001xx-Eb
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 07:58:43 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20615.outbound.protection.outlook.com
 [2a01:111:f400:fe13::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f11b3abf-927a-11ee-98e5-6d05b1d4d9a1;
 Mon, 04 Dec 2023 08:58:42 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS5PR04MB10057.eurprd04.prod.outlook.com (2603:10a6:20b:67d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.22; Mon, 4 Dec
 2023 07:58:40 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.022; Mon, 4 Dec 2023
 07:58:40 +0000
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
X-Inumbo-ID: f11b3abf-927a-11ee-98e5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Guidt3QgCbuPbRccqYKbh5Sf2Gz3B8fZqDqMv01lIe7El/twqsn3G9egFGdR9UO0ruDpspB/GEWB1s8LYrxdwGmhUU4iAnWCwAzHM4xpNpqqLnSOPJC+4zWC49uHBjqxA12RlYhbFgSQOwYKeF2nUvHOne2mhFaUvzMQqwRIVqR0Vf7I1ZJhk89yMaVdYqIFRIUAynQ9t+qdsR1C74rBpuSVpN4Fzebd1QeuhsQxrXBVnOcux1AbPOTZqXu+Hi65b6nAzLZjOZYKG3EsKpVeFI4YLHS2kkuCV9czwoiH7JtOkpLTRO1WvpalIgnqnsLFbABTLrgbsa6e/3SPJXMkzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5vtBNs0Kaad3Dox45FGtoU5lTHhPYn1mJCWtAJpDAOA=;
 b=YPkBLcEUUzNVmCX0uI0JobGpy4Cj+eEVYtIpAMGpR68g4izUtYBBRRf0d7smXBqQydxIBnoozIAjPwYIhx9L6nC6zSkzZB9tPA0aG5tPKl4eFmCPqVELXDgCoPcG7FK4Z2WPBL67M/rnLeRCeiYxVhO26c+uMt5MUB9LnDdha/lCg9YTSG+dOr0b4GvZo9IQg1ru0kGyfR1zSn1cy5uX0fspwWLP6Eb24g//HFkeUn4UUI4xWV/p4NduRjof+usn6Evr4iL09txYZs4bOBvoEUQRKu3i4HX7oY3oGPb50lNxsRy9ddwVjvS3IEagVm0wZQ7zhrIhuY0szmle6FN0CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5vtBNs0Kaad3Dox45FGtoU5lTHhPYn1mJCWtAJpDAOA=;
 b=16QziX3/aGAvBM+7ytl5FMDpDP4BpMvPCHuyBNpPNcyVI9XLnANuhQzx0B4hz+MNsczPrDWX6PZtXgRpS0hwGEWiiiODTFG12TTAKzzwQlfAVtcnUYKzTRY24O0J/uYN9+rjiKPeM/2WrKdFt6YUIAVtGPBKiMLzF9NO8a6XmG4P3V9pH3AegzGTv3FsPFglinKSnnhHad4cR1J/dDRrvXyqAnQgoLcW/nALDxIXfBmKThylTDUDUgYPM3kiIkIyiA9VaBjZ6Uyjwms2TndxFrITXizAog3zK3FeDsAlBee+Rp3JCQgf4qXfcwdnduWodi2YHYLCZhgr3cj6iZQ4ng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <be3936a2-22e6-4528-90f3-a5a5629754ba@suse.com>
Date: Mon, 4 Dec 2023 08:58:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Early Boot Allocation on Power
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <cover.1701384928.git.sanastasio@raptorengineering.com>
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
In-Reply-To: <cover.1701384928.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0228.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS5PR04MB10057:EE_
X-MS-Office365-Filtering-Correlation-Id: 57e5c62b-a7df-4461-f8ce-08dbf49ed40b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tQcsaqVbnlkJrCAXDPk1HJFeyWFfNa7d8Or2hB8QzArnAvWwVrqIfrA4fLa0t9PEkO7QHfD3/KGqSD1fb3PsTkhtIX97Cifxh3VeEnvzhuSNE+nQurINjH0Oz7Ca8eKak0/ao0G5a2ynHfk5t8M8uFNZE0ZxEAop6vNUBv6o9r4g7hSoEnWkDeJ4jUeMmdGOKbW6i03krSgBfcC30ifAhoEleTcaMHaLbO8lwsnqm9RXFQY92ts90jNK6TdCnjxuz2uAovHSeQTfHENtJnuydM2xD1lt6hnVypCa4lS3uwo7ccmrPcIalJH1lrI0m/MgRLW7VI0aBgSZHnJo7iM04h5c8GqvL3mbW6xBoGHuoanwOTWiS/nsZhucSPKGM4JW3s7GlXEQmGEiTl/qnk2TvGccTABXpapPK2FXgGulr/w3cUg6jkeoVR1JYHwZyoje70LFav0MYMQExRFeapJgeTyFzbc+8XbyaA/D7OGq5aUzDbIP5Y0l/ra2KfP5dTS6qtt/JIx3RNxfKAm5b+D5x1LdYe9BqWRxBMo2yek2872Po5vnC6E/DCN1nHZSPVy5o/ZDZ4VpRhPRlZgr6PVlFBpEwtbITdfzpMxQ2ewcelPLDkXblXN4VjsHI5B0yR6INxY1GoQ9F+wVuSyQF4PCYg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(396003)(376002)(366004)(346002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(31696002)(5660300002)(86362001)(4326008)(8676002)(8936002)(2906002)(41300700001)(36756003)(2616005)(6512007)(6506007)(53546011)(83380400001)(6486002)(478600001)(26005)(38100700002)(31686004)(316002)(54906003)(6916009)(66476007)(66556008)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekIzRjArd3BvZmdiV3pydmNybnJpSnRlSld2Tm96S1VCcUF1NThNbVBTanJp?=
 =?utf-8?B?Y0FkQ3FtNm53WDVaZXI3MW02RWQrMUZTUHFoaWoweCtQQzJnSXViR0t4OG9T?=
 =?utf-8?B?aldKbW15bTUyZzVlVi9wQ3J3Y1RnMGxmL0h0QWxJZFkwZ1llaXE4emFZb0l0?=
 =?utf-8?B?L1JsYm1TbVgvYldJWHFicUtmVzUrNGNST3EzNXFNQk1zMlJPcGR5T0JsVG9x?=
 =?utf-8?B?ZHRZV01neUZHZERzSXNLT3RvMlErWkVwYWxDdWN6dmZrdCtTYWZlcXVYSXJz?=
 =?utf-8?B?T0V4OCt1SlYzR3RZaEE5SkljcTducTRDSER1SE5NZ2FTM2lXa2ZsUXpPWGxT?=
 =?utf-8?B?alhMN1VHTkFzUVdLOVNJUnVKN0EvZlpncDVJRDNUbG51ZUNKeDlrZnBRRVpv?=
 =?utf-8?B?N01WSVl5YkNwa29MTWpoYVhFblhkYVhLejZYS1BhZTBWeFo2cm1oTHJZZUN3?=
 =?utf-8?B?Y2hXMCtVY3RDR0ZEVjR5dStXTlN3TUlieExXbml1dVQrWDQ2Q0E0Q2ZpbzlX?=
 =?utf-8?B?aXRqSVprakExNlBlb0xnTCtueGlkVm0yMS8zcFRmSkxNWFFUZ0JrSVh4VUtT?=
 =?utf-8?B?alZ1VFdWUmszRXFxZnZlV3FxS1ZucFJjQ01IRGpYSmpjVW1sSlhPTm81b2Vj?=
 =?utf-8?B?V3VrTmJkNXEzQ2dHWFlyN0d0VU5sL1p2eGRzQmsrODRETnpVR2M4aDNyUVpQ?=
 =?utf-8?B?Nm9xbGVBWWRlOHFUbFRSNU9vdUNNWUdQMFlBR1FrWVhHZEsyNk9yTzNydWU1?=
 =?utf-8?B?T0ZVQW83Q1RlTFhCT0RjT1VHVzZaejVRZWlvcG5nT0tFT2dOQUhnc1RHOWJh?=
 =?utf-8?B?ZE4rWml2VE5kK1Jpb0Vnd3NkaklKRWpaY2lMeDYzK3BHUjRhT2lzOWtLcWkw?=
 =?utf-8?B?TVdyREFOcWtsc3RWSlRuRWZuMU1KNzVWdEU0ZzlydzBaTmdSM3g2Qlkzd0du?=
 =?utf-8?B?OHNFM1h5M04waHRTQnVnTHpoSDhySm5OQVkxZEdlNkNZTUxRcXo2L3MzSmlq?=
 =?utf-8?B?cEVJejFEemJiTDBwTUE4VzR3cmNMWHBSbVpmN1A4SVJOMmNKTGprU3N1N01Y?=
 =?utf-8?B?aUJNOEYvSDdxbnNycHhBQ25qM040Zy90RVpuUWFqV2IrVzZCVXcvaUJrNG5i?=
 =?utf-8?B?Z3lmbVJsdnNYNW94eTcxSU9hUHQ3UGV1VGt2SytOVk5PeXpjQ054OVgxY0RR?=
 =?utf-8?B?VnA4U2RWVTZ3RTVRdjFma0JUQUVXcGxTK3J1bllhN2MrSnQ3anU3SXVrSkhG?=
 =?utf-8?B?N2xKWkVCdERUU1JaR0hMNHAvQmJyYVI2U2VRZGE2UTlpMUZ3eHVJMkwzaHk1?=
 =?utf-8?B?SlA2T245alplbVQ2S01hZWtBZXowRERIWklCN1VUeGczY1V6NE1GQ3VzSjl1?=
 =?utf-8?B?alJTNXJvdDhqZWlodnN6QVlqV2pmUGo2SDh0TlVLbVUraFl0RGlsampFejFv?=
 =?utf-8?B?eUxIcThmbGpSakRyQVhDQS91akFGRGlyMVc4RXZOcXBEa296b0REWmV3RFNt?=
 =?utf-8?B?QWU0aXBJc0pRZ0lNdU5SMjBQZnRzWVR0RmN6dVhtUDM3VTc3Mnh5anFmWVgw?=
 =?utf-8?B?dkJGOXhMRUZ6SjJQV3JzdmZtUEY3ZlNuMUl0RXYvZ2FxcytRbUZTMUtnYTUw?=
 =?utf-8?B?U2NqL1pCcUtYZGtwNE96VzhLY3oyMllhQk4xSmJQNFJNUVM3bnM3aWtoVGZy?=
 =?utf-8?B?RURYSkpIRnExOHQ0eGpJQlcyTmZUWlE0enkwa3B5ejhmZmNFakR5TjZHcnZX?=
 =?utf-8?B?ekI2VXdhU2FZNHJIT0tCNDdwR0lqMGE4ME1qS01LRDFKemxDcjhkWFJ6WVdn?=
 =?utf-8?B?YTgyS2FFT0lsd1VjdHVpdFZhemVkU1FraEhCUEpjSFBJVFdNcWZ3cE9sbnVX?=
 =?utf-8?B?YlFHNWFpZE5CVDhqZjBuRjFtelpmYmtFdXFmRUU0MHFYMHVxUUMyc1M3U3di?=
 =?utf-8?B?emR4eXBiRnhFcGVDZWEwWTg1MytraXJuNktiZmlWd21kMTlnL1ZScVJybkpZ?=
 =?utf-8?B?czVqR2tIRGZoRFNBdjNKQmNlN3QzMkNWb2o4d1o0MndPR0E0SUlvbENUVGF6?=
 =?utf-8?B?dlA3VVFhYWcvQUx0OTdHdjNqaHAyMXNudk45UUtSZTMyV1F0N2RlUEdvY1Uy?=
 =?utf-8?Q?3quWg8y1XEzgLPHXu860cLgX9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57e5c62b-a7df-4461-f8ce-08dbf49ed40b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 07:58:40.4115
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eTUW9flH8eagL1GO6WWGnn8tmRq3QAA6WMvLHig6UitaEaKj9tMpin5N0pyDunOzlg+/BJ73SKhKXw6qQhmTBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10057

On 01.12.2023 20:59, Shawn Anastasio wrote:
> Hello all,
> 
> This series enables the Xen boot time allocator on Power by parsing
> the available memory regions from the firmware-provided device tree.
> 
> The device tree processing and bookkeeping code was adapted from Arm,
> but it was trimmed down to exclude code for parsing Arm-specific dt
> nodes.
> 
> Additionally, the final patch of the series updates the radix mmu
> code to use the newly-enabled boot allocator for the Partition and
> Process tables, instead of statically allocating them like was
> previously done. Among other things, switching to run-time allocation
> allows us to allocate a full-sized Process Table instead of the
> minimal one that was previously used to keep the Xen binary size small.
> 
> Thanks,
> 
> Shawn Anastasio (3):
>   xen/ppc: Enable Boot Allocator

A standalone patch with this title was sent earlier. What's their
interrelation?

Jan

>   xen/ppc: mm-radix: Replace debug printing code with printk
>   xen/ppc: mm-radix: Allocate Partition and Process Tables at runtime
> 
>  xen/arch/ppc/Makefile            |   1 +
>  xen/arch/ppc/bootfdt.c           | 507 +++++++++++++++++++++++++++++++
>  xen/arch/ppc/include/asm/setup.h | 113 +++++++
>  xen/arch/ppc/mm-radix.c          | 197 ++++++------
>  xen/arch/ppc/setup.c             | 109 ++++++-
>  5 files changed, 823 insertions(+), 104 deletions(-)
>  create mode 100644 xen/arch/ppc/bootfdt.c
> 
> --
> 2.30.2
> 


