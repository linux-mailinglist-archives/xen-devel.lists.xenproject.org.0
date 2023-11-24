Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D987F6EAF
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 09:42:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640254.998256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Rlo-000333-1K; Fri, 24 Nov 2023 08:42:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640254.998256; Fri, 24 Nov 2023 08:42:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Rln-000315-TW; Fri, 24 Nov 2023 08:42:39 +0000
Received: by outflank-mailman (input) for mailman id 640254;
 Fri, 24 Nov 2023 08:42:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ulgz=HF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r6Rlm-0001P4-8Y
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 08:42:38 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2057.outbound.protection.outlook.com [40.107.7.57])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6adf2d0b-8aa5-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 09:42:36 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8326.eurprd04.prod.outlook.com (2603:10a6:20b:3ff::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.14; Fri, 24 Nov
 2023 08:42:26 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.012; Fri, 24 Nov 2023
 08:42:26 +0000
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
X-Inumbo-ID: 6adf2d0b-8aa5-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nDi1nvd3Xw4sUGV7iH3sXjKT6LB8vIuvFHyklTccPlwsN5Iy2ywXFKOGwVfqPlCx8dUZC540vXWBkw94sOF6oQKYTe3xznYWX+bpXT0xuz5+kPSPB/D/qiI9awSEb6m6NpW23oRpwONbzO/Bj9aysU9dV5Av/nErVR8hbzyqEKN5XIcQel3L9KJWaYj68qWuxGLvcFhhNHqUNow3ia4eX76LZLAY0vt1aKy2MNijKYvl0SXn59vxNNhyGT6uN1o5aE1SA3y8Vr/op2G12re5V4bTbxnj4Z6x/Ed7xGzihMl3ov+yqCQvsEkFKreZXEz9QCJ0QCV2OCmXmfw4kEC0Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wdSUqBnPwDRt8zu4z01Axi6UTP6JDlgg/GZ7r8i/IhA=;
 b=GGC5dyBZgkoNqluL2Uqx5WuJRUc5f5VTAym29ZpP1htDCWPF+Zwg424gDYvlpY5604O9IIlAjhzl6HZMcZMa3R0on6sizZTtZhsGwRwnHIvPlNxPIAWJcetcTvZffcCzUzAH69PWgIbHWdg1m7Cv3uAef2xUAdCEow+qtqd/snpGMaecXJwlB7ovvgex4ua7gds0BXk86lckbkIkXeBK3mL1mwGOur9UYW/FVrO0dWVh/CavcHAO0tHL9Er/P4+Mr7vdT8YO86jo2MsWomLs5jFFln7U3UN9tVxkhRJ1EkZQz1qz5PEVuUiCuvdsHXbJL9QlEBZ1x0HAS17C/szsXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wdSUqBnPwDRt8zu4z01Axi6UTP6JDlgg/GZ7r8i/IhA=;
 b=mcE0yhhbkSkuwJjJyxASE91IWcTDIPdq4RGsSmbgVrkDpLiNfigqfBL/DmMQvBfLVWlM2cjEfW8Bolp8GP+ybmj9n4CVA2go7aZqY+gZAY5UrQlLXiqvEbbnV99QEkyM1v3CnROLFVjj9C9L5Fsjn4EWoMnYiQd2TXfBFOQnc6I2q0xKTUTUFv91JxPE6CXleuBBmiXYJ40oZrqAHdSt3q7GcctykXPaKFeKT0UHSrBbBuG36usralGK8eJNqhpNkCbyf6NSZ+jJ37DkxTLo2ekYvBwDl4pv7Dq8wHkQbMqbSmwKh11E/VZgfKJUai0Ehuaf7BekApWWCKTaUYqtkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <99ca892c-f54c-489c-9601-add357e4201c@suse.com>
Date: Fri, 24 Nov 2023 09:42:25 +0100
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 12/15] VMX: convert vmx_vmexit_control
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <b63b648f-02d0-4e52-a5e5-94ffd5666a14@suse.com>
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
In-Reply-To: <b63b648f-02d0-4e52-a5e5-94ffd5666a14@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0408.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8326:EE_
X-MS-Office365-Filtering-Correlation-Id: d265bd99-88a9-4437-bc50-08dbecc94928
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PciOZ3r7utZQ+QGmZZZCHi1ujw0Cd2CZNB/wLoPTbxqN8Rceiez3qiAYBc9XAJCnDrIZT21bk0uO+kDTyKFlxGHKouM3sUG8p0oWY0ZsR6+wLHkKvsA/s8l0Cr8vWkE7pkU5yESUsvLKY/lnqwijvS9R9Pu+SmtXm0j9Jc2I66sFYsePa6zfQx19m8UKtVS636yONV875TyXMp6pHZT4G18kr4I6CmWWjfnYLmkyGhoY//xEZpCIkRl2TSPwXRMp39taIEEHcLJePZCKsFdn1XUoRUDoIttNSZA6A1d1aVRsBnWqOa8YrbGSqEuQxJzWhc5tk/eaetVoYGae1o64K1CF9JikM1X8q22f51IZoI+RiwjFdgtQuQ7FX7HqhqpypOxBIb/WD2wBCl4E0ljODoL7yt0YRuwdfrTESPvCb4FThsEkiI8caJHHfhwQ7FOoFgcwGempNqvsv3cQ/yocQKWe9g3PUG4Xb4367EazmluEu1bNl+iRYBA/dvFaidn93C0IuF9CfoDcOI4aXd2sNgSCviCUB1+98j69uEYH1K+gSGzFVibvMt5S6KrQBTN8GGW1GdGzbXKWRhZhRCQAP3g7r4ZvU8S9OtCxQJGKa5+Nmoa0GIwA6BMECN/6g+evypLsqNxnSlPn/4vax4bPiA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(396003)(376002)(39860400002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(31686004)(26005)(66946007)(6916009)(66476007)(66556008)(54906003)(38100700002)(36756003)(31696002)(86362001)(6486002)(83380400001)(2616005)(6512007)(6506007)(478600001)(4326008)(2906002)(316002)(8676002)(8936002)(5660300002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDlqK1F6Q0MybkJXZHplc3hKK3dLakNjcmczYXhMdk9zUnd0MkFJR2hxNFlP?=
 =?utf-8?B?bGJNdFpFSnUvaFN5L3RIaSs4M2NwdmF1OTFSNWxrc3NGTWRjNkVNQnlkL3FS?=
 =?utf-8?B?Rm5zRkY4eGtJb3FGL0pCZXdWb3Uwd1hpZEpydE9PeTVWaU9WbWJRMjA0Skl2?=
 =?utf-8?B?M0hIWlFHYzZTVWFXOC8vMjAwcGtqNTYrZ3duMlpqaEtnVHB1WHRUdnE2MXg5?=
 =?utf-8?B?cVl0SkJXekFOdmhUbk9COG9zb1I2RTFDQ3hrYXFzNDl1dGYyNnVyMWJQVktF?=
 =?utf-8?B?b2J3SC9veXM1ZStWWVBmL1hUNVdQZmY2ajU5cG56amdoMHo0VFBXSitCT1Bv?=
 =?utf-8?B?Y1hQcFI0VlVsbHA4cnR1RTRUUmVuR0ovNXdWeFpOd3AvQ2lGeWdMZDdCYnpB?=
 =?utf-8?B?WjFCZTZXTzBGbnBvaTlBTFd4YTV4R1o2NUVwNGpiTmJBUDZEODAyLytxZ2Y5?=
 =?utf-8?B?bFcxV0xaNG95YkhrNVVldEZEOXRSaTdZbkFpRmtJbExzb1M1Yi85M0JOeU9t?=
 =?utf-8?B?WXBad05kRGtQQTN4M2Q1ZDZLM2RraHNvbnducEoyc0czNjZucDU3OVFxY1Qx?=
 =?utf-8?B?OENsQm9zSkQzL2RSYjZwLzA1UDZZSHBKbXFzTTF5L0lGU05HOU51UC9GQVo2?=
 =?utf-8?B?dkxPRWw1NGxUdDFwWmk0ZnNTK1RlcHBQWkxvakYrcXpiZVNkN1FxVDZ5UFc0?=
 =?utf-8?B?eVZKc2o1NExoazZGSy9vN1RsbnhLSmZiM0NXMXRpT0s1ZnByQm5TZkY4TVpC?=
 =?utf-8?B?dFZldW5zMUNzbHM3MU1id1AxdUxMR3ZMUHVRME5DV0p5emsrd1VqbVdBemo5?=
 =?utf-8?B?QTdiNStQYVFZdldyeG1XNHlWOEJ4c1lydkl3Rm5sc2pTTHY4RWVCY3Jhak5Q?=
 =?utf-8?B?YTdmdGMrU1dmZVlWbUhqc3Mzb1lxdjhKamNFQ3lMR2dSRjdOd0hEcHhBSFRG?=
 =?utf-8?B?UnlvZ09YemMrT3cwTjRkY0tCR3RISHVac1Vhalg2S2dGUnVoSG5YbTkwTTRx?=
 =?utf-8?B?WjhLZW9lU3h5azl3ejcxTG9SS0FTaE9HY1NBZlRzVFNhamg4YWZtcWlCcG94?=
 =?utf-8?B?RFhscGFPK002U2cvM0orZ0FDRWh4MzVIT0tBTFpWOVhpZXlHT0lnM1hId3Vv?=
 =?utf-8?B?QkUva1NPYWh3dHlkWTAweGQ4MEpCNVdsZk9zb0JiQlhhRWlDWEdVUVFHWTJx?=
 =?utf-8?B?dGZTL0dBVkg4TmdiVFN0QkM3eXB2TUJVMk0xQ0E2dnN1NW9XeWE5QkZPR2lu?=
 =?utf-8?B?UmlTeEkraHZ2YmNpcU11Z0FrMDdNNGdEa1pzeW94TnJQeVJzTFJIZWYwVlpo?=
 =?utf-8?B?ODBhaW4xeCtRenFSSjV0Y3NDaS92QWNEU1RydW5aeTFNWGlsT084VkZDeXZD?=
 =?utf-8?B?T2VnL3dNeVhnVTd4dzE0dm54SjJ2Ry85KzZBcHpKaCtnRkZvR0p0bDJEZHF6?=
 =?utf-8?B?Mkp1RDNWejE2WmZxSDh1bTFMWEpwdVFwclRCT3dMRkJOeEJ5VW9udHRDdWZl?=
 =?utf-8?B?SnJqRks2WVlOMWUyc1pIb3RhMVp2UjJpcHVTQ1NJNjFZMWwwSGxrZjZhZ0sz?=
 =?utf-8?B?eGdUSHplLzJrcVJtcnJRd2ovdFpSNmlMc3h6dzN5SVFyLzFJTmMxeUJOMFp2?=
 =?utf-8?B?Um1Oa1hsMlRzbnNNZUZQY2Jqd2ZkV2RVK2QzUFhLYlNiUkY1c3JMNjJvVVBK?=
 =?utf-8?B?T01TWURRakQxckpadHhpMEptZjMvZDhRVHVVOHAxL1ZZT3ZYbnFuQ2NJMk1u?=
 =?utf-8?B?S1MzdE9nRENSQytLbTNvbzFFUUlxRXpZSG5reDNYazVtVGJEZlhObGgzalVT?=
 =?utf-8?B?V0hDcnBnbmpPelZRbEc1MDQvekkvRGhkL2Q4WklYcStkdXQ5c1VISzRaKzNG?=
 =?utf-8?B?MHo3aU1QNjRJQUZTK1hTOVhYS1MwaWxzRjU1QS9mNjV6ZFhKMTdNRXNpNkNW?=
 =?utf-8?B?Q1VZUDNSWUJDbEUvL0FWcjlDbEUyT3IydVpKMFU1alFHb3B1MnJVckpPVlFw?=
 =?utf-8?B?NVo4RStIMEhyMTQ2OVFsaWdjZVZhR2wzL3YyYUhTcFcxZlVmaXRwdlE5aFZD?=
 =?utf-8?B?WXZ2aXdML3M1S3FUVjJ2VFdXYlgvVVM5RzV3N2NjMkYxQVBNR2tQdmd6a1BI?=
 =?utf-8?Q?3uhYDq3KPgZfYi/3Z+VSF3dRd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d265bd99-88a9-4437-bc50-08dbecc94928
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 08:42:26.4610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h/Q+ZYYsU/+1pqKotGqHPXQ/JA6uhyRbUtiIjIrF+og9ntsl/fiZF1tr6TJrPHL3uK0ArpJoY9ccLVcJpd+xIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8326

