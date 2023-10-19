Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BCC7CF43D
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 11:45:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619061.963611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtPaR-00067H-0m; Thu, 19 Oct 2023 09:45:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619061.963611; Thu, 19 Oct 2023 09:45:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtPaQ-00064T-TW; Thu, 19 Oct 2023 09:45:02 +0000
Received: by outflank-mailman (input) for mailman id 619061;
 Thu, 19 Oct 2023 09:45:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g4nO=GB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtPaO-00062l-Um
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 09:45:00 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062e.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 298d1229-6e64-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 11:44:57 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PR3PR04MB7242.eurprd04.prod.outlook.com (2603:10a6:102:91::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.8; Thu, 19 Oct
 2023 09:44:54 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 09:44:54 +0000
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
X-Inumbo-ID: 298d1229-6e64-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gxw8M3jp0hKvc0Kwyby2re+S6p7oxrn6jRp5ZD1IhbGI4rIqc3RCzSkkmgc+i58H4S4IoZ9QmUxNjlJd0cZApe4UZLNJrl/bIX2ugnjd7UI1ejTW488ny/IrJHXWd9u0v34aABN1aKK+E/qhk+UQgOo7fmX/vyZWVTDF7zlOjBnRL0ubh7CT3yNh6G8YekvdxImRc/9cMCs1xntgWk9Y0lv6Q6HurusK5/smP51+V+3ieASnSQZY6f5uhCm91vb8I/BojW4zYzstLph7QBnqYmdI4FGGgnFUeNt9qtDvMYlxcXHmlB6Jc3fXVK1WN65Vw9E3Yp9zxPL6PvAOXOVU0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O2vX67xNJd2B+amNzju0ZJQQhZq0mv/01Z4w3PMsoK4=;
 b=dOBVDdkw/QMdtF6Us/r5OpLAmCHT6Yu43kYYOvWLIGAkI6WPxoqUpgPAs9nTkWJ88kSJ8KNa7RVgAEeovtd/GfHg83lDaqXcxVWFIeOd620/POaF3nfptZXn+t8pjJu4R6PRBW/D/lluuTbS7yK955xeDjKHV3QS1qk7m1HEXbM16jBSG4I5psFkr8xw0qRl9KAlSfX6RVtyAMpk2x8jStgaboSt5jdPekAPg6PVNQ7c7Wh3DGh6g/NVX5cLHLCqIJUlWwWXWpBOEh1LBIVQK2dWzN7e1kuvj7wba9SS/uMLZJ1VNn1wD/MXjZQlJN0luJrLHBZMCcQQtsJRHmbxCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O2vX67xNJd2B+amNzju0ZJQQhZq0mv/01Z4w3PMsoK4=;
 b=h0S57lD5fOaz3FlNk9sHrlmsQA7DXx8WqPMgBM3YdWXSGHqM2nSXz/TRPUbhTg/ivUYtH6IZgfbxyDebI7V0PT8sZWMZYZzQEvckkow44d0ud9veaKo4msrIcXRMhiNKtQ36IQxwkkipYytmM8R3C230Ks+md7eGP1DK7bIvDa8AF2a+9sdJYfX/EtiQLqs6QX66dyEGkxUIaJYlEcdvFzINqwuUvWM8ikswFA0CzKFSfk7446oOezlg/onkfBorMWEHHt3Trv5FczoUzoxagojvIA+NbvhTpy/duKBiaElouIf7pfU5e7yHoCU5v5PqGDC8M5gHVyEFKz00ijZPjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <65cdbeaa-6766-e5b7-65fb-191da6f59d81@suse.com>
Date: Thu, 19 Oct 2023 11:44:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 10/29] xen/asm-generic: introduce stub header iommu.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
 <8990c5c77c12333bfa7aba42b66bf7fffee5a096.1694702259.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8990c5c77c12333bfa7aba42b66bf7fffee5a096.1694702259.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0155.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PR3PR04MB7242:EE_
