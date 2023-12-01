Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF574800756
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 10:42:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645400.1007568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r902P-0008EN-H5; Fri, 01 Dec 2023 09:42:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645400.1007568; Fri, 01 Dec 2023 09:42:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r902P-0008Ci-ED; Fri, 01 Dec 2023 09:42:21 +0000
Received: by outflank-mailman (input) for mailman id 645400;
 Fri, 01 Dec 2023 09:42:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jO30=HM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r902N-0008Cc-EG
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 09:42:19 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2089.outbound.protection.outlook.com [40.107.13.89])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea0ca8f9-902d-11ee-9b0f-b553b5be7939;
 Fri, 01 Dec 2023 10:42:17 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7578.eurprd04.prod.outlook.com (2603:10a6:10:208::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23; Fri, 1 Dec
 2023 09:41:48 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.012; Fri, 1 Dec 2023
 09:41:48 +0000
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
X-Inumbo-ID: ea0ca8f9-902d-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C3bSMuiQcJoS2U4vfLeUzCSkyvlze666mAfF/TUGWmx8DVWgnzOBUU7/iVm5aAVjatyA7HrRAwAPa9CR+zUC4m8H560GDdtOXrbqs1ccY00l9OdmshUv5snYFEnpYTfJsd+ZcFGsZqrhe2d9hj7dA8GPFlTLKi1acvU8+XiWjzoXw/9szJnTnmDVK0p7sfY/HDAlxDK9HswfgD3OAph6fn9E4cM8mf+8w7NAmYECQbQiy44h2L3qtY8HyaPztuKy3lvPD5Xu5rBjSg5Bmr5u2F4K1beKLFDkpTfQV2YZomA7rub2DIfIiZRFsqcA4ey+e041uzjw/4bI1TQ7XOn4pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NScFN3gcFvVKhSJ9ePvUimuieZutudyPFNCzhAmjqQ8=;
 b=fl1cQ4cpL8vtoZ2p84UKuXdcgsL1W1Y7FD4FkiWTrOCAYgd1THKUsNoW1805nUP56VKrxdbRqWwOtCM6VZl2zc2lJjdvqEpCVlMPI4WO5VVew82jDAvI5jGE2nZ808f+Fm4HVcHKRF/6nd3O3IuDD/+9R6NV0713V11zDM/THILnxYs/CYvMmZKqWDz69MtEJM5Y2aLK1xpLFTeQrWGWeu0EbpxEjEn0v5v8kJsMMrtdNYw3ihOr1O7ZTOZ6ZBkB2ldHAlyb8YjdgXJGFdG4MFQNG1ADMIt6AIYeaBH8A4xVpuUK3Baffs1UVcV71qxs0pI4yk4GwbOSuxOHA8leZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NScFN3gcFvVKhSJ9ePvUimuieZutudyPFNCzhAmjqQ8=;
 b=BMOfz9b116359Yf0fDQW/DEfh8W33+MFarv6UOVGUXAh9o/7Ku+lqYvyj3vTrlZK/erIbKB/iD8vd86EiBrHamuiXSmHKER3velW605FUxpT29MGs8n5Ex9DMf7LhhUdfBNNnAw+YKN2tK92Jo5201cBSwScknteDNBn1xP8LZ/hTroNHp26nsQH0Qb374lz/gLWSzpjA9ocYQPr5gForyT8JoHoTsRle0iVOtUk2GxyQPr9WQ4COGpp5SAkzQD0PgOm+MBXI2R51dHUXJ7bNrhNfneHrZNNjNxOGs1muQB/2WpaM33snXYbETCeyCjuBfeNN1N1KZcufEPsZJPtbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0d9bc0cd-3719-4961-ae7d-3e27508000a2@suse.com>
Date: Fri, 1 Dec 2023 10:41:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] x86/livepatch: set function alignment to ensure
 minimal function size
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20231128100352.35430-1-roger.pau@citrix.com>
 <20231128100352.35430-2-roger.pau@citrix.com>
 <a65aafed-68c0-41dd-bf4d-3eeff87dd5d3@suse.com> <ZWjIX0Jo5gW5SEDr@macbook>
 <d0a4f187-4e84-4e0d-b478-6d8437a0b644@suse.com> <ZWmeV-y5RpGAG5cS@macbook>
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
In-Reply-To: <ZWmeV-y5RpGAG5cS@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0312.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7578:EE_
X-MS-Office365-Filtering-Correlation-Id: 951a86c7-6771-4778-b1aa-08dbf251bd17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	s/NVfmkv6gwQjAInQjJe+bckAm4izsxrB2lzOF0NOeVhVpkho3DxxVTplZclEJa2yMZ4LBF458PJMzgi2sER1pU6h27XBijx5JZllxgtrCn3cA6zbI5c6XxbYFRaD+MC+gNK+pkMt5/s8fX2KGpGEhS8N3nPb2yPoh06GqYwf3n4RWYWRVxmTH24hHBJCaI/QUAP+DOFxj869jx52Y2lvBBx2PmsAYb2/olYeJwe/lQzQknykWs1yYGc5gPThDq8vg/LUNi4rF+l9LrxE3M7m1u+PeaDc2ACNbx+oRLROoZyfwG8vluoYBBz/M3jr2sdigk8SpDD8M8tjP0U4+ZI+cNgXVOaNgl0UKGeXmcIL65T6WNnbb3uPfsiclev7xCUMTna30KH5y6haIwWh0YUm46BQF9cv+eg96wxq3fs0wjzpe+mlSN8kVvIvsKPdZHLTxv2jEzd3UOokFYUBA05XE10d2EV/b73gLsYqTyDSBs757beZ5PKWLkyupOTmigfIU1XCwNxWLUucbWfDYr7bQJdXyrRz8mDwOkMwD5wSp2AMoTUFf06pktAttbhdJygj1k6sBjsePjNbUB9ySwNOi1yXyaNq2NDc2tupzo/MR73OJw6sm+Y7JPaBRK7cskJBR6L1amUtqPe+iWb1asjfg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(346002)(376002)(39860400002)(396003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(38100700002)(86362001)(31696002)(36756003)(6666004)(2906002)(53546011)(6486002)(5660300002)(41300700001)(66556008)(6506007)(316002)(2616005)(26005)(6916009)(8936002)(8676002)(31686004)(6512007)(4326008)(54906003)(66476007)(66946007)(508600001)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2ZOdXZReWRiVEZSM0Z6cDN3dVJMWmpSeGk5eThpMGh2NXNYQkhqYkhPTFR3?=
 =?utf-8?B?R1h0L20rWnNDSmp2QW05N2xZakpXL2pVbDVyamt2ZytCcWZZaVJ4anEyNXFj?=
 =?utf-8?B?cE9jWVZIZEtUeFJnMzhSRlEwZ2JvOTRLci96ampGMUZ4SFRiVDVyT0QwVjVn?=
 =?utf-8?B?MElVTWw1RnhPbEw0Wkdxdk5PMGxSVXpqbmpEVExpZ3hvWWFnR25QK1AvTG1U?=
 =?utf-8?B?VWFoczNMcW53MDJ5c29UUVBxcHJ3eXRIZlB4UEVBclU2eDNxejkwZU14Vk1x?=
 =?utf-8?B?SUdhell6ZUx6MHFIVnU1czBScFJ2cWVEbmlreE9CZkEwekN6UzJva3RLTUx1?=
 =?utf-8?B?YkxMT0UvcFBHZU9jNXd5YWtSRDlWTlM1aXZTY2cwbFBmV2JLb0RoLzBMQzlL?=
 =?utf-8?B?MjhWV0J0OUx6TVBZM3c2ak5wOGFqZmFHc1BaVTlMNG9DRzQ2dzJrZkg0U0s0?=
 =?utf-8?B?OURBYlN5aWF4VDFEeXZXL3pRaUFuZnRsQS9ycVZtaGVJQW5BUTdxcEFDUkVN?=
 =?utf-8?B?azQ2RmNNN3pZb1NXSEhNMVVsVU1GOEFCbDFQNmFpTHlEcm5xSlpBa1ZPTjNX?=
 =?utf-8?B?NnZLbXhkTEVuYUFvNVZFL05sYXo1cllQWVZQcTJObkJQTldIR1Q4V25KV2k3?=
 =?utf-8?B?WHVjZDVlN1ZUazRDeVRpNFhqcjZ2UlhxMzdhaEMzRTY1QVpBZXUwUjFsTTdl?=
 =?utf-8?B?MStsNjhRc2JaSmRGS3JtYVdvUGh4WVhnMkp2TkJYS1U1UjA1Zjc5TzBsUFUr?=
 =?utf-8?B?MWdxaHlvVTNZaGlLVk9uekxpWHF4SW9JVUxBVXU0eEZVT0xLYzBjU282czB4?=
 =?utf-8?B?NFREdHlwaFdSYUJLdWVod1N2RXdxRVFnZ3FRdmRaai9YOVBRQTg2Y1JNMWd5?=
 =?utf-8?B?bEdRU3d3QjdTT2dybksyb1V3aXJUalNodG54ckw1TmlCREZMV0VHMEk4ZGdp?=
 =?utf-8?B?MFkzbVVBR21kQnlKQnpNY1VYbFFmNEYyN28weVIzZ3NXNmVaRklLYjhlbnlL?=
 =?utf-8?B?SDZyS1RzNjlxeGZ3SFNjLzNmaC9xdDZyVm04MDIzMjNlcWV3R2JKQTlyWk43?=
 =?utf-8?B?NnVPZk82VWNWQXMyVGNnNUtPYXlBUU5JWEpVcnlLUHJ0WHYwZVdsejV6VnFU?=
 =?utf-8?B?YUdWbVhlM04zaTlMQkxHdC9EWWZBRjRuNGhtNitqZFVwNDM1eklRUEk4eHZp?=
 =?utf-8?B?VGRWd0ZLdXpBQ1VpR0hSTm1FL2MzbFBoc0U3Y2hKUkFOQlVpSkp0dU94aGph?=
 =?utf-8?B?R3hMMm5Pa2ZuT0FmNDVramdxSERFdnJWU3IwSStHaURNbGZ3ekhuSTRMbG1S?=
 =?utf-8?B?VXdQSWM3b0tTNGcrYjdpOFBpQ3kzT0JmOGpKVTR5ZEk0cmk4ZlcyaTBkU0Zp?=
 =?utf-8?B?a2ZpbGZudkdqVzVuaDNwWWRJajc4eExIWFAwVExoSDdSaXllRXJhazN6emta?=
 =?utf-8?B?ditlcHRJRHc4cGxiWjdkOUFHOFZFbFFiUTk2TTduR3lHM2NzZEJlWS9tczVa?=
 =?utf-8?B?R0xYN1hkUkk0UEhOT2JJSjBwa2ZPZFZsUWxoOUN5NzFieCtkckE4bURINHlB?=
 =?utf-8?B?SzJ1M05qTDlwMUxrcXZ5c2k1aVBGVDN1V3I1c0o4TWhNeU8vc2F3QzRwQTFo?=
 =?utf-8?B?dlREdmFXclAxZW9qNmZKVE91SUN1eGxnYU5Gd3hGdjR5T1B4bVFQRklPUU1C?=
 =?utf-8?B?aEw2Z2RZZkxOMkJHUytwRzdvbXhyZlVCSlFjVUZ5ZGVlSmNBNkpCZG4wblBx?=
 =?utf-8?B?Y29YWTZOa1REOFhDNFBrWWtGNzJoV1dOZ2Zmc1huK2JNYzBaWmtOR0s1ZGFw?=
 =?utf-8?B?WHN3MFlEVEVTczFoVUJ0YzNBaklWYVBoNGo5WXp2elo1ZURmaGV0SlBBK05X?=
 =?utf-8?B?T0tiNWh0QkFPbUtHejF4MzIzQTM2V0s2Q3VVK29PL0d5WmRURVoxRnhGUUg5?=
 =?utf-8?B?WWVHK21PVzllVG45NUluU29rSzRjMzZlZWVnZVNoZzVKeEs1WnVuNkhZRTRV?=
 =?utf-8?B?Wk5JWDc4OEduaFBHRmtjdlBhZDBUUUgzam1vZzNkQ2ViazVsZkRRQzNiYTdp?=
 =?utf-8?B?RXpoSlhGRllNVFBGRjlzRXV0QzdXZlpEelhyKzlzQTRkWXFkNkpTbjNwcFc1?=
 =?utf-8?Q?w5gr2H/QsYFcGViXEpFPGvnhJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 951a86c7-6771-4778-b1aa-08dbf251bd17
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 09:41:48.3401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x5uegcW5ifP7mBFW7mHASEeL+AqkobVq4DSx5GIBSenTGz9aQYdhZqubxMSSPpZzSb1z8hnTby+ydIEEwxxgpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7578

On 01.12.2023 09:50, Roger Pau Monné wrote:
> On Fri, Dec 01, 2023 at 07:53:29AM +0100, Jan Beulich wrote:
>> On 30.11.2023 18:37, Roger Pau Monné wrote:
>>> On Thu, Nov 30, 2023 at 05:55:07PM +0100, Jan Beulich wrote:
>>>> On 28.11.2023 11:03, Roger Pau Monne wrote:
>>>>> The minimal function size requirements for livepatch are either 5 bytes (for
>>>>> jmp) or 9 bytes (for endbr + jmp).  Ensure that functions are always at least
>>>>> that size by requesting the compiled to align the functions to 8 or 16 bytes,
>>>>> depending on whether Xen is build with IBT support.
>>>>
>>>> How is alignment going to enforce minimum function size? If a function is
>>>> last in a section, there may not be any padding added (ahead of linking at
>>>> least). The trailing padding also isn't part of the function.
>>>
>>> If each function lives in it's own section (by using
>>> -ffunction-sections), and each section is aligned, then I think we can
>>> guarantee that there will always be enough padding space?
>>>
>>> Even the last function/section on the .text block would still be
>>> aligned, and as long as the function alignment <= SECTION_ALIGN
>>> there will be enough padding left.  I should add some build time
>>> assert that CONFIG_CC_FUNCTION_ALIGNMENT <= SECTION_ALIGN.
>>
>> I'm not sure of there being a requirement for a section to be padded to
>> its alignment. If the following section has smaller alignment, it could
>> be made start earlier. Of course our linker scripts might guarantee
>> this ...
> 
> I do think so, given our linker script arrangements for the .text
> section:
> 
> DECL_SECTION(.text) {
>     [...]
> } PHDR(text) = 0x9090
> 
> . = ALIGN(SECTION_ALIGN);
> 
> The end of the text section is aligned to SECTION_ALIGN, so as long as
> SECTION_ALIGN >= CONFIG_CC_FUNCTION_ALIGNMENT the alignment should
> guarantee a minimal function size.
> 
> Do you think it would be clearer if I add the following paragraph:
> 
> "Given the Xen linker script arrangement of the .text section, we can
> ensure that when all functions are aligned to the given boundary the
> function size will always be a multiple of such alignment, even for
> the last function in .text, as the linker script aligns the end of the
> section to SECTION_ALIGN."

I think this would be useful to have there. Beyond that, assembly code
also needs considering btw.

Jan

