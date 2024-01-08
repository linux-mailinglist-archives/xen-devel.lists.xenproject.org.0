Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B0B826864
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 08:05:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663200.1033040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMjgv-0005J2-Qb; Mon, 08 Jan 2024 07:04:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663200.1033040; Mon, 08 Jan 2024 07:04:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMjgv-0005H5-Ng; Mon, 08 Jan 2024 07:04:57 +0000
Received: by outflank-mailman (input) for mailman id 663200;
 Mon, 08 Jan 2024 07:04:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j0y/=IS=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rMjgu-0005Gz-3I
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 07:04:56 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2009::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 380181b2-adf4-11ee-9b0f-b553b5be7939;
 Mon, 08 Jan 2024 08:04:52 +0100 (CET)
Received: from SA0PR11CA0100.namprd11.prod.outlook.com (2603:10b6:806:d1::15)
 by CH3PR12MB8511.namprd12.prod.outlook.com (2603:10b6:610:15c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Mon, 8 Jan
 2024 07:04:47 +0000
Received: from SN1PEPF00026369.namprd02.prod.outlook.com
 (2603:10b6:806:d1:cafe::5d) by SA0PR11CA0100.outlook.office365.com
 (2603:10b6:806:d1::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21 via Frontend
 Transport; Mon, 8 Jan 2024 07:04:46 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF00026369.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.13 via Frontend Transport; Mon, 8 Jan 2024 07:04:46 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 8 Jan
 2024 01:04:46 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Mon, 8 Jan 2024 01:04:44 -0600
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
X-Inumbo-ID: 380181b2-adf4-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D/NfQfHS2wqN+6xs2nJufbnyXKNvH6Q26GiEdCtuMtUdoPfLyTB7ALKr/DPOt7iqPs6j5bvQyOu3OsGx5Jo8EPaFwNnRBO0EaoSN2nvZ9RXz0e4XcR/kM/2XyscorxA5Hy2hUG2yUdxlvsr1E7nS7quCfAtIcE1kLHTzJezlJzUzIznIgUJ6WeQDWRaySZ1OoBPDx4LwS19oNrLYLaHf2FW5oaSbO6HHaRixSFIXPtmJyVpNeYD/QIlWIpd4uMmHYqHmZ6QJiTDg4GTEyYjlazQPTclE2E+5FGe3M6cdemHxfoIS1Q8P/1DgpKCH4IXWLtc7ZnQtHKVwZCsjaBTKpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dKQtOyRkz5+WPtir3GirxqfxFG9EnfV5sTKwbH5cLf0=;
 b=CIN+1EED8+7y4VuwVSusfaXPKOiw+AluxQdGWDoKI7JbKsUlQY50SYV5zQfGGQLwkAFhedkbvawocIiKhM0Afz/VLXt/RArDdY66yvMixcjrUS3/qKTbcHtKsWA/aTBeFSkK0G5dtsQKYhM+o0l9b3+/NgB6InxXJDnBlr1sG1MqhKcKEUqZg6LdwvOSk/ie+AJY/wq1XpOjykW2kJc+GVE8z+fReh8WqWzTTyPbjpxinG7MHyX4YknOe8wuUvGq09ReRKuosZCx0vrYBiAtSJFnIJ4+kgTu6Pi5Opr3JKoHBzUZh4MzNwTWg5IR1eT07vy30RrD9K5mEToca1Aryw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dKQtOyRkz5+WPtir3GirxqfxFG9EnfV5sTKwbH5cLf0=;
 b=35CLdqK1JcnHPCEBZbzjCSwku451ac8ZU9osJ1fiJRW0U39XJTsXEtJp5LAZ33d9ZSa3m8PnBKyoKoDYPuk5M5vcxO5ZycLBcHjfbyBdqxR8X03hTLqpC9VZsIPOsfyIZ2YsMC9/e0xulaW36wEiw6XFbEdgs89aDMow1StaSz4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <d92fbb2b-4b2f-4647-a3f3-98d1a2c49537@amd.com>
Date: Mon, 8 Jan 2024 08:04:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Michal Orzel <michal.orzel@amd.com>
Subject: Re: [XEN v3 3/3] xen/arm: arm32: Add emulation of Debug Data Transfer
 Registers
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>
References: <20240105112156.154807-1-ayan.kumar.halder@amd.com>
 <20240105112156.154807-4-ayan.kumar.halder@amd.com>
Content-Language: en-US
In-Reply-To: <20240105112156.154807-4-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026369:EE_|CH3PR12MB8511:EE_
X-MS-Office365-Filtering-Correlation-Id: 48965583-2229-4e60-a3f7-08dc1018190e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0nRmXWzDk2ZUEgOHGscH15lnjqHPXdItKOtNfr0JdQuFasxhrsTz/R6IwNo65agJ0rnGUJGQddWPqMSXSLDEoYmO7yupcGOUZb9L0ZHv1t6M2rAtVbIS0lMsrmbI0vHj+AGryYdpmthv7DKO6d/reHK73mjUp/zr2IVYl9S7vuUv6+mOqP1BgBp3vbGcm9IxaLpCxBoDzG/Tje37wKLKjZoB7yF+KLFxSXsW/fhTzRU9RWUhsZ+/Mr3lTXaYdhqda+DepCoAna/xxwTD5hG4xQjOJGJpb7r0+Gf9KOZn9ullONTqnzYGm0p9RnosawIJ8GKetO7NP7b9XLHatIPMiVV2yR+NY5fT8ae/A0vRCxXb/YA0n4E5dXDi5d1VAsrvUjEKDE7LrbXTVm0l16daBW0lznq04KsWTXIWit7m5nr76e+Vmkkl6xzuL8OL75kkvG5ZMZLYMvDIKqhAgy1HuE8osHguAzlkRZiHKg78MojS5X0LdFbeM4VAtVL+a0GxrA3rwD5RMBnLVboimKRQo7LqEB5zAXms4OzKJYRcAqje3wZ4CrofhvXLqP6VKFRgjNngK0+jg9gVyueDn0tnA18zH1dV+ml7+Loo10R7DuzpTPn7YsLk2lNXdrXJR7tsRWscMiruPtdlsRB+5qfrHDzB9LT30+ypkQRRf9fUICO5X7keWsgCBLZoWSQLmu2XNerrh8HDbovDzuhvCYUVIJU6sa2PCRB4NlyoK8KYUDy1LAznzMwrycE0eXfSlHgbSU5ZitAon/M8Ke3e3xVzb+ot/rV2M8E/frscFi6XMn9nJmMqXzQ6XR1GEPejjL2+MziY4BUxvIP7fP9JpKxHikEciX3Vp8lez1cg6E1Sm0Y=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(376002)(396003)(136003)(230922051799003)(230273577357003)(230173577357003)(1800799012)(186009)(82310400011)(451199024)(64100799003)(46966006)(36840700001)(40470700004)(36860700001)(47076005)(2906002)(2616005)(26005)(70586007)(70206006)(41300700001)(31686004)(86362001)(40480700001)(40460700003)(31696002)(36756003)(82740400003)(81166007)(356005)(5660300002)(4326008)(316002)(16576012)(54906003)(110136005)(426003)(336012)(83380400001)(53546011)(6666004)(44832011)(478600001)(8936002)(8676002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2024 07:04:46.4636
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48965583-2229-4e60-a3f7-08dc1018190e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00026369.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8511

Hi Ayan,

On 05/01/2024 12:21, Ayan Kumar Halder wrote:
> DBGOSLSR is emulated in the same way as its AArch64 variant (ie OSLSR_EL1).
> This is to ensure that DBGOSLSR.OSLK is 0, thus MDSCR_EL1.TXfull is treated
> as UNK/SBZP.
No need for this dot and yet another thus (it reads difficult).
You explained the OSLK bit, but you are not emulating this reg as ro_raz. Instead you
copied the code from AArch64 (ro_read_val) which also sets OSLM[1] bit. Do we want the same handling
given that Linux on arm32 does not make use of it?

> Thus only MDCCSR_EL0 can be emulated (which is DBGDSCRINT on arm32).
> DBGDSCRINT can be accessed at EL0 as DBGDSCREXT is emulated as RAZ (as
> DBGOSLSR.OSLK == 0). DBGDSCRINT.TXfull is set to 1.
Even though this patch comes after the one explaining the need of emulating DCC
I would still expect some reasoning here. Someone reading the vcpreg code and checking the commit
behind would not know the rationale behind this patch.

Allowing access DBGDSCRINT from EL0 is a fix, so I would make it clear by starting a sentence
with "Take the opportunity to fix the minimum EL for DBGDSCRINT ...".

> 
> Refer ARM DDI 0487J.a ID042523, G8.3.19, DBGDTRTXint
> "If TXfull is set to 1, set DTRTX to UNKNOWN".
> So, DBGDTR[TR]XINT is emulated as RAZ/WI.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes from
> 
> v1 :- 1. DBGDTR_EL0 does not emulate RXfull. This is to avoid giving the OS any
> indication that the RX buffer is full and is waiting to be read.
> 
> 2. In Arm32, DBGOSLSR is emulated. Also DBGDTRTXINT is emulated at EL0 only.
> 
> 3. Fixed the commit message and inline code comments.
> 
> v2 :- 1. Split the patch into two (separate patches for arm64 and arm32).
> 2. Fixed in line comments and style related issues.
> 3. Updated commit message to mention DBGDSCRINT handling.
> 
>  xen/arch/arm/include/asm/cpregs.h |  2 ++
>  xen/arch/arm/vcpreg.c             | 36 ++++++++++++++++++++++---------
>  2 files changed, 28 insertions(+), 10 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
> index 6b083de204..aec9e8f329 100644
> --- a/xen/arch/arm/include/asm/cpregs.h
> +++ b/xen/arch/arm/include/asm/cpregs.h
> @@ -75,6 +75,8 @@
>  #define DBGDIDR         p14,0,c0,c0,0   /* Debug ID Register */
>  #define DBGDSCRINT      p14,0,c0,c1,0   /* Debug Status and Control Internal */
>  #define DBGDSCREXT      p14,0,c0,c2,2   /* Debug Status and Control External */
> +#define DBGDTRRXINT     p14,0,c0,c5,0   /* Debug Data Transfer Register, Receive */
> +#define DBGDTRTXINT     p14,0,c0,c5,0   /* Debug Data Transfer Register, Transmit */
>  #define DBGVCR          p14,0,c0,c7,0   /* Vector Catch */
>  #define DBGBVR0         p14,0,c0,c0,4   /* Breakpoint Value 0 */
>  #define DBGBCR0         p14,0,c0,c0,5   /* Breakpoint Control 0 */
> diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
> index a2d0500704..474f872b5f 100644
> --- a/xen/arch/arm/vcpreg.c
> +++ b/xen/arch/arm/vcpreg.c
> @@ -493,11 +493,12 @@ void do_cp14_32(struct cpu_user_regs *regs, const union hsr hsr)
>       * ARMv8 (DDI 0487A.d): D1-1509 Table D1-58
>       *
>       * Unhandled:
> -     *    DBGOSLSR
>       *    DBGPRCR
>       */
>      case HSR_CPREG32(DBGOSLAR):
>          return handle_wo_wi(regs, regidx, cp32.read, hsr, 1);
> +    case HSR_CPREG32(DBGOSLSR):
> +        return handle_ro_read_val(regs, regidx, cp32.read, hsr, 1, 1U << 3);
>      case HSR_CPREG32(DBGOSDLR):
>          return handle_raz_wi(regs, regidx, cp32.read, hsr, 1);
>  
> @@ -509,8 +510,6 @@ void do_cp14_32(struct cpu_user_regs *regs, const union hsr hsr)
>       *
>       * Unhandled:
>       *    DBGDCCINT
> -     *    DBGDTRRXint
> -     *    DBGDTRTXint
>       *    DBGWFAR
>       *    DBGDTRTXext
>       *    DBGDTRRXext,
> @@ -549,11 +548,24 @@ void do_cp14_32(struct cpu_user_regs *regs, const union hsr hsr)
>      }
>  
>      case HSR_CPREG32(DBGDSCRINT):
> +    {
>          /*
> -         * Read-only register. Accessible by EL0 if DBGDSCRext.UDCCdis
> -         * is set to 0, which we emulated below.
> +         * Xen doesn't expose a real (or emulated) Debug Communications Channel
> +         * (DCC) to a domain. Yet the Arm ARM implies this is not an optional
> +         * feature. So some domains may start to probe it. For instance, the
> +         * HVC_DCC driver in Linux (since f377775dc083 and at least up to v6.7),
> +         * will try to write some characters and check if the transmit buffer
> +         * has emptied. By setting TX status bit to indicate the transmit buffer
> +         * is full. This we would hint the OS that the DCC is probably not
> +         * working.
> +         *
> +         * Bit 29: TX full
> +         *
> +         * Accessible by EL0 if DBGDSCRext.UDCCdis is set to 0, which we emulate
> +         * as RAZ/WI in the next case.
>           */
> -        return handle_ro_raz(regs, regidx, cp32.read, hsr, 1);
> +        return handle_ro_read_val(regs, regidx, cp32.read, hsr, 0, 1U << 29);
> +    }
>  
>      case HSR_CPREG32(DBGDSCREXT):
>          /*
> @@ -562,6 +574,13 @@ void do_cp14_32(struct cpu_user_regs *regs, const union hsr hsr)
>           */
>          return handle_raz_wi(regs, regidx, cp32.read, hsr, 1);
>  
> +#ifdef CONFIG_PARTIAL_EMULATION
> +    /* DBGDTR[TR]XINT share the same encoding */
> +    case HSR_CPREG32(DBGDTRTXINT):
> +        if ( opt_partial_emulation )
> +            return handle_raz_wi(regs, regidx, cp32.read, hsr, 0);
> +#endif
> +
>      case HSR_CPREG32(DBGVCR):
>      case HSR_CPREG32(DBGBVR0):
>      case HSR_CPREG32(DBGBCR0):
> @@ -659,10 +678,7 @@ void do_cp14_dbg(struct cpu_user_regs *regs, const union hsr hsr)
>       * ARMv8 (DDI 0487A.d): D1-1509 Table D1-58
>       *
>       * Unhandled:
> -     *    DBGDTRTXint
> -     *    DBGDTRRXint
> -     *
> -     * And all other unknown registers.
> +     * All unknown registers.
>       */
>      gdprintk(XENLOG_ERR,
>               "%s p14, %d, r%d, r%d, cr%d @ 0x%"PRIregister"\n",

Same comments apply as for the arm64 patch.

~Michal


