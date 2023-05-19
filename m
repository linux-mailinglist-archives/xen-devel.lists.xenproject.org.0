Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DC570923E
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 10:55:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536781.835470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzvsp-0003CY-Tt; Fri, 19 May 2023 08:54:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536781.835470; Fri, 19 May 2023 08:54:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzvsp-0003AA-Qu; Fri, 19 May 2023 08:54:43 +0000
Received: by outflank-mailman (input) for mailman id 536781;
 Fri, 19 May 2023 08:54:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9j/4=BI=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pzvsn-0003A4-Lg
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 08:54:41 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20614.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8e3e056-f622-11ed-b22d-6b7b168915f2;
 Fri, 19 May 2023 10:54:39 +0200 (CEST)
Received: from BN0PR02CA0023.namprd02.prod.outlook.com (2603:10b6:408:e4::28)
 by PH8PR12MB7133.namprd12.prod.outlook.com (2603:10b6:510:22e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21; Fri, 19 May
 2023 08:54:35 +0000
Received: from BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e4:cafe::f4) by BN0PR02CA0023.outlook.office365.com
 (2603:10b6:408:e4::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21 via Frontend
 Transport; Fri, 19 May 2023 08:54:34 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT010.mail.protection.outlook.com (10.13.177.53) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.21 via Frontend Transport; Fri, 19 May 2023 08:54:34 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 19 May
 2023 03:54:34 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 19 May
 2023 01:54:27 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 19 May 2023 03:54:25 -0500
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
X-Inumbo-ID: c8e3e056-f622-11ed-b22d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ng2K3f9SW9guoL78XlD9GiyJEB6UX2IKqUbJdR3RpmPf4JmS40iw0ybCTyT1g7MLcJa1AyfLdhE//DP2f8djy8KqN8HRwMDyjIhWVEdts92mled0KHK1lpDaaI/rGpIu9Fi0XPru1/WxjLNvkIyPv+6XvW4gjbeq26CqEOmoxpENnBV+b5UCIo+3kU5OexoGWpHf2UmjbOQqHSn71VDaL0EPviWFV79ML8Co66io8dY6khrP8XqMdOHUl/ypP3PgR74TiNoh8flPtkaUPyDL06qWFgdfKNfHU7y3g/arYVHX99lRRF6FPuIcc/yyQYaxnswnVWMf5xz9bfwJPsqrHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g27pllfuv7XhnFiv1A5r7fp2ewJzbA+HLvvBJSGEdaY=;
 b=hxSwarFUwqRoUfbtpGBDGy7BePnvj/6uZ6N1JfqULh9mIhkQyexcBprVOLytGzjhG6KBrtONBqGgy6GTv3VkVhldB6TuSuR+y32x+CBe9nzyY0vjwtu8sWJKBi6uPLTaN6dBd/VwT1M8Cx+HzmshfjBQwg0Xvo/3p6PfL68inpyYRA8R/+A43h8Dj6eUDC7XeS0g1pleLluaU/k4pC8xXqg3pY9yWeSfdR+KXclMUVewm8IDFRktaXCEZiqXjb10lP2yRQTR7fhaQKR5u3Tlk6V7QJQJ2ZCmqIN8pydVCQ81rHZ5UwsoNzUJt5hDXAqB6MI2fbZucyiA3uhlkD2yQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g27pllfuv7XhnFiv1A5r7fp2ewJzbA+HLvvBJSGEdaY=;
 b=K+toBytHwggTLdCBh1MX3THDao14YBZ5WhPcWMNMeObadfQHG1gXwBUBZ5NZ16JSyOszfwmKbYSjn4mh/fEipbHwIUr5nSyDfQb1nQ5p+xxEMQrab2SaQy+tnJzkaoEZV9bI7BXREwsGo/FQWgXdsv7irRgI2mAA+v+FLRamx3o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <66f04988-9a4b-39c0-fb17-c508b98e3bdf@amd.com>
Date: Fri, 19 May 2023 10:54:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [XEN v7 07/11] xen/arm: p2m: Use the pa_range_info table to
 support ARM_32 and ARM_64
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>
References: <20230518143920.43186-1-ayan.kumar.halder@amd.com>
 <20230518143920.43186-8-ayan.kumar.halder@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230518143920.43186-8-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT010:EE_|PH8PR12MB7133:EE_
X-MS-Office365-Filtering-Correlation-Id: d6895996-3463-4658-b521-08db5846ab0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6MnR2JzJioxGKDTMpkxw9Uey3Tmq8Bcd7f9Z3etSc0MzlRP2X5J3lgYewOI/j14xIAMD2QqHrBvkuNZhGgniAAMKMpNBXZrQN/aCs11P1KV3QfDws+mBsS61nDdg8+wvkr7q2CH0tgF+26ywuqmGux0yk5og54mWVKVDUyCVYb0JWXL+7FDyZ8y68kWxYL5WmwyZXPgUOCdRP16uMF/wiC1h74B3AAJDx/8/pvaEfU9XW5aad/qrNUiw7swwY0AyHhLatlixZ9GsU1bz3rblVI0TBDxVJHEqJPIOLEJatIPKBwo4ewvkloE29MEW+7o0fF38XHsT9mameeLfaPvi/PvhdN6siVZVg0FKQ4TLYc8Akb9aZVTZLX1p/qJZQKw/6TfPEx+jhX2sqXK3TFMoLjwNd5LageQKHOxYTRpiJ4bcsIDxjcKxVj/AiCqmWx3weW+3kl32KPMQfkqywSxqNuTl93YajEfQYDlCf5VaMvObDCkIGZ66X/lIlkaFtCVaVjjEZKDBx6y9lsGmnlhBl6XyFPiQF/TXRspclmAULyPVm7K11DbMP5bBwK6f8q9oZJgwCeMUY8+6XuhPnNVR7z26+ykd3j78b8odYnzOVDOCZLJk5mC369oEdMfpI0AU1yP8sGiQPLVYqL8GZZ3hbNV8sjbJIahpGywYB4pmtUllhmMVA0BQA2usU4bszJOaGSRT7HBhx3wOCtxwWMFn5pxOnjq8mgrKR1vrWlnZGoerqg/9DpXIN10k9rRkdPW6G3lVYgRcozi5h1Fc3VUrwdOzBraJTe4+CVOCEBej19c=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(396003)(136003)(451199021)(36840700001)(46966006)(40470700004)(40460700003)(6666004)(41300700001)(44832011)(26005)(53546011)(5660300002)(7416002)(36756003)(82310400005)(47076005)(83380400001)(2616005)(36860700001)(426003)(336012)(186003)(2906002)(86362001)(31696002)(356005)(81166007)(8936002)(8676002)(40480700001)(82740400003)(478600001)(70206006)(70586007)(4326008)(31686004)(16576012)(54906003)(110136005)(316002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 08:54:34.3149
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6895996-3463-4658-b521-08db5846ab0a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7133

Hi Ayan,

On 18/05/2023 16:39, Ayan Kumar Halder wrote:
> Restructure the code so that one can use pa_range_info[] table for both
> ARM_32 as well as ARM_64.
> 
> Also, removed the hardcoding for P2M_ROOT_ORDER and P2M_ROOT_LEVEL as
> p2m_root_order can be obtained from the pa_range_info[].root_order and
> p2m_root_level can be obtained from pa_range_info[].sl0.
> 
> Refer ARM DDI 0406C.d ID040418, B3-1345,
> "Use of concatenated first-level translation tables
> 
> ...However, a 40-bit input address range with a translation granularity of 4KB
> requires a total of 28 bits of address resolution. Therefore, a stage 2
> translation that supports a 40-bit input address range requires two concatenated
> first-level translation tables,..."
> 
> Thus, root-order is 1 for 40-bit IPA on ARM_32.
> 
> Refer ARM DDI 0406C.d ID040418, B3-1348,
> 
> "Determining the required first lookup level for stage 2 translations
> 
> For a stage 2 translation, the output address range from the stage 1
> translations determines the required input address range for the stage 2
> translation. The permitted values of VTCR.SL0 are:
> 
> 0b00 Stage 2 translation lookup must start at the second level.
> 0b01 Stage 2 translation lookup must start at the first level.
> 
> VTCR.T0SZ must indicate the required input address range. The size of the input
> address region is 2^(32-T0SZ) bytes."
> 
> Thus VTCR.SL0 = 1 (maximum value) and VTCR.T0SZ = -8 when the size of input
> address region is 2^40 bytes.
> 
> Thus, pa_range_info[].t0sz = 1 (VTCR.S) | 8 (VTCR.T0SZ) ie 11000b which is 24.
> 
> VTCR.T0SZ, is bits [5:0] for ARM_64.
> VTCR.T0SZ is bits [3:0] and S(sign extension), bit[4] for ARM_32.
> 
> Thus, VTCR.T0SZ bits are interpreted accordingly for different architecture.
> For this, we have used union.
> 
> pa_range_info[] is indexed by ID_AA64MMFR0_EL1.PARange which is present in Arm64
> only. This is the reason we do not specify the indices for ARM_32. Also, we
> duplicated the entry "{ 40,      24/*24*/,  1,          1 }" between ARM_64 and
> ARM_32. This is done to avoid introducing extra #if-defs.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes from -
> 
> v3 - 1. New patch introduced in v4.
> 2. Restructure the code such that pa_range_info[] is used both by ARM_32 as
> well as ARM_64.
> 
> v4 - 1. Removed the hardcoded definitions of P2M_ROOT_ORDER and P2M_ROOT_LEVEL.
> The reason being root_order will not be always 1 (See the next patch).
> 2. Updated the commit message to explain t0sz, sl0 and root_order values for
> 32-bit IPA on Arm32.
> 3. Some sanity fixes.
> 
> v5 - pa_range_info is indexed by system_cpuinfo.mm64.pa_range. ie
> when PARange is 0, the PA size is 32, 1 -> 36 and so on. So pa_range_info[] has
> been updated accordingly.
> For ARM_32 pa_range_info[0] = 0 and pa_range_info[1] = 0 as we do not support
> 32-bit, 36-bit physical address range yet.
> 
> v6 - 1. Added pa_range_info[] entries for ARM_32 without indices. Some entry
> may be duplicated between ARM_64 and ARM_32.
> 2. Recalculate p2m_ipa_bits for ARM_32 from T0SZ (similar to ARM_64).
> 3. Introduced an union to reinterpret T0SZ bits between ARM_32 and ARM_64.
> 
>  xen/arch/arm/include/asm/p2m.h |  6 ------
>  xen/arch/arm/p2m.c             | 37 +++++++++++++++++++++++-----------
>  2 files changed, 25 insertions(+), 18 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
> index f67e9ddc72..940495d42b 100644
> --- a/xen/arch/arm/include/asm/p2m.h
> +++ b/xen/arch/arm/include/asm/p2m.h
> @@ -14,16 +14,10 @@
>  /* Holds the bit size of IPAs in p2m tables.  */
>  extern unsigned int p2m_ipa_bits;
>  
> -#ifdef CONFIG_ARM_64
>  extern unsigned int p2m_root_order;
>  extern unsigned int p2m_root_level;
>  #define P2M_ROOT_ORDER    p2m_root_order
>  #define P2M_ROOT_LEVEL p2m_root_level
> -#else
> -/* First level P2M is always 2 consecutive pages */
> -#define P2M_ROOT_ORDER    1
> -#define P2M_ROOT_LEVEL 1
> -#endif
>  
>  struct domain;
>  
> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
> index 418997843d..755cb86c5b 100644
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -19,9 +19,9 @@
>  
>  #define INVALID_VMID 0 /* VMID 0 is reserved */
>  
> -#ifdef CONFIG_ARM_64
>  unsigned int __read_mostly p2m_root_order;
>  unsigned int __read_mostly p2m_root_level;
> +#ifdef CONFIG_ARM_64
>  static unsigned int __read_mostly max_vmid = MAX_VMID_8_BIT;
>  /* VMID is by default 8 bit width on AArch64 */
>  #define MAX_VMID       max_vmid
> @@ -2247,16 +2247,6 @@ void __init setup_virt_paging(void)
>      /* Setup Stage 2 address translation */
>      register_t val = VTCR_RES1|VTCR_SH0_IS|VTCR_ORGN0_WBWA|VTCR_IRGN0_WBWA;
>  
> -#ifdef CONFIG_ARM_32
> -    if ( p2m_ipa_bits < 40 )
> -        panic("P2M: Not able to support %u-bit IPA at the moment\n",
> -              p2m_ipa_bits);
> -
> -    printk("P2M: 40-bit IPA\n");
> -    p2m_ipa_bits = 40;
> -    val |= VTCR_T0SZ(0x18); /* 40 bit IPA */
> -    val |= VTCR_SL0(0x1); /* P2M starts at first level */
> -#else /* CONFIG_ARM_64 */
>      static const struct {
>          unsigned int pabits; /* Physical Address Size */
>          unsigned int t0sz;   /* Desired T0SZ, minimum in comment */
> @@ -2265,6 +2255,7 @@ void __init setup_virt_paging(void)
>      } pa_range_info[] __initconst = {
>          /* T0SZ minimum and SL0 maximum from ARM DDI 0487H.a Table D5-6 */
>          /*      PA size, t0sz(min), root-order, sl0(max) */
> +#ifdef CONFIG_ARM_64
>          [0] = { 32,      32/*32*/,  0,          1 },
>          [1] = { 36,      28/*28*/,  0,          1 },
>          [2] = { 40,      24/*24*/,  1,          1 },
> @@ -2273,11 +2264,22 @@ void __init setup_virt_paging(void)
>          [5] = { 48,      16/*16*/,  0,          2 },
>          [6] = { 52,      12/*12*/,  4,          2 },
>          [7] = { 0 }  /* Invalid */
> +#else
> +        { 40,      24/*24*/,  1,          1 },
> +        { 0 },  /* Invalid */
Do we really need this invalid entry?

> +#endif
>      };
>  
>      unsigned int i;
>      unsigned int pa_range = 0x10; /* Larger than any possible value */
>  
> +    /* Typecast pa_range_info[].t0sz into ARM_32 and ARM_64 bit variants. */
This would want some explanation in the code.

> +    union {
> +        signed int t0sz_32:5;
> +        unsigned int t0sz_64:6;
> +    } t0sz;
> +
> +#ifdef CONFIG_ARM_64
>      /*
>       * Restrict "p2m_ipa_bits" if needed. As P2M table is always configured
>       * with IPA bits == PA bits, compare against "pabits".
> @@ -2291,6 +2293,7 @@ void __init setup_virt_paging(void)
>       */
>      if ( system_cpuinfo.mm64.vmid_bits == MM64_VMID_16_BITS_SUPPORT )
>          max_vmid = MAX_VMID_16_BIT;
> +#endif
>  
>      /* Choose suitable "pa_range" according to the resulted "p2m_ipa_bits". */
>      for ( i = 0; i < ARRAY_SIZE(pa_range_info); i++ )
> @@ -2306,24 +2309,34 @@ void __init setup_virt_paging(void)
>      if ( pa_range >= ARRAY_SIZE(pa_range_info) || !pa_range_info[pa_range].pabits )
>          panic("Unknown encoding of ID_AA64MMFR0_EL1.PARange %x\n", pa_range);
>  
> +#ifdef CONFIG_ARM_64
>      val |= VTCR_PS(pa_range);
>      val |= VTCR_TG0_4K;
>  
>      /* Set the VS bit only if 16 bit VMID is supported. */
>      if ( MAX_VMID == MAX_VMID_16_BIT )
>          val |= VTCR_VS;
> +#endif
> +
>      val |= VTCR_SL0(pa_range_info[pa_range].sl0);
>      val |= VTCR_T0SZ(pa_range_info[pa_range].t0sz);
>  
>      p2m_root_order = pa_range_info[pa_range].root_order;
>      p2m_root_level = 2 - pa_range_info[pa_range].sl0;
> +
> +#ifdef CONFIG_ARM_64
> +    t0sz.t0sz_64 = pa_range_info[pa_range].t0sz;
>      p2m_ipa_bits = 64 - pa_range_info[pa_range].t0sz;
This should be:
p2m_ipa_bits = 64 - t0sz.t0sz_64;

Another alternative would be to use anonymous unions+struct/union inside pa_range_info, e.g:
        union {
            unsigned int t0sz;
            struct {
                signed int t0sz_32:5;
            };
        };
so, if t0sz stores 24, t0sz_32 would automatically store -8.
This could simplify the code later on, as you could just do:

#ifdef CONFIG_ARM_64
    p2m_ipa_bits = 64 - pa_range_info[pa_range].t0sz;
#else
    p2m_ipa_bits = 32 - pa_range_info[pa_range].t0sz_32;
#endif

However, I think it would require placing extra braces around initializers, i.e:
[0] = { 32,      {32/*32*/},  0,          1 },

~Michal

