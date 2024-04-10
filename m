Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E0589EC60
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 09:41:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702945.1098642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruSZc-0006Ek-MT; Wed, 10 Apr 2024 07:40:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702945.1098642; Wed, 10 Apr 2024 07:40:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruSZc-0006CL-JE; Wed, 10 Apr 2024 07:40:48 +0000
Received: by outflank-mailman (input) for mailman id 702945;
 Wed, 10 Apr 2024 07:40:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=23xn=LP=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ruSZb-0006CF-Qq
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 07:40:47 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2417::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3f9feac-f70d-11ee-b907-491648fe20b8;
 Wed, 10 Apr 2024 09:40:46 +0200 (CEST)
Received: from BL1PR13CA0030.namprd13.prod.outlook.com (2603:10b6:208:256::35)
 by DS0PR12MB8367.namprd12.prod.outlook.com (2603:10b6:8:fd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.47; Wed, 10 Apr
 2024 07:40:42 +0000
Received: from MN1PEPF0000ECD5.namprd02.prod.outlook.com
 (2603:10b6:208:256:cafe::ec) by BL1PR13CA0030.outlook.office365.com
 (2603:10b6:208:256::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.19 via Frontend
 Transport; Wed, 10 Apr 2024 07:40:42 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD5.mail.protection.outlook.com (10.167.242.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Wed, 10 Apr 2024 07:40:41 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 10 Apr
 2024 02:40:41 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 10 Apr
 2024 00:40:41 -0700
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 10 Apr 2024 02:40:39 -0500
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
X-Inumbo-ID: a3f9feac-f70d-11ee-b907-491648fe20b8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oCLLoXCwHdCOCDqlfnGaUTeNMYtBbXPat/G8BbRsymEx3t/OqzpijX5nM+ZAHsEXlLh7iTIudbgkVKg65Y9Z1I5W5FiTEA+J1S79qyjbw1v4HaIhhBeIHDbxuvNhSpRVWyVam2rCEHnTlS+cQh0LHEwJjfJ+RWyAYpLZ44Phh+jVUvX8XOFXc0e/auad9VNcJo2qDNAQf6LpMTS2bLsp0OYgkOaFF10GnfUGKslK400EJ76Ha58IOhxssRo/XWjo00RexNwcAA/VRcEIQiUggskw0JPjCaVFv6ZwIGF61YMfcKRHNkoLFoTP3QQAmvIiOAaHP+G/5ScyhKSzVvxo6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P0kKm5Cq8rOCKpE1++/tVU4awLhYuW2oT58PhMsRtFI=;
 b=m1rnQ3A69ocEPnoPSJzxkzYEkpj9nuyPPtLr72tJyqinmeylu/5T5MezDi1zK6FWjkkWBHdZloZzmuYhT+vQ/uldA1H2Kx2uo6SQvLVoSH8PLu+RvY96yMtO+GD783Ed2ugiGwfiK1xFN4mWa18ic4Umxr37os4TarrvvNPedIxj+O0d2s+zBHttHz75wlubZaV9NWpLAZbeNzIv9w/RmJjIy33/UbHZYHHz9jpJ+DrboBWxOSvM56wPpYp96p5lAqn2eU1ZwmiNocMmRA7JgI7zcqDqIEnEOQt05AXX/OeZzM8KW7R7jRt95mIOLbopIX9Up1a02QQ+XPMGdoeaig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P0kKm5Cq8rOCKpE1++/tVU4awLhYuW2oT58PhMsRtFI=;
 b=KfW50ZJISqVMoAxC/3fjVtlzBzWMdIsrxnH+MqtnH/GLUOtC/I9yb/patT5zV+cAEQ0B3Hc7js3wI15BzgKcYskSaeZ1m1LxVHTpRF9KQrm44ldZ/bbA9cBGgMOWx+EE9+CSjBB4MEQ2n6eQqJpcp8faEt06tdCS53L482rnI/E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <226aaee8-abb8-4a9e-802e-0dccfb1dfaa8@amd.com>
Date: Wed, 10 Apr 2024 09:40:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/13] xen/arm: Avoid code duplication in
 check_reserved_regions_overlap
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20240409114543.3332150-1-luca.fancellu@arm.com>
 <20240409114543.3332150-8-luca.fancellu@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240409114543.3332150-8-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD5:EE_|DS0PR12MB8367:EE_
X-MS-Office365-Filtering-Correlation-Id: 8daf987f-c9fd-4225-8eab-08dc5931864d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8GsVGTJ8ch0h1AoTFayFOhoGk+v1eDQmvNjXq+mET1bMcVvgQbPPfoQ+nkNQTpLczddDfFlqBFGdgepcXFLQf0/Ns0FZT4BVTzxUzjth2pjALUgeSjc4wjqCbdyQqkDdowtn7j3WHo3BwK4z9wLhLj6pk4ulvrOkMtyPCR/CtjGvWOfWPAeKuII4GOibr54Mqp+ivqY7lNgYfxRO4rcNHtFm9C4WeSLFYPeyLPKEzJqdGgL+Affz0peQ++JjUVnJJQRYLtM2FXD7KWan9hLDOPLqlMLstzg+qRcD1SkEcdM+ekfbK2xkeay9NoU/suOMqxTVuRLZAWQwZx7/ztN5Saaxis4+N6ZPvIcCPye8tKRKIpln6S4SyJIyZijMqZEm+PFGVY4PSYqSwCqaJ8EZ2BchWmBpfeUW0UjXn+Gx7H8GLlQ2oSg4VKnnLQ1yGMYQcqDXpowT7K3kszB/XY/f+hztfRGmcOg9QDiw+bHbiAaUSSTpB2CVCWV2+rybOYMWZOnnCg4mrv4OWDidB0sTyg/QSwhPHrfVFZng1076R7kiLh4bbJTWMm+o5ri99Z3zpRBt8GS3vd/o8QZrAj5w+OHBeO6FiSWCd5TkkILH7oijrAz0pfLUu60qveY6dr5kBkqiyiwAyh6CVkDC+k/xsYWcMFjCtEd303m2VzIKdzy/FUaQPN9Lqwn9kxWBly9fxLQTj7/AlgsEgo1MKNZ6oHI+T2nq2v8k3NAvTeYCM+sxJwC1dyafHiBIy9lQxBYR
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 07:40:41.9548
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8daf987f-c9fd-4225-8eab-08dc5931864d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8367

Hi Luca,

On 09/04/2024 13:45, Luca Fancellu wrote:
> 
> 
> The function check_reserved_regions_overlap is calling
> 'meminfo_overlap_check' on the same type of structure, this code
> can be written in a way to avoid code duplication, so rework the
> function to do that.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


