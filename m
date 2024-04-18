Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C03DD8A950F
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 10:34:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708115.1106719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxNDI-0002TQ-Rl; Thu, 18 Apr 2024 08:33:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708115.1106719; Thu, 18 Apr 2024 08:33:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxNDI-0002QG-Ol; Thu, 18 Apr 2024 08:33:48 +0000
Received: by outflank-mailman (input) for mailman id 708115;
 Thu, 18 Apr 2024 08:33:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qd9Q=LX=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rxNDI-0002QA-8h
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 08:33:48 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2414::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f118ab5-fd5e-11ee-b909-491648fe20b8;
 Thu, 18 Apr 2024 10:33:46 +0200 (CEST)
Received: from CH0PR03CA0218.namprd03.prod.outlook.com (2603:10b6:610:e7::13)
 by SN7PR12MB7833.namprd12.prod.outlook.com (2603:10b6:806:344::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Thu, 18 Apr
 2024 08:33:42 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:e7:cafe::b6) by CH0PR03CA0218.outlook.office365.com
 (2603:10b6:610:e7::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Thu, 18 Apr 2024 08:33:42 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Thu, 18 Apr 2024 08:33:41 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 18 Apr
 2024 03:33:41 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 18 Apr
 2024 03:33:41 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 18 Apr 2024 03:33:40 -0500
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
X-Inumbo-ID: 5f118ab5-fd5e-11ee-b909-491648fe20b8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e3cf/ZIL85VzW3ebUzFYRC3xXD9gzk6gpIu4AF9lx8oyCeXuKRZWNoYq5tjilDXUt1VZbw/xJ6apQdZt2l+E70yzMmT/FdIxVFypOLfTd2pR4X80C16n6FNLO9uN4vKqXEesMBoy0IFX65z2vYEa//yA1Hb44iE7GBTYYdXoO8+p6/BL6prM4Kk9EK6N4eubD+CEUVj+UFoxbW2/M21CMgrpfM0R9HKK+0lMDBYuCLbdIOtAmGKsstsiTfCNgOhYD0eBdu35CHroe4Pvn1vL3r6kFXQuocWuNaGnKOXTcABeIjxYA6XxIQ4E9IgNcngTzgGe3Awqa5WwVv8s6NK6ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uWthPApBIm8sXStuRh5N72puBOUMJ3gy6Syd0ri4G3Q=;
 b=enU4P4ycmnk5nryfNukskfDgyXTtzkgHd6h1SyQkC47k9M7JfaFhsN8jWu8DM9fqTLi8HjncDdXheXLstbuuemK3GkuQy0q4jZJzaoCVt2r+3cuXOd7OY4SD5OJ3cZzJNvhwmXi7E0BeGg+srqJ9fwPUvdFddZhsqqJe6zeUunQnWcyrMBcaWm+rzymtoz4/Y06Qci6fosvDx5i9WLPCCII3GhJ1QLNrLiQidBH2xjLivNklZrva+WJBmCbCSBK2qA/dAFn8D4Aw9YnerCEBFN2XT/NjDixDspJCLoLNflrStAhqBi6zW7Ybqi3hi465QcfNPLDO6cZHfSo4bVA3hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uWthPApBIm8sXStuRh5N72puBOUMJ3gy6Syd0ri4G3Q=;
 b=L5Ix00Tio8rkasoDxT0duE5GCA/A8xsxk+kESJIezD749LTH7aDyFeDeyuZWOlEUymivbJwnU3HRVUyF4ZLM3XpvU3SAC3jg+E12SlpGC4PqtZ+nzUDLmA1bRsz7kKmRRLPDREzIdCnoE7m0QGONuyhFlWf3lp0cLPWeJBFvsIY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <6609d917-e55d-42c5-894f-927778ab3064@amd.com>
Date: Thu, 18 Apr 2024 10:33:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/12] xen/arm: Avoid code duplication in
 find_unallocated_memory
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20240418073652.3622828-1-luca.fancellu@arm.com>
 <20240418073652.3622828-7-luca.fancellu@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240418073652.3622828-7-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|SN7PR12MB7833:EE_
X-MS-Office365-Filtering-Correlation-Id: 984a223b-6de0-496a-80e1-08dc5f8240ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hO9lwG40xj4JC/ASOvsIsnr3jya/fk9/Qfkj063tc8RyMLnX8bE/Jne84xi+oIpXcDMD+A9kAm8ulYuVktxr4D3QEZ2F31It4lEOYEPJCUJRUUnL8dHhCGTC4/DvWtgj/P3APSRl3wCMX4IA5rY/Z9AR7gzfe8UCeiN+vbnEQ6V9Ey6TNpCad/mSd3Fu0FEFQYyqXWycrCelFEdsq5AifeKWptO3qYZouSB/jDnT78prE6gsDezFjO+Khy7SYNhf9QXKrx7M+Tz+zPi+wNjHKLn9VM5Lc037LAWEn64hRmvf+n6E3xGgOL7NP6yp3h7aBc3JmIbY2FUYk8IWnByOwrD4hP49xTkM0txfVvWJEIshcFOVHVMj+tqJP5h1SNnRSwoN3UXTnm+uZioZAUzxATIlpk6D9ArAp+B/h7+7rSVHKjEWe9/osPDAPeDbdZ/6wF4jHHE4y3J5teBCwy8shzDG4vnJiSs9zO2TnLhP5DlFmERXM/LdU5QFF8qogwWe9RK0BEGZ+O5IRlFST+xxzQJNs2BURFh7vurZyzAiwy9OOxZisBQM675Z79q1lk297yeFeVu9lceTtzBIurEXAZXhZAksNfmoBcSblpupw41SegMiXROYAHSPREa/VfJO7mDXPKqnmEJsl1JBZ0qLawcdAgmcHsVdV7YDIaTAvdv65+c/uc4PA+Y43aC+1DK3MWbpBsp3bDd8yG9E5AzbLkjRIVSF6CXVik8U+3naBuKvuTjh3iTWP09NhRtyToXI
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(1800799015)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 08:33:41.8902
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 984a223b-6de0-496a-80e1-08dc5f8240ee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7833

Hi Luca,

On 18/04/2024 09:36, Luca Fancellu wrote:
> 
> 
> The function find_unallocated_memory is using the same code to
> loop through 2 structure of the same type, in order to avoid
> code duplication, rework the code to have only one loop that
> goes through all the structures, this will be used to avoid
> duplication when the static shared memory banks will be introduced
> as a separate structure from reserved memory.
> 
> Take the occasion to add the error code to the error message in
> case 'rangeset_remove_range' fails.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


