Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 016C67FB901
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 12:08:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643041.1002904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7vwX-0001wW-31; Tue, 28 Nov 2023 11:07:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643041.1002904; Tue, 28 Nov 2023 11:07:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7vwW-0001tA-Vp; Tue, 28 Nov 2023 11:07:52 +0000
Received: by outflank-mailman (input) for mailman id 643041;
 Tue, 28 Nov 2023 11:07:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xcZ5=HJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7vwU-0001rU-NF
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 11:07:50 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2087.outbound.protection.outlook.com [40.107.7.87])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d55f5f4-8dde-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 12:07:48 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7517.eurprd04.prod.outlook.com (2603:10a6:102:e0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.21; Tue, 28 Nov
 2023 11:07:19 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Tue, 28 Nov 2023
 11:07:19 +0000
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
X-Inumbo-ID: 5d55f5f4-8dde-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b3mLbMwxAcpwIuQZHaoh6bg06Elf3ZT7a/fPHmgKIunXkCXVEeY/dKF1s6elXX4ysb5VMKJDsVAdmSn0OhVkVDCwd+IuiX51y6UoG+5KZfUnYV3WT3tjhKOKiKxOYtXQ0LGltLSiaaBm0QHmwCA/CNYCbNtJK1cwC3iIkbjs5+wcoyNr14UvJ+ffXZqZsGOsi7cVosvb/IIUARyfSbphngiNS305FrKJ+FSSnDrddkMUAa5/0oxqTq8JbfnHilb9oxpDnTF7S6U4MYeRSMJjAaTSyvNDqxkT4QihDHgwgqMSxr2e75AX82yYLHOjToYSP71tI35wvBT+tuknHpUF5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ji3OEKhwUqIsvsQcUzde40pnng7Ln2JAoUedRd8HgV0=;
 b=K7sLxoFjcgA0gq5hmVMlDdQYNQB2eq+pDhWErjl+O28pi1zevh7iUOAEmdSAWLc/O1XSAr0GCwpstO/ueRk8vgwnMEY6v2fF7Jao+qIXaaj/ArSBd3X6l0hG5WUEKdVwJwiFnzFcNTrzjyxkKH7e7deJOY2vcXCkof2EUimMOIQEDnczX00joIC8fgYo1pig5BfQ55pmXkyVRHCHbuAaeEGhlj3+HnH4Vtzf/sQwQ23aGZ0qGxHdseLae5IIZuYBrtFCny5rngqOTK1NM16jLPahfy+6VaQkV4DLgz+VFZ6KPDNJnhq3ageHGYx6aOI4uvZpDzXTAftykLQZcy5waQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ji3OEKhwUqIsvsQcUzde40pnng7Ln2JAoUedRd8HgV0=;
 b=tnhcQLYLEIZqwBSFZK4kppbLmW+jSA8PtnCAoZJqLJqQuogCzY8iMbM4ttx+gZGMm9mXnzvedAMnznkibDlIc7N0SgZt2vI9r8SVDnCybUqL8OOStdwRx1CSr7S2nQRX86c8GH30hERENekUk9H+82KAED/lg77ohDVEqcYy6dbgmo/dZ+4Y/Li3pZDwFCEy8wMG6p25XKTJuQxurP7OWhZp7TLO7Hfw5LY4rDjxcuy8O+P0jnJPTL9yXLpzRqboddd+f4DT0LStbXC28WCbjKSXNoxMwVZ3bf8Bu0EBvLiYOrpXkDB1kchLpjHZFci12TwLu7QCKqVqNmx+aNJlkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9cad2c92-c0be-464b-b59c-7dd72d3090a6@suse.com>
Date: Tue, 28 Nov 2023 12:07:18 +0100
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 3/6] VMX: tertiary execution control infrastructure
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <e13004ac-22af-411e-a5d0-907a2a0301c5@suse.com>
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
In-Reply-To: <e13004ac-22af-411e-a5d0-907a2a0301c5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0192.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7517:EE_
X-MS-Office365-Filtering-Correlation-Id: 160e6a0d-57f7-47d9-df93-08dbf0023022
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nwFQEfzR/z3qPTFdApbcnHI89UsFXiamivXOTl6XAG1+2WMvL5PB0NZhjG6vII/LRzc5bc7I+7EhGRV6revMqyRHTkdhgg1mtQT7kDyk+xkcmsSgx1hPdT2ZcWXb0lnwDyPtCdym+LDzLe0rTETGtMI3wUHN5PRWxTTWr0bFOS5zqCneDeAupVO9sbqitvC0gp992TiQrF8s9BibuVgL0BpjOjWGEjOwJGPvMQqno0qBPON92QtOvssZEKEhY8aZ7eXATmgxl5lISjpIjncyj0IY2mBHRZXW7r+q1Um7dYC52dB7b/41gwZ/cixYlWK2p2eH6WVFnIC1PGJMrciy0GgsZjTvZwLG0FX3utlNE5eqL2wVstNTq8bBIJ3PAEKd//M2TWrdUxOLLdelzKBzLxYKITuacAjj3g7SFdCFzXc3yGHTKYYYs82ZHRGyMfuXsbIWUmjcYl3EYjMKUAay8yawB9djMFtS2q3iFC8k+t5J8XLo7TeWU+7oeKRPWcs57FzxFfVwkIcYk/JHgFpiHHh7CWRGjTFxmc8V3UCauBRxhmgZh0XO5qwHJcOnGes2gpvW8q5Uv6eB3J9/hPlEj/QimD39oKg6Ml2CiaXYP2f4/GrAYXvhBM6FThNjXwu0co4iliPTWnJ0lnGbZszl/w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(366004)(396003)(39860400002)(346002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(86362001)(31696002)(83380400001)(26005)(6506007)(6512007)(2616005)(31686004)(36756003)(38100700002)(478600001)(66556008)(66946007)(66476007)(6916009)(4326008)(6486002)(8936002)(8676002)(5660300002)(2906002)(41300700001)(316002)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UlNpaCtDWGhuODRINEFXTktRTkh3YTB5ektXUTBpQnRkbHExazdtVHF1UW41?=
 =?utf-8?B?OWlzNDZBWDRyQ09XUWUwbUV5TmpuYXJYaDZPc2s4VlkyRWxzZ3g5bFNwOGVt?=
 =?utf-8?B?azJZdVlDdGU4TjBCWGZLUmJveTRIMXB1YUNSdjJvOVRQeGZPWjIyUHpNRTA0?=
 =?utf-8?B?UEN2U000L3JpaEI3T24yU3J6a3JFRW9ZckdpK05FR09UaDdScG5iQVl5Qnpq?=
 =?utf-8?B?b2x4cEcwRVh2Skc1R1NRNjNnVStJWndDRVBmYjYvSWdKZGo5RHlHZ3VaSDFU?=
 =?utf-8?B?Q3RBU3ppNDB2TnBQSWlPMHJoQ05uTG5tamRjc3d4c0hHSGZBUEJ1MU1jRjFM?=
 =?utf-8?B?eFlleWd3a3R6WjFhOFRPR3VYU3lNL3RSYWJ4YWhrNVc5NS9oR3pqY1RDTjNP?=
 =?utf-8?B?ZjA3ZnZ6RlFRbFZhZmNpQkVuUjVXaXpWT1lIcG4rblBia2ZKZGdxM3AxZkE0?=
 =?utf-8?B?a0srWUp3RHc5YjBWaFUvek10WUVLM2srMnBmaU5ZS2Z4QkMyeXVrd21oc2xq?=
 =?utf-8?B?NzZBNU0zZVdJSWtMTXdOK2JaV0EvVWZoMlJaOHpDKzlucVd2NmtOeERPeERT?=
 =?utf-8?B?Vndna1hHN25sL2FUc3F2ZFhwTiswTzQyRitBR0ZZZ1NLOUE5UFRHcFozc0NC?=
 =?utf-8?B?Nmp0Y1E3QlJtWDJNWFFSaUEySEorWDlQUjBKWE04ZXNiRDRpV2lsTVlUTUNw?=
 =?utf-8?B?Ujk0Smw5cVBuTmk2RHF4Vm5vSFIrLzcwRkF1NXhDT3RPWkIrR2p1NlFobWJa?=
 =?utf-8?B?UDhxVUl1K1BDUXRmVThoZWxybFNrc2ZiRmJVdlZxMmljbTlGZEZwMG1DUWtB?=
 =?utf-8?B?KzB6MEVrVmViODVxcGxDNDNiTlU4NmpKMTRvRVZpYlRySjBUL25yS1R3WDV5?=
 =?utf-8?B?VjRLN3poTGVZVnFwYXEvMHJnWnVVMW5MbkRRQmdqMUlnSVhUYVc2V0FPbGh5?=
 =?utf-8?B?K2JDRFlHelBsaktKMWlRdEZqZ0tPM1hSbVVrZEt3eTVKS0tqR1RvZDNadldQ?=
 =?utf-8?B?UGUrNW5MYTYrbGxFYjR3SjFHWkgrRTB1Z2JJNG9TZHowZlEzRHhRbmJBeXUv?=
 =?utf-8?B?TzlCWFVSNFhQeDhaTHZwS0xKUWR4US9mU0FjNlZ5bmlVWk9Zd1V2eHpXLy90?=
 =?utf-8?B?c09rVVVDM2Y2UnozaUdWWjI1aloxTWtkTmR2dlhURnhSOU03bVZwaHlncnQ5?=
 =?utf-8?B?aDFVOFFFSVdVN3lWSmN1TFFyMEpHdWFIbjlCV3JyZmNGSDVKWE95THJzR0Ji?=
 =?utf-8?B?dFh4b1VHSHozVzJmc2dWY3IvTVhMY3NmRVBUZVZHbEZKSHk4eEE2YStxd1M2?=
 =?utf-8?B?M0ltSlZDRUdubVNWbW9sVHlzOXRYNThDME05aU4zVFJoZ0VUMWtqSzU3Z1lJ?=
 =?utf-8?B?d1luaUJ6d09Ibzd2Ull5amZCcjVRZjBnZVhwZ0NuaVJUb0M2VGlpOVJpZHk1?=
 =?utf-8?B?TlV1bGxxM05ReHJRYWJhRjRRSFE5czBQSU9tbmc4VzhhSFFpUURmWWRhdkE5?=
 =?utf-8?B?MWVybkpFdW55UXl6OFZnc1JhMXVwZHRlVjgyNUZhZnRvbzJkWUJ3MkJCejBa?=
 =?utf-8?B?OVNwd0FhcHpQNzlHN3NQSzUzNTBwc2lzc1VibUJSTmZRcTBXMmtkU3JrS25H?=
 =?utf-8?B?NVVxK1JtclMwdzl4QXJmYVZxU05WWWtaRjJlWnY2L1huMUZpZldCUnNwVmc0?=
 =?utf-8?B?VjVmMzBicGNBS24rNWRidVcvMzJ1K0ZsQlRyT2Zqa2FQTHdiOVkzeGlkOW44?=
 =?utf-8?B?UzJRUnNKdXpENzdwMXhqcFhQWDh6QlAwUjNIRHozeSt2bGx0M3h2TWJoZEU3?=
 =?utf-8?B?alVsWGVCZkc5MDNocUxHbTdCcDJhSkV5Z1NwSzVoM3ExaEhadzZ5NFI1UDBl?=
 =?utf-8?B?eWFuTTdHR211dG5VREpTUUZtYlIzKytlTkpCdGdTMFUxbzROcHpSRVBIODhC?=
 =?utf-8?B?ZFFxeENjY0VrdGhpTUFVZHowVVZFdzUyRWk1T3dWOWhxcytrdXFteFBQNDZy?=
 =?utf-8?B?UXdCcnN0aDFPNEdSc2U3UEloaUF5c1hJQ3dSWXhzZDhITUNpaDU5TzlkeUxC?=
 =?utf-8?B?bGpGQUo3bUdWc2xnYXBCMXZLWEVjaXRDdzdDN2lWdFprVHhKempGYlBJZThq?=
 =?utf-8?Q?kNXiCJL01pQ//fwOv20of9Sk0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 160e6a0d-57f7-47d9-df93-08dbf0023022
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 11:07:19.2055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ixvSWC6q4U1bdy9m91Eq+KqFpIVI4CnnVxMdEe2NvycnYCePvKbUU22TaOy8WgVm5E3SzuAZDc8Xk3Ww0wKIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7517

