Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FC47F5C2A
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 11:21:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639499.996942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r66oy-0004A9-Qn; Thu, 23 Nov 2023 10:20:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639499.996942; Thu, 23 Nov 2023 10:20:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r66oy-00047l-OB; Thu, 23 Nov 2023 10:20:32 +0000
Received: by outflank-mailman (input) for mailman id 639499;
 Thu, 23 Nov 2023 10:20:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=licP=HE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r66ox-00047f-Bj
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 10:20:31 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0610.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eccb7de0-89e9-11ee-9b0e-b553b5be7939;
 Thu, 23 Nov 2023 11:20:29 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.19; Thu, 23 Nov
 2023 10:20:26 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.012; Thu, 23 Nov 2023
 10:20:25 +0000
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
X-Inumbo-ID: eccb7de0-89e9-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D8DUm1iF7K0mxUksTmgP9X0jI+JYcX4VE4VuMdCBNbeHI56iYIzgA9B/n+p+P+6QbxBJHm+A00T/I7OBIYiXNqY8cj4Xq9ysy+aIxi25xHa8F+LCyXJMrH7rgb/7JJ4lvBIecjXhbxM+pQQTf5LZxKWc9e79rU7G24Q2HlcdXfNu2tAc6lUhppv/PvWs+M/zAAh5nIhCqpd1m3aAaw9zf7wqXOTziipIB81Jez88w/b82QvjKrUKdb9Q17R+UbHoAfCmYDIdcbUHH5n4OzkbScipPWiFfoV/Ib3kTumF4Uk7GN6MO7biRwtkYelQysa3pna9JKhZg4NJFeJsCmQswQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C+mvBM+pkezPNlqrFSNGerKaLkBxgetczVa0ZF0yAAc=;
 b=dXE61Qus9OGWaSoL9amFp02ogcOtWRwltufzb2K+SjALs39bmXx6NkrdnDwd/a7DrsVViBGOi6KyGl301k8GpYQ8y+vfTYXSfzCormGQqAcwdQdmy/uIZIlu0j3/6yPusjtEmo5PExrEafe2NSgliD09Bw1sfSMnR7Lz9i4K6ff5crSt0kI0mn0urFcGx4rbi7PXJNBIj529zaZjWArIpC4+MuepPZfXZPjLWsExlHv3kr7rKvBpzcXQ4aFjhIM14kQADkW6ot7BWUG7z1oFmFnZJCa7a78TFlTVFfrSN5C6QwZX4RI/7kUR43oluSrgq16XdwtO+H2o4GsKhGF6rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C+mvBM+pkezPNlqrFSNGerKaLkBxgetczVa0ZF0yAAc=;
 b=DQlj/vx58knyjlfzgh6btgiwvAAkB8JgnRrpsNdfHfcVvKYgaZ9qzoGFd+TUMdMluM93PYNOxHz+kF1AHmDMAG6Ja8dH9IKmxRh33y384/5nZh4I3Fjl7fOey8Fz635iFjlLcmFLNZ1wbQY7lYZqbOMtVid2e6bBVMhEnoAE3a10HODZo90+ZmDcAS4ubOeU8Ek8dc8VRktxXtc9OWJw4/6g6U12VSAUOiYVSe7o/wM6Nr34Zd6DoGLbqXipLK/5uXto0D7NYSUYmQXFQXt9D17CsJU/zbdhsB6doG0QNBRc+GP+InlJvwP98rBUhOoiMXW6CIai+NlMPhk2uZwXJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f7016076-19a4-4416-b7be-df16e8d4a017@suse.com>
