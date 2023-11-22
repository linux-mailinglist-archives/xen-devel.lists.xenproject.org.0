Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FAC7F3FB2
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 09:08:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638483.995036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5iH7-0007mM-J0; Wed, 22 Nov 2023 08:07:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638483.995036; Wed, 22 Nov 2023 08:07:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5iH7-0007kF-GT; Wed, 22 Nov 2023 08:07:57 +0000
Received: by outflank-mailman (input) for mailman id 638483;
 Wed, 22 Nov 2023 08:07:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r5iH6-0007iI-SD
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 08:07:56 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2048.outbound.protection.outlook.com [40.107.7.48])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ba49b31-890e-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 09:07:52 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS4PR04MB9575.eurprd04.prod.outlook.com (2603:10a6:20b:4fd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.17; Wed, 22 Nov
 2023 08:07:22 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 08:07:21 +0000
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
X-Inumbo-ID: 3ba49b31-890e-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MRNFuVhHOTgVJ5o6c4NsT+b5WjtDC186c/hpn58Mpix//BCH0yp34Owsshyjl/Wld9ccHiQ/Ula0kGU8ZK73Owem7Iv1iAQ1fmV3pQT/OuGXPPPrs9gyVQRrOopnXRAUHMTAkCrszAPKTem4bJ/mVpe3VeR7Dpgadpag1OvdbvHyWOEDtngS4zq6PseMref8Liron0vJ4AXyyGB4TmxKlfaXJlK7MBAba2f1DzvAPXGNufpvdoVP8ZU5qianCgWtIiqTKjUZ1qIcSmRjUjdfVr49Jj/ew4g5i7mCpELbrRkYkMuhR0c+QpWewnuePEldZHuy1ejB2SAJcTFgt/8WUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+1XrfPEnuVrH8r1ZHQb9+B/Rks/Hw2c3rcgUogUkmYQ=;
 b=h8OkKuu5TAstk2zisYgDhH8yViMpEmoy+LKCRD96GS0wvatwgr2GxxTpB5xZSpVguhG8wIOhOfvGE3QfzmrIeMqfdG0aJaXCb4DbPon+cBH+FHMbtIQBSfTo9Irxs7dWAu/TCsSlTt65U4jLCw72ln2rUDNVG6NPgwrnahJ7ptj28rASRdNDf5kSI6MegwDHWPOVOrIvVvnIfPKlg5DHZG/v9J/AZAA3dRTGuR9Nu0/e1irmqDcAgbpuGRADoghYpHRSRIDGimUEajafvy2yPjDlBeMZeyRdOObYRxSKGr0Ikhy8g6WGm364XPjrjkGBgKab9MzkxIqZSJC+Gesg1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+1XrfPEnuVrH8r1ZHQb9+B/Rks/Hw2c3rcgUogUkmYQ=;
 b=nc9oeAZoO7srZ8R/thYFT4oObvf3nPRXthJ/WtXI5mc3nOMZExUppt64QRYcfxYwF66JZzvHSxBnboogwz9G/pJguXqRYoEuvIcSJwo54CpSp3w9WFSBh2gBuTYAD99OHFxrm7NXMLnjnfOL4f2vzDA/uAY9IZw+iQnia6Sw7NPe8WcncM6O23TxCKg6CW0fEbfxWOuTvLJZIyKB6EBgFWoMC9/qII17lZTPuh4RhkaFG0IYx4kdXDmALaOFd+ZVVDSTzb+vn8NkZ1tumKQtYPk5yuzTKFJor8LeurWj1YUN/WUMsk5mgrugghz+NyAcRXBIHf7A/amyoVRUQiORVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1799e5c8-ab8a-453f-96f0-c3b66ae446e1@suse.com>
Date: Wed, 22 Nov 2023 09:07:19 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Devise macros to encapsulate (x & -x)
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen Devel <xen-devel@lists.xenproject.org>,
 Consulting <consulting@bugseng.com>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau <roger.pau@citrix.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
 Julien Grall <julien@xen.org>
References: <08e6cb27d65250d109df0ef8a49dc80a@bugseng.com>
 <ddb70b8e-e014-4389-9572-8d5272a73ec3@citrix.com>
 <alpine.DEB.2.22.394.2311171845440.773207@ubuntu-linux-20-04-desktop>
 <da1d557a-6030-4dd8-a875-af733572fc48@xen.org>
 <alpine.DEB.2.22.394.2311211742400.2053963@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2311211742400.2053963@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0144.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS4PR04MB9575:EE_
X-MS-Office365-Filtering-Correlation-Id: 9869aa3c-40b8-429a-863c-08dbeb320df1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	12SrBZG6DGfalVfEPJqlgxq8R24af7WlZyNs5/HLul6V5me8735NOc6VIgpA0wlua/bq0G+yhEIiAVy6JtNO38rSIaag/UrtZ2t89y5zvYbGzG7dq0Dunubdmr8r1IpBHIGd07rgt33eHz5J3A+emPZ/5mC0P+O6zu+EdIxE+3Pixfyj2aFfXMwiFdyeU8Lpcr5r84SpW3dxUvWtHdDRz2IEmwJCcxSXBVFhcoEJVh8ZlJYArO6rw3eLZyEhJ10GAWX70yKZGUVUZStmuBHY09CITWqIA7no0r8jRmSU6kV0kjTQpAVP8OSrMx7ChkZmbshG0jdSrK6GhRs+2PeiFn23HJbIg1YyT0zyV1tlbNXCRvJPNPYb3F6VkvsbE39X/xqAbb2IESZZ9X/qlo5zsLmVi6PObM+4LztnHrnQ52RwHhF68dyYGcTPjcYFvlwoCxZqvlBZe4QviYiTHF7uaVe+tPengBPUt90wVbGJSpF9TMYOwCdjYae7N1R20sdFH9VG+tiHjfFY+GpBsSyqT7MSDYOZVKR4de/6LYSd+jRZMCrNio3E8wXJPJ1SxUJ3XMJKT/vy24kM26TEP79kBeywpMc4nihH8Slr2jC+xnGbC0TQkafJxhMTOi438duZOw0/O3e3BALnuMXRKnPB9Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(39860400002)(136003)(366004)(376002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(41300700001)(36756003)(86362001)(7416002)(5660300002)(31696002)(2906002)(6486002)(26005)(53546011)(478600001)(6506007)(2616005)(6512007)(4326008)(8676002)(38100700002)(8936002)(316002)(6916009)(54906003)(66476007)(66946007)(66556008)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eWxldUw1eVlITU1pd2JyWlR1Q3lNMWh5Tjkrb2tPNGd1ZUovU0RIeDNoM2FX?=
 =?utf-8?B?b0JOaWZTYm5LazRCT0xITkxYeDFaK2t6NHpsdGVQTFU0THpwYXJZSkJzajRW?=
 =?utf-8?B?S3BKMzl6RENrNEE4cGttbFlLTlRmVS9rc0JGOTdBV2ptdXJFN2xYeDdiUzNP?=
 =?utf-8?B?dy9KOE04aGRaVnhLMG1LeWZJUEsxRHM4a2lTd2p1anVKSm5vY2UzdjlSLzcz?=
 =?utf-8?B?eHdHRXNTTlhEMDlqUGRZS2l4Vm03ako5ZHVMUkVMY0FGWFJJTXFxT0lmQzBk?=
 =?utf-8?B?OEJHeDRqR2RBaC9WU3k0RG1YVlJwdEVrRmIxcjV5QUlCcXNDc1I4Unkvd1FS?=
 =?utf-8?B?TzdUQi84NWVldnZuTHV3dVZKS1NHR2xGOWU5ZGFSOUg3c25oaUlRVW1Dbnkz?=
 =?utf-8?B?NlVjVnpEc0ZzRkloWGdIR3hYZXZMV1U5K2d6WTBmZGM4RENrZnkvSlZzekR2?=
 =?utf-8?B?ek96eXpReTFQQmtHdkRHRG9BZHJHZHdJUW1XMEJad0h2Vis1MUJyUlAvVkls?=
 =?utf-8?B?TzBzNjJBV2ZheDJGS2t3ZEMrS2pIWmR3V0kzWnhOZmxwa244T3ZSQ1hRVVdw?=
 =?utf-8?B?WkdwSUxTQXpxMlVuWU1nRnNIay9iMGNoTEtValMvN1ZSQXZkVlhZbVZ5YjJs?=
 =?utf-8?B?bHlhR2JGTStmOGF2emtqeG9KcnB5QUhMaHdJOVdqOUloVWtRSzV1Qk85dFBx?=
 =?utf-8?B?SHQvVVNqNTJ1ZkhIY09zc3Vpd2NhbnVYNTdCSG9ySVFYcFMwK0hqWFg2cnUx?=
 =?utf-8?B?RXArNlk5MnUzWTJ4QXNDMlJWY0hsaHlMTTRZVCt5cDh2amxReHlEYmtobkVk?=
 =?utf-8?B?YVZxdngwU3h5SFJwSmpUUGtXZE9iektHY2dJdGtLeHhwcWp6VVRpN2lyNklI?=
 =?utf-8?B?U0Z5U2M4ZW41NWlsQ1EwTUVhWnlhbllNMHByTGJDREYydHpDd2pLdHExc2Yz?=
 =?utf-8?B?NkpJZ0tTNStaa1lEUzVwVkZONVpWU0xHRkZaN3NJYjR3cFRySDVjM0ZVK1BV?=
 =?utf-8?B?ZDI2T0NDNG9kMWZKTWVBdkN3QklMUENJMU1YRnJkMExaKzYxQjZDL2phcWdG?=
 =?utf-8?B?WDh3enlEQ1lybk90Vzg5amJoUmI4YUo0Z09TZEpFTW9wSEZaVmI5dGR5c3Zl?=
 =?utf-8?B?bjRoY0RZU0oyRHNsZUlCSlhManlNdlAvVU9nWVVvbithcTdPQW5tTHJqTjdJ?=
 =?utf-8?B?ZnhuMHorRVptNGNwK1NQN3puakw5OERlNnFGQ2cxU2hGUHNXSEFScFdwRSto?=
 =?utf-8?B?aFF5SFlSejNXNGpLNXoyd3JzMUJOaDJkWmRDQWkyekUyZW41WDVpWDVEM1hP?=
 =?utf-8?B?K0V5SDkvL1lUQ2dGdmhXVTV4MG5TR1FwU3crU2tjWGU2QjE5M1Iwb3FZWFJE?=
 =?utf-8?B?NTlJQXRSRDZabjhvSit0YW5HOWVwSTUzNVJoR0oxK2N2UVlyeEF1a3EvRUNm?=
 =?utf-8?B?cUdRYjNMNTlmMC8yMGJVdmtZdHZscjVHVXNPUWlwSXlXdm9EWlJsclY4L0lZ?=
 =?utf-8?B?Z3VLMGhmNjdpQ1ZHWm5EeEQ5RlkyUllLN0hpcnRkSFREV0hsK296bVFSSkpM?=
 =?utf-8?B?aDA0VWh0dE16WGFSM0tFRGphY1dsclgreWh3K2NSY2loRGlRYkF2bndkRTRl?=
 =?utf-8?B?Z3k1d3RQeTlDWkNWMStMWGdkempQY0VFaFZRS2xDa3dEYTJiM3I0V3F0elBM?=
 =?utf-8?B?S2Q3bFhmZllXd2lCWEpDRE9OQytNYUlKdS9VRmVweHp6ci80STY2V3NPWWNT?=
 =?utf-8?B?Q0ZDSjR2UVBlM3k1VGJPYUQyY3kxTGtTak1oVFRPRm9od0crNHVLMWhiOGRy?=
 =?utf-8?B?VUlwMHFyYzRhcnBYL2xOZ0FwczA1U2NXMzdwZjFPMm91L01NbjdXbG56K0RW?=
 =?utf-8?B?cERrRk5Da0NDOVVjMDh2WHdUekRiblQxVzhQeUdkQkI2V1I1N1ZHOGkxY3ky?=
 =?utf-8?B?N1FWUmx2cnBuQnE1dEtFYkVzMjZwSGJPQzI5NEdIRmszckxORVJtckU4RlVL?=
 =?utf-8?B?MnBwblJPQ3RUelZ2OHY2YWZETmhrR3dHMml2RkhML21MNloxcXBLemd3OXFj?=
 =?utf-8?B?N2wwbEJqTEJyMGNYbnR2VGRwTXA2bU9HWmptUVc3ZmFHdlNLZHdwY2FyMFRT?=
 =?utf-8?Q?AHepmwi+h6HCqK/lpNPlyC/ox?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9869aa3c-40b8-429a-863c-08dbeb320df1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 08:07:21.9408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CdKv3nmyeMAb5RWg2y7AyCu9LyBO1qaGz3ys2J+D0ydgI8+nyiR+fA3eHluy905BMtMDET+DbOoWMYu05JbkHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9575

On 22.11.2023 02:43, Stefano Stabellini wrote:
> On Mon, 20 Nov 2023, Julien Grall wrote:
>> On 18/11/2023 02:46, Stefano Stabellini wrote:
>>> On Fri, 17 Nov 2023, Andrew Cooper wrote:
>>>> On 17/11/2023 10:17 am, Nicola Vetrini wrote:
>>>>> Hi all,
>>>>>
>>>>> As discussed in this thread [1], which is about complying with MISRA C
>>>>> Rule 10.1,
>>>>> a macro was introduced to encapsulate a well-known construct:
>>>>>
>>>>> /*
>>>>>   * Given an unsigned integer argument, expands to a mask where just
>>>>> the least
>>>>>   * significant nonzero bit of the argument is set, or 0 if no bits are
>>>>> set.
>>>>>   */
>>>>> #define ISOLATE_LSB(x) ((x) & -(x))
>>>>>
>>>>> This macro has a gained some calls in the subsequent patches in that
>>>>> thread, but concerns were raised around the fact that it would be
>>>>> better to devise a macro that evaluates its argument only once. A
>>>>> proposed solution is this (thanks to Jan Beulich):
>>>>>
>>>>> #define ISOLATE_LSB(x) ({ \
>>>>>       typeof(x) x_ = (x); \
>>>>>       x_ & -x_; \
>>>>> })
>>>>
>>>> Of course this was going to explode.
>>>>
>>>> This isn't even the first time an unwise attempt to do single-evaluation
>>>> has needed to be reverted because it doesn't work with Integer Constant
>>>> Expressions.
>>>>
>>>> Switch it back to the first form.  It's obviously a macro to begin with,
>>>> and not likely to be used in cases that have side effects.
>>>
>>> +1
>>
>> FWIW +1. I don't much like the idea to have two different versions of the
>> helper if there is no real need for it.
> 
> Jan, would you be willing to accept that other maintainers have a
> preference for having a single MACRO even if suboptimal?

I can live with that, even if I'm surprised by this perspective that others
take. How can we, in reviews, tell people to make sure arguments are
evaluated only once, when then we deliberately do otherwise in a case like
the one here? The criteria of "not likely to be used in cases that have
side effects" is an extremely fuzzy and sufficiently weak one, imo. I for
one am even worried about the uses in MASK_EXTR() / MASK_INSR(), and would
have considered introducing single-evaluation forms there as well.

> If so, can we go ahead and commit the original patches?

Well, the renaming needs to be done there anyway.

Jan