X-MS-Office365-Filtering-Correlation-Id: 64bcf0e7-d182-4094-3a63-08dbd0880c6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KUjr6yGXIo7Ygw/0xpurhQcmlw05hDPq1nlFv3Cr2ls8CQv4YlwStF1bUDp3MOmRHT2t2w+NfvwOri4YtYDOcZQOkXLEj/zA2zEmQleTpiM2NmSpkqFU2NAoFaSzxzZKLHicnCm4OKTu4eaD5GmIhYwg6MPP4MN6wrxyxTmE1uuQmhgcIKLLdNx2XUazpC72ccCOzgH1PMz0WiiRT81nK6NcHqHANwGU/Vv6Ik8GGPw1pWHfjFYiIw8S6g5/aKbB5ZRbzXzy2F+FEBLrOIF2wtDhM8uML2Ns4e0a30QXaQBYwJckabTQg/MklmOSTHP5SNQm4O3vxHkHfPCksxC+DNsRA4srRAiUqJWhoK/NWx3BL+bbSJZihCFhqePtQB5sYfDvM+yP1wmgo0s5ItyKiMUbSVPehum0yrNM/ZQ9HHLSDnCehHcjb7CLeBmIqi576LVuRCQcY+cZLFfnzHqw4Rx2r3vZJJNrYTY6e93QB+cwZw45mPt5izOhRm9pRSCtDeRHp8njMMpspXxjZLaj0BUnwNJpOcqf/HsPC9Ek5qLW8LEIN0iIRrgaCgvAPVdiDOY7GAM3xoaAmAJZ/pLvZmNHA9ovv+fb/mGpa1b8dIRLqiqzvvRka0DXm3LZNqun6XZneKLKzIpMpkPxr2SPUXorMjPEH20FZ84M2dQF1MA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(396003)(39860400002)(376002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(2616005)(6512007)(6506007)(26005)(53546011)(41300700001)(4326008)(5660300002)(8676002)(4744005)(6486002)(8936002)(2906002)(478600001)(54906003)(6916009)(66946007)(66556008)(66476007)(316002)(31696002)(86362001)(38100700002)(36756003)(31686004)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cE9odjBEcGVrekhXQjlQbytZRWFZbFVYWkNZSFJyZGxCYmxoR1VBcERyYUI4?=
 =?utf-8?B?S3RYdHM3TGdCbDlIU0llSWttOFpWeHZjVGtIZTg5SWpPaDMxVkJLMHN6dXQ1?=
 =?utf-8?B?bDBPMU1RaGZnb3R2ZkZ4RzE0RG1SSTc5eUNVeWxVREJhWG04ZVRndTcxSVpz?=
 =?utf-8?B?VTh2bGlpU3BHelgxWTNLRHJWV3JCeUpGWitlQkpUclRkMS82em1jMHZjWU0x?=
 =?utf-8?B?YnpZZkl3V1Ztem9TeXJoZmRycFNhLzZHSlVwc2lmd1UyS0x6V05NTUxDUUdo?=
 =?utf-8?B?V2ZBVDZPalJFK0UydU5leVF3bmZLZitiVmp3Q1NZa2NZSDhSZm5LcDRNdC9Y?=
 =?utf-8?B?WWUyMFAyYWltWGF5Y29EZ0w5d1d3NXNPQzlsYnBib2VIK2tRN1VUSm5nU0Zv?=
 =?utf-8?B?alBsc1JpemNyajVSemwvY0phK1k0cFh6eEx6K29uQ3RYVE11eXdRbEgzUmE5?=
 =?utf-8?B?dVFRclFKQzAxZ0x6MU1qQnZGMjRPSTdsMFdpSmpCWmZnTm9mQVVZZWNicExr?=
 =?utf-8?B?dEhZbWMzZE5IZ2l2Nm9oY2Z2Z1hOSkg2UXBPbFB4M3hXMXR3aVJTS25mZEMv?=
 =?utf-8?B?bk9LMzkzYUd1bFphM01rS0p1ME02ZGhCTE5KN3Ntd0MweUhRczdCQjlId0No?=
 =?utf-8?B?Mk9VTENSNHptOHBWSHZXSUtNREdzQUpvaXBkQm54T3FRWVZ3QzM3djA4Q0Mr?=
 =?utf-8?B?Z0FNU2o2dUFsaWVPRllKMmlNejlnZ1hiWTU4ckpMV0piWXQxYzV0WlJZWFVO?=
 =?utf-8?B?WiszNGhUVFhlQjdRZW9HVWsyRXF1eWgwTlppVGltRGE5bzFUZVk2YXFINGd2?=
 =?utf-8?B?WEsrTEVvRUlFb0hObFJIWk5ZL1Q3YVRYY0JLQlhDVkN2ZFlFZVd3THFBd3px?=
 =?utf-8?B?SFl4a01PS1NXN3Z3VDk0OThzekVDSC9hUXdKd2E5cE53YnNVR1lFZTJSVElJ?=
 =?utf-8?B?eDlGQkpqekxWZ1JNMHJVVkZTcmNGalY5ZWtvNUkvYmNrT0N4SEtxODNjcmpX?=
 =?utf-8?B?UlNEUHdvbncvTG14bGZ1YXI1V1dOQ1hOZWQ0QTVzNzE0anF6dDhNa29HZWpw?=
 =?utf-8?B?WGJvdkN2Rmt0S2tpamthUlJNc2tqZjhHREFQekxOdkhia1BsenZYZW43bjAw?=
 =?utf-8?B?cHViZWJsQzdJYXRaR1VKMlRERmk3SHlBNkp4eVFxVXhLMmNyQmNYVkIyNnl2?=
 =?utf-8?B?QThlSHdGZXpGMUptbzFNdTRqQVBuQzAvK1VzMVJiSHM0eTh0Smc1L3FUYW5F?=
 =?utf-8?B?VWdKUlU3Ym8yb1NxNEtvQmpJalhJTEJrZ1d6emVMd0xFRUpiREExSjhoc1Ny?=
 =?utf-8?B?VUM0WTZ4Wmp2L2dDUjk1R3huRlBzaUxTdHpSakVJRTVlWi9obXFHZldLUm1T?=
 =?utf-8?B?T3l2R2UvMWgwdkI3UlMzT2pDTEdJLyt3eEdYYU5BSFdvZ050VkRwNEhFQU9U?=
 =?utf-8?B?RER5K1FwcXhjU2psbEluOHY4dnB3bEF6ams4YUtnaXcxQmpxZCtQVVZreUUx?=
 =?utf-8?B?anZmY3NidmlzanhObFR1YzY3OVhmSTNtUmpWVHhER3JXcjYrZHRpTFJtbTFs?=
 =?utf-8?B?SHJWcitxMHpRQ2FPM1RrdU1hd2ZhcGVIYVNrUmk5ajZoU0VSdXJtc1d4dlBS?=
 =?utf-8?B?ZDd4QUViL0VWUXRwcFcyUFYzRmF6RjgxT2VpNjMzQUNhWjc2ZjVxV2hNZGtD?=
 =?utf-8?B?ZXpBR2hzNm9QQzd3TU83Mnl0cHpzakdtYWczSUxpc2RSRGJyYzEyenVCS2Vi?=
 =?utf-8?B?Uk5TR0VyeVkwUW1Zc2s2b1J0aDZQUjV1T1RrUWpSdVMvN25kMGdSaDlIWXJa?=
 =?utf-8?B?cTBzdkZqd3prcnRoM284YTlDVnNXUmdIQ2tzZmRDWE9GcVdSVkI4T2t4alVm?=
 =?utf-8?B?SFhzVnZycUdTK0szdlN0ckhFYjFhTTlEaEgxU0tESTB2K2ljT1hSMDQxWXVk?=
 =?utf-8?B?OTdjdDBueHQyZXZvM3k0bnlJZ3I3alBpMHRxMUJ4K2RhVjBKTmFBSm5haktn?=
 =?utf-8?B?Ky9rNmlGWGZMNnhCU1YwemtJN0ZEWHJodGlwRUhYSXFHSU1kOUE4T0FxUStV?=
 =?utf-8?B?OWlMSHhLYzMxWkFkQWh2dkRuT1pwZk1FeHlHK1hpOTUzc0dXYmZqNmkxYWVj?=
 =?utf-8?Q?9kuq8t1tZHVifCvlmMSCpQ8ZN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64bcf0e7-d182-4094-3a63-08dbd0880c6f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 09:44:54.7607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jDrlqV8ZCoVPB/q07QVyuZTwZD4vKcVz7O26WVv6hcxMLugjfKDtyPhiq09CPQn/UCXG/qdahm6r8Zyo/XfStA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7242

On 14.09.2023 16:56, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/include/asm-generic/iommu.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ASM_GENERIC_IOMMU_H__
> +#define __ASM_GENERIC_IOMMU_H__
> +
> +struct arch_iommu {
> +};
> +
> +#endif /* __ASM_IOMMU_H__ */
This one's perhaps slightly more "interesting": Yes, we have a
HAS_PASSTHROUGH Kconfig option, which both Arm and x86 select. But it
is in principle possible to support guests without any kind of IOMMU
(permitting solely emulated and PV devices). In which case what's
(imo) needed here in addition is

#ifdef CONFIG_HAS_PASSTHROUGH
# error
#endif

Jan

