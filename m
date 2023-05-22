Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DCA70BF19
	for <lists+xen-devel@lfdr.de>; Mon, 22 May 2023 15:04:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537937.837589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q15Cn-0003RV-Au; Mon, 22 May 2023 13:04:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537937.837589; Mon, 22 May 2023 13:04:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q15Cn-0003Ol-7s; Mon, 22 May 2023 13:04:05 +0000
Received: by outflank-mailman (input) for mailman id 537937;
 Mon, 22 May 2023 13:04:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oqCu=BL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q15Cl-0003Of-41
 for xen-devel@lists.xenproject.org; Mon, 22 May 2023 13:04:03 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061e.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1eb34b01-f8a1-11ed-8611-37d641c3527e;
 Mon, 22 May 2023 15:04:01 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7211.eurprd04.prod.outlook.com (2603:10a6:102:93::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 13:03:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.027; Mon, 22 May 2023
 13:03:57 +0000
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
X-Inumbo-ID: 1eb34b01-f8a1-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aG0QajieduBTCQmI9jjKLdjo/EWK1p7i0dFJCU6quc/6J9iJmfKyxwEo6FdhDYfH9bRFiU6OqagNegWavXLFD+6XCL8VtVS7zMGk8sbjYohClvXGWEeEA35QlakCd4kQTqTLqryZScFRfOc+Ode7aSAkV5paXTixsBKlAQ534B0paub4k5na6Wq2d4TloDFz7e8giSargayP2fcXDUm+4/t2Ro/wP3hxR9kRxY5JKUSBppenz3CfgeYcTDs4FY0fIv954E00yP0o5hEzjhjsRu3F4A8N3B6Dytdqn/NGxu8G9WDtNI/M1fnIe25sLOS8tWsdZPs/8V+07444jH1pTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mumcL+mQy8ocaFwSH9jtHJeg5S7BbONqsxIJix1dCOs=;
 b=hhvPDi+9bkudcVzbVK6CqleIvPzcXPL+p4VOJimLxefUMr2SDQV+wYLS+vUj7ITjXuxOHkElOmZzm9W0OzdBzHGcqbGgSJDV50Q8Km3Rd5Fr6Cr2NttDQxuWM1QEDzqanIC05NTlayQDTzZvK1r9ohTvj8C2Iv5/lpBpniHPtzm0SNte7hKJLcL80ViKZYfBhQklmaDRK2e90oHwubOwAIAz3mm/I0nXwLJx6xw28VnCIxtx74HK2eu7t4za9CS/V52HyVVymFyfvxHJ+lciBzXb7fi9II9Rc2PiNdl/QsX/BuiiPaZxL4pJ7G9OWVb277BHtn9/q1h1ej5vy420Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mumcL+mQy8ocaFwSH9jtHJeg5S7BbONqsxIJix1dCOs=;
 b=hWbqssHaAYYj94wP8+UGB4775bt2mlbldeKvLEnIACHamyH6FfjYsyo4dOX6Km4Lb2mbBzCMFpd5n9XG/rrZwBEFHyVeg1jqjwuslwQmFxEI3YlDqac4t1bOov6fS1JV2M0zYLIeZ+uoc58sgsmW3eHi/8DMFKuD4ZckEOU5KwLHiCMOPI9zukFjAZkWarTli5K5C1cNaZevcVioA0GCOpnKwPPKkrYZWSKE/2PFzwb20ttyy9NLeS4jxKZXxD+O2JAQgnqc0YZPI44emlmHmPKuzTRBB8VQS697nw4OnODqv6rz3Q4rr/R3GBleQ0fqUpvkfS0DXmEKsCtVvIgk0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <612dc0c0-7039-b63d-220b-8075fc8c35db@suse.com>
Date: Mon, 22 May 2023 15:03:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC] Xen crashes on ASSERT on suspend/resume, suggested fix
Content-Language: en-US
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
 xenia.ragiadakou@amd.com, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2305181638390.128889@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2305181638390.128889@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0165.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7211:EE_
