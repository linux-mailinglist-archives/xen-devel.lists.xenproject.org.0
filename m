Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FAE567813B
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 17:19:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483122.749078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJzXe-00052U-GR; Mon, 23 Jan 2023 16:19:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483122.749078; Mon, 23 Jan 2023 16:19:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJzXe-00050I-Cv; Mon, 23 Jan 2023 16:19:30 +0000
Received: by outflank-mailman (input) for mailman id 483122;
 Mon, 23 Jan 2023 16:19:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ozL9=5U=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pJzXd-00050A-15
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 16:19:29 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2052.outbound.protection.outlook.com [40.107.94.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3fe0745-9b39-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 17:19:26 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by PH7PR12MB7872.namprd12.prod.outlook.com (2603:10b6:510:27c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 16:19:21 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::a3a7:87d9:60f1:7eb1]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::a3a7:87d9:60f1:7eb1%6]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 16:19:21 +0000
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
X-Inumbo-ID: b3fe0745-9b39-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XLl1hhzrdkOrAcp5CdZUUvhuYKzJINJu5W4HXtn7uB/KLLV/MeYDErOBCMP0+APdhECul4+JNgtv/2/7dhMldtagS1CEwY/Qs/FnoTt2OkNMG5+kFKLd2xhfNgGlXoiAoqvZ+UfdeFxlnEJsupmA6+lO8kLqcA+XcqMMnuF+otxvi5KTgPFxBwN7tSiYvpuP23Fx5cvOvSdzs/6Ejt8WEY2FVnScoFCwxVFx7XRfLNSOvppFPFCcXZ5JLVfSRvmM/lwvRNA1nCUUKt4BTSP6MhET9SseKUvUQE/YGbU0Y4s+v8E8I7bfdI3V1i0f62i36s6h1djesyeCdagtxD+B0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tvNECinNMrwsoAscmZNEWlFVo+vNPFVGMSqcjQG2k90=;
 b=P3L/bTse6N7zSoQOHqYhzfbDyEZTByUmrqz4ihxtsjU+5RyPJ4M5vepqZwgAXv33oxDOrkUsnpkVfaWx4AnqCoh5/E9J+ZhfQfQI6yhKhCc5my0ogeeKZ/sUP8FYnHTivevu283lSVj2t5ONaxy1B753fVCzWIvU3RaqD8d2951y3FdpPsUs00H1ql3d9SEFJUAhvOt7SYGlvSiAvmJwEnVfVyS14f4VS4JdsJr4Go3xRU6c+0WxHcthQCEthcL9/96dW0J9E0EntZOGZhrh18qXD90myC4/RDfgH3ChVw7cXAp96Dcg4YUVfBLnD3szUyhqP2VkI7oii9beuUGS7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tvNECinNMrwsoAscmZNEWlFVo+vNPFVGMSqcjQG2k90=;
 b=Eq+CqfbbwS+58HDj2uB9He8ATi2sOfdZt/Q2ACXC2hpBz1slRt6sMz3Y0n7x2/nyCV+JKWfCaedCxG6/O6irwnhSXbmudYgP0WxyaUEBvGLBS3cnQbEr1z9EG9SJx8yvynD/Ly540INVy5YiEgTInERjSBApnPuUorbLZ7/7F5A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <efda7e8c-165d-43dc-4728-f89fa4e636da@amd.com>
Date: Mon, 23 Jan 2023 16:19:15 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3 01/18] xen/arm64: flushtlb: Reduce scope of barrier for
 local TLB flush
To: xen-devel@lists.xenproject.org
References: <20221212095523.52683-1-julien@xen.org>
 <20221212095523.52683-2-julien@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20221212095523.52683-2-julien@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P123CA0017.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::22) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|PH7PR12MB7872:EE_
