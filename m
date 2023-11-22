Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2EC7F3EDF
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 08:27:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638459.994985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5hdX-0006aa-1X; Wed, 22 Nov 2023 07:27:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638459.994985; Wed, 22 Nov 2023 07:27:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5hdW-0006YS-Uo; Wed, 22 Nov 2023 07:27:02 +0000
Received: by outflank-mailman (input) for mailman id 638459;
 Wed, 22 Nov 2023 07:27:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r5hdU-0006Y6-Uf
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 07:27:01 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0619.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 856657c8-8908-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 08:26:58 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB7553.eurprd04.prod.outlook.com (2603:10a6:20b:2d5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 07:26:56 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 07:26:55 +0000
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
X-Inumbo-ID: 856657c8-8908-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WUuYPJ03XiXAKCeiRU0MDcSZm2gAgpGopnyJxfy7pc8NWlmAKDN971E98bBXuMUl9pPI+6YmJtV8ewPyEGaN0/zDuz3hiCRwo6v5hsO6CPR4gGBId3B7imV+bj6pj7cj2/PCLSdBr7AAMymIRWTnm8/wklN2sxmMq3ufgwYn3SdA0H6jcHsPN4unSZ6ziFeoXgQSa0UHwtsuhQ2+AA116RghgJClcvlkrjZBJZRhksQ0ppFjZ7giMiXPH5guyLmJnMdrS80ke+JIdE2WWyEe2gSme+WSRevHPqvAvJQ+ZY1r078Mdz94EPeg4BqNFRHXmzEhpOvQiPy7DD5TCzj+ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OrRT2d6nhLuczwYoReeGVYFpUDdj/NqW5AyC00HBsBI=;
 b=iy0C/j7RGg3ub6Wq3VEJHDc3zWHYhDw/Sgof2gDRoeveljYAYae90RClgluGD2szRLSr+xf3xlw07SdNs9hrNTwOTQJHjin3B2VVwHagRB3YkkDnU22AnLCuU7NNr8TLcU+wxtwu0GcM+Do16TothcmUQSaIwLa+7N9CufnVReQlmh1VCT9JB/xFexmBd2fhihaV4wHIoZe1qLRFjpkWzmvH6X2KN1MlS56CKOS/e24Y4jM737lLUNIfWBIn3wUYo4UPKmyqnSxj+9R57egQ1yirxtams1tQPKei94ybt35m188tb3qwIIbfrykOjfy7+bvxm6vhILwE3C3zXC99Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OrRT2d6nhLuczwYoReeGVYFpUDdj/NqW5AyC00HBsBI=;
 b=FQLDVYzP1su8Ql6X/GYbBCuHnWbfnqT3g5ifKGumASGYEPiydiVF50zhNSQHfFor3jzSdWYI7n/LqUVnE0o7Grs0wV6yigiXIzch1t/iAxYvcN/mW239rV9vlTDInNZFUrEmXQzkfsVk0BoYirxnI3Q+9oS2hAH8q90u912btYkWO6+VU1mVcqTCdc+IrNKfvP4DiQZCIlTRZPFyOl7/SAjDG7/txEjxsge8E2hrffgLGxhhtukBCLrFdLDp3gZBbp7V1Bk65FDG6gdEUEG0yvdjbNHlMnLptg/bbh6UhDJHFHAmq2TJq9tLonp3dZv2fwwuOFnpRluZz55JDa2YlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <aef9579b-f32d-4bc2-8be9-f875605d17a6@suse.com>
Date: Wed, 22 Nov 2023 08:26:54 +0100
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: deal with decode failure in predicates test
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
X-ClientProxiedBy: FR3P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB7553:EE_
X-MS-Office365-Filtering-Correlation-Id: e3a53913-a2ee-497e-d2f0-08dbeb2c67e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k+U9sZlIucHCV0VGhDLbB75HU0YcgARzgpVs0ngsL9q+NtrcGYZQ6yalkRpVm2ikREi/fNcdGY+Xzex8QNwJ2YVmCmQkebjRyGbb0gYVtXfgvh8/fgAISHWg541jamVLyvEGusxDvEWSlVK4P6Us32iAyUxJp7hucDbfy2w6UxRHxRES7bGvWVc4vG3Z80BB5h4MPZZ16gDfCvTW0S4pMppX1FgPj4NfDUVA7AS52iF8xm/nJVjDObRqAxbu4ppqaaQ4rAZ1CucdU3HBb10vwdaMN4OQVQTymbihWvqQYwKXXWjBXOc4U+8qLGXY9heVNZnOybvWiRstLNdu/7bfFixIodo3i7o9v1DS2WJRTgnrfqjl+eoGPnSvBT+g/sg45MdqNNsP70ZUMGmRJ1BRazSF07PyR8XVHIOfJqWZYpFKi7iOe1EpxF/uo2ctfpsOwoc4ZM/6/dkkekB3oVVBZsR0MdxPdEsnt8kArNHVsFD4Zef7Sv9vpa0E0fUAf8XgOp4mCsJ0+IxzomFf7BlYdJBfr46OQReX2hbP5f0htL3AEaYYJmCRSdvkIMDT6GFcdRdzv/3cKhZEftmEwbdaSPVRr7DBhZuAMj+BXKYj4tGYh6CeCDLh65jW9EZFZH5rwTd4kSshYkSzmm9TAs+o3g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(136003)(396003)(346002)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(54906003)(316002)(6916009)(66556008)(66946007)(6506007)(4326008)(8676002)(8936002)(6486002)(478600001)(6512007)(2906002)(4744005)(36756003)(41300700001)(38100700002)(31686004)(2616005)(26005)(86362001)(31696002)(66476007)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEJoMHlrNHp1V3hFVWE5VnYzT2ZkUTRhYmVsK1liMUx2bFZRcEJSdmNPZXgv?=
 =?utf-8?B?RXpTRzRUejd1djV2UnU1V09zMm5ndmdGM1N6TXBpSG56Z3RZZCtVVVN3YVdU?=
 =?utf-8?B?b2FDbG16cGE4WnZiWVlFL3NHY2xMR1QxY2xNTHN4dllLWlZza3NHeUY4a1FL?=
 =?utf-8?B?RmdGUVVyaGVoeFpUV1hpQjMrYi9CcVdNaFFFYTh1MnZEWXBKOHIvYWk2cVZv?=
 =?utf-8?B?SThUTFkyYTZTNmlNaWdiVjMyTDIxcGlOMU9XWERPQjdWUWFhNXQvY1FWNW5p?=
 =?utf-8?B?ZVpWNGI0cnpLVlZ2a1NITVNpeHdBSk10WDdzRHQ5ZHZJMWFJbzQzTThjQ2VD?=
 =?utf-8?B?VlVHS0dKTjZxTVV1SzVqMUxqNENHMlJiV2NlcENqaVVjaGRVcFh2NDFacWxo?=
 =?utf-8?B?dHpEUFlRbXhhS1RMeXA4aGlpRU04U0RkWEpNSTFsMldlUXEyWGJTSjc5U0la?=
 =?utf-8?B?cjVtRG5sazJHanR6NkcxTVpHNWtvUngwSmxYZUR1aVd1dVBRdUsyVTFEbHdK?=
 =?utf-8?B?dTNSTFRQTlc1SmZFZmcySDQ4UUZCOFZhWThaUHdzZmpoSHFEMTlvdEJrNE0y?=
 =?utf-8?B?RndEQXNQZXNNNlBkSFZrQkhEZit0ODdpbTA3REtMa1Rnc28rbVVlWGpZbmx1?=
 =?utf-8?B?U0tqSVFYV2dEWWxPMFFHdUlyRW8wbXJPMC9NV0NWOFNadEErSzF2VEhnN0Vh?=
 =?utf-8?B?WFUrQ2d4QzE0U2dhRTdUQlhycmxTQS9mWnNFODJWeGZRWlpOekNRaVV2UVg2?=
 =?utf-8?B?SzBOcmRCSXVONXZGZ1Fyanp5WEhMNjE3dXJWeE5rbU55Vmc4U3g0UUxlK2c1?=
 =?utf-8?B?Q1Q5RW9DSTRrNVlSV1IvbngrRUJCcGdhMFFSeGpjSm5FdUJjQnIzN0JDb1NL?=
 =?utf-8?B?YTlQREtwdHZiV2tjNTQyeVFtWlR6TnQrdHhha1FLcFE0QXg3TWp3UFJCc2RP?=
 =?utf-8?B?VnRzait1ZVNtRThvNkFaNWFiSzUyNUZlOVJtS2dxLy83V1dZNWlKOUQ0ODA3?=
 =?utf-8?B?c2d2OC9TcCtRTjVjY2Y3OEtEM2FrQzlyYUkxV0gwNnhCTmV3MWVuY1JGc0J4?=
 =?utf-8?B?Sk1oTWxWVkRSb1NBRkZwSmk1NXVRcWVKdllxRFBDTU1KMU51V2lpK3VSOWFj?=
 =?utf-8?B?ZjI2WExkRjVTRWp1WDBOcFo3ZGR5bTBsMWtTVzdGL0YwYTNpV1hSell5eHBk?=
 =?utf-8?B?U0hVQ080WXlhaHVPc1lIL1NkOXNnNmU5YkgwRFZweDJYdmw5bzVISi9wQ0Zn?=
 =?utf-8?B?MmN0bSs2NFdpR3NPWFFPRFJ4LzRnbXpYR244NjBockVNNmNPU3UrS2Y1Wi8z?=
 =?utf-8?B?bjJldG5oLzk2Zm1UNXhubzZ2d0FsbUxXSnZNV093N2hHaUFYNlp5UFV2Tkti?=
 =?utf-8?B?dHRzMk9iL082c1NTUWVWNkxVTXlEU29VV2pURU9uNEs5Q1A4ZVQ4WTFkUGln?=
 =?utf-8?B?K0ozRFkwNVp5SmJzTVVxRExxZ3hla3ZGcEdkejdGU2ZXT1A2cHJUMmhwbzhp?=
 =?utf-8?B?aFFPVmY5SGU0TmhDb3J3OEQ1Y0J2c1p2NkFrUDNoSDUrZ3ZPdHB6WVZscXhp?=
 =?utf-8?B?OW9aRzdDR29Xazh6cXhQMytJVVNoMERCenVXUnduOXpnSHlCOHAvMk0zY3Qv?=
 =?utf-8?B?VjRhOHo0dXViUFcrTng2YlZKbFFBaWkzUmtuQVYxdEVqc29pTS9GYkpqbXpF?=
 =?utf-8?B?ZUl4aFpaRjZKVGtBcWpqbm9vMlhLdXJFSjlhTjZ2SFZwc2dwcDZURGhNTkFV?=
 =?utf-8?B?YUl5TktMR25WTlVMcG42bFQvQzVkcXgyWStHK3cvR0lZbkJkUk11czY0alQv?=
 =?utf-8?B?SUlNbHhaSHdGVENpN2w4aFZNYXBwRGtOQlRiaDg0ZTgvMzBwRkNMRHVQeVI0?=
 =?utf-8?B?NUoxWDNQRmtLM3Q3UnJjbTRQNzQ3RXd0M0Vza0ZhYkJMRjZHNWlCYzFQUG03?=
 =?utf-8?B?aS9FZ3FwWTc1U1RnWmxPS1dGVlhXamNRR00yT2ZGdzJBWHh3VGVjaCs0TnVG?=
 =?utf-8?B?NWVqdHpMM3VBTng3bEZ4Sys2M0ZQcEtvdkxZcVBpY1ZSM0krUG93TVIvQ0R3?=
 =?utf-8?B?RHdLdWw4aDdBOGlPVHhqOE9RZWJpT2RaTmFxd2NablFLMm4yWGN5N29NSTRY?=
 =?utf-8?Q?vITQovsvzJd2RL34igZsLcjkU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3a53913-a2ee-497e-d2f0-08dbeb2c67e6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 07:26:55.8555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G3xmgb3aRsTFJv+67zLxhx5dOkNtBPUqEcMjpc5y8gUW+EbQlqjgldUVZ0ict+XvyoFAc/SBU3/7YR9PxR/LLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7553

Don't let this end in SEGV, due to the subsequent NULL deref.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -2189,6 +2189,13 @@ void do_test(uint8_t *instr, unsigned in
     {
         s = x86_decode_insn(ctxt, fetch);
 
+        if ( !s )
+        {
+            print_insn(instr, len);
+            printf(" failed to decode\n");
+            return;
+        }
+
         if ( x86_insn_length(s, ctxt) != len )
         {
             print_insn(instr, len);
@@ -2218,6 +2225,13 @@ void do_test(uint8_t *instr, unsigned in
 
         s = x86_decode_insn(ctxt, fetch);
 
+        if ( !s )
+        {
+            print_insn(instr, len);
+            printf(" failed to decode\n");
+            return;
+        }
+
         if ( x86_insn_length(s, ctxt) != len )
         {
             print_insn(instr, len);

