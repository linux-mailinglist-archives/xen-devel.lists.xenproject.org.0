Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C49B78F925
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 09:33:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594448.927775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbydZ-00035K-3U; Fri, 01 Sep 2023 07:32:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594448.927775; Fri, 01 Sep 2023 07:32:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbydZ-000321-09; Fri, 01 Sep 2023 07:32:13 +0000
Received: by outflank-mailman (input) for mailman id 594448;
 Fri, 01 Sep 2023 07:32:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cwX6=ER=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qbydX-00031t-6b
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 07:32:11 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20623.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a73cce46-4899-11ee-9b0d-b553b5be7939;
 Fri, 01 Sep 2023 09:32:07 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8358.eurprd04.prod.outlook.com (2603:10a6:20b:3fa::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.22; Fri, 1 Sep
 2023 07:32:05 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.021; Fri, 1 Sep 2023
 07:32:04 +0000
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
X-Inumbo-ID: a73cce46-4899-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n0xaBiOm7RyQjJvwfL1kr8XopbplxmNGNhMKY6wsG5uqsqLJ1Z04+wgTZi32kN7R+JtTp/E/MS8l+YekSXti8LIl0s2e60SPzHCXObEmEaJQ5XNjGtYHCk3CNs5NTv/FWIiSO2HzyIVceLX+Seu2dR7ClsHYptX3Cpgi1uArMNw8a0G2WZNSfe+TK4ayp68ij2n2zvH/LJgg//llo13/yK+37g/LbUO2ofAq5dtPEpMPsSPEhktjWp1JzmErDI8w2KtTdiYKnublo2AjkTlTHEQI8J/ZmfFUyxc86ZMDS28UYSqx+52ECDVxGAK1EEZUdZIJCyXFD5Gk3ButdBCePA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ofsdvkR+CjFUdbZ9dCpr92+9gdnll11ftLZciaoTfY8=;
 b=BDerNULslbYx8ZZjBtJd+Xrr2raAdQpuByaze/1Q+CqyXxN4Tximn6sP4fCRC6B8bJXZC+fCODT6eOESoHV+DTcnq+EHYJH0HHwDXMRqJGw9AsT1W+00TOf1gXbZU1a4KgTe2Nywx/0PGp5SHhJX2qNSsOy+0Dj80vrFplIYEM6Dbb4Hl8Nzp92cheEqpud0pe/QVDiBIMqMPI1scPhQD9W85HLcqI8LmxOFhZ+Dt21Az1d73bQjz3p/b1+3LypwAW4GFXyAJFPJUfeLK6wFPF6fnq3CZEr5mFDOwD+MkVlw+4dncGQzgZPD7rd9Y+WTBRip9olqFYZ9Yh5/DvkoYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ofsdvkR+CjFUdbZ9dCpr92+9gdnll11ftLZciaoTfY8=;
 b=fS5R87jj361Exhmc/kOtQs6iwiix2ZzYF6BQMaM0cJpZufwsHt0nmcBB1uIQbZdyFRnNa/ZT8F0KaSvBii01RFdN8BaRoqTylQkOy2LUEVoZcfv3f1WZWjqd+NgnHhppYBy++a41cFqFlG7nNht82fH0YbmiXeCxAdMMj6/WHHaPDw3jiqabtj1QUgeKFuevmktQteSP+MXDSo/prZ2jkaHmUQQd71ln2Af+76gFUZgNzLZoY57YSEpHCI+YGTkGBsgWj+r2RkfkjCLV9B26JjKSDpXnkA4WJ2jw4VftxS0kgdG/Nxr3j9Z4Rhve/paV8uFc0tu8OLg8ntOWUF5G/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <20e292ad-fe8f-b23f-1eea-019afe887b40@suse.com>
Date: Fri, 1 Sep 2023 09:32:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 2/8] xen/ppc: Add public/arch-ppc.h
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1692816595.git.sanastasio@raptorengineering.com>
 <85bc5f57ad41a54f84ac9fa118ff0d9e02b71461.1692816595.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <85bc5f57ad41a54f84ac9fa118ff0d9e02b71461.1692816595.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8358:EE_
