Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C09740E22
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jun 2023 12:06:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556395.868889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qES3a-0005um-Kj; Wed, 28 Jun 2023 10:05:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556395.868889; Wed, 28 Jun 2023 10:05:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qES3a-0005rv-Hp; Wed, 28 Jun 2023 10:05:50 +0000
Received: by outflank-mailman (input) for mailman id 556395;
 Wed, 28 Jun 2023 10:05:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NvKJ=CQ=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qES3Y-0005rp-Qn
 for xen-devel@lists.xenproject.org; Wed, 28 Jun 2023 10:05:48 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060b.outbound.protection.outlook.com
 [2a01:111:f400:7eab::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 586b9a29-159b-11ee-8611-37d641c3527e;
 Wed, 28 Jun 2023 12:05:45 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by PH7PR12MB9104.namprd12.prod.outlook.com (2603:10b6:510:2f3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 28 Jun
 2023 10:05:42 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54%2]) with mapi id 15.20.6521.026; Wed, 28 Jun 2023
 10:05:41 +0000
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
X-Inumbo-ID: 586b9a29-159b-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mqbUU7GLt583959hwrkRVMPxS+cv+j6CspCR4eiCSc/wOU6HuebeATu9OTmWEO6/ivci3k1KLHv1aonxhhtiFa/Um7tCan8kNdfGZb2Aatmdyh+6juqrKKKvaaD/oo2YHFkgLQVTejhSq7TTwfKRXCKQdsxhHIvqSEHPmv/m3CemHeUVdV7C44lQq4ColQNlvWLE1VitYzap+zzO49PTScXEqWV8fca7jzv0I23g5xSG8OVqTtmdfQ5ogmqdnmACmntAXile4Kcy0WPlv8DXQrFtsTLLX2NOouBMXXJUm1tjoNkwv60mOTm7ViCv4T92tHTpEpWmt3UqDw9cCnA57g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XZ4JW294WQfTWKK9eV1cDEOFkWdpPNaBi8DgSkdciYM=;
 b=h+ps7V9SrIUYcoV0yK+Q2afZWzGgpRGLMbKoI6q+pySZs4wmQ+dmLY4XGXjZQoXv0oWk8Zuj3EX1hjf/etqJz+k6Es+zeYWy53SIqAl11s2QZfofgrheRYbTMSvyahIBMkrH6gZOimi0sgkrwsPXMvXX+05+oV3v/ZiO1UhRdAhyesRC657aGVH98cpZqyiy1f9Me6u3SUhJS7a3tB4AFe10bMfajgFt9bxPgghddMR2nNdTWIgvLZEu6vV1INYrRpA6yACOZI9+AztYOzC3emcFsFaUNvsZ/S8XCtqccpNuBexL9tT5oEjmowL/FzT0f9z/iVOQNvX7ppre//OMuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XZ4JW294WQfTWKK9eV1cDEOFkWdpPNaBi8DgSkdciYM=;
 b=cJrgQZUJs947P3TXeK0sVZhYjZOdNai0OKWTiySbV3bw2bO5Zmzl0TgSIot836Rin1DNztGXDyyG/zsOjVum+bjBbjT+Xb9BBlq5PbLRVU444MBfaYDhwMsCgwmJvn90gyROfIMD8LXEQU4oQIm+V9sq11CHUveWCs374SxBEcU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <864e467d-2ad8-7210-ca59-a9e34b95bc81@amd.com>
Date: Wed, 28 Jun 2023 11:05:36 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 30/52] xen/mpu: populate a new region in Xen MPU
 mapping table
