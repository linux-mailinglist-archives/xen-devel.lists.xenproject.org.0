Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E60DB7EDBFF
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 08:31:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633999.989163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3WqX-0002tP-8L; Thu, 16 Nov 2023 07:31:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633999.989163; Thu, 16 Nov 2023 07:31:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3WqX-0002r8-5V; Thu, 16 Nov 2023 07:31:29 +0000
Received: by outflank-mailman (input) for mailman id 633999;
 Thu, 16 Nov 2023 07:31:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r3WqW-0002r2-F3
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 07:31:28 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on062d.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 263ae99d-8452-11ee-9b0e-b553b5be7939;
 Thu, 16 Nov 2023 08:31:26 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB9174.eurprd04.prod.outlook.com (2603:10a6:20b:449::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.19; Thu, 16 Nov
 2023 07:31:24 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 07:31:23 +0000
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
X-Inumbo-ID: 263ae99d-8452-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PrHhPeVdr41+dH9uNrZDMNlpLVfnLnh6v2Aw1wBfl8LuJ2NwoJyP8umhfNWGQEybj+Dr+/+RhBEdUL4SGvErwLafjd9cK+TMXhkOPhjhGlPW37PbDZ92j2Esxqgx+sqXSPlVpsZWzZE73M9dna3zVCWIa7riX2MPF8orHKSfKGr0Rk2d5i4U8imxkLCli+jYM4lbPxfrEJ1mgERjQPLZE2iOU3ojelO0pDijhbkLv+Iw37N7DU0vnQHujA0VQe1wg6iyeyGEIC0JsIw3+iT20zsvQISzqajwU1vqJWT1JZbGN+gKV5kXdfa7nG+a5mz22x+QGEEtTq68sPZEM12aKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4fV8aDHUmiKW/vEkEewaa9sCPQ6ef9YVEE1OAeHAeQ=;
 b=V9K3o9fHUFtXuTMGVVm9rl/ynhmGbbeXCr2Manipq5S9FwJOC0t8GDjtm4VNWn9dyUhQvCdtxYeqZiWMXRG05dPSfLIvqdYYyxEqkDYpFb1bKIoXDI0odVk26DIH773RrqJVyby2Uz2R+La90z3EYPzNFgPKAROH/Fj5ZFIpoXTlqP/25hIF3oT6k9rrkCtgH/B6ZugE07pqeJY+iv4eLzCfjGTwy0pLaAj7LC0Ov1hgnojvhlMf7r9XL4buqCHQP2IpOgiY7lPtjYXfZcFokE0QuLGlCpkGscoT5kyZWmunOES5rUpdKaNPprasgTQ6Nrot9SbPUfleIznuYISEVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4fV8aDHUmiKW/vEkEewaa9sCPQ6ef9YVEE1OAeHAeQ=;
 b=UDyo+6RHZJDxVKb2yIcFiFG3Y0VmtFuRaJXGKzuSq45yRh1kWVvDgFWDIiHDI8IO9FqTBwYw+daoE0bx/f9++mJeBhPEKd3DiB0Q8xSdbl152GcX02fwEg6lye+j8qtJ1cDMeyzR7vvq/v1wY0oIUSB562gf6hYLghPRkRaO2M/9gYYQt18ew9gbjQuttZLtO7uHPH/uTHlt7TSz5VsO8fOp5YdCATIgTJcCJuiYvHNmoY3DX4tuOveviTwurxMu2FfLLA5b9LmITQM4gCuYbSzN7L0uxiDRJO/L5VEluQhuDEItQC25hhsr4JJ3qlycLekxLPIj2srRZFko63ck2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9f599582-af8f-4672-a4c8-81ed3493afc1@suse.com>
Date: Thu, 16 Nov 2023 08:31:21 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/15] xen/asm-generic: introduce stub header numa.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1699633310.git.oleksii.kurochko@gmail.com>
 <1b50e70d168a1b084ac40711096c38abe44a7b9d.1699633310.git.oleksii.kurochko@gmail.com>
 <242781b1-9693-47b9-a3f4-bdf5700803db@suse.com>
 <5634e1b953b0b8b1b3ca02b01f84d8093e360237.camel@gmail.com>
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
In-Reply-To: <5634e1b953b0b8b1b3ca02b01f84d8093e360237.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0128.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB9174:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cba649c-26fb-4760-4b61-08dbe6760932
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+FKfw9xs7hBqPNEVIrhQC2ZdZ6yFHHoNcqM6Wkf+FIgpvSYr4L1RibivQogZ/GYwaUiwiVU8AmZTCZIICjIHRRJL49dYeMjqV42cp1KTLMrJRhoOnzWtukEF1i4cPSq6Df51hjvMpMkxScT2DOGgDz0Mdd0f7sbJcKd1GSHp4v0eZjB5vHDC12xqRloQJXEU7hfQsgx3qogeiCTqkmU0y3aA19nN2/ZwHNxd+AaCkcW99tj3Fgv8UkAzDJPdJc7IuUJG/WK2O+pYjBV6Y6Ev18bzh9QhMvVIuTXXJyr0ApYDUeujMS5tCyGdVQ6ETNjaA24Jq77sg7/aYdDaGXCncPCGd+A7dOgEzhxtcoijPa4Yz2+PaVn1pqnHubRDeFOxnbuIYHbg9dxpJFc7GiCPIrAsfi7NFLGib+N7t5AblSB8VzLLSRu24oxFTet7fXn/hfZYSTYmXLFpp4ut7TR3sk7x1yAXLAeLhf3aLvLNgckIZSwJZ5Gfi1FML+jRzw78C50sL7ChYw3+IRb/5YgDibRSun+bTtSmaKdfQh+X1MeAnaZnwJf7OnHwTy7geOiWwpQuwmIz4Lj79Mk/e9PA7fLoUTD812wbBgffy1NPesADLrrvXXe7zWTlB5kaNxse1Nitl7QVIEkAr2U7xgimYWxgKQN8eTjQ9dWk6/GKZY0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(366004)(376002)(396003)(136003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(6486002)(2906002)(31686004)(66946007)(66556008)(54906003)(66476007)(316002)(6916009)(478600001)(38100700002)(8676002)(6506007)(4326008)(8936002)(86362001)(31696002)(53546011)(66899024)(5660300002)(6512007)(83380400001)(36756003)(41300700001)(26005)(2616005)(4001150100001)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cDJZbTQ4endneEhjajBqSjQ1d3JOMTI4MXdZWUpTSEVQYkVXcGlKRnlxQzQ3?=
 =?utf-8?B?cyt6UWg0L3JuUTJuL1EwaWpSbjlJanNIMGNiaHMvc1l2N2NHeXUzZ1RNdDd1?=
 =?utf-8?B?WFg3L2ZjM1BSS1NTM1pSMlNOS0RMZ2V2V3M2VVJxOUlLUU5sc01VcmcxVjlq?=
 =?utf-8?B?bHZlRm0yZ0cwNUE0QUcxREJYcWRWT0hNNzkwejMzT2NIU0FiR21oY2VDVnhi?=
 =?utf-8?B?cThKck1IanFieWp4RTFBVGJSNnYwN3NOUUN0WlVVeXZmR2lEaGdqZC9tZ09n?=
 =?utf-8?B?NVlBamI3a1JnTVRWbzdQdG1ZMEE4cFE0bE01Sk55dzB3cVQxbGM5REp5bkxW?=
 =?utf-8?B?TXJVa0d6azFnMmV1TFY5Q2wvR2l4S2lsVlhxRy9IR2l6Y0prVS9zYlNDQllr?=
 =?utf-8?B?SHcxdzVKT1ZWdHFKWExJYXFOZUVoVUZnbSsxTE1PZXhlM2NBanAzczdhTXpV?=
 =?utf-8?B?TTNhZURLMS9MeEZLUkJ5dGNINVVjb3RwcjVicThmWHkzVW03RVlqaTMxNEN3?=
 =?utf-8?B?amVZVXhlc2dBNVJGbzNVUnlxM050YzdrdzhyNVVheDBBWVd6U1FoRzBNTFFE?=
 =?utf-8?B?UzAxdjZWVFZMcW9DVXFDNDhFUnBaNFI5NGFqbjlNb3laRUNySG1RcHh3QWFt?=
 =?utf-8?B?Y3ZpQ3hrQkZGUnRTRjJ3ZnYwcWI0U202TTlYS1NJdGdscTE1TWNpMmR5Mzlu?=
 =?utf-8?B?Vkg2NG4weXpGYTR0QzNyYjhScUhLd0dhb1hIL3hNWW9ReUdmYm8zVlFldVJx?=
 =?utf-8?B?cGppd1RocUZkVFExL3ZZNzBDVmcrOS9nMlFHYkp5MkFGdzZ4amNUOGw4bDNn?=
 =?utf-8?B?MjNubndxbEhneWRyTDhnOHFqRmtPZ0N6V2RsMnIyWWhaYUcvMGx4KzJ5S2Rz?=
 =?utf-8?B?RjFxdnNOZ1A4UHF0VC9DeE8zenE2SEkwKzlzdC82aFVZN3A2cGQzQTIzY3lF?=
 =?utf-8?B?Ly82UU5rOFR2NlBNNDhTV0R3Z3IwMHhpcHBxQ3doTHMxb3FIUzNJdUZaWmhR?=
 =?utf-8?B?c3hPNi84Ym9HcWN6YW04NktkbWJ1b1cwRHVMcjdUVStxZXBzcTlHL3Roc1Rx?=
 =?utf-8?B?NTNYdlpGeFQrMGdsd25tTDlOSGhFUEcvb0Y2QkhrZFpqM0dtU0t0MVdteFdV?=
 =?utf-8?B?NTdtMHd5K0MxUkg3MFM2OGlOa25XMnYveE9VSDQ1RWpoTmZ5UDhOU0FqZnlv?=
 =?utf-8?B?V0ErbEtsUWdIY0lueXpENEg1WE5vMnRMYTl4UWVIN09ub0VMbXRxWjBVNWs4?=
 =?utf-8?B?YVFLc1hISDQrRldieW1lYXZRd0w4UDRHWDBLWDNaRjZ2czRuUzAyR0dkNVI2?=
 =?utf-8?B?aFRWSUJYaEVtaWdTYlRKUVF3dVF6cEtaMFJQRGRIQm5vb3VpczU4Rkh4aHRI?=
 =?utf-8?B?eVlONDhUdWt0cksyZWtOaERlZmord2dzRkhWS0Y5MU9rS1JyVFcrS2pUS2pB?=
 =?utf-8?B?TTRWdUtFRDlEUnU3R2ZyZS9hVlJ4RUJkSnhwZ2k1cEhMMWRzMDdpOGdhTERU?=
 =?utf-8?B?TU5JN3dyOFUwMDZMaENRQUZ3cGdlUWdBQ3pVKzBlVVRXandtYUdlNFpMNkxT?=
 =?utf-8?B?Mk1PWEVJRHlvdWRYOXVQNDN2QmUwQUpqSFV0UjM4YlFkVDZaWlZrd1E3Q1BK?=
 =?utf-8?B?T0lxV0Y2bGpPalhkaTc4QzVTWWtaa0VtT3prVnRNeHZ5d1N4NU4ranJKZWE4?=
 =?utf-8?B?V21wUzlyczArcEVEV2U0aDgxaTVvSndUVHV3K2tuODhUcWNOZnl6NHZvSHBq?=
 =?utf-8?B?dWxFQzlJTmxDaXBIVHY4cmVZZVdFbzZtYWh1TzVha29FenV1MkhvbzY1YWNo?=
 =?utf-8?B?VWFyWXlBeUI4c2NBVGtXNlJEMjZQbC9lS0NnU2J0Y3FnbEx1QXFSV2lMM0No?=
 =?utf-8?B?ZU5VUlZleHlqTlpwcnQ0TWUzSUpFUXAyUEEvZit1MlBOQTF4L2NCaVpWNTFv?=
 =?utf-8?B?Z1F3NXNCTy8zVTZ0cHZmVDNIWWVvR1dLT0FyS0swMGJtT1hCL3BvN3hkUzg5?=
 =?utf-8?B?ME4wZER6dzNHNTJOWVh1ZFRCL2wzUVlGS0VIa3RYSDlkamdGdHBUTEJya0NI?=
 =?utf-8?B?MXdBbitWSUNkRGpldlN1YVFoR3ZSSmF1ck1DVjdDYzVyOEpPMy80eWJCS3NB?=
 =?utf-8?Q?LdkpbXwHF7v5g7Z72ft3H1JQn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cba649c-26fb-4760-4b61-08dbe6760932
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 07:31:23.9112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TCBvk4CFPTlLpIwjP00UuBYfipXKgOL2kTEV9uXNQ6GQatSLsxX65QLuSX80yCLp4ffTi2oDbKEZg20u7Klqjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9174

On 15.11.2023 15:11, Oleksii wrote:
> On Wed, 2023-11-15 at 11:07 +0100, Jan Beulich wrote:
>> On 10.11.2023 17:30, Oleksii Kurochko wrote:
>>> --- /dev/null
>>> +++ b/xen/include/asm-generic/numa.h
>>> @@ -0,0 +1,40 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +#ifndef __ARCH_GENERIC_NUMA_H
>>> +#define __ARCH_GENERIC_NUMA_H
>>> +
>>> +#include <xen/types.h>
>>> +#include <xen/mm.h>
>>
>> I'm afraid I can't spot what you need these for here. You clearly
>> need
>> xen/stdint.h, and you need xen/mm-frame.h for mfn_t. Yes, max_page is
>> declared in xen/mm.h, but its questionable whether the header needs
>> including here for that reason, as all uses are in macros. (We aren't
>> anywhere near consistent in this regard). Plus you don't also include
>> xen/cpumask.h to pull in cpu_online_map (which another macro
>> references).
> I agree with almost you wrote but should <xen/cpumas.h> be included
> then? It looks like it is the same situation as with max_page and
> <xen/mm.h>.

Well, yes and no: Indeed the minimal requirement is to be consistent
(either include both or include neither). Personally I'd prefer if
headers would be included only if they are needed to successfully
compiler the header on its own. That limits needless dependencies on
the (otherwise) included headers. But I can easily see that others
might take the other sensible perspective.

>>> +typedef uint8_t nodeid_t;
>>> +
>>> +#ifndef CONFIG_NUMA
>>
>> Isn't it an error to include this header when NUMA=y?
> It's still need to define arch_want_default_dmazone() macros which is
> used by common code.

Oh, yes. I somehow managed to overlook that. Some of the #include-s then
want to move inside the #ifndef, though. (Ultimately I question the
placement of this #define in this header, but we can deal with that
separately.)

Jan

