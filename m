Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B36574970F
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 10:04:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559739.875008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHJyh-0007Fu-EH; Thu, 06 Jul 2023 08:04:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559739.875008; Thu, 06 Jul 2023 08:04:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHJyh-0007E3-AT; Thu, 06 Jul 2023 08:04:39 +0000
Received: by outflank-mailman (input) for mailman id 559739;
 Thu, 06 Jul 2023 08:04:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdui=CY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qHJyf-0007Dh-PA
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 08:04:37 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20614.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bef780fd-1bd3-11ee-8611-37d641c3527e;
 Thu, 06 Jul 2023 10:04:35 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB6912.eurprd04.prod.outlook.com (2603:10a6:803:134::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 08:04:32 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Thu, 6 Jul 2023
 08:04:31 +0000
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
X-Inumbo-ID: bef780fd-1bd3-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JwkZpv0N2cq9dZYM2hqHQTNuPkXJsRJzAMYer0sz5A0BXJBBd855Dw9K48ZZOd45sJUNPA7pq1rYPNQ1F9clA0t6REKKWqIUZPd+uGGDL8SzdpbWxpkbt32OAS6l7ssYwR3YqZqdVfpesX+Eu39vaC7LfojdVgulKMY37UmIj84pVTD8vQfamQqzNdXlm+UibuzDheSvMag5i1BcaZDdjIy+OYoE2V+W+K1u/RPLsLFXTCepPrO30E/uLtEr1vV3U9v57RIkMXNxL1/qjJcx74q/q/L0/4Wbd7rcb9WKOvcLkYiONQkkVtCyO0pQ4QDa6t3OmpzfeXsDuOUlq1tRvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hArFJNFoKK19jjNG/YMjS3I+u6H7IIRRIkcKQARosLg=;
 b=j3THx/cnnML85M3uLYGqBzcnMhi68L2MZvz9rnM3PPXOpbLxG3JSe1QwWk+NzT6soB6nUkO+zmlycGVOonsBRuTk2zdCsFudKgD+hu/+T0Qw6tigiOeY9MBb5nKN1kj2HSesx29qFZv6BFFxcZxBo40O9KShFOecNWF9JlDWaGJpdmPs9eQPh5Rv/t26uuV2nky2bsl+JuMt+XNbhsEeAsFmic2UAk5z5rHLLFTZiA+naVTvTcfEXTmV54+/T64LcuYXrzPdQkM64qjxwg8TsXttPb1abySIZfSTBTNIfsCNc6/uf+4IbA+xMnecRbpOLM9PxhkeZzwpDAQVMAL5Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hArFJNFoKK19jjNG/YMjS3I+u6H7IIRRIkcKQARosLg=;
 b=4tTvtyKauCdn82C8Ci4934Q8nw1zqldvgkLlZh3phf1usyPrRRgv+iCaxWsKc4pEH8VPiZwkwzKZEeVg61HWTyqTAn8dsh7hpZuQtLT4DjmsAsiqnoqvFw4UlMNTpKm/ivYYwGUyj16Rw1VfM6uQs54LD3wSQCqhFhCGO/abU9b2q5wGBBaBltaLIVPVHjg7pbZ+cNM29w/QGeesPDTaAjd/BDmD6arCUad9JaDeMyNKI38uj3NkDaJgiRs+GmnWK6dMcfHD8Hdp4M6ZWIPKvJItoH3NXuKvMb8gQAab9Kw3fBCw+bj/CvFiGmwfKfKUaQRHBPbPPLWdWLoT59zTMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f3b6170a-db0d-ef00-b3f8-7deba17b9fe2@suse.com>
Date: Thu, 6 Jul 2023 10:04:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v2 07/13] x86/vmx: fix violations of MISRA C:2012 Rule
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
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1688559115.git.gianluca.luparini@bugseng.com>
 <f30ef7c2cda2516d9ef07bb79e5da5513cd90c6c.1688559115.git.gianluca.luparini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f30ef7c2cda2516d9ef07bb79e5da5513cd90c6c.1688559115.git.gianluca.luparini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0170.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB6912:EE_