X-MS-Office365-Filtering-Correlation-Id: 1418c9cc-45ca-4cc3-4d16-08dafd5d959b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QlW/SSk4sSCuu9/6RTZ6HtarBRcKo+geQksk6eyXBYxuxEGhCt/RsWB/Uh2Cm7nOoejDIRvJbh4tbHmdvTBVTu00Rg/SnGIGxHs9tDaDLjzzVpVJ0Wx0SgE/Z7p2xst5Et40QKemlR3xbtYLU/0hFArqc5hHI742FlGOJ/5MKTJGxWlBbi5ulGflid2oKaoJoNQS1X/gDN9bHWICJ0DTG6zDlHcfYlGLjv0lUuWmrENE0H9+gBTRPCgfwfzfDlsK/DpgWi+Ue4KUDZjfatDYQBAaeP11/DQjA1wPX73B8oPGLPOeeJVPDquDWpllyZYgS2hLTKLXVzghKVXc0Pd02YAueINoBxl8HWODpMcd8LqaVavQ3Uh4jeWND+bd2XL6S4MLvnUe/qtrbNFp2Y4RjTZP9zGIYOkKlfs69i8HxkbixogKW1NWh/16jID3TZ9SBLPgkrUStjvH00ALGPGfLDn5Zs8drl+XdGL+ZU23ianzJUywTT8LC04VYeWVFA8p4qN79d9Q4j5+nehgG1KYqaP78wExdVcuRFS5Xbn2O144/fh3HEUYcGYj9+2komGddFZddLjEx3YUyqfpEs3WyvUOeS2f9x/Q6I1G6x1xxD+o142C8sSUasH79+QrDU51m/VRvRrOZds5HQWYL4LEG/+Iktn/Buyt1XsX5vPibhrw41tF3Z6PfAQNs0g179yBOaEbPzmXqmKTbRRYXNEdTf/h6QbuGmxRENG2RDlTzj1dxMV12M7zWNH0NdZCx4PQr6JgiPoWS60OjHpBJ4pabQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(39860400002)(396003)(366004)(451199015)(36756003)(31696002)(41300700001)(5660300002)(8936002)(2906002)(83380400001)(38100700002)(478600001)(6486002)(31686004)(6916009)(26005)(8676002)(53546011)(186003)(6512007)(6506007)(316002)(2616005)(66946007)(6666004)(66476007)(66556008)(43740500002)(45980500001)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L204UWwzVGc0UTZDZU9rdUp5WnR5NUZaai9FcmhUN2NMUlFhdTV2aE8rNG9v?=
 =?utf-8?B?UW9TOGZHSkd2S2Q5NUxOL2lReDZIcG1rZ3NUYlAzQ0FsTmg2N0F5d2duajFj?=
 =?utf-8?B?K0NlRk9PRlR0ekhyT0tVT3JpTXo2bVJPblh4TEJldU96WmIxSEFTQ1lSc2My?=
 =?utf-8?B?L0VEYkY0TUExTEF6QWtxQXJsd1hYL3RSNTFnYnNaZVQxVWc0ekNZWGM3RFhC?=
 =?utf-8?B?SEZKNVhNRmRzMUc0ZjBmTU5YNGg1ditBcDdnSFJOdEoxaW00bjF5MjNncEw5?=
 =?utf-8?B?SEFUWWN1aUJZRWwzcnFzbjVZQnJsNGNZbEtJSXpqcjlZeU10U1F1cTJWc3JP?=
 =?utf-8?B?ZTdsZU1ZQjB1Y2ZDOWU5U2luNTZadXUzdFdiSG5DNVVFQnJ2VnBJek9qRUY3?=
 =?utf-8?B?RlRaRmpQZEtzTkFya0lQRmF0bWJrNW02NlpXQW9jMU9EbHRsMWNMd09XbzR0?=
 =?utf-8?B?R2NjYU5PcDVPeFhTOW1mMGVvczhBa09sZnpMRFZLQ0tUb3N0Nzh6TDVDZTda?=
 =?utf-8?B?MnNwZDZxVjQ0N1MzRTJBMDhGYXN0NjNXQ3oxVGZlUWlIOVhlVzNVelFFdUNV?=
 =?utf-8?B?RzR2OUdjayszQVJNdkZZVmF2OVJkOTg4SDBYRDNwMzJtUUtvRFhkOXFlZzdV?=
 =?utf-8?B?U1Y3VkxMSTNoTXZnQk1HYjZyeGMrZ2VXSEQ0TVc1UVJhY2YrOGdqRWRxNkdP?=
 =?utf-8?B?U3ZtQmlhU2JNcU8rSitkRkt4cnhyblQzVVI2T2JxME1kQWpZTWlXVFVaaCsz?=
 =?utf-8?B?VStJV2hLeVdKcFJQbllxeVlpNHI1OGdEc1N3aVZ5VXBrU3N6OTVPWmsyRkh1?=
 =?utf-8?B?TzVpQnp5MFZGWmpsSmNkNktlTEdUSUNtUjFqL09Oc0VoNXBTUGQ4WG1yZmVl?=
 =?utf-8?B?M0Q5ZVliWEIzcjJWZWI1ckpBRkRkMTJHdUFYRW5CYWpSNHhMNGw2eVdKTTZj?=
 =?utf-8?B?VG9BcDVVRk9TSzhuK2xZZi9ydkZ3dFJ1NTNGVVhDWitWT2U5WFBCb04ycDNZ?=
 =?utf-8?B?RjdUQ04ycHAwR0d4dVpnZ0VtSXhwc1R0dzNoQXhIWlhJem9oemh1MUV2VmlU?=
 =?utf-8?B?M2JDOGtkUmFIdWNXOGZYOW1NalJpL25lUFExSmQ4VldzalNEa3RUUzVuMFRD?=
 =?utf-8?B?VVBFQXZJUXkvT1ZrRHpOUGRUZnF2aVpySWlBeXhYVXVqczkzN3pMdlFDdmxj?=
 =?utf-8?B?eXkzWmd0WDNmTjVOS0JKQlgwWU9IQkdaTXJUR1VuOVEzWERNQTBsTkRRTFpN?=
 =?utf-8?B?ZWFYU3JNdG1oZGo0ZHhlb2FkQ2ZmcE4rRnRBQzhpZVJveXRWek5SRGcwWVFZ?=
 =?utf-8?B?OFZxVUpXMnBoOW9RMGRVTWRDMlAxNStTdmFpYWtSZkVHcHlINDhaamcxRXdl?=
 =?utf-8?B?d0RKeHZpbWtnRnR4Rm5CeHhWSVpiSlg2RWFtYkUwVnBVVWppaXZxRFI4MDRC?=
 =?utf-8?B?S2ZqdG8wQlFqbXMzUWxSUUNCcVdLR2t0aUFtRm8xMGlUc1VKK3NETGgzRW1y?=
 =?utf-8?B?Y1dETWhWNUludktKdUpjK3JGMDdZeWlvS0FIMmZKRHl5OGc4QnE5bHBxZ2I1?=
 =?utf-8?B?WUZhaExUekVRVXJMdkNoZXdkQ2RIVlpSb1Q4bEFCMXBFMkFHbFJqVUpGaUMw?=
 =?utf-8?B?a2ZCVXZtOG0ySFJDeUJMYm1ERldYQ0FlSXMxa2ZqRE9qaFIvK2YvcW84M1Zo?=
 =?utf-8?B?SzBXcStFQ21jKzFSaDVrSDRya2NVVUVvUVpaV0lob3F5OFJlUll3NHBqamcr?=
 =?utf-8?B?MjJWdlp6YzFwMm9Zd3ZhZnNWOFpYSU5yRFMyZDFDQmNWbzl4WWwzLzRKQ1R2?=
 =?utf-8?B?TUdvd3ZDSWRieEh0cTRvY2I0YUV0a09LR1ZEbkpZNTF2bU9SMXhsSWZ1V0dR?=
 =?utf-8?B?VUV3OUlXcXJRRXlaVjJNQ3QwWko2Z2EvVnNkdldkNUNnZG4rSVUrQ1hMSWl6?=
 =?utf-8?B?YXhzOU5GSUwvcWgyVVNQRzREb2tMcXU0R3JjL1FkUjZpSFdabmVGaHloRHZm?=
 =?utf-8?B?UWlFZmV5NEFUcmZHSm1qVitoTU0vUDlzWHFKN2RVajd0ajluT1RvQnVQYndy?=
 =?utf-8?B?cU9aSGJzZ3FxNmtQNHRWckU0Ylo2Y25PTXprbWl0dXJwdStyUWxXYWF4RGFY?=
 =?utf-8?Q?YnF3A+56UoB4KxqEMbnZQ2gfb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1418c9cc-45ca-4cc3-4d16-08dafd5d959b
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 16:19:21.2302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b3VPpXo3W1eHM+PLGMZkJFrXpv+zM4v3+n5j6j47Mgwv7GTw+0o3P9WfgpRE/oosaFdVQbz48dqdZCWjqQnDoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7872


