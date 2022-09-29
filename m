Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 399E15EF6A9
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 15:33:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413789.657683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odtes-0005Xy-92; Thu, 29 Sep 2022 13:32:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413789.657683; Thu, 29 Sep 2022 13:32:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odtes-0005V6-6C; Thu, 29 Sep 2022 13:32:58 +0000
Received: by outflank-mailman (input) for mailman id 413789;
 Thu, 29 Sep 2022 13:32:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nQro=2A=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1odteq-0005Uv-Lg
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 13:32:56 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39468bc9-3ffb-11ed-9374-c1cf23e5d27e;
 Thu, 29 Sep 2022 15:32:55 +0200 (CEST)
Received: from BN0PR02CA0050.namprd02.prod.outlook.com (2603:10b6:408:e5::25)
 by DM6PR12MB4910.namprd12.prod.outlook.com (2603:10b6:5:1bb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Thu, 29 Sep
 2022 13:32:52 +0000
Received: from BN8NAM11FT041.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e5:cafe::61) by BN0PR02CA0050.outlook.office365.com
 (2603:10b6:408:e5::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20 via Frontend
 Transport; Thu, 29 Sep 2022 13:32:52 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT041.mail.protection.outlook.com (10.13.177.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5676.17 via Frontend Transport; Thu, 29 Sep 2022 13:32:51 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 29 Sep
 2022 08:32:50 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 29 Sep
 2022 06:32:50 -0700
Received: from [10.71.192.107] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 29 Sep 2022 08:32:48 -0500
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
X-Inumbo-ID: 39468bc9-3ffb-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jWIhZEC5ggFZNKf30GqM0MYQ+ILlV8A0poVJ5R98LZOFdq97hWunBUnJCTHT+ZlD2HsT6wjX7gvSOGYO/ErPdKNMILIVaXEEwZjDXWVMdr23zwYLpDkfBZyRpPRwoQbp7R943YTPw0Lx1FSWqxSZLUme9yaZw5kCKgGmSj7VdAXuU3EJR3RTjAjoWEia3T0vdKVYY4qP2DpTuM3DK+fPZV+mkq1CcNlVqs60ZU/G4CPnpYw1NAx/U0alSoB/Fr3CI36080KqlpxdkGcuxwFtf7j0bZlUrV6n8qchsKJa+I3nAQUdYUdHrztKVGCdfvl2/nqR1wstydYQplC3HeiukQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2bZOgUC+eGrVpc1D4MLGuSGxUlynpxq/Qic03RuiFp4=;
 b=W9xFrEDmeQ1dlKcnzqbXutY6afYDlPAHeSTBY+uKoNE9jPe3yPujicQp1gWbOV/KDOyKtae2ivnG4YvawFbjxaMnbc+ZDMfsfD77S73ssuTfKI3TzxuGRQwgtIEWZ9e3AR4TZ1HeYjAURz4EaiisGkl0Qa/mHheKGa02EyFdWAKaC8AUeSJeYVv55d+K45xZNZuPq55CIzsLSEi6FeC4t17F5S0oZ0ZrNiDMGq6mXVg3NEbsfwD+KdlTyuA3aPRaMzPgX8XWprt7aAafM1GBvo5a2Hoc3My2vl8whsruLtUi4NFPdM3mWFeYvHQRS8FANz68cUjg0tU3nDB6JOQ0cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2bZOgUC+eGrVpc1D4MLGuSGxUlynpxq/Qic03RuiFp4=;
 b=Mt93EoODI53yJosZoTXFgvsZpyyz1r+e99m9bupH10lzRFqaYXmDYYPBdxwdUIjETzfuP21vIN5JVvEeRHBUcvddyKcW9hucEq24W4luIJPcgjGdHUPmlS4SbcRoN3uQbXaBsM1ifY3F6dDuk/OcqVBj1Dr42oRi3NNy6ZouU1o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <d832ebc2-239c-9c84-e8d9-f7a87efe2dba@amd.com>
Date: Thu, 29 Sep 2022 15:32:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [XEN PATCH v2] automation: Information about running containers
 for a different arch
To: Anthony PERARD <anthony.perard@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Henry Wang
	<Henry.Wang@arm.com>, Doug Goldstein <cardoe@cardoe.com>
References: <20220926135838.47330-1-anthony.perard@citrix.com>
 <20220929095131.61034-1-anthony.perard@citrix.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20220929095131.61034-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT041:EE_|DM6PR12MB4910:EE_
X-MS-Office365-Filtering-Correlation-Id: 93f78151-fe26-4266-d260-08daa21f1bc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eDokZIceEiQA945C40hqFjPc/dmcP32kIPmwaCsARtvDNNrvPXm2h/UC5rj92MPL8gjz6pyqKxNOOII3eZxzEuhge0Z0XV/uzO8N/wo5OgQI5/IgCsBScOIh9lPgkixwQswncZZu6KfhluU8R7c7ltEmbVH0ezCxPoh/sd+CiAmpJF9ETawzI6Tizqv//DLKMsWr2xtWOjmjrXHr2wE9XwlSMpGgbmh+5YWYMUvTyNAW5KyVKFZWbdkTYPy1rNk56ji4Ia9urI3fG7YFhJBWZs76KH9yC/JLYiZLIaCWs0IUv3uVGBIzcHRFCrQBYqBeFbAWzmTDaTw91rD5/fwI7r3BHqFJ/EgDKDzk8tGP3zSbywwt7RnXfAb8V/9W5DNzc4pagOxbHRtgV9yHW1u992t8tNbyC77Tx01w7zTmmaQDDcqPWtz4oK54TBv1il0ks4SPrVwi68wgl0sNC+i4Omme193fAsvHa/omNIhElIW25RYI3Rlvj9ZhIsoQ0b4kAn7ddSy3fYvnMo3m7jkMC+g4upe0a3DgiJtaUpj6yY/U6S5pZEBYUEWMgiZ9TwX9jYzJBoRTv2OucGJE7Fysc/HPSkHPsSty1ODu+y/8GY75oFWekse+GS28ZTz8ezTOHnPaKwH/xOOlyNpFqlPaqBxRJGXjPln4CoInn8/WkGF9A4m+B0IPmK3howysRWaHBgW0S0mHcbSoo8Iopixw55/KmZCXSlDj/EM6tl1MTZRVhstoZbMDi/hpM3oxNvh5Bfj+lepAlADmuT9oxdi0f0F3QBfjM78EP6o65JUoHkzC+AHbIgTnXDbun5cPi9ZkVv5cGRl1de7hUMKZI+Mgsw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(136003)(376002)(346002)(451199015)(36840700001)(46966006)(40470700004)(5660300002)(31686004)(186003)(8936002)(53546011)(54906003)(40480700001)(86362001)(31696002)(47076005)(336012)(4326008)(426003)(8676002)(40460700003)(356005)(478600001)(2616005)(26005)(82310400005)(316002)(16576012)(558084003)(70206006)(70586007)(41300700001)(44832011)(82740400003)(110136005)(2906002)(36756003)(81166007)(36860700001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 13:32:51.8938
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93f78151-fe26-4266-d260-08daa21f1bc1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT041.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4910

Hi Anthony,

On 29/09/2022 11:51, Anthony PERARD wrote:
> 
> 
> Adding pointer to 'qemu-user-static'.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

