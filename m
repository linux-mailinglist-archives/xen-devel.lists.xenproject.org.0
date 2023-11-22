Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F06F77F419E
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 10:28:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638574.995276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5jX2-000160-O1; Wed, 22 Nov 2023 09:28:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638574.995276; Wed, 22 Nov 2023 09:28:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5jX2-000133-KW; Wed, 22 Nov 2023 09:28:28 +0000
Received: by outflank-mailman (input) for mailman id 638574;
 Wed, 22 Nov 2023 09:28:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r5jX1-000110-5W
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 09:28:27 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2088.outbound.protection.outlook.com [40.107.7.88])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7cbcc626-8919-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 10:28:25 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7638.eurprd04.prod.outlook.com (2603:10a6:20b:291::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.17; Wed, 22 Nov
 2023 09:27:56 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 09:27:56 +0000
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
X-Inumbo-ID: 7cbcc626-8919-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gZaFY7qPMxhkfAss7Xk+uk7tBYSXnU7W5a0N8cGlrnRHezBF4VW/CZ2Wtbh79x5YApoIxfkq3q9foxaDQXQUC+YoI4kiWzSb54jHfsuxhSr6lR2x/bSAzUCQtY2Z53R9DtIiTuh3/989KX1gyHCa49tm21jb+P8/cTBmbFScncsx8NZaJpfidBnV0hxq/vN36FKpG2OmLXFrqjpBQpSZ4EqYe95Px2goPN8eeq8GrTBhJwrP5N72cpcZDcOsHZcJKdMaGn6qbm6YcywfCpsoe9VBRFCUpnAqqa6VXOPzzc+DG7WLxaGjbuYzIo4eMUurXfbWF6yz37vjrUHeFmpdKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0W5NzzdO2jdWmXCM0q4ifQDJzK+iugxnr0gkDesol8o=;
 b=YTqRXVqQEouZIvsdRaeKIiFtuYaXGBu/eO3bUEUU3FocQVM6FTFD7yEEiwQc7lHFF1UmeEBWTaDPMoJp6KhxfEO8aAI0zc7pAj9Pyi2yvYYcD6N2Wx4n8TZmAebF8tuXUSckTz0El3X7T5Y5G4DxgZfVVlrPnRcnb8hBYUifPd4ynx5fq1sltWOoMsYxrGLr/kYEOC+x7djx3ZZT13C7S8MEpt+SlHWdmb6Fzj9PLf2ZAEOk1b/0iPDq9RlkuZbf66/5yDYAOnvGg2hdzDqFKvYmkRaBsUAOM2uKmisKbB06drDvTKigzt75SIpMcqj2FhD7yUbSt4zzee3qAHyPZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0W5NzzdO2jdWmXCM0q4ifQDJzK+iugxnr0gkDesol8o=;
 b=5CKBrIC8kz2kphcBGgztXZLj276e9LrrTCzNutdfwjukMcIbvvlkUy+RRUyRuq/dTA+CWxoUme9XKY21szOD1wuzkvDSayZZVkCMHCgzDylr0zh9yu+mWXDjLjuxMtfARVvmX+uBB3bY9UjsEftLrUjgZH18GzPJZnQHA4mxkYNFOxDfPbj88Ovhu0PH8EhHICDbHAe5zH+zdbL66jymU2VHyETl8zpetPOijOrXogauKFReONQ9xMvy4V0Yjoayz4Y82W8AdR1f4iXoelh83h/Wy+b9aYFear36uJtDPFFEMeqZmiKCblJ9hSRLRzpJ7BzZo82uH2HPZO2uzpIQrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d4c54e6b-baf2-4141-890c-7b62462971d9@suse.com>
Date: Wed, 22 Nov 2023 10:27:54 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] x86/efi: Simplify efi_arch_handle_cmdline()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20231121201540.1528161-1-andrew.cooper3@citrix.com>
 <20231121201540.1528161-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20231121201540.1528161-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0122.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7638:EE_
