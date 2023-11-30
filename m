Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B657FE9FD
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 08:56:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644434.1005426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8btl-0006Wc-T9; Thu, 30 Nov 2023 07:55:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644434.1005426; Thu, 30 Nov 2023 07:55:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8btl-0006U2-Pc; Thu, 30 Nov 2023 07:55:49 +0000
Received: by outflank-mailman (input) for mailman id 644434;
 Thu, 30 Nov 2023 07:55:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BG3/=HL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r8btj-0006Sh-WD
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 07:55:48 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2045.outbound.protection.outlook.com [40.107.7.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dde0c79e-8f55-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 08:55:45 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9075.eurprd04.prod.outlook.com (2603:10a6:102:229::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.8; Thu, 30 Nov
 2023 07:55:15 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.012; Thu, 30 Nov 2023
 07:55:15 +0000
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
X-Inumbo-ID: dde0c79e-8f55-11ee-98e4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FrlhXif8wM/iCRwzJn9mn3HnBMkdELw+IR4rXxo4W+/x04bruf95np/vMhVinOhbMpEeMH01K8U/6Ot2pm2agTXFjxhKqTLn8APL3GVq8XyJY6boieq/Ji650ZcVl7pc1+Z0875cU80dtYJQvOH30x8e2Zx3sqbqD6ZXOQN63B7o+cYKv2cR08Bs1YU4ij3vYZcRTM5n6oiA4Rt9BKA3ZmgkTs8VJtrVew9pN5ikPCxesN0ddvdhK3f6VxTeOgL4SlOyW2OUKoBrAmpUG8vTk+98ph8Hr+HCPrQI6BZLkFZpCIVtLg+M1Zf177uLc+0INs9k0f5OuIy9cKS4+P0WvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nHXgrOzp44h7ElafAfiU1urZW7/oYnjFt3cZ99D3DMY=;
 b=eyvqo8zDJcV4nZfjc9ylNNbYT5s0q/KB0IIwtxfhXk2EHTw/m4YOK1KCe0ORqUL22wEaE68pH15vgrBfDfxV5iCsZ0YOU28Wot4FFq2D/8V0yjZnIbQS+wgZ+TXShzO8oGz8IfjVv4bYIeSl3W8lSZglPa5L3REY2/qPbS1hk1SQ4QVdfyYwptTTpUba0O4yTF4+CIhRjWP2wjEOPBz+Y7WfZ1vIfi0ctiGGt5yG4ZvrgPNIarGZyrXMwtmoNp22I8tWVKSTMaz0nlhYt3/k4AVLMZnzko+zwt7QHJYPpDX5G3lXrC/BYAaec5kePfA15kdV5xdNXHHG71NuZ+tdhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHXgrOzp44h7ElafAfiU1urZW7/oYnjFt3cZ99D3DMY=;
 b=mmMyQXIoVHu03AAOUeR9or6gG0wSG4vuZwjc5eLH7e3KAaJpZAuP1f8CgEx75ZpOuP2sI3cE4cVlruQl49nJOW320BPvOMl8cc0dO/8v+l3PmkxirD8Gr/0X8yWfJu24u4Pon6yeBQFx+UFwz1bXs7d7y0cRvp1bXL7Uf/vlEMKwepgAa4YQHEzGDCh86bd3vHxsK5IUFPCJ2YXJNIeG7BHd1Nh0e1ux5Epw3P9yAgAqEg9HS56aT8+scln3z6TW7agEI6PbVsqbzooDfHFIGECiWZ5fJ3xevYmOcLsCalPc5m6/y7VXB4xWy3Jwdki7gMdg83NCX/pKXpZZBMRwgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4876b0a8-b96b-4f60-8040-a346b2655645@suse.com>
Date: Thu, 30 Nov 2023 08:55:13 +0100
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/DMI: adjustments to comply with Misra C:2012 Rule 9.3
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
X-ClientProxiedBy: FR0P281CA0163.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9075:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e132038-3336-483b-e43f-08dbf179b03e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aGeqXub22gHfwqRxnWewT3pIeUZTVrfU/NzB4IPDgceLmidb196Quez2ZfiHXbLjH7P+BlvaQkQ6eygclivvWMSr0fFl4xgZ1NhMXvbYiSOMG7dMbmQciHHfBcmvmSW8TQFFWTst8IT7V3IjQM1qGR/lyWOM+XlqDMHDappCnrhavdp9vs/KImQ0a/6JlqTJKDwcIl0TsXr8dy2jdjNjilnKOtcd4DkPV5b/MrGsFGzD6jv+lwxQzKlUTI0fRvJk8jOMhi6F05dBO5XpOsKjwCkyyx54sHyX8TApiMDdbAK36j880UV9t7ht9qX4JUfli7ZG4kakZ0R4KwCiA3KA9CuQfVOGerqzda6dsuN4ohV2yBaFmBByTCNz6+mIPgvGU9P/w7VVT/8E/hpgKP59h8TsClNnfEVckyEWdfFduzWAdRsds+2BgAu3uUEmYiSvxiwCeE9Bs6ty9wLzUWlEst8IK/UxyJAjJSoqRBa5mn0Gtd8JL2n2ArdunBhgfLVuOXdZgPWBIxkBrzt4ENAUX3GHH00vfbvJzicYa4iHbJO1RHYvl8euFlDhKmvMQUxNo1x700aaIUyY+8fxcMMxSraiFmyNzbfUiT3gpG0j1J50Xf2t1JkrIWIg4ki5O2RQwrfLn8mux61No3j72gcoh6R7MRSeztKZkWOtCjeH1MmuUci4U0FI6/evmkWubtwZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(39860400002)(376002)(136003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(31686004)(202311291699003)(478600001)(6486002)(26005)(6512007)(6506007)(2616005)(38100700002)(36756003)(31696002)(86362001)(41300700001)(66556008)(5660300002)(54906003)(66946007)(6916009)(66476007)(2906002)(30864003)(316002)(8936002)(4326008)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1hObDV6aDZ1OE45dmVORzRJSmI5QnNVM09wWGoxLzlRa0UwYWFLWUJyZzhH?=
 =?utf-8?B?SGJrbmdNU29xb05qSzRvU0dKRVRUS2llU3lyODBCUHVhZGVVaEZZRENrQnI2?=
 =?utf-8?B?YVd0YUpjK0VDT3Z1RWM2VERHN2V1OHBFN3UxQ0MydjBNOFBhdHp1MnR3NDUr?=
 =?utf-8?B?clBQM3BxOWo5cDNwdS9VcDZocndmZnc3MW9Bd3Fob08vRXZpMlNibG81YlpW?=
 =?utf-8?B?WTVVY0NLcmtSV3VqVXF3MGpTdldOYVdDU1BHOHhWa1dSNjVjSU1OUHVMWWZr?=
 =?utf-8?B?QzBOUDdRNCtwajNpR0NaZXJNUzkvU2lMU3BMbTZ2b0dLNDZVU0VmejNyZGY5?=
 =?utf-8?B?ejBYRUJEQTNNdlNrb0tHcHZGTnRkZVAxMjdQM2VQOTZGZTNmamlyMnRneUFI?=
 =?utf-8?B?S3p5TmlEbFl3bDNwbjlmQmx3QVMwOTlCME1LNVFGQWdxTEZkUGdZTUY3MENJ?=
 =?utf-8?B?UjhqQWdhTk1EOTZ1VUM0RmFEVEtGZERKb1MvdEpZY1Zwb216NktJRUxSWW16?=
 =?utf-8?B?SlhIT0FPeWZvMTU1V2tLR3hFNy9Vb3JwSGZYUHExNGgzbFNud0R4azJFaUdY?=
 =?utf-8?B?aXpqN2hITHI0NlpaTGhma3NQeW9Vbm9XQjlMSHNrT1dLcFBHeTl3aG1wMEV5?=
 =?utf-8?B?WnRHZE5lTU9CaWx1VUdBVVc1YmZPTnpJWHVuTWRCcnhKN2JqS1ZCZk9HWkUr?=
 =?utf-8?B?VHNvVDFZNldIYmFjSWNQOGhhNm1CdDEzdUZUVnJ4VFZ3ejNtcHU2cVZhT3E2?=
 =?utf-8?B?YTJjVm10aEdrdlhXOWtOWEd4N1VQWGhhQmEwQWxLZEJzZ29xYU5tZFRNTnRY?=
 =?utf-8?B?ZnVYdUpUL0gzK0dMUTFkOEhybVNHVzYwVUlhTW9pVXlYUzVxYW1xcWQzTDdm?=
 =?utf-8?B?NCtjTW1Mb3hncGdkRWJiMHUvdzUvcWh6cEdJdnJkNXQ0VE5ISmtITU5WRW1D?=
 =?utf-8?B?bCtsRVNzMVlvb0Z6clJ6N3M3M2gzWXhnUEtkSmlkak9wVUJyQ0VLZGxCSnVu?=
 =?utf-8?B?bHpEdS9EQjJZelpuYzUwb09EZURMUWZwMEFGOW5vVGNaWnNyR1JCbEFnellP?=
 =?utf-8?B?UlZ0NkFiNjhPeERPbThGeXg3dWVOanAyNGZTU1dUTi9GYUxCSzJCT2E3ZW9C?=
 =?utf-8?B?cVJRTFRjY3VyK1NpcVg1WDY3TzZXYUVCMkpEWW1SMlM1bXZuYkYrRC9VOTli?=
 =?utf-8?B?aXRaanh4RTVob3FaQ2o3THBSM3NZbnpHOFpHWHFGUXJtdmYrd055VWRXTGFv?=
 =?utf-8?B?WCtUVUIvZEV0ZU9JRnU5Y2gzUE42VW4vdFhTL0NpOGx5WWNKWEFtMnpEbGR2?=
 =?utf-8?B?VFIrci9kN1BXWDJ5RXRLREhZVEtiYXBZZk5VWmFmWUNSTEVtdi9sNTRaOHBt?=
 =?utf-8?B?a3Q2WVJNTHFFemUxa2tLT005dFB5b0Z4a3RTU0tQUmxvSHRHK2g2UmVESDlz?=
 =?utf-8?B?dDQ1amZTY3RORHlJNXNGZWFERWhZWUh4b3gyNWVNb2hJbVBFaStJU0R6N3ZN?=
 =?utf-8?B?Qkk0K3VmaVlBTzM1WUg2cGIxY3FPZEtndXB3STBYMGJkV0NwN0tBTHdNdmt1?=
 =?utf-8?B?SlhueGhoLyswVEpJYStIVlR2VmxSYUpQQlZpbnRRR1JuRzlyYWV6bHVsV2VR?=
 =?utf-8?B?c0xvd3E4ZlhGMjZwbjNuT2ZqOVFncWs0bEd1Q2NyakxjSUlORUxKMGRDREMr?=
 =?utf-8?B?OUJnc3E3RjkzQTRmM2xJOXZINUhOZGlMVkIzbTRoSUNBR3dDWFY5ODVxcUZs?=
 =?utf-8?B?TUI1UXBQeURORWtOZWprZnZ0MjNaaXRxNUNzZ1VsZkoydjFZUVYrY1BFUDJZ?=
 =?utf-8?B?cXJwWHBmOVc0bW41MG9BdU5GaTVqVmU3ME13MlI1Nm5qcThzbkhhODBsZjBT?=
 =?utf-8?B?MytQQjFUL2M2TjhhbVBSN0tNN0NXaENKNUJjWGJJS3B2N2pibnU5ZkNNWEJp?=
 =?utf-8?B?Ulg4dDg3MjljUUgxdUJHNk1KNC9SaEszNXBkR0tKRmNNT1ZabzlBMUh2Ylp0?=
 =?utf-8?B?UnE4ZitRVFhWZU1zVUdPK1RscUU4czNvREl3S3FpVjhzVzRZYld2ZTJ2amxz?=
 =?utf-8?B?UXNrajZIQ2Q4VWw3aG9ENEdXYW5ha2Z2QVpkMHlvaTh3bFRpbzNjQ2JYczdW?=
 =?utf-8?Q?aQcYGgGZyBBIVZg4YtEnOOGYC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e132038-3336-483b-e43f-08dbf179b03e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 07:55:15.4419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v7o0GULZBX19t3/8lay49shZ5iSraC7NlW35GN4lcpzQcJTOPGXzdgktQA8na5Pc7Dl0nyxyoGoF/waKLdO2VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9075

The rule demands that all array elements be initialized (or dedicated
initializers be used). Introduce a small set of macros to allow doing so
without unduly affecting use sites (in particular in terms of how many
elements .matches[] actually has; right now there's no use of
DMI_MATCH4(), so we could even consider reducing the array size to 3).

Note that DMI_MATCH() needs adjustment because of the comma included in
its expansion, which - due to being unparenthesized - would otherwise
cause macro arguments in the "further replacement" step to be wrong.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Of course a question is how many of these DMI table entries are in fact
no longer applicable (e.g. because of naming 32-bit-only systems).
Subsequently the table in dmi_scan.c itself may want cleaning up as
well, yet I guess the question of stale entries is even more relevant
there.

An alternative to using the compound literal approach might be to go
along the lines of

#define DMI_MATCH4(m1, m2, m3, m4) .matches = { [0] = m1, [1] = m2, [2] = m3, [3] = m4 }

I've chosen the other approach mainly because of being slightly shorter.

--- a/xen/arch/x86/genapic/bigsmp.c
+++ b/xen/arch/x86/genapic/bigsmp.c
@@ -19,11 +19,14 @@ static int __init cf_check force_bigsmp(
 
 
 static const struct dmi_system_id __initconstrel bigsmp_dmi_table[] = {
-	{ force_bigsmp, "UNISYS ES7000-ONE", {
-		DMI_MATCH(DMI_PRODUCT_NAME, "ES7000-ONE")
-	 }},
+	{
+	    .ident = "UNISYS ES7000-ONE",
+	    .callback = force_bigsmp,
+	    DMI_MATCH1(
+		DMI_MATCH(DMI_PRODUCT_NAME, "ES7000-ONE")),
+	},
 	
-	 { }
+	{ }
 };
 
 
--- a/xen/arch/x86/hvm/quirks.c
+++ b/xen/arch/x86/hvm/quirks.c
@@ -36,42 +36,37 @@ static int __init cf_check check_port80(
         {
             .callback = dmi_hvm_deny_port80,
             .ident    = "Compaq Presario V6000",
-            .matches  = {
+	    DMI_MATCH2(
                 DMI_MATCH(DMI_BOARD_VENDOR, "Quanta"),
-                DMI_MATCH(DMI_BOARD_NAME,   "30B7")
-            }
+                DMI_MATCH(DMI_BOARD_NAME,   "30B7")),
         },
         {
             .callback = dmi_hvm_deny_port80,
             .ident    = "HP Pavilion dv9000z",
-            .matches  = {
+	    DMI_MATCH2(
                 DMI_MATCH(DMI_BOARD_VENDOR, "Quanta"),
-                DMI_MATCH(DMI_BOARD_NAME,   "30B9")
-            }
+                DMI_MATCH(DMI_BOARD_NAME,   "30B9")),
         },
         {
             .callback = dmi_hvm_deny_port80,
             .ident    = "HP Pavilion dv6000",
-            .matches  = {
+	    DMI_MATCH2(
                 DMI_MATCH(DMI_BOARD_VENDOR, "Quanta"),
-                DMI_MATCH(DMI_BOARD_NAME,   "30B8")
-            }
+                DMI_MATCH(DMI_BOARD_NAME,   "30B8")),
         },
         {
             .callback = dmi_hvm_deny_port80,
             .ident    = "HP Pavilion tx1000",
-            .matches  = {
+	    DMI_MATCH2(
                 DMI_MATCH(DMI_BOARD_VENDOR, "Quanta"),
-                DMI_MATCH(DMI_BOARD_NAME,   "30BF")
-            }
+                DMI_MATCH(DMI_BOARD_NAME,   "30BF")),
         },
         {
             .callback = dmi_hvm_deny_port80,
             .ident    = "Presario F700",
-            .matches  = {
+	    DMI_MATCH2(
                 DMI_MATCH(DMI_BOARD_VENDOR, "Quanta"),
-                DMI_MATCH(DMI_BOARD_NAME,   "30D3")
-            }
+                DMI_MATCH(DMI_BOARD_NAME,   "30D3")),
         },
         { }
     };
--- a/xen/arch/x86/ioport_emulate.c
+++ b/xen/arch/x86/ioport_emulate.c
@@ -43,59 +43,51 @@ static const struct dmi_system_id __init
      */
     {
         .ident = "HP ProLiant DL3xx",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
-            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant DL3"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant DL3")),
     },
     {
         .ident = "HP ProLiant DL5xx",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
-            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant DL5"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant DL5")),
     },
     {
         .ident = "HP ProLiant DL7xx",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
-            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant DL7"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant DL7")),
     },
     {
         .ident = "HP ProLiant ML3xx",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
-            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant ML3"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant ML3")),
     },
     {
         .ident = "HP ProLiant ML5xx",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
-            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant ML5"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant ML5")),
     },
     {
         .ident = "HP ProLiant BL2xx",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
-            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant BL2"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant BL2")),
     },
     {
         .ident = "HP ProLiant BL4xx",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
-            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant BL4"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant BL4")),
     },
     {
         .ident = "HP ProLiant BL6xx",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
-            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant BL6"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant BL6")),
     },
     { }
 };
