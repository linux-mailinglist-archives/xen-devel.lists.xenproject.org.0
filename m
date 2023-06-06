Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4983372385A
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jun 2023 09:05:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543977.849392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6Qjw-0003Iv-Me; Tue, 06 Jun 2023 07:04:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543977.849392; Tue, 06 Jun 2023 07:04:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6Qjw-0003Fu-Jz; Tue, 06 Jun 2023 07:04:24 +0000
Received: by outflank-mailman (input) for mailman id 543977;
 Tue, 06 Jun 2023 07:04:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uUj8=B2=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1q6Qjv-0003Fo-0M
 for xen-devel@lists.xenproject.org; Tue, 06 Jun 2023 07:04:23 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062c.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59ee89f9-0438-11ee-8611-37d641c3527e;
 Tue, 06 Jun 2023 09:04:18 +0200 (CEST)
Received: from CY5PR15CA0042.namprd15.prod.outlook.com (2603:10b6:930:1b::26)
 by MN2PR12MB4421.namprd12.prod.outlook.com (2603:10b6:208:26c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 6 Jun
 2023 07:04:14 +0000
Received: from CY4PEPF0000E9D5.namprd05.prod.outlook.com
 (2603:10b6:930:1b:cafe::37) by CY5PR15CA0042.outlook.office365.com
 (2603:10b6:930:1b::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33 via Frontend
 Transport; Tue, 6 Jun 2023 07:04:13 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D5.mail.protection.outlook.com (10.167.241.76) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6477.13 via Frontend Transport; Tue, 6 Jun 2023 07:04:12 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Jun
 2023 02:04:12 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 6 Jun 2023 02:04:11 -0500
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
X-Inumbo-ID: 59ee89f9-0438-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TgAu4CrTcoxXqfAXPzSqxh5Ty+5I6I7evoBIKNX2A+1/CrV/3fi4c7ZYLv5lsV9UwzoXOVoADj/h89WRQ/AQWc+jVVzcXHelVrwdLNaPzC2sDU59TR1CSRlrxgXMG+1BFrETXB3+aAAsKZpfifV3vV55ziOqyAs+LYeFQJHbTHx2WEbaSh4p/gUi3n37D8b+tSb/5ElEElIz3F5DHp/LlcChZNxV2P4fctDeATNoBmVG2fKYGmbBy9yxbPC3N3MymgMK9T0LzvAjOA7lSuucnaA3V4ss2zAiqrtH8uC5GraxJDo82ZUxVUjQqNSscz9K4vFooSFtvC8cYmFhfMip0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4qoV61CpfrrxkgOcH7g/z7ku5umPu3fbbzKttZeJESI=;
 b=Z6kIpdDy4smiG0c237O8u+24iP2Ni1IlcP5PvEfzqqTyc+9gwH3JxzmhJdZyO13wsXXLk7TTLrv+jO/bxrTBtHP6hGy/04aOk4/TOTkwUNfmkdx57Qtlzy4RH4dOC8zlOMPR08sQ/+E+rZtXGJwMUhEbm95O0SEvB8hC1q8LrLwtzaN6j/0r8PSelMYBf1UbQOJBhekAE+FO3Gr2E7ovFFOQOZlw9JHLUSk5+NGIuIo+qomFM8RoUGy1ljeRHUTcAslsfN1vwYvBlizUGPHzbA1AiW6Y12elLO1ogT+QfmkjaCi6nCLwOMtji4vRWiqMlCV5S5ty18WZ2SvVdXNriA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4qoV61CpfrrxkgOcH7g/z7ku5umPu3fbbzKttZeJESI=;
 b=BnZ6N9+BpJfSu2VTiEicrSS41YJACKDU2qx0QTqUgEp5tf86fvH547yv8p59mjp9TOzFjqfMz5GhR5RGOOmiaTcWrYR3lhZb7Hi3uLTYATI2jJ5+KH+xxLScNAfJutfR9aWHbd77149FCiTaehH6yLyBKdCp5csmEoSS+MJAk2k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <bb0c409e-7d92-cb5e-a34e-56993aad2121@amd.com>
Date: Tue, 6 Jun 2023 09:04:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] xen/arm: debug-pl011: Use 32-bit accessors for broader
 compatibility
To: Julien Grall <julien@xen.org>, Julien Grall <julien.grall.oss@gmail.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
References: <20230601085001.1782-1-michal.orzel@amd.com>
 <7C760D1D-DAAE-48AC-8B2B-E6140452BE4A@arm.com>
 <73a143ee-8301-e0c0-a3fc-83ec10441c4c@amd.com>
 <CAJ=z9a3iZHwXPwWiJykeSJbi0YvfD-L6SO3LxxRom=DPAqPuVg@mail.gmail.com>
 <703ccd1b-1908-4f5b-3b48-e02d317a2090@amd.com>
 <CAJ=z9a1V2XNKyc9gQjxhqRmTjpfamQfC5DfZfXZ15VoNqp2wNQ@mail.gmail.com>
 <bf9e8ba1-5ca9-d958-8e09-3f74710fd830@amd.com>
 <bec29c53-cade-9686-6ade-0f61f4bde27d@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <bec29c53-cade-9686-6ade-0f61f4bde27d@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D5:EE_|MN2PR12MB4421:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f5f8c78-dbb0-4cc6-ccf1-08db665c3bdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BYb2maHeIELKJIXET+4CfWsGr6JNVQGqSWeWPl+QvMvIVx6kNCRZ3kOtzBX7haMULOKBFdTFObChfE1I6MhATEZusCc4TzmPkMRVBhSM4fIL2W0L+lgjbFfG+ATrE5ZPlD2lqF3BP2SXHjGiW2kLdsjin2fbktjxPf2RNm5GkAx2rN00uKaF4X7XmBXrZtR24V1/m35MXiTAkoKfdSMKL+xlXVQJ97ncOJvxN6NMlTH1q0y3v4l71UTuqg7SqMNdvIVejr9CTJY68e6G5CiNLpW8cNrO9qtcJ5wMIaRA1R7/Lv41Y6YbjnWyjnv9qb0CZu2RhQgWYWNkvfZCGhn8U472+9XszSiqEfntbLt6md2pytTdqhPP2FUc2nM9yTF5BESOjpypq0AUurwYKIFu+wN5gSnsTarFbXkLI1lDB4pYa4N7/15WFX9RQZIjBxr4TKNdyNnvijgIs4MXtSifMYWZJ2Yxdjcm0Vd7PmsEKX3+Qej4RoX9KzMNKu/F9IRq8IqbFLjc6GyVAHL9xsX9iP0UCnGUPzuar6ah696xlX/9kVIBF+vRWTmF3dOjykuL7tVvvLrDLY+nsvAPfNm79RrBxeXr3Em/8JDWB5IfD+fQmp4hiDLQf7Sq+wurwofOm64yKICjSo/BRZdO3P07OTY2fdIfCk8sil9AJrlsXRf6+/K+zw7vx6lricipCC07ztdjecHZuv7DrswhP9/APuF8oHvmoqyU8qpszcWpORCKin6AK5gybrJLfu3LqbjvtXVSPheDj78jq14BIHU4zSxDGcMsi2PZKrpzAzv3NYM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(346002)(376002)(451199021)(40470700004)(36840700001)(46966006)(83380400001)(40460700003)(47076005)(426003)(336012)(2906002)(2616005)(36756003)(31696002)(86362001)(82310400005)(356005)(81166007)(82740400003)(36860700001)(40480700001)(316002)(41300700001)(5660300002)(8676002)(8936002)(478600001)(110136005)(16576012)(54906003)(70586007)(70206006)(4326008)(31686004)(53546011)(26005)(186003)(44832011)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 07:04:12.9404
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f5f8c78-dbb0-4cc6-ccf1-08db665c3bdb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4421

Hi Julien,

On 05/06/2023 20:34, Julien Grall wrote:
> 
> 
> Hi,
> 
> On 01/06/2023 13:38, Michal Orzel wrote:
>>
>> On 01/06/2023 14:17, Julien Grall wrote:
>>>
>>>
>>>
>>>
>>>
>>> On Thu, 1 Jun 2023 at 13:48, Michal Orzel <michal.orzel@amd.com <mailto:michal.orzel@amd.com>> wrote:
>>>
>>>      Hi Julien,
>>>
>>>      On 01/06/2023 13:12, Julien Grall wrote:
>>>      >
>>>      >
>>>      >
>>>      > Hi,
>>>      >
>>>      > Sorry for the formatting.
>>>      >
>>>      > On Thu, 1 Jun 2023 at 12:31, Michal Orzel <michal.orzel@amd.com <mailto:michal.orzel@amd.com> <mailto:michal.orzel@amd.com <mailto:michal.orzel@amd.com>>> wrote:
>>>      >
>>>      >     Hi Bertrand,
>>>      >
>>>      >     On 01/06/2023 12:19, Bertrand Marquis wrote:
>>>      >     >
>>>      >     >
>>>      >     > Hi Michal,
>>>      >     >
>>>      >     >> On 1 Jun 2023, at 10:50, Michal Orzel <michal.orzel@amd.com <mailto:michal.orzel@amd.com> <mailto:michal.orzel@amd.com <mailto:michal.orzel@amd.com>>> wrote:
>>>      >     >>
>>>      >     >> There are implementations of the PL011 that can only handle 32-bit
>>>      >     >> accesses (i.e. no 16-bit or 8-bit), usually advertised by 'reg-io-width'
>>>      >     >> dt property set to 4. On such UARTs, the current early printk code for
>>>      >     >> arm64 does not work. To fix this issue, make all the accesses to be 32-bit
>>>      >     >> by using ldr, str without a size field. This makes it possible to use
>>>      >     >> early printk on such platforms, while all the other implementations should
>>>      >     >> generally cope with 32-bit accesses. In case they do not, they would
>>>      >     >> already fail as we explicitly use writel/readl in the runtime driver to
>>>      >     >> maintain broader compatibility and to be SBSAv2 compliant. Therefore, this
>>>      >     >> change makes the runtime/early handling consistent (also it matches the
>>>      >     >> arm32 debug-pl011 code).
>>>      >     >>
>>>      >     >> Signed-off-by: Michal Orzel <michal.orzel@amd.com <mailto:michal.orzel@amd.com> <mailto:michal.orzel@amd.com <mailto:michal.orzel@amd.com>>>
>>>      >     >> ---
>>>      >     >> xen/arch/arm/arm64/debug-pl011.inc | 8 ++++----
>>>      >     >> 1 file changed, 4 insertions(+), 4 deletions(-)
>>>      >     >>
>>>      >     >> diff --git a/xen/arch/arm/arm64/debug-pl011.inc b/xen/arch/arm/arm64/debug-pl011.inc
>>>      >     >> index 6d60e78c8ba3..80eb8fdc1ec7 100644
>>>      >     >> --- a/xen/arch/arm/arm64/debug-pl011.inc
>>>      >     >> +++ b/xen/arch/arm/arm64/debug-pl011.inc
>>>      >     >> @@ -25,9 +25,9 @@
>>>      >     >>  */
>>>      >     >> .macro early_uart_init xb, c
>>>      >     >>         mov   x\c, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE % 16)
>>>      >     >> -        strh  w\c, [\xb, #FBRD]      /* -> UARTFBRD (Baud divisor fraction) */
>>>      >     >> +        str   w\c, [\xb, #FBRD]      /* -> UARTFBRD (Baud divisor fraction) */
>>>      >     >>         mov   x\c, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE / 16)
>>>      >     >> -        strh  w\c, [\xb, #IBRD]      /* -> UARTIBRD (Baud divisor integer) */
>>>      >     >> +        str   w\c, [\xb, #IBRD]      /* -> UARTIBRD (Baud divisor integer) */
>>>      >     >>         mov   x\c, #WLEN_8           /* 8n1 */
>>>      >     >>         str   w\c, [\xb, #LCR_H]     /* -> UARTLCR_H (Line control) */
>>>      >     >>         ldr   x\c, =(RXE | TXE | UARTEN)
>>>      >     >> @@ -41,7 +41,7 @@
>>>      >     >>  */
>>>      >     >> .macro early_uart_ready xb, c
>>>      >     >> 1:
>>>      >     >> -        ldrh  w\c, [\xb, #FR]        /* <- UARTFR (Flag register) */
>>>      >     >> +        ldr   w\c, [\xb, #FR]        /* <- UARTFR (Flag register) */
>>>      >     >>         tst   w\c, #BUSY             /* Check BUSY bit */
>>>      >     >>         b.ne <http://b.ne> <http://b.ne <http://b.ne>>  1b                     /* Wait for the UART to be ready */
>>>      >     >> .endm
>>>      >     >> @@ -52,7 +52,7 @@
>>>      >     >>  * wt: register which contains the character to transmit
>>>      >     >>  */
>>>      >     >> .macro early_uart_transmit xb, wt
>>>      >     >> -        strb  \wt, [\xb, #DR]        /* -> UARTDR (Data Register) */
>>>      >     >> +        str   \wt, [\xb, #DR]        /* -> UARTDR (Data Register) */
>>>      >     >
>>>      >     > Is it really ok to drop the 8bit access here ?
>>>      >     It is not only ok, it is necessary. Otherwise it won't work on the above mentioned UARTs (they can only perform 32-bit access).
>>>      >
>>>      >
>>>      > IIRC some compilers will complain because you use wN with “str”.
>>>      Hmm, I would expect it to be totally ok as the size is determined by the reg name. Any reference?
>>>
>>>
>>> I don’t have the spec with me. I will have a look on Monday and reply back here.
> 
> I had another look at this. You are right, "str" can work with wN or xN.
> I got confused because in the past the issue we had was with the asm
> volatile with 'msr' (see 57e761b60dc9 "xen/arm64: Remove
> READ/WRITE_SYSREG32 helper macros").
> 
> [...]
> 
>>> I am aware of this issue but I don’t understand how this is related to this discussion.
>>>
>>> My only request is you don’t break the existing behavior of the early PL011 driver on arm64.
>> I understand your concern about legacy devices and that you do not want to break the existing code on arm64.
>> But please correct me if I'm wrong. These two lines:
>> str   w\c, [\xb, #LCR_H]
>> str   w\c, [\xb, #CR]
> 
> Hmmm... Looking at the spec, LCR_H is meant to be 8-bit and CR 16-bit.
> So I think we need to modify both of them. I am happy to send a patch
> separately for that either before or after your patch.

There are other cases like FBRD being 6bit so we could use strb instead of strh.
In any case, I will handle all of that in a consistent manner by sending a series that should not take much time.

I can think of the following patches:
1) Use correct accessors for early pl011 on arm32 and arm64
- this would use the accessors depending on the given register size (ldrh, strh, strb)
- this would switch arm32 from 32-bit only to the same behavior as arm64

2) Support for 32-bit only PL011 in early pl011 on arm32 and arm64:
- this would result in overwriting the changes done in patch 1 (but I'd prefer not to do all in one patch for better history/backporting)
as I'd have to introduce some macros e.g. PL011_STRH that would be defined as strh in normal case and str in mmio32 case, etc. I could also
just duplicate all the early functions and use ifdefery if that's what would be preferred.

3) Use correct accessors for runtime pl011:
I would prefer to do what Linux does meaning using the largest-common accessor in normal-case (i.e. readw/writew) so that we can have a generic helpers
(i.e. use readl/writel in mmio32 case or readw/writew in normal case). Otherwise we would have to use the accessors depending on the given register size
(like in early printk) which destroys the idea of generic helpers. Linux for earlycon also uses per-register size accessor and in runtime - largest-common.

Let me know your thoughts.

~Michal