X-MS-Office365-Filtering-Correlation-Id: 48e2240c-c3d4-48be-ca66-08dbeb3d4f4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TG+i4aON94bYjMz9jQMN6vJedPdmXcjoGctkCAKzrj6NaBwurnrBFE0kYj5wDdB5BIRMUVSJcMyZAdeZ8KKo72y2gTo3mx0/PfPUBoK8q2PTr0B2X9KBZwRwA1rGjI2PVZEATP92gVuhcsoUIH36vL8qGCTPytNByBUt1jq5+wtqJbEn84foyHSKGhOStZz6XI0m9EbbRLi3P1/RoH0KeaWqnInG7Ip6pax8bV9iD0y64ExS0pon0DoXTLHJjXNyJwZQupHtMnhh567OBj6TijE3dFX+ObpZ9C+cnUmdlVB3CK9E+wiQhYSVIJQ2QynwkJYsxTw7gtzLeN/asVPEvE2C0Hn3QxInqMMBQ/mnU2lCZZGqnEKtzcgsBru3zPhtiVIYnIxkZdL4/gqBY6A0BBInepMO2EEWo/2yLsIsBaGWEjXHfggi3dIhNrcfcMuWpnz8IRI94x6JvWO8pMPaUioJnnpdJTJWy+XBMkE9pcQHGqtHZsBzYSBQs3XzyWXD8bMrXbXZ26DQLJV5ikS+44CJtoBlmX9z4YttE2PlWb+fUPOmC1N972UYsdOLHQRgkj6srTJXDoEo/co9Si1QWvq83daqoqEmWTs+jSEXM55BQpmkW671kXgmB8W7NNoLSQggARpTyWb+eHraNiIYxQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(366004)(376002)(396003)(39860400002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(38100700002)(2616005)(83380400001)(26005)(6512007)(6506007)(6486002)(53546011)(478600001)(66556008)(31686004)(66476007)(54906003)(66946007)(316002)(6916009)(8936002)(8676002)(4326008)(5660300002)(2906002)(31696002)(86362001)(7416002)(41300700001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2QvNkVPMTJDS3BYSmRtRm9vd0Z2TEdDUWZnZWtxelRZM1hSUnFLeHZHR1Zk?=
 =?utf-8?B?NzA1OXByWFZvUDhZOGdUQTBqbWszV2NUN0dyZzF1RVpDelZ5eW9UQVBNZnBE?=
 =?utf-8?B?Z1lRRDMyTlN3Y052bzN5bVRWc1BGZndnNTdQSk0vZGhzVGExTWhoYUQvQUpP?=
 =?utf-8?B?WDJGTUJqWU9PY1d4VXVBNjZ0NWIrTU9abFJ4dFpnbDAvakVvaG83WXEvMVJI?=
 =?utf-8?B?NUJVWnUrTDBTWkJaUVVTRkdacjdVK01PeWYvbzhEZXZsMjdFMG5WcFV4bkJk?=
 =?utf-8?B?QVc5NDVleDIrdTByN294Y1l4OVVqeS9UTlcvUEd6TytHdW9WeElLeUxrTEFF?=
 =?utf-8?B?UVNva2tDMmpGMWJ5dGJlMU9VMk9FV3Q4T3RPSlI2Q0F2VXlzMHNxdUxWOGht?=
 =?utf-8?B?ZWNDUkxiR3B4eHlqRXdFc3F0bkxSQXAwcE5aUWswR29uTTZRaWI2ZzkxdVhD?=
 =?utf-8?B?QXQ1ZEZzVGdwdDFoMkF3UWI5OHJjVkMrQUIya25WUklkNTdTOG90NVIvNEZI?=
 =?utf-8?B?YzhDLzZJZVhsaTU1b0tOUUFkOVFMZW1MMXNBOVNQZ2hhREFpSXRpQUp3cEZr?=
 =?utf-8?B?dVJraTR4THVJM29FVlVDdHFyR2NueHEwa1JmRUpYUEdNMkk1SForaEk0eE9t?=
 =?utf-8?B?ODNxUnF2d1h2M2s1MXdaVDBodjVVZjVHcGtMeDl0ekdWNmt2MUg5UW9ROU5v?=
 =?utf-8?B?WlhXSHIzUTFyVGpYVVpWV2F3RFVTcnQzRlhkWXBGZ3UwcGs2ZWErYTAyb1Rk?=
 =?utf-8?B?dXpKRUlDbE1QQVBUWkpLWVdwbmVjSzEyUzBNbGM4c0I1ajQxTGltSEtXRm9h?=
 =?utf-8?B?U0djZkZpNE5iaEttaC9XZzFIY2gxR1FGSVlIWFIxcUsxRktDVUMzV3A2R0dt?=
 =?utf-8?B?MXRDdVN6VUo1enlUN1dPUjRXbDdMdWdkYTdheTJzYWtZTlZwa3hDTWUyQXcr?=
 =?utf-8?B?VmFmNWk1aWhKamRKdGFQWVRwVGdxQnVtSzVoQk83YW1HZkJlU0lTaEMvWXhJ?=
 =?utf-8?B?MUcvbmxxRlRRcEo5QzUwd0QyaU93b2xGOTlmK0lmaXpONSt3R3lMY3ZQeG43?=
 =?utf-8?B?RUJtSS81T3gvNk5wSnUyWTNTd0VvT0lTYVc5ZkJyRWdxaHMraytiQ3hRVHdx?=
 =?utf-8?B?dHA2MXRETm42RmlDS042ZTB2RnczUklRNG02OTBsNjZnaUgyRDVGT3FZNUVW?=
 =?utf-8?B?dGM4ajZxb2NPR2w0MktqdTd5S1I4QVM4cEJJdk50R2R4Ym5ZNnk2aVZlNzM3?=
 =?utf-8?B?cC9CREtaNm1jdGx2bUcyWTNFM2lMNnRyaDFEa25abFRRSFQwMURpTFhmeEJ1?=
 =?utf-8?B?VndsdFhpQU5hRkxnV2Juak1oekw1U28xdU5OQjBkMnBFU0UybHFhQmJXM0Ur?=
 =?utf-8?B?ZU0wb1I4TUNUV1QrYjNhc3VEY1M0NHVsWnd6UTdJSXV0cGUzbDJnWk5ZVnhI?=
 =?utf-8?B?Z2lYRkFhZVJUZHZuOXoyTUp6WXBocnpESXRBbnk1WE4ybVhzVGtkSWl3TmM4?=
 =?utf-8?B?anZVK2xUdkxBU0hxb09Va0ZVUnlFbnBmblRCTTNYYVhqMktTWk16VzhYQy9M?=
 =?utf-8?B?b3FrRmMzOUtYTzdOQkY4M0h6cXR4ZWtRYmNYRVIrR3FMa29od2VKRDZqQngv?=
 =?utf-8?B?WTJmYldWWGRLNm5CY1Y2UFd1REtrY1dSQTFoS1doSXFNMlF1d2J1UndmSmRI?=
 =?utf-8?B?Um5reFRzS0c5amo0VnNzNExvaTRRb1FPUmQwa0VWa1Bjd0JkYStCZ2V2bytx?=
 =?utf-8?B?VzQ3amlmQVRuMThvQWtuSEJMWm1meDd2T2xjbHROcStkdis2UEtvY05kNzd4?=
 =?utf-8?B?MnZKVWRLM1oxRnVraC91bTdGeTJ3RTFnUkFOV08zYU5uV1FENlFuMC9OWEtr?=
 =?utf-8?B?Zmw5N29FRGpKbHFiY3hOVGU5SHVpZDEyUG0rcE1BWEpTV3FlbzJPS2haRkt5?=
 =?utf-8?B?TU55dGJCSEtrQ2U0ZC9tVmdvK1J0TWdDRGRzRmtPMFNTVWFFMHp6VDZBQmZu?=
 =?utf-8?B?MUF5eU9WQWlKRW00bUIzeUpoNENTMFgwUFdLenBjeVRTUWRBZno1ZkhWQURV?=
 =?utf-8?B?MmNwUCs0dEhuYVlTTTlGU0tVUytBWWdvaHg2Z2s3NnB1NlFvREM4VzBlYXNP?=
 =?utf-8?Q?lYLOjZNRJQuq2jz8NJWtueIZ8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48e2240c-c3d4-48be-ca66-08dbeb3d4f4d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 09:27:56.0499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iFMhObpSGxEADo7jx39uTorktW9dGy33NvpgEYAIGbdiy0JgkQMTdo5eQT2j8ZdvopVJf2uAfnL4njzgwlAmBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7638

On 21.11.2023 21:15, Andrew Cooper wrote:
> -Wwrite-strings is unhappy with assigning "xen" to a mutable pointer, but all
> this work is useless; it's making a memory allocation just to prepend the
> image name which cmdline_cook() intentionally strips back out.
> 
> Simply forgo the work and identify EFI_LOADER as one of the loaders which
> doesn't prepend the image name.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one nit:

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -850,8 +850,11 @@ static const char *__init cmdline_cook(const char *p, const char *loader_name)
>      while ( *p == ' ' )
>          p++;
>  
> -    /* GRUB2 and PVH don't not include image name as first item on command line. */
> -    if ( xen_guest || loader_is_grub2(loader_name) )
> +    /*
> +     * PVH, our EFI loader, and GRUB2 don't not include image name as first

Just "don't", or "do not"? (I realize it was this way before, but perhaps a
good chance to tidy.)

Jan

> +     * item on command line.
> +     */
> +    if ( xen_guest || efi_enabled(EFI_LOADER) || loader_is_grub2(loader_name) )
>          return p;
>  
>      /* Strip image name plus whitespace. */


