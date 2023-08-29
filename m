Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D47278C166
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 11:28:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592097.924709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qav1F-00005Q-Fq; Tue, 29 Aug 2023 09:28:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592097.924709; Tue, 29 Aug 2023 09:28:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qav1F-0008US-DC; Tue, 29 Aug 2023 09:28:17 +0000
Received: by outflank-mailman (input) for mailman id 592097;
 Tue, 29 Aug 2023 09:28:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jKbG=EO=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qav1D-0008UM-KL
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 09:28:15 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20605.outbound.protection.outlook.com
 [2a01:111:f400:7eab::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 608b23f6-464e-11ee-8783-cb3800f73035;
 Tue, 29 Aug 2023 11:28:13 +0200 (CEST)
Received: from MW4PR03CA0050.namprd03.prod.outlook.com (2603:10b6:303:8e::25)
 by CH2PR12MB4937.namprd12.prod.outlook.com (2603:10b6:610:64::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 09:28:09 +0000
Received: from CO1PEPF000044F8.namprd21.prod.outlook.com
 (2603:10b6:303:8e:cafe::c1) by MW4PR03CA0050.outlook.office365.com
 (2603:10b6:303:8e::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35 via Frontend
 Transport; Tue, 29 Aug 2023 09:28:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.2 via Frontend Transport; Tue, 29 Aug 2023 09:28:08 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 29 Aug
 2023 04:28:07 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 29 Aug
 2023 04:27:57 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 29 Aug 2023 04:27:56 -0500
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
X-Inumbo-ID: 608b23f6-464e-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FVVAXqejr89dzpzHfphByKplHftCpmmSNmXFyLr1MdIHmgUrWBCLb7c8d1TQwWOXw1ICWDu7GxHKD+qxmj24P36UtHRZXx0KjT0TMynr8bu8EUMl6SS4oNDBUbOWUuJwtro7QKl/LhP0LKLq8wZrrTujFpv7MIuNzMIyTHtqd2esBuKNEIvNy59xO8fUHn2hq0LYckHXrIBQU4RCzO35kGDJHZzQxM5SFW7q9vp4KblMSGFwDwvC/lDRPLwegfKIDeO6YQwfiUIvv9quYHhp3tUQUZ7oYWGSAuxZN2f+7ASURou/LAsbyCMn3Em+tABKGXJGPTkO3Ko+c4kkoE7Kww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fu4VVJqq9b9fKEZMeTNYlgVkRBo58iQhbc1iPxMsUlE=;
 b=NaohxbepdtQXdC30qArOkobzOhx7pus3+JCMTVkpUArDnazuMNIgF46+v3r3dSTn7tDsUqK+BSOFjPnnzS2tRYokV6AuXW7Ekr3i54gSuAij9u8487PP7cRJC6c+P3MF0HP535beEurJGqe/grPqtnxDP75rFkNdQ2uCr5wuAtJvjxW4SE/LUifeRWnwZPNAUpbaB9Hqliqk3UvmCSxIiAv5GZJP5Zj0woTzTuw4/aoO21T9QSSgxBtCH1vuMaPiKKMwS4y1O3C0+9VGwvlZSm9L/B5TiG6q41ddz5zxLWwpZYpSOVnzEteD0HfpLpS2Mm2NRhCK30hqTmzAf5QcSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fu4VVJqq9b9fKEZMeTNYlgVkRBo58iQhbc1iPxMsUlE=;
 b=uItlkowV3ybTjAxRN3Ta3sPqKVCF/Fdmc8/6VfI0IugDYiBh4l6ze1/90TJwwkjd2nVm0mszRLxNX/jcsAFrNTBYot00W69GRNTS0DSTBtNq5qMRPEwBHILSSz5Cvpk8Nb7GouAPu9r7kVS1WoZgBvKFXZI1Cra69y470zHQuns=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <1d8643f5-5c0f-b784-b90c-53e1c629f5b0@amd.com>
Date: Tue, 29 Aug 2023 11:27:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN][PATCH v10 14/20] common/device_tree: Add rwlock for dt_host
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>
References: <20230825080222.14247-1-vikram.garhwal@amd.com>
 <20230825080222.14247-15-vikram.garhwal@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230825080222.14247-15-vikram.garhwal@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F8:EE_|CH2PR12MB4937:EE_
X-MS-Office365-Filtering-Correlation-Id: f05c0233-16b8-41b3-8a69-08dba87241ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PVHReBh+wudInr+c7pEYxW503iiwzz919e4NO+uryQ+Zagc2T7mbPJ7oICR92PJHpVsKryoDe8fTF17LFobohPzRGc6M/+GRYQ+qUQ+I7N2rq04ZkonRbSvNj9NSmy6KqXm8jjkjpc6rgXzE3i+ib+WVwgCPA52e3RzZu9qYb3EL7jWW8/0AXiHX0Q+ydgM9nF0/sDOWic2sRZfieEleh6xwfn57oNuWBxu/0g7Yaeq2JS9N1rCZsmu632+EgEnYs8cTw0fnpLvk3oPe+quOEaC+nGuGWKwNl6zDN1VJsodhoKqiFkKeTqd+b0s6rHRQUqaxYMOPp3xdXMrL6ibt028/xQuqBExdR5gInOlcj4Y2zXGJwzfMr1IY+y8fgIDfRxDEDlRz8SV5JoEHkq4WcLftg0fXAthF6hHjFiwmRceIADlscZ6lmLiyd858UUMCPGgnUzOFc7SAFz5WU1LGz4II+ATCcyaVOFhwfg0BWzZpLNb+tLz9E2OTp46F+kvXRUfYiTYgrTanOMzf2xZ0qBeO5dml8SAEFIcaZ0rvZmmtv/nfZoqDIft9ZAllCkKYU9GnZ1qqJRis0Z0WXMf+PNXcnt9lfooEJqfk2WLz769w2/+McKH2m4DAucMpBa/+0HjV4Z/TdOrTk7JknRE2cwUEZhVXr401rHeYEsU+HgRnqIiNS10+UdMl2WLoY0B72wBpCx15fUgOYDgopQ4+xzdmkIKhkQqQ/90bopBQcCAUGkPFYsDurGYspjzZIeZAR3M3Z/tfBU+oI1L90On9HbthyyhmcBb0De4Au7YMTSqDr2kXFICCxLV7ujCRpuOo
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(136003)(346002)(376002)(186009)(1800799009)(82310400011)(451199024)(46966006)(40470700004)(36840700001)(40480700001)(82740400003)(86362001)(31696002)(40460700003)(36756003)(26005)(2616005)(336012)(426003)(83380400001)(316002)(16576012)(36860700001)(5660300002)(53546011)(110136005)(70586007)(70206006)(54906003)(41300700001)(44832011)(47076005)(31686004)(81166007)(2906002)(478600001)(356005)(8936002)(8676002)(4326008)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 09:28:08.3976
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f05c0233-16b8-41b3-8a69-08dba87241ba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4937



On 25/08/2023 10:02, Vikram Garhwal wrote:
> 
> 
> Dynamic programming ops will modify the dt_host and there might be other
> functions which are browsing the dt_host at the same time. To avoid the race
> conditions, adding rwlock for browsing the dt_host during runtime. dt_host
> writer will be added in the follow-up patch for device tree overlay
> functionalities."
Please drop "

> 
> Reason behind adding rwlock instead of spinlock:
>    For now, dynamic programming is the sole modifier of dt_host in Xen during
>        run time. All other access functions like iommu_release_dt_device() are
Indentation is incorrect. All this text block should be aligned to "For now" above.

>        just reading the dt_host during run-time. So, there is a need to protect
>        others from browsing the dt_host while dynamic programming is modifying
>        it. rwlock is better suitable for this task as spinlock won't be able to
>        differentiate between read and write access.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Apart from that, the patch itself looks good:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

although I would recommend to follow Julien suggestion and to at least
add an assert in iommu_assign_dt_device() and iommu_add_dt_device() to check if the lock
is taken (given the system state is >= active to exclude calls from boot state).

~Michal


