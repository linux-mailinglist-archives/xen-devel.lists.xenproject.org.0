Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 259D97EE191
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 14:32:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634215.989573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3cTc-0006n1-Ey; Thu, 16 Nov 2023 13:32:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634215.989573; Thu, 16 Nov 2023 13:32:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3cTc-0006lG-BF; Thu, 16 Nov 2023 13:32:12 +0000
Received: by outflank-mailman (input) for mailman id 634215;
 Thu, 16 Nov 2023 13:32:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r3cTa-0006l8-UZ
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 13:32:10 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20617.outbound.protection.outlook.com
 [2a01:111:f400:fe13::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b0efd9a-8484-11ee-98db-6d05b1d4d9a1;
 Thu, 16 Nov 2023 14:32:10 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8499.eurprd04.prod.outlook.com (2603:10a6:20b:342::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.9; Thu, 16 Nov
 2023 13:32:08 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 13:32:08 +0000
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
X-Inumbo-ID: 8b0efd9a-8484-11ee-98db-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SMJyj/DHv/ISSgs5UP8EAZ9C8xzUxb1yBeemLwloN1gJGENNb+QPGWCPbY1JjajNe1GndZPqE25+yQKo7jwBskSy6fIFbHedE/TMdPQ1JFLwPec2rPPKw23d/O9YWwotJg6T/gF/3wrv/h2hkdTk3Ff/zt24rcYdQFYysl/2wpjeVZIRheOv0nORIZC/aDykuAqsxrcMrI4x3a4qED5AZDmwmF7A8wwCtiWHysOaR3YvfpxS2isUzLmOHHBgv+sS/RwwyS0PyNc82drcVrFarPOV0mOBy1MJcxnjHizZSayhBaDlv/Njr9m4SyGf6Ex5qW+tfA8YBtgHDwYsovROuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BH2ili1cHCQHt6/Qmlk6IQSHtN0pbcv6mxMT7/SbihE=;
 b=grbl9di9HveNzE8N7YuO73ibRPm0rEx2hHmQU/HrMxvUrvtv+b2XSYo31HZU/p/vayKyaCA6qJas+4nfrNAtl39XwPqAK49Z6mEwpaAEl8hf1vb8V5f7VvtN8OwzB2F5FawI8RKV3NMnPmM2CcAnwoiWK5uNf5zJkEH3axsghod7b91VkJ+Ik+FUzEwSnqgQt+eCwBGm/M3dFWFFUGYgFLuWu7fQI8lSehTx1lyKCnyMeg6o6bQMNlRn5LT1tr+nwMMjPZFT7/5ZRh9JujsO2SJZVI97R2x/g71qzqFrrFIi7Yz8ZjuEwTOLSzZR9Pr4vCwUSuXlcyBGxys49zr8ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BH2ili1cHCQHt6/Qmlk6IQSHtN0pbcv6mxMT7/SbihE=;
 b=GfRzTWpioodqGdrh1XMSiSmMT9yuZzLLSwyTjkczfpGExyPx26WZ/R+GJbyQBQHNKZov+4jZjyHiPtP8aMtbfGSW4glOcu7X7kMNDm7fvAb40bXO0ARhXfC374Yi13g59WR+6B7vbb8osU2nYvTbwYHHkl/pY7O/EOtrsTMcDcfNxX8ntr9so/aacPb7tz2j6tdFuBxw2Sb1htOZKnFcUhPk5puFgQUYJ9UG1+RvZNRKbQgxuPoZQsr86N1hMo3AmrtnKCDIjDkP++tv0OgKS6VXSGMUyhQm4ZytbvBLF6sJhlxTR9O0UaRHm9jRauV08L5QpVRjtJsBBIhOchrQkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d6a8ce0e-fcd9-4391-83c1-d9f709ada3f1@suse.com>
Date: Thu, 16 Nov 2023 14:32:07 +0100
User-Agent: Mozilla Thunderbird
Subject: [PATCH 3/5] VMX: don't run with CR4.VMXE set when VMX could not be
 enabled
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <791a9f45-2bed-48f9-af6a-9fbde65bcc71@suse.com>
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
In-Reply-To: <791a9f45-2bed-48f9-af6a-9fbde65bcc71@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8499:EE_
X-MS-Office365-Filtering-Correlation-Id: d1e03b6e-c3db-4966-2615-08dbe6a86e8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z/m0ZwrQKWPRYCIervUkuTpFB2KG3PPmAyTFSlm+mW0XKMoUl+En9VieeebWo5HSj0b8Cs0MjX+WpkwXQACM8nCOrfK+Jg926zJ3V7qXVDbTMjVecjez4odpRll4aYumRn83ADbc4/fIO4Xjn7ThZi+VIN7I2KiseQfHCY2JkTqDu0Tgf/gWiIZIp4uJc627x+4+wJz9uS+jZlBMyTA3Md1faPDau/Dm2Vh7TbDowVfuKFAlufKoEqrHNbLhvvJcSUesgnru3QKBQGKY3xl7yCOmTbEW/xcQmMuJfnGKqy49UUb7kwEs6W/WVkhM2qPTBFBknmHOuwmesN5Bp57CKq4MCm+8fWvv4Mil5iZt183BdP6qfBlDxh49tKvSAfSEd1M8hPmow3D2LdmgZNtQyt1B2FFmCA5egA5DSr3E7U9+sx+RrvY40B5CT4KlkNPnVD4Y8sni81V6NGWnVcbwm1Romsgc5Y7rdsBPqYBEYemrIIvWNF8KoY5GxewTIzlcqksDS4z/AtlYOXh7ExTPfRAGoTNgwXnWpZvY8bLh8hFPuvj7o51zNbPO/ecf0NJW2ZHDJbUHBY6ArlsYy0GVLQgOqPmSofvHwBLtji0NiMw1ZAah2KoZaQglxC80OPWnsXamveUtiUxd9VQCjJF2zw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(39860400002)(366004)(136003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(2906002)(31686004)(38100700002)(4744005)(31696002)(86362001)(5660300002)(41300700001)(8936002)(8676002)(4326008)(83380400001)(6486002)(2616005)(6916009)(54906003)(36756003)(6512007)(66476007)(66556008)(316002)(26005)(66946007)(6506007)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TDR6WTdWL2twMFdQRGlsVUN4S2poclg3WFRoeDBlcWlDVmUycmVOSWNUZnU5?=
 =?utf-8?B?QXdoSEZDQnhoWmRtLysya3o4ZmZ2SFZxMXAvSkY2SmQrVzFBbDIxc28zOFhr?=
 =?utf-8?B?dTl2SzdZL3pLTnp5SmxpY0VwT1lIcHJ1S0ZxcVF1cGdncFNWSGY5UVJpZC9L?=
 =?utf-8?B?R0hyUmNaNUdqZFpXQ0p4WkZIY2dCRnNKcTdUNWY5VmxVemlzeXZGVk1JUDIv?=
 =?utf-8?B?OVBSVURQU3ZNc0F5WXJpL243NWR3aEtLTk9NcmdOL0cvM2s3R0xTOC8vemxa?=
 =?utf-8?B?NEJ5amp5Ty9vQVlTU1ByVGpWR0NrdVgzZVdlWENWclRoS2hwWjBaUTI4K2lV?=
 =?utf-8?B?YjFNdDZ6aTM5YkIwMXZ5dGhxck0rY2poL1BDNXJrNVhSeHpuaDN4akFQZkhW?=
 =?utf-8?B?T2wwWWN5RVFKWUV6SHhMV1pkL0x2WFREamRYSFRWQW54YlNyYWhvcjBHSkx5?=
 =?utf-8?B?bUtLdVJhWWx1STlRalVVdHpnWkdxU0EwcG1jcDFINU9WbVEyVlpKRlB2eThS?=
 =?utf-8?B?em14amlHY1M1S1Vob0ZubWZlU3plVE43Y3MzMWR2bDRjSktEenIvb0h4bEJI?=
 =?utf-8?B?bldvWnZiN0x4OWplZUwrdEgrMmtaZGJRY1ZFdnRHQmFEVU11Y3ZHMXJiUlF5?=
 =?utf-8?B?cklFYk1GM0cySERMT2crRFh4TjFQbWRGejRsVUo3TWhZRXRpV0pPY1dqODlv?=
 =?utf-8?B?N2N4aGM4QlptVW8rVDFVRk02akcxMWJzQU9wN0dya0YzUDZPeGowRWsyTzc2?=
 =?utf-8?B?RTB5TU5IMjBsb0VzV3o0alU1SjB6QytFR0dYN1VjcjFQT2pzZXBkNWVDS1Zq?=
 =?utf-8?B?UjJVSDBEa3BSVEhXbEZuYmRQVU1SMEVraVVuYzN1QWdlSUVpdVE1T1NvbXBx?=
 =?utf-8?B?ZlM1N2RqdkFCSWllUk03QTJYcC84SU5pZ3pOa3RqRlRpeVBXWHBOTXUxektp?=
 =?utf-8?B?NG1KZWdVYzhyak9FWkFEZXozY0UraHJYRkZoQXI0b2RiWktqRVo3SmhoSDZ3?=
 =?utf-8?B?OUlTMFNEdmtUdEZJbEtDaEFPQnlENjFqTUdlZ0JkN3dRajlmQlpwc2wxVzV4?=
 =?utf-8?B?VGNGVGQwYjBYaTF3TnZZaXdmZVlMNlEwRWFzZnBqeHh1MDVtaVZOY3YzdW9Y?=
 =?utf-8?B?dHcxaHZBRjd4U2ltc2ZaUkhDeEVidTVFN1FyVDJ3SGxGMnNVMVFrR1dnbVBQ?=
 =?utf-8?B?anVTUW5FdGJrNVpXaGd6bGl2clB2eDUrNUFMNm00VTA1UkVWSGVsS21sSjIr?=
 =?utf-8?B?MW4xYTlySUdrUmZaN1JVVTFLWTZQQ0FLRzQwSnhEK0FnZGxnTm54TTVzMi9k?=
 =?utf-8?B?b0tJRnhmUDJWbXlPU3MrK2t0L29qNTJRQnBuZnBtU3BUSnRscEpSSFFhT0ZL?=
 =?utf-8?B?ZStiejJDZU02RHdQVExjSncvOWgyT3NkRGJ2cForR1Rsak1DR0VLZ1BoSzhQ?=
 =?utf-8?B?RDdOcURDSnRMbGFxSkdBNkVKYnNLMlhhMHhoeHRDVHBkNWMxVWNiWFpsTGgx?=
 =?utf-8?B?UkU0TlJrY3J6dzI2U2p1R2t1Ny9WU2VvOHZWTmtpekFsR1hEUW9vTU45bTZQ?=
 =?utf-8?B?eGJMakFFelIwSGxwOTN2VHA3NTVQL2MzNHpTdDJtcWhrL0hiWFQzWTM3MU5s?=
 =?utf-8?B?b0ZtOWt6UmZ4b3Q0Z2IzMGEydm1hNXFnSU9ZRjIrN0NpZDk5L3Y0ZFoxSGhN?=
 =?utf-8?B?Q08zSldDNTEvTDNkS3g1SGREQlRRY085cDVmVTUrNnZnakhTSzYzazI5bjlz?=
 =?utf-8?B?UVJ1YmtoMGFPRG5nNm9MV3JRUERBWnRmYitaTHV3aHBiV2l3VWtLenE5bVgv?=
 =?utf-8?B?VnhVZElTRlkwRHRaOFRtSmxaeDRxeXo1Uk5KSzBmQlFNNnRwZmd6NnhtQzV0?=
 =?utf-8?B?SHF4dzdNUVMxcis1VmJpTnVmYkVkbWVPQVk5NGRJZzFzTWlHc0lJcS9HWVc2?=
 =?utf-8?B?N3Q2RXdpcm94NHpmTHRkcU40aEx1cFgyTnBvTUhEWFBaMUh6VUM2MWVMVDg1?=
 =?utf-8?B?OWFQeDI2TTdVYmJDSWF5VEozektKWHVJRjc1c09jZ1lFUjBCQlR0Mm9HTFJt?=
 =?utf-8?B?Z0RFOFRwYklDOWpsWCswWUVzem5XSGZxcTFkTklyZCtLY21NekprZzJFTGRQ?=
 =?utf-8?Q?meVce7eS9fisEmoKmgZr9ywsF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1e03b6e-c3db-4966-2615-08dbe6a86e8c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 13:32:08.7717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 14LtYr3c/r92tFAZdPwmyAO+Onrrky59gNh+wpZ/R8zJs0gm+Thdtj5C8V8frepGqnqCO8/8QpjkKEJ8sdd0mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8499

While generally benign, doing so is still at best misleading.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Using set_in_cr4() seems favorable over updating mmu_cr4_features
despite the resulting redundant CR4 update. But I certainly could be
talked into going the alternative route.

--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2959,7 +2959,7 @@ static bool __init has_if_pschange_mc(vo
 
 const struct hvm_function_table * __init start_vmx(void)
 {
-    set_in_cr4(X86_CR4_VMXE);
+    write_cr4(read_cr4() | X86_CR4_VMXE);
 
     if ( vmx_vmcs_init() )
     {
@@ -2967,6 +2967,9 @@ const struct hvm_function_table * __init
         return NULL;
     }
 
+    /* Arrange for APs to have CR4.VMXE set early on. */
+    set_in_cr4(X86_CR4_VMXE);
+
     vmx_function_table.singlestep_supported = cpu_has_monitor_trap_flag;
 
     if ( cpu_has_vmx_dt_exiting )


