Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D37F4777164
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 09:31:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581854.911294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU08F-0001IA-0W; Thu, 10 Aug 2023 07:30:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581854.911294; Thu, 10 Aug 2023 07:30:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU08E-0001FC-Ty; Thu, 10 Aug 2023 07:30:54 +0000
Received: by outflank-mailman (input) for mailman id 581854;
 Thu, 10 Aug 2023 07:30:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8LQy=D3=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qU08D-0001Aj-07
 for xen-devel@lists.xenproject.org; Thu, 10 Aug 2023 07:30:53 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20615.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf5670fb-374f-11ee-8613-37d641c3527e;
 Thu, 10 Aug 2023 09:30:42 +0200 (CEST)
Received: from SN7PR18CA0020.namprd18.prod.outlook.com (2603:10b6:806:f3::14)
 by SJ2PR12MB8010.namprd12.prod.outlook.com (2603:10b6:a03:4c7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 07:30:47 +0000
Received: from SA2PEPF000015C9.namprd03.prod.outlook.com
 (2603:10b6:806:f3:cafe::a2) by SN7PR18CA0020.outlook.office365.com
 (2603:10b6:806:f3::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30 via Frontend
 Transport; Thu, 10 Aug 2023 07:30:47 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015C9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6652.20 via Frontend Transport; Thu, 10 Aug 2023 07:30:46 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 10 Aug
 2023 02:30:46 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 10 Aug
 2023 00:30:46 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 10 Aug 2023 02:30:45 -0500
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
X-Inumbo-ID: cf5670fb-374f-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BOHTWgukssOZKdxLsafHt7a5lEl7wn7YY+x1l8LiLK9SueIEstizDItriHSmRWjAhQeTKtytU1QTG85d2vGy3SR2DD3JF1uVQBjTpdyw8imj95cbkQm9HmWxdf3HKnf8XK5IIrp8qpIsk2hG17UQ8gzG8nV+c4qFO+bGWjTB6PoQ53ko445pmFfsxKK9pHnQt0R1cA3IDCF9MR26/emxkgmY/ugygGrFKrjTLzTXBCuies/NL6xN6b0J4YPZ/2NVkLjdFm9+mZY4bkanS4BRjx2PI6POxt1AFbYGxy0Nw1zfnKm6cQraz48I8sBLsdX/18UdP2E7Qcq4+j+AqiZeTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z3lETHjnRGaV00jG7rG2wl59M1yScl/L+majtfkjCbg=;
 b=nASe7Y/rES46kTQTOQ2zSfK0gnvVpbo4LORzLuK+wJUbcEaQ/G5DUJJckL8hbxF+5x2R5ODMoZpClJ+JLorWduNFakQw6L3zFz7ho8+8y6wvJojq+pwdEjIaA7NvBsKHrrypZDk3IYSaBIDMPgtt5Nb9ir2u/ESdOfp08DqOzxpUy9Iy0zVUI8SLk5jUlInVMNmtnwztlsaSL73DrKx3B/uIS7f7etMDLqDj62FlQ+LDlbkIG+nfwaZc/IzC1Uva65gJ1ovamyZhDsIP99kTdKrMXidgQ4Ank7lTY7SsODi5aBVezVCjw4VJJiZhugs2zOrczodlC14+wWMEb0PMhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3lETHjnRGaV00jG7rG2wl59M1yScl/L+majtfkjCbg=;
 b=yhy9m6wxt4pGUBM7vnEjXzNsr/3IhzS5l894mSg/wV2V5GFgCkbeJZVzWFva4bDt0O0SUi5awMHGm0sCUxFAcNLQ6kCh+T6iMv7rP84ZKYjNfIMKgCZBnKQXxLrhEJ6IoXFvJEgZBttQcYxlMOoOIhTywlp/1FeVaWoGEp3bPec=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <da8b7081-02c6-694e-7bdf-f0bbc78fc96e@amd.com>
Date: Thu, 10 Aug 2023 09:30:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 2/2] automation: use Alpine 3.18 instead of 3.12 for all
 gitlab jobs
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, <cardoe@cardoe.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>
References: <alpine.DEB.2.22.394.2308091814450.2127516@ubuntu-linux-20-04-desktop>
 <20230810011803.311832-2-sstabellini@kernel.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230810011803.311832-2-sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C9:EE_|SJ2PR12MB8010:EE_
X-MS-Office365-Filtering-Correlation-Id: 92788469-3f10-4e0e-4a7a-08db9973b6d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eM6fh/v7KsOdUyZj4yJsJ05yWhNtQNVNsehdPHmop/G0E+nOE8WgYHr2bsm0/oCEcYgGb8bJvWonj8Hu1ruL+MUVZBAxZIWEhgtyI7H+cR1nMEJ/tlxSq/XnCnL0e3o1lTOZ7VRN1TYITiJ8VEzcmDKS9yWft84U7JWDUC8hPavRajsicgWQ2sedYKlXN+R3wirn1s21LSZShpkyk7YATaDE7AFb8RTxrp/Pl6S0YwFjl95h9j947SsRcfL0GMvAC7LAL6Az6ggYuIjFsSplqdiUyprUADh8TFTYhiKtolMku2sIVOUDHKBJnBKoiFLWTvgSouvBLpoBwdyusUDQ+UMXRonGYpFUHDjhhT9DHwfTBfje0YrHEPzu5jgK3md4a3z19TUjEcvDcGVc0vED5OKvqeCPaxUE0JD+qSTYjp84nSesg2krbgBKtvHPtOvfL2VqPRMR4tffWpVywWANuEjnc5X58C4wgToMDMXJRT/8XVnMuMfIX0z6QgZl7/23/q59tKfjSiBKkeDfrt0eMTchpVcgAcI+SCxvhMrcVrZzcephrvwvf5O6ePbTshmJwfJiKVTsiV/9zeG9EoxWzJV3FuA7EWWhVUqpY/YKSnU00UfkScALRzTtxBL/5tytknQao1jyJ3dLTzbtOUDns9eZU+IP/w70kEEEPVSaPBpzP0LPQNJOARzD0ftzd8sjtcVbM6WffodIHP4/U0deb2Xq8woZJ03iHoqErs99COCd/aYqAkET/223xtPZg0VLLnsUn5jhNJhY3KLzGv/nLam9/ximTXp0nTbfCfUUogBIYWSK341tcw3I3b7My+Ph
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(396003)(346002)(376002)(82310400008)(1800799006)(451199021)(186006)(46966006)(36840700001)(40470700004)(2616005)(478600001)(558084003)(44832011)(31696002)(426003)(86362001)(40480700001)(6666004)(2906002)(36756003)(336012)(40460700003)(26005)(53546011)(356005)(54906003)(316002)(81166007)(70206006)(70586007)(31686004)(6916009)(4326008)(41300700001)(47076005)(5660300002)(8936002)(8676002)(16576012)(36860700001)(82740400003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 07:30:46.9824
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92788469-3f10-4e0e-4a7a-08db9973b6d0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8010

Hi Stefano,

On 10/08/2023 03:18, Stefano Stabellini wrote:
> 
> 
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


