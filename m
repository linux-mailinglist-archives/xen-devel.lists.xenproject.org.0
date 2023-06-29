Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 265C47427ED
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 16:06:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556841.869653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEsH7-0002Mg-5N; Thu, 29 Jun 2023 14:05:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556841.869653; Thu, 29 Jun 2023 14:05:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEsH7-0002KL-2E; Thu, 29 Jun 2023 14:05:33 +0000
Received: by outflank-mailman (input) for mailman id 556841;
 Thu, 29 Jun 2023 14:05:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1sCV=CR=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qEsH5-0002KF-1G
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 14:05:31 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060b.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff7e527f-1685-11ee-b237-6b7b168915f2;
 Thu, 29 Jun 2023 16:05:27 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by BY5PR12MB4130.namprd12.prod.outlook.com (2603:10b6:a03:20b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Thu, 29 Jun
 2023 14:05:24 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54%2]) with mapi id 15.20.6521.026; Thu, 29 Jun 2023
 14:05:23 +0000
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
X-Inumbo-ID: ff7e527f-1685-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CWreyuQ3ASfMuohULMO+t/4t+RHl8bdHRSQrjLtIOt+V/DxGHywr4r23o3DPtZAGQuxIMzHSepC3yorgyakQ3IqGStBwlMlNThlX5iFpf6rHy3hBiFR5EyjFmvEEm11jKV67hmrNQQKSLa9Vkg/gjwrQYv76XuP5/jTgZrmQBQuO2rC1TQzFsh7Yt6rOsPL+ejnoD+h9a3tk/7HfzLNB4NJml+bvpXf+dLbEcLGM5pox5T+fOq7E4hYrEyJ/B+qdgFY2FDCjAQkdpBIzWg60tvj848c5y98HSq+b43Z6IPLDMIXemEXCpXRUx0werO8q/wsII7oxVtFW1WeI5hKtGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zt8lcMqiKIcp6RNIllhvdZc5q+g8NSj5+14zylrTtX4=;
 b=E+wnU/hnEkPEven8HFL7KUllfHhShDUf9F4ifEFzmAtBwu+XwgFwkYytvBWTalWcB//gNK/nv0DC/1XM+nvtbOqZJGkx2+3JqNSCvGPMT1D50FUNc6E3JRxnMrGuCI+H55u4fZkdZ9tUuhICdUzwVx1+CQfmJJHRu/vY5wlzPNWswfF95MwGbEUhavQJADc0D+/ALOXHNjSo02b5rjDjKl38Tsla5uoZsqxmZrqG+AFi5yYu/3Ez0HgbX56ZiN45Soap12EhnSvtE95w6zeHNaeTqFIEt32bKPZTn3fCTmlY4kHFcF1NO8dTK3o/LhCDfsJneO2ZTHjkb7nRgy1HKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zt8lcMqiKIcp6RNIllhvdZc5q+g8NSj5+14zylrTtX4=;
 b=XXoea7RtDWGEgxfRwSS92UfZ5W8xNLITNPu4ceY7emXGsFe4tLT/HyugfLcJCN6LNH4PIKkGi+w+m8ks2u7NCvrglbKsWGX1C1mI4Vl5/slpGdcIe0h7oifcMBAMNwIeXZCrBzGH0Dy44sjmAltJ3agJcCF6faaq104IFX4/vQU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <ba80b734-fb18-49ee-a5b6-1c69ae5a811b@amd.com>