To: xen-devel@lists.xenproject.org
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-31-Penny.Zheng@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20230626033443.2943270-31-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0246.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::9) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|PH7PR12MB9104:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cf0259a-c5c2-40ef-033f-08db77bf3ae4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JeRUmKFQg1YrJaCYR1ziQt24AtUyCDMygGElZpW1IRDLruqIFm0FYBzdPZRiTZbgLiivwfzw3QUpRolkZuqmJMl4AYE5iv8S70MBR2pbjo/Iyy/TSfsJgM4wNyDfanzhvGD7PNJTc/qJGSJWqOyo+dCKR7ZpJ7IJIRuU53ybs7YxKW0gJjGFXF6bZNGdzMJjo0Y9+AB66PIL875hkajX/B1cOLGzHPr1q0Rqcfih3wJBJiMM/GPEcMVazedBtLEth71wstxZrR64I+h/OspgvtUYSNoxX9C237K57hAV7ue02G5ugi3d3Yi8G8Lb/in9Q4s62Pmjt0nZqkUZAGa0y/PgVv5etBp3FmlSFbuv/qA2Zp/wnSUOyLYF398jMHGqmwrJcgYpNfr8rDcdQ3i5O60/0QYTjOzj0VpCdbFkCOrNIZXblejvCEmpIePC9qpY8vPq7iQ1uBgbeCbPkiZnE4rCkvQOq8z3WkuQBho7JHiLLErY9AADdVLwU4MMFlhpC8NdhuZ+Ou1RxjXtohosLoDHx9KnZhMXmiAPC3L5eeLv3jeXx3QNfmXRoX8UEXNnG2e/F4I8HxUNUky4u51H2eUNcGhfWrw+uxaMJ8yDhIKXJvo7kIZOKjiukmOKkIcwDTOrxMrvsO3LTT4VrcGxxciE8IJW4HhXFoaUKmaraxgLzq8WGliBInLPo4VDaFkP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(396003)(136003)(376002)(346002)(451199021)(31686004)(36756003)(53546011)(6506007)(66476007)(5660300002)(316002)(6916009)(66556008)(41300700001)(8936002)(38100700002)(31696002)(66946007)(8676002)(6486002)(966005)(6512007)(2906002)(186003)(26005)(478600001)(83380400001)(6666004)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0VJNnNoc0tUeUxBRERNOUY3WXVoMTVSRkpYNGNwa1VJSmtRZ29uaThGbDlB?=
 =?utf-8?B?dTN0blV1UWJYeEE4aWdxMC93aGpuRWNUTmRuUzNHWk43NklBVkJYWkVxMEl1?=
 =?utf-8?B?ZmZ3U3lwc010ampNYVhlMFBUSkVIajR3ZFh6OXdLTWZQbkxuZVpBNkxMVnh1?=
 =?utf-8?B?QmdQOUJkaTljNDFqU2YwS2Y4a1M2UWxFdXBKOE45bThrMVE3MlRDQ1BtbVpI?=
 =?utf-8?B?OWNsSHlkT2lIaVVDTlh1NllRT29ZK0N0d0tKaXhFZzgrandrRGtxWGdvczVC?=
 =?utf-8?B?QTVTdkpnSmVsd0hwVjVNcHBaaFlWT25ldTZWTWJsMkRPakxHelFXWGc0RDg4?=
 =?utf-8?B?SUQvcTlBcXhGZmxRWjMvTUJWZ3d0aDE2WWVpK2tQdWw5K3lOc2pSaVZ2ZHdN?=
 =?utf-8?B?U0FjVjhabjRESTZZd2hzT0U3dlhtci9CeG1SRkRZR3NERFdtV0tnNEkxSkVN?=
 =?utf-8?B?eGt1WGpZSHZPT0p2Yjk4S3c1UmtKNjQyakt3aGMzQ2hlRTVyeEZxbzhhcXA5?=
 =?utf-8?B?M1kvS0Rud3Bab2ZoYTRMY1BEVGhTOXRpdXozTFJPTVRGY04rbUp0djh2d3ho?=
 =?utf-8?B?NWZ2OHJIbDdqSHFEdTZTcmhGZy9ES241YU54RVlsWVBIOFJEb3VEcU5LSkli?=
 =?utf-8?B?bDdCY20vS0NCRTBHQnErRXlKbllmTkoxWm5LUHNncTBLQVR2SEtaa2NqSzZY?=
 =?utf-8?B?S3NJQUlxQlVSQmJGVWxOcWRkUC9NTTVTMVJrdzZqUldBbHhwbUlHOTdTY0o5?=
 =?utf-8?B?enFyemNXQ1RWL3h6WVAvOUVNekdmcnUvczRybDZWcXg0Q0YvdS9xNDF3TlVH?=
 =?utf-8?B?M2R6ZzBwVmZ6OVFITWdYMmh3eHZheG9PK2FRSWd2RDYycmlBVXZ5VHgvMTNz?=
 =?utf-8?B?YUFDazR1T2FMTXZueS9qblc2eDlTRS8wSC9udUVvWmNBWkJTMnp4MkN2REN2?=
 =?utf-8?B?ZWRxSVp1Zi9HVGFWRnF5cmg1cnZraVR1T2V4RXRtbEpMandicU9wWUJpcE1x?=
 =?utf-8?B?ODlXQ1RTWGNHNWVPeUM1K2ZHK0tUK3BqNzZQdUhqVC9oc0tpcG16RTlJWnJG?=
 =?utf-8?B?ajNHQVgxcnowMStYcDVSMVJqbDljZEtkN3QveTZ0cVFNeXRsSEJUWkhqaURK?=
 =?utf-8?B?SFNKQzhOM0V0VEhqcXpYZklNd2hvSlpCU0hnZGUwQTJGWXZ6bURtY0phbkxy?=
 =?utf-8?B?b281dnVoU05RWDV6eWw3WU5oUzljbkZNVThlNlVwWTMyYWM1RHM5RUxrSEJw?=
 =?utf-8?B?SzFwQ0xKM3FhU0xQTzZZYk96SXBXQk83UUg2dGhKbmtyajE2ODg3eGdCRXhj?=
 =?utf-8?B?YndibDNFUVZqOTRHVVIvcDhRYm1abHZTNzZNQVZsR0k2dEJQekVqKzlpUml6?=
 =?utf-8?B?SGc3UCtpQkFTMTZ4L0J1UWFGWGl2YTk5cjJZVVJKOU9UNTRUSVBoYTlYZHZp?=
 =?utf-8?B?K3RhU2lMRUxTVlQ5TjBFUllBazJwSWVpOFJ3VTI2REhnL3JleCtqUmI5NWJM?=
 =?utf-8?B?NTNDTjlmcGw0U2pwQXdhQW1wVExIcUVaY01wNVl5Mlh2VTVWTWYwZi9LNExu?=
 =?utf-8?B?QjZiOCtvU3ZEU1ZucGRvcFVsUGc2T1BaazBFZXhFdW1KVWJqTG43cE02cHpl?=
 =?utf-8?B?K0xnTTZxYVR6czlZb0daQU1rOEdlWmtGeVlWejJVS2J4eUhpbDQ2TmVtTGU3?=
 =?utf-8?B?TGNveEZJWDM0WS8vS0tvQTNzMGFrUWdsNU11RGxwdVRlMjNFMjdkQ2xjd1Zk?=
 =?utf-8?B?akZ1eklMVWVhb2liMEphM1dJRHErQnVRQ01rTUhVb3dINVNjblJ4L2VTN2JY?=
 =?utf-8?B?S3YySHZqdlU0Njh3S0xGbTRjc0dQK3VJVlU4ZVhNL2lVL0dEalhYQVFvUWFW?=
 =?utf-8?B?eUJIWnpMUlRDM3BlU1RFWE83cUJ3NlNLb0ZsNElJOCtLeUtyQ2FtUGRyZ3VB?=
 =?utf-8?B?MVRYNEhldGVJUEtXUjhMSktZM3RUQTBKL0thT1ArY2x5ck53eDBEWlpBQ2tQ?=
 =?utf-8?B?djZmTGVEcmhacUxnT1h0T1czUlFhbXZydklTOFZXQ1BzRjhUTEg5VVJxeDR0?=
 =?utf-8?B?WG8yZk1ZOTgyVjJSTlQwSmlrM0ZVL200ZjN1U0VpMi9xMzd0NTVVNXh0UHE5?=
 =?utf-8?Q?FiGHJXMp7nxt6EgKc7E2N+/ge?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cf0259a-c5c2-40ef-033f-08db77bf3ae4
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 10:05:41.6895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dENd00krJ/mjR4bISJz32brZ2EczSXhy0KfeTbBDhoem998Z+lLj++WRFgg+LXE0O7bQtA0XYfsO777df89f0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9104

