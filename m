Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2413065C2F2
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jan 2023 16:25:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470652.730222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCjAL-00078V-7S; Tue, 03 Jan 2023 15:25:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470652.730222; Tue, 03 Jan 2023 15:25:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCjAL-00076j-4X; Tue, 03 Jan 2023 15:25:25 +0000
Received: by outflank-mailman (input) for mailman id 470652;
 Tue, 03 Jan 2023 15:25:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/j9y=5A=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1pCjAI-00076d-M3
 for xen-devel@lists.xenproject.org; Tue, 03 Jan 2023 15:25:22 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2059.outbound.protection.outlook.com [40.107.237.59])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2087c08-8b7a-11ed-b8d0-410ff93cb8f0;
 Tue, 03 Jan 2023 16:25:15 +0100 (CET)
Received: from BN0PR04CA0180.namprd04.prod.outlook.com (2603:10b6:408:eb::35)
 by BL1PR12MB5062.namprd12.prod.outlook.com (2603:10b6:208:313::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 15:25:17 +0000
Received: from BN8NAM11FT101.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:eb:cafe::55) by BN0PR04CA0180.outlook.office365.com
 (2603:10b6:408:eb::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.19 via Frontend
 Transport; Tue, 3 Jan 2023 15:25:17 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT101.mail.protection.outlook.com (10.13.177.126) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5966.17 via Frontend Transport; Tue, 3 Jan 2023 15:25:16 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 3 Jan
 2023 09:25:14 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 3 Jan
 2023 07:25:14 -0800
Received: from [192.168.137.15] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 3 Jan 2023 09:25:13 -0600
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
X-Inumbo-ID: d2087c08-8b7a-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fzQQXm6jCsEr6SEsVauW/nRsBpxPEIulDuuZEDFKFDu35RrtbCdoxhY9Eb7t+0pxrKPOTMi+V0XucCbE3RXdAl8mIFvou7IBTcqaKk8sp6oiGo8qBxAyM8YH/Amo2kaNW45N1HfQyCYKHcu6zQuBo/1ki1WBEhxB7ZaAShIhsUqYdQBV2dRdQWJjXEomUsPSLI5bnY833jr5E9tn2mLIT9gg/9TDyXCm8TX2DgoWs1GkT5yEQk6FXXpKY+gS7Oa/83mKq3jkN+m69LGGH6oaxJtt/U4HMdTzWSIr1er7CaZxFcVGxwt/gKvU13dgdFNJEhNlpYJdicSF82rfbhowUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=15mGA6wja2IZernS34ru3oqZcAZP2HDHZmQsJGvAPbA=;
 b=GiomPXlCx8eG93WtfhP2oxRrkuuHUOkqgYuR78ZkEh+u4kLlOfBhb5zLm9QcvUUIbD2fDMgqE3aSJu0IE0VllblJkvjCj0JUXFvLf7XZD99MBFDO3mjMrExhFCaVi0X9NAkaqqYk16D3SNab8JQ4OrEFbcXGrViz5K2i933CWiEJ8iR6zZDP5MfXDFmOoExAktu1N9zBKARjwHuZfiEnVDrQMhOTMB2vhiv7metyZdpYNpujhH/is5Ai9Ikn+A5iBJ8mdMZtBcj+1+rVxA5Cllup1Zxk5WDfxBhvi9twqHbnSj3oZImd1Lsw5WEjMlTjoENMKwIiAH8cSiH7qu64cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=15mGA6wja2IZernS34ru3oqZcAZP2HDHZmQsJGvAPbA=;
 b=TaDBrxHBOVOshOIe09f3w2xtJzmxbXRvR6lOunqCEmiPGwAlf0TojOFfn3WvKMwJOt5t+OO7lSHEABpSulcAiKl4tX9EIxZ8PFaqugdHWm+1hTU7pB/XXHBN/2QTTwgLcNDs6vPP+ZMO5PLysxDvNcVhH9OOgkK9oRX2AUkCDKY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <33e3e0f0-6784-5012-eb25-4d90f9cf188b@amd.com>
Date: Tue, 3 Jan 2023 10:25:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 21/21] xen/arm: vIOMMU: Modify the partial device tree
 for dom0less