Date: Thu, 29 Jun 2023 15:05:18 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 27/52] xen/mpu: introduce setup_mm_mappings
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-28-Penny.Zheng@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20230626033443.2943270-28-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P265CA0026.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::16) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|BY5PR12MB4130:EE_
X-MS-Office365-Filtering-Correlation-Id: eb112f7f-585f-4dcb-a2e3-08db78a9e1b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bKJSCjEehposZyFvdjTU9Ge/FBMWQMeCyTQcRdTmtgdSSMpRIYG0q11idOTBcI327DhDsQ02bvpjcxexUuv9PNgBBfAaaZ04M363kxAMdee/eHh/RdhhzPQWKGP7Nqv/LNP79wGOtikPVsvtyTK+s85cpqn09WYuPMpctD7ueVDC9D4rcSI5BUQc9N3O9qs6dREYqoC8jPMd5zrbD1QuXNnVwOBLt/aafz2y/UZofmMK/FwzM/EjprUjW8BK4pJZ+eAKtV6FgnfLnf2zZ/agDzDbgBx6Y/wbuwT7RAg0tMH+BFjnx6PFOzL2uhl/IA1HF9TyNIkHaEoFmlmK8YKZckCcBiLKS04Ce4HTOMRfuo50NHb0tavKl6PeYumBcoi2hNSWG5QZMiV7yskO1ckUfPpKRHNHpVKVRJ9Lg+2lygqR9CvmUxSDRgNB54xs/q3A2n9E0gzLYu2oF4fC/bFzaasmwujOddj517DDpwdbhZRsNe5R9f8AQIPi5thbXkAPMkKgokjnZi7ZkvKDCtpDl/XSWLtJL0uXG75/H4NETfNz2hqr1M/SLJU97lwpNLGonTRh8x7gK9nbHk1eWxEd5VS+odXuBrpSdMs9BxldWz2AHMc+yX82qCh4LuOnSJuX+ZotNGeHTB4LZT816sYy+A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(136003)(396003)(346002)(39860400002)(451199021)(316002)(8676002)(66946007)(66476007)(6512007)(6506007)(186003)(4326008)(53546011)(26005)(8936002)(6486002)(54906003)(41300700001)(6666004)(66556008)(5660300002)(2906002)(2616005)(478600001)(38100700002)(31696002)(31686004)(36756003)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkVMMXBsT3ZJdDJNR2ZBSmlJZ3V4NVdQa0VaclZEbDIxbVhDYmZ4Wlg1enpH?=
 =?utf-8?B?di9hY1BacGtyTnVMK0VYRUpNd2xveTk5ZlRXWW4yQlowMjZ3UzBZNHBZeGdO?=
 =?utf-8?B?cHNiNStQN3FSQi8rL1Uvc1VLdzlzdjhoTjZpNU1TclVHd2IreHNNRFRtbHFB?=
 =?utf-8?B?V1RVT1p1ZitGY2hXVUgwNW5vTng3dGRjeFBRYzdjc0gzbXAydmJrYWxkN0ky?=
 =?utf-8?B?ekR3NCsxOVhtRFF5Sk55cGp1cU5JcXpiV0FXQVZoM05XT1ZPeC9taGRIajR3?=
 =?utf-8?B?UlY4ZEJkbTFoYU9XRTI5ZU9BRWgrSitBU1QyK2lNZkZoTEdGdXZ6NDhuMkJi?=
 =?utf-8?B?bXlZZS9mV0FxR1FqSmxZRlg0MC9qN0xySkhPc1M5eStzbVRnWG96SE00K29D?=
 =?utf-8?B?alZrbTlJSW1aOElPYnowdDJSdlEwcEpkRE02TDE4UjVVZFRwRkRaaVIrL0R6?=
 =?utf-8?B?MXpKaFBXbFJWTGo3Q3M3UkhmR05KTE1kRG91bTI3cGhXVmE5eVEvZWFYYU56?=
 =?utf-8?B?cloyUmV2aVl6bkRvazBFaFhjbThTOVdjZEIvUFUxemFyWXpsdnV4RzhDMDVB?=
 =?utf-8?B?bHBqSFljWVd6SzZUR0ZSVnNFeWhEMDVqQUVtV3lIWVpScE9BbDZZNzVVd3BQ?=
 =?utf-8?B?MjF1djV5dkZYNHdhTTRkcEVBSlJKV0FRSHNrOVVkNnowSlgxYkFtQmJTRjZK?=
 =?utf-8?B?alBNTE9mT2l6UStKaVFvZ0ZKVkZjTWhSa1BjU1Y4VzM3aE5PQ2cvZE40Mm5N?=
 =?utf-8?B?VDdwYVlRM2UwNzF5YjB5ZHc0cGJLK1ltdEdDYUdWWTNBbkM5VXQwYk9DS3k4?=
 =?utf-8?B?LzdQVWFpd0pOOE1wSG5KaVVIVWh4Y0RUdFVSb24ydFpmQyttM1BZRjlNa00w?=
 =?utf-8?B?dnV2VTVna050U2VXV2lSNHh0WWh5YmEvc0lSbDNGbUhmb284R205ME1RU2I1?=
 =?utf-8?B?YWZSOXVicm1LNG5VOTMraTdBM3M5WWxucisySGhscUNrd0g3bjZyN3l3RDJE?=
 =?utf-8?B?ejBCTWRSNnlQZVJYOTR6TEVhWVVyejBWTWgzSzBZeVl5Uzl6N09qaEZSUkZ5?=
 =?utf-8?B?cUpYTjhoWVBBdE9leHZ4d2trbzhpV1lORXZ3ZW50YjJxbnVGQkdTak9IZ0d6?=
 =?utf-8?B?d0ZnZlRlM2M0QjZXRWRUTi9VWm9sb1FJZFEra0hOVmhrekVobDl1Tit5dXVu?=
 =?utf-8?B?WHlxK2lsRmlvZjlGWVloVHJJWGU5K0JIQ2pnU1RZZjBSVXBleEFRWllKbXpD?=
 =?utf-8?B?TnBubjFQNUZ6UHZkQS9IMk1YWkdXcHJzbVY2dVVEcks4YWE3cTNVcHNCU0Jq?=
 =?utf-8?B?NkxTQnVEbzZKL3RRZlFQakJuY2gvZlBsNmphUXhLZzBsRmpYRWs3WEhUNWZF?=
 =?utf-8?B?djVjQ01HMjNXVm1pQ09ZajRIZ3BtN0hwSFR3YWorOGE1b2dibVJVbGZzMjdU?=
 =?utf-8?B?R2l4UUpzSUgvWW1pOE9oNmZsWnpVOCswNGdFRjg2ZzNueEtEWjJHc2hPZmhF?=
 =?utf-8?B?RHI0ei9ZUUdBOVpkQmJWSXZmMkFYNDk3TFVqWnQzYmdJZjVqaDVXTTNZZ0g1?=
 =?utf-8?B?UkQ5N09UL1ptRnhkTUM4M1plUFQzaExBLzVTODBld1NrdEJTVjQyTGdlTENI?=
 =?utf-8?B?WkVrUjdXVStzbmpQSGZqaE1SN2UzK3Npa3ZJZFBMSXZIVS9MTjRLUU9EZlVj?=
 =?utf-8?B?c3JTOEJHT21KNUpSWHYzdFoxQTRiQS9IYklFbmxNV3hJelRMdkJNNzQ2SU5U?=
 =?utf-8?B?dWt0OExwRTAvMXF4SER3eWtnVU9yc1JhNU9iSUVGWFpqaTJoNHN4UG84VWEx?=
 =?utf-8?B?cTNJV0hSWlIrNDdnWFlHUFg0VDc2RXEwTksvcHhYVlhDdi9SMDN0a0ZuTHRM?=
 =?utf-8?B?QWtXcWU5Wk5QcWlPd0Y4aW1RdlNjZ0N2czZrdnQrRXVrc2pTVDIvSm1aTXBN?=
 =?utf-8?B?TER4cEhsalUyZEdYM2h0Nmtxb0FzcUJuQkxPZmRVQUc0Slg1SXdEbHVOTEVl?=
 =?utf-8?B?YzRsUkdSZEhuam1sbWttUWpOcnNrZTRKd25rZWlDVk9QMzdNakxuajFSWXV1?=
 =?utf-8?B?UytPZmZUY1ovVWdNR3lDZndrc3JNZVp2b0hjTzRickhtQWxPaHh5eHZOV050?=
 =?utf-8?Q?lYXDPALAjhXVSafk9Ka8XQlhB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb112f7f-585f-4dcb-a2e3-08db78a9e1b7
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 14:05:23.7943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lIuj3I2eevSoPHySG3rZuxq07IU6vJmRz+DtXueHGBYRyQLhKettb9/gXWf+r1LYFK5nfo0hoWuvFoBTiS5qNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4130