--- a/xen/arch/x86/shutdown.c
+++ b/xen/arch/x86/shutdown.c
@@ -187,348 +187,310 @@ static const struct dmi_system_id __init
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_KBD,
         .ident = "Dell E520",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "Dell DM061"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "Dell DM061")),
     },
     {    /* Handle problems with rebooting on Dell 1300's */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_KBD,
         .ident = "Dell PowerEdge 1300",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Computer Corporation"),
-            DMI_MATCH(DMI_PRODUCT_NAME, "PowerEdge 1300/"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "PowerEdge 1300/")),
     },
     {    /* Handle problems with rebooting on Dell 300's */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_KBD,
         .ident = "Dell PowerEdge 300",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Computer Corporation"),
-            DMI_MATCH(DMI_PRODUCT_NAME, "PowerEdge 300/"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "PowerEdge 300/")),
     },
     {    /* Handle problems with rebooting on Dell Optiplex 745's SFF */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_KBD,
         .ident = "Dell OptiPlex 745",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 745"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 745")),
     },
     {    /* Handle problems with rebooting on Dell Optiplex 745's DFF */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_KBD,
         .ident = "Dell OptiPlex 745",
-        .matches = {
+        DMI_MATCH3(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
             DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 745"),
-            DMI_MATCH(DMI_BOARD_NAME, "0MM599"),
-        },
+            DMI_MATCH(DMI_BOARD_NAME, "0MM599")),
     },
     {    /* Handle problems with rebooting on Dell Optiplex 745 with 0KW626 */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_KBD,
         .ident = "Dell OptiPlex 745",
-        .matches = {
+        DMI_MATCH3(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
             DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 745"),
-            DMI_MATCH(DMI_BOARD_NAME, "0KW626"),
-        },
+            DMI_MATCH(DMI_BOARD_NAME, "0KW626")),
     },
     {    /* Handle problems with rebooting on Dell Optiplex 330 with 0KP561 */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_KBD,
         .ident = "Dell OptiPlex 330",
-        .matches = {
+        DMI_MATCH3(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
             DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 330"),
-            DMI_MATCH(DMI_BOARD_NAME, "0KP561"),
-        },
+            DMI_MATCH(DMI_BOARD_NAME, "0KP561")),
     },
     {    /* Handle problems with rebooting on Dell Optiplex 360 with 0T656F */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_KBD,
         .ident = "Dell OptiPlex 360",
-        .matches = {
+        DMI_MATCH3(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
             DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 360"),
-            DMI_MATCH(DMI_BOARD_NAME, "0T656F"),
-        },
+            DMI_MATCH(DMI_BOARD_NAME, "0T656F")),
     },
     {    /* Handle problems with rebooting on Dell OptiPlex 760 with 0G919G */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_KBD,
         .ident = "Dell OptiPlex 760",
-        .matches = {
+        DMI_MATCH3(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
             DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 760"),
-            DMI_MATCH(DMI_BOARD_NAME, "0G919G"),
-        },
+            DMI_MATCH(DMI_BOARD_NAME, "0G919G")),
     },
     {    /* Handle problems with rebooting on Dell 2400's */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_KBD,
         .ident = "Dell PowerEdge 2400",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Computer Corporation"),
-            DMI_MATCH(DMI_PRODUCT_NAME, "PowerEdge 2400"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "PowerEdge 2400")),
     },
     {    /* Handle problems with rebooting on Dell T5400's */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_KBD,
         .ident = "Dell Precision T5400",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "Precision WorkStation T5400"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "Precision WorkStation T5400")),
     },
     {    /* Handle problems with rebooting on Dell T7400's */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_KBD,
         .ident = "Dell Precision T7400",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "Precision WorkStation T7400"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "Precision WorkStation T7400")),
     },
     {    /* Handle problems with rebooting on HP laptops */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_KBD,
         .ident = "HP Compaq Laptop",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Hewlett-Packard"),
-            DMI_MATCH(DMI_PRODUCT_NAME, "HP Compaq"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "HP Compaq")),
     },
     {    /* Handle problems with rebooting on Dell XPS710 */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_KBD,
         .ident = "Dell XPS710",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "Dell XPS710"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "Dell XPS710")),
     },
     {    /* Handle problems with rebooting on Dell DXP061 */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_KBD,
         .ident = "Dell DXP061",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "Dell DXP061"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "Dell DXP061")),
     },
     {    /* Handle problems with rebooting on Sony VGN-Z540N */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_KBD,
         .ident = "Sony VGN-Z540N",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Sony Corporation"),
-            DMI_MATCH(DMI_PRODUCT_NAME, "VGN-Z540N"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "VGN-Z540N")),
     },
     {    /* Handle problems with rebooting on ASUS P4S800 */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_KBD,
         .ident = "ASUS P4S800",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK Computer INC."),
-            DMI_MATCH(DMI_BOARD_NAME, "P4S800"),
-        },
+            DMI_MATCH(DMI_BOARD_NAME, "P4S800")),
     },
     {    /* Handle reboot issue on Acer Aspire one */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_KBD,
         .ident = "Acer Aspire One A110",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
-            DMI_MATCH(DMI_PRODUCT_NAME, "AOA110"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "AOA110")),
     },
     {    /* Handle problems with rebooting on Apple MacBook5 */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_CF9,
         .ident = "Apple MacBook5",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "MacBook5"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "MacBook5")),
     },
     {    /* Handle problems with rebooting on Apple MacBookPro5 */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_CF9,
         .ident = "Apple MacBookPro5",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "MacBookPro5"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "MacBookPro5")),
     },
     {    /* Handle problems with rebooting on Apple Macmini3,1 */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_CF9,
         .ident = "Apple Macmini3,1",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "Macmini3,1"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "Macmini3,1")),
     },
     {    /* Handle problems with rebooting on the iMac9,1. */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_CF9,
         .ident = "Apple iMac9,1",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "iMac9,1"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "iMac9,1")),
     },
     {    /* Handle problems with rebooting on the Latitude E6320. */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_CF9,
         .ident = "Dell Latitude E6320",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6320"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6320")),
     },
     {    /* Handle problems with rebooting on the Latitude E5420. */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_CF9,
         .ident = "Dell Latitude E5420",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E5420"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E5420")),
     },
     {       /* Handle problems with rebooting on the Latitude E6220. */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_CF9,
         .ident = "Dell Latitude E6220",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6220"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6220")),
     },
     {    /* Handle problems with rebooting on the Latitude E6420. */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_CF9,
         .ident = "Dell Latitude E6420",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6420"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6420")),
     },
     {    /* Handle problems with rebooting on the OptiPlex 990. */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_CF9,
         .ident = "Dell OptiPlex 990",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 990"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 990")),
     },
     {    /* Handle problems with rebooting on the Precision M6600. */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_CF9,
         .ident = "Dell OptiPlex 990",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "Precision M6600"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "Precision M6600")),
     },
     {    /* Handle problems with rebooting on the Latitude E6520. */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_CF9,
         .ident = "Dell Latitude E6520",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6520"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6520")),
     },
     {       /* Handle problems with rebooting on the OptiPlex 790. */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_CF9,
         .ident = "Dell OptiPlex 790",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 790"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 790")),
     },
     {    /* Handle problems with rebooting on the OptiPlex 990. */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_CF9,
         .ident = "Dell OptiPlex 990",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 990"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 990")),
     },
     {    /* Handle problems with rebooting on the OptiPlex 390. */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_CF9,
         .ident = "Dell OptiPlex 390",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 390"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 390")),
     },
     {    /* Handle problems with rebooting on Dell OptiPlex 9020. */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_ACPI,
         .ident = "Dell OptiPlex 9020",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 9020"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 9020")),
     },
     {    /* Handle problems with rebooting on the Latitude E6320. */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_CF9,
         .ident = "Dell Latitude E6320",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6320"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6320")),
     },
     {    /* Handle problems with rebooting on the Latitude E6420. */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_CF9,
         .ident = "Dell Latitude E6420",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6420"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6420")),
     },
     {    /* Handle problems with rebooting on the Latitude E6520. */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_CF9,
         .ident = "Dell Latitude E6520",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6520"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6520")),
     },
     {    /* Handle problems with rebooting on Dell PowerEdge R540. */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_ACPI,
         .ident = "Dell PowerEdge R540",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "PowerEdge R540"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "PowerEdge R540")),
     },
     {    /* Handle problems with rebooting on Dell PowerEdge R740. */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_ACPI,
         .ident = "Dell PowerEdge R740",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "PowerEdge R740"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "PowerEdge R740")),
     },
     { }
 };
