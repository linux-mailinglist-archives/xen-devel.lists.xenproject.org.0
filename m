Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D027CA81B
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 14:36:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617506.960129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsMp8-0001PC-SE; Mon, 16 Oct 2023 12:35:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617506.960129; Mon, 16 Oct 2023 12:35:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsMp8-0001Lx-OM; Mon, 16 Oct 2023 12:35:54 +0000
Received: by outflank-mailman (input) for mailman id 617506;
 Mon, 16 Oct 2023 12:35:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BBjo=F6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsMp6-0001Lp-Jo
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 12:35:52 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on062f.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89cb1c18-6c20-11ee-9b0e-b553b5be7939;
 Mon, 16 Oct 2023 14:35:50 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB8PR04MB6988.eurprd04.prod.outlook.com (2603:10a6:10:117::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 12:35:47 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 12:35:47 +0000
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
X-Inumbo-ID: 89cb1c18-6c20-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nByIPNJ27kR9BtSw6+6jV9148FL6UE/4w3pQQBghtO5qaEmPUBeE1lXUl+xha8TMSiChE0fBAxYpcxyESLBTB/V15vpZGvODISSM/wY4ww+xlsRo57E2QYbVnywy2APP1JBmack2KRZ1J5l5MctzUzjwPgeupBEKdkoh8yZGxV3k6XrXwd/1QVGNp/NuN0V33pi0APx/dzOqYC0ovTSGVqdlRa5dKZ4DnNefup6oMfZ6C5onPhAsibIIJct7JFBCi0oLgjWZNMPC/j85mJ7hmXWM6lCHoPkbdQSmglcDeW99+0D56VjIf8dP189c9Wrp91r2FlxSAlkgxk7xuhe4bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yS7xizA2dbSBOpRHubJVA2Plwu/kvzCbYjhbSqt4PMU=;
 b=TcLOGMj48HgbFXwjc7FxVpDeEeayi0eoo5WOMTTH9HOkXEkB72BK4Co4SEL+Ys8vS5/QFKXMY6+MF4m2sOfTKrUHy5C8LHuXSJ8vIVFq2nEkWnWLELz7fPsSep6BGe30NG4yFazknTmFPICnFM6+oK6C25MHs9oMQD/DeUNHiug7c5BPsNQmza6O3xSj2zVZPOTPNYhQ4nPF/VxwGTFat60hVS7BS3shycg4zhAcu/zPcMx2D4QYNver5d/KD2IoRvC4TcTfMFiwXfhmQxKtpE0g7KJyHMallxgC3WpgaL8IfCluAp1EmoAXpkUDUfdse6zBmrWIlNVvNJGjlyAdsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yS7xizA2dbSBOpRHubJVA2Plwu/kvzCbYjhbSqt4PMU=;
 b=Xp8Or4MvKhQCNZxLkigPmHkrw3EVFOGFkcUmXEFuGHwdi0iWFs2sqFMMSIG01DEOY6KaspjFmar13f2AVgCmTW08L8vKRtugu8o8stRej88JnuCPDnAS4dDG2Xv8FFU/Xv5EPT6of+S3d6o5/cu3v+8yEQLnGa4GOquZP9eJrHWrQSKqU855ikptwVSdmL1LweIkTcerYSYdMysPl7EvSWTc+EHozw9maXvBKPuxz8Nlx6iDpcj1lI+OYLoKTrq05sPlcFlojVBEgT4S8s4HeS8PljHqIh7rX7AO+NiAa5033E4kvXbXJssSTWcPub+kKjUakRQUl61mJLum8663Yw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b8c03b77-d4bf-3be7-2090-e76e6849b085@suse.com>
Date: Mon, 16 Oct 2023 14:35:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 2/2] domain: expose newly introduced hypercalls as
 XENFEAT
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Henry Wang <Henry.Wang@arm.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231006130059.97700-1-roger.pau@citrix.com>
 <20231006130059.97700-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20231006130059.97700-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB8PR04MB6988:EE_
