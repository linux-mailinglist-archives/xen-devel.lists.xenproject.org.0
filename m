Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DB4680859
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 10:18:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486689.754110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMQIJ-0004gl-5A; Mon, 30 Jan 2023 09:17:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486689.754110; Mon, 30 Jan 2023 09:17:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMQIJ-0004eP-2J; Mon, 30 Jan 2023 09:17:43 +0000
Received: by outflank-mailman (input) for mailman id 486689;
 Mon, 30 Jan 2023 09:17:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6cZ7=53=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pMQIH-0004eJ-Ci
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 09:17:41 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2052.outbound.protection.outlook.com [40.107.223.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f05462a9-a07e-11ed-b8d1-410ff93cb8f0;
 Mon, 30 Jan 2023 10:17:38 +0100 (CET)
Received: from BN9PR03CA0100.namprd03.prod.outlook.com (2603:10b6:408:fd::15)
 by PH8PR12MB6937.namprd12.prod.outlook.com (2603:10b6:510:1bc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Mon, 30 Jan
 2023 09:17:31 +0000
Received: from BN8NAM11FT109.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fd:cafe::3e) by BN9PR03CA0100.outlook.office365.com
 (2603:10b6:408:fd::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36 via Frontend
 Transport; Mon, 30 Jan 2023 09:17:31 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT109.mail.protection.outlook.com (10.13.176.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.22 via Frontend Transport; Mon, 30 Jan 2023 09:17:31 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 30 Jan
 2023 03:17:30 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 30 Jan
 2023 01:17:30 -0800
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 30 Jan 2023 03:17:29 -0600
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
X-Inumbo-ID: f05462a9-a07e-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dvBc4O1+7jZxJy/zEhlVActk326zPB+J5uB0hmHB8Agy/I0Gt2OwYjzVR6CIP5fJ2jtszEoUXzCsZNNak4CYmSgRL/qT8Lu7ZK3MBirp5eiZ2ee6j3JtshqbPRV2lHU6B3zasCn/jE8KAAhWjB67hfNWycIJqgntknjnsAC6QaLwOQXbINgtnO655SOyO7HD24MFbv8WmBj4keVqAUHLFdsJ+Cz6slv5fpHku5IDjrhHQI2P5eIDryj4Xn4sq3uC6P3xim26xCIt8s86ie6QAe4vLOXTtCDpN39N5vGe7KOZRYTLtygQLpNxi5gwZnZHr4eDcvfzRQp/p7lN1DJZZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+DkzSkOY4mWSm4jeBZPfXwlxaZh4t6lCNw+L/pSG8Fs=;
 b=JosAiX3gHnACWDO9h083mBx38gb1lwhbyipjRS+ivx+Ztllu+QW7FKE4zORmDOCQgbVm7BAjF2HoB6xRSE4jDqYJ+DaL5WU62ao2MxmN3CUzbxaWARkMSUeRjsqFd3384dEoYnyTbULDY3DdNJDMRh+an69SP39EobAXeeBh4vvGHgXSiV2BM7RO0dCbU2v7pYq6fzbtzbmJ7caRMQmsYVVcnGp2X0uTx4MiIqED0k5Yf7bi/Z8eQUV1xA8M+MUOqWvb3flSE5FFOB9ica96O4n1SGOxCimX6KM7R0p4jCz9Rb2ryRXACH48Zwdm0EI4Z3CM0u+cOSHr0LGohZVXSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+DkzSkOY4mWSm4jeBZPfXwlxaZh4t6lCNw+L/pSG8Fs=;
 b=cn7F7fUaiDI1PdeyZgEh8fmCH6YkgT6FxDtXYgaL/Vvg0T+pZfY2AG6eWupQl1o0rNgvNFMHmHZj3guOGFNW1V2TZLKtS8U/cm17HCV193rWCOL4ugWBySisAl+Qn1aaaTl4raN71OVQYPVXJ38bGIsHa+Lb7poqH8A+P9Gro5I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <0026b6b7-c3e7-3e5d-a4d8-1cc420de10f5@amd.com>
Date: Mon, 30 Jan 2023 10:17:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 4/5] xen/arm64: mm: Rework switch_ttbr()
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, Julien Grall <jgrall@amazon.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230127195508.2786-1-julien@xen.org>
 <20230127195508.2786-5-julien@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230127195508.2786-5-julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT109:EE_|PH8PR12MB6937:EE_
X-MS-Office365-Filtering-Correlation-Id: ec517c87-d7c2-4288-3644-08db02a2d0c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eJI8pSqtoFFcEVMMVavoHiI21jz9Sc2AntMdTjtF8JbVZSfEEMvI5ZX+QgNu0Ui6VJ1y25fYCp8TLlXGtNnvaRBvWNLhcdalHnfmaTK+ggA5LZbeucOcuj5P01ihlQm9KJXkG7uKUpCuYHdYleQ29zOrbs54mP+m7MC68IuyXBb/JCB2JUTnIyBN6/wS8Q/YPKxR4hryIDNX4mnBL73xT8AMc0E75ZXpjG8VW2k1WwJB3qStLPOZIW8CbYv9Bei37LPaMitA0jdsU1YjkXbaoxnpYfaT8CFFF1oaBr1mWW1DSKhFBbrvGFcQVi03D+z14g65u5BOzi+H25gDTMrXUaO5cRYY/me+1pxA3zcNxPw5ykG0wDVSyL0d5jEcAooqsKSO+i89gfd8JprSMXaTnO9Ri96YCSDSU9cG4l4g1kIBYaMrkLE0ygBXV5HFHJyksOrD3E5gK6E7Ng0UBis7ngv5ie0As8yCkTe9Lb2zbrEzScZtDuIaotXMiDwhr/w9djlm3c3C6h+KUbs4iDp4VdEUWf0JN2m62VDppSQ012X73VImABLXcxdgkV13drxw4ganNuHKH8yu/U8DB/Vi3OlEBnKubFz3j64VMUkQRXaIowFiwkR0x7n5vPbBbj22fPHtADojk1cj+tOx+VAsIas6PwhpA9mt74mXFEnRz+Okl7FtwaIcVJmqhCvxhsDPFvgLxTTlSPjcQW8VQ1io286YGTJyEAVX+TbRZaip41UnSSgFbUGR5RgcAxxpmNULO9xI4OpEVdR+erZ7MbGk0g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(39860400002)(376002)(346002)(451199018)(36840700001)(46966006)(40470700004)(31686004)(70586007)(36756003)(70206006)(8676002)(4326008)(40460700003)(86362001)(31696002)(81166007)(356005)(186003)(478600001)(426003)(336012)(54906003)(83380400001)(53546011)(26005)(2616005)(41300700001)(82310400005)(8936002)(5660300002)(316002)(110136005)(16576012)(47076005)(44832011)(40480700001)(82740400003)(2906002)(36860700001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 09:17:31.3000
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec517c87-d7c2-4288-3644-08db02a2d0c3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT109.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6937

Hi Julien,

On 27/01/2023 20:55, Julien Grall wrote:
> 
> 
> From: Julien Grall <jgrall@amazon.com>
> 
> At the moment, switch_ttbr() is switching the TTBR whilst the MMU is
> still on.
> 
> Switching TTBR is like replacing existing mappings with new ones. So
> we need to follow the break-before-make sequence.
> 
> In this case, it means the MMU needs to be switched off while the
> TTBR is updated. In order to disable the MMU, we need to first
> jump to an identity mapping.
> 
> Rename switch_ttbr() to switch_ttbr_id() and create an helper on
> top to temporary map the identity mapping and call switch_ttbr()
> via the identity address.
> 
> switch_ttbr_id() is now reworked to temporarily turn off the MMU
> before updating the TTBR.
> 
> We also need to make sure the helper switch_ttbr() is part of the
> identity mapping. So move _end_boot past it.
> 
> The arm32 code will use a different approach. So this issue is for now
> only resolved on arm64.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> Tested-by: Luca Fancellu <luca.fancellu@arm.com>

Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


