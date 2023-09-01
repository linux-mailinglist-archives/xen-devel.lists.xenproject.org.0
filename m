Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E817F78F7FC
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 07:25:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594399.927709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbwez-0004vp-Tc; Fri, 01 Sep 2023 05:25:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594399.927709; Fri, 01 Sep 2023 05:25:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbwez-0004tI-Qc; Fri, 01 Sep 2023 05:25:33 +0000
Received: by outflank-mailman (input) for mailman id 594399;
 Fri, 01 Sep 2023 05:25:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=am4h=ER=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qbwey-0004t8-3T
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 05:25:32 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7eb2::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7b67f9b-4887-11ee-8783-cb3800f73035;
 Fri, 01 Sep 2023 07:25:31 +0200 (CEST)
Received: from DM5PR07CA0112.namprd07.prod.outlook.com (2603:10b6:4:ae::41) by
 BN9PR12MB5227.namprd12.prod.outlook.com (2603:10b6:408:100::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6745.23; Fri, 1 Sep 2023 05:25:27 +0000
Received: from CY4PEPF0000EE3B.namprd03.prod.outlook.com
 (2603:10b6:4:ae:cafe::d1) by DM5PR07CA0112.outlook.office365.com
 (2603:10b6:4:ae::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.22 via Frontend
 Transport; Fri, 1 Sep 2023 05:25:26 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3B.mail.protection.outlook.com (10.167.242.15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.20 via Frontend Transport; Fri, 1 Sep 2023 05:25:26 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 1 Sep
 2023 00:25:26 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 1 Sep
 2023 00:25:25 -0500
Received: from [192.168.139.126] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 1 Sep 2023 00:25:25 -0500
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
X-Inumbo-ID: f7b67f9b-4887-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bz/puZT0YvupLpmbPHHQ6d4pvNgC1EYDNtCiV3NxJ/HlqMj3nnY7adwL98ywk0MmsUO5Wpj2LH7U/V9CtRg62/h2GV78KIGxEzF41wK57vvF7Rqyp3aNgRo9zboUhw/Cff0hmDCKOtb6Anh+hpACE0cjTW+VrNlFQfOARFolCjI6Usd54KCpIYSyqCsGuUkctemDL2zCzMENSJ/zGBL6njXVtr9HDZUuIxD3iOhF0omlE+l2pay2SzRXSIPLVAEcekXZSDhUsvuqHgKhM2fJgM6nLsrno6AqyPxLZ7mwUx8Kq+wJp5c0m8POW7e7K8Zt9eavs29nr0x4X4MPWyrKmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YKgwnuMdzxkVoV7dgB9Q9D7fvP477lcuMC/7ewiTwRk=;
 b=cu2ptjgAC3jY+5P3hcDRYsVcTNXXREifQwkca6/+WcBE1seVf7FRGXyjT871QBObOu4pPezsm6GNYDTVwLiO2JwsHnCblpsPc58e/uKVgf9vo0XkGwYUAjzgE3Kh+4FsPpTGUzPJekOIytej2u33JE2yarjaWV4syUXJRbtK66EE2bZstuQzj3MKxfmFGGZfW+ymHaZJZJk5wPUxBh7EG0fTeIe6oBdE5RkGPYwIlIwDaQ5t7v88N0Xc/16IaFVaPHCvNtv3VWkFi23WhUW+uV8ubf1q887RJaoiv2AGAbViiM99hKF2IFJKCCTHQiK4STe2rwDkHyDMi2ApLDXQqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YKgwnuMdzxkVoV7dgB9Q9D7fvP477lcuMC/7ewiTwRk=;
 b=c8erFDR1HQVZP2mAo7bnw/zFmYt6/PKsnmlNY98M+e5k/IuCaVFQlAXFebf5hYyoIrzf5lAbhnyp1B4V8tKT+w3KD+XCo6oYDFa4+MHHd2Lcg+CIzQ2v4HEfEdBe/XZaM+53+Ma0f+soIvobkG301KXMX9z26ib7saSlz5N7RcU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <0c5c3d9c-67e1-0b67-81af-6e20cd3a73b3@amd.com>
Date: Fri, 1 Sep 2023 01:25:15 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v9 06/16] vpci/header: implement guest BAR register
 handlers
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
 <20230829231912.4091958-7-volodymyr_babchuk@epam.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <20230829231912.4091958-7-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3B:EE_|BN9PR12MB5227:EE_
X-MS-Office365-Filtering-Correlation-Id: 47d2aa67-6516-4274-d114-08dbaaabd967
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9BnK6//j3QbQKsLuOT1TB2FsVuT1GNHnCWy/pXAN9LhGE1rnufq8moFGxdbIM4aGyXoFXp7pxT+tFWYk6BkQ5VxKeNStyqdeTjGcuI+EVXfM9HBM7YZSmRab6ZTQWNylJBV71gtBe5kzsDRrvzYY5GgJYJFYFc99adshVFbVlr4b8rUdBbTxMz9UheDB58IvwqguvtkJQ6K476Z2ZwmnH4WURvbZxom0FkNTLFiF0cY/NoIGtioPivSudxRutGxB/zFAE1HnXOQF+iRT/tXhJi4FGO27ozd6YuljejDYyP/IpFKlZy69GI3S/4bhQ/psbjGXjTr2g8ICOs7oRXZCSO/0foEske2sSCPUq69hTuxkzpHYBbd9NnwTyWCmD08TBh52BhAnXP1RS1tNgzcPy95KXi7ffhvc0V2eSP2y6R5x+mS5DHPP9jfmEb4h/W7GVzCbF8sVpug/KiAOZA/xisTkC47krbqUcjyHyZKuzwRXQZVdBIv0fGxY/sfvKJPxmJWKUy+Y67kXNeSzUMSmSJoKmM/I1bn+eLF3VgX7eLqwYTzd+hElS6AXA9exme/Jj25ZfTibrn7XxDaVbjgLEfoNEgtfdbEKnmukIDgru8rAQQVLYWZPHn5KXXOGEcaCSE4YZfLRAtaYGb4GA5jqcvQKPO6eUgVWiM96QcVTwUieWuamkjc/qprGWqlBy2GMdn9/7UmM3xYMS9tIdX9XSO8llt/u8XUxkiI5vkOpnMyjET0AX3Apq2KUu5qCsAYffsfht1MgGfjU4kp7mlv/OG+EP1acHKlgrvTLXxcgIMtGFrVYyApZniqO4Sn39u4t
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(346002)(136003)(376002)(82310400011)(451199024)(1800799009)(186009)(40470700004)(36840700001)(46966006)(6666004)(53546011)(478600001)(2616005)(336012)(426003)(26005)(2906002)(4744005)(44832011)(16576012)(54906003)(316002)(41300700001)(70586007)(70206006)(110136005)(5660300002)(8936002)(8676002)(4326008)(40460700003)(36756003)(40480700001)(47076005)(36860700001)(31696002)(86362001)(81166007)(356005)(82740400003)(31686004)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 05:25:26.5396
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47d2aa67-6516-4274-d114-08dbaaabd967
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5227

On 8/29/23 19:19, Volodymyr Babchuk wrote:
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index e58bbdf68d..e96d7b2b37 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -477,6 +477,72 @@ static void cf_check bar_write(
>      pci_conf_write32(pdev->sbdf, reg, val);
>  }
> 
> +static void cf_check guest_bar_write(const struct pci_dev *pdev,
> +                                     unsigned int reg, uint32_t val, void *data)
> +{
> +    struct vpci_bar *bar = data;
> +    bool hi = false;
> +    uint64_t guest_addr = bar->guest_addr;
> +
> +    if ( bar->type == VPCI_BAR_MEM64_HI )
> +    {
> +        ASSERT(reg > PCI_BASE_ADDRESS_0);
> +        bar--;
> +        hi = true;
> +    }
> +    else
> +    {
> +        val &= PCI_BASE_ADDRESS_MEM_MASK;
> +    }
> +
> +    guest_addr &= ~(0xffffffffull << (hi ? 32 : 0));

Uppercase ULL on the constant to avoid a MISRA violation

