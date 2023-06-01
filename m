Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FE0719B20
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 13:49:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542417.846261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4gng-0001rt-RK; Thu, 01 Jun 2023 11:49:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542417.846261; Thu, 01 Jun 2023 11:49:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4gng-0001pM-NK; Thu, 01 Jun 2023 11:49:04 +0000
Received: by outflank-mailman (input) for mailman id 542417;
 Thu, 01 Jun 2023 11:49:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4ef9=BV=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1q4gnf-0001lc-6s
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 11:49:03 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20622.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4bf8c047-0072-11ee-b231-6b7b168915f2;
 Thu, 01 Jun 2023 13:49:01 +0200 (CEST)
Received: from BN9PR03CA0480.namprd03.prod.outlook.com (2603:10b6:408:139::35)
 by BY5PR12MB4259.namprd12.prod.outlook.com (2603:10b6:a03:202::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Thu, 1 Jun
 2023 11:48:56 +0000
Received: from BN8NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:139:cafe::9) by BN9PR03CA0480.outlook.office365.com
 (2603:10b6:408:139::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23 via Frontend
 Transport; Thu, 1 Jun 2023 11:48:56 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT005.mail.protection.outlook.com (10.13.176.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.23 via Frontend Transport; Thu, 1 Jun 2023 11:48:56 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Jun
 2023 06:48:56 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Jun
 2023 04:48:55 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 1 Jun 2023 06:48:54 -0500
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
X-Inumbo-ID: 4bf8c047-0072-11ee-b231-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CaOgXT2SENJ+9E1CrgyFXq2bm6xPmXHEMLbnTKG+O0lGp91n52YpAHTx2GNZAQf5hfw65FSFOIp2g4jZhWLk9V9AoobJYabyZvruBfcm4tlv4szbvSG5rEQQlAiOFEmU23qq9uJ72El5xVLOlxp/goOJG1bcpMfDtpVMR/fOZaYqSmAGAxFkp/zfaul65jjx/XLzIFTaUhsDWxRKIsFtz3mf5D/+f+pU2hQtcKOQbj4naZpT0EYCH0l68+6dFCMHxKurwdfXkPO99XPEjMK+4RBmjgJ9Ta7b9NsBkaifI4eNG2cbDZfPQm4SJFX9Lh/zr1lbSPTonc86ZzjLmDgp9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uwY0cRq5yi/CyxEQ7rTTlWH1c9ghdBx9hVPEYMUHfHQ=;
 b=XkNNEoBwz84Kntjf8eOmBKliMqq1JIQIBNPZsjudc8Oqq75f/1Favg8H5DnoZ43pVOw8+0gBSW/2QxzzCAcRaKDLLI5pNDyVpQWVMt/mFAxrG1C6i/LkzMFmp9BcXThXBrQ5jIxTVmtvNH2wY64bn/gZ8Efx3nb4N+YQTTk0GcqeD5FIM31xEZhPdpWeiw2p0hxUu4yJ0W0c+PA1n7Z4PSa21TUTbmvnxBfYL4HIdHndfBMfY1Z2/qgtJZKLaIu4IaAU510GadAoK8oJpeoU7j9wdjWkfRSyBupfICYxBKLmkV2VYLMAI96t4oMloX8UliEqnw+12zfHfsl8HWKqMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uwY0cRq5yi/CyxEQ7rTTlWH1c9ghdBx9hVPEYMUHfHQ=;
 b=AM43o2DYgJ9JeZV3wQn3T/kxj5P334sfjouogLmSL5U4oBgUHyAgwXrec4ZP82uJUee08saso2zeTYxjUGI7gFXi+binwnzD7YI0s0qES4HOLSgcWjyMVLEyZzVNlJedrjMglo5HVU7D4w13ti2cqERILmIUaXnKfZCAw+JjIjo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <703ccd1b-1908-4f5b-3b48-e02d317a2090@amd.com>
Date: Thu, 1 Jun 2023 13:48:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] xen/arm: debug-pl011: Use 32-bit accessors for broader
 compatibility
Content-Language: en-US
To: Julien Grall <julien.grall.oss@gmail.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
References: <20230601085001.1782-1-michal.orzel@amd.com>
 <7C760D1D-DAAE-48AC-8B2B-E6140452BE4A@arm.com>
 <73a143ee-8301-e0c0-a3fc-83ec10441c4c@amd.com>
 <CAJ=z9a3iZHwXPwWiJykeSJbi0YvfD-L6SO3LxxRom=DPAqPuVg@mail.gmail.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <CAJ=z9a3iZHwXPwWiJykeSJbi0YvfD-L6SO3LxxRom=DPAqPuVg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT005:EE_|BY5PR12MB4259:EE_
X-MS-Office365-Filtering-Correlation-Id: b655b705-f8e8-4bcf-36c2-08db62962e35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SnfQ0RmhINA9wficcgvjoQrJXe2w1MpLfk7a6PNdMenz1Lqx6T/Ij45JHPGYvXgzOx6RIlBuoGbHxMjThzi+FERMLg1z+JB/5g2HmdpZoiwDH+/gMnza2UndPMVFGb+L7cvOcbOY2IAI2Ij9JaJkBPOMosBgjFjVOWIxV5QUJV0Ym4p6rIJuYj1ESDkPgnpK0jrroOsTplIJBZgWN9HK7ay+rw730aZ6XJC1gqFni2AMK4oUB78SKyU7vSgsX8lO/8tTDTl/UgCy+ul+gdnTYb00243U/vjh4yjiQTFPeEothy8QDKDfR35NXbHvG5i460eN1zOWlXBesAgRJZelfQf0ZnQklhoSpHAUPs/gu/RQzSETfqoPHdeGSubnkNIvCZijwCQ5i4Oyv8dXNt8RCs1csueFxhnS7pDrIlrsNFhve4s6HqqMv37JWscA2kQcT96VwVxMisfwyeTeMYP4NYvASUGmheSmOa3MokQVQPcuRSddB28QKrYpuIxlegDb/225f4hsTE7uGjQozpu4f+og2qB15mXU39yrQL3sm7Ryr44vdL3w5i4EIWAUa9TAXNsvisJlWCb5cHlYpvb6rnaMotOAhCJd1c2yELXGriXj7zft50zAfYavHmr64aO9uVoJOIVwKgNIwawGFLnJAcQaSN4ZyMaFwGyryWsUUK+ASfZz72lyc6YmqP7i31TTNP8Yd14cX+TEguEs1fi/33ld2SUTBZnUvqQ+vAXwuP/XnUab3zPGO+dcyRtV2a95kX8kxrllnUKQP3VLmLfoXnODgEZP9b/3dvMcN/e4YNw=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39860400002)(136003)(346002)(451199021)(40470700004)(36840700001)(46966006)(41300700001)(40460700003)(5660300002)(186003)(82310400005)(8936002)(40480700001)(8676002)(53546011)(36756003)(6916009)(36860700001)(26005)(4326008)(16576012)(356005)(44832011)(81166007)(316002)(2906002)(54906003)(70206006)(83380400001)(70586007)(31686004)(426003)(47076005)(336012)(478600001)(2616005)(31696002)(82740400003)(86362001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 11:48:56.2444
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b655b705-f8e8-4bcf-36c2-08db62962e35
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4259

Hi Julien,

On 01/06/2023 13:12, Julien Grall wrote:
> 	
> 
> 
> Hi,
> 
> Sorry for the formatting.
> 
> On Thu, 1 Jun 2023 at 12:31, Michal Orzel <michal.orzel@amd.com <mailto:michal.orzel@amd.com>> wrote:
> 
>     Hi Bertrand,
> 
>     On 01/06/2023 12:19, Bertrand Marquis wrote:
>     >
>     >
>     > Hi Michal,
>     >
>     >> On 1 Jun 2023, at 10:50, Michal Orzel <michal.orzel@amd.com <mailto:michal.orzel@amd.com>> wrote:
>     >>
>     >> There are implementations of the PL011 that can only handle 32-bit
>     >> accesses (i.e. no 16-bit or 8-bit), usually advertised by 'reg-io-width'
>     >> dt property set to 4. On such UARTs, the current early printk code for
>     >> arm64 does not work. To fix this issue, make all the accesses to be 32-bit
>     >> by using ldr, str without a size field. This makes it possible to use
>     >> early printk on such platforms, while all the other implementations should
>     >> generally cope with 32-bit accesses. In case they do not, they would
>     >> already fail as we explicitly use writel/readl in the runtime driver to
>     >> maintain broader compatibility and to be SBSAv2 compliant. Therefore, this
>     >> change makes the runtime/early handling consistent (also it matches the
>     >> arm32 debug-pl011 code).
>     >>
>     >> Signed-off-by: Michal Orzel <michal.orzel@amd.com <mailto:michal.orzel@amd.com>>
>     >> ---
>     >> xen/arch/arm/arm64/debug-pl011.inc | 8 ++++----
>     >> 1 file changed, 4 insertions(+), 4 deletions(-)
>     >>
>     >> diff --git a/xen/arch/arm/arm64/debug-pl011.inc b/xen/arch/arm/arm64/debug-pl011.inc
>     >> index 6d60e78c8ba3..80eb8fdc1ec7 100644
>     >> --- a/xen/arch/arm/arm64/debug-pl011.inc
>     >> +++ b/xen/arch/arm/arm64/debug-pl011.inc
>     >> @@ -25,9 +25,9 @@
>     >>  */
>     >> .macro early_uart_init xb, c
>     >>         mov   x\c, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE % 16)
>     >> -        strh  w\c, [\xb, #FBRD]      /* -> UARTFBRD (Baud divisor fraction) */
>     >> +        str   w\c, [\xb, #FBRD]      /* -> UARTFBRD (Baud divisor fraction) */
>     >>         mov   x\c, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE / 16)
>     >> -        strh  w\c, [\xb, #IBRD]      /* -> UARTIBRD (Baud divisor integer) */
>     >> +        str   w\c, [\xb, #IBRD]      /* -> UARTIBRD (Baud divisor integer) */
>     >>         mov   x\c, #WLEN_8           /* 8n1 */
>     >>         str   w\c, [\xb, #LCR_H]     /* -> UARTLCR_H (Line control) */
>     >>         ldr   x\c, =(RXE | TXE | UARTEN)
>     >> @@ -41,7 +41,7 @@
>     >>  */
>     >> .macro early_uart_ready xb, c
>     >> 1:
>     >> -        ldrh  w\c, [\xb, #FR]        /* <- UARTFR (Flag register) */
>     >> +        ldr   w\c, [\xb, #FR]        /* <- UARTFR (Flag register) */
>     >>         tst   w\c, #BUSY             /* Check BUSY bit */
>     >>         b.ne <http://b.ne>  1b                     /* Wait for the UART to be ready */
>     >> .endm
>     >> @@ -52,7 +52,7 @@
>     >>  * wt: register which contains the character to transmit
>     >>  */
>     >> .macro early_uart_transmit xb, wt
>     >> -        strb  \wt, [\xb, #DR]        /* -> UARTDR (Data Register) */
>     >> +        str   \wt, [\xb, #DR]        /* -> UARTDR (Data Register) */
>     >
>     > Is it really ok to drop the 8bit access here ?
>     It is not only ok, it is necessary. Otherwise it won't work on the above mentioned UARTs (they can only perform 32-bit access).
> 
> 
> IIRC some compilers will complain because you use wN with “str”.
Hmm, I would expect it to be totally ok as the size is determined by the reg name. Any reference?

> 
> 
>     And following to what I wrote in commit msg:
>     - we use str already in arm32 which results in 32-bit access
> 
> 
>     - we use reald/writel that end up as str/ldr in runtime driver
> 
> 
>     - we are down to SBSAv2 spec that runtime driver follows (meaning we can use early printk for SBSA too)
> 
> 
> The runtime driver is meant to follow the PL011 spec first and may have some adaptation for SBSA.
> 
> 
>     - this way we support broader list of PL011s consistently (i.e. both early and runtime driver works as oppose to only runtime)
> 
> 
>  I am not sure I agree here. You are focussing on HW that only support 32-bit access. And, AFAICT this shouldn’t be the norm.
I'm focusing on supporting wider range of devices.
At the moment Xen PL011 runtime makes 32-bit accesses while early code makes 8/16-bit accesses (arm32 uses 32-bit only as well).
So my patch can only improve things and not make them worse. In case of some very old legacy device that cannot cope with 32-bit accesses,
such device would not work anyway with the runtime driver. Also, while I'm aware of platforms with 32-bit only UART and the normal one
that can cope with 32-bit as well, I'm not aware of any legacy one that cannot do that.

Adding a config option like EARLY_UART_PL011_MMIO32 would be ok but it would require to also modify arm32 early printk and runtime driver.
Not mentioning things that we somehow do not want to look at like hardcoded 7372800 HZ frequency for early_uart_init we can just pray
to match the HW UART clock or other not PL011 spec things (i.e. incorrect FIFO size for most modern UARTs).

But if this is what you require, I'm somewhat forced to do so just so that our devices can be supported.

~Michal

