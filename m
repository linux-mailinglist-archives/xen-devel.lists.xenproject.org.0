Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE927FF6DA
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 17:48:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645079.1006897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8kD4-00068W-1g; Thu, 30 Nov 2023 16:48:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645079.1006897; Thu, 30 Nov 2023 16:48:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8kD3-00065s-Ur; Thu, 30 Nov 2023 16:48:17 +0000
Received: by outflank-mailman (input) for mailman id 645079;
 Thu, 30 Nov 2023 16:48:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BG3/=HL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r8kD1-00064Z-RH
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 16:48:15 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 40883a4c-8fa0-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 17:48:13 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8078.eurprd04.prod.outlook.com (2603:10a6:102:1c1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23; Thu, 30 Nov
 2023 16:48:10 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.012; Thu, 30 Nov 2023
 16:48:10 +0000
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
X-Inumbo-ID: 40883a4c-8fa0-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vq0ua94wJZjcKwTlmNJTu2DwQsQ2as9fpE4x84FCXKqhcpIaxISVWMCct8qNvn7aFH5V/d7wZH09PvIbjWKOl8YwxCIkaQNi/NX9NlVr3a3n/v1yitPr3qxFS1W3+/Ul5SI4f8x30IU/cQF6uQLkOPX5VofZ9zFYfbvPZcSBNXwUMmRDQ6ZDr6t9maXsP/DN+xlivEMUeokagFIrshfG2OzzOilvYKRLs1IvxxqmzbMcONfuofythX0CDZoJCJsS9og5JakccmbVw+DDPuarpOWWZlXCijmfx57dsQB1QhTG+oR1QZVkqjwbVEdf83FhRdDjsu1TlYlydcksAhtEIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O/yuXpov8937iZqls1WJE6u3QSj/3NqIo4nE9Nz3mZg=;
 b=dYe9pzoK5nFAwdxSs9kw53r2CB1XJq1OZDjNjSk5GAWPe8lCm4uc4SatSm/Q3ppqNqp90bre/De6eRD1uZs2gR6vic9Qr1yyq07q4bCLsrW3wFuUu43kXSagvqOJSksIqdo4/f+9Ho8l04gjAptBgLHj7Hp/RRZwuTg3lORHxX/xLjJlYNc5iKVjdE+ZFwzb1UAuwZeiTl2hOuZYHidSQTlb+ofKFydZJiL+qlhVfCd5EXf3TnQiJeU3alKMY3Yj7TlhF2YTgB7B+obxWYlyyraLQ1uO7efU0B8tV7Kk8On7fcMJB8VHWcS1RfeiOll7/dGOGRuQK8gGBa+u8I4CuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/yuXpov8937iZqls1WJE6u3QSj/3NqIo4nE9Nz3mZg=;
 b=NPiQB0+4lJTj1lEvU544GghDAHZ6Ka+Ezz19WodurMxVCT1KNmtzO7feVIQ0WFyCrbr9zdy6oTDZ5YsdC6SMBNNqf29pkL4rT6shaTpzZB1YFg8YbWvl1CHOPiRD7AvWNnS7BBv7PcXi50iknbRi855mTtpnbAN9+6ugH4YYFtJG8gxIc0MHC06GiZC1yfDBdeI15+Ih2fQnKWLLhrrJd+A8F320fvVcCCJ5eD5Eyc1fKOUcBQnGoolnL66S9DremCtO07n0nz3bnQlsW+CX7GHLRfQYq5G+tW7gb7SaIXJo49ZWBsCJ6VOH1q5PyX1p8hypfQLOajaTVUJ859MZaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d81a16f5-98e5-467f-8aed-0cb4a84e854e@suse.com>
Date: Thu, 30 Nov 2023 17:48:08 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 2/7] x86/i8259: add missing header for init_IRQ
 declaration
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, bertrand.marquis@arm.com,
 julien@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1701270983.git.nicola.vetrini@bugseng.com>
 <3443c1a877c63f1c6213e0c184e89b20aaa29ffb.1701270983.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <3443c1a877c63f1c6213e0c184e89b20aaa29ffb.1701270983.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0144.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8078:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e438f4c-b16e-46d4-b508-08dbf1c42308
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rJeWRzD4Q8w/2My3NmG+ED4lTz2lzEAEWML7PuP2tf5w+vmeyjJ72ESek3ZPtPJJeY4LCCNMi5vsgHaKiK88/P4qqkIlXsGyNhWn1Bb4kaeljMvaa+fxPRsuLHNtkxfauSVTbobLbA0LwVnQ8sIYmOzZ2L++Uz2l13hNoUgdzoFI1fyvKq2qT40hU+NanI79ESMnOIGZm7UpyLwF/YPUP9z6T+mzzk4xIzYcy3a317oKJY7zYyiGeRY+wEJzD/ssMB8a9X3cdRE4WmkimU2cfxt1a6IDu3IPiVaN+w1IEpWj+V/STW+jAVRVU2r6hYLMf6hqfHkR89DqcD7ZiMsvQwxwCOo9hhL5uQ/w7SYueJ/bXOyf/3jJF74vrQuzjaXqA8oI9LU2yGkLKNt67rHDwSpJnC3T7VdotTZitAdcTNWTgQl4ug27kRkVe9IXj5il/HoPgoWOKsutDRnAFHgo/Sf8EWUXmhKB/ptzeMXlAt4OBzEqai1ocNATqToFzfQnCe4fQxdCwaq8bOCuXijCVTSgsEcLYojiOboHV5CFPCY5a5rGrXhEXlXg4MS+YTmjyhA6i6O7rKujNBfj3X6ZTL6XHnuO4PXNrMgYwuVAZIplZTRjgpW/mTdN/JNrDtRLatjCZLUjrS0G3nhLF8tEkQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(39860400002)(376002)(396003)(366004)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(8936002)(31696002)(86362001)(4326008)(66556008)(5660300002)(6916009)(66946007)(66476007)(7416002)(36756003)(8676002)(54906003)(31686004)(4744005)(316002)(6506007)(38100700002)(2906002)(6486002)(478600001)(53546011)(6512007)(41300700001)(26005)(2616005)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGs2MTl0K21xTFN5bUYxc2VDKzdRdmVwbFl2U1dUQy92SktaeldvMk1rUHBZ?=
 =?utf-8?B?M01GcFoybkJSdWJvMmpMMmZEZFRHa0J6c3ROTEQ4UHJHYUIrR3dKc2t3Sk9a?=
 =?utf-8?B?K0IwcWY3Y1pNcU1NYXVGWTZ6UllVVnV2S3VMUFJwR2VoVXhWSlB2NjdENlpm?=
 =?utf-8?B?dmhvVitCWUpEYm9OM2dJcTNobGU2MzBYdjI5RmlZRmhqbnNxZCtIL25UQy85?=
 =?utf-8?B?NW00UmhOREtNd2Vscjh5OEN2a0ZLMjBCck5lREJPd0JjM21peFh4ZHNLSERF?=
 =?utf-8?B?Rk9ZYlRqVDdWZEdRWjMrUkhWN1hMdE14RUxRMTlHTTduWkwyZURETWsyZUV4?=
 =?utf-8?B?Mytnb0NPMUsxaUwwWkdEYmNMMDJmcWZRd2tWcm9YWURqZGtTU3hZbjJXaHFp?=
 =?utf-8?B?cU9mMzN4eFY5VktGeVNoVmVtNTR4RWFwYzFTTkNTMEpBbmY3NFJ2VFpLWUZU?=
 =?utf-8?B?ZGxjVUYwdFBlMWp0R3NjZWU2N0xxZEl1T0JsM0xWSlUwWjY5SU81Z0tuNG5i?=
 =?utf-8?B?ZkpIa3hzZlVmNWpmWDJJcjMzOGxxQlBPODZ3andxQit6UFJGOW95aGdjeThB?=
 =?utf-8?B?M015em5xK2E2L1Q4YThIQmtLSnRoQWY1Z3VkZUZrV0JzV3RhOXRDK0cwWmNJ?=
 =?utf-8?B?VVBoOUZDc1ZCTURCa3pib0NQbXEvZzRGZVJGVGFrTEgvYXhORmJvRnVHM1dx?=
 =?utf-8?B?cHErS2Z5YlNycWFXTXJiR1lscTFxcFpRUG5HWTFpcXM2TldJZlhHcVRvZEpx?=
 =?utf-8?B?YldneDVxUTIrZnNEQlhIbnBVM0VoMXlyTi9aRHd0Mmg0M2o0NzFRNFFaaVlO?=
 =?utf-8?B?RUR4VEZnaEdLUC9zTjZSUzRheEE1cWdFQjdkb0lxbkFiN3JERStnS1lydTJC?=
 =?utf-8?B?VldlTjJsQ0pzcDgwRDl5cHlDOEl4elU4c3FKWWp5QkxSWktXTm1hOEhaOFVL?=
 =?utf-8?B?Y1UvQzdNMkxBaXQrUzdFU1UwaENIUEQ5S1J0UnJnUkNRNDhnd1lEbHZhM0Vy?=
 =?utf-8?B?Zm1CYXJCS0d4NTc5c0ZDdW01c0tMa2psR1gwY2pFVWwvMmV1QU51Rm01TklW?=
 =?utf-8?B?aGVkLzMrbjNnZDMrOWwwcmhQNk10bEU5MGhBelZKbEdOcnFIdG1tRlRIUkYr?=
 =?utf-8?B?V2UvYnJlbkFtclpLZ0p6dEppSjd3dzVmZWdFaWVqbThnbk1sSG5jaUYxSllt?=
 =?utf-8?B?MnpJOEE4aWtFUzd0a3MrWTFRTDBXQmtRMjNTcFcrc1BrbWF1WHhLWjVBVGZG?=
 =?utf-8?B?UmhCcFpwWmxqd3R0MzRMSGFjUUMyaUlDbitjcldZNDcrc3N2M2RLMFdqWmEz?=
 =?utf-8?B?SjRZN0JhczJ4R1o3S1JpQTdhQUt5OEk5SnAvTXJJVVhpb3hiZE5ZdVp2TGNT?=
 =?utf-8?B?N1ZWTDNqeHdRQ1FNb01MUXBxVExkcWUxT0E0WlZOTkZaSG5SejZ3WEt4cWNx?=
 =?utf-8?B?TkZ6ck1YR2ZHQTlUcGRjQzlic1pwbmhTblNyV2ZDOTVERG1icktkdGlBR3U2?=
 =?utf-8?B?bDM5NHc4QVBrd05halVBYndkYlA2Q00yK0lscWd2NVVaWjRObzJtbS9GdmZw?=
 =?utf-8?B?clJmb2VnNFhLcHczdStDM05WNXlGMERqN3N3QXhqbjQxcXl1UWxXNTRHVmV2?=
 =?utf-8?B?aG9kZHB6a0FFUytVUXJWdnNsNm0ycnF5VzJBZkQ5T1YrUnkwRTFaME9oYzJC?=
 =?utf-8?B?ZHl2dldlaktXMTBKMUs5a2lCR3RjYUNmR1BSOXdmb3N0UXFuZU4yajhvTDVP?=
 =?utf-8?B?MERvS2hQVGdLcmRTeFo3a2ErR0J3QnNjNHl3T09JdWJqRnZHaFdMWWE3WVg0?=
 =?utf-8?B?QU5SeVVYOW41OXpJcjR5L0djMkl0MGU5WXRPZHNEblJEZFkxS0E0Z2d2bGF4?=
 =?utf-8?B?bFUvcnhCWGlLemRhSlBXdStKYlVJR3AxbXN2N2VwVDdRaE10Ym9May8zYjdK?=
 =?utf-8?B?YlJtRzNtazVzTk9XQzdUOUFjMnhLZThvNHpHWkhQU05YZTBjVXMzYnFoQmdj?=
 =?utf-8?B?eGZBbytYdjVaeUhSRDFQN3lEMHFKN1FBQU5COUlDR1ZvOG4vRW1yb2pLRzhC?=
 =?utf-8?B?Wm9ibmtpbVh2WVUzMmNvU1g3TjJqbCsvYVFPc3FrSTM3UG15aXBiVWp3MFVs?=
 =?utf-8?Q?U8TJSgpMyZj5GDDSMa9Uz9Dld?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e438f4c-b16e-46d4-b508-08dbf1c42308
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 16:48:10.7809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DgSNz5hrpnWxlNEl4fGs/KfcAgnWCyf0E7ERRj3swUm9f/lPnptcj95MYBBIZuxdUTq1fdRtxp+KgOJh3RqtPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8078

On 29.11.2023 16:24, Nicola Vetrini wrote:
> --- a/xen/arch/x86/i8259.c
> +++ b/xen/arch/x86/i8259.c
> @@ -19,6 +19,7 @@
>  #include <xen/delay.h>
>  #include <asm/apic.h>
>  #include <asm/asm_defns.h>
> +#include <asm/setup.h>
>  #include <io_ports.h>
>  #include <irq_vectors.h>

A patch doing this (among other things) is already pending: "x86: detect
PIC aliasing on ports other than 0x[2A][01]".

Jan