This is a prereq to enabling the MSRLIST feature.

Note that the PROCBASED_CTLS3 MSR is different from other VMX feature
reporting MSRs, in that all 64 bits report allowed 1-settings.

vVMX code is left alone, though, for the time being.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -164,6 +164,7 @@ static int cf_check parse_ept_param_runt
 u32 vmx_pin_based_exec_control __read_mostly;
 u32 vmx_cpu_based_exec_control __read_mostly;
 u32 vmx_secondary_exec_control __read_mostly;
+uint64_t vmx_tertiary_exec_control __read_mostly;
 u32 vmx_vmexit_control __read_mostly;
 u32 vmx_vmentry_control __read_mostly;
 u64 vmx_ept_vpid_cap __read_mostly;
@@ -229,10 +230,32 @@ static u32 adjust_vmx_controls(
     return ctl;
 }
 
-static bool cap_check(const char *name, u32 expected, u32 saw)
+static uint64_t adjust_vmx_controls2(
+    const char *name, uint64_t ctl_min, uint64_t ctl_opt, unsigned int msr,
+    bool *mismatch)
+{
+    uint64_t vmx_msr, ctl = ctl_min | ctl_opt;
+
+    rdmsrl(msr, vmx_msr);
+
+    ctl &= vmx_msr; /* bit == 0 ==> must be zero */
+
+    /* Ensure minimum (required) set of control bits are supported. */
+    if ( ctl_min & ~ctl )
+    {
+        *mismatch = true;
+        printk("VMX: CPU%u has insufficient %s (%#lx; requires %#lx)\n",
+               smp_processor_id(), name, ctl, ctl_min);
+    }
+
+    return ctl;
+}
+
+static bool cap_check(
+    const char *name, unsigned long expected, unsigned long saw)
 {
     if ( saw != expected )
-        printk("VMX %s: saw %#x expected %#x\n", name, saw, expected);
+        printk("VMX %s: saw %#lx expected %#lx\n", name, saw, expected);
     return saw != expected;
 }
 