On 12/12/2022 09:55, Julien Grall wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> From: Julien Grall <jgrall@amazon.com>
>
> Per D5-4929 in ARM DDI 0487H.a:
> "A DSB NSH is sufficient to ensure completion of TLB maintenance
>   instructions that apply to a single PE. A DSB ISH is sufficient to
>   ensure completion of TLB maintenance instructions that apply to PEs
>   in the same Inner Shareable domain.
> "
>
> This means barrier after local TLB flushes could be reduced to
> non-shareable.
>
> Note that the scope of the barrier in the workaround has not been
> changed because Linux v6.1-rc8 is also using 'ish' and I couldn't
> find anything in the Neoverse N1 suggesting that a 'nsh' would
> be sufficient.
>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
>
> ---
>
>      I have used an older version of the Arm Arm because the explanation
>      in the latest (ARM DDI 0487I.a) is less obvious. I reckon the paragraph
>      about DSB in D8.13.8 is missing the shareability. But this is implied
>      in B2.3.11:
>
>      "If the required access types of the DSB is reads and writes, the
>       following instructions issued by PEe before the DSB are complete for
>       the required shareability domain:
>
>       [...]
>
>       — All TLB maintenance instructions.
>      "
>
>      Changes in v3:
>          - Patch added
> ---
>   xen/arch/arm/include/asm/arm64/flushtlb.h | 27 ++++++++++++++---------
>   1 file changed, 16 insertions(+), 11 deletions(-)
>
> diff --git a/xen/arch/arm/include/asm/arm64/flushtlb.h b/xen/arch/arm/include/asm/arm64/flushtlb.h
> index 7c5431518741..39d429ace552 100644
> --- a/xen/arch/arm/include/asm/arm64/flushtlb.h
> +++ b/xen/arch/arm/include/asm/arm64/flushtlb.h
> @@ -12,8 +12,9 @@
>    * ARM64_WORKAROUND_REPEAT_TLBI:
>    * Modification of the translation table for a virtual address might lead to
>    * read-after-read ordering violation.
> - * The workaround repeats TLBI+DSB operation for all the TLB flush operations.
> - * While this is stricly not necessary, we don't want to take any risk.
> + * The workaround repeats TLBI+DSB ISH operation for all the TLB flush
> + * operations. While this is stricly not necessary, we don't want to
> + * take any risk.
>    *
>    * For Xen page-tables the ISB will discard any instructions fetched
>    * from the old mappings.
> @@ -21,38 +22,42 @@
>    * For the Stage-2 page-tables the ISB ensures the completion of the DSB
>    * (and therefore the TLB invalidation) before continuing. So we know
>    * the TLBs cannot contain an entry for a mapping we may have removed.
> + *
> + * Note that for local TLB flush, using non-shareable (nsh) is sufficient
> + * (see D5-4929 in ARM DDI 0487H.a). Althougth, the memory barrier in
> + * for the workaround is left as inner-shareable to match with Linux.