To: Rahul Singh <rahul.singh@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <cover.1669888522.git.rahul.singh@arm.com>
 <127da5a0d4300e083b8840a4f3a0d2d63bde5b6f.1669888522.git.rahul.singh@arm.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <127da5a0d4300e083b8840a4f3a0d2d63bde5b6f.1669888522.git.rahul.singh@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT101:EE_|BL1PR12MB5062:EE_
X-MS-Office365-Filtering-Correlation-Id: 67c76040-fd68-40d8-dd53-08daed9eb7b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	u3O4znWQAghTI0l4vOGlH5msU7OkxnsKbhRdQPkBprmSj6ocjlokBV2PlBM2VMH+yoTgLrD7QNJ5vY8LcifWQHFohxabwB0bsUMMc/U9AgNKFo0JqbyqoCYBA2/SlqifpgYgxBjZD/BzzgP0Cg+pt2ZuMzOId9VgkrQTAWl4jl9xBAe263BDbGThCTtJ1Wv3zfaoVNEVgKxE8ajvwAuxe+ggu1yHYFP3WsvMVv7X6HbE8tx10b5P9b5DvxV2gGHveJFTGtwy0NhSlf9gebvdI6glCjQJeDyXQkC+ScadnXm/cF5HGjOfInk2MOm2ADTzS4TnjMrFqDrOhZtDW4ZvhVVAbGaLoGpeGLsqC+VE60PxdAMrA7QSqeGamoYhwTAPNkP4WJVHFnCPcXZNoRIoBMMNt4jUY+OQUYkmgeqWlwGYDgcOfu/4B80P2lhy/TcmfylwZbmCEtOKJV9bqe070AFl+A6sx3u4aAg6QajMHcxQoI7+XW7hHX1VxkvhtWKxZXfm3IxB27Aogc5aXcUzR6hVVjH4UHZW1zOqLxoO6g2O0YuZPUD5x/9fObGlCZy1JPxkIz8raCm488M4lcgBesXvHrf51Sm022EDPDPgjutdA4gJec89w9TxM4+nO2hNf3xFbaiIsB7KkI9WEWLiv0SLRcWMbJNM0LVNX9sDmShZ/6e+EMV84JyVnC9/09XPYEOqMOIe9vCx7/G2VW1mRQTlAazhXqtqNHj0x32wyAtQy3pIW5weQitdIgkup70nfWQiAjUseuV6W62VLkwG7vKQu31aGaE6Fq0IRzuC+3QZU+IR7qXp/4MsOUDkHngJ
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(39860400002)(346002)(396003)(451199015)(40470700004)(36840700001)(46966006)(26005)(186003)(8936002)(83380400001)(40480700001)(44832011)(53546011)(478600001)(31686004)(40460700003)(54906003)(16576012)(316002)(41300700001)(36756003)(2616005)(70586007)(70206006)(8676002)(81166007)(4326008)(336012)(47076005)(426003)(36860700001)(82310400005)(82740400003)(5660300002)(86362001)(2906002)(356005)(110136005)(31696002)(22166006)(32563001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 15:25:16.8314
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67c76040-fd68-40d8-dd53-08daed9eb7b0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT101.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5062

On 12/1/22 11:02, Rahul Singh wrote:
> To configure IOMMU in guest for passthrough devices, user will need to
> copy the unmodified "iommus" property from host device tree to partial
> device tree. To enable the dom0 linux kernel to confiure the IOMMU
> correctly replace the phandle in partial device tree with virtual
> IOMMU phandle when "iommus" property is set.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
>  xen/arch/arm/domain_build.c | 31 ++++++++++++++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 7cd99a6771..afb3e76409 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -3235,7 +3235,35 @@ static int __init handle_prop_pfdt(struct kernel_info *kinfo,
>      return ( propoff != -FDT_ERR_NOTFOUND ) ? propoff : 0;
>  }
> 
> -static int __init scan_pfdt_node(struct kernel_info *kinfo, const void *pfdt,
> +static void modify_pfdt_node(void *pfdt, int nodeoff)

This should have the __init attribute