@@ -242,6 +265,7 @@ static int vmx_init_vmcs_config(bool bsp
     u32 _vmx_pin_based_exec_control;
     u32 _vmx_cpu_based_exec_control;
     u32 _vmx_secondary_exec_control = 0;
+    uint64_t _vmx_tertiary_exec_control = 0;
     u64 _vmx_ept_vpid_cap = 0;
     u64 _vmx_misc_cap = 0;
     u32 _vmx_vmexit_control;
@@ -275,7 +299,8 @@ static int vmx_init_vmcs_config(bool bsp
     opt = (CPU_BASED_ACTIVATE_MSR_BITMAP |
            CPU_BASED_TPR_SHADOW |
            CPU_BASED_MONITOR_TRAP_FLAG |
-           CPU_BASED_ACTIVATE_SECONDARY_CONTROLS);
+           CPU_BASED_ACTIVATE_SECONDARY_CONTROLS |
+           CPU_BASED_ACTIVATE_TERTIARY_CONTROLS);
     _vmx_cpu_based_exec_control = adjust_vmx_controls(
         "CPU-Based Exec Control", min, opt,
         MSR_IA32_VMX_PROCBASED_CTLS, &mismatch);
@@ -339,6 +364,15 @@ static int vmx_init_vmcs_config(bool bsp
             MSR_IA32_VMX_PROCBASED_CTLS2, &mismatch);
     }
 