X-MS-Office365-Filtering-Correlation-Id: d4b139bf-ae06-4ae4-1b26-08db7df7a0f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N/g/6tRG3bDx7/Ige6OUEP2bPsm/NdvdO/f7+Fp8sbwQPYXkJZedvJ9zCDYWVsTfYmD9xjgYxVNBqEjK7tOwqiBVujcRgejlcbUDf8KySqCj1fKKBB5cQqX4kDHRVagVZ628nymFs4tfOaNjujw38RiqeWkgHmnHql/wKDpd+D/rrfNCCLJ3j8eEaYNjKIEVALM6j2fUI5Xxn09hzoL6Fh96OfXZwMI5Fxm4Dad4E9UQMzlEuaVsBSplwU5b2O7o91F7wmZZqHrI5Dchpp4mQJKyRNl8j5XAEmmlDL5d+IUmEB3yG4NeRekIdM61Dh6yOU0MJrOs4p6ei4m7Ahzi751SQcwrcJdNS3f7jJFvpZyab7HwxyNQ4/2hKXcT/TjfVYV/go6HXl0PSSpvvj7Hv+GSIJXRmsWyNVgCAqhDNP4dQkFpWbtZ8xBvGYRTByNNtT/3KpXpFpPLWWUoBnsLhxnG30JtkMLbiRTAkkG4FKHZrVYDei6EmAwmgVUgwM/2VvSNmlGiXJI7LuBQZNI8GGgA5GiJR3R1ziUr2LfR/NqHuBn45uBhA5QfGwGVzgg9VBY4kHKxY5WMDHF8KcnuQ1iG5f00BDua8osysmsRqA+/tscVmn+Bv++ZIubk5L9jkIQUx4deE4zXiDpGU04/rw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(366004)(376002)(136003)(346002)(451199021)(4326008)(186003)(478600001)(6512007)(26005)(6506007)(53546011)(31686004)(86362001)(66476007)(2616005)(316002)(83380400001)(38100700002)(54906003)(6486002)(66556008)(6916009)(66946007)(5660300002)(7416002)(8676002)(8936002)(41300700001)(2906002)(31696002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VElXNHN1czBnM2lUZFdRRURVTk9INDNsSkUyZUpqOWwyWElrbFE1bXpRcXE5?=
 =?utf-8?B?dHRjZUF2VnV2WWdqMU4reHpQZXdlMDY1V0lTNE1waFo5eVdjV2tLLzEwNFMz?=
 =?utf-8?B?QnU4VEdRRkcybE15bjFId1d0bnk3YjJUVVArNzhVVTBZenB2K2ZtYTVzN1Zm?=
 =?utf-8?B?ZkpBUk5TWDhoKzBLRUhGczBocTIxNWswRHp5a3JlVnBBSW5wOFg0akZiVWRy?=
 =?utf-8?B?SHBaVGs5ZEk3ZGFMVjFSa090c1E1Q3VNY0FrMEZtcGludGlJTGpmdlUweFBE?=
 =?utf-8?B?cFVMSmRkUmppUzhNUGt2RGVnMGpTMzFPWTBKdFhYVkMxdkVXdUFwY3NydmdN?=
 =?utf-8?B?elZobndncjN1YVFVc3E3bEhtdXpzTzF5dE9YTGJNMFJGZmIwczBEcm9tdUNk?=
 =?utf-8?B?SEJnRWV4T0lpTk8rM1FRdzZiTkNXWlBLbmIxZzc1T1NiQ2NzR0g3Y1loZkV4?=
 =?utf-8?B?aWRncENVRWd2T255dUw2NGlkQjhoc0huREJxZzRQVUl1SHROcnFJMUUvdmZm?=
 =?utf-8?B?TEtMY3RSQ0dmZzFmVDRyaEZMZGowVlBFYnFnaS9IaUtjV0RLRzU0U1RQcFN2?=
 =?utf-8?B?MzV0Vjh2MkRvUFhiUmR0L0ZLeDFjZ2tHZGd4VTFqYlRIT3hWTVA1WUFlcHRp?=
 =?utf-8?B?VWN1Qldqa0prRkJLdUdpWE1sMlNNUXkxbTJpbGNyMFR3NnJQV0NSdlJBc3lt?=
 =?utf-8?B?K3pad0J0bnlIREFpN3NBeDN4OFV0bUFFOCs0a1MrazZ6ZEYzcWtVUWgzeHg3?=
 =?utf-8?B?VDk4YkF4VW82UEo2YW8vc1Q4UHdpcnVNb1M1eG9DelRybXNiN2hnYm1yWDkz?=
 =?utf-8?B?NGgxYlVMYkNYeFFoaGFESEs1ZHBKajFYWllGb3B5c1E2UU1RT2ZuN2JkTkVE?=
 =?utf-8?B?Vk9QM0pGbmZHT2gzOEZkbzN4ZXlUeFVuM2thRnFTOXM4dzgrSnhEbXpxZ2h5?=
 =?utf-8?B?dDZtN210RkdiVG5GQmkyVGF4eWNiZER5Y0hzTFFDQWhxRmdtZHpPMHFORzFy?=
 =?utf-8?B?OTBjVHVpWGpqNHU2aDRYOFErMXl3cU5tTTFpbWc4dDlmZSs1c01ZLzFMZXNv?=
 =?utf-8?B?SjlSZHBMd2o3bkRIb1BJQlgvZE9INGV6RE84cXNIZVFDbSt0eHhTRjY3TFVx?=
 =?utf-8?B?ZlRES3FyangrZ3Jxd2hNT0Rhd00zcVlNQVN4Q3ovckdTR21ySksxemVYalFa?=
 =?utf-8?B?aXBpV1gvUGJyalR3bDNBWTEyNWM4UGVaNW5pUk5nT1EyTzQ1ZjgyNkRaUDV1?=
 =?utf-8?B?VC9tQi82Rm1aRmMycWpORFZ0bGNqV1EvL05uMXpsN2UraG8wV01rb2RuQi9E?=
 =?utf-8?B?U1Rxd3pBaktBZW53SW1uTEtQaDNrNW9oa0Z2NURLTk9jbE9NYjR5MkhObytv?=
 =?utf-8?B?NmJaclYwbmhzbDdLYzNaRStvemc5T1BleEFuZUdkNEVqRTkzZFk2M1ZnMDR1?=
 =?utf-8?B?eC9BUjQxbWZkNFJiOUt4dWN0MkREcTl0L3FMRHpPbE9abkl3c09LWlJPVVlC?=
 =?utf-8?B?NHQxYUNsSjNrUFFhMk8wUVFJanpGd1hBWnVMSldFYUMzYnpZTytNVXUwc2NZ?=
 =?utf-8?B?Q0pibUMzeCsyYTlST01MN1Nsc2RISjNEVmJQSXVIRFZNQWdJYlNpZmdNdllF?=
 =?utf-8?B?WFRGR3VkbDJrTWVoenZUb25GWmtsUlo3cVZFSkdZUW55R1JML0hjcURBaUht?=
 =?utf-8?B?bCtBVFk4Z1dmdWlKRmRJQ0N1cDF2R1BnUFN0K1daWDRRWHhrY29HZnlPS09H?=
 =?utf-8?B?TGhqM0taU29SM082NUdVMFBmamtxanhsMnpkWDczeVdidGlyakNOeEJnMHVO?=
 =?utf-8?B?bjJOajNramNiRWZ2T3BVYWk4TUE0RHlOdWRsUjRzQlhjNTBDNzJKWHQ5MDl4?=
 =?utf-8?B?ajZVd1ltUUZwY2ZBVlN1c1JvNFBjc1lOcWFJUkNKRGtqODRSZ0V0b2cyWjdT?=
 =?utf-8?B?OXhzWmJDVzlLblYxVW9jWW44OVVxaFdSWnVXWXE1dnlwdEtLSmJPQlNRMVRQ?=
 =?utf-8?B?Z1IwVHN5WlRmZmIzWHlGZUQ0MWFjQlVaMVVlMzF4RlZJRkNyb0lwK05xL0Qz?=
 =?utf-8?B?MUZNSllFRGF1Z1hDdDhmckNFNFVEWC9NS2dNY2RiZlZ1N0dSMEp3T3VRTVB5?=
 =?utf-8?Q?AoKhRdAiYsrGpm6fP8fbLpkaW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4b139bf-ae06-4ae4-1b26-08db7df7a0f9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 08:04:31.5454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tk3S4oqSQwxMwEYIVEZUiReury1w9+o4Fo07yt8MInBbWlRaNV6lCGDkuLyFoikwxf2BM/PgJqjWQL8u1whdtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6912

On 05.07.2023 17:26, Simone Ballarin wrote:
> --- a/xen/arch/x86/hvm/vmx/vvmx.c
> +++ b/xen/arch/x86/hvm/vmx/vvmx.c
> @@ -257,14 +257,14 @@ uint64_t get_vvmcs_virtual(void *vvmcs, uint32_t vmcs_encoding)
>  
>      switch ( enc.width ) {
>      case VVMCS_WIDTH_16:
> -        res &= 0xffff;
> +        res &= 0xffffU;

I don't think the suffix is needed in cases like this one, and ...

>          break;
>     case VVMCS_WIDTH_64:
>          if ( enc.access_type )
>              res >>= 32;
>          break;
>      case VVMCS_WIDTH_32:
> -        res &= 0xffffffff;
> +        res &= 0xffffffffU;

... while generally I'm suggesting to avoid casts I wonder whether
casting to uint32_t here wouldn't make things more obviously match
the purpose. (Same again further down then.)

> --- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
> @@ -207,7 +207,7 @@ void vmx_vmcs_reload(struct vcpu *v);
>  #define CPU_BASED_ACTIVATE_MSR_BITMAP         0x10000000
>  #define CPU_BASED_MONITOR_EXITING             0x20000000
>  #define CPU_BASED_PAUSE_EXITING               0x40000000
> -#define CPU_BASED_ACTIVATE_SECONDARY_CONTROLS 0x80000000
> +#define CPU_BASED_ACTIVATE_SECONDARY_CONTROLS 0x80000000U

Interesting - you don't change adjacent #define-s here, nor ...

> @@ -257,7 +257,7 @@ extern u32 vmx_vmentry_control;
>  #define SECONDARY_EXEC_XSAVES                   0x00100000
>  #define SECONDARY_EXEC_TSC_SCALING              0x02000000
>  #define SECONDARY_EXEC_BUS_LOCK_DETECTION       0x40000000
> -#define SECONDARY_EXEC_NOTIFY_VM_EXITING        0x80000000
> +#define SECONDARY_EXEC_NOTIFY_VM_EXITING        0x80000000U

... here. May I ask why that is? (I'm not opposed, but the
description suggests otherwise.)

> --- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> @@ -136,7 +136,7 @@ static inline void pi_clear_sn(struct pi_desc *pi_desc)
>  /*
>   * Exit Reasons
>   */
> -#define VMX_EXIT_REASONS_FAILED_VMENTRY 0x80000000
> +#define VMX_EXIT_REASONS_FAILED_VMENTRY 0x80000000U
>  #define VMX_EXIT_REASONS_BUS_LOCK       (1u << 26)

Along the lines of the latter, perhaps switch to 1u << 31?

> @@ -246,15 +246,15 @@ typedef union cr_access_qual {
>  /*
>   * Access Rights
>   */
> -#define X86_SEG_AR_SEG_TYPE     0xf        /* 3:0, segment type */
> -#define X86_SEG_AR_DESC_TYPE    (1u << 4)  /* 4, descriptor type */
> -#define X86_SEG_AR_DPL          0x60       /* 6:5, descriptor privilege level */
> -#define X86_SEG_AR_SEG_PRESENT  (1u << 7)  /* 7, segment present */
> -#define X86_SEG_AR_AVL          (1u << 12) /* 12, available for system software */
> -#define X86_SEG_AR_CS_LM_ACTIVE (1u << 13) /* 13, long mode active (CS only) */
> -#define X86_SEG_AR_DEF_OP_SIZE  (1u << 14) /* 14, default operation size */
> -#define X86_SEG_AR_GRANULARITY  (1u << 15) /* 15, granularity */
> -#define X86_SEG_AR_SEG_UNUSABLE (1u << 16) /* 16, segment unusable */
> +#define X86_SEG_AR_SEG_TYPE     0xfU       /* 3:0, segment type */
> +#define X86_SEG_AR_DESC_TYPE    (1U << 4)  /* 4, descriptor type */
> +#define X86_SEG_AR_DPL          0x60U      /* 6:5, descriptor privilege level */
> +#define X86_SEG_AR_SEG_PRESENT  (1U << 7)  /* 7, segment present */
> +#define X86_SEG_AR_AVL          (1U << 12) /* 12, available for system software */
> +#define X86_SEG_AR_CS_LM_ACTIVE (1U << 13) /* 13, long mode active (CS only) */
> +#define X86_SEG_AR_DEF_OP_SIZE  (1U << 14) /* 14, default operation size */
> +#define X86_SEG_AR_GRANULARITY  (1U << 15) /* 15, granularity */
> +#define X86_SEG_AR_SEG_UNUSABLE (1U << 16) /* 16, segment unusable */

How is this change related to rule 7.2? There are u suffixes already where
needed (and 0xf and 0x60 don't strictly need one), so there's no violation
here afaict. A mere style change to switch from u to U imo doesn't belong
here (and, as mentioned while discussing the rule, is imo hampering
readability in cases like these ones).

Jan