X-MS-Office365-Filtering-Correlation-Id: b834a813-05b1-4e88-2ea9-08dbce446c35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DTaAK2i+JJiKmK2fZVRwMIG1hIm3c5iItsTlkXgV7x0eiN2i8hK+i6tt8M0iX7bL4lTXTJJFJO4N/XO7ZIRf6mBkcBL9zihRHGnS1Ts/6u1VWXm+gtn5EZwCby1pzWtUY7eeUmBcT13fwkJ5DtngSFUTuKNBEHqZsNjxEFBFuzsdiAeeOwROtD2E5R4m0obZcNbXEhylxuy6l6R9XbGI8+P8Anu9vOY0aDO2PHlGmLdrlLE2hSND5eMEYgP3wOJuvHOQSLOB8nexriGocipRXFFaPbdi+FTLBM4HKzEloGZfxfEOiNC9KSKdx4hx6WX2Jz1SSILWSDWUAYuzdUiuj0hbs/E4HFVCnZ4pNwqeEGAwGNlge2vrFL2V0IdBMk620D6B55+JBSP+K1E1tcckV8xj7AssSw/CkN4D5GKKIF+S64UvhGi3DHp3OrKisJHskPucPIjKEqRppZfl2OiWIJTbumg9W21xy9GSIHxbe8qs4bqHUD8be4Su7DwZukJEQ+g/nl7X9kK0l/AzzGSuPhjCnYUiwCtU5LfpCQxdJDnTMpqB4B/ZQ8+s1nevWWDiiNuxRMLes9anAj2L6sz7Fylo5nYUETjPc1b79XDJzKHZpEUbrzm4tLZ6RtvfNHcApikMmwaQ++BNfDixcQycSg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(396003)(136003)(39860400002)(346002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(26005)(2616005)(8676002)(8936002)(4326008)(5660300002)(38100700002)(83380400001)(31686004)(41300700001)(478600001)(31696002)(86362001)(6486002)(2906002)(316002)(6666004)(6506007)(6512007)(53546011)(66946007)(36756003)(66556008)(66476007)(54906003)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUFRUmZOVXFpbkFUTGpVTVFYWjVuZmZ2T2kzdDBxMnR3QlE2VFdiTXA4NnNF?=
 =?utf-8?B?b2hmN0srMGgwcWsxY2YrVVdJQUpvdzBRZVRUVHBHVGpQZ1ZMK3J3SWV6UmE3?=
 =?utf-8?B?V1d3S2ZITStaRDAzeHgza0pHM0pDQ2FSa3dQUU1jcVNidlN3UGxxTWdNT0Fz?=
 =?utf-8?B?STJ4ZlFpUVE5TFFOcGFha004NTBkUWpKS0szRTF3SnAzd1htdlExMGlOZjRE?=
 =?utf-8?B?UHJQT1krYVo5Tit6cFk4ejQxSWRLSnE1dEZHYzAxMDJWK29kdEZGb2tVMGFM?=
 =?utf-8?B?T2k2bTRkbUt4ZkJkdWpjeXcvN0F4dThsWkYzeXpGOTZCZmpxQnlIV2dRUXJ1?=
 =?utf-8?B?TThXajV3aWZDSTQ3dkg5all5YWplSjRxMEJocHZueHhYaGpJVWIvRjFRelZJ?=
 =?utf-8?B?ZEZzYmFmS1ZiYkZ6RE9wbmRvc1pPZ1hRYmxqa2RxZ2pUZXAyQ2Y3cmZyWnhy?=
 =?utf-8?B?R2dEb2VNa2hMZEpiOUFyVmhtMU15emE0SC9yemVUSm5VZlIvRzBESXJ1UE9z?=
 =?utf-8?B?MGdaKzJTUW5rSGE1ZTAxcWZ6ZEdOQ0hpVE55RXhyamp5c1QxMFZqaEhPd3Bi?=
 =?utf-8?B?MU5oOE1qU2dYNmFLWXhyS3lXV09jVGNRSVd4Y2F6ZUhzVVd6TG1jVEluNHBq?=
 =?utf-8?B?NUxZd29sc0RsazhIM2tOc1Y4OG9GWktoKzU5RURMVlhQd2RsajZ3blRzeDZG?=
 =?utf-8?B?OFMyYzJUOEVDd3dUNTZPbGdtMmVDd1dQd3JQYXhYcE85QU92QVpFcmx0Z0Rr?=
 =?utf-8?B?eFA0elY4dmgwWWh5YWdIdkxueFV1YXVaZ2svSi9ZQlZxV05YWWRqVm43ZW9r?=
 =?utf-8?B?TnhEaDhTQU1CZHBnMjZZOTlUa2JySnZsRWg3ODJramNGMHdja0RraGtSclJ4?=
 =?utf-8?B?QjI0TXd2MFZQMW9XK2w0anRRVUNCWmNrWEFsMFJpZXZpRS9VckpXdGd3dk9S?=
 =?utf-8?B?S3UvVGRXRzA1TmxORWxZQmhGYUk1ODhTK3ZjcER3WlZLNXNVVEVFdGVHSE1w?=
 =?utf-8?B?V3RxU2Z0cTJhY29KQkNlY3BaWEV4UVA5b1RESkRyYmFaTHJrd3RhRk4yWm5V?=
 =?utf-8?B?aXJhcFZhNWpUR3JBVENFdWJOMUZBUnNvekRreGtzaGFMWVFHUkhqVDZ1NkRx?=
 =?utf-8?B?eXRxOE0yU01kRDJCUFdkUzVCaG53WnNKbFhjb1ZTMTc0QnpiRHZDMEY4TFZU?=
 =?utf-8?B?VGxiVmpNM1F5WGVCRTVNd21NV2gwamRzSFpSS2lURTMyUHkvZ0g4NzlwQVhX?=
 =?utf-8?B?alI4VXphSHNUU3ZVd3dqaGxRamxrT25mVy9XNzZIMlNJMnBZZVQzTnB0SHlw?=
 =?utf-8?B?Q2VaaERxUkM2VktacXZNUXBqdHQ1NE1INU5xVzNhanJqbkorS0g1aE5KdHdZ?=
 =?utf-8?B?enM3Qm1Nd1pNblcxM3E3U2ZsNEgvYTM3K3lOelk5VkVnNUpoQ3ZnR3ZKNjlh?=
 =?utf-8?B?YTc2WFA0bGxjbXE2RlcwWEJXSU04bk5TOXU1cldQdDU2azBadXg5QVUzdVF5?=
 =?utf-8?B?OEliQ0xJbmpRNjU2ZW1uNUhYSmdNenQyQ0hCYWpXc044N1BYVjFXZ2lFcFVi?=
 =?utf-8?B?ZW94VmY3QTBnM3B2SjZXTE1NZTVGbEw0MFpCYVZ5WDVKUEZvV3BIdEpMamJa?=
 =?utf-8?B?bEVVa1pRMTBOUUdpYTFRWTVVVjkwY050aFA2ZVplaERpdXBMSHRsUG0yQ3F0?=
 =?utf-8?B?ME4xTEt1VzBpZVVZV3poUy9BV1hnQm50R1V6OE9teHgwaHFmZGdmME1nOXFW?=
 =?utf-8?B?NjFNaXJnQWhlV21WNmpJTmg3RnFVTjNqUXF6VzdhZXNUZjhNem04ZVUyUEdq?=
 =?utf-8?B?WHE1ekR3bFdKdTNjNHFWU2lSVlJRTUpiM3cyVU9hWitwTm1aT3kxR01Yc0ky?=
 =?utf-8?B?anBBc3JHVE1sTStPYWtFK3dDTk1SdzkzWUhpUFFSVEUwUzZxdXg5T21UcEov?=
 =?utf-8?B?SUJtYnIvRUhaeDB6cHl0WTF0eExxcU9hME9sblBRVVd5Y1dwdU8vbmhkZDRS?=
 =?utf-8?B?MUlVeWw4NituMjVuR05lbzhWNFMrMXYrckJrYm9RZ2RZNGZtZ0FjbkF2NVFQ?=
 =?utf-8?B?SkpiazZTWnFIencrREx6RmdlR2dHT3B2S2kvYURORldIczQzeWpoMFVvYzEz?=
 =?utf-8?Q?c/KLCCtfScoOv1d+NobCm8O8E?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b834a813-05b1-4e88-2ea9-08dbce446c35
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 12:35:47.2758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TKTROpKyXG1c+28e21RyRD1TDK5Q9jfrN95KCJuN75BwEcQ3V1nBKUjoHtlQoT5zMDkPXeK0WRUZjLLIahSFsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6988

On 06.10.2023 15:00, Roger Pau Monne wrote:
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -1580,6 +1580,10 @@ long do_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
>      {
>          struct vcpu_register_time_memory_area area;
>  
> +        rc = -ENOSYS;
> +        if ( 0 /* TODO: Dom's XENFEAT_vcpu_time_phys_area setting */ )
> +            break;
> +
>          rc = -EFAULT;
>          if ( copy_from_guest(&area.addr.p, arg, 1) )
>              break;
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -1998,6 +1998,10 @@ long common_vcpu_op(int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
>      {
>          struct vcpu_register_runstate_memory_area area;
>  
> +        rc = -ENOSYS;
> +        if ( 0 /* TODO: Dom's XENFEAT_runstate_phys_area setting */ )
> +            break;
> +
>          rc = -EFAULT;
>          if ( copy_from_guest(&area.addr.p, arg, 1) )
>              break;

ENOSYS is not correct here. EPERM, EACCES, or EOPNOTSUPP would all be more
correct.

> --- a/xen/common/kernel.c
> +++ b/xen/common/kernel.c
> @@ -607,7 +607,11 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          switch ( fi.submap_idx )
>          {
>          case 0:
> -            fi.submap = (1U << XENFEAT_memory_op_vnode_supported);
> +            fi.submap = (1U << XENFEAT_memory_op_vnode_supported) |
> +#ifdef CONFIG_X86
> +                        (1U << XENFEAT_vcpu_time_phys_area) |
> +#endif
> +                        (1U << XENFEAT_runstate_phys_area);

No provisions here for the "disabled for this domain" case?

Jan