Date: Thu, 23 Nov 2023 11:20:24 +0100
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/vPIC: correct vcpi_domain()
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
X-ClientProxiedBy: FR4P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8951:EE_
X-MS-Office365-Filtering-Correlation-Id: 951e8e9e-0593-4d6d-299f-08dbec0dcf2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gvBlun6Bh4Br5wXWxr5b504k40ackQstI3YcfwjZW3kshNqsADh47rzSpBw5nq80498VkjfJm+/+GxGZlXZ0rfnNxGMdqA7G8tB0dCwkTj2M3FTp7G6dF5DstoexKUXvFjqrga8An62/OYXGz/rLxbkOb5LfsIKTj7h4dlWAsVKLT+ou7He5h8Fbr7GGpXXjYjzV8LgKZrbkCPMtViSeqLEfOWUutF3q8F7UDUZqWTxPFCIhohjQD947X+pYXfKGf4moH3faen9fMNLOrw3DtIa5tYThP7q9vXxNtz3ro793RCbTsOTGmLFkBq92rhH5Nx8oR6v5xNiUhsRmW1NM5bC3tdH+6wrj736gl8vqaZfVhurpVdRA+/A0gcFPPggE+O+IgRKPXUwVI68kR5xXpL+vHptZax8a3OwPvmGPABGs2LyjBgOJxeWTclDpBaAINrUT3qS10gdPbHu0ViujtRhvdGcUTxYOd1uKUp0CcoRafa4cMJel9EXvQgryzLi9eMCpZgpX0DuFvKSW4X0Y8kGLby3LAxyawqhgAlWrUmQRRpqUIr8QC3kLZ/7kxwjFACND4VeBObcweyrTd/PEzMGOxmqRNNelKFpVWBdEu7p7eMYJ4cL/oNLO+hQWHzCuuOcxY1bRMp8UkWewASNlGQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(136003)(376002)(39860400002)(366004)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(83380400001)(2616005)(26005)(6512007)(6506007)(2906002)(4744005)(5660300002)(41300700001)(66556008)(66946007)(6486002)(66476007)(8936002)(316002)(54906003)(4326008)(6916009)(8676002)(478600001)(38100700002)(31696002)(86362001)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NktBOTFrZWVScCszY01ubnJ5ZTMycUZJZGlJV1BPMlZwdlFCK1VWV2krUWxK?=
 =?utf-8?B?dkdMTlZCdHBjdVVobkRscSsxbmYvTG1jV25zS1JvRUhFaVhPNm5INWgvWEhz?=
 =?utf-8?B?dDVmd1RGcVd1RFNDWEhSY2llUzJzWWlUR0QwZk9GckFKcUtZSUt4a0JyWE93?=
 =?utf-8?B?U2x5UGhEZDlYK2RRSm4rR3BoVGZQaUdVS3V0SFc0bU9jcjdqeGtFNEpzRVBF?=
 =?utf-8?B?WDkyZy9Pdnl5TmxzM0R2WVREVG52YTVhOFoyQm5YWXI2SFNSbHZkN1ozT3ht?=
 =?utf-8?B?NTBlR2d3VkNVQkVoUUF0cURtYU8vbkFwWVVmaFJTUVozczRGaXFtL2ZWVU9O?=
 =?utf-8?B?eTcyUzBoNmxnTXNyMlRvTWxBSVllNllZV091ME50NmorLzZIaDRIT2Rac1hi?=
 =?utf-8?B?SUVzUkR6Ull3cGRyUUxBck01MFlvOThCWXlPcnl6aEVmQ0ZqQkRCVWZLa2wx?=
 =?utf-8?B?NlVJeTUyMmw1YThyeFptaU1Cc2V0cFVmT1BveW5VbXBZOHJFSjk0Y0dScElv?=
 =?utf-8?B?R2w3QzRqL05jOUVqUU5VbGJWTWVMejBIN3RxRjRTU3VET3dwOGQ4UUpBQWJu?=
 =?utf-8?B?bG1mRTcxNjJ2TmdOWXZUYzMvc1JMQzB1SkZNcVBEZlNBcDZUbjVLSU4wUjdZ?=
 =?utf-8?B?bjlUODJZQldLRmZOdzN5QXlraFV6anM3ME5rbmhsSGpuUFlPMUFPZzU3OGtn?=
 =?utf-8?B?Z2hVY3lJQzVPemVOS0JmWHltWlJFZmN4NWIyZnVhYVRBWStiVjgvbm02dlVj?=
 =?utf-8?B?bWNFaTJWMjc2Ykl6cm81TFNlR1ZwUUlCVlFyRU9nWldwZ0krcHU3N215ZWNQ?=
 =?utf-8?B?UzB3VWQreStQYWRuN3ZXbDVFZ0ozTmgya093UWxLaWs4MEZoYVVFb3YySzh1?=
 =?utf-8?B?eTRzREQwa3lXNlptZ2U4OXlSSStGYnB6NTJBMlBEb0VqRVdPRGlZMzc2a3A0?=
 =?utf-8?B?K1pQbFJkMmZsN2hidUlYbFdYNzRjb0QyeW9sUHQrVzRadGVrNkh6WDFCbHB5?=
 =?utf-8?B?NnI2SjJURXN1K3VXSHcvM1FrUEJoNm1sYWxJSGdkS0kvdGxwM3lNMTQwZ0d2?=
 =?utf-8?B?UURrdFZGbXlxWEwrYm0xMkEyZFpPY0xMenJUVkdvcXhpMjZ3aldYMmNrMjFh?=
 =?utf-8?B?N0NBai9idWxNekdaVk45S1pSQy9XMWN4WmdoQndNMXdJNXk0Yk9rY2ZXaFRK?=
 =?utf-8?B?MmNGYUhpTWc1c05QZ1UvZXB3NXdxb2lDYXdBalczVGh1Y2hVVVN2aVlKL3kv?=
 =?utf-8?B?NG9Oblp6bkF4RG16VkJ6Zi9YekpXNDN2bGIxanBMNzExU2NDYlF1U0M4enhP?=
 =?utf-8?B?MTlxR3ZGUDV2OHJ4WUlMeHJOM2QyQ0ttVXVLTG5NTkl5Y3RFUFJBNUxpemJF?=
 =?utf-8?B?RWQ2bzFsaU5qcHZweEkyQ2ZXejZrYkZ3ajFHSTdoS0k4bVRRNnRLSUYyRXla?=
 =?utf-8?B?bXVsRGxLdnEzU0VjeVd5Z050V2RCMDRlZGR1WlV6NHd2cEwrNkZiSkxvQWRq?=
 =?utf-8?B?bC83eThtZjJOemJiR2Z4L3VCWkxTL3ZwMW9ySXJ1M1l3OTVJYnVYRnYrTjVN?=
 =?utf-8?B?b2dHVVJiMDh1MzdRZTZTbnh4dHE3a0xMMVJVcnFoVVlkVTd5ZkFDeFRDemVi?=
 =?utf-8?B?WG9OVzhmTGlDc00wd0FwT0FLSkpGTUVZOGhkTzNYVUxDcVFFdWdybS9ybzY5?=
 =?utf-8?B?cWZpWjFJVnlKNkIzMWdNV0dkNTR4T2JSVUR1a0hhMStnbm93cVhwT2ZvYkpq?=
 =?utf-8?B?N09UYzcyUWJTanpqVGViTzVUZXZGajNmd05QZ3Y2NjB0eU5xbUl2bytrNWVy?=
 =?utf-8?B?QWZydFZRWjBaNHFvWXN0TWR6c2J3aEhQRmI4dThIdkw1NllRVEQvOXFLekN0?=
 =?utf-8?B?S29POTUxQU1ZVXlDQlhPaEt0L1Q2Zys2aUsrU2QxVjluRlNrclZaamR4V3ZW?=
 =?utf-8?B?VWVGUGJQaEo2aTAvWU1ISWI3UHQzOE9JQ3JleVRYTjFwSm9jZ2w0NmtRRVNY?=
 =?utf-8?B?eEl4VGhRTEZkZTFqelViVHFWN1pLOFhlY3hWQ1lyd0wvZ1ErSHRMRUNiSlNT?=
 =?utf-8?B?dUdudHM5cnBCZlFYbmcwM3h3TDdrRWFFZlByMlhjNmZFdi94bDRGS25qVWZD?=
 =?utf-8?Q?yGSblZd9nzl2/mXr2sdEQb/NC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 951e8e9e-0593-4d6d-299f-08dbec0dcf2c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2023 10:20:25.8530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ycOYiwcSd2O0zhUNc1UvxRnst5ejdXuimaGDq9rtl7H4DRMCIZnHPygq/HwfUz2i1ydS/4DPtfg5Ing6oa6ayg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8951

Make it use its parameter in both places.

Fixes: 00a70f44a68c ("[HVM] Update VPIC device model for new interrupt delivery code")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/vpic.c
+++ b/xen/arch/x86/hvm/vpic.c
@@ -35,7 +35,7 @@
 #include <asm/hvm/save.h>
 
 #define vpic_domain(v) (container_of((v), struct domain, \
-                        arch.hvm.vpic[!vpic->is_master]))
+                                     arch.hvm.vpic[!(v)->is_master]))
 #define __vpic_lock(v) &container_of((v), struct hvm_domain, \
                                         vpic[!(v)->is_master])->irq_lock
 #define vpic_lock(v)   spin_lock(__vpic_lock(v))

