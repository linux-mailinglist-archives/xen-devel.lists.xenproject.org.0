Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C66FF719C4C
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 14:39:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542454.846330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4hZU-00025n-5E; Thu, 01 Jun 2023 12:38:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542454.846330; Thu, 01 Jun 2023 12:38:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4hZU-00022w-2H; Thu, 01 Jun 2023 12:38:28 +0000
Received: by outflank-mailman (input) for mailman id 542454;
 Thu, 01 Jun 2023 12:38:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4ef9=BV=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1q4hZS-00022q-Px
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 12:38:26 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20614.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31eeb0a1-0079-11ee-b231-6b7b168915f2;
 Thu, 01 Jun 2023 14:38:24 +0200 (CEST)
Received: from MW4PR04CA0145.namprd04.prod.outlook.com (2603:10b6:303:84::30)
 by PH7PR12MB6659.namprd12.prod.outlook.com (2603:10b6:510:210::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Thu, 1 Jun
 2023 12:38:19 +0000
Received: from CO1NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:84:cafe::ce) by MW4PR04CA0145.outlook.office365.com
 (2603:10b6:303:84::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23 via Frontend
 Transport; Thu, 1 Jun 2023 12:38:18 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT051.mail.protection.outlook.com (10.13.174.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.24 via Frontend Transport; Thu, 1 Jun 2023 12:38:18 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Jun
 2023 07:38:17 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 1 Jun 2023 07:38:16 -0500
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
X-Inumbo-ID: 31eeb0a1-0079-11ee-b231-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kr+xhwWsDl0rdPBWUh8k7ddfTqorCBOgYmqvp3SexkZUcxqiXx6eHhHndUHe2a74DwSnD+AbnGmb4Y9Jk9iX4hY9+0obmXDE/Xo8JouCExxTtxGHVhIjmTmOGhrxw12ZAn2GHH/CtxiZaD4Hw4FlXE+x995B1rP7ZqIHwLB16LUXuQPzmUQ4b3+B63hOVR0kSa55G0G1ZBOPLz8gMQ1liOmvuu1rCcdD7l136i+dp8kDJTHQfWquyj/VLTaYLRoJpMe6PDXv8BiwKN4bpMOPKWXk+61cpCbuhWfiqQlib+YYfBe3KLzvZfy2lsk2A3z9c2yC6oHHojPNsjhB4hCaYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gAd2bTMII8cogo7mKeqLKXCFn0VtUzbGe3XIypelxc8=;
 b=Zxsiz7nGZUcHDSulqYHshFy06TZuE+213HwoaxFsb4fey5mMmW/YcpBFAX715VZhYc8FCSTxaERURMGkJ3JJ1aK1jiQxA+hGCmq25krjyzw0qNXrteC3nTRK2oe0WqeWmCXiF4QXdVqk9E7qx50tBioNIav52381rFLhJ0gvaItUQLhaSCGY0JH28EhaVVxEwzrAbxuDa7kNa+Pp/rN8Y525rarNfxi6XEO0rErWJbPCVobwLlZLqSs1CinbKEiinMVlyUPSzxuvl51cX77uxjXikCzJtArU+UOZ9oe6Apv0fcmR51IfS5NkNDI08wxLyGfZpcsHkJ2snT/60uDCeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gAd2bTMII8cogo7mKeqLKXCFn0VtUzbGe3XIypelxc8=;
 b=OXuFq0z7n0vaIQo/RoGAqu9S0lYDzrdmsxf3qjMpdamLEXuGZ0D2OhSiFrClqpQyNG83D+0fksvnxpDc8tYxAWgI2lMnyZYXQnbKR1exPp1wTKq0qKOfEqvZxgGob7Ix7Qcd25XfaJ2uQn3iT7ioRGGXjNCjfxgwMCYsnbR5320=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <bf9e8ba1-5ca9-d958-8e09-3f74710fd830@amd.com>
Date: Thu, 1 Jun 2023 14:38:16 +0200
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
 <703ccd1b-1908-4f5b-3b48-e02d317a2090@amd.com>
 <CAJ=z9a1V2XNKyc9gQjxhqRmTjpfamQfC5DfZfXZ15VoNqp2wNQ@mail.gmail.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <CAJ=z9a1V2XNKyc9gQjxhqRmTjpfamQfC5DfZfXZ15VoNqp2wNQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT051:EE_|PH7PR12MB6659:EE_
X-MS-Office365-Filtering-Correlation-Id: 64b5b303-f4ee-4378-ea2f-08db629d13de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9kuK9T1ColFTLgRgR5LWBJLsIKvRiOeglHTgC3vMRkL/V6Q0p9utpJ1jexHMMxa+558zpW6+Oeyz5A0T+Axr1JOx+Gpq60bxVvifAHpKx+6Maz+nPGEhqtVDzXZH/mhYTogTYNG/3t9bJX73xutnvMciQp/yl0/hWyHNeAZVhKYy1ZTrLuozQNKGpoHUhS3Yrwl+VlLl2nCiDRAjw008wzjv3ydqbFngAyhf65RB/yjaEwk/kOk0yAHZK+t59EYl3hzdVPtgh1zoQG3PozK4P4pmFPWF36I0r2h5PuHFUPKYuf7bO6LhLk7Ukv7bO45psJFq+5gucgExdzG37MWdTie0dCSnBHwIHeG4tm84KT4DA6VLqO/BmP0+n07F1OZJY2ZXOjvbB0ojM6OoOzGrxvKbK50bjfZkxyqspY32V7XeGvccB8S2pAGYQgN0Z7QxszY6Zk0yoSEq4vm/AYCiYx9OavW2X04xdp82YlypHML1VHzmyiSZ87mOGXByqtQ6XwQsNxywzpgRghBmEMtEhtcHtpqlYC44kKm5OPkj2kp98KcmnG8hK7uPI87NJc22mr6zDKXBM8Ox15ao/PmSXSv3Tjhc0bYN2bJOhx9YZV5D02fPg7iALR56onaSN3blu7pmErREH0ScGpbTpWJhrlek5y7fnYCnZD79lWqBuuTva9bYs9KEegYTp7I6DfFO7esSBIAfJy70E5gGU5y2KH7eJorEu5+l+9t9Gno8fviLv7sqXFZ16mh50V3pvTNxFEgBrTnUZMhKp1E8mWJaq9YKF9HVBL0csSaisQZwSJA=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(39860400002)(346002)(451199021)(36840700001)(46966006)(40470700004)(81166007)(2906002)(31686004)(336012)(356005)(31696002)(86362001)(82310400005)(41300700001)(8936002)(186003)(8676002)(82740400003)(2616005)(478600001)(53546011)(426003)(26005)(16576012)(54906003)(316002)(47076005)(83380400001)(6916009)(70586007)(70206006)(4326008)(36756003)(36860700001)(44832011)(5660300002)(40460700003)(40480700001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 12:38:18.4414
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64b5b303-f4ee-4378-ea2f-08db629d13de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6659


On 01/06/2023 14:17, Julien Grall wrote:
> 	
> 
> 
> 
> 
> On Thu, 1 Jun 2023 at 13:48, Michal Orzel <michal.orzel@amd.com <mailto:michal.orzel@amd.com>> wrote:
> 
>     Hi Julien,
> 
>     On 01/06/2023 13:12, Julien Grall wrote:
>     >       
>     >
>     >
>     > Hi,
>     >
>     > Sorry for the formatting.
>     >
>     > On Thu, 1 Jun 2023 at 12:31, Michal Orzel <michal.orzel@amd.com <mailto:michal.orzel@amd.com> <mailto:michal.orzel@amd.com <mailto:michal.orzel@amd.com>>> wrote:
>     >
>     >     Hi Bertrand,
>     >
>     >     On 01/06/2023 12:19, Bertrand Marquis wrote:
>     >     >
>     >     >
>     >     > Hi Michal,
>     >     >
>     >     >> On 1 Jun 2023, at 10:50, Michal Orzel <michal.orzel@amd.com <mailto:michal.orzel@amd.com> <mailto:michal.orzel@amd.com <mailto:michal.orzel@amd.com>>> wrote:
>     >     >>
>     >     >> There are implementations of the PL011 that can only handle 32-bit
>     >     >> accesses (i.e. no 16-bit or 8-bit), usually advertised by 'reg-io-width'
>     >     >> dt property set to 4. On such UARTs, the current early printk code for
>     >     >> arm64 does not work. To fix this issue, make all the accesses to be 32-bit
>     >     >> by using ldr, str without a size field. This makes it possible to use
>     >     >> early printk on such platforms, while all the other implementations should
>     >     >> generally cope with 32-bit accesses. In case they do not, they would
>     >     >> already fail as we explicitly use writel/readl in the runtime driver to
>     >     >> maintain broader compatibility and to be SBSAv2 compliant. Therefore, this
>     >     >> change makes the runtime/early handling consistent (also it matches the
>     >     >> arm32 debug-pl011 code).
>     >     >>
>     >     >> Signed-off-by: Michal Orzel <michal.orzel@amd.com <mailto:michal.orzel@amd.com> <mailto:michal.orzel@amd.com <mailto:michal.orzel@amd.com>>>
>     >     >> ---
>     >     >> xen/arch/arm/arm64/debug-pl011.inc | 8 ++++----
>     >     >> 1 file changed, 4 insertions(+), 4 deletions(-)
>     >     >>
>     >     >> diff --git a/xen/arch/arm/arm64/debug-pl011.inc b/xen/arch/arm/arm64/debug-pl011.inc
>     >     >> index 6d60e78c8ba3..80eb8fdc1ec7 100644
>     >     >> --- a/xen/arch/arm/arm64/debug-pl011.inc
>     >     >> +++ b/xen/arch/arm/arm64/debug-pl011.inc
>     >     >> @@ -25,9 +25,9 @@
>     >     >>  */
>     >     >> .macro early_uart_init xb, c
>     >     >>         mov   x\c, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE % 16)
>     >     >> -        strh  w\c, [\xb, #FBRD]      /* -> UARTFBRD (Baud divisor fraction) */
>     >     >> +        str   w\c, [\xb, #FBRD]      /* -> UARTFBRD (Baud divisor fraction) */
>     >     >>         mov   x\c, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE / 16)
>     >     >> -        strh  w\c, [\xb, #IBRD]      /* -> UARTIBRD (Baud divisor integer) */
>     >     >> +        str   w\c, [\xb, #IBRD]      /* -> UARTIBRD (Baud divisor integer) */
>     >     >>         mov   x\c, #WLEN_8           /* 8n1 */
>     >     >>         str   w\c, [\xb, #LCR_H]     /* -> UARTLCR_H (Line control) */
>     >     >>         ldr   x\c, =(RXE | TXE | UARTEN)
>     >     >> @@ -41,7 +41,7 @@
>     >     >>  */
>     >     >> .macro early_uart_ready xb, c
>     >     >> 1:
>     >     >> -        ldrh  w\c, [\xb, #FR]        /* <- UARTFR (Flag register) */
>     >     >> +        ldr   w\c, [\xb, #FR]        /* <- UARTFR (Flag register) */
>     >     >>         tst   w\c, #BUSY             /* Check BUSY bit */
>     >     >>         b.ne <http://b.ne> <http://b.ne <http://b.ne>>  1b                     /* Wait for the UART to be ready */
>     >     >> .endm
>     >     >> @@ -52,7 +52,7 @@
>     >     >>  * wt: register which contains the character to transmit
>     >     >>  */
>     >     >> .macro early_uart_transmit xb, wt
>     >     >> -        strb  \wt, [\xb, #DR]        /* -> UARTDR (Data Register) */
>     >     >> +        str   \wt, [\xb, #DR]        /* -> UARTDR (Data Register) */
>     >     >
>     >     > Is it really ok to drop the 8bit access here ?
>     >     It is not only ok, it is necessary. Otherwise it won't work on the above mentioned UARTs (they can only perform 32-bit access).
>     >
>     >
>     > IIRC some compilers will complain because you use wN with “str”.
>     Hmm, I would expect it to be totally ok as the size is determined by the reg name. Any reference?
> 
> 
> I don’t have the spec with me. I will have a look on Monday and reply back here.
> 
> 
> 
>     >
>     >
>     >     And following to what I wrote in commit msg:
>     >     - we use str already in arm32 which results in 32-bit access
>     >
>     >
>     >     - we use reald/writel that end up as str/ldr in runtime driver
>     >
>     >
>     >     - we are down to SBSAv2 spec that runtime driver follows (meaning we can use early printk for SBSA too)
>     >
>     >
>     > The runtime driver is meant to follow the PL011 spec first and may have some adaptation for SBSA.
>     >
>     >
>     >     - this way we support broader list of PL011s consistently (i.e. both early and runtime driver works as oppose to only runtime)
>     >
>     >
>     >  I am not sure I agree here. You are focussing on HW that only support 32-bit access. And, AFAICT this shouldn’t be the norm.
>     I'm focusing on supporting wider range of devices.
>     At the moment Xen PL011 runtime makes 32-bit accesses while early code makes 8/16-bit accesses (arm32 uses 32-bit only as well).
>     So my patch can only improve things and not make them worse. In case of some very old legacy device that cannot cope with 32-bit accesses,
>     such device would not work anyway with the runtime driver.
> 
> 
> It depends how you approach the problem. From my POV, a user that can’t see logs will likely try to enable the early UART. Then they could debug the runtime driver. With your proposal, this would even be broken.
> 
>     Also, while I'm aware of platforms with 32-bit only UART and the normal one
>     that can cope with 32-bit as well, I'm not aware of any legacy one that cannot do that.
> 
> 
> I am under the impression that the default behaviour on Linux is to use non 32-big access. I would not want to diverge from that.
> 
> 
> 
>     Adding a config option like EARLY_UART_PL011_MMIO32 would be ok but it would require to also modify arm32 early printk and runtime driver.
> 
> 
> I don’t view it as a requirement. It would be OK to have it only available for 64-but at the beginning. Same for the runtime.
> 
> 
>     Not mentioning things that we somehow do not want to look at like hardcoded 7372800 HZ frequency for early_uart_init we can just pray
>     to match the HW UART clock or other not PL011 spec things (i.e. incorrect FIFO size for most modern UARTs).
> 
> 
> I am aware of this issue but I don’t understand how this is related to this discussion.
> 
> My only request is you don’t break the existing behavior of the early PL011 driver on arm64.
I understand your concern about legacy devices and that you do not want to break the existing code on arm64.
But please correct me if I'm wrong. These two lines:
str   w\c, [\xb, #LCR_H]
str   w\c, [\xb, #CR]

already make 32-bit accesses, meaning our early driver does not support legacy devices anyway.
You can say it is part of early_uart_init that is not often used but still you cannot really say
that our current code supports such devices.

Anyway, I will then first prepare a fix for the current code and then add support for mmio32 only.

~Michal