X-MS-Office365-Filtering-Correlation-Id: cb05906a-6405-4659-c14d-08dbaabd8a0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	r9VXhZ6yY3+UR1lTpSy6IZelXSY9i8h9Hy0NqNxu7R1HmPdqoLlgJbdF1xxMKC2fetyHI2f3U3JMYZbz/vSSZV+QDx48+7fGZJJKlcpQB1guBtj7bbatd1LXpHMMXZ3lf0Qf2YNIlETaH+wVTCnFAQmfq8lgCSxD2eJ45lGFXuWlT6BrfREPHWagLplvAaR1HKnOMMM8GkcQFKzRq2dWPx7rxrJShLdcFjOSWYS5CTnHds4GdAVxMdyol4A1GSOTJ7rw6UNha9O4wD+UvLboMh9QeUq9zUHKNxk48RVRL1RMbCCcN388FZtUFXiww3Knl175qcuMzmU/AZNdJv1d+B4aPPBOjK2HvdZaAlkm3ZsKyycrUFeMyC9br/2rCok8yK8+IIANnNUgnDzlscvA62Zajwe0JZA+7YaZD25WV5AiU7AUBLznZ6z5ubh4LZtecAdDTUXKaznyxWz2+Gw+WZxc1pQ3ks7m6KUxDmRNxD3FWgjBsn3aWsYKi5LkB+sNhKM0qRhNsiOyARQFuzKNgpj6BBbCpEZxV8Wq4/Es3+TLshOf4j39YmzCo7EAD6dOfuVorbsm/qaXzQxb6IPwbS81bZ7OITDZDjVhrWg6THOCuyG69PAGk0hpTRsVFXEf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(376002)(396003)(39860400002)(186009)(1800799009)(451199024)(41300700001)(8676002)(8936002)(4326008)(966005)(478600001)(66476007)(6666004)(66556008)(26005)(2616005)(54906003)(6916009)(53546011)(6486002)(6506007)(6512007)(316002)(4744005)(2906002)(66946007)(38100700002)(5660300002)(86362001)(31696002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L1EvcHRJaFgwYXd2NHhJRDhnaDFQTGxVTkpIZnYrYzdUZTFpMDBCMnhEQkk5?=
 =?utf-8?B?TWR6NE5UL04xTEo5ak14OVFmdytQTmp2YUs3Z1VNeDVVTk95WC9zNHZZZGRz?=
 =?utf-8?B?SUY0UlU1bnRybkcwaU5pUWJ0VElJSkQyRnJKSkczdzZmbWtHVUl1bVZPZVJx?=
 =?utf-8?B?emc0VzhRMkJzdWIzZ1NLaWRWdWY3R3BmSzd5ZE1RcTJ3WG9BVktVNHlwb3hN?=
 =?utf-8?B?cXVmdmI1YnRqK21CeDZVZ25vWXFMeEJvY2N5b0xKakh5MGRRSnJsUldLczlR?=
 =?utf-8?B?VEh3YlJLalVGeGp2VTUzNGJzUFJkQ2R3OXZvblZQdDZwSCtBYm9KQ1ZFTVo5?=
 =?utf-8?B?RnVlcjRpYTdxSUZLVmRzRzZsL2E5VHcySXhLTUdWYWhMcUtsVEM0ZkNMTG9h?=
 =?utf-8?B?dVVleVk4NnQxS25LZ0Jkc3BXQU9vSURSbklzUGpUNU1lSWN0VE4wdmFWT1R1?=
 =?utf-8?B?Z3ZGWXhDV0E1THhLRExMb29nSnNNWnk4eFBEdUF4SnhBZFlWdWd5NmRBai9N?=
 =?utf-8?B?NkFzSHo0QWYrY3hoQnFZNzBtZkVtOUF1RzQyT0xXTzNNYjg1RWMvOG5jeUpN?=
 =?utf-8?B?bHdkcEFqWElFS1FRR2t2cW1MZEo4SjdKQzM1YWQ0cGVyZldlVjQrR2R1eHRE?=
 =?utf-8?B?NVd0WWY0ejZXY1diTUtsK1c2N0ZaTkw5SW5RMTZuZk1GcWUzT1R1K0V3RVFr?=
 =?utf-8?B?MlRFbEtpbmRpYlM1VElsZkw0RCswMWNEbGF4MURZKzd5SHFCVTNmK1ZEbytK?=
 =?utf-8?B?UFlxQXpLRHNpWjNPVUp6Z2J2ZGNJSzJ0aXViNUFydHREaVA4WHRmeitmdnRj?=
 =?utf-8?B?bUNpa253a05ZWnRVQkplaUZXTmNaeG90R25nVEx3RU5hSFdGemc2OVVzcm1S?=
 =?utf-8?B?dXNLa0dQMDA3RkhOSUN1Y2RDR0lqaHA0bnRuTkdheDVaczF6TEhzb0FUMUkz?=
 =?utf-8?B?MWEwOVpyaHkybDQvZnY2T1RXcGk3S1BtZGdhcXhneVNBUUNEbnVoQ2ZsYWxM?=
 =?utf-8?B?NFpuZkJmcitFZk01cHNrWW1xU0ZhS0o1blZ1MWtDWE9iRDNxWG83MVV3QU52?=
 =?utf-8?B?Q1lyS01LR2xJSzZLT1RsUWdHZ2dqZlk4SHVCVWx5ZWh6NlI2Ryt5c1VHNkhu?=
 =?utf-8?B?bnV6TlJmNDZvR2FncGtpMTJUL2V2KzFJdnY2dGFnMUFIak1VSVppTjVyQjZ0?=
 =?utf-8?B?dC9tM05VUjVuQmVwQU1ZbUxGNVNRRlBBYzBPdGxwNW8zMUprR2wrQ1ZxMWN4?=
 =?utf-8?B?Q0VUMVEyUXJrRktGcGQ4TXRXdGxyZlpXU2YyL1dzTG0ySGoyVWRHYzV5Zy9R?=
 =?utf-8?B?RWlCb0hkTzdrOURWUkhTNms2allrNnBleXpTdGJhTDNYS09VUUtERE5sMkVW?=
 =?utf-8?B?eGY4YlRBNDFPWlRPRks4bzJtT3pPSUx3TVJGUDRIS1NiSVFheHZSMXhiSEEv?=
 =?utf-8?B?WFFHMGVEZ1JrTzdGZHhvdHRpVm9aK0RXSVBZWDZDV1pOYVhqM25WOEkrUmtp?=
 =?utf-8?B?Y2FkRXFIVkpJZHJLRlNDdnlkSU1ZWlYyUmpTdC9PZVdrUmdIVkJwMVF1UTBJ?=
 =?utf-8?B?ajJ6QzVFemRzMW1KaTh1SCtTcHZma2R4UmNLODJxdW5haFZvZnltTGVseEdn?=
 =?utf-8?B?TDk0OVdxUzRzQUFKN01ha3VxTTlWdmVHSU9KWXc1Qml2dlNRa0phZUxHbTYw?=
 =?utf-8?B?Yk1KVXBKNUcrOUl0WUY2RHBHcVZ0anJXMG02enJkbmx2TjEyT3dSd0twTFZX?=
 =?utf-8?B?M20vV2djUDE5eUFjRllrYzdydjdFSHh1cWZTWXFqWlg4elFCKzNzRUJLWU0v?=
 =?utf-8?B?V0RqTDRyeWZPZjI3TG5JRXVNbHV1Z3Fwdk5pS3IwcmlRSzZhSGVQb0ViU2dp?=
 =?utf-8?B?R3drS0hqMXk4ejFRQmdPYmozbEI2dkVPVXRES3JQZUx5MjdGVjlPdk5NbWtP?=
 =?utf-8?B?eWQySWpBR0Y3bVllMjhHdXdTNFpmZGRVNHBDYVl6bXNWRS9Eb2VEREFybWRj?=
 =?utf-8?B?NEZXRnQrakIrT1Zza01nN2Z1OWl1S0dPbTBZOC9KL2pNSTNSR2VTZzNJR2Rv?=
 =?utf-8?B?OUpQQ1NmdHFRaUxUZXNpRFhpRE00d3pSeHorbWNCREN4bnc2YjZkaHlFaXFR?=
 =?utf-8?Q?8Fzt6wT4bG7XCAtZOJkEW4FVY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb05906a-6405-4659-c14d-08dbaabd8a0a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 07:32:04.6696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8LxdyODJsdME3YancCVMIKCBN/EaMOUo1vs+lmHyQfGw7I8Gy0oDV/1uU4OGORBurUxtSAjK9YboxH/ts3ZVMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8358

On 23.08.2023 22:07, Shawn Anastasio wrote:
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>

There's one more edit I did while committing:

> --- /dev/null
> +++ b/xen/include/public/arch-ppc.h
> @@ -0,0 +1,110 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (C) IBM Corp. 2005, 2006
> + * Copyright (C) Raptor Engineering, LLC 2023
> + *
> + * Authors: Hollis Blanchard <hollisb@us.ibm.com>
> + *          Timothy Pearson <tpearson@raptorengineering.com>
> + *          Shawn Anastasio <sanastasio@raptorengineering.com>
> + */
> +
> +#ifndef __XEN_PUBLIC_ARCH_PPC_H__
> +#define __XEN_PUBLIC_ARCH_PPC_H__
> +
> +#define  int64_aligned_t  int64_t __attribute__((__aligned__(8)))
> +#define uint64_aligned_t uint64_t __attribute__((__aligned__(8)))

These, using a GNU extension, cannot be exposed unconditionally. I've
submitted a corresponding patch for Arm [1], where I expect you took
this from.

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2023-09/msg00037.html