Hi Penny,

On 26/06/2023 04:34, Penny Zheng wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> The new helper xen_mpumap_update() is responsible for updating Xen MPU memory
> mapping table(xen_mpumap), including creating a new entry, updating
> or destroying an existing one. It is equivalent to xen_pt_update in MMU.
> This commit only talks about populating a new entry in Xen MPU memory mapping
> table(xen_mpumap). Others will be introduced in the following commits.
>
> When populating a new entry in Xen MPU memory mapping table(xen_mpumap),
> firstly, we shall check if requested address range [base, limit) is mapped.
> If not, we shall find a free slot in xen_mpumap to insert, based on bitmap
> xen_mpumap_mask, and use standard entry pr_of_xenaddr() to build up MPU memory
> region structure(pr_t)
> In the last, we set memory attribute and permission based on variable @flags.
>
> To summarize all region attributes in one variable @flags, layout of the
> flags is elaborated as follows:
> [0:2] Memory attribute Index
> [3:4] Execute Never
> [5:6] Access Permission
> [7]   Region Present
> Also, we provide a set of definitions(REGION_HYPERVISOR_RW, etc) that combine
> the memory attribute and permission for common combinations.
>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
> v3:
> - implement pr_set_base/pr_set_limit/region_is_valid using static
> inline.
> - define index uint8_t to limit its size
> - stay the same major entry map_pages_to_xen, then go different path
> in different context(xen_pt_update in MMU, and xen_mpumap_update in MPU)
> ---
>   xen/arch/arm/include/asm/arm64/mpu.h |  64 +++++++
>   xen/arch/arm/include/asm/mm.h        |   3 +
>   xen/arch/arm/include/asm/mpu/mm.h    |  16 ++
>   xen/arch/arm/include/asm/page.h      |  22 +++
>   xen/arch/arm/mm.c                    |  20 +++
>   xen/arch/arm/mmu/mm.c                |   9 +-
>   xen/arch/arm/mpu/mm.c                | 255 +++++++++++++++++++++++++++
>   7 files changed, 381 insertions(+), 8 deletions(-)
>   create mode 100644 xen/arch/arm/include/asm/mpu/mm.h
>
> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
> index 407fec66c9..a6b07bab02 100644
> --- a/xen/arch/arm/include/asm/arm64/mpu.h
> +++ b/xen/arch/arm/include/asm/arm64/mpu.h
> @@ -6,6 +6,10 @@
>   #ifndef __ARM64_MPU_H__
>   #define __ARM64_MPU_H__
>
> +#define MPU_REGION_SHIFT  6

