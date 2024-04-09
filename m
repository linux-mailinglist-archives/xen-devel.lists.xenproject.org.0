Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1E789D9FA
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 15:19:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702443.1097447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruBMj-0007DU-Gc; Tue, 09 Apr 2024 13:18:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702443.1097447; Tue, 09 Apr 2024 13:18:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruBMj-0007B2-Dp; Tue, 09 Apr 2024 13:18:21 +0000
Received: by outflank-mailman (input) for mailman id 702443;
 Tue, 09 Apr 2024 13:18:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NvYF=LO=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ruBMh-0007Aw-RR
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 13:18:19 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:200a::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9fdde24e-f673-11ee-94a3-07e782e9044d;
 Tue, 09 Apr 2024 15:18:17 +0200 (CEST)
Received: from BN9PR03CA0184.namprd03.prod.outlook.com (2603:10b6:408:f9::9)
 by SA3PR12MB9159.namprd12.prod.outlook.com (2603:10b6:806:3a0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 9 Apr
 2024 13:18:13 +0000
Received: from BN2PEPF000044A2.namprd02.prod.outlook.com
 (2603:10b6:408:f9:cafe::37) by BN9PR03CA0184.outlook.office365.com
 (2603:10b6:408:f9::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.35 via Frontend
 Transport; Tue, 9 Apr 2024 13:18:13 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A2.mail.protection.outlook.com (10.167.243.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Tue, 9 Apr 2024 13:18:13 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 9 Apr
 2024 08:18:12 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 9 Apr
 2024 08:18:12 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 9 Apr 2024 08:18:11 -0500
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
X-Inumbo-ID: 9fdde24e-f673-11ee-94a3-07e782e9044d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qri4WpiHH2w9XRy75343UPVPFTZaD4O1+oRTHeF0uoGK78u4lPe8RGd0guxZKtl7zzEmpJWg5p/tz9Tu0gBdPNZ2ufHvOoUZ+6m6bHbu5IjQtLllUH1Gm8+l+/T7tN84FNMDQrvZToJGHt9U0Geo9zPLAuZI7gXHB+jDGQACYlKkZc4h+JsRUJjq6Fa+l66W0qCvb3e6zDaUp9AOgSJWrot+hybR/4baO3SXiZ/W8l//MJ2OgWAiw7EY7qKrJ/YyDeHkYuzZBd9quCcpYDiFFvhTiTlzzA9L69ZpNk0h/ggO17WAt2gy7Go5MyvhTQuhKvFCwKqCPMWYau4cQ/utIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7vtqHpgt3NZn1fmP6u2Ngwt5fQom3+jGPQO3Uh/kIIU=;
 b=UtUYVBuBeohskDeKAT42S93nh3KyXbJxo0r5Br/cobCrNc7u+zmwaK0qKBxEY38mgWMXawqmsXw+e5Q86OYNVy/BR8xyLxte9OZwdXjwpobVC9fmrgWZZxBiqTNrdT1qrbplNp8/yEtxezBCG1Mo09ZXxYAVVPQSOBWw5TU9wvMm7/jkiN45HhqvGXgwpskXiHH6L+YGor+EfvmPtMEPTYybCO5ckOv70Pa1BXO1FN+Y2J25kHz04azyucM2CRbCXvO9E65C7vdHVVnjS8iBi8k3sXiaxWLyXR4bVHZhpfc56DiJUoMyfOt1Ezk4zOQWgOop3CpnxGdlJLNsTHohRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7vtqHpgt3NZn1fmP6u2Ngwt5fQom3+jGPQO3Uh/kIIU=;
 b=MYK0ZL4uqCMGBAcWcBFaxCGucF1XiHgxxG/++8M6v0Ma/sP5VGXgCW/LQm/sgiyl0SQ+mAdrf/L5LAY6FodsJaYIZLC0q3eiC/zSa1xkwWYQOK0+ivFMfBBzQ0Gn9JGWWpkK7xJY4bHXP8ulQOxCj0xrDynHimkiFIv7Dr1kSvE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <ba515602-0dcb-4efb-8154-121893bb1318@amd.com>
Date: Tue, 9 Apr 2024 15:18:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 03/13] xen/arm: Pass struct kernel_info parameter to
 make_resv_memory_node
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20240409114543.3332150-1-luca.fancellu@arm.com>
 <20240409114543.3332150-4-luca.fancellu@arm.com>
Content-Language: en-US
In-Reply-To: <20240409114543.3332150-4-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A2:EE_|SA3PR12MB9159:EE_
X-MS-Office365-Filtering-Correlation-Id: da533e51-9d58-46ed-a17b-08dc589782b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	J3KAKIhSJxLb/+BqckE0jDzzUkbDftVeh5AACVyjOp5iobFpLetU2B3vi7lG6CyFusNrQYg79D7eQd+Gt4e6OTgWm0/ZKnCfYYzGFu23P2IdmN1DnZj7+J0hiOIY5Ru0XtM2K6SdTBIm251r0DhNidAjRWaYwMlCZJPcqS40psI/cKuq/pI8kc/DFagvhKBS8M7A8nLh3yyAOliybH9JlnlcmqYS3KDWRs+y0sMI3Lc6bbvecolyJEkD1XnYIzGU0rEqk3UOkmDQP1tnqOIfZ1leFmGe8FFN2q0QFufsWUV/vAdTcY+FjMaajRk9sjn79weugye4j9sRLAz6FjvKNN2RPlDZvMLR58iE1FpilBj8/nsD1i+CUYhap4EU4jmiR6fGCToUWx9G22e7esIS+H61jPHS+QaXHxY5Q0IaITW6QmLAX9I+vWITf2+kwCkleEm4Z3mJybcvnC1u4slx+iqE4m/T5VHut5z/v4/5F7vtxokETSQJDhJ0ERIWkQP3M0ZvD5s9B+pw0SShfbSSQFInbE81ep8+e+YaYuVQ2keP8CXURnKo3ArPPxv5LH16IZSt1vFk8WNhuyMRQsF6wzBvWOCCilLT+7r40Z9kG0JnC0JR6bbsxURc7DIkMd7QcHPi790BfIA8HQjpdmqUyWQz+oBk7wE4WKWa0xyMmg0qIKnjH+67793tR7dTBZ99h0FxApoH+giT1bdyzuik78RGWTsd/WgMF6jUiVSu7173Z+U3jD36DIZhdiK2fx5r
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(1800799015)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 13:18:13.4503
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da533e51-9d58-46ed-a17b-08dc589782b1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9159

Hi Luca,

The title should be "xen/arm: Pass struct kernel_info parameter to make_{resv,shm}_memory_node
given that you're modifying both functions.

On 09/04/2024 13:45, Luca Fancellu wrote:
> 
> 
> The struct domain parameter is not used in make_resv_memory_node
> and in its called function make_shm_memory_node, so drop it from
> both function, also, take the occasion to pass directly
s/function/functions

> struct kernel_info, from which we can infer other parameter
s/parameter/parameters

> passed to the functions and drop them as well.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Other than that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