Hi Penny,

On 26/06/2023 04:34, Penny Zheng wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> Function setup_pagetables is responsible for boot-time pagetable setup
> in MMU system at C world.
> In MPU system, as we have already built up start-of-day Xen MPU memory
> region mapping in assembly boot-time, here we only need to do a few
> memory management data initializtion, including reading the number of
> maximum MPU regions supported by the EL2 MPU, and setting the according
> bitfield for regions enabled in assembly boot-time, in bitmap xen_mpumap_mask.
> This bitmap xen_mpumap_mask is responsible for recording the usage of EL2 MPU
> memory regions.
>
> In order to keep only one codeflow in arm/setup.c, setup_mm_mappings
> , with a more generic name, is introduced to replace setup_pagetables.
>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
> v3:
> - introduce bitmap xen_mpumap_mask for dynamic allocation on MPU regions
> ---
>   xen/arch/arm/include/asm/arm64/mpu.h     |  1 +
>   xen/arch/arm/include/asm/arm64/sysregs.h |  3 +++
>   xen/arch/arm/include/asm/mm.h            |  4 ++--
>   xen/arch/arm/mmu/mm.c                    |  7 +++++-
>   xen/arch/arm/mpu/mm.c                    | 30 ++++++++++++++++++++++++
>   xen/arch/arm/setup.c                     |  2 +-
>   6 files changed, 43 insertions(+), 4 deletions(-)
>
> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
> index 6ec2c10b14..407fec66c9 100644
> --- a/xen/arch/arm/include/asm/arm64/mpu.h
> +++ b/xen/arch/arm/include/asm/arm64/mpu.h
> @@ -19,6 +19,7 @@
>    * or it needs adjustment.
>    */
>   #define REGION_UART_SEL            0x07
> +#define MPUIR_REGION_MASK          ((_AC(1, UL) << 8) - 1)

