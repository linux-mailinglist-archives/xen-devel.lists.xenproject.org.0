Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA99F86DD2C
	for <lists+xen-devel@lfdr.de>; Fri,  1 Mar 2024 09:35:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687564.1071197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfyLs-0003oL-2N; Fri, 01 Mar 2024 08:34:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687564.1071197; Fri, 01 Mar 2024 08:34:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfyLr-0003lS-Vk; Fri, 01 Mar 2024 08:34:43 +0000
Received: by outflank-mailman (input) for mailman id 687564;
 Fri, 01 Mar 2024 08:34:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=skW7=KH=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rfyLq-0003lM-HG
 for xen-devel@lists.xenproject.org; Fri, 01 Mar 2024 08:34:42 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2418::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8adf6125-d7a6-11ee-a1ee-f123f15fe8a2;
 Fri, 01 Mar 2024 09:34:39 +0100 (CET)
Received: from DS7PR03CA0140.namprd03.prod.outlook.com (2603:10b6:5:3b4::25)
 by PH7PR12MB6491.namprd12.prod.outlook.com (2603:10b6:510:1f4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.31; Fri, 1 Mar
 2024 08:34:35 +0000
Received: from DS2PEPF0000343A.namprd02.prod.outlook.com
 (2603:10b6:5:3b4:cafe::97) by DS7PR03CA0140.outlook.office365.com
 (2603:10b6:5:3b4::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.32 via Frontend
 Transport; Fri, 1 Mar 2024 08:34:35 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343A.mail.protection.outlook.com (10.167.18.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Fri, 1 Mar 2024 08:34:35 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 1 Mar
 2024 02:34:34 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 1 Mar
 2024 00:34:33 -0800
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 1 Mar 2024 02:34:31 -0600
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
X-Inumbo-ID: 8adf6125-d7a6-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C8jsPoEZcEzrwoJd0LArjAFA/M0ECPbiBIsYc3u1+dCGgt/0KtQvzwXnPuovB1wCtyPxCeMEPd3aONaLgqKpaA8RLd6e3BrXML3fgu8+I2RBP1E2fwCnxyuxajyaAJFE5K4rHiPzVaHyRIK0n1ytngNFQYGQEeJVY5bUmeS00x8EcxsbpDNhhvlExdcgYQKilQ0gh7pj0bq8tkF8YY27VXJvz9zEVwkthcaa3QlPPkCNmPvA7qQHi8HondJag0uSD9D7cuyLyKgBdDj4TqNBOFixwhKty/cizlq5l5coinMZulKGygbdhL6z4Fm8OSszbNmvp3SaYthfLQH+MDxUbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1jiFRjrnYN/0aS7YHHpCPHuCNGWCHKKaUsltcPDVniU=;
 b=YDiZlwAHge4ymwBkmOGdWYV3RfOS3J6WPIy0kuyLlQACF0SWk+Q9iOrPxUDAE6pm/6s7rAXXwNt39vYfXXygIzurUh2ZAHoapff8se8I+CSmZj9CXWd5lXfSw1wp+LAkNyESbEFCzd3LNX5+jn1Fp29/FTSSfEYE/v+f0CU7wvZBkq3CxVmlioaPcOK3eif2WBFiaa0nByCLEv5DRJcQi92hvoZiTKwZGlm2Xi9KCzKoz6Qas/C0QimpJ1NOYN9BdLCOzI37+HxbJD6Qg6YSQomyq0cQHwposgDC1eCGCV37fabb2ZPl4HfKSI1sSj1gS6BHwLRCVrw1DRV9p7xWgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1jiFRjrnYN/0aS7YHHpCPHuCNGWCHKKaUsltcPDVniU=;
 b=Q3JnSLbGwO55LSKE/bHJ4fYCfHPqMIsljNihgvAYyvnjT1O03bOnpN1EJ4XAf/nH34Fnhk90tITJj7BQq8jR+IY8Im6VsCfKBUS8UGDe8/8infeADHY0saUdDXZDdyU/wMl8/cN1AU41WYJHupDw96ZO/E4OvbncW2HNFw7a9x8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <36cfcc27-f432-49fa-a949-63b0400d9af7@amd.com>
Date: Fri, 1 Mar 2024 09:34:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] docs/misra/rules.rst: add rule 16.6 and 20.12
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>, Stefano Stabellini
	<stefano.stabellini@amd.com>
CC: <xen-devel@lists.xenproject.org>, <andrew.cooper3@citrix.com>,
	<jbeulich@suse.com>, <george.dunlap@citrix.com>, <julien@xen.org>,
	<bertrannd.marquis@arm.com>, <roger.pau@citrix.com>,
	<roberto.bagnara@bugseng.com>, <federico.serafini@bugseng.com>,
	<Luca.Fancellu@arm.com>
References: <alpine.DEB.2.22.394.2402131431070.1925432@ubuntu-linux-20-04-desktop>
 <20240213223334.3693410-1-stefano.stabellini@amd.com>
 <alpine.DEB.2.22.394.2402291754010.853156@ubuntu-linux-20-04-desktop>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2402291754010.853156@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343A:EE_|PH7PR12MB6491:EE_
X-MS-Office365-Filtering-Correlation-Id: 55d5288f-072e-48b5-1b0e-08dc39ca6ceb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JiTBkfTQ8VVLul0JActz3XRlhPQxxX2IUcCtOYQKq5yMePV6ZB3MXQSlibVvz6FARguR2htxv8/dLKSh0P/JvFjSilguma0w/83+YDXOx+XnzCcC/8CsT++WZPcu4kyh49CIZUMF6ettW1qo6fRnMsxR4tn9wLMGrAQL6EVJAVebzREtJqFfGSyD63/DTOQ2ewVw6nLy2nQW1ydMQoJoZziO/dclTfMeIX18NgATp/O1vIj21LsiMbTfiOdMqGaaoYLL5f2LgnI3eIL+5McD/MjXRjOc0q9u9sKJb0usPPphDtB9TrBE3yg9TRXX7rabLTJB8yDGNL6xK3QVzCZlHMKGftSARKGANWP29A1Bvnn2M1Uuizw+9X8OnSSnSM3x1BAEW/Bhje+4sYz6oag8dhybb7Fh7SN9BYR/yuPV7/n5kew2/rI1/yYY24f0OSnwPa8himVOEPxCIf9zph4Y9pIXcdFCGorCaKxHeqD+zoJjxwkO9tV7Z/SKmznv6WWBRJBqsXmRTKcBFMM0iMTK+A5zUtVvCxZWO43HJF/kpNXGsKp/gJWUZw7YAnzERsR05w6fqZodFn5/UpLc6MXBzxl8pFpOu8qcPkbjaivOBWBgYrRv3RUZlK7mQQpl3hnwp3mZqKeTyBc+jGY5Ubtg3bXePemV3p6IUaoNnW7a5cqNuYoM7QSwGXr477kXzu1l/LgCt7BmCs0BqP2b8Ss9ZHl2x4K5GHwEvm5uJbjwfaXS974vA9L9NAEp/G416X/r
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2024 08:34:35.0948
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55d5288f-072e-48b5-1b0e-08dc39ca6ceb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6491


On 01/03/2024 02:56, Stefano Stabellini wrote:
> 
> 
> Hi all,
> 
> This patch broke gitlab-ci. The jobs failing are the cppcheck jobs.
> 
> xen/scripts/xen-analysis.py --run-cppcheck --cppcheck-misra -- -j80
> No summary for rule 20.12
This is the error message. For rule 20.12, the summary and severity are in reverse order.
I'll send a patch shortly.

~Michal

