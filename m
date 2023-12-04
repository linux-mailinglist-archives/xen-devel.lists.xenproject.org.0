Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA8980323B
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 13:13:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646880.1009515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA7oD-00047L-PR; Mon, 04 Dec 2023 12:12:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646880.1009515; Mon, 04 Dec 2023 12:12:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA7oD-000458-LV; Mon, 04 Dec 2023 12:12:21 +0000
Received: by outflank-mailman (input) for mailman id 646880;
 Mon, 04 Dec 2023 12:12:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CG6/=HP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1rA7oC-000452-7l
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 12:12:20 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0611.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5edac03e-929e-11ee-98e5-6d05b1d4d9a1;
 Mon, 04 Dec 2023 13:12:19 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB8172.eurprd04.prod.outlook.com (2603:10a6:10:249::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.22; Mon, 4 Dec
 2023 12:12:17 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.022; Mon, 4 Dec 2023
 12:12:17 +0000
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
X-Inumbo-ID: 5edac03e-929e-11ee-98e5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m9CBvF0gIyYUhLjx6w7SqwwmGSHQ1GabKOkZwvFDg00BDW7lpndEpjLgP9YocmmAaQkXv6aauly/6WqP1fT4Pf33RhM6No4DoyU/yAE0HBfk52IOuiYLr/Pmnja5cpg/AQKpTv7S6GiIp3zIlLGWYbA4Rz6EjjgCkvGSUYFnekSADSmgnEtqOA3iX6R6fWT6whEIYu4zHA7zScZyaZ55xC2tZPyqwXx1LH5VOm5Y9/XjNW3xQOtwGq47FqIhcqTBxjdOWOwxomvJov7I4Z49J2PTz0v2xALXJpG3f2xjVNhJMvSFrOTDnxSPi9DC5VOXGFK440IDiPFrvyOqZVaJUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MJYoOUS2jwS4PXuuYtyED5uxJt9FGAGeE2bySRjvRf0=;
 b=QQz1PJtCvN8F2D21DIkXLg00FpfK3nRVq5AXuR3WHRwGpkPeSrOTRo2JnQkpdF7omfVGjvZ1N9DXg7/D8CCWe0a+Nf4l9FQwD8CfWiqyepD+SJt3QQcgr1XBcd3Q9EFt6Dv0IKbDCCBEm9PwCyD1s5ok807RjAKkLLwPEngDfCnmf2qkC1THcv0nf4a+dhucPaWoGRU1kUiSqXvTmihy2hOj1IHbbLU4vOVJbJ7Lb5hxC/NnGfAYrHETZqmhHElTIILgJ2LvfpvB+hUCICKUyxzPCNDoUGrXp4mA3gH39lbruiO+KTHCUlEbVv4EblnUtbCOf1z/kNcyYpboDTT7fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MJYoOUS2jwS4PXuuYtyED5uxJt9FGAGeE2bySRjvRf0=;
 b=l6gIsS2YkglR85nqdrCmOlo33nLYdMI2gYy9uWHbuu00Jl5vsUjjIp0kmsUUfmVT57HHqpvpZMAxQlZ2eDXKfMecndKFYcLSwabRb89SCihx58rdwkHBMSDlC7sDGdE4D+jJJGyHqt9YlBuDac8r5u96PshW2Xv9dYr9QW639jeTaw8kZBpGUlFy5ULyL6Qzb6gXkOAbKVFV4ned9MjTjXwFO9hKH8aXorS4V7QFrhuf04N/WwHCdaJQ+KGt/dzcCaOekMSMujeVnFmpXQ5UfucyAZtDLwE0BxupcIF0VZkTtpUiL283iBb8IeuARIiCYdZ0yJD7Da46FOyyIXgLXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8204f9a5-8554-4b30-897a-982848069e71@suse.com>
Date: Mon, 4 Dec 2023 13:12:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/DMI: adjustments to comply with Misra C:2012 Rule 9.3
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <4876b0a8-b96b-4f60-8040-a346b2655645@suse.com>
 <0bf576e1-b9ce-44f5-9866-7b67706a100c@suse.com>
 <a9e42c5d486003375aec441b17d33d96@bugseng.com>
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
In-Reply-To: <a9e42c5d486003375aec441b17d33d96@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0409.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB8172:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c88ecb3-b384-4000-9b53-08dbf4c2420e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hb46x3db4x79u5JHjEizNwtkFPasvT1dlvZpgSY69o61OIAdk04Gwj7O7qUi1acZn6gNRbRKlcVmRk7YC6iwr+IpZjNJsTj1ZBqgShla9YH/qWkaMG9Xupe91knO3f6xLo03DEOvAU2uB/+PDPX/jnPOIJl727AFQlouXlphMAV6rW+9myVt8KtslIMh0j0Kp9XRi37PiSKPDvstYG6/HBbyrNge1v/gLW0vB0nF9cOs2jJHUsfLDhu80KeKQw6eqA0Cl3MoyQWdeKdGtV92X7AtIHl0tXFmdeTghkw4Ru+lOFP499N5fCPF0lFwoosR4YzouYswyqtOzONpOK+zvS2LO+sCNNz2+o2sd6sIPmefjfYYt8TbQoL85Sw3LlRAe+cOLBjLVS5olYtWmmy46NuWjFFyCFZQ60AVjGee4vMRxKwZP1b/FPL7aue2pRUpvh2a2n2iMrVB9BBrgwpfjUubfCe5xzei2P1pFKHFE6g0479OtDMoUwTWijUSndUpMMMIfAjOqG3byMa9054Cqq/f3BNyf+sGKgCh1DMotmQ8d81ZdYvBXYGOOfT90GYk8wnSdn95iLq3C5TLnT4qn+FWMiXqChFiJz70t58X4kGyhFCtMiG1K3A6msR4FVSk8LR19hgyh4QBNxhSx8VX0A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(376002)(366004)(396003)(136003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(6916009)(66476007)(66556008)(66946007)(316002)(54906003)(4326008)(8936002)(31696002)(86362001)(36756003)(8676002)(53546011)(6512007)(4001150100001)(6506007)(478600001)(6486002)(2906002)(966005)(2616005)(26005)(38100700002)(41300700001)(5660300002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXJjVXkxVmt5NHAzTW1XWGZFckxOVWttak1sK0xoSTMwTmVNbWNyQnZNbnYv?=
 =?utf-8?B?eDBsNVd4SUJjY0tMVW5JTDBXakpXKzArSjgrTG9PSGtmZ1dkVGdLbXd5S3Nm?=
 =?utf-8?B?dm1SZkh0YUU5SjVNT1ZWcVpsaHZsVzlKeE1wY2J5YndvMFhpa1FQTTR5RmlJ?=
 =?utf-8?B?QWNyakd6L0IyNW9xNEhKb3NPeCtrT0p6cEJSY2dWZkt1L0tiYk9OSU9FUmUr?=
 =?utf-8?B?QjJPdXdybk1PZDJzVFdFUTRsemFJK1Y4amZMRUVMNU1sV0xwcEV0NUp2T2h4?=
 =?utf-8?B?b1BzdEs0a1RWZmZ2SWRiMzdtOHVKLyt5V0RCVVJLV2NWRkdRb2N6U1lFd05l?=
 =?utf-8?B?ZWtNNG1xSExBVUVYR2JxNG85V255bUpCdmx5bk9NYW9WZldFRUdleEJrQnZn?=
 =?utf-8?B?cWNTMm41SUcvY0xzU1BEK0M2MG9LNk50WDlOUDg4ZEdRalN3dXkyVmtQVUtW?=
 =?utf-8?B?c05hMllVKzRNSWdOU3EyWVRCNThlWCs5Y3JtcVJVaWc1UGRJbDRZcU01d2g4?=
 =?utf-8?B?TGV5NmRIMW5ldUtnajNJZytvRG9TSFlIUlRrWC96MHh6eWZvcElHYVlrbDhu?=
 =?utf-8?B?TE9Fclh5NklRWmVOaDJpUGozVWZmUTlaZ042c0tYcW5wdDYweVFkMi83cER5?=
 =?utf-8?B?RG51Tms1bHdZVHFUbFlBc2V2TUhid0E3ZXZLQ0RFVEg2V3M1TTUzZnRER1FG?=
 =?utf-8?B?YlBEM1NTbEFtOVFiYmZDQ1NnTUYyOUlnVWY5VzZEM2V5cDI1NkZHR3FKc1E2?=
 =?utf-8?B?ZFZYSVFIZVZoS05yajYzV003dFpLdk5ORFZzcnZQUWlpMU9ZanZJajJldXl1?=
 =?utf-8?B?emprcy9IYW1FMzN3eEZFNnB6SlpabjdaUHBlZzJmQ1RzZUx3SmYwRU5wWXIz?=
 =?utf-8?B?eUl2QWxkUGIxSThZTXh2RndKS0dGSlFWeGxsYmFrdG9OUnZya1JLNm14Wjgy?=
 =?utf-8?B?cEN4K3NRd2Q1OEJRS2p5VVMxRGpzOUZNVjVWTTVzYnpDc09Iam9KUWNPNmpL?=
 =?utf-8?B?QldLK0ZzajZhSStDaWR6NkdhR1B1MEhlNHRnb3FHNDIzdEExZHZBbzY4ZlBR?=
 =?utf-8?B?cWdqT1p1eGJTU2VjY2Y3RVhKVDlrNlhSYWpobCtpaEZRYlZKVXVRSU1RenZ0?=
 =?utf-8?B?ejI3R2hXcUZmSVNiOEJCMGRFeURYR1VqSFFpdVhLL0Qyd3dPSjcrd0s2OG9w?=
 =?utf-8?B?WDNwaXo1WWRGOFFqK3RKUFk3YzBmVWxCVURGWlBiTHpmZnNqdUt0YlRsalYw?=
 =?utf-8?B?VzhWUDRiYmp1QkVUSGZpYXp5QWEyQnMvK1J4RkpEeHdZNjlKYkNUd05wY2ZF?=
 =?utf-8?B?c013djlxK0RkUVp1dWFUYmh5NUQzbTc0d3VuSlFrWmI5QVY5eW1zQ0dKR1pO?=
 =?utf-8?B?SkZ3YUxWQ3piUGtUaytvVzBGdm1xZHNSUW4wTzVrNVJJYzU0UWJUQ3hqTEp5?=
 =?utf-8?B?ZHhoVEpPWmJueWpnMEVCMGZCUUhFWFk5dmJEWEp6Wm85UzdXVXhab29aUGQ4?=
 =?utf-8?B?OTJKVnUrNks1cFZVOTMxUDhMazdpTmxDemZKT2RHQjdiRmJ3MjV1eGtGckUy?=
 =?utf-8?B?WDB5YUVkQUxHeUNmK2lxRGY2cDdwTE5TTVM1SVRRTVhjZSs1L1VycU5hNEdB?=
 =?utf-8?B?b2tZK3hmMWhVQmpmNEczbitZL0dqT1gwMVNjSTJDQ29neXovV08zZ2lHSFNi?=
 =?utf-8?B?Z05IaUMvMFh2UWJFeUUyN1VVVnBGdEZPWUh2UkR4V3g2RjBja0tqbXNqNXlE?=
 =?utf-8?B?ZUttLy9ESmt2QkVicXBhNDJNR0FJMjRBNlBhMkdZUUhQZjRRUzhDRllsSXg0?=
 =?utf-8?B?U29hamdpS2YzeDlqUWFjMU1UdHhYY1lnMnpkY2I4ZDdnVlRFQjFUTlJTNGJN?=
 =?utf-8?B?UHBYeHlwYUpHNWtGenlmUzRyeVhTOHBkbGt2NlBLQlEzTy9MUitSMnh5SUcx?=
 =?utf-8?B?WUpsY3Q2K01ML1dTb3dqeEdOaWpUek9KVjQ2Qzd6TXNDbXQ3ZzJuMnlOL2Zq?=
 =?utf-8?B?WW1wUVgwZ1JLeXkzUU8rTFMwZ1JzSnY3Um95RGhzOUJHOHV2a1ZROFAwZktY?=
 =?utf-8?B?Z29zQ3JpZHpmbytrWUMwRjh1bVhWTDNUMVNPeVAvNm4rb1NFU3VQdGpqSWVN?=
 =?utf-8?Q?4d4BWG4aCIxOlFTADsAbu8mOT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c88ecb3-b384-4000-9b53-08dbf4c2420e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 12:12:17.3678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vO02dzW0fN1mFLIWJs+8zfBcilkcYbZbSIT5dhvIP8VGQTr7nrGb0lL7WbrVcis/FSpwGNdp+l2Ux7MEq98HcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8172

On 04.12.2023 12:52, Nicola Vetrini wrote:
> On 2023-11-30 15:56, Jan Beulich wrote:
>> On 30.11.2023 08:55, Jan Beulich wrote:
>>> The rule demands that all array elements be initialized (or dedicated
>>> initializers be used). Introduce a small set of macros to allow doing 
>>> so
>>> without unduly affecting use sites (in particular in terms of how many
>>> elements .matches[] actually has; right now there's no use of
>>> DMI_MATCH4(), so we could even consider reducing the array size to 3).
>>>
>>> Note that DMI_MATCH() needs adjustment because of the comma included 
>>> in
>>> its expansion, which - due to being unparenthesized - would otherwise
>>> cause macro arguments in the "further replacement" step to be wrong.
>>
>> Sadly this doesn't work with older gcc (4.8.5 is what I had an issue 
>> with,
>> complaining "initializer element is not constant").
> 
> I tried plugging the relevant code into godbolt.org to try gcc-4.8.5, 
> but I'm not able to reproduce the error (see 
> https://godbolt.org/z/cP88YeWhh). Can you please provide some more 
> details on where the issue is?

It apparently doesn't like the compound literal as initializer. I need
to re-submit the adjusted patch, though.

Jan