X-MS-Office365-Filtering-Correlation-Id: ecaa8778-2072-4b4c-fbef-08db5ac500f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uckx9qjhMglr1BpNSQEbmHF0zfFQNn+y4mTddP8oyKZJkDxypbsruzS76n+IqlzZ+NlmVDqt2ZkB+ZeXX9h5CFzBZneF3gfdsZEhCAem2bQyFncm533nqQW6qZT25TVbeFe3B0IU51IZ6XIYQ9L1tFyD/Ox0QIzVJ85OiLbja5RSqvbiKUGbqKufBwjYiDnuDgDLzaF6ieF3iSqZF2AOWPcq0QYmj0I10rk3bqEcwmhTgkMHpJWsr/jYxqB63gLstsUaW/wl3yh3iUBDc7fsoojA+M9E+896AcOP+WtnWw0cdgxzriMobcv3yj28xkgGke0+yqyzdSSeghFBFCwwT9u2wGlcGFTKFOkm1aZRJSq5LYc5LHKh9rs78ElAf7h5ABCFqN6X8KBJn5taacAC4A03sX9NojvmO0l+hLdONY7KY6Ckk8U5IpTr5E0pWv8nL3jXFpDS6fzWKkrB1NtsjYRZe/IX8IF4H9Z31jAlExzfn7oFx9tqPbwH209uE4Fzb+iWSLDZyW1bUDQDJL7kkMbLkbzYyO74NCe2S/QkSdMS/g6dSm4uGqgz0y04bvP29lQx9Mrt+exMHll+dzdzs9uk75ysqLhvVQX8fgojXAt/PxieZjq+ggEHML8lrGrSYqWVIsd3U9/Wuhkju4sUZw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(376002)(396003)(136003)(39860400002)(451199021)(31686004)(2906002)(15650500001)(5660300002)(83380400001)(8676002)(8936002)(36756003)(66946007)(66556008)(66476007)(4326008)(6916009)(6486002)(316002)(478600001)(41300700001)(86362001)(26005)(31696002)(2616005)(186003)(6512007)(6506007)(53546011)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y29teVBpVFdtejF3cTR0Z0VSbkJCOUxLUVZDWjNKbXB6TDlBQ3FPdFNVdFRs?=
 =?utf-8?B?N1VIbWNLR3VBVEhEbFVEaW9GUEdZb1NmdFRHVlF2VUUrWG83MmhHVzdLOW5M?=
 =?utf-8?B?SFkxN0VKMnVuejBjN0pqNytTSVduaTl1bDRybjh5OEpDUERMcnBLbUswWTQy?=
 =?utf-8?B?RVArQ2l6aXpJK1M4dEQ0ejMvc3JJSHh3RVM3WFJTUmVkTlppbXBWSVIrQzNp?=
 =?utf-8?B?a2tpNXQ4d0ZZbHp3WmlOOTB4TXR3M2UzdVBiMjJZdXpXemdkbml4QzlLM0Nt?=
 =?utf-8?B?V01pQ2RYQ2lBT0tVU1hhV3lYRW1RV1IwWlpyczh5ek1rRnY2SjdwWVl2aXZl?=
 =?utf-8?B?Z280UUJpV0hKVTZLU2dMbWROeEpEbFBwVURUMWVqMGljTTJZbEZHQ3RjUkIr?=
 =?utf-8?B?WE5KdU15L3NFUUhWc0pSMU5PYXBzai9naEN2N2xFQVVJTE9TaHI2R3FWekdV?=
 =?utf-8?B?RHFUd2dZYzg5M2ppb0xMdEl0WHFSK2R0bTBFZlZRMDJzQTJhRXlCUXl2SFFS?=
 =?utf-8?B?YmZsRmFIbThmMmYyOGdnVm5XYmxxZC96OUh2N2tia0hQV093Z3F2UVgvWnBh?=
 =?utf-8?B?SlF4eVZxMHFtb2hNNTF0SjdxMWhjZXpFS2JCN0RPVEszeUlFeWFWRTFZZHVw?=
 =?utf-8?B?eDBRaHVYa0E5S1dtbUVKUjhWNFEwNDYxb29sMldxM21CVnZwNjFTNUFxbEMy?=
 =?utf-8?B?L2p6aU0vRkQ1OEpSbXc2V1A2VEY2OUI2V0ZWU1RuQjRWNkp1ZXhjUlhBQVVX?=
 =?utf-8?B?RUVYbmlwQWtnUnBqK1F5TzZZQlBWSW1UR3BFUnhuOXM3UjNBUmp6eURLWUQz?=
 =?utf-8?B?OWtRZDVPSUxkN1J6dDVzbDNOZXJCb2NtZU1hNzFxQkRqUDE1bkdEZm9Yanlu?=
 =?utf-8?B?aU1sd2J3UXZhcHhZbFI0VEYwUE93OGloZDFTdXZRcm1ScXQ5U1J1bHZ5SVpN?=
 =?utf-8?B?VktkUDhDK1hVbEZjR0cyUTRBaEIzbkl0S3I4Ymprdm1VZzgxeFBXdThaV0dq?=
 =?utf-8?B?ZXJ1ZksyKy9HRnBoNXpIY3I5TCs2UXZFdW1GRW9LU3F1blNrRUQ5NXFBRTlt?=
 =?utf-8?B?cHFVZW1ZZDcxb3MyN05kNG8rOXlzSDNJUE8rTjZjc0pZNElLY2RobDJuSHpr?=
 =?utf-8?B?Ynl1S3BDTkhUM0FJZU1FZmFZdDEyZm1vNDBrVWlFTFlaR3pjRnF1alBhcTZx?=
 =?utf-8?B?WWlkOGR2UGFZc2duaDlnK3dHdUk0UUJGa0tvaW9QQmJRWkR4VTJWYjNvODlI?=
 =?utf-8?B?NXpHNVlobVVBeDRjZ3hQMzBhMnIvakVNZVkxMEM2WTdQRFZTNlVYam1acjM0?=
 =?utf-8?B?bmhSMkRlRGhBbm9qdzY2VU1QNjRNUnpMc01rbmtxNG5qZmdMOWRHYUU4RmtH?=
 =?utf-8?B?Q3hZMzR6WU1zSVJTenlFVjJIQ2ZvUmNtQWJObTNMbG8yeEw2RkZ2MitqWGpm?=
 =?utf-8?B?bjlmZFJmc0RHU3NET3FvMzlkaGFyNXdmV0hOYnlSbWVZYlhVTlkycFJyVDRD?=
 =?utf-8?B?TEhoS2xoOHRacjRSRFdXY0RhZEFYRFRLM3VLM3h4VmlDa09BRWp0Yzl6YkxZ?=
 =?utf-8?B?QXdJSGRsb0tnanVBTHpNYzB1WnJLblgyR1drWXFYeUlwRGQySTBwVGI2V0xr?=
 =?utf-8?B?ZXFkMVh0b2REQUxrNnpkNDNjVWVQZzZIaklpZ21OOEM5OTNJVDMzYnk1Lyty?=
 =?utf-8?B?S2FjeVV3Wnd0NDYwQzJtdWM3STBUOVNrUmxtTVlyWUd0djJ3Y2N3VlFjZG9Y?=
 =?utf-8?B?amQyMHpuTTg0U1EzUStqb1pJY21LOGN6ZnFINkFkL2gyN3prQjVKTWJkUEtH?=
 =?utf-8?B?STFYb2lDTmpCNy9BYVVtc3RVQ2sydVdzWmRoRTF6M0JnSnVCenBGZFF5N1RQ?=
 =?utf-8?B?RkdUZFNMMDRTSW9rdGNKQzcyWnVxMy9aNWtpUlRSREsxeEZuU1hoM0llZkUw?=
 =?utf-8?B?UVJyVnMxYWhtUUdNN1FKY3IrNWRkN0VtNUZUM2gvNGgxcHFQb1pUK2I5VnFz?=
 =?utf-8?B?MjJWcTNjNi9Kdm8wK29FTVRCZ1hQR0JBVkhQTzZwdDZKYS9uSXBjRkdHSStC?=
 =?utf-8?B?b2ZlOUd2UUpzWTVySzlyS0hycDJ3dzdPcVNITTZWLyticyt3SThUdkdqVndH?=
 =?utf-8?Q?BsbPX33W47v44tktZDwQs6OQ4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecaa8778-2072-4b4c-fbef-08db5ac500f4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2023 13:03:57.6880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rvGSDpn7Uo7L611TtiH+n8S2zcufD6O6uwlZ6C0FfCpxCZVGLL9i1hjUT9hckae9ST1wJ+UGnae5buBdk95www==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7211

