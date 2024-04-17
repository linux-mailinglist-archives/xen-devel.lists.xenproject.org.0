Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D83428A8328
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 14:28:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707464.1105408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx4Ow-0006Yx-3u; Wed, 17 Apr 2024 12:28:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707464.1105408; Wed, 17 Apr 2024 12:28:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx4Ow-0006WE-12; Wed, 17 Apr 2024 12:28:34 +0000
Received: by outflank-mailman (input) for mailman id 707464;
 Wed, 17 Apr 2024 12:28:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R6tE=LW=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rx4Ou-0006Vy-4o
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 12:28:32 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20601.outbound.protection.outlook.com
 [2a01:111:f403:2407::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fedb706e-fcb5-11ee-94a3-07e782e9044d;
 Wed, 17 Apr 2024 14:28:30 +0200 (CEST)
Received: from MN2PR19CA0063.namprd19.prod.outlook.com (2603:10b6:208:19b::40)
 by DM4PR12MB6664.namprd12.prod.outlook.com (2603:10b6:8:bb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.53; Wed, 17 Apr
 2024 12:28:25 +0000
Received: from BN3PEPF0000B36D.namprd21.prod.outlook.com
 (2603:10b6:208:19b:cafe::a1) by MN2PR19CA0063.outlook.office365.com
 (2603:10b6:208:19b::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.20 via Frontend
 Transport; Wed, 17 Apr 2024 12:28:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B36D.mail.protection.outlook.com (10.167.243.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.0 via Frontend Transport; Wed, 17 Apr 2024 12:28:25 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 17 Apr
 2024 07:28:25 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 17 Apr
 2024 07:28:24 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 17 Apr 2024 07:28:21 -0500
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
X-Inumbo-ID: fedb706e-fcb5-11ee-94a3-07e782e9044d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QH1jQUgAA4Wk6UsSNiMJSUMxqP7HVbxDquwDrynCu1ndtUbLK2Vq3Z7/3nHYVPSI+7y7sN/pNqvJuSk0e105Cf2GcVlLm6yMZfE17X60+o8C9kgdNdRse4x2ct5Hxryd7WdRbB72kLfCxop7/PEyZkDI2r/htFtpKlXMRGemCuLJtiUGtCxXXHZP0VK9t+mLw9s3Ck1/1vaHboXJPH9YPVKk3ZAMre2bvKNuyJNGYutsDL1bOwtQb4EYab74PrMJf06oKECezssLz2JDObZt9Y7pv8aXHkKk6IMPhFAc8BBhVHyS1NggEgQJPHEhoM8UExgdAOQK4CykWN9p39QYcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k16I2UbYIBhSrcAw346sjI1ysnOimRpGMhDszO0ygso=;
 b=h0rojXiERVPVBbauhkESE4/hpUM76vbbm/sJq9CrQIUt7DPw8XqnGwRrqsVw+at6rTsR5UFyLhKtgSyoOB/bs/iI/jlb9RfOWoOBblglG1e3thMlY+VZWfO5Yj86EMEkvfi9CBaWzMWkBI3kcXZQXn5grvf6gubgHCGCKBDA2sbFVhXXH6e5GuTyKaEz/+pPdMvFr6U0PZrqRyv24BeY509yLpY/z68DWQVM3k97sXNf7PFh7e4DLGnHKEiUY24zDb4KebSyImeJddsCVFqXBCj2s4HNKc99JeScvMZWnRH7xZO4MKEhWUyVpAosIGULluakzPhgj9ohwBX1PVaCMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k16I2UbYIBhSrcAw346sjI1ysnOimRpGMhDszO0ygso=;
 b=FTj4L0kjkN4PXp/828O3V1SDV/XZbn4IVe+zFOup4vrSpwg2qFz62RVkAJAz305yazhJPzg1jS/hUwyeZOfNmoz86SZuewqWEf3uqOZbpZfWTOURXUfVTjekHvxxEdwXuwX89OLQOQNjnPKyMGYcyjBNVsMPezmq+ge7iGgHruE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <3ab662ea-d452-4e18-8082-ef608ccdf024@amd.com>
Date: Wed, 17 Apr 2024 14:28:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ImageBuilder 3/5] uboot-script-gen: Add ability to specify grant
 table params
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20240417120741.2453431-1-olekstysh@gmail.com>
 <20240417120741.2453431-4-olekstysh@gmail.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240417120741.2453431-4-olekstysh@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36D:EE_|DM4PR12MB6664:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e2f35f5-3634-47d9-ff26-08dc5ed9e0e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jH8uuiTlr0ZqKLexwwTem2FEi6WzXGVKsk/MQ8DlZti3xxUUVZ0JtCx0kf0PwT0JT6WlZaM9m/fr79pWbRVEEGNJn0MQxHf4FMdHNHbW5dj49DKghElwEBmQ8oqG+HxzY6lw4V/dTm7ZwPioNZWDmOjQ3K+bFypmA63G1qI/PRr5AdIDHlklUnahAU/zModrf2cSH1jR/gnACl7tn7wc2Yzp5yyBRfz2+d7pEl1hyL3AYrt2nmHlKhbheUATZG9XOZa0nOF1M+mX6WwmOiKRu/PBbGGhFxHRe7sPhrlLvfpQQFgzgncgAnvuoiyz3OWgkTjyxMyLSZa/jXqTpe+tyJnKDDPSjiFDDnhVZFkcp0ziSVJjB2Gwaz5v37dBxP+SqjAG6++hxuoR0FbGUDYLOM230h/y07Wwsi1Leeq4fsIYaErHg3GH0YJxWnETNn8iLyQWV1mmqYGtdVnkQatOLMjxpTBX0MaaU476dMd776UpEuYSwL0lmW4sz2V1lNAm7H/0OximXHu3ZZ7k/Q13k5YCKHj4RGdfShmzeRqSGKw2p5byB44R0g0S/xdJcRhYrjKiMCMHtuhMOU/L2BVaTEaHpL96IU/w0NelCLs+snRfvGF17MH6kzxUlvriAn+zQsWsbb8qy5MNIzDIo/FFrOMGT88mktjXlCgf+cYExLydnL3ld3htnwFTYNyoxmJJNT4vfDu6URaVOedg5adJAw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(376005)(1800799015)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 12:28:25.3382
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e2f35f5-3634-47d9-ff26-08dc5ed9e0e5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6664



On 17/04/2024 14:07, Oleksandr Tyshchenko wrote:
> 
> 
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Use DOMU_GRANT_VER to set "max_grant_version" dt property.
> Use DOMU_GRANT_FRAMES to set "max_grant_frames" dt property.
> Use DOMU_MAPTRACK_FRAMES to set "max_maptrack_frames" dt property.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


