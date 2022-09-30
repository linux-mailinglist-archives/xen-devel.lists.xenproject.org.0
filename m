Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8676F5F059A
	for <lists+xen-devel@lfdr.de>; Fri, 30 Sep 2022 09:20:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414035.658093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeAJe-00052p-Af; Fri, 30 Sep 2022 07:20:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414035.658093; Fri, 30 Sep 2022 07:20:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeAJe-00050z-7l; Fri, 30 Sep 2022 07:20:10 +0000
Received: by outflank-mailman (input) for mailman id 414035;
 Fri, 30 Sep 2022 07:20:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Lug=2B=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oeAJc-0004wP-LP
 for xen-devel@lists.xenproject.org; Fri, 30 Sep 2022 07:20:08 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e19f65d-4090-11ed-9374-c1cf23e5d27e;
 Fri, 30 Sep 2022 09:20:05 +0200 (CEST)
Received: from MW4PR03CA0240.namprd03.prod.outlook.com (2603:10b6:303:b9::35)
 by PH0PR12MB5679.namprd12.prod.outlook.com (2603:10b6:510:14f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Fri, 30 Sep
 2022 07:20:02 +0000
Received: from CO1NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b9:cafe::b1) by MW4PR03CA0240.outlook.office365.com
 (2603:10b6:303:b9::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20 via Frontend
 Transport; Fri, 30 Sep 2022 07:20:02 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT054.mail.protection.outlook.com (10.13.174.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5676.17 via Frontend Transport; Fri, 30 Sep 2022 07:20:01 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 30 Sep
 2022 02:20:00 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 30 Sep
 2022 00:20:00 -0700
Received: from [10.71.192.107] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Fri, 30 Sep 2022 02:19:59 -0500
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
X-Inumbo-ID: 4e19f65d-4090-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EbtHyPFLanhy7yFZ9pa/F/s+AbhrA+Tvo3ooOBwM1npS6VGLDW6HGi7XCjE30dAmbEV3QlGBTDzy2TG/SgLkQhrtQ0ERCSYST+tMriGU5+n+8phCH4LMBVV0AYeIW9fn85nUzU4n+M3jJ9ajPZuSXIiAB6Aufr/S7UuDEbEkECJsYMD5VqOtLKe6o5noxskRTOsRhxijCMEKrARpX1jlamcRmllR9UJEHD+4ktfd266kY2AjBiqoqDlczLiYDHogiDUfujyIp2Z26vE8ZJgVaPNV61O5LgG1KLVFrUl/UuThsOw4vZibDe2uTZwwkJ2++5cSQuq1iBbXg0FeaVRXsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pZwBUYhZNRcuDMqjCLwSliugum2OGY17CECp89P5Xcg=;
 b=NnCuZlewd7Efp9M99inR/AaU3HOC92YG+i/9l8GD45iS4KRohe4zYNppYr52X3hwL+ESD5Eo2pLf2wlzmOo4/LGwH0jsF77UqfOe/dloxeM6HDJSHGssVVKI0pQTmkIPRMFclAuKTfn56RSZRbDtSYFltLl9ixT+MmFZa/F6pmt2yIHPu70AKyr57p0ezx7O+DaVn0ifuyO/Gyi4746IzvCSHozb/IzW5lbwXtDuyzPCrrOtd+ORLt6hV81Kas4teyYJd46b8ezfKmESKAli7M/Ebi0xOV6NwTjp/sw93GGQneLcvmsI7/Yg/KFjEAvqxtc2Khfxyt923FzDKDiNrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pZwBUYhZNRcuDMqjCLwSliugum2OGY17CECp89P5Xcg=;
 b=srEBfyfEEzCPGb/U/PGfzrtAOHXl+YstrK5QWOCFm2V2oUjPQHknuRWaBg4tf/m2CzS9TBgR8oyEHhOY7GP+G5523zsjYda3+gBDdDa2f6/nm19k5MRJ0PQWHSVpjPKTxPMcdeHTKo3KY015Ko0KY5WcY/nvZMd02pW99Ru+Y18=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <4603ca0c-55a9-489f-1f21-79bcc741fcd4@amd.com>
Date: Fri, 30 Sep 2022 09:19:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] Arm/vGIC: adjust gicv3_its_deny_access() to fit other
 gic*_iomem_deny_access(
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>
References: <d255a6e6-01c6-c1b3-eecb-71898b3a5554@suse.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <d255a6e6-01c6-c1b3-eecb-71898b3a5554@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT054:EE_|PH0PR12MB5679:EE_
X-MS-Office365-Filtering-Correlation-Id: e16adde8-8128-4960-77a8-08daa2b430a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qiXkGGAd7FTWKD7bCJYOchhWaeN/JuVbK+1IgovZPjmrdOASU7DDhtnwHu7dbGH/JK85uPhvAC8Aw7OzGzGORvkV/NCi1lTD8xGVEBqu1nWmbs86WXjupR4+XQYkOxrLc6YHXc17sVZrpfYazpFN/gAEeUWao0vlTWmkw6urZ56Ti4iJbII5Xfnp166C4aTNA8D+ZN1vlc4ER5h7dqZhqk+zrH3012JEas1LC0de6oWYdh/VdvdrnB+h9VA7L7wgkg5YW31dJ9WG0OkfLtm4SqUXU0N9bBgd7Eq7xGtSad/0W0KPCiQ7QXYsYvU0tj6X7A/fcaLZrDC69oFjIxaELVH6LryfwCP/LeXkzKi7KMUNIxTyHoEgcJu0yrH9/53bnfAlVGe2xFpDMIy33kwZnIC3/3DQ7Ia4rSo1gtsNUEHbKRB598gSlBXejydamkh8sycki6UbIdbtOlAvK8cxt6vgPVlCLspjhxDoUOy8emWK/UX4QyI8VxcATYUkagP0+5yHRShriMr2SB6xI5942O2ZikxHA2dn2N19Lvb+7VjpukqzJJGodtHjbogc4kQPbaSblCZagYkGeS/ziBukRf/F1xO0kydmnLNd9oqpH+Pr/NTXs5s/SkuxXpRRpk2D077kxxNeLkzBq0mgKKDZfWJV3OqGioprSUsVnObfjdXaLSBNRpGk+ws1SPebVEj7LfeqSqzj3QMBrRDki9RO/aQo0S6lWaVRum3TEoiQoIQsCAPuHgNvHHKFUwO9+epWPJaWLoV7Y2Pfd/F8grjfGAI9qglB5ycnK9uSA4s/PxhB+DQR/pLrxv+/RbnWtkdQl3GsjGmTtrvS/xgVOiAJaQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(346002)(136003)(376002)(451199015)(40470700004)(36840700001)(46966006)(478600001)(316002)(5660300002)(83380400001)(36756003)(16576012)(41300700001)(54906003)(2906002)(40460700003)(53546011)(70206006)(8936002)(186003)(4326008)(40480700001)(70586007)(4744005)(26005)(336012)(86362001)(44832011)(47076005)(356005)(8676002)(2616005)(426003)(31696002)(82310400005)(81166007)(31686004)(82740400003)(36860700001)(110136005)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 07:20:01.8697
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e16adde8-8128-4960-77a8-08daa2b430a9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT054.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5679



On 30/09/2022 08:27, Jan Beulich wrote:
> 
> 
> While an oversight in 9982fe275ba4 ("arm/vgic: drop const attribute
> from gic_iomem_deny_access()"), the issue really became apparent only
> when iomem_deny_access() was switched to have a non-const first
> parameter.
> 
> Fixes: c4e5cc2ccc5b ("x86/ept: limit calls to memory_type_changed()")
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
and
Tested-by: Michal Orzel <michal.orzel@amd.com>

~Michal

