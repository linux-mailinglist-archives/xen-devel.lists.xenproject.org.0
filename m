Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AB08A0846
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 08:17:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703762.1099625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1runk2-0004FG-02; Thu, 11 Apr 2024 06:16:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703762.1099625; Thu, 11 Apr 2024 06:16:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1runk1-0004Cs-TH; Thu, 11 Apr 2024 06:16:57 +0000
Received: by outflank-mailman (input) for mailman id 703762;
 Thu, 11 Apr 2024 06:16:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1M6P=LQ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1runk0-0004Ck-Gn
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 06:16:56 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2009::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17b7bc96-f7cb-11ee-94a3-07e782e9044d;
 Thu, 11 Apr 2024 08:16:54 +0200 (CEST)
Received: from SJ0PR13CA0213.namprd13.prod.outlook.com (2603:10b6:a03:2c1::8)
 by IA0PR12MB8864.namprd12.prod.outlook.com (2603:10b6:208:485::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Thu, 11 Apr
 2024 06:16:50 +0000
Received: from MWH0EPF000971E6.namprd02.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::11) by SJ0PR13CA0213.outlook.office365.com
 (2603:10b6:a03:2c1::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.11 via Frontend
 Transport; Thu, 11 Apr 2024 06:16:49 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E6.mail.protection.outlook.com (10.167.243.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Thu, 11 Apr 2024 06:16:49 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 11 Apr
 2024 01:16:48 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 11 Apr
 2024 01:16:48 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 11 Apr 2024 01:16:46 -0500
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
X-Inumbo-ID: 17b7bc96-f7cb-11ee-94a3-07e782e9044d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SuW43DkOqtak9A5/HBQFkuvJVWkOvwz/E4fOUGJ59YtQNgDso6t8LRLJ4mhxeRtlxYx+osGFLvAp5f5DsM4RInjn6g4oxRkdj9CdBYOTsBrQBvdqjYHsYGXr1MbKgKb8egWSGKhPipCQK+2dopVaGBwTVIgbPWAbL/4YNBFBH8vIYB+HSaiWvj1CfjD9z8KNsajYMcEkOMhQ/Yufep9bYoLkSYHaPxxyVvPVTDA4ACsoCEreqr3KZNWKQv8aHmpVYMY1x0mZ6zxi1YSUgsdPsrfjVlY7jGmDubaoAiuNn0m0byKU/2Zj05glOO+rIhSpMfqGvrg1fQpcwFPwatdrqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=muQwYSrefNPv/4y0vJzJnhmptdR3vG0UEVmmIDbCi7I=;
 b=OaMHCrEtUMSkvsxcnxNDxJDhy9s5H7Jmg15MzFgD5+ZktYN2S4h6oTqu1elvx7uObcMLnZ0fPstD60dGhk7OlSQc34VNKu3nc8jCb5Y9DdLYQfVh0OAw2EH20Kh3DdqFEM/1he9hI4ExKXpZhkGCzrdb/fSVOgM9goZliRHGwPoHlOlrhDShuHgIrkDJxbhVK9t+u+7Rs/CVra3rCSB7DbRI90/hbQloPnWJSz2at1eE1Z3FeVR779R0aQ2au7jr7koq5AwtBkdwNaRiEHVvaNrs5sgMOAaiqDIXHvGhMIw1B9SXbBDMcpzlB5J7EgZGcMf+0kt3nKdKKklMkLIHHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=muQwYSrefNPv/4y0vJzJnhmptdR3vG0UEVmmIDbCi7I=;
 b=Bo7v0T+GyXe/Ge/glRgXl8OVIL/X++OKLhVMCnI9RW/attXWmOIQTxHmyPh6Ly+vT04p0/7UKMdBN+/x6N4Im8TTB9NuZ1BpLFcHjIhp2eUCQvRMwKqmTaGAHOacc7l1XZytNbay83ALU/xs0JBbLLE6yyatn7lgpaTCj8qvtFc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <338968ad-0851-4d76-bc61-5622f8836316@amd.com>
Date: Thu, 11 Apr 2024 08:16:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] xen/link: Introduce a common BUGFRAMES definition
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20240410184217.1482366-1-andrew.cooper3@citrix.com>
 <20240410184217.1482366-2-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240410184217.1482366-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E6:EE_|IA0PR12MB8864:EE_
X-MS-Office365-Filtering-Correlation-Id: d04fe148-c8e5-45f7-58da-08dc59eef90e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VqIpCsNW8a+YAWjtnDJUA2ByZuTfAowToHpCNdqoGhaC1FNloLkQvzIXzEN5gZl2CUerCPLwMbwDEDBrLZCKuxMpKwX+u/8iyjssNXCGBooO/2vwUNd/gmbCi4yoJzk01qW5N0Gy0PQl/f2GYcMgYsQFcQkY7laIV7nbEI4U7Bx7rn4P5KmEowWf5uO5bT9lM2iidVrMF9/Ny9hA8VhwAiVUGYK0eB8rAv/iVg16zeduJfL8IGhNxo4vXiQvYCoSGXXAekq46h5xIO34JO08OfZ4XgiGIEHEhKe5Vq1pHEFBrw83C8dXWUgPIaP0CNU1vjcaZXXNHtQco+vJBDUUplXjSPUQKS5t/dIZFb0Y6dpbbsdhVopA2BvF5luPxOfKSWBAixwH/72I8vkqIeeXMcu1sk5jYLuZyxeMCQJNvQkI24zBKw1DJwYswDqq8iYuhpjBb2fQz8s2kxdAv1WNGcgrySO4K2X/KEyaJxqhqq3gun8VegwkkU66a/bHJ19WurcX/FEI73CD6KeKetEYCiQUDaeXAuRwyKsfZiiKE0F2p/lGXGE8vTc9Sc91Ojz+sXOKMywjjrqHjtyMvObpvyjsumny3QYy8pwvBoHevNaSrPVXACRAJm/xtEaWCGc96NXlq+hsi2xRbHL//kUy1XFMMP2OoPk420Hh3gr3UtA+I1jSlg04d9araVxdNApthGJdfynLItnpZjBUzgHQixwDi+dgQbwuzFb6bJsR2b21NZ8VJQ0siB3Sd0YBv7ax
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(7416005)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2024 06:16:49.3760
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d04fe148-c8e5-45f7-58da-08dc59eef90e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8864

Hi Andrew,

On 10/04/2024 20:42, Andrew Cooper wrote:
> 
> 
> Bugframe linkage is identical in all architectures.  This is not surprising
> given that it is (now) only consumed by common/virtual_region.c
> 
> Introduce a common BUGFRAMES define in xen.lds.h ahead of rearranging their
> structure.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
For Arm:
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal

