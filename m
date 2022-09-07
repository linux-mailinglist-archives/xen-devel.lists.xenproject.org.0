Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A43C5B0399
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 14:06:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401439.643281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVtp6-0006ov-2s; Wed, 07 Sep 2022 12:06:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401439.643281; Wed, 07 Sep 2022 12:06:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVtp5-0006mm-W0; Wed, 07 Sep 2022 12:06:27 +0000
Received: by outflank-mailman (input) for mailman id 401439;
 Wed, 07 Sep 2022 12:06:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2ywg=ZK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oVtp4-0006md-Ng
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 12:06:26 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2066.outbound.protection.outlook.com [40.107.20.66])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f003472-2ea5-11ed-a016-b9edf5238543;
 Wed, 07 Sep 2022 14:06:25 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB6728.eurprd04.prod.outlook.com (2603:10a6:20b:f7::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Wed, 7 Sep
 2022 12:06:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.014; Wed, 7 Sep 2022
 12:06:23 +0000
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
X-Inumbo-ID: 7f003472-2ea5-11ed-a016-b9edf5238543
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jz5dgdf855gE6vymuqMeMpA/zE/ZWCR4ib44NK+ukyOPHW2ZATsJADqYh3AO+Q6zSCoCVWaqGezPRPY9tvn5Jo+kqN0T6sD0GgjPJGdzlrC/juAOm9m3YuMcBlN8j822ljtKcuWb5zgu6L6bsOIDnjD3g0H3/1wjraqie7t7pJglkFEKzzvBiHeWL/wXSpoIGJPnaD+FNmOvF0mx6gQYdsiRPmlLWlQeiYJmNSZXgWnwCqNjSFdsCz7JjhwcXWY4SLRhMwjF4dmDfuezD2xhm6A/RGvAC8ynJJHF2lnuzHDOyPp51Zm0wa2VvstOlKq1P9T1InKCvXTlnvXxF3ycXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CiFKFLhAOtg2fQoQXjIEOUXAKLH0r3SrJjrjsvl4+Fs=;
 b=CYAWzlABxqHXUdjvG3sWAtevStOVOO3G3sBnN+pjHCZyqKVQA2dWOoF5u92x5g0iEE9gxRsPVLuRcQRFRREPiLjiskppwKcJWB4pjtTpAIyCgmXURvgcdINeB3JM8BsXzMSsIaVbvk1L4XUcpb+e0F0cmY+jipAt4K2h2UKS7kikA4NVJJM2k/7BJLQawLrNXeIh6yeJjMW6wSnotv4fJnOzfTc2VRblYdRkeY47Ns2AVPY7+7BnKUt872i+axEbnXEMbQWnOQuRyWYlLdsa+pEFjT36tD55U/PsRCo8PzNRHAUuMQraIhUfr0tk/i/2YObzsU9PTKYErnTlzOSO5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CiFKFLhAOtg2fQoQXjIEOUXAKLH0r3SrJjrjsvl4+Fs=;
 b=DLMstnc5TFk51+yenFzpDURKTv+WODxNMIOXTE0SM1VLOfoIB37YYrHrM0bw5fsJQVYEN19B2q499ETeYajO3giQJ7aCvS3FIMapoS5C4M3fvTaW9nsjTirgTedqYS/+I19TidO53nnTXQ1dAx3oTLVigl1XfobcL2ETMl2RRLV/1aPOuhIzaPascaVFc/CDrXkgOzqQPI3eSIovhJqqjhrqmQNa6qflT70+Ver1k1VXHFbhaWOZOjl/qH1spZWkefmgceg0ccZUM/QlJ5NIqshd9TbHDZvNIrnjRMOA1F6+GRCr6Vb14Nbsn5L9+J9MWnr60hPyeHwAGcNPjqkKzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a7576b0c-2134-1778-7751-375cd4c02554@suse.com>
Date: Wed, 7 Sep 2022 14:06:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v4 2/2] xen/pci: replace call to is_memory_hole to
 pci_check_bar
Content-Language: en-US
To: Rahul Singh <rahul.singh@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1662548825.git.rahul.singh@arm.com>
 <d1db7461eb4ae3f9423814877c5ab6d946dae4e7.1662548825.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d1db7461eb4ae3f9423814877c5ab6d946dae4e7.1662548825.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM6PR04MB6728:EE_
X-MS-Office365-Filtering-Correlation-Id: 45d19f47-7e74-4e63-c76f-08da90c96216
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IztEum+9Uzl8xXGC/1M2knt1bWqgznYWyqXbRngGn/T0ShDOizpgz0RH+Gs/IP4Dqo1pCsP44Aiv8JmFJn+YfasPVH6kX63SAcKppOaAIE1I4fPHeWzbzNIvzoSEqEgwFhOLxHnLLKfcD0NGAcYtuFuYormmTEQnqM9tgvKizfWlBy+dI6yEKGOmw4ZAEZ6BnLxlE5J71SIt+2vFN3+pknlsEOeBVuvBJty+f/bSlF+WEh098xHX3Wf3SUHGalUwOL7O8w2cXL86QfkdEhTlVRK5+d9rKtZ/qz65ynQhitQyP5nfSlJlhWzQRpFHSa8FL9HIGEb7xZ67UduJ1Q4X083wcSHR7eBD6f8NubHHiIaMcjBa4BuimHiwvUvMG2pUdY9zcKZSVWE4dFIn5kCcBGrZqc9EbkInUTCsxof5cybHGDfwlOsLlyvKZDHzpsB/58wHQXSOR7z7WfgewpJsco5yp3vT0nMIdlhuNIVCp4jluqud0UEdZLq5/oR0dvzma1bI4kGyBl37yuWhaa+5zJNYKDQr2UWlng42FTuQefnN/EEGnnV948hONxy1Q9zjzWv1rKmS7bGxlIEPXgMVUy9u9zE/4h1WrfYF+PJkKGt1E/ccn/wINuCJX7v39WFIsnbg+1N5GTU0NG8kiAzL0+5xFpZO0MQpTonVv4+plje8lGs74IXviz6lj15CgOHbtG0Q4LWEXyNGHk2LqgWMveuFazWkJzz/z+HZ+oiDfATapd7tQIsnim8ENhgVqSQ5bnGcj3PbGlXGwxSLOsQBVkVBIvtodVcEfakToI1us+k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(376002)(346002)(39860400002)(136003)(5660300002)(2616005)(53546011)(8936002)(7416002)(186003)(2906002)(41300700001)(26005)(6506007)(31686004)(36756003)(31696002)(86362001)(6486002)(478600001)(6512007)(8676002)(66476007)(66946007)(4326008)(54906003)(66556008)(6916009)(316002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmFyYjF4NnI4L1FmeHR6dEcxL0RMZFpHcDZDR2hJenQzeGdYaVMyc3AyWDBL?=
 =?utf-8?B?UGtTc3ZnTUMvbHhuWkpVNmJGMnZieEhsbk1STHhuQ2p0cEo3SDBqT0ZTa2xC?=
 =?utf-8?B?aVN2UWswRFN4VGJwbEwzMy9MQnNXMDJ2YWdiK3VVZUZuYjFpbWZPOVh1eFJz?=
 =?utf-8?B?NjF5R1lCZkxXRTBqZ09kZlJXWVVHV2ZDT3cycHhOMW12bVU5NjZlcFQ1S1hh?=
 =?utf-8?B?d0c2b2h2aXVOWThRVnlFUWQ4VTlzVkdyZEN3L3VjRUFQS09jRUhvUzJKTGl5?=
 =?utf-8?B?T2NsZWJFUnl0dTJLV1NtbkRuSG5VVkZpV2xEWS8vc0xoakJnSkhncElYaGJC?=
 =?utf-8?B?Z1F4aXNrdEdJODRDNkRuRHc4dTRVeGUwZ2ZoaVpLT21sS2F4ejNObkkxS2F4?=
 =?utf-8?B?M0pLb2Q3VzNpc29RMndzUktBbldpZW9yVlZ4NVQwbTdQV3pvRTJ2dXhFZkFS?=
 =?utf-8?B?M2YwQitXWHdDNGZaZm1xSDlGcmhEU2srL2Rra0Z3c0JuT1IrUjU4THRwVjdq?=
 =?utf-8?B?WktsSGsrOXc5R3BrZ1pIM1VpQzJrTGh6RHRQNnVMc2lFR0E1Yld2Rkg2YXpN?=
 =?utf-8?B?ZUtyNXNOQ2dERjkvSGhkbnF3VTNJdFZZY0s3WjhkaDYxMGZpQUZ6WURmb0lD?=
 =?utf-8?B?cFFHdHJQaG5CS2pKZVBwME96TXdjTWlnaTgxNEJhNUFvOVpSZXcrdEEvZnNE?=
 =?utf-8?B?ZHVQVW8rbVZwbEkvOWpTTnpXSUdpamFKMmlUYjkyaU12VnNPZnlIUHkrWk5Z?=
 =?utf-8?B?MnRvR1ZHQ3JSMTlnWXg3VVFPNkhLT1dPQ2FUWFdYTko2NnJvd1dRMlV6d29T?=
 =?utf-8?B?MksvSEZ6a3B6U3lwR0ZJOFo5cUdtVkRxLzhiRHlRdjh0akJaNjRZRFF5bllN?=
 =?utf-8?B?M0hhSWpBTWhGaW5MZkdIdlBwZmVWY2tGcUl1K3BjVStLcjhmNjNXMklxaTFB?=
 =?utf-8?B?dVhvSDhaSVRkckNQN29YeTN6NFArdmNzdG16c0h1TFFVUVBoSCtMczN3azdP?=
 =?utf-8?B?RGpXVHN2MjA1b1hHNGNOWmR4QnlxMWd0UXVxNHBoNis1N29XTTFTMElZeVBu?=
 =?utf-8?B?ZG1jY2lJand0SithREhJbWh6bHdXRnQ4Uk5zV0p3c3E1cG8rTVVhTkVWZFF3?=
 =?utf-8?B?SWQ5bnR3Y2VHMTJRWE0yYjBDL21KelpLTDNuNUJORVVjNHdTcWJHR09PRFBQ?=
 =?utf-8?B?RWF1d3dPdGFIaE5BNEl2Wm5yUFFNUWlVQlR5dGFhM0xTZnJYb3Z3M0lVdXM1?=
 =?utf-8?B?NUU5Y1lEclIzdjBaL2Y4Umg2SExXTk00MFVIRDNEaHpsenJUU2h3dWQ0V2hH?=
 =?utf-8?B?QmpwSnY3azd0SnBibmF1UkREU2drMkhuT2RlN0NOUkFHNzlJNXAwYUoxRnNk?=
 =?utf-8?B?M3hia083bjZXT3lJOE5hYzRNMmt3TWFwYkVwQlFzK3Z3ZE0xNGlEenJQb1Vu?=
 =?utf-8?B?WkUzVGNGQ2Ewak5XNWNlYlRGMmpoMUhmM3g0a1E4Z2JnQTNvbFdCSEpRS3VX?=
 =?utf-8?B?cVBjekF0NGErK09BdUZvNzBGUkNPd2tZeHZvaERtOTd5QmZNKytkT0RxMmh3?=
 =?utf-8?B?ZEx4azRkVTRKL0JiTVZnWVQ5RUI5cHpISDFrVFY3VkZzNjlhYUt1WTRqZHUy?=
 =?utf-8?B?UU41c0JmQW13ZFg2VWd6bUhZR2orMmtUVFVnVW5oY2t5QXRFblM2VVEvaVcw?=
 =?utf-8?B?UHhJUExaUUZRRjU1TXZxYUpmVFhYaVBpcnhJQkhoSWlzOHFORlJnWmYwTSta?=
 =?utf-8?B?QThDU3pCblprOGlLNEh0NGVqS3YzYmkwaXlzVlE0eWF2amNUVU9mdHYvTHJ2?=
 =?utf-8?B?b1phWUZqNGQxM3k4UzdnTXpmYVJjS0hyTDFTZkNLVFc0WHMvbTJ1d0xxK21p?=
 =?utf-8?B?QTFCc2M4am1YY0FkMzRraXRrK0JWZXRDbkxhSzBuVlF4bFVDRUp1NVNEWHlG?=
 =?utf-8?B?WWhCcklUQnRPQXErTHlwOWdZdllYd1pydDVMaW9MVWhOeVdERld3T2lHOVZx?=
 =?utf-8?B?Z004NVU5elFhUlFTa29pZXVoWkxySm93eTh2MUxjYVkxOWlZNlFqQVBWRU1E?=
 =?utf-8?B?dWk4bFkybGFES0VpRzlPS3ZmMFlYejlNRFF3dU1LZEVrK0tvZ3lwMncxOEJ1?=
 =?utf-8?Q?whTs4cPeEdKdExYs5rY5QkoZ1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45d19f47-7e74-4e63-c76f-08da90c96216
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 12:06:23.6082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EBSvxdutXq1JoFRYDiFcIH3zAN5ngYOGgTbpjG1K9R6pN3+BYpKQteFxnbac5YRVXXLpv9jaNWcH4LDVpXkeqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6728

On 07.09.2022 13:09, Rahul Singh wrote:
> is_memory_hole was implemented for x86 and not for ARM when introduced.
> Replace is_memory_hole call to pci_check_bar as function should check
> if device BAR is in defined memory range. Also, add an implementation
> for ARM which is required for PCI passthrough.
> 
> On x86, pci_check_bar will call is_memory_hole which will check if BAR
> is not overlapping with any memory region defined in the memory map.
> 
> On ARM, pci_check_bar will go through the host bridge ranges and check
> if the BAR is in the range of defined ranges.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
> Changes in v4:
>  - check "s <= e" before callback
>  - Add TODO comment for revisiting the function pci_check_bar() when
>    ACPI PCI passthrough support is added.
>  - Not Added the Jan Acked-by as patch is modified.

Hmm, I don't see any change to the parts the ack covers (x86 and common),
so please re-instate. I'm not in the position to ack Arm changes; things
would be different for a Reviewed-by without scope restriction.

Jan

