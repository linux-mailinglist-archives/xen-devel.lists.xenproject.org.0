Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0937F6E5A
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 09:38:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640226.998175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Rhg-00067s-9t; Fri, 24 Nov 2023 08:38:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640226.998175; Fri, 24 Nov 2023 08:38:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Rhg-00065J-6v; Fri, 24 Nov 2023 08:38:24 +0000
Received: by outflank-mailman (input) for mailman id 640226;
 Fri, 24 Nov 2023 08:38:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ulgz=HF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r6Rhe-00064m-KT
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 08:38:22 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d311c06c-8aa4-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 09:38:21 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB9438.eurprd04.prod.outlook.com (2603:10a6:102:2aa::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Fri, 24 Nov
 2023 08:38:19 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.012; Fri, 24 Nov 2023
 08:38:19 +0000
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
X-Inumbo-ID: d311c06c-8aa4-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MllaKE95MuQZ+EnS96dg9EXjxQe007+GYJ/FDDgUWxlPH1whph7oJ5Xis+yNCbPTWntDplgcTCDrrwXJiNnBQgmMRw+KsdRy4yoYYFqdaG4p0LieWPG4RUpuU0ynm2wEl6CsvWU6CBLyxwNNvnyLouf7fB9eZg6JR0NeW7EtOTz8sQrL192aCenAnEyzEggvkxd1xbGWVLXiza8PmlILjfV+qEp4gN7GYxHREm98OhcbfyqWqcQzTxsuZ889ICCdyAN6mKh4+Caf+hDIHA8U4EXktBZAXGkRrwsLJlFmMkme4jepWRjL23T1p8KkH9Q8OzhvpafNRRq8ernknQfexA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XBokk32caWSzkID+y12Vqv0MrPTCrlP6/S7oK2pbqf4=;
 b=eaYPNmvCoWGOempiO5O4VxyuNjx7Sf6UVA3nH/fdvdcNTL2WSjmnLreA4uhbGSdQ3trezh0Q0RRbZMXafm8t6P8L57LY0jl+vZQu+brUN+Ghb5lKmLuqh0Bkyi4s4Xprt5BL/85fSO62v/K24u5WJK50lSJDpAZgbpkqFXvVdPEpIk8mZNTnJuFiboIWDOAIRCtZAVjbcOkzQnmZxiPar0oNjEUo5vosT1PTjdAeHcfGv5XGOno9mP0KBl5wNeQO2ygIVP9nEcaLFSoHAGx1WN7Mxj2Sagx+R16ZfzBTbgIj/Kk1MdhgxKdPtK9Zzgqpv9gOt+xNdXPOuFuL/HFFLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XBokk32caWSzkID+y12Vqv0MrPTCrlP6/S7oK2pbqf4=;
 b=ztOePZ5HBr6ffl61dhBfKsXjLw/6ZRehSgRnM1CEcx6U0ypOrT8/ZL+L10zoolVP07m3utYt/nncp//FNzpewJGqIJ8uZCvgjn1XH8z/ouIW4PPeuzyCBBT47fbopLnzW7sHJnKSRJlUX3ngvbUZyXhRfL6P4faGDv56XzvmoN9Z0KaFM18MrxCgI9l/wriINNRmebbkiToJPLyyX4HXZQG32Xf/FDXTpFj89BNSl3fASrWTwr9jXcXPQ8eJg+LoE5wY2cavk1+0XBuHix3oLhsyPP0uJZL5IQ1wEjXokeaKNBc9c0efcxsoUYzzSbtWYMTinZ27PugcOYRg5jrnVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6abd997e-5592-4e7d-9c40-d70fb5d87823@suse.com>
Date: Fri, 24 Nov 2023 09:38:18 +0100
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 04/15] x86/HVM: drop tsc_scaling.setup() hook
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
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0408.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB9438:EE_
X-MS-Office365-Filtering-Correlation-Id: 43a8732a-a0ec-423b-d070-08dbecc8b5e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UrPIYpYEIfSxEtoQhBxbeVnonmpnYioBzNsK5pyHRUSmZJIGSSOqp6oF5IaxdiUNQp6VDwH1ITAYS6bT7fTXKNpvCeRn5yHsIMZxT25j5r1fC/dL3w1DIUlSZGnaBgVDoNnAJdCBtVpM9WqPZPkJQcNz8l8JM4DnUkR2m/+37dNtstUkGASoSVWEiH6X1mpT3B2hi7NOClaiofNrO/FUMFKE8xrKdjrQzIq5iGuwQ5tjwFied/2H8O0XzxYiRQvHTI3gkpO+ip5FFRyO19y+mUZcgaGomW6F0C14Fs9Mfj5VNY2CBxe53UUpZF5h7QA5iTKLWhf3SG4QgSusJk6gsMp2R0/6GI790xl6YCqzYEFNO7fRIUxmC9/N9B9goeE2R6DrMZ4/NoRo5/p/yp19RLsnjk/ktAitEswhcqYqjWdeR1p+LvzKmGJoQqJ4zT6J2ad6FDNCuPvCDWpX67zU7ltF5LUOGcEIZ93a369Q2+9ZxFYuDwBhXKy42ApLaAciwxTSdIZktWVZtiR5iaHSKz3XE+vnd8hLrCC73cPafukMFVJv7NxuadyBrqg7trYp/XlTOt3IEYkEDkfzvxKbFWynhy8kwuk8QTFhH7AdpdDc+ixXvFbTfeOk/bulDhUt5hkkfU5APi6IMtFnFUeaLg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(136003)(366004)(396003)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(36756003)(2616005)(6512007)(8936002)(83380400001)(5660300002)(4326008)(8676002)(26005)(6506007)(66476007)(54906003)(66556008)(66946007)(316002)(6486002)(2906002)(6916009)(478600001)(31686004)(86362001)(31696002)(41300700001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWJZUElLb2RnTzNSL3pLWWRMVld4NW43d0pMOUZaeW4vTlppZmpteXdRRmsx?=
 =?utf-8?B?bHVkdXY2dm01UGJJMWhZUXA3UHhDYXpmZ0RFRGpZSUU3UDR0c3M0L3BrdkIw?=
 =?utf-8?B?ZjYxbTNxQnprTm55VzhnaFRWSlc3Zm5zeHFtczNGTmRvcHJhY1RuUDdlUWta?=
 =?utf-8?B?MkJmZ2hjSk5WMktMbldvLzhtMFo2VTRmSGJZdlZhTXVGVVNwUkVqTHJPajZw?=
 =?utf-8?B?NDZJVng0VDQ0cXo2YUpVOVE2SFR1c2MvSHdHanFlbVJiVjJlRXl6OFFVeklL?=
 =?utf-8?B?eHRBMUI3UGpTYWh2KzcwSC9zVEw5WGo4RWJOd0ZJNmFybXVZM29LeG8zMi8y?=
 =?utf-8?B?VmZaTVlCNUd4VVpBSFJFbmxzMEhrZlFoVzRoZ3VPZ0MycVN4cGJZdFdESkNj?=
 =?utf-8?B?QnIxeU4vSWhaN25XOEFCK1FHeXhxTEVMZlFiRksrdnk4VytJaklIditqNjRw?=
 =?utf-8?B?ZGVsSlFJYk1qdUtWQnVQUFJOWUoyaG0xSXE1NlMwOC8wVFM1Tm9mSEFVSWk5?=
 =?utf-8?B?ZmpTSEtnbDhIK2p6MU5GRUZaQUllTHY2dGZDdzBLRmZzVjhRcmRqcFhEWUpJ?=
 =?utf-8?B?TmhOUDNlYWtlb1VtY2ZFQUxBSUJ1eEUxa3JmR0Z1UURCRURTZGNUbWtheHBS?=
 =?utf-8?B?ZFlEcEJhTHdiS2xmbnpJNDZhOUhmb0R5Nml6WDFLZUlmR05EM3BVeTFVVXho?=
 =?utf-8?B?R243cDZXNEU5WmVHaUNsOTZnQ3hGYkUwRjRtVVZERkpxS3h5MXFiT2VRSmd6?=
 =?utf-8?B?dDV0Y25lbGp0bSt6WDJDTFNGUVdTR2ZxSHV2dDU4YUNYYlhZZmxxVU9QaDlp?=
 =?utf-8?B?ZHprbWt1VWtIK1FGTmxhZTY1VW81c2wvdTEwMyt1ejR2anNhU3JMQ29QY1Iy?=
 =?utf-8?B?cTFaNDcrVkp4bmJrbEhJNkp6ZnJHUjJkNUFENVNTcmJCQXNMNC82UE1GRGN0?=
 =?utf-8?B?ak9SWTBwbTBCWi91V2V2dWVPU3dMalNvbldZVkorOHJLU3Z0NXR1ZHIxQUNV?=
 =?utf-8?B?bzl4UXZPTjRJdXFKT1ZVRzF5TlJOWVk2Z1F1UWJRUWRTVDAzKzZPK1dncVhx?=
 =?utf-8?B?V3BORW1JKzhiSHFGbkQ5ODRWSnlQeHBwK1o3MnNGb0grbUFySEF6bUdXK3lH?=
 =?utf-8?B?YUU5VjI3SUNKb0RDS0ZrMlNIOVgzdGlWYlppcUNpYnU1NGZhTUxoa3JBcGFN?=
 =?utf-8?B?anN5NmlMVnpzRkFkYjZKeFl5QVMzWW1sY1VCcDYzNnRzUUN3SnZZSWlSTEpY?=
 =?utf-8?B?bDVUZWoyQ2pKRkp3dTZOSTJBUW9VOVFXN3JVT2tWWGFBWnFRSzJEUERlUzJ5?=
 =?utf-8?B?R0lFMXgwVXhoVFlNYWdRYThLcmcvUFF2VDYwVTJCaGVPZ0F0ZTVnd0k2TWRV?=
 =?utf-8?B?ejRFRGlWMkRreGtKMWtwekF0Q3ZmZHNUTUdkRjNXN0RWSU50VXBIaTNFeTY0?=
 =?utf-8?B?L1EvN3VpRG84WDJsR29RajdPamNlRmU1NGw5TUQ1M2hBL0Y2dmVVSE5Jb0tV?=
 =?utf-8?B?am5jZEtTN2Q0bXI1bDlhSHJaQ2VUd0hzeDlpeitOK21TTlN3Q0krc2RsLzFa?=
 =?utf-8?B?SlgxOVFDd0JCSjdxRFB2QlVNdzFJSmJZUzFyWmZlc0hYeTNvZHUxK05tN0w3?=
 =?utf-8?B?UHl4bW1DVmJSM0NLTVpQMTFEaC92UFFub2lGNEdPTjNLQU1oY1BoUFU4RC8z?=
 =?utf-8?B?Ulk3QW9ERldIaXM0dG0reE9GUWNxYlJoVWdVNDNWWS9yM2xGWng0dmVZRkxy?=
 =?utf-8?B?WE50dTdySzVnZzZJWGNtWi9zQmRyOHh0RU42eVRueC93cjZzakFja003RjhH?=
 =?utf-8?B?NkFieXd2d1AzcklQYW5RbjNsVHRXL2htTmtNVTJNSjU3WGwwNU4ycHhQekR4?=
 =?utf-8?B?T2UvR0Q2ckR1a3pEOHdseDdOK3FoU3RKMFVXT1RDamQ0RVFEOVZEL2lpcm5x?=
 =?utf-8?B?dElWN21UeUFrWE1ndTl4QTF1RjZwT1BlY3llV2xScDFjQXlUa0I0Q21vbEI5?=
 =?utf-8?B?eVBiZFQ4ZE1HMVFLaHNzcnpaa1BCOUt4YVR3dmM1aHVlSzhaUTlYZHhnVWM4?=
 =?utf-8?B?aHhwNmdoTC9aSnNTdlltOFFnNTh3czU4WnBPaXFpdGpxUTRpS0I4YWRRMERN?=
 =?utf-8?Q?AoaaEy5tNxx3RYuimg3yjZmgL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43a8732a-a0ec-423b-d070-08dbecc8b5e7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 08:38:19.3426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sp6E/Szqz7lwboWLvj673DTN76ZYBLAgCDIVEOCCGd58ZVNmYqSg8mZxbYTwbVm7szoAWHF8YY1gOpR2rtHaXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9438

This was used by VMX only, and the intended VMCS write can as well
happen from vmx_set_tsc_offset(), invoked (directly or indirectly)
almost immediately after the present call sites of the hook.
vmx_set_tsc_offset() isn't invoked frequently elsewhere, so the extra
VMCS write shouldn't raise performance concerns.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>

--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1086,9 +1086,6 @@ static int cf_check hvm_load_cpu_ctxt(st
     v->arch.hvm.guest_cr[2] = ctxt.cr2;
     hvm_update_guest_cr(v, 2);
 
-    if ( hvm_funcs.tsc_scaling.setup )
-        alternative_vcall(hvm_funcs.tsc_scaling.setup, v);
-
     v->arch.msrs->tsc_aux = ctxt.msr_tsc_aux;
 
     hvm_set_guest_tsc_fixed(v, ctxt.tsc, d->arch.hvm.sync_tsc);
@@ -4033,9 +4030,6 @@ void hvm_vcpu_reset_state(struct vcpu *v
     hvm_set_segment_register(v, x86_seg_gdtr, &reg);
     hvm_set_segment_register(v, x86_seg_idtr, &reg);
 
-    if ( hvm_funcs.tsc_scaling.setup )
-        alternative_vcall(hvm_funcs.tsc_scaling.setup, v);
-
     /* Sync AP's TSC with BSP's. */
     v->arch.hvm.cache_tsc_offset =
         v->domain->vcpu[0]->arch.hvm.cache_tsc_offset;
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -1454,20 +1454,13 @@ static void cf_check vmx_handle_cd(struc
     }
 }
 
-static void cf_check vmx_setup_tsc_scaling(struct vcpu *v)
-{
-    if ( v->domain->arch.vtsc )
-        return;
-
-    vmx_vmcs_enter(v);
-    __vmwrite(TSC_MULTIPLIER, hvm_tsc_scaling_ratio(v->domain));
-    vmx_vmcs_exit(v);
-}
-
 static void cf_check vmx_set_tsc_offset(struct vcpu *v, u64 offset, u64 at_tsc)
 {
     vmx_vmcs_enter(v);
 
+    if ( !v->domain->arch.vtsc && cpu_has_vmx_tsc_scaling )
+        __vmwrite(TSC_MULTIPLIER, hvm_tsc_scaling_ratio(v->domain));
+
     if ( nestedhvm_vcpu_in_guestmode(v) )
         offset += nvmx_get_tsc_offset(v);
 
@@ -3031,10 +3024,7 @@ const struct hvm_function_table * __init
     }
 
     if ( cpu_has_vmx_tsc_scaling )
-    {
         vmx_function_table.tsc_scaling.ratio_frac_bits = 48;
-        vmx_function_table.tsc_scaling.setup = vmx_setup_tsc_scaling;
-    }
 
     model_specific_lbr = get_model_specific_lbr();
     lbr_tsx_fixup_check();
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -240,9 +240,6 @@ struct hvm_function_table {
         uint8_t  ratio_frac_bits;
         /* maximum-allowed TSC scaling ratio */
         uint64_t max_ratio;
-
-        /* Architecture function to setup TSC scaling ratio */
-        void (*setup)(struct vcpu *v);
     } tsc_scaling;
 };
 


