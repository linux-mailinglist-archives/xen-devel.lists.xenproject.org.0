Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8786842C89
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jan 2024 20:23:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673672.1048098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUtgn-0002Bh-EE; Tue, 30 Jan 2024 19:22:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673672.1048098; Tue, 30 Jan 2024 19:22:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUtgn-00029J-Aq; Tue, 30 Jan 2024 19:22:33 +0000
Received: by outflank-mailman (input) for mailman id 673672;
 Tue, 30 Jan 2024 19:22:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cYm+=JI=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rUtgl-00029D-2l
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2024 19:22:31 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:200a::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7cc35f6-bfa4-11ee-8a43-1f161083a0e0;
 Tue, 30 Jan 2024 20:22:29 +0100 (CET)
Received: from SA9PR13CA0053.namprd13.prod.outlook.com (2603:10b6:806:22::28)
 by MW5PR12MB5650.namprd12.prod.outlook.com (2603:10b6:303:19e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22; Tue, 30 Jan
 2024 19:22:25 +0000
Received: from SA2PEPF000015C8.namprd03.prod.outlook.com
 (2603:10b6:806:22:cafe::c4) by SA9PR13CA0053.outlook.office365.com
 (2603:10b6:806:22::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23 via Frontend
 Transport; Tue, 30 Jan 2024 19:22:24 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015C8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Tue, 30 Jan 2024 19:22:24 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 30 Jan
 2024 13:22:23 -0600
Received: from [172.23.114.18] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 30 Jan 2024 13:22:22 -0600
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
X-Inumbo-ID: e7cc35f6-bfa4-11ee-8a43-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RlqDCtbbMtDYnC3SMvH2xIE0jl20RhGbxSLyTnnateyAbi/yGM/aMlcCGePZWVnjgsEWZERAXFm4ZRTL3Bxr5j+or7ALCmYcGZcWSUWWUY3bA0Ed3hzwH6SrbaQeSFTnVzoh/8aVNHsdVMKK2YjIyFp+mrYrfLZyZ6LQAquoj5LXpN0+5mswdyFHfUYFRnXA9YX4/81tIXP6WGzJJbOHSmxjmhY6wU0jdVKcB1WTpUY0+qqJRfuGVEurBT+Mxi9Ke11hX7U/ZMwdoIAJKGw72toOcy20xrRHblbiUfvn/GFnzi+3k4ZFtiVzyZYeDOBarNKhy3ZXorFKaVOGkYXaTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ah8CIUwZJc7goXQMzhYwyrjTJbEHcnfYTGCSG2LcS4w=;
 b=AyyyRTriTHVIECumLN6PubOI9whhMJ5TA2mQcSJzBP44p1dftcra0HZ+yOx7+PIOTh3bWrm2Um3bAWGFROkCI/mQR/Qt+S5j4rMgxPic3YLJQuQbNPf6D3AXKsR1zJlHGsxDZYgMN8DzU8vWTjXQ/eUpUvYSPvzxzTJRpGVHP5ZbmI9WOi3iND0QI1dyexw246ossvVdlLadZdVuEQBUORk6Dk8RPTJ7k51bAqfo6nbDwtiX4hMlESIwxYscvuIeYoxkRD9xSxa5+8BaL/iK6jjSNJUP5t+D87cTNc6mRp6Qh8P+2GlmGpPA6MauzsmHWf5GCO9EIIE4BmZ7CiHKKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ah8CIUwZJc7goXQMzhYwyrjTJbEHcnfYTGCSG2LcS4w=;
 b=JnsaCXHGELEPejNqdgqD7IvwssD18U9rhRFmshtyOLNmMagUzkFgAJgBOzNYtRXCwaPDIFWy7PiN0IsKFx7b3wuWv55+D3xW+BvrA9y5mL06LdiPxQlPMqryv5k0xbytu+YhXR17m+tqYkoCdCCCGYaOWwUXYSEh4BxVx4fd8bg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <7b80f55b-2eef-4186-a86b-09d715bdc79d@amd.com>
Date: Tue, 30 Jan 2024 14:22:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 03/15] vpci: add hooks for PCI device assign/de-assign
Content-Language: en-US
To: <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>
References: <20240109215145.430207-1-stewart.hildebrand@amd.com>
 <20240109215145.430207-4-stewart.hildebrand@amd.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <20240109215145.430207-4-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C8:EE_|MW5PR12MB5650:EE_
X-MS-Office365-Filtering-Correlation-Id: 0da89c23-d07d-4239-ab4e-08dc21c8c9e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nq12/5fyo+eGFEtkuy/Wx21UEEEhLc+Rvhs92+8EEk+CGjfiN9hwsLpUhkqs+70l5W4KF70XytFTSOYy7XHJ2Ud909KQPE4frpllvYYWWBv0MYIIyYaU90KPhbYQGnPsYBdrpvNsI5ktLk9695/12ePqNsqVuuAuJF/lyV2IX8ZE7cWhYkURQMunu6HlJ8FyCEtLHow1U9bGVNqM77C11lhRUgZ+DlumSX/ZPPlP5YMKmARHtymnfNVvsjEGrxLqNrFyNA2qMKh6E9xQTln5YVZoQ5nqhTAZt7yDOl6nwzxHrwb06OSfOMDl/ThwQI/FkEvOL0SEip2xySQMU6GocswnTrmd/piT4SwSdCb8RU9ZS14YvuRRaAs1Bvn6q7rg1OznfWVBgA+7KIyBIk+4A/pNhuFp1B8MrL6/Pa0FEUZgn3bu3W78TbFQ8qN5yjzDsJauYp+ms2TlwCt1t+22ZWoMTTPupXXxBEIJqfEVe/HFm9s/uwioaSIUWW1xdTiTiRF9NrXjGWo3aCkRQlGaynol7AZGoQuHIyT5imOvUSWYjjwrKrlzWgONe/bckzswekga/yYvNM42C3PLwuh9pjFvenuM5HDX1YRVW4pRfls7ld3VOq11CFifhM1fxGyKiYacH9niOC6m6YTRWmaLjrxEW4cnqYKiQ85UTGsvjuw3TVRcl4LspEm7YLOd8JGNbxv+hpH3nAQ4EBgN2jEoc2ANBb8jBWSbw/9vqjnMSrOgUktxsbEHD/5d26aexrD2fBCn0pq6y6hoaI0qMP31xEqQm0p2Z17UWccvi2nMNSCn7mmfEiZdtOoFoVD1AvWdSN1dm+vGo90dAisB08tnguug7WrSaKFQiQzZNRsCs9U=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(396003)(39860400002)(346002)(230173577357003)(230273577357003)(230922051799003)(82310400011)(451199024)(1800799012)(64100799003)(186009)(40470700004)(46966006)(36840700001)(5660300002)(4326008)(8676002)(44832011)(2906002)(8936002)(31696002)(70206006)(70586007)(47076005)(86362001)(316002)(54906003)(16576012)(36756003)(36860700001)(82740400003)(356005)(81166007)(6916009)(53546011)(478600001)(83380400001)(26005)(426003)(2616005)(336012)(41300700001)(31686004)(40460700003)(40480700001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 19:22:24.3162
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0da89c23-d07d-4239-ab4e-08dc21c8c9e8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5650

On 1/9/24 16:51, Stewart Hildebrand wrote:
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 3a973324bca1..a902de6a8693 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -1476,6 +1485,10 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
>      if ( pdev->broken && d != hardware_domain && d != dom_io )
>          goto done;
>  
> +    write_lock(&pdev->domain->pci_lock);
> +    vpci_deassign_device(pdev);
> +    write_unlock(&pdev->domain->pci_lock);
> +
>      rc = pdev_msix_assign(d, pdev);
>      if ( rc )
>          goto done;
> @@ -1502,6 +1515,10 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
>                          pci_to_dev(pdev), flag);
>      }
>  

After rebasing this on the following commit:

  cb4ecb3cc17b ("pci: fail device assignment if phantom functions cannot be assigned")

I'll add this here:

    if ( rc )
        goto done;

I'll plan on retaining Roger's R-b tag and and Jan's A-b tags for v13.

> +    write_lock(&d->pci_lock);
> +    rc = vpci_assign_device(pdev);
> +    write_unlock(&d->pci_lock);
> +
>   done:
>      if ( rc )
>          printk(XENLOG_G_WARNING "%pd: assign (%pp) failed (%d)\n",