+    if ( _vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_TERTIARY_CONTROLS )
+    {
+        uint64_t opt = 0;
+
+        _vmx_tertiary_exec_control = adjust_vmx_controls2(
+            "Tertiary Exec Control", 0, opt,
+            MSR_IA32_VMX_PROCBASED_CTLS3, &mismatch);
+    }
+
     /* The IA32_VMX_EPT_VPID_CAP MSR exists only when EPT or VPID available */
     if ( _vmx_secondary_exec_control & (SECONDARY_EXEC_ENABLE_EPT |
                                         SECONDARY_EXEC_ENABLE_VPID) )
@@ -469,6 +503,7 @@ static int vmx_init_vmcs_config(bool bsp
         vmx_pin_based_exec_control = _vmx_pin_based_exec_control;
         vmx_cpu_based_exec_control = _vmx_cpu_based_exec_control;
         vmx_secondary_exec_control = _vmx_secondary_exec_control;
+        vmx_tertiary_exec_control  = _vmx_tertiary_exec_control;
         vmx_ept_vpid_cap           = _vmx_ept_vpid_cap;
         vmx_vmexit_control         = _vmx_vmexit_control;
         vmx_vmentry_control        = _vmx_vmentry_control;
@@ -505,6 +540,9 @@ static int vmx_init_vmcs_config(bool bsp
             "Secondary Exec Control",
             vmx_secondary_exec_control, _vmx_secondary_exec_control);
         mismatch |= cap_check(
+            "Tertiary Exec Control",
+            vmx_tertiary_exec_control, _vmx_tertiary_exec_control);
+        mismatch |= cap_check(
             "VMExit Control",
             vmx_vmexit_control, _vmx_vmexit_control);
         mismatch |= cap_check(
@@ -1082,6 +1120,7 @@ static int construct_vmcs(struct vcpu *v
         v->arch.hvm.vmx.exec_control |= CPU_BASED_RDTSC_EXITING;
 
     v->arch.hvm.vmx.secondary_exec_control = vmx_secondary_exec_control;
+    v->arch.hvm.vmx.tertiary_exec_control  = vmx_tertiary_exec_control;
 
     /*
      * Disable features which we don't want active by default:
@@ -1136,6 +1175,10 @@ static int construct_vmcs(struct vcpu *v
         __vmwrite(SECONDARY_VM_EXEC_CONTROL,
                   v->arch.hvm.vmx.secondary_exec_control);
 
+    if ( cpu_has_vmx_tertiary_exec_control )
+        __vmwrite(TERTIARY_VM_EXEC_CONTROL,
+                  v->arch.hvm.vmx.tertiary_exec_control);
+
     /* MSR access bitmap. */
     if ( cpu_has_vmx_msr_bitmap )
     {
@@ -2070,10 +2113,12 @@ void vmcs_dump_vcpu(struct vcpu *v)
                vmr(HOST_PERF_GLOBAL_CTRL));
 
     printk("*** Control State ***\n");
-    printk("PinBased=%08x CPUBased=%08x SecondaryExec=%08x\n",
+    printk("PinBased=%08x CPUBased=%08x\n",
            vmr32(PIN_BASED_VM_EXEC_CONTROL),
-           vmr32(CPU_BASED_VM_EXEC_CONTROL),
-           vmr32(SECONDARY_VM_EXEC_CONTROL));
+           vmr32(CPU_BASED_VM_EXEC_CONTROL));
+    printk("SecondaryExec=%08x TertiaryExec=%08lx\n",
+           vmr32(SECONDARY_VM_EXEC_CONTROL),
+           vmr(TERTIARY_VM_EXEC_CONTROL));
     printk("EntryControls=%08x ExitControls=%08x\n", vmentry_ctl, vmexit_ctl);
     printk("ExceptionBitmap=%08x PFECmask=%08x PFECmatch=%08x\n",
            vmr32(EXCEPTION_BITMAP),
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -760,6 +760,12 @@ void vmx_update_secondary_exec_control(s
                   v->arch.hvm.vmx.secondary_exec_control);
 }
 
+void vmx_update_tertiary_exec_control(struct vcpu *v)
+{
+    __vmwrite(TERTIARY_VM_EXEC_CONTROL,
+              v->arch.hvm.vmx.tertiary_exec_control);
+}
+
 void vmx_update_exception_bitmap(struct vcpu *v)
 {
     u32 bitmap = unlikely(v->arch.hvm.vmx.vmx_realmode)
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -114,6 +114,7 @@ struct vmx_vcpu {
     /* Cache of cpu execution control. */
     u32                  exec_control;
     u32                  secondary_exec_control;
+    uint64_t             tertiary_exec_control;
     u32                  exception_bitmap;
 
     uint64_t             shadow_gs;
@@ -196,6 +197,7 @@ void vmx_vmcs_reload(struct vcpu *v);
 #define CPU_BASED_RDTSC_EXITING               0x00001000U
 #define CPU_BASED_CR3_LOAD_EXITING            0x00008000U
 #define CPU_BASED_CR3_STORE_EXITING           0x00010000U
+#define CPU_BASED_ACTIVATE_TERTIARY_CONTROLS  0x00020000U
 #define CPU_BASED_CR8_LOAD_EXITING            0x00080000U
 #define CPU_BASED_CR8_STORE_EXITING           0x00100000U
 #define CPU_BASED_TPR_SHADOW                  0x00200000U
@@ -260,6 +262,13 @@ extern u32 vmx_vmentry_control;
 #define SECONDARY_EXEC_NOTIFY_VM_EXITING        0x80000000U
 extern u32 vmx_secondary_exec_control;
 
+#define TERTIARY_EXEC_LOADIWKEY_EXITING         BIT(0, UL)
+#define TERTIARY_EXEC_ENABLE_HLAT               BIT(1, UL)
+#define TERTIARY_EXEC_EPT_PAGING_WRITE          BIT(2, UL)
+#define TERTIARY_EXEC_GUEST_PAGING_VERIFY       BIT(3, UL)
+#define TERTIARY_EXEC_IPI_VIRT                  BIT(4, UL)
+extern uint64_t vmx_tertiary_exec_control;
+
 #define VMX_EPT_EXEC_ONLY_SUPPORTED                         0x00000001
 #define VMX_EPT_WALK_LENGTH_4_SUPPORTED                     0x00000040
 #define VMX_EPT_MEMORY_TYPE_UC                              0x00000100
@@ -295,6 +304,8 @@ extern u64 vmx_ept_vpid_cap;
     (vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_MSR_BITMAP)
 #define cpu_has_vmx_secondary_exec_control \
     (vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_SECONDARY_CONTROLS)
+#define cpu_has_vmx_tertiary_exec_control \
+    (vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_TERTIARY_CONTROLS)
 #define cpu_has_vmx_ept \
     (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_EPT)
 #define cpu_has_vmx_dt_exiting \
@@ -422,6 +433,7 @@ enum vmcs_field {
     VIRT_EXCEPTION_INFO             = 0x0000202a,
     XSS_EXIT_BITMAP                 = 0x0000202c,
     TSC_MULTIPLIER                  = 0x00002032,
+    TERTIARY_VM_EXEC_CONTROL        = 0x00002034,
     GUEST_PHYSICAL_ADDRESS          = 0x00002400,
     VMCS_LINK_POINTER               = 0x00002800,
     GUEST_IA32_DEBUGCTL             = 0x00002802,
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -81,6 +81,7 @@ void vmx_realmode(struct cpu_user_regs *
 void vmx_update_exception_bitmap(struct vcpu *v);
 void vmx_update_cpu_exec_control(struct vcpu *v);
 void vmx_update_secondary_exec_control(struct vcpu *v);
+void vmx_update_tertiary_exec_control(struct vcpu *v);
 
 #define POSTED_INTR_ON  0
 #define POSTED_INTR_SN  1
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -347,6 +347,7 @@
 #define MSR_IA32_VMX_TRUE_EXIT_CTLS             0x48f
 #define MSR_IA32_VMX_TRUE_ENTRY_CTLS            0x490
 #define MSR_IA32_VMX_VMFUNC                     0x491
+#define MSR_IA32_VMX_PROCBASED_CTLS3            0x492
 
 /* K7/K8 MSRs. Not complete. See the architecture manual for a more
    complete list. */