--- a/xen/arch/x86/x86_64/mmconf-fam10h.c
+++ b/xen/arch/x86/x86_64/mmconf-fam10h.c
@@ -188,9 +188,8 @@ void fam10h_check_enable_mmcfg(void)
 static const struct dmi_system_id __initconstrel mmconf_dmi_table[] = {
 	{
 		.ident = "Sun Microsystems Machine",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Sun Microsystems"),
-		},
+		DMI_MATCH1(
+			DMI_MATCH(DMI_SYS_VENDOR, "Sun Microsystems")),
 	},
 	{}
 };
--- a/xen/include/xen/dmi.h
+++ b/xen/include/xen/dmi.h
@@ -30,7 +30,12 @@ struct dmi_system_id {
 	void *driver_data;
 };
 
-#define DMI_MATCH(a,b)	{ a, b }
+#define DMI_MATCH(a,b)	((struct dmi_strmatch){ a, b })
+
+#define DMI_MATCH4(m1, m2, m3, m4) .matches = { m1, m2, m3, m4 }
+#define DMI_MATCH3(m1, m2, m3) DMI_MATCH4(m1, m2, m3, DMI_MATCH(0, NULL))
+#define DMI_MATCH2(m1, m2)     DMI_MATCH3(m1, m2, DMI_MATCH(0, NULL))
+#define DMI_MATCH1(m1)         DMI_MATCH2(m1, DMI_MATCH(0, NULL))
 
 extern int dmi_check_system(const struct dmi_system_id *list);
 extern void dmi_scan_machine(void);