Nit:- It might be good to mention the Linux commit id.

>    */
> -#define TLB_HELPER(name, tlbop)                  \
> +#define TLB_HELPER(name, tlbop, sh)              \
>   static inline void name(void)                    \
>   {                                                \
>       asm volatile(                                \
> -        "dsb  ishst;"                            \
> +        "dsb  "  # sh  "st;"                     \
>           "tlbi "  # tlbop  ";"                    \
>           ALTERNATIVE(                             \
>               "nop; nop;",                         \
> -            "dsb  ish;"                          \
> +            "dsb  "  # sh  ";"                   \
>               "tlbi "  # tlbop  ";",               \
>               ARM64_WORKAROUND_REPEAT_TLBI,        \
>               CONFIG_ARM64_WORKAROUND_REPEAT_TLBI) \
> -        "dsb  ish;"                              \
> +        "dsb  "  # sh  ";"                       \
>           "isb;"                                   \
>           : : : "memory");                         \
>   }
>
>   /* Flush local TLBs, current VMID only. */
> -TLB_HELPER(flush_guest_tlb_local, vmalls12e1);
> +TLB_HELPER(flush_guest_tlb_local, vmalls12e1, nsh);
>
>   /* Flush innershareable TLBs, current VMID only */
> -TLB_HELPER(flush_guest_tlb, vmalls12e1is);
> +TLB_HELPER(flush_guest_tlb, vmalls12e1is, ish);
>
>   /* Flush local TLBs, all VMIDs, non-hypervisor mode */
> -TLB_HELPER(flush_all_guests_tlb_local, alle1);
> +TLB_HELPER(flush_all_guests_tlb_local, alle1, nsh);
>
>   /* Flush innershareable TLBs, all VMIDs, non-hypervisor mode */
> -TLB_HELPER(flush_all_guests_tlb, alle1is);
> +TLB_HELPER(flush_all_guests_tlb, alle1is, ish);
>
>   /* Flush all hypervisor mappings from the TLB of the local processor. */
> -TLB_HELPER(flush_xen_tlb_local, alle2);
> +TLB_HELPER(flush_xen_tlb_local, alle2, nsh);
>
>   /* Flush TLB of local processor for address va. */
>   static inline void  __flush_xen_tlb_one_local(vaddr_t va)
> --
> 2.38.1
Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>

