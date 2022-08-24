Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 355A259F62E
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 11:28:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392318.630588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQmgG-0001xk-TW; Wed, 24 Aug 2022 09:28:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392318.630588; Wed, 24 Aug 2022 09:28:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQmgG-0001ux-Qh; Wed, 24 Aug 2022 09:28:12 +0000
Received: by outflank-mailman (input) for mailman id 392318;
 Wed, 24 Aug 2022 09:28:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jsFi=Y4=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oQmgE-0001nJ-UU
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 09:28:11 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2067.outbound.protection.outlook.com [40.107.223.67])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1078390e-238f-11ed-bd2e-47488cf2e6aa;
 Wed, 24 Aug 2022 11:28:09 +0200 (CEST)
Received: from DM6PR07CA0130.namprd07.prod.outlook.com (2603:10b6:5:330::22)
 by CH2PR12MB4119.namprd12.prod.outlook.com (2603:10b6:610:aa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Wed, 24 Aug
 2022 09:28:06 +0000
Received: from DM6NAM11FT100.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:330:cafe::1a) by DM6PR07CA0130.outlook.office365.com
 (2603:10b6:5:330::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15 via Frontend
 Transport; Wed, 24 Aug 2022 09:28:06 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT100.mail.protection.outlook.com (10.13.172.247) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5566.15 via Frontend Transport; Wed, 24 Aug 2022 09:28:05 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 24 Aug
 2022 04:28:05 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 24 Aug
 2022 04:28:05 -0500
Received: from [10.71.192.107] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Wed, 24 Aug 2022 04:28:03 -0500
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
X-Inumbo-ID: 1078390e-238f-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hmqpe5JdivjqHPwbA85Aen88JVRjxXs9QzFsa8lzSEn4cDFAqrGKvB7BrGF5cVdYQvD5BoiD4aG7AH802d+31Gr2FUDb8427B3ovOFC9ONBBPGeTyzwO5yAG8uvx2S2SqAXoMugfUfXudPU/LVhTHjUE1F4TgPgMSKsjxVZLBNSbOnnnJ1YLHqlzTHWYOHKVjqFQBwPYa+p2kyqDVmn0Jup0lup4EAYlBjrei62cJ5p1YWDW96bZLJBftWCOXuvR0BllqHyeTdsp+JtinmKcO/ykuo1oe4fEKQ+kmeynX70F4qRieoPICBJk55vn9xTUDIvW15A65ZdxBgriMhaZpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IwrNcJmYDxM9OXJPJDeU2D+KtfWhHkER3BZrVbvjv2A=;
 b=RgBFIu6OQ/70cBIdWqzubvbzRlXbvV7Mhvx9S/xWGyFe+AflD7mH3eFaHpo3CsLVWiHiAlkEE5Nrt+uuuwtn+iySB3PZxqdrH+avA+xwr4vp59xyFRCGSF59BUfUyHo5XEv+4l2+arIe0oiY5ax4QMlnYmdNYcZVpclhvixlf9DGkT0zkRWQXoT4Wc2FRlWkg2pM/T15PuWTAUzwg2Qr1V9WVS88FqQ5HoWZoniylxqCTSEwaOKu4pCx6Z+4wHRoQRXn8p4sZ0jrvZ9WsGLI5Tiio+gUbMf7D92PBYJMaNyDO6eoxrMsOj6Oi3D7w5msluye3xb9A+uoFvg1CUojtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IwrNcJmYDxM9OXJPJDeU2D+KtfWhHkER3BZrVbvjv2A=;
 b=AcZV7CLUbTtMl1Bu5Mw8HYzEHrAX/AScwc9mZIqMmlARtz0PEKFCyJ/pDkfcGsVvAi+t2E0SxGZ78YTX+YTQmb2TsmPD6j4TfCBb0V+p5gKy2kRgs69gKUyEhblGy3mFkSz+9CpVARuNh3PYhWJCWoJcOCQEcA2x5CrMZOt92wU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <24ba49bb-66b5-a1e4-cef4-e30b438b3c04@amd.com>
Date: Wed, 24 Aug 2022 11:28:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Content-Language: en-US
To: Jens Wiklander <jens.wiklander@linaro.org>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	<Bertrand.Marquis@arm.com>, Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v5 3/9] xen/arm: add a primitive FF-A mediator
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06021927-f0e5-48ac-afef-08da85b2f365
X-MS-TrafficTypeDiagnostic: CH2PR12MB4119:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pvyjcaR2tXTh3HkrAQYkxsF+mR6zrYv0YKxoFOf2n1HxB8viKSMJ7RPIgMb7hRZL1Ln89/3ToAhRHU7mcrJ+2WxxqbDw6fclnZRXItxZb0doLfAat4v3A9HGCxeHgaG+KN0mLC9LsJkS+Hayx9HZDH6mYlMCfhE7d7rk93eXvkN0uLKj1Rvq+L1YDteH38EE6zWybm1hRFe2RIbkK5t75l6h/OFNpPVxVJ8OvkcUcDeISdeZupAvkqQe+gcRCSaNbwkmSwYogDD2PWeXzvSYQReCBIAyM3Pb7wSj9xpxR8A/mTXu6Qikl20shQ5KJwFGrRI72Msi915r7LnN5tn4N/om4Rjs0ULiCpCbtnd/80Nz9mfaQG1Jq+NyGpnf2LYUyMms5oxG4ZwRtKj9kuqmmCYEb50HBTLuUyGcwuTtb3hUClQc+4yUbgD/Cn/rq2jdnGt20fykkc21w/PquLKX14uvdtPWOFYlzWg4gOoIxsz0NLbr6J/RJvld2vxR+BNue+jr7f2dBVY0vaL8O5TRyqRg6+Tul+r2TA/lKE2Qbch4nIFiNmDM2zBwAxVJg19pPs+O6by19mBso89C4LZGsVGIIbfdRrI8smsIbiGNRal6QirwLTeA4tLvM4GIZuQ92H1Tjq76qAFhV1qZ9WAkhYV7NMZaMdXf9lZ4kt69kQooceIFl0MXaNqg5qlBAuEUTVqX4rlpWnPfhwHb1WUIkUHLh2AyyuO9GOprC1MxDPZ00i8tDf7y2idPJojwkPL9zwGwoOqJNoqCCR7wbOIE/YJlW4/dYZKZsDs6zD5cYX1avy2KpZd9HhRvkKU5GSahIGtRVnJjFfgE7vvasN0XArpaJ+MR0mSPtgZjquF4qXY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(39860400002)(346002)(136003)(36840700001)(40470700004)(46966006)(5660300002)(2906002)(53546011)(478600001)(82310400005)(86362001)(336012)(26005)(36860700001)(966005)(31696002)(41300700001)(356005)(8936002)(426003)(186003)(44832011)(47076005)(83380400001)(82740400003)(2616005)(316002)(16576012)(40460700003)(8676002)(4326008)(36756003)(70206006)(70586007)(54906003)(110136005)(31686004)(81166007)(40480700001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2022 09:28:05.9453
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06021927-f0e5-48ac-afef-08da85b2f365
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT100.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4119

Hi Jens,

On 18/08/2022 12:55, Jens Wiklander wrote:
> Adds a FF-A version 1.1 [1] mediator to communicate with a Secure
> Partition in secure world.
> 
> This commit brings in only the parts needed to negotiate FF-A version
> number with guest and SPMC.
> 
> A guest configuration variable "ffa_enabled" is used to indicate if a guest
> is trusted to use FF-A.
> 
> This is loosely based on the TEE mediator framework and the OP-TEE
> mediator.
> 
> [1] https://developer.arm.com/documentation/den0077/latest
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  SUPPORT.md                        |   7 +
>  docs/man/xl.cfg.5.pod.in          |  15 ++
>  tools/include/libxl.h             |   6 +
>  tools/libs/light/libxl_arm.c      |   3 +
>  tools/libs/light/libxl_types.idl  |   1 +
>  tools/xl/xl_parse.c               |   3 +
>  xen/arch/arm/Kconfig              |  11 +
>  xen/arch/arm/Makefile             |   1 +
>  xen/arch/arm/domain.c             |  10 +
>  xen/arch/arm/domain_build.c       |   1 +
>  xen/arch/arm/ffa.c                | 354 ++++++++++++++++++++++++++++++
>  xen/arch/arm/include/asm/domain.h |   4 +
>  xen/arch/arm/include/asm/ffa.h    |  71 ++++++
>  xen/arch/arm/vsmc.c               |  17 +-
>  xen/include/public/arch-arm.h     |   2 +
>  15 files changed, 503 insertions(+), 3 deletions(-)
>  create mode 100644 xen/arch/arm/ffa.c
>  create mode 100644 xen/arch/arm/include/asm/ffa.h
> 
> diff --git a/SUPPORT.md b/SUPPORT.md
> index 70e98964cbc0..215bb3c9043b 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -785,6 +785,13 @@ that covers the DMA of the device to be passed through.
>  
>  No support for QEMU backends in a 16K or 64K domain.
>  
> +### ARM: Firmware Framework for Arm A-profile (FF-A) Mediator
> +
> +    Status, Arm64: Tech Preview
> +
> +There are still some code paths where a vCPU may hog a pCPU longer than
> +necessary. The FF-A mediator is not yet implemented for Arm32.
> +
>  ### ARM: Guest Device Tree support
>  
>      Status: Supported
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index b98d1613987e..234c036aecb1 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -1616,6 +1616,21 @@ This feature is a B<technology preview>.
>  
>  =back
>  
> +=item B<ffa_enabled=BOOLEAN>
Looking at other config options, we usually have <feature>=BOOLEAN (without _enabled), so
I would just stick to "ffa". This would require changes in other places accordingly.

> +
> +B<Arm only.> Allow a guest to communicate via FF-A with Secure Partitions
> +(SP), default false.
> +
> +Currently is only a small subset of the FF-A specification supported. Just
Should be:
"Currently only a small subset of the FF-A specification is supported"

> +enough to communicate with OP-TEE. In general all the basic things and
"basic things" sounds a bit ambiguous.

> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index 2a42da2f7d78..bf4544bef399 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -646,6 +646,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
Applying this patch results in a failure here so you need to rebase it on top of latest status.

Also, FWICS (can be checked by the toolstack maintainers) you are missing the required
changes in:
 - tools/golang/xenlight/helpers.gen.go
 - tools/golang/xenlight/types.gen.go
 - tools/ocaml/libs/xc/xenctrl.ml
 - tools/ocaml/libs/xc/xenctrl.mli

~Michal

