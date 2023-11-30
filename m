Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BB97FEA70
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 09:25:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644443.1005437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8cLb-0006GC-Jq; Thu, 30 Nov 2023 08:24:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644443.1005437; Thu, 30 Nov 2023 08:24:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8cLb-0006EE-H9; Thu, 30 Nov 2023 08:24:35 +0000
Received: by outflank-mailman (input) for mailman id 644443;
 Thu, 30 Nov 2023 08:24:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BG3/=HL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r8cLZ-0006E8-Ol
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 08:24:33 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2060c.outbound.protection.outlook.com
 [2a01:111:f400:fe12::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e304b1c4-8f59-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 09:24:32 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8896.eurprd04.prod.outlook.com (2603:10a6:102:20f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Thu, 30 Nov
 2023 08:24:30 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.012; Thu, 30 Nov 2023
 08:24:29 +0000
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
X-Inumbo-ID: e304b1c4-8f59-11ee-98e4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nfJQy32KXtsr40WQ8bYKh4Fo0LtwlVifnpdREvtNV4uTH/hFkonEKHykeMSuwklOPrSmR764ZLGnB/tfXB/Llhqz91YEDwcZOignudrjdG3qXLOkhDFNXuJUwHIjeEuf+d5/F1MEGs6QH44lhNl2Zn34zuVmNsib7YffO6T6MBXUhhglSCwxOIlQbQSEnKxM5qS937i9794yT6CwHhTFT8m1LIqZZFI8U5ptZGaToxfoDeNYRqkgv1YxUzAF14CTbNjum2hMseYNWXXJnKtIt7laIwOyjGrwFwqLvbEVVNsY+bxpNazZXrc+KRbEz1q9BZ+Pn50XERqqFUaHdvM5vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+1jL6UfUo5JuIxAjehJPBzE6PntVVAu5RmhSCI5OUw0=;
 b=SjTZTav5BE7ZoU5pncY1wosxhBjp306dOrOxj/lEoyDs6/0nwzhxXkufyjaKwm9pgsUwjy24Jtw+mnSyTKq60QZfPOeZGTy35aDWXfPTS6rxKD3I4rEqWNp/OZh8CXepTLr/J4Su1qdvat6wCvRDn5oTO0AFGULorTsxZyYFuzKmSm/ykFH+fUigUdhTmOalIMam+uaAkM9dSoJxpVDbVtyFsBtLxcITokqyfrKh5nibIRNDmzb93/YGyaPNSQrci+VpTyRdF/Ofo2gxN8bxMdK92QQ3THDyU9p3pRuC+jiVwuOxMfWj75mvWJHd7xZKqSClCGnPnIEZi1EcYEjBEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+1jL6UfUo5JuIxAjehJPBzE6PntVVAu5RmhSCI5OUw0=;
 b=sB18TOQMKVBbbJHLBpwBEGX5e8XXZ4OZFkj1qynFOAaScTE6aIoV+//BcLtms7b/r66JhoBoYuOb4tiP2fNqVh/uELuf8eUweD7l4ZR8ivXDo32VGavEHJvhufZTDJjWpriL0818EQzsWh94LAy40hZw2cLBK4ktMWrGYgkxPD/D49u1Em8rdLQ3kTcBSoq//MGNz23ASXfnaFW5gxo1uXvdGVvdUoVR8z39THrizslwuYXrbpTo/HGFlQPaThJNu3uQLri521PFOpVVW42jrkfuCG++58J3PODOc4ukgq85vJCRHrB+XGY/k97F5ek8zWBEAiw9bMIDqNdtOUHegw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <eb0f9b13-1b53-41ed-80f2-da468b13e1db@suse.com>
Date: Thu, 30 Nov 2023 09:24:27 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/public: fix flexible array definitions
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20230725135557.20518-1-jgross@suse.com>
 <5ba647c0-fc74-595e-5fe3-658f4662f16e@suse.com>
 <f54fcb50-15c5-aa72-60fa-6370547bb9f2@citrix.com>
 <6cd0c3e2-ecae-971a-5c86-cf408591bee9@suse.com>
 <6300d166-621e-83bf-0ac2-70ea89b75492@suse.com>
 <de3fcfc2-b92c-469d-b7fb-7eb1e9b4a38a@suse.com>
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
In-Reply-To: <de3fcfc2-b92c-469d-b7fb-7eb1e9b4a38a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0123.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8896:EE_
X-MS-Office365-Filtering-Correlation-Id: 40591f82-c321-4cc9-4a58-08dbf17dc5c6
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sv89XXWA/8yXmLMba4Pk1LdlAO+AaswpqvFLvy1d61ipb9GvzHHTHfPTS/1RxApXm5MfeAwwpwLVO0IiVJ5mEAYuYS8iWOaYNzj8RlKWGsq9SamwatRM/gt14gSwpcd5D4uJsTs52X6az1T1NeiYrtf2Z3PetCcdFAujtepNGLRX8tq9zfInmX+hoYBEot93bNWc7Ih5A0qupD9Kqxi3OA0Ik+oR27P9aaOKvHzpoM9S0PT/aw4U3yAV4ogLQs6rZ8ZIJRYCZn3YAPMRcMjsTtzEwFTFlVmFyypm4cqfOEkosbXHlhjyvExi5vuJwtl2uryYyrFqWGO8MP4KFK5STdVvX9cYBnDkpyRvG2ZWC4AdCb4Kfz2J1ds8K2Ofsev9oUOuzS4IC7Vpa1RuB+iu19FZ1tQvxEwiG3C+ZtHbpa14Af+f3f+awb6yoIVhmTvIM32UoMICYzixNnD9chq4JECRK8Ce/FDRPEXvG/GS7ej7m4ORNtkpXHXJYmnpDII7oQtBJJZA8xzbTQLrB0/X25ivNXTIpYtB4tPXRo2t1lbl9qraFgZR1lmwz30jbYHyLeMTZ7a/tr0XarxUSSeM1AK97fJrBM5WLoqR9oaNAFfdpDlm3aCNfYcM/7Em4Ww8VlOpHWHvaRXqE1sH7gAQuRvWwP6Sens8hyVzalxySyXZXzehUO4OtJWp/pOiWLN3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(396003)(136003)(39860400002)(366004)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(31686004)(26005)(2616005)(86362001)(8676002)(8936002)(4326008)(6862004)(31696002)(6512007)(53546011)(38100700002)(6506007)(83380400001)(478600001)(6486002)(966005)(316002)(6636002)(37006003)(66946007)(66556008)(66476007)(41300700001)(202311291699003)(36756003)(2906002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEhNVExNZFAxSzUxYlZjU2NwTVY0TDZlWDA2WjMxcW5XRWVPUkI4clRyVnJl?=
 =?utf-8?B?c2M1MVRqRFpOUU5WUW1JRTI1em8yRlAzZGZDUTNrMStIQlg1VytZNlVTZFB6?=
 =?utf-8?B?eVo5S05LYWJvdTNrNVdmOFlYZXY4aUMwRmd6dGNUYmZhNTZ0ZkJNd1lEY1lG?=
 =?utf-8?B?QUw4UUg4eC9QVXFJNFVjbUdYREpNY3pVcDdZVzFGeWY5bHJGejlObmZIOWow?=
 =?utf-8?B?QVpaTEhOZHE4Z04zckhUN25UamszOWhCMFltbjhkU25HKzdrb1VTMCs2WHRr?=
 =?utf-8?B?cjg1MWtjUE9XUS9HUDVoaC9Wemx5NEFjcmhjSXJKZFhCcUltdm53ZzViY09Q?=
 =?utf-8?B?UHhRWjAzVmV6Ti9kZ0FZMGhvNXgwV0lwdnU3U3Nyb2tPaklGZEx0VEJ0eTFM?=
 =?utf-8?B?MzF2RmV3bEdjeVBZQ3lVMFFXbnFHUFNmRU1YUXFtRXE2Yll6SU9lY1IvYVNU?=
 =?utf-8?B?Z1VsODgvMHYxTldqd1Ara3IzSnVHTnFYaVJMbWZweThsVTR4K3JBWjQvaTJL?=
 =?utf-8?B?eW1JTlR3d3BZNnFSa1pCTWFaa0RRTnJpcFBwaCtUcXdtb0h1bUtaeExhMXIx?=
 =?utf-8?B?QXRpc1JxcXdsb1RIVW1Va0Fuc083SlVzR1ZTcWFXM0txNlhldGRIUytrN0Fw?=
 =?utf-8?B?V0t5TnAxZDdkek1KbitNdW9LYmF0NUF1bFpsMzd6RkkrZDRoaVE2Um14d1ZD?=
 =?utf-8?B?SlU1SmE0Z0E4RTVpWHpoWml6amovS0VmUzdVQTlUQ20vTkc0SVlySmtCUS9I?=
 =?utf-8?B?ZTRlQkVJbENLLy9ZaUlia0FleWFTVUZmWDlpUnlYN1NvdjcyS1ZkY0Q5bmp4?=
 =?utf-8?B?K3g3Mk5uSXArU085VTNJa0c3RGJTZ0xRdXZlT1FoQ1pYMjQ4QnAwaTZuT0RZ?=
 =?utf-8?B?SytZZjBJbHFjVjJVUlpkUWN0MGsvZDhCVEFCWHJjeC9kV0lETk1TOTNRRHor?=
 =?utf-8?B?ekpRQ1lJNUwrQ2I3TkJKVWFhVEo3YktLbWgyOHJvS0V1UHE4ZlhCVkZjdjRs?=
 =?utf-8?B?ZkU3L2g1ekJUUXhyYVJwTktzMThMYm9qbmNRZGZCaGFuUnVlcmpQMnd5ajF0?=
 =?utf-8?B?M01HUFN2MU1FK1FFTmUwc1J6UE5IZTVUU3cxc2ZEUVI1VWppbHlUUGJ4TEdS?=
 =?utf-8?B?Rk92aXJsZjRDQk9lQW5JYmhjaUZUZ3V0V3pLaVhoTDRiaEgzLzZ4LzF6SFBQ?=
 =?utf-8?B?NTd6Mlg4TG5mQXFYWDQ0RUh3dG1Zb3VBWC9sdUFIR2dUK0dLU09YWHlwVkJP?=
 =?utf-8?B?cTlLSFlOZzlBUjR6OXFKK3djZnRxc2RBaXFKWlh0aTdiQ2QxR1lFcUlUQ2tN?=
 =?utf-8?B?eit5SXpjR1M2Y2ZTOTJCVS9raG1LcEJsOE1qUGdhbjNRZlg5d3B5MVFmdXl0?=
 =?utf-8?B?R2J2SDg5ODFJRCtVKzVwVFU4ck5ORDNYSjNEZ09vSmpqUzQ2L1VMNkpmQXlu?=
 =?utf-8?B?QlZIVm1nczBLMkdZWnY3S25tNThIbFBzbTQxVnJMazZ6UFd6U3dWeDQrN2tN?=
 =?utf-8?B?Sm5ZakthNnZ0Wkt3K2FCZHRzcWVIeG90ZDNMUkMrNkRXK00vWlA4Z2VodEtE?=
 =?utf-8?B?WW5GSWtGSEZTZVhGVVM3RjQ4SHI0RzJIVm1Cd1hmc0hHWDdCalNOTFo1UEdE?=
 =?utf-8?B?V2g4Sm5teFV3MEVZbnNTZzRUUlNOU055cHlkQStEK3VhMkFJRVZTZzJ6MS9T?=
 =?utf-8?B?TFhvQ0dtYTdJa01UenRyWmhzb293c3FvOG5lNkR6VE1wNFpjeEt6dmpYZXhH?=
 =?utf-8?B?Wjc4cHZTWjJ4NHQrQzU1VWIrL0s2OG0rRmJvR3U3MDlVM0hNdU93MjZTWEp1?=
 =?utf-8?B?Z29yR2pvYUNGZDBmZEhZN0h3WXNnYlZYc1NJYnpoaVNHM2hla0toeXlxSWRs?=
 =?utf-8?B?UTVOUVZ4MUZPU2FlaGZ1RjZUVW1ldjE4dHZlZit5dXRvU0xmYnFtTHdBYUlQ?=
 =?utf-8?B?bWJmOXI2ajQ3SXo0YVM2cU9HWEIvYnZpTWFHWGROVHU4OWdRNVRoOFkzSVpT?=
 =?utf-8?B?aEtGR21YQ3ZOeE5XaEdTOXFpbU9pakxFVVZuRElOOWNFN3VtZTljUkpFVE92?=
 =?utf-8?B?SVgzcTV1a3gwSTZKSVJ2UnhISzlSRWhSckgwZlZoQ081Y0M2cjRlTHNBYjRE?=
 =?utf-8?Q?fxdpYGt9cfEWf2oc9uo7GmdNZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40591f82-c321-4cc9-4a58-08dbf17dc5c6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 08:24:29.5576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZvVKnLID0wmD+LcCPfH1tRWEQpcGFNnL15evA8pijNU+eAfmQyMdEKkSBDPiiFRYw/k0rF3MnUX/KG0H3PbJlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8896

On 29.11.2023 12:58, Juergen Gross wrote:
> On 09.08.23 11:42, Juergen Gross wrote:
>> On 26.07.23 07:52, Jan Beulich wrote:
>>> On 25.07.2023 18:59, Andrew Cooper wrote:
>>>> On 25/07/2023 5:16 pm, Jan Beulich wrote:
>>>>> On 25.07.2023 15:55, Juergen Gross wrote:
>>>>>> Flexible arrays in public headers can be problematic with some
>>>>>> compilers.
>>>>>>
>>>>>> Replace them with arr[XEN_FLEX_ARRAY_DIM] in order to avoid compilation
>>>>>> errors.
>>>>>>
>>>>>> This includes arrays defined as "arr[1]", as seen with a recent Linux
>>>>>> kernel [1].
>>>>>>
>>>>>> [1]: https://bugzilla.kernel.org/show_bug.cgi?id=217693
>>>>>>
>>>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>>> I think we need to be careful here: What if someone somewhere applies
>>>>> sizeof() to any of the types you alter?
>>>>
>>>> Then the code was most likely wrong already.
>>>
>>> That's possible to judge only when seeing the code in question.
>>>
>>>>>   The resulting value would
>>>>> change with the changes you propose, which we cannot allow to happen
>>>>> in a stable interface. Therefore imo it can only be an opt-in feature
>>>>> to have these arrays no longer be one-element ones.
>>>>
>>>> I don't consider this an issue.
>>>>
>>>> If people take an update to the headers and their code stops compiling,
>>>> then of course they fix the compilation issue.  That's normal.
>>>
>>> The code may continue to compile fine, and even appear to work initially.
>>>
>>>> It's unreasonable to take opt-in features to a set of headers intended
>>>> to be vendored in the first place, to work around a corner case that's
>>>> likely buggy already.
>>>
>>> The original intention clearly was to allow use of these headers as is.
>>> Anyway, I've voiced my view, yet if there are enough people agreeing
>>> with you, then so be it.
>>
>> Any further thoughts?
>>
>> I have checked the code in the Linux kernel meanwhile. There should be no
>> fallout resulting from this change, but I think there are some user mode
>> backends outside of qemu which are probably using affected structs.
> 
> I've received another mail regarding the report [1] above. I think we should
> _really_ come to a conclusion.
> 
> I'm still in favor of applying my suggested patch.

I think the change would be fine to make when adjusted to be conditional
upon (suitably bumped) __XEN_LATEST_INTERFACE_VERSION__.

Yet while looking at the patch and the headers again, it also looks as if
there might be another small issue: ring.h uses XEN_FLEX_ARRAY_DIM without
itself including xen.h. That's probably okay considering that all headers
including ring.h also include grant_table.h (which in turn includes xen.h),
but this dependency may still want making explicit.

Finally - is the change actually going to help everywhere (not just in
Linux)? It effectively depends on people enabling C99 mode. Older gcc for
example didn't even define __STDC_VERSION__ when -std wasn't used. Linux
doesn't permit use of such old gcc versions anymore, but recall we're
aiming to be C89 compatible. Therefore I think that in addition we'd need
a way for consumers of the headers to indicate that the C99 form of
XEN_FLEX_ARRAY_DIM can be used even when __STDC_VERSION__ isn't defined.
(This may as well simply be done by allowing people to pre-define
XEN_FLEX_ARRAY_DIM before including any Xen headers.)

Jan

