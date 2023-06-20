Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F16FE736C52
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 14:52:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551822.861553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBapo-0000BF-GE; Tue, 20 Jun 2023 12:51:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551822.861553; Tue, 20 Jun 2023 12:51:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBapo-00008F-Co; Tue, 20 Jun 2023 12:51:48 +0000
Received: by outflank-mailman (input) for mailman id 551822;
 Tue, 20 Jun 2023 12:51:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lS3L=CI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBapn-0008V7-7x
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 12:51:47 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0627.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3633a827-0f69-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 14:51:45 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7366.eurprd04.prod.outlook.com (2603:10a6:10:1a0::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 12:51:42 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 12:51:41 +0000
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
X-Inumbo-ID: 3633a827-0f69-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZuAzAUbvgarM08ZvfWiGftxARLxoGFsI2ww0U81H2szjMcXFSIBfgXybPtXaxqj/82ptQ/Yx2Y7edG9mpiEYH6liHajIr93bBWkAi3L0JykoEyF8nscl9dVlPaEqkL1IxdBt/PztqGyZmhrAbRh2sCvuEjhkaklBvVZ3/ib1ksaTQusGc5vk3BdCTRk8zENAazRvteTJGUGYTgjcCDltAwLvtGAyYnzwT9wUO4tRxDkSPn6gRkEnWNKun2vvyVNti2IUQyeRb9+CqSicNjB0rm6Km1yKLvHHgcjDPKDZCH3UF8DmH6/0SZiq7DKmwEn3HS7/P4vM6FcUOvYrBkICXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5bw1dLfCq4DEIsphnaPzu9YNoIxOz0ogAVWgd14qzPE=;
 b=XwokBed6FLiJ/vyYUjwRPupagSV7fcc6a/cH8hyuV0Dt2UJEI4RLgQS4YZrVJHyvf1gaksyHIWD2jBFoavTazu/mMB2nlxabz2HZNvqi7D1W0J/yVqbTUNSNt5lYWfQN7NzRns1VYLGqlOS5JSFRuQ7RNXbEEqp89bQ876F8MdhxEgvlf8svrZ31ATn80gerMQrdsXhTs7lkYuk/1P8R6Zr71vsxUXXNew37bjk1N8oSWGpqEjsFEJfWMa9aN2ACwXEnPxBmB10lQyDJSyhlj9o/KSU1PeZbq9naw5Il47soldOzCGJCImC18ktRMzFYmmK7kl6torGYTEnE5LB0Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5bw1dLfCq4DEIsphnaPzu9YNoIxOz0ogAVWgd14qzPE=;
 b=4y6h7De51rbA4v9injwiEE6IohFOMB9va4u7Ag/IOn/3Myx28eOWBKhevtTCoyNVpqwa8aLXU8BK8ZGormeJaM3cGpHiVLy3ct8mjjtLat+gX0Cm/YZfKl9S191Oqzi8HVD0wAZEuOFxd9DoFil0jmsaS7Izd5J4XLrAy/EKNobyEe7qSGcBaSXoCAeqEvASIfgMaFJUuYGvu9UeJI5q3dC+IiLa5ygbcL5i9Yvb9gwSbFRsLichCQsD4CKZwvelW780j31uJ3GFXU3QBMLeEhCoaHeUtSJAO/1TExF0PyLQx6adVJGKiE5/2QVg56xeTB6s0WMQ/Cbzisfu3zs8WQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <19bdb894-fdaa-088e-4139-c5fc09189cce@suse.com>
Date: Tue, 20 Jun 2023 14:51:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH 07/13] xen/x86: fixed violations of MISRA C:2012 Rule
 7.2
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, Gianluca Luparini
 <gianluca.luparini@bugseng.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
 Ayan Kumar <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1687250177.git.gianluca.luparini@bugseng.com>
 <6c440188b0bdb58dc3e925788956b3d301d5a18b.1687250177.git.gianluca.luparini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6c440188b0bdb58dc3e925788956b3d301d5a18b.1687250177.git.gianluca.luparini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0219.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7366:EE_
