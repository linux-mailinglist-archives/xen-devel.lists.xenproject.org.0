Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A0D7F189D
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 17:27:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637115.992851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r577P-0000Eh-VO; Mon, 20 Nov 2023 16:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637115.992851; Mon, 20 Nov 2023 16:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r577P-0000CO-Sp; Mon, 20 Nov 2023 16:27:27 +0000
Received: by outflank-mailman (input) for mailman id 637115;
 Mon, 20 Nov 2023 16:27:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9+lD=HB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r577O-0000CH-CR
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 16:27:26 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20617.outbound.protection.outlook.com
 [2a01:111:f400:fe13::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af69c1f3-87c1-11ee-9b0e-b553b5be7939;
 Mon, 20 Nov 2023 17:27:23 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB6914.eurprd04.prod.outlook.com (2603:10a6:208:189::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.16; Mon, 20 Nov
 2023 16:27:21 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.015; Mon, 20 Nov 2023
 16:27:21 +0000
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
X-Inumbo-ID: af69c1f3-87c1-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gHuwbbVJqkpwOxts1TDgvWaelQZ837ffXVhAAnGMKsxVnB4SqyaeLT6r5yVTF+k2ANCJ1fpJzPTm7EjJAT4r2GnJ8qTJCgdAmyedFxhTrL/jQtw/NPGy6wIhPidVjegix0LRi1gymV4tH6MA3B3Lc2k6m5vuWoAaj7xbeCBQns1N1DMn/QntRVnjkhvNUgM3AGFgoPjlZJJTKA4HSZvR7DxefbiuLhZdW5Q2nfDfUY68WecEnri/yWJsIsyl+btNuYiDIqP151lkphSR6cDPClbpgFfXBdUdhEieRFmO3cBAad4pGhiLK0r1NC14UIZof4Xx0U1PmMD7L91ZtK5GLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3PuD6t478LnefpI4PWpfa49iePoWbMixPjMlyIbMqVU=;
 b=I5iVaQLMMIKUy/FhvSY6wJxJWFnn4r5PRdoUxCx7FdWCxIpmpxqkBaZKxSCNMW/0YawUJwCkpvyfInVDZJY1GB/BPp3TiavurWCQfwF6hV7MMhYzxTcMj2z3gJmZTX/AF7YxOSosIZsK32/fprGYusTfKGGNuffsu2FB+UtXHJgOwLUTnRDSCekO631dbTEggY8xVA0RPVWWL50xWY4SukocYL6grun9/Mjtas+Qkje84yLyxqjOkfVmsKL1aRpei3HheM9ukQJKu+DoZZ1IipKEOj4xFLqfw1NF2Oo0LHm7rV6ps5K3854ecd+UFhigxgHTSXuyl1ddiDrdEqsHqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3PuD6t478LnefpI4PWpfa49iePoWbMixPjMlyIbMqVU=;
 b=0VO61em4TxFGdwY+2G5fn/QZ/2AvMdlSYhN+4hNTW7TXfYErqnwyWmGZxoQjTHr2oB/BkHyPYt76plDL5M91uO27zPvZysmvw2B9obToTkrAFmDpliYxvO3w+o+tgASmbOjgEG9r5mERDrqv5UY0h12yjyK207MAD8L/7TShqmjQIfVR0z70jF5lulwbcSwovrl/73bs4FGh6m5AJUIDySNciUcm1ckJvrsPSGUIhtLadvfKdcvykrng6XgwMp5qantX1N1idDnU5OcunwG8iurjvzFRPfxWyxRv/zs873BxRgKIw60bDAnXmSWSoE2FMB+81KqJS8X98EQ6at1IOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f39f60d0-6590-441f-ab08-f94e284d107f@suse.com>
Date: Mon, 20 Nov 2023 17:27:19 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] amd-vi: use the same IOMMU page table levels for PV
 and HVM
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20231117094749.81091-1-roger.pau@citrix.com>
 <20231117094749.81091-2-roger.pau@citrix.com>
 <e90d416e-f4dd-4b2c-9247-0e3aa35c26d9@citrix.com>
 <0392fe23-7589-4dc2-b664-1e7e01c3914d@suse.com>
 <ZVs0fvUQI9C7NRc5@macbook.local>
 <f414730f-307d-4ef6-9aaa-a861925fdab4@suse.com>
 <ZVs52elOtWbTaD0i@macbook.local>
 <a857c016-7cc7-48ed-968a-8a9f2748c8d3@suse.com>
 <ZVtKrKTyGli-Uj9H@macbook.local>
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
In-Reply-To: <ZVtKrKTyGli-Uj9H@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0203.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB6914:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a18efc3-9818-41ee-9a8a-08dbe9e59238
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ld1psl8H0J5rO00eetzKwd3WOB9NRzHjCO2n0C7P2yn1sF5UqTQKVKy+R427QHSsXPD8pY+PWe1MzqTLTsjpwon/aPLWdxqXWkytXYnJRwbAi5bqN3ruYmGlywsR1IxEcs9kC/DqPL59vIcJCYaI0z5gq+7i492hbYmWUD58TJY4yGnWU1FMzOKFydd+xbzb5xVuTBJ/Hom995JKc2Lf/biGzCOrWR0d4ptxwtuje5RGBLjn0tpY/KnrtvDzxly4LHFR97PRrPQLXkRNEU8dTjy11q4Y2eN6guygbEXxNqCy4MUnwffu91yV2oHf/N6GOqV/l3yM0fm5iFXO4QlLSk3dWLwj0NOTPfuX+cz7un+XQgDqeUKMqsmGRetdoKekIDZYD53q91FD3Osh9jKA42n36n8z0XxIELxD5m7VrtxdRdOjgLPXvktwvNI3heUxAqrVR3Ux+aStVes8XkcgCI0QIO6fSZqW9URm+YIvHOGDwodUIDJcYQ5+zYBfUdgat7zkLVkDHBERbbSz0H9RYU9kdu/8tMQwBgs9OsJRf/Shts3fTK994xaRWxhR65TPtblFkeJHbz9seP6hjB2Yakqg9np/giG8VT+vlScESk+WUUNJjUTKoGl9P7LFhv/+FOaw6L603vUfwxLAP2ATRA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(136003)(396003)(376002)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(5660300002)(2906002)(26005)(2616005)(4326008)(8676002)(8936002)(31696002)(41300700001)(86362001)(83380400001)(36756003)(66946007)(53546011)(66556008)(66476007)(6506007)(6916009)(316002)(478600001)(6486002)(6512007)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWpnelNUejh0TTJwLzZYNnlaR2hIQmZaSlRIS1JYaFJ2dWNFUGFDTWFWNkgv?=
 =?utf-8?B?UUlnSi9wV0FOVjJ5eEVoZXlZWURPWHhkWFUzUE9OMklWOG9NeDlmV0tTSkU1?=
 =?utf-8?B?RHpnL1dFSmVvV2dadUFhZmQwMXlEM0Y3Z25RVWREeEU3aXNzb3VJTXIzbDlm?=
 =?utf-8?B?ZThpSGlCRkVaOG5RY3VabnZxeGRFTlBXcXF3cFB4Q09kR1N2REFMbXN5ZmpE?=
 =?utf-8?B?TVhES1FzQXRmT0szZ1RuREhMRzc2MThoVGxQUVhDelFEdEFBTXdTWHIwcDR6?=
 =?utf-8?B?NVJRNE5sMDV0SG15QVlwUzBrTmZyUVk4ekdyamJjZzdFeWQxMGQ0bUFtMW5Y?=
 =?utf-8?B?QlFDcGx5M0E4T3lSNGRMMzJmVGpNYnU0ZHlDdUVNV0dQMjlRYXBpZkpKVVRL?=
 =?utf-8?B?RWVyTkg1U3dQVTQ1aXU4NG92MzliYTZxbkJzZzk4bGFROEtaTVUxVWEyMWJU?=
 =?utf-8?B?VjlRMEtSMmd5MU9UbDQwSjVVTndhYnJQYStGSXBRZFZWUXRwWi9mejBremx1?=
 =?utf-8?B?dDR3NEF3d1JibzVzZ2RMNTJsUTB6NE1qR0ZnaUpZcmNJTXdocmdESFo4V2Z3?=
 =?utf-8?B?S0Jod0E1aHdwclp6eXVPVDl5c0d3dzFWeTR5UWhkbkcxTGlwQVU3VVFoOURV?=
 =?utf-8?B?Y1FhZHZZWGpUQWs2ZmJpNDZDQnovY25MMFpkTnJ1QkZucFJ6cmtuWThzKzM5?=
 =?utf-8?B?cWIrS1NBaWFWb3o4M29ETGl4elJLZ0JIYU5MeDg5TzVXRzZza0xGSnA3ZGRn?=
 =?utf-8?B?QXVrZnErOGsrNXlvTkRBWkhUUC8ydlJGanpEUU1GZmg5amtqY2FwWCt4ekxv?=
 =?utf-8?B?T05IQXAzSjlFVHU4bGdKVEhJZFpTSTlQcE4yUmhlUUE4bkhwK1A4R3lLQlB2?=
 =?utf-8?B?b0lQL2FwUXhGa3BpN3dCaHVqbWJZNkIzVlhMeCtsQWd5U3VnbGlmRGJvQnhj?=
 =?utf-8?B?QzlINDI5N0FIR1U3UHJTVlpmcTBWbFdKQnRtdnZFZHl5QWVYb2RQdDk2SCtN?=
 =?utf-8?B?Yzd5R29maFJ1OGVwcm5tNEM0MG9jSFNDUWZWNFZRdUo1SnVTMXJGZGdGQzNO?=
 =?utf-8?B?YTQrTE1rWWc4TjNqZW5BNFpGZWhBNHJNK1FCMWt3WmFTSHVTZjdOcDdxVU90?=
 =?utf-8?B?ZFNjMlVpREViSmNtdEgwYVJlaXZkSXRiT2FzVW03RmRYbXl6WVkydlRwN1lk?=
 =?utf-8?B?S0pUTUZLV29obXdMNUhwS01FaVYrQjQxaFhtMysyclNxMzZHcUxPY01DRFlT?=
 =?utf-8?B?RWRVV2s3NnFldEhmSXZ3NlR6WDVCMkhjR3kyc2NFUWxoVEVXZHA5aXNIZWlJ?=
 =?utf-8?B?N0ZFSnVDTDUxZVNqVW5hQ3cvVGg4eFlRVU8rTnNobHJ3UEVIZDBYcm8za2Fl?=
 =?utf-8?B?eU44VnBJYXVNQmpuOGFMUEhNTjIvYUxlbGxONmM3a2hUVUxxSFNIUFB3OWUz?=
 =?utf-8?B?Y01lRDh6SWNNOGZnQk04cWwwY0lRSUlaTVNTUmhacmRzZkxqWjVJMWZlbmpN?=
 =?utf-8?B?S3NmTDcxUkI4d0NTVGF4SVpPM2dFWjNIbUwxbkVYTTJiSkpjc3BHeEVMMUsv?=
 =?utf-8?B?OXV1Sm1jNUc5ZVQ0S0Q1QllYRUVaUkt4cVQ3OFE3RXlHdDhVWGhSRjI0Skxs?=
 =?utf-8?B?QU1vVUoxbGh6L0VnOXJBY1BkN1lUNjhNb04vVE11UHB5SFhqazJ3azgzTzBV?=
 =?utf-8?B?V0g1QlBRNU9kT2ZtcWV4ajYvYWtMaFNsUkhBVTlSVDdiK2FRY3RFWDhBTnhn?=
 =?utf-8?B?UDBVVjJQaklaZGhsQkNFeDdSZmNhM0pVRUkzUlBpelZUVlNwbXllNjMwNXpl?=
 =?utf-8?B?bjRBTklsaGdtU2JxMFZXNmp0ZlM5eXpNcVJxUmFuZ2pCcEdkc3VITEtWS0ZP?=
 =?utf-8?B?Yk1UOVJ1RzhJS05BdFZvMXMyQlpNbDgxOVlOeEJrUmFsWDhySUQ5TUZCVGs0?=
 =?utf-8?B?bitUdjJNQVN2bFQvM05SY3RaMEJOOGpWQXVMY211cXoyVWRYYzJJaTRENnE4?=
 =?utf-8?B?bFJiM1J0ZU5MdGJ0SW1hL09UaUt1SUpvelpVWCtNa0dWcjVSRG5RL1NsM0NL?=
 =?utf-8?B?dlFISzIzWnVSK3ZQejNHSmdqTzlPR2hLKzhRalZ3dmdFQStFVzYxWFhtd0Zm?=
 =?utf-8?Q?U+b8UmbKn69HVm/qjmPP+O8wF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a18efc3-9818-41ee-9a8a-08dbe9e59238
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 16:27:21.4601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QGgrBz1hWUhCfObr0mLpacivbiI6PPRotD1IVL+DuOmhCB9+ttgC7xnlpVoCVISv3qZA4pmUw03MQlSWPuQT+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6914

On 20.11.2023 13:01, Roger Pau Monné wrote:
> On Mon, Nov 20, 2023 at 12:34:45PM +0100, Jan Beulich wrote:
>> Yet still this would then feel like an issue with the last patch alone,
>> which the change here is merely avoiding (without this being a strict
>> prereq). Instead I'd expect us to use 4 levels whenever there are any
>> kind of regions (reserved or not) above 512G. Without disallowing use
>> of 3 levels on other (smaller) systems.
> 
> While reserved regions are the ones that made me realize about this
> IOMMU page table difference, what about device MMIO regions?
> 
> There's no limitation that avoids MMIO regions from living past the
> last RAM address, and possibly above the 512GB mark.
> 
> If anything for PV we should limit page table levels based on the
> supported paddr bits reported by the CPU, but limiting it based on the
> memory map seems plain bogus.

Right, matches what we were discussing (really it's the paddr_bits reported
to the domain, but I guess we have little reason to alter the host value
especially for Dom0).

Jan

