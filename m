Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1FF8A8335
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 14:34:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707475.1105428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx4U4-0000DK-UH; Wed, 17 Apr 2024 12:33:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707475.1105428; Wed, 17 Apr 2024 12:33:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx4U4-0000AX-Qw; Wed, 17 Apr 2024 12:33:52 +0000
Received: by outflank-mailman (input) for mailman id 707475;
 Wed, 17 Apr 2024 12:33:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R6tE=LW=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rx4U4-0000AR-3k
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 12:33:52 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2009::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bda91017-fcb6-11ee-94a3-07e782e9044d;
 Wed, 17 Apr 2024 14:33:50 +0200 (CEST)
Received: from BLAPR03CA0020.namprd03.prod.outlook.com (2603:10b6:208:32b::25)
 by DS7PR12MB8321.namprd12.prod.outlook.com (2603:10b6:8:ec::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Wed, 17 Apr
 2024 12:33:47 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:208:32b:cafe::ae) by BLAPR03CA0020.outlook.office365.com
 (2603:10b6:208:32b::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Wed, 17 Apr 2024 12:33:46 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Wed, 17 Apr 2024 12:33:46 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 17 Apr
 2024 07:33:46 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 17 Apr 2024 07:33:45 -0500
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
X-Inumbo-ID: bda91017-fcb6-11ee-94a3-07e782e9044d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KD5Wm2dM7C5qcSaxt+vQG4ZP2UsNVX/n/0V5DSpiF63eEjLisvQLyNSVuq0Ym5xyB62yi8jaz+wlb6BC46jdaiv4x9iwflazeJa5xeM8dsL/SvuHJ4wcEg88l0GhhzG8xqIzMWJKVPoDF+biBYsoqwBYCha9XnRhTGf3/TAxwTTQfCkkDUeW5RFnCxYrFDli0GmdcXpppY30iCFHA6HvQcvvwjbBgvlYc5TDaA2gts/6cb1yEWASbUaoZf75L7KAoWUnJ3ZcQpeWm9mdKKhPGaGuyVz8l010ZsHt0LNj+f0uiJ0Rm5/Mmm+EGZ5P84JDmghoJTuyM5PBNqbSK9daJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2DNNuwdf7l9U52ClT2eBKpYwXpOMBBBfJRl6OMAFP4w=;
 b=kcBZufDVbYYNdicsxGv0rPQbAGgwHSs7QfG7EbH4xKb8qPRfv2nKaZjLpdleBdti4XeDeA4ZmBSnwiEVxa4riFeDW/dSQ/dJpK5bhWLiUJl+T1payhqHsp4PSkpToDF3FDeQcGqoVwZSBdsSVgPcC0OaCpBb9YhAViiKslFbWwPfnbgDT9iiiHSiC6LJMbR5rhawf/8kzE+8SZkYoD/r7OngXxtL5KuRA3+z9n8vQ3TvzVLvRoze/16k7sMOd4o38pq+HcEs3H5SZYOvC9mHIui5WkcDOckT/y0ED4XxSbuis7LOIfd377n7ErlshwRYMghGAjF7gPyu5q1GjnabHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2DNNuwdf7l9U52ClT2eBKpYwXpOMBBBfJRl6OMAFP4w=;
 b=wPI/fQTdHIT5szxILvNYPEQA6c0NfQgZ0/N3fsGOK+WmOVnNZJmhAMThASmiovOu3JyqgZQS8AqI7pNRnOJl5ikHMyfBv+sAvIJOZGNTj18N4WvW9YkZ3TstTT0QWRsJPjb19wmi2lwppNz2K/24pqRaEVggbN4ed2XMWUbzRMo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <629e7628-61e1-4c46-8172-cfdc1e848185@amd.com>
Date: Wed, 17 Apr 2024 14:33:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ImageBuilder 5/5] uboot-script-gen: Add ability to specify
 "nr_spis"
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20240417120741.2453431-1-olekstysh@gmail.com>
 <20240417120741.2453431-6-olekstysh@gmail.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240417120741.2453431-6-olekstysh@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|DS7PR12MB8321:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d564a73-e55d-466d-cd23-08dc5edaa08a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	whruvyE/vr6qEshYR9aRPZk0fqxY0oHt4ULicGQtBYuONZhui00A9FTR4SIHMzY917I8gpyTVUbG0kvM7Nbf/5thYOS8pVoK5AcmLg+8VLgVUkK/upsMXxe9/rpZkoebsbQ62lejFzAExkzUn6SM++FezGdimnardOZXMrR+sM9CC3Lw+F88TJSAHjPRi1JOKNS4Mb/3rWuiuOUWxQO9j6xMnmq/MpMUDv14sJPFNGP81hGKonU50+nwmkwmhLfdR6+UX7qitfC0SjNE2Yn1NruEci4p7+U4XASC79yN369v6RUmumG8imMJmnAFMRYRVidOZsvq9wjF7PNjX2UO8ZmBhMo+HH8g9Q0Y0U/IM0+r4oTRywKd9iXeMg/G93mkVHKlqDF10j7y3BI9mmENaTLAx5Jf3WyxP0PlFwbskVGMC2bjxHDYDoclCbeD9/UgkBmiv1qAeIUaRCJkEA87u8xaeFTalDYMPwC1HWKOdS0Z4gh9rWzw54KpCeySpnWnpmmZ5HjODPqv9TQE04cf/Ccbc2JthVAy6ZYR1qX3ZXC+ZUzU4g2WG9+J8MWEg184Xx4FzNp8Qv0fGd6bvrkBBNvz0cVgyQ7g5gw78kz7lNKQsuEtDpDItKplqj6dA8xo/aytxs5+HbM43aGinY4xLUWyHYeh96wX7sPPCugQ1Fic310vwSrLIpo8FsjPvnI7CqV6rqpa+pKyy12x0Qn8hKuqGcFYB0ZuWkWVn6ODvxoJTm/Bat6IySzWEQUR/oak
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 12:33:46.8631
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d564a73-e55d-466d-cd23-08dc5edaa08a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8321



On 17/04/2024 14:07, Oleksandr Tyshchenko wrote:
> 
> 
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> This is needed to have a possibility of assigning a specified number
> of shared peripheral interrupts (SPIs) to domain.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

