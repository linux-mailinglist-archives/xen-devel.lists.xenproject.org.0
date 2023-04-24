Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BC06EC7B5
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 10:13:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525197.816236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqrJg-0000mQ-2q; Mon, 24 Apr 2023 08:12:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525197.816236; Mon, 24 Apr 2023 08:12:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqrJf-0000kT-VO; Mon, 24 Apr 2023 08:12:55 +0000
Received: by outflank-mailman (input) for mailman id 525197;
 Mon, 24 Apr 2023 08:12:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3wwt=AP=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pqrJd-0000kD-Pc
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 08:12:53 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20627.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cdc4ed30-e277-11ed-8611-37d641c3527e;
 Mon, 24 Apr 2023 10:12:51 +0200 (CEST)
Received: from DM6PR06CA0061.namprd06.prod.outlook.com (2603:10b6:5:54::38) by
 CH2PR12MB4117.namprd12.prod.outlook.com (2603:10b6:610:ae::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.33; Mon, 24 Apr 2023 08:12:47 +0000
Received: from DM6NAM11FT075.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:54:cafe::48) by DM6PR06CA0061.outlook.office365.com
 (2603:10b6:5:54::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33 via Frontend
 Transport; Mon, 24 Apr 2023 08:12:47 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT075.mail.protection.outlook.com (10.13.173.42) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6340.19 via Frontend Transport; Mon, 24 Apr 2023 08:12:46 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 24 Apr
 2023 03:12:46 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 24 Apr 2023 03:12:43 -0500
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
X-Inumbo-ID: cdc4ed30-e277-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VZxY6XtjdLnwuPy32RntmO9R5S+TF3UKTeCy4bwa3h2iXyZ9+tmVZvWBzXENIePExb5sSDKDdG/2Ho0P8QTnxY/Dv3treSUybdbZl1GQAq9vqs45T1aDL+yLvVSBGdGdnAsmJMKvIKHvvdgSJJ5YWUjOTvDGAkq2cDrwJAZFg815OfCIi3dHXTYSqz/YQXexDrba8mJzhjRhSIE7EjyQZB9BRNkpbL7iU3u11x/gMObITcuBDQ3RG+G5mghXQD+6EEiYURHS8rDTXDH04VzQ85c9l+IMRHkAoTmOGkr+tiYO4E90KRe+1Ty7HciqSEKlvr9bmZmoAk52lxvbFPpimQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3mRq/uiVtxaRxCW5b3OqAYLbyNMTIACsCw6yt1MILfY=;
 b=NJdXwnLUXf00x2LmyVuw/7DEcsRLlpYLCajMdyDbCTc8MM9ThmvvZAAhOoX8D+BvjiK5Qer+QBNzjywFvinkSiBjNb0KYV+er6duqtI0GgX3gzKmui5UYBdht0ZZ6eY5t4pWFoRmDh5Cvrj+iOA373bmDBfpsap158S3bk/ZqDgBKOtIRPekhvKxDxi55yRcVGBqYfnoATJSmtMEF2uuA9oN+YjblyOrqbXTYzt/WEYQTmKoXQllISJUZ55Pp4ToMNLqtdWeQTOGp6W3xQZqqdpYy+y7apytWKX+fYMKvvPyV2KyJznb85BlQdyiqJct3tEnsFb6W6qGAwNXiE05/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3mRq/uiVtxaRxCW5b3OqAYLbyNMTIACsCw6yt1MILfY=;
 b=O3xIby8SjFNWGAdP4GN7hnVddusM2O1FU8KFOoZDmMW28vKxQbGtueSWjBUPrfSI/6C0M5LmjbaIL0Y66IfOu1hJotWaqihe67/qDDlP7DPYB1wUMg7q2Aje+8fpbcLiDhlSeGMM8NWNhzaMf+WHTQra+gQ4fQ2emsk7ReDUX9M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <47f32844-e26e-01a6-63e1-a774e2038301@amd.com>
Date: Mon, 24 Apr 2023 10:12:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [XEN v5 09/10] xen/arm: p2m: Use the pa_range_info table to
 support ARM_32 and ARM_64
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>
References: <20230413173735.48387-1-ayan.kumar.halder@amd.com>
 <20230413173735.48387-10-ayan.kumar.halder@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230413173735.48387-10-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT075:EE_|CH2PR12MB4117:EE_
X-MS-Office365-Filtering-Correlation-Id: af791226-6ce2-4d44-633b-08db449bb00b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uiX8fyIVRbOgOtfjZ7NwPyAHyheu3ePWYoaMhI8QlxQPyJtsa17foKQ9sAjl6BCgz8FOiQsdDR0jXVMWgsHLekTKrsaHWOBg0OgXfzzXNAeZMzxXyAporJmQZdUooliFTlOSHGkKC31IfwxB1F9B9PFGI79dQ2m7XBD+ULsn0gDkaCCz0rxQybEMIwq2UDv2OkayXrNcOXALFuhwSTULg6c5/LQmV+yJuR7h9qt4/yfXoAl0CBJR7/QIM2s3d5pTwFmwF/BwCaL8laaFoQgnBMaB5C2g5omliWa4oY4v5qokvjHdkQF0Y2tZIR4e/jEnuK+Tj3PCTs0IGkShoFl2/vW0M8s/Ojqs3CauGrIT0zBUoVdixTGuRdJRyJC2dZITijV6hVBI/qxrlGDbfhhNfETckX9Zyps55+lX8KlxA1mgyRkgr7J4HizVREAmV6S/HXFC/fx6jUVBMG11mvIXtOJMrcgOyKLS35AxFZpm8qmwdvmywny7GlR3yfT7m3kIYlIS5qUMGoP5GdXsQ2RgyUol3MFWCi8+rSfIDlV4nlEgno3R4JYnTmqLcbaZ+X36iR22pjK2//hDLsVWXJ0Hv6tK3j62Ff9Kad4jnyKb/vP0+qqFHHnUzBExC5M4rubmA+rrXkOrrRX7rAEDbJjX7NQShZa7b2DPy2VpJnIW9Jcq+3qMDDqa3Y3bFp1gUYbw6wfP1rmWLkXO7B+srCNbRJHXOPqZb6UcPaJMK4SarXjvTEGEd6jdXDELqJIfZAu1TIIgb8I1BY0+voQVAMykfw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(136003)(396003)(451199021)(36840700001)(46966006)(40470700004)(478600001)(40460700003)(31696002)(110136005)(16576012)(54906003)(86362001)(36756003)(186003)(53546011)(26005)(82310400005)(40480700001)(4326008)(316002)(82740400003)(44832011)(83380400001)(70206006)(70586007)(36860700001)(2906002)(336012)(356005)(426003)(41300700001)(81166007)(8676002)(8936002)(31686004)(5660300002)(47076005)(7416002)(2616005)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 08:12:46.6588
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af791226-6ce2-4d44-633b-08db449bb00b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT075.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4117

Hi Ayan,

On 13/04/2023 19:37, Ayan Kumar Halder wrote:
> 
> 
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
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> 
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
>  xen/arch/arm/include/asm/p2m.h |  8 +-------
>  xen/arch/arm/p2m.c             | 34 ++++++++++++++++++----------------
>  2 files changed, 19 insertions(+), 23 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
> index 91df922e1c..28c68428d3 100644
> --- a/xen/arch/arm/include/asm/p2m.h
> +++ b/xen/arch/arm/include/asm/p2m.h
> @@ -14,16 +14,10 @@
>  /* Holds the bit size of IPAs in p2m tables.  */
>  extern unsigned int p2m_ipa_bits;
> 
> -#ifdef CONFIG_ARM_64
>  extern unsigned int p2m_root_order;
>  extern unsigned int p2m_root_level;
> -#define P2M_ROOT_ORDER    p2m_root_order
> +#define P2M_ROOT_ORDER p2m_root_order
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
> index 948f199d84..4583658f92 100644
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
> @@ -2265,16 +2265,6 @@ void __init setup_virt_paging(void)
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
> @@ -2283,19 +2273,24 @@ void __init setup_virt_paging(void)
>      } pa_range_info[] __initconst = {
>          /* T0SZ minimum and SL0 maximum from ARM DDI 0487H.a Table D5-6 */
>          /*      PA size, t0sz(min), root-order, sl0(max) */
> -        [0] = { 32,      32/*32*/,  0,          1 },
> -        [1] = { 36,      28/*28*/,  0,          1 },
> -        [2] = { 40,      24/*24*/,  1,          1 },
> +        [0] = { 40,      24/*24*/,  1,          1 },
Something does not add up here.
This table maintains the same order as PARange field of MMFR0 register, so that later on
we can do:
pa_range_info[system_cpuinfo.mm64.pa_range]

When PARange is 0, the PA size is 32, 1 -> 36 and so on.
However, you modified this behavior and now, if PARange is 0, this table will return PA size as 40.
This is wrong.

~Michal