... to a field in the capability/controls struct.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -162,7 +162,6 @@ static int cf_check parse_ept_param_runt
 
 /* Dynamic (run-time adjusted) execution control flags. */
 struct vmx_caps __ro_after_init vmx_caps;
-u32 vmx_vmexit_control __read_mostly;
 u32 vmx_vmentry_control __read_mostly;
 u64 vmx_ept_vpid_cap __read_mostly;
 static uint64_t __read_mostly vmx_vmfunc;
@@ -238,7 +237,6 @@ static int vmx_init_vmcs_config(bool bsp
     struct vmx_caps caps;
     u64 _vmx_ept_vpid_cap = 0;
     u64 _vmx_misc_cap = 0;
-    u32 _vmx_vmexit_control;
     u32 _vmx_vmentry_control;
     u64 _vmx_vmfunc = 0;
     bool mismatch = false;
@@ -410,7 +408,7 @@ static int vmx_init_vmcs_config(bool bsp
     opt = (VM_EXIT_SAVE_GUEST_PAT | VM_EXIT_LOAD_HOST_PAT |
            VM_EXIT_LOAD_HOST_EFER | VM_EXIT_CLEAR_BNDCFGS);
     min |= VM_EXIT_IA32E_MODE;
-    _vmx_vmexit_control = adjust_vmx_controls(
+    caps.vmexit_control = adjust_vmx_controls(
         "VMExit Control", min, opt, MSR_IA32_VMX_EXIT_CTLS, &mismatch);
 
     /*
@@ -461,7 +459,6 @@ static int vmx_init_vmcs_config(bool bsp
         /* First time through. */
         vmx_caps = caps;
         vmx_ept_vpid_cap           = _vmx_ept_vpid_cap;
-        vmx_vmexit_control         = _vmx_vmexit_control;
         vmx_vmentry_control        = _vmx_vmentry_control;
         vmx_caps.basic_msr = ((uint64_t)vmx_basic_msr_high << 32) |
                              vmx_basic_msr_low;
@@ -496,7 +493,7 @@ static int vmx_init_vmcs_config(bool bsp
             vmx_caps.secondary_exec_control, caps.secondary_exec_control);
         mismatch |= cap_check(
             "VMExit Control",
-            vmx_vmexit_control, _vmx_vmexit_control);
+            vmx_caps.vmexit_control, caps.vmexit_control);
         mismatch |= cap_check(
             "VMEntry Control",
             vmx_vmentry_control, _vmx_vmentry_control);
@@ -1058,7 +1055,7 @@ void nocall vmx_asm_vmexit_handler(void)
 static int construct_vmcs(struct vcpu *v)
 {
     struct domain *d = v->domain;
-    u32 vmexit_ctl = vmx_vmexit_control;
+    uint32_t vmexit_ctl = vmx_caps.vmexit_control;
     u32 vmentry_ctl = vmx_vmentry_control;
     int rc = 0;
 
@@ -2163,7 +2160,6 @@ int __init vmx_vmcs_init(void)
          * Make sure all dependent features are off as well.
          */
         memset(&vmx_caps, 0, sizeof(vmx_caps));
-        vmx_vmexit_control         = 0;
         vmx_vmentry_control        = 0;
         vmx_ept_vpid_cap           = 0;
         vmx_vmfunc                 = 0;
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -1057,7 +1057,7 @@ static void load_shadow_control(struct v
     nvmx_update_pin_control(v, vmx_caps.pin_based_exec_control);
     vmx_update_cpu_exec_control(v);
     vmx_update_secondary_exec_control(v);
-    nvmx_update_exit_control(v, vmx_vmexit_control);
+    nvmx_update_exit_control(v, vmx_caps.vmexit_control);
     nvmx_update_entry_control(v);
     vmx_update_exception_bitmap(v);
     nvmx_update_apic_access_address(v);
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -225,7 +225,6 @@ void vmx_vmcs_reload(struct vcpu *v);
 #define VM_EXIT_LOAD_HOST_EFER          0x00200000
 #define VM_EXIT_SAVE_PREEMPT_TIMER      0x00400000
 #define VM_EXIT_CLEAR_BNDCFGS           0x00800000
-extern u32 vmx_vmexit_control;
 
 #define VM_ENTRY_IA32E_MODE             0x00000200
 #define VM_ENTRY_SMM                    0x00000400
@@ -286,6 +285,7 @@ struct vmx_caps {
     uint32_t pin_based_exec_control;
     uint32_t cpu_based_exec_control;
     uint32_t secondary_exec_control;
+    uint32_t vmexit_control;
 };
 extern struct vmx_caps vmx_caps;
 
@@ -341,7 +341,7 @@ extern struct vmx_caps vmx_caps;
 #define cpu_has_vmx_pml \
     (vmx_caps.secondary_exec_control & SECONDARY_EXEC_ENABLE_PML)
 #define cpu_has_vmx_mpx \
-    ((vmx_vmexit_control & VM_EXIT_CLEAR_BNDCFGS) && \
+    ((vmx_caps.vmexit_control & VM_EXIT_CLEAR_BNDCFGS) && \
      (vmx_vmentry_control & VM_ENTRY_LOAD_BNDCFGS))
 #define cpu_has_vmx_xsaves \
     (vmx_caps.secondary_exec_control & SECONDARY_EXEC_XSAVES)