X-MS-Office365-Filtering-Correlation-Id: eb461d3c-6c0f-4860-4b5c-08db718d1844
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cdDl6ViyVlqEdimg0IBgJ/sJLDWt2/pGvotrFUkVfzTixl0kqLwC/VDTrvtitVAzSgNflCuGQjbI/8qzD775GeRHI1Oxz8IckV4LS8GJ6vrXgQL8UpfprPIFvpQUqnN7qI4kTkU/vVaKo4zfZncIITgBaQ4EzVFiiKPzuh+hjIuJrWGnROina2qRDmNijFbxx+axzFqFpqh1G9wPW7xKB0/rJ6+E4sMCNIXlmitj5xunHMX54lBwJerOhTOM1eEnnxxDbe6+XMGnnrlC9lm2M0bLRHfQozQP+3+Uf/aMdxG+/aEQMbteiH7ePvRi8eg0IdJolqiAZ9WvZp1jAZOoMU2M8Rv41fYR2QlhGb5XvhTipQntYvCEdhE9CkUJ6YVtVwgDRN/rkdQNFR+e4ypw3Sxz/kqvDjlq37atsgqDT65nUksc+MrvKfljJKk9HjrcgevOMjSWw21R8o1VQujMtt2LEp/z8AR/hHY56+aDONiVqjAFWoTaoJmoyQMZW/U/opPCAdNIzAEI51+DqXM/UeeKELgRd95kbuxAhbNKLC2iyt7MNHSMW/2nyyrVNO+ImlrdPX7fgtLkGzLQNfIGmw+A64ecEKrT4h6/Hs6CMvThsrDusyUCYeHBPgOf9XG48JKGrBoLQyUCNr/q+DkdXg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(376002)(366004)(136003)(346002)(451199021)(8936002)(41300700001)(8676002)(478600001)(38100700002)(83380400001)(2616005)(6506007)(186003)(6512007)(26005)(53546011)(6486002)(54906003)(31696002)(86362001)(36756003)(4326008)(316002)(66946007)(6916009)(66556008)(66476007)(31686004)(5660300002)(7416002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFZBUlFEMW5Wdm1aVjAvY05jWU9Oa043c2pNWC9udjRPRmd5dEhOREE4bC95?=
 =?utf-8?B?ZjljSENsYmthWC9FbmxpTmVhRVA2ajJmeUdheXhUVElxZkc5eTF6c1luVDFR?=
 =?utf-8?B?azNnTUF1QUlZNjl6V3ZwYWE4VkdhWFRiZ0lNZ1hlTTZpeDZmTjBBK1ZjU2tE?=
 =?utf-8?B?N0FJd3FTWTB6Vzd5cTB2Ny9YRE5JZnJUcTVWUkViTEoxZDVydWRueWJIWVlX?=
 =?utf-8?B?YTE4TVl1Y2FBUVBvK29JOWtOeERBL0d5NURvV3g3NWtON1VCa1prL1dYV1R3?=
 =?utf-8?B?RUdyUkUyMFdQY0dsUEpUNXdzRUtvdk8zbGV2QUNCSlNCdEdHL0Z4Qm9icnJt?=
 =?utf-8?B?ZHpJbXgvZS9rQ2R3MU5TRm5Fd0dWRGE4aTExVWFHVTJCUXVMVkZCU1JNMEhY?=
 =?utf-8?B?MThQaTV5Q05OVkZhdlFaVEhEak1FVkhUbjNVV3BhZGhCTTF5QTlXc3JYVjN5?=
 =?utf-8?B?UDYvMklRN1IxdHk1dlA4SFpiSDJDeEJvbHVneTRHazI5ODVEMWpNNS9VbkFw?=
 =?utf-8?B?OEg4QWxNc3BVVTlsWW1DVkhCR1EwR3BpVlJJZTdCMmtJT2ZLelJoYTlCQkty?=
 =?utf-8?B?ekdSSE5NZ3VGcGtOVGc1UTFFZUxJRzV1YTIyS0hUN3l6SjMzalZEQkdnN1E4?=
 =?utf-8?B?cXJFWXU4Vm10N3dOYXhwMUlYSGtqRjdMSFMwVVN4OTQ0NDVkWnhUUmV0UmRn?=
 =?utf-8?B?b0F6Qjg1WlVuSFd6THJVY2V2OUdpdUhJVTNFT05qWEs4QzRiYVVvUGhDMDNo?=
 =?utf-8?B?dTNoYlJJcjFQMlBQSVJXTFYrMHdXN1FLR3JMZG1kZEhsS1lpTVpobTVrblp4?=
 =?utf-8?B?ZHFnMDlJWVg3OXJ0ZitHZTd2TnlDc25EUGpPcnhzLzJYUTZuNE5sczlKM0Zo?=
 =?utf-8?B?N0U1dzcyZFZheTdSbFJoNVk5aGJYeUJHc3ZsQnlja0RsK21WV1lQY3pKNmpi?=
 =?utf-8?B?ckVDdHl1ejZnYy9HVm9VZGQvTWVXdU9hUko3Wk9wRzB0MDZhb2VSZzN3aHIz?=
 =?utf-8?B?OUc4NjI4SzR2amJIS09lRDNUUHZHNnh4WC96NGpOSzl6OHhhN2VPMGVnNzRH?=
 =?utf-8?B?VVIwOUJuWkRzOGt5QnA3U2Z4V3Brc0VaTFlFQStPMDdPQWw1Wm1iMkRWNks0?=
 =?utf-8?B?emlrNVFuNld5aDRycS9zUkNvMkVRVDVWanU0WElPMVZITmVJMkowTWk2Wit5?=
 =?utf-8?B?STdZdXRHcU1pdkJKVk1EckVySm82N3c4Wm16R2RNRW01bGVObk9KcitmdFdV?=
 =?utf-8?B?cjkyV0NRaGtuZTV6L2ZTS0VxTDIrdWM3d2J2czVJQzVWV0lGc2tXM25TNXVU?=
 =?utf-8?B?NnZpWGovZTNRbjNDek9CYzRYVUhWQUd2Q1FIQ0VqZnUvdXluV0FBRTk3cUJw?=
 =?utf-8?B?VlJ0QWcrcEJFZkxYUW1JRUFRdDM1dllSUUY3eHk4WHVMSEpwOHA2bzNFOTBJ?=
 =?utf-8?B?cmFrSkdPeFV1NFEwOVowbUtaTTMwdTIxb1pMNDRTb2l1ZGs0cXo2UjZXb2xS?=
 =?utf-8?B?TjNoeU1zdENycVB1clBQeXVISGFDbG1KVExaUlNBKzg1a3JYanZXUk5jUlVp?=
 =?utf-8?B?OUlZWnhsR2o2SFJacXk5UU56c21FbWNZTGU0eGJGVVRrNWFNVC9ZT0FnYlZp?=
 =?utf-8?B?eXVtQkg4VlJLT2QyT0J5eHd1Q2pRVFh0cXIrbk5KU0VUTlRIT0w5Z2M5WVJF?=
 =?utf-8?B?ZThsL3kvYkNvK2lWTTIxaHFGdGJxbFh3dnVHeGNOTkk5aDZlQTFNTm9ReGtZ?=
 =?utf-8?B?b1ViRVdTTVkzSVgwODl2K09wc3p2eDZ2ZHlzZ3FkejRvUjlCRUtVM0xENXgv?=
 =?utf-8?B?MGZEVEN5UTBaWGhuUGRKWEdRRlBOYlFyeG8vNDZoNEdFMjg0cDR0czV3S0sx?=
 =?utf-8?B?WVo0U1ErcTNJcUVEL0kzcjU0MklqWHgwaGFCaVgxM3FqSkJvSU96WnE4SFZz?=
 =?utf-8?B?MkF4ZXlMbFAzeDFReHRCMy83OXBscndpVTd4VG1vdzgyUVdGb2I5SWxtTjV3?=
 =?utf-8?B?KzVycFc2eE05cVFUbDN3NlcvRmc3WGhZMTM5V0NoSTJGZ0ZYTUl4UmZkMmNu?=
 =?utf-8?B?YWlGL1lSYldKYXZCUnVLeDMyTXZzcTVwb01RUitUVHNyNzl5ekJGRGhPYXdH?=
 =?utf-8?Q?zqnFDEEEUWB7bFxBdb5iRZp1h?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb461d3c-6c0f-4860-4b5c-08db718d1844
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 12:51:41.6672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EBCFgXXpWb01vQL38dRAY2sOD719+fCBRU9x9hBBYOi9mTm46QJ5NZuqS5zFX1e3eKIwg9i7kFQkZJHpijhLxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7366

On 20.06.2023 12:34, Simone Ballarin wrote:
> --- a/xen/arch/x86/cpu/vpmu_intel.c
> +++ b/xen/arch/x86/cpu/vpmu_intel.c
> @@ -950,10 +950,10 @@ const struct arch_vpmu_ops *__init core2_vpmu_init(void)
>         fixed_ctrl_mask |=
>             (FIXED_CTR_CTRL_ANYTHREAD_MASK << (FIXED_CTR_CTRL_BITS * i));
>  
> -    fixed_counters_mask = ~((1ull << core2_get_bitwidth_fix_count()) - 1);
> +    fixed_counters_mask = ~((1Ull << core2_get_bitwidth_fix_count()) - 1);

What's the point of this adjustment? And if at all, why keep the l-s
lowercase?

>      global_ctrl_mask = ~((((1ULL << fixed_pmc_cnt) - 1) << 32) |
>                           ((1ULL << arch_pmc_cnt) - 1));
> -    global_ovf_ctrl_mask = ~(0xC000000000000000 |
> +    global_ovf_ctrl_mask = ~(0xC000000000000000U |

If such constants gain a suffix, I think that ought to be UL or ULL.

> --- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> @@ -136,7 +136,7 @@ static inline void pi_clear_sn(struct pi_desc *pi_desc)
>  /*
>   * Exit Reasons
>   */
> -#define VMX_EXIT_REASONS_FAILED_VMENTRY 0x80000000
> +#define VMX_EXIT_REASONS_FAILED_VMENTRY 0x80000000U
>  #define VMX_EXIT_REASONS_BUS_LOCK       (1u << 26)
>  
>  #define EXIT_REASON_EXCEPTION_NMI       0
> @@ -208,17 +208,17 @@ static inline void pi_clear_sn(struct pi_desc *pi_desc)
>   * Note INTR_INFO_NMI_UNBLOCKED_BY_IRET is also used with Exit Qualification
>   * field for EPT violations, PML full and SPP-related event vmexits.
>   */
> -#define INTR_INFO_VECTOR_MASK           0xff            /* 7:0 */
> -#define INTR_INFO_INTR_TYPE_MASK        0x700           /* 10:8 */
> -#define INTR_INFO_DELIVER_CODE_MASK     0x800           /* 11 */
> -#define INTR_INFO_NMI_UNBLOCKED_BY_IRET 0x1000          /* 12 */
> -#define INTR_INFO_VALID_MASK            0x80000000      /* 31 */
> -#define INTR_INFO_RESVD_BITS_MASK       0x7ffff000
> +#define INTR_INFO_VECTOR_MASK           0xffU            /* 7:0 */
> +#define INTR_INFO_INTR_TYPE_MASK        0x700U           /* 10:8 */
> +#define INTR_INFO_DELIVER_CODE_MASK     0x800U           /* 11 */
> +#define INTR_INFO_NMI_UNBLOCKED_BY_IRET 0x1000           /* 12 */
> +#define INTR_INFO_VALID_MASK            0x80000000U      /* 31 */
> +#define INTR_INFO_RESVD_BITS_MASK       0x7ffff000U

I think it would be nice if you took the opportunity and added
zero-padding to these constants.

>  /*
>   * Exit Qualifications for NOTIFY VM EXIT
>   */
> -#define NOTIFY_VM_CONTEXT_INVALID       1u
> +#define NOTIFY_VM_CONTEXT_INVALID       1U

Like above - why this change?

> @@ -247,14 +247,14 @@ typedef union cr_access_qual {
>   * Access Rights
>   */
>  #define X86_SEG_AR_SEG_TYPE     0xf        /* 3:0, segment type */
> -#define X86_SEG_AR_DESC_TYPE    (1u << 4)  /* 4, descriptor type */
> +#define X86_SEG_AR_DESC_TYPE    (1U << 4)  /* 4, descriptor type */
>  #define X86_SEG_AR_DPL          0x60       /* 6:5, descriptor privilege level */
> -#define X86_SEG_AR_SEG_PRESENT  (1u << 7)  /* 7, segment present */
> -#define X86_SEG_AR_AVL          (1u << 12) /* 12, available for system software */
> -#define X86_SEG_AR_CS_LM_ACTIVE (1u << 13) /* 13, long mode active (CS only) */
> -#define X86_SEG_AR_DEF_OP_SIZE  (1u << 14) /* 14, default operation size */
> -#define X86_SEG_AR_GRANULARITY  (1u << 15) /* 15, granularity */
> -#define X86_SEG_AR_SEG_UNUSABLE (1u << 16) /* 16, segment unusable */
> +#define X86_SEG_AR_SEG_PRESENT  (1U << 7)  /* 7, segment present */
> +#define X86_SEG_AR_AVL          (1U << 12) /* 12, available for system software */
> +#define X86_SEG_AR_CS_LM_ACTIVE (1U << 13) /* 13, long mode active (CS only) */
> +#define X86_SEG_AR_DEF_OP_SIZE  (1U << 14) /* 14, default operation size */
> +#define X86_SEG_AR_GRANULARITY  (1U << 15) /* 15, granularity */
> +#define X86_SEG_AR_SEG_UNUSABLE (1U << 16) /* 16, segment unusable */

And all of these, when it's exactly the two numbers you don't touch
which might want to gain a U (or u) suffix?

Jan