You are using this macro in patch 24/52 and you are defining it here.

Please consider moving the definition to patch 24/52.

> +#define MPU_REGION_ALIGN  (_AC(1, UL) << MPU_REGION_SHIFT)
> +#define MPU_REGION_MASK   (~(MPU_REGION_ALIGN - 1))
> +
>   /*
>    * MPUIR_EL2.Region identifies the number of regions supported by the EL2 MPU.
>    * It is a 8-bit field, so 255 MPU memory regions at most.
> @@ -21,8 +25,33 @@
>   #define REGION_UART_SEL            0x07
>   #define MPUIR_REGION_MASK          ((_AC(1, UL) << 8) - 1)
>
> +/* Access permission attributes. */
> +/* Read/Write at EL2, No Access at EL1/EL0. */
> +#define AP_RW_EL2 0x0
> +/* Read/Write at EL2/EL1/EL0 all levels. */
> +#define AP_RW_ALL 0x1
> +/* Read-only at EL2, No Access at EL1/EL0. */
> +#define AP_RO_EL2 0x2
> +/* Read-only at EL2/EL1/EL0 all levels. */
> +#define AP_RO_ALL 0x3
> +
> +/*
> + * Excute never.
> + * Stage 1 EL2 translation regime.
> + * XN[1] determines whether execution of the instruction fetched from the MPU
> + * memory region is permitted.
> + * Stage 2 EL1/EL0 translation regime.
> + * XN[0] determines whether execution of the instruction fetched from the MPU
> + * memory region is permitted.
> + */
> +#define XN_DISABLED    0x0
> +#define XN_P2M_ENABLED 0x1
> +#define XN_ENABLED     0x2
> +
>   #ifndef __ASSEMBLY__
>
> +#define INVALID_REGION_IDX 0xff
> +
>   /* Protection Region Base Address Register */
>   typedef union {
>       struct __packed {
> @@ -54,6 +83,41 @@ typedef struct {
>       prlar_t prlar;
>   } pr_t;
>
> +/* Access to set base address of MPU protection region(pr_t). */
> +static inline void pr_set_base(pr_t *pr, paddr_t base)
> +{
> +    pr->prbar.reg.base = (base >> MPU_REGION_SHIFT);
> +}
> +
> +/* Access to set limit address of MPU protection region(pr_t). */
> +static inline void pr_set_limit(pr_t *pr, paddr_t limit)
> +{
> +    pr->prlar.reg.limit = (limit >> MPU_REGION_SHIFT);
> +}
> +
> +/*
> + * Access to get base address of MPU protection region(pr_t).
> + * The base address shall be zero extended.
> + */
> +static inline paddr_t pr_get_base(pr_t *pr)
> +{
> +    return (paddr_t)(pr->prbar.reg.base << MPU_REGION_SHIFT);
> +}
> +
> +/*
> + * Access to get limit address of MPU protection region(pr_t).
> + * The limit address shall be concatenated with 0x3f.
> + */
> +static inline paddr_t pr_get_limit(pr_t *pr)
> +{
> +    return (paddr_t)((pr->prlar.reg.limit << MPU_REGION_SHIFT) | ~MPU_REGION_MASK);
> +}
> +
> +static inline bool region_is_valid(pr_t *pr)
> +{
> +    return pr->prlar.reg.en;
> +}

A lot of these macros and inlines can be reused on arm32 as well. I have 
split them as follows :-

Refer 
https://github.com/Xilinx/xen/blob/xlnx_rebase_4.17/xen/arch/arm_mpu/include/asm/armv8r/mpu.h 
for the common definitions.

Refer 
https://github.com/Xilinx/xen/blob/xlnx_rebase_4.17/xen/arch/arm_mpu/include/asm/armv8r/arm64/mpu.h 
for the 64 bit specific definitions

Refer 
https://github.com/Xilinx/xen/blob/xlnx_rebase_4.17/xen/arch/arm_mpu/include/asm/armv8r/arm32/mpu.h 
for the 32 bit specific definitions (This I can add later as part of R52 
port).

Please consider splitting the definitions so that R52 can reuse the 
common ones.

- Ayan