May be this is simpler to read

#define MPUIR_REGION_MASK _AC(0xFF, UL)

Also, you can move it to xen/arch/arm/include/asm/mpu.h as it is common 
between R52 and R82.

>
>   #ifndef __ASSEMBLY__
>
> diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
> index c41d805fde..a249a660a8 100644
> --- a/xen/arch/arm/include/asm/arm64/sysregs.h
> +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
> @@ -474,6 +474,9 @@
>   /* MPU Protection Region Selection Register encode */
>   #define PRSELR_EL2  S3_4_C6_C2_1
>
> +/* MPU Type registers encode */
> +#define MPUIR_EL2   S3_4_C0_C0_4
> +
>   #endif
>
>   /* Access to system registers */
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> index 5d890a6a45..eb520b49e3 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -201,8 +201,8 @@ extern unsigned long total_pages;
>
>   extern uint64_t init_mm;
>
> -/* Boot-time pagetable setup */
> -extern void setup_pagetables(unsigned long boot_phys_offset);
> +/* Boot-time memory mapping setup */
> +extern void setup_mm_mappings(unsigned long boot_phys_offset);
>   /* Map FDT in boot pagetable */
>   extern void *early_fdt_map(paddr_t fdt_paddr);
>   /* Remove early mappings */
> diff --git a/xen/arch/arm/mmu/mm.c b/xen/arch/arm/mmu/mm.c
> index 43c19fa914..d7d5bf7287 100644
> --- a/xen/arch/arm/mmu/mm.c
> +++ b/xen/arch/arm/mmu/mm.c
> @@ -398,7 +398,7 @@ static void clear_table(void *table)
>
>   /* Boot-time pagetable setup.
>    * Changes here may need matching changes in head.S */
> -void __init setup_pagetables(unsigned long boot_phys_offset)
> +static void __init setup_pagetables(unsigned long boot_phys_offset)
>   {
>       uint64_t ttbr;
>       lpae_t pte, *p;
> @@ -470,6 +470,11 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
>   #endif
>   }
>
> +void setup_mm_mappings(unsigned long boot_phys_offset)
> +{
> +    setup_pagetables(boot_phys_offset);
> +}
> +
>   static void clear_boot_pagetables(void)
>   {
>       /*
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index fb6bb721b1..e06a6e5810 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -20,6 +20,7 @@
>    */
>
>   #include <xen/init.h>
> +#include <xen/mm.h>
>   #include <xen/page-size.h>
>   #include <asm/arm64/mpu.h>
>
> @@ -27,6 +28,35 @@
>   pr_t __aligned(PAGE_SIZE) __section(".data.page_aligned")
>        xen_mpumap[ARM_MAX_MPU_MEMORY_REGIONS];
>
> +/* Maximum number of supported MPU memory regions by the EL2 MPU. */
> +uint8_t __ro_after_init max_xen_mpumap;
> +
> +/*
> + * Bitmap xen_mpumap_mask is to record the usage of EL2 MPU memory regions.
> + * Bit 0 represents MPU memory region 0, bit 1 represents MPU memory
> + * region 1, ..., and so on.
> + * If a MPU memory region gets enabled, set the according bit to 1.
> + */
> +static DECLARE_BITMAP(xen_mpumap_mask, ARM_MAX_MPU_MEMORY_REGIONS);
> +
> +void __init setup_mm_mappings(unsigned long boot_phys_offset)
> +{
> +    unsigned int nr_regions = REGION_UART_SEL, i = 0;
> +
> +    /*
> +     * MPUIR_EL2.Region[0:7] identifies the number of regions supported by
> +     * the EL2 MPU.
> +     */
> +    max_xen_mpumap = (uint8_t)(READ_SYSREG(MPUIR_EL2) & MPUIR_REGION_MASK);

NIT:- You may dop "& MPUIR_REGION_MASK " as the other bits are RES0

> +
> +    /* Set the bitfield for regions enabled in assembly boot-time. */
> +#ifdef CONFIG_EARLY_PRINTK
> +    nr_regions = REGION_UART_SEL + 1;
> +#endif
> +    for ( ; i < nr_regions; i++ )
> +        set_bit(i, xen_mpumap_mask);
> +}
> +
>   /*
>    * Local variables:
>    * mode: C
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 6f8dd98d6b..f42b53d17b 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -781,7 +781,7 @@ void __init start_xen(unsigned long boot_phys_offset,
>       /* Initialize traps early allow us to get backtrace when an error occurred */
>       init_traps();
>
> -    setup_pagetables(boot_phys_offset);
> +    setup_mm_mappings(boot_phys_offset);
>
>       smp_clear_cpu_maps();
>
> --
> 2.25.1
>
>
- Ayan