On 19.05.2023 01:44, Stefano Stabellini wrote:
> Hi all,
> 
> After many PVH Dom0 suspend/resume cycles we are seeing the following
> Xen crash (it is random and doesn't reproduce reliably):
> 
> (XEN) [555.042981][<ffff82d04032a137>] R arch/x86/irq.c#_clear_irq_vector+0x214/0x2bd
> (XEN) [555.042986][<ffff82d04032a74c>] F destroy_irq+0xe2/0x1b8
> (XEN) [555.042991][<ffff82d0403276db>] F msi_free_irq+0x5e/0x1a7
> (XEN) [555.042995][<ffff82d04032da2d>] F unmap_domain_pirq+0x441/0x4b4
> (XEN) [555.043001][<ffff82d0402d29b9>] F arch/x86/hvm/vmsi.c#vpci_msi_disable+0xc0/0x155
> (XEN) [555.043006][<ffff82d0402d39fc>] F vpci_msi_arch_disable+0x1e/0x2b
> (XEN) [555.043013][<ffff82d04026561c>] F drivers/vpci/msi.c#control_write+0x109/0x10e
> (XEN) [555.043018][<ffff82d0402640c3>] F vpci_write+0x11f/0x268
> (XEN) [555.043024][<ffff82d0402c726a>] F arch/x86/hvm/io.c#vpci_portio_write+0xa0/0xa7
> (XEN) [555.043029][<ffff82d0402c6682>] F hvm_process_io_intercept+0x203/0x26f
> (XEN) [555.043034][<ffff82d0402c6718>] F hvm_io_intercept+0x2a/0x4c
> (XEN) [555.043039][<ffff82d0402b6353>] F arch/x86/hvm/emulate.c#hvmemul_do_io+0x29b/0x5f6
> (XEN) [555.043043][<ffff82d0402b66dd>] F arch/x86/hvm/emulate.c#hvmemul_do_io_buffer+0x2f/0x6a
> (XEN) [555.043048][<ffff82d0402b7bde>] F hvmemul_do_pio_buffer+0x33/0x35
> (XEN) [555.043053][<ffff82d0402c7042>] F handle_pio+0x6d/0x1b4
> (XEN) [555.043059][<ffff82d04029ec20>] F svm_vmexit_handler+0x10bf/0x18b0
> (XEN) [555.043064][<ffff82d0402034e5>] F svm_stgi_label+0x8/0x18
> (XEN) [555.043067]
> (XEN) [555.469861]
> (XEN) [555.471855] ****************************************
> (XEN) [555.477315] Panic on CPU 9:
> (XEN) [555.480608] Assertion 'per_cpu(vector_irq, cpu)[old_vector] == irq' failed at arch/x86/irq.c:233
> (XEN) [555.489882] ****************************************
> 
> Looking at the code in question, the ASSERT looks wrong to me.
> 
> Specifically, if you see send_cleanup_vector and
> irq_move_cleanup_interrupt, it is entirely possible to have old_vector
> still valid and also move_in_progress still set, but only some of the
> per_cpu(vector_irq, me)[vector] cleared. It seems to me that this could
> happen especially when an MSI has a large old_cpu_mask.
> 
> While we go and clear per_cpu(vector_irq, me)[vector] in each CPU one by
> one, the state is that not all per_cpu(vector_irq, me)[vector] are
> cleared and old_vector is still set.
> 
> If at this point we enter _clear_irq_vector, we are going to hit the
> ASSERT above.
> 
> My suggestion was to turn the ASSERT into an if. Any better ideas?

While I'm fully willing to believe there is something that needs fixing,
we need to understand what's going wrong before applying any change.
Even more so when the suggestion is the simplest possible, converting an
assertion to an if(). There's no explanation at all what happens in the
"else" case: Are we (silently) leaking vectors then? Any other undue
side effects?

What I'm particularly missing is any connection to suspend/resume. There
my primary suspect would be an issue with/in fixup_irqs().

What might be relevant in the investigation is what the value is that
is found in the array slot. In particular if it was already ~irq, it
may hint at where the issue is coming from and/or that the assertion
may merely need a little bit of relaxing. Allowing for that value in an
array slot would in particular not raise any questions towards "what if
not" (as mentioned above), because that's already the value we store
there anyway.

Jan

