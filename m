Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2676878BF29
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 09:24:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592020.924641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qat56-0008Ub-1m; Tue, 29 Aug 2023 07:24:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592020.924641; Tue, 29 Aug 2023 07:24:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qat55-0008RC-T8; Tue, 29 Aug 2023 07:24:07 +0000
Received: by outflank-mailman (input) for mailman id 592020;
 Tue, 29 Aug 2023 07:24:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jKbG=EO=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qat54-0008R6-8R
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 07:24:06 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20602.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07542e1a-463d-11ee-9b0c-b553b5be7939;
 Tue, 29 Aug 2023 09:24:04 +0200 (CEST)
Received: from MW4PR03CA0078.namprd03.prod.outlook.com (2603:10b6:303:b6::23)
 by DS7PR12MB8370.namprd12.prod.outlook.com (2603:10b6:8:eb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Tue, 29 Aug
 2023 07:23:59 +0000
Received: from CO1PEPF000044EE.namprd05.prod.outlook.com
 (2603:10b6:303:b6:cafe::7a) by MW4PR03CA0078.outlook.office365.com
 (2603:10b6:303:b6::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35 via Frontend
 Transport; Tue, 29 Aug 2023 07:23:59 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044EE.mail.protection.outlook.com (10.167.241.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.17 via Frontend Transport; Tue, 29 Aug 2023 07:23:58 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 29 Aug
 2023 02:23:58 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 29 Aug 2023 02:23:55 -0500
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
X-Inumbo-ID: 07542e1a-463d-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cQoaUXA1ifKE18K5ziUyQ7PKzerWa6w3YRW5rs5ksXSlHvwyhfeaW7S05cYSY0aWpjMn7AmMKsKOwd/bRDSBoPmqZbQ/REEy76A+I27WOoG1O4Oz7uhF3BE7bEJa02PAVUPgSsu0RzKqnzfpAehi2ZKBkEbTDij8c+R8WFmrG27PQnOaP9sBDehXETFR5Y463HzQizdAdr3RMbkeOApA2xzXvhxaL1Mq3y2kodwwcuv2qtv49NYQHlAmYchyYgmNayYpAKWsrmtirOSVXrF1YEjZmIQsKC/15Ndg3XVjiOGyDSW0xCJfPp6Hou3AEv/VgQwAOXSsHf0xjbWRkKrEMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yMyLHfn1jgMSaZ5YTNakByCaJmkV34p++Pt33Euw/w4=;
 b=Fe4v34L0H4hjp0EWtz5ujMQImrY0yrD4976/tJoCQdDlZyL8uDC2b3hnulH73r0GxXRCEgcdpRpTS/GoYCQAb87PkcyR6Kd3smuztknQly4PX5RTbevU+oMEzqlyjyeVc7Ws8LjZs8ImvUDQKnz9UeLVCcfhTgPXP10+ZkA+qETTkqISwK56jLNRIrHEM2YjW/bYKr2eDe0khcwEaMQGn3mFuZ8f+rmy5mSVrqoScR/dyFvUqHq7p6JsVEwEXKM4IzvQUh2AZbeQwgsHQAXzLG47x74ixemfbd4tspaAVJ4REiee0PZm2Xh6dDSlqxQStI+n0CTsJNwSh7phqh3prA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yMyLHfn1jgMSaZ5YTNakByCaJmkV34p++Pt33Euw/w4=;
 b=ewLietCwXIi9s/AMrz4N/vAyIWxJXZJBDrDgGjVstQLlrjHRjZ4rouyl8DqciO54nhhhSmLpWT9kbbM8A7quo+K6kYdDDQrw1SiJj/oKgfYQWJkm1023/hOVYS7Cz4fZxJm1pUJqI4p8vNmw7S2iRAbnH5EtLBFuDV6vvJQxgEk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <68c5a544-0486-d2ac-28d3-1feab2502f2e@amd.com>
Date: Tue, 29 Aug 2023 09:23:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN][PATCH v10 05/20] xen/arm: Add CONFIG_OVERLAY_DTB
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, Henry Wang
	<Henry.Wang@arm.com>, Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20230825080222.14247-1-vikram.garhwal@amd.com>
 <20230825080222.14247-6-vikram.garhwal@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230825080222.14247-6-vikram.garhwal@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EE:EE_|DS7PR12MB8370:EE_
X-MS-Office365-Filtering-Correlation-Id: 72594874-44bc-4b65-0ea2-08dba860e937
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VV2e8eDoDiEK8dEVDjq0DxojzPYKXQhyFCv6BvwYYPfQOb0hMDdhc8N0NNMoW4ynOB0SbGU0azirDr546EuxovI6D2JUS1E2qUuKVI14+UleZxZMrGmGS7ltra9/msN+1udi9Q+O92sLqJuXjR+lblZNWE8qcrnzCzCXBC8vvqlAQi3yxZ1sUU92HCYmZTsz+TPMdB+SEMDnkIW8gRYb7mG6zubG+cYm2oc/rGd1HFwSmQm8FkL3hxlaW27y1O41jOAEVSAcEKPPChyMDdA7rNxV8ChE/4tQJc4XNb/0VHYQeVgrsXv8M1eZ3ifMqmWJTKAy8Y6F70ym6zpCy/hmdIcoppLPeyhxCVMPxYijXg604+LGwFUpOMXKMTYF785v5hYdZV4kSXdbMUN1TVegip1UVaNw8pt6IwK2Nodg+5ZbzF7vX/4UoyUN112tKIkTGoHu+CZ6hCkeY13LBQPJATdtGqv1cVyuHYPutRe4iYefmw3jY/SQ8u2kn/WclXN4MEmdfDkTT97A3vxg9wwDRVWXqmTUj+eRiiziVDSzakjre0PBNiXUib9bL1HeoG4NIMKaN/Tr0v1Oqbk1W2xip6vi6wFYIleD18RXC3RNk1qVBlRq7M0GKGEHrHCMgYxsi4kJLUiNgaxoMwd/z53Gmfqo4EFm/20ZDupICKcKsLdj8NCjP94IrnZkFB4jKDvPaKJRB0NX5ADpnSsUE4WQZ6wOpYx36cLThrilnYmaKexvdZMkr3+guX1gjhnd2+rXzM9euAxxjoYyo+meoE2hrLwVpsO4HzUm8rCBFGSknySXLK/+D9UZvtB/8SdI6xyi
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(396003)(346002)(39860400002)(451199024)(1800799009)(186009)(82310400011)(36840700001)(40470700004)(46966006)(356005)(81166007)(82740400003)(8936002)(110136005)(53546011)(70206006)(70586007)(31686004)(478600001)(54906003)(16576012)(316002)(41300700001)(40460700003)(36756003)(26005)(44832011)(8676002)(5660300002)(83380400001)(31696002)(2906002)(2616005)(86362001)(4744005)(47076005)(36860700001)(40480700001)(426003)(336012)(7416002)(4326008)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 07:23:58.4364
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72594874-44bc-4b65-0ea2-08dba860e937
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8370



On 25/08/2023 10:02, Vikram Garhwal wrote:
> 
> 
> Introduce a config option where the user can enable support for adding/removing
> device tree nodes using a device tree binary overlay.
> 
> Update SUPPORT.md and CHANGELOG.md to state the Device Tree Overlays support for
> Arm.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Acked-by: Henry Wang <Henry.Wang@arm.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> 
> ---
> Changes from v9:
>     Fix style.
> Changes from v7:
>     Add this feature as "experimental support" in CHANGELOG.md
> ---
> ---
>  CHANGELOG.md         | 3 ++-
This patch does not apply cleanly on latest staging so please rebase for v11.

~Michal

