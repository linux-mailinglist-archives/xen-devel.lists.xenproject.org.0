Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C89E078BEF6
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 09:10:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592007.924620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qasr8-0005NZ-IE; Tue, 29 Aug 2023 07:09:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592007.924620; Tue, 29 Aug 2023 07:09:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qasr8-0005L1-FD; Tue, 29 Aug 2023 07:09:42 +0000
Received: by outflank-mailman (input) for mailman id 592007;
 Tue, 29 Aug 2023 07:09:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jKbG=EO=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qasr6-0005Kv-JZ
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 07:09:40 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0348e414-463b-11ee-9b0c-b553b5be7939;
 Tue, 29 Aug 2023 09:09:37 +0200 (CEST)
Received: from SA0PR11CA0129.namprd11.prod.outlook.com (2603:10b6:806:131::14)
 by CYYPR12MB8937.namprd12.prod.outlook.com (2603:10b6:930:cb::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 07:09:33 +0000
Received: from SA2PEPF00001509.namprd04.prod.outlook.com
 (2603:10b6:806:131:cafe::ed) by SA0PR11CA0129.outlook.office365.com
 (2603:10b6:806:131::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35 via Frontend
 Transport; Tue, 29 Aug 2023 07:09:33 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00001509.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.16 via Frontend Transport; Tue, 29 Aug 2023 07:09:32 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 29 Aug
 2023 02:09:32 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 29 Aug
 2023 00:09:32 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 29 Aug 2023 02:09:30 -0500
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
X-Inumbo-ID: 0348e414-463b-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cKy7J/3Dx4KPg1kGrBAvedJWdA9Z103afBswxAUU5umk7z8o/qVFzy4IP/zJxqvUBp3HiyWrJnD6kOeQW8B70v2bSxRVt/gY6970s0PDM9KlUsgvkBJ2qPj7FDvEpdtPZjXP+LoD0NgLQ25ETjPlM54drwB5Xeca4J5UYAq6G6eSB7F2C2tIQKCyLNqNicnyHkvlVyNZeU+YUjcvrOmSt9rWzYOjK1mbht6tlwstXFmYRX1fveQ+QnZwyTuPANhRpEYdOoesDhr9Er/kFQQL0BIq5y9h8cVO/WQk9XtBdhHY+iBZyeAYMDIjBFIbFmKCfHHWPI1PPJzSZCfEAzq7CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aK+YL4CKzVdJthe1y/GBq5XHJer5rui3mMA+WDmay1Y=;
 b=Sw+bA6VhBL8wYzgbNXOdmXO5A+ilX39EoMn0yUR9/kmpFEM75nuTlLFzC6l0wHLOSIBv+e5NYVUIp2Mc0khYBgDzHQo31V87/5X7DxQXgkeEP7t4iIWwIydMsEtFO2Jbu9dSYMrA3C7I+JFM4wfgnDRBq+oYuApO0tQFtnF6TZT+tdzzVfqe/Ngw+QWMKh+RXzjnyzTVckkKMlT6Jhp43qPecSk0rZ5lTX4btBaKocnkXWySQN/eWP1wNW0ZfOLtDOmRgLpPi9X5JIP6fiJcifTGiYHWAvEx10+XyKe/O/zes5dDDhllZguF16dMzIWFBnChknDQxwr+CA96OgwFUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aK+YL4CKzVdJthe1y/GBq5XHJer5rui3mMA+WDmay1Y=;
 b=anPxtIWT2Sufa2my+UEqE86tqhucxRAXuVVqoConWfa7LmolfwlUBES2JFXqtdTC249XGwPUcSPYOtyncELu2tA3fr8lv32pir7UynpG/gjUbsm5CSzQpcSVXOaeqJZI7d8JL+sGlHDG5Q7nDzk93r9QSTO6tVEeCJYNALV78Dg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <25bbc6e0-d11a-ad45-991b-1f6bfa21d75f@amd.com>
Date: Tue, 29 Aug 2023 09:09:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN][PATCH v10 02/20] common/device_tree.c:
 unflatten_device_tree() propagate errors
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>
References: <20230825080222.14247-1-vikram.garhwal@amd.com>
 <20230825080222.14247-3-vikram.garhwal@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230825080222.14247-3-vikram.garhwal@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001509:EE_|CYYPR12MB8937:EE_
X-MS-Office365-Filtering-Correlation-Id: 7490ebcb-d269-4b13-1b6e-08dba85ee505
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zgrACCWtMQbFIpE+mLW2Cra5TJFli1TkMRCSXVyjzkvp1g+U426bwePenmvZrU3bQCSsqcfXbAhzHSL8FnEE/FUTKPWdP00+4RDBhUWLo9qZ+O7n959xHwvDnqty4TOePzSUj+k16Moxi736zwBCFp+LKUfufw1BeZ1oeomGZLkirJ0BZfzlYEuygaJEGF2Pk+D6+XDop3ixKli1iTrjPFSAD8UztGOWVGyUTQbuRqG63fOG2cesJArXrAHAaMiy8rakPDWsDoT2kVAQujYtGotZZMDhWF6GTTJrEuISovDMVN41RgO1sNNaZTsc7snqYlsix1+owKd9bSKjjqhYzkK3sfVFHXzIja4XJKOo6HOLBNFM4f1Yw61G6+g2XzU7Xn2v5J7R83lV3z2zIKFooKm9rkfTMeJmscEA5Q1lkXmUiLa+iAhqUYmnad7vlg80psTD7pzFiRta+6YmAnV1FLv4A2ST7hlmulXU03KPzUw09aIAAQ26v7cXOfAPYtbVBvCCVfdDgO3SOypHES7XmW70DoOeOW18Sa6p68LNPcfjTOMZaHX5T6c/OgvOLSPHY2P20W7Na9jQuGn5VlFf4U/+FPv1s6vESuj4e+B0Am1dnaEmdJ9JuoD1oOfFTE228fuNiZGO6mHN4cn0UYddZ0PjRs6EDtF88gSwAj9tS7eQjzvYJ59j+8YmUpAn6AWreh/HHobVd/JYoQGbWqdMIP3IWQIGfmYQzqyd/A6aXiJHrK0vVWTcHmJIFiJgODVdx29i74mhgj91YlG6I2zPKfsX0A0ng8xQD+RA2PKPMlPelVBRoTY98VOt2yh0Azjv
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(396003)(376002)(136003)(82310400011)(1800799009)(451199024)(186009)(46966006)(36840700001)(40470700004)(40460700003)(316002)(16576012)(41300700001)(4326008)(426003)(336012)(2906002)(31696002)(86362001)(4744005)(47076005)(2616005)(36756003)(26005)(5660300002)(44832011)(8676002)(40480700001)(36860700001)(8936002)(81166007)(356005)(82740400003)(54906003)(53546011)(110136005)(70206006)(70586007)(478600001)(31686004)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 07:09:32.5141
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7490ebcb-d269-4b13-1b6e-08dba85ee505
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001509.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8937



On 25/08/2023 10:02, Vikram Garhwal wrote:
> This will be useful in dynamic node programming when new dt nodes are unflattend
> during runtime. Invalid device tree node related errors should be propagated
> back to the caller.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


